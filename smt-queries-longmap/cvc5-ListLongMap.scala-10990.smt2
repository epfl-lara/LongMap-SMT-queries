; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128772 () Bool)

(assert start!128772)

(declare-fun res!1028749 () Bool)

(declare-fun e!842900 () Bool)

(assert (=> start!128772 (=> (not res!1028749) (not e!842900))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128772 (= res!1028749 (validMask!0 mask!2512))))

(assert (=> start!128772 e!842900))

(assert (=> start!128772 true))

(declare-datatypes ((array!100628 0))(
  ( (array!100629 (arr!48551 (Array (_ BitVec 32) (_ BitVec 64))) (size!49101 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100628)

(declare-fun array_inv!37579 (array!100628) Bool)

(assert (=> start!128772 (array_inv!37579 a!2804)))

(declare-fun b!1508843 () Bool)

(declare-fun res!1028755 () Bool)

(assert (=> b!1508843 (=> (not res!1028755) (not e!842900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100628 (_ BitVec 32)) Bool)

(assert (=> b!1508843 (= res!1028755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508844 () Bool)

(declare-fun res!1028751 () Bool)

(assert (=> b!1508844 (=> (not res!1028751) (not e!842900))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508844 (= res!1028751 (validKeyInArray!0 (select (arr!48551 a!2804) i!961)))))

(declare-fun b!1508845 () Bool)

(declare-fun res!1028746 () Bool)

(declare-fun e!842902 () Bool)

(assert (=> b!1508845 (=> (not res!1028746) (not e!842902))))

(declare-datatypes ((SeekEntryResult!12722 0))(
  ( (MissingZero!12722 (index!53283 (_ BitVec 32))) (Found!12722 (index!53284 (_ BitVec 32))) (Intermediate!12722 (undefined!13534 Bool) (index!53285 (_ BitVec 32)) (x!135048 (_ BitVec 32))) (Undefined!12722) (MissingVacant!12722 (index!53286 (_ BitVec 32))) )
))
(declare-fun lt!654753 () SeekEntryResult!12722)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100628 (_ BitVec 32)) SeekEntryResult!12722)

(assert (=> b!1508845 (= res!1028746 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48551 a!2804) j!70) a!2804 mask!2512) lt!654753))))

(declare-fun b!1508846 () Bool)

(declare-fun res!1028747 () Bool)

(assert (=> b!1508846 (=> (not res!1028747) (not e!842900))))

(declare-datatypes ((List!35034 0))(
  ( (Nil!35031) (Cons!35030 (h!36442 (_ BitVec 64)) (t!49728 List!35034)) )
))
(declare-fun arrayNoDuplicates!0 (array!100628 (_ BitVec 32) List!35034) Bool)

(assert (=> b!1508846 (= res!1028747 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35031))))

(declare-fun b!1508847 () Bool)

(declare-fun res!1028752 () Bool)

(assert (=> b!1508847 (=> (not res!1028752) (not e!842900))))

(assert (=> b!1508847 (= res!1028752 (and (= (size!49101 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49101 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49101 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508848 () Bool)

(declare-fun res!1028748 () Bool)

(assert (=> b!1508848 (=> (not res!1028748) (not e!842900))))

(assert (=> b!1508848 (= res!1028748 (validKeyInArray!0 (select (arr!48551 a!2804) j!70)))))

(declare-fun b!1508849 () Bool)

(declare-fun e!842899 () Bool)

(assert (=> b!1508849 (= e!842899 (not (validKeyInArray!0 (select (store (arr!48551 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(declare-fun b!1508850 () Bool)

(assert (=> b!1508850 (= e!842902 e!842899)))

(declare-fun res!1028753 () Bool)

(assert (=> b!1508850 (=> (not res!1028753) (not e!842899))))

(declare-fun lt!654754 () (_ BitVec 32))

(assert (=> b!1508850 (= res!1028753 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge lt!654754 #b00000000000000000000000000000000) (bvslt lt!654754 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508850 (= lt!654754 (toIndex!0 (select (store (arr!48551 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508851 () Bool)

(assert (=> b!1508851 (= e!842900 e!842902)))

(declare-fun res!1028754 () Bool)

(assert (=> b!1508851 (=> (not res!1028754) (not e!842902))))

(assert (=> b!1508851 (= res!1028754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48551 a!2804) j!70) mask!2512) (select (arr!48551 a!2804) j!70) a!2804 mask!2512) lt!654753))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508851 (= lt!654753 (Intermediate!12722 false resIndex!21 resX!21))))

(declare-fun b!1508852 () Bool)

(declare-fun res!1028750 () Bool)

(assert (=> b!1508852 (=> (not res!1028750) (not e!842900))))

(assert (=> b!1508852 (= res!1028750 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49101 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49101 a!2804))))))

(assert (= (and start!128772 res!1028749) b!1508847))

(assert (= (and b!1508847 res!1028752) b!1508844))

(assert (= (and b!1508844 res!1028751) b!1508848))

(assert (= (and b!1508848 res!1028748) b!1508843))

(assert (= (and b!1508843 res!1028755) b!1508846))

(assert (= (and b!1508846 res!1028747) b!1508852))

(assert (= (and b!1508852 res!1028750) b!1508851))

(assert (= (and b!1508851 res!1028754) b!1508845))

(assert (= (and b!1508845 res!1028746) b!1508850))

(assert (= (and b!1508850 res!1028753) b!1508849))

(declare-fun m!1391263 () Bool)

(assert (=> b!1508843 m!1391263))

(declare-fun m!1391265 () Bool)

(assert (=> b!1508844 m!1391265))

(assert (=> b!1508844 m!1391265))

(declare-fun m!1391267 () Bool)

(assert (=> b!1508844 m!1391267))

(declare-fun m!1391269 () Bool)

(assert (=> start!128772 m!1391269))

(declare-fun m!1391271 () Bool)

(assert (=> start!128772 m!1391271))

(declare-fun m!1391273 () Bool)

(assert (=> b!1508849 m!1391273))

(declare-fun m!1391275 () Bool)

(assert (=> b!1508849 m!1391275))

(assert (=> b!1508849 m!1391275))

(declare-fun m!1391277 () Bool)

(assert (=> b!1508849 m!1391277))

(declare-fun m!1391279 () Bool)

(assert (=> b!1508845 m!1391279))

(assert (=> b!1508845 m!1391279))

(declare-fun m!1391281 () Bool)

(assert (=> b!1508845 m!1391281))

(declare-fun m!1391283 () Bool)

(assert (=> b!1508846 m!1391283))

(assert (=> b!1508850 m!1391273))

(assert (=> b!1508850 m!1391275))

(assert (=> b!1508850 m!1391275))

(declare-fun m!1391285 () Bool)

(assert (=> b!1508850 m!1391285))

(assert (=> b!1508851 m!1391279))

(assert (=> b!1508851 m!1391279))

(declare-fun m!1391287 () Bool)

(assert (=> b!1508851 m!1391287))

(assert (=> b!1508851 m!1391287))

(assert (=> b!1508851 m!1391279))

(declare-fun m!1391289 () Bool)

(assert (=> b!1508851 m!1391289))

(assert (=> b!1508848 m!1391279))

(assert (=> b!1508848 m!1391279))

(declare-fun m!1391291 () Bool)

(assert (=> b!1508848 m!1391291))

(push 1)

