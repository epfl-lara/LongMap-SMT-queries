; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129092 () Bool)

(assert start!129092)

(declare-fun b!1510925 () Bool)

(declare-fun e!844124 () Bool)

(assert (=> b!1510925 (= e!844124 false)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100762 0))(
  ( (array!100763 (arr!48613 (Array (_ BitVec 32) (_ BitVec 64))) (size!49164 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100762)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12677 0))(
  ( (MissingZero!12677 (index!53103 (_ BitVec 32))) (Found!12677 (index!53104 (_ BitVec 32))) (Intermediate!12677 (undefined!13489 Bool) (index!53105 (_ BitVec 32)) (x!135064 (_ BitVec 32))) (Undefined!12677) (MissingVacant!12677 (index!53106 (_ BitVec 32))) )
))
(declare-fun lt!655471 () SeekEntryResult!12677)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100762 (_ BitVec 32)) SeekEntryResult!12677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510925 (= lt!655471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100763 (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49164 a!2804)) mask!2512))))

(declare-fun b!1510926 () Bool)

(declare-fun res!1029655 () Bool)

(declare-fun e!844125 () Bool)

(assert (=> b!1510926 (=> (not res!1029655) (not e!844125))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510926 (= res!1029655 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49164 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49164 a!2804))))))

(declare-fun b!1510927 () Bool)

(declare-fun res!1029651 () Bool)

(assert (=> b!1510927 (=> (not res!1029651) (not e!844125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100762 (_ BitVec 32)) Bool)

(assert (=> b!1510927 (= res!1029651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510928 () Bool)

(declare-fun res!1029653 () Bool)

(assert (=> b!1510928 (=> (not res!1029653) (not e!844125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510928 (= res!1029653 (validKeyInArray!0 (select (arr!48613 a!2804) j!70)))))

(declare-fun b!1510929 () Bool)

(declare-fun res!1029657 () Bool)

(assert (=> b!1510929 (=> (not res!1029657) (not e!844125))))

(assert (=> b!1510929 (= res!1029657 (and (= (size!49164 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49164 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49164 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1029656 () Bool)

(assert (=> start!129092 (=> (not res!1029656) (not e!844125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129092 (= res!1029656 (validMask!0 mask!2512))))

(assert (=> start!129092 e!844125))

(assert (=> start!129092 true))

(declare-fun array_inv!37894 (array!100762) Bool)

(assert (=> start!129092 (array_inv!37894 a!2804)))

(declare-fun b!1510930 () Bool)

(declare-fun res!1029652 () Bool)

(assert (=> b!1510930 (=> (not res!1029652) (not e!844125))))

(declare-datatypes ((List!35083 0))(
  ( (Nil!35080) (Cons!35079 (h!36506 (_ BitVec 64)) (t!49769 List!35083)) )
))
(declare-fun arrayNoDuplicates!0 (array!100762 (_ BitVec 32) List!35083) Bool)

(assert (=> b!1510930 (= res!1029652 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35080))))

(declare-fun b!1510931 () Bool)

(declare-fun res!1029654 () Bool)

(assert (=> b!1510931 (=> (not res!1029654) (not e!844125))))

(assert (=> b!1510931 (= res!1029654 (validKeyInArray!0 (select (arr!48613 a!2804) i!961)))))

(declare-fun b!1510932 () Bool)

(declare-fun res!1029659 () Bool)

(assert (=> b!1510932 (=> (not res!1029659) (not e!844124))))

(declare-fun lt!655470 () SeekEntryResult!12677)

(assert (=> b!1510932 (= res!1029659 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48613 a!2804) j!70) a!2804 mask!2512) lt!655470))))

(declare-fun b!1510933 () Bool)

(assert (=> b!1510933 (= e!844125 e!844124)))

(declare-fun res!1029658 () Bool)

(assert (=> b!1510933 (=> (not res!1029658) (not e!844124))))

(assert (=> b!1510933 (= res!1029658 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48613 a!2804) j!70) mask!2512) (select (arr!48613 a!2804) j!70) a!2804 mask!2512) lt!655470))))

(assert (=> b!1510933 (= lt!655470 (Intermediate!12677 false resIndex!21 resX!21))))

(assert (= (and start!129092 res!1029656) b!1510929))

(assert (= (and b!1510929 res!1029657) b!1510931))

(assert (= (and b!1510931 res!1029654) b!1510928))

(assert (= (and b!1510928 res!1029653) b!1510927))

(assert (= (and b!1510927 res!1029651) b!1510930))

(assert (= (and b!1510930 res!1029652) b!1510926))

(assert (= (and b!1510926 res!1029655) b!1510933))

(assert (= (and b!1510933 res!1029658) b!1510932))

(assert (= (and b!1510932 res!1029659) b!1510925))

(declare-fun m!1393329 () Bool)

(assert (=> start!129092 m!1393329))

(declare-fun m!1393331 () Bool)

(assert (=> start!129092 m!1393331))

(declare-fun m!1393333 () Bool)

(assert (=> b!1510925 m!1393333))

(declare-fun m!1393335 () Bool)

(assert (=> b!1510925 m!1393335))

(assert (=> b!1510925 m!1393335))

(declare-fun m!1393337 () Bool)

(assert (=> b!1510925 m!1393337))

(assert (=> b!1510925 m!1393337))

(assert (=> b!1510925 m!1393335))

(declare-fun m!1393339 () Bool)

(assert (=> b!1510925 m!1393339))

(declare-fun m!1393341 () Bool)

(assert (=> b!1510927 m!1393341))

(declare-fun m!1393343 () Bool)

(assert (=> b!1510933 m!1393343))

(assert (=> b!1510933 m!1393343))

(declare-fun m!1393345 () Bool)

(assert (=> b!1510933 m!1393345))

(assert (=> b!1510933 m!1393345))

(assert (=> b!1510933 m!1393343))

(declare-fun m!1393347 () Bool)

(assert (=> b!1510933 m!1393347))

(assert (=> b!1510928 m!1393343))

(assert (=> b!1510928 m!1393343))

(declare-fun m!1393349 () Bool)

(assert (=> b!1510928 m!1393349))

(assert (=> b!1510932 m!1393343))

(assert (=> b!1510932 m!1393343))

(declare-fun m!1393351 () Bool)

(assert (=> b!1510932 m!1393351))

(declare-fun m!1393353 () Bool)

(assert (=> b!1510931 m!1393353))

(assert (=> b!1510931 m!1393353))

(declare-fun m!1393355 () Bool)

(assert (=> b!1510931 m!1393355))

(declare-fun m!1393357 () Bool)

(assert (=> b!1510930 m!1393357))

(check-sat (not b!1510927) (not b!1510928) (not b!1510930) (not b!1510932) (not b!1510931) (not b!1510925) (not b!1510933) (not start!129092))
(check-sat)
