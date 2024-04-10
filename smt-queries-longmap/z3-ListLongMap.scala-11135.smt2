; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130108 () Bool)

(assert start!130108)

(declare-fun b!1527154 () Bool)

(declare-fun res!1045188 () Bool)

(declare-fun e!851193 () Bool)

(assert (=> b!1527154 (=> (not res!1045188) (not e!851193))))

(declare-datatypes ((array!101521 0))(
  ( (array!101522 (arr!48987 (Array (_ BitVec 32) (_ BitVec 64))) (size!49537 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101521)

(declare-datatypes ((List!35470 0))(
  ( (Nil!35467) (Cons!35466 (h!36899 (_ BitVec 64)) (t!50164 List!35470)) )
))
(declare-fun arrayNoDuplicates!0 (array!101521 (_ BitVec 32) List!35470) Bool)

(assert (=> b!1527154 (= res!1045188 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35467))))

(declare-fun b!1527155 () Bool)

(declare-fun res!1045194 () Bool)

(declare-fun e!851189 () Bool)

(assert (=> b!1527155 (=> (not res!1045194) (not e!851189))))

(declare-datatypes ((SeekEntryResult!13152 0))(
  ( (MissingZero!13152 (index!55003 (_ BitVec 32))) (Found!13152 (index!55004 (_ BitVec 32))) (Intermediate!13152 (undefined!13964 Bool) (index!55005 (_ BitVec 32)) (x!136694 (_ BitVec 32))) (Undefined!13152) (MissingVacant!13152 (index!55006 (_ BitVec 32))) )
))
(declare-fun lt!661329 () SeekEntryResult!13152)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101521 (_ BitVec 32)) SeekEntryResult!13152)

(assert (=> b!1527155 (= res!1045194 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48987 a!2804) j!70) a!2804 mask!2512) lt!661329))))

(declare-fun b!1527156 () Bool)

(declare-fun e!851188 () Bool)

(assert (=> b!1527156 (= e!851189 e!851188)))

(declare-fun res!1045193 () Bool)

(assert (=> b!1527156 (=> (not res!1045193) (not e!851188))))

(declare-fun lt!661332 () SeekEntryResult!13152)

(declare-fun lt!661333 () array!101521)

(declare-fun lt!661330 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527156 (= res!1045193 (= lt!661332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661330 mask!2512) lt!661330 lt!661333 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527156 (= lt!661330 (select (store (arr!48987 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527156 (= lt!661333 (array!101522 (store (arr!48987 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49537 a!2804)))))

(declare-fun b!1527158 () Bool)

(declare-fun res!1045192 () Bool)

(assert (=> b!1527158 (=> (not res!1045192) (not e!851193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101521 (_ BitVec 32)) Bool)

(assert (=> b!1527158 (= res!1045192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!851190 () Bool)

(declare-fun b!1527159 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101521 (_ BitVec 32)) SeekEntryResult!13152)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101521 (_ BitVec 32)) SeekEntryResult!13152)

(assert (=> b!1527159 (= e!851190 (= (seekEntryOrOpen!0 lt!661330 lt!661333 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661330 lt!661333 mask!2512)))))

(declare-fun b!1527160 () Bool)

(declare-fun e!851191 () Bool)

(declare-fun e!851192 () Bool)

(assert (=> b!1527160 (= e!851191 e!851192)))

(declare-fun res!1045196 () Bool)

(assert (=> b!1527160 (=> res!1045196 e!851192)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527160 (= res!1045196 (or (not (= (select (arr!48987 a!2804) j!70) lt!661330)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48987 a!2804) index!487) (select (arr!48987 a!2804) j!70)) (not (= (select (arr!48987 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527161 () Bool)

(declare-fun res!1045199 () Bool)

(assert (=> b!1527161 (=> (not res!1045199) (not e!851193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527161 (= res!1045199 (validKeyInArray!0 (select (arr!48987 a!2804) i!961)))))

(declare-fun b!1527157 () Bool)

(declare-fun res!1045189 () Bool)

(assert (=> b!1527157 (=> (not res!1045189) (not e!851193))))

(assert (=> b!1527157 (= res!1045189 (and (= (size!49537 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49537 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49537 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1045190 () Bool)

(assert (=> start!130108 (=> (not res!1045190) (not e!851193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130108 (= res!1045190 (validMask!0 mask!2512))))

(assert (=> start!130108 e!851193))

(assert (=> start!130108 true))

(declare-fun array_inv!38015 (array!101521) Bool)

(assert (=> start!130108 (array_inv!38015 a!2804)))

(declare-fun b!1527162 () Bool)

(declare-fun res!1045201 () Bool)

(assert (=> b!1527162 (=> (not res!1045201) (not e!851193))))

(assert (=> b!1527162 (= res!1045201 (validKeyInArray!0 (select (arr!48987 a!2804) j!70)))))

(declare-fun b!1527163 () Bool)

(declare-fun res!1045198 () Bool)

(assert (=> b!1527163 (=> (not res!1045198) (not e!851191))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101521 (_ BitVec 32)) SeekEntryResult!13152)

(assert (=> b!1527163 (= res!1045198 (= (seekEntry!0 (select (arr!48987 a!2804) j!70) a!2804 mask!2512) (Found!13152 j!70)))))

(declare-fun b!1527164 () Bool)

(assert (=> b!1527164 (= e!851193 e!851189)))

(declare-fun res!1045200 () Bool)

(assert (=> b!1527164 (=> (not res!1045200) (not e!851189))))

(assert (=> b!1527164 (= res!1045200 (= lt!661332 lt!661329))))

(assert (=> b!1527164 (= lt!661329 (Intermediate!13152 false resIndex!21 resX!21))))

(assert (=> b!1527164 (= lt!661332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48987 a!2804) j!70) mask!2512) (select (arr!48987 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527165 () Bool)

(assert (=> b!1527165 (= e!851188 (not true))))

(assert (=> b!1527165 e!851191))

(declare-fun res!1045195 () Bool)

(assert (=> b!1527165 (=> (not res!1045195) (not e!851191))))

(assert (=> b!1527165 (= res!1045195 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51088 0))(
  ( (Unit!51089) )
))
(declare-fun lt!661331 () Unit!51088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51088)

(assert (=> b!1527165 (= lt!661331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527166 () Bool)

(assert (=> b!1527166 (= e!851192 e!851190)))

(declare-fun res!1045191 () Bool)

(assert (=> b!1527166 (=> (not res!1045191) (not e!851190))))

(assert (=> b!1527166 (= res!1045191 (= (seekEntryOrOpen!0 (select (arr!48987 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48987 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527167 () Bool)

(declare-fun res!1045197 () Bool)

(assert (=> b!1527167 (=> (not res!1045197) (not e!851193))))

(assert (=> b!1527167 (= res!1045197 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49537 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49537 a!2804))))))

(assert (= (and start!130108 res!1045190) b!1527157))

(assert (= (and b!1527157 res!1045189) b!1527161))

(assert (= (and b!1527161 res!1045199) b!1527162))

(assert (= (and b!1527162 res!1045201) b!1527158))

(assert (= (and b!1527158 res!1045192) b!1527154))

(assert (= (and b!1527154 res!1045188) b!1527167))

(assert (= (and b!1527167 res!1045197) b!1527164))

(assert (= (and b!1527164 res!1045200) b!1527155))

(assert (= (and b!1527155 res!1045194) b!1527156))

(assert (= (and b!1527156 res!1045193) b!1527165))

(assert (= (and b!1527165 res!1045195) b!1527163))

(assert (= (and b!1527163 res!1045198) b!1527160))

(assert (= (and b!1527160 (not res!1045196)) b!1527166))

(assert (= (and b!1527166 res!1045191) b!1527159))

(declare-fun m!1410025 () Bool)

(assert (=> b!1527162 m!1410025))

(assert (=> b!1527162 m!1410025))

(declare-fun m!1410027 () Bool)

(assert (=> b!1527162 m!1410027))

(declare-fun m!1410029 () Bool)

(assert (=> b!1527158 m!1410029))

(declare-fun m!1410031 () Bool)

(assert (=> b!1527156 m!1410031))

(assert (=> b!1527156 m!1410031))

(declare-fun m!1410033 () Bool)

(assert (=> b!1527156 m!1410033))

(declare-fun m!1410035 () Bool)

(assert (=> b!1527156 m!1410035))

(declare-fun m!1410037 () Bool)

(assert (=> b!1527156 m!1410037))

(declare-fun m!1410039 () Bool)

(assert (=> b!1527165 m!1410039))

(declare-fun m!1410041 () Bool)

(assert (=> b!1527165 m!1410041))

(declare-fun m!1410043 () Bool)

(assert (=> start!130108 m!1410043))

(declare-fun m!1410045 () Bool)

(assert (=> start!130108 m!1410045))

(declare-fun m!1410047 () Bool)

(assert (=> b!1527161 m!1410047))

(assert (=> b!1527161 m!1410047))

(declare-fun m!1410049 () Bool)

(assert (=> b!1527161 m!1410049))

(assert (=> b!1527160 m!1410025))

(declare-fun m!1410051 () Bool)

(assert (=> b!1527160 m!1410051))

(assert (=> b!1527155 m!1410025))

(assert (=> b!1527155 m!1410025))

(declare-fun m!1410053 () Bool)

(assert (=> b!1527155 m!1410053))

(assert (=> b!1527166 m!1410025))

(assert (=> b!1527166 m!1410025))

(declare-fun m!1410055 () Bool)

(assert (=> b!1527166 m!1410055))

(assert (=> b!1527166 m!1410025))

(declare-fun m!1410057 () Bool)

(assert (=> b!1527166 m!1410057))

(declare-fun m!1410059 () Bool)

(assert (=> b!1527159 m!1410059))

(declare-fun m!1410061 () Bool)

(assert (=> b!1527159 m!1410061))

(declare-fun m!1410063 () Bool)

(assert (=> b!1527154 m!1410063))

(assert (=> b!1527163 m!1410025))

(assert (=> b!1527163 m!1410025))

(declare-fun m!1410065 () Bool)

(assert (=> b!1527163 m!1410065))

(assert (=> b!1527164 m!1410025))

(assert (=> b!1527164 m!1410025))

(declare-fun m!1410067 () Bool)

(assert (=> b!1527164 m!1410067))

(assert (=> b!1527164 m!1410067))

(assert (=> b!1527164 m!1410025))

(declare-fun m!1410069 () Bool)

(assert (=> b!1527164 m!1410069))

(check-sat (not b!1527165) (not b!1527156) (not b!1527154) (not start!130108) (not b!1527166) (not b!1527159) (not b!1527161) (not b!1527162) (not b!1527164) (not b!1527163) (not b!1527158) (not b!1527155))
(check-sat)
