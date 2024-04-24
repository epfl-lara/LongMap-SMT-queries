; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129590 () Bool)

(assert start!129590)

(declare-fun b!1519432 () Bool)

(declare-fun res!1037984 () Bool)

(declare-fun e!847869 () Bool)

(assert (=> b!1519432 (=> (not res!1037984) (not e!847869))))

(declare-datatypes ((SeekEntryResult!12899 0))(
  ( (MissingZero!12899 (index!53991 (_ BitVec 32))) (Found!12899 (index!53992 (_ BitVec 32))) (Intermediate!12899 (undefined!13711 Bool) (index!53993 (_ BitVec 32)) (x!135884 (_ BitVec 32))) (Undefined!12899) (MissingVacant!12899 (index!53994 (_ BitVec 32))) )
))
(declare-fun lt!658539 () SeekEntryResult!12899)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101209 0))(
  ( (array!101210 (arr!48835 (Array (_ BitVec 32) (_ BitVec 64))) (size!49386 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101209 (_ BitVec 32)) SeekEntryResult!12899)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519432 (= res!1037984 (= lt!658539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48835 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48835 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101210 (store (arr!48835 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49386 a!2804)) mask!2512)))))

(declare-fun b!1519433 () Bool)

(declare-fun res!1037978 () Bool)

(assert (=> b!1519433 (=> (not res!1037978) (not e!847869))))

(declare-fun lt!658540 () SeekEntryResult!12899)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519433 (= res!1037978 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48835 a!2804) j!70) a!2804 mask!2512) lt!658540))))

(declare-fun b!1519434 () Bool)

(declare-fun res!1037986 () Bool)

(declare-fun e!847868 () Bool)

(assert (=> b!1519434 (=> (not res!1037986) (not e!847868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101209 (_ BitVec 32)) Bool)

(assert (=> b!1519434 (= res!1037986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1037979 () Bool)

(assert (=> start!129590 (=> (not res!1037979) (not e!847868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129590 (= res!1037979 (validMask!0 mask!2512))))

(assert (=> start!129590 e!847868))

(assert (=> start!129590 true))

(declare-fun array_inv!38116 (array!101209) Bool)

(assert (=> start!129590 (array_inv!38116 a!2804)))

(declare-fun b!1519435 () Bool)

(declare-fun e!847871 () Bool)

(assert (=> b!1519435 (= e!847871 true)))

(declare-fun lt!658537 () SeekEntryResult!12899)

(declare-fun lt!658538 () (_ BitVec 32))

(assert (=> b!1519435 (= lt!658537 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658538 (select (arr!48835 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519436 () Bool)

(declare-fun res!1037983 () Bool)

(assert (=> b!1519436 (=> (not res!1037983) (not e!847868))))

(declare-datatypes ((List!35305 0))(
  ( (Nil!35302) (Cons!35301 (h!36731 (_ BitVec 64)) (t!49991 List!35305)) )
))
(declare-fun arrayNoDuplicates!0 (array!101209 (_ BitVec 32) List!35305) Bool)

(assert (=> b!1519436 (= res!1037983 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35302))))

(declare-fun b!1519437 () Bool)

(declare-fun e!847867 () Bool)

(assert (=> b!1519437 (= e!847869 (not e!847867))))

(declare-fun res!1037976 () Bool)

(assert (=> b!1519437 (=> res!1037976 e!847867)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519437 (= res!1037976 (or (not (= (select (arr!48835 a!2804) j!70) (select (store (arr!48835 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!847872 () Bool)

(assert (=> b!1519437 e!847872))

(declare-fun res!1037977 () Bool)

(assert (=> b!1519437 (=> (not res!1037977) (not e!847872))))

(assert (=> b!1519437 (= res!1037977 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50701 0))(
  ( (Unit!50702) )
))
(declare-fun lt!658536 () Unit!50701)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50701)

(assert (=> b!1519437 (= lt!658536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519438 () Bool)

(assert (=> b!1519438 (= e!847867 e!847871)))

(declare-fun res!1037980 () Bool)

(assert (=> b!1519438 (=> res!1037980 e!847871)))

(assert (=> b!1519438 (= res!1037980 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658538 #b00000000000000000000000000000000) (bvsge lt!658538 (size!49386 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519438 (= lt!658538 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1519439 () Bool)

(declare-fun res!1037985 () Bool)

(assert (=> b!1519439 (=> (not res!1037985) (not e!847868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519439 (= res!1037985 (validKeyInArray!0 (select (arr!48835 a!2804) i!961)))))

(declare-fun b!1519440 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101209 (_ BitVec 32)) SeekEntryResult!12899)

(assert (=> b!1519440 (= e!847872 (= (seekEntry!0 (select (arr!48835 a!2804) j!70) a!2804 mask!2512) (Found!12899 j!70)))))

(declare-fun b!1519441 () Bool)

(assert (=> b!1519441 (= e!847868 e!847869)))

(declare-fun res!1037981 () Bool)

(assert (=> b!1519441 (=> (not res!1037981) (not e!847869))))

(assert (=> b!1519441 (= res!1037981 (= lt!658539 lt!658540))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519441 (= lt!658540 (Intermediate!12899 false resIndex!21 resX!21))))

(assert (=> b!1519441 (= lt!658539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48835 a!2804) j!70) mask!2512) (select (arr!48835 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519442 () Bool)

(declare-fun res!1037975 () Bool)

(assert (=> b!1519442 (=> (not res!1037975) (not e!847868))))

(assert (=> b!1519442 (= res!1037975 (and (= (size!49386 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49386 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49386 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519443 () Bool)

(declare-fun res!1037987 () Bool)

(assert (=> b!1519443 (=> (not res!1037987) (not e!847868))))

(assert (=> b!1519443 (= res!1037987 (validKeyInArray!0 (select (arr!48835 a!2804) j!70)))))

(declare-fun b!1519444 () Bool)

(declare-fun res!1037982 () Bool)

(assert (=> b!1519444 (=> (not res!1037982) (not e!847868))))

(assert (=> b!1519444 (= res!1037982 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49386 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49386 a!2804))))))

(assert (= (and start!129590 res!1037979) b!1519442))

(assert (= (and b!1519442 res!1037975) b!1519439))

(assert (= (and b!1519439 res!1037985) b!1519443))

(assert (= (and b!1519443 res!1037987) b!1519434))

(assert (= (and b!1519434 res!1037986) b!1519436))

(assert (= (and b!1519436 res!1037983) b!1519444))

(assert (= (and b!1519444 res!1037982) b!1519441))

(assert (= (and b!1519441 res!1037981) b!1519433))

(assert (= (and b!1519433 res!1037978) b!1519432))

(assert (= (and b!1519432 res!1037984) b!1519437))

(assert (= (and b!1519437 res!1037977) b!1519440))

(assert (= (and b!1519437 (not res!1037976)) b!1519438))

(assert (= (and b!1519438 (not res!1037980)) b!1519435))

(declare-fun m!1402569 () Bool)

(assert (=> b!1519438 m!1402569))

(declare-fun m!1402571 () Bool)

(assert (=> b!1519432 m!1402571))

(declare-fun m!1402573 () Bool)

(assert (=> b!1519432 m!1402573))

(assert (=> b!1519432 m!1402573))

(declare-fun m!1402575 () Bool)

(assert (=> b!1519432 m!1402575))

(assert (=> b!1519432 m!1402575))

(assert (=> b!1519432 m!1402573))

(declare-fun m!1402577 () Bool)

(assert (=> b!1519432 m!1402577))

(declare-fun m!1402579 () Bool)

(assert (=> b!1519441 m!1402579))

(assert (=> b!1519441 m!1402579))

(declare-fun m!1402581 () Bool)

(assert (=> b!1519441 m!1402581))

(assert (=> b!1519441 m!1402581))

(assert (=> b!1519441 m!1402579))

(declare-fun m!1402583 () Bool)

(assert (=> b!1519441 m!1402583))

(assert (=> b!1519440 m!1402579))

(assert (=> b!1519440 m!1402579))

(declare-fun m!1402585 () Bool)

(assert (=> b!1519440 m!1402585))

(assert (=> b!1519433 m!1402579))

(assert (=> b!1519433 m!1402579))

(declare-fun m!1402587 () Bool)

(assert (=> b!1519433 m!1402587))

(declare-fun m!1402589 () Bool)

(assert (=> start!129590 m!1402589))

(declare-fun m!1402591 () Bool)

(assert (=> start!129590 m!1402591))

(declare-fun m!1402593 () Bool)

(assert (=> b!1519439 m!1402593))

(assert (=> b!1519439 m!1402593))

(declare-fun m!1402595 () Bool)

(assert (=> b!1519439 m!1402595))

(assert (=> b!1519435 m!1402579))

(assert (=> b!1519435 m!1402579))

(declare-fun m!1402597 () Bool)

(assert (=> b!1519435 m!1402597))

(assert (=> b!1519443 m!1402579))

(assert (=> b!1519443 m!1402579))

(declare-fun m!1402599 () Bool)

(assert (=> b!1519443 m!1402599))

(declare-fun m!1402601 () Bool)

(assert (=> b!1519434 m!1402601))

(assert (=> b!1519437 m!1402579))

(declare-fun m!1402603 () Bool)

(assert (=> b!1519437 m!1402603))

(assert (=> b!1519437 m!1402571))

(assert (=> b!1519437 m!1402573))

(declare-fun m!1402605 () Bool)

(assert (=> b!1519437 m!1402605))

(declare-fun m!1402607 () Bool)

(assert (=> b!1519436 m!1402607))

(check-sat (not b!1519433) (not start!129590) (not b!1519436) (not b!1519432) (not b!1519439) (not b!1519434) (not b!1519438) (not b!1519435) (not b!1519437) (not b!1519441) (not b!1519440) (not b!1519443))
(check-sat)
