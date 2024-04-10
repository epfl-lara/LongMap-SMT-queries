; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26206 () Bool)

(assert start!26206)

(declare-fun b!270944 () Bool)

(declare-fun res!134935 () Bool)

(declare-fun e!174443 () Bool)

(assert (=> b!270944 (=> (not res!134935) (not e!174443))))

(declare-datatypes ((array!13303 0))(
  ( (array!13304 (arr!6301 (Array (_ BitVec 32) (_ BitVec 64))) (size!6653 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13303)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270944 (= res!134935 (validKeyInArray!0 (select (arr!6301 a!3325) startIndex!26)))))

(declare-fun b!270945 () Bool)

(declare-fun res!134934 () Bool)

(declare-fun e!174441 () Bool)

(assert (=> b!270945 (=> (not res!134934) (not e!174441))))

(declare-datatypes ((List!4109 0))(
  ( (Nil!4106) (Cons!4105 (h!4772 (_ BitVec 64)) (t!9191 List!4109)) )
))
(declare-fun arrayNoDuplicates!0 (array!13303 (_ BitVec 32) List!4109) Bool)

(assert (=> b!270945 (= res!134934 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4106))))

(declare-fun b!270946 () Bool)

(declare-fun res!134937 () Bool)

(assert (=> b!270946 (=> (not res!134937) (not e!174443))))

(declare-fun noDuplicate!127 (List!4109) Bool)

(assert (=> b!270946 (= res!134937 (noDuplicate!127 Nil!4106))))

(declare-fun b!270947 () Bool)

(declare-fun res!134940 () Bool)

(assert (=> b!270947 (=> (not res!134940) (not e!174441))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270947 (= res!134940 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270948 () Bool)

(declare-fun res!134943 () Bool)

(assert (=> b!270948 (=> (not res!134943) (not e!174443))))

(assert (=> b!270948 (= res!134943 (and (bvslt (size!6653 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6653 a!3325))))))

(declare-fun b!270949 () Bool)

(assert (=> b!270949 (= e!174443 false)))

(declare-fun lt!135727 () Bool)

(declare-fun contains!1939 (List!4109 (_ BitVec 64)) Bool)

(assert (=> b!270949 (= lt!135727 (contains!1939 Nil!4106 k!2581))))

(declare-fun b!270950 () Bool)

(declare-fun res!134945 () Bool)

(assert (=> b!270950 (=> (not res!134945) (not e!174441))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!270950 (= res!134945 (and (= (size!6653 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6653 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6653 a!3325))))))

(declare-fun b!270951 () Bool)

(declare-fun res!134941 () Bool)

(assert (=> b!270951 (=> (not res!134941) (not e!174441))))

(assert (=> b!270951 (= res!134941 (validKeyInArray!0 k!2581))))

(declare-fun b!270952 () Bool)

(declare-fun res!134944 () Bool)

(assert (=> b!270952 (=> (not res!134944) (not e!174443))))

(assert (=> b!270952 (= res!134944 (not (contains!1939 Nil!4106 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270953 () Bool)

(declare-fun res!134938 () Bool)

(assert (=> b!270953 (=> (not res!134938) (not e!174443))))

(assert (=> b!270953 (= res!134938 (not (= startIndex!26 i!1267)))))

(declare-fun res!134946 () Bool)

(assert (=> start!26206 (=> (not res!134946) (not e!174441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26206 (= res!134946 (validMask!0 mask!3868))))

(assert (=> start!26206 e!174441))

(declare-fun array_inv!4264 (array!13303) Bool)

(assert (=> start!26206 (array_inv!4264 a!3325)))

(assert (=> start!26206 true))

(declare-fun b!270954 () Bool)

(declare-fun res!134942 () Bool)

(assert (=> b!270954 (=> (not res!134942) (not e!174443))))

(assert (=> b!270954 (= res!134942 (not (contains!1939 Nil!4106 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270955 () Bool)

(declare-fun res!134939 () Bool)

(assert (=> b!270955 (=> (not res!134939) (not e!174443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13303 (_ BitVec 32)) Bool)

(assert (=> b!270955 (= res!134939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270956 () Bool)

(assert (=> b!270956 (= e!174441 e!174443)))

(declare-fun res!134936 () Bool)

(assert (=> b!270956 (=> (not res!134936) (not e!174443))))

(declare-datatypes ((SeekEntryResult!1459 0))(
  ( (MissingZero!1459 (index!8006 (_ BitVec 32))) (Found!1459 (index!8007 (_ BitVec 32))) (Intermediate!1459 (undefined!2271 Bool) (index!8008 (_ BitVec 32)) (x!26336 (_ BitVec 32))) (Undefined!1459) (MissingVacant!1459 (index!8009 (_ BitVec 32))) )
))
(declare-fun lt!135726 () SeekEntryResult!1459)

(assert (=> b!270956 (= res!134936 (or (= lt!135726 (MissingZero!1459 i!1267)) (= lt!135726 (MissingVacant!1459 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13303 (_ BitVec 32)) SeekEntryResult!1459)

(assert (=> b!270956 (= lt!135726 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26206 res!134946) b!270950))

(assert (= (and b!270950 res!134945) b!270951))

(assert (= (and b!270951 res!134941) b!270945))

(assert (= (and b!270945 res!134934) b!270947))

(assert (= (and b!270947 res!134940) b!270956))

(assert (= (and b!270956 res!134936) b!270955))

(assert (= (and b!270955 res!134939) b!270953))

(assert (= (and b!270953 res!134938) b!270944))

(assert (= (and b!270944 res!134935) b!270948))

(assert (= (and b!270948 res!134943) b!270946))

(assert (= (and b!270946 res!134937) b!270952))

(assert (= (and b!270952 res!134944) b!270954))

(assert (= (and b!270954 res!134942) b!270949))

(declare-fun m!286393 () Bool)

(assert (=> b!270951 m!286393))

(declare-fun m!286395 () Bool)

(assert (=> b!270944 m!286395))

(assert (=> b!270944 m!286395))

(declare-fun m!286397 () Bool)

(assert (=> b!270944 m!286397))

(declare-fun m!286399 () Bool)

(assert (=> b!270955 m!286399))

(declare-fun m!286401 () Bool)

(assert (=> start!26206 m!286401))

(declare-fun m!286403 () Bool)

(assert (=> start!26206 m!286403))

(declare-fun m!286405 () Bool)

(assert (=> b!270946 m!286405))

(declare-fun m!286407 () Bool)

(assert (=> b!270952 m!286407))

(declare-fun m!286409 () Bool)

(assert (=> b!270949 m!286409))

(declare-fun m!286411 () Bool)

(assert (=> b!270956 m!286411))

(declare-fun m!286413 () Bool)

(assert (=> b!270954 m!286413))

(declare-fun m!286415 () Bool)

(assert (=> b!270945 m!286415))

(declare-fun m!286417 () Bool)

(assert (=> b!270947 m!286417))

(push 1)

(assert (not b!270949))

