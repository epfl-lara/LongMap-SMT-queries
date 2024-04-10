; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124972 () Bool)

(assert start!124972)

(declare-fun b!1452820 () Bool)

(declare-fun e!817799 () Bool)

(declare-fun e!817793 () Bool)

(assert (=> b!1452820 (= e!817799 (not e!817793))))

(declare-fun res!983900 () Bool)

(assert (=> b!1452820 (=> res!983900 e!817793)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98420 0))(
  ( (array!98421 (arr!47498 (Array (_ BitVec 32) (_ BitVec 64))) (size!48048 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98420)

(assert (=> b!1452820 (= res!983900 (or (and (= (select (arr!47498 a!2862) index!646) (select (store (arr!47498 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47498 a!2862) index!646) (select (arr!47498 a!2862) j!93))) (= (select (arr!47498 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun e!817792 () Bool)

(assert (=> b!1452820 e!817792))

(declare-fun res!983908 () Bool)

(assert (=> b!1452820 (=> (not res!983908) (not e!817792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98420 (_ BitVec 32)) Bool)

(assert (=> b!1452820 (= res!983908 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48996 0))(
  ( (Unit!48997) )
))
(declare-fun lt!637055 () Unit!48996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48996)

(assert (=> b!1452820 (= lt!637055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452822 () Bool)

(declare-fun e!817794 () Bool)

(assert (=> b!1452822 (= e!817794 e!817799)))

(declare-fun res!983901 () Bool)

(assert (=> b!1452822 (=> (not res!983901) (not e!817799))))

(declare-datatypes ((SeekEntryResult!11750 0))(
  ( (MissingZero!11750 (index!49392 (_ BitVec 32))) (Found!11750 (index!49393 (_ BitVec 32))) (Intermediate!11750 (undefined!12562 Bool) (index!49394 (_ BitVec 32)) (x!131039 (_ BitVec 32))) (Undefined!11750) (MissingVacant!11750 (index!49395 (_ BitVec 32))) )
))
(declare-fun lt!637056 () SeekEntryResult!11750)

(assert (=> b!1452822 (= res!983901 (= lt!637056 (Intermediate!11750 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637057 () array!98420)

(declare-fun lt!637059 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98420 (_ BitVec 32)) SeekEntryResult!11750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452822 (= lt!637056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637059 mask!2687) lt!637059 lt!637057 mask!2687))))

(assert (=> b!1452822 (= lt!637059 (select (store (arr!47498 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452823 () Bool)

(declare-fun e!817795 () Bool)

(assert (=> b!1452823 (= e!817795 e!817794)))

(declare-fun res!983894 () Bool)

(assert (=> b!1452823 (=> (not res!983894) (not e!817794))))

(declare-fun lt!637058 () SeekEntryResult!11750)

(assert (=> b!1452823 (= res!983894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47498 a!2862) j!93) mask!2687) (select (arr!47498 a!2862) j!93) a!2862 mask!2687) lt!637058))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452823 (= lt!637058 (Intermediate!11750 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!817798 () Bool)

(declare-fun b!1452824 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98420 (_ BitVec 32)) SeekEntryResult!11750)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98420 (_ BitVec 32)) SeekEntryResult!11750)

(assert (=> b!1452824 (= e!817798 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637059 lt!637057 mask!2687) (seekEntryOrOpen!0 lt!637059 lt!637057 mask!2687)))))

(declare-fun b!1452825 () Bool)

(declare-fun res!983906 () Bool)

(assert (=> b!1452825 (=> (not res!983906) (not e!817792))))

(assert (=> b!1452825 (= res!983906 (= (seekEntryOrOpen!0 (select (arr!47498 a!2862) j!93) a!2862 mask!2687) (Found!11750 j!93)))))

(declare-fun b!1452826 () Bool)

(declare-fun e!817797 () Bool)

(assert (=> b!1452826 (= e!817797 e!817795)))

(declare-fun res!983902 () Bool)

(assert (=> b!1452826 (=> (not res!983902) (not e!817795))))

(assert (=> b!1452826 (= res!983902 (= (select (store (arr!47498 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452826 (= lt!637057 (array!98421 (store (arr!47498 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48048 a!2862)))))

(declare-fun b!1452821 () Bool)

(declare-fun res!983905 () Bool)

(assert (=> b!1452821 (=> (not res!983905) (not e!817797))))

(assert (=> b!1452821 (= res!983905 (and (= (size!48048 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48048 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48048 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!983893 () Bool)

(assert (=> start!124972 (=> (not res!983893) (not e!817797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124972 (= res!983893 (validMask!0 mask!2687))))

(assert (=> start!124972 e!817797))

(assert (=> start!124972 true))

(declare-fun array_inv!36526 (array!98420) Bool)

(assert (=> start!124972 (array_inv!36526 a!2862)))

(declare-fun b!1452827 () Bool)

(assert (=> b!1452827 (= e!817792 (and (or (= (select (arr!47498 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47498 a!2862) intermediateBeforeIndex!19) (select (arr!47498 a!2862) j!93))) (or (and (= (select (arr!47498 a!2862) index!646) (select (store (arr!47498 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47498 a!2862) index!646) (select (arr!47498 a!2862) j!93))) (= (select (arr!47498 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47498 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452828 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452828 (= e!817793 (validKeyInArray!0 lt!637059))))

(declare-fun b!1452829 () Bool)

(declare-fun res!983896 () Bool)

(assert (=> b!1452829 (=> (not res!983896) (not e!817797))))

(assert (=> b!1452829 (= res!983896 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48048 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48048 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48048 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452830 () Bool)

(declare-fun res!983904 () Bool)

(assert (=> b!1452830 (=> (not res!983904) (not e!817797))))

(assert (=> b!1452830 (= res!983904 (validKeyInArray!0 (select (arr!47498 a!2862) i!1006)))))

(declare-fun b!1452831 () Bool)

(declare-fun res!983903 () Bool)

(assert (=> b!1452831 (=> (not res!983903) (not e!817799))))

(assert (=> b!1452831 (= res!983903 e!817798)))

(declare-fun c!133974 () Bool)

(assert (=> b!1452831 (= c!133974 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452832 () Bool)

(declare-fun res!983907 () Bool)

(assert (=> b!1452832 (=> (not res!983907) (not e!817797))))

(declare-datatypes ((List!33999 0))(
  ( (Nil!33996) (Cons!33995 (h!35345 (_ BitVec 64)) (t!48693 List!33999)) )
))
(declare-fun arrayNoDuplicates!0 (array!98420 (_ BitVec 32) List!33999) Bool)

(assert (=> b!1452832 (= res!983907 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33996))))

(declare-fun b!1452833 () Bool)

(declare-fun res!983897 () Bool)

(assert (=> b!1452833 (=> (not res!983897) (not e!817799))))

(assert (=> b!1452833 (= res!983897 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452834 () Bool)

(declare-fun res!983899 () Bool)

(assert (=> b!1452834 (=> (not res!983899) (not e!817794))))

(assert (=> b!1452834 (= res!983899 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47498 a!2862) j!93) a!2862 mask!2687) lt!637058))))

(declare-fun b!1452835 () Bool)

(declare-fun res!983895 () Bool)

(assert (=> b!1452835 (=> (not res!983895) (not e!817797))))

(assert (=> b!1452835 (= res!983895 (validKeyInArray!0 (select (arr!47498 a!2862) j!93)))))

(declare-fun b!1452836 () Bool)

(declare-fun res!983898 () Bool)

(assert (=> b!1452836 (=> (not res!983898) (not e!817797))))

(assert (=> b!1452836 (= res!983898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452837 () Bool)

(assert (=> b!1452837 (= e!817798 (= lt!637056 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637059 lt!637057 mask!2687)))))

(assert (= (and start!124972 res!983893) b!1452821))

(assert (= (and b!1452821 res!983905) b!1452830))

(assert (= (and b!1452830 res!983904) b!1452835))

(assert (= (and b!1452835 res!983895) b!1452836))

(assert (= (and b!1452836 res!983898) b!1452832))

(assert (= (and b!1452832 res!983907) b!1452829))

(assert (= (and b!1452829 res!983896) b!1452826))

(assert (= (and b!1452826 res!983902) b!1452823))

(assert (= (and b!1452823 res!983894) b!1452834))

(assert (= (and b!1452834 res!983899) b!1452822))

(assert (= (and b!1452822 res!983901) b!1452831))

(assert (= (and b!1452831 c!133974) b!1452837))

(assert (= (and b!1452831 (not c!133974)) b!1452824))

(assert (= (and b!1452831 res!983903) b!1452833))

(assert (= (and b!1452833 res!983897) b!1452820))

(assert (= (and b!1452820 res!983908) b!1452825))

(assert (= (and b!1452825 res!983906) b!1452827))

(assert (= (and b!1452820 (not res!983900)) b!1452828))

(declare-fun m!1341385 () Bool)

(assert (=> b!1452827 m!1341385))

(declare-fun m!1341387 () Bool)

(assert (=> b!1452827 m!1341387))

(declare-fun m!1341389 () Bool)

(assert (=> b!1452827 m!1341389))

(declare-fun m!1341391 () Bool)

(assert (=> b!1452827 m!1341391))

(declare-fun m!1341393 () Bool)

(assert (=> b!1452827 m!1341393))

(assert (=> b!1452825 m!1341393))

(assert (=> b!1452825 m!1341393))

(declare-fun m!1341395 () Bool)

(assert (=> b!1452825 m!1341395))

(assert (=> b!1452835 m!1341393))

(assert (=> b!1452835 m!1341393))

(declare-fun m!1341397 () Bool)

(assert (=> b!1452835 m!1341397))

(declare-fun m!1341399 () Bool)

(assert (=> b!1452837 m!1341399))

(assert (=> b!1452834 m!1341393))

(assert (=> b!1452834 m!1341393))

(declare-fun m!1341401 () Bool)

(assert (=> b!1452834 m!1341401))

(assert (=> b!1452823 m!1341393))

(assert (=> b!1452823 m!1341393))

(declare-fun m!1341403 () Bool)

(assert (=> b!1452823 m!1341403))

(assert (=> b!1452823 m!1341403))

(assert (=> b!1452823 m!1341393))

(declare-fun m!1341405 () Bool)

(assert (=> b!1452823 m!1341405))

(declare-fun m!1341407 () Bool)

(assert (=> b!1452822 m!1341407))

(assert (=> b!1452822 m!1341407))

(declare-fun m!1341409 () Bool)

(assert (=> b!1452822 m!1341409))

(assert (=> b!1452822 m!1341385))

(declare-fun m!1341411 () Bool)

(assert (=> b!1452822 m!1341411))

(declare-fun m!1341413 () Bool)

(assert (=> b!1452836 m!1341413))

(declare-fun m!1341415 () Bool)

(assert (=> b!1452820 m!1341415))

(assert (=> b!1452820 m!1341385))

(assert (=> b!1452820 m!1341389))

(assert (=> b!1452820 m!1341391))

(declare-fun m!1341417 () Bool)

(assert (=> b!1452820 m!1341417))

(assert (=> b!1452820 m!1341393))

(assert (=> b!1452826 m!1341385))

(declare-fun m!1341419 () Bool)

(assert (=> b!1452826 m!1341419))

(declare-fun m!1341421 () Bool)

(assert (=> b!1452832 m!1341421))

(declare-fun m!1341423 () Bool)

(assert (=> b!1452830 m!1341423))

(assert (=> b!1452830 m!1341423))

(declare-fun m!1341425 () Bool)

(assert (=> b!1452830 m!1341425))

(declare-fun m!1341427 () Bool)

(assert (=> b!1452828 m!1341427))

(declare-fun m!1341429 () Bool)

(assert (=> start!124972 m!1341429))

(declare-fun m!1341431 () Bool)

(assert (=> start!124972 m!1341431))

(declare-fun m!1341433 () Bool)

(assert (=> b!1452824 m!1341433))

(declare-fun m!1341435 () Bool)

(assert (=> b!1452824 m!1341435))

(push 1)

