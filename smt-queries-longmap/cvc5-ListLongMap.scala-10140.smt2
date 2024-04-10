; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119604 () Bool)

(assert start!119604)

(declare-fun b!1393187 () Bool)

(declare-fun e!788892 () Bool)

(assert (=> b!1393187 (= e!788892 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95286 0))(
  ( (array!95287 (arr!46001 (Array (_ BitVec 32) (_ BitVec 64))) (size!46551 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95286)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10318 0))(
  ( (MissingZero!10318 (index!43643 (_ BitVec 32))) (Found!10318 (index!43644 (_ BitVec 32))) (Intermediate!10318 (undefined!11130 Bool) (index!43645 (_ BitVec 32)) (x!125330 (_ BitVec 32))) (Undefined!10318) (MissingVacant!10318 (index!43646 (_ BitVec 32))) )
))
(declare-fun lt!611897 () SeekEntryResult!10318)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95286 (_ BitVec 32)) SeekEntryResult!10318)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393187 (= lt!611897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46001 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46001 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95287 (store (arr!46001 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46551 a!2901)) mask!2840))))

(declare-fun res!932597 () Bool)

(declare-fun e!788894 () Bool)

(assert (=> start!119604 (=> (not res!932597) (not e!788894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119604 (= res!932597 (validMask!0 mask!2840))))

(assert (=> start!119604 e!788894))

(assert (=> start!119604 true))

(declare-fun array_inv!35029 (array!95286) Bool)

(assert (=> start!119604 (array_inv!35029 a!2901)))

(declare-fun b!1393188 () Bool)

(assert (=> b!1393188 (= e!788894 (not e!788892))))

(declare-fun res!932602 () Bool)

(assert (=> b!1393188 (=> res!932602 e!788892)))

(declare-fun lt!611898 () SeekEntryResult!10318)

(assert (=> b!1393188 (= res!932602 (or (not (is-Intermediate!10318 lt!611898)) (undefined!11130 lt!611898)))))

(declare-fun e!788893 () Bool)

(assert (=> b!1393188 e!788893))

(declare-fun res!932595 () Bool)

(assert (=> b!1393188 (=> (not res!932595) (not e!788893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95286 (_ BitVec 32)) Bool)

(assert (=> b!1393188 (= res!932595 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46640 0))(
  ( (Unit!46641) )
))
(declare-fun lt!611896 () Unit!46640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46640)

(assert (=> b!1393188 (= lt!611896 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393188 (= lt!611898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46001 a!2901) j!112) mask!2840) (select (arr!46001 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393189 () Bool)

(declare-fun res!932601 () Bool)

(assert (=> b!1393189 (=> (not res!932601) (not e!788894))))

(assert (=> b!1393189 (= res!932601 (and (= (size!46551 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46551 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46551 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393190 () Bool)

(declare-fun res!932599 () Bool)

(assert (=> b!1393190 (=> (not res!932599) (not e!788894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393190 (= res!932599 (validKeyInArray!0 (select (arr!46001 a!2901) i!1037)))))

(declare-fun b!1393191 () Bool)

(declare-fun res!932598 () Bool)

(assert (=> b!1393191 (=> (not res!932598) (not e!788894))))

(assert (=> b!1393191 (= res!932598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393192 () Bool)

(declare-fun res!932596 () Bool)

(assert (=> b!1393192 (=> (not res!932596) (not e!788894))))

(declare-datatypes ((List!32520 0))(
  ( (Nil!32517) (Cons!32516 (h!33749 (_ BitVec 64)) (t!47214 List!32520)) )
))
(declare-fun arrayNoDuplicates!0 (array!95286 (_ BitVec 32) List!32520) Bool)

(assert (=> b!1393192 (= res!932596 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32517))))

(declare-fun b!1393193 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95286 (_ BitVec 32)) SeekEntryResult!10318)

(assert (=> b!1393193 (= e!788893 (= (seekEntryOrOpen!0 (select (arr!46001 a!2901) j!112) a!2901 mask!2840) (Found!10318 j!112)))))

(declare-fun b!1393194 () Bool)

(declare-fun res!932600 () Bool)

(assert (=> b!1393194 (=> (not res!932600) (not e!788894))))

(assert (=> b!1393194 (= res!932600 (validKeyInArray!0 (select (arr!46001 a!2901) j!112)))))

(assert (= (and start!119604 res!932597) b!1393189))

(assert (= (and b!1393189 res!932601) b!1393190))

(assert (= (and b!1393190 res!932599) b!1393194))

(assert (= (and b!1393194 res!932600) b!1393191))

(assert (= (and b!1393191 res!932598) b!1393192))

(assert (= (and b!1393192 res!932596) b!1393188))

(assert (= (and b!1393188 res!932595) b!1393193))

(assert (= (and b!1393188 (not res!932602)) b!1393187))

(declare-fun m!1278993 () Bool)

(assert (=> b!1393194 m!1278993))

(assert (=> b!1393194 m!1278993))

(declare-fun m!1278995 () Bool)

(assert (=> b!1393194 m!1278995))

(assert (=> b!1393193 m!1278993))

(assert (=> b!1393193 m!1278993))

(declare-fun m!1278997 () Bool)

(assert (=> b!1393193 m!1278997))

(declare-fun m!1278999 () Bool)

(assert (=> b!1393187 m!1278999))

(declare-fun m!1279001 () Bool)

(assert (=> b!1393187 m!1279001))

(assert (=> b!1393187 m!1279001))

(declare-fun m!1279003 () Bool)

(assert (=> b!1393187 m!1279003))

(assert (=> b!1393187 m!1279003))

(assert (=> b!1393187 m!1279001))

(declare-fun m!1279005 () Bool)

(assert (=> b!1393187 m!1279005))

(declare-fun m!1279007 () Bool)

(assert (=> b!1393191 m!1279007))

(assert (=> b!1393188 m!1278993))

(declare-fun m!1279009 () Bool)

(assert (=> b!1393188 m!1279009))

(assert (=> b!1393188 m!1278993))

(declare-fun m!1279011 () Bool)

(assert (=> b!1393188 m!1279011))

(assert (=> b!1393188 m!1279009))

(assert (=> b!1393188 m!1278993))

(declare-fun m!1279013 () Bool)

(assert (=> b!1393188 m!1279013))

(declare-fun m!1279015 () Bool)

(assert (=> b!1393188 m!1279015))

(declare-fun m!1279017 () Bool)

(assert (=> b!1393190 m!1279017))

(assert (=> b!1393190 m!1279017))

(declare-fun m!1279019 () Bool)

(assert (=> b!1393190 m!1279019))

(declare-fun m!1279021 () Bool)

(assert (=> start!119604 m!1279021))

(declare-fun m!1279023 () Bool)

(assert (=> start!119604 m!1279023))

(declare-fun m!1279025 () Bool)

(assert (=> b!1393192 m!1279025))

(push 1)

(assert (not b!1393191))

(assert (not b!1393193))

(assert (not b!1393188))

(assert (not b!1393192))

(assert (not b!1393187))

(assert (not start!119604))

(assert (not b!1393190))

(assert (not b!1393194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

