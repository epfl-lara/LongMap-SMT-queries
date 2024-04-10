; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129206 () Bool)

(assert start!129206)

(declare-fun b!1516772 () Bool)

(declare-fun res!1036676 () Bool)

(declare-fun e!846307 () Bool)

(assert (=> b!1516772 (=> (not res!1036676) (not e!846307))))

(declare-datatypes ((array!101062 0))(
  ( (array!101063 (arr!48768 (Array (_ BitVec 32) (_ BitVec 64))) (size!49318 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101062)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101062 (_ BitVec 32)) Bool)

(assert (=> b!1516772 (= res!1036676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516773 () Bool)

(declare-fun res!1036683 () Bool)

(assert (=> b!1516773 (=> (not res!1036683) (not e!846307))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516773 (= res!1036683 (validKeyInArray!0 (select (arr!48768 a!2804) j!70)))))

(declare-fun res!1036681 () Bool)

(assert (=> start!129206 (=> (not res!1036681) (not e!846307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129206 (= res!1036681 (validMask!0 mask!2512))))

(assert (=> start!129206 e!846307))

(assert (=> start!129206 true))

(declare-fun array_inv!37796 (array!101062) Bool)

(assert (=> start!129206 (array_inv!37796 a!2804)))

(declare-fun b!1516774 () Bool)

(declare-fun res!1036680 () Bool)

(assert (=> b!1516774 (=> (not res!1036680) (not e!846307))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516774 (= res!1036680 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49318 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49318 a!2804))))))

(declare-fun b!1516775 () Bool)

(declare-fun e!846308 () Bool)

(assert (=> b!1516775 (= e!846308 true)))

(declare-fun lt!657528 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12939 0))(
  ( (MissingZero!12939 (index!54151 (_ BitVec 32))) (Found!12939 (index!54152 (_ BitVec 32))) (Intermediate!12939 (undefined!13751 Bool) (index!54153 (_ BitVec 32)) (x!135841 (_ BitVec 32))) (Undefined!12939) (MissingVacant!12939 (index!54154 (_ BitVec 32))) )
))
(declare-fun lt!657531 () SeekEntryResult!12939)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101062 (_ BitVec 32)) SeekEntryResult!12939)

(assert (=> b!1516775 (= lt!657531 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657528 (select (arr!48768 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516776 () Bool)

(declare-fun e!846305 () Bool)

(declare-fun e!846310 () Bool)

(assert (=> b!1516776 (= e!846305 (not e!846310))))

(declare-fun res!1036678 () Bool)

(assert (=> b!1516776 (=> res!1036678 e!846310)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516776 (= res!1036678 (or (not (= (select (arr!48768 a!2804) j!70) (select (store (arr!48768 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846306 () Bool)

(assert (=> b!1516776 e!846306))

(declare-fun res!1036686 () Bool)

(assert (=> b!1516776 (=> (not res!1036686) (not e!846306))))

(assert (=> b!1516776 (= res!1036686 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50746 0))(
  ( (Unit!50747) )
))
(declare-fun lt!657529 () Unit!50746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50746)

(assert (=> b!1516776 (= lt!657529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516777 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101062 (_ BitVec 32)) SeekEntryResult!12939)

(assert (=> b!1516777 (= e!846306 (= (seekEntry!0 (select (arr!48768 a!2804) j!70) a!2804 mask!2512) (Found!12939 j!70)))))

(declare-fun b!1516778 () Bool)

(declare-fun res!1036684 () Bool)

(assert (=> b!1516778 (=> (not res!1036684) (not e!846305))))

(declare-fun lt!657532 () SeekEntryResult!12939)

(assert (=> b!1516778 (= res!1036684 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48768 a!2804) j!70) a!2804 mask!2512) lt!657532))))

(declare-fun b!1516779 () Bool)

(declare-fun res!1036679 () Bool)

(assert (=> b!1516779 (=> (not res!1036679) (not e!846307))))

(assert (=> b!1516779 (= res!1036679 (validKeyInArray!0 (select (arr!48768 a!2804) i!961)))))

(declare-fun b!1516780 () Bool)

(assert (=> b!1516780 (= e!846307 e!846305)))

(declare-fun res!1036682 () Bool)

(assert (=> b!1516780 (=> (not res!1036682) (not e!846305))))

(declare-fun lt!657530 () SeekEntryResult!12939)

(assert (=> b!1516780 (= res!1036682 (= lt!657530 lt!657532))))

(assert (=> b!1516780 (= lt!657532 (Intermediate!12939 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516780 (= lt!657530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48768 a!2804) j!70) mask!2512) (select (arr!48768 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516781 () Bool)

(assert (=> b!1516781 (= e!846310 e!846308)))

(declare-fun res!1036675 () Bool)

(assert (=> b!1516781 (=> res!1036675 e!846308)))

(assert (=> b!1516781 (= res!1036675 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657528 #b00000000000000000000000000000000) (bvsge lt!657528 (size!49318 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516781 (= lt!657528 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516782 () Bool)

(declare-fun res!1036685 () Bool)

(assert (=> b!1516782 (=> (not res!1036685) (not e!846305))))

(assert (=> b!1516782 (= res!1036685 (= lt!657530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48768 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48768 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101063 (store (arr!48768 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49318 a!2804)) mask!2512)))))

(declare-fun b!1516783 () Bool)

(declare-fun res!1036677 () Bool)

(assert (=> b!1516783 (=> (not res!1036677) (not e!846307))))

(declare-datatypes ((List!35251 0))(
  ( (Nil!35248) (Cons!35247 (h!36659 (_ BitVec 64)) (t!49945 List!35251)) )
))
(declare-fun arrayNoDuplicates!0 (array!101062 (_ BitVec 32) List!35251) Bool)

(assert (=> b!1516783 (= res!1036677 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35248))))

(declare-fun b!1516784 () Bool)

(declare-fun res!1036687 () Bool)

(assert (=> b!1516784 (=> (not res!1036687) (not e!846307))))

(assert (=> b!1516784 (= res!1036687 (and (= (size!49318 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49318 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49318 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129206 res!1036681) b!1516784))

(assert (= (and b!1516784 res!1036687) b!1516779))

(assert (= (and b!1516779 res!1036679) b!1516773))

(assert (= (and b!1516773 res!1036683) b!1516772))

(assert (= (and b!1516772 res!1036676) b!1516783))

(assert (= (and b!1516783 res!1036677) b!1516774))

(assert (= (and b!1516774 res!1036680) b!1516780))

(assert (= (and b!1516780 res!1036682) b!1516778))

(assert (= (and b!1516778 res!1036684) b!1516782))

(assert (= (and b!1516782 res!1036685) b!1516776))

(assert (= (and b!1516776 res!1036686) b!1516777))

(assert (= (and b!1516776 (not res!1036678)) b!1516781))

(assert (= (and b!1516781 (not res!1036675)) b!1516775))

(declare-fun m!1400045 () Bool)

(assert (=> b!1516773 m!1400045))

(assert (=> b!1516773 m!1400045))

(declare-fun m!1400047 () Bool)

(assert (=> b!1516773 m!1400047))

(declare-fun m!1400049 () Bool)

(assert (=> start!129206 m!1400049))

(declare-fun m!1400051 () Bool)

(assert (=> start!129206 m!1400051))

(assert (=> b!1516778 m!1400045))

(assert (=> b!1516778 m!1400045))

(declare-fun m!1400053 () Bool)

(assert (=> b!1516778 m!1400053))

(declare-fun m!1400055 () Bool)

(assert (=> b!1516772 m!1400055))

(declare-fun m!1400057 () Bool)

(assert (=> b!1516781 m!1400057))

(declare-fun m!1400059 () Bool)

(assert (=> b!1516783 m!1400059))

(assert (=> b!1516780 m!1400045))

(assert (=> b!1516780 m!1400045))

(declare-fun m!1400061 () Bool)

(assert (=> b!1516780 m!1400061))

(assert (=> b!1516780 m!1400061))

(assert (=> b!1516780 m!1400045))

(declare-fun m!1400063 () Bool)

(assert (=> b!1516780 m!1400063))

(declare-fun m!1400065 () Bool)

(assert (=> b!1516782 m!1400065))

(declare-fun m!1400067 () Bool)

(assert (=> b!1516782 m!1400067))

(assert (=> b!1516782 m!1400067))

(declare-fun m!1400069 () Bool)

(assert (=> b!1516782 m!1400069))

(assert (=> b!1516782 m!1400069))

(assert (=> b!1516782 m!1400067))

(declare-fun m!1400071 () Bool)

(assert (=> b!1516782 m!1400071))

(assert (=> b!1516776 m!1400045))

(declare-fun m!1400073 () Bool)

(assert (=> b!1516776 m!1400073))

(assert (=> b!1516776 m!1400065))

(assert (=> b!1516776 m!1400067))

(declare-fun m!1400075 () Bool)

(assert (=> b!1516776 m!1400075))

(assert (=> b!1516775 m!1400045))

(assert (=> b!1516775 m!1400045))

(declare-fun m!1400077 () Bool)

(assert (=> b!1516775 m!1400077))

(assert (=> b!1516777 m!1400045))

(assert (=> b!1516777 m!1400045))

(declare-fun m!1400079 () Bool)

(assert (=> b!1516777 m!1400079))

(declare-fun m!1400081 () Bool)

(assert (=> b!1516779 m!1400081))

(assert (=> b!1516779 m!1400081))

(declare-fun m!1400083 () Bool)

(assert (=> b!1516779 m!1400083))

(check-sat (not b!1516782) (not b!1516773) (not b!1516777) (not b!1516772) (not b!1516778) (not b!1516780) (not b!1516781) (not b!1516775) (not b!1516776) (not b!1516783) (not b!1516779) (not start!129206))
(check-sat)
