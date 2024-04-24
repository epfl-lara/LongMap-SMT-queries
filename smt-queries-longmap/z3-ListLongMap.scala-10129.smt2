; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119618 () Bool)

(assert start!119618)

(declare-fun b!1393026 () Bool)

(declare-fun res!932062 () Bool)

(declare-fun e!788923 () Bool)

(assert (=> b!1393026 (=> (not res!932062) (not e!788923))))

(declare-datatypes ((array!95324 0))(
  ( (array!95325 (arr!46021 (Array (_ BitVec 32) (_ BitVec 64))) (size!46572 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95324)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393026 (= res!932062 (validKeyInArray!0 (select (arr!46021 a!2901) j!112)))))

(declare-fun b!1393027 () Bool)

(declare-fun res!932067 () Bool)

(assert (=> b!1393027 (=> (not res!932067) (not e!788923))))

(declare-datatypes ((List!32527 0))(
  ( (Nil!32524) (Cons!32523 (h!33758 (_ BitVec 64)) (t!47213 List!32527)) )
))
(declare-fun arrayNoDuplicates!0 (array!95324 (_ BitVec 32) List!32527) Bool)

(assert (=> b!1393027 (= res!932067 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32524))))

(declare-fun b!1393028 () Bool)

(declare-fun e!788924 () Bool)

(assert (=> b!1393028 (= e!788923 (not e!788924))))

(declare-fun res!932061 () Bool)

(assert (=> b!1393028 (=> res!932061 e!788924)))

(declare-datatypes ((SeekEntryResult!10241 0))(
  ( (MissingZero!10241 (index!43335 (_ BitVec 32))) (Found!10241 (index!43336 (_ BitVec 32))) (Intermediate!10241 (undefined!11053 Bool) (index!43337 (_ BitVec 32)) (x!125172 (_ BitVec 32))) (Undefined!10241) (MissingVacant!10241 (index!43338 (_ BitVec 32))) )
))
(declare-fun lt!611783 () SeekEntryResult!10241)

(get-info :version)

(assert (=> b!1393028 (= res!932061 (or (not ((_ is Intermediate!10241) lt!611783)) (undefined!11053 lt!611783)))))

(declare-fun e!788922 () Bool)

(assert (=> b!1393028 e!788922))

(declare-fun res!932063 () Bool)

(assert (=> b!1393028 (=> (not res!932063) (not e!788922))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95324 (_ BitVec 32)) Bool)

(assert (=> b!1393028 (= res!932063 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46513 0))(
  ( (Unit!46514) )
))
(declare-fun lt!611781 () Unit!46513)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46513)

(assert (=> b!1393028 (= lt!611781 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95324 (_ BitVec 32)) SeekEntryResult!10241)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393028 (= lt!611783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46021 a!2901) j!112) mask!2840) (select (arr!46021 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393029 () Bool)

(assert (=> b!1393029 (= e!788924 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!611782 () (_ BitVec 32))

(assert (=> b!1393029 (= lt!611782 (toIndex!0 (select (store (arr!46021 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1393030 () Bool)

(declare-fun res!932065 () Bool)

(assert (=> b!1393030 (=> (not res!932065) (not e!788923))))

(assert (=> b!1393030 (= res!932065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393031 () Bool)

(declare-fun res!932064 () Bool)

(assert (=> b!1393031 (=> (not res!932064) (not e!788923))))

(assert (=> b!1393031 (= res!932064 (validKeyInArray!0 (select (arr!46021 a!2901) i!1037)))))

(declare-fun b!1393032 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95324 (_ BitVec 32)) SeekEntryResult!10241)

(assert (=> b!1393032 (= e!788922 (= (seekEntryOrOpen!0 (select (arr!46021 a!2901) j!112) a!2901 mask!2840) (Found!10241 j!112)))))

(declare-fun res!932068 () Bool)

(assert (=> start!119618 (=> (not res!932068) (not e!788923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119618 (= res!932068 (validMask!0 mask!2840))))

(assert (=> start!119618 e!788923))

(assert (=> start!119618 true))

(declare-fun array_inv!35302 (array!95324) Bool)

(assert (=> start!119618 (array_inv!35302 a!2901)))

(declare-fun b!1393025 () Bool)

(declare-fun res!932066 () Bool)

(assert (=> b!1393025 (=> (not res!932066) (not e!788923))))

(assert (=> b!1393025 (= res!932066 (and (= (size!46572 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46572 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46572 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119618 res!932068) b!1393025))

(assert (= (and b!1393025 res!932066) b!1393031))

(assert (= (and b!1393031 res!932064) b!1393026))

(assert (= (and b!1393026 res!932062) b!1393030))

(assert (= (and b!1393030 res!932065) b!1393027))

(assert (= (and b!1393027 res!932067) b!1393028))

(assert (= (and b!1393028 res!932063) b!1393032))

(assert (= (and b!1393028 (not res!932061)) b!1393029))

(declare-fun m!1278991 () Bool)

(assert (=> b!1393028 m!1278991))

(declare-fun m!1278993 () Bool)

(assert (=> b!1393028 m!1278993))

(assert (=> b!1393028 m!1278991))

(declare-fun m!1278995 () Bool)

(assert (=> b!1393028 m!1278995))

(assert (=> b!1393028 m!1278993))

(assert (=> b!1393028 m!1278991))

(declare-fun m!1278997 () Bool)

(assert (=> b!1393028 m!1278997))

(declare-fun m!1278999 () Bool)

(assert (=> b!1393028 m!1278999))

(assert (=> b!1393032 m!1278991))

(assert (=> b!1393032 m!1278991))

(declare-fun m!1279001 () Bool)

(assert (=> b!1393032 m!1279001))

(declare-fun m!1279003 () Bool)

(assert (=> start!119618 m!1279003))

(declare-fun m!1279005 () Bool)

(assert (=> start!119618 m!1279005))

(declare-fun m!1279007 () Bool)

(assert (=> b!1393030 m!1279007))

(declare-fun m!1279009 () Bool)

(assert (=> b!1393029 m!1279009))

(declare-fun m!1279011 () Bool)

(assert (=> b!1393029 m!1279011))

(assert (=> b!1393029 m!1279011))

(declare-fun m!1279013 () Bool)

(assert (=> b!1393029 m!1279013))

(assert (=> b!1393026 m!1278991))

(assert (=> b!1393026 m!1278991))

(declare-fun m!1279015 () Bool)

(assert (=> b!1393026 m!1279015))

(declare-fun m!1279017 () Bool)

(assert (=> b!1393027 m!1279017))

(declare-fun m!1279019 () Bool)

(assert (=> b!1393031 m!1279019))

(assert (=> b!1393031 m!1279019))

(declare-fun m!1279021 () Bool)

(assert (=> b!1393031 m!1279021))

(check-sat (not b!1393028) (not b!1393031) (not b!1393027) (not b!1393026) (not start!119618) (not b!1393032) (not b!1393030) (not b!1393029))
(check-sat)
