; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128772 () Bool)

(assert start!128772)

(declare-fun res!1027405 () Bool)

(declare-fun e!843039 () Bool)

(assert (=> start!128772 (=> (not res!1027405) (not e!843039))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128772 (= res!1027405 (validMask!0 mask!2512))))

(assert (=> start!128772 e!843039))

(assert (=> start!128772 true))

(declare-datatypes ((array!100598 0))(
  ( (array!100599 (arr!48537 (Array (_ BitVec 32) (_ BitVec 64))) (size!49088 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100598)

(declare-fun array_inv!37818 (array!100598) Bool)

(assert (=> start!128772 (array_inv!37818 a!2804)))

(declare-fun b!1508254 () Bool)

(declare-fun res!1027403 () Bool)

(assert (=> b!1508254 (=> (not res!1027403) (not e!843039))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508254 (= res!1027403 (validKeyInArray!0 (select (arr!48537 a!2804) i!961)))))

(declare-fun b!1508255 () Bool)

(declare-fun res!1027404 () Bool)

(assert (=> b!1508255 (=> (not res!1027404) (not e!843039))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508255 (= res!1027404 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49088 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49088 a!2804))))))

(declare-fun b!1508256 () Bool)

(declare-fun res!1027406 () Bool)

(assert (=> b!1508256 (=> (not res!1027406) (not e!843039))))

(declare-datatypes ((List!35007 0))(
  ( (Nil!35004) (Cons!35003 (h!36418 (_ BitVec 64)) (t!49693 List!35007)) )
))
(declare-fun arrayNoDuplicates!0 (array!100598 (_ BitVec 32) List!35007) Bool)

(assert (=> b!1508256 (= res!1027406 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35004))))

(declare-fun b!1508257 () Bool)

(assert (=> b!1508257 (= e!843039 false)))

(declare-fun lt!654895 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508257 (= lt!654895 (toIndex!0 (select (arr!48537 a!2804) j!70) mask!2512))))

(declare-fun b!1508258 () Bool)

(declare-fun res!1027401 () Bool)

(assert (=> b!1508258 (=> (not res!1027401) (not e!843039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100598 (_ BitVec 32)) Bool)

(assert (=> b!1508258 (= res!1027401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508259 () Bool)

(declare-fun res!1027402 () Bool)

(assert (=> b!1508259 (=> (not res!1027402) (not e!843039))))

(assert (=> b!1508259 (= res!1027402 (and (= (size!49088 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49088 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49088 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508260 () Bool)

(declare-fun res!1027400 () Bool)

(assert (=> b!1508260 (=> (not res!1027400) (not e!843039))))

(assert (=> b!1508260 (= res!1027400 (validKeyInArray!0 (select (arr!48537 a!2804) j!70)))))

(assert (= (and start!128772 res!1027405) b!1508259))

(assert (= (and b!1508259 res!1027402) b!1508254))

(assert (= (and b!1508254 res!1027403) b!1508260))

(assert (= (and b!1508260 res!1027400) b!1508258))

(assert (= (and b!1508258 res!1027401) b!1508256))

(assert (= (and b!1508256 res!1027406) b!1508255))

(assert (= (and b!1508255 res!1027404) b!1508257))

(declare-fun m!1391163 () Bool)

(assert (=> b!1508258 m!1391163))

(declare-fun m!1391165 () Bool)

(assert (=> b!1508254 m!1391165))

(assert (=> b!1508254 m!1391165))

(declare-fun m!1391167 () Bool)

(assert (=> b!1508254 m!1391167))

(declare-fun m!1391169 () Bool)

(assert (=> start!128772 m!1391169))

(declare-fun m!1391171 () Bool)

(assert (=> start!128772 m!1391171))

(declare-fun m!1391173 () Bool)

(assert (=> b!1508260 m!1391173))

(assert (=> b!1508260 m!1391173))

(declare-fun m!1391175 () Bool)

(assert (=> b!1508260 m!1391175))

(declare-fun m!1391177 () Bool)

(assert (=> b!1508256 m!1391177))

(assert (=> b!1508257 m!1391173))

(assert (=> b!1508257 m!1391173))

(declare-fun m!1391179 () Bool)

(assert (=> b!1508257 m!1391179))

(push 1)

(assert (not b!1508256))

(assert (not b!1508257))

(assert (not b!1508258))

(assert (not start!128772))

(assert (not b!1508260))

(assert (not b!1508254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

