; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117198 () Bool)

(assert start!117198)

(declare-fun b!1379126 () Bool)

(declare-fun res!921707 () Bool)

(declare-fun e!781261 () Bool)

(assert (=> b!1379126 (=> (not res!921707) (not e!781261))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379126 (= res!921707 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379127 () Bool)

(declare-fun res!921705 () Bool)

(assert (=> b!1379127 (=> (not res!921705) (not e!781261))))

(declare-datatypes ((array!93769 0))(
  ( (array!93770 (arr!45285 (Array (_ BitVec 32) (_ BitVec 64))) (size!45837 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93769)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379127 (= res!921705 (and (bvslt (size!45837 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45837 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921706 () Bool)

(assert (=> start!117198 (=> (not res!921706) (not e!781261))))

(assert (=> start!117198 (= res!921706 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45837 a!4094))))))

(assert (=> start!117198 e!781261))

(assert (=> start!117198 true))

(declare-fun array_inv!34518 (array!93769) Bool)

(assert (=> start!117198 (array_inv!34518 a!4094)))

(declare-fun b!1379128 () Bool)

(declare-fun e!781259 () Bool)

(assert (=> b!1379128 (= e!781259 (not true))))

(declare-fun lt!607046 () array!93769)

(declare-fun lt!607043 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93769 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379128 (= (bvadd (arrayCountValidKeys!0 lt!607046 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607043) (arrayCountValidKeys!0 lt!607046 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45688 0))(
  ( (Unit!45689) )
))
(declare-fun lt!607044 () Unit!45688)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45688)

(assert (=> b!1379128 (= lt!607044 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607046 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607045 () (_ BitVec 32))

(assert (=> b!1379128 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607045) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607042 () Unit!45688)

(assert (=> b!1379128 (= lt!607042 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379129 () Bool)

(assert (=> b!1379129 (= e!781261 e!781259)))

(declare-fun res!921703 () Bool)

(assert (=> b!1379129 (=> (not res!921703) (not e!781259))))

(assert (=> b!1379129 (= res!921703 (and (= lt!607043 (bvsub lt!607045 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379129 (= lt!607043 (arrayCountValidKeys!0 lt!607046 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379129 (= lt!607045 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379129 (= lt!607046 (array!93770 (store (arr!45285 a!4094) i!1451 k!2953) (size!45837 a!4094)))))

(declare-fun b!1379130 () Bool)

(declare-fun res!921704 () Bool)

(assert (=> b!1379130 (=> (not res!921704) (not e!781261))))

(assert (=> b!1379130 (= res!921704 (validKeyInArray!0 (select (arr!45285 a!4094) i!1451)))))

(assert (= (and start!117198 res!921706) b!1379130))

(assert (= (and b!1379130 res!921704) b!1379126))

(assert (= (and b!1379126 res!921707) b!1379127))

(assert (= (and b!1379127 res!921705) b!1379129))

(assert (= (and b!1379129 res!921703) b!1379128))

(declare-fun m!1263649 () Bool)

(assert (=> b!1379130 m!1263649))

(assert (=> b!1379130 m!1263649))

(declare-fun m!1263651 () Bool)

(assert (=> b!1379130 m!1263651))

(declare-fun m!1263653 () Bool)

(assert (=> b!1379129 m!1263653))

(declare-fun m!1263655 () Bool)

(assert (=> b!1379129 m!1263655))

(declare-fun m!1263657 () Bool)

(assert (=> b!1379129 m!1263657))

(declare-fun m!1263659 () Bool)

(assert (=> b!1379128 m!1263659))

(declare-fun m!1263661 () Bool)

(assert (=> b!1379128 m!1263661))

(declare-fun m!1263663 () Bool)

(assert (=> b!1379128 m!1263663))

(declare-fun m!1263665 () Bool)

(assert (=> b!1379128 m!1263665))

(declare-fun m!1263667 () Bool)

(assert (=> b!1379128 m!1263667))

(declare-fun m!1263669 () Bool)

(assert (=> b!1379128 m!1263669))

(declare-fun m!1263671 () Bool)

(assert (=> b!1379126 m!1263671))

(declare-fun m!1263673 () Bool)

(assert (=> start!117198 m!1263673))

(push 1)

(assert (not b!1379129))

(assert (not b!1379130))

(assert (not b!1379126))

(assert (not start!117198))

(assert (not b!1379128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

