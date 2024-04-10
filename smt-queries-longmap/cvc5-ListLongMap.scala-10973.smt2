; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128502 () Bool)

(assert start!128502)

(declare-fun b!1506776 () Bool)

(declare-fun res!1027099 () Bool)

(declare-fun e!841999 () Bool)

(assert (=> b!1506776 (=> (not res!1027099) (not e!841999))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100514 0))(
  ( (array!100515 (arr!48500 (Array (_ BitVec 32) (_ BitVec 64))) (size!49050 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100514)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506776 (= res!1027099 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49050 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49050 a!2804))))))

(declare-fun b!1506777 () Bool)

(declare-fun res!1027103 () Bool)

(assert (=> b!1506777 (=> (not res!1027103) (not e!841999))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506777 (= res!1027103 (validKeyInArray!0 (select (arr!48500 a!2804) i!961)))))

(declare-fun res!1027100 () Bool)

(assert (=> start!128502 (=> (not res!1027100) (not e!841999))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128502 (= res!1027100 (validMask!0 mask!2512))))

(assert (=> start!128502 e!841999))

(assert (=> start!128502 true))

(declare-fun array_inv!37528 (array!100514) Bool)

(assert (=> start!128502 (array_inv!37528 a!2804)))

(declare-fun b!1506778 () Bool)

(declare-fun res!1027102 () Bool)

(assert (=> b!1506778 (=> (not res!1027102) (not e!841999))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506778 (= res!1027102 (and (= (size!49050 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49050 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49050 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506779 () Bool)

(declare-fun res!1027104 () Bool)

(assert (=> b!1506779 (=> (not res!1027104) (not e!841999))))

(declare-datatypes ((List!34983 0))(
  ( (Nil!34980) (Cons!34979 (h!36379 (_ BitVec 64)) (t!49677 List!34983)) )
))
(declare-fun arrayNoDuplicates!0 (array!100514 (_ BitVec 32) List!34983) Bool)

(assert (=> b!1506779 (= res!1027104 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34980))))

(declare-fun b!1506780 () Bool)

(declare-fun res!1027101 () Bool)

(assert (=> b!1506780 (=> (not res!1027101) (not e!841999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100514 (_ BitVec 32)) Bool)

(assert (=> b!1506780 (= res!1027101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506781 () Bool)

(assert (=> b!1506781 (= e!841999 false)))

(declare-datatypes ((SeekEntryResult!12671 0))(
  ( (MissingZero!12671 (index!53079 (_ BitVec 32))) (Found!12671 (index!53080 (_ BitVec 32))) (Intermediate!12671 (undefined!13483 Bool) (index!53081 (_ BitVec 32)) (x!134837 (_ BitVec 32))) (Undefined!12671) (MissingVacant!12671 (index!53082 (_ BitVec 32))) )
))
(declare-fun lt!654262 () SeekEntryResult!12671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100514 (_ BitVec 32)) SeekEntryResult!12671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506781 (= lt!654262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48500 a!2804) j!70) mask!2512) (select (arr!48500 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506782 () Bool)

(declare-fun res!1027105 () Bool)

(assert (=> b!1506782 (=> (not res!1027105) (not e!841999))))

(assert (=> b!1506782 (= res!1027105 (validKeyInArray!0 (select (arr!48500 a!2804) j!70)))))

(assert (= (and start!128502 res!1027100) b!1506778))

(assert (= (and b!1506778 res!1027102) b!1506777))

(assert (= (and b!1506777 res!1027103) b!1506782))

(assert (= (and b!1506782 res!1027105) b!1506780))

(assert (= (and b!1506780 res!1027101) b!1506779))

(assert (= (and b!1506779 res!1027104) b!1506776))

(assert (= (and b!1506776 res!1027099) b!1506781))

(declare-fun m!1389679 () Bool)

(assert (=> b!1506780 m!1389679))

(declare-fun m!1389681 () Bool)

(assert (=> b!1506782 m!1389681))

(assert (=> b!1506782 m!1389681))

(declare-fun m!1389683 () Bool)

(assert (=> b!1506782 m!1389683))

(declare-fun m!1389685 () Bool)

(assert (=> b!1506779 m!1389685))

(declare-fun m!1389687 () Bool)

(assert (=> start!128502 m!1389687))

(declare-fun m!1389689 () Bool)

(assert (=> start!128502 m!1389689))

(assert (=> b!1506781 m!1389681))

(assert (=> b!1506781 m!1389681))

(declare-fun m!1389691 () Bool)

(assert (=> b!1506781 m!1389691))

(assert (=> b!1506781 m!1389691))

(assert (=> b!1506781 m!1389681))

(declare-fun m!1389693 () Bool)

(assert (=> b!1506781 m!1389693))

(declare-fun m!1389695 () Bool)

(assert (=> b!1506777 m!1389695))

(assert (=> b!1506777 m!1389695))

(declare-fun m!1389697 () Bool)

(assert (=> b!1506777 m!1389697))

(push 1)

(assert (not b!1506780))

(assert (not b!1506782))

(assert (not start!128502))

(assert (not b!1506777))

(assert (not b!1506781))

(assert (not b!1506779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

