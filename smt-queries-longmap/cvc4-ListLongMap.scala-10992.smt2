; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128788 () Bool)

(assert start!128788)

(declare-fun b!1509066 () Bool)

(declare-fun res!1028972 () Bool)

(declare-fun e!842978 () Bool)

(assert (=> b!1509066 (=> (not res!1028972) (not e!842978))))

(declare-datatypes ((array!100644 0))(
  ( (array!100645 (arr!48559 (Array (_ BitVec 32) (_ BitVec 64))) (size!49109 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100644)

(declare-datatypes ((List!35042 0))(
  ( (Nil!35039) (Cons!35038 (h!36450 (_ BitVec 64)) (t!49736 List!35042)) )
))
(declare-fun arrayNoDuplicates!0 (array!100644 (_ BitVec 32) List!35042) Bool)

(assert (=> b!1509066 (= res!1028972 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35039))))

(declare-fun res!1028969 () Bool)

(assert (=> start!128788 (=> (not res!1028969) (not e!842978))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128788 (= res!1028969 (validMask!0 mask!2512))))

(assert (=> start!128788 e!842978))

(assert (=> start!128788 true))

(declare-fun array_inv!37587 (array!100644) Bool)

(assert (=> start!128788 (array_inv!37587 a!2804)))

(declare-fun b!1509067 () Bool)

(declare-fun res!1028973 () Bool)

(declare-fun e!842979 () Bool)

(assert (=> b!1509067 (=> (not res!1028973) (not e!842979))))

(declare-datatypes ((SeekEntryResult!12730 0))(
  ( (MissingZero!12730 (index!53315 (_ BitVec 32))) (Found!12730 (index!53316 (_ BitVec 32))) (Intermediate!12730 (undefined!13542 Bool) (index!53317 (_ BitVec 32)) (x!135072 (_ BitVec 32))) (Undefined!12730) (MissingVacant!12730 (index!53318 (_ BitVec 32))) )
))
(declare-fun lt!654801 () SeekEntryResult!12730)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100644 (_ BitVec 32)) SeekEntryResult!12730)

(assert (=> b!1509067 (= res!1028973 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48559 a!2804) j!70) a!2804 mask!2512) lt!654801))))

(declare-fun b!1509068 () Bool)

(declare-fun res!1028977 () Bool)

(assert (=> b!1509068 (=> (not res!1028977) (not e!842978))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509068 (= res!1028977 (and (= (size!49109 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49109 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49109 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509069 () Bool)

(declare-fun res!1028975 () Bool)

(assert (=> b!1509069 (=> (not res!1028975) (not e!842978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509069 (= res!1028975 (validKeyInArray!0 (select (arr!48559 a!2804) j!70)))))

(declare-fun b!1509070 () Bool)

(declare-fun res!1028970 () Bool)

(assert (=> b!1509070 (=> (not res!1028970) (not e!842978))))

(assert (=> b!1509070 (= res!1028970 (validKeyInArray!0 (select (arr!48559 a!2804) i!961)))))

(declare-fun b!1509071 () Bool)

(declare-fun res!1028971 () Bool)

(assert (=> b!1509071 (=> (not res!1028971) (not e!842978))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509071 (= res!1028971 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49109 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49109 a!2804))))))

(declare-fun b!1509072 () Bool)

(declare-fun res!1028976 () Bool)

(assert (=> b!1509072 (=> (not res!1028976) (not e!842978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100644 (_ BitVec 32)) Bool)

(assert (=> b!1509072 (= res!1028976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509073 () Bool)

(assert (=> b!1509073 (= e!842978 e!842979)))

(declare-fun res!1028974 () Bool)

(assert (=> b!1509073 (=> (not res!1028974) (not e!842979))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509073 (= res!1028974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48559 a!2804) j!70) mask!2512) (select (arr!48559 a!2804) j!70) a!2804 mask!2512) lt!654801))))

(assert (=> b!1509073 (= lt!654801 (Intermediate!12730 false resIndex!21 resX!21))))

(declare-fun b!1509074 () Bool)

(assert (=> b!1509074 (= e!842979 false)))

(declare-fun lt!654802 () SeekEntryResult!12730)

(assert (=> b!1509074 (= lt!654802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48559 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48559 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100645 (store (arr!48559 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49109 a!2804)) mask!2512))))

(assert (= (and start!128788 res!1028969) b!1509068))

(assert (= (and b!1509068 res!1028977) b!1509070))

(assert (= (and b!1509070 res!1028970) b!1509069))

(assert (= (and b!1509069 res!1028975) b!1509072))

(assert (= (and b!1509072 res!1028976) b!1509066))

(assert (= (and b!1509066 res!1028972) b!1509071))

(assert (= (and b!1509071 res!1028971) b!1509073))

(assert (= (and b!1509073 res!1028974) b!1509067))

(assert (= (and b!1509067 res!1028973) b!1509074))

(declare-fun m!1391503 () Bool)

(assert (=> b!1509069 m!1391503))

(assert (=> b!1509069 m!1391503))

(declare-fun m!1391505 () Bool)

(assert (=> b!1509069 m!1391505))

(declare-fun m!1391507 () Bool)

(assert (=> b!1509070 m!1391507))

(assert (=> b!1509070 m!1391507))

(declare-fun m!1391509 () Bool)

(assert (=> b!1509070 m!1391509))

(declare-fun m!1391511 () Bool)

(assert (=> b!1509066 m!1391511))

(declare-fun m!1391513 () Bool)

(assert (=> start!128788 m!1391513))

(declare-fun m!1391515 () Bool)

(assert (=> start!128788 m!1391515))

(declare-fun m!1391517 () Bool)

(assert (=> b!1509072 m!1391517))

(declare-fun m!1391519 () Bool)

(assert (=> b!1509074 m!1391519))

(declare-fun m!1391521 () Bool)

(assert (=> b!1509074 m!1391521))

(assert (=> b!1509074 m!1391521))

(declare-fun m!1391523 () Bool)

(assert (=> b!1509074 m!1391523))

(assert (=> b!1509074 m!1391523))

(assert (=> b!1509074 m!1391521))

(declare-fun m!1391525 () Bool)

(assert (=> b!1509074 m!1391525))

(assert (=> b!1509067 m!1391503))

(assert (=> b!1509067 m!1391503))

(declare-fun m!1391527 () Bool)

(assert (=> b!1509067 m!1391527))

(assert (=> b!1509073 m!1391503))

(assert (=> b!1509073 m!1391503))

(declare-fun m!1391529 () Bool)

(assert (=> b!1509073 m!1391529))

(assert (=> b!1509073 m!1391529))

(assert (=> b!1509073 m!1391503))

(declare-fun m!1391531 () Bool)

(assert (=> b!1509073 m!1391531))

(push 1)

