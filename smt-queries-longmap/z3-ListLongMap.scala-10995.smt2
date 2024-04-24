; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129104 () Bool)

(assert start!129104)

(declare-fun b!1511087 () Bool)

(declare-fun e!844177 () Bool)

(declare-fun e!844178 () Bool)

(assert (=> b!1511087 (= e!844177 e!844178)))

(declare-fun res!1029813 () Bool)

(assert (=> b!1511087 (=> (not res!1029813) (not e!844178))))

(declare-datatypes ((SeekEntryResult!12683 0))(
  ( (MissingZero!12683 (index!53127 (_ BitVec 32))) (Found!12683 (index!53128 (_ BitVec 32))) (Intermediate!12683 (undefined!13495 Bool) (index!53129 (_ BitVec 32)) (x!135086 (_ BitVec 32))) (Undefined!12683) (MissingVacant!12683 (index!53130 (_ BitVec 32))) )
))
(declare-fun lt!655506 () SeekEntryResult!12683)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100774 0))(
  ( (array!100775 (arr!48619 (Array (_ BitVec 32) (_ BitVec 64))) (size!49170 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100774)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100774 (_ BitVec 32)) SeekEntryResult!12683)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511087 (= res!1029813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48619 a!2804) j!70) mask!2512) (select (arr!48619 a!2804) j!70) a!2804 mask!2512) lt!655506))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511087 (= lt!655506 (Intermediate!12683 false resIndex!21 resX!21))))

(declare-fun b!1511088 () Bool)

(declare-fun res!1029820 () Bool)

(assert (=> b!1511088 (=> (not res!1029820) (not e!844177))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511088 (= res!1029820 (and (= (size!49170 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49170 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49170 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511090 () Bool)

(declare-fun res!1029821 () Bool)

(assert (=> b!1511090 (=> (not res!1029821) (not e!844177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511090 (= res!1029821 (validKeyInArray!0 (select (arr!48619 a!2804) i!961)))))

(declare-fun b!1511091 () Bool)

(declare-fun res!1029814 () Bool)

(assert (=> b!1511091 (=> (not res!1029814) (not e!844177))))

(assert (=> b!1511091 (= res!1029814 (validKeyInArray!0 (select (arr!48619 a!2804) j!70)))))

(declare-fun b!1511092 () Bool)

(declare-fun res!1029819 () Bool)

(assert (=> b!1511092 (=> (not res!1029819) (not e!844177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100774 (_ BitVec 32)) Bool)

(assert (=> b!1511092 (= res!1029819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511093 () Bool)

(assert (=> b!1511093 (= e!844178 false)))

(declare-fun lt!655507 () SeekEntryResult!12683)

(assert (=> b!1511093 (= lt!655507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100775 (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49170 a!2804)) mask!2512))))

(declare-fun b!1511094 () Bool)

(declare-fun res!1029817 () Bool)

(assert (=> b!1511094 (=> (not res!1029817) (not e!844177))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1511094 (= res!1029817 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49170 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49170 a!2804))))))

(declare-fun b!1511095 () Bool)

(declare-fun res!1029816 () Bool)

(assert (=> b!1511095 (=> (not res!1029816) (not e!844178))))

(assert (=> b!1511095 (= res!1029816 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48619 a!2804) j!70) a!2804 mask!2512) lt!655506))))

(declare-fun res!1029815 () Bool)

(assert (=> start!129104 (=> (not res!1029815) (not e!844177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129104 (= res!1029815 (validMask!0 mask!2512))))

(assert (=> start!129104 e!844177))

(assert (=> start!129104 true))

(declare-fun array_inv!37900 (array!100774) Bool)

(assert (=> start!129104 (array_inv!37900 a!2804)))

(declare-fun b!1511089 () Bool)

(declare-fun res!1029818 () Bool)

(assert (=> b!1511089 (=> (not res!1029818) (not e!844177))))

(declare-datatypes ((List!35089 0))(
  ( (Nil!35086) (Cons!35085 (h!36512 (_ BitVec 64)) (t!49775 List!35089)) )
))
(declare-fun arrayNoDuplicates!0 (array!100774 (_ BitVec 32) List!35089) Bool)

(assert (=> b!1511089 (= res!1029818 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35086))))

(assert (= (and start!129104 res!1029815) b!1511088))

(assert (= (and b!1511088 res!1029820) b!1511090))

(assert (= (and b!1511090 res!1029821) b!1511091))

(assert (= (and b!1511091 res!1029814) b!1511092))

(assert (= (and b!1511092 res!1029819) b!1511089))

(assert (= (and b!1511089 res!1029818) b!1511094))

(assert (= (and b!1511094 res!1029817) b!1511087))

(assert (= (and b!1511087 res!1029813) b!1511095))

(assert (= (and b!1511095 res!1029816) b!1511093))

(declare-fun m!1393509 () Bool)

(assert (=> b!1511091 m!1393509))

(assert (=> b!1511091 m!1393509))

(declare-fun m!1393511 () Bool)

(assert (=> b!1511091 m!1393511))

(declare-fun m!1393513 () Bool)

(assert (=> b!1511093 m!1393513))

(declare-fun m!1393515 () Bool)

(assert (=> b!1511093 m!1393515))

(assert (=> b!1511093 m!1393515))

(declare-fun m!1393517 () Bool)

(assert (=> b!1511093 m!1393517))

(assert (=> b!1511093 m!1393517))

(assert (=> b!1511093 m!1393515))

(declare-fun m!1393519 () Bool)

(assert (=> b!1511093 m!1393519))

(declare-fun m!1393521 () Bool)

(assert (=> start!129104 m!1393521))

(declare-fun m!1393523 () Bool)

(assert (=> start!129104 m!1393523))

(assert (=> b!1511087 m!1393509))

(assert (=> b!1511087 m!1393509))

(declare-fun m!1393525 () Bool)

(assert (=> b!1511087 m!1393525))

(assert (=> b!1511087 m!1393525))

(assert (=> b!1511087 m!1393509))

(declare-fun m!1393527 () Bool)

(assert (=> b!1511087 m!1393527))

(declare-fun m!1393529 () Bool)

(assert (=> b!1511092 m!1393529))

(assert (=> b!1511095 m!1393509))

(assert (=> b!1511095 m!1393509))

(declare-fun m!1393531 () Bool)

(assert (=> b!1511095 m!1393531))

(declare-fun m!1393533 () Bool)

(assert (=> b!1511089 m!1393533))

(declare-fun m!1393535 () Bool)

(assert (=> b!1511090 m!1393535))

(assert (=> b!1511090 m!1393535))

(declare-fun m!1393537 () Bool)

(assert (=> b!1511090 m!1393537))

(check-sat (not b!1511087) (not b!1511095) (not b!1511093) (not b!1511092) (not b!1511091) (not b!1511089) (not b!1511090) (not start!129104))
(check-sat)
