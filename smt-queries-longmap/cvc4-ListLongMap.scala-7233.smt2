; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92464 () Bool)

(assert start!92464)

(declare-fun b!1051350 () Bool)

(declare-fun e!596782 () Bool)

(assert (=> b!1051350 (= e!596782 true)))

(declare-datatypes ((array!66265 0))(
  ( (array!66266 (arr!31872 (Array (_ BitVec 32) (_ BitVec 64))) (size!32408 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66265)

(declare-fun lt!464243 () (_ BitVec 32))

(declare-datatypes ((List!22184 0))(
  ( (Nil!22181) (Cons!22180 (h!23389 (_ BitVec 64)) (t!31491 List!22184)) )
))
(declare-fun arrayNoDuplicates!0 (array!66265 (_ BitVec 32) List!22184) Bool)

(assert (=> b!1051350 (arrayNoDuplicates!0 a!3488 lt!464243 Nil!22181)))

(declare-datatypes ((Unit!34416 0))(
  ( (Unit!34417) )
))
(declare-fun lt!464242 () Unit!34416)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66265 (_ BitVec 32) (_ BitVec 32)) Unit!34416)

(assert (=> b!1051350 (= lt!464242 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464243))))

(declare-fun b!1051351 () Bool)

(declare-fun res!700477 () Bool)

(declare-fun e!596781 () Bool)

(assert (=> b!1051351 (=> (not res!700477) (not e!596781))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051351 (= res!700477 (validKeyInArray!0 k!2747))))

(declare-fun b!1051352 () Bool)

(declare-fun e!596785 () Bool)

(assert (=> b!1051352 (= e!596785 (not e!596782))))

(declare-fun res!700478 () Bool)

(assert (=> b!1051352 (=> res!700478 e!596782)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051352 (= res!700478 (or (bvsgt lt!464243 i!1381) (bvsle i!1381 lt!464243)))))

(declare-fun e!596783 () Bool)

(assert (=> b!1051352 e!596783))

(declare-fun res!700482 () Bool)

(assert (=> b!1051352 (=> (not res!700482) (not e!596783))))

(assert (=> b!1051352 (= res!700482 (= (select (store (arr!31872 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464243) k!2747))))

(declare-fun b!1051353 () Bool)

(declare-fun e!596784 () Bool)

(assert (=> b!1051353 (= e!596783 e!596784)))

(declare-fun res!700483 () Bool)

(assert (=> b!1051353 (=> res!700483 e!596784)))

(assert (=> b!1051353 (= res!700483 (or (bvsgt lt!464243 i!1381) (bvsle i!1381 lt!464243)))))

(declare-fun b!1051354 () Bool)

(declare-fun res!700484 () Bool)

(assert (=> b!1051354 (=> (not res!700484) (not e!596781))))

(assert (=> b!1051354 (= res!700484 (= (select (arr!31872 a!3488) i!1381) k!2747))))

(declare-fun b!1051355 () Bool)

(declare-fun e!596780 () Bool)

(assert (=> b!1051355 (= e!596780 e!596785)))

(declare-fun res!700476 () Bool)

(assert (=> b!1051355 (=> (not res!700476) (not e!596785))))

(assert (=> b!1051355 (= res!700476 (not (= lt!464243 i!1381)))))

(declare-fun lt!464244 () array!66265)

(declare-fun arrayScanForKey!0 (array!66265 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051355 (= lt!464243 (arrayScanForKey!0 lt!464244 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!700479 () Bool)

(assert (=> start!92464 (=> (not res!700479) (not e!596781))))

(assert (=> start!92464 (= res!700479 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32408 a!3488)) (bvslt (size!32408 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92464 e!596781))

(assert (=> start!92464 true))

(declare-fun array_inv!24652 (array!66265) Bool)

(assert (=> start!92464 (array_inv!24652 a!3488)))

(declare-fun b!1051356 () Bool)

(declare-fun arrayContainsKey!0 (array!66265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051356 (= e!596784 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051357 () Bool)

(assert (=> b!1051357 (= e!596781 e!596780)))

(declare-fun res!700480 () Bool)

(assert (=> b!1051357 (=> (not res!700480) (not e!596780))))

(assert (=> b!1051357 (= res!700480 (arrayContainsKey!0 lt!464244 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051357 (= lt!464244 (array!66266 (store (arr!31872 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32408 a!3488)))))

(declare-fun b!1051358 () Bool)

(declare-fun res!700481 () Bool)

(assert (=> b!1051358 (=> (not res!700481) (not e!596781))))

(assert (=> b!1051358 (= res!700481 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22181))))

(assert (= (and start!92464 res!700479) b!1051358))

(assert (= (and b!1051358 res!700481) b!1051351))

(assert (= (and b!1051351 res!700477) b!1051354))

(assert (= (and b!1051354 res!700484) b!1051357))

(assert (= (and b!1051357 res!700480) b!1051355))

(assert (= (and b!1051355 res!700476) b!1051352))

(assert (= (and b!1051352 res!700482) b!1051353))

(assert (= (and b!1051353 (not res!700483)) b!1051356))

(assert (= (and b!1051352 (not res!700478)) b!1051350))

(declare-fun m!971869 () Bool)

(assert (=> b!1051355 m!971869))

(declare-fun m!971871 () Bool)

(assert (=> b!1051352 m!971871))

(declare-fun m!971873 () Bool)

(assert (=> b!1051352 m!971873))

(declare-fun m!971875 () Bool)

(assert (=> b!1051350 m!971875))

(declare-fun m!971877 () Bool)

(assert (=> b!1051350 m!971877))

(declare-fun m!971879 () Bool)

(assert (=> start!92464 m!971879))

(declare-fun m!971881 () Bool)

(assert (=> b!1051351 m!971881))

(declare-fun m!971883 () Bool)

(assert (=> b!1051354 m!971883))

(declare-fun m!971885 () Bool)

(assert (=> b!1051358 m!971885))

(declare-fun m!971887 () Bool)

(assert (=> b!1051356 m!971887))

(declare-fun m!971889 () Bool)

(assert (=> b!1051357 m!971889))

(assert (=> b!1051357 m!971871))

(push 1)

(assert (not b!1051357))

