; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117124 () Bool)

(assert start!117124)

(declare-fun b!1378609 () Bool)

(declare-fun e!780986 () Bool)

(declare-fun e!780985 () Bool)

(assert (=> b!1378609 (= e!780986 (not e!780985))))

(declare-fun res!921145 () Bool)

(assert (=> b!1378609 (=> res!921145 e!780985)))

(declare-fun lt!606863 () (_ BitVec 32))

(declare-datatypes ((array!93741 0))(
  ( (array!93742 (arr!45271 (Array (_ BitVec 32) (_ BitVec 64))) (size!45821 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93741)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606868 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378609 (= res!921145 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45821 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606868 (bvsub lt!606863 #b00000000000000000000000000000001)))))))

(declare-fun lt!606866 () (_ BitVec 32))

(declare-fun lt!606862 () (_ BitVec 32))

(assert (=> b!1378609 (= (bvadd lt!606866 lt!606862) lt!606868)))

(declare-fun lt!606867 () array!93741)

(declare-fun arrayCountValidKeys!0 (array!93741 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378609 (= lt!606868 (arrayCountValidKeys!0 lt!606867 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378609 (= lt!606866 (arrayCountValidKeys!0 lt!606867 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45805 0))(
  ( (Unit!45806) )
))
(declare-fun lt!606865 () Unit!45805)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45805)

(assert (=> b!1378609 (= lt!606865 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606867 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606864 () (_ BitVec 32))

(declare-fun lt!606869 () (_ BitVec 32))

(assert (=> b!1378609 (= (bvadd lt!606864 lt!606869) lt!606863)))

(assert (=> b!1378609 (= lt!606863 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378609 (= lt!606864 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606870 () Unit!45805)

(assert (=> b!1378609 (= lt!606870 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378611 () Bool)

(declare-fun res!921144 () Bool)

(declare-fun e!780984 () Bool)

(assert (=> b!1378611 (=> (not res!921144) (not e!780984))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378611 (= res!921144 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378612 () Bool)

(declare-fun res!921143 () Bool)

(assert (=> b!1378612 (=> (not res!921143) (not e!780984))))

(assert (=> b!1378612 (= res!921143 (and (bvslt (size!45821 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45821 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378613 () Bool)

(assert (=> b!1378613 (= e!780985 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378613 (= (arrayCountValidKeys!0 lt!606867 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!606861 () Unit!45805)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93741 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45805)

(assert (=> b!1378613 (= lt!606861 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378614 () Bool)

(assert (=> b!1378614 (= e!780984 e!780986)))

(declare-fun res!921146 () Bool)

(assert (=> b!1378614 (=> (not res!921146) (not e!780986))))

(assert (=> b!1378614 (= res!921146 (and (= lt!606862 (bvsub lt!606869 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378614 (= lt!606862 (arrayCountValidKeys!0 lt!606867 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378614 (= lt!606869 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378614 (= lt!606867 (array!93742 (store (arr!45271 a!4094) i!1451 k!2953) (size!45821 a!4094)))))

(declare-fun res!921147 () Bool)

(assert (=> start!117124 (=> (not res!921147) (not e!780984))))

(assert (=> start!117124 (= res!921147 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45821 a!4094))))))

(assert (=> start!117124 e!780984))

(assert (=> start!117124 true))

(declare-fun array_inv!34299 (array!93741) Bool)

(assert (=> start!117124 (array_inv!34299 a!4094)))

(declare-fun b!1378610 () Bool)

(declare-fun res!921148 () Bool)

(assert (=> b!1378610 (=> (not res!921148) (not e!780984))))

(assert (=> b!1378610 (= res!921148 (validKeyInArray!0 (select (arr!45271 a!4094) i!1451)))))

(assert (= (and start!117124 res!921147) b!1378610))

(assert (= (and b!1378610 res!921148) b!1378611))

(assert (= (and b!1378611 res!921144) b!1378612))

(assert (= (and b!1378612 res!921143) b!1378614))

(assert (= (and b!1378614 res!921146) b!1378609))

(assert (= (and b!1378609 (not res!921145)) b!1378613))

(declare-fun m!1263367 () Bool)

(assert (=> b!1378613 m!1263367))

(declare-fun m!1263369 () Bool)

(assert (=> b!1378613 m!1263369))

(declare-fun m!1263371 () Bool)

(assert (=> b!1378613 m!1263371))

(declare-fun m!1263373 () Bool)

(assert (=> b!1378614 m!1263373))

(declare-fun m!1263375 () Bool)

(assert (=> b!1378614 m!1263375))

(declare-fun m!1263377 () Bool)

(assert (=> b!1378614 m!1263377))

(declare-fun m!1263379 () Bool)

(assert (=> b!1378611 m!1263379))

(declare-fun m!1263381 () Bool)

(assert (=> b!1378610 m!1263381))

(assert (=> b!1378610 m!1263381))

(declare-fun m!1263383 () Bool)

(assert (=> b!1378610 m!1263383))

(declare-fun m!1263385 () Bool)

(assert (=> b!1378609 m!1263385))

(declare-fun m!1263387 () Bool)

(assert (=> b!1378609 m!1263387))

(declare-fun m!1263389 () Bool)

(assert (=> b!1378609 m!1263389))

(declare-fun m!1263391 () Bool)

(assert (=> b!1378609 m!1263391))

(declare-fun m!1263393 () Bool)

(assert (=> b!1378609 m!1263393))

(declare-fun m!1263395 () Bool)

(assert (=> b!1378609 m!1263395))

(declare-fun m!1263397 () Bool)

(assert (=> start!117124 m!1263397))

(push 1)

(assert (not b!1378611))

(assert (not start!117124))

(assert (not b!1378610))

(assert (not b!1378613))

(assert (not b!1378614))

(assert (not b!1378609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

