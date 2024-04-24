; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129644 () Bool)

(assert start!129644)

(declare-fun b!1520485 () Bool)

(declare-fun res!1039036 () Bool)

(declare-fun e!848355 () Bool)

(assert (=> b!1520485 (=> (not res!1039036) (not e!848355))))

(declare-datatypes ((array!101263 0))(
  ( (array!101264 (arr!48862 (Array (_ BitVec 32) (_ BitVec 64))) (size!49413 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101263)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520485 (= res!1039036 (validKeyInArray!0 (select (arr!48862 a!2804) j!70)))))

(declare-fun b!1520486 () Bool)

(declare-fun res!1039039 () Bool)

(assert (=> b!1520486 (=> (not res!1039039) (not e!848355))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520486 (= res!1039039 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49413 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49413 a!2804))))))

(declare-fun b!1520487 () Bool)

(declare-fun e!848356 () Bool)

(declare-fun e!848353 () Bool)

(assert (=> b!1520487 (= e!848356 e!848353)))

(declare-fun res!1039031 () Bool)

(assert (=> b!1520487 (=> res!1039031 e!848353)))

(declare-fun lt!658941 () (_ BitVec 32))

(assert (=> b!1520487 (= res!1039031 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658941 #b00000000000000000000000000000000) (bvsge lt!658941 (size!49413 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520487 (= lt!658941 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1520488 () Bool)

(declare-fun res!1039028 () Bool)

(assert (=> b!1520488 (=> (not res!1039028) (not e!848355))))

(declare-datatypes ((List!35332 0))(
  ( (Nil!35329) (Cons!35328 (h!36758 (_ BitVec 64)) (t!50018 List!35332)) )
))
(declare-fun arrayNoDuplicates!0 (array!101263 (_ BitVec 32) List!35332) Bool)

(assert (=> b!1520488 (= res!1039028 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35329))))

(declare-fun b!1520489 () Bool)

(declare-fun res!1039033 () Bool)

(assert (=> b!1520489 (=> (not res!1039033) (not e!848355))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520489 (= res!1039033 (and (= (size!49413 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49413 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49413 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520490 () Bool)

(declare-fun e!848357 () Bool)

(assert (=> b!1520490 (= e!848355 e!848357)))

(declare-fun res!1039035 () Bool)

(assert (=> b!1520490 (=> (not res!1039035) (not e!848357))))

(declare-datatypes ((SeekEntryResult!12926 0))(
  ( (MissingZero!12926 (index!54099 (_ BitVec 32))) (Found!12926 (index!54100 (_ BitVec 32))) (Intermediate!12926 (undefined!13738 Bool) (index!54101 (_ BitVec 32)) (x!135983 (_ BitVec 32))) (Undefined!12926) (MissingVacant!12926 (index!54102 (_ BitVec 32))) )
))
(declare-fun lt!658944 () SeekEntryResult!12926)

(declare-fun lt!658942 () SeekEntryResult!12926)

(assert (=> b!1520490 (= res!1039035 (= lt!658944 lt!658942))))

(assert (=> b!1520490 (= lt!658942 (Intermediate!12926 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101263 (_ BitVec 32)) SeekEntryResult!12926)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520490 (= lt!658944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48862 a!2804) j!70) mask!2512) (select (arr!48862 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520491 () Bool)

(assert (=> b!1520491 (= e!848353 true)))

(declare-fun lt!658943 () SeekEntryResult!12926)

(assert (=> b!1520491 (= lt!658943 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658941 (select (arr!48862 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520492 () Bool)

(declare-fun res!1039037 () Bool)

(assert (=> b!1520492 (=> (not res!1039037) (not e!848355))))

(assert (=> b!1520492 (= res!1039037 (validKeyInArray!0 (select (arr!48862 a!2804) i!961)))))

(declare-fun b!1520493 () Bool)

(declare-fun res!1039029 () Bool)

(assert (=> b!1520493 (=> (not res!1039029) (not e!848357))))

(assert (=> b!1520493 (= res!1039029 (= lt!658944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48862 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48862 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101264 (store (arr!48862 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49413 a!2804)) mask!2512)))))

(declare-fun b!1520494 () Bool)

(assert (=> b!1520494 (= e!848357 (not e!848356))))

(declare-fun res!1039034 () Bool)

(assert (=> b!1520494 (=> res!1039034 e!848356)))

(assert (=> b!1520494 (= res!1039034 (or (not (= (select (arr!48862 a!2804) j!70) (select (store (arr!48862 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!848358 () Bool)

(assert (=> b!1520494 e!848358))

(declare-fun res!1039030 () Bool)

(assert (=> b!1520494 (=> (not res!1039030) (not e!848358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101263 (_ BitVec 32)) Bool)

(assert (=> b!1520494 (= res!1039030 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50755 0))(
  ( (Unit!50756) )
))
(declare-fun lt!658945 () Unit!50755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101263 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50755)

(assert (=> b!1520494 (= lt!658945 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1039038 () Bool)

(assert (=> start!129644 (=> (not res!1039038) (not e!848355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129644 (= res!1039038 (validMask!0 mask!2512))))

(assert (=> start!129644 e!848355))

(assert (=> start!129644 true))

(declare-fun array_inv!38143 (array!101263) Bool)

(assert (=> start!129644 (array_inv!38143 a!2804)))

(declare-fun b!1520495 () Bool)

(declare-fun res!1039032 () Bool)

(assert (=> b!1520495 (=> (not res!1039032) (not e!848357))))

(assert (=> b!1520495 (= res!1039032 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48862 a!2804) j!70) a!2804 mask!2512) lt!658942))))

(declare-fun b!1520496 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101263 (_ BitVec 32)) SeekEntryResult!12926)

(assert (=> b!1520496 (= e!848358 (= (seekEntry!0 (select (arr!48862 a!2804) j!70) a!2804 mask!2512) (Found!12926 j!70)))))

(declare-fun b!1520497 () Bool)

(declare-fun res!1039040 () Bool)

(assert (=> b!1520497 (=> (not res!1039040) (not e!848355))))

(assert (=> b!1520497 (= res!1039040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129644 res!1039038) b!1520489))

(assert (= (and b!1520489 res!1039033) b!1520492))

(assert (= (and b!1520492 res!1039037) b!1520485))

(assert (= (and b!1520485 res!1039036) b!1520497))

(assert (= (and b!1520497 res!1039040) b!1520488))

(assert (= (and b!1520488 res!1039028) b!1520486))

(assert (= (and b!1520486 res!1039039) b!1520490))

(assert (= (and b!1520490 res!1039035) b!1520495))

(assert (= (and b!1520495 res!1039032) b!1520493))

(assert (= (and b!1520493 res!1039029) b!1520494))

(assert (= (and b!1520494 res!1039030) b!1520496))

(assert (= (and b!1520494 (not res!1039034)) b!1520487))

(assert (= (and b!1520487 (not res!1039031)) b!1520491))

(declare-fun m!1403649 () Bool)

(assert (=> b!1520496 m!1403649))

(assert (=> b!1520496 m!1403649))

(declare-fun m!1403651 () Bool)

(assert (=> b!1520496 m!1403651))

(declare-fun m!1403653 () Bool)

(assert (=> b!1520492 m!1403653))

(assert (=> b!1520492 m!1403653))

(declare-fun m!1403655 () Bool)

(assert (=> b!1520492 m!1403655))

(declare-fun m!1403657 () Bool)

(assert (=> b!1520488 m!1403657))

(assert (=> b!1520491 m!1403649))

(assert (=> b!1520491 m!1403649))

(declare-fun m!1403659 () Bool)

(assert (=> b!1520491 m!1403659))

(declare-fun m!1403661 () Bool)

(assert (=> b!1520493 m!1403661))

(declare-fun m!1403663 () Bool)

(assert (=> b!1520493 m!1403663))

(assert (=> b!1520493 m!1403663))

(declare-fun m!1403665 () Bool)

(assert (=> b!1520493 m!1403665))

(assert (=> b!1520493 m!1403665))

(assert (=> b!1520493 m!1403663))

(declare-fun m!1403667 () Bool)

(assert (=> b!1520493 m!1403667))

(assert (=> b!1520485 m!1403649))

(assert (=> b!1520485 m!1403649))

(declare-fun m!1403669 () Bool)

(assert (=> b!1520485 m!1403669))

(declare-fun m!1403671 () Bool)

(assert (=> b!1520497 m!1403671))

(assert (=> b!1520490 m!1403649))

(assert (=> b!1520490 m!1403649))

(declare-fun m!1403673 () Bool)

(assert (=> b!1520490 m!1403673))

(assert (=> b!1520490 m!1403673))

(assert (=> b!1520490 m!1403649))

(declare-fun m!1403675 () Bool)

(assert (=> b!1520490 m!1403675))

(assert (=> b!1520495 m!1403649))

(assert (=> b!1520495 m!1403649))

(declare-fun m!1403677 () Bool)

(assert (=> b!1520495 m!1403677))

(declare-fun m!1403679 () Bool)

(assert (=> start!129644 m!1403679))

(declare-fun m!1403681 () Bool)

(assert (=> start!129644 m!1403681))

(assert (=> b!1520494 m!1403649))

(declare-fun m!1403683 () Bool)

(assert (=> b!1520494 m!1403683))

(assert (=> b!1520494 m!1403661))

(assert (=> b!1520494 m!1403663))

(declare-fun m!1403685 () Bool)

(assert (=> b!1520494 m!1403685))

(declare-fun m!1403687 () Bool)

(assert (=> b!1520487 m!1403687))

(check-sat (not b!1520488) (not b!1520494) (not b!1520490) (not b!1520493) (not b!1520495) (not start!129644) (not b!1520492) (not b!1520496) (not b!1520497) (not b!1520485) (not b!1520487) (not b!1520491))
(check-sat)
