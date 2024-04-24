; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127614 () Bool)

(assert start!127614)

(declare-fun b!1497988 () Bool)

(declare-fun res!1018259 () Bool)

(declare-fun e!839150 () Bool)

(assert (=> b!1497988 (=> (not res!1018259) (not e!839150))))

(declare-fun e!839145 () Bool)

(assert (=> b!1497988 (= res!1018259 e!839145)))

(declare-fun c!139410 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1497988 (= c!139410 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1018262 () Bool)

(declare-fun e!839149 () Bool)

(assert (=> start!127614 (=> (not res!1018262) (not e!839149))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127614 (= res!1018262 (validMask!0 mask!2687))))

(assert (=> start!127614 e!839149))

(assert (=> start!127614 true))

(declare-datatypes ((array!99915 0))(
  ( (array!99916 (arr!48217 (Array (_ BitVec 32) (_ BitVec 64))) (size!48768 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99915)

(declare-fun array_inv!37498 (array!99915) Bool)

(assert (=> start!127614 (array_inv!37498 a!2862)))

(declare-fun b!1497989 () Bool)

(declare-fun res!1018272 () Bool)

(assert (=> b!1497989 (=> (not res!1018272) (not e!839149))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1497989 (= res!1018272 (and (= (size!48768 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48768 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48768 a!2862)) (not (= i!1006 j!93))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1497990 () Bool)

(declare-fun e!839142 () Bool)

(assert (=> b!1497990 (= e!839142 (or (= (select (arr!48217 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48217 a!2862) intermediateBeforeIndex!19) (select (arr!48217 a!2862) j!93))))))

(declare-fun b!1497991 () Bool)

(declare-fun res!1018264 () Bool)

(assert (=> b!1497991 (=> (not res!1018264) (not e!839149))))

(declare-datatypes ((List!34705 0))(
  ( (Nil!34702) (Cons!34701 (h!36113 (_ BitVec 64)) (t!49391 List!34705)) )
))
(declare-fun arrayNoDuplicates!0 (array!99915 (_ BitVec 32) List!34705) Bool)

(assert (=> b!1497991 (= res!1018264 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34702))))

(declare-fun b!1497992 () Bool)

(declare-fun e!839146 () Bool)

(assert (=> b!1497992 (= e!839149 e!839146)))

(declare-fun res!1018266 () Bool)

(assert (=> b!1497992 (=> (not res!1018266) (not e!839146))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1497992 (= res!1018266 (= (select (store (arr!48217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!652692 () array!99915)

(assert (=> b!1497992 (= lt!652692 (array!99916 (store (arr!48217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48768 a!2862)))))

(declare-fun b!1497993 () Bool)

(declare-fun e!839143 () Bool)

(assert (=> b!1497993 (= e!839146 e!839143)))

(declare-fun res!1018271 () Bool)

(assert (=> b!1497993 (=> (not res!1018271) (not e!839143))))

(declare-datatypes ((SeekEntryResult!12354 0))(
  ( (MissingZero!12354 (index!51808 (_ BitVec 32))) (Found!12354 (index!51809 (_ BitVec 32))) (Intermediate!12354 (undefined!13166 Bool) (index!51810 (_ BitVec 32)) (x!133622 (_ BitVec 32))) (Undefined!12354) (MissingVacant!12354 (index!51811 (_ BitVec 32))) )
))
(declare-fun lt!652693 () SeekEntryResult!12354)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99915 (_ BitVec 32)) SeekEntryResult!12354)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497993 (= res!1018271 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48217 a!2862) j!93) mask!2687) (select (arr!48217 a!2862) j!93) a!2862 mask!2687) lt!652693))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497993 (= lt!652693 (Intermediate!12354 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497994 () Bool)

(declare-fun res!1018257 () Bool)

(assert (=> b!1497994 (=> (not res!1018257) (not e!839149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497994 (= res!1018257 (validKeyInArray!0 (select (arr!48217 a!2862) i!1006)))))

(declare-fun b!1497995 () Bool)

(declare-fun e!839148 () Bool)

(assert (=> b!1497995 (= e!839148 true)))

(declare-fun lt!652689 () Bool)

(declare-fun e!839151 () Bool)

(assert (=> b!1497995 (= lt!652689 e!839151)))

(declare-fun c!139411 () Bool)

(assert (=> b!1497995 (= c!139411 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497996 () Bool)

(declare-fun res!1018268 () Bool)

(assert (=> b!1497996 (=> (not res!1018268) (not e!839142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99915 (_ BitVec 32)) SeekEntryResult!12354)

(assert (=> b!1497996 (= res!1018268 (= (seekEntryOrOpen!0 (select (arr!48217 a!2862) j!93) a!2862 mask!2687) (Found!12354 j!93)))))

(declare-fun b!1497997 () Bool)

(declare-fun res!1018267 () Bool)

(assert (=> b!1497997 (=> (not res!1018267) (not e!839149))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1497997 (= res!1018267 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48768 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48768 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48768 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497998 () Bool)

(declare-fun e!839144 () Bool)

(assert (=> b!1497998 (= e!839144 e!839148)))

(declare-fun res!1018270 () Bool)

(assert (=> b!1497998 (=> res!1018270 e!839148)))

(declare-fun lt!652691 () (_ BitVec 32))

(assert (=> b!1497998 (= res!1018270 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652691 #b00000000000000000000000000000000) (bvsge lt!652691 (size!48768 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497998 (= lt!652691 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1497999 () Bool)

(declare-fun lt!652695 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99915 (_ BitVec 32)) SeekEntryResult!12354)

(assert (=> b!1497999 (= e!839151 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652691 intermediateAfterIndex!19 lt!652695 lt!652692 mask!2687) (seekEntryOrOpen!0 lt!652695 lt!652692 mask!2687))))))

(declare-fun b!1498000 () Bool)

(declare-fun res!1018258 () Bool)

(assert (=> b!1498000 (=> (not res!1018258) (not e!839150))))

(assert (=> b!1498000 (= res!1018258 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!652690 () SeekEntryResult!12354)

(declare-fun b!1498001 () Bool)

(assert (=> b!1498001 (= e!839151 (not (= lt!652690 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652691 lt!652695 lt!652692 mask!2687))))))

(declare-fun b!1498002 () Bool)

(assert (=> b!1498002 (= e!839145 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652695 lt!652692 mask!2687) (seekEntryOrOpen!0 lt!652695 lt!652692 mask!2687)))))

(declare-fun b!1498003 () Bool)

(declare-fun res!1018269 () Bool)

(assert (=> b!1498003 (=> res!1018269 e!839148)))

(assert (=> b!1498003 (= res!1018269 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652691 (select (arr!48217 a!2862) j!93) a!2862 mask!2687) lt!652693)))))

(declare-fun b!1498004 () Bool)

(assert (=> b!1498004 (= e!839150 (not e!839144))))

(declare-fun res!1018261 () Bool)

(assert (=> b!1498004 (=> res!1018261 e!839144)))

(assert (=> b!1498004 (= res!1018261 (or (and (= (select (arr!48217 a!2862) index!646) (select (store (arr!48217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48217 a!2862) index!646) (select (arr!48217 a!2862) j!93))) (= (select (arr!48217 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1498004 e!839142))

(declare-fun res!1018274 () Bool)

(assert (=> b!1498004 (=> (not res!1018274) (not e!839142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99915 (_ BitVec 32)) Bool)

(assert (=> b!1498004 (= res!1018274 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50081 0))(
  ( (Unit!50082) )
))
(declare-fun lt!652694 () Unit!50081)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50081)

(assert (=> b!1498004 (= lt!652694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1498005 () Bool)

(assert (=> b!1498005 (= e!839143 e!839150)))

(declare-fun res!1018260 () Bool)

(assert (=> b!1498005 (=> (not res!1018260) (not e!839150))))

(assert (=> b!1498005 (= res!1018260 (= lt!652690 (Intermediate!12354 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1498005 (= lt!652690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652695 mask!2687) lt!652695 lt!652692 mask!2687))))

(assert (=> b!1498005 (= lt!652695 (select (store (arr!48217 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1498006 () Bool)

(declare-fun res!1018265 () Bool)

(assert (=> b!1498006 (=> (not res!1018265) (not e!839149))))

(assert (=> b!1498006 (= res!1018265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1498007 () Bool)

(declare-fun res!1018273 () Bool)

(assert (=> b!1498007 (=> (not res!1018273) (not e!839149))))

(assert (=> b!1498007 (= res!1018273 (validKeyInArray!0 (select (arr!48217 a!2862) j!93)))))

(declare-fun b!1498008 () Bool)

(declare-fun res!1018263 () Bool)

(assert (=> b!1498008 (=> (not res!1018263) (not e!839143))))

(assert (=> b!1498008 (= res!1018263 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48217 a!2862) j!93) a!2862 mask!2687) lt!652693))))

(declare-fun b!1498009 () Bool)

(assert (=> b!1498009 (= e!839145 (= lt!652690 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652695 lt!652692 mask!2687)))))

(assert (= (and start!127614 res!1018262) b!1497989))

(assert (= (and b!1497989 res!1018272) b!1497994))

(assert (= (and b!1497994 res!1018257) b!1498007))

(assert (= (and b!1498007 res!1018273) b!1498006))

(assert (= (and b!1498006 res!1018265) b!1497991))

(assert (= (and b!1497991 res!1018264) b!1497997))

(assert (= (and b!1497997 res!1018267) b!1497992))

(assert (= (and b!1497992 res!1018266) b!1497993))

(assert (= (and b!1497993 res!1018271) b!1498008))

(assert (= (and b!1498008 res!1018263) b!1498005))

(assert (= (and b!1498005 res!1018260) b!1497988))

(assert (= (and b!1497988 c!139410) b!1498009))

(assert (= (and b!1497988 (not c!139410)) b!1498002))

(assert (= (and b!1497988 res!1018259) b!1498000))

(assert (= (and b!1498000 res!1018258) b!1498004))

(assert (= (and b!1498004 res!1018274) b!1497996))

(assert (= (and b!1497996 res!1018268) b!1497990))

(assert (= (and b!1498004 (not res!1018261)) b!1497998))

(assert (= (and b!1497998 (not res!1018270)) b!1498003))

(assert (= (and b!1498003 (not res!1018269)) b!1497995))

(assert (= (and b!1497995 c!139411) b!1498001))

(assert (= (and b!1497995 (not c!139411)) b!1497999))

(declare-fun m!1381209 () Bool)

(assert (=> b!1497998 m!1381209))

(declare-fun m!1381211 () Bool)

(assert (=> b!1497999 m!1381211))

(declare-fun m!1381213 () Bool)

(assert (=> b!1497999 m!1381213))

(declare-fun m!1381215 () Bool)

(assert (=> b!1497992 m!1381215))

(declare-fun m!1381217 () Bool)

(assert (=> b!1497992 m!1381217))

(declare-fun m!1381219 () Bool)

(assert (=> b!1498008 m!1381219))

(assert (=> b!1498008 m!1381219))

(declare-fun m!1381221 () Bool)

(assert (=> b!1498008 m!1381221))

(assert (=> b!1497996 m!1381219))

(assert (=> b!1497996 m!1381219))

(declare-fun m!1381223 () Bool)

(assert (=> b!1497996 m!1381223))

(assert (=> b!1498003 m!1381219))

(assert (=> b!1498003 m!1381219))

(declare-fun m!1381225 () Bool)

(assert (=> b!1498003 m!1381225))

(assert (=> b!1497993 m!1381219))

(assert (=> b!1497993 m!1381219))

(declare-fun m!1381227 () Bool)

(assert (=> b!1497993 m!1381227))

(assert (=> b!1497993 m!1381227))

(assert (=> b!1497993 m!1381219))

(declare-fun m!1381229 () Bool)

(assert (=> b!1497993 m!1381229))

(declare-fun m!1381231 () Bool)

(assert (=> start!127614 m!1381231))

(declare-fun m!1381233 () Bool)

(assert (=> start!127614 m!1381233))

(assert (=> b!1498007 m!1381219))

(assert (=> b!1498007 m!1381219))

(declare-fun m!1381235 () Bool)

(assert (=> b!1498007 m!1381235))

(declare-fun m!1381237 () Bool)

(assert (=> b!1497991 m!1381237))

(declare-fun m!1381239 () Bool)

(assert (=> b!1498009 m!1381239))

(declare-fun m!1381241 () Bool)

(assert (=> b!1498006 m!1381241))

(declare-fun m!1381243 () Bool)

(assert (=> b!1497990 m!1381243))

(assert (=> b!1497990 m!1381219))

(declare-fun m!1381245 () Bool)

(assert (=> b!1498005 m!1381245))

(assert (=> b!1498005 m!1381245))

(declare-fun m!1381247 () Bool)

(assert (=> b!1498005 m!1381247))

(assert (=> b!1498005 m!1381215))

(declare-fun m!1381249 () Bool)

(assert (=> b!1498005 m!1381249))

(declare-fun m!1381251 () Bool)

(assert (=> b!1497994 m!1381251))

(assert (=> b!1497994 m!1381251))

(declare-fun m!1381253 () Bool)

(assert (=> b!1497994 m!1381253))

(declare-fun m!1381255 () Bool)

(assert (=> b!1498004 m!1381255))

(assert (=> b!1498004 m!1381215))

(declare-fun m!1381257 () Bool)

(assert (=> b!1498004 m!1381257))

(declare-fun m!1381259 () Bool)

(assert (=> b!1498004 m!1381259))

(declare-fun m!1381261 () Bool)

(assert (=> b!1498004 m!1381261))

(assert (=> b!1498004 m!1381219))

(declare-fun m!1381263 () Bool)

(assert (=> b!1498001 m!1381263))

(declare-fun m!1381265 () Bool)

(assert (=> b!1498002 m!1381265))

(assert (=> b!1498002 m!1381213))

(check-sat (not b!1497994) (not start!127614) (not b!1497998) (not b!1498006) (not b!1498003) (not b!1498007) (not b!1497996) (not b!1497999) (not b!1498005) (not b!1498008) (not b!1498004) (not b!1498009) (not b!1498001) (not b!1497993) (not b!1497991) (not b!1498002))
(check-sat)
