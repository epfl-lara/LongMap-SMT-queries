; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118640 () Bool)

(assert start!118640)

(declare-fun b!1387071 () Bool)

(declare-fun res!928132 () Bool)

(declare-fun e!785684 () Bool)

(assert (=> b!1387071 (=> (not res!928132) (not e!785684))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94916 0))(
  ( (array!94917 (arr!45834 (Array (_ BitVec 32) (_ BitVec 64))) (size!46384 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94916)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387071 (= res!928132 (and (= (size!46384 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46384 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46384 a!2938))))))

(declare-fun b!1387072 () Bool)

(declare-fun e!785680 () Bool)

(assert (=> b!1387072 (= e!785684 e!785680)))

(declare-fun res!928138 () Bool)

(assert (=> b!1387072 (=> (not res!928138) (not e!785680))))

(assert (=> b!1387072 (= res!928138 (and (bvslt startIndex!16 (bvsub (size!46384 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!46373 0))(
  ( (Unit!46374) )
))
(declare-fun lt!609685 () Unit!46373)

(declare-fun e!785682 () Unit!46373)

(assert (=> b!1387072 (= lt!609685 e!785682)))

(declare-fun c!128910 () Bool)

(declare-fun e!785681 () Bool)

(assert (=> b!1387072 (= c!128910 e!785681)))

(declare-fun res!928135 () Bool)

(assert (=> b!1387072 (=> (not res!928135) (not e!785681))))

(assert (=> b!1387072 (= res!928135 (not (= startIndex!16 i!1065)))))

(declare-fun lt!609687 () array!94916)

(assert (=> b!1387072 (= lt!609687 (array!94917 (store (arr!45834 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46384 a!2938)))))

(declare-fun b!1387074 () Bool)

(declare-fun Unit!46375 () Unit!46373)

(assert (=> b!1387074 (= e!785682 Unit!46375)))

(declare-fun b!1387075 () Bool)

(declare-fun res!928131 () Bool)

(assert (=> b!1387075 (=> (not res!928131) (not e!785684))))

(declare-datatypes ((List!32362 0))(
  ( (Nil!32359) (Cons!32358 (h!33567 (_ BitVec 64)) (t!47056 List!32362)) )
))
(declare-fun arrayNoDuplicates!0 (array!94916 (_ BitVec 32) List!32362) Bool)

(assert (=> b!1387075 (= res!928131 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32359))))

(declare-fun b!1387073 () Bool)

(declare-fun res!928134 () Bool)

(assert (=> b!1387073 (=> (not res!928134) (not e!785684))))

(assert (=> b!1387073 (= res!928134 (and (not (= (select (arr!45834 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45834 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!928133 () Bool)

(assert (=> start!118640 (=> (not res!928133) (not e!785684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118640 (= res!928133 (validMask!0 mask!2987))))

(assert (=> start!118640 e!785684))

(assert (=> start!118640 true))

(declare-fun array_inv!34862 (array!94916) Bool)

(assert (=> start!118640 (array_inv!34862 a!2938)))

(declare-fun b!1387076 () Bool)

(declare-fun lt!609683 () Unit!46373)

(assert (=> b!1387076 (= e!785682 lt!609683)))

(declare-fun lt!609686 () Unit!46373)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46373)

(assert (=> b!1387076 (= lt!609686 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10177 0))(
  ( (MissingZero!10177 (index!43079 (_ BitVec 32))) (Found!10177 (index!43080 (_ BitVec 32))) (Intermediate!10177 (undefined!10989 Bool) (index!43081 (_ BitVec 32)) (x!124690 (_ BitVec 32))) (Undefined!10177) (MissingVacant!10177 (index!43082 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94916 (_ BitVec 32)) SeekEntryResult!10177)

(assert (=> b!1387076 (= (seekEntryOrOpen!0 (select (arr!45834 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45834 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609687 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46373)

(assert (=> b!1387076 (= lt!609683 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94916 (_ BitVec 32)) Bool)

(assert (=> b!1387076 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387077 () Bool)

(assert (=> b!1387077 (= e!785680 (not true))))

(assert (=> b!1387077 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609687 mask!2987)))

(declare-fun lt!609684 () Unit!46373)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46373)

(assert (=> b!1387077 (= lt!609684 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1387078 () Bool)

(declare-fun res!928137 () Bool)

(assert (=> b!1387078 (=> (not res!928137) (not e!785684))))

(assert (=> b!1387078 (= res!928137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387079 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387079 (= e!785681 (validKeyInArray!0 (select (arr!45834 a!2938) startIndex!16)))))

(declare-fun b!1387080 () Bool)

(declare-fun res!928136 () Bool)

(assert (=> b!1387080 (=> (not res!928136) (not e!785684))))

(assert (=> b!1387080 (= res!928136 (validKeyInArray!0 (select (arr!45834 a!2938) i!1065)))))

(assert (= (and start!118640 res!928133) b!1387071))

(assert (= (and b!1387071 res!928132) b!1387080))

(assert (= (and b!1387080 res!928136) b!1387075))

(assert (= (and b!1387075 res!928131) b!1387078))

(assert (= (and b!1387078 res!928137) b!1387073))

(assert (= (and b!1387073 res!928134) b!1387072))

(assert (= (and b!1387072 res!928135) b!1387079))

(assert (= (and b!1387072 c!128910) b!1387076))

(assert (= (and b!1387072 (not c!128910)) b!1387074))

(assert (= (and b!1387072 res!928138) b!1387077))

(declare-fun m!1272505 () Bool)

(assert (=> b!1387075 m!1272505))

(declare-fun m!1272507 () Bool)

(assert (=> b!1387078 m!1272507))

(declare-fun m!1272509 () Bool)

(assert (=> b!1387080 m!1272509))

(assert (=> b!1387080 m!1272509))

(declare-fun m!1272511 () Bool)

(assert (=> b!1387080 m!1272511))

(declare-fun m!1272513 () Bool)

(assert (=> b!1387079 m!1272513))

(assert (=> b!1387079 m!1272513))

(declare-fun m!1272515 () Bool)

(assert (=> b!1387079 m!1272515))

(declare-fun m!1272517 () Bool)

(assert (=> b!1387076 m!1272517))

(declare-fun m!1272519 () Bool)

(assert (=> b!1387076 m!1272519))

(declare-fun m!1272521 () Bool)

(assert (=> b!1387076 m!1272521))

(assert (=> b!1387076 m!1272513))

(declare-fun m!1272523 () Bool)

(assert (=> b!1387076 m!1272523))

(declare-fun m!1272525 () Bool)

(assert (=> b!1387076 m!1272525))

(assert (=> b!1387076 m!1272519))

(declare-fun m!1272527 () Bool)

(assert (=> b!1387076 m!1272527))

(assert (=> b!1387076 m!1272513))

(declare-fun m!1272529 () Bool)

(assert (=> b!1387076 m!1272529))

(declare-fun m!1272531 () Bool)

(assert (=> b!1387077 m!1272531))

(declare-fun m!1272533 () Bool)

(assert (=> b!1387077 m!1272533))

(assert (=> b!1387072 m!1272521))

(declare-fun m!1272535 () Bool)

(assert (=> start!118640 m!1272535))

(declare-fun m!1272537 () Bool)

(assert (=> start!118640 m!1272537))

(assert (=> b!1387073 m!1272509))

(check-sat (not start!118640) (not b!1387075) (not b!1387078) (not b!1387076) (not b!1387077) (not b!1387079) (not b!1387080))
(check-sat)
