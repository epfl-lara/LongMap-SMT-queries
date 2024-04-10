; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129012 () Bool)

(assert start!129012)

(declare-fun b!1512901 () Bool)

(declare-fun e!844399 () Bool)

(declare-fun e!844402 () Bool)

(assert (=> b!1512901 (= e!844399 (not e!844402))))

(declare-fun res!1032805 () Bool)

(assert (=> b!1512901 (=> res!1032805 e!844402)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!655793 () (_ BitVec 64))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100868 0))(
  ( (array!100869 (arr!48671 (Array (_ BitVec 32) (_ BitVec 64))) (size!49221 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100868)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512901 (= res!1032805 (or (not (= (select (arr!48671 a!2804) j!70) lt!655793)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48671 a!2804) index!487) (select (arr!48671 a!2804) j!70)) (not (= (select (arr!48671 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (not (= (select (store (arr!48671 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!844400 () Bool)

(assert (=> b!1512901 e!844400))

(declare-fun res!1032804 () Bool)

(assert (=> b!1512901 (=> (not res!1032804) (not e!844400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100868 (_ BitVec 32)) Bool)

(assert (=> b!1512901 (= res!1032804 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50552 0))(
  ( (Unit!50553) )
))
(declare-fun lt!655795 () Unit!50552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50552)

(assert (=> b!1512901 (= lt!655795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512902 () Bool)

(declare-fun e!844403 () Bool)

(assert (=> b!1512902 (= e!844403 e!844399)))

(declare-fun res!1032813 () Bool)

(assert (=> b!1512902 (=> (not res!1032813) (not e!844399))))

(declare-datatypes ((SeekEntryResult!12842 0))(
  ( (MissingZero!12842 (index!53763 (_ BitVec 32))) (Found!12842 (index!53764 (_ BitVec 32))) (Intermediate!12842 (undefined!13654 Bool) (index!53765 (_ BitVec 32)) (x!135488 (_ BitVec 32))) (Undefined!12842) (MissingVacant!12842 (index!53766 (_ BitVec 32))) )
))
(declare-fun lt!655792 () SeekEntryResult!12842)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100868 (_ BitVec 32)) SeekEntryResult!12842)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512902 (= res!1032813 (= lt!655792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655793 mask!2512) lt!655793 (array!100869 (store (arr!48671 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49221 a!2804)) mask!2512)))))

(assert (=> b!1512902 (= lt!655793 (select (store (arr!48671 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1512903 () Bool)

(declare-fun res!1032815 () Bool)

(declare-fun e!844401 () Bool)

(assert (=> b!1512903 (=> (not res!1032815) (not e!844401))))

(assert (=> b!1512903 (= res!1032815 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49221 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49221 a!2804))))))

(declare-fun b!1512905 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512905 (= e!844402 (validKeyInArray!0 lt!655793))))

(declare-fun b!1512906 () Bool)

(assert (=> b!1512906 (= e!844401 e!844403)))

(declare-fun res!1032806 () Bool)

(assert (=> b!1512906 (=> (not res!1032806) (not e!844403))))

(declare-fun lt!655794 () SeekEntryResult!12842)

(assert (=> b!1512906 (= res!1032806 (= lt!655792 lt!655794))))

(assert (=> b!1512906 (= lt!655794 (Intermediate!12842 false resIndex!21 resX!21))))

(assert (=> b!1512906 (= lt!655792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48671 a!2804) j!70) mask!2512) (select (arr!48671 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512907 () Bool)

(declare-fun res!1032808 () Bool)

(assert (=> b!1512907 (=> (not res!1032808) (not e!844401))))

(declare-datatypes ((List!35154 0))(
  ( (Nil!35151) (Cons!35150 (h!36562 (_ BitVec 64)) (t!49848 List!35154)) )
))
(declare-fun arrayNoDuplicates!0 (array!100868 (_ BitVec 32) List!35154) Bool)

(assert (=> b!1512907 (= res!1032808 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35151))))

(declare-fun b!1512908 () Bool)

(declare-fun res!1032816 () Bool)

(assert (=> b!1512908 (=> (not res!1032816) (not e!844401))))

(assert (=> b!1512908 (= res!1032816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512909 () Bool)

(declare-fun res!1032817 () Bool)

(assert (=> b!1512909 (=> (not res!1032817) (not e!844401))))

(assert (=> b!1512909 (= res!1032817 (validKeyInArray!0 (select (arr!48671 a!2804) j!70)))))

(declare-fun b!1512910 () Bool)

(declare-fun res!1032809 () Bool)

(assert (=> b!1512910 (=> (not res!1032809) (not e!844401))))

(assert (=> b!1512910 (= res!1032809 (and (= (size!49221 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49221 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49221 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512911 () Bool)

(declare-fun res!1032810 () Bool)

(assert (=> b!1512911 (=> (not res!1032810) (not e!844403))))

(assert (=> b!1512911 (= res!1032810 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48671 a!2804) j!70) a!2804 mask!2512) lt!655794))))

(declare-fun e!844404 () Bool)

(declare-fun b!1512912 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100868 (_ BitVec 32)) SeekEntryResult!12842)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100868 (_ BitVec 32)) SeekEntryResult!12842)

(assert (=> b!1512912 (= e!844404 (= (seekEntryOrOpen!0 (select (arr!48671 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48671 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512913 () Bool)

(declare-fun res!1032812 () Bool)

(assert (=> b!1512913 (=> (not res!1032812) (not e!844401))))

(assert (=> b!1512913 (= res!1032812 (validKeyInArray!0 (select (arr!48671 a!2804) i!961)))))

(declare-fun b!1512914 () Bool)

(declare-fun res!1032811 () Bool)

(assert (=> b!1512914 (=> (not res!1032811) (not e!844400))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100868 (_ BitVec 32)) SeekEntryResult!12842)

(assert (=> b!1512914 (= res!1032811 (= (seekEntry!0 (select (arr!48671 a!2804) j!70) a!2804 mask!2512) (Found!12842 j!70)))))

(declare-fun b!1512904 () Bool)

(assert (=> b!1512904 (= e!844400 e!844404)))

(declare-fun res!1032807 () Bool)

(assert (=> b!1512904 (=> res!1032807 e!844404)))

(assert (=> b!1512904 (= res!1032807 (or (not (= (select (arr!48671 a!2804) j!70) lt!655793)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48671 a!2804) index!487) (select (arr!48671 a!2804) j!70)) (not (= (select (arr!48671 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1032814 () Bool)

(assert (=> start!129012 (=> (not res!1032814) (not e!844401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129012 (= res!1032814 (validMask!0 mask!2512))))

(assert (=> start!129012 e!844401))

(assert (=> start!129012 true))

(declare-fun array_inv!37699 (array!100868) Bool)

(assert (=> start!129012 (array_inv!37699 a!2804)))

(assert (= (and start!129012 res!1032814) b!1512910))

(assert (= (and b!1512910 res!1032809) b!1512913))

(assert (= (and b!1512913 res!1032812) b!1512909))

(assert (= (and b!1512909 res!1032817) b!1512908))

(assert (= (and b!1512908 res!1032816) b!1512907))

(assert (= (and b!1512907 res!1032808) b!1512903))

(assert (= (and b!1512903 res!1032815) b!1512906))

(assert (= (and b!1512906 res!1032806) b!1512911))

(assert (= (and b!1512911 res!1032810) b!1512902))

(assert (= (and b!1512902 res!1032813) b!1512901))

(assert (= (and b!1512901 res!1032804) b!1512914))

(assert (= (and b!1512914 res!1032811) b!1512904))

(assert (= (and b!1512904 (not res!1032807)) b!1512912))

(assert (= (and b!1512901 (not res!1032805)) b!1512905))

(declare-fun m!1395709 () Bool)

(assert (=> b!1512911 m!1395709))

(assert (=> b!1512911 m!1395709))

(declare-fun m!1395711 () Bool)

(assert (=> b!1512911 m!1395711))

(declare-fun m!1395713 () Bool)

(assert (=> b!1512907 m!1395713))

(declare-fun m!1395715 () Bool)

(assert (=> b!1512905 m!1395715))

(assert (=> b!1512912 m!1395709))

(assert (=> b!1512912 m!1395709))

(declare-fun m!1395717 () Bool)

(assert (=> b!1512912 m!1395717))

(assert (=> b!1512912 m!1395709))

(declare-fun m!1395719 () Bool)

(assert (=> b!1512912 m!1395719))

(declare-fun m!1395721 () Bool)

(assert (=> b!1512908 m!1395721))

(declare-fun m!1395723 () Bool)

(assert (=> start!129012 m!1395723))

(declare-fun m!1395725 () Bool)

(assert (=> start!129012 m!1395725))

(assert (=> b!1512914 m!1395709))

(assert (=> b!1512914 m!1395709))

(declare-fun m!1395727 () Bool)

(assert (=> b!1512914 m!1395727))

(declare-fun m!1395729 () Bool)

(assert (=> b!1512902 m!1395729))

(declare-fun m!1395731 () Bool)

(assert (=> b!1512902 m!1395731))

(assert (=> b!1512902 m!1395729))

(declare-fun m!1395733 () Bool)

(assert (=> b!1512902 m!1395733))

(declare-fun m!1395735 () Bool)

(assert (=> b!1512902 m!1395735))

(declare-fun m!1395737 () Bool)

(assert (=> b!1512913 m!1395737))

(assert (=> b!1512913 m!1395737))

(declare-fun m!1395739 () Bool)

(assert (=> b!1512913 m!1395739))

(assert (=> b!1512906 m!1395709))

(assert (=> b!1512906 m!1395709))

(declare-fun m!1395741 () Bool)

(assert (=> b!1512906 m!1395741))

(assert (=> b!1512906 m!1395741))

(assert (=> b!1512906 m!1395709))

(declare-fun m!1395743 () Bool)

(assert (=> b!1512906 m!1395743))

(assert (=> b!1512909 m!1395709))

(assert (=> b!1512909 m!1395709))

(declare-fun m!1395745 () Bool)

(assert (=> b!1512909 m!1395745))

(assert (=> b!1512901 m!1395709))

(declare-fun m!1395747 () Bool)

(assert (=> b!1512901 m!1395747))

(assert (=> b!1512901 m!1395731))

(declare-fun m!1395749 () Bool)

(assert (=> b!1512901 m!1395749))

(declare-fun m!1395751 () Bool)

(assert (=> b!1512901 m!1395751))

(declare-fun m!1395753 () Bool)

(assert (=> b!1512901 m!1395753))

(assert (=> b!1512904 m!1395709))

(assert (=> b!1512904 m!1395749))

(push 1)

