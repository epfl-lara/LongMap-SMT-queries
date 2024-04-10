; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128506 () Bool)

(assert start!128506)

(declare-fun b!1506818 () Bool)

(declare-fun res!1027147 () Bool)

(declare-fun e!842011 () Bool)

(assert (=> b!1506818 (=> (not res!1027147) (not e!842011))))

(declare-datatypes ((array!100518 0))(
  ( (array!100519 (arr!48502 (Array (_ BitVec 32) (_ BitVec 64))) (size!49052 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100518)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506818 (= res!1027147 (validKeyInArray!0 (select (arr!48502 a!2804) i!961)))))

(declare-fun res!1027142 () Bool)

(assert (=> start!128506 (=> (not res!1027142) (not e!842011))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128506 (= res!1027142 (validMask!0 mask!2512))))

(assert (=> start!128506 e!842011))

(assert (=> start!128506 true))

(declare-fun array_inv!37530 (array!100518) Bool)

(assert (=> start!128506 (array_inv!37530 a!2804)))

(declare-fun b!1506819 () Bool)

(declare-fun res!1027143 () Bool)

(assert (=> b!1506819 (=> (not res!1027143) (not e!842011))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506819 (= res!1027143 (validKeyInArray!0 (select (arr!48502 a!2804) j!70)))))

(declare-fun b!1506820 () Bool)

(declare-fun res!1027144 () Bool)

(assert (=> b!1506820 (=> (not res!1027144) (not e!842011))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506820 (= res!1027144 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49052 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49052 a!2804))))))

(declare-fun b!1506821 () Bool)

(declare-fun res!1027145 () Bool)

(assert (=> b!1506821 (=> (not res!1027145) (not e!842011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100518 (_ BitVec 32)) Bool)

(assert (=> b!1506821 (= res!1027145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506822 () Bool)

(declare-fun res!1027146 () Bool)

(assert (=> b!1506822 (=> (not res!1027146) (not e!842011))))

(assert (=> b!1506822 (= res!1027146 (and (= (size!49052 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49052 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49052 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506823 () Bool)

(assert (=> b!1506823 (= e!842011 false)))

(declare-datatypes ((SeekEntryResult!12673 0))(
  ( (MissingZero!12673 (index!53087 (_ BitVec 32))) (Found!12673 (index!53088 (_ BitVec 32))) (Intermediate!12673 (undefined!13485 Bool) (index!53089 (_ BitVec 32)) (x!134839 (_ BitVec 32))) (Undefined!12673) (MissingVacant!12673 (index!53090 (_ BitVec 32))) )
))
(declare-fun lt!654268 () SeekEntryResult!12673)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100518 (_ BitVec 32)) SeekEntryResult!12673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506823 (= lt!654268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48502 a!2804) j!70) mask!2512) (select (arr!48502 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506824 () Bool)

(declare-fun res!1027141 () Bool)

(assert (=> b!1506824 (=> (not res!1027141) (not e!842011))))

(declare-datatypes ((List!34985 0))(
  ( (Nil!34982) (Cons!34981 (h!36381 (_ BitVec 64)) (t!49679 List!34985)) )
))
(declare-fun arrayNoDuplicates!0 (array!100518 (_ BitVec 32) List!34985) Bool)

(assert (=> b!1506824 (= res!1027141 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34982))))

(assert (= (and start!128506 res!1027142) b!1506822))

(assert (= (and b!1506822 res!1027146) b!1506818))

(assert (= (and b!1506818 res!1027147) b!1506819))

(assert (= (and b!1506819 res!1027143) b!1506821))

(assert (= (and b!1506821 res!1027145) b!1506824))

(assert (= (and b!1506824 res!1027141) b!1506820))

(assert (= (and b!1506820 res!1027144) b!1506823))

(declare-fun m!1389719 () Bool)

(assert (=> b!1506821 m!1389719))

(declare-fun m!1389721 () Bool)

(assert (=> b!1506823 m!1389721))

(assert (=> b!1506823 m!1389721))

(declare-fun m!1389723 () Bool)

(assert (=> b!1506823 m!1389723))

(assert (=> b!1506823 m!1389723))

(assert (=> b!1506823 m!1389721))

(declare-fun m!1389725 () Bool)

(assert (=> b!1506823 m!1389725))

(assert (=> b!1506819 m!1389721))

(assert (=> b!1506819 m!1389721))

(declare-fun m!1389727 () Bool)

(assert (=> b!1506819 m!1389727))

(declare-fun m!1389729 () Bool)

(assert (=> b!1506818 m!1389729))

(assert (=> b!1506818 m!1389729))

(declare-fun m!1389731 () Bool)

(assert (=> b!1506818 m!1389731))

(declare-fun m!1389733 () Bool)

(assert (=> b!1506824 m!1389733))

(declare-fun m!1389735 () Bool)

(assert (=> start!128506 m!1389735))

(declare-fun m!1389737 () Bool)

(assert (=> start!128506 m!1389737))

(push 1)

