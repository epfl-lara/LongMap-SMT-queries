; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125496 () Bool)

(assert start!125496)

(declare-fun b!1468210 () Bool)

(declare-fun e!824505 () Bool)

(assert (=> b!1468210 (= e!824505 false)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98944 0))(
  ( (array!98945 (arr!47760 (Array (_ BitVec 32) (_ BitVec 64))) (size!48310 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98944)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12000 0))(
  ( (MissingZero!12000 (index!50392 (_ BitVec 32))) (Found!12000 (index!50393 (_ BitVec 32))) (Intermediate!12000 (undefined!12812 Bool) (index!50394 (_ BitVec 32)) (x!131985 (_ BitVec 32))) (Undefined!12000) (MissingVacant!12000 (index!50395 (_ BitVec 32))) )
))
(declare-fun lt!642240 () SeekEntryResult!12000)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98944 (_ BitVec 32)) SeekEntryResult!12000)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468210 (= lt!642240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47760 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47760 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98945 (store (arr!47760 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48310 a!2862)) mask!2687))))

(declare-fun b!1468211 () Bool)

(declare-fun res!996751 () Bool)

(declare-fun e!824506 () Bool)

(assert (=> b!1468211 (=> (not res!996751) (not e!824506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468211 (= res!996751 (validKeyInArray!0 (select (arr!47760 a!2862) i!1006)))))

(declare-fun res!996753 () Bool)

(assert (=> start!125496 (=> (not res!996753) (not e!824506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125496 (= res!996753 (validMask!0 mask!2687))))

(assert (=> start!125496 e!824506))

(assert (=> start!125496 true))

(declare-fun array_inv!36788 (array!98944) Bool)

(assert (=> start!125496 (array_inv!36788 a!2862)))

(declare-fun b!1468212 () Bool)

(declare-fun res!996749 () Bool)

(assert (=> b!1468212 (=> (not res!996749) (not e!824506))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468212 (= res!996749 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48310 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48310 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48310 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47760 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468213 () Bool)

(declare-fun res!996750 () Bool)

(assert (=> b!1468213 (=> (not res!996750) (not e!824506))))

(assert (=> b!1468213 (= res!996750 (validKeyInArray!0 (select (arr!47760 a!2862) j!93)))))

(declare-fun b!1468214 () Bool)

(assert (=> b!1468214 (= e!824506 e!824505)))

(declare-fun res!996755 () Bool)

(assert (=> b!1468214 (=> (not res!996755) (not e!824505))))

(declare-fun lt!642239 () SeekEntryResult!12000)

(assert (=> b!1468214 (= res!996755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47760 a!2862) j!93) mask!2687) (select (arr!47760 a!2862) j!93) a!2862 mask!2687) lt!642239))))

(assert (=> b!1468214 (= lt!642239 (Intermediate!12000 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468215 () Bool)

(declare-fun res!996754 () Bool)

(assert (=> b!1468215 (=> (not res!996754) (not e!824506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98944 (_ BitVec 32)) Bool)

(assert (=> b!1468215 (= res!996754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468216 () Bool)

(declare-fun res!996757 () Bool)

(assert (=> b!1468216 (=> (not res!996757) (not e!824506))))

(declare-datatypes ((List!34261 0))(
  ( (Nil!34258) (Cons!34257 (h!35607 (_ BitVec 64)) (t!48955 List!34261)) )
))
(declare-fun arrayNoDuplicates!0 (array!98944 (_ BitVec 32) List!34261) Bool)

(assert (=> b!1468216 (= res!996757 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34258))))

(declare-fun b!1468217 () Bool)

(declare-fun res!996752 () Bool)

(assert (=> b!1468217 (=> (not res!996752) (not e!824506))))

(assert (=> b!1468217 (= res!996752 (and (= (size!48310 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48310 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48310 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468218 () Bool)

(declare-fun res!996756 () Bool)

(assert (=> b!1468218 (=> (not res!996756) (not e!824505))))

(assert (=> b!1468218 (= res!996756 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47760 a!2862) j!93) a!2862 mask!2687) lt!642239))))

(assert (= (and start!125496 res!996753) b!1468217))

(assert (= (and b!1468217 res!996752) b!1468211))

(assert (= (and b!1468211 res!996751) b!1468213))

(assert (= (and b!1468213 res!996750) b!1468215))

(assert (= (and b!1468215 res!996754) b!1468216))

(assert (= (and b!1468216 res!996757) b!1468212))

(assert (= (and b!1468212 res!996749) b!1468214))

(assert (= (and b!1468214 res!996755) b!1468218))

(assert (= (and b!1468218 res!996756) b!1468210))

(declare-fun m!1355229 () Bool)

(assert (=> b!1468212 m!1355229))

(declare-fun m!1355231 () Bool)

(assert (=> b!1468212 m!1355231))

(declare-fun m!1355233 () Bool)

(assert (=> b!1468211 m!1355233))

(assert (=> b!1468211 m!1355233))

(declare-fun m!1355235 () Bool)

(assert (=> b!1468211 m!1355235))

(declare-fun m!1355237 () Bool)

(assert (=> b!1468216 m!1355237))

(assert (=> b!1468210 m!1355229))

(declare-fun m!1355239 () Bool)

(assert (=> b!1468210 m!1355239))

(assert (=> b!1468210 m!1355239))

(declare-fun m!1355241 () Bool)

(assert (=> b!1468210 m!1355241))

(assert (=> b!1468210 m!1355241))

(assert (=> b!1468210 m!1355239))

(declare-fun m!1355243 () Bool)

(assert (=> b!1468210 m!1355243))

(declare-fun m!1355245 () Bool)

(assert (=> b!1468213 m!1355245))

(assert (=> b!1468213 m!1355245))

(declare-fun m!1355247 () Bool)

(assert (=> b!1468213 m!1355247))

(assert (=> b!1468214 m!1355245))

(assert (=> b!1468214 m!1355245))

(declare-fun m!1355249 () Bool)

(assert (=> b!1468214 m!1355249))

(assert (=> b!1468214 m!1355249))

(assert (=> b!1468214 m!1355245))

(declare-fun m!1355251 () Bool)

(assert (=> b!1468214 m!1355251))

(declare-fun m!1355253 () Bool)

(assert (=> start!125496 m!1355253))

(declare-fun m!1355255 () Bool)

(assert (=> start!125496 m!1355255))

(declare-fun m!1355257 () Bool)

(assert (=> b!1468215 m!1355257))

(assert (=> b!1468218 m!1355245))

(assert (=> b!1468218 m!1355245))

(declare-fun m!1355259 () Bool)

(assert (=> b!1468218 m!1355259))

(check-sat (not b!1468210) (not b!1468213) (not b!1468211) (not b!1468218) (not start!125496) (not b!1468215) (not b!1468216) (not b!1468214))
(check-sat)
