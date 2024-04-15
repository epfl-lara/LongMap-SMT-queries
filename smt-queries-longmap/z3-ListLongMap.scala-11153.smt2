; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130230 () Bool)

(assert start!130230)

(declare-fun b!1529291 () Bool)

(declare-fun res!1047191 () Bool)

(declare-fun e!852202 () Bool)

(assert (=> b!1529291 (=> (not res!1047191) (not e!852202))))

(declare-datatypes ((SeekEntryResult!13203 0))(
  ( (MissingZero!13203 (index!55207 (_ BitVec 32))) (Found!13203 (index!55208 (_ BitVec 32))) (Intermediate!13203 (undefined!14015 Bool) (index!55209 (_ BitVec 32)) (x!136893 (_ BitVec 32))) (Undefined!13203) (MissingVacant!13203 (index!55210 (_ BitVec 32))) )
))
(declare-fun lt!662203 () SeekEntryResult!13203)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101578 0))(
  ( (array!101579 (arr!49015 (Array (_ BitVec 32) (_ BitVec 64))) (size!49567 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101578)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13203)

(assert (=> b!1529291 (= res!1047191 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49015 a!2804) j!70) a!2804 mask!2512) lt!662203))))

(declare-fun res!1047192 () Bool)

(declare-fun e!852205 () Bool)

(assert (=> start!130230 (=> (not res!1047192) (not e!852205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130230 (= res!1047192 (validMask!0 mask!2512))))

(assert (=> start!130230 e!852205))

(assert (=> start!130230 true))

(declare-fun array_inv!38248 (array!101578) Bool)

(assert (=> start!130230 (array_inv!38248 a!2804)))

(declare-fun b!1529292 () Bool)

(declare-fun res!1047183 () Bool)

(assert (=> b!1529292 (=> (not res!1047183) (not e!852205))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529292 (= res!1047183 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49567 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49567 a!2804))))))

(declare-fun b!1529293 () Bool)

(assert (=> b!1529293 (= e!852205 e!852202)))

(declare-fun res!1047187 () Bool)

(assert (=> b!1529293 (=> (not res!1047187) (not e!852202))))

(declare-fun lt!662205 () SeekEntryResult!13203)

(assert (=> b!1529293 (= res!1047187 (= lt!662205 lt!662203))))

(assert (=> b!1529293 (= lt!662203 (Intermediate!13203 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529293 (= lt!662205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49015 a!2804) j!70) mask!2512) (select (arr!49015 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529294 () Bool)

(declare-fun res!1047185 () Bool)

(assert (=> b!1529294 (=> (not res!1047185) (not e!852202))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529294 (= res!1047185 (= lt!662205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49015 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49015 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101579 (store (arr!49015 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49567 a!2804)) mask!2512)))))

(declare-fun b!1529295 () Bool)

(declare-fun res!1047182 () Bool)

(assert (=> b!1529295 (=> (not res!1047182) (not e!852205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101578 (_ BitVec 32)) Bool)

(assert (=> b!1529295 (= res!1047182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529296 () Bool)

(declare-fun res!1047190 () Bool)

(assert (=> b!1529296 (=> (not res!1047190) (not e!852205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529296 (= res!1047190 (validKeyInArray!0 (select (arr!49015 a!2804) j!70)))))

(declare-fun b!1529297 () Bool)

(declare-fun res!1047186 () Bool)

(assert (=> b!1529297 (=> (not res!1047186) (not e!852205))))

(assert (=> b!1529297 (= res!1047186 (and (= (size!49567 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49567 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49567 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!852201 () Bool)

(declare-fun b!1529298 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13203)

(assert (=> b!1529298 (= e!852201 (= (seekEntry!0 (select (arr!49015 a!2804) j!70) a!2804 mask!2512) (Found!13203 j!70)))))

(declare-fun b!1529299 () Bool)

(declare-fun res!1047193 () Bool)

(assert (=> b!1529299 (=> (not res!1047193) (not e!852205))))

(declare-datatypes ((List!35576 0))(
  ( (Nil!35573) (Cons!35572 (h!37009 (_ BitVec 64)) (t!50262 List!35576)) )
))
(declare-fun arrayNoDuplicates!0 (array!101578 (_ BitVec 32) List!35576) Bool)

(assert (=> b!1529299 (= res!1047193 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35573))))

(declare-fun b!1529300 () Bool)

(declare-fun e!852204 () Bool)

(assert (=> b!1529300 (= e!852202 (not e!852204))))

(declare-fun res!1047189 () Bool)

(assert (=> b!1529300 (=> res!1047189 e!852204)))

(assert (=> b!1529300 (= res!1047189 (or (not (= (select (arr!49015 a!2804) j!70) (select (store (arr!49015 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529300 e!852201))

(declare-fun res!1047188 () Bool)

(assert (=> b!1529300 (=> (not res!1047188) (not e!852201))))

(assert (=> b!1529300 (= res!1047188 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51029 0))(
  ( (Unit!51030) )
))
(declare-fun lt!662202 () Unit!51029)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51029)

(assert (=> b!1529300 (= lt!662202 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529301 () Bool)

(assert (=> b!1529301 (= e!852204 true)))

(declare-fun lt!662204 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529301 (= lt!662204 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529302 () Bool)

(declare-fun res!1047184 () Bool)

(assert (=> b!1529302 (=> (not res!1047184) (not e!852205))))

(assert (=> b!1529302 (= res!1047184 (validKeyInArray!0 (select (arr!49015 a!2804) i!961)))))

(assert (= (and start!130230 res!1047192) b!1529297))

(assert (= (and b!1529297 res!1047186) b!1529302))

(assert (= (and b!1529302 res!1047184) b!1529296))

(assert (= (and b!1529296 res!1047190) b!1529295))

(assert (= (and b!1529295 res!1047182) b!1529299))

(assert (= (and b!1529299 res!1047193) b!1529292))

(assert (= (and b!1529292 res!1047183) b!1529293))

(assert (= (and b!1529293 res!1047187) b!1529291))

(assert (= (and b!1529291 res!1047191) b!1529294))

(assert (= (and b!1529294 res!1047185) b!1529300))

(assert (= (and b!1529300 res!1047188) b!1529298))

(assert (= (and b!1529300 (not res!1047189)) b!1529301))

(declare-fun m!1411667 () Bool)

(assert (=> b!1529298 m!1411667))

(assert (=> b!1529298 m!1411667))

(declare-fun m!1411669 () Bool)

(assert (=> b!1529298 m!1411669))

(declare-fun m!1411671 () Bool)

(assert (=> start!130230 m!1411671))

(declare-fun m!1411673 () Bool)

(assert (=> start!130230 m!1411673))

(assert (=> b!1529296 m!1411667))

(assert (=> b!1529296 m!1411667))

(declare-fun m!1411675 () Bool)

(assert (=> b!1529296 m!1411675))

(declare-fun m!1411677 () Bool)

(assert (=> b!1529299 m!1411677))

(assert (=> b!1529293 m!1411667))

(assert (=> b!1529293 m!1411667))

(declare-fun m!1411679 () Bool)

(assert (=> b!1529293 m!1411679))

(assert (=> b!1529293 m!1411679))

(assert (=> b!1529293 m!1411667))

(declare-fun m!1411681 () Bool)

(assert (=> b!1529293 m!1411681))

(assert (=> b!1529300 m!1411667))

(declare-fun m!1411683 () Bool)

(assert (=> b!1529300 m!1411683))

(declare-fun m!1411685 () Bool)

(assert (=> b!1529300 m!1411685))

(declare-fun m!1411687 () Bool)

(assert (=> b!1529300 m!1411687))

(declare-fun m!1411689 () Bool)

(assert (=> b!1529300 m!1411689))

(assert (=> b!1529291 m!1411667))

(assert (=> b!1529291 m!1411667))

(declare-fun m!1411691 () Bool)

(assert (=> b!1529291 m!1411691))

(declare-fun m!1411693 () Bool)

(assert (=> b!1529295 m!1411693))

(declare-fun m!1411695 () Bool)

(assert (=> b!1529302 m!1411695))

(assert (=> b!1529302 m!1411695))

(declare-fun m!1411697 () Bool)

(assert (=> b!1529302 m!1411697))

(declare-fun m!1411699 () Bool)

(assert (=> b!1529301 m!1411699))

(assert (=> b!1529294 m!1411685))

(assert (=> b!1529294 m!1411687))

(assert (=> b!1529294 m!1411687))

(declare-fun m!1411701 () Bool)

(assert (=> b!1529294 m!1411701))

(assert (=> b!1529294 m!1411701))

(assert (=> b!1529294 m!1411687))

(declare-fun m!1411703 () Bool)

(assert (=> b!1529294 m!1411703))

(check-sat (not b!1529293) (not b!1529296) (not b!1529299) (not b!1529302) (not b!1529301) (not b!1529294) (not b!1529295) (not b!1529298) (not b!1529300) (not b!1529291) (not start!130230))
(check-sat)
