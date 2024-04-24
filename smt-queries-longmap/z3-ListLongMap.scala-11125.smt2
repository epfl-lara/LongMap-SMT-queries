; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130428 () Bool)

(assert start!130428)

(declare-fun b!1528144 () Bool)

(declare-fun e!851962 () Bool)

(assert (=> b!1528144 (= e!851962 (not true))))

(declare-fun e!851961 () Bool)

(assert (=> b!1528144 e!851961))

(declare-fun res!1044697 () Bool)

(assert (=> b!1528144 (=> (not res!1044697) (not e!851961))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101578 0))(
  ( (array!101579 (arr!49009 (Array (_ BitVec 32) (_ BitVec 64))) (size!49560 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101578)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101578 (_ BitVec 32)) Bool)

(assert (=> b!1528144 (= res!1044697 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50953 0))(
  ( (Unit!50954) )
))
(declare-fun lt!661739 () Unit!50953)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50953)

(assert (=> b!1528144 (= lt!661739 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528145 () Bool)

(declare-fun res!1044702 () Bool)

(declare-fun e!851956 () Bool)

(assert (=> b!1528145 (=> (not res!1044702) (not e!851956))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528145 (= res!1044702 (validKeyInArray!0 (select (arr!49009 a!2804) i!961)))))

(declare-fun b!1528146 () Bool)

(declare-fun res!1044703 () Bool)

(assert (=> b!1528146 (=> (not res!1044703) (not e!851956))))

(declare-datatypes ((List!35479 0))(
  ( (Nil!35476) (Cons!35475 (h!36926 (_ BitVec 64)) (t!50165 List!35479)) )
))
(declare-fun arrayNoDuplicates!0 (array!101578 (_ BitVec 32) List!35479) Bool)

(assert (=> b!1528146 (= res!1044703 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35476))))

(declare-fun b!1528147 () Bool)

(declare-fun res!1044705 () Bool)

(assert (=> b!1528147 (=> (not res!1044705) (not e!851961))))

(declare-datatypes ((SeekEntryResult!13067 0))(
  ( (MissingZero!13067 (index!54663 (_ BitVec 32))) (Found!13067 (index!54664 (_ BitVec 32))) (Intermediate!13067 (undefined!13879 Bool) (index!54665 (_ BitVec 32)) (x!136576 (_ BitVec 32))) (Undefined!13067) (MissingVacant!13067 (index!54666 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13067)

(assert (=> b!1528147 (= res!1044705 (= (seekEntry!0 (select (arr!49009 a!2804) j!70) a!2804 mask!2512) (Found!13067 j!70)))))

(declare-fun lt!661741 () (_ BitVec 64))

(declare-fun b!1528148 () Bool)

(declare-fun e!851957 () Bool)

(declare-fun lt!661740 () array!101578)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13067)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13067)

(assert (=> b!1528148 (= e!851957 (= (seekEntryOrOpen!0 lt!661741 lt!661740 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661741 lt!661740 mask!2512)))))

(declare-fun res!1044696 () Bool)

(assert (=> start!130428 (=> (not res!1044696) (not e!851956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130428 (= res!1044696 (validMask!0 mask!2512))))

(assert (=> start!130428 e!851956))

(assert (=> start!130428 true))

(declare-fun array_inv!38290 (array!101578) Bool)

(assert (=> start!130428 (array_inv!38290 a!2804)))

(declare-fun b!1528149 () Bool)

(declare-fun e!851960 () Bool)

(assert (=> b!1528149 (= e!851960 e!851962)))

(declare-fun res!1044704 () Bool)

(assert (=> b!1528149 (=> (not res!1044704) (not e!851962))))

(declare-fun lt!661742 () SeekEntryResult!13067)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13067)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528149 (= res!1044704 (= lt!661742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661741 mask!2512) lt!661741 lt!661740 mask!2512)))))

(assert (=> b!1528149 (= lt!661741 (select (store (arr!49009 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528149 (= lt!661740 (array!101579 (store (arr!49009 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49560 a!2804)))))

(declare-fun b!1528150 () Bool)

(declare-fun res!1044699 () Bool)

(assert (=> b!1528150 (=> (not res!1044699) (not e!851960))))

(declare-fun lt!661743 () SeekEntryResult!13067)

(assert (=> b!1528150 (= res!1044699 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49009 a!2804) j!70) a!2804 mask!2512) lt!661743))))

(declare-fun b!1528151 () Bool)

(declare-fun res!1044700 () Bool)

(assert (=> b!1528151 (=> (not res!1044700) (not e!851956))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528151 (= res!1044700 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49560 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49560 a!2804))))))

(declare-fun b!1528152 () Bool)

(declare-fun res!1044701 () Bool)

(assert (=> b!1528152 (=> (not res!1044701) (not e!851956))))

(assert (=> b!1528152 (= res!1044701 (and (= (size!49560 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49560 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49560 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528153 () Bool)

(declare-fun e!851958 () Bool)

(assert (=> b!1528153 (= e!851961 e!851958)))

(declare-fun res!1044693 () Bool)

(assert (=> b!1528153 (=> res!1044693 e!851958)))

(assert (=> b!1528153 (= res!1044693 (or (not (= (select (arr!49009 a!2804) j!70) lt!661741)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49009 a!2804) index!487) (select (arr!49009 a!2804) j!70)) (not (= (select (arr!49009 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1528154 () Bool)

(assert (=> b!1528154 (= e!851956 e!851960)))

(declare-fun res!1044698 () Bool)

(assert (=> b!1528154 (=> (not res!1044698) (not e!851960))))

(assert (=> b!1528154 (= res!1044698 (= lt!661742 lt!661743))))

(assert (=> b!1528154 (= lt!661743 (Intermediate!13067 false resIndex!21 resX!21))))

(assert (=> b!1528154 (= lt!661742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49009 a!2804) j!70) mask!2512) (select (arr!49009 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528155 () Bool)

(declare-fun res!1044695 () Bool)

(assert (=> b!1528155 (=> (not res!1044695) (not e!851956))))

(assert (=> b!1528155 (= res!1044695 (validKeyInArray!0 (select (arr!49009 a!2804) j!70)))))

(declare-fun b!1528156 () Bool)

(declare-fun res!1044694 () Bool)

(assert (=> b!1528156 (=> (not res!1044694) (not e!851956))))

(assert (=> b!1528156 (= res!1044694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528157 () Bool)

(assert (=> b!1528157 (= e!851958 e!851957)))

(declare-fun res!1044692 () Bool)

(assert (=> b!1528157 (=> (not res!1044692) (not e!851957))))

(assert (=> b!1528157 (= res!1044692 (= (seekEntryOrOpen!0 (select (arr!49009 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49009 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130428 res!1044696) b!1528152))

(assert (= (and b!1528152 res!1044701) b!1528145))

(assert (= (and b!1528145 res!1044702) b!1528155))

(assert (= (and b!1528155 res!1044695) b!1528156))

(assert (= (and b!1528156 res!1044694) b!1528146))

(assert (= (and b!1528146 res!1044703) b!1528151))

(assert (= (and b!1528151 res!1044700) b!1528154))

(assert (= (and b!1528154 res!1044698) b!1528150))

(assert (= (and b!1528150 res!1044699) b!1528149))

(assert (= (and b!1528149 res!1044704) b!1528144))

(assert (= (and b!1528144 res!1044697) b!1528147))

(assert (= (and b!1528147 res!1044705) b!1528153))

(assert (= (and b!1528153 (not res!1044693)) b!1528157))

(assert (= (and b!1528157 res!1044692) b!1528148))

(declare-fun m!1410739 () Bool)

(assert (=> b!1528153 m!1410739))

(declare-fun m!1410741 () Bool)

(assert (=> b!1528153 m!1410741))

(declare-fun m!1410743 () Bool)

(assert (=> b!1528146 m!1410743))

(assert (=> b!1528150 m!1410739))

(assert (=> b!1528150 m!1410739))

(declare-fun m!1410745 () Bool)

(assert (=> b!1528150 m!1410745))

(declare-fun m!1410747 () Bool)

(assert (=> b!1528149 m!1410747))

(assert (=> b!1528149 m!1410747))

(declare-fun m!1410749 () Bool)

(assert (=> b!1528149 m!1410749))

(declare-fun m!1410751 () Bool)

(assert (=> b!1528149 m!1410751))

(declare-fun m!1410753 () Bool)

(assert (=> b!1528149 m!1410753))

(declare-fun m!1410755 () Bool)

(assert (=> b!1528144 m!1410755))

(declare-fun m!1410757 () Bool)

(assert (=> b!1528144 m!1410757))

(assert (=> b!1528154 m!1410739))

(assert (=> b!1528154 m!1410739))

(declare-fun m!1410759 () Bool)

(assert (=> b!1528154 m!1410759))

(assert (=> b!1528154 m!1410759))

(assert (=> b!1528154 m!1410739))

(declare-fun m!1410761 () Bool)

(assert (=> b!1528154 m!1410761))

(declare-fun m!1410763 () Bool)

(assert (=> b!1528148 m!1410763))

(declare-fun m!1410765 () Bool)

(assert (=> b!1528148 m!1410765))

(declare-fun m!1410767 () Bool)

(assert (=> start!130428 m!1410767))

(declare-fun m!1410769 () Bool)

(assert (=> start!130428 m!1410769))

(declare-fun m!1410771 () Bool)

(assert (=> b!1528156 m!1410771))

(assert (=> b!1528157 m!1410739))

(assert (=> b!1528157 m!1410739))

(declare-fun m!1410773 () Bool)

(assert (=> b!1528157 m!1410773))

(assert (=> b!1528157 m!1410739))

(declare-fun m!1410775 () Bool)

(assert (=> b!1528157 m!1410775))

(declare-fun m!1410777 () Bool)

(assert (=> b!1528145 m!1410777))

(assert (=> b!1528145 m!1410777))

(declare-fun m!1410779 () Bool)

(assert (=> b!1528145 m!1410779))

(assert (=> b!1528147 m!1410739))

(assert (=> b!1528147 m!1410739))

(declare-fun m!1410781 () Bool)

(assert (=> b!1528147 m!1410781))

(assert (=> b!1528155 m!1410739))

(assert (=> b!1528155 m!1410739))

(declare-fun m!1410783 () Bool)

(assert (=> b!1528155 m!1410783))

(check-sat (not b!1528146) (not b!1528149) (not b!1528145) (not b!1528148) (not b!1528154) (not b!1528155) (not b!1528147) (not b!1528156) (not b!1528144) (not b!1528150) (not b!1528157) (not start!130428))
(check-sat)
