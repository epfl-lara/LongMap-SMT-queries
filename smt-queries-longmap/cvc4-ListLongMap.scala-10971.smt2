; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128494 () Bool)

(assert start!128494)

(declare-fun b!1506683 () Bool)

(declare-fun e!841974 () Bool)

(assert (=> b!1506683 (= e!841974 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100506 0))(
  ( (array!100507 (arr!48496 (Array (_ BitVec 32) (_ BitVec 64))) (size!49046 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100506)

(declare-datatypes ((SeekEntryResult!12667 0))(
  ( (MissingZero!12667 (index!53063 (_ BitVec 32))) (Found!12667 (index!53064 (_ BitVec 32))) (Intermediate!12667 (undefined!13479 Bool) (index!53065 (_ BitVec 32)) (x!134817 (_ BitVec 32))) (Undefined!12667) (MissingVacant!12667 (index!53066 (_ BitVec 32))) )
))
(declare-fun lt!654259 () SeekEntryResult!12667)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100506 (_ BitVec 32)) SeekEntryResult!12667)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506683 (= lt!654259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48496 a!2804) j!70) mask!2512) (select (arr!48496 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506684 () Bool)

(declare-fun res!1027008 () Bool)

(assert (=> b!1506684 (=> (not res!1027008) (not e!841974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506684 (= res!1027008 (validKeyInArray!0 (select (arr!48496 a!2804) j!70)))))

(declare-fun b!1506685 () Bool)

(declare-fun res!1027010 () Bool)

(assert (=> b!1506685 (=> (not res!1027010) (not e!841974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100506 (_ BitVec 32)) Bool)

(assert (=> b!1506685 (= res!1027010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506686 () Bool)

(declare-fun res!1027009 () Bool)

(assert (=> b!1506686 (=> (not res!1027009) (not e!841974))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1506686 (= res!1027009 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49046 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49046 a!2804))))))

(declare-fun b!1506687 () Bool)

(declare-fun res!1027007 () Bool)

(assert (=> b!1506687 (=> (not res!1027007) (not e!841974))))

(declare-datatypes ((List!34979 0))(
  ( (Nil!34976) (Cons!34975 (h!36375 (_ BitVec 64)) (t!49673 List!34979)) )
))
(declare-fun arrayNoDuplicates!0 (array!100506 (_ BitVec 32) List!34979) Bool)

(assert (=> b!1506687 (= res!1027007 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34976))))

(declare-fun res!1027006 () Bool)

(assert (=> start!128494 (=> (not res!1027006) (not e!841974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128494 (= res!1027006 (validMask!0 mask!2512))))

(assert (=> start!128494 e!841974))

(assert (=> start!128494 true))

(declare-fun array_inv!37524 (array!100506) Bool)

(assert (=> start!128494 (array_inv!37524 a!2804)))

(declare-fun b!1506688 () Bool)

(declare-fun res!1027011 () Bool)

(assert (=> b!1506688 (=> (not res!1027011) (not e!841974))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506688 (= res!1027011 (and (= (size!49046 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49046 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49046 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506689 () Bool)

(declare-fun res!1027012 () Bool)

(assert (=> b!1506689 (=> (not res!1027012) (not e!841974))))

(assert (=> b!1506689 (= res!1027012 (validKeyInArray!0 (select (arr!48496 a!2804) i!961)))))

(assert (= (and start!128494 res!1027006) b!1506688))

(assert (= (and b!1506688 res!1027011) b!1506689))

(assert (= (and b!1506689 res!1027012) b!1506684))

(assert (= (and b!1506684 res!1027008) b!1506685))

(assert (= (and b!1506685 res!1027010) b!1506687))

(assert (= (and b!1506687 res!1027007) b!1506686))

(assert (= (and b!1506686 res!1027009) b!1506683))

(declare-fun m!1389599 () Bool)

(assert (=> b!1506689 m!1389599))

(assert (=> b!1506689 m!1389599))

(declare-fun m!1389601 () Bool)

(assert (=> b!1506689 m!1389601))

(declare-fun m!1389603 () Bool)

(assert (=> start!128494 m!1389603))

(declare-fun m!1389605 () Bool)

(assert (=> start!128494 m!1389605))

(declare-fun m!1389607 () Bool)

(assert (=> b!1506683 m!1389607))

(assert (=> b!1506683 m!1389607))

(declare-fun m!1389609 () Bool)

(assert (=> b!1506683 m!1389609))

(assert (=> b!1506683 m!1389609))

(assert (=> b!1506683 m!1389607))

(declare-fun m!1389611 () Bool)

(assert (=> b!1506683 m!1389611))

(assert (=> b!1506684 m!1389607))

(assert (=> b!1506684 m!1389607))

(declare-fun m!1389613 () Bool)

(assert (=> b!1506684 m!1389613))

(declare-fun m!1389615 () Bool)

(assert (=> b!1506687 m!1389615))

(declare-fun m!1389617 () Bool)

(assert (=> b!1506685 m!1389617))

(push 1)

(assert (not b!1506685))

(assert (not start!128494))

(assert (not b!1506683))

(assert (not b!1506689))

(assert (not b!1506687))

(assert (not b!1506684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

