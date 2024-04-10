; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128910 () Bool)

(assert start!128910)

(declare-fun b!1511005 () Bool)

(declare-fun res!1030911 () Bool)

(declare-fun e!843664 () Bool)

(assert (=> b!1511005 (=> (not res!1030911) (not e!843664))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100766 0))(
  ( (array!100767 (arr!48620 (Array (_ BitVec 32) (_ BitVec 64))) (size!49170 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100766)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511005 (= res!1030911 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49170 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49170 a!2804))))))

(declare-fun b!1511006 () Bool)

(declare-fun res!1030913 () Bool)

(assert (=> b!1511006 (=> (not res!1030913) (not e!843664))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511006 (= res!1030913 (validKeyInArray!0 (select (arr!48620 a!2804) i!961)))))

(declare-fun b!1511007 () Bool)

(declare-fun res!1030912 () Bool)

(assert (=> b!1511007 (=> (not res!1030912) (not e!843664))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100766 (_ BitVec 32)) Bool)

(assert (=> b!1511007 (= res!1030912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1030910 () Bool)

(assert (=> start!128910 (=> (not res!1030910) (not e!843664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128910 (= res!1030910 (validMask!0 mask!2512))))

(assert (=> start!128910 e!843664))

(assert (=> start!128910 true))

(declare-fun array_inv!37648 (array!100766) Bool)

(assert (=> start!128910 (array_inv!37648 a!2804)))

(declare-fun b!1511008 () Bool)

(declare-fun res!1030915 () Bool)

(assert (=> b!1511008 (=> (not res!1030915) (not e!843664))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1511008 (= res!1030915 (and (= (size!49170 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49170 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49170 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511009 () Bool)

(declare-fun res!1030914 () Bool)

(declare-fun e!843665 () Bool)

(assert (=> b!1511009 (=> (not res!1030914) (not e!843665))))

(declare-datatypes ((SeekEntryResult!12791 0))(
  ( (MissingZero!12791 (index!53559 (_ BitVec 32))) (Found!12791 (index!53560 (_ BitVec 32))) (Intermediate!12791 (undefined!13603 Bool) (index!53561 (_ BitVec 32)) (x!135301 (_ BitVec 32))) (Undefined!12791) (MissingVacant!12791 (index!53562 (_ BitVec 32))) )
))
(declare-fun lt!655322 () SeekEntryResult!12791)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100766 (_ BitVec 32)) SeekEntryResult!12791)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511009 (= res!1030914 (= lt!655322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48620 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48620 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100767 (store (arr!48620 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49170 a!2804)) mask!2512)))))

(declare-fun e!843666 () Bool)

(declare-fun b!1511010 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100766 (_ BitVec 32)) SeekEntryResult!12791)

(assert (=> b!1511010 (= e!843666 (= (seekEntry!0 (select (arr!48620 a!2804) j!70) a!2804 mask!2512) (Found!12791 j!70)))))

(declare-fun b!1511011 () Bool)

(assert (=> b!1511011 (= e!843665 (not true))))

(assert (=> b!1511011 e!843666))

(declare-fun res!1030918 () Bool)

(assert (=> b!1511011 (=> (not res!1030918) (not e!843666))))

(assert (=> b!1511011 (= res!1030918 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50450 0))(
  ( (Unit!50451) )
))
(declare-fun lt!655324 () Unit!50450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50450)

(assert (=> b!1511011 (= lt!655324 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511012 () Bool)

(declare-fun res!1030908 () Bool)

(assert (=> b!1511012 (=> (not res!1030908) (not e!843665))))

(declare-fun lt!655323 () SeekEntryResult!12791)

(assert (=> b!1511012 (= res!1030908 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48620 a!2804) j!70) a!2804 mask!2512) lt!655323))))

(declare-fun b!1511013 () Bool)

(declare-fun res!1030917 () Bool)

(assert (=> b!1511013 (=> (not res!1030917) (not e!843664))))

(assert (=> b!1511013 (= res!1030917 (validKeyInArray!0 (select (arr!48620 a!2804) j!70)))))

(declare-fun b!1511014 () Bool)

(assert (=> b!1511014 (= e!843664 e!843665)))

(declare-fun res!1030916 () Bool)

(assert (=> b!1511014 (=> (not res!1030916) (not e!843665))))

(assert (=> b!1511014 (= res!1030916 (= lt!655322 lt!655323))))

(assert (=> b!1511014 (= lt!655323 (Intermediate!12791 false resIndex!21 resX!21))))

(assert (=> b!1511014 (= lt!655322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48620 a!2804) j!70) mask!2512) (select (arr!48620 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511015 () Bool)

(declare-fun res!1030909 () Bool)

(assert (=> b!1511015 (=> (not res!1030909) (not e!843664))))

(declare-datatypes ((List!35103 0))(
  ( (Nil!35100) (Cons!35099 (h!36511 (_ BitVec 64)) (t!49797 List!35103)) )
))
(declare-fun arrayNoDuplicates!0 (array!100766 (_ BitVec 32) List!35103) Bool)

(assert (=> b!1511015 (= res!1030909 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35100))))

(assert (= (and start!128910 res!1030910) b!1511008))

(assert (= (and b!1511008 res!1030915) b!1511006))

(assert (= (and b!1511006 res!1030913) b!1511013))

(assert (= (and b!1511013 res!1030917) b!1511007))

(assert (= (and b!1511007 res!1030912) b!1511015))

(assert (= (and b!1511015 res!1030909) b!1511005))

(assert (= (and b!1511005 res!1030911) b!1511014))

(assert (= (and b!1511014 res!1030916) b!1511012))

(assert (= (and b!1511012 res!1030908) b!1511009))

(assert (= (and b!1511009 res!1030914) b!1511011))

(assert (= (and b!1511011 res!1030918) b!1511010))

(declare-fun m!1393657 () Bool)

(assert (=> b!1511014 m!1393657))

(assert (=> b!1511014 m!1393657))

(declare-fun m!1393659 () Bool)

(assert (=> b!1511014 m!1393659))

(assert (=> b!1511014 m!1393659))

(assert (=> b!1511014 m!1393657))

(declare-fun m!1393661 () Bool)

(assert (=> b!1511014 m!1393661))

(declare-fun m!1393663 () Bool)

(assert (=> b!1511006 m!1393663))

(assert (=> b!1511006 m!1393663))

(declare-fun m!1393665 () Bool)

(assert (=> b!1511006 m!1393665))

(assert (=> b!1511013 m!1393657))

(assert (=> b!1511013 m!1393657))

(declare-fun m!1393667 () Bool)

(assert (=> b!1511013 m!1393667))

(declare-fun m!1393669 () Bool)

(assert (=> b!1511009 m!1393669))

(declare-fun m!1393671 () Bool)

(assert (=> b!1511009 m!1393671))

(assert (=> b!1511009 m!1393671))

(declare-fun m!1393673 () Bool)

(assert (=> b!1511009 m!1393673))

(assert (=> b!1511009 m!1393673))

(assert (=> b!1511009 m!1393671))

(declare-fun m!1393675 () Bool)

(assert (=> b!1511009 m!1393675))

(assert (=> b!1511010 m!1393657))

(assert (=> b!1511010 m!1393657))

(declare-fun m!1393677 () Bool)

(assert (=> b!1511010 m!1393677))

(declare-fun m!1393679 () Bool)

(assert (=> b!1511011 m!1393679))

(declare-fun m!1393681 () Bool)

(assert (=> b!1511011 m!1393681))

(declare-fun m!1393683 () Bool)

(assert (=> b!1511015 m!1393683))

(declare-fun m!1393685 () Bool)

(assert (=> start!128910 m!1393685))

(declare-fun m!1393687 () Bool)

(assert (=> start!128910 m!1393687))

(declare-fun m!1393689 () Bool)

(assert (=> b!1511007 m!1393689))

(assert (=> b!1511012 m!1393657))

(assert (=> b!1511012 m!1393657))

(declare-fun m!1393691 () Bool)

(assert (=> b!1511012 m!1393691))

(push 1)

