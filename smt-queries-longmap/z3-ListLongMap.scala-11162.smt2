; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130896 () Bool)

(assert start!130896)

(declare-fun b!1533752 () Bool)

(declare-fun res!1049412 () Bool)

(declare-fun e!854773 () Bool)

(assert (=> b!1533752 (=> (not res!1049412) (not e!854773))))

(declare-datatypes ((array!101812 0))(
  ( (array!101813 (arr!49120 (Array (_ BitVec 32) (_ BitVec 64))) (size!49671 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101812)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101812 (_ BitVec 32)) Bool)

(assert (=> b!1533752 (= res!1049412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1533753 () Bool)

(declare-fun res!1049415 () Bool)

(assert (=> b!1533753 (=> (not res!1049415) (not e!854773))))

(declare-datatypes ((List!35590 0))(
  ( (Nil!35587) (Cons!35586 (h!37049 (_ BitVec 64)) (t!50276 List!35590)) )
))
(declare-fun arrayNoDuplicates!0 (array!101812 (_ BitVec 32) List!35590) Bool)

(assert (=> b!1533753 (= res!1049415 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35587))))

(declare-fun res!1049410 () Bool)

(assert (=> start!130896 (=> (not res!1049410) (not e!854773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130896 (= res!1049410 (validMask!0 mask!2512))))

(assert (=> start!130896 e!854773))

(assert (=> start!130896 true))

(declare-fun array_inv!38401 (array!101812) Bool)

(assert (=> start!130896 (array_inv!38401 a!2804)))

(declare-fun b!1533754 () Bool)

(declare-fun res!1049407 () Bool)

(assert (=> b!1533754 (=> (not res!1049407) (not e!854773))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1533754 (= res!1049407 (and (= (size!49671 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49671 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49671 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1533755 () Bool)

(declare-fun e!854776 () Bool)

(assert (=> b!1533755 (= e!854773 e!854776)))

(declare-fun res!1049406 () Bool)

(assert (=> b!1533755 (=> (not res!1049406) (not e!854776))))

(declare-datatypes ((SeekEntryResult!13178 0))(
  ( (MissingZero!13178 (index!55107 (_ BitVec 32))) (Found!13178 (index!55108 (_ BitVec 32))) (Intermediate!13178 (undefined!13990 Bool) (index!55109 (_ BitVec 32)) (x!137019 (_ BitVec 32))) (Undefined!13178) (MissingVacant!13178 (index!55110 (_ BitVec 32))) )
))
(declare-fun lt!664127 () SeekEntryResult!13178)

(declare-fun lt!664129 () SeekEntryResult!13178)

(assert (=> b!1533755 (= res!1049406 (= lt!664127 lt!664129))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1533755 (= lt!664129 (Intermediate!13178 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101812 (_ BitVec 32)) SeekEntryResult!13178)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533755 (= lt!664127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49120 a!2804) j!70) mask!2512) (select (arr!49120 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533756 () Bool)

(declare-fun e!854775 () Bool)

(declare-fun e!854772 () Bool)

(assert (=> b!1533756 (= e!854775 e!854772)))

(declare-fun res!1049417 () Bool)

(assert (=> b!1533756 (=> res!1049417 e!854772)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!664131 () (_ BitVec 32))

(assert (=> b!1533756 (= res!1049417 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!664131 #b00000000000000000000000000000000) (bvsge lt!664131 (size!49671 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533756 (= lt!664131 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1533757 () Bool)

(declare-fun e!854771 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101812 (_ BitVec 32)) SeekEntryResult!13178)

(assert (=> b!1533757 (= e!854771 (= (seekEntry!0 (select (arr!49120 a!2804) j!70) a!2804 mask!2512) (Found!13178 j!70)))))

(declare-fun b!1533758 () Bool)

(declare-fun res!1049414 () Bool)

(assert (=> b!1533758 (=> (not res!1049414) (not e!854776))))

(assert (=> b!1533758 (= res!1049414 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49120 a!2804) j!70) a!2804 mask!2512) lt!664129))))

(declare-fun b!1533759 () Bool)

(declare-fun res!1049411 () Bool)

(assert (=> b!1533759 (=> (not res!1049411) (not e!854773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533759 (= res!1049411 (validKeyInArray!0 (select (arr!49120 a!2804) i!961)))))

(declare-fun b!1533760 () Bool)

(assert (=> b!1533760 (= e!854772 true)))

(declare-fun lt!664130 () SeekEntryResult!13178)

(assert (=> b!1533760 (= lt!664130 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!664131 (select (arr!49120 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533761 () Bool)

(assert (=> b!1533761 (= e!854776 (not e!854775))))

(declare-fun res!1049418 () Bool)

(assert (=> b!1533761 (=> res!1049418 e!854775)))

(assert (=> b!1533761 (= res!1049418 (or (not (= (select (arr!49120 a!2804) j!70) (select (store (arr!49120 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1533761 e!854771))

(declare-fun res!1049413 () Bool)

(assert (=> b!1533761 (=> (not res!1049413) (not e!854771))))

(assert (=> b!1533761 (= res!1049413 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51175 0))(
  ( (Unit!51176) )
))
(declare-fun lt!664128 () Unit!51175)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51175)

(assert (=> b!1533761 (= lt!664128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1533762 () Bool)

(declare-fun res!1049409 () Bool)

(assert (=> b!1533762 (=> (not res!1049409) (not e!854773))))

(assert (=> b!1533762 (= res!1049409 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49671 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49671 a!2804))))))

(declare-fun b!1533763 () Bool)

(declare-fun res!1049408 () Bool)

(assert (=> b!1533763 (=> (not res!1049408) (not e!854773))))

(assert (=> b!1533763 (= res!1049408 (validKeyInArray!0 (select (arr!49120 a!2804) j!70)))))

(declare-fun b!1533764 () Bool)

(declare-fun res!1049416 () Bool)

(assert (=> b!1533764 (=> (not res!1049416) (not e!854776))))

(assert (=> b!1533764 (= res!1049416 (= lt!664127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49120 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49120 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101813 (store (arr!49120 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49671 a!2804)) mask!2512)))))

(assert (= (and start!130896 res!1049410) b!1533754))

(assert (= (and b!1533754 res!1049407) b!1533759))

(assert (= (and b!1533759 res!1049411) b!1533763))

(assert (= (and b!1533763 res!1049408) b!1533752))

(assert (= (and b!1533752 res!1049412) b!1533753))

(assert (= (and b!1533753 res!1049415) b!1533762))

(assert (= (and b!1533762 res!1049409) b!1533755))

(assert (= (and b!1533755 res!1049406) b!1533758))

(assert (= (and b!1533758 res!1049414) b!1533764))

(assert (= (and b!1533764 res!1049416) b!1533761))

(assert (= (and b!1533761 res!1049413) b!1533757))

(assert (= (and b!1533761 (not res!1049418)) b!1533756))

(assert (= (and b!1533756 (not res!1049417)) b!1533760))

(declare-fun m!1416277 () Bool)

(assert (=> b!1533761 m!1416277))

(declare-fun m!1416279 () Bool)

(assert (=> b!1533761 m!1416279))

(declare-fun m!1416281 () Bool)

(assert (=> b!1533761 m!1416281))

(declare-fun m!1416283 () Bool)

(assert (=> b!1533761 m!1416283))

(declare-fun m!1416285 () Bool)

(assert (=> b!1533761 m!1416285))

(assert (=> b!1533757 m!1416277))

(assert (=> b!1533757 m!1416277))

(declare-fun m!1416287 () Bool)

(assert (=> b!1533757 m!1416287))

(declare-fun m!1416289 () Bool)

(assert (=> start!130896 m!1416289))

(declare-fun m!1416291 () Bool)

(assert (=> start!130896 m!1416291))

(declare-fun m!1416293 () Bool)

(assert (=> b!1533756 m!1416293))

(declare-fun m!1416295 () Bool)

(assert (=> b!1533752 m!1416295))

(assert (=> b!1533755 m!1416277))

(assert (=> b!1533755 m!1416277))

(declare-fun m!1416297 () Bool)

(assert (=> b!1533755 m!1416297))

(assert (=> b!1533755 m!1416297))

(assert (=> b!1533755 m!1416277))

(declare-fun m!1416299 () Bool)

(assert (=> b!1533755 m!1416299))

(declare-fun m!1416301 () Bool)

(assert (=> b!1533759 m!1416301))

(assert (=> b!1533759 m!1416301))

(declare-fun m!1416303 () Bool)

(assert (=> b!1533759 m!1416303))

(assert (=> b!1533758 m!1416277))

(assert (=> b!1533758 m!1416277))

(declare-fun m!1416305 () Bool)

(assert (=> b!1533758 m!1416305))

(assert (=> b!1533763 m!1416277))

(assert (=> b!1533763 m!1416277))

(declare-fun m!1416307 () Bool)

(assert (=> b!1533763 m!1416307))

(assert (=> b!1533760 m!1416277))

(assert (=> b!1533760 m!1416277))

(declare-fun m!1416309 () Bool)

(assert (=> b!1533760 m!1416309))

(assert (=> b!1533764 m!1416281))

(assert (=> b!1533764 m!1416283))

(assert (=> b!1533764 m!1416283))

(declare-fun m!1416311 () Bool)

(assert (=> b!1533764 m!1416311))

(assert (=> b!1533764 m!1416311))

(assert (=> b!1533764 m!1416283))

(declare-fun m!1416313 () Bool)

(assert (=> b!1533764 m!1416313))

(declare-fun m!1416315 () Bool)

(assert (=> b!1533753 m!1416315))

(check-sat (not start!130896) (not b!1533757) (not b!1533758) (not b!1533760) (not b!1533763) (not b!1533764) (not b!1533755) (not b!1533761) (not b!1533753) (not b!1533756) (not b!1533752) (not b!1533759))
(check-sat)
