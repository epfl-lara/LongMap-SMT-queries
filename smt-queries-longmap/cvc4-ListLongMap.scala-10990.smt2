; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128776 () Bool)

(assert start!128776)

(declare-fun b!1508903 () Bool)

(declare-fun res!1028815 () Bool)

(declare-fun e!842925 () Bool)

(assert (=> b!1508903 (=> (not res!1028815) (not e!842925))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100632 0))(
  ( (array!100633 (arr!48553 (Array (_ BitVec 32) (_ BitVec 64))) (size!49103 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100632)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508903 (= res!1028815 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49103 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49103 a!2804))))))

(declare-fun b!1508904 () Bool)

(declare-fun res!1028812 () Bool)

(assert (=> b!1508904 (=> (not res!1028812) (not e!842925))))

(declare-datatypes ((List!35036 0))(
  ( (Nil!35033) (Cons!35032 (h!36444 (_ BitVec 64)) (t!49730 List!35036)) )
))
(declare-fun arrayNoDuplicates!0 (array!100632 (_ BitVec 32) List!35036) Bool)

(assert (=> b!1508904 (= res!1028812 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35033))))

(declare-fun b!1508905 () Bool)

(declare-fun res!1028813 () Bool)

(assert (=> b!1508905 (=> (not res!1028813) (not e!842925))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1508905 (= res!1028813 (and (= (size!49103 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49103 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49103 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508906 () Bool)

(declare-fun res!1028808 () Bool)

(declare-fun e!842924 () Bool)

(assert (=> b!1508906 (=> (not res!1028808) (not e!842924))))

(declare-datatypes ((SeekEntryResult!12724 0))(
  ( (MissingZero!12724 (index!53291 (_ BitVec 32))) (Found!12724 (index!53292 (_ BitVec 32))) (Intermediate!12724 (undefined!13536 Bool) (index!53293 (_ BitVec 32)) (x!135050 (_ BitVec 32))) (Undefined!12724) (MissingVacant!12724 (index!53294 (_ BitVec 32))) )
))
(declare-fun lt!654765 () SeekEntryResult!12724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100632 (_ BitVec 32)) SeekEntryResult!12724)

(assert (=> b!1508906 (= res!1028808 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48553 a!2804) j!70) a!2804 mask!2512) lt!654765))))

(declare-fun res!1028814 () Bool)

(assert (=> start!128776 (=> (not res!1028814) (not e!842925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128776 (= res!1028814 (validMask!0 mask!2512))))

(assert (=> start!128776 e!842925))

(assert (=> start!128776 true))

(declare-fun array_inv!37581 (array!100632) Bool)

(assert (=> start!128776 (array_inv!37581 a!2804)))

(declare-fun b!1508907 () Bool)

(declare-fun res!1028806 () Bool)

(assert (=> b!1508907 (=> (not res!1028806) (not e!842925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100632 (_ BitVec 32)) Bool)

(assert (=> b!1508907 (= res!1028806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508908 () Bool)

(declare-fun e!842926 () Bool)

(assert (=> b!1508908 (= e!842924 e!842926)))

(declare-fun res!1028809 () Bool)

(assert (=> b!1508908 (=> (not res!1028809) (not e!842926))))

(declare-fun lt!654766 () (_ BitVec 32))

(assert (=> b!1508908 (= res!1028809 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge lt!654766 #b00000000000000000000000000000000) (bvslt lt!654766 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508908 (= lt!654766 (toIndex!0 (select (store (arr!48553 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508909 () Bool)

(assert (=> b!1508909 (= e!842925 e!842924)))

(declare-fun res!1028811 () Bool)

(assert (=> b!1508909 (=> (not res!1028811) (not e!842924))))

(assert (=> b!1508909 (= res!1028811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48553 a!2804) j!70) mask!2512) (select (arr!48553 a!2804) j!70) a!2804 mask!2512) lt!654765))))

(assert (=> b!1508909 (= lt!654765 (Intermediate!12724 false resIndex!21 resX!21))))

(declare-fun b!1508910 () Bool)

(declare-fun res!1028810 () Bool)

(assert (=> b!1508910 (=> (not res!1028810) (not e!842925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508910 (= res!1028810 (validKeyInArray!0 (select (arr!48553 a!2804) i!961)))))

(declare-fun b!1508911 () Bool)

(declare-fun res!1028807 () Bool)

(assert (=> b!1508911 (=> (not res!1028807) (not e!842925))))

(assert (=> b!1508911 (= res!1028807 (validKeyInArray!0 (select (arr!48553 a!2804) j!70)))))

(declare-fun b!1508912 () Bool)

(assert (=> b!1508912 (= e!842926 (not (validKeyInArray!0 (select (store (arr!48553 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(assert (= (and start!128776 res!1028814) b!1508905))

(assert (= (and b!1508905 res!1028813) b!1508910))

(assert (= (and b!1508910 res!1028810) b!1508911))

(assert (= (and b!1508911 res!1028807) b!1508907))

(assert (= (and b!1508907 res!1028806) b!1508904))

(assert (= (and b!1508904 res!1028812) b!1508903))

(assert (= (and b!1508903 res!1028815) b!1508909))

(assert (= (and b!1508909 res!1028811) b!1508906))

(assert (= (and b!1508906 res!1028808) b!1508908))

(assert (= (and b!1508908 res!1028809) b!1508912))

(declare-fun m!1391323 () Bool)

(assert (=> b!1508909 m!1391323))

(assert (=> b!1508909 m!1391323))

(declare-fun m!1391325 () Bool)

(assert (=> b!1508909 m!1391325))

(assert (=> b!1508909 m!1391325))

(assert (=> b!1508909 m!1391323))

(declare-fun m!1391327 () Bool)

(assert (=> b!1508909 m!1391327))

(declare-fun m!1391329 () Bool)

(assert (=> b!1508908 m!1391329))

(declare-fun m!1391331 () Bool)

(assert (=> b!1508908 m!1391331))

(assert (=> b!1508908 m!1391331))

(declare-fun m!1391333 () Bool)

(assert (=> b!1508908 m!1391333))

(declare-fun m!1391335 () Bool)

(assert (=> b!1508910 m!1391335))

(assert (=> b!1508910 m!1391335))

(declare-fun m!1391337 () Bool)

(assert (=> b!1508910 m!1391337))

(declare-fun m!1391339 () Bool)

(assert (=> b!1508904 m!1391339))

(declare-fun m!1391341 () Bool)

(assert (=> start!128776 m!1391341))

(declare-fun m!1391343 () Bool)

(assert (=> start!128776 m!1391343))

(assert (=> b!1508911 m!1391323))

(assert (=> b!1508911 m!1391323))

(declare-fun m!1391345 () Bool)

(assert (=> b!1508911 m!1391345))

(declare-fun m!1391347 () Bool)

(assert (=> b!1508907 m!1391347))

(assert (=> b!1508912 m!1391329))

(assert (=> b!1508912 m!1391331))

(assert (=> b!1508912 m!1391331))

(declare-fun m!1391349 () Bool)

(assert (=> b!1508912 m!1391349))

(assert (=> b!1508906 m!1391323))

(assert (=> b!1508906 m!1391323))

(declare-fun m!1391351 () Bool)

(assert (=> b!1508906 m!1391351))

(push 1)

(assert (not b!1508904))

(assert (not b!1508912))

(assert (not b!1508910))

