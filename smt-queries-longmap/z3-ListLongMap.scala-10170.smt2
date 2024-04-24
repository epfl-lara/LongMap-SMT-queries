; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120080 () Bool)

(assert start!120080)

(declare-fun b!1397132 () Bool)

(declare-fun res!935530 () Bool)

(declare-fun e!791056 () Bool)

(assert (=> b!1397132 (=> (not res!935530) (not e!791056))))

(declare-datatypes ((array!95582 0))(
  ( (array!95583 (arr!46144 (Array (_ BitVec 32) (_ BitVec 64))) (size!46695 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95582)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95582 (_ BitVec 32)) Bool)

(assert (=> b!1397132 (= res!935530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!935528 () Bool)

(assert (=> start!120080 (=> (not res!935528) (not e!791056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120080 (= res!935528 (validMask!0 mask!2840))))

(assert (=> start!120080 e!791056))

(assert (=> start!120080 true))

(declare-fun array_inv!35425 (array!95582) Bool)

(assert (=> start!120080 (array_inv!35425 a!2901)))

(declare-fun b!1397133 () Bool)

(declare-fun res!935529 () Bool)

(assert (=> b!1397133 (=> (not res!935529) (not e!791056))))

(declare-datatypes ((List!32650 0))(
  ( (Nil!32647) (Cons!32646 (h!33893 (_ BitVec 64)) (t!47336 List!32650)) )
))
(declare-fun arrayNoDuplicates!0 (array!95582 (_ BitVec 32) List!32650) Bool)

(assert (=> b!1397133 (= res!935529 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32647))))

(declare-fun b!1397134 () Bool)

(declare-fun res!935527 () Bool)

(assert (=> b!1397134 (=> (not res!935527) (not e!791056))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397134 (= res!935527 (validKeyInArray!0 (select (arr!46144 a!2901) i!1037)))))

(declare-fun b!1397135 () Bool)

(declare-fun res!935531 () Bool)

(assert (=> b!1397135 (=> (not res!935531) (not e!791056))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397135 (= res!935531 (and (= (size!46695 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46695 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46695 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!791054 () Bool)

(declare-fun b!1397136 () Bool)

(declare-datatypes ((SeekEntryResult!10364 0))(
  ( (MissingZero!10364 (index!43827 (_ BitVec 32))) (Found!10364 (index!43828 (_ BitVec 32))) (Intermediate!10364 (undefined!11176 Bool) (index!43829 (_ BitVec 32)) (x!125647 (_ BitVec 32))) (Undefined!10364) (MissingVacant!10364 (index!43830 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95582 (_ BitVec 32)) SeekEntryResult!10364)

(assert (=> b!1397136 (= e!791054 (= (seekEntryOrOpen!0 (select (arr!46144 a!2901) j!112) a!2901 mask!2840) (Found!10364 j!112)))))

(declare-fun b!1397137 () Bool)

(declare-fun res!935526 () Bool)

(assert (=> b!1397137 (=> (not res!935526) (not e!791056))))

(assert (=> b!1397137 (= res!935526 (validKeyInArray!0 (select (arr!46144 a!2901) j!112)))))

(declare-fun b!1397138 () Bool)

(declare-fun e!791057 () Bool)

(assert (=> b!1397138 (= e!791056 (not e!791057))))

(declare-fun res!935533 () Bool)

(assert (=> b!1397138 (=> res!935533 e!791057)))

(declare-fun lt!613606 () SeekEntryResult!10364)

(get-info :version)

(assert (=> b!1397138 (= res!935533 (or (not ((_ is Intermediate!10364) lt!613606)) (undefined!11176 lt!613606)))))

(assert (=> b!1397138 e!791054))

(declare-fun res!935532 () Bool)

(assert (=> b!1397138 (=> (not res!935532) (not e!791054))))

(assert (=> b!1397138 (= res!935532 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46759 0))(
  ( (Unit!46760) )
))
(declare-fun lt!613605 () Unit!46759)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46759)

(assert (=> b!1397138 (= lt!613605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95582 (_ BitVec 32)) SeekEntryResult!10364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397138 (= lt!613606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46144 a!2901) j!112) mask!2840) (select (arr!46144 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1397139 () Bool)

(declare-fun lt!613607 () SeekEntryResult!10364)

(assert (=> b!1397139 (= e!791057 (or (= lt!613606 lt!613607) (not ((_ is Intermediate!10364) lt!613607)) (bvsge mask!2840 #b00000000000000000000000000000000)))))

(assert (=> b!1397139 (= lt!613607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46144 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46144 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95583 (store (arr!46144 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46695 a!2901)) mask!2840))))

(assert (= (and start!120080 res!935528) b!1397135))

(assert (= (and b!1397135 res!935531) b!1397134))

(assert (= (and b!1397134 res!935527) b!1397137))

(assert (= (and b!1397137 res!935526) b!1397132))

(assert (= (and b!1397132 res!935530) b!1397133))

(assert (= (and b!1397133 res!935529) b!1397138))

(assert (= (and b!1397138 res!935532) b!1397136))

(assert (= (and b!1397138 (not res!935533)) b!1397139))

(declare-fun m!1283833 () Bool)

(assert (=> b!1397132 m!1283833))

(declare-fun m!1283835 () Bool)

(assert (=> b!1397134 m!1283835))

(assert (=> b!1397134 m!1283835))

(declare-fun m!1283837 () Bool)

(assert (=> b!1397134 m!1283837))

(declare-fun m!1283839 () Bool)

(assert (=> b!1397139 m!1283839))

(declare-fun m!1283841 () Bool)

(assert (=> b!1397139 m!1283841))

(assert (=> b!1397139 m!1283841))

(declare-fun m!1283843 () Bool)

(assert (=> b!1397139 m!1283843))

(assert (=> b!1397139 m!1283843))

(assert (=> b!1397139 m!1283841))

(declare-fun m!1283845 () Bool)

(assert (=> b!1397139 m!1283845))

(declare-fun m!1283847 () Bool)

(assert (=> b!1397137 m!1283847))

(assert (=> b!1397137 m!1283847))

(declare-fun m!1283849 () Bool)

(assert (=> b!1397137 m!1283849))

(assert (=> b!1397138 m!1283847))

(declare-fun m!1283851 () Bool)

(assert (=> b!1397138 m!1283851))

(assert (=> b!1397138 m!1283847))

(declare-fun m!1283853 () Bool)

(assert (=> b!1397138 m!1283853))

(assert (=> b!1397138 m!1283851))

(assert (=> b!1397138 m!1283847))

(declare-fun m!1283855 () Bool)

(assert (=> b!1397138 m!1283855))

(declare-fun m!1283857 () Bool)

(assert (=> b!1397138 m!1283857))

(declare-fun m!1283859 () Bool)

(assert (=> b!1397133 m!1283859))

(declare-fun m!1283861 () Bool)

(assert (=> start!120080 m!1283861))

(declare-fun m!1283863 () Bool)

(assert (=> start!120080 m!1283863))

(assert (=> b!1397136 m!1283847))

(assert (=> b!1397136 m!1283847))

(declare-fun m!1283865 () Bool)

(assert (=> b!1397136 m!1283865))

(check-sat (not b!1397138) (not b!1397134) (not b!1397137) (not b!1397133) (not b!1397139) (not start!120080) (not b!1397136) (not b!1397132))
(check-sat)
