; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128782 () Bool)

(assert start!128782)

(declare-fun res!1028895 () Bool)

(declare-fun e!842952 () Bool)

(assert (=> start!128782 (=> (not res!1028895) (not e!842952))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128782 (= res!1028895 (validMask!0 mask!2512))))

(assert (=> start!128782 e!842952))

(assert (=> start!128782 true))

(declare-datatypes ((array!100638 0))(
  ( (array!100639 (arr!48556 (Array (_ BitVec 32) (_ BitVec 64))) (size!49106 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100638)

(declare-fun array_inv!37584 (array!100638) Bool)

(assert (=> start!128782 (array_inv!37584 a!2804)))

(declare-fun b!1508985 () Bool)

(declare-fun e!842953 () Bool)

(assert (=> b!1508985 (= e!842953 false)))

(declare-datatypes ((SeekEntryResult!12727 0))(
  ( (MissingZero!12727 (index!53303 (_ BitVec 32))) (Found!12727 (index!53304 (_ BitVec 32))) (Intermediate!12727 (undefined!13539 Bool) (index!53305 (_ BitVec 32)) (x!135061 (_ BitVec 32))) (Undefined!12727) (MissingVacant!12727 (index!53306 (_ BitVec 32))) )
))
(declare-fun lt!654784 () SeekEntryResult!12727)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100638 (_ BitVec 32)) SeekEntryResult!12727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508985 (= lt!654784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48556 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48556 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100639 (store (arr!48556 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49106 a!2804)) mask!2512))))

(declare-fun b!1508986 () Bool)

(declare-fun res!1028889 () Bool)

(assert (=> b!1508986 (=> (not res!1028889) (not e!842952))))

(assert (=> b!1508986 (= res!1028889 (and (= (size!49106 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49106 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49106 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508987 () Bool)

(declare-fun res!1028891 () Bool)

(assert (=> b!1508987 (=> (not res!1028891) (not e!842952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100638 (_ BitVec 32)) Bool)

(assert (=> b!1508987 (= res!1028891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508988 () Bool)

(declare-fun res!1028890 () Bool)

(assert (=> b!1508988 (=> (not res!1028890) (not e!842952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508988 (= res!1028890 (validKeyInArray!0 (select (arr!48556 a!2804) i!961)))))

(declare-fun b!1508989 () Bool)

(assert (=> b!1508989 (= e!842952 e!842953)))

(declare-fun res!1028896 () Bool)

(assert (=> b!1508989 (=> (not res!1028896) (not e!842953))))

(declare-fun lt!654783 () SeekEntryResult!12727)

(assert (=> b!1508989 (= res!1028896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48556 a!2804) j!70) mask!2512) (select (arr!48556 a!2804) j!70) a!2804 mask!2512) lt!654783))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508989 (= lt!654783 (Intermediate!12727 false resIndex!21 resX!21))))

(declare-fun b!1508990 () Bool)

(declare-fun res!1028892 () Bool)

(assert (=> b!1508990 (=> (not res!1028892) (not e!842952))))

(declare-datatypes ((List!35039 0))(
  ( (Nil!35036) (Cons!35035 (h!36447 (_ BitVec 64)) (t!49733 List!35039)) )
))
(declare-fun arrayNoDuplicates!0 (array!100638 (_ BitVec 32) List!35039) Bool)

(assert (=> b!1508990 (= res!1028892 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35036))))

(declare-fun b!1508991 () Bool)

(declare-fun res!1028894 () Bool)

(assert (=> b!1508991 (=> (not res!1028894) (not e!842952))))

(assert (=> b!1508991 (= res!1028894 (validKeyInArray!0 (select (arr!48556 a!2804) j!70)))))

(declare-fun b!1508992 () Bool)

(declare-fun res!1028893 () Bool)

(assert (=> b!1508992 (=> (not res!1028893) (not e!842952))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508992 (= res!1028893 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49106 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49106 a!2804))))))

(declare-fun b!1508993 () Bool)

(declare-fun res!1028888 () Bool)

(assert (=> b!1508993 (=> (not res!1028888) (not e!842953))))

(assert (=> b!1508993 (= res!1028888 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48556 a!2804) j!70) a!2804 mask!2512) lt!654783))))

(assert (= (and start!128782 res!1028895) b!1508986))

(assert (= (and b!1508986 res!1028889) b!1508988))

(assert (= (and b!1508988 res!1028890) b!1508991))

(assert (= (and b!1508991 res!1028894) b!1508987))

(assert (= (and b!1508987 res!1028891) b!1508990))

(assert (= (and b!1508990 res!1028892) b!1508992))

(assert (= (and b!1508992 res!1028893) b!1508989))

(assert (= (and b!1508989 res!1028896) b!1508993))

(assert (= (and b!1508993 res!1028888) b!1508985))

(declare-fun m!1391413 () Bool)

(assert (=> b!1508988 m!1391413))

(assert (=> b!1508988 m!1391413))

(declare-fun m!1391415 () Bool)

(assert (=> b!1508988 m!1391415))

(declare-fun m!1391417 () Bool)

(assert (=> start!128782 m!1391417))

(declare-fun m!1391419 () Bool)

(assert (=> start!128782 m!1391419))

(declare-fun m!1391421 () Bool)

(assert (=> b!1508987 m!1391421))

(declare-fun m!1391423 () Bool)

(assert (=> b!1508985 m!1391423))

(declare-fun m!1391425 () Bool)

(assert (=> b!1508985 m!1391425))

(assert (=> b!1508985 m!1391425))

(declare-fun m!1391427 () Bool)

(assert (=> b!1508985 m!1391427))

(assert (=> b!1508985 m!1391427))

(assert (=> b!1508985 m!1391425))

(declare-fun m!1391429 () Bool)

(assert (=> b!1508985 m!1391429))

(declare-fun m!1391431 () Bool)

(assert (=> b!1508991 m!1391431))

(assert (=> b!1508991 m!1391431))

(declare-fun m!1391433 () Bool)

(assert (=> b!1508991 m!1391433))

(declare-fun m!1391435 () Bool)

(assert (=> b!1508990 m!1391435))

(assert (=> b!1508989 m!1391431))

(assert (=> b!1508989 m!1391431))

(declare-fun m!1391437 () Bool)

(assert (=> b!1508989 m!1391437))

(assert (=> b!1508989 m!1391437))

(assert (=> b!1508989 m!1391431))

(declare-fun m!1391439 () Bool)

(assert (=> b!1508989 m!1391439))

(assert (=> b!1508993 m!1391431))

(assert (=> b!1508993 m!1391431))

(declare-fun m!1391441 () Bool)

(assert (=> b!1508993 m!1391441))

(push 1)

(assert (not b!1508988))

