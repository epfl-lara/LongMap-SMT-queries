; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92416 () Bool)

(assert start!92416)

(declare-fun b!1050739 () Bool)

(declare-fun e!596313 () Bool)

(declare-fun e!596317 () Bool)

(assert (=> b!1050739 (= e!596313 e!596317)))

(declare-fun res!699871 () Bool)

(assert (=> b!1050739 (=> (not res!699871) (not e!596317))))

(declare-fun lt!464063 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050739 (= res!699871 (not (= lt!464063 i!1381)))))

(declare-datatypes ((array!66217 0))(
  ( (array!66218 (arr!31848 (Array (_ BitVec 32) (_ BitVec 64))) (size!32384 (_ BitVec 32))) )
))
(declare-fun lt!464064 () array!66217)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66217 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050739 (= lt!464063 (arrayScanForKey!0 lt!464064 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050740 () Bool)

(declare-fun res!699867 () Bool)

(declare-fun e!596315 () Bool)

(assert (=> b!1050740 (=> (not res!699867) (not e!596315))))

(declare-fun a!3488 () array!66217)

(assert (=> b!1050740 (= res!699867 (= (select (arr!31848 a!3488) i!1381) k!2747))))

(declare-fun b!1050741 () Bool)

(declare-fun e!596316 () Bool)

(declare-fun arrayContainsKey!0 (array!66217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050741 (= e!596316 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1050742 () Bool)

(declare-fun res!699872 () Bool)

(assert (=> b!1050742 (=> (not res!699872) (not e!596315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050742 (= res!699872 (validKeyInArray!0 k!2747))))

(declare-fun b!1050743 () Bool)

(assert (=> b!1050743 (= e!596317 (not true))))

(declare-fun e!596314 () Bool)

(assert (=> b!1050743 e!596314))

(declare-fun res!699866 () Bool)

(assert (=> b!1050743 (=> (not res!699866) (not e!596314))))

(assert (=> b!1050743 (= res!699866 (= (select (store (arr!31848 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464063) k!2747))))

(declare-fun b!1050744 () Bool)

(assert (=> b!1050744 (= e!596314 e!596316)))

(declare-fun res!699865 () Bool)

(assert (=> b!1050744 (=> res!699865 e!596316)))

(assert (=> b!1050744 (= res!699865 (or (bvsgt lt!464063 i!1381) (bvsle i!1381 lt!464063)))))

(declare-fun b!1050745 () Bool)

(declare-fun res!699870 () Bool)

(assert (=> b!1050745 (=> (not res!699870) (not e!596315))))

(declare-datatypes ((List!22160 0))(
  ( (Nil!22157) (Cons!22156 (h!23365 (_ BitVec 64)) (t!31467 List!22160)) )
))
(declare-fun arrayNoDuplicates!0 (array!66217 (_ BitVec 32) List!22160) Bool)

(assert (=> b!1050745 (= res!699870 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22157))))

(declare-fun res!699869 () Bool)

(assert (=> start!92416 (=> (not res!699869) (not e!596315))))

(assert (=> start!92416 (= res!699869 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32384 a!3488)) (bvslt (size!32384 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92416 e!596315))

(assert (=> start!92416 true))

(declare-fun array_inv!24628 (array!66217) Bool)

(assert (=> start!92416 (array_inv!24628 a!3488)))

(declare-fun b!1050746 () Bool)

(assert (=> b!1050746 (= e!596315 e!596313)))

(declare-fun res!699868 () Bool)

(assert (=> b!1050746 (=> (not res!699868) (not e!596313))))

(assert (=> b!1050746 (= res!699868 (arrayContainsKey!0 lt!464064 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050746 (= lt!464064 (array!66218 (store (arr!31848 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32384 a!3488)))))

(assert (= (and start!92416 res!699869) b!1050745))

(assert (= (and b!1050745 res!699870) b!1050742))

(assert (= (and b!1050742 res!699872) b!1050740))

(assert (= (and b!1050740 res!699867) b!1050746))

(assert (= (and b!1050746 res!699868) b!1050739))

(assert (= (and b!1050739 res!699871) b!1050743))

(assert (= (and b!1050743 res!699866) b!1050744))

(assert (= (and b!1050744 (not res!699865)) b!1050741))

(declare-fun m!971393 () Bool)

(assert (=> b!1050739 m!971393))

(declare-fun m!971395 () Bool)

(assert (=> b!1050743 m!971395))

(declare-fun m!971397 () Bool)

(assert (=> b!1050743 m!971397))

(declare-fun m!971399 () Bool)

(assert (=> b!1050746 m!971399))

(assert (=> b!1050746 m!971395))

(declare-fun m!971401 () Bool)

(assert (=> b!1050741 m!971401))

(declare-fun m!971403 () Bool)

(assert (=> b!1050745 m!971403))

(declare-fun m!971405 () Bool)

(assert (=> b!1050740 m!971405))

(declare-fun m!971407 () Bool)

(assert (=> start!92416 m!971407))

(declare-fun m!971409 () Bool)

(assert (=> b!1050742 m!971409))

(push 1)

(assert (not b!1050742))

(assert (not b!1050741))

