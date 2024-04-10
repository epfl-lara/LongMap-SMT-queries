; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129176 () Bool)

(assert start!129176)

(declare-fun b!1516213 () Bool)

(declare-fun e!846061 () Bool)

(declare-fun e!846063 () Bool)

(assert (=> b!1516213 (= e!846061 e!846063)))

(declare-fun res!1036118 () Bool)

(assert (=> b!1516213 (=> (not res!1036118) (not e!846063))))

(declare-datatypes ((SeekEntryResult!12924 0))(
  ( (MissingZero!12924 (index!54091 (_ BitVec 32))) (Found!12924 (index!54092 (_ BitVec 32))) (Intermediate!12924 (undefined!13736 Bool) (index!54093 (_ BitVec 32)) (x!135786 (_ BitVec 32))) (Undefined!12924) (MissingVacant!12924 (index!54094 (_ BitVec 32))) )
))
(declare-fun lt!657330 () SeekEntryResult!12924)

(declare-fun lt!657331 () SeekEntryResult!12924)

(assert (=> b!1516213 (= res!1036118 (= lt!657330 lt!657331))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516213 (= lt!657331 (Intermediate!12924 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101032 0))(
  ( (array!101033 (arr!48753 (Array (_ BitVec 32) (_ BitVec 64))) (size!49303 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101032)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101032 (_ BitVec 32)) SeekEntryResult!12924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516213 (= lt!657330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48753 a!2804) j!70) mask!2512) (select (arr!48753 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516214 () Bool)

(declare-fun e!846062 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101032 (_ BitVec 32)) SeekEntryResult!12924)

(assert (=> b!1516214 (= e!846062 (= (seekEntry!0 (select (arr!48753 a!2804) j!70) a!2804 mask!2512) (Found!12924 j!70)))))

(declare-fun b!1516215 () Bool)

(declare-fun res!1036117 () Bool)

(assert (=> b!1516215 (=> (not res!1036117) (not e!846063))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516215 (= res!1036117 (= lt!657330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48753 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48753 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101033 (store (arr!48753 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49303 a!2804)) mask!2512)))))

(declare-fun b!1516216 () Bool)

(declare-fun res!1036125 () Bool)

(assert (=> b!1516216 (=> (not res!1036125) (not e!846061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516216 (= res!1036125 (validKeyInArray!0 (select (arr!48753 a!2804) j!70)))))

(declare-fun b!1516217 () Bool)

(declare-fun res!1036119 () Bool)

(assert (=> b!1516217 (=> (not res!1036119) (not e!846061))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516217 (= res!1036119 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49303 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49303 a!2804))))))

(declare-fun b!1516219 () Bool)

(declare-fun res!1036123 () Bool)

(assert (=> b!1516219 (=> (not res!1036123) (not e!846061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101032 (_ BitVec 32)) Bool)

(assert (=> b!1516219 (= res!1036123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516220 () Bool)

(declare-fun res!1036116 () Bool)

(assert (=> b!1516220 (=> (not res!1036116) (not e!846061))))

(declare-datatypes ((List!35236 0))(
  ( (Nil!35233) (Cons!35232 (h!36644 (_ BitVec 64)) (t!49930 List!35236)) )
))
(declare-fun arrayNoDuplicates!0 (array!101032 (_ BitVec 32) List!35236) Bool)

(assert (=> b!1516220 (= res!1036116 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35233))))

(declare-fun b!1516221 () Bool)

(declare-fun res!1036122 () Bool)

(assert (=> b!1516221 (=> (not res!1036122) (not e!846061))))

(assert (=> b!1516221 (= res!1036122 (validKeyInArray!0 (select (arr!48753 a!2804) i!961)))))

(declare-fun b!1516222 () Bool)

(assert (=> b!1516222 (= e!846063 (not (or (not (= (select (arr!48753 a!2804) j!70) (select (store (arr!48753 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(assert (=> b!1516222 e!846062))

(declare-fun res!1036126 () Bool)

(assert (=> b!1516222 (=> (not res!1036126) (not e!846062))))

(assert (=> b!1516222 (= res!1036126 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50716 0))(
  ( (Unit!50717) )
))
(declare-fun lt!657329 () Unit!50716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50716)

(assert (=> b!1516222 (= lt!657329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516223 () Bool)

(declare-fun res!1036120 () Bool)

(assert (=> b!1516223 (=> (not res!1036120) (not e!846061))))

(assert (=> b!1516223 (= res!1036120 (and (= (size!49303 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49303 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49303 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1036124 () Bool)

(assert (=> start!129176 (=> (not res!1036124) (not e!846061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129176 (= res!1036124 (validMask!0 mask!2512))))

(assert (=> start!129176 e!846061))

(assert (=> start!129176 true))

(declare-fun array_inv!37781 (array!101032) Bool)

(assert (=> start!129176 (array_inv!37781 a!2804)))

(declare-fun b!1516218 () Bool)

(declare-fun res!1036121 () Bool)

(assert (=> b!1516218 (=> (not res!1036121) (not e!846063))))

(assert (=> b!1516218 (= res!1036121 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48753 a!2804) j!70) a!2804 mask!2512) lt!657331))))

(assert (= (and start!129176 res!1036124) b!1516223))

(assert (= (and b!1516223 res!1036120) b!1516221))

(assert (= (and b!1516221 res!1036122) b!1516216))

(assert (= (and b!1516216 res!1036125) b!1516219))

(assert (= (and b!1516219 res!1036123) b!1516220))

(assert (= (and b!1516220 res!1036116) b!1516217))

(assert (= (and b!1516217 res!1036119) b!1516213))

(assert (= (and b!1516213 res!1036118) b!1516218))

(assert (= (and b!1516218 res!1036121) b!1516215))

(assert (= (and b!1516215 res!1036117) b!1516222))

(assert (= (and b!1516222 res!1036126) b!1516214))

(declare-fun m!1399465 () Bool)

(assert (=> b!1516214 m!1399465))

(assert (=> b!1516214 m!1399465))

(declare-fun m!1399467 () Bool)

(assert (=> b!1516214 m!1399467))

(assert (=> b!1516213 m!1399465))

(assert (=> b!1516213 m!1399465))

(declare-fun m!1399469 () Bool)

(assert (=> b!1516213 m!1399469))

(assert (=> b!1516213 m!1399469))

(assert (=> b!1516213 m!1399465))

(declare-fun m!1399471 () Bool)

(assert (=> b!1516213 m!1399471))

(declare-fun m!1399473 () Bool)

(assert (=> b!1516221 m!1399473))

(assert (=> b!1516221 m!1399473))

(declare-fun m!1399475 () Bool)

(assert (=> b!1516221 m!1399475))

(declare-fun m!1399477 () Bool)

(assert (=> b!1516219 m!1399477))

(declare-fun m!1399479 () Bool)

(assert (=> b!1516215 m!1399479))

(declare-fun m!1399481 () Bool)

(assert (=> b!1516215 m!1399481))

(assert (=> b!1516215 m!1399481))

(declare-fun m!1399483 () Bool)

(assert (=> b!1516215 m!1399483))

(assert (=> b!1516215 m!1399483))

(assert (=> b!1516215 m!1399481))

(declare-fun m!1399485 () Bool)

(assert (=> b!1516215 m!1399485))

(assert (=> b!1516218 m!1399465))

(assert (=> b!1516218 m!1399465))

(declare-fun m!1399487 () Bool)

(assert (=> b!1516218 m!1399487))

(declare-fun m!1399489 () Bool)

(assert (=> b!1516220 m!1399489))

(declare-fun m!1399491 () Bool)

(assert (=> start!129176 m!1399491))

(declare-fun m!1399493 () Bool)

(assert (=> start!129176 m!1399493))

(assert (=> b!1516216 m!1399465))

(assert (=> b!1516216 m!1399465))

(declare-fun m!1399495 () Bool)

(assert (=> b!1516216 m!1399495))

(assert (=> b!1516222 m!1399465))

(declare-fun m!1399497 () Bool)

(assert (=> b!1516222 m!1399497))

(assert (=> b!1516222 m!1399479))

(assert (=> b!1516222 m!1399481))

(declare-fun m!1399499 () Bool)

(assert (=> b!1516222 m!1399499))

(check-sat (not b!1516214) (not b!1516218) (not start!129176) (not b!1516222) (not b!1516219) (not b!1516215) (not b!1516213) (not b!1516216) (not b!1516220) (not b!1516221))
(check-sat)
