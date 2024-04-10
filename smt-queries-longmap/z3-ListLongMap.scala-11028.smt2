; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129002 () Bool)

(assert start!129002)

(declare-fun b!1512704 () Bool)

(declare-fun res!1032614 () Bool)

(declare-fun e!844311 () Bool)

(assert (=> b!1512704 (=> (not res!1032614) (not e!844311))))

(declare-datatypes ((SeekEntryResult!12837 0))(
  ( (MissingZero!12837 (index!53743 (_ BitVec 32))) (Found!12837 (index!53744 (_ BitVec 32))) (Intermediate!12837 (undefined!13649 Bool) (index!53745 (_ BitVec 32)) (x!135467 (_ BitVec 32))) (Undefined!12837) (MissingVacant!12837 (index!53746 (_ BitVec 32))) )
))
(declare-fun lt!655737 () SeekEntryResult!12837)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100858 0))(
  ( (array!100859 (arr!48666 (Array (_ BitVec 32) (_ BitVec 64))) (size!49216 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100858)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12837)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512704 (= res!1032614 (= lt!655737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48666 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48666 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100859 (store (arr!48666 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49216 a!2804)) mask!2512)))))

(declare-fun b!1512705 () Bool)

(assert (=> b!1512705 (= e!844311 (not true))))

(declare-fun e!844314 () Bool)

(assert (=> b!1512705 e!844314))

(declare-fun res!1032616 () Bool)

(assert (=> b!1512705 (=> (not res!1032616) (not e!844314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100858 (_ BitVec 32)) Bool)

(assert (=> b!1512705 (= res!1032616 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50542 0))(
  ( (Unit!50543) )
))
(declare-fun lt!655736 () Unit!50542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50542)

(assert (=> b!1512705 (= lt!655736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512706 () Bool)

(declare-fun res!1032619 () Bool)

(declare-fun e!844312 () Bool)

(assert (=> b!1512706 (=> (not res!1032619) (not e!844312))))

(assert (=> b!1512706 (= res!1032619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512707 () Bool)

(assert (=> b!1512707 (= e!844312 e!844311)))

(declare-fun res!1032612 () Bool)

(assert (=> b!1512707 (=> (not res!1032612) (not e!844311))))

(declare-fun lt!655738 () SeekEntryResult!12837)

(assert (=> b!1512707 (= res!1032612 (= lt!655737 lt!655738))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512707 (= lt!655738 (Intermediate!12837 false resIndex!21 resX!21))))

(assert (=> b!1512707 (= lt!655737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48666 a!2804) j!70) mask!2512) (select (arr!48666 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512708 () Bool)

(declare-fun res!1032607 () Bool)

(assert (=> b!1512708 (=> (not res!1032607) (not e!844314))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12837)

(assert (=> b!1512708 (= res!1032607 (= (seekEntry!0 (select (arr!48666 a!2804) j!70) a!2804 mask!2512) (Found!12837 j!70)))))

(declare-fun b!1512709 () Bool)

(declare-fun res!1032610 () Bool)

(assert (=> b!1512709 (=> (not res!1032610) (not e!844312))))

(assert (=> b!1512709 (= res!1032610 (and (= (size!49216 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49216 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49216 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512710 () Bool)

(declare-fun res!1032611 () Bool)

(assert (=> b!1512710 (=> (not res!1032611) (not e!844312))))

(declare-datatypes ((List!35149 0))(
  ( (Nil!35146) (Cons!35145 (h!36557 (_ BitVec 64)) (t!49843 List!35149)) )
))
(declare-fun arrayNoDuplicates!0 (array!100858 (_ BitVec 32) List!35149) Bool)

(assert (=> b!1512710 (= res!1032611 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35146))))

(declare-fun b!1512711 () Bool)

(declare-fun e!844313 () Bool)

(assert (=> b!1512711 (= e!844314 e!844313)))

(declare-fun res!1032609 () Bool)

(assert (=> b!1512711 (=> res!1032609 e!844313)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1512711 (= res!1032609 (or (not (= (select (arr!48666 a!2804) j!70) (select (store (arr!48666 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48666 a!2804) index!487) (select (arr!48666 a!2804) j!70)) (not (= (select (arr!48666 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1032615 () Bool)

(assert (=> start!129002 (=> (not res!1032615) (not e!844312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129002 (= res!1032615 (validMask!0 mask!2512))))

(assert (=> start!129002 e!844312))

(assert (=> start!129002 true))

(declare-fun array_inv!37694 (array!100858) Bool)

(assert (=> start!129002 (array_inv!37694 a!2804)))

(declare-fun b!1512712 () Bool)

(declare-fun res!1032618 () Bool)

(assert (=> b!1512712 (=> (not res!1032618) (not e!844312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512712 (= res!1032618 (validKeyInArray!0 (select (arr!48666 a!2804) j!70)))))

(declare-fun b!1512713 () Bool)

(declare-fun res!1032613 () Bool)

(assert (=> b!1512713 (=> (not res!1032613) (not e!844312))))

(assert (=> b!1512713 (= res!1032613 (validKeyInArray!0 (select (arr!48666 a!2804) i!961)))))

(declare-fun b!1512714 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12837)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12837)

(assert (=> b!1512714 (= e!844313 (= (seekEntryOrOpen!0 (select (arr!48666 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48666 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512715 () Bool)

(declare-fun res!1032608 () Bool)

(assert (=> b!1512715 (=> (not res!1032608) (not e!844311))))

(assert (=> b!1512715 (= res!1032608 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48666 a!2804) j!70) a!2804 mask!2512) lt!655738))))

(declare-fun b!1512716 () Bool)

(declare-fun res!1032617 () Bool)

(assert (=> b!1512716 (=> (not res!1032617) (not e!844312))))

(assert (=> b!1512716 (= res!1032617 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49216 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49216 a!2804))))))

(assert (= (and start!129002 res!1032615) b!1512709))

(assert (= (and b!1512709 res!1032610) b!1512713))

(assert (= (and b!1512713 res!1032613) b!1512712))

(assert (= (and b!1512712 res!1032618) b!1512706))

(assert (= (and b!1512706 res!1032619) b!1512710))

(assert (= (and b!1512710 res!1032611) b!1512716))

(assert (= (and b!1512716 res!1032617) b!1512707))

(assert (= (and b!1512707 res!1032612) b!1512715))

(assert (= (and b!1512715 res!1032608) b!1512704))

(assert (= (and b!1512704 res!1032614) b!1512705))

(assert (= (and b!1512705 res!1032616) b!1512708))

(assert (= (and b!1512708 res!1032607) b!1512711))

(assert (= (and b!1512711 (not res!1032609)) b!1512714))

(declare-fun m!1395493 () Bool)

(assert (=> b!1512712 m!1395493))

(assert (=> b!1512712 m!1395493))

(declare-fun m!1395495 () Bool)

(assert (=> b!1512712 m!1395495))

(assert (=> b!1512707 m!1395493))

(assert (=> b!1512707 m!1395493))

(declare-fun m!1395497 () Bool)

(assert (=> b!1512707 m!1395497))

(assert (=> b!1512707 m!1395497))

(assert (=> b!1512707 m!1395493))

(declare-fun m!1395499 () Bool)

(assert (=> b!1512707 m!1395499))

(assert (=> b!1512714 m!1395493))

(assert (=> b!1512714 m!1395493))

(declare-fun m!1395501 () Bool)

(assert (=> b!1512714 m!1395501))

(assert (=> b!1512714 m!1395493))

(declare-fun m!1395503 () Bool)

(assert (=> b!1512714 m!1395503))

(declare-fun m!1395505 () Bool)

(assert (=> b!1512713 m!1395505))

(assert (=> b!1512713 m!1395505))

(declare-fun m!1395507 () Bool)

(assert (=> b!1512713 m!1395507))

(declare-fun m!1395509 () Bool)

(assert (=> start!129002 m!1395509))

(declare-fun m!1395511 () Bool)

(assert (=> start!129002 m!1395511))

(declare-fun m!1395513 () Bool)

(assert (=> b!1512704 m!1395513))

(declare-fun m!1395515 () Bool)

(assert (=> b!1512704 m!1395515))

(assert (=> b!1512704 m!1395515))

(declare-fun m!1395517 () Bool)

(assert (=> b!1512704 m!1395517))

(assert (=> b!1512704 m!1395517))

(assert (=> b!1512704 m!1395515))

(declare-fun m!1395519 () Bool)

(assert (=> b!1512704 m!1395519))

(declare-fun m!1395521 () Bool)

(assert (=> b!1512706 m!1395521))

(assert (=> b!1512711 m!1395493))

(assert (=> b!1512711 m!1395513))

(assert (=> b!1512711 m!1395515))

(declare-fun m!1395523 () Bool)

(assert (=> b!1512711 m!1395523))

(assert (=> b!1512708 m!1395493))

(assert (=> b!1512708 m!1395493))

(declare-fun m!1395525 () Bool)

(assert (=> b!1512708 m!1395525))

(declare-fun m!1395527 () Bool)

(assert (=> b!1512710 m!1395527))

(assert (=> b!1512715 m!1395493))

(assert (=> b!1512715 m!1395493))

(declare-fun m!1395529 () Bool)

(assert (=> b!1512715 m!1395529))

(declare-fun m!1395531 () Bool)

(assert (=> b!1512705 m!1395531))

(declare-fun m!1395533 () Bool)

(assert (=> b!1512705 m!1395533))

(check-sat (not b!1512714) (not b!1512715) (not b!1512706) (not b!1512710) (not start!129002) (not b!1512712) (not b!1512707) (not b!1512704) (not b!1512708) (not b!1512705) (not b!1512713))
(check-sat)
