; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118642 () Bool)

(assert start!118642)

(declare-fun b!1387101 () Bool)

(declare-datatypes ((Unit!46376 0))(
  ( (Unit!46377) )
))
(declare-fun e!785698 () Unit!46376)

(declare-fun lt!609701 () Unit!46376)

(assert (=> b!1387101 (= e!785698 lt!609701)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609699 () Unit!46376)

(declare-datatypes ((array!94918 0))(
  ( (array!94919 (arr!45835 (Array (_ BitVec 32) (_ BitVec 64))) (size!46385 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94918)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46376)

(assert (=> b!1387101 (= lt!609699 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun lt!609700 () array!94918)

(declare-datatypes ((SeekEntryResult!10178 0))(
  ( (MissingZero!10178 (index!43083 (_ BitVec 32))) (Found!10178 (index!43084 (_ BitVec 32))) (Intermediate!10178 (undefined!10990 Bool) (index!43085 (_ BitVec 32)) (x!124691 (_ BitVec 32))) (Undefined!10178) (MissingVacant!10178 (index!43086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94918 (_ BitVec 32)) SeekEntryResult!10178)

(assert (=> b!1387101 (= (seekEntryOrOpen!0 (select (arr!45835 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45835 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609700 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46376)

(assert (=> b!1387101 (= lt!609701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94918 (_ BitVec 32)) Bool)

(assert (=> b!1387101 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387102 () Bool)

(declare-fun e!785697 () Bool)

(assert (=> b!1387102 (= e!785697 (not true))))

(assert (=> b!1387102 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609700 mask!2987)))

(declare-fun lt!609702 () Unit!46376)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46376)

(assert (=> b!1387102 (= lt!609702 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1387104 () Bool)

(declare-fun res!928157 () Bool)

(declare-fun e!785699 () Bool)

(assert (=> b!1387104 (=> (not res!928157) (not e!785699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387104 (= res!928157 (validKeyInArray!0 (select (arr!45835 a!2938) i!1065)))))

(declare-fun b!1387105 () Bool)

(declare-fun res!928162 () Bool)

(assert (=> b!1387105 (=> (not res!928162) (not e!785699))))

(assert (=> b!1387105 (= res!928162 (and (= (size!46385 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46385 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46385 a!2938))))))

(declare-fun b!1387106 () Bool)

(assert (=> b!1387106 (= e!785699 e!785697)))

(declare-fun res!928158 () Bool)

(assert (=> b!1387106 (=> (not res!928158) (not e!785697))))

(assert (=> b!1387106 (= res!928158 (and (bvslt startIndex!16 (bvsub (size!46385 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609698 () Unit!46376)

(assert (=> b!1387106 (= lt!609698 e!785698)))

(declare-fun c!128913 () Bool)

(declare-fun e!785695 () Bool)

(assert (=> b!1387106 (= c!128913 e!785695)))

(declare-fun res!928160 () Bool)

(assert (=> b!1387106 (=> (not res!928160) (not e!785695))))

(assert (=> b!1387106 (= res!928160 (not (= startIndex!16 i!1065)))))

(assert (=> b!1387106 (= lt!609700 (array!94919 (store (arr!45835 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46385 a!2938)))))

(declare-fun b!1387107 () Bool)

(declare-fun Unit!46378 () Unit!46376)

(assert (=> b!1387107 (= e!785698 Unit!46378)))

(declare-fun b!1387108 () Bool)

(declare-fun res!928161 () Bool)

(assert (=> b!1387108 (=> (not res!928161) (not e!785699))))

(declare-datatypes ((List!32363 0))(
  ( (Nil!32360) (Cons!32359 (h!33568 (_ BitVec 64)) (t!47057 List!32363)) )
))
(declare-fun arrayNoDuplicates!0 (array!94918 (_ BitVec 32) List!32363) Bool)

(assert (=> b!1387108 (= res!928161 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32360))))

(declare-fun res!928155 () Bool)

(assert (=> start!118642 (=> (not res!928155) (not e!785699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118642 (= res!928155 (validMask!0 mask!2987))))

(assert (=> start!118642 e!785699))

(assert (=> start!118642 true))

(declare-fun array_inv!34863 (array!94918) Bool)

(assert (=> start!118642 (array_inv!34863 a!2938)))

(declare-fun b!1387103 () Bool)

(declare-fun res!928156 () Bool)

(assert (=> b!1387103 (=> (not res!928156) (not e!785699))))

(assert (=> b!1387103 (= res!928156 (and (not (= (select (arr!45835 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45835 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387109 () Bool)

(assert (=> b!1387109 (= e!785695 (validKeyInArray!0 (select (arr!45835 a!2938) startIndex!16)))))

(declare-fun b!1387110 () Bool)

(declare-fun res!928159 () Bool)

(assert (=> b!1387110 (=> (not res!928159) (not e!785699))))

(assert (=> b!1387110 (= res!928159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118642 res!928155) b!1387105))

(assert (= (and b!1387105 res!928162) b!1387104))

(assert (= (and b!1387104 res!928157) b!1387108))

(assert (= (and b!1387108 res!928161) b!1387110))

(assert (= (and b!1387110 res!928159) b!1387103))

(assert (= (and b!1387103 res!928156) b!1387106))

(assert (= (and b!1387106 res!928160) b!1387109))

(assert (= (and b!1387106 c!128913) b!1387101))

(assert (= (and b!1387106 (not c!128913)) b!1387107))

(assert (= (and b!1387106 res!928158) b!1387102))

(declare-fun m!1272539 () Bool)

(assert (=> b!1387101 m!1272539))

(declare-fun m!1272541 () Bool)

(assert (=> b!1387101 m!1272541))

(declare-fun m!1272543 () Bool)

(assert (=> b!1387101 m!1272543))

(assert (=> b!1387101 m!1272541))

(declare-fun m!1272545 () Bool)

(assert (=> b!1387101 m!1272545))

(declare-fun m!1272547 () Bool)

(assert (=> b!1387101 m!1272547))

(declare-fun m!1272549 () Bool)

(assert (=> b!1387101 m!1272549))

(declare-fun m!1272551 () Bool)

(assert (=> b!1387101 m!1272551))

(assert (=> b!1387101 m!1272549))

(declare-fun m!1272553 () Bool)

(assert (=> b!1387101 m!1272553))

(declare-fun m!1272555 () Bool)

(assert (=> b!1387102 m!1272555))

(declare-fun m!1272557 () Bool)

(assert (=> b!1387102 m!1272557))

(declare-fun m!1272559 () Bool)

(assert (=> b!1387104 m!1272559))

(assert (=> b!1387104 m!1272559))

(declare-fun m!1272561 () Bool)

(assert (=> b!1387104 m!1272561))

(declare-fun m!1272563 () Bool)

(assert (=> b!1387110 m!1272563))

(declare-fun m!1272565 () Bool)

(assert (=> b!1387108 m!1272565))

(assert (=> b!1387106 m!1272543))

(declare-fun m!1272567 () Bool)

(assert (=> start!118642 m!1272567))

(declare-fun m!1272569 () Bool)

(assert (=> start!118642 m!1272569))

(assert (=> b!1387109 m!1272549))

(assert (=> b!1387109 m!1272549))

(declare-fun m!1272571 () Bool)

(assert (=> b!1387109 m!1272571))

(assert (=> b!1387103 m!1272559))

(push 1)

(assert (not b!1387104))

(assert (not start!118642))

(assert (not b!1387101))

