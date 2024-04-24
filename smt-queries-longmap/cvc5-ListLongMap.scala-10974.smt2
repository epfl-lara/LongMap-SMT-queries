; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128814 () Bool)

(assert start!128814)

(declare-fun b!1508713 () Bool)

(declare-fun res!1027862 () Bool)

(declare-fun e!843164 () Bool)

(assert (=> b!1508713 (=> (not res!1027862) (not e!843164))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((array!100640 0))(
  ( (array!100641 (arr!48558 (Array (_ BitVec 32) (_ BitVec 64))) (size!49109 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100640)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1508713 (= res!1027862 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49109 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49109 a!2804))))))

(declare-fun b!1508714 () Bool)

(declare-fun res!1027864 () Bool)

(assert (=> b!1508714 (=> (not res!1027864) (not e!843164))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100640 (_ BitVec 32)) Bool)

(assert (=> b!1508714 (= res!1027864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508715 () Bool)

(assert (=> b!1508715 (= e!843164 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12622 0))(
  ( (MissingZero!12622 (index!52883 (_ BitVec 32))) (Found!12622 (index!52884 (_ BitVec 32))) (Intermediate!12622 (undefined!13434 Bool) (index!52885 (_ BitVec 32)) (x!134833 (_ BitVec 32))) (Undefined!12622) (MissingVacant!12622 (index!52886 (_ BitVec 32))) )
))
(declare-fun lt!654940 () SeekEntryResult!12622)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100640 (_ BitVec 32)) SeekEntryResult!12622)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508715 (= lt!654940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48558 a!2804) j!70) mask!2512) (select (arr!48558 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1027860 () Bool)

(assert (=> start!128814 (=> (not res!1027860) (not e!843164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128814 (= res!1027860 (validMask!0 mask!2512))))

(assert (=> start!128814 e!843164))

(assert (=> start!128814 true))

(declare-fun array_inv!37839 (array!100640) Bool)

(assert (=> start!128814 (array_inv!37839 a!2804)))

(declare-fun b!1508716 () Bool)

(declare-fun res!1027859 () Bool)

(assert (=> b!1508716 (=> (not res!1027859) (not e!843164))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508716 (= res!1027859 (validKeyInArray!0 (select (arr!48558 a!2804) i!961)))))

(declare-fun b!1508717 () Bool)

(declare-fun res!1027865 () Bool)

(assert (=> b!1508717 (=> (not res!1027865) (not e!843164))))

(assert (=> b!1508717 (= res!1027865 (and (= (size!49109 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49109 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49109 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508718 () Bool)

(declare-fun res!1027863 () Bool)

(assert (=> b!1508718 (=> (not res!1027863) (not e!843164))))

(assert (=> b!1508718 (= res!1027863 (validKeyInArray!0 (select (arr!48558 a!2804) j!70)))))

(declare-fun b!1508719 () Bool)

(declare-fun res!1027861 () Bool)

(assert (=> b!1508719 (=> (not res!1027861) (not e!843164))))

(declare-datatypes ((List!35028 0))(
  ( (Nil!35025) (Cons!35024 (h!36439 (_ BitVec 64)) (t!49714 List!35028)) )
))
(declare-fun arrayNoDuplicates!0 (array!100640 (_ BitVec 32) List!35028) Bool)

(assert (=> b!1508719 (= res!1027861 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35025))))

(assert (= (and start!128814 res!1027860) b!1508717))

(assert (= (and b!1508717 res!1027865) b!1508716))

(assert (= (and b!1508716 res!1027859) b!1508718))

(assert (= (and b!1508718 res!1027863) b!1508714))

(assert (= (and b!1508714 res!1027864) b!1508719))

(assert (= (and b!1508719 res!1027861) b!1508713))

(assert (= (and b!1508713 res!1027862) b!1508715))

(declare-fun m!1391575 () Bool)

(assert (=> start!128814 m!1391575))

(declare-fun m!1391577 () Bool)

(assert (=> start!128814 m!1391577))

(declare-fun m!1391579 () Bool)

(assert (=> b!1508718 m!1391579))

(assert (=> b!1508718 m!1391579))

(declare-fun m!1391581 () Bool)

(assert (=> b!1508718 m!1391581))

(assert (=> b!1508715 m!1391579))

(assert (=> b!1508715 m!1391579))

(declare-fun m!1391583 () Bool)

(assert (=> b!1508715 m!1391583))

(assert (=> b!1508715 m!1391583))

(assert (=> b!1508715 m!1391579))

(declare-fun m!1391585 () Bool)

(assert (=> b!1508715 m!1391585))

(declare-fun m!1391587 () Bool)

(assert (=> b!1508716 m!1391587))

(assert (=> b!1508716 m!1391587))

(declare-fun m!1391589 () Bool)

(assert (=> b!1508716 m!1391589))

(declare-fun m!1391591 () Bool)

(assert (=> b!1508714 m!1391591))

(declare-fun m!1391593 () Bool)

(assert (=> b!1508719 m!1391593))

(push 1)

(assert (not b!1508719))

(assert (not start!128814))

(assert (not b!1508714))

(assert (not b!1508716))

(assert (not b!1508715))

(assert (not b!1508718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

