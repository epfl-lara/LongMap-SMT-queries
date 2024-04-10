; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130522 () Bool)

(assert start!130522)

(declare-fun b!1531621 () Bool)

(declare-fun res!1048769 () Bool)

(declare-fun e!853425 () Bool)

(assert (=> b!1531621 (=> (not res!1048769) (not e!853425))))

(declare-datatypes ((array!101701 0))(
  ( (array!101702 (arr!49071 (Array (_ BitVec 32) (_ BitVec 64))) (size!49621 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101701)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531621 (= res!1048769 (validKeyInArray!0 (select (arr!49071 a!2804) i!961)))))

(declare-fun b!1531622 () Bool)

(declare-fun e!853429 () Bool)

(declare-fun e!853424 () Bool)

(assert (=> b!1531622 (= e!853429 e!853424)))

(declare-fun res!1048770 () Bool)

(assert (=> b!1531622 (=> res!1048770 e!853424)))

(declare-fun lt!663309 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531622 (= res!1048770 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663309 #b00000000000000000000000000000000) (bvsge lt!663309 (size!49621 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531622 (= lt!663309 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531623 () Bool)

(declare-fun res!1048766 () Bool)

(assert (=> b!1531623 (=> res!1048766 e!853424)))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13236 0))(
  ( (MissingZero!13236 (index!55339 (_ BitVec 32))) (Found!13236 (index!55340 (_ BitVec 32))) (Intermediate!13236 (undefined!14048 Bool) (index!55341 (_ BitVec 32)) (x!137038 (_ BitVec 32))) (Undefined!13236) (MissingVacant!13236 (index!55342 (_ BitVec 32))) )
))
(declare-fun lt!663308 () SeekEntryResult!13236)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101701 (_ BitVec 32)) SeekEntryResult!13236)

(assert (=> b!1531623 (= res!1048766 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663309 (select (arr!49071 a!2804) j!70) a!2804 mask!2512) lt!663308)))))

(declare-fun b!1531624 () Bool)

(declare-fun res!1048762 () Bool)

(assert (=> b!1531624 (=> (not res!1048762) (not e!853425))))

(declare-datatypes ((List!35554 0))(
  ( (Nil!35551) (Cons!35550 (h!36995 (_ BitVec 64)) (t!50248 List!35554)) )
))
(declare-fun arrayNoDuplicates!0 (array!101701 (_ BitVec 32) List!35554) Bool)

(assert (=> b!1531624 (= res!1048762 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35551))))

(declare-fun b!1531625 () Bool)

(declare-fun e!853428 () Bool)

(assert (=> b!1531625 (= e!853428 (not e!853429))))

(declare-fun res!1048765 () Bool)

(assert (=> b!1531625 (=> res!1048765 e!853429)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531625 (= res!1048765 (or (not (= (select (arr!49071 a!2804) j!70) (select (store (arr!49071 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853426 () Bool)

(assert (=> b!1531625 e!853426))

(declare-fun res!1048773 () Bool)

(assert (=> b!1531625 (=> (not res!1048773) (not e!853426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101701 (_ BitVec 32)) Bool)

(assert (=> b!1531625 (= res!1048773 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51256 0))(
  ( (Unit!51257) )
))
(declare-fun lt!663310 () Unit!51256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51256)

(assert (=> b!1531625 (= lt!663310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531627 () Bool)

(declare-fun res!1048767 () Bool)

(assert (=> b!1531627 (=> (not res!1048767) (not e!853425))))

(assert (=> b!1531627 (= res!1048767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531628 () Bool)

(assert (=> b!1531628 (= e!853424 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!534)) (bvsub #b01111111111111111111111111111110 x!534)))))

(declare-fun b!1531629 () Bool)

(declare-fun res!1048772 () Bool)

(assert (=> b!1531629 (=> (not res!1048772) (not e!853425))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531629 (= res!1048772 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49621 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49621 a!2804))))))

(declare-fun b!1531630 () Bool)

(declare-fun res!1048761 () Bool)

(assert (=> b!1531630 (=> (not res!1048761) (not e!853425))))

(assert (=> b!1531630 (= res!1048761 (and (= (size!49621 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49621 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49621 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531631 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101701 (_ BitVec 32)) SeekEntryResult!13236)

(assert (=> b!1531631 (= e!853426 (= (seekEntry!0 (select (arr!49071 a!2804) j!70) a!2804 mask!2512) (Found!13236 j!70)))))

(declare-fun b!1531632 () Bool)

(declare-fun res!1048763 () Bool)

(assert (=> b!1531632 (=> (not res!1048763) (not e!853428))))

(assert (=> b!1531632 (= res!1048763 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49071 a!2804) j!70) a!2804 mask!2512) lt!663308))))

(declare-fun b!1531633 () Bool)

(assert (=> b!1531633 (= e!853425 e!853428)))

(declare-fun res!1048764 () Bool)

(assert (=> b!1531633 (=> (not res!1048764) (not e!853428))))

(declare-fun lt!663307 () SeekEntryResult!13236)

(assert (=> b!1531633 (= res!1048764 (= lt!663307 lt!663308))))

(assert (=> b!1531633 (= lt!663308 (Intermediate!13236 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531633 (= lt!663307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49071 a!2804) j!70) mask!2512) (select (arr!49071 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531634 () Bool)

(declare-fun res!1048774 () Bool)

(assert (=> b!1531634 (=> (not res!1048774) (not e!853428))))

(assert (=> b!1531634 (= res!1048774 (= lt!663307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49071 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49071 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101702 (store (arr!49071 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49621 a!2804)) mask!2512)))))

(declare-fun res!1048768 () Bool)

(assert (=> start!130522 (=> (not res!1048768) (not e!853425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130522 (= res!1048768 (validMask!0 mask!2512))))

(assert (=> start!130522 e!853425))

(assert (=> start!130522 true))

(declare-fun array_inv!38099 (array!101701) Bool)

(assert (=> start!130522 (array_inv!38099 a!2804)))

(declare-fun b!1531626 () Bool)

(declare-fun res!1048771 () Bool)

(assert (=> b!1531626 (=> (not res!1048771) (not e!853425))))

(assert (=> b!1531626 (= res!1048771 (validKeyInArray!0 (select (arr!49071 a!2804) j!70)))))

(assert (= (and start!130522 res!1048768) b!1531630))

(assert (= (and b!1531630 res!1048761) b!1531621))

(assert (= (and b!1531621 res!1048769) b!1531626))

(assert (= (and b!1531626 res!1048771) b!1531627))

(assert (= (and b!1531627 res!1048767) b!1531624))

(assert (= (and b!1531624 res!1048762) b!1531629))

(assert (= (and b!1531629 res!1048772) b!1531633))

(assert (= (and b!1531633 res!1048764) b!1531632))

(assert (= (and b!1531632 res!1048763) b!1531634))

(assert (= (and b!1531634 res!1048774) b!1531625))

(assert (= (and b!1531625 res!1048773) b!1531631))

(assert (= (and b!1531625 (not res!1048765)) b!1531622))

(assert (= (and b!1531622 (not res!1048770)) b!1531623))

(assert (= (and b!1531623 (not res!1048766)) b!1531628))

(declare-fun m!1414279 () Bool)

(assert (=> b!1531633 m!1414279))

(assert (=> b!1531633 m!1414279))

(declare-fun m!1414281 () Bool)

(assert (=> b!1531633 m!1414281))

(assert (=> b!1531633 m!1414281))

(assert (=> b!1531633 m!1414279))

(declare-fun m!1414283 () Bool)

(assert (=> b!1531633 m!1414283))

(declare-fun m!1414285 () Bool)

(assert (=> b!1531624 m!1414285))

(assert (=> b!1531623 m!1414279))

(assert (=> b!1531623 m!1414279))

(declare-fun m!1414287 () Bool)

(assert (=> b!1531623 m!1414287))

(declare-fun m!1414289 () Bool)

(assert (=> b!1531634 m!1414289))

(declare-fun m!1414291 () Bool)

(assert (=> b!1531634 m!1414291))

(assert (=> b!1531634 m!1414291))

(declare-fun m!1414293 () Bool)

(assert (=> b!1531634 m!1414293))

(assert (=> b!1531634 m!1414293))

(assert (=> b!1531634 m!1414291))

(declare-fun m!1414295 () Bool)

(assert (=> b!1531634 m!1414295))

(declare-fun m!1414297 () Bool)

(assert (=> start!130522 m!1414297))

(declare-fun m!1414299 () Bool)

(assert (=> start!130522 m!1414299))

(declare-fun m!1414301 () Bool)

(assert (=> b!1531621 m!1414301))

(assert (=> b!1531621 m!1414301))

(declare-fun m!1414303 () Bool)

(assert (=> b!1531621 m!1414303))

(assert (=> b!1531632 m!1414279))

(assert (=> b!1531632 m!1414279))

(declare-fun m!1414305 () Bool)

(assert (=> b!1531632 m!1414305))

(assert (=> b!1531625 m!1414279))

(declare-fun m!1414307 () Bool)

(assert (=> b!1531625 m!1414307))

(assert (=> b!1531625 m!1414289))

(assert (=> b!1531625 m!1414291))

(declare-fun m!1414309 () Bool)

(assert (=> b!1531625 m!1414309))

(assert (=> b!1531631 m!1414279))

(assert (=> b!1531631 m!1414279))

(declare-fun m!1414311 () Bool)

(assert (=> b!1531631 m!1414311))

(declare-fun m!1414313 () Bool)

(assert (=> b!1531622 m!1414313))

(assert (=> b!1531626 m!1414279))

(assert (=> b!1531626 m!1414279))

(declare-fun m!1414315 () Bool)

(assert (=> b!1531626 m!1414315))

(declare-fun m!1414317 () Bool)

(assert (=> b!1531627 m!1414317))

(check-sat (not b!1531624) (not b!1531631) (not b!1531625) (not b!1531622) (not b!1531621) (not b!1531626) (not b!1531623) (not b!1531632) (not b!1531627) (not start!130522) (not b!1531634) (not b!1531633))
(check-sat)
