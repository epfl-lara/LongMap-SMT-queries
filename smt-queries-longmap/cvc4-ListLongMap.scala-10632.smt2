; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124934 () Bool)

(assert start!124934)

(declare-fun b!1451849 () Bool)

(declare-fun e!817394 () Bool)

(assert (=> b!1451849 (= e!817394 (not true))))

(declare-fun e!817391 () Bool)

(assert (=> b!1451849 e!817391))

(declare-fun res!983044 () Bool)

(assert (=> b!1451849 (=> (not res!983044) (not e!817391))))

(declare-datatypes ((array!98382 0))(
  ( (array!98383 (arr!47479 (Array (_ BitVec 32) (_ BitVec 64))) (size!48029 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98382)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98382 (_ BitVec 32)) Bool)

(assert (=> b!1451849 (= res!983044 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48958 0))(
  ( (Unit!48959) )
))
(declare-fun lt!636774 () Unit!48958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48958)

(assert (=> b!1451849 (= lt!636774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-datatypes ((SeekEntryResult!11731 0))(
  ( (MissingZero!11731 (index!49316 (_ BitVec 32))) (Found!11731 (index!49317 (_ BitVec 32))) (Intermediate!11731 (undefined!12543 Bool) (index!49318 (_ BitVec 32)) (x!130964 (_ BitVec 32))) (Undefined!11731) (MissingVacant!11731 (index!49319 (_ BitVec 32))) )
))
(declare-fun lt!636772 () SeekEntryResult!11731)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636773 () (_ BitVec 64))

(declare-fun b!1451851 () Bool)

(declare-fun e!817393 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!636770 () array!98382)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98382 (_ BitVec 32)) SeekEntryResult!11731)

(assert (=> b!1451851 (= e!817393 (= lt!636772 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636773 lt!636770 mask!2687)))))

(declare-fun b!1451852 () Bool)

(declare-fun res!983036 () Bool)

(declare-fun e!817397 () Bool)

(assert (=> b!1451852 (=> (not res!983036) (not e!817397))))

(declare-fun lt!636771 () SeekEntryResult!11731)

(assert (=> b!1451852 (= res!983036 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47479 a!2862) j!93) a!2862 mask!2687) lt!636771))))

(declare-fun b!1451853 () Bool)

(declare-fun res!983043 () Bool)

(declare-fun e!817392 () Bool)

(assert (=> b!1451853 (=> (not res!983043) (not e!817392))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451853 (= res!983043 (and (= (size!48029 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48029 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48029 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451854 () Bool)

(declare-fun e!817395 () Bool)

(assert (=> b!1451854 (= e!817395 e!817397)))

(declare-fun res!983041 () Bool)

(assert (=> b!1451854 (=> (not res!983041) (not e!817397))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451854 (= res!983041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47479 a!2862) j!93) mask!2687) (select (arr!47479 a!2862) j!93) a!2862 mask!2687) lt!636771))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451854 (= lt!636771 (Intermediate!11731 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451855 () Bool)

(declare-fun res!983039 () Bool)

(assert (=> b!1451855 (=> (not res!983039) (not e!817394))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451855 (= res!983039 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451856 () Bool)

(declare-fun res!983049 () Bool)

(assert (=> b!1451856 (=> (not res!983049) (not e!817392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451856 (= res!983049 (validKeyInArray!0 (select (arr!47479 a!2862) i!1006)))))

(declare-fun b!1451857 () Bool)

(declare-fun res!983046 () Bool)

(assert (=> b!1451857 (=> (not res!983046) (not e!817392))))

(assert (=> b!1451857 (= res!983046 (validKeyInArray!0 (select (arr!47479 a!2862) j!93)))))

(declare-fun b!1451858 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98382 (_ BitVec 32)) SeekEntryResult!11731)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98382 (_ BitVec 32)) SeekEntryResult!11731)

(assert (=> b!1451858 (= e!817393 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636773 lt!636770 mask!2687) (seekEntryOrOpen!0 lt!636773 lt!636770 mask!2687)))))

(declare-fun b!1451859 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451859 (= e!817391 (and (or (= (select (arr!47479 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47479 a!2862) intermediateBeforeIndex!19) (select (arr!47479 a!2862) j!93))) (or (and (= (select (arr!47479 a!2862) index!646) (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47479 a!2862) index!646) (select (arr!47479 a!2862) j!93))) (= (select (arr!47479 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451860 () Bool)

(declare-fun res!983048 () Bool)

(assert (=> b!1451860 (=> (not res!983048) (not e!817392))))

(declare-datatypes ((List!33980 0))(
  ( (Nil!33977) (Cons!33976 (h!35326 (_ BitVec 64)) (t!48674 List!33980)) )
))
(declare-fun arrayNoDuplicates!0 (array!98382 (_ BitVec 32) List!33980) Bool)

(assert (=> b!1451860 (= res!983048 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33977))))

(declare-fun b!1451861 () Bool)

(assert (=> b!1451861 (= e!817392 e!817395)))

(declare-fun res!983037 () Bool)

(assert (=> b!1451861 (=> (not res!983037) (not e!817395))))

(assert (=> b!1451861 (= res!983037 (= (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451861 (= lt!636770 (array!98383 (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48029 a!2862)))))

(declare-fun b!1451862 () Bool)

(declare-fun res!983042 () Bool)

(assert (=> b!1451862 (=> (not res!983042) (not e!817392))))

(assert (=> b!1451862 (= res!983042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451863 () Bool)

(declare-fun res!983047 () Bool)

(assert (=> b!1451863 (=> (not res!983047) (not e!817394))))

(assert (=> b!1451863 (= res!983047 e!817393)))

(declare-fun c!133917 () Bool)

(assert (=> b!1451863 (= c!133917 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451850 () Bool)

(assert (=> b!1451850 (= e!817397 e!817394)))

(declare-fun res!983040 () Bool)

(assert (=> b!1451850 (=> (not res!983040) (not e!817394))))

(assert (=> b!1451850 (= res!983040 (= lt!636772 (Intermediate!11731 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451850 (= lt!636772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636773 mask!2687) lt!636773 lt!636770 mask!2687))))

(assert (=> b!1451850 (= lt!636773 (select (store (arr!47479 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!983038 () Bool)

(assert (=> start!124934 (=> (not res!983038) (not e!817392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124934 (= res!983038 (validMask!0 mask!2687))))

(assert (=> start!124934 e!817392))

(assert (=> start!124934 true))

(declare-fun array_inv!36507 (array!98382) Bool)

(assert (=> start!124934 (array_inv!36507 a!2862)))

(declare-fun b!1451864 () Bool)

(declare-fun res!983045 () Bool)

(assert (=> b!1451864 (=> (not res!983045) (not e!817392))))

(assert (=> b!1451864 (= res!983045 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48029 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48029 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48029 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451865 () Bool)

(declare-fun res!983050 () Bool)

(assert (=> b!1451865 (=> (not res!983050) (not e!817391))))

(assert (=> b!1451865 (= res!983050 (= (seekEntryOrOpen!0 (select (arr!47479 a!2862) j!93) a!2862 mask!2687) (Found!11731 j!93)))))

(assert (= (and start!124934 res!983038) b!1451853))

(assert (= (and b!1451853 res!983043) b!1451856))

(assert (= (and b!1451856 res!983049) b!1451857))

(assert (= (and b!1451857 res!983046) b!1451862))

(assert (= (and b!1451862 res!983042) b!1451860))

(assert (= (and b!1451860 res!983048) b!1451864))

(assert (= (and b!1451864 res!983045) b!1451861))

(assert (= (and b!1451861 res!983037) b!1451854))

(assert (= (and b!1451854 res!983041) b!1451852))

(assert (= (and b!1451852 res!983036) b!1451850))

(assert (= (and b!1451850 res!983040) b!1451863))

(assert (= (and b!1451863 c!133917) b!1451851))

(assert (= (and b!1451863 (not c!133917)) b!1451858))

(assert (= (and b!1451863 res!983047) b!1451855))

(assert (= (and b!1451855 res!983039) b!1451849))

(assert (= (and b!1451849 res!983044) b!1451865))

(assert (= (and b!1451865 res!983050) b!1451859))

(declare-fun m!1340435 () Bool)

(assert (=> b!1451861 m!1340435))

(declare-fun m!1340437 () Bool)

(assert (=> b!1451861 m!1340437))

(declare-fun m!1340439 () Bool)

(assert (=> b!1451860 m!1340439))

(declare-fun m!1340441 () Bool)

(assert (=> b!1451850 m!1340441))

(assert (=> b!1451850 m!1340441))

(declare-fun m!1340443 () Bool)

(assert (=> b!1451850 m!1340443))

(assert (=> b!1451850 m!1340435))

(declare-fun m!1340445 () Bool)

(assert (=> b!1451850 m!1340445))

(declare-fun m!1340447 () Bool)

(assert (=> b!1451857 m!1340447))

(assert (=> b!1451857 m!1340447))

(declare-fun m!1340449 () Bool)

(assert (=> b!1451857 m!1340449))

(declare-fun m!1340451 () Bool)

(assert (=> b!1451849 m!1340451))

(declare-fun m!1340453 () Bool)

(assert (=> b!1451849 m!1340453))

(assert (=> b!1451859 m!1340435))

(declare-fun m!1340455 () Bool)

(assert (=> b!1451859 m!1340455))

(declare-fun m!1340457 () Bool)

(assert (=> b!1451859 m!1340457))

(declare-fun m!1340459 () Bool)

(assert (=> b!1451859 m!1340459))

(assert (=> b!1451859 m!1340447))

(declare-fun m!1340461 () Bool)

(assert (=> start!124934 m!1340461))

(declare-fun m!1340463 () Bool)

(assert (=> start!124934 m!1340463))

(assert (=> b!1451852 m!1340447))

(assert (=> b!1451852 m!1340447))

(declare-fun m!1340465 () Bool)

(assert (=> b!1451852 m!1340465))

(declare-fun m!1340467 () Bool)

(assert (=> b!1451856 m!1340467))

(assert (=> b!1451856 m!1340467))

(declare-fun m!1340469 () Bool)

(assert (=> b!1451856 m!1340469))

(assert (=> b!1451865 m!1340447))

(assert (=> b!1451865 m!1340447))

(declare-fun m!1340471 () Bool)

(assert (=> b!1451865 m!1340471))

(assert (=> b!1451854 m!1340447))

(assert (=> b!1451854 m!1340447))

(declare-fun m!1340473 () Bool)

(assert (=> b!1451854 m!1340473))

(assert (=> b!1451854 m!1340473))

(assert (=> b!1451854 m!1340447))

(declare-fun m!1340475 () Bool)

(assert (=> b!1451854 m!1340475))

(declare-fun m!1340477 () Bool)

(assert (=> b!1451851 m!1340477))

(declare-fun m!1340479 () Bool)

(assert (=> b!1451858 m!1340479))

(declare-fun m!1340481 () Bool)

(assert (=> b!1451858 m!1340481))

(declare-fun m!1340483 () Bool)

(assert (=> b!1451862 m!1340483))

(push 1)

