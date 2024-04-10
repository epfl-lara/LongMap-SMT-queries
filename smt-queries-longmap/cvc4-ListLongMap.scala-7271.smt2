; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92848 () Bool)

(assert start!92848)

(declare-fun b!1054419 () Bool)

(declare-fun e!599035 () Bool)

(declare-fun e!599041 () Bool)

(assert (=> b!1054419 (= e!599035 e!599041)))

(declare-fun res!703364 () Bool)

(assert (=> b!1054419 (=> (not res!703364) (not e!599041))))

(declare-datatypes ((array!66508 0))(
  ( (array!66509 (arr!31986 (Array (_ BitVec 32) (_ BitVec 64))) (size!32522 (_ BitVec 32))) )
))
(declare-fun lt!465404 () array!66508)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054419 (= res!703364 (arrayContainsKey!0 lt!465404 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66508)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054419 (= lt!465404 (array!66509 (store (arr!31986 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32522 a!3488)))))

(declare-fun b!1054420 () Bool)

(declare-fun e!599038 () Bool)

(assert (=> b!1054420 (= e!599041 e!599038)))

(declare-fun res!703366 () Bool)

(assert (=> b!1054420 (=> (not res!703366) (not e!599038))))

(declare-fun lt!465403 () (_ BitVec 32))

(assert (=> b!1054420 (= res!703366 (not (= lt!465403 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66508 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054420 (= lt!465403 (arrayScanForKey!0 lt!465404 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054421 () Bool)

(declare-fun res!703361 () Bool)

(assert (=> b!1054421 (=> (not res!703361) (not e!599035))))

(assert (=> b!1054421 (= res!703361 (= (select (arr!31986 a!3488) i!1381) k!2747))))

(declare-fun b!1054422 () Bool)

(declare-fun res!703365 () Bool)

(assert (=> b!1054422 (=> (not res!703365) (not e!599035))))

(declare-datatypes ((List!22298 0))(
  ( (Nil!22295) (Cons!22294 (h!23503 (_ BitVec 64)) (t!31605 List!22298)) )
))
(declare-fun arrayNoDuplicates!0 (array!66508 (_ BitVec 32) List!22298) Bool)

(assert (=> b!1054422 (= res!703365 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22295))))

(declare-fun b!1054423 () Bool)

(declare-fun res!703362 () Bool)

(assert (=> b!1054423 (=> (not res!703362) (not e!599035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054423 (= res!703362 (validKeyInArray!0 k!2747))))

(declare-fun b!1054424 () Bool)

(declare-fun e!599036 () Bool)

(assert (=> b!1054424 (= e!599036 (arrayContainsKey!0 a!3488 k!2747 lt!465403))))

(declare-fun b!1054425 () Bool)

(declare-fun e!599040 () Bool)

(assert (=> b!1054425 (= e!599038 (not e!599040))))

(declare-fun res!703367 () Bool)

(assert (=> b!1054425 (=> res!703367 e!599040)))

(assert (=> b!1054425 (= res!703367 (bvsle lt!465403 i!1381))))

(declare-fun e!599039 () Bool)

(assert (=> b!1054425 e!599039))

(declare-fun res!703363 () Bool)

(assert (=> b!1054425 (=> (not res!703363) (not e!599039))))

(assert (=> b!1054425 (= res!703363 (= (select (store (arr!31986 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465403) k!2747))))

(declare-fun b!1054426 () Bool)

(assert (=> b!1054426 (= e!599040 true)))

(assert (=> b!1054426 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22295)))

(declare-datatypes ((Unit!34530 0))(
  ( (Unit!34531) )
))
(declare-fun lt!465405 () Unit!34530)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66508 (_ BitVec 32) (_ BitVec 32)) Unit!34530)

(assert (=> b!1054426 (= lt!465405 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054427 () Bool)

(assert (=> b!1054427 (= e!599039 e!599036)))

(declare-fun res!703360 () Bool)

(assert (=> b!1054427 (=> res!703360 e!599036)))

(assert (=> b!1054427 (= res!703360 (bvsle lt!465403 i!1381))))

(declare-fun res!703359 () Bool)

(assert (=> start!92848 (=> (not res!703359) (not e!599035))))

(assert (=> start!92848 (= res!703359 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32522 a!3488)) (bvslt (size!32522 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92848 e!599035))

(assert (=> start!92848 true))

(declare-fun array_inv!24766 (array!66508) Bool)

(assert (=> start!92848 (array_inv!24766 a!3488)))

(assert (= (and start!92848 res!703359) b!1054422))

(assert (= (and b!1054422 res!703365) b!1054423))

(assert (= (and b!1054423 res!703362) b!1054421))

(assert (= (and b!1054421 res!703361) b!1054419))

(assert (= (and b!1054419 res!703364) b!1054420))

(assert (= (and b!1054420 res!703366) b!1054425))

(assert (= (and b!1054425 res!703363) b!1054427))

(assert (= (and b!1054427 (not res!703360)) b!1054424))

(assert (= (and b!1054425 (not res!703367)) b!1054426))

(declare-fun m!974491 () Bool)

(assert (=> b!1054420 m!974491))

(declare-fun m!974493 () Bool)

(assert (=> b!1054423 m!974493))

(declare-fun m!974495 () Bool)

(assert (=> b!1054425 m!974495))

(declare-fun m!974497 () Bool)

(assert (=> b!1054425 m!974497))

(declare-fun m!974499 () Bool)

(assert (=> b!1054426 m!974499))

(declare-fun m!974501 () Bool)

(assert (=> b!1054426 m!974501))

(declare-fun m!974503 () Bool)

(assert (=> start!92848 m!974503))

(declare-fun m!974505 () Bool)

(assert (=> b!1054421 m!974505))

(declare-fun m!974507 () Bool)

(assert (=> b!1054419 m!974507))

(assert (=> b!1054419 m!974495))

(declare-fun m!974509 () Bool)

(assert (=> b!1054424 m!974509))

(declare-fun m!974511 () Bool)

(assert (=> b!1054422 m!974511))

(push 1)

