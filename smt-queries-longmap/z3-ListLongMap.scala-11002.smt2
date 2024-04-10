; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128846 () Bool)

(assert start!128846)

(declare-fun res!1029853 () Bool)

(declare-fun e!843274 () Bool)

(assert (=> start!128846 (=> (not res!1029853) (not e!843274))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128846 (= res!1029853 (validMask!0 mask!2512))))

(assert (=> start!128846 e!843274))

(assert (=> start!128846 true))

(declare-datatypes ((array!100702 0))(
  ( (array!100703 (arr!48588 (Array (_ BitVec 32) (_ BitVec 64))) (size!49138 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100702)

(declare-fun array_inv!37616 (array!100702) Bool)

(assert (=> start!128846 (array_inv!37616 a!2804)))

(declare-fun e!843271 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1509940 () Bool)

(declare-datatypes ((SeekEntryResult!12759 0))(
  ( (MissingZero!12759 (index!53431 (_ BitVec 32))) (Found!12759 (index!53432 (_ BitVec 32))) (Intermediate!12759 (undefined!13571 Bool) (index!53433 (_ BitVec 32)) (x!135181 (_ BitVec 32))) (Undefined!12759) (MissingVacant!12759 (index!53434 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100702 (_ BitVec 32)) SeekEntryResult!12759)

(assert (=> b!1509940 (= e!843271 (= (seekEntry!0 (select (arr!48588 a!2804) j!70) a!2804 mask!2512) (Found!12759 j!70)))))

(declare-fun b!1509941 () Bool)

(declare-fun res!1029846 () Bool)

(declare-fun e!843273 () Bool)

(assert (=> b!1509941 (=> (not res!1029846) (not e!843273))))

(declare-fun lt!655036 () SeekEntryResult!12759)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100702 (_ BitVec 32)) SeekEntryResult!12759)

(assert (=> b!1509941 (= res!1029846 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48588 a!2804) j!70) a!2804 mask!2512) lt!655036))))

(declare-fun b!1509942 () Bool)

(declare-fun res!1029851 () Bool)

(assert (=> b!1509942 (=> (not res!1029851) (not e!843274))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509942 (= res!1029851 (validKeyInArray!0 (select (arr!48588 a!2804) i!961)))))

(declare-fun b!1509943 () Bool)

(declare-fun res!1029849 () Bool)

(assert (=> b!1509943 (=> (not res!1029849) (not e!843274))))

(declare-datatypes ((List!35071 0))(
  ( (Nil!35068) (Cons!35067 (h!36479 (_ BitVec 64)) (t!49765 List!35071)) )
))
(declare-fun arrayNoDuplicates!0 (array!100702 (_ BitVec 32) List!35071) Bool)

(assert (=> b!1509943 (= res!1029849 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35068))))

(declare-fun b!1509944 () Bool)

(assert (=> b!1509944 (= e!843273 (not true))))

(assert (=> b!1509944 e!843271))

(declare-fun res!1029848 () Bool)

(assert (=> b!1509944 (=> (not res!1029848) (not e!843271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100702 (_ BitVec 32)) Bool)

(assert (=> b!1509944 (= res!1029848 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50386 0))(
  ( (Unit!50387) )
))
(declare-fun lt!655035 () Unit!50386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50386)

(assert (=> b!1509944 (= lt!655035 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509945 () Bool)

(declare-fun res!1029847 () Bool)

(assert (=> b!1509945 (=> (not res!1029847) (not e!843274))))

(assert (=> b!1509945 (= res!1029847 (and (= (size!49138 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49138 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49138 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509946 () Bool)

(assert (=> b!1509946 (= e!843274 e!843273)))

(declare-fun res!1029852 () Bool)

(assert (=> b!1509946 (=> (not res!1029852) (not e!843273))))

(declare-fun lt!655034 () SeekEntryResult!12759)

(assert (=> b!1509946 (= res!1029852 (= lt!655034 lt!655036))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509946 (= lt!655036 (Intermediate!12759 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509946 (= lt!655034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48588 a!2804) j!70) mask!2512) (select (arr!48588 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509947 () Bool)

(declare-fun res!1029843 () Bool)

(assert (=> b!1509947 (=> (not res!1029843) (not e!843274))))

(assert (=> b!1509947 (= res!1029843 (validKeyInArray!0 (select (arr!48588 a!2804) j!70)))))

(declare-fun b!1509948 () Bool)

(declare-fun res!1029845 () Bool)

(assert (=> b!1509948 (=> (not res!1029845) (not e!843274))))

(assert (=> b!1509948 (= res!1029845 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49138 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49138 a!2804))))))

(declare-fun b!1509949 () Bool)

(declare-fun res!1029850 () Bool)

(assert (=> b!1509949 (=> (not res!1029850) (not e!843274))))

(assert (=> b!1509949 (= res!1029850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509950 () Bool)

(declare-fun res!1029844 () Bool)

(assert (=> b!1509950 (=> (not res!1029844) (not e!843273))))

(assert (=> b!1509950 (= res!1029844 (= lt!655034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48588 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48588 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100703 (store (arr!48588 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49138 a!2804)) mask!2512)))))

(assert (= (and start!128846 res!1029853) b!1509945))

(assert (= (and b!1509945 res!1029847) b!1509942))

(assert (= (and b!1509942 res!1029851) b!1509947))

(assert (= (and b!1509947 res!1029843) b!1509949))

(assert (= (and b!1509949 res!1029850) b!1509943))

(assert (= (and b!1509943 res!1029849) b!1509948))

(assert (= (and b!1509948 res!1029845) b!1509946))

(assert (= (and b!1509946 res!1029852) b!1509941))

(assert (= (and b!1509941 res!1029846) b!1509950))

(assert (= (and b!1509950 res!1029844) b!1509944))

(assert (= (and b!1509944 res!1029848) b!1509940))

(declare-fun m!1392475 () Bool)

(assert (=> b!1509950 m!1392475))

(declare-fun m!1392477 () Bool)

(assert (=> b!1509950 m!1392477))

(assert (=> b!1509950 m!1392477))

(declare-fun m!1392479 () Bool)

(assert (=> b!1509950 m!1392479))

(assert (=> b!1509950 m!1392479))

(assert (=> b!1509950 m!1392477))

(declare-fun m!1392481 () Bool)

(assert (=> b!1509950 m!1392481))

(declare-fun m!1392483 () Bool)

(assert (=> b!1509940 m!1392483))

(assert (=> b!1509940 m!1392483))

(declare-fun m!1392485 () Bool)

(assert (=> b!1509940 m!1392485))

(declare-fun m!1392487 () Bool)

(assert (=> b!1509944 m!1392487))

(declare-fun m!1392489 () Bool)

(assert (=> b!1509944 m!1392489))

(declare-fun m!1392491 () Bool)

(assert (=> start!128846 m!1392491))

(declare-fun m!1392493 () Bool)

(assert (=> start!128846 m!1392493))

(assert (=> b!1509947 m!1392483))

(assert (=> b!1509947 m!1392483))

(declare-fun m!1392495 () Bool)

(assert (=> b!1509947 m!1392495))

(declare-fun m!1392497 () Bool)

(assert (=> b!1509942 m!1392497))

(assert (=> b!1509942 m!1392497))

(declare-fun m!1392499 () Bool)

(assert (=> b!1509942 m!1392499))

(assert (=> b!1509941 m!1392483))

(assert (=> b!1509941 m!1392483))

(declare-fun m!1392501 () Bool)

(assert (=> b!1509941 m!1392501))

(declare-fun m!1392503 () Bool)

(assert (=> b!1509943 m!1392503))

(declare-fun m!1392505 () Bool)

(assert (=> b!1509949 m!1392505))

(assert (=> b!1509946 m!1392483))

(assert (=> b!1509946 m!1392483))

(declare-fun m!1392507 () Bool)

(assert (=> b!1509946 m!1392507))

(assert (=> b!1509946 m!1392507))

(assert (=> b!1509946 m!1392483))

(declare-fun m!1392509 () Bool)

(assert (=> b!1509946 m!1392509))

(check-sat (not b!1509949) (not b!1509950) (not b!1509943) (not b!1509947) (not start!128846) (not b!1509941) (not b!1509946) (not b!1509942) (not b!1509940) (not b!1509944))
(check-sat)
