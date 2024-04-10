; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129626 () Bool)

(assert start!129626)

(declare-fun b!1521759 () Bool)

(declare-fun res!1040986 () Bool)

(declare-fun e!848634 () Bool)

(assert (=> b!1521759 (=> (not res!1040986) (not e!848634))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101301 0))(
  ( (array!101302 (arr!48883 (Array (_ BitVec 32) (_ BitVec 64))) (size!49433 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101301)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521759 (= res!1040986 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49433 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49433 a!2804))))))

(declare-fun res!1040985 () Bool)

(assert (=> start!129626 (=> (not res!1040985) (not e!848634))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129626 (= res!1040985 (validMask!0 mask!2512))))

(assert (=> start!129626 e!848634))

(assert (=> start!129626 true))

(declare-fun array_inv!37911 (array!101301) Bool)

(assert (=> start!129626 (array_inv!37911 a!2804)))

(declare-fun b!1521760 () Bool)

(declare-fun res!1040983 () Bool)

(assert (=> b!1521760 (=> (not res!1040983) (not e!848634))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521760 (= res!1040983 (validKeyInArray!0 (select (arr!48883 a!2804) j!70)))))

(declare-fun b!1521761 () Bool)

(declare-fun e!848635 () Bool)

(assert (=> b!1521761 (= e!848635 false)))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13048 0))(
  ( (MissingZero!13048 (index!54587 (_ BitVec 32))) (Found!13048 (index!54588 (_ BitVec 32))) (Intermediate!13048 (undefined!13860 Bool) (index!54589 (_ BitVec 32)) (x!136276 (_ BitVec 32))) (Undefined!13048) (MissingVacant!13048 (index!54590 (_ BitVec 32))) )
))
(declare-fun lt!659422 () SeekEntryResult!13048)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101301 (_ BitVec 32)) SeekEntryResult!13048)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521761 (= lt!659422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48883 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48883 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101302 (store (arr!48883 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49433 a!2804)) mask!2512))))

(declare-fun b!1521762 () Bool)

(declare-fun res!1040981 () Bool)

(assert (=> b!1521762 (=> (not res!1040981) (not e!848634))))

(assert (=> b!1521762 (= res!1040981 (and (= (size!49433 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49433 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49433 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521763 () Bool)

(declare-fun res!1040984 () Bool)

(assert (=> b!1521763 (=> (not res!1040984) (not e!848634))))

(declare-datatypes ((List!35366 0))(
  ( (Nil!35363) (Cons!35362 (h!36783 (_ BitVec 64)) (t!50060 List!35366)) )
))
(declare-fun arrayNoDuplicates!0 (array!101301 (_ BitVec 32) List!35366) Bool)

(assert (=> b!1521763 (= res!1040984 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35363))))

(declare-fun b!1521764 () Bool)

(declare-fun res!1040988 () Bool)

(assert (=> b!1521764 (=> (not res!1040988) (not e!848634))))

(assert (=> b!1521764 (= res!1040988 (validKeyInArray!0 (select (arr!48883 a!2804) i!961)))))

(declare-fun b!1521765 () Bool)

(assert (=> b!1521765 (= e!848634 e!848635)))

(declare-fun res!1040989 () Bool)

(assert (=> b!1521765 (=> (not res!1040989) (not e!848635))))

(declare-fun lt!659421 () SeekEntryResult!13048)

(assert (=> b!1521765 (= res!1040989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48883 a!2804) j!70) mask!2512) (select (arr!48883 a!2804) j!70) a!2804 mask!2512) lt!659421))))

(assert (=> b!1521765 (= lt!659421 (Intermediate!13048 false resIndex!21 resX!21))))

(declare-fun b!1521766 () Bool)

(declare-fun res!1040982 () Bool)

(assert (=> b!1521766 (=> (not res!1040982) (not e!848635))))

(assert (=> b!1521766 (= res!1040982 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48883 a!2804) j!70) a!2804 mask!2512) lt!659421))))

(declare-fun b!1521767 () Bool)

(declare-fun res!1040987 () Bool)

(assert (=> b!1521767 (=> (not res!1040987) (not e!848634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101301 (_ BitVec 32)) Bool)

(assert (=> b!1521767 (= res!1040987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129626 res!1040985) b!1521762))

(assert (= (and b!1521762 res!1040981) b!1521764))

(assert (= (and b!1521764 res!1040988) b!1521760))

(assert (= (and b!1521760 res!1040983) b!1521767))

(assert (= (and b!1521767 res!1040987) b!1521763))

(assert (= (and b!1521763 res!1040984) b!1521759))

(assert (= (and b!1521759 res!1040986) b!1521765))

(assert (= (and b!1521765 res!1040989) b!1521766))

(assert (= (and b!1521766 res!1040982) b!1521761))

(declare-fun m!1404869 () Bool)

(assert (=> b!1521766 m!1404869))

(assert (=> b!1521766 m!1404869))

(declare-fun m!1404871 () Bool)

(assert (=> b!1521766 m!1404871))

(declare-fun m!1404873 () Bool)

(assert (=> b!1521763 m!1404873))

(declare-fun m!1404875 () Bool)

(assert (=> b!1521761 m!1404875))

(declare-fun m!1404877 () Bool)

(assert (=> b!1521761 m!1404877))

(assert (=> b!1521761 m!1404877))

(declare-fun m!1404879 () Bool)

(assert (=> b!1521761 m!1404879))

(assert (=> b!1521761 m!1404879))

(assert (=> b!1521761 m!1404877))

(declare-fun m!1404881 () Bool)

(assert (=> b!1521761 m!1404881))

(assert (=> b!1521760 m!1404869))

(assert (=> b!1521760 m!1404869))

(declare-fun m!1404883 () Bool)

(assert (=> b!1521760 m!1404883))

(assert (=> b!1521765 m!1404869))

(assert (=> b!1521765 m!1404869))

(declare-fun m!1404885 () Bool)

(assert (=> b!1521765 m!1404885))

(assert (=> b!1521765 m!1404885))

(assert (=> b!1521765 m!1404869))

(declare-fun m!1404887 () Bool)

(assert (=> b!1521765 m!1404887))

(declare-fun m!1404889 () Bool)

(assert (=> b!1521767 m!1404889))

(declare-fun m!1404891 () Bool)

(assert (=> start!129626 m!1404891))

(declare-fun m!1404893 () Bool)

(assert (=> start!129626 m!1404893))

(declare-fun m!1404895 () Bool)

(assert (=> b!1521764 m!1404895))

(assert (=> b!1521764 m!1404895))

(declare-fun m!1404897 () Bool)

(assert (=> b!1521764 m!1404897))

(push 1)

(assert (not b!1521760))

(assert (not b!1521761))

(assert (not b!1521766))

(assert (not b!1521764))

(assert (not start!129626))

(assert (not b!1521767))

(assert (not b!1521765))

