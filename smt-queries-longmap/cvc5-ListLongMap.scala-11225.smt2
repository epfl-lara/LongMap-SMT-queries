; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130982 () Bool)

(assert start!130982)

(declare-fun res!1053725 () Bool)

(declare-fun e!855269 () Bool)

(assert (=> start!130982 (=> (not res!1053725) (not e!855269))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130982 (= res!1053725 (validMask!0 mask!2480))))

(assert (=> start!130982 e!855269))

(assert (=> start!130982 true))

(declare-datatypes ((array!102080 0))(
  ( (array!102081 (arr!49256 (Array (_ BitVec 32) (_ BitVec 64))) (size!49806 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102080)

(declare-fun array_inv!38284 (array!102080) Bool)

(assert (=> start!130982 (array_inv!38284 a!2792)))

(declare-fun b!1536630 () Bool)

(declare-fun e!855266 () Bool)

(assert (=> b!1536630 (= e!855269 e!855266)))

(declare-fun res!1053721 () Bool)

(assert (=> b!1536630 (=> (not res!1053721) (not e!855266))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13388 0))(
  ( (MissingZero!13388 (index!55947 (_ BitVec 32))) (Found!13388 (index!55948 (_ BitVec 32))) (Intermediate!13388 (undefined!14200 Bool) (index!55949 (_ BitVec 32)) (x!137686 (_ BitVec 32))) (Undefined!13388) (MissingVacant!13388 (index!55950 (_ BitVec 32))) )
))
(declare-fun lt!664418 () SeekEntryResult!13388)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102080 (_ BitVec 32)) SeekEntryResult!13388)

(assert (=> b!1536630 (= res!1053721 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49256 a!2792) j!64) a!2792 mask!2480) lt!664418))))

(assert (=> b!1536630 (= lt!664418 (Found!13388 j!64))))

(declare-fun b!1536631 () Bool)

(declare-fun res!1053727 () Bool)

(assert (=> b!1536631 (=> (not res!1053727) (not e!855269))))

(assert (=> b!1536631 (= res!1053727 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49806 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49806 a!2792)) (= (select (arr!49256 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536632 () Bool)

(declare-fun e!855271 () Bool)

(declare-fun lt!664416 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536632 (= e!855271 (validKeyInArray!0 lt!664416))))

(declare-fun b!1536633 () Bool)

(declare-fun res!1053722 () Bool)

(assert (=> b!1536633 (=> (not res!1053722) (not e!855269))))

(declare-datatypes ((List!35730 0))(
  ( (Nil!35727) (Cons!35726 (h!37171 (_ BitVec 64)) (t!50424 List!35730)) )
))
(declare-fun arrayNoDuplicates!0 (array!102080 (_ BitVec 32) List!35730) Bool)

(assert (=> b!1536633 (= res!1053722 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35727))))

(declare-fun b!1536634 () Bool)

(declare-fun res!1053723 () Bool)

(assert (=> b!1536634 (=> (not res!1053723) (not e!855269))))

(assert (=> b!1536634 (= res!1053723 (validKeyInArray!0 (select (arr!49256 a!2792) j!64)))))

(declare-fun b!1536635 () Bool)

(declare-fun e!855270 () Bool)

(declare-fun e!855267 () Bool)

(assert (=> b!1536635 (= e!855270 e!855267)))

(declare-fun res!1053724 () Bool)

(assert (=> b!1536635 (=> (not res!1053724) (not e!855267))))

(declare-fun lt!664417 () SeekEntryResult!13388)

(assert (=> b!1536635 (= res!1053724 (= lt!664417 lt!664418))))

(declare-fun lt!664419 () (_ BitVec 32))

(assert (=> b!1536635 (= lt!664417 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664419 vacantIndex!5 (select (arr!49256 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536636 () Bool)

(declare-fun res!1053726 () Bool)

(assert (=> b!1536636 (=> (not res!1053726) (not e!855269))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536636 (= res!1053726 (and (= (size!49806 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49806 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49806 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536637 () Bool)

(assert (=> b!1536637 (= e!855266 e!855270)))

(declare-fun res!1053716 () Bool)

(assert (=> b!1536637 (=> (not res!1053716) (not e!855270))))

(assert (=> b!1536637 (= res!1053716 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664419 #b00000000000000000000000000000000) (bvslt lt!664419 (size!49806 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536637 (= lt!664419 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536638 () Bool)

(assert (=> b!1536638 (= e!855267 (not e!855271))))

(declare-fun res!1053717 () Bool)

(assert (=> b!1536638 (=> res!1053717 e!855271)))

(assert (=> b!1536638 (= res!1053717 (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49256 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1536638 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664419 vacantIndex!5 lt!664416 (array!102081 (store (arr!49256 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49806 a!2792)) mask!2480) lt!664417)))

(assert (=> b!1536638 (= lt!664416 (select (store (arr!49256 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64))))

(declare-datatypes ((Unit!51348 0))(
  ( (Unit!51349) )
))
(declare-fun lt!664420 () Unit!51348)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51348)

(assert (=> b!1536638 (= lt!664420 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664419 vacantIndex!5 mask!2480))))

(declare-fun b!1536639 () Bool)

(declare-fun res!1053719 () Bool)

(assert (=> b!1536639 (=> (not res!1053719) (not e!855266))))

(assert (=> b!1536639 (= res!1053719 (not (= (select (arr!49256 a!2792) index!463) (select (arr!49256 a!2792) j!64))))))

(declare-fun b!1536640 () Bool)

(declare-fun res!1053718 () Bool)

(assert (=> b!1536640 (=> (not res!1053718) (not e!855269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102080 (_ BitVec 32)) Bool)

(assert (=> b!1536640 (= res!1053718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536641 () Bool)

(declare-fun res!1053720 () Bool)

(assert (=> b!1536641 (=> (not res!1053720) (not e!855269))))

(assert (=> b!1536641 (= res!1053720 (validKeyInArray!0 (select (arr!49256 a!2792) i!951)))))

(assert (= (and start!130982 res!1053725) b!1536636))

(assert (= (and b!1536636 res!1053726) b!1536641))

(assert (= (and b!1536641 res!1053720) b!1536634))

(assert (= (and b!1536634 res!1053723) b!1536640))

(assert (= (and b!1536640 res!1053718) b!1536633))

(assert (= (and b!1536633 res!1053722) b!1536631))

(assert (= (and b!1536631 res!1053727) b!1536630))

(assert (= (and b!1536630 res!1053721) b!1536639))

(assert (= (and b!1536639 res!1053719) b!1536637))

(assert (= (and b!1536637 res!1053716) b!1536635))

(assert (= (and b!1536635 res!1053724) b!1536638))

(assert (= (and b!1536638 (not res!1053717)) b!1536632))

(declare-fun m!1419105 () Bool)

(assert (=> start!130982 m!1419105))

(declare-fun m!1419107 () Bool)

(assert (=> start!130982 m!1419107))

(declare-fun m!1419109 () Bool)

(assert (=> b!1536637 m!1419109))

(declare-fun m!1419111 () Bool)

(assert (=> b!1536635 m!1419111))

(assert (=> b!1536635 m!1419111))

(declare-fun m!1419113 () Bool)

(assert (=> b!1536635 m!1419113))

(declare-fun m!1419115 () Bool)

(assert (=> b!1536640 m!1419115))

(declare-fun m!1419117 () Bool)

(assert (=> b!1536638 m!1419117))

(declare-fun m!1419119 () Bool)

(assert (=> b!1536638 m!1419119))

(declare-fun m!1419121 () Bool)

(assert (=> b!1536638 m!1419121))

(declare-fun m!1419123 () Bool)

(assert (=> b!1536638 m!1419123))

(declare-fun m!1419125 () Bool)

(assert (=> b!1536638 m!1419125))

(declare-fun m!1419127 () Bool)

(assert (=> b!1536632 m!1419127))

(assert (=> b!1536630 m!1419111))

(assert (=> b!1536630 m!1419111))

(declare-fun m!1419129 () Bool)

(assert (=> b!1536630 m!1419129))

(declare-fun m!1419131 () Bool)

(assert (=> b!1536639 m!1419131))

(assert (=> b!1536639 m!1419111))

(assert (=> b!1536634 m!1419111))

(assert (=> b!1536634 m!1419111))

(declare-fun m!1419133 () Bool)

(assert (=> b!1536634 m!1419133))

(declare-fun m!1419135 () Bool)

(assert (=> b!1536633 m!1419135))

(declare-fun m!1419137 () Bool)

(assert (=> b!1536641 m!1419137))

(assert (=> b!1536641 m!1419137))

(declare-fun m!1419139 () Bool)

(assert (=> b!1536641 m!1419139))

(declare-fun m!1419141 () Bool)

(assert (=> b!1536631 m!1419141))

(push 1)

