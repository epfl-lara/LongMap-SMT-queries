; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130170 () Bool)

(assert start!130170)

(declare-fun b!1528195 () Bool)

(declare-fun res!1046090 () Bool)

(declare-fun e!851723 () Bool)

(assert (=> b!1528195 (=> (not res!1046090) (not e!851723))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101518 0))(
  ( (array!101519 (arr!48985 (Array (_ BitVec 32) (_ BitVec 64))) (size!49537 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101518)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528195 (= res!1046090 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49537 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49537 a!2804))))))

(declare-fun b!1528196 () Bool)

(declare-fun res!1046093 () Bool)

(assert (=> b!1528196 (=> (not res!1046093) (not e!851723))))

(declare-datatypes ((List!35546 0))(
  ( (Nil!35543) (Cons!35542 (h!36979 (_ BitVec 64)) (t!50232 List!35546)) )
))
(declare-fun arrayNoDuplicates!0 (array!101518 (_ BitVec 32) List!35546) Bool)

(assert (=> b!1528196 (= res!1046093 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35543))))

(declare-fun b!1528197 () Bool)

(declare-fun e!851720 () Bool)

(assert (=> b!1528197 (= e!851723 e!851720)))

(declare-fun res!1046094 () Bool)

(assert (=> b!1528197 (=> (not res!1046094) (not e!851720))))

(declare-datatypes ((SeekEntryResult!13173 0))(
  ( (MissingZero!13173 (index!55087 (_ BitVec 32))) (Found!13173 (index!55088 (_ BitVec 32))) (Intermediate!13173 (undefined!13985 Bool) (index!55089 (_ BitVec 32)) (x!136783 (_ BitVec 32))) (Undefined!13173) (MissingVacant!13173 (index!55090 (_ BitVec 32))) )
))
(declare-fun lt!661749 () SeekEntryResult!13173)

(declare-fun lt!661754 () SeekEntryResult!13173)

(assert (=> b!1528197 (= res!1046094 (= lt!661749 lt!661754))))

(assert (=> b!1528197 (= lt!661754 (Intermediate!13173 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101518 (_ BitVec 32)) SeekEntryResult!13173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528197 (= lt!661749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48985 a!2804) j!70) mask!2512) (select (arr!48985 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528198 () Bool)

(declare-fun res!1046092 () Bool)

(assert (=> b!1528198 (=> (not res!1046092) (not e!851723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101518 (_ BitVec 32)) Bool)

(assert (=> b!1528198 (= res!1046092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528200 () Bool)

(declare-fun e!851724 () Bool)

(declare-fun e!851721 () Bool)

(assert (=> b!1528200 (= e!851724 e!851721)))

(declare-fun res!1046086 () Bool)

(assert (=> b!1528200 (=> res!1046086 e!851721)))

(declare-fun lt!661748 () SeekEntryResult!13173)

(assert (=> b!1528200 (= res!1046086 (not (= lt!661748 (Found!13173 j!70))))))

(declare-fun lt!661746 () SeekEntryResult!13173)

(declare-fun lt!661747 () SeekEntryResult!13173)

(assert (=> b!1528200 (= lt!661746 lt!661747)))

(declare-fun lt!661753 () (_ BitVec 64))

(declare-fun lt!661751 () array!101518)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101518 (_ BitVec 32)) SeekEntryResult!13173)

(assert (=> b!1528200 (= lt!661747 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661753 lt!661751 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101518 (_ BitVec 32)) SeekEntryResult!13173)

(assert (=> b!1528200 (= lt!661746 (seekEntryOrOpen!0 lt!661753 lt!661751 mask!2512))))

(declare-fun lt!661755 () SeekEntryResult!13173)

(assert (=> b!1528200 (= lt!661755 lt!661748)))

(assert (=> b!1528200 (= lt!661748 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48985 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528200 (= lt!661755 (seekEntryOrOpen!0 (select (arr!48985 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528201 () Bool)

(declare-fun res!1046096 () Bool)

(assert (=> b!1528201 (=> (not res!1046096) (not e!851723))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528201 (= res!1046096 (and (= (size!49537 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49537 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49537 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528202 () Bool)

(declare-fun e!851722 () Bool)

(assert (=> b!1528202 (= e!851720 e!851722)))

(declare-fun res!1046087 () Bool)

(assert (=> b!1528202 (=> (not res!1046087) (not e!851722))))

(assert (=> b!1528202 (= res!1046087 (= lt!661749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661753 mask!2512) lt!661753 lt!661751 mask!2512)))))

(assert (=> b!1528202 (= lt!661753 (select (store (arr!48985 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528202 (= lt!661751 (array!101519 (store (arr!48985 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49537 a!2804)))))

(declare-fun b!1528203 () Bool)

(declare-fun res!1046097 () Bool)

(assert (=> b!1528203 (=> (not res!1046097) (not e!851723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528203 (= res!1046097 (validKeyInArray!0 (select (arr!48985 a!2804) i!961)))))

(declare-fun b!1528204 () Bool)

(assert (=> b!1528204 (= e!851722 (not e!851724))))

(declare-fun res!1046088 () Bool)

(assert (=> b!1528204 (=> res!1046088 e!851724)))

(assert (=> b!1528204 (= res!1046088 (or (not (= (select (arr!48985 a!2804) j!70) lt!661753)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48985 a!2804) index!487) (select (arr!48985 a!2804) j!70)) (not (= (select (arr!48985 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851725 () Bool)

(assert (=> b!1528204 e!851725))

(declare-fun res!1046095 () Bool)

(assert (=> b!1528204 (=> (not res!1046095) (not e!851725))))

(assert (=> b!1528204 (= res!1046095 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50969 0))(
  ( (Unit!50970) )
))
(declare-fun lt!661750 () Unit!50969)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50969)

(assert (=> b!1528204 (= lt!661750 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528205 () Bool)

(assert (=> b!1528205 (= e!851721 true)))

(assert (=> b!1528205 (= lt!661747 lt!661748)))

(declare-fun lt!661752 () Unit!50969)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50969)

(assert (=> b!1528205 (= lt!661752 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528206 () Bool)

(declare-fun res!1046089 () Bool)

(assert (=> b!1528206 (=> (not res!1046089) (not e!851720))))

(assert (=> b!1528206 (= res!1046089 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48985 a!2804) j!70) a!2804 mask!2512) lt!661754))))

(declare-fun b!1528207 () Bool)

(declare-fun res!1046091 () Bool)

(assert (=> b!1528207 (=> (not res!1046091) (not e!851723))))

(assert (=> b!1528207 (= res!1046091 (validKeyInArray!0 (select (arr!48985 a!2804) j!70)))))

(declare-fun b!1528199 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101518 (_ BitVec 32)) SeekEntryResult!13173)

(assert (=> b!1528199 (= e!851725 (= (seekEntry!0 (select (arr!48985 a!2804) j!70) a!2804 mask!2512) (Found!13173 j!70)))))

(declare-fun res!1046098 () Bool)

(assert (=> start!130170 (=> (not res!1046098) (not e!851723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130170 (= res!1046098 (validMask!0 mask!2512))))

(assert (=> start!130170 e!851723))

(assert (=> start!130170 true))

(declare-fun array_inv!38218 (array!101518) Bool)

(assert (=> start!130170 (array_inv!38218 a!2804)))

(assert (= (and start!130170 res!1046098) b!1528201))

(assert (= (and b!1528201 res!1046096) b!1528203))

(assert (= (and b!1528203 res!1046097) b!1528207))

(assert (= (and b!1528207 res!1046091) b!1528198))

(assert (= (and b!1528198 res!1046092) b!1528196))

(assert (= (and b!1528196 res!1046093) b!1528195))

(assert (= (and b!1528195 res!1046090) b!1528197))

(assert (= (and b!1528197 res!1046094) b!1528206))

(assert (= (and b!1528206 res!1046089) b!1528202))

(assert (= (and b!1528202 res!1046087) b!1528204))

(assert (= (and b!1528204 res!1046095) b!1528199))

(assert (= (and b!1528204 (not res!1046088)) b!1528200))

(assert (= (and b!1528200 (not res!1046086)) b!1528205))

(declare-fun m!1410467 () Bool)

(assert (=> b!1528199 m!1410467))

(assert (=> b!1528199 m!1410467))

(declare-fun m!1410469 () Bool)

(assert (=> b!1528199 m!1410469))

(declare-fun m!1410471 () Bool)

(assert (=> b!1528202 m!1410471))

(assert (=> b!1528202 m!1410471))

(declare-fun m!1410473 () Bool)

(assert (=> b!1528202 m!1410473))

(declare-fun m!1410475 () Bool)

(assert (=> b!1528202 m!1410475))

(declare-fun m!1410477 () Bool)

(assert (=> b!1528202 m!1410477))

(declare-fun m!1410479 () Bool)

(assert (=> b!1528198 m!1410479))

(assert (=> b!1528204 m!1410467))

(declare-fun m!1410481 () Bool)

(assert (=> b!1528204 m!1410481))

(declare-fun m!1410483 () Bool)

(assert (=> b!1528204 m!1410483))

(declare-fun m!1410485 () Bool)

(assert (=> b!1528204 m!1410485))

(assert (=> b!1528197 m!1410467))

(assert (=> b!1528197 m!1410467))

(declare-fun m!1410487 () Bool)

(assert (=> b!1528197 m!1410487))

(assert (=> b!1528197 m!1410487))

(assert (=> b!1528197 m!1410467))

(declare-fun m!1410489 () Bool)

(assert (=> b!1528197 m!1410489))

(declare-fun m!1410491 () Bool)

(assert (=> b!1528196 m!1410491))

(declare-fun m!1410493 () Bool)

(assert (=> b!1528203 m!1410493))

(assert (=> b!1528203 m!1410493))

(declare-fun m!1410495 () Bool)

(assert (=> b!1528203 m!1410495))

(declare-fun m!1410497 () Bool)

(assert (=> b!1528205 m!1410497))

(declare-fun m!1410499 () Bool)

(assert (=> start!130170 m!1410499))

(declare-fun m!1410501 () Bool)

(assert (=> start!130170 m!1410501))

(assert (=> b!1528206 m!1410467))

(assert (=> b!1528206 m!1410467))

(declare-fun m!1410503 () Bool)

(assert (=> b!1528206 m!1410503))

(assert (=> b!1528207 m!1410467))

(assert (=> b!1528207 m!1410467))

(declare-fun m!1410505 () Bool)

(assert (=> b!1528207 m!1410505))

(assert (=> b!1528200 m!1410467))

(declare-fun m!1410507 () Bool)

(assert (=> b!1528200 m!1410507))

(assert (=> b!1528200 m!1410467))

(declare-fun m!1410509 () Bool)

(assert (=> b!1528200 m!1410509))

(assert (=> b!1528200 m!1410467))

(declare-fun m!1410511 () Bool)

(assert (=> b!1528200 m!1410511))

(declare-fun m!1410513 () Bool)

(assert (=> b!1528200 m!1410513))

(check-sat (not b!1528199) (not b!1528206) (not b!1528204) (not b!1528196) (not b!1528202) (not b!1528203) (not b!1528200) (not start!130170) (not b!1528198) (not b!1528197) (not b!1528205) (not b!1528207))
(check-sat)
