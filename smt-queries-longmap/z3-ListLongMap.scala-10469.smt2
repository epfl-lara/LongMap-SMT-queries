; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123326 () Bool)

(assert start!123326)

(declare-fun e!807136 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97460 0))(
  ( (array!97461 (arr!47041 (Array (_ BitVec 32) (_ BitVec 64))) (size!47592 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97460)

(declare-fun b!1428837 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11222 0))(
  ( (MissingZero!11222 (index!47280 (_ BitVec 32))) (Found!11222 (index!47281 (_ BitVec 32))) (Intermediate!11222 (undefined!12034 Bool) (index!47282 (_ BitVec 32)) (x!129077 (_ BitVec 32))) (Undefined!11222) (MissingVacant!11222 (index!47283 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97460 (_ BitVec 32)) SeekEntryResult!11222)

(assert (=> b!1428837 (= e!807136 (= (seekEntryOrOpen!0 (select (arr!47041 a!2831) j!81) a!2831 mask!2608) (Found!11222 j!81)))))

(declare-fun b!1428838 () Bool)

(declare-fun res!962990 () Bool)

(declare-fun e!807138 () Bool)

(assert (=> b!1428838 (=> (not res!962990) (not e!807138))))

(declare-fun lt!629080 () SeekEntryResult!11222)

(declare-fun lt!629083 () (_ BitVec 64))

(declare-fun lt!629081 () array!97460)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97460 (_ BitVec 32)) SeekEntryResult!11222)

(assert (=> b!1428838 (= res!962990 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629083 lt!629081 mask!2608) lt!629080))))

(declare-fun b!1428839 () Bool)

(declare-fun e!807140 () Bool)

(assert (=> b!1428839 (= e!807140 e!807138)))

(declare-fun res!962991 () Bool)

(assert (=> b!1428839 (=> (not res!962991) (not e!807138))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428839 (= res!962991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629083 mask!2608) lt!629083 lt!629081 mask!2608) lt!629080))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428839 (= lt!629080 (Intermediate!11222 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428839 (= lt!629083 (select (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428839 (= lt!629081 (array!97461 (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47592 a!2831)))))

(declare-fun b!1428840 () Bool)

(declare-fun res!962984 () Bool)

(declare-fun e!807139 () Bool)

(assert (=> b!1428840 (=> (not res!962984) (not e!807139))))

(declare-datatypes ((List!33538 0))(
  ( (Nil!33535) (Cons!33534 (h!34853 (_ BitVec 64)) (t!48224 List!33538)) )
))
(declare-fun arrayNoDuplicates!0 (array!97460 (_ BitVec 32) List!33538) Bool)

(assert (=> b!1428840 (= res!962984 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33535))))

(declare-fun b!1428841 () Bool)

(declare-fun res!962983 () Bool)

(assert (=> b!1428841 (=> (not res!962983) (not e!807139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97460 (_ BitVec 32)) Bool)

(assert (=> b!1428841 (= res!962983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428842 () Bool)

(assert (=> b!1428842 (= e!807138 (not true))))

(assert (=> b!1428842 e!807136))

(declare-fun res!962994 () Bool)

(assert (=> b!1428842 (=> (not res!962994) (not e!807136))))

(assert (=> b!1428842 (= res!962994 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48221 0))(
  ( (Unit!48222) )
))
(declare-fun lt!629084 () Unit!48221)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48221)

(assert (=> b!1428842 (= lt!629084 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428843 () Bool)

(declare-fun res!962989 () Bool)

(assert (=> b!1428843 (=> (not res!962989) (not e!807139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428843 (= res!962989 (validKeyInArray!0 (select (arr!47041 a!2831) i!982)))))

(declare-fun b!1428844 () Bool)

(declare-fun res!962988 () Bool)

(assert (=> b!1428844 (=> (not res!962988) (not e!807138))))

(declare-fun lt!629082 () SeekEntryResult!11222)

(assert (=> b!1428844 (= res!962988 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47041 a!2831) j!81) a!2831 mask!2608) lt!629082))))

(declare-fun b!1428845 () Bool)

(declare-fun res!962987 () Bool)

(assert (=> b!1428845 (=> (not res!962987) (not e!807138))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1428845 (= res!962987 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428846 () Bool)

(declare-fun res!962993 () Bool)

(assert (=> b!1428846 (=> (not res!962993) (not e!807139))))

(assert (=> b!1428846 (= res!962993 (and (= (size!47592 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47592 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47592 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!962985 () Bool)

(assert (=> start!123326 (=> (not res!962985) (not e!807139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123326 (= res!962985 (validMask!0 mask!2608))))

(assert (=> start!123326 e!807139))

(assert (=> start!123326 true))

(declare-fun array_inv!36322 (array!97460) Bool)

(assert (=> start!123326 (array_inv!36322 a!2831)))

(declare-fun b!1428847 () Bool)

(declare-fun res!962986 () Bool)

(assert (=> b!1428847 (=> (not res!962986) (not e!807139))))

(assert (=> b!1428847 (= res!962986 (validKeyInArray!0 (select (arr!47041 a!2831) j!81)))))

(declare-fun b!1428848 () Bool)

(assert (=> b!1428848 (= e!807139 e!807140)))

(declare-fun res!962992 () Bool)

(assert (=> b!1428848 (=> (not res!962992) (not e!807140))))

(assert (=> b!1428848 (= res!962992 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47041 a!2831) j!81) mask!2608) (select (arr!47041 a!2831) j!81) a!2831 mask!2608) lt!629082))))

(assert (=> b!1428848 (= lt!629082 (Intermediate!11222 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428849 () Bool)

(declare-fun res!962995 () Bool)

(assert (=> b!1428849 (=> (not res!962995) (not e!807139))))

(assert (=> b!1428849 (= res!962995 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47592 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47592 a!2831))))))

(assert (= (and start!123326 res!962985) b!1428846))

(assert (= (and b!1428846 res!962993) b!1428843))

(assert (= (and b!1428843 res!962989) b!1428847))

(assert (= (and b!1428847 res!962986) b!1428841))

(assert (= (and b!1428841 res!962983) b!1428840))

(assert (= (and b!1428840 res!962984) b!1428849))

(assert (= (and b!1428849 res!962995) b!1428848))

(assert (= (and b!1428848 res!962992) b!1428839))

(assert (= (and b!1428839 res!962991) b!1428844))

(assert (= (and b!1428844 res!962988) b!1428838))

(assert (= (and b!1428838 res!962990) b!1428845))

(assert (= (and b!1428845 res!962987) b!1428842))

(assert (= (and b!1428842 res!962994) b!1428837))

(declare-fun m!1319325 () Bool)

(assert (=> b!1428843 m!1319325))

(assert (=> b!1428843 m!1319325))

(declare-fun m!1319327 () Bool)

(assert (=> b!1428843 m!1319327))

(declare-fun m!1319329 () Bool)

(assert (=> b!1428847 m!1319329))

(assert (=> b!1428847 m!1319329))

(declare-fun m!1319331 () Bool)

(assert (=> b!1428847 m!1319331))

(assert (=> b!1428844 m!1319329))

(assert (=> b!1428844 m!1319329))

(declare-fun m!1319333 () Bool)

(assert (=> b!1428844 m!1319333))

(assert (=> b!1428848 m!1319329))

(assert (=> b!1428848 m!1319329))

(declare-fun m!1319335 () Bool)

(assert (=> b!1428848 m!1319335))

(assert (=> b!1428848 m!1319335))

(assert (=> b!1428848 m!1319329))

(declare-fun m!1319337 () Bool)

(assert (=> b!1428848 m!1319337))

(declare-fun m!1319339 () Bool)

(assert (=> b!1428839 m!1319339))

(assert (=> b!1428839 m!1319339))

(declare-fun m!1319341 () Bool)

(assert (=> b!1428839 m!1319341))

(declare-fun m!1319343 () Bool)

(assert (=> b!1428839 m!1319343))

(declare-fun m!1319345 () Bool)

(assert (=> b!1428839 m!1319345))

(declare-fun m!1319347 () Bool)

(assert (=> b!1428838 m!1319347))

(declare-fun m!1319349 () Bool)

(assert (=> b!1428842 m!1319349))

(declare-fun m!1319351 () Bool)

(assert (=> b!1428842 m!1319351))

(declare-fun m!1319353 () Bool)

(assert (=> b!1428840 m!1319353))

(declare-fun m!1319355 () Bool)

(assert (=> b!1428841 m!1319355))

(declare-fun m!1319357 () Bool)

(assert (=> start!123326 m!1319357))

(declare-fun m!1319359 () Bool)

(assert (=> start!123326 m!1319359))

(assert (=> b!1428837 m!1319329))

(assert (=> b!1428837 m!1319329))

(declare-fun m!1319361 () Bool)

(assert (=> b!1428837 m!1319361))

(check-sat (not b!1428837) (not b!1428848) (not b!1428838) (not b!1428843) (not b!1428839) (not start!123326) (not b!1428847) (not b!1428840) (not b!1428842) (not b!1428841) (not b!1428844))
(check-sat)
