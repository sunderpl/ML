function error = computeError(params,X,y,Xval,yval)

        C = params(1);
        sigma = params(2);

        % estimate model
        model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));

        % compute predictions on cross-validation data set
        predictions = svmPredict(model, Xval);

        % compute error on cross validation data
        % error: fraction of data classified incorrectly
        error = mean(double(predictions ~= yval));
