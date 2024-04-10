; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127020 () Bool)

(assert start!127020)

(declare-fun b!1492951 () Bool)

(declare-fun res!1015722 () Bool)

(declare-fun e!836355 () Bool)

(assert (=> b!1492951 (=> (not res!1015722) (not e!836355))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12375 0))(
  ( (MissingZero!12375 (index!51892 (_ BitVec 32))) (Found!12375 (index!51893 (_ BitVec 32))) (Intermediate!12375 (undefined!13187 Bool) (index!51894 (_ BitVec 32)) (x!133483 (_ BitVec 32))) (Undefined!12375) (MissingVacant!12375 (index!51895 (_ BitVec 32))) )
))
(declare-fun lt!650825 () SeekEntryResult!12375)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99730 0))(
  ( (array!99731 (arr!48135 (Array (_ BitVec 32) (_ BitVec 64))) (size!48685 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99730)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99730 (_ BitVec 32)) SeekEntryResult!12375)

(assert (=> b!1492951 (= res!1015722 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48135 a!2862) j!93) a!2862 mask!2687) lt!650825))))

(declare-fun b!1492952 () Bool)

(declare-fun res!1015724 () Bool)

(declare-fun e!836360 () Bool)

(assert (=> b!1492952 (=> (not res!1015724) (not e!836360))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1492952 (= res!1015724 (and (= (size!48685 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48685 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48685 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492953 () Bool)

(declare-fun e!836356 () Bool)

(declare-fun e!836357 () Bool)

(assert (=> b!1492953 (= e!836356 (not e!836357))))

(declare-fun res!1015725 () Bool)

(assert (=> b!1492953 (=> res!1015725 e!836357)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1492953 (= res!1015725 (or (and (= (select (arr!48135 a!2862) index!646) (select (store (arr!48135 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48135 a!2862) index!646) (select (arr!48135 a!2862) j!93))) (= (select (arr!48135 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836353 () Bool)

(assert (=> b!1492953 e!836353))

(declare-fun res!1015728 () Bool)

(assert (=> b!1492953 (=> (not res!1015728) (not e!836353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99730 (_ BitVec 32)) Bool)

(assert (=> b!1492953 (= res!1015728 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50090 0))(
  ( (Unit!50091) )
))
(declare-fun lt!650823 () Unit!50090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50090)

(assert (=> b!1492953 (= lt!650823 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1015723 () Bool)

(assert (=> start!127020 (=> (not res!1015723) (not e!836360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127020 (= res!1015723 (validMask!0 mask!2687))))

(assert (=> start!127020 e!836360))

(assert (=> start!127020 true))

(declare-fun array_inv!37163 (array!99730) Bool)

(assert (=> start!127020 (array_inv!37163 a!2862)))

(declare-fun b!1492954 () Bool)

(declare-fun res!1015727 () Bool)

(assert (=> b!1492954 (=> (not res!1015727) (not e!836356))))

(declare-fun e!836354 () Bool)

(assert (=> b!1492954 (= res!1015727 e!836354)))

(declare-fun c!138144 () Bool)

(assert (=> b!1492954 (= c!138144 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492955 () Bool)

(declare-fun res!1015729 () Bool)

(assert (=> b!1492955 (=> (not res!1015729) (not e!836360))))

(declare-datatypes ((List!34636 0))(
  ( (Nil!34633) (Cons!34632 (h!36018 (_ BitVec 64)) (t!49330 List!34636)) )
))
(declare-fun arrayNoDuplicates!0 (array!99730 (_ BitVec 32) List!34636) Bool)

(assert (=> b!1492955 (= res!1015729 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34633))))

(declare-fun b!1492956 () Bool)

(assert (=> b!1492956 (= e!836355 e!836356)))

(declare-fun res!1015735 () Bool)

(assert (=> b!1492956 (=> (not res!1015735) (not e!836356))))

(declare-fun lt!650822 () SeekEntryResult!12375)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492956 (= res!1015735 (= lt!650822 (Intermediate!12375 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650826 () array!99730)

(declare-fun lt!650821 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492956 (= lt!650822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650821 mask!2687) lt!650821 lt!650826 mask!2687))))

(assert (=> b!1492956 (= lt!650821 (select (store (arr!48135 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492957 () Bool)

(declare-fun e!836358 () Bool)

(assert (=> b!1492957 (= e!836358 e!836355)))

(declare-fun res!1015730 () Bool)

(assert (=> b!1492957 (=> (not res!1015730) (not e!836355))))

(assert (=> b!1492957 (= res!1015730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48135 a!2862) j!93) mask!2687) (select (arr!48135 a!2862) j!93) a!2862 mask!2687) lt!650825))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1492957 (= lt!650825 (Intermediate!12375 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492958 () Bool)

(declare-fun res!1015721 () Bool)

(assert (=> b!1492958 (=> (not res!1015721) (not e!836360))))

(assert (=> b!1492958 (= res!1015721 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48685 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48685 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48685 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492959 () Bool)

(declare-fun res!1015734 () Bool)

(assert (=> b!1492959 (=> (not res!1015734) (not e!836353))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99730 (_ BitVec 32)) SeekEntryResult!12375)

(assert (=> b!1492959 (= res!1015734 (= (seekEntryOrOpen!0 (select (arr!48135 a!2862) j!93) a!2862 mask!2687) (Found!12375 j!93)))))

(declare-fun b!1492960 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99730 (_ BitVec 32)) SeekEntryResult!12375)

(assert (=> b!1492960 (= e!836354 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650821 lt!650826 mask!2687) (seekEntryOrOpen!0 lt!650821 lt!650826 mask!2687)))))

(declare-fun b!1492961 () Bool)

(assert (=> b!1492961 (= e!836360 e!836358)))

(declare-fun res!1015720 () Bool)

(assert (=> b!1492961 (=> (not res!1015720) (not e!836358))))

(assert (=> b!1492961 (= res!1015720 (= (select (store (arr!48135 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1492961 (= lt!650826 (array!99731 (store (arr!48135 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48685 a!2862)))))

(declare-fun b!1492962 () Bool)

(declare-fun res!1015731 () Bool)

(assert (=> b!1492962 (=> (not res!1015731) (not e!836360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492962 (= res!1015731 (validKeyInArray!0 (select (arr!48135 a!2862) j!93)))))

(declare-fun b!1492963 () Bool)

(declare-fun lt!650824 () (_ BitVec 32))

(assert (=> b!1492963 (= e!836357 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (and (bvsge lt!650824 #b00000000000000000000000000000000) (bvslt lt!650824 (size!48685 a!2862)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492963 (= lt!650824 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492964 () Bool)

(declare-fun res!1015726 () Bool)

(assert (=> b!1492964 (=> (not res!1015726) (not e!836356))))

(assert (=> b!1492964 (= res!1015726 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492965 () Bool)

(assert (=> b!1492965 (= e!836353 (or (= (select (arr!48135 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48135 a!2862) intermediateBeforeIndex!19) (select (arr!48135 a!2862) j!93))))))

(declare-fun b!1492966 () Bool)

(declare-fun res!1015732 () Bool)

(assert (=> b!1492966 (=> (not res!1015732) (not e!836360))))

(assert (=> b!1492966 (= res!1015732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492967 () Bool)

(assert (=> b!1492967 (= e!836354 (= lt!650822 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650821 lt!650826 mask!2687)))))

(declare-fun b!1492968 () Bool)

(declare-fun res!1015733 () Bool)

(assert (=> b!1492968 (=> (not res!1015733) (not e!836360))))

(assert (=> b!1492968 (= res!1015733 (validKeyInArray!0 (select (arr!48135 a!2862) i!1006)))))

(assert (= (and start!127020 res!1015723) b!1492952))

(assert (= (and b!1492952 res!1015724) b!1492968))

(assert (= (and b!1492968 res!1015733) b!1492962))

(assert (= (and b!1492962 res!1015731) b!1492966))

(assert (= (and b!1492966 res!1015732) b!1492955))

(assert (= (and b!1492955 res!1015729) b!1492958))

(assert (= (and b!1492958 res!1015721) b!1492961))

(assert (= (and b!1492961 res!1015720) b!1492957))

(assert (= (and b!1492957 res!1015730) b!1492951))

(assert (= (and b!1492951 res!1015722) b!1492956))

(assert (= (and b!1492956 res!1015735) b!1492954))

(assert (= (and b!1492954 c!138144) b!1492967))

(assert (= (and b!1492954 (not c!138144)) b!1492960))

(assert (= (and b!1492954 res!1015727) b!1492964))

(assert (= (and b!1492964 res!1015726) b!1492953))

(assert (= (and b!1492953 res!1015728) b!1492959))

(assert (= (and b!1492959 res!1015734) b!1492965))

(assert (= (and b!1492953 (not res!1015725)) b!1492963))

(declare-fun m!1376885 () Bool)

(assert (=> b!1492953 m!1376885))

(declare-fun m!1376887 () Bool)

(assert (=> b!1492953 m!1376887))

(declare-fun m!1376889 () Bool)

(assert (=> b!1492953 m!1376889))

(declare-fun m!1376891 () Bool)

(assert (=> b!1492953 m!1376891))

(declare-fun m!1376893 () Bool)

(assert (=> b!1492953 m!1376893))

(declare-fun m!1376895 () Bool)

(assert (=> b!1492953 m!1376895))

(assert (=> b!1492962 m!1376895))

(assert (=> b!1492962 m!1376895))

(declare-fun m!1376897 () Bool)

(assert (=> b!1492962 m!1376897))

(declare-fun m!1376899 () Bool)

(assert (=> start!127020 m!1376899))

(declare-fun m!1376901 () Bool)

(assert (=> start!127020 m!1376901))

(assert (=> b!1492961 m!1376887))

(declare-fun m!1376903 () Bool)

(assert (=> b!1492961 m!1376903))

(declare-fun m!1376905 () Bool)

(assert (=> b!1492967 m!1376905))

(declare-fun m!1376907 () Bool)

(assert (=> b!1492963 m!1376907))

(declare-fun m!1376909 () Bool)

(assert (=> b!1492955 m!1376909))

(assert (=> b!1492951 m!1376895))

(assert (=> b!1492951 m!1376895))

(declare-fun m!1376911 () Bool)

(assert (=> b!1492951 m!1376911))

(declare-fun m!1376913 () Bool)

(assert (=> b!1492968 m!1376913))

(assert (=> b!1492968 m!1376913))

(declare-fun m!1376915 () Bool)

(assert (=> b!1492968 m!1376915))

(assert (=> b!1492957 m!1376895))

(assert (=> b!1492957 m!1376895))

(declare-fun m!1376917 () Bool)

(assert (=> b!1492957 m!1376917))

(assert (=> b!1492957 m!1376917))

(assert (=> b!1492957 m!1376895))

(declare-fun m!1376919 () Bool)

(assert (=> b!1492957 m!1376919))

(declare-fun m!1376921 () Bool)

(assert (=> b!1492960 m!1376921))

(declare-fun m!1376923 () Bool)

(assert (=> b!1492960 m!1376923))

(declare-fun m!1376925 () Bool)

(assert (=> b!1492956 m!1376925))

(assert (=> b!1492956 m!1376925))

(declare-fun m!1376927 () Bool)

(assert (=> b!1492956 m!1376927))

(assert (=> b!1492956 m!1376887))

(declare-fun m!1376929 () Bool)

(assert (=> b!1492956 m!1376929))

(declare-fun m!1376931 () Bool)

(assert (=> b!1492965 m!1376931))

(assert (=> b!1492965 m!1376895))

(assert (=> b!1492959 m!1376895))

(assert (=> b!1492959 m!1376895))

(declare-fun m!1376933 () Bool)

(assert (=> b!1492959 m!1376933))

(declare-fun m!1376935 () Bool)

(assert (=> b!1492966 m!1376935))

(check-sat (not b!1492968) (not b!1492963) (not b!1492959) (not start!127020) (not b!1492956) (not b!1492966) (not b!1492953) (not b!1492962) (not b!1492967) (not b!1492951) (not b!1492955) (not b!1492960) (not b!1492957))
(check-sat)
(get-model)

(declare-fun d!156939 () Bool)

(assert (=> d!156939 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127020 d!156939))

(declare-fun d!156941 () Bool)

(assert (=> d!156941 (= (array_inv!37163 a!2862) (bvsge (size!48685 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127020 d!156941))

(declare-fun b!1493035 () Bool)

(declare-fun e!836393 () SeekEntryResult!12375)

(assert (=> b!1493035 (= e!836393 (Found!12375 index!646))))

(declare-fun e!836391 () SeekEntryResult!12375)

(declare-fun b!1493036 () Bool)

(assert (=> b!1493036 (= e!836391 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650821 lt!650826 mask!2687))))

(declare-fun b!1493037 () Bool)

(declare-fun e!836392 () SeekEntryResult!12375)

(assert (=> b!1493037 (= e!836392 e!836393)))

(declare-fun c!138154 () Bool)

(declare-fun lt!650849 () (_ BitVec 64))

(assert (=> b!1493037 (= c!138154 (= lt!650849 lt!650821))))

(declare-fun b!1493038 () Bool)

(assert (=> b!1493038 (= e!836391 (MissingVacant!12375 intermediateAfterIndex!19))))

(declare-fun b!1493039 () Bool)

(assert (=> b!1493039 (= e!836392 Undefined!12375)))

(declare-fun b!1493040 () Bool)

(declare-fun c!138156 () Bool)

(assert (=> b!1493040 (= c!138156 (= lt!650849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493040 (= e!836393 e!836391)))

(declare-fun d!156943 () Bool)

(declare-fun lt!650850 () SeekEntryResult!12375)

(get-info :version)

(assert (=> d!156943 (and (or ((_ is Undefined!12375) lt!650850) (not ((_ is Found!12375) lt!650850)) (and (bvsge (index!51893 lt!650850) #b00000000000000000000000000000000) (bvslt (index!51893 lt!650850) (size!48685 lt!650826)))) (or ((_ is Undefined!12375) lt!650850) ((_ is Found!12375) lt!650850) (not ((_ is MissingVacant!12375) lt!650850)) (not (= (index!51895 lt!650850) intermediateAfterIndex!19)) (and (bvsge (index!51895 lt!650850) #b00000000000000000000000000000000) (bvslt (index!51895 lt!650850) (size!48685 lt!650826)))) (or ((_ is Undefined!12375) lt!650850) (ite ((_ is Found!12375) lt!650850) (= (select (arr!48135 lt!650826) (index!51893 lt!650850)) lt!650821) (and ((_ is MissingVacant!12375) lt!650850) (= (index!51895 lt!650850) intermediateAfterIndex!19) (= (select (arr!48135 lt!650826) (index!51895 lt!650850)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156943 (= lt!650850 e!836392)))

(declare-fun c!138155 () Bool)

(assert (=> d!156943 (= c!138155 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156943 (= lt!650849 (select (arr!48135 lt!650826) index!646))))

(assert (=> d!156943 (validMask!0 mask!2687)))

(assert (=> d!156943 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650821 lt!650826 mask!2687) lt!650850)))

(assert (= (and d!156943 c!138155) b!1493039))

(assert (= (and d!156943 (not c!138155)) b!1493037))

(assert (= (and b!1493037 c!138154) b!1493035))

(assert (= (and b!1493037 (not c!138154)) b!1493040))

(assert (= (and b!1493040 c!138156) b!1493038))

(assert (= (and b!1493040 (not c!138156)) b!1493036))

(assert (=> b!1493036 m!1376907))

(assert (=> b!1493036 m!1376907))

(declare-fun m!1376989 () Bool)

(assert (=> b!1493036 m!1376989))

(declare-fun m!1376991 () Bool)

(assert (=> d!156943 m!1376991))

(declare-fun m!1376993 () Bool)

(assert (=> d!156943 m!1376993))

(declare-fun m!1376995 () Bool)

(assert (=> d!156943 m!1376995))

(assert (=> d!156943 m!1376899))

(assert (=> b!1492960 d!156943))

(declare-fun e!836401 () SeekEntryResult!12375)

(declare-fun b!1493053 () Bool)

(declare-fun lt!650858 () SeekEntryResult!12375)

(assert (=> b!1493053 (= e!836401 (seekKeyOrZeroReturnVacant!0 (x!133483 lt!650858) (index!51894 lt!650858) (index!51894 lt!650858) lt!650821 lt!650826 mask!2687))))

(declare-fun d!156945 () Bool)

(declare-fun lt!650857 () SeekEntryResult!12375)

(assert (=> d!156945 (and (or ((_ is Undefined!12375) lt!650857) (not ((_ is Found!12375) lt!650857)) (and (bvsge (index!51893 lt!650857) #b00000000000000000000000000000000) (bvslt (index!51893 lt!650857) (size!48685 lt!650826)))) (or ((_ is Undefined!12375) lt!650857) ((_ is Found!12375) lt!650857) (not ((_ is MissingZero!12375) lt!650857)) (and (bvsge (index!51892 lt!650857) #b00000000000000000000000000000000) (bvslt (index!51892 lt!650857) (size!48685 lt!650826)))) (or ((_ is Undefined!12375) lt!650857) ((_ is Found!12375) lt!650857) ((_ is MissingZero!12375) lt!650857) (not ((_ is MissingVacant!12375) lt!650857)) (and (bvsge (index!51895 lt!650857) #b00000000000000000000000000000000) (bvslt (index!51895 lt!650857) (size!48685 lt!650826)))) (or ((_ is Undefined!12375) lt!650857) (ite ((_ is Found!12375) lt!650857) (= (select (arr!48135 lt!650826) (index!51893 lt!650857)) lt!650821) (ite ((_ is MissingZero!12375) lt!650857) (= (select (arr!48135 lt!650826) (index!51892 lt!650857)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12375) lt!650857) (= (select (arr!48135 lt!650826) (index!51895 lt!650857)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!836402 () SeekEntryResult!12375)

(assert (=> d!156945 (= lt!650857 e!836402)))

(declare-fun c!138164 () Bool)

(assert (=> d!156945 (= c!138164 (and ((_ is Intermediate!12375) lt!650858) (undefined!13187 lt!650858)))))

(assert (=> d!156945 (= lt!650858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650821 mask!2687) lt!650821 lt!650826 mask!2687))))

(assert (=> d!156945 (validMask!0 mask!2687)))

(assert (=> d!156945 (= (seekEntryOrOpen!0 lt!650821 lt!650826 mask!2687) lt!650857)))

(declare-fun b!1493054 () Bool)

(declare-fun c!138163 () Bool)

(declare-fun lt!650859 () (_ BitVec 64))

(assert (=> b!1493054 (= c!138163 (= lt!650859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836400 () SeekEntryResult!12375)

(assert (=> b!1493054 (= e!836400 e!836401)))

(declare-fun b!1493055 () Bool)

(assert (=> b!1493055 (= e!836402 Undefined!12375)))

(declare-fun b!1493056 () Bool)

(assert (=> b!1493056 (= e!836402 e!836400)))

(assert (=> b!1493056 (= lt!650859 (select (arr!48135 lt!650826) (index!51894 lt!650858)))))

(declare-fun c!138165 () Bool)

(assert (=> b!1493056 (= c!138165 (= lt!650859 lt!650821))))

(declare-fun b!1493057 () Bool)

(assert (=> b!1493057 (= e!836400 (Found!12375 (index!51894 lt!650858)))))

(declare-fun b!1493058 () Bool)

(assert (=> b!1493058 (= e!836401 (MissingZero!12375 (index!51894 lt!650858)))))

(assert (= (and d!156945 c!138164) b!1493055))

(assert (= (and d!156945 (not c!138164)) b!1493056))

(assert (= (and b!1493056 c!138165) b!1493057))

(assert (= (and b!1493056 (not c!138165)) b!1493054))

(assert (= (and b!1493054 c!138163) b!1493058))

(assert (= (and b!1493054 (not c!138163)) b!1493053))

(declare-fun m!1376997 () Bool)

(assert (=> b!1493053 m!1376997))

(declare-fun m!1376999 () Bool)

(assert (=> d!156945 m!1376999))

(assert (=> d!156945 m!1376925))

(assert (=> d!156945 m!1376899))

(assert (=> d!156945 m!1376925))

(assert (=> d!156945 m!1376927))

(declare-fun m!1377001 () Bool)

(assert (=> d!156945 m!1377001))

(declare-fun m!1377003 () Bool)

(assert (=> d!156945 m!1377003))

(declare-fun m!1377005 () Bool)

(assert (=> b!1493056 m!1377005))

(assert (=> b!1492960 d!156945))

(declare-fun e!836404 () SeekEntryResult!12375)

(declare-fun b!1493059 () Bool)

(declare-fun lt!650861 () SeekEntryResult!12375)

(assert (=> b!1493059 (= e!836404 (seekKeyOrZeroReturnVacant!0 (x!133483 lt!650861) (index!51894 lt!650861) (index!51894 lt!650861) (select (arr!48135 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156947 () Bool)

(declare-fun lt!650860 () SeekEntryResult!12375)

(assert (=> d!156947 (and (or ((_ is Undefined!12375) lt!650860) (not ((_ is Found!12375) lt!650860)) (and (bvsge (index!51893 lt!650860) #b00000000000000000000000000000000) (bvslt (index!51893 lt!650860) (size!48685 a!2862)))) (or ((_ is Undefined!12375) lt!650860) ((_ is Found!12375) lt!650860) (not ((_ is MissingZero!12375) lt!650860)) (and (bvsge (index!51892 lt!650860) #b00000000000000000000000000000000) (bvslt (index!51892 lt!650860) (size!48685 a!2862)))) (or ((_ is Undefined!12375) lt!650860) ((_ is Found!12375) lt!650860) ((_ is MissingZero!12375) lt!650860) (not ((_ is MissingVacant!12375) lt!650860)) (and (bvsge (index!51895 lt!650860) #b00000000000000000000000000000000) (bvslt (index!51895 lt!650860) (size!48685 a!2862)))) (or ((_ is Undefined!12375) lt!650860) (ite ((_ is Found!12375) lt!650860) (= (select (arr!48135 a!2862) (index!51893 lt!650860)) (select (arr!48135 a!2862) j!93)) (ite ((_ is MissingZero!12375) lt!650860) (= (select (arr!48135 a!2862) (index!51892 lt!650860)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12375) lt!650860) (= (select (arr!48135 a!2862) (index!51895 lt!650860)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!836405 () SeekEntryResult!12375)

(assert (=> d!156947 (= lt!650860 e!836405)))

(declare-fun c!138167 () Bool)

(assert (=> d!156947 (= c!138167 (and ((_ is Intermediate!12375) lt!650861) (undefined!13187 lt!650861)))))

(assert (=> d!156947 (= lt!650861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48135 a!2862) j!93) mask!2687) (select (arr!48135 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156947 (validMask!0 mask!2687)))

(assert (=> d!156947 (= (seekEntryOrOpen!0 (select (arr!48135 a!2862) j!93) a!2862 mask!2687) lt!650860)))

(declare-fun b!1493060 () Bool)

(declare-fun c!138166 () Bool)

(declare-fun lt!650862 () (_ BitVec 64))

(assert (=> b!1493060 (= c!138166 (= lt!650862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!836403 () SeekEntryResult!12375)

(assert (=> b!1493060 (= e!836403 e!836404)))

(declare-fun b!1493061 () Bool)

(assert (=> b!1493061 (= e!836405 Undefined!12375)))

(declare-fun b!1493062 () Bool)

(assert (=> b!1493062 (= e!836405 e!836403)))

(assert (=> b!1493062 (= lt!650862 (select (arr!48135 a!2862) (index!51894 lt!650861)))))

(declare-fun c!138168 () Bool)

(assert (=> b!1493062 (= c!138168 (= lt!650862 (select (arr!48135 a!2862) j!93)))))

(declare-fun b!1493063 () Bool)

(assert (=> b!1493063 (= e!836403 (Found!12375 (index!51894 lt!650861)))))

(declare-fun b!1493064 () Bool)

(assert (=> b!1493064 (= e!836404 (MissingZero!12375 (index!51894 lt!650861)))))

(assert (= (and d!156947 c!138167) b!1493061))

(assert (= (and d!156947 (not c!138167)) b!1493062))

(assert (= (and b!1493062 c!138168) b!1493063))

(assert (= (and b!1493062 (not c!138168)) b!1493060))

(assert (= (and b!1493060 c!138166) b!1493064))

(assert (= (and b!1493060 (not c!138166)) b!1493059))

(assert (=> b!1493059 m!1376895))

(declare-fun m!1377007 () Bool)

(assert (=> b!1493059 m!1377007))

(declare-fun m!1377009 () Bool)

(assert (=> d!156947 m!1377009))

(assert (=> d!156947 m!1376895))

(assert (=> d!156947 m!1376917))

(assert (=> d!156947 m!1376899))

(assert (=> d!156947 m!1376917))

(assert (=> d!156947 m!1376895))

(assert (=> d!156947 m!1376919))

(declare-fun m!1377011 () Bool)

(assert (=> d!156947 m!1377011))

(declare-fun m!1377013 () Bool)

(assert (=> d!156947 m!1377013))

(declare-fun m!1377015 () Bool)

(assert (=> b!1493062 m!1377015))

(assert (=> b!1492959 d!156947))

(declare-fun b!1493095 () Bool)

(declare-fun e!836424 () Bool)

(declare-fun e!836423 () Bool)

(assert (=> b!1493095 (= e!836424 e!836423)))

(declare-fun res!1015791 () Bool)

(declare-fun lt!650872 () SeekEntryResult!12375)

(assert (=> b!1493095 (= res!1015791 (and ((_ is Intermediate!12375) lt!650872) (not (undefined!13187 lt!650872)) (bvslt (x!133483 lt!650872) #b01111111111111111111111111111110) (bvsge (x!133483 lt!650872) #b00000000000000000000000000000000) (bvsge (x!133483 lt!650872) #b00000000000000000000000000000000)))))

(assert (=> b!1493095 (=> (not res!1015791) (not e!836423))))

(declare-fun b!1493096 () Bool)

(declare-fun e!836425 () SeekEntryResult!12375)

(assert (=> b!1493096 (= e!836425 (Intermediate!12375 false (toIndex!0 (select (arr!48135 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493097 () Bool)

(declare-fun e!836426 () SeekEntryResult!12375)

(assert (=> b!1493097 (= e!836426 (Intermediate!12375 true (toIndex!0 (select (arr!48135 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493098 () Bool)

(assert (=> b!1493098 (and (bvsge (index!51894 lt!650872) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650872) (size!48685 a!2862)))))

(declare-fun e!836422 () Bool)

(assert (=> b!1493098 (= e!836422 (= (select (arr!48135 a!2862) (index!51894 lt!650872)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493099 () Bool)

(assert (=> b!1493099 (= e!836424 (bvsge (x!133483 lt!650872) #b01111111111111111111111111111110))))

(declare-fun d!156949 () Bool)

(assert (=> d!156949 e!836424))

(declare-fun c!138182 () Bool)

(assert (=> d!156949 (= c!138182 (and ((_ is Intermediate!12375) lt!650872) (undefined!13187 lt!650872)))))

(assert (=> d!156949 (= lt!650872 e!836426)))

(declare-fun c!138181 () Bool)

(assert (=> d!156949 (= c!138181 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!650871 () (_ BitVec 64))

(assert (=> d!156949 (= lt!650871 (select (arr!48135 a!2862) (toIndex!0 (select (arr!48135 a!2862) j!93) mask!2687)))))

(assert (=> d!156949 (validMask!0 mask!2687)))

(assert (=> d!156949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48135 a!2862) j!93) mask!2687) (select (arr!48135 a!2862) j!93) a!2862 mask!2687) lt!650872)))

(declare-fun b!1493100 () Bool)

(assert (=> b!1493100 (and (bvsge (index!51894 lt!650872) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650872) (size!48685 a!2862)))))

(declare-fun res!1015792 () Bool)

(assert (=> b!1493100 (= res!1015792 (= (select (arr!48135 a!2862) (index!51894 lt!650872)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493100 (=> res!1015792 e!836422)))

(declare-fun b!1493101 () Bool)

(assert (=> b!1493101 (= e!836425 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48135 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48135 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493102 () Bool)

(assert (=> b!1493102 (= e!836426 e!836425)))

(declare-fun c!138183 () Bool)

(assert (=> b!1493102 (= c!138183 (or (= lt!650871 (select (arr!48135 a!2862) j!93)) (= (bvadd lt!650871 lt!650871) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493103 () Bool)

(assert (=> b!1493103 (and (bvsge (index!51894 lt!650872) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650872) (size!48685 a!2862)))))

(declare-fun res!1015790 () Bool)

(assert (=> b!1493103 (= res!1015790 (= (select (arr!48135 a!2862) (index!51894 lt!650872)) (select (arr!48135 a!2862) j!93)))))

(assert (=> b!1493103 (=> res!1015790 e!836422)))

(assert (=> b!1493103 (= e!836423 e!836422)))

(assert (= (and d!156949 c!138181) b!1493097))

(assert (= (and d!156949 (not c!138181)) b!1493102))

(assert (= (and b!1493102 c!138183) b!1493096))

(assert (= (and b!1493102 (not c!138183)) b!1493101))

(assert (= (and d!156949 c!138182) b!1493099))

(assert (= (and d!156949 (not c!138182)) b!1493095))

(assert (= (and b!1493095 res!1015791) b!1493103))

(assert (= (and b!1493103 (not res!1015790)) b!1493100))

(assert (= (and b!1493100 (not res!1015792)) b!1493098))

(declare-fun m!1377017 () Bool)

(assert (=> b!1493098 m!1377017))

(assert (=> b!1493100 m!1377017))

(assert (=> b!1493103 m!1377017))

(assert (=> b!1493101 m!1376917))

(declare-fun m!1377019 () Bool)

(assert (=> b!1493101 m!1377019))

(assert (=> b!1493101 m!1377019))

(assert (=> b!1493101 m!1376895))

(declare-fun m!1377021 () Bool)

(assert (=> b!1493101 m!1377021))

(assert (=> d!156949 m!1376917))

(declare-fun m!1377023 () Bool)

(assert (=> d!156949 m!1377023))

(assert (=> d!156949 m!1376899))

(assert (=> b!1492957 d!156949))

(declare-fun d!156959 () Bool)

(declare-fun lt!650880 () (_ BitVec 32))

(declare-fun lt!650879 () (_ BitVec 32))

(assert (=> d!156959 (= lt!650880 (bvmul (bvxor lt!650879 (bvlshr lt!650879 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156959 (= lt!650879 ((_ extract 31 0) (bvand (bvxor (select (arr!48135 a!2862) j!93) (bvlshr (select (arr!48135 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156959 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015793 (let ((h!36020 ((_ extract 31 0) (bvand (bvxor (select (arr!48135 a!2862) j!93) (bvlshr (select (arr!48135 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133488 (bvmul (bvxor h!36020 (bvlshr h!36020 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133488 (bvlshr x!133488 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015793 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015793 #b00000000000000000000000000000000))))))

(assert (=> d!156959 (= (toIndex!0 (select (arr!48135 a!2862) j!93) mask!2687) (bvand (bvxor lt!650880 (bvlshr lt!650880 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492957 d!156959))

(declare-fun d!156963 () Bool)

(assert (=> d!156963 (= (validKeyInArray!0 (select (arr!48135 a!2862) i!1006)) (and (not (= (select (arr!48135 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48135 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492968 d!156963))

(declare-fun b!1493110 () Bool)

(declare-fun e!836432 () Bool)

(declare-fun e!836431 () Bool)

(assert (=> b!1493110 (= e!836432 e!836431)))

(declare-fun res!1015795 () Bool)

(declare-fun lt!650882 () SeekEntryResult!12375)

(assert (=> b!1493110 (= res!1015795 (and ((_ is Intermediate!12375) lt!650882) (not (undefined!13187 lt!650882)) (bvslt (x!133483 lt!650882) #b01111111111111111111111111111110) (bvsge (x!133483 lt!650882) #b00000000000000000000000000000000) (bvsge (x!133483 lt!650882) x!665)))))

(assert (=> b!1493110 (=> (not res!1015795) (not e!836431))))

(declare-fun b!1493111 () Bool)

(declare-fun e!836433 () SeekEntryResult!12375)

(assert (=> b!1493111 (= e!836433 (Intermediate!12375 false index!646 x!665))))

(declare-fun b!1493112 () Bool)

(declare-fun e!836434 () SeekEntryResult!12375)

(assert (=> b!1493112 (= e!836434 (Intermediate!12375 true index!646 x!665))))

(declare-fun b!1493113 () Bool)

(assert (=> b!1493113 (and (bvsge (index!51894 lt!650882) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650882) (size!48685 lt!650826)))))

(declare-fun e!836430 () Bool)

(assert (=> b!1493113 (= e!836430 (= (select (arr!48135 lt!650826) (index!51894 lt!650882)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493114 () Bool)

(assert (=> b!1493114 (= e!836432 (bvsge (x!133483 lt!650882) #b01111111111111111111111111111110))))

(declare-fun d!156965 () Bool)

(assert (=> d!156965 e!836432))

(declare-fun c!138188 () Bool)

(assert (=> d!156965 (= c!138188 (and ((_ is Intermediate!12375) lt!650882) (undefined!13187 lt!650882)))))

(assert (=> d!156965 (= lt!650882 e!836434)))

(declare-fun c!138187 () Bool)

(assert (=> d!156965 (= c!138187 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!650881 () (_ BitVec 64))

(assert (=> d!156965 (= lt!650881 (select (arr!48135 lt!650826) index!646))))

(assert (=> d!156965 (validMask!0 mask!2687)))

(assert (=> d!156965 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650821 lt!650826 mask!2687) lt!650882)))

(declare-fun b!1493115 () Bool)

(assert (=> b!1493115 (and (bvsge (index!51894 lt!650882) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650882) (size!48685 lt!650826)))))

(declare-fun res!1015796 () Bool)

(assert (=> b!1493115 (= res!1015796 (= (select (arr!48135 lt!650826) (index!51894 lt!650882)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493115 (=> res!1015796 e!836430)))

(declare-fun b!1493116 () Bool)

(assert (=> b!1493116 (= e!836433 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650821 lt!650826 mask!2687))))

(declare-fun b!1493117 () Bool)

(assert (=> b!1493117 (= e!836434 e!836433)))

(declare-fun c!138189 () Bool)

(assert (=> b!1493117 (= c!138189 (or (= lt!650881 lt!650821) (= (bvadd lt!650881 lt!650881) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493118 () Bool)

(assert (=> b!1493118 (and (bvsge (index!51894 lt!650882) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650882) (size!48685 lt!650826)))))

(declare-fun res!1015794 () Bool)

(assert (=> b!1493118 (= res!1015794 (= (select (arr!48135 lt!650826) (index!51894 lt!650882)) lt!650821))))

(assert (=> b!1493118 (=> res!1015794 e!836430)))

(assert (=> b!1493118 (= e!836431 e!836430)))

(assert (= (and d!156965 c!138187) b!1493112))

(assert (= (and d!156965 (not c!138187)) b!1493117))

(assert (= (and b!1493117 c!138189) b!1493111))

(assert (= (and b!1493117 (not c!138189)) b!1493116))

(assert (= (and d!156965 c!138188) b!1493114))

(assert (= (and d!156965 (not c!138188)) b!1493110))

(assert (= (and b!1493110 res!1015795) b!1493118))

(assert (= (and b!1493118 (not res!1015794)) b!1493115))

(assert (= (and b!1493115 (not res!1015796)) b!1493113))

(declare-fun m!1377033 () Bool)

(assert (=> b!1493113 m!1377033))

(assert (=> b!1493115 m!1377033))

(assert (=> b!1493118 m!1377033))

(assert (=> b!1493116 m!1376907))

(assert (=> b!1493116 m!1376907))

(declare-fun m!1377035 () Bool)

(assert (=> b!1493116 m!1377035))

(assert (=> d!156965 m!1376995))

(assert (=> d!156965 m!1376899))

(assert (=> b!1492967 d!156965))

(declare-fun b!1493119 () Bool)

(declare-fun e!836437 () Bool)

(declare-fun e!836436 () Bool)

(assert (=> b!1493119 (= e!836437 e!836436)))

(declare-fun res!1015798 () Bool)

(declare-fun lt!650884 () SeekEntryResult!12375)

(assert (=> b!1493119 (= res!1015798 (and ((_ is Intermediate!12375) lt!650884) (not (undefined!13187 lt!650884)) (bvslt (x!133483 lt!650884) #b01111111111111111111111111111110) (bvsge (x!133483 lt!650884) #b00000000000000000000000000000000) (bvsge (x!133483 lt!650884) #b00000000000000000000000000000000)))))

(assert (=> b!1493119 (=> (not res!1015798) (not e!836436))))

(declare-fun b!1493120 () Bool)

(declare-fun e!836438 () SeekEntryResult!12375)

(assert (=> b!1493120 (= e!836438 (Intermediate!12375 false (toIndex!0 lt!650821 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493121 () Bool)

(declare-fun e!836439 () SeekEntryResult!12375)

(assert (=> b!1493121 (= e!836439 (Intermediate!12375 true (toIndex!0 lt!650821 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1493122 () Bool)

(assert (=> b!1493122 (and (bvsge (index!51894 lt!650884) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650884) (size!48685 lt!650826)))))

(declare-fun e!836435 () Bool)

(assert (=> b!1493122 (= e!836435 (= (select (arr!48135 lt!650826) (index!51894 lt!650884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493123 () Bool)

(assert (=> b!1493123 (= e!836437 (bvsge (x!133483 lt!650884) #b01111111111111111111111111111110))))

(declare-fun d!156967 () Bool)

(assert (=> d!156967 e!836437))

(declare-fun c!138191 () Bool)

(assert (=> d!156967 (= c!138191 (and ((_ is Intermediate!12375) lt!650884) (undefined!13187 lt!650884)))))

(assert (=> d!156967 (= lt!650884 e!836439)))

(declare-fun c!138190 () Bool)

(assert (=> d!156967 (= c!138190 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!650883 () (_ BitVec 64))

(assert (=> d!156967 (= lt!650883 (select (arr!48135 lt!650826) (toIndex!0 lt!650821 mask!2687)))))

(assert (=> d!156967 (validMask!0 mask!2687)))

(assert (=> d!156967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650821 mask!2687) lt!650821 lt!650826 mask!2687) lt!650884)))

(declare-fun b!1493124 () Bool)

(assert (=> b!1493124 (and (bvsge (index!51894 lt!650884) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650884) (size!48685 lt!650826)))))

(declare-fun res!1015799 () Bool)

(assert (=> b!1493124 (= res!1015799 (= (select (arr!48135 lt!650826) (index!51894 lt!650884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493124 (=> res!1015799 e!836435)))

(declare-fun b!1493125 () Bool)

(assert (=> b!1493125 (= e!836438 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!650821 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!650821 lt!650826 mask!2687))))

(declare-fun b!1493126 () Bool)

(assert (=> b!1493126 (= e!836439 e!836438)))

(declare-fun c!138192 () Bool)

(assert (=> b!1493126 (= c!138192 (or (= lt!650883 lt!650821) (= (bvadd lt!650883 lt!650883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493127 () Bool)

(assert (=> b!1493127 (and (bvsge (index!51894 lt!650884) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650884) (size!48685 lt!650826)))))

(declare-fun res!1015797 () Bool)

(assert (=> b!1493127 (= res!1015797 (= (select (arr!48135 lt!650826) (index!51894 lt!650884)) lt!650821))))

(assert (=> b!1493127 (=> res!1015797 e!836435)))

(assert (=> b!1493127 (= e!836436 e!836435)))

(assert (= (and d!156967 c!138190) b!1493121))

(assert (= (and d!156967 (not c!138190)) b!1493126))

(assert (= (and b!1493126 c!138192) b!1493120))

(assert (= (and b!1493126 (not c!138192)) b!1493125))

(assert (= (and d!156967 c!138191) b!1493123))

(assert (= (and d!156967 (not c!138191)) b!1493119))

(assert (= (and b!1493119 res!1015798) b!1493127))

(assert (= (and b!1493127 (not res!1015797)) b!1493124))

(assert (= (and b!1493124 (not res!1015799)) b!1493122))

(declare-fun m!1377037 () Bool)

(assert (=> b!1493122 m!1377037))

(assert (=> b!1493124 m!1377037))

(assert (=> b!1493127 m!1377037))

(assert (=> b!1493125 m!1376925))

(declare-fun m!1377039 () Bool)

(assert (=> b!1493125 m!1377039))

(assert (=> b!1493125 m!1377039))

(declare-fun m!1377041 () Bool)

(assert (=> b!1493125 m!1377041))

(assert (=> d!156967 m!1376925))

(declare-fun m!1377043 () Bool)

(assert (=> d!156967 m!1377043))

(assert (=> d!156967 m!1376899))

(assert (=> b!1492956 d!156967))

(declare-fun d!156969 () Bool)

(declare-fun lt!650886 () (_ BitVec 32))

(declare-fun lt!650885 () (_ BitVec 32))

(assert (=> d!156969 (= lt!650886 (bvmul (bvxor lt!650885 (bvlshr lt!650885 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156969 (= lt!650885 ((_ extract 31 0) (bvand (bvxor lt!650821 (bvlshr lt!650821 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156969 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015793 (let ((h!36020 ((_ extract 31 0) (bvand (bvxor lt!650821 (bvlshr lt!650821 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133488 (bvmul (bvxor h!36020 (bvlshr h!36020 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133488 (bvlshr x!133488 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015793 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015793 #b00000000000000000000000000000000))))))

(assert (=> d!156969 (= (toIndex!0 lt!650821 mask!2687) (bvand (bvxor lt!650886 (bvlshr lt!650886 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1492956 d!156969))

(declare-fun b!1493156 () Bool)

(declare-fun e!836459 () Bool)

(declare-fun call!67960 () Bool)

(assert (=> b!1493156 (= e!836459 call!67960)))

(declare-fun b!1493158 () Bool)

(assert (=> b!1493158 (= e!836459 call!67960)))

(declare-fun bm!67957 () Bool)

(declare-fun c!138201 () Bool)

(assert (=> bm!67957 (= call!67960 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138201 (Cons!34632 (select (arr!48135 a!2862) #b00000000000000000000000000000000) Nil!34633) Nil!34633)))))

(declare-fun b!1493159 () Bool)

(declare-fun e!836460 () Bool)

(declare-fun contains!9927 (List!34636 (_ BitVec 64)) Bool)

(assert (=> b!1493159 (= e!836460 (contains!9927 Nil!34633 (select (arr!48135 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493160 () Bool)

(declare-fun e!836458 () Bool)

(assert (=> b!1493160 (= e!836458 e!836459)))

(assert (=> b!1493160 (= c!138201 (validKeyInArray!0 (select (arr!48135 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1493157 () Bool)

(declare-fun e!836461 () Bool)

(assert (=> b!1493157 (= e!836461 e!836458)))

(declare-fun res!1015814 () Bool)

(assert (=> b!1493157 (=> (not res!1015814) (not e!836458))))

(assert (=> b!1493157 (= res!1015814 (not e!836460))))

(declare-fun res!1015813 () Bool)

(assert (=> b!1493157 (=> (not res!1015813) (not e!836460))))

(assert (=> b!1493157 (= res!1015813 (validKeyInArray!0 (select (arr!48135 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156971 () Bool)

(declare-fun res!1015812 () Bool)

(assert (=> d!156971 (=> res!1015812 e!836461)))

(assert (=> d!156971 (= res!1015812 (bvsge #b00000000000000000000000000000000 (size!48685 a!2862)))))

(assert (=> d!156971 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34633) e!836461)))

(assert (= (and d!156971 (not res!1015812)) b!1493157))

(assert (= (and b!1493157 res!1015813) b!1493159))

(assert (= (and b!1493157 res!1015814) b!1493160))

(assert (= (and b!1493160 c!138201) b!1493158))

(assert (= (and b!1493160 (not c!138201)) b!1493156))

(assert (= (or b!1493158 b!1493156) bm!67957))

(declare-fun m!1377045 () Bool)

(assert (=> bm!67957 m!1377045))

(declare-fun m!1377047 () Bool)

(assert (=> bm!67957 m!1377047))

(assert (=> b!1493159 m!1377045))

(assert (=> b!1493159 m!1377045))

(declare-fun m!1377049 () Bool)

(assert (=> b!1493159 m!1377049))

(assert (=> b!1493160 m!1377045))

(assert (=> b!1493160 m!1377045))

(declare-fun m!1377051 () Bool)

(assert (=> b!1493160 m!1377051))

(assert (=> b!1493157 m!1377045))

(assert (=> b!1493157 m!1377045))

(assert (=> b!1493157 m!1377051))

(assert (=> b!1492955 d!156971))

(declare-fun b!1493196 () Bool)

(declare-fun e!836484 () Bool)

(declare-fun e!836483 () Bool)

(assert (=> b!1493196 (= e!836484 e!836483)))

(declare-fun lt!650914 () (_ BitVec 64))

(assert (=> b!1493196 (= lt!650914 (select (arr!48135 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!650915 () Unit!50090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99730 (_ BitVec 64) (_ BitVec 32)) Unit!50090)

(assert (=> b!1493196 (= lt!650915 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650914 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1493196 (arrayContainsKey!0 a!2862 lt!650914 #b00000000000000000000000000000000)))

(declare-fun lt!650916 () Unit!50090)

(assert (=> b!1493196 (= lt!650916 lt!650915)))

(declare-fun res!1015823 () Bool)

(assert (=> b!1493196 (= res!1015823 (= (seekEntryOrOpen!0 (select (arr!48135 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12375 #b00000000000000000000000000000000)))))

(assert (=> b!1493196 (=> (not res!1015823) (not e!836483))))

(declare-fun d!156973 () Bool)

(declare-fun res!1015824 () Bool)

(declare-fun e!836482 () Bool)

(assert (=> d!156973 (=> res!1015824 e!836482)))

(assert (=> d!156973 (= res!1015824 (bvsge #b00000000000000000000000000000000 (size!48685 a!2862)))))

(assert (=> d!156973 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!836482)))

(declare-fun bm!67960 () Bool)

(declare-fun call!67963 () Bool)

(assert (=> bm!67960 (= call!67963 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1493197 () Bool)

(assert (=> b!1493197 (= e!836483 call!67963)))

(declare-fun b!1493198 () Bool)

(assert (=> b!1493198 (= e!836484 call!67963)))

(declare-fun b!1493199 () Bool)

(assert (=> b!1493199 (= e!836482 e!836484)))

(declare-fun c!138216 () Bool)

(assert (=> b!1493199 (= c!138216 (validKeyInArray!0 (select (arr!48135 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156973 (not res!1015824)) b!1493199))

(assert (= (and b!1493199 c!138216) b!1493196))

(assert (= (and b!1493199 (not c!138216)) b!1493198))

(assert (= (and b!1493196 res!1015823) b!1493197))

(assert (= (or b!1493197 b!1493198) bm!67960))

(assert (=> b!1493196 m!1377045))

(declare-fun m!1377071 () Bool)

(assert (=> b!1493196 m!1377071))

(declare-fun m!1377073 () Bool)

(assert (=> b!1493196 m!1377073))

(assert (=> b!1493196 m!1377045))

(declare-fun m!1377075 () Bool)

(assert (=> b!1493196 m!1377075))

(declare-fun m!1377077 () Bool)

(assert (=> bm!67960 m!1377077))

(assert (=> b!1493199 m!1377045))

(assert (=> b!1493199 m!1377045))

(assert (=> b!1493199 m!1377051))

(assert (=> b!1492966 d!156973))

(declare-fun b!1493200 () Bool)

(declare-fun e!836487 () Bool)

(declare-fun e!836486 () Bool)

(assert (=> b!1493200 (= e!836487 e!836486)))

(declare-fun lt!650917 () (_ BitVec 64))

(assert (=> b!1493200 (= lt!650917 (select (arr!48135 a!2862) j!93))))

(declare-fun lt!650918 () Unit!50090)

(assert (=> b!1493200 (= lt!650918 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650917 j!93))))

(assert (=> b!1493200 (arrayContainsKey!0 a!2862 lt!650917 #b00000000000000000000000000000000)))

(declare-fun lt!650919 () Unit!50090)

(assert (=> b!1493200 (= lt!650919 lt!650918)))

(declare-fun res!1015825 () Bool)

(assert (=> b!1493200 (= res!1015825 (= (seekEntryOrOpen!0 (select (arr!48135 a!2862) j!93) a!2862 mask!2687) (Found!12375 j!93)))))

(assert (=> b!1493200 (=> (not res!1015825) (not e!836486))))

(declare-fun d!156983 () Bool)

(declare-fun res!1015826 () Bool)

(declare-fun e!836485 () Bool)

(assert (=> d!156983 (=> res!1015826 e!836485)))

(assert (=> d!156983 (= res!1015826 (bvsge j!93 (size!48685 a!2862)))))

(assert (=> d!156983 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!836485)))

(declare-fun call!67964 () Bool)

(declare-fun bm!67961 () Bool)

(assert (=> bm!67961 (= call!67964 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1493201 () Bool)

(assert (=> b!1493201 (= e!836486 call!67964)))

(declare-fun b!1493202 () Bool)

(assert (=> b!1493202 (= e!836487 call!67964)))

(declare-fun b!1493203 () Bool)

(assert (=> b!1493203 (= e!836485 e!836487)))

(declare-fun c!138217 () Bool)

(assert (=> b!1493203 (= c!138217 (validKeyInArray!0 (select (arr!48135 a!2862) j!93)))))

(assert (= (and d!156983 (not res!1015826)) b!1493203))

(assert (= (and b!1493203 c!138217) b!1493200))

(assert (= (and b!1493203 (not c!138217)) b!1493202))

(assert (= (and b!1493200 res!1015825) b!1493201))

(assert (= (or b!1493201 b!1493202) bm!67961))

(assert (=> b!1493200 m!1376895))

(declare-fun m!1377079 () Bool)

(assert (=> b!1493200 m!1377079))

(declare-fun m!1377081 () Bool)

(assert (=> b!1493200 m!1377081))

(assert (=> b!1493200 m!1376895))

(assert (=> b!1493200 m!1376933))

(declare-fun m!1377083 () Bool)

(assert (=> bm!67961 m!1377083))

(assert (=> b!1493203 m!1376895))

(assert (=> b!1493203 m!1376895))

(assert (=> b!1493203 m!1376897))

(assert (=> b!1492953 d!156983))

(declare-fun d!156985 () Bool)

(assert (=> d!156985 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!650922 () Unit!50090)

(declare-fun choose!38 (array!99730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50090)

(assert (=> d!156985 (= lt!650922 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156985 (validMask!0 mask!2687)))

(assert (=> d!156985 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!650922)))

(declare-fun bs!42875 () Bool)

(assert (= bs!42875 d!156985))

(assert (=> bs!42875 m!1376893))

(declare-fun m!1377085 () Bool)

(assert (=> bs!42875 m!1377085))

(assert (=> bs!42875 m!1376899))

(assert (=> b!1492953 d!156985))

(declare-fun d!156987 () Bool)

(declare-fun lt!650925 () (_ BitVec 32))

(assert (=> d!156987 (and (bvsge lt!650925 #b00000000000000000000000000000000) (bvslt lt!650925 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156987 (= lt!650925 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156987 (validMask!0 mask!2687)))

(assert (=> d!156987 (= (nextIndex!0 index!646 x!665 mask!2687) lt!650925)))

(declare-fun bs!42876 () Bool)

(assert (= bs!42876 d!156987))

(declare-fun m!1377087 () Bool)

(assert (=> bs!42876 m!1377087))

(assert (=> bs!42876 m!1376899))

(assert (=> b!1492963 d!156987))

(declare-fun b!1493204 () Bool)

(declare-fun e!836490 () Bool)

(declare-fun e!836489 () Bool)

(assert (=> b!1493204 (= e!836490 e!836489)))

(declare-fun res!1015828 () Bool)

(declare-fun lt!650927 () SeekEntryResult!12375)

(assert (=> b!1493204 (= res!1015828 (and ((_ is Intermediate!12375) lt!650927) (not (undefined!13187 lt!650927)) (bvslt (x!133483 lt!650927) #b01111111111111111111111111111110) (bvsge (x!133483 lt!650927) #b00000000000000000000000000000000) (bvsge (x!133483 lt!650927) x!665)))))

(assert (=> b!1493204 (=> (not res!1015828) (not e!836489))))

(declare-fun b!1493205 () Bool)

(declare-fun e!836491 () SeekEntryResult!12375)

(assert (=> b!1493205 (= e!836491 (Intermediate!12375 false index!646 x!665))))

(declare-fun b!1493206 () Bool)

(declare-fun e!836492 () SeekEntryResult!12375)

(assert (=> b!1493206 (= e!836492 (Intermediate!12375 true index!646 x!665))))

(declare-fun b!1493207 () Bool)

(assert (=> b!1493207 (and (bvsge (index!51894 lt!650927) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650927) (size!48685 a!2862)))))

(declare-fun e!836488 () Bool)

(assert (=> b!1493207 (= e!836488 (= (select (arr!48135 a!2862) (index!51894 lt!650927)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1493208 () Bool)

(assert (=> b!1493208 (= e!836490 (bvsge (x!133483 lt!650927) #b01111111111111111111111111111110))))

(declare-fun d!156989 () Bool)

(assert (=> d!156989 e!836490))

(declare-fun c!138219 () Bool)

(assert (=> d!156989 (= c!138219 (and ((_ is Intermediate!12375) lt!650927) (undefined!13187 lt!650927)))))

(assert (=> d!156989 (= lt!650927 e!836492)))

(declare-fun c!138218 () Bool)

(assert (=> d!156989 (= c!138218 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!650926 () (_ BitVec 64))

(assert (=> d!156989 (= lt!650926 (select (arr!48135 a!2862) index!646))))

(assert (=> d!156989 (validMask!0 mask!2687)))

(assert (=> d!156989 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48135 a!2862) j!93) a!2862 mask!2687) lt!650927)))

(declare-fun b!1493209 () Bool)

(assert (=> b!1493209 (and (bvsge (index!51894 lt!650927) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650927) (size!48685 a!2862)))))

(declare-fun res!1015829 () Bool)

(assert (=> b!1493209 (= res!1015829 (= (select (arr!48135 a!2862) (index!51894 lt!650927)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493209 (=> res!1015829 e!836488)))

(declare-fun b!1493210 () Bool)

(assert (=> b!1493210 (= e!836491 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48135 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1493211 () Bool)

(assert (=> b!1493211 (= e!836492 e!836491)))

(declare-fun c!138220 () Bool)

(assert (=> b!1493211 (= c!138220 (or (= lt!650926 (select (arr!48135 a!2862) j!93)) (= (bvadd lt!650926 lt!650926) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1493212 () Bool)

(assert (=> b!1493212 (and (bvsge (index!51894 lt!650927) #b00000000000000000000000000000000) (bvslt (index!51894 lt!650927) (size!48685 a!2862)))))

(declare-fun res!1015827 () Bool)

(assert (=> b!1493212 (= res!1015827 (= (select (arr!48135 a!2862) (index!51894 lt!650927)) (select (arr!48135 a!2862) j!93)))))

(assert (=> b!1493212 (=> res!1015827 e!836488)))

(assert (=> b!1493212 (= e!836489 e!836488)))

(assert (= (and d!156989 c!138218) b!1493206))

(assert (= (and d!156989 (not c!138218)) b!1493211))

(assert (= (and b!1493211 c!138220) b!1493205))

(assert (= (and b!1493211 (not c!138220)) b!1493210))

(assert (= (and d!156989 c!138219) b!1493208))

(assert (= (and d!156989 (not c!138219)) b!1493204))

(assert (= (and b!1493204 res!1015828) b!1493212))

(assert (= (and b!1493212 (not res!1015827)) b!1493209))

(assert (= (and b!1493209 (not res!1015829)) b!1493207))

(declare-fun m!1377089 () Bool)

(assert (=> b!1493207 m!1377089))

(assert (=> b!1493209 m!1377089))

(assert (=> b!1493212 m!1377089))

(assert (=> b!1493210 m!1376907))

(assert (=> b!1493210 m!1376907))

(assert (=> b!1493210 m!1376895))

(declare-fun m!1377091 () Bool)

(assert (=> b!1493210 m!1377091))

(assert (=> d!156989 m!1376891))

(assert (=> d!156989 m!1376899))

(assert (=> b!1492951 d!156989))

(declare-fun d!156995 () Bool)

(assert (=> d!156995 (= (validKeyInArray!0 (select (arr!48135 a!2862) j!93)) (and (not (= (select (arr!48135 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48135 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1492962 d!156995))

(check-sat (not b!1493160) (not d!156945) (not d!156967) (not b!1493116) (not d!156949) (not bm!67957) (not b!1493196) (not d!156985) (not d!156965) (not d!156987) (not b!1493157) (not b!1493059) (not b!1493159) (not b!1493203) (not b!1493053) (not d!156989) (not d!156943) (not b!1493199) (not b!1493200) (not bm!67961) (not b!1493101) (not bm!67960) (not b!1493210) (not b!1493036) (not d!156947) (not b!1493125))
(check-sat)
