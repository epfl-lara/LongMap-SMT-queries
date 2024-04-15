; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129020 () Bool)

(assert start!129020)

(declare-fun b!1513821 () Bool)

(declare-fun e!844819 () Bool)

(assert (=> b!1513821 (= e!844819 (not true))))

(declare-fun e!844817 () Bool)

(assert (=> b!1513821 e!844817))

(declare-fun res!1033940 () Bool)

(assert (=> b!1513821 (=> (not res!1033940) (not e!844817))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100876 0))(
  ( (array!100877 (arr!48676 (Array (_ BitVec 32) (_ BitVec 64))) (size!49228 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100876)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100876 (_ BitVec 32)) Bool)

(assert (=> b!1513821 (= res!1033940 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50447 0))(
  ( (Unit!50448) )
))
(declare-fun lt!655941 () Unit!50447)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50447)

(assert (=> b!1513821 (= lt!655941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513822 () Bool)

(declare-fun e!844818 () Bool)

(assert (=> b!1513822 (= e!844817 e!844818)))

(declare-fun res!1033936 () Bool)

(assert (=> b!1513822 (=> res!1033936 e!844818)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!655940 () (_ BitVec 64))

(assert (=> b!1513822 (= res!1033936 (or (not (= (select (arr!48676 a!2804) j!70) lt!655940)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48676 a!2804) index!487) (select (arr!48676 a!2804) j!70)) (not (= (select (arr!48676 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513823 () Bool)

(declare-fun res!1033941 () Bool)

(declare-fun e!844815 () Bool)

(assert (=> b!1513823 (=> (not res!1033941) (not e!844815))))

(assert (=> b!1513823 (= res!1033941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513824 () Bool)

(declare-fun e!844820 () Bool)

(assert (=> b!1513824 (= e!844820 e!844819)))

(declare-fun res!1033932 () Bool)

(assert (=> b!1513824 (=> (not res!1033932) (not e!844819))))

(declare-datatypes ((SeekEntryResult!12870 0))(
  ( (MissingZero!12870 (index!53875 (_ BitVec 32))) (Found!12870 (index!53876 (_ BitVec 32))) (Intermediate!12870 (undefined!13682 Bool) (index!53877 (_ BitVec 32)) (x!135590 (_ BitVec 32))) (Undefined!12870) (MissingVacant!12870 (index!53878 (_ BitVec 32))) )
))
(declare-fun lt!655943 () SeekEntryResult!12870)

(declare-fun lt!655944 () array!100876)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513824 (= res!1033932 (= lt!655943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655940 mask!2512) lt!655940 lt!655944 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513824 (= lt!655940 (select (store (arr!48676 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513824 (= lt!655944 (array!100877 (store (arr!48676 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49228 a!2804)))))

(declare-fun b!1513825 () Bool)

(declare-fun res!1033933 () Bool)

(assert (=> b!1513825 (=> (not res!1033933) (not e!844817))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12870)

(assert (=> b!1513825 (= res!1033933 (= (seekEntry!0 (select (arr!48676 a!2804) j!70) a!2804 mask!2512) (Found!12870 j!70)))))

(declare-fun b!1513826 () Bool)

(declare-fun e!844821 () Bool)

(assert (=> b!1513826 (= e!844818 e!844821)))

(declare-fun res!1033937 () Bool)

(assert (=> b!1513826 (=> (not res!1033937) (not e!844821))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12870)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12870)

(assert (=> b!1513826 (= res!1033937 (= (seekEntryOrOpen!0 (select (arr!48676 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48676 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513827 () Bool)

(declare-fun res!1033930 () Bool)

(assert (=> b!1513827 (=> (not res!1033930) (not e!844815))))

(declare-datatypes ((List!35237 0))(
  ( (Nil!35234) (Cons!35233 (h!36646 (_ BitVec 64)) (t!49923 List!35237)) )
))
(declare-fun arrayNoDuplicates!0 (array!100876 (_ BitVec 32) List!35237) Bool)

(assert (=> b!1513827 (= res!1033930 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35234))))

(declare-fun b!1513828 () Bool)

(declare-fun res!1033935 () Bool)

(assert (=> b!1513828 (=> (not res!1033935) (not e!844815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513828 (= res!1033935 (validKeyInArray!0 (select (arr!48676 a!2804) i!961)))))

(declare-fun b!1513829 () Bool)

(assert (=> b!1513829 (= e!844821 (= (seekEntryOrOpen!0 lt!655940 lt!655944 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655940 lt!655944 mask!2512)))))

(declare-fun res!1033934 () Bool)

(assert (=> start!129020 (=> (not res!1033934) (not e!844815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129020 (= res!1033934 (validMask!0 mask!2512))))

(assert (=> start!129020 e!844815))

(assert (=> start!129020 true))

(declare-fun array_inv!37909 (array!100876) Bool)

(assert (=> start!129020 (array_inv!37909 a!2804)))

(declare-fun b!1513830 () Bool)

(declare-fun res!1033931 () Bool)

(assert (=> b!1513830 (=> (not res!1033931) (not e!844815))))

(assert (=> b!1513830 (= res!1033931 (and (= (size!49228 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49228 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49228 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513831 () Bool)

(declare-fun res!1033943 () Bool)

(assert (=> b!1513831 (=> (not res!1033943) (not e!844820))))

(declare-fun lt!655942 () SeekEntryResult!12870)

(assert (=> b!1513831 (= res!1033943 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48676 a!2804) j!70) a!2804 mask!2512) lt!655942))))

(declare-fun b!1513832 () Bool)

(declare-fun res!1033939 () Bool)

(assert (=> b!1513832 (=> (not res!1033939) (not e!844815))))

(assert (=> b!1513832 (= res!1033939 (validKeyInArray!0 (select (arr!48676 a!2804) j!70)))))

(declare-fun b!1513833 () Bool)

(declare-fun res!1033942 () Bool)

(assert (=> b!1513833 (=> (not res!1033942) (not e!844815))))

(assert (=> b!1513833 (= res!1033942 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49228 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49228 a!2804))))))

(declare-fun b!1513834 () Bool)

(assert (=> b!1513834 (= e!844815 e!844820)))

(declare-fun res!1033938 () Bool)

(assert (=> b!1513834 (=> (not res!1033938) (not e!844820))))

(assert (=> b!1513834 (= res!1033938 (= lt!655943 lt!655942))))

(assert (=> b!1513834 (= lt!655942 (Intermediate!12870 false resIndex!21 resX!21))))

(assert (=> b!1513834 (= lt!655943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48676 a!2804) j!70) mask!2512) (select (arr!48676 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129020 res!1033934) b!1513830))

(assert (= (and b!1513830 res!1033931) b!1513828))

(assert (= (and b!1513828 res!1033935) b!1513832))

(assert (= (and b!1513832 res!1033939) b!1513823))

(assert (= (and b!1513823 res!1033941) b!1513827))

(assert (= (and b!1513827 res!1033930) b!1513833))

(assert (= (and b!1513833 res!1033942) b!1513834))

(assert (= (and b!1513834 res!1033938) b!1513831))

(assert (= (and b!1513831 res!1033943) b!1513824))

(assert (= (and b!1513824 res!1033932) b!1513821))

(assert (= (and b!1513821 res!1033940) b!1513825))

(assert (= (and b!1513825 res!1033933) b!1513822))

(assert (= (and b!1513822 (not res!1033936)) b!1513826))

(assert (= (and b!1513826 res!1033937) b!1513829))

(declare-fun m!1396181 () Bool)

(assert (=> b!1513834 m!1396181))

(assert (=> b!1513834 m!1396181))

(declare-fun m!1396183 () Bool)

(assert (=> b!1513834 m!1396183))

(assert (=> b!1513834 m!1396183))

(assert (=> b!1513834 m!1396181))

(declare-fun m!1396185 () Bool)

(assert (=> b!1513834 m!1396185))

(declare-fun m!1396187 () Bool)

(assert (=> b!1513823 m!1396187))

(assert (=> b!1513831 m!1396181))

(assert (=> b!1513831 m!1396181))

(declare-fun m!1396189 () Bool)

(assert (=> b!1513831 m!1396189))

(assert (=> b!1513826 m!1396181))

(assert (=> b!1513826 m!1396181))

(declare-fun m!1396191 () Bool)

(assert (=> b!1513826 m!1396191))

(assert (=> b!1513826 m!1396181))

(declare-fun m!1396193 () Bool)

(assert (=> b!1513826 m!1396193))

(assert (=> b!1513825 m!1396181))

(assert (=> b!1513825 m!1396181))

(declare-fun m!1396195 () Bool)

(assert (=> b!1513825 m!1396195))

(assert (=> b!1513822 m!1396181))

(declare-fun m!1396197 () Bool)

(assert (=> b!1513822 m!1396197))

(assert (=> b!1513832 m!1396181))

(assert (=> b!1513832 m!1396181))

(declare-fun m!1396199 () Bool)

(assert (=> b!1513832 m!1396199))

(declare-fun m!1396201 () Bool)

(assert (=> b!1513829 m!1396201))

(declare-fun m!1396203 () Bool)

(assert (=> b!1513829 m!1396203))

(declare-fun m!1396205 () Bool)

(assert (=> b!1513828 m!1396205))

(assert (=> b!1513828 m!1396205))

(declare-fun m!1396207 () Bool)

(assert (=> b!1513828 m!1396207))

(declare-fun m!1396209 () Bool)

(assert (=> b!1513824 m!1396209))

(assert (=> b!1513824 m!1396209))

(declare-fun m!1396211 () Bool)

(assert (=> b!1513824 m!1396211))

(declare-fun m!1396213 () Bool)

(assert (=> b!1513824 m!1396213))

(declare-fun m!1396215 () Bool)

(assert (=> b!1513824 m!1396215))

(declare-fun m!1396217 () Bool)

(assert (=> b!1513827 m!1396217))

(declare-fun m!1396219 () Bool)

(assert (=> b!1513821 m!1396219))

(declare-fun m!1396221 () Bool)

(assert (=> b!1513821 m!1396221))

(declare-fun m!1396223 () Bool)

(assert (=> start!129020 m!1396223))

(declare-fun m!1396225 () Bool)

(assert (=> start!129020 m!1396225))

(check-sat (not start!129020) (not b!1513827) (not b!1513826) (not b!1513823) (not b!1513831) (not b!1513832) (not b!1513821) (not b!1513828) (not b!1513824) (not b!1513834) (not b!1513829) (not b!1513825))
(check-sat)
