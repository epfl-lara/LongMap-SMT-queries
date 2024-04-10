; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128508 () Bool)

(assert start!128508)

(declare-fun b!1506839 () Bool)

(declare-fun res!1027163 () Bool)

(declare-fun e!842016 () Bool)

(assert (=> b!1506839 (=> (not res!1027163) (not e!842016))))

(declare-datatypes ((array!100520 0))(
  ( (array!100521 (arr!48503 (Array (_ BitVec 32) (_ BitVec 64))) (size!49053 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100520)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506839 (= res!1027163 (validKeyInArray!0 (select (arr!48503 a!2804) i!961)))))

(declare-fun b!1506840 () Bool)

(declare-fun res!1027165 () Bool)

(assert (=> b!1506840 (=> (not res!1027165) (not e!842016))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100520 (_ BitVec 32)) Bool)

(assert (=> b!1506840 (= res!1027165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506841 () Bool)

(declare-fun res!1027164 () Bool)

(assert (=> b!1506841 (=> (not res!1027164) (not e!842016))))

(declare-datatypes ((List!34986 0))(
  ( (Nil!34983) (Cons!34982 (h!36382 (_ BitVec 64)) (t!49680 List!34986)) )
))
(declare-fun arrayNoDuplicates!0 (array!100520 (_ BitVec 32) List!34986) Bool)

(assert (=> b!1506841 (= res!1027164 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34983))))

(declare-fun res!1027168 () Bool)

(assert (=> start!128508 (=> (not res!1027168) (not e!842016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128508 (= res!1027168 (validMask!0 mask!2512))))

(assert (=> start!128508 e!842016))

(assert (=> start!128508 true))

(declare-fun array_inv!37531 (array!100520) Bool)

(assert (=> start!128508 (array_inv!37531 a!2804)))

(declare-fun b!1506842 () Bool)

(declare-fun res!1027162 () Bool)

(assert (=> b!1506842 (=> (not res!1027162) (not e!842016))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506842 (= res!1027162 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49053 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49053 a!2804))))))

(declare-fun b!1506843 () Bool)

(declare-fun res!1027167 () Bool)

(assert (=> b!1506843 (=> (not res!1027167) (not e!842016))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506843 (= res!1027167 (validKeyInArray!0 (select (arr!48503 a!2804) j!70)))))

(declare-fun b!1506844 () Bool)

(assert (=> b!1506844 (= e!842016 false)))

(declare-datatypes ((SeekEntryResult!12674 0))(
  ( (MissingZero!12674 (index!53091 (_ BitVec 32))) (Found!12674 (index!53092 (_ BitVec 32))) (Intermediate!12674 (undefined!13486 Bool) (index!53093 (_ BitVec 32)) (x!134848 (_ BitVec 32))) (Undefined!12674) (MissingVacant!12674 (index!53094 (_ BitVec 32))) )
))
(declare-fun lt!654271 () SeekEntryResult!12674)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100520 (_ BitVec 32)) SeekEntryResult!12674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506844 (= lt!654271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48503 a!2804) j!70) mask!2512) (select (arr!48503 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506845 () Bool)

(declare-fun res!1027166 () Bool)

(assert (=> b!1506845 (=> (not res!1027166) (not e!842016))))

(assert (=> b!1506845 (= res!1027166 (and (= (size!49053 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49053 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49053 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128508 res!1027168) b!1506845))

(assert (= (and b!1506845 res!1027166) b!1506839))

(assert (= (and b!1506839 res!1027163) b!1506843))

(assert (= (and b!1506843 res!1027167) b!1506840))

(assert (= (and b!1506840 res!1027165) b!1506841))

(assert (= (and b!1506841 res!1027164) b!1506842))

(assert (= (and b!1506842 res!1027162) b!1506844))

(declare-fun m!1389739 () Bool)

(assert (=> b!1506843 m!1389739))

(assert (=> b!1506843 m!1389739))

(declare-fun m!1389741 () Bool)

(assert (=> b!1506843 m!1389741))

(assert (=> b!1506844 m!1389739))

(assert (=> b!1506844 m!1389739))

(declare-fun m!1389743 () Bool)

(assert (=> b!1506844 m!1389743))

(assert (=> b!1506844 m!1389743))

(assert (=> b!1506844 m!1389739))

(declare-fun m!1389745 () Bool)

(assert (=> b!1506844 m!1389745))

(declare-fun m!1389747 () Bool)

(assert (=> b!1506839 m!1389747))

(assert (=> b!1506839 m!1389747))

(declare-fun m!1389749 () Bool)

(assert (=> b!1506839 m!1389749))

(declare-fun m!1389751 () Bool)

(assert (=> b!1506841 m!1389751))

(declare-fun m!1389753 () Bool)

(assert (=> b!1506840 m!1389753))

(declare-fun m!1389755 () Bool)

(assert (=> start!128508 m!1389755))

(declare-fun m!1389757 () Bool)

(assert (=> start!128508 m!1389757))

(push 1)

(assert (not b!1506843))

(assert (not b!1506844))

(assert (not b!1506840))

(assert (not start!128508))

(assert (not b!1506841))

(assert (not b!1506839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

