; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118322 () Bool)

(assert start!118322)

(declare-fun b!1383871 () Bool)

(declare-datatypes ((Unit!46107 0))(
  ( (Unit!46108) )
))
(declare-fun e!784244 () Unit!46107)

(declare-fun lt!608701 () Unit!46107)

(assert (=> b!1383871 (= e!784244 lt!608701)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94625 0))(
  ( (array!94626 (arr!45690 (Array (_ BitVec 32) (_ BitVec 64))) (size!46240 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94625)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608702 () Unit!46107)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46107)

(assert (=> b!1383871 (= lt!608702 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10083 0))(
  ( (MissingZero!10083 (index!42703 (_ BitVec 32))) (Found!10083 (index!42704 (_ BitVec 32))) (Intermediate!10083 (undefined!10895 Bool) (index!42705 (_ BitVec 32)) (x!124212 (_ BitVec 32))) (Undefined!10083) (MissingVacant!10083 (index!42706 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94625 (_ BitVec 32)) SeekEntryResult!10083)

(assert (=> b!1383871 (= (seekEntryOrOpen!0 (select (arr!45690 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45690 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94626 (store (arr!45690 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46240 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46107)

(assert (=> b!1383871 (= lt!608701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94625 (_ BitVec 32)) Bool)

(assert (=> b!1383871 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925435 () Bool)

(declare-fun e!784245 () Bool)

(assert (=> start!118322 (=> (not res!925435) (not e!784245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118322 (= res!925435 (validMask!0 mask!2987))))

(assert (=> start!118322 e!784245))

(assert (=> start!118322 true))

(declare-fun array_inv!34718 (array!94625) Bool)

(assert (=> start!118322 (array_inv!34718 a!2938)))

(declare-fun b!1383872 () Bool)

(declare-fun res!925439 () Bool)

(assert (=> b!1383872 (=> (not res!925439) (not e!784245))))

(assert (=> b!1383872 (= res!925439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383873 () Bool)

(declare-fun res!925438 () Bool)

(assert (=> b!1383873 (=> (not res!925438) (not e!784245))))

(assert (=> b!1383873 (= res!925438 (and (= (size!46240 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46240 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46240 a!2938))))))

(declare-fun b!1383874 () Bool)

(declare-fun res!925437 () Bool)

(assert (=> b!1383874 (=> (not res!925437) (not e!784245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383874 (= res!925437 (validKeyInArray!0 (select (arr!45690 a!2938) i!1065)))))

(declare-fun b!1383875 () Bool)

(declare-fun res!925436 () Bool)

(assert (=> b!1383875 (=> (not res!925436) (not e!784245))))

(declare-datatypes ((List!32218 0))(
  ( (Nil!32215) (Cons!32214 (h!33423 (_ BitVec 64)) (t!46912 List!32218)) )
))
(declare-fun arrayNoDuplicates!0 (array!94625 (_ BitVec 32) List!32218) Bool)

(assert (=> b!1383875 (= res!925436 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32215))))

(declare-fun b!1383876 () Bool)

(declare-fun Unit!46109 () Unit!46107)

(assert (=> b!1383876 (= e!784244 Unit!46109)))

(declare-fun b!1383877 () Bool)

(declare-fun e!784247 () Bool)

(assert (=> b!1383877 (= e!784247 (validKeyInArray!0 (select (arr!45690 a!2938) startIndex!16)))))

(declare-fun b!1383878 () Bool)

(declare-fun res!925441 () Bool)

(assert (=> b!1383878 (=> (not res!925441) (not e!784245))))

(assert (=> b!1383878 (= res!925441 (and (not (= (select (arr!45690 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45690 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383879 () Bool)

(assert (=> b!1383879 (= e!784245 false)))

(declare-fun lt!608703 () Unit!46107)

(assert (=> b!1383879 (= lt!608703 e!784244)))

(declare-fun c!128658 () Bool)

(assert (=> b!1383879 (= c!128658 e!784247)))

(declare-fun res!925440 () Bool)

(assert (=> b!1383879 (=> (not res!925440) (not e!784247))))

(assert (=> b!1383879 (= res!925440 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118322 res!925435) b!1383873))

(assert (= (and b!1383873 res!925438) b!1383874))

(assert (= (and b!1383874 res!925437) b!1383875))

(assert (= (and b!1383875 res!925436) b!1383872))

(assert (= (and b!1383872 res!925439) b!1383878))

(assert (= (and b!1383878 res!925441) b!1383879))

(assert (= (and b!1383879 res!925440) b!1383877))

(assert (= (and b!1383879 c!128658) b!1383871))

(assert (= (and b!1383879 (not c!128658)) b!1383876))

(declare-fun m!1269051 () Bool)

(assert (=> b!1383877 m!1269051))

(assert (=> b!1383877 m!1269051))

(declare-fun m!1269053 () Bool)

(assert (=> b!1383877 m!1269053))

(declare-fun m!1269055 () Bool)

(assert (=> b!1383875 m!1269055))

(declare-fun m!1269057 () Bool)

(assert (=> b!1383872 m!1269057))

(declare-fun m!1269059 () Bool)

(assert (=> b!1383878 m!1269059))

(assert (=> b!1383874 m!1269059))

(assert (=> b!1383874 m!1269059))

(declare-fun m!1269061 () Bool)

(assert (=> b!1383874 m!1269061))

(declare-fun m!1269063 () Bool)

(assert (=> b!1383871 m!1269063))

(declare-fun m!1269065 () Bool)

(assert (=> b!1383871 m!1269065))

(assert (=> b!1383871 m!1269065))

(declare-fun m!1269067 () Bool)

(assert (=> b!1383871 m!1269067))

(declare-fun m!1269069 () Bool)

(assert (=> b!1383871 m!1269069))

(declare-fun m!1269071 () Bool)

(assert (=> b!1383871 m!1269071))

(assert (=> b!1383871 m!1269051))

(declare-fun m!1269073 () Bool)

(assert (=> b!1383871 m!1269073))

(assert (=> b!1383871 m!1269051))

(declare-fun m!1269075 () Bool)

(assert (=> b!1383871 m!1269075))

(declare-fun m!1269077 () Bool)

(assert (=> start!118322 m!1269077))

(declare-fun m!1269079 () Bool)

(assert (=> start!118322 m!1269079))

(check-sat (not b!1383877) (not b!1383872) (not start!118322) (not b!1383874) (not b!1383871) (not b!1383875))
