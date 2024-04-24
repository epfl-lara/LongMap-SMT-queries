; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126948 () Bool)

(assert start!126948)

(declare-fun b!1488907 () Bool)

(declare-fun res!1012103 () Bool)

(declare-fun e!834700 () Bool)

(assert (=> b!1488907 (=> (not res!1012103) (not e!834700))))

(declare-datatypes ((array!99685 0))(
  ( (array!99686 (arr!48112 (Array (_ BitVec 32) (_ BitVec 64))) (size!48663 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99685)

(declare-datatypes ((List!34600 0))(
  ( (Nil!34597) (Cons!34596 (h!35987 (_ BitVec 64)) (t!49286 List!34600)) )
))
(declare-fun arrayNoDuplicates!0 (array!99685 (_ BitVec 32) List!34600) Bool)

(assert (=> b!1488907 (= res!1012103 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34597))))

(declare-fun b!1488908 () Bool)

(declare-fun e!834708 () Bool)

(assert (=> b!1488908 (= e!834700 e!834708)))

(declare-fun res!1012095 () Bool)

(assert (=> b!1488908 (=> (not res!1012095) (not e!834708))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1488908 (= res!1012095 (= (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!649363 () array!99685)

(assert (=> b!1488908 (= lt!649363 (array!99686 (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48663 a!2862)))))

(declare-fun b!1488909 () Bool)

(declare-fun res!1012089 () Bool)

(declare-fun e!834706 () Bool)

(assert (=> b!1488909 (=> (not res!1012089) (not e!834706))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12249 0))(
  ( (MissingZero!12249 (index!51388 (_ BitVec 32))) (Found!12249 (index!51389 (_ BitVec 32))) (Intermediate!12249 (undefined!13061 Bool) (index!51390 (_ BitVec 32)) (x!133154 (_ BitVec 32))) (Undefined!12249) (MissingVacant!12249 (index!51391 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12249)

(assert (=> b!1488909 (= res!1012089 (= (seekEntryOrOpen!0 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) (Found!12249 j!93)))))

(declare-fun b!1488910 () Bool)

(declare-fun res!1012087 () Bool)

(assert (=> b!1488910 (=> (not res!1012087) (not e!834700))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1488910 (= res!1012087 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48663 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48663 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48663 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488911 () Bool)

(declare-fun res!1012090 () Bool)

(declare-fun e!834704 () Bool)

(assert (=> b!1488911 (=> (not res!1012090) (not e!834704))))

(declare-fun e!834699 () Bool)

(assert (=> b!1488911 (= res!1012090 e!834699)))

(declare-fun c!137944 () Bool)

(assert (=> b!1488911 (= c!137944 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488913 () Bool)

(declare-fun res!1012093 () Bool)

(assert (=> b!1488913 (=> (not res!1012093) (not e!834700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488913 (= res!1012093 (validKeyInArray!0 (select (arr!48112 a!2862) i!1006)))))

(declare-fun b!1488914 () Bool)

(declare-fun e!834702 () Bool)

(declare-fun e!834705 () Bool)

(assert (=> b!1488914 (= e!834702 e!834705)))

(declare-fun res!1012096 () Bool)

(assert (=> b!1488914 (=> (not res!1012096) (not e!834705))))

(declare-fun lt!649358 () (_ BitVec 64))

(assert (=> b!1488914 (= res!1012096 (and (= index!646 intermediateAfterIndex!19) (= lt!649358 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488915 () Bool)

(declare-fun e!834707 () Bool)

(assert (=> b!1488915 (= e!834708 e!834707)))

(declare-fun res!1012097 () Bool)

(assert (=> b!1488915 (=> (not res!1012097) (not e!834707))))

(declare-fun lt!649362 () SeekEntryResult!12249)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488915 (= res!1012097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!649362))))

(assert (=> b!1488915 (= lt!649362 (Intermediate!12249 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488916 () Bool)

(declare-fun res!1012099 () Bool)

(assert (=> b!1488916 (=> (not res!1012099) (not e!834704))))

(assert (=> b!1488916 (= res!1012099 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488917 () Bool)

(declare-fun lt!649361 () (_ BitVec 64))

(declare-fun lt!649357 () SeekEntryResult!12249)

(assert (=> b!1488917 (= e!834699 (= lt!649357 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649361 lt!649363 mask!2687)))))

(declare-fun b!1488918 () Bool)

(declare-fun res!1012102 () Bool)

(assert (=> b!1488918 (=> (not res!1012102) (not e!834707))))

(assert (=> b!1488918 (= res!1012102 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!649362))))

(declare-fun b!1488919 () Bool)

(declare-fun res!1012098 () Bool)

(assert (=> b!1488919 (=> (not res!1012098) (not e!834700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99685 (_ BitVec 32)) Bool)

(assert (=> b!1488919 (= res!1012098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488920 () Bool)

(declare-fun e!834701 () Bool)

(declare-fun e!834703 () Bool)

(assert (=> b!1488920 (= e!834701 e!834703)))

(declare-fun res!1012106 () Bool)

(assert (=> b!1488920 (=> res!1012106 e!834703)))

(declare-fun lt!649359 () (_ BitVec 32))

(assert (=> b!1488920 (= res!1012106 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649359 #b00000000000000000000000000000000) (bvsge lt!649359 (size!48663 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488920 (= lt!649359 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1488921 () Bool)

(declare-fun res!1012101 () Bool)

(assert (=> b!1488921 (=> (not res!1012101) (not e!834700))))

(assert (=> b!1488921 (= res!1012101 (validKeyInArray!0 (select (arr!48112 a!2862) j!93)))))

(declare-fun b!1488922 () Bool)

(assert (=> b!1488922 (= e!834704 (not e!834701))))

(declare-fun res!1012104 () Bool)

(assert (=> b!1488922 (=> res!1012104 e!834701)))

(assert (=> b!1488922 (= res!1012104 (or (and (= (select (arr!48112 a!2862) index!646) (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48112 a!2862) index!646) (select (arr!48112 a!2862) j!93))) (= (select (arr!48112 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488922 e!834706))

(declare-fun res!1012094 () Bool)

(assert (=> b!1488922 (=> (not res!1012094) (not e!834706))))

(assert (=> b!1488922 (= res!1012094 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49871 0))(
  ( (Unit!49872) )
))
(declare-fun lt!649360 () Unit!49871)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49871)

(assert (=> b!1488922 (= lt!649360 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488923 () Bool)

(declare-fun res!1012092 () Bool)

(assert (=> b!1488923 (=> (not res!1012092) (not e!834706))))

(assert (=> b!1488923 (= res!1012092 (or (= (select (arr!48112 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48112 a!2862) intermediateBeforeIndex!19) (select (arr!48112 a!2862) j!93))))))

(declare-fun b!1488924 () Bool)

(declare-fun res!1012100 () Bool)

(assert (=> b!1488924 (=> (not res!1012100) (not e!834700))))

(assert (=> b!1488924 (= res!1012100 (and (= (size!48663 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48663 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48663 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488925 () Bool)

(assert (=> b!1488925 (= e!834707 e!834704)))

(declare-fun res!1012105 () Bool)

(assert (=> b!1488925 (=> (not res!1012105) (not e!834704))))

(assert (=> b!1488925 (= res!1012105 (= lt!649357 (Intermediate!12249 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1488925 (= lt!649357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649361 mask!2687) lt!649361 lt!649363 mask!2687))))

(assert (=> b!1488925 (= lt!649361 (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1012088 () Bool)

(assert (=> start!126948 (=> (not res!1012088) (not e!834700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126948 (= res!1012088 (validMask!0 mask!2687))))

(assert (=> start!126948 e!834700))

(assert (=> start!126948 true))

(declare-fun array_inv!37393 (array!99685) Bool)

(assert (=> start!126948 (array_inv!37393 a!2862)))

(declare-fun b!1488912 () Bool)

(assert (=> b!1488912 (= e!834706 e!834702)))

(declare-fun res!1012091 () Bool)

(assert (=> b!1488912 (=> res!1012091 e!834702)))

(assert (=> b!1488912 (= res!1012091 (or (and (= (select (arr!48112 a!2862) index!646) lt!649358) (= (select (arr!48112 a!2862) index!646) (select (arr!48112 a!2862) j!93))) (= (select (arr!48112 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488912 (= lt!649358 (select (store (arr!48112 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1488926 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99685 (_ BitVec 32)) SeekEntryResult!12249)

(assert (=> b!1488926 (= e!834705 (= (seekEntryOrOpen!0 lt!649361 lt!649363 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649361 lt!649363 mask!2687)))))

(declare-fun b!1488927 () Bool)

(assert (=> b!1488927 (= e!834703 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649359 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!649362))))

(declare-fun b!1488928 () Bool)

(assert (=> b!1488928 (= e!834699 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649361 lt!649363 mask!2687) (seekEntryOrOpen!0 lt!649361 lt!649363 mask!2687)))))

(assert (= (and start!126948 res!1012088) b!1488924))

(assert (= (and b!1488924 res!1012100) b!1488913))

(assert (= (and b!1488913 res!1012093) b!1488921))

(assert (= (and b!1488921 res!1012101) b!1488919))

(assert (= (and b!1488919 res!1012098) b!1488907))

(assert (= (and b!1488907 res!1012103) b!1488910))

(assert (= (and b!1488910 res!1012087) b!1488908))

(assert (= (and b!1488908 res!1012095) b!1488915))

(assert (= (and b!1488915 res!1012097) b!1488918))

(assert (= (and b!1488918 res!1012102) b!1488925))

(assert (= (and b!1488925 res!1012105) b!1488911))

(assert (= (and b!1488911 c!137944) b!1488917))

(assert (= (and b!1488911 (not c!137944)) b!1488928))

(assert (= (and b!1488911 res!1012090) b!1488916))

(assert (= (and b!1488916 res!1012099) b!1488922))

(assert (= (and b!1488922 res!1012094) b!1488909))

(assert (= (and b!1488909 res!1012089) b!1488923))

(assert (= (and b!1488923 res!1012092) b!1488912))

(assert (= (and b!1488912 (not res!1012091)) b!1488914))

(assert (= (and b!1488914 res!1012096) b!1488926))

(assert (= (and b!1488922 (not res!1012104)) b!1488920))

(assert (= (and b!1488920 (not res!1012106)) b!1488927))

(declare-fun m!1373635 () Bool)

(assert (=> b!1488913 m!1373635))

(assert (=> b!1488913 m!1373635))

(declare-fun m!1373637 () Bool)

(assert (=> b!1488913 m!1373637))

(declare-fun m!1373639 () Bool)

(assert (=> b!1488922 m!1373639))

(declare-fun m!1373641 () Bool)

(assert (=> b!1488922 m!1373641))

(declare-fun m!1373643 () Bool)

(assert (=> b!1488922 m!1373643))

(declare-fun m!1373645 () Bool)

(assert (=> b!1488922 m!1373645))

(declare-fun m!1373647 () Bool)

(assert (=> b!1488922 m!1373647))

(declare-fun m!1373649 () Bool)

(assert (=> b!1488922 m!1373649))

(declare-fun m!1373651 () Bool)

(assert (=> b!1488923 m!1373651))

(assert (=> b!1488923 m!1373649))

(declare-fun m!1373653 () Bool)

(assert (=> start!126948 m!1373653))

(declare-fun m!1373655 () Bool)

(assert (=> start!126948 m!1373655))

(assert (=> b!1488927 m!1373649))

(assert (=> b!1488927 m!1373649))

(declare-fun m!1373657 () Bool)

(assert (=> b!1488927 m!1373657))

(assert (=> b!1488921 m!1373649))

(assert (=> b!1488921 m!1373649))

(declare-fun m!1373659 () Bool)

(assert (=> b!1488921 m!1373659))

(declare-fun m!1373661 () Bool)

(assert (=> b!1488919 m!1373661))

(declare-fun m!1373663 () Bool)

(assert (=> b!1488928 m!1373663))

(declare-fun m!1373665 () Bool)

(assert (=> b!1488928 m!1373665))

(declare-fun m!1373667 () Bool)

(assert (=> b!1488920 m!1373667))

(declare-fun m!1373669 () Bool)

(assert (=> b!1488917 m!1373669))

(assert (=> b!1488909 m!1373649))

(assert (=> b!1488909 m!1373649))

(declare-fun m!1373671 () Bool)

(assert (=> b!1488909 m!1373671))

(assert (=> b!1488918 m!1373649))

(assert (=> b!1488918 m!1373649))

(declare-fun m!1373673 () Bool)

(assert (=> b!1488918 m!1373673))

(assert (=> b!1488912 m!1373645))

(assert (=> b!1488912 m!1373649))

(assert (=> b!1488912 m!1373641))

(assert (=> b!1488912 m!1373643))

(assert (=> b!1488926 m!1373665))

(assert (=> b!1488926 m!1373663))

(assert (=> b!1488915 m!1373649))

(assert (=> b!1488915 m!1373649))

(declare-fun m!1373675 () Bool)

(assert (=> b!1488915 m!1373675))

(assert (=> b!1488915 m!1373675))

(assert (=> b!1488915 m!1373649))

(declare-fun m!1373677 () Bool)

(assert (=> b!1488915 m!1373677))

(declare-fun m!1373679 () Bool)

(assert (=> b!1488925 m!1373679))

(assert (=> b!1488925 m!1373679))

(declare-fun m!1373681 () Bool)

(assert (=> b!1488925 m!1373681))

(assert (=> b!1488925 m!1373641))

(declare-fun m!1373683 () Bool)

(assert (=> b!1488925 m!1373683))

(assert (=> b!1488908 m!1373641))

(declare-fun m!1373685 () Bool)

(assert (=> b!1488908 m!1373685))

(declare-fun m!1373687 () Bool)

(assert (=> b!1488907 m!1373687))

(check-sat (not b!1488926) (not b!1488918) (not b!1488921) (not b!1488909) (not b!1488928) (not b!1488919) (not b!1488920) (not b!1488927) (not b!1488922) (not b!1488907) (not b!1488913) (not start!126948) (not b!1488917) (not b!1488925) (not b!1488915))
(check-sat)
(get-model)

(declare-fun b!1489069 () Bool)

(declare-fun e!834783 () Bool)

(declare-fun e!834781 () Bool)

(assert (=> b!1489069 (= e!834783 e!834781)))

(declare-fun lt!649414 () (_ BitVec 64))

(assert (=> b!1489069 (= lt!649414 (select (arr!48112 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!649413 () Unit!49871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99685 (_ BitVec 64) (_ BitVec 32)) Unit!49871)

(assert (=> b!1489069 (= lt!649413 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649414 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1489069 (arrayContainsKey!0 a!2862 lt!649414 #b00000000000000000000000000000000)))

(declare-fun lt!649412 () Unit!49871)

(assert (=> b!1489069 (= lt!649412 lt!649413)))

(declare-fun res!1012232 () Bool)

(assert (=> b!1489069 (= res!1012232 (= (seekEntryOrOpen!0 (select (arr!48112 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12249 #b00000000000000000000000000000000)))))

(assert (=> b!1489069 (=> (not res!1012232) (not e!834781))))

(declare-fun b!1489070 () Bool)

(declare-fun call!67989 () Bool)

(assert (=> b!1489070 (= e!834781 call!67989)))

(declare-fun b!1489071 () Bool)

(declare-fun e!834782 () Bool)

(assert (=> b!1489071 (= e!834782 e!834783)))

(declare-fun c!137953 () Bool)

(assert (=> b!1489071 (= c!137953 (validKeyInArray!0 (select (arr!48112 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67986 () Bool)

(assert (=> bm!67986 (= call!67989 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!157025 () Bool)

(declare-fun res!1012231 () Bool)

(assert (=> d!157025 (=> res!1012231 e!834782)))

(assert (=> d!157025 (= res!1012231 (bvsge #b00000000000000000000000000000000 (size!48663 a!2862)))))

(assert (=> d!157025 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!834782)))

(declare-fun b!1489072 () Bool)

(assert (=> b!1489072 (= e!834783 call!67989)))

(assert (= (and d!157025 (not res!1012231)) b!1489071))

(assert (= (and b!1489071 c!137953) b!1489069))

(assert (= (and b!1489071 (not c!137953)) b!1489072))

(assert (= (and b!1489069 res!1012232) b!1489070))

(assert (= (or b!1489070 b!1489072) bm!67986))

(declare-fun m!1373797 () Bool)

(assert (=> b!1489069 m!1373797))

(declare-fun m!1373799 () Bool)

(assert (=> b!1489069 m!1373799))

(declare-fun m!1373801 () Bool)

(assert (=> b!1489069 m!1373801))

(assert (=> b!1489069 m!1373797))

(declare-fun m!1373803 () Bool)

(assert (=> b!1489069 m!1373803))

(assert (=> b!1489071 m!1373797))

(assert (=> b!1489071 m!1373797))

(declare-fun m!1373805 () Bool)

(assert (=> b!1489071 m!1373805))

(declare-fun m!1373807 () Bool)

(assert (=> bm!67986 m!1373807))

(assert (=> b!1488919 d!157025))

(declare-fun b!1489085 () Bool)

(declare-fun e!834792 () SeekEntryResult!12249)

(assert (=> b!1489085 (= e!834792 Undefined!12249)))

(declare-fun b!1489086 () Bool)

(declare-fun c!137960 () Bool)

(declare-fun lt!649421 () (_ BitVec 64))

(assert (=> b!1489086 (= c!137960 (= lt!649421 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834791 () SeekEntryResult!12249)

(declare-fun e!834790 () SeekEntryResult!12249)

(assert (=> b!1489086 (= e!834791 e!834790)))

(declare-fun lt!649423 () SeekEntryResult!12249)

(declare-fun b!1489088 () Bool)

(assert (=> b!1489088 (= e!834790 (seekKeyOrZeroReturnVacant!0 (x!133154 lt!649423) (index!51390 lt!649423) (index!51390 lt!649423) (select (arr!48112 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1489089 () Bool)

(assert (=> b!1489089 (= e!834790 (MissingZero!12249 (index!51390 lt!649423)))))

(declare-fun b!1489090 () Bool)

(assert (=> b!1489090 (= e!834792 e!834791)))

(assert (=> b!1489090 (= lt!649421 (select (arr!48112 a!2862) (index!51390 lt!649423)))))

(declare-fun c!137962 () Bool)

(assert (=> b!1489090 (= c!137962 (= lt!649421 (select (arr!48112 a!2862) j!93)))))

(declare-fun d!157027 () Bool)

(declare-fun lt!649422 () SeekEntryResult!12249)

(get-info :version)

(assert (=> d!157027 (and (or ((_ is Undefined!12249) lt!649422) (not ((_ is Found!12249) lt!649422)) (and (bvsge (index!51389 lt!649422) #b00000000000000000000000000000000) (bvslt (index!51389 lt!649422) (size!48663 a!2862)))) (or ((_ is Undefined!12249) lt!649422) ((_ is Found!12249) lt!649422) (not ((_ is MissingZero!12249) lt!649422)) (and (bvsge (index!51388 lt!649422) #b00000000000000000000000000000000) (bvslt (index!51388 lt!649422) (size!48663 a!2862)))) (or ((_ is Undefined!12249) lt!649422) ((_ is Found!12249) lt!649422) ((_ is MissingZero!12249) lt!649422) (not ((_ is MissingVacant!12249) lt!649422)) (and (bvsge (index!51391 lt!649422) #b00000000000000000000000000000000) (bvslt (index!51391 lt!649422) (size!48663 a!2862)))) (or ((_ is Undefined!12249) lt!649422) (ite ((_ is Found!12249) lt!649422) (= (select (arr!48112 a!2862) (index!51389 lt!649422)) (select (arr!48112 a!2862) j!93)) (ite ((_ is MissingZero!12249) lt!649422) (= (select (arr!48112 a!2862) (index!51388 lt!649422)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12249) lt!649422) (= (select (arr!48112 a!2862) (index!51391 lt!649422)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157027 (= lt!649422 e!834792)))

(declare-fun c!137961 () Bool)

(assert (=> d!157027 (= c!137961 (and ((_ is Intermediate!12249) lt!649423) (undefined!13061 lt!649423)))))

(assert (=> d!157027 (= lt!649423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) (select (arr!48112 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157027 (validMask!0 mask!2687)))

(assert (=> d!157027 (= (seekEntryOrOpen!0 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!649422)))

(declare-fun b!1489087 () Bool)

(assert (=> b!1489087 (= e!834791 (Found!12249 (index!51390 lt!649423)))))

(assert (= (and d!157027 c!137961) b!1489085))

(assert (= (and d!157027 (not c!137961)) b!1489090))

(assert (= (and b!1489090 c!137962) b!1489087))

(assert (= (and b!1489090 (not c!137962)) b!1489086))

(assert (= (and b!1489086 c!137960) b!1489089))

(assert (= (and b!1489086 (not c!137960)) b!1489088))

(assert (=> b!1489088 m!1373649))

(declare-fun m!1373809 () Bool)

(assert (=> b!1489088 m!1373809))

(declare-fun m!1373811 () Bool)

(assert (=> b!1489090 m!1373811))

(declare-fun m!1373813 () Bool)

(assert (=> d!157027 m!1373813))

(assert (=> d!157027 m!1373675))

(assert (=> d!157027 m!1373649))

(assert (=> d!157027 m!1373677))

(assert (=> d!157027 m!1373649))

(assert (=> d!157027 m!1373675))

(declare-fun m!1373815 () Bool)

(assert (=> d!157027 m!1373815))

(assert (=> d!157027 m!1373653))

(declare-fun m!1373817 () Bool)

(assert (=> d!157027 m!1373817))

(assert (=> b!1488909 d!157027))

(declare-fun d!157029 () Bool)

(declare-fun lt!649426 () (_ BitVec 32))

(assert (=> d!157029 (and (bvsge lt!649426 #b00000000000000000000000000000000) (bvslt lt!649426 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157029 (= lt!649426 (choose!52 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> d!157029 (validMask!0 mask!2687)))

(assert (=> d!157029 (= (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!649426)))

(declare-fun bs!42787 () Bool)

(assert (= bs!42787 d!157029))

(declare-fun m!1373819 () Bool)

(assert (=> bs!42787 m!1373819))

(assert (=> bs!42787 m!1373653))

(assert (=> b!1488920 d!157029))

(declare-fun d!157031 () Bool)

(assert (=> d!157031 (= (validKeyInArray!0 (select (arr!48112 a!2862) j!93)) (and (not (= (select (arr!48112 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48112 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1488921 d!157031))

(declare-fun b!1489091 () Bool)

(declare-fun e!834795 () Bool)

(declare-fun e!834793 () Bool)

(assert (=> b!1489091 (= e!834795 e!834793)))

(declare-fun lt!649429 () (_ BitVec 64))

(assert (=> b!1489091 (= lt!649429 (select (arr!48112 a!2862) j!93))))

(declare-fun lt!649428 () Unit!49871)

(assert (=> b!1489091 (= lt!649428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649429 j!93))))

(assert (=> b!1489091 (arrayContainsKey!0 a!2862 lt!649429 #b00000000000000000000000000000000)))

(declare-fun lt!649427 () Unit!49871)

(assert (=> b!1489091 (= lt!649427 lt!649428)))

(declare-fun res!1012234 () Bool)

(assert (=> b!1489091 (= res!1012234 (= (seekEntryOrOpen!0 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) (Found!12249 j!93)))))

(assert (=> b!1489091 (=> (not res!1012234) (not e!834793))))

(declare-fun b!1489092 () Bool)

(declare-fun call!67990 () Bool)

(assert (=> b!1489092 (= e!834793 call!67990)))

(declare-fun b!1489093 () Bool)

(declare-fun e!834794 () Bool)

(assert (=> b!1489093 (= e!834794 e!834795)))

(declare-fun c!137963 () Bool)

(assert (=> b!1489093 (= c!137963 (validKeyInArray!0 (select (arr!48112 a!2862) j!93)))))

(declare-fun bm!67987 () Bool)

(assert (=> bm!67987 (= call!67990 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!157033 () Bool)

(declare-fun res!1012233 () Bool)

(assert (=> d!157033 (=> res!1012233 e!834794)))

(assert (=> d!157033 (= res!1012233 (bvsge j!93 (size!48663 a!2862)))))

(assert (=> d!157033 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!834794)))

(declare-fun b!1489094 () Bool)

(assert (=> b!1489094 (= e!834795 call!67990)))

(assert (= (and d!157033 (not res!1012233)) b!1489093))

(assert (= (and b!1489093 c!137963) b!1489091))

(assert (= (and b!1489093 (not c!137963)) b!1489094))

(assert (= (and b!1489091 res!1012234) b!1489092))

(assert (= (or b!1489092 b!1489094) bm!67987))

(assert (=> b!1489091 m!1373649))

(declare-fun m!1373821 () Bool)

(assert (=> b!1489091 m!1373821))

(declare-fun m!1373823 () Bool)

(assert (=> b!1489091 m!1373823))

(assert (=> b!1489091 m!1373649))

(assert (=> b!1489091 m!1373671))

(assert (=> b!1489093 m!1373649))

(assert (=> b!1489093 m!1373649))

(assert (=> b!1489093 m!1373659))

(declare-fun m!1373825 () Bool)

(assert (=> bm!67987 m!1373825))

(assert (=> b!1488922 d!157033))

(declare-fun d!157035 () Bool)

(assert (=> d!157035 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649432 () Unit!49871)

(declare-fun choose!38 (array!99685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49871)

(assert (=> d!157035 (= lt!649432 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157035 (validMask!0 mask!2687)))

(assert (=> d!157035 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!649432)))

(declare-fun bs!42788 () Bool)

(assert (= bs!42788 d!157035))

(assert (=> bs!42788 m!1373647))

(declare-fun m!1373827 () Bool)

(assert (=> bs!42788 m!1373827))

(assert (=> bs!42788 m!1373653))

(assert (=> b!1488922 d!157035))

(declare-fun d!157037 () Bool)

(assert (=> d!157037 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126948 d!157037))

(declare-fun d!157041 () Bool)

(assert (=> d!157041 (= (array_inv!37393 a!2862) (bvsge (size!48663 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126948 d!157041))

(declare-fun d!157043 () Bool)

(assert (=> d!157043 (= (validKeyInArray!0 (select (arr!48112 a!2862) i!1006)) (and (not (= (select (arr!48112 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48112 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1488913 d!157043))

(declare-fun b!1489140 () Bool)

(declare-fun lt!649444 () SeekEntryResult!12249)

(assert (=> b!1489140 (and (bvsge (index!51390 lt!649444) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649444) (size!48663 lt!649363)))))

(declare-fun res!1012250 () Bool)

(assert (=> b!1489140 (= res!1012250 (= (select (arr!48112 lt!649363) (index!51390 lt!649444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834821 () Bool)

(assert (=> b!1489140 (=> res!1012250 e!834821)))

(declare-fun b!1489141 () Bool)

(declare-fun e!834824 () SeekEntryResult!12249)

(assert (=> b!1489141 (= e!834824 (Intermediate!12249 false (toIndex!0 lt!649361 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1489142 () Bool)

(assert (=> b!1489142 (and (bvsge (index!51390 lt!649444) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649444) (size!48663 lt!649363)))))

(assert (=> b!1489142 (= e!834821 (= (select (arr!48112 lt!649363) (index!51390 lt!649444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489143 () Bool)

(declare-fun e!834825 () SeekEntryResult!12249)

(assert (=> b!1489143 (= e!834825 e!834824)))

(declare-fun c!137981 () Bool)

(declare-fun lt!649443 () (_ BitVec 64))

(assert (=> b!1489143 (= c!137981 (or (= lt!649443 lt!649361) (= (bvadd lt!649443 lt!649443) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489144 () Bool)

(assert (=> b!1489144 (and (bvsge (index!51390 lt!649444) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649444) (size!48663 lt!649363)))))

(declare-fun res!1012252 () Bool)

(assert (=> b!1489144 (= res!1012252 (= (select (arr!48112 lt!649363) (index!51390 lt!649444)) lt!649361))))

(assert (=> b!1489144 (=> res!1012252 e!834821)))

(declare-fun e!834823 () Bool)

(assert (=> b!1489144 (= e!834823 e!834821)))

(declare-fun d!157045 () Bool)

(declare-fun e!834822 () Bool)

(assert (=> d!157045 e!834822))

(declare-fun c!137979 () Bool)

(assert (=> d!157045 (= c!137979 (and ((_ is Intermediate!12249) lt!649444) (undefined!13061 lt!649444)))))

(assert (=> d!157045 (= lt!649444 e!834825)))

(declare-fun c!137980 () Bool)

(assert (=> d!157045 (= c!137980 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157045 (= lt!649443 (select (arr!48112 lt!649363) (toIndex!0 lt!649361 mask!2687)))))

(assert (=> d!157045 (validMask!0 mask!2687)))

(assert (=> d!157045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649361 mask!2687) lt!649361 lt!649363 mask!2687) lt!649444)))

(declare-fun b!1489145 () Bool)

(assert (=> b!1489145 (= e!834822 (bvsge (x!133154 lt!649444) #b01111111111111111111111111111110))))

(declare-fun b!1489146 () Bool)

(assert (=> b!1489146 (= e!834824 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!649361 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!649361 lt!649363 mask!2687))))

(declare-fun b!1489147 () Bool)

(assert (=> b!1489147 (= e!834822 e!834823)))

(declare-fun res!1012251 () Bool)

(assert (=> b!1489147 (= res!1012251 (and ((_ is Intermediate!12249) lt!649444) (not (undefined!13061 lt!649444)) (bvslt (x!133154 lt!649444) #b01111111111111111111111111111110) (bvsge (x!133154 lt!649444) #b00000000000000000000000000000000) (bvsge (x!133154 lt!649444) #b00000000000000000000000000000000)))))

(assert (=> b!1489147 (=> (not res!1012251) (not e!834823))))

(declare-fun b!1489148 () Bool)

(assert (=> b!1489148 (= e!834825 (Intermediate!12249 true (toIndex!0 lt!649361 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157045 c!137980) b!1489148))

(assert (= (and d!157045 (not c!137980)) b!1489143))

(assert (= (and b!1489143 c!137981) b!1489141))

(assert (= (and b!1489143 (not c!137981)) b!1489146))

(assert (= (and d!157045 c!137979) b!1489145))

(assert (= (and d!157045 (not c!137979)) b!1489147))

(assert (= (and b!1489147 res!1012251) b!1489144))

(assert (= (and b!1489144 (not res!1012252)) b!1489140))

(assert (= (and b!1489140 (not res!1012250)) b!1489142))

(declare-fun m!1373837 () Bool)

(assert (=> b!1489140 m!1373837))

(assert (=> b!1489142 m!1373837))

(assert (=> d!157045 m!1373679))

(declare-fun m!1373839 () Bool)

(assert (=> d!157045 m!1373839))

(assert (=> d!157045 m!1373653))

(assert (=> b!1489146 m!1373679))

(declare-fun m!1373841 () Bool)

(assert (=> b!1489146 m!1373841))

(assert (=> b!1489146 m!1373841))

(declare-fun m!1373843 () Bool)

(assert (=> b!1489146 m!1373843))

(assert (=> b!1489144 m!1373837))

(assert (=> b!1488925 d!157045))

(declare-fun d!157053 () Bool)

(declare-fun lt!649450 () (_ BitVec 32))

(declare-fun lt!649449 () (_ BitVec 32))

(assert (=> d!157053 (= lt!649450 (bvmul (bvxor lt!649449 (bvlshr lt!649449 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157053 (= lt!649449 ((_ extract 31 0) (bvand (bvxor lt!649361 (bvlshr lt!649361 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157053 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012253 (let ((h!35990 ((_ extract 31 0) (bvand (bvxor lt!649361 (bvlshr lt!649361 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133160 (bvmul (bvxor h!35990 (bvlshr h!35990 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133160 (bvlshr x!133160 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012253 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012253 #b00000000000000000000000000000000))))))

(assert (=> d!157053 (= (toIndex!0 lt!649361 mask!2687) (bvand (bvxor lt!649450 (bvlshr lt!649450 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1488925 d!157053))

(declare-fun b!1489159 () Bool)

(declare-fun lt!649452 () SeekEntryResult!12249)

(assert (=> b!1489159 (and (bvsge (index!51390 lt!649452) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649452) (size!48663 a!2862)))))

(declare-fun res!1012260 () Bool)

(assert (=> b!1489159 (= res!1012260 (= (select (arr!48112 a!2862) (index!51390 lt!649452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834834 () Bool)

(assert (=> b!1489159 (=> res!1012260 e!834834)))

(declare-fun e!834837 () SeekEntryResult!12249)

(declare-fun b!1489160 () Bool)

(assert (=> b!1489160 (= e!834837 (Intermediate!12249 false (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1489161 () Bool)

(assert (=> b!1489161 (and (bvsge (index!51390 lt!649452) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649452) (size!48663 a!2862)))))

(assert (=> b!1489161 (= e!834834 (= (select (arr!48112 a!2862) (index!51390 lt!649452)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489162 () Bool)

(declare-fun e!834838 () SeekEntryResult!12249)

(assert (=> b!1489162 (= e!834838 e!834837)))

(declare-fun lt!649451 () (_ BitVec 64))

(declare-fun c!137986 () Bool)

(assert (=> b!1489162 (= c!137986 (or (= lt!649451 (select (arr!48112 a!2862) j!93)) (= (bvadd lt!649451 lt!649451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489163 () Bool)

(assert (=> b!1489163 (and (bvsge (index!51390 lt!649452) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649452) (size!48663 a!2862)))))

(declare-fun res!1012262 () Bool)

(assert (=> b!1489163 (= res!1012262 (= (select (arr!48112 a!2862) (index!51390 lt!649452)) (select (arr!48112 a!2862) j!93)))))

(assert (=> b!1489163 (=> res!1012262 e!834834)))

(declare-fun e!834836 () Bool)

(assert (=> b!1489163 (= e!834836 e!834834)))

(declare-fun d!157055 () Bool)

(declare-fun e!834835 () Bool)

(assert (=> d!157055 e!834835))

(declare-fun c!137984 () Bool)

(assert (=> d!157055 (= c!137984 (and ((_ is Intermediate!12249) lt!649452) (undefined!13061 lt!649452)))))

(assert (=> d!157055 (= lt!649452 e!834838)))

(declare-fun c!137985 () Bool)

(assert (=> d!157055 (= c!137985 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157055 (= lt!649451 (select (arr!48112 a!2862) (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687)))))

(assert (=> d!157055 (validMask!0 mask!2687)))

(assert (=> d!157055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!649452)))

(declare-fun b!1489164 () Bool)

(assert (=> b!1489164 (= e!834835 (bvsge (x!133154 lt!649452) #b01111111111111111111111111111110))))

(declare-fun b!1489165 () Bool)

(assert (=> b!1489165 (= e!834837 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48112 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1489166 () Bool)

(assert (=> b!1489166 (= e!834835 e!834836)))

(declare-fun res!1012261 () Bool)

(assert (=> b!1489166 (= res!1012261 (and ((_ is Intermediate!12249) lt!649452) (not (undefined!13061 lt!649452)) (bvslt (x!133154 lt!649452) #b01111111111111111111111111111110) (bvsge (x!133154 lt!649452) #b00000000000000000000000000000000) (bvsge (x!133154 lt!649452) #b00000000000000000000000000000000)))))

(assert (=> b!1489166 (=> (not res!1012261) (not e!834836))))

(declare-fun b!1489167 () Bool)

(assert (=> b!1489167 (= e!834838 (Intermediate!12249 true (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157055 c!137985) b!1489167))

(assert (= (and d!157055 (not c!137985)) b!1489162))

(assert (= (and b!1489162 c!137986) b!1489160))

(assert (= (and b!1489162 (not c!137986)) b!1489165))

(assert (= (and d!157055 c!137984) b!1489164))

(assert (= (and d!157055 (not c!137984)) b!1489166))

(assert (= (and b!1489166 res!1012261) b!1489163))

(assert (= (and b!1489163 (not res!1012262)) b!1489159))

(assert (= (and b!1489159 (not res!1012260)) b!1489161))

(declare-fun m!1373845 () Bool)

(assert (=> b!1489159 m!1373845))

(assert (=> b!1489161 m!1373845))

(assert (=> d!157055 m!1373675))

(declare-fun m!1373847 () Bool)

(assert (=> d!157055 m!1373847))

(assert (=> d!157055 m!1373653))

(assert (=> b!1489165 m!1373675))

(declare-fun m!1373849 () Bool)

(assert (=> b!1489165 m!1373849))

(assert (=> b!1489165 m!1373849))

(assert (=> b!1489165 m!1373649))

(declare-fun m!1373851 () Bool)

(assert (=> b!1489165 m!1373851))

(assert (=> b!1489163 m!1373845))

(assert (=> b!1488915 d!157055))

(declare-fun d!157057 () Bool)

(declare-fun lt!649454 () (_ BitVec 32))

(declare-fun lt!649453 () (_ BitVec 32))

(assert (=> d!157057 (= lt!649454 (bvmul (bvxor lt!649453 (bvlshr lt!649453 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157057 (= lt!649453 ((_ extract 31 0) (bvand (bvxor (select (arr!48112 a!2862) j!93) (bvlshr (select (arr!48112 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157057 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012253 (let ((h!35990 ((_ extract 31 0) (bvand (bvxor (select (arr!48112 a!2862) j!93) (bvlshr (select (arr!48112 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133160 (bvmul (bvxor h!35990 (bvlshr h!35990 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133160 (bvlshr x!133160 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012253 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012253 #b00000000000000000000000000000000))))))

(assert (=> d!157057 (= (toIndex!0 (select (arr!48112 a!2862) j!93) mask!2687) (bvand (bvxor lt!649454 (bvlshr lt!649454 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1488915 d!157057))

(declare-fun b!1489173 () Bool)

(declare-fun e!834845 () SeekEntryResult!12249)

(assert (=> b!1489173 (= e!834845 Undefined!12249)))

(declare-fun b!1489174 () Bool)

(declare-fun c!137988 () Bool)

(declare-fun lt!649455 () (_ BitVec 64))

(assert (=> b!1489174 (= c!137988 (= lt!649455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834844 () SeekEntryResult!12249)

(declare-fun e!834843 () SeekEntryResult!12249)

(assert (=> b!1489174 (= e!834844 e!834843)))

(declare-fun b!1489176 () Bool)

(declare-fun lt!649457 () SeekEntryResult!12249)

(assert (=> b!1489176 (= e!834843 (seekKeyOrZeroReturnVacant!0 (x!133154 lt!649457) (index!51390 lt!649457) (index!51390 lt!649457) lt!649361 lt!649363 mask!2687))))

(declare-fun b!1489177 () Bool)

(assert (=> b!1489177 (= e!834843 (MissingZero!12249 (index!51390 lt!649457)))))

(declare-fun b!1489178 () Bool)

(assert (=> b!1489178 (= e!834845 e!834844)))

(assert (=> b!1489178 (= lt!649455 (select (arr!48112 lt!649363) (index!51390 lt!649457)))))

(declare-fun c!137990 () Bool)

(assert (=> b!1489178 (= c!137990 (= lt!649455 lt!649361))))

(declare-fun d!157061 () Bool)

(declare-fun lt!649456 () SeekEntryResult!12249)

(assert (=> d!157061 (and (or ((_ is Undefined!12249) lt!649456) (not ((_ is Found!12249) lt!649456)) (and (bvsge (index!51389 lt!649456) #b00000000000000000000000000000000) (bvslt (index!51389 lt!649456) (size!48663 lt!649363)))) (or ((_ is Undefined!12249) lt!649456) ((_ is Found!12249) lt!649456) (not ((_ is MissingZero!12249) lt!649456)) (and (bvsge (index!51388 lt!649456) #b00000000000000000000000000000000) (bvslt (index!51388 lt!649456) (size!48663 lt!649363)))) (or ((_ is Undefined!12249) lt!649456) ((_ is Found!12249) lt!649456) ((_ is MissingZero!12249) lt!649456) (not ((_ is MissingVacant!12249) lt!649456)) (and (bvsge (index!51391 lt!649456) #b00000000000000000000000000000000) (bvslt (index!51391 lt!649456) (size!48663 lt!649363)))) (or ((_ is Undefined!12249) lt!649456) (ite ((_ is Found!12249) lt!649456) (= (select (arr!48112 lt!649363) (index!51389 lt!649456)) lt!649361) (ite ((_ is MissingZero!12249) lt!649456) (= (select (arr!48112 lt!649363) (index!51388 lt!649456)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12249) lt!649456) (= (select (arr!48112 lt!649363) (index!51391 lt!649456)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157061 (= lt!649456 e!834845)))

(declare-fun c!137989 () Bool)

(assert (=> d!157061 (= c!137989 (and ((_ is Intermediate!12249) lt!649457) (undefined!13061 lt!649457)))))

(assert (=> d!157061 (= lt!649457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649361 mask!2687) lt!649361 lt!649363 mask!2687))))

(assert (=> d!157061 (validMask!0 mask!2687)))

(assert (=> d!157061 (= (seekEntryOrOpen!0 lt!649361 lt!649363 mask!2687) lt!649456)))

(declare-fun b!1489175 () Bool)

(assert (=> b!1489175 (= e!834844 (Found!12249 (index!51390 lt!649457)))))

(assert (= (and d!157061 c!137989) b!1489173))

(assert (= (and d!157061 (not c!137989)) b!1489178))

(assert (= (and b!1489178 c!137990) b!1489175))

(assert (= (and b!1489178 (not c!137990)) b!1489174))

(assert (= (and b!1489174 c!137988) b!1489177))

(assert (= (and b!1489174 (not c!137988)) b!1489176))

(declare-fun m!1373861 () Bool)

(assert (=> b!1489176 m!1373861))

(declare-fun m!1373863 () Bool)

(assert (=> b!1489178 m!1373863))

(declare-fun m!1373865 () Bool)

(assert (=> d!157061 m!1373865))

(assert (=> d!157061 m!1373679))

(assert (=> d!157061 m!1373681))

(assert (=> d!157061 m!1373679))

(declare-fun m!1373869 () Bool)

(assert (=> d!157061 m!1373869))

(assert (=> d!157061 m!1373653))

(declare-fun m!1373873 () Bool)

(assert (=> d!157061 m!1373873))

(assert (=> b!1488926 d!157061))

(declare-fun b!1489236 () Bool)

(declare-fun c!138014 () Bool)

(declare-fun lt!649482 () (_ BitVec 64))

(assert (=> b!1489236 (= c!138014 (= lt!649482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834877 () SeekEntryResult!12249)

(declare-fun e!834879 () SeekEntryResult!12249)

(assert (=> b!1489236 (= e!834877 e!834879)))

(declare-fun b!1489237 () Bool)

(assert (=> b!1489237 (= e!834879 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!649361 lt!649363 mask!2687))))

(declare-fun b!1489238 () Bool)

(declare-fun e!834878 () SeekEntryResult!12249)

(assert (=> b!1489238 (= e!834878 Undefined!12249)))

(declare-fun b!1489239 () Bool)

(assert (=> b!1489239 (= e!834879 (MissingVacant!12249 intermediateAfterIndex!19))))

(declare-fun b!1489241 () Bool)

(assert (=> b!1489241 (= e!834877 (Found!12249 index!646))))

(declare-fun lt!649481 () SeekEntryResult!12249)

(declare-fun d!157063 () Bool)

(assert (=> d!157063 (and (or ((_ is Undefined!12249) lt!649481) (not ((_ is Found!12249) lt!649481)) (and (bvsge (index!51389 lt!649481) #b00000000000000000000000000000000) (bvslt (index!51389 lt!649481) (size!48663 lt!649363)))) (or ((_ is Undefined!12249) lt!649481) ((_ is Found!12249) lt!649481) (not ((_ is MissingVacant!12249) lt!649481)) (not (= (index!51391 lt!649481) intermediateAfterIndex!19)) (and (bvsge (index!51391 lt!649481) #b00000000000000000000000000000000) (bvslt (index!51391 lt!649481) (size!48663 lt!649363)))) (or ((_ is Undefined!12249) lt!649481) (ite ((_ is Found!12249) lt!649481) (= (select (arr!48112 lt!649363) (index!51389 lt!649481)) lt!649361) (and ((_ is MissingVacant!12249) lt!649481) (= (index!51391 lt!649481) intermediateAfterIndex!19) (= (select (arr!48112 lt!649363) (index!51391 lt!649481)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157063 (= lt!649481 e!834878)))

(declare-fun c!138012 () Bool)

(assert (=> d!157063 (= c!138012 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157063 (= lt!649482 (select (arr!48112 lt!649363) index!646))))

(assert (=> d!157063 (validMask!0 mask!2687)))

(assert (=> d!157063 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649361 lt!649363 mask!2687) lt!649481)))

(declare-fun b!1489240 () Bool)

(assert (=> b!1489240 (= e!834878 e!834877)))

(declare-fun c!138013 () Bool)

(assert (=> b!1489240 (= c!138013 (= lt!649482 lt!649361))))

(assert (= (and d!157063 c!138012) b!1489238))

(assert (= (and d!157063 (not c!138012)) b!1489240))

(assert (= (and b!1489240 c!138013) b!1489241))

(assert (= (and b!1489240 (not c!138013)) b!1489236))

(assert (= (and b!1489236 c!138014) b!1489239))

(assert (= (and b!1489236 (not c!138014)) b!1489237))

(declare-fun m!1373895 () Bool)

(assert (=> b!1489237 m!1373895))

(assert (=> b!1489237 m!1373895))

(declare-fun m!1373897 () Bool)

(assert (=> b!1489237 m!1373897))

(declare-fun m!1373899 () Bool)

(assert (=> d!157063 m!1373899))

(declare-fun m!1373901 () Bool)

(assert (=> d!157063 m!1373901))

(declare-fun m!1373903 () Bool)

(assert (=> d!157063 m!1373903))

(assert (=> d!157063 m!1373653))

(assert (=> b!1488926 d!157063))

(declare-fun b!1489251 () Bool)

(declare-fun lt!649486 () SeekEntryResult!12249)

(assert (=> b!1489251 (and (bvsge (index!51390 lt!649486) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649486) (size!48663 a!2862)))))

(declare-fun res!1012285 () Bool)

(assert (=> b!1489251 (= res!1012285 (= (select (arr!48112 a!2862) (index!51390 lt!649486)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834885 () Bool)

(assert (=> b!1489251 (=> res!1012285 e!834885)))

(declare-fun b!1489252 () Bool)

(declare-fun e!834888 () SeekEntryResult!12249)

(assert (=> b!1489252 (= e!834888 (Intermediate!12249 false lt!649359 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1489253 () Bool)

(assert (=> b!1489253 (and (bvsge (index!51390 lt!649486) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649486) (size!48663 a!2862)))))

(assert (=> b!1489253 (= e!834885 (= (select (arr!48112 a!2862) (index!51390 lt!649486)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489254 () Bool)

(declare-fun e!834889 () SeekEntryResult!12249)

(assert (=> b!1489254 (= e!834889 e!834888)))

(declare-fun lt!649485 () (_ BitVec 64))

(declare-fun c!138020 () Bool)

(assert (=> b!1489254 (= c!138020 (or (= lt!649485 (select (arr!48112 a!2862) j!93)) (= (bvadd lt!649485 lt!649485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489255 () Bool)

(assert (=> b!1489255 (and (bvsge (index!51390 lt!649486) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649486) (size!48663 a!2862)))))

(declare-fun res!1012287 () Bool)

(assert (=> b!1489255 (= res!1012287 (= (select (arr!48112 a!2862) (index!51390 lt!649486)) (select (arr!48112 a!2862) j!93)))))

(assert (=> b!1489255 (=> res!1012287 e!834885)))

(declare-fun e!834887 () Bool)

(assert (=> b!1489255 (= e!834887 e!834885)))

(declare-fun d!157075 () Bool)

(declare-fun e!834886 () Bool)

(assert (=> d!157075 e!834886))

(declare-fun c!138018 () Bool)

(assert (=> d!157075 (= c!138018 (and ((_ is Intermediate!12249) lt!649486) (undefined!13061 lt!649486)))))

(assert (=> d!157075 (= lt!649486 e!834889)))

(declare-fun c!138019 () Bool)

(assert (=> d!157075 (= c!138019 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157075 (= lt!649485 (select (arr!48112 a!2862) lt!649359))))

(assert (=> d!157075 (validMask!0 mask!2687)))

(assert (=> d!157075 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649359 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!649486)))

(declare-fun b!1489256 () Bool)

(assert (=> b!1489256 (= e!834886 (bvsge (x!133154 lt!649486) #b01111111111111111111111111111110))))

(declare-fun b!1489257 () Bool)

(assert (=> b!1489257 (= e!834888 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649359 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48112 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1489258 () Bool)

(assert (=> b!1489258 (= e!834886 e!834887)))

(declare-fun res!1012286 () Bool)

(assert (=> b!1489258 (= res!1012286 (and ((_ is Intermediate!12249) lt!649486) (not (undefined!13061 lt!649486)) (bvslt (x!133154 lt!649486) #b01111111111111111111111111111110) (bvsge (x!133154 lt!649486) #b00000000000000000000000000000000) (bvsge (x!133154 lt!649486) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1489258 (=> (not res!1012286) (not e!834887))))

(declare-fun b!1489259 () Bool)

(assert (=> b!1489259 (= e!834889 (Intermediate!12249 true lt!649359 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!157075 c!138019) b!1489259))

(assert (= (and d!157075 (not c!138019)) b!1489254))

(assert (= (and b!1489254 c!138020) b!1489252))

(assert (= (and b!1489254 (not c!138020)) b!1489257))

(assert (= (and d!157075 c!138018) b!1489256))

(assert (= (and d!157075 (not c!138018)) b!1489258))

(assert (= (and b!1489258 res!1012286) b!1489255))

(assert (= (and b!1489255 (not res!1012287)) b!1489251))

(assert (= (and b!1489251 (not res!1012285)) b!1489253))

(declare-fun m!1373913 () Bool)

(assert (=> b!1489251 m!1373913))

(assert (=> b!1489253 m!1373913))

(declare-fun m!1373915 () Bool)

(assert (=> d!157075 m!1373915))

(assert (=> d!157075 m!1373653))

(declare-fun m!1373917 () Bool)

(assert (=> b!1489257 m!1373917))

(assert (=> b!1489257 m!1373917))

(assert (=> b!1489257 m!1373649))

(declare-fun m!1373919 () Bool)

(assert (=> b!1489257 m!1373919))

(assert (=> b!1489255 m!1373913))

(assert (=> b!1488927 d!157075))

(declare-fun b!1489260 () Bool)

(declare-fun lt!649488 () SeekEntryResult!12249)

(assert (=> b!1489260 (and (bvsge (index!51390 lt!649488) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649488) (size!48663 lt!649363)))))

(declare-fun res!1012289 () Bool)

(assert (=> b!1489260 (= res!1012289 (= (select (arr!48112 lt!649363) (index!51390 lt!649488)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834890 () Bool)

(assert (=> b!1489260 (=> res!1012289 e!834890)))

(declare-fun b!1489261 () Bool)

(declare-fun e!834893 () SeekEntryResult!12249)

(assert (=> b!1489261 (= e!834893 (Intermediate!12249 false index!646 x!665))))

(declare-fun b!1489262 () Bool)

(assert (=> b!1489262 (and (bvsge (index!51390 lt!649488) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649488) (size!48663 lt!649363)))))

(assert (=> b!1489262 (= e!834890 (= (select (arr!48112 lt!649363) (index!51390 lt!649488)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489263 () Bool)

(declare-fun e!834894 () SeekEntryResult!12249)

(assert (=> b!1489263 (= e!834894 e!834893)))

(declare-fun c!138023 () Bool)

(declare-fun lt!649487 () (_ BitVec 64))

(assert (=> b!1489263 (= c!138023 (or (= lt!649487 lt!649361) (= (bvadd lt!649487 lt!649487) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489264 () Bool)

(assert (=> b!1489264 (and (bvsge (index!51390 lt!649488) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649488) (size!48663 lt!649363)))))

(declare-fun res!1012291 () Bool)

(assert (=> b!1489264 (= res!1012291 (= (select (arr!48112 lt!649363) (index!51390 lt!649488)) lt!649361))))

(assert (=> b!1489264 (=> res!1012291 e!834890)))

(declare-fun e!834892 () Bool)

(assert (=> b!1489264 (= e!834892 e!834890)))

(declare-fun d!157079 () Bool)

(declare-fun e!834891 () Bool)

(assert (=> d!157079 e!834891))

(declare-fun c!138021 () Bool)

(assert (=> d!157079 (= c!138021 (and ((_ is Intermediate!12249) lt!649488) (undefined!13061 lt!649488)))))

(assert (=> d!157079 (= lt!649488 e!834894)))

(declare-fun c!138022 () Bool)

(assert (=> d!157079 (= c!138022 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157079 (= lt!649487 (select (arr!48112 lt!649363) index!646))))

(assert (=> d!157079 (validMask!0 mask!2687)))

(assert (=> d!157079 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649361 lt!649363 mask!2687) lt!649488)))

(declare-fun b!1489265 () Bool)

(assert (=> b!1489265 (= e!834891 (bvsge (x!133154 lt!649488) #b01111111111111111111111111111110))))

(declare-fun b!1489266 () Bool)

(assert (=> b!1489266 (= e!834893 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!649361 lt!649363 mask!2687))))

(declare-fun b!1489267 () Bool)

(assert (=> b!1489267 (= e!834891 e!834892)))

(declare-fun res!1012290 () Bool)

(assert (=> b!1489267 (= res!1012290 (and ((_ is Intermediate!12249) lt!649488) (not (undefined!13061 lt!649488)) (bvslt (x!133154 lt!649488) #b01111111111111111111111111111110) (bvsge (x!133154 lt!649488) #b00000000000000000000000000000000) (bvsge (x!133154 lt!649488) x!665)))))

(assert (=> b!1489267 (=> (not res!1012290) (not e!834892))))

(declare-fun b!1489268 () Bool)

(assert (=> b!1489268 (= e!834894 (Intermediate!12249 true index!646 x!665))))

(assert (= (and d!157079 c!138022) b!1489268))

(assert (= (and d!157079 (not c!138022)) b!1489263))

(assert (= (and b!1489263 c!138023) b!1489261))

(assert (= (and b!1489263 (not c!138023)) b!1489266))

(assert (= (and d!157079 c!138021) b!1489265))

(assert (= (and d!157079 (not c!138021)) b!1489267))

(assert (= (and b!1489267 res!1012290) b!1489264))

(assert (= (and b!1489264 (not res!1012291)) b!1489260))

(assert (= (and b!1489260 (not res!1012289)) b!1489262))

(declare-fun m!1373921 () Bool)

(assert (=> b!1489260 m!1373921))

(assert (=> b!1489262 m!1373921))

(assert (=> d!157079 m!1373903))

(assert (=> d!157079 m!1373653))

(assert (=> b!1489266 m!1373895))

(assert (=> b!1489266 m!1373895))

(declare-fun m!1373923 () Bool)

(assert (=> b!1489266 m!1373923))

(assert (=> b!1489264 m!1373921))

(assert (=> b!1488917 d!157079))

(assert (=> b!1488928 d!157063))

(assert (=> b!1488928 d!157061))

(declare-fun b!1489300 () Bool)

(declare-fun e!834914 () Bool)

(declare-fun contains!9968 (List!34600 (_ BitVec 64)) Bool)

(assert (=> b!1489300 (= e!834914 (contains!9968 Nil!34597 (select (arr!48112 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1489301 () Bool)

(declare-fun e!834915 () Bool)

(declare-fun e!834916 () Bool)

(assert (=> b!1489301 (= e!834915 e!834916)))

(declare-fun res!1012303 () Bool)

(assert (=> b!1489301 (=> (not res!1012303) (not e!834916))))

(assert (=> b!1489301 (= res!1012303 (not e!834914))))

(declare-fun res!1012302 () Bool)

(assert (=> b!1489301 (=> (not res!1012302) (not e!834914))))

(assert (=> b!1489301 (= res!1012302 (validKeyInArray!0 (select (arr!48112 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67993 () Bool)

(declare-fun call!67996 () Bool)

(declare-fun c!138035 () Bool)

(assert (=> bm!67993 (= call!67996 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138035 (Cons!34596 (select (arr!48112 a!2862) #b00000000000000000000000000000000) Nil!34597) Nil!34597)))))

(declare-fun d!157081 () Bool)

(declare-fun res!1012301 () Bool)

(assert (=> d!157081 (=> res!1012301 e!834915)))

(assert (=> d!157081 (= res!1012301 (bvsge #b00000000000000000000000000000000 (size!48663 a!2862)))))

(assert (=> d!157081 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34597) e!834915)))

(declare-fun b!1489302 () Bool)

(declare-fun e!834917 () Bool)

(assert (=> b!1489302 (= e!834917 call!67996)))

(declare-fun b!1489303 () Bool)

(assert (=> b!1489303 (= e!834917 call!67996)))

(declare-fun b!1489304 () Bool)

(assert (=> b!1489304 (= e!834916 e!834917)))

(assert (=> b!1489304 (= c!138035 (validKeyInArray!0 (select (arr!48112 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157081 (not res!1012301)) b!1489301))

(assert (= (and b!1489301 res!1012302) b!1489300))

(assert (= (and b!1489301 res!1012303) b!1489304))

(assert (= (and b!1489304 c!138035) b!1489302))

(assert (= (and b!1489304 (not c!138035)) b!1489303))

(assert (= (or b!1489302 b!1489303) bm!67993))

(assert (=> b!1489300 m!1373797))

(assert (=> b!1489300 m!1373797))

(declare-fun m!1373931 () Bool)

(assert (=> b!1489300 m!1373931))

(assert (=> b!1489301 m!1373797))

(assert (=> b!1489301 m!1373797))

(assert (=> b!1489301 m!1373805))

(assert (=> bm!67993 m!1373797))

(declare-fun m!1373933 () Bool)

(assert (=> bm!67993 m!1373933))

(assert (=> b!1489304 m!1373797))

(assert (=> b!1489304 m!1373797))

(assert (=> b!1489304 m!1373805))

(assert (=> b!1488907 d!157081))

(declare-fun b!1489305 () Bool)

(declare-fun lt!649504 () SeekEntryResult!12249)

(assert (=> b!1489305 (and (bvsge (index!51390 lt!649504) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649504) (size!48663 a!2862)))))

(declare-fun res!1012304 () Bool)

(assert (=> b!1489305 (= res!1012304 (= (select (arr!48112 a!2862) (index!51390 lt!649504)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!834918 () Bool)

(assert (=> b!1489305 (=> res!1012304 e!834918)))

(declare-fun b!1489306 () Bool)

(declare-fun e!834921 () SeekEntryResult!12249)

(assert (=> b!1489306 (= e!834921 (Intermediate!12249 false index!646 x!665))))

(declare-fun b!1489307 () Bool)

(assert (=> b!1489307 (and (bvsge (index!51390 lt!649504) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649504) (size!48663 a!2862)))))

(assert (=> b!1489307 (= e!834918 (= (select (arr!48112 a!2862) (index!51390 lt!649504)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1489308 () Bool)

(declare-fun e!834922 () SeekEntryResult!12249)

(assert (=> b!1489308 (= e!834922 e!834921)))

(declare-fun c!138038 () Bool)

(declare-fun lt!649503 () (_ BitVec 64))

(assert (=> b!1489308 (= c!138038 (or (= lt!649503 (select (arr!48112 a!2862) j!93)) (= (bvadd lt!649503 lt!649503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1489309 () Bool)

(assert (=> b!1489309 (and (bvsge (index!51390 lt!649504) #b00000000000000000000000000000000) (bvslt (index!51390 lt!649504) (size!48663 a!2862)))))

(declare-fun res!1012306 () Bool)

(assert (=> b!1489309 (= res!1012306 (= (select (arr!48112 a!2862) (index!51390 lt!649504)) (select (arr!48112 a!2862) j!93)))))

(assert (=> b!1489309 (=> res!1012306 e!834918)))

(declare-fun e!834920 () Bool)

(assert (=> b!1489309 (= e!834920 e!834918)))

(declare-fun d!157087 () Bool)

(declare-fun e!834919 () Bool)

(assert (=> d!157087 e!834919))

(declare-fun c!138036 () Bool)

(assert (=> d!157087 (= c!138036 (and ((_ is Intermediate!12249) lt!649504) (undefined!13061 lt!649504)))))

(assert (=> d!157087 (= lt!649504 e!834922)))

(declare-fun c!138037 () Bool)

(assert (=> d!157087 (= c!138037 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157087 (= lt!649503 (select (arr!48112 a!2862) index!646))))

(assert (=> d!157087 (validMask!0 mask!2687)))

(assert (=> d!157087 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48112 a!2862) j!93) a!2862 mask!2687) lt!649504)))

(declare-fun b!1489310 () Bool)

(assert (=> b!1489310 (= e!834919 (bvsge (x!133154 lt!649504) #b01111111111111111111111111111110))))

(declare-fun b!1489311 () Bool)

(assert (=> b!1489311 (= e!834921 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48112 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1489312 () Bool)

(assert (=> b!1489312 (= e!834919 e!834920)))

(declare-fun res!1012305 () Bool)

(assert (=> b!1489312 (= res!1012305 (and ((_ is Intermediate!12249) lt!649504) (not (undefined!13061 lt!649504)) (bvslt (x!133154 lt!649504) #b01111111111111111111111111111110) (bvsge (x!133154 lt!649504) #b00000000000000000000000000000000) (bvsge (x!133154 lt!649504) x!665)))))

(assert (=> b!1489312 (=> (not res!1012305) (not e!834920))))

(declare-fun b!1489313 () Bool)

(assert (=> b!1489313 (= e!834922 (Intermediate!12249 true index!646 x!665))))

(assert (= (and d!157087 c!138037) b!1489313))

(assert (= (and d!157087 (not c!138037)) b!1489308))

(assert (= (and b!1489308 c!138038) b!1489306))

(assert (= (and b!1489308 (not c!138038)) b!1489311))

(assert (= (and d!157087 c!138036) b!1489310))

(assert (= (and d!157087 (not c!138036)) b!1489312))

(assert (= (and b!1489312 res!1012305) b!1489309))

(assert (= (and b!1489309 (not res!1012306)) b!1489305))

(assert (= (and b!1489305 (not res!1012304)) b!1489307))

(declare-fun m!1373935 () Bool)

(assert (=> b!1489305 m!1373935))

(assert (=> b!1489307 m!1373935))

(assert (=> d!157087 m!1373645))

(assert (=> d!157087 m!1373653))

(assert (=> b!1489311 m!1373895))

(assert (=> b!1489311 m!1373895))

(assert (=> b!1489311 m!1373649))

(declare-fun m!1373937 () Bool)

(assert (=> b!1489311 m!1373937))

(assert (=> b!1489309 m!1373935))

(assert (=> b!1488918 d!157087))

(check-sat (not b!1489088) (not d!157035) (not d!157079) (not bm!67987) (not b!1489165) (not b!1489176) (not bm!67986) (not b!1489071) (not b!1489266) (not b!1489237) (not d!157027) (not d!157045) (not b!1489304) (not b!1489311) (not b!1489093) (not b!1489300) (not d!157061) (not bm!67993) (not d!157029) (not b!1489091) (not d!157075) (not d!157087) (not d!157055) (not b!1489301) (not b!1489146) (not b!1489069) (not b!1489257) (not d!157063))
(check-sat)
