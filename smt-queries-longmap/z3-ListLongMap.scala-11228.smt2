; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130950 () Bool)

(assert start!130950)

(declare-fun b!1536621 () Bool)

(declare-fun e!855210 () Bool)

(assert (=> b!1536621 (= e!855210 (not true))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13397 0))(
  ( (MissingZero!13397 (index!55983 (_ BitVec 32))) (Found!13397 (index!55984 (_ BitVec 32))) (Intermediate!13397 (undefined!14209 Bool) (index!55985 (_ BitVec 32)) (x!137714 (_ BitVec 32))) (Undefined!13397) (MissingVacant!13397 (index!55986 (_ BitVec 32))) )
))
(declare-fun lt!664246 () SeekEntryResult!13397)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-datatypes ((array!102046 0))(
  ( (array!102047 (arr!49240 (Array (_ BitVec 32) (_ BitVec 64))) (size!49792 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102046)

(declare-fun lt!664247 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102046 (_ BitVec 32)) SeekEntryResult!13397)

(assert (=> b!1536621 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664247 vacantIndex!5 (select (store (arr!49240 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102047 (store (arr!49240 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49792 a!2792)) mask!2480) lt!664246)))

(declare-datatypes ((Unit!51201 0))(
  ( (Unit!51202) )
))
(declare-fun lt!664245 () Unit!51201)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51201)

(assert (=> b!1536621 (= lt!664245 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664247 vacantIndex!5 mask!2480))))

(declare-fun b!1536622 () Bool)

(declare-fun res!1053896 () Bool)

(declare-fun e!855212 () Bool)

(assert (=> b!1536622 (=> (not res!1053896) (not e!855212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536622 (= res!1053896 (validKeyInArray!0 (select (arr!49240 a!2792) j!64)))))

(declare-fun b!1536623 () Bool)

(declare-fun e!855214 () Bool)

(assert (=> b!1536623 (= e!855212 e!855214)))

(declare-fun res!1053899 () Bool)

(assert (=> b!1536623 (=> (not res!1053899) (not e!855214))))

(declare-fun lt!664248 () SeekEntryResult!13397)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536623 (= res!1053899 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49240 a!2792) j!64) a!2792 mask!2480) lt!664248))))

(assert (=> b!1536623 (= lt!664248 (Found!13397 j!64))))

(declare-fun b!1536624 () Bool)

(declare-fun res!1053894 () Bool)

(assert (=> b!1536624 (=> (not res!1053894) (not e!855214))))

(assert (=> b!1536624 (= res!1053894 (not (= (select (arr!49240 a!2792) index!463) (select (arr!49240 a!2792) j!64))))))

(declare-fun b!1536625 () Bool)

(declare-fun res!1053898 () Bool)

(assert (=> b!1536625 (=> (not res!1053898) (not e!855212))))

(assert (=> b!1536625 (= res!1053898 (validKeyInArray!0 (select (arr!49240 a!2792) i!951)))))

(declare-fun b!1536626 () Bool)

(declare-fun e!855213 () Bool)

(assert (=> b!1536626 (= e!855214 e!855213)))

(declare-fun res!1053895 () Bool)

(assert (=> b!1536626 (=> (not res!1053895) (not e!855213))))

(assert (=> b!1536626 (= res!1053895 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664247 #b00000000000000000000000000000000) (bvslt lt!664247 (size!49792 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536626 (= lt!664247 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536627 () Bool)

(declare-fun res!1053891 () Bool)

(assert (=> b!1536627 (=> (not res!1053891) (not e!855212))))

(declare-datatypes ((List!35792 0))(
  ( (Nil!35789) (Cons!35788 (h!37234 (_ BitVec 64)) (t!50478 List!35792)) )
))
(declare-fun arrayNoDuplicates!0 (array!102046 (_ BitVec 32) List!35792) Bool)

(assert (=> b!1536627 (= res!1053891 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35789))))

(declare-fun res!1053892 () Bool)

(assert (=> start!130950 (=> (not res!1053892) (not e!855212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130950 (= res!1053892 (validMask!0 mask!2480))))

(assert (=> start!130950 e!855212))

(assert (=> start!130950 true))

(declare-fun array_inv!38473 (array!102046) Bool)

(assert (=> start!130950 (array_inv!38473 a!2792)))

(declare-fun b!1536628 () Bool)

(declare-fun res!1053893 () Bool)

(assert (=> b!1536628 (=> (not res!1053893) (not e!855212))))

(assert (=> b!1536628 (= res!1053893 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49792 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49792 a!2792)) (= (select (arr!49240 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536629 () Bool)

(declare-fun res!1053901 () Bool)

(assert (=> b!1536629 (=> (not res!1053901) (not e!855212))))

(assert (=> b!1536629 (= res!1053901 (and (= (size!49792 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49792 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49792 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536630 () Bool)

(declare-fun res!1053900 () Bool)

(assert (=> b!1536630 (=> (not res!1053900) (not e!855212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102046 (_ BitVec 32)) Bool)

(assert (=> b!1536630 (= res!1053900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536631 () Bool)

(assert (=> b!1536631 (= e!855213 e!855210)))

(declare-fun res!1053897 () Bool)

(assert (=> b!1536631 (=> (not res!1053897) (not e!855210))))

(assert (=> b!1536631 (= res!1053897 (= lt!664246 lt!664248))))

(assert (=> b!1536631 (= lt!664246 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664247 vacantIndex!5 (select (arr!49240 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130950 res!1053892) b!1536629))

(assert (= (and b!1536629 res!1053901) b!1536625))

(assert (= (and b!1536625 res!1053898) b!1536622))

(assert (= (and b!1536622 res!1053896) b!1536630))

(assert (= (and b!1536630 res!1053900) b!1536627))

(assert (= (and b!1536627 res!1053891) b!1536628))

(assert (= (and b!1536628 res!1053893) b!1536623))

(assert (= (and b!1536623 res!1053899) b!1536624))

(assert (= (and b!1536624 res!1053894) b!1536626))

(assert (= (and b!1536626 res!1053895) b!1536631))

(assert (= (and b!1536631 res!1053897) b!1536621))

(declare-fun m!1418531 () Bool)

(assert (=> b!1536621 m!1418531))

(declare-fun m!1418533 () Bool)

(assert (=> b!1536621 m!1418533))

(assert (=> b!1536621 m!1418533))

(declare-fun m!1418535 () Bool)

(assert (=> b!1536621 m!1418535))

(declare-fun m!1418537 () Bool)

(assert (=> b!1536621 m!1418537))

(declare-fun m!1418539 () Bool)

(assert (=> b!1536628 m!1418539))

(declare-fun m!1418541 () Bool)

(assert (=> b!1536631 m!1418541))

(assert (=> b!1536631 m!1418541))

(declare-fun m!1418543 () Bool)

(assert (=> b!1536631 m!1418543))

(assert (=> b!1536622 m!1418541))

(assert (=> b!1536622 m!1418541))

(declare-fun m!1418545 () Bool)

(assert (=> b!1536622 m!1418545))

(declare-fun m!1418547 () Bool)

(assert (=> start!130950 m!1418547))

(declare-fun m!1418549 () Bool)

(assert (=> start!130950 m!1418549))

(declare-fun m!1418551 () Bool)

(assert (=> b!1536626 m!1418551))

(assert (=> b!1536623 m!1418541))

(assert (=> b!1536623 m!1418541))

(declare-fun m!1418553 () Bool)

(assert (=> b!1536623 m!1418553))

(declare-fun m!1418555 () Bool)

(assert (=> b!1536627 m!1418555))

(declare-fun m!1418557 () Bool)

(assert (=> b!1536624 m!1418557))

(assert (=> b!1536624 m!1418541))

(declare-fun m!1418559 () Bool)

(assert (=> b!1536630 m!1418559))

(declare-fun m!1418561 () Bool)

(assert (=> b!1536625 m!1418561))

(assert (=> b!1536625 m!1418561))

(declare-fun m!1418563 () Bool)

(assert (=> b!1536625 m!1418563))

(check-sat (not b!1536622) (not b!1536623) (not b!1536630) (not b!1536626) (not b!1536631) (not start!130950) (not b!1536627) (not b!1536621) (not b!1536625))
(check-sat)
