; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129230 () Bool)

(assert start!129230)

(declare-fun b!1517914 () Bool)

(declare-fun e!846775 () Bool)

(declare-fun e!846778 () Bool)

(assert (=> b!1517914 (= e!846775 e!846778)))

(declare-fun res!1038035 () Bool)

(assert (=> b!1517914 (=> res!1038035 e!846778)))

(declare-fun lt!657805 () (_ BitVec 32))

(declare-datatypes ((array!101086 0))(
  ( (array!101087 (arr!48781 (Array (_ BitVec 32) (_ BitVec 64))) (size!49333 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101086)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517914 (= res!1038035 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657805 #b00000000000000000000000000000000) (bvsge lt!657805 (size!49333 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517914 (= lt!657805 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517915 () Bool)

(declare-fun res!1038024 () Bool)

(declare-fun e!846776 () Bool)

(assert (=> b!1517915 (=> (not res!1038024) (not e!846776))))

(declare-datatypes ((List!35342 0))(
  ( (Nil!35339) (Cons!35338 (h!36751 (_ BitVec 64)) (t!50028 List!35342)) )
))
(declare-fun arrayNoDuplicates!0 (array!101086 (_ BitVec 32) List!35342) Bool)

(assert (=> b!1517915 (= res!1038024 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35339))))

(declare-fun b!1517916 () Bool)

(declare-fun e!846777 () Bool)

(assert (=> b!1517916 (= e!846777 (not e!846775))))

(declare-fun res!1038032 () Bool)

(assert (=> b!1517916 (=> res!1038032 e!846775)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517916 (= res!1038032 (or (not (= (select (arr!48781 a!2804) j!70) (select (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846779 () Bool)

(assert (=> b!1517916 e!846779))

(declare-fun res!1038029 () Bool)

(assert (=> b!1517916 (=> (not res!1038029) (not e!846779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101086 (_ BitVec 32)) Bool)

(assert (=> b!1517916 (= res!1038029 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50657 0))(
  ( (Unit!50658) )
))
(declare-fun lt!657803 () Unit!50657)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50657)

(assert (=> b!1517916 (= lt!657803 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517917 () Bool)

(declare-datatypes ((SeekEntryResult!12975 0))(
  ( (MissingZero!12975 (index!54295 (_ BitVec 32))) (Found!12975 (index!54296 (_ BitVec 32))) (Intermediate!12975 (undefined!13787 Bool) (index!54297 (_ BitVec 32)) (x!135975 (_ BitVec 32))) (Undefined!12975) (MissingVacant!12975 (index!54298 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101086 (_ BitVec 32)) SeekEntryResult!12975)

(assert (=> b!1517917 (= e!846779 (= (seekEntry!0 (select (arr!48781 a!2804) j!70) a!2804 mask!2512) (Found!12975 j!70)))))

(declare-fun b!1517918 () Bool)

(assert (=> b!1517918 (= e!846776 e!846777)))

(declare-fun res!1038033 () Bool)

(assert (=> b!1517918 (=> (not res!1038033) (not e!846777))))

(declare-fun lt!657806 () SeekEntryResult!12975)

(declare-fun lt!657807 () SeekEntryResult!12975)

(assert (=> b!1517918 (= res!1038033 (= lt!657806 lt!657807))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517918 (= lt!657807 (Intermediate!12975 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101086 (_ BitVec 32)) SeekEntryResult!12975)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517918 (= lt!657806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48781 a!2804) j!70) mask!2512) (select (arr!48781 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517919 () Bool)

(declare-fun res!1038026 () Bool)

(assert (=> b!1517919 (=> (not res!1038026) (not e!846776))))

(assert (=> b!1517919 (= res!1038026 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49333 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49333 a!2804))))))

(declare-fun res!1038027 () Bool)

(assert (=> start!129230 (=> (not res!1038027) (not e!846776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129230 (= res!1038027 (validMask!0 mask!2512))))

(assert (=> start!129230 e!846776))

(assert (=> start!129230 true))

(declare-fun array_inv!38014 (array!101086) Bool)

(assert (=> start!129230 (array_inv!38014 a!2804)))

(declare-fun b!1517920 () Bool)

(declare-fun res!1038034 () Bool)

(assert (=> b!1517920 (=> (not res!1038034) (not e!846777))))

(assert (=> b!1517920 (= res!1038034 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48781 a!2804) j!70) a!2804 mask!2512) lt!657807))))

(declare-fun b!1517921 () Bool)

(assert (=> b!1517921 (= e!846778 true)))

(declare-fun lt!657804 () SeekEntryResult!12975)

(assert (=> b!1517921 (= lt!657804 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657805 (select (arr!48781 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517922 () Bool)

(declare-fun res!1038025 () Bool)

(assert (=> b!1517922 (=> (not res!1038025) (not e!846776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517922 (= res!1038025 (validKeyInArray!0 (select (arr!48781 a!2804) j!70)))))

(declare-fun b!1517923 () Bool)

(declare-fun res!1038031 () Bool)

(assert (=> b!1517923 (=> (not res!1038031) (not e!846776))))

(assert (=> b!1517923 (= res!1038031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517924 () Bool)

(declare-fun res!1038028 () Bool)

(assert (=> b!1517924 (=> (not res!1038028) (not e!846776))))

(assert (=> b!1517924 (= res!1038028 (validKeyInArray!0 (select (arr!48781 a!2804) i!961)))))

(declare-fun b!1517925 () Bool)

(declare-fun res!1038030 () Bool)

(assert (=> b!1517925 (=> (not res!1038030) (not e!846776))))

(assert (=> b!1517925 (= res!1038030 (and (= (size!49333 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49333 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49333 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517926 () Bool)

(declare-fun res!1038023 () Bool)

(assert (=> b!1517926 (=> (not res!1038023) (not e!846777))))

(assert (=> b!1517926 (= res!1038023 (= lt!657806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101087 (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49333 a!2804)) mask!2512)))))

(assert (= (and start!129230 res!1038027) b!1517925))

(assert (= (and b!1517925 res!1038030) b!1517924))

(assert (= (and b!1517924 res!1038028) b!1517922))

(assert (= (and b!1517922 res!1038025) b!1517923))

(assert (= (and b!1517923 res!1038031) b!1517915))

(assert (= (and b!1517915 res!1038024) b!1517919))

(assert (= (and b!1517919 res!1038026) b!1517918))

(assert (= (and b!1517918 res!1038033) b!1517920))

(assert (= (and b!1517920 res!1038034) b!1517926))

(assert (= (and b!1517926 res!1038023) b!1517916))

(assert (= (and b!1517916 res!1038029) b!1517917))

(assert (= (and b!1517916 (not res!1038032)) b!1517914))

(assert (= (and b!1517914 (not res!1038035)) b!1517921))

(declare-fun m!1400657 () Bool)

(assert (=> b!1517924 m!1400657))

(assert (=> b!1517924 m!1400657))

(declare-fun m!1400659 () Bool)

(assert (=> b!1517924 m!1400659))

(declare-fun m!1400661 () Bool)

(assert (=> b!1517915 m!1400661))

(declare-fun m!1400663 () Bool)

(assert (=> b!1517922 m!1400663))

(assert (=> b!1517922 m!1400663))

(declare-fun m!1400665 () Bool)

(assert (=> b!1517922 m!1400665))

(assert (=> b!1517916 m!1400663))

(declare-fun m!1400667 () Bool)

(assert (=> b!1517916 m!1400667))

(declare-fun m!1400669 () Bool)

(assert (=> b!1517916 m!1400669))

(declare-fun m!1400671 () Bool)

(assert (=> b!1517916 m!1400671))

(declare-fun m!1400673 () Bool)

(assert (=> b!1517916 m!1400673))

(assert (=> b!1517920 m!1400663))

(assert (=> b!1517920 m!1400663))

(declare-fun m!1400675 () Bool)

(assert (=> b!1517920 m!1400675))

(assert (=> b!1517926 m!1400669))

(assert (=> b!1517926 m!1400671))

(assert (=> b!1517926 m!1400671))

(declare-fun m!1400677 () Bool)

(assert (=> b!1517926 m!1400677))

(assert (=> b!1517926 m!1400677))

(assert (=> b!1517926 m!1400671))

(declare-fun m!1400679 () Bool)

(assert (=> b!1517926 m!1400679))

(assert (=> b!1517918 m!1400663))

(assert (=> b!1517918 m!1400663))

(declare-fun m!1400681 () Bool)

(assert (=> b!1517918 m!1400681))

(assert (=> b!1517918 m!1400681))

(assert (=> b!1517918 m!1400663))

(declare-fun m!1400683 () Bool)

(assert (=> b!1517918 m!1400683))

(assert (=> b!1517917 m!1400663))

(assert (=> b!1517917 m!1400663))

(declare-fun m!1400685 () Bool)

(assert (=> b!1517917 m!1400685))

(declare-fun m!1400687 () Bool)

(assert (=> b!1517914 m!1400687))

(declare-fun m!1400689 () Bool)

(assert (=> b!1517923 m!1400689))

(declare-fun m!1400691 () Bool)

(assert (=> start!129230 m!1400691))

(declare-fun m!1400693 () Bool)

(assert (=> start!129230 m!1400693))

(assert (=> b!1517921 m!1400663))

(assert (=> b!1517921 m!1400663))

(declare-fun m!1400695 () Bool)

(assert (=> b!1517921 m!1400695))

(check-sat (not b!1517918) (not b!1517923) (not b!1517922) (not b!1517915) (not b!1517916) (not start!129230) (not b!1517926) (not b!1517914) (not b!1517917) (not b!1517920) (not b!1517924) (not b!1517921))
(check-sat)
