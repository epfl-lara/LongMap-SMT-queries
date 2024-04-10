; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130092 () Bool)

(assert start!130092)

(declare-fun b!1526818 () Bool)

(declare-fun res!1044854 () Bool)

(declare-fun e!851020 () Bool)

(assert (=> b!1526818 (=> (not res!1044854) (not e!851020))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101505 0))(
  ( (array!101506 (arr!48979 (Array (_ BitVec 32) (_ BitVec 64))) (size!49529 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101505)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526818 (= res!1044854 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49529 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49529 a!2804))))))

(declare-fun b!1526819 () Bool)

(declare-fun res!1044858 () Bool)

(assert (=> b!1526819 (=> (not res!1044858) (not e!851020))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101505 (_ BitVec 32)) Bool)

(assert (=> b!1526819 (= res!1044858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526820 () Bool)

(declare-fun res!1044852 () Bool)

(assert (=> b!1526820 (=> (not res!1044852) (not e!851020))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1526820 (= res!1044852 (and (= (size!49529 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49529 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49529 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526821 () Bool)

(declare-fun res!1044856 () Bool)

(assert (=> b!1526821 (=> (not res!1044856) (not e!851020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526821 (= res!1044856 (validKeyInArray!0 (select (arr!48979 a!2804) i!961)))))

(declare-fun lt!661212 () array!101505)

(declare-fun e!851022 () Bool)

(declare-fun lt!661210 () (_ BitVec 64))

(declare-fun b!1526822 () Bool)

(declare-datatypes ((SeekEntryResult!13144 0))(
  ( (MissingZero!13144 (index!54971 (_ BitVec 32))) (Found!13144 (index!54972 (_ BitVec 32))) (Intermediate!13144 (undefined!13956 Bool) (index!54973 (_ BitVec 32)) (x!136662 (_ BitVec 32))) (Undefined!13144) (MissingVacant!13144 (index!54974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101505 (_ BitVec 32)) SeekEntryResult!13144)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101505 (_ BitVec 32)) SeekEntryResult!13144)

(assert (=> b!1526822 (= e!851022 (= (seekEntryOrOpen!0 lt!661210 lt!661212 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661210 lt!661212 mask!2512)))))

(declare-fun b!1526823 () Bool)

(declare-fun e!851025 () Bool)

(assert (=> b!1526823 (= e!851025 e!851022)))

(declare-fun res!1044857 () Bool)

(assert (=> b!1526823 (=> (not res!1044857) (not e!851022))))

(assert (=> b!1526823 (= res!1044857 (= (seekEntryOrOpen!0 (select (arr!48979 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48979 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526824 () Bool)

(declare-fun res!1044859 () Bool)

(assert (=> b!1526824 (=> (not res!1044859) (not e!851020))))

(assert (=> b!1526824 (= res!1044859 (validKeyInArray!0 (select (arr!48979 a!2804) j!70)))))

(declare-fun b!1526825 () Bool)

(declare-fun res!1044861 () Bool)

(declare-fun e!851021 () Bool)

(assert (=> b!1526825 (=> (not res!1044861) (not e!851021))))

(declare-fun lt!661211 () SeekEntryResult!13144)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101505 (_ BitVec 32)) SeekEntryResult!13144)

(assert (=> b!1526825 (= res!1044861 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48979 a!2804) j!70) a!2804 mask!2512) lt!661211))))

(declare-fun b!1526826 () Bool)

(assert (=> b!1526826 (= e!851020 e!851021)))

(declare-fun res!1044853 () Bool)

(assert (=> b!1526826 (=> (not res!1044853) (not e!851021))))

(declare-fun lt!661213 () SeekEntryResult!13144)

(assert (=> b!1526826 (= res!1044853 (= lt!661213 lt!661211))))

(assert (=> b!1526826 (= lt!661211 (Intermediate!13144 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526826 (= lt!661213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48979 a!2804) j!70) mask!2512) (select (arr!48979 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526827 () Bool)

(declare-fun res!1044863 () Bool)

(declare-fun e!851026 () Bool)

(assert (=> b!1526827 (=> (not res!1044863) (not e!851026))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101505 (_ BitVec 32)) SeekEntryResult!13144)

(assert (=> b!1526827 (= res!1044863 (= (seekEntry!0 (select (arr!48979 a!2804) j!70) a!2804 mask!2512) (Found!13144 j!70)))))

(declare-fun b!1526828 () Bool)

(declare-fun e!851023 () Bool)

(assert (=> b!1526828 (= e!851021 e!851023)))

(declare-fun res!1044862 () Bool)

(assert (=> b!1526828 (=> (not res!1044862) (not e!851023))))

(assert (=> b!1526828 (= res!1044862 (= lt!661213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661210 mask!2512) lt!661210 lt!661212 mask!2512)))))

(assert (=> b!1526828 (= lt!661210 (select (store (arr!48979 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526828 (= lt!661212 (array!101506 (store (arr!48979 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49529 a!2804)))))

(declare-fun b!1526829 () Bool)

(declare-fun res!1044855 () Bool)

(assert (=> b!1526829 (=> (not res!1044855) (not e!851020))))

(declare-datatypes ((List!35462 0))(
  ( (Nil!35459) (Cons!35458 (h!36891 (_ BitVec 64)) (t!50156 List!35462)) )
))
(declare-fun arrayNoDuplicates!0 (array!101505 (_ BitVec 32) List!35462) Bool)

(assert (=> b!1526829 (= res!1044855 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35459))))

(declare-fun b!1526831 () Bool)

(assert (=> b!1526831 (= e!851026 e!851025)))

(declare-fun res!1044865 () Bool)

(assert (=> b!1526831 (=> res!1044865 e!851025)))

(assert (=> b!1526831 (= res!1044865 (or (not (= (select (arr!48979 a!2804) j!70) lt!661210)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48979 a!2804) index!487) (select (arr!48979 a!2804) j!70)) (not (= (select (arr!48979 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1044864 () Bool)

(assert (=> start!130092 (=> (not res!1044864) (not e!851020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130092 (= res!1044864 (validMask!0 mask!2512))))

(assert (=> start!130092 e!851020))

(assert (=> start!130092 true))

(declare-fun array_inv!38007 (array!101505) Bool)

(assert (=> start!130092 (array_inv!38007 a!2804)))

(declare-fun b!1526830 () Bool)

(assert (=> b!1526830 (= e!851023 (not true))))

(assert (=> b!1526830 e!851026))

(declare-fun res!1044860 () Bool)

(assert (=> b!1526830 (=> (not res!1044860) (not e!851026))))

(assert (=> b!1526830 (= res!1044860 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51072 0))(
  ( (Unit!51073) )
))
(declare-fun lt!661209 () Unit!51072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51072)

(assert (=> b!1526830 (= lt!661209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130092 res!1044864) b!1526820))

(assert (= (and b!1526820 res!1044852) b!1526821))

(assert (= (and b!1526821 res!1044856) b!1526824))

(assert (= (and b!1526824 res!1044859) b!1526819))

(assert (= (and b!1526819 res!1044858) b!1526829))

(assert (= (and b!1526829 res!1044855) b!1526818))

(assert (= (and b!1526818 res!1044854) b!1526826))

(assert (= (and b!1526826 res!1044853) b!1526825))

(assert (= (and b!1526825 res!1044861) b!1526828))

(assert (= (and b!1526828 res!1044862) b!1526830))

(assert (= (and b!1526830 res!1044860) b!1526827))

(assert (= (and b!1526827 res!1044863) b!1526831))

(assert (= (and b!1526831 (not res!1044865)) b!1526823))

(assert (= (and b!1526823 res!1044857) b!1526822))

(declare-fun m!1409657 () Bool)

(assert (=> b!1526822 m!1409657))

(declare-fun m!1409659 () Bool)

(assert (=> b!1526822 m!1409659))

(declare-fun m!1409661 () Bool)

(assert (=> b!1526829 m!1409661))

(declare-fun m!1409663 () Bool)

(assert (=> b!1526824 m!1409663))

(assert (=> b!1526824 m!1409663))

(declare-fun m!1409665 () Bool)

(assert (=> b!1526824 m!1409665))

(declare-fun m!1409667 () Bool)

(assert (=> b!1526821 m!1409667))

(assert (=> b!1526821 m!1409667))

(declare-fun m!1409669 () Bool)

(assert (=> b!1526821 m!1409669))

(declare-fun m!1409671 () Bool)

(assert (=> start!130092 m!1409671))

(declare-fun m!1409673 () Bool)

(assert (=> start!130092 m!1409673))

(assert (=> b!1526823 m!1409663))

(assert (=> b!1526823 m!1409663))

(declare-fun m!1409675 () Bool)

(assert (=> b!1526823 m!1409675))

(assert (=> b!1526823 m!1409663))

(declare-fun m!1409677 () Bool)

(assert (=> b!1526823 m!1409677))

(assert (=> b!1526825 m!1409663))

(assert (=> b!1526825 m!1409663))

(declare-fun m!1409679 () Bool)

(assert (=> b!1526825 m!1409679))

(assert (=> b!1526831 m!1409663))

(declare-fun m!1409681 () Bool)

(assert (=> b!1526831 m!1409681))

(assert (=> b!1526827 m!1409663))

(assert (=> b!1526827 m!1409663))

(declare-fun m!1409683 () Bool)

(assert (=> b!1526827 m!1409683))

(assert (=> b!1526826 m!1409663))

(assert (=> b!1526826 m!1409663))

(declare-fun m!1409685 () Bool)

(assert (=> b!1526826 m!1409685))

(assert (=> b!1526826 m!1409685))

(assert (=> b!1526826 m!1409663))

(declare-fun m!1409687 () Bool)

(assert (=> b!1526826 m!1409687))

(declare-fun m!1409689 () Bool)

(assert (=> b!1526819 m!1409689))

(declare-fun m!1409691 () Bool)

(assert (=> b!1526828 m!1409691))

(assert (=> b!1526828 m!1409691))

(declare-fun m!1409693 () Bool)

(assert (=> b!1526828 m!1409693))

(declare-fun m!1409695 () Bool)

(assert (=> b!1526828 m!1409695))

(declare-fun m!1409697 () Bool)

(assert (=> b!1526828 m!1409697))

(declare-fun m!1409699 () Bool)

(assert (=> b!1526830 m!1409699))

(declare-fun m!1409701 () Bool)

(assert (=> b!1526830 m!1409701))

(push 1)

