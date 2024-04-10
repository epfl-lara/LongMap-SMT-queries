; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129312 () Bool)

(assert start!129312)

(declare-fun b!1518868 () Bool)

(declare-fun e!847290 () Bool)

(assert (=> b!1518868 (= e!847290 true)))

(declare-fun lt!658384 () (_ BitVec 64))

(declare-datatypes ((array!101168 0))(
  ( (array!101169 (arr!48821 (Array (_ BitVec 32) (_ BitVec 64))) (size!49371 (_ BitVec 32))) )
))
(declare-fun lt!658382 () array!101168)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun a!2804 () array!101168)

(declare-datatypes ((SeekEntryResult!12992 0))(
  ( (MissingZero!12992 (index!54363 (_ BitVec 32))) (Found!12992 (index!54364 (_ BitVec 32))) (Intermediate!12992 (undefined!13804 Bool) (index!54365 (_ BitVec 32)) (x!136038 (_ BitVec 32))) (Undefined!12992) (MissingVacant!12992 (index!54366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101168 (_ BitVec 32)) SeekEntryResult!12992)

(assert (=> b!1518868 (= (seekEntryOrOpen!0 (select (arr!48821 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658384 lt!658382 mask!2512))))

(declare-fun lt!658385 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((Unit!50852 0))(
  ( (Unit!50853) )
))
(declare-fun lt!658386 () Unit!50852)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50852)

(assert (=> b!1518868 (= lt!658386 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658385 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518869 () Bool)

(declare-fun res!1038779 () Bool)

(declare-fun e!847294 () Bool)

(assert (=> b!1518869 (=> (not res!1038779) (not e!847294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518869 (= res!1038779 (validKeyInArray!0 (select (arr!48821 a!2804) j!70)))))

(declare-fun b!1518870 () Bool)

(declare-fun res!1038775 () Bool)

(assert (=> b!1518870 (=> (not res!1038775) (not e!847294))))

(assert (=> b!1518870 (= res!1038775 (validKeyInArray!0 (select (arr!48821 a!2804) i!961)))))

(declare-fun b!1518871 () Bool)

(declare-fun res!1038780 () Bool)

(assert (=> b!1518871 (=> (not res!1038780) (not e!847294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101168 (_ BitVec 32)) Bool)

(assert (=> b!1518871 (= res!1038780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518872 () Bool)

(declare-fun e!847293 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101168 (_ BitVec 32)) SeekEntryResult!12992)

(assert (=> b!1518872 (= e!847293 (= (seekEntry!0 (select (arr!48821 a!2804) j!70) a!2804 mask!2512) (Found!12992 j!70)))))

(declare-fun b!1518873 () Bool)

(declare-fun e!847289 () Bool)

(assert (=> b!1518873 (= e!847289 e!847290)))

(declare-fun res!1038783 () Bool)

(assert (=> b!1518873 (=> res!1038783 e!847290)))

(assert (=> b!1518873 (= res!1038783 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658385 #b00000000000000000000000000000000) (bvsge lt!658385 (size!49371 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518873 (= lt!658385 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518874 () Bool)

(declare-fun res!1038774 () Bool)

(assert (=> b!1518874 (=> (not res!1038774) (not e!847294))))

(assert (=> b!1518874 (= res!1038774 (and (= (size!49371 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49371 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49371 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518875 () Bool)

(declare-fun res!1038778 () Bool)

(assert (=> b!1518875 (=> (not res!1038778) (not e!847294))))

(assert (=> b!1518875 (= res!1038778 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49371 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49371 a!2804))))))

(declare-fun b!1518876 () Bool)

(declare-fun res!1038773 () Bool)

(assert (=> b!1518876 (=> res!1038773 e!847290)))

(declare-fun lt!658383 () SeekEntryResult!12992)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101168 (_ BitVec 32)) SeekEntryResult!12992)

(assert (=> b!1518876 (= res!1038773 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658385 (select (arr!48821 a!2804) j!70) a!2804 mask!2512) lt!658383)))))

(declare-fun b!1518877 () Bool)

(declare-fun res!1038776 () Bool)

(assert (=> b!1518877 (=> (not res!1038776) (not e!847294))))

(declare-datatypes ((List!35304 0))(
  ( (Nil!35301) (Cons!35300 (h!36712 (_ BitVec 64)) (t!49998 List!35304)) )
))
(declare-fun arrayNoDuplicates!0 (array!101168 (_ BitVec 32) List!35304) Bool)

(assert (=> b!1518877 (= res!1038776 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35301))))

(declare-fun b!1518878 () Bool)

(declare-fun e!847288 () Bool)

(declare-fun e!847291 () Bool)

(assert (=> b!1518878 (= e!847288 e!847291)))

(declare-fun res!1038782 () Bool)

(assert (=> b!1518878 (=> (not res!1038782) (not e!847291))))

(declare-fun lt!658387 () SeekEntryResult!12992)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518878 (= res!1038782 (= lt!658387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658384 mask!2512) lt!658384 lt!658382 mask!2512)))))

(assert (=> b!1518878 (= lt!658384 (select (store (arr!48821 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518878 (= lt!658382 (array!101169 (store (arr!48821 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49371 a!2804)))))

(declare-fun b!1518879 () Bool)

(assert (=> b!1518879 (= e!847291 (not e!847289))))

(declare-fun res!1038772 () Bool)

(assert (=> b!1518879 (=> res!1038772 e!847289)))

(assert (=> b!1518879 (= res!1038772 (or (not (= (select (arr!48821 a!2804) j!70) lt!658384)) (= x!534 resX!21)))))

(assert (=> b!1518879 e!847293))

(declare-fun res!1038781 () Bool)

(assert (=> b!1518879 (=> (not res!1038781) (not e!847293))))

(assert (=> b!1518879 (= res!1038781 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658381 () Unit!50852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50852)

(assert (=> b!1518879 (= lt!658381 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1038784 () Bool)

(assert (=> start!129312 (=> (not res!1038784) (not e!847294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129312 (= res!1038784 (validMask!0 mask!2512))))

(assert (=> start!129312 e!847294))

(assert (=> start!129312 true))

(declare-fun array_inv!37849 (array!101168) Bool)

(assert (=> start!129312 (array_inv!37849 a!2804)))

(declare-fun b!1518880 () Bool)

(assert (=> b!1518880 (= e!847294 e!847288)))

(declare-fun res!1038777 () Bool)

(assert (=> b!1518880 (=> (not res!1038777) (not e!847288))))

(assert (=> b!1518880 (= res!1038777 (= lt!658387 lt!658383))))

(assert (=> b!1518880 (= lt!658383 (Intermediate!12992 false resIndex!21 resX!21))))

(assert (=> b!1518880 (= lt!658387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48821 a!2804) j!70) mask!2512) (select (arr!48821 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518881 () Bool)

(declare-fun res!1038771 () Bool)

(assert (=> b!1518881 (=> (not res!1038771) (not e!847288))))

(assert (=> b!1518881 (= res!1038771 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48821 a!2804) j!70) a!2804 mask!2512) lt!658383))))

(assert (= (and start!129312 res!1038784) b!1518874))

(assert (= (and b!1518874 res!1038774) b!1518870))

(assert (= (and b!1518870 res!1038775) b!1518869))

(assert (= (and b!1518869 res!1038779) b!1518871))

(assert (= (and b!1518871 res!1038780) b!1518877))

(assert (= (and b!1518877 res!1038776) b!1518875))

(assert (= (and b!1518875 res!1038778) b!1518880))

(assert (= (and b!1518880 res!1038777) b!1518881))

(assert (= (and b!1518881 res!1038771) b!1518878))

(assert (= (and b!1518878 res!1038782) b!1518879))

(assert (= (and b!1518879 res!1038781) b!1518872))

(assert (= (and b!1518879 (not res!1038772)) b!1518873))

(assert (= (and b!1518873 (not res!1038783)) b!1518876))

(assert (= (and b!1518876 (not res!1038773)) b!1518868))

(declare-fun m!1402219 () Bool)

(assert (=> b!1518872 m!1402219))

(assert (=> b!1518872 m!1402219))

(declare-fun m!1402221 () Bool)

(assert (=> b!1518872 m!1402221))

(declare-fun m!1402223 () Bool)

(assert (=> b!1518873 m!1402223))

(assert (=> b!1518880 m!1402219))

(assert (=> b!1518880 m!1402219))

(declare-fun m!1402225 () Bool)

(assert (=> b!1518880 m!1402225))

(assert (=> b!1518880 m!1402225))

(assert (=> b!1518880 m!1402219))

(declare-fun m!1402227 () Bool)

(assert (=> b!1518880 m!1402227))

(assert (=> b!1518869 m!1402219))

(assert (=> b!1518869 m!1402219))

(declare-fun m!1402229 () Bool)

(assert (=> b!1518869 m!1402229))

(assert (=> b!1518868 m!1402219))

(assert (=> b!1518868 m!1402219))

(declare-fun m!1402231 () Bool)

(assert (=> b!1518868 m!1402231))

(declare-fun m!1402233 () Bool)

(assert (=> b!1518868 m!1402233))

(declare-fun m!1402235 () Bool)

(assert (=> b!1518868 m!1402235))

(declare-fun m!1402237 () Bool)

(assert (=> b!1518870 m!1402237))

(assert (=> b!1518870 m!1402237))

(declare-fun m!1402239 () Bool)

(assert (=> b!1518870 m!1402239))

(declare-fun m!1402241 () Bool)

(assert (=> start!129312 m!1402241))

(declare-fun m!1402243 () Bool)

(assert (=> start!129312 m!1402243))

(assert (=> b!1518879 m!1402219))

(declare-fun m!1402245 () Bool)

(assert (=> b!1518879 m!1402245))

(declare-fun m!1402247 () Bool)

(assert (=> b!1518879 m!1402247))

(declare-fun m!1402249 () Bool)

(assert (=> b!1518878 m!1402249))

(assert (=> b!1518878 m!1402249))

(declare-fun m!1402251 () Bool)

(assert (=> b!1518878 m!1402251))

(declare-fun m!1402253 () Bool)

(assert (=> b!1518878 m!1402253))

(declare-fun m!1402255 () Bool)

(assert (=> b!1518878 m!1402255))

(assert (=> b!1518881 m!1402219))

(assert (=> b!1518881 m!1402219))

(declare-fun m!1402257 () Bool)

(assert (=> b!1518881 m!1402257))

(declare-fun m!1402259 () Bool)

(assert (=> b!1518877 m!1402259))

(declare-fun m!1402261 () Bool)

(assert (=> b!1518871 m!1402261))

(assert (=> b!1518876 m!1402219))

(assert (=> b!1518876 m!1402219))

(declare-fun m!1402263 () Bool)

(assert (=> b!1518876 m!1402263))

(push 1)

