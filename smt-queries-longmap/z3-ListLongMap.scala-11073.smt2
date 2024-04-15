; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129218 () Bool)

(assert start!129218)

(declare-fun b!1517680 () Bool)

(declare-fun res!1037792 () Bool)

(declare-fun e!846668 () Bool)

(assert (=> b!1517680 (=> (not res!1037792) (not e!846668))))

(declare-datatypes ((array!101074 0))(
  ( (array!101075 (arr!48775 (Array (_ BitVec 32) (_ BitVec 64))) (size!49327 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101074)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101074 (_ BitVec 32)) Bool)

(assert (=> b!1517680 (= res!1037792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517681 () Bool)

(declare-fun res!1037800 () Bool)

(assert (=> b!1517681 (=> (not res!1037800) (not e!846668))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517681 (= res!1037800 (validKeyInArray!0 (select (arr!48775 a!2804) i!961)))))

(declare-fun b!1517682 () Bool)

(declare-fun res!1037793 () Bool)

(assert (=> b!1517682 (=> (not res!1037793) (not e!846668))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1517682 (= res!1037793 (validKeyInArray!0 (select (arr!48775 a!2804) j!70)))))

(declare-fun b!1517683 () Bool)

(declare-fun res!1037795 () Bool)

(assert (=> b!1517683 (=> (not res!1037795) (not e!846668))))

(assert (=> b!1517683 (= res!1037795 (and (= (size!49327 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49327 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49327 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517685 () Bool)

(declare-fun e!846672 () Bool)

(declare-fun e!846671 () Bool)

(assert (=> b!1517685 (= e!846672 (not e!846671))))

(declare-fun res!1037794 () Bool)

(assert (=> b!1517685 (=> res!1037794 e!846671)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517685 (= res!1037794 (or (not (= (select (arr!48775 a!2804) j!70) (select (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846669 () Bool)

(assert (=> b!1517685 e!846669))

(declare-fun res!1037801 () Bool)

(assert (=> b!1517685 (=> (not res!1037801) (not e!846669))))

(assert (=> b!1517685 (= res!1037801 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50645 0))(
  ( (Unit!50646) )
))
(declare-fun lt!657714 () Unit!50645)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50645)

(assert (=> b!1517685 (= lt!657714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517686 () Bool)

(declare-fun res!1037790 () Bool)

(assert (=> b!1517686 (=> (not res!1037790) (not e!846672))))

(declare-datatypes ((SeekEntryResult!12969 0))(
  ( (MissingZero!12969 (index!54271 (_ BitVec 32))) (Found!12969 (index!54272 (_ BitVec 32))) (Intermediate!12969 (undefined!13781 Bool) (index!54273 (_ BitVec 32)) (x!135953 (_ BitVec 32))) (Undefined!12969) (MissingVacant!12969 (index!54274 (_ BitVec 32))) )
))
(declare-fun lt!657713 () SeekEntryResult!12969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101074 (_ BitVec 32)) SeekEntryResult!12969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517686 (= res!1037790 (= lt!657713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101075 (store (arr!48775 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49327 a!2804)) mask!2512)))))

(declare-fun b!1517687 () Bool)

(declare-fun res!1037796 () Bool)

(assert (=> b!1517687 (=> (not res!1037796) (not e!846668))))

(declare-datatypes ((List!35336 0))(
  ( (Nil!35333) (Cons!35332 (h!36745 (_ BitVec 64)) (t!50022 List!35336)) )
))
(declare-fun arrayNoDuplicates!0 (array!101074 (_ BitVec 32) List!35336) Bool)

(assert (=> b!1517687 (= res!1037796 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35333))))

(declare-fun b!1517688 () Bool)

(declare-fun res!1037797 () Bool)

(assert (=> b!1517688 (=> (not res!1037797) (not e!846668))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517688 (= res!1037797 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49327 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49327 a!2804))))))

(declare-fun b!1517689 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101074 (_ BitVec 32)) SeekEntryResult!12969)

(assert (=> b!1517689 (= e!846669 (= (seekEntry!0 (select (arr!48775 a!2804) j!70) a!2804 mask!2512) (Found!12969 j!70)))))

(declare-fun b!1517690 () Bool)

(assert (=> b!1517690 (= e!846668 e!846672)))

(declare-fun res!1037789 () Bool)

(assert (=> b!1517690 (=> (not res!1037789) (not e!846672))))

(declare-fun lt!657716 () SeekEntryResult!12969)

(assert (=> b!1517690 (= res!1037789 (= lt!657713 lt!657716))))

(assert (=> b!1517690 (= lt!657716 (Intermediate!12969 false resIndex!21 resX!21))))

(assert (=> b!1517690 (= lt!657713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48775 a!2804) j!70) mask!2512) (select (arr!48775 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517691 () Bool)

(declare-fun res!1037799 () Bool)

(assert (=> b!1517691 (=> (not res!1037799) (not e!846672))))

(assert (=> b!1517691 (= res!1037799 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48775 a!2804) j!70) a!2804 mask!2512) lt!657716))))

(declare-fun b!1517692 () Bool)

(declare-fun e!846670 () Bool)

(assert (=> b!1517692 (= e!846671 e!846670)))

(declare-fun res!1037798 () Bool)

(assert (=> b!1517692 (=> res!1037798 e!846670)))

(declare-fun lt!657717 () (_ BitVec 32))

(assert (=> b!1517692 (= res!1037798 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657717 #b00000000000000000000000000000000) (bvsge lt!657717 (size!49327 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517692 (= lt!657717 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517684 () Bool)

(assert (=> b!1517684 (= e!846670 true)))

(declare-fun lt!657715 () SeekEntryResult!12969)

(assert (=> b!1517684 (= lt!657715 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657717 (select (arr!48775 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1037791 () Bool)

(assert (=> start!129218 (=> (not res!1037791) (not e!846668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129218 (= res!1037791 (validMask!0 mask!2512))))

(assert (=> start!129218 e!846668))

(assert (=> start!129218 true))

(declare-fun array_inv!38008 (array!101074) Bool)

(assert (=> start!129218 (array_inv!38008 a!2804)))

(assert (= (and start!129218 res!1037791) b!1517683))

(assert (= (and b!1517683 res!1037795) b!1517681))

(assert (= (and b!1517681 res!1037800) b!1517682))

(assert (= (and b!1517682 res!1037793) b!1517680))

(assert (= (and b!1517680 res!1037792) b!1517687))

(assert (= (and b!1517687 res!1037796) b!1517688))

(assert (= (and b!1517688 res!1037797) b!1517690))

(assert (= (and b!1517690 res!1037789) b!1517691))

(assert (= (and b!1517691 res!1037799) b!1517686))

(assert (= (and b!1517686 res!1037790) b!1517685))

(assert (= (and b!1517685 res!1037801) b!1517689))

(assert (= (and b!1517685 (not res!1037794)) b!1517692))

(assert (= (and b!1517692 (not res!1037798)) b!1517684))

(declare-fun m!1400417 () Bool)

(assert (=> b!1517689 m!1400417))

(assert (=> b!1517689 m!1400417))

(declare-fun m!1400419 () Bool)

(assert (=> b!1517689 m!1400419))

(assert (=> b!1517684 m!1400417))

(assert (=> b!1517684 m!1400417))

(declare-fun m!1400421 () Bool)

(assert (=> b!1517684 m!1400421))

(declare-fun m!1400423 () Bool)

(assert (=> b!1517686 m!1400423))

(declare-fun m!1400425 () Bool)

(assert (=> b!1517686 m!1400425))

(assert (=> b!1517686 m!1400425))

(declare-fun m!1400427 () Bool)

(assert (=> b!1517686 m!1400427))

(assert (=> b!1517686 m!1400427))

(assert (=> b!1517686 m!1400425))

(declare-fun m!1400429 () Bool)

(assert (=> b!1517686 m!1400429))

(declare-fun m!1400431 () Bool)

(assert (=> b!1517687 m!1400431))

(declare-fun m!1400433 () Bool)

(assert (=> b!1517692 m!1400433))

(declare-fun m!1400435 () Bool)

(assert (=> start!129218 m!1400435))

(declare-fun m!1400437 () Bool)

(assert (=> start!129218 m!1400437))

(declare-fun m!1400439 () Bool)

(assert (=> b!1517681 m!1400439))

(assert (=> b!1517681 m!1400439))

(declare-fun m!1400441 () Bool)

(assert (=> b!1517681 m!1400441))

(assert (=> b!1517685 m!1400417))

(declare-fun m!1400443 () Bool)

(assert (=> b!1517685 m!1400443))

(assert (=> b!1517685 m!1400423))

(assert (=> b!1517685 m!1400425))

(declare-fun m!1400445 () Bool)

(assert (=> b!1517685 m!1400445))

(declare-fun m!1400447 () Bool)

(assert (=> b!1517680 m!1400447))

(assert (=> b!1517690 m!1400417))

(assert (=> b!1517690 m!1400417))

(declare-fun m!1400449 () Bool)

(assert (=> b!1517690 m!1400449))

(assert (=> b!1517690 m!1400449))

(assert (=> b!1517690 m!1400417))

(declare-fun m!1400451 () Bool)

(assert (=> b!1517690 m!1400451))

(assert (=> b!1517691 m!1400417))

(assert (=> b!1517691 m!1400417))

(declare-fun m!1400453 () Bool)

(assert (=> b!1517691 m!1400453))

(assert (=> b!1517682 m!1400417))

(assert (=> b!1517682 m!1400417))

(declare-fun m!1400455 () Bool)

(assert (=> b!1517682 m!1400455))

(check-sat (not b!1517681) (not b!1517684) (not b!1517691) (not b!1517689) (not b!1517685) (not b!1517690) (not b!1517692) (not b!1517686) (not start!129218) (not b!1517682) (not b!1517680) (not b!1517687))
(check-sat)
