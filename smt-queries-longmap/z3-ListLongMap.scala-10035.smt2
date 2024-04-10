; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118316 () Bool)

(assert start!118316)

(declare-fun b!1383790 () Bool)

(declare-fun res!925374 () Bool)

(declare-fun e!784211 () Bool)

(assert (=> b!1383790 (=> (not res!925374) (not e!784211))))

(declare-datatypes ((array!94619 0))(
  ( (array!94620 (arr!45687 (Array (_ BitVec 32) (_ BitVec 64))) (size!46237 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94619)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383790 (= res!925374 (and (not (= (select (arr!45687 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45687 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383791 () Bool)

(declare-fun res!925377 () Bool)

(assert (=> b!1383791 (=> (not res!925377) (not e!784211))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94619 (_ BitVec 32)) Bool)

(assert (=> b!1383791 (= res!925377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383792 () Bool)

(declare-fun e!784208 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383792 (= e!784208 (validKeyInArray!0 (select (arr!45687 a!2938) startIndex!16)))))

(declare-fun b!1383793 () Bool)

(assert (=> b!1383793 (= e!784211 false)))

(declare-datatypes ((Unit!46098 0))(
  ( (Unit!46099) )
))
(declare-fun lt!608675 () Unit!46098)

(declare-fun e!784210 () Unit!46098)

(assert (=> b!1383793 (= lt!608675 e!784210)))

(declare-fun c!128649 () Bool)

(assert (=> b!1383793 (= c!128649 e!784208)))

(declare-fun res!925373 () Bool)

(assert (=> b!1383793 (=> (not res!925373) (not e!784208))))

(assert (=> b!1383793 (= res!925373 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383794 () Bool)

(declare-fun lt!608676 () Unit!46098)

(assert (=> b!1383794 (= e!784210 lt!608676)))

(declare-fun lt!608674 () Unit!46098)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46098)

(assert (=> b!1383794 (= lt!608674 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10080 0))(
  ( (MissingZero!10080 (index!42691 (_ BitVec 32))) (Found!10080 (index!42692 (_ BitVec 32))) (Intermediate!10080 (undefined!10892 Bool) (index!42693 (_ BitVec 32)) (x!124201 (_ BitVec 32))) (Undefined!10080) (MissingVacant!10080 (index!42694 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94619 (_ BitVec 32)) SeekEntryResult!10080)

(assert (=> b!1383794 (= (seekEntryOrOpen!0 (select (arr!45687 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45687 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94620 (store (arr!45687 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46237 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46098)

(assert (=> b!1383794 (= lt!608676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1383794 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925378 () Bool)

(assert (=> start!118316 (=> (not res!925378) (not e!784211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118316 (= res!925378 (validMask!0 mask!2987))))

(assert (=> start!118316 e!784211))

(assert (=> start!118316 true))

(declare-fun array_inv!34715 (array!94619) Bool)

(assert (=> start!118316 (array_inv!34715 a!2938)))

(declare-fun b!1383795 () Bool)

(declare-fun res!925372 () Bool)

(assert (=> b!1383795 (=> (not res!925372) (not e!784211))))

(assert (=> b!1383795 (= res!925372 (validKeyInArray!0 (select (arr!45687 a!2938) i!1065)))))

(declare-fun b!1383796 () Bool)

(declare-fun res!925376 () Bool)

(assert (=> b!1383796 (=> (not res!925376) (not e!784211))))

(declare-datatypes ((List!32215 0))(
  ( (Nil!32212) (Cons!32211 (h!33420 (_ BitVec 64)) (t!46909 List!32215)) )
))
(declare-fun arrayNoDuplicates!0 (array!94619 (_ BitVec 32) List!32215) Bool)

(assert (=> b!1383796 (= res!925376 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32212))))

(declare-fun b!1383797 () Bool)

(declare-fun res!925375 () Bool)

(assert (=> b!1383797 (=> (not res!925375) (not e!784211))))

(assert (=> b!1383797 (= res!925375 (and (= (size!46237 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46237 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46237 a!2938))))))

(declare-fun b!1383798 () Bool)

(declare-fun Unit!46100 () Unit!46098)

(assert (=> b!1383798 (= e!784210 Unit!46100)))

(assert (= (and start!118316 res!925378) b!1383797))

(assert (= (and b!1383797 res!925375) b!1383795))

(assert (= (and b!1383795 res!925372) b!1383796))

(assert (= (and b!1383796 res!925376) b!1383791))

(assert (= (and b!1383791 res!925377) b!1383790))

(assert (= (and b!1383790 res!925374) b!1383793))

(assert (= (and b!1383793 res!925373) b!1383792))

(assert (= (and b!1383793 c!128649) b!1383794))

(assert (= (and b!1383793 (not c!128649)) b!1383798))

(declare-fun m!1268961 () Bool)

(assert (=> b!1383794 m!1268961))

(declare-fun m!1268963 () Bool)

(assert (=> b!1383794 m!1268963))

(assert (=> b!1383794 m!1268963))

(declare-fun m!1268965 () Bool)

(assert (=> b!1383794 m!1268965))

(declare-fun m!1268967 () Bool)

(assert (=> b!1383794 m!1268967))

(declare-fun m!1268969 () Bool)

(assert (=> b!1383794 m!1268969))

(declare-fun m!1268971 () Bool)

(assert (=> b!1383794 m!1268971))

(declare-fun m!1268973 () Bool)

(assert (=> b!1383794 m!1268973))

(assert (=> b!1383794 m!1268971))

(declare-fun m!1268975 () Bool)

(assert (=> b!1383794 m!1268975))

(declare-fun m!1268977 () Bool)

(assert (=> b!1383796 m!1268977))

(declare-fun m!1268979 () Bool)

(assert (=> start!118316 m!1268979))

(declare-fun m!1268981 () Bool)

(assert (=> start!118316 m!1268981))

(declare-fun m!1268983 () Bool)

(assert (=> b!1383790 m!1268983))

(assert (=> b!1383795 m!1268983))

(assert (=> b!1383795 m!1268983))

(declare-fun m!1268985 () Bool)

(assert (=> b!1383795 m!1268985))

(declare-fun m!1268987 () Bool)

(assert (=> b!1383791 m!1268987))

(assert (=> b!1383792 m!1268971))

(assert (=> b!1383792 m!1268971))

(declare-fun m!1268989 () Bool)

(assert (=> b!1383792 m!1268989))

(check-sat (not b!1383791) (not b!1383794) (not b!1383795) (not start!118316) (not b!1383796) (not b!1383792))
