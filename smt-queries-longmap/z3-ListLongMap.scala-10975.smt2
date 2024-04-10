; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128516 () Bool)

(assert start!128516)

(declare-fun b!1506933 () Bool)

(declare-fun res!1027260 () Bool)

(declare-fun e!842045 () Bool)

(assert (=> b!1506933 (=> (not res!1027260) (not e!842045))))

(declare-datatypes ((SeekEntryResult!12678 0))(
  ( (MissingZero!12678 (index!53107 (_ BitVec 32))) (Found!12678 (index!53108 (_ BitVec 32))) (Intermediate!12678 (undefined!13490 Bool) (index!53109 (_ BitVec 32)) (x!134860 (_ BitVec 32))) (Undefined!12678) (MissingVacant!12678 (index!53110 (_ BitVec 32))) )
))
(declare-fun lt!654283 () SeekEntryResult!12678)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100528 0))(
  ( (array!100529 (arr!48507 (Array (_ BitVec 32) (_ BitVec 64))) (size!49057 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100528)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100528 (_ BitVec 32)) SeekEntryResult!12678)

(assert (=> b!1506933 (= res!1027260 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48507 a!2804) j!70) a!2804 mask!2512) lt!654283))))

(declare-fun b!1506934 () Bool)

(declare-fun res!1027257 () Bool)

(declare-fun e!842046 () Bool)

(assert (=> b!1506934 (=> (not res!1027257) (not e!842046))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506934 (= res!1027257 (and (= (size!49057 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49057 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49057 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1027264 () Bool)

(assert (=> start!128516 (=> (not res!1027264) (not e!842046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128516 (= res!1027264 (validMask!0 mask!2512))))

(assert (=> start!128516 e!842046))

(assert (=> start!128516 true))

(declare-fun array_inv!37535 (array!100528) Bool)

(assert (=> start!128516 (array_inv!37535 a!2804)))

(declare-fun b!1506935 () Bool)

(assert (=> b!1506935 (= e!842045 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1506936 () Bool)

(declare-fun res!1027263 () Bool)

(assert (=> b!1506936 (=> (not res!1027263) (not e!842046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100528 (_ BitVec 32)) Bool)

(assert (=> b!1506936 (= res!1027263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506937 () Bool)

(declare-fun res!1027262 () Bool)

(assert (=> b!1506937 (=> (not res!1027262) (not e!842046))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506937 (= res!1027262 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49057 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49057 a!2804))))))

(declare-fun b!1506938 () Bool)

(assert (=> b!1506938 (= e!842046 e!842045)))

(declare-fun res!1027256 () Bool)

(assert (=> b!1506938 (=> (not res!1027256) (not e!842045))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506938 (= res!1027256 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48507 a!2804) j!70) mask!2512) (select (arr!48507 a!2804) j!70) a!2804 mask!2512) lt!654283))))

(assert (=> b!1506938 (= lt!654283 (Intermediate!12678 false resIndex!21 resX!21))))

(declare-fun b!1506939 () Bool)

(declare-fun res!1027258 () Bool)

(assert (=> b!1506939 (=> (not res!1027258) (not e!842046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506939 (= res!1027258 (validKeyInArray!0 (select (arr!48507 a!2804) i!961)))))

(declare-fun b!1506940 () Bool)

(declare-fun res!1027259 () Bool)

(assert (=> b!1506940 (=> (not res!1027259) (not e!842046))))

(declare-datatypes ((List!34990 0))(
  ( (Nil!34987) (Cons!34986 (h!36386 (_ BitVec 64)) (t!49684 List!34990)) )
))
(declare-fun arrayNoDuplicates!0 (array!100528 (_ BitVec 32) List!34990) Bool)

(assert (=> b!1506940 (= res!1027259 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34987))))

(declare-fun b!1506941 () Bool)

(declare-fun res!1027261 () Bool)

(assert (=> b!1506941 (=> (not res!1027261) (not e!842046))))

(assert (=> b!1506941 (= res!1027261 (validKeyInArray!0 (select (arr!48507 a!2804) j!70)))))

(assert (= (and start!128516 res!1027264) b!1506934))

(assert (= (and b!1506934 res!1027257) b!1506939))

(assert (= (and b!1506939 res!1027258) b!1506941))

(assert (= (and b!1506941 res!1027261) b!1506936))

(assert (= (and b!1506936 res!1027263) b!1506940))

(assert (= (and b!1506940 res!1027259) b!1506937))

(assert (= (and b!1506937 res!1027262) b!1506938))

(assert (= (and b!1506938 res!1027256) b!1506933))

(assert (= (and b!1506933 res!1027260) b!1506935))

(declare-fun m!1389821 () Bool)

(assert (=> start!128516 m!1389821))

(declare-fun m!1389823 () Bool)

(assert (=> start!128516 m!1389823))

(declare-fun m!1389825 () Bool)

(assert (=> b!1506941 m!1389825))

(assert (=> b!1506941 m!1389825))

(declare-fun m!1389827 () Bool)

(assert (=> b!1506941 m!1389827))

(declare-fun m!1389829 () Bool)

(assert (=> b!1506940 m!1389829))

(declare-fun m!1389831 () Bool)

(assert (=> b!1506936 m!1389831))

(assert (=> b!1506933 m!1389825))

(assert (=> b!1506933 m!1389825))

(declare-fun m!1389833 () Bool)

(assert (=> b!1506933 m!1389833))

(assert (=> b!1506938 m!1389825))

(assert (=> b!1506938 m!1389825))

(declare-fun m!1389835 () Bool)

(assert (=> b!1506938 m!1389835))

(assert (=> b!1506938 m!1389835))

(assert (=> b!1506938 m!1389825))

(declare-fun m!1389837 () Bool)

(assert (=> b!1506938 m!1389837))

(declare-fun m!1389839 () Bool)

(assert (=> b!1506939 m!1389839))

(assert (=> b!1506939 m!1389839))

(declare-fun m!1389841 () Bool)

(assert (=> b!1506939 m!1389841))

(check-sat (not start!128516) (not b!1506939) (not b!1506940) (not b!1506933) (not b!1506938) (not b!1506941) (not b!1506936))
(check-sat)
