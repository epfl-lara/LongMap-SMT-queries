; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128906 () Bool)

(assert start!128906)

(declare-fun b!1510939 () Bool)

(declare-fun res!1030847 () Bool)

(declare-fun e!843640 () Bool)

(assert (=> b!1510939 (=> (not res!1030847) (not e!843640))))

(declare-datatypes ((SeekEntryResult!12789 0))(
  ( (MissingZero!12789 (index!53551 (_ BitVec 32))) (Found!12789 (index!53552 (_ BitVec 32))) (Intermediate!12789 (undefined!13601 Bool) (index!53553 (_ BitVec 32)) (x!135291 (_ BitVec 32))) (Undefined!12789) (MissingVacant!12789 (index!53554 (_ BitVec 32))) )
))
(declare-fun lt!655304 () SeekEntryResult!12789)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100762 0))(
  ( (array!100763 (arr!48618 (Array (_ BitVec 32) (_ BitVec 64))) (size!49168 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100762)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100762 (_ BitVec 32)) SeekEntryResult!12789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510939 (= res!1030847 (= lt!655304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48618 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48618 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100763 (store (arr!48618 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49168 a!2804)) mask!2512)))))

(declare-fun b!1510940 () Bool)

(declare-fun e!843641 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100762 (_ BitVec 32)) SeekEntryResult!12789)

(assert (=> b!1510940 (= e!843641 (= (seekEntry!0 (select (arr!48618 a!2804) j!70) a!2804 mask!2512) (Found!12789 j!70)))))

(declare-fun b!1510941 () Bool)

(declare-fun res!1030849 () Bool)

(declare-fun e!843643 () Bool)

(assert (=> b!1510941 (=> (not res!1030849) (not e!843643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100762 (_ BitVec 32)) Bool)

(assert (=> b!1510941 (= res!1030849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510942 () Bool)

(declare-fun res!1030846 () Bool)

(assert (=> b!1510942 (=> (not res!1030846) (not e!843640))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!655306 () SeekEntryResult!12789)

(assert (=> b!1510942 (= res!1030846 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48618 a!2804) j!70) a!2804 mask!2512) lt!655306))))

(declare-fun b!1510943 () Bool)

(assert (=> b!1510943 (= e!843643 e!843640)))

(declare-fun res!1030851 () Bool)

(assert (=> b!1510943 (=> (not res!1030851) (not e!843640))))

(assert (=> b!1510943 (= res!1030851 (= lt!655304 lt!655306))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510943 (= lt!655306 (Intermediate!12789 false resIndex!21 resX!21))))

(assert (=> b!1510943 (= lt!655304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48618 a!2804) j!70) mask!2512) (select (arr!48618 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510944 () Bool)

(declare-fun res!1030842 () Bool)

(assert (=> b!1510944 (=> (not res!1030842) (not e!843643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510944 (= res!1030842 (validKeyInArray!0 (select (arr!48618 a!2804) i!961)))))

(declare-fun b!1510945 () Bool)

(declare-fun res!1030843 () Bool)

(assert (=> b!1510945 (=> (not res!1030843) (not e!843643))))

(assert (=> b!1510945 (= res!1030843 (and (= (size!49168 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49168 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49168 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510946 () Bool)

(declare-fun res!1030845 () Bool)

(assert (=> b!1510946 (=> (not res!1030845) (not e!843643))))

(assert (=> b!1510946 (= res!1030845 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49168 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49168 a!2804))))))

(declare-fun res!1030852 () Bool)

(assert (=> start!128906 (=> (not res!1030852) (not e!843643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128906 (= res!1030852 (validMask!0 mask!2512))))

(assert (=> start!128906 e!843643))

(assert (=> start!128906 true))

(declare-fun array_inv!37646 (array!100762) Bool)

(assert (=> start!128906 (array_inv!37646 a!2804)))

(declare-fun b!1510947 () Bool)

(declare-fun res!1030848 () Bool)

(assert (=> b!1510947 (=> (not res!1030848) (not e!843643))))

(declare-datatypes ((List!35101 0))(
  ( (Nil!35098) (Cons!35097 (h!36509 (_ BitVec 64)) (t!49795 List!35101)) )
))
(declare-fun arrayNoDuplicates!0 (array!100762 (_ BitVec 32) List!35101) Bool)

(assert (=> b!1510947 (= res!1030848 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35098))))

(declare-fun b!1510948 () Bool)

(assert (=> b!1510948 (= e!843640 (not (or (not (= (select (arr!48618 a!2804) j!70) (select (store (arr!48618 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48618 a!2804) index!487) (select (arr!48618 a!2804) j!70)) (not (= (select (arr!48618 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1510948 e!843641))

(declare-fun res!1030850 () Bool)

(assert (=> b!1510948 (=> (not res!1030850) (not e!843641))))

(assert (=> b!1510948 (= res!1030850 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50446 0))(
  ( (Unit!50447) )
))
(declare-fun lt!655305 () Unit!50446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50446)

(assert (=> b!1510948 (= lt!655305 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510949 () Bool)

(declare-fun res!1030844 () Bool)

(assert (=> b!1510949 (=> (not res!1030844) (not e!843643))))

(assert (=> b!1510949 (= res!1030844 (validKeyInArray!0 (select (arr!48618 a!2804) j!70)))))

(assert (= (and start!128906 res!1030852) b!1510945))

(assert (= (and b!1510945 res!1030843) b!1510944))

(assert (= (and b!1510944 res!1030842) b!1510949))

(assert (= (and b!1510949 res!1030844) b!1510941))

(assert (= (and b!1510941 res!1030849) b!1510947))

(assert (= (and b!1510947 res!1030848) b!1510946))

(assert (= (and b!1510946 res!1030845) b!1510943))

(assert (= (and b!1510943 res!1030851) b!1510942))

(assert (= (and b!1510942 res!1030846) b!1510939))

(assert (= (and b!1510939 res!1030847) b!1510948))

(assert (= (and b!1510948 res!1030850) b!1510940))

(declare-fun m!1393581 () Bool)

(assert (=> b!1510949 m!1393581))

(assert (=> b!1510949 m!1393581))

(declare-fun m!1393583 () Bool)

(assert (=> b!1510949 m!1393583))

(declare-fun m!1393585 () Bool)

(assert (=> b!1510947 m!1393585))

(assert (=> b!1510942 m!1393581))

(assert (=> b!1510942 m!1393581))

(declare-fun m!1393587 () Bool)

(assert (=> b!1510942 m!1393587))

(declare-fun m!1393589 () Bool)

(assert (=> b!1510941 m!1393589))

(assert (=> b!1510940 m!1393581))

(assert (=> b!1510940 m!1393581))

(declare-fun m!1393591 () Bool)

(assert (=> b!1510940 m!1393591))

(declare-fun m!1393593 () Bool)

(assert (=> start!128906 m!1393593))

(declare-fun m!1393595 () Bool)

(assert (=> start!128906 m!1393595))

(assert (=> b!1510948 m!1393581))

(declare-fun m!1393597 () Bool)

(assert (=> b!1510948 m!1393597))

(declare-fun m!1393599 () Bool)

(assert (=> b!1510948 m!1393599))

(declare-fun m!1393601 () Bool)

(assert (=> b!1510948 m!1393601))

(declare-fun m!1393603 () Bool)

(assert (=> b!1510948 m!1393603))

(declare-fun m!1393605 () Bool)

(assert (=> b!1510948 m!1393605))

(assert (=> b!1510939 m!1393599))

(assert (=> b!1510939 m!1393603))

(assert (=> b!1510939 m!1393603))

(declare-fun m!1393607 () Bool)

(assert (=> b!1510939 m!1393607))

(assert (=> b!1510939 m!1393607))

(assert (=> b!1510939 m!1393603))

(declare-fun m!1393609 () Bool)

(assert (=> b!1510939 m!1393609))

(declare-fun m!1393611 () Bool)

(assert (=> b!1510944 m!1393611))

(assert (=> b!1510944 m!1393611))

(declare-fun m!1393613 () Bool)

(assert (=> b!1510944 m!1393613))

(assert (=> b!1510943 m!1393581))

(assert (=> b!1510943 m!1393581))

(declare-fun m!1393615 () Bool)

(assert (=> b!1510943 m!1393615))

(assert (=> b!1510943 m!1393615))

(assert (=> b!1510943 m!1393581))

(declare-fun m!1393617 () Bool)

(assert (=> b!1510943 m!1393617))

(check-sat (not b!1510941) (not b!1510944) (not b!1510947) (not b!1510940) (not b!1510939) (not b!1510943) (not b!1510948) (not start!128906) (not b!1510942) (not b!1510949))
(check-sat)
