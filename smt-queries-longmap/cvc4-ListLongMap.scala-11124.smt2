; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130044 () Bool)

(assert start!130044)

(declare-fun b!1525810 () Bool)

(declare-fun res!1043844 () Bool)

(declare-fun e!850516 () Bool)

(assert (=> b!1525810 (=> (not res!1043844) (not e!850516))))

(declare-datatypes ((array!101457 0))(
  ( (array!101458 (arr!48955 (Array (_ BitVec 32) (_ BitVec 64))) (size!49505 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101457)

(declare-datatypes ((List!35438 0))(
  ( (Nil!35435) (Cons!35434 (h!36867 (_ BitVec 64)) (t!50132 List!35438)) )
))
(declare-fun arrayNoDuplicates!0 (array!101457 (_ BitVec 32) List!35438) Bool)

(assert (=> b!1525810 (= res!1043844 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35435))))

(declare-fun b!1525811 () Bool)

(declare-fun res!1043852 () Bool)

(assert (=> b!1525811 (=> (not res!1043852) (not e!850516))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525811 (= res!1043852 (validKeyInArray!0 (select (arr!48955 a!2804) i!961)))))

(declare-fun b!1525812 () Bool)

(declare-fun e!850519 () Bool)

(declare-fun e!850522 () Bool)

(assert (=> b!1525812 (= e!850519 e!850522)))

(declare-fun res!1043846 () Bool)

(assert (=> b!1525812 (=> (not res!1043846) (not e!850522))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13120 0))(
  ( (MissingZero!13120 (index!54875 (_ BitVec 32))) (Found!13120 (index!54876 (_ BitVec 32))) (Intermediate!13120 (undefined!13932 Bool) (index!54877 (_ BitVec 32)) (x!136574 (_ BitVec 32))) (Undefined!13120) (MissingVacant!13120 (index!54878 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101457 (_ BitVec 32)) SeekEntryResult!13120)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101457 (_ BitVec 32)) SeekEntryResult!13120)

(assert (=> b!1525812 (= res!1043846 (= (seekEntryOrOpen!0 (select (arr!48955 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48955 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525813 () Bool)

(declare-fun res!1043855 () Bool)

(declare-fun e!850521 () Bool)

(assert (=> b!1525813 (=> (not res!1043855) (not e!850521))))

(declare-fun lt!660850 () SeekEntryResult!13120)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101457 (_ BitVec 32)) SeekEntryResult!13120)

(assert (=> b!1525813 (= res!1043855 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48955 a!2804) j!70) a!2804 mask!2512) lt!660850))))

(declare-fun b!1525814 () Bool)

(declare-fun res!1043850 () Bool)

(assert (=> b!1525814 (=> (not res!1043850) (not e!850516))))

(assert (=> b!1525814 (= res!1043850 (validKeyInArray!0 (select (arr!48955 a!2804) j!70)))))

(declare-fun b!1525815 () Bool)

(declare-fun e!850520 () Bool)

(assert (=> b!1525815 (= e!850520 (not true))))

(declare-fun e!850517 () Bool)

(assert (=> b!1525815 e!850517))

(declare-fun res!1043847 () Bool)

(assert (=> b!1525815 (=> (not res!1043847) (not e!850517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101457 (_ BitVec 32)) Bool)

(assert (=> b!1525815 (= res!1043847 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51024 0))(
  ( (Unit!51025) )
))
(declare-fun lt!660851 () Unit!51024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51024)

(assert (=> b!1525815 (= lt!660851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1043853 () Bool)

(assert (=> start!130044 (=> (not res!1043853) (not e!850516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130044 (= res!1043853 (validMask!0 mask!2512))))

(assert (=> start!130044 e!850516))

(assert (=> start!130044 true))

(declare-fun array_inv!37983 (array!101457) Bool)

(assert (=> start!130044 (array_inv!37983 a!2804)))

(declare-fun b!1525816 () Bool)

(declare-fun res!1043851 () Bool)

(assert (=> b!1525816 (=> (not res!1043851) (not e!850516))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525816 (= res!1043851 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49505 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49505 a!2804))))))

(declare-fun lt!660849 () array!101457)

(declare-fun lt!660853 () (_ BitVec 64))

(declare-fun b!1525817 () Bool)

(assert (=> b!1525817 (= e!850522 (= (seekEntryOrOpen!0 lt!660853 lt!660849 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660853 lt!660849 mask!2512)))))

(declare-fun b!1525818 () Bool)

(assert (=> b!1525818 (= e!850516 e!850521)))

(declare-fun res!1043856 () Bool)

(assert (=> b!1525818 (=> (not res!1043856) (not e!850521))))

(declare-fun lt!660852 () SeekEntryResult!13120)

(assert (=> b!1525818 (= res!1043856 (= lt!660852 lt!660850))))

(assert (=> b!1525818 (= lt!660850 (Intermediate!13120 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525818 (= lt!660852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48955 a!2804) j!70) mask!2512) (select (arr!48955 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525819 () Bool)

(declare-fun res!1043857 () Bool)

(assert (=> b!1525819 (=> (not res!1043857) (not e!850517))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101457 (_ BitVec 32)) SeekEntryResult!13120)

(assert (=> b!1525819 (= res!1043857 (= (seekEntry!0 (select (arr!48955 a!2804) j!70) a!2804 mask!2512) (Found!13120 j!70)))))

(declare-fun b!1525820 () Bool)

(declare-fun res!1043845 () Bool)

(assert (=> b!1525820 (=> (not res!1043845) (not e!850516))))

(assert (=> b!1525820 (= res!1043845 (and (= (size!49505 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49505 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49505 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525821 () Bool)

(declare-fun res!1043849 () Bool)

(assert (=> b!1525821 (=> (not res!1043849) (not e!850516))))

(assert (=> b!1525821 (= res!1043849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525822 () Bool)

(assert (=> b!1525822 (= e!850521 e!850520)))

(declare-fun res!1043848 () Bool)

(assert (=> b!1525822 (=> (not res!1043848) (not e!850520))))

(assert (=> b!1525822 (= res!1043848 (= lt!660852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660853 mask!2512) lt!660853 lt!660849 mask!2512)))))

(assert (=> b!1525822 (= lt!660853 (select (store (arr!48955 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525822 (= lt!660849 (array!101458 (store (arr!48955 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49505 a!2804)))))

(declare-fun b!1525823 () Bool)

(assert (=> b!1525823 (= e!850517 e!850519)))

(declare-fun res!1043854 () Bool)

(assert (=> b!1525823 (=> res!1043854 e!850519)))

(assert (=> b!1525823 (= res!1043854 (or (not (= (select (arr!48955 a!2804) j!70) lt!660853)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48955 a!2804) index!487) (select (arr!48955 a!2804) j!70)) (not (= (select (arr!48955 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!130044 res!1043853) b!1525820))

(assert (= (and b!1525820 res!1043845) b!1525811))

(assert (= (and b!1525811 res!1043852) b!1525814))

(assert (= (and b!1525814 res!1043850) b!1525821))

(assert (= (and b!1525821 res!1043849) b!1525810))

(assert (= (and b!1525810 res!1043844) b!1525816))

(assert (= (and b!1525816 res!1043851) b!1525818))

(assert (= (and b!1525818 res!1043856) b!1525813))

(assert (= (and b!1525813 res!1043855) b!1525822))

(assert (= (and b!1525822 res!1043848) b!1525815))

(assert (= (and b!1525815 res!1043847) b!1525819))

(assert (= (and b!1525819 res!1043857) b!1525823))

(assert (= (and b!1525823 (not res!1043854)) b!1525812))

(assert (= (and b!1525812 res!1043846) b!1525817))

(declare-fun m!1408553 () Bool)

(assert (=> b!1525812 m!1408553))

(assert (=> b!1525812 m!1408553))

(declare-fun m!1408555 () Bool)

(assert (=> b!1525812 m!1408555))

(assert (=> b!1525812 m!1408553))

(declare-fun m!1408557 () Bool)

(assert (=> b!1525812 m!1408557))

(declare-fun m!1408559 () Bool)

(assert (=> b!1525815 m!1408559))

(declare-fun m!1408561 () Bool)

(assert (=> b!1525815 m!1408561))

(declare-fun m!1408563 () Bool)

(assert (=> b!1525821 m!1408563))

(declare-fun m!1408565 () Bool)

(assert (=> start!130044 m!1408565))

(declare-fun m!1408567 () Bool)

(assert (=> start!130044 m!1408567))

(declare-fun m!1408569 () Bool)

(assert (=> b!1525810 m!1408569))

(assert (=> b!1525814 m!1408553))

(assert (=> b!1525814 m!1408553))

(declare-fun m!1408571 () Bool)

(assert (=> b!1525814 m!1408571))

(declare-fun m!1408573 () Bool)

(assert (=> b!1525817 m!1408573))

(declare-fun m!1408575 () Bool)

(assert (=> b!1525817 m!1408575))

(assert (=> b!1525818 m!1408553))

(assert (=> b!1525818 m!1408553))

(declare-fun m!1408577 () Bool)

(assert (=> b!1525818 m!1408577))

(assert (=> b!1525818 m!1408577))

(assert (=> b!1525818 m!1408553))

(declare-fun m!1408579 () Bool)

(assert (=> b!1525818 m!1408579))

(assert (=> b!1525823 m!1408553))

(declare-fun m!1408581 () Bool)

(assert (=> b!1525823 m!1408581))

(declare-fun m!1408583 () Bool)

(assert (=> b!1525811 m!1408583))

(assert (=> b!1525811 m!1408583))

(declare-fun m!1408585 () Bool)

(assert (=> b!1525811 m!1408585))

(assert (=> b!1525813 m!1408553))

(assert (=> b!1525813 m!1408553))

(declare-fun m!1408587 () Bool)

(assert (=> b!1525813 m!1408587))

(assert (=> b!1525819 m!1408553))

(assert (=> b!1525819 m!1408553))

(declare-fun m!1408589 () Bool)

(assert (=> b!1525819 m!1408589))

(declare-fun m!1408591 () Bool)

(assert (=> b!1525822 m!1408591))

(assert (=> b!1525822 m!1408591))

(declare-fun m!1408593 () Bool)

(assert (=> b!1525822 m!1408593))

(declare-fun m!1408595 () Bool)

(assert (=> b!1525822 m!1408595))

(declare-fun m!1408597 () Bool)

(assert (=> b!1525822 m!1408597))

(push 1)

