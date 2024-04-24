; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129428 () Bool)

(assert start!129428)

(declare-fun b!1517107 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!846735 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101098 0))(
  ( (array!101099 (arr!48781 (Array (_ BitVec 32) (_ BitVec 64))) (size!49332 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101098)

(declare-datatypes ((SeekEntryResult!12845 0))(
  ( (MissingZero!12845 (index!53775 (_ BitVec 32))) (Found!12845 (index!53776 (_ BitVec 32))) (Intermediate!12845 (undefined!13657 Bool) (index!53777 (_ BitVec 32)) (x!135680 (_ BitVec 32))) (Undefined!12845) (MissingVacant!12845 (index!53778 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12845)

(assert (=> b!1517107 (= e!846735 (= (seekEntry!0 (select (arr!48781 a!2804) j!70) a!2804 mask!2512) (Found!12845 j!70)))))

(declare-fun b!1517108 () Bool)

(declare-fun res!1035840 () Bool)

(declare-fun e!846732 () Bool)

(assert (=> b!1517108 (=> (not res!1035840) (not e!846732))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657410 () SeekEntryResult!12845)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12845)

(assert (=> b!1517108 (= res!1035840 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48781 a!2804) j!70) a!2804 mask!2512) lt!657410))))

(declare-fun b!1517109 () Bool)

(declare-fun e!846738 () Bool)

(assert (=> b!1517109 (= e!846732 e!846738)))

(declare-fun res!1035835 () Bool)

(assert (=> b!1517109 (=> (not res!1035835) (not e!846738))))

(declare-fun lt!657408 () (_ BitVec 64))

(declare-fun lt!657405 () SeekEntryResult!12845)

(declare-fun lt!657407 () array!101098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517109 (= res!1035835 (= lt!657405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657408 mask!2512) lt!657408 lt!657407 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517109 (= lt!657408 (select (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1517109 (= lt!657407 (array!101099 (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49332 a!2804)))))

(declare-fun res!1035836 () Bool)

(declare-fun e!846734 () Bool)

(assert (=> start!129428 (=> (not res!1035836) (not e!846734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129428 (= res!1035836 (validMask!0 mask!2512))))

(assert (=> start!129428 e!846734))

(assert (=> start!129428 true))

(declare-fun array_inv!38062 (array!101098) Bool)

(assert (=> start!129428 (array_inv!38062 a!2804)))

(declare-fun b!1517110 () Bool)

(declare-fun res!1035842 () Bool)

(assert (=> b!1517110 (=> (not res!1035842) (not e!846734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517110 (= res!1035842 (validKeyInArray!0 (select (arr!48781 a!2804) j!70)))))

(declare-fun b!1517111 () Bool)

(declare-fun res!1035833 () Bool)

(assert (=> b!1517111 (=> (not res!1035833) (not e!846734))))

(assert (=> b!1517111 (= res!1035833 (and (= (size!49332 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49332 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49332 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517112 () Bool)

(assert (=> b!1517112 (= e!846734 e!846732)))

(declare-fun res!1035837 () Bool)

(assert (=> b!1517112 (=> (not res!1035837) (not e!846732))))

(assert (=> b!1517112 (= res!1035837 (= lt!657405 lt!657410))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517112 (= lt!657410 (Intermediate!12845 false resIndex!21 resX!21))))

(assert (=> b!1517112 (= lt!657405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48781 a!2804) j!70) mask!2512) (select (arr!48781 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517113 () Bool)

(declare-fun res!1035843 () Bool)

(assert (=> b!1517113 (=> (not res!1035843) (not e!846734))))

(assert (=> b!1517113 (= res!1035843 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49332 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49332 a!2804))))))

(declare-fun b!1517114 () Bool)

(declare-fun e!846733 () Bool)

(assert (=> b!1517114 (= e!846738 (not e!846733))))

(declare-fun res!1035834 () Bool)

(assert (=> b!1517114 (=> res!1035834 e!846733)))

(assert (=> b!1517114 (= res!1035834 (or (not (= (select (arr!48781 a!2804) j!70) lt!657408)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48781 a!2804) index!487) (select (arr!48781 a!2804) j!70)) (not (= (select (arr!48781 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1517114 e!846735))

(declare-fun res!1035844 () Bool)

(assert (=> b!1517114 (=> (not res!1035844) (not e!846735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101098 (_ BitVec 32)) Bool)

(assert (=> b!1517114 (= res!1035844 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50593 0))(
  ( (Unit!50594) )
))
(declare-fun lt!657409 () Unit!50593)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50593)

(assert (=> b!1517114 (= lt!657409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517115 () Bool)

(declare-fun e!846736 () Bool)

(assert (=> b!1517115 (= e!846736 true)))

(declare-fun lt!657404 () SeekEntryResult!12845)

(declare-fun lt!657406 () SeekEntryResult!12845)

(assert (=> b!1517115 (= lt!657404 lt!657406)))

(declare-fun lt!657412 () Unit!50593)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50593)

(assert (=> b!1517115 (= lt!657412 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1517116 () Bool)

(assert (=> b!1517116 (= e!846733 e!846736)))

(declare-fun res!1035838 () Bool)

(assert (=> b!1517116 (=> res!1035838 e!846736)))

(assert (=> b!1517116 (= res!1035838 (not (= lt!657406 (Found!12845 j!70))))))

(declare-fun lt!657411 () SeekEntryResult!12845)

(assert (=> b!1517116 (= lt!657411 lt!657404)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12845)

(assert (=> b!1517116 (= lt!657404 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657408 lt!657407 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12845)

(assert (=> b!1517116 (= lt!657411 (seekEntryOrOpen!0 lt!657408 lt!657407 mask!2512))))

(declare-fun lt!657403 () SeekEntryResult!12845)

(assert (=> b!1517116 (= lt!657403 lt!657406)))

(assert (=> b!1517116 (= lt!657406 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48781 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1517116 (= lt!657403 (seekEntryOrOpen!0 (select (arr!48781 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517117 () Bool)

(declare-fun res!1035845 () Bool)

(assert (=> b!1517117 (=> (not res!1035845) (not e!846734))))

(declare-datatypes ((List!35251 0))(
  ( (Nil!35248) (Cons!35247 (h!36674 (_ BitVec 64)) (t!49937 List!35251)) )
))
(declare-fun arrayNoDuplicates!0 (array!101098 (_ BitVec 32) List!35251) Bool)

(assert (=> b!1517117 (= res!1035845 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35248))))

(declare-fun b!1517118 () Bool)

(declare-fun res!1035841 () Bool)

(assert (=> b!1517118 (=> (not res!1035841) (not e!846734))))

(assert (=> b!1517118 (= res!1035841 (validKeyInArray!0 (select (arr!48781 a!2804) i!961)))))

(declare-fun b!1517119 () Bool)

(declare-fun res!1035839 () Bool)

(assert (=> b!1517119 (=> (not res!1035839) (not e!846734))))

(assert (=> b!1517119 (= res!1035839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129428 res!1035836) b!1517111))

(assert (= (and b!1517111 res!1035833) b!1517118))

(assert (= (and b!1517118 res!1035841) b!1517110))

(assert (= (and b!1517110 res!1035842) b!1517119))

(assert (= (and b!1517119 res!1035839) b!1517117))

(assert (= (and b!1517117 res!1035845) b!1517113))

(assert (= (and b!1517113 res!1035843) b!1517112))

(assert (= (and b!1517112 res!1035837) b!1517108))

(assert (= (and b!1517108 res!1035840) b!1517109))

(assert (= (and b!1517109 res!1035835) b!1517114))

(assert (= (and b!1517114 res!1035844) b!1517107))

(assert (= (and b!1517114 (not res!1035834)) b!1517116))

(assert (= (and b!1517116 (not res!1035838)) b!1517115))

(declare-fun m!1400139 () Bool)

(assert (=> b!1517109 m!1400139))

(assert (=> b!1517109 m!1400139))

(declare-fun m!1400141 () Bool)

(assert (=> b!1517109 m!1400141))

(declare-fun m!1400143 () Bool)

(assert (=> b!1517109 m!1400143))

(declare-fun m!1400145 () Bool)

(assert (=> b!1517109 m!1400145))

(declare-fun m!1400147 () Bool)

(assert (=> b!1517117 m!1400147))

(declare-fun m!1400149 () Bool)

(assert (=> start!129428 m!1400149))

(declare-fun m!1400151 () Bool)

(assert (=> start!129428 m!1400151))

(declare-fun m!1400153 () Bool)

(assert (=> b!1517119 m!1400153))

(declare-fun m!1400155 () Bool)

(assert (=> b!1517116 m!1400155))

(declare-fun m!1400157 () Bool)

(assert (=> b!1517116 m!1400157))

(assert (=> b!1517116 m!1400155))

(declare-fun m!1400159 () Bool)

(assert (=> b!1517116 m!1400159))

(declare-fun m!1400161 () Bool)

(assert (=> b!1517116 m!1400161))

(assert (=> b!1517116 m!1400155))

(declare-fun m!1400163 () Bool)

(assert (=> b!1517116 m!1400163))

(assert (=> b!1517110 m!1400155))

(assert (=> b!1517110 m!1400155))

(declare-fun m!1400165 () Bool)

(assert (=> b!1517110 m!1400165))

(assert (=> b!1517108 m!1400155))

(assert (=> b!1517108 m!1400155))

(declare-fun m!1400167 () Bool)

(assert (=> b!1517108 m!1400167))

(declare-fun m!1400169 () Bool)

(assert (=> b!1517118 m!1400169))

(assert (=> b!1517118 m!1400169))

(declare-fun m!1400171 () Bool)

(assert (=> b!1517118 m!1400171))

(assert (=> b!1517114 m!1400155))

(declare-fun m!1400173 () Bool)

(assert (=> b!1517114 m!1400173))

(declare-fun m!1400175 () Bool)

(assert (=> b!1517114 m!1400175))

(declare-fun m!1400177 () Bool)

(assert (=> b!1517114 m!1400177))

(declare-fun m!1400179 () Bool)

(assert (=> b!1517115 m!1400179))

(assert (=> b!1517112 m!1400155))

(assert (=> b!1517112 m!1400155))

(declare-fun m!1400181 () Bool)

(assert (=> b!1517112 m!1400181))

(assert (=> b!1517112 m!1400181))

(assert (=> b!1517112 m!1400155))

(declare-fun m!1400183 () Bool)

(assert (=> b!1517112 m!1400183))

(assert (=> b!1517107 m!1400155))

(assert (=> b!1517107 m!1400155))

(declare-fun m!1400185 () Bool)

(assert (=> b!1517107 m!1400185))

(check-sat (not b!1517119) (not b!1517112) (not b!1517117) (not b!1517115) (not b!1517114) (not b!1517108) (not start!129428) (not b!1517109) (not b!1517118) (not b!1517107) (not b!1517110) (not b!1517116))
(check-sat)
