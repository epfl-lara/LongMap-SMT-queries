; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118606 () Bool)

(assert start!118606)

(declare-fun b!1386607 () Bool)

(declare-fun res!927772 () Bool)

(declare-fun e!785473 () Bool)

(assert (=> b!1386607 (=> (not res!927772) (not e!785473))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94882 0))(
  ( (array!94883 (arr!45817 (Array (_ BitVec 32) (_ BitVec 64))) (size!46367 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94882)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386607 (= res!927772 (and (= (size!46367 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46367 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46367 a!2938))))))

(declare-fun b!1386609 () Bool)

(declare-fun res!927770 () Bool)

(assert (=> b!1386609 (=> (not res!927770) (not e!785473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94882 (_ BitVec 32)) Bool)

(assert (=> b!1386609 (= res!927770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386610 () Bool)

(declare-fun res!927773 () Bool)

(assert (=> b!1386610 (=> (not res!927773) (not e!785473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386610 (= res!927773 (validKeyInArray!0 (select (arr!45817 a!2938) i!1065)))))

(declare-fun b!1386611 () Bool)

(declare-fun res!927769 () Bool)

(assert (=> b!1386611 (=> (not res!927769) (not e!785473))))

(assert (=> b!1386611 (= res!927769 (and (not (= (select (arr!45817 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45817 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386612 () Bool)

(declare-fun e!785471 () Bool)

(assert (=> b!1386612 (= e!785471 (validKeyInArray!0 (select (arr!45817 a!2938) startIndex!16)))))

(declare-fun b!1386613 () Bool)

(declare-datatypes ((Unit!46322 0))(
  ( (Unit!46323) )
))
(declare-fun e!785474 () Unit!46322)

(declare-fun lt!609521 () Unit!46322)

(assert (=> b!1386613 (= e!785474 lt!609521)))

(declare-fun lt!609522 () Unit!46322)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46322)

(assert (=> b!1386613 (= lt!609522 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10160 0))(
  ( (MissingZero!10160 (index!43011 (_ BitVec 32))) (Found!10160 (index!43012 (_ BitVec 32))) (Intermediate!10160 (undefined!10972 Bool) (index!43013 (_ BitVec 32)) (x!124625 (_ BitVec 32))) (Undefined!10160) (MissingVacant!10160 (index!43014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94882 (_ BitVec 32)) SeekEntryResult!10160)

(assert (=> b!1386613 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94883 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46367 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46322)

(assert (=> b!1386613 (= lt!609521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386613 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386614 () Bool)

(declare-fun Unit!46324 () Unit!46322)

(assert (=> b!1386614 (= e!785474 Unit!46324)))

(declare-fun b!1386615 () Bool)

(assert (=> b!1386615 (= e!785473 (and (bvslt startIndex!16 (bvsub (size!46367 a!2938) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609520 () Unit!46322)

(assert (=> b!1386615 (= lt!609520 e!785474)))

(declare-fun c!128859 () Bool)

(assert (=> b!1386615 (= c!128859 e!785471)))

(declare-fun res!927771 () Bool)

(assert (=> b!1386615 (=> (not res!927771) (not e!785471))))

(assert (=> b!1386615 (= res!927771 (not (= startIndex!16 i!1065)))))

(declare-fun res!927775 () Bool)

(assert (=> start!118606 (=> (not res!927775) (not e!785473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118606 (= res!927775 (validMask!0 mask!2987))))

(assert (=> start!118606 e!785473))

(assert (=> start!118606 true))

(declare-fun array_inv!34845 (array!94882) Bool)

(assert (=> start!118606 (array_inv!34845 a!2938)))

(declare-fun b!1386608 () Bool)

(declare-fun res!927774 () Bool)

(assert (=> b!1386608 (=> (not res!927774) (not e!785473))))

(declare-datatypes ((List!32345 0))(
  ( (Nil!32342) (Cons!32341 (h!33550 (_ BitVec 64)) (t!47039 List!32345)) )
))
(declare-fun arrayNoDuplicates!0 (array!94882 (_ BitVec 32) List!32345) Bool)

(assert (=> b!1386608 (= res!927774 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32342))))

(assert (= (and start!118606 res!927775) b!1386607))

(assert (= (and b!1386607 res!927772) b!1386610))

(assert (= (and b!1386610 res!927773) b!1386608))

(assert (= (and b!1386608 res!927774) b!1386609))

(assert (= (and b!1386609 res!927770) b!1386611))

(assert (= (and b!1386611 res!927769) b!1386615))

(assert (= (and b!1386615 res!927771) b!1386612))

(assert (= (and b!1386615 c!128859) b!1386613))

(assert (= (and b!1386615 (not c!128859)) b!1386614))

(declare-fun m!1271991 () Bool)

(assert (=> b!1386613 m!1271991))

(declare-fun m!1271993 () Bool)

(assert (=> b!1386613 m!1271993))

(assert (=> b!1386613 m!1271993))

(declare-fun m!1271995 () Bool)

(assert (=> b!1386613 m!1271995))

(declare-fun m!1271997 () Bool)

(assert (=> b!1386613 m!1271997))

(declare-fun m!1271999 () Bool)

(assert (=> b!1386613 m!1271999))

(declare-fun m!1272001 () Bool)

(assert (=> b!1386613 m!1272001))

(declare-fun m!1272003 () Bool)

(assert (=> b!1386613 m!1272003))

(assert (=> b!1386613 m!1272001))

(declare-fun m!1272005 () Bool)

(assert (=> b!1386613 m!1272005))

(declare-fun m!1272007 () Bool)

(assert (=> b!1386608 m!1272007))

(declare-fun m!1272009 () Bool)

(assert (=> b!1386610 m!1272009))

(assert (=> b!1386610 m!1272009))

(declare-fun m!1272011 () Bool)

(assert (=> b!1386610 m!1272011))

(declare-fun m!1272013 () Bool)

(assert (=> b!1386609 m!1272013))

(assert (=> b!1386612 m!1272001))

(assert (=> b!1386612 m!1272001))

(declare-fun m!1272015 () Bool)

(assert (=> b!1386612 m!1272015))

(declare-fun m!1272017 () Bool)

(assert (=> start!118606 m!1272017))

(declare-fun m!1272019 () Bool)

(assert (=> start!118606 m!1272019))

(assert (=> b!1386611 m!1272009))

(push 1)

(assert (not b!1386613))

(assert (not b!1386608))

(assert (not b!1386612))

(assert (not b!1386609))

(assert (not start!118606))

(assert (not b!1386610))

(check-sat)

