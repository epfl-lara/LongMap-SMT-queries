; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124894 () Bool)

(assert start!124894)

(declare-fun b!1450763 () Bool)

(declare-fun res!982082 () Bool)

(declare-fun e!816912 () Bool)

(assert (=> b!1450763 (=> (not res!982082) (not e!816912))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98342 0))(
  ( (array!98343 (arr!47459 (Array (_ BitVec 32) (_ BitVec 64))) (size!48009 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98342)

(assert (=> b!1450763 (= res!982082 (and (= (size!48009 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48009 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48009 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450764 () Bool)

(declare-fun e!816911 () Bool)

(assert (=> b!1450764 (= e!816911 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11711 0))(
  ( (MissingZero!11711 (index!49236 (_ BitVec 32))) (Found!11711 (index!49237 (_ BitVec 32))) (Intermediate!11711 (undefined!12523 Bool) (index!49238 (_ BitVec 32)) (x!130896 (_ BitVec 32))) (Undefined!11711) (MissingVacant!11711 (index!49239 (_ BitVec 32))) )
))
(declare-fun lt!636422 () SeekEntryResult!11711)

(declare-fun lt!636423 () array!98342)

(declare-fun lt!636426 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98342 (_ BitVec 32)) SeekEntryResult!11711)

(assert (=> b!1450764 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636426 lt!636423 mask!2687) lt!636422)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!48918 0))(
  ( (Unit!48919) )
))
(declare-fun lt!636427 () Unit!48918)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48918)

(assert (=> b!1450764 (= lt!636427 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450765 () Bool)

(declare-fun res!982080 () Bool)

(declare-fun e!816905 () Bool)

(assert (=> b!1450765 (=> (not res!982080) (not e!816905))))

(declare-fun lt!636428 () SeekEntryResult!11711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98342 (_ BitVec 32)) SeekEntryResult!11711)

(assert (=> b!1450765 (= res!982080 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47459 a!2862) j!93) a!2862 mask!2687) lt!636428))))

(declare-fun b!1450766 () Bool)

(declare-fun e!816907 () Bool)

(assert (=> b!1450766 (= e!816907 (not e!816911))))

(declare-fun res!982085 () Bool)

(assert (=> b!1450766 (=> res!982085 e!816911)))

(assert (=> b!1450766 (= res!982085 (or (and (= (select (arr!47459 a!2862) index!646) (select (store (arr!47459 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47459 a!2862) index!646) (select (arr!47459 a!2862) j!93))) (not (= (select (arr!47459 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47459 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816908 () Bool)

(assert (=> b!1450766 e!816908))

(declare-fun res!982077 () Bool)

(assert (=> b!1450766 (=> (not res!982077) (not e!816908))))

(declare-fun lt!636425 () SeekEntryResult!11711)

(assert (=> b!1450766 (= res!982077 (and (= lt!636425 lt!636422) (or (= (select (arr!47459 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47459 a!2862) intermediateBeforeIndex!19) (select (arr!47459 a!2862) j!93)))))))

(assert (=> b!1450766 (= lt!636422 (Found!11711 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98342 (_ BitVec 32)) SeekEntryResult!11711)

(assert (=> b!1450766 (= lt!636425 (seekEntryOrOpen!0 (select (arr!47459 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98342 (_ BitVec 32)) Bool)

(assert (=> b!1450766 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636429 () Unit!48918)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48918)

(assert (=> b!1450766 (= lt!636429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450767 () Bool)

(declare-fun e!816910 () Bool)

(assert (=> b!1450767 (= e!816908 e!816910)))

(declare-fun res!982083 () Bool)

(assert (=> b!1450767 (=> res!982083 e!816910)))

(assert (=> b!1450767 (= res!982083 (or (and (= (select (arr!47459 a!2862) index!646) (select (store (arr!47459 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47459 a!2862) index!646) (select (arr!47459 a!2862) j!93))) (not (= (select (arr!47459 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450768 () Bool)

(declare-fun res!982078 () Bool)

(assert (=> b!1450768 (=> (not res!982078) (not e!816907))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450768 (= res!982078 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450769 () Bool)

(declare-fun res!982087 () Bool)

(assert (=> b!1450769 (=> res!982087 e!816911)))

(assert (=> b!1450769 (= res!982087 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47459 a!2862) j!93) a!2862 mask!2687) lt!636422)))))

(declare-fun res!982072 () Bool)

(assert (=> start!124894 (=> (not res!982072) (not e!816912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124894 (= res!982072 (validMask!0 mask!2687))))

(assert (=> start!124894 e!816912))

(assert (=> start!124894 true))

(declare-fun array_inv!36487 (array!98342) Bool)

(assert (=> start!124894 (array_inv!36487 a!2862)))

(declare-fun b!1450770 () Bool)

(declare-fun e!816913 () Bool)

(assert (=> b!1450770 (= e!816912 e!816913)))

(declare-fun res!982086 () Bool)

(assert (=> b!1450770 (=> (not res!982086) (not e!816913))))

(assert (=> b!1450770 (= res!982086 (= (select (store (arr!47459 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450770 (= lt!636423 (array!98343 (store (arr!47459 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48009 a!2862)))))

(declare-fun e!816906 () Bool)

(declare-fun b!1450771 () Bool)

(assert (=> b!1450771 (= e!816906 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450772 () Bool)

(assert (=> b!1450772 (= e!816905 e!816907)))

(declare-fun res!982070 () Bool)

(assert (=> b!1450772 (=> (not res!982070) (not e!816907))))

(declare-fun lt!636424 () SeekEntryResult!11711)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450772 (= res!982070 (= lt!636424 (Intermediate!11711 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450772 (= lt!636424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636426 mask!2687) lt!636426 lt!636423 mask!2687))))

(assert (=> b!1450772 (= lt!636426 (select (store (arr!47459 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450773 () Bool)

(declare-fun res!982084 () Bool)

(assert (=> b!1450773 (=> (not res!982084) (not e!816907))))

(declare-fun e!816914 () Bool)

(assert (=> b!1450773 (= res!982084 e!816914)))

(declare-fun c!133857 () Bool)

(assert (=> b!1450773 (= c!133857 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450774 () Bool)

(assert (=> b!1450774 (= e!816914 (= lt!636424 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636426 lt!636423 mask!2687)))))

(declare-fun b!1450775 () Bool)

(assert (=> b!1450775 (= e!816913 e!816905)))

(declare-fun res!982073 () Bool)

(assert (=> b!1450775 (=> (not res!982073) (not e!816905))))

(assert (=> b!1450775 (= res!982073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47459 a!2862) j!93) mask!2687) (select (arr!47459 a!2862) j!93) a!2862 mask!2687) lt!636428))))

(assert (=> b!1450775 (= lt!636428 (Intermediate!11711 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450776 () Bool)

(declare-fun res!982071 () Bool)

(assert (=> b!1450776 (=> (not res!982071) (not e!816912))))

(assert (=> b!1450776 (= res!982071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450777 () Bool)

(declare-fun res!982081 () Bool)

(assert (=> b!1450777 (=> (not res!982081) (not e!816912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450777 (= res!982081 (validKeyInArray!0 (select (arr!47459 a!2862) j!93)))))

(declare-fun b!1450778 () Bool)

(declare-fun res!982079 () Bool)

(assert (=> b!1450778 (=> (not res!982079) (not e!816912))))

(assert (=> b!1450778 (= res!982079 (validKeyInArray!0 (select (arr!47459 a!2862) i!1006)))))

(declare-fun b!1450779 () Bool)

(assert (=> b!1450779 (= e!816910 e!816906)))

(declare-fun res!982075 () Bool)

(assert (=> b!1450779 (=> (not res!982075) (not e!816906))))

(assert (=> b!1450779 (= res!982075 (= lt!636425 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47459 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450780 () Bool)

(declare-fun res!982074 () Bool)

(assert (=> b!1450780 (=> (not res!982074) (not e!816912))))

(declare-datatypes ((List!33960 0))(
  ( (Nil!33957) (Cons!33956 (h!35306 (_ BitVec 64)) (t!48654 List!33960)) )
))
(declare-fun arrayNoDuplicates!0 (array!98342 (_ BitVec 32) List!33960) Bool)

(assert (=> b!1450780 (= res!982074 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33957))))

(declare-fun b!1450781 () Bool)

(assert (=> b!1450781 (= e!816914 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636426 lt!636423 mask!2687) (seekEntryOrOpen!0 lt!636426 lt!636423 mask!2687)))))

(declare-fun b!1450782 () Bool)

(declare-fun res!982076 () Bool)

(assert (=> b!1450782 (=> (not res!982076) (not e!816912))))

(assert (=> b!1450782 (= res!982076 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48009 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48009 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48009 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124894 res!982072) b!1450763))

(assert (= (and b!1450763 res!982082) b!1450778))

(assert (= (and b!1450778 res!982079) b!1450777))

(assert (= (and b!1450777 res!982081) b!1450776))

(assert (= (and b!1450776 res!982071) b!1450780))

(assert (= (and b!1450780 res!982074) b!1450782))

(assert (= (and b!1450782 res!982076) b!1450770))

(assert (= (and b!1450770 res!982086) b!1450775))

(assert (= (and b!1450775 res!982073) b!1450765))

(assert (= (and b!1450765 res!982080) b!1450772))

(assert (= (and b!1450772 res!982070) b!1450773))

(assert (= (and b!1450773 c!133857) b!1450774))

(assert (= (and b!1450773 (not c!133857)) b!1450781))

(assert (= (and b!1450773 res!982084) b!1450768))

(assert (= (and b!1450768 res!982078) b!1450766))

(assert (= (and b!1450766 res!982077) b!1450767))

(assert (= (and b!1450767 (not res!982083)) b!1450779))

(assert (= (and b!1450779 res!982075) b!1450771))

(assert (= (and b!1450766 (not res!982085)) b!1450769))

(assert (= (and b!1450769 (not res!982087)) b!1450764))

(declare-fun m!1339387 () Bool)

(assert (=> b!1450781 m!1339387))

(declare-fun m!1339389 () Bool)

(assert (=> b!1450781 m!1339389))

(declare-fun m!1339391 () Bool)

(assert (=> b!1450778 m!1339391))

(assert (=> b!1450778 m!1339391))

(declare-fun m!1339393 () Bool)

(assert (=> b!1450778 m!1339393))

(declare-fun m!1339395 () Bool)

(assert (=> b!1450780 m!1339395))

(declare-fun m!1339397 () Bool)

(assert (=> b!1450766 m!1339397))

(declare-fun m!1339399 () Bool)

(assert (=> b!1450766 m!1339399))

(declare-fun m!1339401 () Bool)

(assert (=> b!1450766 m!1339401))

(declare-fun m!1339403 () Bool)

(assert (=> b!1450766 m!1339403))

(declare-fun m!1339405 () Bool)

(assert (=> b!1450766 m!1339405))

(declare-fun m!1339407 () Bool)

(assert (=> b!1450766 m!1339407))

(declare-fun m!1339409 () Bool)

(assert (=> b!1450766 m!1339409))

(declare-fun m!1339411 () Bool)

(assert (=> b!1450766 m!1339411))

(assert (=> b!1450766 m!1339407))

(declare-fun m!1339413 () Bool)

(assert (=> b!1450772 m!1339413))

(assert (=> b!1450772 m!1339413))

(declare-fun m!1339415 () Bool)

(assert (=> b!1450772 m!1339415))

(assert (=> b!1450772 m!1339399))

(declare-fun m!1339417 () Bool)

(assert (=> b!1450772 m!1339417))

(assert (=> b!1450767 m!1339405))

(assert (=> b!1450767 m!1339399))

(assert (=> b!1450767 m!1339403))

(assert (=> b!1450767 m!1339407))

(declare-fun m!1339419 () Bool)

(assert (=> b!1450776 m!1339419))

(assert (=> b!1450769 m!1339407))

(assert (=> b!1450769 m!1339407))

(declare-fun m!1339421 () Bool)

(assert (=> b!1450769 m!1339421))

(assert (=> b!1450777 m!1339407))

(assert (=> b!1450777 m!1339407))

(declare-fun m!1339423 () Bool)

(assert (=> b!1450777 m!1339423))

(assert (=> b!1450765 m!1339407))

(assert (=> b!1450765 m!1339407))

(declare-fun m!1339425 () Bool)

(assert (=> b!1450765 m!1339425))

(assert (=> b!1450779 m!1339407))

(assert (=> b!1450779 m!1339407))

(declare-fun m!1339427 () Bool)

(assert (=> b!1450779 m!1339427))

(assert (=> b!1450775 m!1339407))

(assert (=> b!1450775 m!1339407))

(declare-fun m!1339429 () Bool)

(assert (=> b!1450775 m!1339429))

(assert (=> b!1450775 m!1339429))

(assert (=> b!1450775 m!1339407))

(declare-fun m!1339431 () Bool)

(assert (=> b!1450775 m!1339431))

(declare-fun m!1339433 () Bool)

(assert (=> start!124894 m!1339433))

(declare-fun m!1339435 () Bool)

(assert (=> start!124894 m!1339435))

(assert (=> b!1450770 m!1339399))

(declare-fun m!1339437 () Bool)

(assert (=> b!1450770 m!1339437))

(assert (=> b!1450764 m!1339387))

(declare-fun m!1339439 () Bool)

(assert (=> b!1450764 m!1339439))

(declare-fun m!1339441 () Bool)

(assert (=> b!1450774 m!1339441))

(push 1)

