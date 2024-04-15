; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129056 () Bool)

(assert start!129056)

(declare-fun b!1514577 () Bool)

(declare-fun e!845198 () Bool)

(declare-fun e!845195 () Bool)

(assert (=> b!1514577 (= e!845198 e!845195)))

(declare-fun res!1034693 () Bool)

(assert (=> b!1514577 (=> res!1034693 e!845195)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!656213 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100912 0))(
  ( (array!100913 (arr!48694 (Array (_ BitVec 32) (_ BitVec 64))) (size!49246 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100912)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514577 (= res!1034693 (or (not (= (select (arr!48694 a!2804) j!70) lt!656213)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48694 a!2804) index!487) (select (arr!48694 a!2804) j!70)) (not (= (select (arr!48694 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514578 () Bool)

(declare-fun e!845199 () Bool)

(declare-fun e!845193 () Bool)

(assert (=> b!1514578 (= e!845199 e!845193)))

(declare-fun res!1034691 () Bool)

(assert (=> b!1514578 (=> (not res!1034691) (not e!845193))))

(declare-fun lt!656212 () array!100912)

(declare-datatypes ((SeekEntryResult!12888 0))(
  ( (MissingZero!12888 (index!53947 (_ BitVec 32))) (Found!12888 (index!53948 (_ BitVec 32))) (Intermediate!12888 (undefined!13700 Bool) (index!53949 (_ BitVec 32)) (x!135656 (_ BitVec 32))) (Undefined!12888) (MissingVacant!12888 (index!53950 (_ BitVec 32))) )
))
(declare-fun lt!656211 () SeekEntryResult!12888)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12888)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514578 (= res!1034691 (= lt!656211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656213 mask!2512) lt!656213 lt!656212 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514578 (= lt!656213 (select (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514578 (= lt!656212 (array!100913 (store (arr!48694 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49246 a!2804)))))

(declare-fun b!1514579 () Bool)

(declare-fun res!1034686 () Bool)

(assert (=> b!1514579 (=> (not res!1034686) (not e!845198))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12888)

(assert (=> b!1514579 (= res!1034686 (= (seekEntry!0 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) (Found!12888 j!70)))))

(declare-fun b!1514580 () Bool)

(declare-fun res!1034690 () Bool)

(declare-fun e!845197 () Bool)

(assert (=> b!1514580 (=> (not res!1034690) (not e!845197))))

(declare-datatypes ((List!35255 0))(
  ( (Nil!35252) (Cons!35251 (h!36664 (_ BitVec 64)) (t!49941 List!35255)) )
))
(declare-fun arrayNoDuplicates!0 (array!100912 (_ BitVec 32) List!35255) Bool)

(assert (=> b!1514580 (= res!1034690 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35252))))

(declare-fun b!1514581 () Bool)

(declare-fun res!1034695 () Bool)

(assert (=> b!1514581 (=> (not res!1034695) (not e!845197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100912 (_ BitVec 32)) Bool)

(assert (=> b!1514581 (= res!1034695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514582 () Bool)

(declare-fun e!845194 () Bool)

(assert (=> b!1514582 (= e!845195 e!845194)))

(declare-fun res!1034692 () Bool)

(assert (=> b!1514582 (=> (not res!1034692) (not e!845194))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12888)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12888)

(assert (=> b!1514582 (= res!1034692 (= (seekEntryOrOpen!0 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48694 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514583 () Bool)

(declare-fun res!1034697 () Bool)

(assert (=> b!1514583 (=> (not res!1034697) (not e!845199))))

(declare-fun lt!656214 () SeekEntryResult!12888)

(assert (=> b!1514583 (= res!1034697 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48694 a!2804) j!70) a!2804 mask!2512) lt!656214))))

(declare-fun b!1514584 () Bool)

(declare-fun res!1034687 () Bool)

(assert (=> b!1514584 (=> (not res!1034687) (not e!845197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514584 (= res!1034687 (validKeyInArray!0 (select (arr!48694 a!2804) j!70)))))

(declare-fun b!1514585 () Bool)

(assert (=> b!1514585 (= e!845197 e!845199)))

(declare-fun res!1034698 () Bool)

(assert (=> b!1514585 (=> (not res!1034698) (not e!845199))))

(assert (=> b!1514585 (= res!1034698 (= lt!656211 lt!656214))))

(assert (=> b!1514585 (= lt!656214 (Intermediate!12888 false resIndex!21 resX!21))))

(assert (=> b!1514585 (= lt!656211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48694 a!2804) j!70) mask!2512) (select (arr!48694 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514587 () Bool)

(declare-fun res!1034696 () Bool)

(assert (=> b!1514587 (=> (not res!1034696) (not e!845197))))

(assert (=> b!1514587 (= res!1034696 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49246 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49246 a!2804))))))

(declare-fun b!1514588 () Bool)

(assert (=> b!1514588 (= e!845194 (= (seekEntryOrOpen!0 lt!656213 lt!656212 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656213 lt!656212 mask!2512)))))

(declare-fun b!1514589 () Bool)

(declare-fun res!1034689 () Bool)

(assert (=> b!1514589 (=> (not res!1034689) (not e!845197))))

(assert (=> b!1514589 (= res!1034689 (validKeyInArray!0 (select (arr!48694 a!2804) i!961)))))

(declare-fun b!1514590 () Bool)

(declare-fun res!1034699 () Bool)

(assert (=> b!1514590 (=> (not res!1034699) (not e!845197))))

(assert (=> b!1514590 (= res!1034699 (and (= (size!49246 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49246 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49246 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1034688 () Bool)

(assert (=> start!129056 (=> (not res!1034688) (not e!845197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129056 (= res!1034688 (validMask!0 mask!2512))))

(assert (=> start!129056 e!845197))

(assert (=> start!129056 true))

(declare-fun array_inv!37927 (array!100912) Bool)

(assert (=> start!129056 (array_inv!37927 a!2804)))

(declare-fun b!1514586 () Bool)

(assert (=> b!1514586 (= e!845193 (not true))))

(assert (=> b!1514586 e!845198))

(declare-fun res!1034694 () Bool)

(assert (=> b!1514586 (=> (not res!1034694) (not e!845198))))

(assert (=> b!1514586 (= res!1034694 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50483 0))(
  ( (Unit!50484) )
))
(declare-fun lt!656210 () Unit!50483)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50483)

(assert (=> b!1514586 (= lt!656210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129056 res!1034688) b!1514590))

(assert (= (and b!1514590 res!1034699) b!1514589))

(assert (= (and b!1514589 res!1034689) b!1514584))

(assert (= (and b!1514584 res!1034687) b!1514581))

(assert (= (and b!1514581 res!1034695) b!1514580))

(assert (= (and b!1514580 res!1034690) b!1514587))

(assert (= (and b!1514587 res!1034696) b!1514585))

(assert (= (and b!1514585 res!1034698) b!1514583))

(assert (= (and b!1514583 res!1034697) b!1514578))

(assert (= (and b!1514578 res!1034691) b!1514586))

(assert (= (and b!1514586 res!1034694) b!1514579))

(assert (= (and b!1514579 res!1034686) b!1514577))

(assert (= (and b!1514577 (not res!1034693)) b!1514582))

(assert (= (and b!1514582 res!1034692) b!1514588))

(declare-fun m!1397009 () Bool)

(assert (=> b!1514584 m!1397009))

(assert (=> b!1514584 m!1397009))

(declare-fun m!1397011 () Bool)

(assert (=> b!1514584 m!1397011))

(declare-fun m!1397013 () Bool)

(assert (=> b!1514580 m!1397013))

(assert (=> b!1514582 m!1397009))

(assert (=> b!1514582 m!1397009))

(declare-fun m!1397015 () Bool)

(assert (=> b!1514582 m!1397015))

(assert (=> b!1514582 m!1397009))

(declare-fun m!1397017 () Bool)

(assert (=> b!1514582 m!1397017))

(declare-fun m!1397019 () Bool)

(assert (=> b!1514588 m!1397019))

(declare-fun m!1397021 () Bool)

(assert (=> b!1514588 m!1397021))

(declare-fun m!1397023 () Bool)

(assert (=> b!1514589 m!1397023))

(assert (=> b!1514589 m!1397023))

(declare-fun m!1397025 () Bool)

(assert (=> b!1514589 m!1397025))

(declare-fun m!1397027 () Bool)

(assert (=> b!1514581 m!1397027))

(assert (=> b!1514577 m!1397009))

(declare-fun m!1397029 () Bool)

(assert (=> b!1514577 m!1397029))

(declare-fun m!1397031 () Bool)

(assert (=> b!1514578 m!1397031))

(assert (=> b!1514578 m!1397031))

(declare-fun m!1397033 () Bool)

(assert (=> b!1514578 m!1397033))

(declare-fun m!1397035 () Bool)

(assert (=> b!1514578 m!1397035))

(declare-fun m!1397037 () Bool)

(assert (=> b!1514578 m!1397037))

(declare-fun m!1397039 () Bool)

(assert (=> b!1514586 m!1397039))

(declare-fun m!1397041 () Bool)

(assert (=> b!1514586 m!1397041))

(assert (=> b!1514583 m!1397009))

(assert (=> b!1514583 m!1397009))

(declare-fun m!1397043 () Bool)

(assert (=> b!1514583 m!1397043))

(assert (=> b!1514579 m!1397009))

(assert (=> b!1514579 m!1397009))

(declare-fun m!1397045 () Bool)

(assert (=> b!1514579 m!1397045))

(declare-fun m!1397047 () Bool)

(assert (=> start!129056 m!1397047))

(declare-fun m!1397049 () Bool)

(assert (=> start!129056 m!1397049))

(assert (=> b!1514585 m!1397009))

(assert (=> b!1514585 m!1397009))

(declare-fun m!1397051 () Bool)

(assert (=> b!1514585 m!1397051))

(assert (=> b!1514585 m!1397051))

(assert (=> b!1514585 m!1397009))

(declare-fun m!1397053 () Bool)

(assert (=> b!1514585 m!1397053))

(check-sat (not b!1514584) (not b!1514586) (not b!1514585) (not b!1514580) (not b!1514589) (not start!129056) (not b!1514578) (not b!1514588) (not b!1514582) (not b!1514579) (not b!1514583) (not b!1514581))
(check-sat)
