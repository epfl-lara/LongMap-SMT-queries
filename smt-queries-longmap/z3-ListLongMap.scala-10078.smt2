; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118604 () Bool)

(assert start!118604)

(declare-fun b!1386580 () Bool)

(declare-datatypes ((Unit!46319 0))(
  ( (Unit!46320) )
))
(declare-fun e!785461 () Unit!46319)

(declare-fun Unit!46321 () Unit!46319)

(assert (=> b!1386580 (= e!785461 Unit!46321)))

(declare-fun b!1386581 () Bool)

(declare-fun res!927750 () Bool)

(declare-fun e!785460 () Bool)

(assert (=> b!1386581 (=> (not res!927750) (not e!785460))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94880 0))(
  ( (array!94881 (arr!45816 (Array (_ BitVec 32) (_ BitVec 64))) (size!46366 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94880)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386581 (= res!927750 (and (= (size!46366 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46366 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46366 a!2938))))))

(declare-fun b!1386582 () Bool)

(declare-fun res!927752 () Bool)

(assert (=> b!1386582 (=> (not res!927752) (not e!785460))))

(assert (=> b!1386582 (= res!927752 (and (not (= (select (arr!45816 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45816 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386583 () Bool)

(declare-fun lt!609511 () Unit!46319)

(assert (=> b!1386583 (= e!785461 lt!609511)))

(declare-fun lt!609513 () Unit!46319)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46319)

(assert (=> b!1386583 (= lt!609513 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10159 0))(
  ( (MissingZero!10159 (index!43007 (_ BitVec 32))) (Found!10159 (index!43008 (_ BitVec 32))) (Intermediate!10159 (undefined!10971 Bool) (index!43009 (_ BitVec 32)) (x!124624 (_ BitVec 32))) (Undefined!10159) (MissingVacant!10159 (index!43010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94880 (_ BitVec 32)) SeekEntryResult!10159)

(assert (=> b!1386583 (= (seekEntryOrOpen!0 (select (arr!45816 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45816 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94881 (store (arr!45816 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46366 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46319)

(assert (=> b!1386583 (= lt!609511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94880 (_ BitVec 32)) Bool)

(assert (=> b!1386583 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386584 () Bool)

(declare-fun e!785462 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386584 (= e!785462 (validKeyInArray!0 (select (arr!45816 a!2938) startIndex!16)))))

(declare-fun b!1386586 () Bool)

(declare-fun res!927749 () Bool)

(assert (=> b!1386586 (=> (not res!927749) (not e!785460))))

(assert (=> b!1386586 (= res!927749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386587 () Bool)

(declare-fun res!927748 () Bool)

(assert (=> b!1386587 (=> (not res!927748) (not e!785460))))

(assert (=> b!1386587 (= res!927748 (validKeyInArray!0 (select (arr!45816 a!2938) i!1065)))))

(declare-fun b!1386588 () Bool)

(declare-fun res!927754 () Bool)

(assert (=> b!1386588 (=> (not res!927754) (not e!785460))))

(declare-datatypes ((List!32344 0))(
  ( (Nil!32341) (Cons!32340 (h!33549 (_ BitVec 64)) (t!47038 List!32344)) )
))
(declare-fun arrayNoDuplicates!0 (array!94880 (_ BitVec 32) List!32344) Bool)

(assert (=> b!1386588 (= res!927754 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32341))))

(declare-fun res!927751 () Bool)

(assert (=> start!118604 (=> (not res!927751) (not e!785460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118604 (= res!927751 (validMask!0 mask!2987))))

(assert (=> start!118604 e!785460))

(assert (=> start!118604 true))

(declare-fun array_inv!34844 (array!94880) Bool)

(assert (=> start!118604 (array_inv!34844 a!2938)))

(declare-fun b!1386585 () Bool)

(assert (=> b!1386585 (= e!785460 (and (bvslt startIndex!16 (bvsub (size!46366 a!2938) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609512 () Unit!46319)

(assert (=> b!1386585 (= lt!609512 e!785461)))

(declare-fun c!128856 () Bool)

(assert (=> b!1386585 (= c!128856 e!785462)))

(declare-fun res!927753 () Bool)

(assert (=> b!1386585 (=> (not res!927753) (not e!785462))))

(assert (=> b!1386585 (= res!927753 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118604 res!927751) b!1386581))

(assert (= (and b!1386581 res!927750) b!1386587))

(assert (= (and b!1386587 res!927748) b!1386588))

(assert (= (and b!1386588 res!927754) b!1386586))

(assert (= (and b!1386586 res!927749) b!1386582))

(assert (= (and b!1386582 res!927752) b!1386585))

(assert (= (and b!1386585 res!927753) b!1386584))

(assert (= (and b!1386585 c!128856) b!1386583))

(assert (= (and b!1386585 (not c!128856)) b!1386580))

(declare-fun m!1271961 () Bool)

(assert (=> b!1386588 m!1271961))

(declare-fun m!1271963 () Bool)

(assert (=> b!1386584 m!1271963))

(assert (=> b!1386584 m!1271963))

(declare-fun m!1271965 () Bool)

(assert (=> b!1386584 m!1271965))

(declare-fun m!1271967 () Bool)

(assert (=> b!1386583 m!1271967))

(declare-fun m!1271969 () Bool)

(assert (=> b!1386583 m!1271969))

(assert (=> b!1386583 m!1271969))

(declare-fun m!1271971 () Bool)

(assert (=> b!1386583 m!1271971))

(declare-fun m!1271973 () Bool)

(assert (=> b!1386583 m!1271973))

(declare-fun m!1271975 () Bool)

(assert (=> b!1386583 m!1271975))

(assert (=> b!1386583 m!1271963))

(declare-fun m!1271977 () Bool)

(assert (=> b!1386583 m!1271977))

(assert (=> b!1386583 m!1271963))

(declare-fun m!1271979 () Bool)

(assert (=> b!1386583 m!1271979))

(declare-fun m!1271981 () Bool)

(assert (=> b!1386586 m!1271981))

(declare-fun m!1271983 () Bool)

(assert (=> b!1386582 m!1271983))

(declare-fun m!1271985 () Bool)

(assert (=> start!118604 m!1271985))

(declare-fun m!1271987 () Bool)

(assert (=> start!118604 m!1271987))

(assert (=> b!1386587 m!1271983))

(assert (=> b!1386587 m!1271983))

(declare-fun m!1271989 () Bool)

(assert (=> b!1386587 m!1271989))

(check-sat (not b!1386587) (not start!118604) (not b!1386584) (not b!1386588) (not b!1386586) (not b!1386583))
(check-sat)
