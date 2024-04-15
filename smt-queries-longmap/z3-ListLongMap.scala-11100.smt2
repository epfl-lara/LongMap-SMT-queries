; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129570 () Bool)

(assert start!129570)

(declare-fun b!1521365 () Bool)

(declare-fun e!848401 () Bool)

(declare-fun e!848402 () Bool)

(assert (=> b!1521365 (= e!848401 e!848402)))

(declare-fun res!1040801 () Bool)

(assert (=> b!1521365 (=> (not res!1040801) (not e!848402))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13044 0))(
  ( (MissingZero!13044 (index!54571 (_ BitVec 32))) (Found!13044 (index!54572 (_ BitVec 32))) (Intermediate!13044 (undefined!13856 Bool) (index!54573 (_ BitVec 32)) (x!136266 (_ BitVec 32))) (Undefined!13044) (MissingVacant!13044 (index!54574 (_ BitVec 32))) )
))
(declare-fun lt!659115 () SeekEntryResult!13044)

(declare-datatypes ((array!101245 0))(
  ( (array!101246 (arr!48856 (Array (_ BitVec 32) (_ BitVec 64))) (size!49408 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101245)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101245 (_ BitVec 32)) SeekEntryResult!13044)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521365 (= res!1040801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48856 a!2804) j!70) mask!2512) (select (arr!48856 a!2804) j!70) a!2804 mask!2512) lt!659115))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521365 (= lt!659115 (Intermediate!13044 false resIndex!21 resX!21))))

(declare-fun b!1521366 () Bool)

(declare-fun res!1040797 () Bool)

(assert (=> b!1521366 (=> (not res!1040797) (not e!848401))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521366 (= res!1040797 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49408 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49408 a!2804))))))

(declare-fun b!1521367 () Bool)

(declare-fun res!1040794 () Bool)

(assert (=> b!1521367 (=> (not res!1040794) (not e!848402))))

(assert (=> b!1521367 (= res!1040794 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48856 a!2804) j!70) a!2804 mask!2512) lt!659115))))

(declare-fun b!1521368 () Bool)

(assert (=> b!1521368 (= e!848402 false)))

(declare-fun lt!659114 () SeekEntryResult!13044)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521368 (= lt!659114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48856 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48856 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101246 (store (arr!48856 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49408 a!2804)) mask!2512))))

(declare-fun b!1521369 () Bool)

(declare-fun res!1040800 () Bool)

(assert (=> b!1521369 (=> (not res!1040800) (not e!848401))))

(declare-datatypes ((List!35417 0))(
  ( (Nil!35414) (Cons!35413 (h!36835 (_ BitVec 64)) (t!50103 List!35417)) )
))
(declare-fun arrayNoDuplicates!0 (array!101245 (_ BitVec 32) List!35417) Bool)

(assert (=> b!1521369 (= res!1040800 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35414))))

(declare-fun b!1521370 () Bool)

(declare-fun res!1040795 () Bool)

(assert (=> b!1521370 (=> (not res!1040795) (not e!848401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521370 (= res!1040795 (validKeyInArray!0 (select (arr!48856 a!2804) i!961)))))

(declare-fun b!1521371 () Bool)

(declare-fun res!1040799 () Bool)

(assert (=> b!1521371 (=> (not res!1040799) (not e!848401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101245 (_ BitVec 32)) Bool)

(assert (=> b!1521371 (= res!1040799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521372 () Bool)

(declare-fun res!1040793 () Bool)

(assert (=> b!1521372 (=> (not res!1040793) (not e!848401))))

(assert (=> b!1521372 (= res!1040793 (validKeyInArray!0 (select (arr!48856 a!2804) j!70)))))

(declare-fun res!1040798 () Bool)

(assert (=> start!129570 (=> (not res!1040798) (not e!848401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129570 (= res!1040798 (validMask!0 mask!2512))))

(assert (=> start!129570 e!848401))

(assert (=> start!129570 true))

(declare-fun array_inv!38089 (array!101245) Bool)

(assert (=> start!129570 (array_inv!38089 a!2804)))

(declare-fun b!1521373 () Bool)

(declare-fun res!1040796 () Bool)

(assert (=> b!1521373 (=> (not res!1040796) (not e!848401))))

(assert (=> b!1521373 (= res!1040796 (and (= (size!49408 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49408 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49408 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129570 res!1040798) b!1521373))

(assert (= (and b!1521373 res!1040796) b!1521370))

(assert (= (and b!1521370 res!1040795) b!1521372))

(assert (= (and b!1521372 res!1040793) b!1521371))

(assert (= (and b!1521371 res!1040799) b!1521369))

(assert (= (and b!1521369 res!1040800) b!1521366))

(assert (= (and b!1521366 res!1040797) b!1521365))

(assert (= (and b!1521365 res!1040801) b!1521367))

(assert (= (and b!1521367 res!1040794) b!1521368))

(declare-fun m!1403901 () Bool)

(assert (=> b!1521369 m!1403901))

(declare-fun m!1403903 () Bool)

(assert (=> b!1521370 m!1403903))

(assert (=> b!1521370 m!1403903))

(declare-fun m!1403905 () Bool)

(assert (=> b!1521370 m!1403905))

(declare-fun m!1403907 () Bool)

(assert (=> b!1521368 m!1403907))

(declare-fun m!1403909 () Bool)

(assert (=> b!1521368 m!1403909))

(assert (=> b!1521368 m!1403909))

(declare-fun m!1403911 () Bool)

(assert (=> b!1521368 m!1403911))

(assert (=> b!1521368 m!1403911))

(assert (=> b!1521368 m!1403909))

(declare-fun m!1403913 () Bool)

(assert (=> b!1521368 m!1403913))

(declare-fun m!1403915 () Bool)

(assert (=> start!129570 m!1403915))

(declare-fun m!1403917 () Bool)

(assert (=> start!129570 m!1403917))

(declare-fun m!1403919 () Bool)

(assert (=> b!1521371 m!1403919))

(declare-fun m!1403921 () Bool)

(assert (=> b!1521372 m!1403921))

(assert (=> b!1521372 m!1403921))

(declare-fun m!1403923 () Bool)

(assert (=> b!1521372 m!1403923))

(assert (=> b!1521365 m!1403921))

(assert (=> b!1521365 m!1403921))

(declare-fun m!1403925 () Bool)

(assert (=> b!1521365 m!1403925))

(assert (=> b!1521365 m!1403925))

(assert (=> b!1521365 m!1403921))

(declare-fun m!1403927 () Bool)

(assert (=> b!1521365 m!1403927))

(assert (=> b!1521367 m!1403921))

(assert (=> b!1521367 m!1403921))

(declare-fun m!1403929 () Bool)

(assert (=> b!1521367 m!1403929))

(check-sat (not b!1521372) (not b!1521365) (not b!1521369) (not b!1521370) (not b!1521367) (not start!129570) (not b!1521368) (not b!1521371))
(check-sat)
