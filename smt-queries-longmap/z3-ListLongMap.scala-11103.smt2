; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129642 () Bool)

(assert start!129642)

(declare-fun b!1521989 () Bool)

(declare-fun e!848707 () Bool)

(declare-fun e!848706 () Bool)

(assert (=> b!1521989 (= e!848707 e!848706)))

(declare-fun res!1041218 () Bool)

(assert (=> b!1521989 (=> (not res!1041218) (not e!848706))))

(declare-datatypes ((SeekEntryResult!13056 0))(
  ( (MissingZero!13056 (index!54619 (_ BitVec 32))) (Found!13056 (index!54620 (_ BitVec 32))) (Intermediate!13056 (undefined!13868 Bool) (index!54621 (_ BitVec 32)) (x!136308 (_ BitVec 32))) (Undefined!13056) (MissingVacant!13056 (index!54622 (_ BitVec 32))) )
))
(declare-fun lt!659470 () SeekEntryResult!13056)

(declare-fun lt!659469 () SeekEntryResult!13056)

(assert (=> b!1521989 (= res!1041218 (= lt!659470 lt!659469))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521989 (= lt!659469 (Intermediate!13056 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101317 0))(
  ( (array!101318 (arr!48891 (Array (_ BitVec 32) (_ BitVec 64))) (size!49441 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101317)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101317 (_ BitVec 32)) SeekEntryResult!13056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521989 (= lt!659470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48891 a!2804) j!70) mask!2512) (select (arr!48891 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521990 () Bool)

(declare-fun res!1041220 () Bool)

(assert (=> b!1521990 (=> (not res!1041220) (not e!848707))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521990 (= res!1041220 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49441 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49441 a!2804))))))

(declare-fun b!1521991 () Bool)

(declare-fun res!1041219 () Bool)

(assert (=> b!1521991 (=> (not res!1041219) (not e!848707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101317 (_ BitVec 32)) Bool)

(assert (=> b!1521991 (= res!1041219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521992 () Bool)

(declare-fun res!1041217 () Bool)

(assert (=> b!1521992 (=> (not res!1041217) (not e!848706))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521992 (= res!1041217 (= lt!659470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48891 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48891 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101318 (store (arr!48891 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49441 a!2804)) mask!2512)))))

(declare-fun b!1521993 () Bool)

(declare-fun res!1041213 () Bool)

(assert (=> b!1521993 (=> (not res!1041213) (not e!848707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521993 (= res!1041213 (validKeyInArray!0 (select (arr!48891 a!2804) j!70)))))

(declare-fun b!1521994 () Bool)

(assert (=> b!1521994 (= e!848706 (and (bvsle #b00000000000000000000000000000000 (size!49441 a!2804)) (bvsgt j!70 (size!49441 a!2804))))))

(declare-fun b!1521995 () Bool)

(declare-fun res!1041211 () Bool)

(assert (=> b!1521995 (=> (not res!1041211) (not e!848706))))

(assert (=> b!1521995 (= res!1041211 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48891 a!2804) j!70) a!2804 mask!2512) lt!659469))))

(declare-fun res!1041215 () Bool)

(assert (=> start!129642 (=> (not res!1041215) (not e!848707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129642 (= res!1041215 (validMask!0 mask!2512))))

(assert (=> start!129642 e!848707))

(assert (=> start!129642 true))

(declare-fun array_inv!37919 (array!101317) Bool)

(assert (=> start!129642 (array_inv!37919 a!2804)))

(declare-fun b!1521996 () Bool)

(declare-fun res!1041212 () Bool)

(assert (=> b!1521996 (=> (not res!1041212) (not e!848707))))

(declare-datatypes ((List!35374 0))(
  ( (Nil!35371) (Cons!35370 (h!36791 (_ BitVec 64)) (t!50068 List!35374)) )
))
(declare-fun arrayNoDuplicates!0 (array!101317 (_ BitVec 32) List!35374) Bool)

(assert (=> b!1521996 (= res!1041212 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35371))))

(declare-fun b!1521997 () Bool)

(declare-fun res!1041214 () Bool)

(assert (=> b!1521997 (=> (not res!1041214) (not e!848707))))

(assert (=> b!1521997 (= res!1041214 (and (= (size!49441 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49441 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49441 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521998 () Bool)

(declare-fun res!1041216 () Bool)

(assert (=> b!1521998 (=> (not res!1041216) (not e!848707))))

(assert (=> b!1521998 (= res!1041216 (validKeyInArray!0 (select (arr!48891 a!2804) i!961)))))

(assert (= (and start!129642 res!1041215) b!1521997))

(assert (= (and b!1521997 res!1041214) b!1521998))

(assert (= (and b!1521998 res!1041216) b!1521993))

(assert (= (and b!1521993 res!1041213) b!1521991))

(assert (= (and b!1521991 res!1041219) b!1521996))

(assert (= (and b!1521996 res!1041212) b!1521990))

(assert (= (and b!1521990 res!1041220) b!1521989))

(assert (= (and b!1521989 res!1041218) b!1521995))

(assert (= (and b!1521995 res!1041211) b!1521992))

(assert (= (and b!1521992 res!1041217) b!1521994))

(declare-fun m!1405109 () Bool)

(assert (=> b!1521989 m!1405109))

(assert (=> b!1521989 m!1405109))

(declare-fun m!1405111 () Bool)

(assert (=> b!1521989 m!1405111))

(assert (=> b!1521989 m!1405111))

(assert (=> b!1521989 m!1405109))

(declare-fun m!1405113 () Bool)

(assert (=> b!1521989 m!1405113))

(declare-fun m!1405115 () Bool)

(assert (=> b!1521991 m!1405115))

(declare-fun m!1405117 () Bool)

(assert (=> start!129642 m!1405117))

(declare-fun m!1405119 () Bool)

(assert (=> start!129642 m!1405119))

(declare-fun m!1405121 () Bool)

(assert (=> b!1521998 m!1405121))

(assert (=> b!1521998 m!1405121))

(declare-fun m!1405123 () Bool)

(assert (=> b!1521998 m!1405123))

(assert (=> b!1521995 m!1405109))

(assert (=> b!1521995 m!1405109))

(declare-fun m!1405125 () Bool)

(assert (=> b!1521995 m!1405125))

(declare-fun m!1405127 () Bool)

(assert (=> b!1521992 m!1405127))

(declare-fun m!1405129 () Bool)

(assert (=> b!1521992 m!1405129))

(assert (=> b!1521992 m!1405129))

(declare-fun m!1405131 () Bool)

(assert (=> b!1521992 m!1405131))

(assert (=> b!1521992 m!1405131))

(assert (=> b!1521992 m!1405129))

(declare-fun m!1405133 () Bool)

(assert (=> b!1521992 m!1405133))

(assert (=> b!1521993 m!1405109))

(assert (=> b!1521993 m!1405109))

(declare-fun m!1405135 () Bool)

(assert (=> b!1521993 m!1405135))

(declare-fun m!1405137 () Bool)

(assert (=> b!1521996 m!1405137))

(check-sat (not b!1521993) (not b!1521996) (not start!129642) (not b!1521992) (not b!1521989) (not b!1521998) (not b!1521991) (not b!1521995))
(check-sat)
