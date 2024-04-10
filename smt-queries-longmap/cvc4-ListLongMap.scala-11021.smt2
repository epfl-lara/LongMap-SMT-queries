; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128962 () Bool)

(assert start!128962)

(declare-fun b!1511915 () Bool)

(declare-fun res!1031825 () Bool)

(declare-fun e!844003 () Bool)

(assert (=> b!1511915 (=> (not res!1031825) (not e!844003))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100818 0))(
  ( (array!100819 (arr!48646 (Array (_ BitVec 32) (_ BitVec 64))) (size!49196 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100818)

(declare-datatypes ((SeekEntryResult!12817 0))(
  ( (MissingZero!12817 (index!53663 (_ BitVec 32))) (Found!12817 (index!53664 (_ BitVec 32))) (Intermediate!12817 (undefined!13629 Bool) (index!53665 (_ BitVec 32)) (x!135391 (_ BitVec 32))) (Undefined!12817) (MissingVacant!12817 (index!53666 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100818 (_ BitVec 32)) SeekEntryResult!12817)

(assert (=> b!1511915 (= res!1031825 (= (seekEntry!0 (select (arr!48646 a!2804) j!70) a!2804 mask!2512) (Found!12817 j!70)))))

(declare-fun b!1511917 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!844006 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100818 (_ BitVec 32)) SeekEntryResult!12817)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100818 (_ BitVec 32)) SeekEntryResult!12817)

(assert (=> b!1511917 (= e!844006 (= (seekEntryOrOpen!0 (select (arr!48646 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48646 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511918 () Bool)

(declare-fun res!1031823 () Bool)

(declare-fun e!844004 () Bool)

(assert (=> b!1511918 (=> (not res!1031823) (not e!844004))))

(declare-fun lt!655557 () SeekEntryResult!12817)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100818 (_ BitVec 32)) SeekEntryResult!12817)

(assert (=> b!1511918 (= res!1031823 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48646 a!2804) j!70) a!2804 mask!2512) lt!655557))))

(declare-fun b!1511919 () Bool)

(declare-fun res!1031827 () Bool)

(declare-fun e!844005 () Bool)

(assert (=> b!1511919 (=> (not res!1031827) (not e!844005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100818 (_ BitVec 32)) Bool)

(assert (=> b!1511919 (= res!1031827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511920 () Bool)

(assert (=> b!1511920 (= e!844003 e!844006)))

(declare-fun res!1031826 () Bool)

(assert (=> b!1511920 (=> res!1031826 e!844006)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511920 (= res!1031826 (or (not (= (select (arr!48646 a!2804) j!70) (select (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48646 a!2804) index!487) (select (arr!48646 a!2804) j!70)) (not (= (select (arr!48646 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511921 () Bool)

(declare-fun res!1031820 () Bool)

(assert (=> b!1511921 (=> (not res!1031820) (not e!844005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511921 (= res!1031820 (validKeyInArray!0 (select (arr!48646 a!2804) j!70)))))

(declare-fun b!1511922 () Bool)

(declare-fun res!1031822 () Bool)

(assert (=> b!1511922 (=> (not res!1031822) (not e!844005))))

(assert (=> b!1511922 (= res!1031822 (and (= (size!49196 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49196 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49196 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511923 () Bool)

(declare-fun res!1031819 () Bool)

(assert (=> b!1511923 (=> (not res!1031819) (not e!844005))))

(declare-datatypes ((List!35129 0))(
  ( (Nil!35126) (Cons!35125 (h!36537 (_ BitVec 64)) (t!49823 List!35129)) )
))
(declare-fun arrayNoDuplicates!0 (array!100818 (_ BitVec 32) List!35129) Bool)

(assert (=> b!1511923 (= res!1031819 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35126))))

(declare-fun res!1031830 () Bool)

(assert (=> start!128962 (=> (not res!1031830) (not e!844005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128962 (= res!1031830 (validMask!0 mask!2512))))

(assert (=> start!128962 e!844005))

(assert (=> start!128962 true))

(declare-fun array_inv!37674 (array!100818) Bool)

(assert (=> start!128962 (array_inv!37674 a!2804)))

(declare-fun b!1511916 () Bool)

(assert (=> b!1511916 (= e!844005 e!844004)))

(declare-fun res!1031818 () Bool)

(assert (=> b!1511916 (=> (not res!1031818) (not e!844004))))

(declare-fun lt!655556 () SeekEntryResult!12817)

(assert (=> b!1511916 (= res!1031818 (= lt!655556 lt!655557))))

(assert (=> b!1511916 (= lt!655557 (Intermediate!12817 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511916 (= lt!655556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48646 a!2804) j!70) mask!2512) (select (arr!48646 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511924 () Bool)

(declare-fun res!1031824 () Bool)

(assert (=> b!1511924 (=> (not res!1031824) (not e!844005))))

(assert (=> b!1511924 (= res!1031824 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49196 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49196 a!2804))))))

(declare-fun b!1511925 () Bool)

(declare-fun res!1031821 () Bool)

(assert (=> b!1511925 (=> (not res!1031821) (not e!844004))))

(assert (=> b!1511925 (= res!1031821 (= lt!655556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100819 (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49196 a!2804)) mask!2512)))))

(declare-fun b!1511926 () Bool)

(declare-fun res!1031828 () Bool)

(assert (=> b!1511926 (=> (not res!1031828) (not e!844005))))

(assert (=> b!1511926 (= res!1031828 (validKeyInArray!0 (select (arr!48646 a!2804) i!961)))))

(declare-fun b!1511927 () Bool)

(assert (=> b!1511927 (= e!844004 (not true))))

(assert (=> b!1511927 e!844003))

(declare-fun res!1031829 () Bool)

(assert (=> b!1511927 (=> (not res!1031829) (not e!844003))))

(assert (=> b!1511927 (= res!1031829 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50502 0))(
  ( (Unit!50503) )
))
(declare-fun lt!655558 () Unit!50502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50502)

(assert (=> b!1511927 (= lt!655558 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128962 res!1031830) b!1511922))

(assert (= (and b!1511922 res!1031822) b!1511926))

(assert (= (and b!1511926 res!1031828) b!1511921))

(assert (= (and b!1511921 res!1031820) b!1511919))

(assert (= (and b!1511919 res!1031827) b!1511923))

(assert (= (and b!1511923 res!1031819) b!1511924))

(assert (= (and b!1511924 res!1031824) b!1511916))

(assert (= (and b!1511916 res!1031818) b!1511918))

(assert (= (and b!1511918 res!1031823) b!1511925))

(assert (= (and b!1511925 res!1031821) b!1511927))

(assert (= (and b!1511927 res!1031829) b!1511915))

(assert (= (and b!1511915 res!1031825) b!1511920))

(assert (= (and b!1511920 (not res!1031826)) b!1511917))

(declare-fun m!1394647 () Bool)

(assert (=> b!1511927 m!1394647))

(declare-fun m!1394649 () Bool)

(assert (=> b!1511927 m!1394649))

(declare-fun m!1394651 () Bool)

(assert (=> b!1511920 m!1394651))

(declare-fun m!1394653 () Bool)

(assert (=> b!1511920 m!1394653))

(declare-fun m!1394655 () Bool)

(assert (=> b!1511920 m!1394655))

(declare-fun m!1394657 () Bool)

(assert (=> b!1511920 m!1394657))

(declare-fun m!1394659 () Bool)

(assert (=> start!128962 m!1394659))

(declare-fun m!1394661 () Bool)

(assert (=> start!128962 m!1394661))

(assert (=> b!1511921 m!1394651))

(assert (=> b!1511921 m!1394651))

(declare-fun m!1394663 () Bool)

(assert (=> b!1511921 m!1394663))

(assert (=> b!1511915 m!1394651))

(assert (=> b!1511915 m!1394651))

(declare-fun m!1394665 () Bool)

(assert (=> b!1511915 m!1394665))

(assert (=> b!1511917 m!1394651))

(assert (=> b!1511917 m!1394651))

(declare-fun m!1394667 () Bool)

(assert (=> b!1511917 m!1394667))

(assert (=> b!1511917 m!1394651))

(declare-fun m!1394669 () Bool)

(assert (=> b!1511917 m!1394669))

(declare-fun m!1394671 () Bool)

(assert (=> b!1511926 m!1394671))

(assert (=> b!1511926 m!1394671))

(declare-fun m!1394673 () Bool)

(assert (=> b!1511926 m!1394673))

(assert (=> b!1511916 m!1394651))

(assert (=> b!1511916 m!1394651))

(declare-fun m!1394675 () Bool)

(assert (=> b!1511916 m!1394675))

(assert (=> b!1511916 m!1394675))

(assert (=> b!1511916 m!1394651))

(declare-fun m!1394677 () Bool)

(assert (=> b!1511916 m!1394677))

(declare-fun m!1394679 () Bool)

(assert (=> b!1511919 m!1394679))

(assert (=> b!1511918 m!1394651))

(assert (=> b!1511918 m!1394651))

(declare-fun m!1394681 () Bool)

(assert (=> b!1511918 m!1394681))

(declare-fun m!1394683 () Bool)

(assert (=> b!1511923 m!1394683))

(assert (=> b!1511925 m!1394653))

(assert (=> b!1511925 m!1394655))

(assert (=> b!1511925 m!1394655))

(declare-fun m!1394685 () Bool)

(assert (=> b!1511925 m!1394685))

(assert (=> b!1511925 m!1394685))

(assert (=> b!1511925 m!1394655))

(declare-fun m!1394687 () Bool)

(assert (=> b!1511925 m!1394687))

(push 1)

