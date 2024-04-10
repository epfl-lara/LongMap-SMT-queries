; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125348 () Bool)

(assert start!125348)

(declare-fun b!1464957 () Bool)

(declare-fun res!993936 () Bool)

(declare-fun e!823211 () Bool)

(assert (=> b!1464957 (=> (not res!993936) (not e!823211))))

(declare-datatypes ((array!98796 0))(
  ( (array!98797 (arr!47686 (Array (_ BitVec 32) (_ BitVec 64))) (size!48236 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98796)

(declare-datatypes ((List!34187 0))(
  ( (Nil!34184) (Cons!34183 (h!35533 (_ BitVec 64)) (t!48881 List!34187)) )
))
(declare-fun arrayNoDuplicates!0 (array!98796 (_ BitVec 32) List!34187) Bool)

(assert (=> b!1464957 (= res!993936 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34184))))

(declare-fun b!1464958 () Bool)

(declare-fun e!823215 () Bool)

(declare-fun e!823212 () Bool)

(assert (=> b!1464958 (= e!823215 (not e!823212))))

(declare-fun res!993943 () Bool)

(assert (=> b!1464958 (=> res!993943 e!823212)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464958 (= res!993943 (or (and (= (select (arr!47686 a!2862) index!646) (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47686 a!2862) index!646) (select (arr!47686 a!2862) j!93))) (= (select (arr!47686 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823217 () Bool)

(assert (=> b!1464958 e!823217))

(declare-fun res!993948 () Bool)

(assert (=> b!1464958 (=> (not res!993948) (not e!823217))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98796 (_ BitVec 32)) Bool)

(assert (=> b!1464958 (= res!993948 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49372 0))(
  ( (Unit!49373) )
))
(declare-fun lt!641256 () Unit!49372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49372)

(assert (=> b!1464958 (= lt!641256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464959 () Bool)

(declare-fun res!993937 () Bool)

(assert (=> b!1464959 (=> (not res!993937) (not e!823211))))

(assert (=> b!1464959 (= res!993937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464960 () Bool)

(declare-fun res!993949 () Bool)

(declare-fun e!823213 () Bool)

(assert (=> b!1464960 (=> (not res!993949) (not e!823213))))

(declare-datatypes ((SeekEntryResult!11938 0))(
  ( (MissingZero!11938 (index!50144 (_ BitVec 32))) (Found!11938 (index!50145 (_ BitVec 32))) (Intermediate!11938 (undefined!12750 Bool) (index!50146 (_ BitVec 32)) (x!131723 (_ BitVec 32))) (Undefined!11938) (MissingVacant!11938 (index!50147 (_ BitVec 32))) )
))
(declare-fun lt!641253 () SeekEntryResult!11938)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98796 (_ BitVec 32)) SeekEntryResult!11938)

(assert (=> b!1464960 (= res!993949 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!641253))))

(declare-fun b!1464961 () Bool)

(declare-fun res!993942 () Bool)

(declare-fun e!823218 () Bool)

(assert (=> b!1464961 (=> res!993942 e!823218)))

(declare-fun lt!641252 () (_ BitVec 32))

(assert (=> b!1464961 (= res!993942 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641252 (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!641253)))))

(declare-fun b!1464962 () Bool)

(declare-fun res!993940 () Bool)

(assert (=> b!1464962 (=> (not res!993940) (not e!823211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464962 (= res!993940 (validKeyInArray!0 (select (arr!47686 a!2862) j!93)))))

(declare-fun b!1464963 () Bool)

(declare-fun res!993946 () Bool)

(assert (=> b!1464963 (=> (not res!993946) (not e!823215))))

(declare-fun e!823216 () Bool)

(assert (=> b!1464963 (= res!993946 e!823216)))

(declare-fun c!135024 () Bool)

(assert (=> b!1464963 (= c!135024 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464964 () Bool)

(declare-fun res!993945 () Bool)

(assert (=> b!1464964 (=> (not res!993945) (not e!823211))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464964 (= res!993945 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48236 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48236 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48236 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464965 () Bool)

(declare-fun lt!641254 () SeekEntryResult!11938)

(declare-fun lt!641250 () (_ BitVec 64))

(declare-fun lt!641251 () array!98796)

(assert (=> b!1464965 (= e!823216 (= lt!641254 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641250 lt!641251 mask!2687)))))

(declare-fun b!1464966 () Bool)

(declare-fun e!823219 () Bool)

(assert (=> b!1464966 (= e!823211 e!823219)))

(declare-fun res!993947 () Bool)

(assert (=> b!1464966 (=> (not res!993947) (not e!823219))))

(assert (=> b!1464966 (= res!993947 (= (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464966 (= lt!641251 (array!98797 (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48236 a!2862)))))

(declare-fun b!1464967 () Bool)

(assert (=> b!1464967 (= e!823217 (or (= (select (arr!47686 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47686 a!2862) intermediateBeforeIndex!19) (select (arr!47686 a!2862) j!93))))))

(declare-fun b!1464968 () Bool)

(declare-fun res!993938 () Bool)

(assert (=> b!1464968 (=> (not res!993938) (not e!823217))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98796 (_ BitVec 32)) SeekEntryResult!11938)

(assert (=> b!1464968 (= res!993938 (= (seekEntryOrOpen!0 (select (arr!47686 a!2862) j!93) a!2862 mask!2687) (Found!11938 j!93)))))

(declare-fun b!1464969 () Bool)

(declare-fun res!993934 () Bool)

(assert (=> b!1464969 (=> (not res!993934) (not e!823211))))

(assert (=> b!1464969 (= res!993934 (validKeyInArray!0 (select (arr!47686 a!2862) i!1006)))))

(declare-fun e!823220 () Bool)

(declare-fun b!1464970 () Bool)

(assert (=> b!1464970 (= e!823220 (not (= lt!641254 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641252 lt!641250 lt!641251 mask!2687))))))

(declare-fun b!1464971 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98796 (_ BitVec 32)) SeekEntryResult!11938)

(assert (=> b!1464971 (= e!823220 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641252 intermediateAfterIndex!19 lt!641250 lt!641251 mask!2687) (seekEntryOrOpen!0 lt!641250 lt!641251 mask!2687))))))

(declare-fun b!1464972 () Bool)

(assert (=> b!1464972 (= e!823219 e!823213)))

(declare-fun res!993933 () Bool)

(assert (=> b!1464972 (=> (not res!993933) (not e!823213))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464972 (= res!993933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47686 a!2862) j!93) mask!2687) (select (arr!47686 a!2862) j!93) a!2862 mask!2687) lt!641253))))

(assert (=> b!1464972 (= lt!641253 (Intermediate!11938 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464973 () Bool)

(assert (=> b!1464973 (= e!823212 e!823218)))

(declare-fun res!993944 () Bool)

(assert (=> b!1464973 (=> res!993944 e!823218)))

(assert (=> b!1464973 (= res!993944 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641252 #b00000000000000000000000000000000) (bvsge lt!641252 (size!48236 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464973 (= lt!641252 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun res!993935 () Bool)

(assert (=> start!125348 (=> (not res!993935) (not e!823211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125348 (= res!993935 (validMask!0 mask!2687))))

(assert (=> start!125348 e!823211))

(assert (=> start!125348 true))

(declare-fun array_inv!36714 (array!98796) Bool)

(assert (=> start!125348 (array_inv!36714 a!2862)))

(declare-fun b!1464974 () Bool)

(assert (=> b!1464974 (= e!823213 e!823215)))

(declare-fun res!993941 () Bool)

(assert (=> b!1464974 (=> (not res!993941) (not e!823215))))

(assert (=> b!1464974 (= res!993941 (= lt!641254 (Intermediate!11938 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464974 (= lt!641254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641250 mask!2687) lt!641250 lt!641251 mask!2687))))

(assert (=> b!1464974 (= lt!641250 (select (store (arr!47686 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464975 () Bool)

(declare-fun res!993939 () Bool)

(assert (=> b!1464975 (=> (not res!993939) (not e!823211))))

(assert (=> b!1464975 (= res!993939 (and (= (size!48236 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48236 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48236 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464976 () Bool)

(declare-fun res!993932 () Bool)

(assert (=> b!1464976 (=> (not res!993932) (not e!823215))))

(assert (=> b!1464976 (= res!993932 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464977 () Bool)

(assert (=> b!1464977 (= e!823216 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641250 lt!641251 mask!2687) (seekEntryOrOpen!0 lt!641250 lt!641251 mask!2687)))))

(declare-fun b!1464978 () Bool)

(assert (=> b!1464978 (= e!823218 true)))

(declare-fun lt!641255 () Bool)

(assert (=> b!1464978 (= lt!641255 e!823220)))

(declare-fun c!135023 () Bool)

(assert (=> b!1464978 (= c!135023 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125348 res!993935) b!1464975))

(assert (= (and b!1464975 res!993939) b!1464969))

(assert (= (and b!1464969 res!993934) b!1464962))

(assert (= (and b!1464962 res!993940) b!1464959))

(assert (= (and b!1464959 res!993937) b!1464957))

(assert (= (and b!1464957 res!993936) b!1464964))

(assert (= (and b!1464964 res!993945) b!1464966))

(assert (= (and b!1464966 res!993947) b!1464972))

(assert (= (and b!1464972 res!993933) b!1464960))

(assert (= (and b!1464960 res!993949) b!1464974))

(assert (= (and b!1464974 res!993941) b!1464963))

(assert (= (and b!1464963 c!135024) b!1464965))

(assert (= (and b!1464963 (not c!135024)) b!1464977))

(assert (= (and b!1464963 res!993946) b!1464976))

(assert (= (and b!1464976 res!993932) b!1464958))

(assert (= (and b!1464958 res!993948) b!1464968))

(assert (= (and b!1464968 res!993938) b!1464967))

(assert (= (and b!1464958 (not res!993943)) b!1464973))

(assert (= (and b!1464973 (not res!993944)) b!1464961))

(assert (= (and b!1464961 (not res!993942)) b!1464978))

(assert (= (and b!1464978 c!135023) b!1464970))

(assert (= (and b!1464978 (not c!135023)) b!1464971))

(declare-fun m!1352109 () Bool)

(assert (=> b!1464972 m!1352109))

(assert (=> b!1464972 m!1352109))

(declare-fun m!1352111 () Bool)

(assert (=> b!1464972 m!1352111))

(assert (=> b!1464972 m!1352111))

(assert (=> b!1464972 m!1352109))

(declare-fun m!1352113 () Bool)

(assert (=> b!1464972 m!1352113))

(declare-fun m!1352115 () Bool)

(assert (=> b!1464970 m!1352115))

(declare-fun m!1352117 () Bool)

(assert (=> b!1464967 m!1352117))

(assert (=> b!1464967 m!1352109))

(declare-fun m!1352119 () Bool)

(assert (=> b!1464957 m!1352119))

(declare-fun m!1352121 () Bool)

(assert (=> b!1464959 m!1352121))

(declare-fun m!1352123 () Bool)

(assert (=> b!1464958 m!1352123))

(declare-fun m!1352125 () Bool)

(assert (=> b!1464958 m!1352125))

(declare-fun m!1352127 () Bool)

(assert (=> b!1464958 m!1352127))

(declare-fun m!1352129 () Bool)

(assert (=> b!1464958 m!1352129))

(declare-fun m!1352131 () Bool)

(assert (=> b!1464958 m!1352131))

(assert (=> b!1464958 m!1352109))

(assert (=> b!1464966 m!1352125))

(declare-fun m!1352133 () Bool)

(assert (=> b!1464966 m!1352133))

(declare-fun m!1352135 () Bool)

(assert (=> b!1464969 m!1352135))

(assert (=> b!1464969 m!1352135))

(declare-fun m!1352137 () Bool)

(assert (=> b!1464969 m!1352137))

(assert (=> b!1464968 m!1352109))

(assert (=> b!1464968 m!1352109))

(declare-fun m!1352139 () Bool)

(assert (=> b!1464968 m!1352139))

(assert (=> b!1464961 m!1352109))

(assert (=> b!1464961 m!1352109))

(declare-fun m!1352141 () Bool)

(assert (=> b!1464961 m!1352141))

(assert (=> b!1464960 m!1352109))

(assert (=> b!1464960 m!1352109))

(declare-fun m!1352143 () Bool)

(assert (=> b!1464960 m!1352143))

(assert (=> b!1464962 m!1352109))

(assert (=> b!1464962 m!1352109))

(declare-fun m!1352145 () Bool)

(assert (=> b!1464962 m!1352145))

(declare-fun m!1352147 () Bool)

(assert (=> b!1464971 m!1352147))

(declare-fun m!1352149 () Bool)

(assert (=> b!1464971 m!1352149))

(declare-fun m!1352151 () Bool)

(assert (=> b!1464973 m!1352151))

(declare-fun m!1352153 () Bool)

(assert (=> b!1464974 m!1352153))

(assert (=> b!1464974 m!1352153))

(declare-fun m!1352155 () Bool)

(assert (=> b!1464974 m!1352155))

(assert (=> b!1464974 m!1352125))

(declare-fun m!1352157 () Bool)

(assert (=> b!1464974 m!1352157))

(declare-fun m!1352159 () Bool)

(assert (=> start!125348 m!1352159))

(declare-fun m!1352161 () Bool)

(assert (=> start!125348 m!1352161))

(declare-fun m!1352163 () Bool)

(assert (=> b!1464965 m!1352163))

(declare-fun m!1352165 () Bool)

(assert (=> b!1464977 m!1352165))

(assert (=> b!1464977 m!1352149))

(push 1)

