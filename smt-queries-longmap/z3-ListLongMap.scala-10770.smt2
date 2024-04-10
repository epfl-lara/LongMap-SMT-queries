; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126060 () Bool)

(assert start!126060)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644781 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!828002 () Bool)

(declare-fun b!1475821 () Bool)

(declare-datatypes ((array!99223 0))(
  ( (array!99224 (arr!47892 (Array (_ BitVec 32) (_ BitVec 64))) (size!48442 (_ BitVec 32))) )
))
(declare-fun lt!644776 () array!99223)

(declare-datatypes ((SeekEntryResult!12132 0))(
  ( (MissingZero!12132 (index!50920 (_ BitVec 32))) (Found!12132 (index!50921 (_ BitVec 32))) (Intermediate!12132 (undefined!12944 Bool) (index!50922 (_ BitVec 32)) (x!132514 (_ BitVec 32))) (Undefined!12132) (MissingVacant!12132 (index!50923 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99223 (_ BitVec 32)) SeekEntryResult!12132)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99223 (_ BitVec 32)) SeekEntryResult!12132)

(assert (=> b!1475821 (= e!828002 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644781 lt!644776 mask!2687) (seekEntryOrOpen!0 lt!644781 lt!644776 mask!2687)))))

(declare-fun b!1475822 () Bool)

(declare-fun res!1002382 () Bool)

(declare-fun e!828007 () Bool)

(assert (=> b!1475822 (=> (not res!1002382) (not e!828007))))

(assert (=> b!1475822 (= res!1002382 e!828002)))

(declare-fun c!136242 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475822 (= c!136242 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!644777 () SeekEntryResult!12132)

(declare-fun b!1475823 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99223 (_ BitVec 32)) SeekEntryResult!12132)

(assert (=> b!1475823 (= e!828002 (= lt!644777 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644781 lt!644776 mask!2687)))))

(declare-fun b!1475824 () Bool)

(declare-fun e!828001 () Bool)

(declare-fun e!828000 () Bool)

(assert (=> b!1475824 (= e!828001 e!828000)))

(declare-fun res!1002386 () Bool)

(assert (=> b!1475824 (=> (not res!1002386) (not e!828000))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99223)

(assert (=> b!1475824 (= res!1002386 (= (select (store (arr!47892 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475824 (= lt!644776 (array!99224 (store (arr!47892 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48442 a!2862)))))

(declare-fun b!1475825 () Bool)

(declare-fun res!1002377 () Bool)

(assert (=> b!1475825 (=> (not res!1002377) (not e!828001))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475825 (= res!1002377 (validKeyInArray!0 (select (arr!47892 a!2862) j!93)))))

(declare-fun b!1475827 () Bool)

(declare-fun res!1002373 () Bool)

(assert (=> b!1475827 (=> (not res!1002373) (not e!828001))))

(assert (=> b!1475827 (= res!1002373 (validKeyInArray!0 (select (arr!47892 a!2862) i!1006)))))

(declare-fun b!1475828 () Bool)

(declare-fun e!828003 () Bool)

(assert (=> b!1475828 (= e!828003 e!828007)))

(declare-fun res!1002385 () Bool)

(assert (=> b!1475828 (=> (not res!1002385) (not e!828007))))

(assert (=> b!1475828 (= res!1002385 (= lt!644777 (Intermediate!12132 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475828 (= lt!644777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644781 mask!2687) lt!644781 lt!644776 mask!2687))))

(assert (=> b!1475828 (= lt!644781 (select (store (arr!47892 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475829 () Bool)

(declare-fun e!828008 () Bool)

(declare-fun e!828004 () Bool)

(assert (=> b!1475829 (= e!828008 e!828004)))

(declare-fun res!1002379 () Bool)

(assert (=> b!1475829 (=> res!1002379 e!828004)))

(assert (=> b!1475829 (= res!1002379 (or (and (= (select (arr!47892 a!2862) index!646) (select (store (arr!47892 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47892 a!2862) index!646) (select (arr!47892 a!2862) j!93))) (not (= (select (arr!47892 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1475830 () Bool)

(declare-fun res!1002378 () Bool)

(assert (=> b!1475830 (=> (not res!1002378) (not e!828001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99223 (_ BitVec 32)) Bool)

(assert (=> b!1475830 (= res!1002378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475831 () Bool)

(declare-fun res!1002383 () Bool)

(assert (=> b!1475831 (=> (not res!1002383) (not e!828001))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475831 (= res!1002383 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48442 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48442 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48442 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475832 () Bool)

(declare-fun res!1002384 () Bool)

(assert (=> b!1475832 (=> (not res!1002384) (not e!828007))))

(assert (=> b!1475832 (= res!1002384 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475833 () Bool)

(declare-fun res!1002388 () Bool)

(assert (=> b!1475833 (=> (not res!1002388) (not e!828003))))

(declare-fun lt!644779 () SeekEntryResult!12132)

(assert (=> b!1475833 (= res!1002388 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47892 a!2862) j!93) a!2862 mask!2687) lt!644779))))

(declare-fun b!1475834 () Bool)

(declare-fun res!1002381 () Bool)

(assert (=> b!1475834 (=> (not res!1002381) (not e!828001))))

(declare-datatypes ((List!34393 0))(
  ( (Nil!34390) (Cons!34389 (h!35754 (_ BitVec 64)) (t!49087 List!34393)) )
))
(declare-fun arrayNoDuplicates!0 (array!99223 (_ BitVec 32) List!34393) Bool)

(assert (=> b!1475834 (= res!1002381 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34390))))

(declare-fun res!1002376 () Bool)

(assert (=> start!126060 (=> (not res!1002376) (not e!828001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126060 (= res!1002376 (validMask!0 mask!2687))))

(assert (=> start!126060 e!828001))

(assert (=> start!126060 true))

(declare-fun array_inv!36920 (array!99223) Bool)

(assert (=> start!126060 (array_inv!36920 a!2862)))

(declare-fun b!1475826 () Bool)

(declare-fun res!1002380 () Bool)

(assert (=> b!1475826 (=> (not res!1002380) (not e!828001))))

(assert (=> b!1475826 (= res!1002380 (and (= (size!48442 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48442 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48442 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475835 () Bool)

(assert (=> b!1475835 (= e!828000 e!828003)))

(declare-fun res!1002387 () Bool)

(assert (=> b!1475835 (=> (not res!1002387) (not e!828003))))

(assert (=> b!1475835 (= res!1002387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47892 a!2862) j!93) mask!2687) (select (arr!47892 a!2862) j!93) a!2862 mask!2687) lt!644779))))

(assert (=> b!1475835 (= lt!644779 (Intermediate!12132 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475836 () Bool)

(assert (=> b!1475836 (= e!828007 (not (or (and (= (select (arr!47892 a!2862) index!646) (select (store (arr!47892 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47892 a!2862) index!646) (select (arr!47892 a!2862) j!93))) (not (= (select (arr!47892 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= x!665 intermediateBeforeX!19))))))

(assert (=> b!1475836 e!828008))

(declare-fun res!1002374 () Bool)

(assert (=> b!1475836 (=> (not res!1002374) (not e!828008))))

(declare-fun lt!644780 () SeekEntryResult!12132)

(assert (=> b!1475836 (= res!1002374 (and (= lt!644780 (Found!12132 j!93)) (or (= (select (arr!47892 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47892 a!2862) intermediateBeforeIndex!19) (select (arr!47892 a!2862) j!93)))))))

(assert (=> b!1475836 (= lt!644780 (seekEntryOrOpen!0 (select (arr!47892 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1475836 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49604 0))(
  ( (Unit!49605) )
))
(declare-fun lt!644778 () Unit!49604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49604)

(assert (=> b!1475836 (= lt!644778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475837 () Bool)

(declare-fun e!828005 () Bool)

(assert (=> b!1475837 (= e!828005 (= index!646 intermediateBeforeIndex!19))))

(declare-fun b!1475838 () Bool)

(assert (=> b!1475838 (= e!828004 e!828005)))

(declare-fun res!1002375 () Bool)

(assert (=> b!1475838 (=> (not res!1002375) (not e!828005))))

(assert (=> b!1475838 (= res!1002375 (= lt!644780 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47892 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!126060 res!1002376) b!1475826))

(assert (= (and b!1475826 res!1002380) b!1475827))

(assert (= (and b!1475827 res!1002373) b!1475825))

(assert (= (and b!1475825 res!1002377) b!1475830))

(assert (= (and b!1475830 res!1002378) b!1475834))

(assert (= (and b!1475834 res!1002381) b!1475831))

(assert (= (and b!1475831 res!1002383) b!1475824))

(assert (= (and b!1475824 res!1002386) b!1475835))

(assert (= (and b!1475835 res!1002387) b!1475833))

(assert (= (and b!1475833 res!1002388) b!1475828))

(assert (= (and b!1475828 res!1002385) b!1475822))

(assert (= (and b!1475822 c!136242) b!1475823))

(assert (= (and b!1475822 (not c!136242)) b!1475821))

(assert (= (and b!1475822 res!1002382) b!1475832))

(assert (= (and b!1475832 res!1002384) b!1475836))

(assert (= (and b!1475836 res!1002374) b!1475829))

(assert (= (and b!1475829 (not res!1002379)) b!1475838))

(assert (= (and b!1475838 res!1002375) b!1475837))

(declare-fun m!1361963 () Bool)

(assert (=> b!1475827 m!1361963))

(assert (=> b!1475827 m!1361963))

(declare-fun m!1361965 () Bool)

(assert (=> b!1475827 m!1361965))

(declare-fun m!1361967 () Bool)

(assert (=> b!1475834 m!1361967))

(declare-fun m!1361969 () Bool)

(assert (=> b!1475829 m!1361969))

(declare-fun m!1361971 () Bool)

(assert (=> b!1475829 m!1361971))

(declare-fun m!1361973 () Bool)

(assert (=> b!1475829 m!1361973))

(declare-fun m!1361975 () Bool)

(assert (=> b!1475829 m!1361975))

(assert (=> b!1475835 m!1361975))

(assert (=> b!1475835 m!1361975))

(declare-fun m!1361977 () Bool)

(assert (=> b!1475835 m!1361977))

(assert (=> b!1475835 m!1361977))

(assert (=> b!1475835 m!1361975))

(declare-fun m!1361979 () Bool)

(assert (=> b!1475835 m!1361979))

(declare-fun m!1361981 () Bool)

(assert (=> start!126060 m!1361981))

(declare-fun m!1361983 () Bool)

(assert (=> start!126060 m!1361983))

(declare-fun m!1361985 () Bool)

(assert (=> b!1475821 m!1361985))

(declare-fun m!1361987 () Bool)

(assert (=> b!1475821 m!1361987))

(assert (=> b!1475824 m!1361971))

(declare-fun m!1361989 () Bool)

(assert (=> b!1475824 m!1361989))

(declare-fun m!1361991 () Bool)

(assert (=> b!1475830 m!1361991))

(declare-fun m!1361993 () Bool)

(assert (=> b!1475828 m!1361993))

(assert (=> b!1475828 m!1361993))

(declare-fun m!1361995 () Bool)

(assert (=> b!1475828 m!1361995))

(assert (=> b!1475828 m!1361971))

(declare-fun m!1361997 () Bool)

(assert (=> b!1475828 m!1361997))

(assert (=> b!1475825 m!1361975))

(assert (=> b!1475825 m!1361975))

(declare-fun m!1361999 () Bool)

(assert (=> b!1475825 m!1361999))

(assert (=> b!1475838 m!1361975))

(assert (=> b!1475838 m!1361975))

(declare-fun m!1362001 () Bool)

(assert (=> b!1475838 m!1362001))

(declare-fun m!1362003 () Bool)

(assert (=> b!1475823 m!1362003))

(assert (=> b!1475833 m!1361975))

(assert (=> b!1475833 m!1361975))

(declare-fun m!1362005 () Bool)

(assert (=> b!1475833 m!1362005))

(declare-fun m!1362007 () Bool)

(assert (=> b!1475836 m!1362007))

(assert (=> b!1475836 m!1361971))

(declare-fun m!1362009 () Bool)

(assert (=> b!1475836 m!1362009))

(assert (=> b!1475836 m!1361973))

(assert (=> b!1475836 m!1361969))

(assert (=> b!1475836 m!1361975))

(declare-fun m!1362011 () Bool)

(assert (=> b!1475836 m!1362011))

(declare-fun m!1362013 () Bool)

(assert (=> b!1475836 m!1362013))

(assert (=> b!1475836 m!1361975))

(check-sat (not b!1475833) (not b!1475823) (not b!1475836) (not start!126060) (not b!1475821) (not b!1475834) (not b!1475838) (not b!1475828) (not b!1475835) (not b!1475827) (not b!1475830) (not b!1475825))
(check-sat)
(get-model)

(declare-fun d!155883 () Bool)

(assert (=> d!155883 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126060 d!155883))

(declare-fun d!155885 () Bool)

(assert (=> d!155885 (= (array_inv!36920 a!2862) (bvsge (size!48442 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126060 d!155885))

(declare-fun b!1475905 () Bool)

(declare-fun e!828043 () SeekEntryResult!12132)

(declare-fun lt!644808 () SeekEntryResult!12132)

(assert (=> b!1475905 (= e!828043 (Found!12132 (index!50922 lt!644808)))))

(declare-fun b!1475906 () Bool)

(declare-fun c!136253 () Bool)

(declare-fun lt!644807 () (_ BitVec 64))

(assert (=> b!1475906 (= c!136253 (= lt!644807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828044 () SeekEntryResult!12132)

(assert (=> b!1475906 (= e!828043 e!828044)))

(declare-fun b!1475907 () Bool)

(declare-fun e!828042 () SeekEntryResult!12132)

(assert (=> b!1475907 (= e!828042 e!828043)))

(assert (=> b!1475907 (= lt!644807 (select (arr!47892 a!2862) (index!50922 lt!644808)))))

(declare-fun c!136252 () Bool)

(assert (=> b!1475907 (= c!136252 (= lt!644807 (select (arr!47892 a!2862) j!93)))))

(declare-fun b!1475909 () Bool)

(assert (=> b!1475909 (= e!828042 Undefined!12132)))

(declare-fun b!1475910 () Bool)

(assert (=> b!1475910 (= e!828044 (MissingZero!12132 (index!50922 lt!644808)))))

(declare-fun d!155887 () Bool)

(declare-fun lt!644806 () SeekEntryResult!12132)

(get-info :version)

(assert (=> d!155887 (and (or ((_ is Undefined!12132) lt!644806) (not ((_ is Found!12132) lt!644806)) (and (bvsge (index!50921 lt!644806) #b00000000000000000000000000000000) (bvslt (index!50921 lt!644806) (size!48442 a!2862)))) (or ((_ is Undefined!12132) lt!644806) ((_ is Found!12132) lt!644806) (not ((_ is MissingZero!12132) lt!644806)) (and (bvsge (index!50920 lt!644806) #b00000000000000000000000000000000) (bvslt (index!50920 lt!644806) (size!48442 a!2862)))) (or ((_ is Undefined!12132) lt!644806) ((_ is Found!12132) lt!644806) ((_ is MissingZero!12132) lt!644806) (not ((_ is MissingVacant!12132) lt!644806)) (and (bvsge (index!50923 lt!644806) #b00000000000000000000000000000000) (bvslt (index!50923 lt!644806) (size!48442 a!2862)))) (or ((_ is Undefined!12132) lt!644806) (ite ((_ is Found!12132) lt!644806) (= (select (arr!47892 a!2862) (index!50921 lt!644806)) (select (arr!47892 a!2862) j!93)) (ite ((_ is MissingZero!12132) lt!644806) (= (select (arr!47892 a!2862) (index!50920 lt!644806)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12132) lt!644806) (= (select (arr!47892 a!2862) (index!50923 lt!644806)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155887 (= lt!644806 e!828042)))

(declare-fun c!136254 () Bool)

(assert (=> d!155887 (= c!136254 (and ((_ is Intermediate!12132) lt!644808) (undefined!12944 lt!644808)))))

(assert (=> d!155887 (= lt!644808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47892 a!2862) j!93) mask!2687) (select (arr!47892 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155887 (validMask!0 mask!2687)))

(assert (=> d!155887 (= (seekEntryOrOpen!0 (select (arr!47892 a!2862) j!93) a!2862 mask!2687) lt!644806)))

(declare-fun b!1475908 () Bool)

(assert (=> b!1475908 (= e!828044 (seekKeyOrZeroReturnVacant!0 (x!132514 lt!644808) (index!50922 lt!644808) (index!50922 lt!644808) (select (arr!47892 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!155887 c!136254) b!1475909))

(assert (= (and d!155887 (not c!136254)) b!1475907))

(assert (= (and b!1475907 c!136252) b!1475905))

(assert (= (and b!1475907 (not c!136252)) b!1475906))

(assert (= (and b!1475906 c!136253) b!1475910))

(assert (= (and b!1475906 (not c!136253)) b!1475908))

(declare-fun m!1362067 () Bool)

(assert (=> b!1475907 m!1362067))

(declare-fun m!1362069 () Bool)

(assert (=> d!155887 m!1362069))

(assert (=> d!155887 m!1361981))

(assert (=> d!155887 m!1361975))

(assert (=> d!155887 m!1361977))

(assert (=> d!155887 m!1361977))

(assert (=> d!155887 m!1361975))

(assert (=> d!155887 m!1361979))

(declare-fun m!1362071 () Bool)

(assert (=> d!155887 m!1362071))

(declare-fun m!1362073 () Bool)

(assert (=> d!155887 m!1362073))

(assert (=> b!1475908 m!1361975))

(declare-fun m!1362075 () Bool)

(assert (=> b!1475908 m!1362075))

(assert (=> b!1475836 d!155887))

(declare-fun b!1475919 () Bool)

(declare-fun e!828053 () Bool)

(declare-fun call!67804 () Bool)

(assert (=> b!1475919 (= e!828053 call!67804)))

(declare-fun b!1475920 () Bool)

(declare-fun e!828052 () Bool)

(assert (=> b!1475920 (= e!828052 call!67804)))

(declare-fun d!155889 () Bool)

(declare-fun res!1002442 () Bool)

(declare-fun e!828051 () Bool)

(assert (=> d!155889 (=> res!1002442 e!828051)))

(assert (=> d!155889 (= res!1002442 (bvsge j!93 (size!48442 a!2862)))))

(assert (=> d!155889 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!828051)))

(declare-fun bm!67801 () Bool)

(assert (=> bm!67801 (= call!67804 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475921 () Bool)

(assert (=> b!1475921 (= e!828052 e!828053)))

(declare-fun lt!644816 () (_ BitVec 64))

(assert (=> b!1475921 (= lt!644816 (select (arr!47892 a!2862) j!93))))

(declare-fun lt!644815 () Unit!49604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99223 (_ BitVec 64) (_ BitVec 32)) Unit!49604)

(assert (=> b!1475921 (= lt!644815 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644816 j!93))))

(declare-fun arrayContainsKey!0 (array!99223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1475921 (arrayContainsKey!0 a!2862 lt!644816 #b00000000000000000000000000000000)))

(declare-fun lt!644817 () Unit!49604)

(assert (=> b!1475921 (= lt!644817 lt!644815)))

(declare-fun res!1002441 () Bool)

(assert (=> b!1475921 (= res!1002441 (= (seekEntryOrOpen!0 (select (arr!47892 a!2862) j!93) a!2862 mask!2687) (Found!12132 j!93)))))

(assert (=> b!1475921 (=> (not res!1002441) (not e!828053))))

(declare-fun b!1475922 () Bool)

(assert (=> b!1475922 (= e!828051 e!828052)))

(declare-fun c!136257 () Bool)

(assert (=> b!1475922 (= c!136257 (validKeyInArray!0 (select (arr!47892 a!2862) j!93)))))

(assert (= (and d!155889 (not res!1002442)) b!1475922))

(assert (= (and b!1475922 c!136257) b!1475921))

(assert (= (and b!1475922 (not c!136257)) b!1475920))

(assert (= (and b!1475921 res!1002441) b!1475919))

(assert (= (or b!1475919 b!1475920) bm!67801))

(declare-fun m!1362077 () Bool)

(assert (=> bm!67801 m!1362077))

(assert (=> b!1475921 m!1361975))

(declare-fun m!1362079 () Bool)

(assert (=> b!1475921 m!1362079))

(declare-fun m!1362081 () Bool)

(assert (=> b!1475921 m!1362081))

(assert (=> b!1475921 m!1361975))

(assert (=> b!1475921 m!1362011))

(assert (=> b!1475922 m!1361975))

(assert (=> b!1475922 m!1361975))

(assert (=> b!1475922 m!1361999))

(assert (=> b!1475836 d!155889))

(declare-fun d!155891 () Bool)

(assert (=> d!155891 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644820 () Unit!49604)

(declare-fun choose!38 (array!99223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49604)

(assert (=> d!155891 (= lt!644820 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155891 (validMask!0 mask!2687)))

(assert (=> d!155891 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644820)))

(declare-fun bs!42581 () Bool)

(assert (= bs!42581 d!155891))

(assert (=> bs!42581 m!1362013))

(declare-fun m!1362083 () Bool)

(assert (=> bs!42581 m!1362083))

(assert (=> bs!42581 m!1361981))

(assert (=> b!1475836 d!155891))

(declare-fun b!1475935 () Bool)

(declare-fun e!828061 () SeekEntryResult!12132)

(declare-fun e!828060 () SeekEntryResult!12132)

(assert (=> b!1475935 (= e!828061 e!828060)))

(declare-fun lt!644825 () (_ BitVec 64))

(declare-fun c!136266 () Bool)

(assert (=> b!1475935 (= c!136266 (= lt!644825 (select (arr!47892 a!2862) j!93)))))

(declare-fun b!1475936 () Bool)

(assert (=> b!1475936 (= e!828061 Undefined!12132)))

(declare-fun e!828062 () SeekEntryResult!12132)

(declare-fun b!1475937 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475937 (= e!828062 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47892 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475938 () Bool)

(declare-fun c!136264 () Bool)

(assert (=> b!1475938 (= c!136264 (= lt!644825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475938 (= e!828060 e!828062)))

(declare-fun d!155893 () Bool)

(declare-fun lt!644826 () SeekEntryResult!12132)

(assert (=> d!155893 (and (or ((_ is Undefined!12132) lt!644826) (not ((_ is Found!12132) lt!644826)) (and (bvsge (index!50921 lt!644826) #b00000000000000000000000000000000) (bvslt (index!50921 lt!644826) (size!48442 a!2862)))) (or ((_ is Undefined!12132) lt!644826) ((_ is Found!12132) lt!644826) (not ((_ is MissingVacant!12132) lt!644826)) (not (= (index!50923 lt!644826) index!646)) (and (bvsge (index!50923 lt!644826) #b00000000000000000000000000000000) (bvslt (index!50923 lt!644826) (size!48442 a!2862)))) (or ((_ is Undefined!12132) lt!644826) (ite ((_ is Found!12132) lt!644826) (= (select (arr!47892 a!2862) (index!50921 lt!644826)) (select (arr!47892 a!2862) j!93)) (and ((_ is MissingVacant!12132) lt!644826) (= (index!50923 lt!644826) index!646) (= (select (arr!47892 a!2862) (index!50923 lt!644826)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155893 (= lt!644826 e!828061)))

(declare-fun c!136265 () Bool)

(assert (=> d!155893 (= c!136265 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155893 (= lt!644825 (select (arr!47892 a!2862) index!646))))

(assert (=> d!155893 (validMask!0 mask!2687)))

(assert (=> d!155893 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47892 a!2862) j!93) a!2862 mask!2687) lt!644826)))

(declare-fun b!1475939 () Bool)

(assert (=> b!1475939 (= e!828060 (Found!12132 index!646))))

(declare-fun b!1475940 () Bool)

(assert (=> b!1475940 (= e!828062 (MissingVacant!12132 index!646))))

(assert (= (and d!155893 c!136265) b!1475936))

(assert (= (and d!155893 (not c!136265)) b!1475935))

(assert (= (and b!1475935 c!136266) b!1475939))

(assert (= (and b!1475935 (not c!136266)) b!1475938))

(assert (= (and b!1475938 c!136264) b!1475940))

(assert (= (and b!1475938 (not c!136264)) b!1475937))

(declare-fun m!1362085 () Bool)

(assert (=> b!1475937 m!1362085))

(assert (=> b!1475937 m!1362085))

(assert (=> b!1475937 m!1361975))

(declare-fun m!1362087 () Bool)

(assert (=> b!1475937 m!1362087))

(declare-fun m!1362089 () Bool)

(assert (=> d!155893 m!1362089))

(declare-fun m!1362091 () Bool)

(assert (=> d!155893 m!1362091))

(assert (=> d!155893 m!1361969))

(assert (=> d!155893 m!1361981))

(assert (=> b!1475838 d!155893))

(declare-fun d!155897 () Bool)

(assert (=> d!155897 (= (validKeyInArray!0 (select (arr!47892 a!2862) i!1006)) (and (not (= (select (arr!47892 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47892 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475827 d!155897))

(declare-fun bm!67804 () Bool)

(declare-fun call!67807 () Bool)

(declare-fun c!136275 () Bool)

(assert (=> bm!67804 (= call!67807 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136275 (Cons!34389 (select (arr!47892 a!2862) #b00000000000000000000000000000000) Nil!34390) Nil!34390)))))

(declare-fun b!1475963 () Bool)

(declare-fun e!828079 () Bool)

(assert (=> b!1475963 (= e!828079 call!67807)))

(declare-fun b!1475964 () Bool)

(assert (=> b!1475964 (= e!828079 call!67807)))

(declare-fun d!155899 () Bool)

(declare-fun res!1002450 () Bool)

(declare-fun e!828080 () Bool)

(assert (=> d!155899 (=> res!1002450 e!828080)))

(assert (=> d!155899 (= res!1002450 (bvsge #b00000000000000000000000000000000 (size!48442 a!2862)))))

(assert (=> d!155899 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34390) e!828080)))

(declare-fun b!1475965 () Bool)

(declare-fun e!828077 () Bool)

(assert (=> b!1475965 (= e!828080 e!828077)))

(declare-fun res!1002451 () Bool)

(assert (=> b!1475965 (=> (not res!1002451) (not e!828077))))

(declare-fun e!828078 () Bool)

(assert (=> b!1475965 (= res!1002451 (not e!828078))))

(declare-fun res!1002449 () Bool)

(assert (=> b!1475965 (=> (not res!1002449) (not e!828078))))

(assert (=> b!1475965 (= res!1002449 (validKeyInArray!0 (select (arr!47892 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475966 () Bool)

(assert (=> b!1475966 (= e!828077 e!828079)))

(assert (=> b!1475966 (= c!136275 (validKeyInArray!0 (select (arr!47892 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475967 () Bool)

(declare-fun contains!9908 (List!34393 (_ BitVec 64)) Bool)

(assert (=> b!1475967 (= e!828078 (contains!9908 Nil!34390 (select (arr!47892 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155899 (not res!1002450)) b!1475965))

(assert (= (and b!1475965 res!1002449) b!1475967))

(assert (= (and b!1475965 res!1002451) b!1475966))

(assert (= (and b!1475966 c!136275) b!1475964))

(assert (= (and b!1475966 (not c!136275)) b!1475963))

(assert (= (or b!1475964 b!1475963) bm!67804))

(declare-fun m!1362093 () Bool)

(assert (=> bm!67804 m!1362093))

(declare-fun m!1362095 () Bool)

(assert (=> bm!67804 m!1362095))

(assert (=> b!1475965 m!1362093))

(assert (=> b!1475965 m!1362093))

(declare-fun m!1362097 () Bool)

(assert (=> b!1475965 m!1362097))

(assert (=> b!1475966 m!1362093))

(assert (=> b!1475966 m!1362093))

(assert (=> b!1475966 m!1362097))

(assert (=> b!1475967 m!1362093))

(assert (=> b!1475967 m!1362093))

(declare-fun m!1362099 () Bool)

(assert (=> b!1475967 m!1362099))

(assert (=> b!1475834 d!155899))

(declare-fun b!1476022 () Bool)

(declare-fun lt!644850 () SeekEntryResult!12132)

(assert (=> b!1476022 (and (bvsge (index!50922 lt!644850) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644850) (size!48442 lt!644776)))))

(declare-fun res!1002460 () Bool)

(assert (=> b!1476022 (= res!1002460 (= (select (arr!47892 lt!644776) (index!50922 lt!644850)) lt!644781))))

(declare-fun e!828109 () Bool)

(assert (=> b!1476022 (=> res!1002460 e!828109)))

(declare-fun e!828112 () Bool)

(assert (=> b!1476022 (= e!828112 e!828109)))

(declare-fun b!1476023 () Bool)

(declare-fun e!828111 () Bool)

(assert (=> b!1476023 (= e!828111 (bvsge (x!132514 lt!644850) #b01111111111111111111111111111110))))

(declare-fun b!1476024 () Bool)

(assert (=> b!1476024 (and (bvsge (index!50922 lt!644850) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644850) (size!48442 lt!644776)))))

(declare-fun res!1002459 () Bool)

(assert (=> b!1476024 (= res!1002459 (= (select (arr!47892 lt!644776) (index!50922 lt!644850)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476024 (=> res!1002459 e!828109)))

(declare-fun b!1476025 () Bool)

(assert (=> b!1476025 (and (bvsge (index!50922 lt!644850) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644850) (size!48442 lt!644776)))))

(assert (=> b!1476025 (= e!828109 (= (select (arr!47892 lt!644776) (index!50922 lt!644850)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476026 () Bool)

(declare-fun e!828110 () SeekEntryResult!12132)

(assert (=> b!1476026 (= e!828110 (Intermediate!12132 false index!646 x!665))))

(declare-fun b!1476027 () Bool)

(declare-fun e!828113 () SeekEntryResult!12132)

(assert (=> b!1476027 (= e!828113 (Intermediate!12132 true index!646 x!665))))

(declare-fun b!1476028 () Bool)

(assert (=> b!1476028 (= e!828110 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644781 lt!644776 mask!2687))))

(declare-fun d!155901 () Bool)

(assert (=> d!155901 e!828111))

(declare-fun c!136300 () Bool)

(assert (=> d!155901 (= c!136300 (and ((_ is Intermediate!12132) lt!644850) (undefined!12944 lt!644850)))))

(assert (=> d!155901 (= lt!644850 e!828113)))

(declare-fun c!136302 () Bool)

(assert (=> d!155901 (= c!136302 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644849 () (_ BitVec 64))

(assert (=> d!155901 (= lt!644849 (select (arr!47892 lt!644776) index!646))))

(assert (=> d!155901 (validMask!0 mask!2687)))

(assert (=> d!155901 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644781 lt!644776 mask!2687) lt!644850)))

(declare-fun b!1476029 () Bool)

(assert (=> b!1476029 (= e!828113 e!828110)))

(declare-fun c!136301 () Bool)

(assert (=> b!1476029 (= c!136301 (or (= lt!644849 lt!644781) (= (bvadd lt!644849 lt!644849) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476030 () Bool)

(assert (=> b!1476030 (= e!828111 e!828112)))

(declare-fun res!1002458 () Bool)

(assert (=> b!1476030 (= res!1002458 (and ((_ is Intermediate!12132) lt!644850) (not (undefined!12944 lt!644850)) (bvslt (x!132514 lt!644850) #b01111111111111111111111111111110) (bvsge (x!132514 lt!644850) #b00000000000000000000000000000000) (bvsge (x!132514 lt!644850) x!665)))))

(assert (=> b!1476030 (=> (not res!1002458) (not e!828112))))

(assert (= (and d!155901 c!136302) b!1476027))

(assert (= (and d!155901 (not c!136302)) b!1476029))

(assert (= (and b!1476029 c!136301) b!1476026))

(assert (= (and b!1476029 (not c!136301)) b!1476028))

(assert (= (and d!155901 c!136300) b!1476023))

(assert (= (and d!155901 (not c!136300)) b!1476030))

(assert (= (and b!1476030 res!1002458) b!1476022))

(assert (= (and b!1476022 (not res!1002460)) b!1476024))

(assert (= (and b!1476024 (not res!1002459)) b!1476025))

(declare-fun m!1362121 () Bool)

(assert (=> b!1476024 m!1362121))

(declare-fun m!1362123 () Bool)

(assert (=> d!155901 m!1362123))

(assert (=> d!155901 m!1361981))

(assert (=> b!1476025 m!1362121))

(assert (=> b!1476022 m!1362121))

(assert (=> b!1476028 m!1362085))

(assert (=> b!1476028 m!1362085))

(declare-fun m!1362125 () Bool)

(assert (=> b!1476028 m!1362125))

(assert (=> b!1475823 d!155901))

(declare-fun d!155909 () Bool)

(assert (=> d!155909 (= (validKeyInArray!0 (select (arr!47892 a!2862) j!93)) (and (not (= (select (arr!47892 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47892 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475825 d!155909))

(declare-fun b!1476037 () Bool)

(declare-fun lt!644855 () SeekEntryResult!12132)

(assert (=> b!1476037 (and (bvsge (index!50922 lt!644855) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644855) (size!48442 a!2862)))))

(declare-fun res!1002463 () Bool)

(assert (=> b!1476037 (= res!1002463 (= (select (arr!47892 a!2862) (index!50922 lt!644855)) (select (arr!47892 a!2862) j!93)))))

(declare-fun e!828117 () Bool)

(assert (=> b!1476037 (=> res!1002463 e!828117)))

(declare-fun e!828120 () Bool)

(assert (=> b!1476037 (= e!828120 e!828117)))

(declare-fun b!1476038 () Bool)

(declare-fun e!828119 () Bool)

(assert (=> b!1476038 (= e!828119 (bvsge (x!132514 lt!644855) #b01111111111111111111111111111110))))

(declare-fun b!1476039 () Bool)

(assert (=> b!1476039 (and (bvsge (index!50922 lt!644855) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644855) (size!48442 a!2862)))))

(declare-fun res!1002462 () Bool)

(assert (=> b!1476039 (= res!1002462 (= (select (arr!47892 a!2862) (index!50922 lt!644855)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476039 (=> res!1002462 e!828117)))

(declare-fun b!1476040 () Bool)

(assert (=> b!1476040 (and (bvsge (index!50922 lt!644855) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644855) (size!48442 a!2862)))))

(assert (=> b!1476040 (= e!828117 (= (select (arr!47892 a!2862) (index!50922 lt!644855)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828118 () SeekEntryResult!12132)

(declare-fun b!1476041 () Bool)

(assert (=> b!1476041 (= e!828118 (Intermediate!12132 false (toIndex!0 (select (arr!47892 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476042 () Bool)

(declare-fun e!828121 () SeekEntryResult!12132)

(assert (=> b!1476042 (= e!828121 (Intermediate!12132 true (toIndex!0 (select (arr!47892 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476043 () Bool)

(assert (=> b!1476043 (= e!828118 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47892 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47892 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155911 () Bool)

(assert (=> d!155911 e!828119))

(declare-fun c!136306 () Bool)

(assert (=> d!155911 (= c!136306 (and ((_ is Intermediate!12132) lt!644855) (undefined!12944 lt!644855)))))

(assert (=> d!155911 (= lt!644855 e!828121)))

(declare-fun c!136308 () Bool)

(assert (=> d!155911 (= c!136308 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644854 () (_ BitVec 64))

(assert (=> d!155911 (= lt!644854 (select (arr!47892 a!2862) (toIndex!0 (select (arr!47892 a!2862) j!93) mask!2687)))))

(assert (=> d!155911 (validMask!0 mask!2687)))

(assert (=> d!155911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47892 a!2862) j!93) mask!2687) (select (arr!47892 a!2862) j!93) a!2862 mask!2687) lt!644855)))

(declare-fun b!1476044 () Bool)

(assert (=> b!1476044 (= e!828121 e!828118)))

(declare-fun c!136307 () Bool)

(assert (=> b!1476044 (= c!136307 (or (= lt!644854 (select (arr!47892 a!2862) j!93)) (= (bvadd lt!644854 lt!644854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476045 () Bool)

(assert (=> b!1476045 (= e!828119 e!828120)))

(declare-fun res!1002461 () Bool)

(assert (=> b!1476045 (= res!1002461 (and ((_ is Intermediate!12132) lt!644855) (not (undefined!12944 lt!644855)) (bvslt (x!132514 lt!644855) #b01111111111111111111111111111110) (bvsge (x!132514 lt!644855) #b00000000000000000000000000000000) (bvsge (x!132514 lt!644855) #b00000000000000000000000000000000)))))

(assert (=> b!1476045 (=> (not res!1002461) (not e!828120))))

(assert (= (and d!155911 c!136308) b!1476042))

(assert (= (and d!155911 (not c!136308)) b!1476044))

(assert (= (and b!1476044 c!136307) b!1476041))

(assert (= (and b!1476044 (not c!136307)) b!1476043))

(assert (= (and d!155911 c!136306) b!1476038))

(assert (= (and d!155911 (not c!136306)) b!1476045))

(assert (= (and b!1476045 res!1002461) b!1476037))

(assert (= (and b!1476037 (not res!1002463)) b!1476039))

(assert (= (and b!1476039 (not res!1002462)) b!1476040))

(declare-fun m!1362137 () Bool)

(assert (=> b!1476039 m!1362137))

(assert (=> d!155911 m!1361977))

(declare-fun m!1362139 () Bool)

(assert (=> d!155911 m!1362139))

(assert (=> d!155911 m!1361981))

(assert (=> b!1476040 m!1362137))

(assert (=> b!1476037 m!1362137))

(assert (=> b!1476043 m!1361977))

(declare-fun m!1362141 () Bool)

(assert (=> b!1476043 m!1362141))

(assert (=> b!1476043 m!1362141))

(assert (=> b!1476043 m!1361975))

(declare-fun m!1362143 () Bool)

(assert (=> b!1476043 m!1362143))

(assert (=> b!1475835 d!155911))

(declare-fun d!155915 () Bool)

(declare-fun lt!644861 () (_ BitVec 32))

(declare-fun lt!644860 () (_ BitVec 32))

(assert (=> d!155915 (= lt!644861 (bvmul (bvxor lt!644860 (bvlshr lt!644860 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155915 (= lt!644860 ((_ extract 31 0) (bvand (bvxor (select (arr!47892 a!2862) j!93) (bvlshr (select (arr!47892 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155915 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002464 (let ((h!35756 ((_ extract 31 0) (bvand (bvxor (select (arr!47892 a!2862) j!93) (bvlshr (select (arr!47892 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132520 (bvmul (bvxor h!35756 (bvlshr h!35756 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132520 (bvlshr x!132520 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002464 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002464 #b00000000000000000000000000000000))))))

(assert (=> d!155915 (= (toIndex!0 (select (arr!47892 a!2862) j!93) mask!2687) (bvand (bvxor lt!644861 (bvlshr lt!644861 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475835 d!155915))

(declare-fun b!1476046 () Bool)

(declare-fun e!828123 () SeekEntryResult!12132)

(declare-fun e!828122 () SeekEntryResult!12132)

(assert (=> b!1476046 (= e!828123 e!828122)))

(declare-fun c!136311 () Bool)

(declare-fun lt!644862 () (_ BitVec 64))

(assert (=> b!1476046 (= c!136311 (= lt!644862 lt!644781))))

(declare-fun b!1476047 () Bool)

(assert (=> b!1476047 (= e!828123 Undefined!12132)))

(declare-fun e!828124 () SeekEntryResult!12132)

(declare-fun b!1476048 () Bool)

(assert (=> b!1476048 (= e!828124 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644781 lt!644776 mask!2687))))

(declare-fun b!1476049 () Bool)

(declare-fun c!136309 () Bool)

(assert (=> b!1476049 (= c!136309 (= lt!644862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476049 (= e!828122 e!828124)))

(declare-fun d!155917 () Bool)

(declare-fun lt!644863 () SeekEntryResult!12132)

(assert (=> d!155917 (and (or ((_ is Undefined!12132) lt!644863) (not ((_ is Found!12132) lt!644863)) (and (bvsge (index!50921 lt!644863) #b00000000000000000000000000000000) (bvslt (index!50921 lt!644863) (size!48442 lt!644776)))) (or ((_ is Undefined!12132) lt!644863) ((_ is Found!12132) lt!644863) (not ((_ is MissingVacant!12132) lt!644863)) (not (= (index!50923 lt!644863) intermediateAfterIndex!19)) (and (bvsge (index!50923 lt!644863) #b00000000000000000000000000000000) (bvslt (index!50923 lt!644863) (size!48442 lt!644776)))) (or ((_ is Undefined!12132) lt!644863) (ite ((_ is Found!12132) lt!644863) (= (select (arr!47892 lt!644776) (index!50921 lt!644863)) lt!644781) (and ((_ is MissingVacant!12132) lt!644863) (= (index!50923 lt!644863) intermediateAfterIndex!19) (= (select (arr!47892 lt!644776) (index!50923 lt!644863)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155917 (= lt!644863 e!828123)))

(declare-fun c!136310 () Bool)

(assert (=> d!155917 (= c!136310 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155917 (= lt!644862 (select (arr!47892 lt!644776) index!646))))

(assert (=> d!155917 (validMask!0 mask!2687)))

(assert (=> d!155917 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644781 lt!644776 mask!2687) lt!644863)))

(declare-fun b!1476050 () Bool)

(assert (=> b!1476050 (= e!828122 (Found!12132 index!646))))

(declare-fun b!1476051 () Bool)

(assert (=> b!1476051 (= e!828124 (MissingVacant!12132 intermediateAfterIndex!19))))

(assert (= (and d!155917 c!136310) b!1476047))

(assert (= (and d!155917 (not c!136310)) b!1476046))

(assert (= (and b!1476046 c!136311) b!1476050))

(assert (= (and b!1476046 (not c!136311)) b!1476049))

(assert (= (and b!1476049 c!136309) b!1476051))

(assert (= (and b!1476049 (not c!136309)) b!1476048))

(assert (=> b!1476048 m!1362085))

(assert (=> b!1476048 m!1362085))

(declare-fun m!1362145 () Bool)

(assert (=> b!1476048 m!1362145))

(declare-fun m!1362147 () Bool)

(assert (=> d!155917 m!1362147))

(declare-fun m!1362149 () Bool)

(assert (=> d!155917 m!1362149))

(assert (=> d!155917 m!1362123))

(assert (=> d!155917 m!1361981))

(assert (=> b!1475821 d!155917))

(declare-fun b!1476052 () Bool)

(declare-fun e!828126 () SeekEntryResult!12132)

(declare-fun lt!644866 () SeekEntryResult!12132)

(assert (=> b!1476052 (= e!828126 (Found!12132 (index!50922 lt!644866)))))

(declare-fun b!1476053 () Bool)

(declare-fun c!136313 () Bool)

(declare-fun lt!644865 () (_ BitVec 64))

(assert (=> b!1476053 (= c!136313 (= lt!644865 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828127 () SeekEntryResult!12132)

(assert (=> b!1476053 (= e!828126 e!828127)))

(declare-fun b!1476054 () Bool)

(declare-fun e!828125 () SeekEntryResult!12132)

(assert (=> b!1476054 (= e!828125 e!828126)))

(assert (=> b!1476054 (= lt!644865 (select (arr!47892 lt!644776) (index!50922 lt!644866)))))

(declare-fun c!136312 () Bool)

(assert (=> b!1476054 (= c!136312 (= lt!644865 lt!644781))))

(declare-fun b!1476056 () Bool)

(assert (=> b!1476056 (= e!828125 Undefined!12132)))

(declare-fun b!1476057 () Bool)

(assert (=> b!1476057 (= e!828127 (MissingZero!12132 (index!50922 lt!644866)))))

(declare-fun d!155919 () Bool)

(declare-fun lt!644864 () SeekEntryResult!12132)

(assert (=> d!155919 (and (or ((_ is Undefined!12132) lt!644864) (not ((_ is Found!12132) lt!644864)) (and (bvsge (index!50921 lt!644864) #b00000000000000000000000000000000) (bvslt (index!50921 lt!644864) (size!48442 lt!644776)))) (or ((_ is Undefined!12132) lt!644864) ((_ is Found!12132) lt!644864) (not ((_ is MissingZero!12132) lt!644864)) (and (bvsge (index!50920 lt!644864) #b00000000000000000000000000000000) (bvslt (index!50920 lt!644864) (size!48442 lt!644776)))) (or ((_ is Undefined!12132) lt!644864) ((_ is Found!12132) lt!644864) ((_ is MissingZero!12132) lt!644864) (not ((_ is MissingVacant!12132) lt!644864)) (and (bvsge (index!50923 lt!644864) #b00000000000000000000000000000000) (bvslt (index!50923 lt!644864) (size!48442 lt!644776)))) (or ((_ is Undefined!12132) lt!644864) (ite ((_ is Found!12132) lt!644864) (= (select (arr!47892 lt!644776) (index!50921 lt!644864)) lt!644781) (ite ((_ is MissingZero!12132) lt!644864) (= (select (arr!47892 lt!644776) (index!50920 lt!644864)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12132) lt!644864) (= (select (arr!47892 lt!644776) (index!50923 lt!644864)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155919 (= lt!644864 e!828125)))

(declare-fun c!136314 () Bool)

(assert (=> d!155919 (= c!136314 (and ((_ is Intermediate!12132) lt!644866) (undefined!12944 lt!644866)))))

(assert (=> d!155919 (= lt!644866 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644781 mask!2687) lt!644781 lt!644776 mask!2687))))

(assert (=> d!155919 (validMask!0 mask!2687)))

(assert (=> d!155919 (= (seekEntryOrOpen!0 lt!644781 lt!644776 mask!2687) lt!644864)))

(declare-fun b!1476055 () Bool)

(assert (=> b!1476055 (= e!828127 (seekKeyOrZeroReturnVacant!0 (x!132514 lt!644866) (index!50922 lt!644866) (index!50922 lt!644866) lt!644781 lt!644776 mask!2687))))

(assert (= (and d!155919 c!136314) b!1476056))

(assert (= (and d!155919 (not c!136314)) b!1476054))

(assert (= (and b!1476054 c!136312) b!1476052))

(assert (= (and b!1476054 (not c!136312)) b!1476053))

(assert (= (and b!1476053 c!136313) b!1476057))

(assert (= (and b!1476053 (not c!136313)) b!1476055))

(declare-fun m!1362151 () Bool)

(assert (=> b!1476054 m!1362151))

(declare-fun m!1362153 () Bool)

(assert (=> d!155919 m!1362153))

(assert (=> d!155919 m!1361981))

(assert (=> d!155919 m!1361993))

(assert (=> d!155919 m!1361993))

(assert (=> d!155919 m!1361995))

(declare-fun m!1362155 () Bool)

(assert (=> d!155919 m!1362155))

(declare-fun m!1362157 () Bool)

(assert (=> d!155919 m!1362157))

(declare-fun m!1362159 () Bool)

(assert (=> b!1476055 m!1362159))

(assert (=> b!1475821 d!155919))

(declare-fun b!1476058 () Bool)

(declare-fun lt!644868 () SeekEntryResult!12132)

(assert (=> b!1476058 (and (bvsge (index!50922 lt!644868) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644868) (size!48442 a!2862)))))

(declare-fun res!1002467 () Bool)

(assert (=> b!1476058 (= res!1002467 (= (select (arr!47892 a!2862) (index!50922 lt!644868)) (select (arr!47892 a!2862) j!93)))))

(declare-fun e!828128 () Bool)

(assert (=> b!1476058 (=> res!1002467 e!828128)))

(declare-fun e!828131 () Bool)

(assert (=> b!1476058 (= e!828131 e!828128)))

(declare-fun b!1476059 () Bool)

(declare-fun e!828130 () Bool)

(assert (=> b!1476059 (= e!828130 (bvsge (x!132514 lt!644868) #b01111111111111111111111111111110))))

(declare-fun b!1476060 () Bool)

(assert (=> b!1476060 (and (bvsge (index!50922 lt!644868) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644868) (size!48442 a!2862)))))

(declare-fun res!1002466 () Bool)

(assert (=> b!1476060 (= res!1002466 (= (select (arr!47892 a!2862) (index!50922 lt!644868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476060 (=> res!1002466 e!828128)))

(declare-fun b!1476061 () Bool)

(assert (=> b!1476061 (and (bvsge (index!50922 lt!644868) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644868) (size!48442 a!2862)))))

(assert (=> b!1476061 (= e!828128 (= (select (arr!47892 a!2862) (index!50922 lt!644868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476062 () Bool)

(declare-fun e!828129 () SeekEntryResult!12132)

(assert (=> b!1476062 (= e!828129 (Intermediate!12132 false index!646 x!665))))

(declare-fun b!1476063 () Bool)

(declare-fun e!828132 () SeekEntryResult!12132)

(assert (=> b!1476063 (= e!828132 (Intermediate!12132 true index!646 x!665))))

(declare-fun b!1476064 () Bool)

(assert (=> b!1476064 (= e!828129 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47892 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155921 () Bool)

(assert (=> d!155921 e!828130))

(declare-fun c!136315 () Bool)

(assert (=> d!155921 (= c!136315 (and ((_ is Intermediate!12132) lt!644868) (undefined!12944 lt!644868)))))

(assert (=> d!155921 (= lt!644868 e!828132)))

(declare-fun c!136317 () Bool)

(assert (=> d!155921 (= c!136317 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644867 () (_ BitVec 64))

(assert (=> d!155921 (= lt!644867 (select (arr!47892 a!2862) index!646))))

(assert (=> d!155921 (validMask!0 mask!2687)))

(assert (=> d!155921 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47892 a!2862) j!93) a!2862 mask!2687) lt!644868)))

(declare-fun b!1476065 () Bool)

(assert (=> b!1476065 (= e!828132 e!828129)))

(declare-fun c!136316 () Bool)

(assert (=> b!1476065 (= c!136316 (or (= lt!644867 (select (arr!47892 a!2862) j!93)) (= (bvadd lt!644867 lt!644867) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476066 () Bool)

(assert (=> b!1476066 (= e!828130 e!828131)))

(declare-fun res!1002465 () Bool)

(assert (=> b!1476066 (= res!1002465 (and ((_ is Intermediate!12132) lt!644868) (not (undefined!12944 lt!644868)) (bvslt (x!132514 lt!644868) #b01111111111111111111111111111110) (bvsge (x!132514 lt!644868) #b00000000000000000000000000000000) (bvsge (x!132514 lt!644868) x!665)))))

(assert (=> b!1476066 (=> (not res!1002465) (not e!828131))))

(assert (= (and d!155921 c!136317) b!1476063))

(assert (= (and d!155921 (not c!136317)) b!1476065))

(assert (= (and b!1476065 c!136316) b!1476062))

(assert (= (and b!1476065 (not c!136316)) b!1476064))

(assert (= (and d!155921 c!136315) b!1476059))

(assert (= (and d!155921 (not c!136315)) b!1476066))

(assert (= (and b!1476066 res!1002465) b!1476058))

(assert (= (and b!1476058 (not res!1002467)) b!1476060))

(assert (= (and b!1476060 (not res!1002466)) b!1476061))

(declare-fun m!1362161 () Bool)

(assert (=> b!1476060 m!1362161))

(assert (=> d!155921 m!1361969))

(assert (=> d!155921 m!1361981))

(assert (=> b!1476061 m!1362161))

(assert (=> b!1476058 m!1362161))

(assert (=> b!1476064 m!1362085))

(assert (=> b!1476064 m!1362085))

(assert (=> b!1476064 m!1361975))

(declare-fun m!1362163 () Bool)

(assert (=> b!1476064 m!1362163))

(assert (=> b!1475833 d!155921))

(declare-fun b!1476067 () Bool)

(declare-fun lt!644870 () SeekEntryResult!12132)

(assert (=> b!1476067 (and (bvsge (index!50922 lt!644870) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644870) (size!48442 lt!644776)))))

(declare-fun res!1002470 () Bool)

(assert (=> b!1476067 (= res!1002470 (= (select (arr!47892 lt!644776) (index!50922 lt!644870)) lt!644781))))

(declare-fun e!828133 () Bool)

(assert (=> b!1476067 (=> res!1002470 e!828133)))

(declare-fun e!828136 () Bool)

(assert (=> b!1476067 (= e!828136 e!828133)))

(declare-fun b!1476068 () Bool)

(declare-fun e!828135 () Bool)

(assert (=> b!1476068 (= e!828135 (bvsge (x!132514 lt!644870) #b01111111111111111111111111111110))))

(declare-fun b!1476069 () Bool)

(assert (=> b!1476069 (and (bvsge (index!50922 lt!644870) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644870) (size!48442 lt!644776)))))

(declare-fun res!1002469 () Bool)

(assert (=> b!1476069 (= res!1002469 (= (select (arr!47892 lt!644776) (index!50922 lt!644870)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476069 (=> res!1002469 e!828133)))

(declare-fun b!1476070 () Bool)

(assert (=> b!1476070 (and (bvsge (index!50922 lt!644870) #b00000000000000000000000000000000) (bvslt (index!50922 lt!644870) (size!48442 lt!644776)))))

(assert (=> b!1476070 (= e!828133 (= (select (arr!47892 lt!644776) (index!50922 lt!644870)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1476071 () Bool)

(declare-fun e!828134 () SeekEntryResult!12132)

(assert (=> b!1476071 (= e!828134 (Intermediate!12132 false (toIndex!0 lt!644781 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476072 () Bool)

(declare-fun e!828137 () SeekEntryResult!12132)

(assert (=> b!1476072 (= e!828137 (Intermediate!12132 true (toIndex!0 lt!644781 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1476073 () Bool)

(assert (=> b!1476073 (= e!828134 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644781 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644781 lt!644776 mask!2687))))

(declare-fun d!155923 () Bool)

(assert (=> d!155923 e!828135))

(declare-fun c!136318 () Bool)

(assert (=> d!155923 (= c!136318 (and ((_ is Intermediate!12132) lt!644870) (undefined!12944 lt!644870)))))

(assert (=> d!155923 (= lt!644870 e!828137)))

(declare-fun c!136320 () Bool)

(assert (=> d!155923 (= c!136320 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644869 () (_ BitVec 64))

(assert (=> d!155923 (= lt!644869 (select (arr!47892 lt!644776) (toIndex!0 lt!644781 mask!2687)))))

(assert (=> d!155923 (validMask!0 mask!2687)))

(assert (=> d!155923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644781 mask!2687) lt!644781 lt!644776 mask!2687) lt!644870)))

(declare-fun b!1476074 () Bool)

(assert (=> b!1476074 (= e!828137 e!828134)))

(declare-fun c!136319 () Bool)

(assert (=> b!1476074 (= c!136319 (or (= lt!644869 lt!644781) (= (bvadd lt!644869 lt!644869) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1476075 () Bool)

(assert (=> b!1476075 (= e!828135 e!828136)))

(declare-fun res!1002468 () Bool)

(assert (=> b!1476075 (= res!1002468 (and ((_ is Intermediate!12132) lt!644870) (not (undefined!12944 lt!644870)) (bvslt (x!132514 lt!644870) #b01111111111111111111111111111110) (bvsge (x!132514 lt!644870) #b00000000000000000000000000000000) (bvsge (x!132514 lt!644870) #b00000000000000000000000000000000)))))

(assert (=> b!1476075 (=> (not res!1002468) (not e!828136))))

(assert (= (and d!155923 c!136320) b!1476072))

(assert (= (and d!155923 (not c!136320)) b!1476074))

(assert (= (and b!1476074 c!136319) b!1476071))

(assert (= (and b!1476074 (not c!136319)) b!1476073))

(assert (= (and d!155923 c!136318) b!1476068))

(assert (= (and d!155923 (not c!136318)) b!1476075))

(assert (= (and b!1476075 res!1002468) b!1476067))

(assert (= (and b!1476067 (not res!1002470)) b!1476069))

(assert (= (and b!1476069 (not res!1002469)) b!1476070))

(declare-fun m!1362165 () Bool)

(assert (=> b!1476069 m!1362165))

(assert (=> d!155923 m!1361993))

(declare-fun m!1362167 () Bool)

(assert (=> d!155923 m!1362167))

(assert (=> d!155923 m!1361981))

(assert (=> b!1476070 m!1362165))

(assert (=> b!1476067 m!1362165))

(assert (=> b!1476073 m!1361993))

(declare-fun m!1362169 () Bool)

(assert (=> b!1476073 m!1362169))

(assert (=> b!1476073 m!1362169))

(declare-fun m!1362171 () Bool)

(assert (=> b!1476073 m!1362171))

(assert (=> b!1475828 d!155923))

(declare-fun d!155925 () Bool)

(declare-fun lt!644872 () (_ BitVec 32))

(declare-fun lt!644871 () (_ BitVec 32))

(assert (=> d!155925 (= lt!644872 (bvmul (bvxor lt!644871 (bvlshr lt!644871 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155925 (= lt!644871 ((_ extract 31 0) (bvand (bvxor lt!644781 (bvlshr lt!644781 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155925 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002464 (let ((h!35756 ((_ extract 31 0) (bvand (bvxor lt!644781 (bvlshr lt!644781 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132520 (bvmul (bvxor h!35756 (bvlshr h!35756 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132520 (bvlshr x!132520 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002464 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002464 #b00000000000000000000000000000000))))))

(assert (=> d!155925 (= (toIndex!0 lt!644781 mask!2687) (bvand (bvxor lt!644872 (bvlshr lt!644872 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475828 d!155925))

(declare-fun b!1476076 () Bool)

(declare-fun e!828140 () Bool)

(declare-fun call!67808 () Bool)

(assert (=> b!1476076 (= e!828140 call!67808)))

(declare-fun b!1476077 () Bool)

(declare-fun e!828139 () Bool)

(assert (=> b!1476077 (= e!828139 call!67808)))

(declare-fun d!155927 () Bool)

(declare-fun res!1002472 () Bool)

(declare-fun e!828138 () Bool)

(assert (=> d!155927 (=> res!1002472 e!828138)))

(assert (=> d!155927 (= res!1002472 (bvsge #b00000000000000000000000000000000 (size!48442 a!2862)))))

(assert (=> d!155927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!828138)))

(declare-fun bm!67805 () Bool)

(assert (=> bm!67805 (= call!67808 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1476078 () Bool)

(assert (=> b!1476078 (= e!828139 e!828140)))

(declare-fun lt!644874 () (_ BitVec 64))

(assert (=> b!1476078 (= lt!644874 (select (arr!47892 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644873 () Unit!49604)

(assert (=> b!1476078 (= lt!644873 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644874 #b00000000000000000000000000000000))))

(assert (=> b!1476078 (arrayContainsKey!0 a!2862 lt!644874 #b00000000000000000000000000000000)))

(declare-fun lt!644875 () Unit!49604)

(assert (=> b!1476078 (= lt!644875 lt!644873)))

(declare-fun res!1002471 () Bool)

(assert (=> b!1476078 (= res!1002471 (= (seekEntryOrOpen!0 (select (arr!47892 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12132 #b00000000000000000000000000000000)))))

(assert (=> b!1476078 (=> (not res!1002471) (not e!828140))))

(declare-fun b!1476079 () Bool)

(assert (=> b!1476079 (= e!828138 e!828139)))

(declare-fun c!136321 () Bool)

(assert (=> b!1476079 (= c!136321 (validKeyInArray!0 (select (arr!47892 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155927 (not res!1002472)) b!1476079))

(assert (= (and b!1476079 c!136321) b!1476078))

(assert (= (and b!1476079 (not c!136321)) b!1476077))

(assert (= (and b!1476078 res!1002471) b!1476076))

(assert (= (or b!1476076 b!1476077) bm!67805))

(declare-fun m!1362173 () Bool)

(assert (=> bm!67805 m!1362173))

(assert (=> b!1476078 m!1362093))

(declare-fun m!1362175 () Bool)

(assert (=> b!1476078 m!1362175))

(declare-fun m!1362177 () Bool)

(assert (=> b!1476078 m!1362177))

(assert (=> b!1476078 m!1362093))

(declare-fun m!1362179 () Bool)

(assert (=> b!1476078 m!1362179))

(assert (=> b!1476079 m!1362093))

(assert (=> b!1476079 m!1362093))

(assert (=> b!1476079 m!1362097))

(assert (=> b!1475830 d!155927))

(check-sat (not b!1476073) (not b!1475922) (not d!155901) (not bm!67805) (not b!1476048) (not d!155893) (not bm!67801) (not b!1475921) (not bm!67804) (not b!1475908) (not b!1475967) (not b!1476055) (not b!1475965) (not d!155891) (not b!1476064) (not b!1476028) (not d!155887) (not d!155921) (not d!155923) (not d!155917) (not b!1476078) (not b!1476079) (not b!1475966) (not d!155911) (not b!1476043) (not d!155919) (not b!1475937))
(check-sat)
