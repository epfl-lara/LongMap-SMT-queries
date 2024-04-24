; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129326 () Bool)

(assert start!129326)

(declare-fun b!1514985 () Bool)

(declare-fun e!845662 () Bool)

(declare-fun e!845667 () Bool)

(assert (=> b!1514985 (= e!845662 e!845667)))

(declare-fun res!1033716 () Bool)

(assert (=> b!1514985 (=> res!1033716 e!845667)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!656538 () (_ BitVec 64))

(declare-datatypes ((array!100996 0))(
  ( (array!100997 (arr!48730 (Array (_ BitVec 32) (_ BitVec 64))) (size!49281 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100996)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1514985 (= res!1033716 (or (not (= (select (arr!48730 a!2804) j!70) lt!656538)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48730 a!2804) index!487) (select (arr!48730 a!2804) j!70)) (not (= (select (arr!48730 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514986 () Bool)

(declare-fun res!1033720 () Bool)

(declare-fun e!845665 () Bool)

(assert (=> b!1514986 (=> (not res!1033720) (not e!845665))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100996 (_ BitVec 32)) Bool)

(assert (=> b!1514986 (= res!1033720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514987 () Bool)

(declare-fun e!845661 () Bool)

(declare-fun e!845666 () Bool)

(assert (=> b!1514987 (= e!845661 e!845666)))

(declare-fun res!1033722 () Bool)

(assert (=> b!1514987 (=> (not res!1033722) (not e!845666))))

(declare-fun lt!656541 () array!100996)

(declare-datatypes ((SeekEntryResult!12794 0))(
  ( (MissingZero!12794 (index!53571 (_ BitVec 32))) (Found!12794 (index!53572 (_ BitVec 32))) (Intermediate!12794 (undefined!13606 Bool) (index!53573 (_ BitVec 32)) (x!135493 (_ BitVec 32))) (Undefined!12794) (MissingVacant!12794 (index!53574 (_ BitVec 32))) )
))
(declare-fun lt!656542 () SeekEntryResult!12794)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12794)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514987 (= res!1033722 (= lt!656542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656538 mask!2512) lt!656538 lt!656541 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514987 (= lt!656538 (select (store (arr!48730 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514987 (= lt!656541 (array!100997 (store (arr!48730 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49281 a!2804)))))

(declare-fun b!1514988 () Bool)

(assert (=> b!1514988 (= e!845665 e!845661)))

(declare-fun res!1033712 () Bool)

(assert (=> b!1514988 (=> (not res!1033712) (not e!845661))))

(declare-fun lt!656539 () SeekEntryResult!12794)

(assert (=> b!1514988 (= res!1033712 (= lt!656542 lt!656539))))

(assert (=> b!1514988 (= lt!656539 (Intermediate!12794 false resIndex!21 resX!21))))

(assert (=> b!1514988 (= lt!656542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48730 a!2804) j!70) mask!2512) (select (arr!48730 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514989 () Bool)

(declare-fun e!845663 () Bool)

(assert (=> b!1514989 (= e!845667 e!845663)))

(declare-fun res!1033723 () Bool)

(assert (=> b!1514989 (=> (not res!1033723) (not e!845663))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12794)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12794)

(assert (=> b!1514989 (= res!1033723 (= (seekEntryOrOpen!0 (select (arr!48730 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48730 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514990 () Bool)

(declare-fun res!1033714 () Bool)

(assert (=> b!1514990 (=> (not res!1033714) (not e!845665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514990 (= res!1033714 (validKeyInArray!0 (select (arr!48730 a!2804) j!70)))))

(declare-fun b!1514991 () Bool)

(declare-fun res!1033718 () Bool)

(assert (=> b!1514991 (=> (not res!1033718) (not e!845662))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12794)

(assert (=> b!1514991 (= res!1033718 (= (seekEntry!0 (select (arr!48730 a!2804) j!70) a!2804 mask!2512) (Found!12794 j!70)))))

(declare-fun b!1514992 () Bool)

(assert (=> b!1514992 (= e!845666 (not true))))

(assert (=> b!1514992 e!845662))

(declare-fun res!1033717 () Bool)

(assert (=> b!1514992 (=> (not res!1033717) (not e!845662))))

(assert (=> b!1514992 (= res!1033717 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50491 0))(
  ( (Unit!50492) )
))
(declare-fun lt!656540 () Unit!50491)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50491)

(assert (=> b!1514992 (= lt!656540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514993 () Bool)

(declare-fun res!1033713 () Bool)

(assert (=> b!1514993 (=> (not res!1033713) (not e!845665))))

(declare-datatypes ((List!35200 0))(
  ( (Nil!35197) (Cons!35196 (h!36623 (_ BitVec 64)) (t!49886 List!35200)) )
))
(declare-fun arrayNoDuplicates!0 (array!100996 (_ BitVec 32) List!35200) Bool)

(assert (=> b!1514993 (= res!1033713 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35197))))

(declare-fun res!1033719 () Bool)

(assert (=> start!129326 (=> (not res!1033719) (not e!845665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129326 (= res!1033719 (validMask!0 mask!2512))))

(assert (=> start!129326 e!845665))

(assert (=> start!129326 true))

(declare-fun array_inv!38011 (array!100996) Bool)

(assert (=> start!129326 (array_inv!38011 a!2804)))

(declare-fun b!1514994 () Bool)

(declare-fun res!1033715 () Bool)

(assert (=> b!1514994 (=> (not res!1033715) (not e!845665))))

(assert (=> b!1514994 (= res!1033715 (and (= (size!49281 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49281 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49281 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514995 () Bool)

(assert (=> b!1514995 (= e!845663 (= (seekEntryOrOpen!0 lt!656538 lt!656541 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656538 lt!656541 mask!2512)))))

(declare-fun b!1514996 () Bool)

(declare-fun res!1033711 () Bool)

(assert (=> b!1514996 (=> (not res!1033711) (not e!845665))))

(assert (=> b!1514996 (= res!1033711 (validKeyInArray!0 (select (arr!48730 a!2804) i!961)))))

(declare-fun b!1514997 () Bool)

(declare-fun res!1033721 () Bool)

(assert (=> b!1514997 (=> (not res!1033721) (not e!845665))))

(assert (=> b!1514997 (= res!1033721 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49281 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49281 a!2804))))))

(declare-fun b!1514998 () Bool)

(declare-fun res!1033724 () Bool)

(assert (=> b!1514998 (=> (not res!1033724) (not e!845661))))

(assert (=> b!1514998 (= res!1033724 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48730 a!2804) j!70) a!2804 mask!2512) lt!656539))))

(assert (= (and start!129326 res!1033719) b!1514994))

(assert (= (and b!1514994 res!1033715) b!1514996))

(assert (= (and b!1514996 res!1033711) b!1514990))

(assert (= (and b!1514990 res!1033714) b!1514986))

(assert (= (and b!1514986 res!1033720) b!1514993))

(assert (= (and b!1514993 res!1033713) b!1514997))

(assert (= (and b!1514997 res!1033721) b!1514988))

(assert (= (and b!1514988 res!1033712) b!1514998))

(assert (= (and b!1514998 res!1033724) b!1514987))

(assert (= (and b!1514987 res!1033722) b!1514992))

(assert (= (and b!1514992 res!1033717) b!1514991))

(assert (= (and b!1514991 res!1033718) b!1514985))

(assert (= (and b!1514985 (not res!1033716)) b!1514989))

(assert (= (and b!1514989 res!1033723) b!1514995))

(declare-fun m!1397781 () Bool)

(assert (=> b!1514988 m!1397781))

(assert (=> b!1514988 m!1397781))

(declare-fun m!1397783 () Bool)

(assert (=> b!1514988 m!1397783))

(assert (=> b!1514988 m!1397783))

(assert (=> b!1514988 m!1397781))

(declare-fun m!1397785 () Bool)

(assert (=> b!1514988 m!1397785))

(assert (=> b!1514989 m!1397781))

(assert (=> b!1514989 m!1397781))

(declare-fun m!1397787 () Bool)

(assert (=> b!1514989 m!1397787))

(assert (=> b!1514989 m!1397781))

(declare-fun m!1397789 () Bool)

(assert (=> b!1514989 m!1397789))

(declare-fun m!1397791 () Bool)

(assert (=> b!1514992 m!1397791))

(declare-fun m!1397793 () Bool)

(assert (=> b!1514992 m!1397793))

(declare-fun m!1397795 () Bool)

(assert (=> b!1514986 m!1397795))

(declare-fun m!1397797 () Bool)

(assert (=> start!129326 m!1397797))

(declare-fun m!1397799 () Bool)

(assert (=> start!129326 m!1397799))

(declare-fun m!1397801 () Bool)

(assert (=> b!1514996 m!1397801))

(assert (=> b!1514996 m!1397801))

(declare-fun m!1397803 () Bool)

(assert (=> b!1514996 m!1397803))

(assert (=> b!1514991 m!1397781))

(assert (=> b!1514991 m!1397781))

(declare-fun m!1397805 () Bool)

(assert (=> b!1514991 m!1397805))

(assert (=> b!1514998 m!1397781))

(assert (=> b!1514998 m!1397781))

(declare-fun m!1397807 () Bool)

(assert (=> b!1514998 m!1397807))

(declare-fun m!1397809 () Bool)

(assert (=> b!1514987 m!1397809))

(assert (=> b!1514987 m!1397809))

(declare-fun m!1397811 () Bool)

(assert (=> b!1514987 m!1397811))

(declare-fun m!1397813 () Bool)

(assert (=> b!1514987 m!1397813))

(declare-fun m!1397815 () Bool)

(assert (=> b!1514987 m!1397815))

(assert (=> b!1514985 m!1397781))

(declare-fun m!1397817 () Bool)

(assert (=> b!1514985 m!1397817))

(declare-fun m!1397819 () Bool)

(assert (=> b!1514995 m!1397819))

(declare-fun m!1397821 () Bool)

(assert (=> b!1514995 m!1397821))

(assert (=> b!1514990 m!1397781))

(assert (=> b!1514990 m!1397781))

(declare-fun m!1397823 () Bool)

(assert (=> b!1514990 m!1397823))

(declare-fun m!1397825 () Bool)

(assert (=> b!1514993 m!1397825))

(check-sat (not b!1514991) (not b!1514993) (not b!1514992) (not b!1514996) (not b!1514986) (not b!1514995) (not b!1514990) (not b!1514988) (not b!1514989) (not start!129326) (not b!1514987) (not b!1514998))
(check-sat)
