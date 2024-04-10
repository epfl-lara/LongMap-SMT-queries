; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128770 () Bool)

(assert start!128770)

(declare-fun b!1508814 () Bool)

(declare-fun res!1028717 () Bool)

(declare-fun e!842888 () Bool)

(assert (=> b!1508814 (=> (not res!1028717) (not e!842888))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100626 0))(
  ( (array!100627 (arr!48550 (Array (_ BitVec 32) (_ BitVec 64))) (size!49100 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100626)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508814 (= res!1028717 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49100 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49100 a!2804))))))

(declare-fun b!1508815 () Bool)

(declare-fun res!1028719 () Bool)

(assert (=> b!1508815 (=> (not res!1028719) (not e!842888))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508815 (= res!1028719 (validKeyInArray!0 (select (arr!48550 a!2804) j!70)))))

(declare-fun b!1508816 () Bool)

(declare-fun e!842890 () Bool)

(assert (=> b!1508816 (= e!842888 e!842890)))

(declare-fun res!1028724 () Bool)

(assert (=> b!1508816 (=> (not res!1028724) (not e!842890))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12721 0))(
  ( (MissingZero!12721 (index!53279 (_ BitVec 32))) (Found!12721 (index!53280 (_ BitVec 32))) (Intermediate!12721 (undefined!13533 Bool) (index!53281 (_ BitVec 32)) (x!135039 (_ BitVec 32))) (Undefined!12721) (MissingVacant!12721 (index!53282 (_ BitVec 32))) )
))
(declare-fun lt!654747 () SeekEntryResult!12721)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100626 (_ BitVec 32)) SeekEntryResult!12721)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508816 (= res!1028724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48550 a!2804) j!70) mask!2512) (select (arr!48550 a!2804) j!70) a!2804 mask!2512) lt!654747))))

(assert (=> b!1508816 (= lt!654747 (Intermediate!12721 false resIndex!21 resX!21))))

(declare-fun b!1508817 () Bool)

(declare-fun res!1028725 () Bool)

(assert (=> b!1508817 (=> (not res!1028725) (not e!842888))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508817 (= res!1028725 (and (= (size!49100 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49100 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49100 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1028722 () Bool)

(assert (=> start!128770 (=> (not res!1028722) (not e!842888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128770 (= res!1028722 (validMask!0 mask!2512))))

(assert (=> start!128770 e!842888))

(assert (=> start!128770 true))

(declare-fun array_inv!37578 (array!100626) Bool)

(assert (=> start!128770 (array_inv!37578 a!2804)))

(declare-fun b!1508818 () Bool)

(assert (=> b!1508818 (= e!842890 false)))

(declare-fun lt!654748 () (_ BitVec 32))

(assert (=> b!1508818 (= lt!654748 (toIndex!0 (select (store (arr!48550 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508819 () Bool)

(declare-fun res!1028718 () Bool)

(assert (=> b!1508819 (=> (not res!1028718) (not e!842888))))

(assert (=> b!1508819 (= res!1028718 (validKeyInArray!0 (select (arr!48550 a!2804) i!961)))))

(declare-fun b!1508820 () Bool)

(declare-fun res!1028720 () Bool)

(assert (=> b!1508820 (=> (not res!1028720) (not e!842888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100626 (_ BitVec 32)) Bool)

(assert (=> b!1508820 (= res!1028720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508821 () Bool)

(declare-fun res!1028721 () Bool)

(assert (=> b!1508821 (=> (not res!1028721) (not e!842890))))

(assert (=> b!1508821 (= res!1028721 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48550 a!2804) j!70) a!2804 mask!2512) lt!654747))))

(declare-fun b!1508822 () Bool)

(declare-fun res!1028723 () Bool)

(assert (=> b!1508822 (=> (not res!1028723) (not e!842888))))

(declare-datatypes ((List!35033 0))(
  ( (Nil!35030) (Cons!35029 (h!36441 (_ BitVec 64)) (t!49727 List!35033)) )
))
(declare-fun arrayNoDuplicates!0 (array!100626 (_ BitVec 32) List!35033) Bool)

(assert (=> b!1508822 (= res!1028723 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35030))))

(assert (= (and start!128770 res!1028722) b!1508817))

(assert (= (and b!1508817 res!1028725) b!1508819))

(assert (= (and b!1508819 res!1028718) b!1508815))

(assert (= (and b!1508815 res!1028719) b!1508820))

(assert (= (and b!1508820 res!1028720) b!1508822))

(assert (= (and b!1508822 res!1028723) b!1508814))

(assert (= (and b!1508814 res!1028717) b!1508816))

(assert (= (and b!1508816 res!1028724) b!1508821))

(assert (= (and b!1508821 res!1028721) b!1508818))

(declare-fun m!1391235 () Bool)

(assert (=> start!128770 m!1391235))

(declare-fun m!1391237 () Bool)

(assert (=> start!128770 m!1391237))

(declare-fun m!1391239 () Bool)

(assert (=> b!1508822 m!1391239))

(declare-fun m!1391241 () Bool)

(assert (=> b!1508815 m!1391241))

(assert (=> b!1508815 m!1391241))

(declare-fun m!1391243 () Bool)

(assert (=> b!1508815 m!1391243))

(declare-fun m!1391245 () Bool)

(assert (=> b!1508820 m!1391245))

(declare-fun m!1391247 () Bool)

(assert (=> b!1508818 m!1391247))

(declare-fun m!1391249 () Bool)

(assert (=> b!1508818 m!1391249))

(assert (=> b!1508818 m!1391249))

(declare-fun m!1391251 () Bool)

(assert (=> b!1508818 m!1391251))

(declare-fun m!1391253 () Bool)

(assert (=> b!1508819 m!1391253))

(assert (=> b!1508819 m!1391253))

(declare-fun m!1391255 () Bool)

(assert (=> b!1508819 m!1391255))

(assert (=> b!1508821 m!1391241))

(assert (=> b!1508821 m!1391241))

(declare-fun m!1391257 () Bool)

(assert (=> b!1508821 m!1391257))

(assert (=> b!1508816 m!1391241))

(assert (=> b!1508816 m!1391241))

(declare-fun m!1391259 () Bool)

(assert (=> b!1508816 m!1391259))

(assert (=> b!1508816 m!1391259))

(assert (=> b!1508816 m!1391241))

(declare-fun m!1391261 () Bool)

(assert (=> b!1508816 m!1391261))

(push 1)

(assert (not start!128770))

(assert (not b!1508822))

(assert (not b!1508819))

(assert (not b!1508821))

(assert (not b!1508818))

