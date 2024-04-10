; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128774 () Bool)

(assert start!128774)

(declare-fun b!1508873 () Bool)

(declare-fun res!1028780 () Bool)

(declare-fun e!842913 () Bool)

(assert (=> b!1508873 (=> (not res!1028780) (not e!842913))))

(declare-datatypes ((array!100630 0))(
  ( (array!100631 (arr!48552 (Array (_ BitVec 32) (_ BitVec 64))) (size!49102 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100630)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508873 (= res!1028780 (validKeyInArray!0 (select (arr!48552 a!2804) i!961)))))

(declare-fun b!1508874 () Bool)

(declare-fun res!1028781 () Bool)

(assert (=> b!1508874 (=> (not res!1028781) (not e!842913))))

(declare-datatypes ((List!35035 0))(
  ( (Nil!35032) (Cons!35031 (h!36443 (_ BitVec 64)) (t!49729 List!35035)) )
))
(declare-fun arrayNoDuplicates!0 (array!100630 (_ BitVec 32) List!35035) Bool)

(assert (=> b!1508874 (= res!1028781 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35032))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1508875 () Bool)

(declare-fun e!842914 () Bool)

(assert (=> b!1508875 (= e!842914 (not (validKeyInArray!0 (select (store (arr!48552 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(declare-fun b!1508876 () Bool)

(declare-fun res!1028778 () Bool)

(declare-fun e!842912 () Bool)

(assert (=> b!1508876 (=> (not res!1028778) (not e!842912))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12723 0))(
  ( (MissingZero!12723 (index!53287 (_ BitVec 32))) (Found!12723 (index!53288 (_ BitVec 32))) (Intermediate!12723 (undefined!13535 Bool) (index!53289 (_ BitVec 32)) (x!135049 (_ BitVec 32))) (Undefined!12723) (MissingVacant!12723 (index!53290 (_ BitVec 32))) )
))
(declare-fun lt!654760 () SeekEntryResult!12723)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100630 (_ BitVec 32)) SeekEntryResult!12723)

(assert (=> b!1508876 (= res!1028778 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48552 a!2804) j!70) a!2804 mask!2512) lt!654760))))

(declare-fun res!1028785 () Bool)

(assert (=> start!128774 (=> (not res!1028785) (not e!842913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128774 (= res!1028785 (validMask!0 mask!2512))))

(assert (=> start!128774 e!842913))

(assert (=> start!128774 true))

(declare-fun array_inv!37580 (array!100630) Bool)

(assert (=> start!128774 (array_inv!37580 a!2804)))

(declare-fun b!1508877 () Bool)

(declare-fun res!1028779 () Bool)

(assert (=> b!1508877 (=> (not res!1028779) (not e!842913))))

(assert (=> b!1508877 (= res!1028779 (and (= (size!49102 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49102 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49102 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508878 () Bool)

(declare-fun res!1028782 () Bool)

(assert (=> b!1508878 (=> (not res!1028782) (not e!842913))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508878 (= res!1028782 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49102 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49102 a!2804))))))

(declare-fun b!1508879 () Bool)

(declare-fun res!1028783 () Bool)

(assert (=> b!1508879 (=> (not res!1028783) (not e!842913))))

(assert (=> b!1508879 (= res!1028783 (validKeyInArray!0 (select (arr!48552 a!2804) j!70)))))

(declare-fun b!1508880 () Bool)

(declare-fun res!1028776 () Bool)

(assert (=> b!1508880 (=> (not res!1028776) (not e!842913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100630 (_ BitVec 32)) Bool)

(assert (=> b!1508880 (= res!1028776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508881 () Bool)

(assert (=> b!1508881 (= e!842913 e!842912)))

(declare-fun res!1028777 () Bool)

(assert (=> b!1508881 (=> (not res!1028777) (not e!842912))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508881 (= res!1028777 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48552 a!2804) j!70) mask!2512) (select (arr!48552 a!2804) j!70) a!2804 mask!2512) lt!654760))))

(assert (=> b!1508881 (= lt!654760 (Intermediate!12723 false resIndex!21 resX!21))))

(declare-fun b!1508882 () Bool)

(assert (=> b!1508882 (= e!842912 e!842914)))

(declare-fun res!1028784 () Bool)

(assert (=> b!1508882 (=> (not res!1028784) (not e!842914))))

(declare-fun lt!654759 () (_ BitVec 32))

(assert (=> b!1508882 (= res!1028784 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge lt!654759 #b00000000000000000000000000000000) (bvslt lt!654759 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(assert (=> b!1508882 (= lt!654759 (toIndex!0 (select (store (arr!48552 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(assert (= (and start!128774 res!1028785) b!1508877))

(assert (= (and b!1508877 res!1028779) b!1508873))

(assert (= (and b!1508873 res!1028780) b!1508879))

(assert (= (and b!1508879 res!1028783) b!1508880))

(assert (= (and b!1508880 res!1028776) b!1508874))

(assert (= (and b!1508874 res!1028781) b!1508878))

(assert (= (and b!1508878 res!1028782) b!1508881))

(assert (= (and b!1508881 res!1028777) b!1508876))

(assert (= (and b!1508876 res!1028778) b!1508882))

(assert (= (and b!1508882 res!1028784) b!1508875))

(declare-fun m!1391293 () Bool)

(assert (=> start!128774 m!1391293))

(declare-fun m!1391295 () Bool)

(assert (=> start!128774 m!1391295))

(declare-fun m!1391297 () Bool)

(assert (=> b!1508882 m!1391297))

(declare-fun m!1391299 () Bool)

(assert (=> b!1508882 m!1391299))

(assert (=> b!1508882 m!1391299))

(declare-fun m!1391301 () Bool)

(assert (=> b!1508882 m!1391301))

(declare-fun m!1391303 () Bool)

(assert (=> b!1508873 m!1391303))

(assert (=> b!1508873 m!1391303))

(declare-fun m!1391305 () Bool)

(assert (=> b!1508873 m!1391305))

(declare-fun m!1391307 () Bool)

(assert (=> b!1508879 m!1391307))

(assert (=> b!1508879 m!1391307))

(declare-fun m!1391309 () Bool)

(assert (=> b!1508879 m!1391309))

(declare-fun m!1391311 () Bool)

(assert (=> b!1508880 m!1391311))

(assert (=> b!1508876 m!1391307))

(assert (=> b!1508876 m!1391307))

(declare-fun m!1391313 () Bool)

(assert (=> b!1508876 m!1391313))

(assert (=> b!1508875 m!1391297))

(assert (=> b!1508875 m!1391299))

(assert (=> b!1508875 m!1391299))

(declare-fun m!1391315 () Bool)

(assert (=> b!1508875 m!1391315))

(assert (=> b!1508881 m!1391307))

(assert (=> b!1508881 m!1391307))

(declare-fun m!1391317 () Bool)

(assert (=> b!1508881 m!1391317))

(assert (=> b!1508881 m!1391317))

(assert (=> b!1508881 m!1391307))

(declare-fun m!1391319 () Bool)

(assert (=> b!1508881 m!1391319))

(declare-fun m!1391321 () Bool)

(assert (=> b!1508874 m!1391321))

(check-sat (not start!128774) (not b!1508879) (not b!1508876) (not b!1508875) (not b!1508873) (not b!1508880) (not b!1508882) (not b!1508881) (not b!1508874))
(check-sat)
