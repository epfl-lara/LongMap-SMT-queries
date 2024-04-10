; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129108 () Bool)

(assert start!129108)

(declare-fun b!1514917 () Bool)

(declare-fun res!1034824 () Bool)

(declare-fun e!845411 () Bool)

(assert (=> b!1514917 (=> (not res!1034824) (not e!845411))))

(declare-datatypes ((array!100964 0))(
  ( (array!100965 (arr!48719 (Array (_ BitVec 32) (_ BitVec 64))) (size!49269 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100964)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514917 (= res!1034824 (validKeyInArray!0 (select (arr!48719 a!2804) i!961)))))

(declare-fun res!1034833 () Bool)

(assert (=> start!129108 (=> (not res!1034833) (not e!845411))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129108 (= res!1034833 (validMask!0 mask!2512))))

(assert (=> start!129108 e!845411))

(assert (=> start!129108 true))

(declare-fun array_inv!37747 (array!100964) Bool)

(assert (=> start!129108 (array_inv!37747 a!2804)))

(declare-fun b!1514918 () Bool)

(declare-fun e!845410 () Bool)

(declare-fun e!845413 () Bool)

(assert (=> b!1514918 (= e!845410 e!845413)))

(declare-fun res!1034823 () Bool)

(assert (=> b!1514918 (=> res!1034823 e!845413)))

(declare-fun lt!656508 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514918 (= res!1034823 (or (not (= (select (arr!48719 a!2804) j!70) lt!656508)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48719 a!2804) index!487) (select (arr!48719 a!2804) j!70)) (not (= (select (arr!48719 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514919 () Bool)

(declare-fun e!845407 () Bool)

(assert (=> b!1514919 (= e!845413 e!845407)))

(declare-fun res!1034828 () Bool)

(assert (=> b!1514919 (=> (not res!1034828) (not e!845407))))

(declare-datatypes ((SeekEntryResult!12890 0))(
  ( (MissingZero!12890 (index!53955 (_ BitVec 32))) (Found!12890 (index!53956 (_ BitVec 32))) (Intermediate!12890 (undefined!13702 Bool) (index!53957 (_ BitVec 32)) (x!135664 (_ BitVec 32))) (Undefined!12890) (MissingVacant!12890 (index!53958 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100964 (_ BitVec 32)) SeekEntryResult!12890)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100964 (_ BitVec 32)) SeekEntryResult!12890)

(assert (=> b!1514919 (= res!1034828 (= (seekEntryOrOpen!0 (select (arr!48719 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48719 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514920 () Bool)

(declare-fun res!1034826 () Bool)

(assert (=> b!1514920 (=> (not res!1034826) (not e!845411))))

(declare-datatypes ((List!35202 0))(
  ( (Nil!35199) (Cons!35198 (h!36610 (_ BitVec 64)) (t!49896 List!35202)) )
))
(declare-fun arrayNoDuplicates!0 (array!100964 (_ BitVec 32) List!35202) Bool)

(assert (=> b!1514920 (= res!1034826 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35199))))

(declare-fun b!1514921 () Bool)

(declare-fun res!1034830 () Bool)

(assert (=> b!1514921 (=> (not res!1034830) (not e!845411))))

(assert (=> b!1514921 (= res!1034830 (and (= (size!49269 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49269 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49269 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514922 () Bool)

(declare-fun res!1034820 () Bool)

(assert (=> b!1514922 (=> (not res!1034820) (not e!845410))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100964 (_ BitVec 32)) SeekEntryResult!12890)

(assert (=> b!1514922 (= res!1034820 (= (seekEntry!0 (select (arr!48719 a!2804) j!70) a!2804 mask!2512) (Found!12890 j!70)))))

(declare-fun b!1514923 () Bool)

(declare-fun e!845412 () Bool)

(assert (=> b!1514923 (= e!845412 (not true))))

(assert (=> b!1514923 e!845410))

(declare-fun res!1034825 () Bool)

(assert (=> b!1514923 (=> (not res!1034825) (not e!845410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100964 (_ BitVec 32)) Bool)

(assert (=> b!1514923 (= res!1034825 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50648 0))(
  ( (Unit!50649) )
))
(declare-fun lt!656506 () Unit!50648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50648)

(assert (=> b!1514923 (= lt!656506 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun lt!656505 () array!100964)

(declare-fun b!1514924 () Bool)

(assert (=> b!1514924 (= e!845407 (= (seekEntryOrOpen!0 lt!656508 lt!656505 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656508 lt!656505 mask!2512)))))

(declare-fun b!1514925 () Bool)

(declare-fun e!845408 () Bool)

(assert (=> b!1514925 (= e!845411 e!845408)))

(declare-fun res!1034829 () Bool)

(assert (=> b!1514925 (=> (not res!1034829) (not e!845408))))

(declare-fun lt!656509 () SeekEntryResult!12890)

(declare-fun lt!656507 () SeekEntryResult!12890)

(assert (=> b!1514925 (= res!1034829 (= lt!656509 lt!656507))))

(assert (=> b!1514925 (= lt!656507 (Intermediate!12890 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100964 (_ BitVec 32)) SeekEntryResult!12890)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514925 (= lt!656509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48719 a!2804) j!70) mask!2512) (select (arr!48719 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514926 () Bool)

(assert (=> b!1514926 (= e!845408 e!845412)))

(declare-fun res!1034822 () Bool)

(assert (=> b!1514926 (=> (not res!1034822) (not e!845412))))

(assert (=> b!1514926 (= res!1034822 (= lt!656509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656508 mask!2512) lt!656508 lt!656505 mask!2512)))))

(assert (=> b!1514926 (= lt!656508 (select (store (arr!48719 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514926 (= lt!656505 (array!100965 (store (arr!48719 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49269 a!2804)))))

(declare-fun b!1514927 () Bool)

(declare-fun res!1034831 () Bool)

(assert (=> b!1514927 (=> (not res!1034831) (not e!845411))))

(assert (=> b!1514927 (= res!1034831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514928 () Bool)

(declare-fun res!1034827 () Bool)

(assert (=> b!1514928 (=> (not res!1034827) (not e!845411))))

(assert (=> b!1514928 (= res!1034827 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49269 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49269 a!2804))))))

(declare-fun b!1514929 () Bool)

(declare-fun res!1034832 () Bool)

(assert (=> b!1514929 (=> (not res!1034832) (not e!845411))))

(assert (=> b!1514929 (= res!1034832 (validKeyInArray!0 (select (arr!48719 a!2804) j!70)))))

(declare-fun b!1514930 () Bool)

(declare-fun res!1034821 () Bool)

(assert (=> b!1514930 (=> (not res!1034821) (not e!845408))))

(assert (=> b!1514930 (= res!1034821 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48719 a!2804) j!70) a!2804 mask!2512) lt!656507))))

(assert (= (and start!129108 res!1034833) b!1514921))

(assert (= (and b!1514921 res!1034830) b!1514917))

(assert (= (and b!1514917 res!1034824) b!1514929))

(assert (= (and b!1514929 res!1034832) b!1514927))

(assert (= (and b!1514927 res!1034831) b!1514920))

(assert (= (and b!1514920 res!1034826) b!1514928))

(assert (= (and b!1514928 res!1034827) b!1514925))

(assert (= (and b!1514925 res!1034829) b!1514930))

(assert (= (and b!1514930 res!1034821) b!1514926))

(assert (= (and b!1514926 res!1034822) b!1514923))

(assert (= (and b!1514923 res!1034825) b!1514922))

(assert (= (and b!1514922 res!1034820) b!1514918))

(assert (= (and b!1514918 (not res!1034823)) b!1514919))

(assert (= (and b!1514919 res!1034828) b!1514924))

(declare-fun m!1397917 () Bool)

(assert (=> b!1514929 m!1397917))

(assert (=> b!1514929 m!1397917))

(declare-fun m!1397919 () Bool)

(assert (=> b!1514929 m!1397919))

(assert (=> b!1514922 m!1397917))

(assert (=> b!1514922 m!1397917))

(declare-fun m!1397921 () Bool)

(assert (=> b!1514922 m!1397921))

(assert (=> b!1514930 m!1397917))

(assert (=> b!1514930 m!1397917))

(declare-fun m!1397923 () Bool)

(assert (=> b!1514930 m!1397923))

(assert (=> b!1514925 m!1397917))

(assert (=> b!1514925 m!1397917))

(declare-fun m!1397925 () Bool)

(assert (=> b!1514925 m!1397925))

(assert (=> b!1514925 m!1397925))

(assert (=> b!1514925 m!1397917))

(declare-fun m!1397927 () Bool)

(assert (=> b!1514925 m!1397927))

(assert (=> b!1514919 m!1397917))

(assert (=> b!1514919 m!1397917))

(declare-fun m!1397929 () Bool)

(assert (=> b!1514919 m!1397929))

(assert (=> b!1514919 m!1397917))

(declare-fun m!1397931 () Bool)

(assert (=> b!1514919 m!1397931))

(declare-fun m!1397933 () Bool)

(assert (=> b!1514927 m!1397933))

(assert (=> b!1514918 m!1397917))

(declare-fun m!1397935 () Bool)

(assert (=> b!1514918 m!1397935))

(declare-fun m!1397937 () Bool)

(assert (=> start!129108 m!1397937))

(declare-fun m!1397939 () Bool)

(assert (=> start!129108 m!1397939))

(declare-fun m!1397941 () Bool)

(assert (=> b!1514924 m!1397941))

(declare-fun m!1397943 () Bool)

(assert (=> b!1514924 m!1397943))

(declare-fun m!1397945 () Bool)

(assert (=> b!1514917 m!1397945))

(assert (=> b!1514917 m!1397945))

(declare-fun m!1397947 () Bool)

(assert (=> b!1514917 m!1397947))

(declare-fun m!1397949 () Bool)

(assert (=> b!1514923 m!1397949))

(declare-fun m!1397951 () Bool)

(assert (=> b!1514923 m!1397951))

(declare-fun m!1397953 () Bool)

(assert (=> b!1514920 m!1397953))

(declare-fun m!1397955 () Bool)

(assert (=> b!1514926 m!1397955))

(assert (=> b!1514926 m!1397955))

(declare-fun m!1397957 () Bool)

(assert (=> b!1514926 m!1397957))

(declare-fun m!1397959 () Bool)

(assert (=> b!1514926 m!1397959))

(declare-fun m!1397961 () Bool)

(assert (=> b!1514926 m!1397961))

(push 1)

