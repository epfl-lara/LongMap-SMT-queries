; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125370 () Bool)

(assert start!125370)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98713 0))(
  ( (array!98714 (arr!47641 (Array (_ BitVec 32) (_ BitVec 64))) (size!48192 (_ BitVec 32))) )
))
(declare-fun lt!639603 () array!98713)

(declare-fun e!821284 () Bool)

(declare-datatypes ((SeekEntryResult!11790 0))(
  ( (MissingZero!11790 (index!49552 (_ BitVec 32))) (Found!11790 (index!49553 (_ BitVec 32))) (Intermediate!11790 (undefined!12602 Bool) (index!49554 (_ BitVec 32)) (x!131343 (_ BitVec 32))) (Undefined!11790) (MissingVacant!11790 (index!49555 (_ BitVec 32))) )
))
(declare-fun lt!639604 () SeekEntryResult!11790)

(declare-fun lt!639605 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1459987 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98713 (_ BitVec 32)) SeekEntryResult!11790)

(assert (=> b!1459987 (= e!821284 (= lt!639604 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639605 lt!639603 mask!2687)))))

(declare-fun b!1459988 () Bool)

(declare-fun e!821283 () Bool)

(declare-fun e!821280 () Bool)

(assert (=> b!1459988 (= e!821283 e!821280)))

(declare-fun res!989252 () Bool)

(assert (=> b!1459988 (=> (not res!989252) (not e!821280))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459988 (= res!989252 (= lt!639604 (Intermediate!11790 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459988 (= lt!639604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639605 mask!2687) lt!639605 lt!639603 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98713)

(assert (=> b!1459988 (= lt!639605 (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun lt!639607 () (_ BitVec 32))

(declare-fun e!821282 () Bool)

(declare-fun b!1459989 () Bool)

(assert (=> b!1459989 (= e!821282 (not (= lt!639604 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639607 lt!639605 lt!639603 mask!2687))))))

(declare-fun b!1459990 () Bool)

(declare-fun res!989247 () Bool)

(assert (=> b!1459990 (=> (not res!989247) (not e!821280))))

(assert (=> b!1459990 (= res!989247 e!821284)))

(declare-fun c!134893 () Bool)

(assert (=> b!1459990 (= c!134893 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459991 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98713 (_ BitVec 32)) SeekEntryResult!11790)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98713 (_ BitVec 32)) SeekEntryResult!11790)

(assert (=> b!1459991 (= e!821284 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639605 lt!639603 mask!2687) (seekEntryOrOpen!0 lt!639605 lt!639603 mask!2687)))))

(declare-fun b!1459992 () Bool)

(declare-fun res!989256 () Bool)

(declare-fun e!821278 () Bool)

(assert (=> b!1459992 (=> (not res!989256) (not e!821278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98713 (_ BitVec 32)) Bool)

(assert (=> b!1459992 (= res!989256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459993 () Bool)

(declare-fun e!821279 () Bool)

(assert (=> b!1459993 (= e!821278 e!821279)))

(declare-fun res!989248 () Bool)

(assert (=> b!1459993 (=> (not res!989248) (not e!821279))))

(assert (=> b!1459993 (= res!989248 (= (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459993 (= lt!639603 (array!98714 (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48192 a!2862)))))

(declare-fun lt!639610 () SeekEntryResult!11790)

(declare-fun b!1459994 () Bool)

(assert (=> b!1459994 (= e!821282 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639607 intermediateAfterIndex!19 lt!639605 lt!639603 mask!2687) lt!639610)))))

(declare-fun b!1459995 () Bool)

(declare-fun e!821286 () Bool)

(assert (=> b!1459995 (= e!821286 true)))

(declare-fun lt!639609 () SeekEntryResult!11790)

(assert (=> b!1459995 (= lt!639609 lt!639610)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49109 0))(
  ( (Unit!49110) )
))
(declare-fun lt!639606 () Unit!49109)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49109)

(assert (=> b!1459995 (= lt!639606 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639607 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun res!989249 () Bool)

(assert (=> start!125370 (=> (not res!989249) (not e!821278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125370 (= res!989249 (validMask!0 mask!2687))))

(assert (=> start!125370 e!821278))

(assert (=> start!125370 true))

(declare-fun array_inv!36922 (array!98713) Bool)

(assert (=> start!125370 (array_inv!36922 a!2862)))

(declare-fun b!1459996 () Bool)

(declare-fun res!989258 () Bool)

(assert (=> b!1459996 (=> res!989258 e!821286)))

(assert (=> b!1459996 (= res!989258 e!821282)))

(declare-fun c!134892 () Bool)

(assert (=> b!1459996 (= c!134892 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459997 () Bool)

(declare-fun e!821281 () Bool)

(assert (=> b!1459997 (= e!821281 e!821286)))

(declare-fun res!989253 () Bool)

(assert (=> b!1459997 (=> res!989253 e!821286)))

(assert (=> b!1459997 (= res!989253 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639607 #b00000000000000000000000000000000) (bvsge lt!639607 (size!48192 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459997 (= lt!639607 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1459997 (= lt!639610 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639605 lt!639603 mask!2687))))

(assert (=> b!1459997 (= lt!639610 (seekEntryOrOpen!0 lt!639605 lt!639603 mask!2687))))

(declare-fun b!1459998 () Bool)

(declare-fun res!989251 () Bool)

(assert (=> b!1459998 (=> (not res!989251) (not e!821280))))

(assert (=> b!1459998 (= res!989251 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459999 () Bool)

(declare-fun res!989241 () Bool)

(assert (=> b!1459999 (=> res!989241 e!821286)))

(declare-fun lt!639602 () SeekEntryResult!11790)

(assert (=> b!1459999 (= res!989241 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639607 (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!639602)))))

(declare-fun b!1460000 () Bool)

(declare-fun res!989254 () Bool)

(assert (=> b!1460000 (=> res!989254 e!821286)))

(assert (=> b!1460000 (= res!989254 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1460001 () Bool)

(declare-fun res!989245 () Bool)

(assert (=> b!1460001 (=> (not res!989245) (not e!821278))))

(declare-datatypes ((List!34129 0))(
  ( (Nil!34126) (Cons!34125 (h!35486 (_ BitVec 64)) (t!48815 List!34129)) )
))
(declare-fun arrayNoDuplicates!0 (array!98713 (_ BitVec 32) List!34129) Bool)

(assert (=> b!1460001 (= res!989245 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34126))))

(declare-fun b!1460002 () Bool)

(declare-fun res!989257 () Bool)

(assert (=> b!1460002 (=> (not res!989257) (not e!821278))))

(assert (=> b!1460002 (= res!989257 (and (= (size!48192 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48192 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48192 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460003 () Bool)

(declare-fun res!989243 () Bool)

(assert (=> b!1460003 (=> (not res!989243) (not e!821278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460003 (= res!989243 (validKeyInArray!0 (select (arr!47641 a!2862) j!93)))))

(declare-fun b!1460004 () Bool)

(assert (=> b!1460004 (= e!821279 e!821283)))

(declare-fun res!989246 () Bool)

(assert (=> b!1460004 (=> (not res!989246) (not e!821283))))

(assert (=> b!1460004 (= res!989246 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47641 a!2862) j!93) mask!2687) (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!639602))))

(assert (=> b!1460004 (= lt!639602 (Intermediate!11790 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460005 () Bool)

(declare-fun res!989242 () Bool)

(assert (=> b!1460005 (=> (not res!989242) (not e!821283))))

(assert (=> b!1460005 (= res!989242 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47641 a!2862) j!93) a!2862 mask!2687) lt!639602))))

(declare-fun b!1460006 () Bool)

(declare-fun res!989244 () Bool)

(assert (=> b!1460006 (=> (not res!989244) (not e!821278))))

(assert (=> b!1460006 (= res!989244 (validKeyInArray!0 (select (arr!47641 a!2862) i!1006)))))

(declare-fun b!1460007 () Bool)

(assert (=> b!1460007 (= e!821280 (not e!821281))))

(declare-fun res!989250 () Bool)

(assert (=> b!1460007 (=> res!989250 e!821281)))

(assert (=> b!1460007 (= res!989250 (or (and (= (select (arr!47641 a!2862) index!646) (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47641 a!2862) index!646) (select (arr!47641 a!2862) j!93))) (= (select (arr!47641 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1460007 (and (= lt!639609 (Found!11790 j!93)) (or (= (select (arr!47641 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47641 a!2862) intermediateBeforeIndex!19) (select (arr!47641 a!2862) j!93))) (let ((bdg!53450 (select (store (arr!47641 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47641 a!2862) index!646) bdg!53450) (= (select (arr!47641 a!2862) index!646) (select (arr!47641 a!2862) j!93))) (= (select (arr!47641 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53450 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1460007 (= lt!639609 (seekEntryOrOpen!0 (select (arr!47641 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1460007 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639608 () Unit!49109)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49109)

(assert (=> b!1460007 (= lt!639608 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460008 () Bool)

(declare-fun res!989255 () Bool)

(assert (=> b!1460008 (=> (not res!989255) (not e!821278))))

(assert (=> b!1460008 (= res!989255 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48192 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48192 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48192 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125370 res!989249) b!1460002))

(assert (= (and b!1460002 res!989257) b!1460006))

(assert (= (and b!1460006 res!989244) b!1460003))

(assert (= (and b!1460003 res!989243) b!1459992))

(assert (= (and b!1459992 res!989256) b!1460001))

(assert (= (and b!1460001 res!989245) b!1460008))

(assert (= (and b!1460008 res!989255) b!1459993))

(assert (= (and b!1459993 res!989248) b!1460004))

(assert (= (and b!1460004 res!989246) b!1460005))

(assert (= (and b!1460005 res!989242) b!1459988))

(assert (= (and b!1459988 res!989252) b!1459990))

(assert (= (and b!1459990 c!134893) b!1459987))

(assert (= (and b!1459990 (not c!134893)) b!1459991))

(assert (= (and b!1459990 res!989247) b!1459998))

(assert (= (and b!1459998 res!989251) b!1460007))

(assert (= (and b!1460007 (not res!989250)) b!1459997))

(assert (= (and b!1459997 (not res!989253)) b!1459999))

(assert (= (and b!1459999 (not res!989241)) b!1459996))

(assert (= (and b!1459996 c!134892) b!1459989))

(assert (= (and b!1459996 (not c!134892)) b!1459994))

(assert (= (and b!1459996 (not res!989258)) b!1460000))

(assert (= (and b!1460000 (not res!989254)) b!1459995))

(declare-fun m!1347931 () Bool)

(assert (=> b!1459987 m!1347931))

(declare-fun m!1347933 () Bool)

(assert (=> b!1460006 m!1347933))

(assert (=> b!1460006 m!1347933))

(declare-fun m!1347935 () Bool)

(assert (=> b!1460006 m!1347935))

(declare-fun m!1347937 () Bool)

(assert (=> b!1459999 m!1347937))

(assert (=> b!1459999 m!1347937))

(declare-fun m!1347939 () Bool)

(assert (=> b!1459999 m!1347939))

(declare-fun m!1347941 () Bool)

(assert (=> b!1459997 m!1347941))

(declare-fun m!1347943 () Bool)

(assert (=> b!1459997 m!1347943))

(declare-fun m!1347945 () Bool)

(assert (=> b!1459997 m!1347945))

(declare-fun m!1347947 () Bool)

(assert (=> b!1459988 m!1347947))

(assert (=> b!1459988 m!1347947))

(declare-fun m!1347949 () Bool)

(assert (=> b!1459988 m!1347949))

(declare-fun m!1347951 () Bool)

(assert (=> b!1459988 m!1347951))

(declare-fun m!1347953 () Bool)

(assert (=> b!1459988 m!1347953))

(assert (=> b!1460005 m!1347937))

(assert (=> b!1460005 m!1347937))

(declare-fun m!1347955 () Bool)

(assert (=> b!1460005 m!1347955))

(declare-fun m!1347957 () Bool)

(assert (=> b!1459992 m!1347957))

(assert (=> b!1460003 m!1347937))

(assert (=> b!1460003 m!1347937))

(declare-fun m!1347959 () Bool)

(assert (=> b!1460003 m!1347959))

(declare-fun m!1347961 () Bool)

(assert (=> b!1460007 m!1347961))

(assert (=> b!1460007 m!1347951))

(declare-fun m!1347963 () Bool)

(assert (=> b!1460007 m!1347963))

(declare-fun m!1347965 () Bool)

(assert (=> b!1460007 m!1347965))

(declare-fun m!1347967 () Bool)

(assert (=> b!1460007 m!1347967))

(assert (=> b!1460007 m!1347937))

(declare-fun m!1347969 () Bool)

(assert (=> b!1460007 m!1347969))

(declare-fun m!1347971 () Bool)

(assert (=> b!1460007 m!1347971))

(assert (=> b!1460007 m!1347937))

(declare-fun m!1347973 () Bool)

(assert (=> b!1459994 m!1347973))

(assert (=> b!1459991 m!1347943))

(assert (=> b!1459991 m!1347945))

(declare-fun m!1347975 () Bool)

(assert (=> b!1459995 m!1347975))

(assert (=> b!1460004 m!1347937))

(assert (=> b!1460004 m!1347937))

(declare-fun m!1347977 () Bool)

(assert (=> b!1460004 m!1347977))

(assert (=> b!1460004 m!1347977))

(assert (=> b!1460004 m!1347937))

(declare-fun m!1347979 () Bool)

(assert (=> b!1460004 m!1347979))

(declare-fun m!1347981 () Bool)

(assert (=> b!1460001 m!1347981))

(assert (=> b!1459993 m!1347951))

(declare-fun m!1347983 () Bool)

(assert (=> b!1459993 m!1347983))

(declare-fun m!1347985 () Bool)

(assert (=> start!125370 m!1347985))

(declare-fun m!1347987 () Bool)

(assert (=> start!125370 m!1347987))

(declare-fun m!1347989 () Bool)

(assert (=> b!1459989 m!1347989))

(check-sat (not b!1459992) (not b!1459995) (not b!1460003) (not b!1459987) (not b!1459991) (not b!1460005) (not b!1459999) (not b!1459989) (not b!1460001) (not b!1460007) (not start!125370) (not b!1459988) (not b!1460004) (not b!1459997) (not b!1460006) (not b!1459994))
(check-sat)
