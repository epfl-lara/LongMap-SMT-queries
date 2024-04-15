; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128852 () Bool)

(assert start!128852)

(declare-fun res!1030677 () Bool)

(declare-fun e!843414 () Bool)

(assert (=> start!128852 (=> (not res!1030677) (not e!843414))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128852 (= res!1030677 (validMask!0 mask!2512))))

(assert (=> start!128852 e!843414))

(assert (=> start!128852 true))

(declare-datatypes ((array!100708 0))(
  ( (array!100709 (arr!48592 (Array (_ BitVec 32) (_ BitVec 64))) (size!49144 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100708)

(declare-fun array_inv!37825 (array!100708) Bool)

(assert (=> start!128852 (array_inv!37825 a!2804)))

(declare-fun b!1510566 () Bool)

(declare-fun res!1030685 () Bool)

(assert (=> b!1510566 (=> (not res!1030685) (not e!843414))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510566 (= res!1030685 (validKeyInArray!0 (select (arr!48592 a!2804) i!961)))))

(declare-fun b!1510567 () Bool)

(declare-fun e!843415 () Bool)

(assert (=> b!1510567 (= e!843414 e!843415)))

(declare-fun res!1030679 () Bool)

(assert (=> b!1510567 (=> (not res!1030679) (not e!843415))))

(declare-datatypes ((SeekEntryResult!12786 0))(
  ( (MissingZero!12786 (index!53539 (_ BitVec 32))) (Found!12786 (index!53540 (_ BitVec 32))) (Intermediate!12786 (undefined!13598 Bool) (index!53541 (_ BitVec 32)) (x!135282 (_ BitVec 32))) (Undefined!12786) (MissingVacant!12786 (index!53542 (_ BitVec 32))) )
))
(declare-fun lt!655000 () SeekEntryResult!12786)

(declare-fun lt!655002 () SeekEntryResult!12786)

(assert (=> b!1510567 (= res!1030679 (= lt!655000 lt!655002))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510567 (= lt!655002 (Intermediate!12786 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100708 (_ BitVec 32)) SeekEntryResult!12786)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510567 (= lt!655000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48592 a!2804) j!70) mask!2512) (select (arr!48592 a!2804) j!70) a!2804 mask!2512))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun b!1510568 () Bool)

(assert (=> b!1510568 (= e!843415 (not (or (not (= (select (arr!48592 a!2804) j!70) (select (store (arr!48592 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48592 a!2804) index!487) (select (arr!48592 a!2804) j!70)) (not (= (select (arr!48592 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843416 () Bool)

(assert (=> b!1510568 e!843416))

(declare-fun res!1030678 () Bool)

(assert (=> b!1510568 (=> (not res!1030678) (not e!843416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100708 (_ BitVec 32)) Bool)

(assert (=> b!1510568 (= res!1030678 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50279 0))(
  ( (Unit!50280) )
))
(declare-fun lt!655001 () Unit!50279)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50279)

(assert (=> b!1510568 (= lt!655001 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510569 () Bool)

(declare-fun res!1030684 () Bool)

(assert (=> b!1510569 (=> (not res!1030684) (not e!843415))))

(assert (=> b!1510569 (= res!1030684 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48592 a!2804) j!70) a!2804 mask!2512) lt!655002))))

(declare-fun b!1510570 () Bool)

(declare-fun res!1030681 () Bool)

(assert (=> b!1510570 (=> (not res!1030681) (not e!843414))))

(assert (=> b!1510570 (= res!1030681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510571 () Bool)

(declare-fun res!1030683 () Bool)

(assert (=> b!1510571 (=> (not res!1030683) (not e!843414))))

(assert (=> b!1510571 (= res!1030683 (validKeyInArray!0 (select (arr!48592 a!2804) j!70)))))

(declare-fun b!1510572 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100708 (_ BitVec 32)) SeekEntryResult!12786)

(assert (=> b!1510572 (= e!843416 (= (seekEntry!0 (select (arr!48592 a!2804) j!70) a!2804 mask!2512) (Found!12786 j!70)))))

(declare-fun b!1510573 () Bool)

(declare-fun res!1030676 () Bool)

(assert (=> b!1510573 (=> (not res!1030676) (not e!843415))))

(assert (=> b!1510573 (= res!1030676 (= lt!655000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48592 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48592 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100709 (store (arr!48592 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49144 a!2804)) mask!2512)))))

(declare-fun b!1510574 () Bool)

(declare-fun res!1030680 () Bool)

(assert (=> b!1510574 (=> (not res!1030680) (not e!843414))))

(assert (=> b!1510574 (= res!1030680 (and (= (size!49144 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49144 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49144 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510575 () Bool)

(declare-fun res!1030675 () Bool)

(assert (=> b!1510575 (=> (not res!1030675) (not e!843414))))

(declare-datatypes ((List!35153 0))(
  ( (Nil!35150) (Cons!35149 (h!36562 (_ BitVec 64)) (t!49839 List!35153)) )
))
(declare-fun arrayNoDuplicates!0 (array!100708 (_ BitVec 32) List!35153) Bool)

(assert (=> b!1510575 (= res!1030675 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35150))))

(declare-fun b!1510576 () Bool)

(declare-fun res!1030682 () Bool)

(assert (=> b!1510576 (=> (not res!1030682) (not e!843414))))

(assert (=> b!1510576 (= res!1030682 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49144 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49144 a!2804))))))

(assert (= (and start!128852 res!1030677) b!1510574))

(assert (= (and b!1510574 res!1030680) b!1510566))

(assert (= (and b!1510566 res!1030685) b!1510571))

(assert (= (and b!1510571 res!1030683) b!1510570))

(assert (= (and b!1510570 res!1030681) b!1510575))

(assert (= (and b!1510575 res!1030675) b!1510576))

(assert (= (and b!1510576 res!1030682) b!1510567))

(assert (= (and b!1510567 res!1030679) b!1510569))

(assert (= (and b!1510569 res!1030684) b!1510573))

(assert (= (and b!1510573 res!1030676) b!1510568))

(assert (= (and b!1510568 res!1030678) b!1510572))

(declare-fun m!1392635 () Bool)

(assert (=> b!1510572 m!1392635))

(assert (=> b!1510572 m!1392635))

(declare-fun m!1392637 () Bool)

(assert (=> b!1510572 m!1392637))

(assert (=> b!1510567 m!1392635))

(assert (=> b!1510567 m!1392635))

(declare-fun m!1392639 () Bool)

(assert (=> b!1510567 m!1392639))

(assert (=> b!1510567 m!1392639))

(assert (=> b!1510567 m!1392635))

(declare-fun m!1392641 () Bool)

(assert (=> b!1510567 m!1392641))

(assert (=> b!1510568 m!1392635))

(declare-fun m!1392643 () Bool)

(assert (=> b!1510568 m!1392643))

(declare-fun m!1392645 () Bool)

(assert (=> b!1510568 m!1392645))

(declare-fun m!1392647 () Bool)

(assert (=> b!1510568 m!1392647))

(declare-fun m!1392649 () Bool)

(assert (=> b!1510568 m!1392649))

(declare-fun m!1392651 () Bool)

(assert (=> b!1510568 m!1392651))

(declare-fun m!1392653 () Bool)

(assert (=> b!1510566 m!1392653))

(assert (=> b!1510566 m!1392653))

(declare-fun m!1392655 () Bool)

(assert (=> b!1510566 m!1392655))

(assert (=> b!1510573 m!1392645))

(assert (=> b!1510573 m!1392649))

(assert (=> b!1510573 m!1392649))

(declare-fun m!1392657 () Bool)

(assert (=> b!1510573 m!1392657))

(assert (=> b!1510573 m!1392657))

(assert (=> b!1510573 m!1392649))

(declare-fun m!1392659 () Bool)

(assert (=> b!1510573 m!1392659))

(assert (=> b!1510569 m!1392635))

(assert (=> b!1510569 m!1392635))

(declare-fun m!1392661 () Bool)

(assert (=> b!1510569 m!1392661))

(declare-fun m!1392663 () Bool)

(assert (=> start!128852 m!1392663))

(declare-fun m!1392665 () Bool)

(assert (=> start!128852 m!1392665))

(declare-fun m!1392667 () Bool)

(assert (=> b!1510570 m!1392667))

(declare-fun m!1392669 () Bool)

(assert (=> b!1510575 m!1392669))

(assert (=> b!1510571 m!1392635))

(assert (=> b!1510571 m!1392635))

(declare-fun m!1392671 () Bool)

(assert (=> b!1510571 m!1392671))

(check-sat (not b!1510570) (not b!1510575) (not b!1510566) (not b!1510572) (not start!128852) (not b!1510571) (not b!1510567) (not b!1510573) (not b!1510569) (not b!1510568))
(check-sat)
