; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120770 () Bool)

(assert start!120770)

(declare-fun b!1405242 () Bool)

(declare-fun res!943461 () Bool)

(declare-fun e!795471 () Bool)

(assert (=> b!1405242 (=> (not res!943461) (not e!795471))))

(declare-datatypes ((array!96077 0))(
  ( (array!96078 (arr!46386 (Array (_ BitVec 32) (_ BitVec 64))) (size!46936 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96077)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96077 (_ BitVec 32)) Bool)

(assert (=> b!1405242 (= res!943461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405243 () Bool)

(declare-fun res!943460 () Bool)

(assert (=> b!1405243 (=> (not res!943460) (not e!795471))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405243 (= res!943460 (validKeyInArray!0 (select (arr!46386 a!2901) j!112)))))

(declare-fun res!943464 () Bool)

(assert (=> start!120770 (=> (not res!943464) (not e!795471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120770 (= res!943464 (validMask!0 mask!2840))))

(assert (=> start!120770 e!795471))

(assert (=> start!120770 true))

(declare-fun array_inv!35414 (array!96077) Bool)

(assert (=> start!120770 (array_inv!35414 a!2901)))

(declare-fun b!1405244 () Bool)

(declare-fun res!943465 () Bool)

(assert (=> b!1405244 (=> (not res!943465) (not e!795471))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405244 (= res!943465 (and (= (size!46936 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46936 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46936 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405245 () Bool)

(assert (=> b!1405245 (= e!795471 (not true))))

(declare-fun e!795473 () Bool)

(assert (=> b!1405245 e!795473))

(declare-fun res!943459 () Bool)

(assert (=> b!1405245 (=> (not res!943459) (not e!795473))))

(assert (=> b!1405245 (= res!943459 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47368 0))(
  ( (Unit!47369) )
))
(declare-fun lt!618972 () Unit!47368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47368)

(assert (=> b!1405245 (= lt!618972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10697 0))(
  ( (MissingZero!10697 (index!45165 (_ BitVec 32))) (Found!10697 (index!45166 (_ BitVec 32))) (Intermediate!10697 (undefined!11509 Bool) (index!45167 (_ BitVec 32)) (x!126784 (_ BitVec 32))) (Undefined!10697) (MissingVacant!10697 (index!45168 (_ BitVec 32))) )
))
(declare-fun lt!618971 () SeekEntryResult!10697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96077 (_ BitVec 32)) SeekEntryResult!10697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405245 (= lt!618971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46386 a!2901) j!112) mask!2840) (select (arr!46386 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405246 () Bool)

(declare-fun res!943462 () Bool)

(assert (=> b!1405246 (=> (not res!943462) (not e!795471))))

(declare-datatypes ((List!32905 0))(
  ( (Nil!32902) (Cons!32901 (h!34155 (_ BitVec 64)) (t!47599 List!32905)) )
))
(declare-fun arrayNoDuplicates!0 (array!96077 (_ BitVec 32) List!32905) Bool)

(assert (=> b!1405246 (= res!943462 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32902))))

(declare-fun b!1405247 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96077 (_ BitVec 32)) SeekEntryResult!10697)

(assert (=> b!1405247 (= e!795473 (= (seekEntryOrOpen!0 (select (arr!46386 a!2901) j!112) a!2901 mask!2840) (Found!10697 j!112)))))

(declare-fun b!1405248 () Bool)

(declare-fun res!943463 () Bool)

(assert (=> b!1405248 (=> (not res!943463) (not e!795471))))

(assert (=> b!1405248 (= res!943463 (validKeyInArray!0 (select (arr!46386 a!2901) i!1037)))))

(assert (= (and start!120770 res!943464) b!1405244))

(assert (= (and b!1405244 res!943465) b!1405248))

(assert (= (and b!1405248 res!943463) b!1405243))

(assert (= (and b!1405243 res!943460) b!1405242))

(assert (= (and b!1405242 res!943461) b!1405246))

(assert (= (and b!1405246 res!943462) b!1405245))

(assert (= (and b!1405245 res!943459) b!1405247))

(declare-fun m!1293977 () Bool)

(assert (=> b!1405245 m!1293977))

(declare-fun m!1293979 () Bool)

(assert (=> b!1405245 m!1293979))

(assert (=> b!1405245 m!1293977))

(declare-fun m!1293981 () Bool)

(assert (=> b!1405245 m!1293981))

(assert (=> b!1405245 m!1293979))

(assert (=> b!1405245 m!1293977))

(declare-fun m!1293983 () Bool)

(assert (=> b!1405245 m!1293983))

(declare-fun m!1293985 () Bool)

(assert (=> b!1405245 m!1293985))

(assert (=> b!1405247 m!1293977))

(assert (=> b!1405247 m!1293977))

(declare-fun m!1293987 () Bool)

(assert (=> b!1405247 m!1293987))

(declare-fun m!1293989 () Bool)

(assert (=> b!1405248 m!1293989))

(assert (=> b!1405248 m!1293989))

(declare-fun m!1293991 () Bool)

(assert (=> b!1405248 m!1293991))

(declare-fun m!1293993 () Bool)

(assert (=> b!1405246 m!1293993))

(declare-fun m!1293995 () Bool)

(assert (=> start!120770 m!1293995))

(declare-fun m!1293997 () Bool)

(assert (=> start!120770 m!1293997))

(assert (=> b!1405243 m!1293977))

(assert (=> b!1405243 m!1293977))

(declare-fun m!1293999 () Bool)

(assert (=> b!1405243 m!1293999))

(declare-fun m!1294001 () Bool)

(assert (=> b!1405242 m!1294001))

(check-sat (not b!1405242) (not b!1405245) (not b!1405243) (not b!1405247) (not b!1405246) (not start!120770) (not b!1405248))
