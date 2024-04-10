; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129032 () Bool)

(assert start!129032)

(declare-fun res!1033227 () Bool)

(declare-fun e!844614 () Bool)

(assert (=> start!129032 (=> (not res!1033227) (not e!844614))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129032 (= res!1033227 (validMask!0 mask!2512))))

(assert (=> start!129032 e!844614))

(assert (=> start!129032 true))

(declare-datatypes ((array!100888 0))(
  ( (array!100889 (arr!48681 (Array (_ BitVec 32) (_ BitVec 64))) (size!49231 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100888)

(declare-fun array_inv!37709 (array!100888) Bool)

(assert (=> start!129032 (array_inv!37709 a!2804)))

(declare-fun b!1513321 () Bool)

(declare-fun e!844609 () Bool)

(declare-fun lt!655939 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!655936 () array!100888)

(declare-datatypes ((SeekEntryResult!12852 0))(
  ( (MissingZero!12852 (index!53803 (_ BitVec 32))) (Found!12852 (index!53804 (_ BitVec 32))) (Intermediate!12852 (undefined!13664 Bool) (index!53805 (_ BitVec 32)) (x!135522 (_ BitVec 32))) (Undefined!12852) (MissingVacant!12852 (index!53806 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12852)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12852)

(assert (=> b!1513321 (= e!844609 (= (seekEntryOrOpen!0 lt!655939 lt!655936 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655939 lt!655936 mask!2512)))))

(declare-fun b!1513322 () Bool)

(declare-fun res!1033225 () Bool)

(assert (=> b!1513322 (=> (not res!1033225) (not e!844614))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513322 (= res!1033225 (validKeyInArray!0 (select (arr!48681 a!2804) j!70)))))

(declare-fun b!1513323 () Bool)

(declare-fun res!1033237 () Bool)

(assert (=> b!1513323 (=> (not res!1033237) (not e!844614))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513323 (= res!1033237 (validKeyInArray!0 (select (arr!48681 a!2804) i!961)))))

(declare-fun b!1513324 () Bool)

(declare-fun res!1033224 () Bool)

(declare-fun e!844613 () Bool)

(assert (=> b!1513324 (=> (not res!1033224) (not e!844613))))

(declare-fun lt!655937 () SeekEntryResult!12852)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12852)

(assert (=> b!1513324 (= res!1033224 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48681 a!2804) j!70) a!2804 mask!2512) lt!655937))))

(declare-fun b!1513325 () Bool)

(declare-fun e!844610 () Bool)

(assert (=> b!1513325 (= e!844610 (not true))))

(declare-fun e!844615 () Bool)

(assert (=> b!1513325 e!844615))

(declare-fun res!1033233 () Bool)

(assert (=> b!1513325 (=> (not res!1033233) (not e!844615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100888 (_ BitVec 32)) Bool)

(assert (=> b!1513325 (= res!1033233 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50572 0))(
  ( (Unit!50573) )
))
(declare-fun lt!655935 () Unit!50572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50572)

(assert (=> b!1513325 (= lt!655935 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513326 () Bool)

(declare-fun res!1033231 () Bool)

(assert (=> b!1513326 (=> (not res!1033231) (not e!844614))))

(declare-datatypes ((List!35164 0))(
  ( (Nil!35161) (Cons!35160 (h!36572 (_ BitVec 64)) (t!49858 List!35164)) )
))
(declare-fun arrayNoDuplicates!0 (array!100888 (_ BitVec 32) List!35164) Bool)

(assert (=> b!1513326 (= res!1033231 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35161))))

(declare-fun b!1513327 () Bool)

(declare-fun e!844612 () Bool)

(assert (=> b!1513327 (= e!844615 e!844612)))

(declare-fun res!1033226 () Bool)

(assert (=> b!1513327 (=> res!1033226 e!844612)))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513327 (= res!1033226 (or (not (= (select (arr!48681 a!2804) j!70) lt!655939)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48681 a!2804) index!487) (select (arr!48681 a!2804) j!70)) (not (= (select (arr!48681 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513328 () Bool)

(declare-fun res!1033236 () Bool)

(assert (=> b!1513328 (=> (not res!1033236) (not e!844615))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100888 (_ BitVec 32)) SeekEntryResult!12852)

(assert (=> b!1513328 (= res!1033236 (= (seekEntry!0 (select (arr!48681 a!2804) j!70) a!2804 mask!2512) (Found!12852 j!70)))))

(declare-fun b!1513329 () Bool)

(assert (=> b!1513329 (= e!844613 e!844610)))

(declare-fun res!1033230 () Bool)

(assert (=> b!1513329 (=> (not res!1033230) (not e!844610))))

(declare-fun lt!655938 () SeekEntryResult!12852)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513329 (= res!1033230 (= lt!655938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655939 mask!2512) lt!655939 lt!655936 mask!2512)))))

(assert (=> b!1513329 (= lt!655939 (select (store (arr!48681 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513329 (= lt!655936 (array!100889 (store (arr!48681 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49231 a!2804)))))

(declare-fun b!1513330 () Bool)

(declare-fun res!1033229 () Bool)

(assert (=> b!1513330 (=> (not res!1033229) (not e!844614))))

(assert (=> b!1513330 (= res!1033229 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49231 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49231 a!2804))))))

(declare-fun b!1513331 () Bool)

(assert (=> b!1513331 (= e!844614 e!844613)))

(declare-fun res!1033228 () Bool)

(assert (=> b!1513331 (=> (not res!1033228) (not e!844613))))

(assert (=> b!1513331 (= res!1033228 (= lt!655938 lt!655937))))

(assert (=> b!1513331 (= lt!655937 (Intermediate!12852 false resIndex!21 resX!21))))

(assert (=> b!1513331 (= lt!655938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48681 a!2804) j!70) mask!2512) (select (arr!48681 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513332 () Bool)

(declare-fun res!1033235 () Bool)

(assert (=> b!1513332 (=> (not res!1033235) (not e!844614))))

(assert (=> b!1513332 (= res!1033235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513333 () Bool)

(assert (=> b!1513333 (= e!844612 e!844609)))

(declare-fun res!1033232 () Bool)

(assert (=> b!1513333 (=> (not res!1033232) (not e!844609))))

(assert (=> b!1513333 (= res!1033232 (= (seekEntryOrOpen!0 (select (arr!48681 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48681 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513334 () Bool)

(declare-fun res!1033234 () Bool)

(assert (=> b!1513334 (=> (not res!1033234) (not e!844614))))

(assert (=> b!1513334 (= res!1033234 (and (= (size!49231 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49231 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49231 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129032 res!1033227) b!1513334))

(assert (= (and b!1513334 res!1033234) b!1513323))

(assert (= (and b!1513323 res!1033237) b!1513322))

(assert (= (and b!1513322 res!1033225) b!1513332))

(assert (= (and b!1513332 res!1033235) b!1513326))

(assert (= (and b!1513326 res!1033231) b!1513330))

(assert (= (and b!1513330 res!1033229) b!1513331))

(assert (= (and b!1513331 res!1033228) b!1513324))

(assert (= (and b!1513324 res!1033224) b!1513329))

(assert (= (and b!1513329 res!1033230) b!1513325))

(assert (= (and b!1513325 res!1033233) b!1513328))

(assert (= (and b!1513328 res!1033236) b!1513327))

(assert (= (and b!1513327 (not res!1033226)) b!1513333))

(assert (= (and b!1513333 res!1033232) b!1513321))

(declare-fun m!1396169 () Bool)

(assert (=> b!1513325 m!1396169))

(declare-fun m!1396171 () Bool)

(assert (=> b!1513325 m!1396171))

(declare-fun m!1396173 () Bool)

(assert (=> b!1513322 m!1396173))

(assert (=> b!1513322 m!1396173))

(declare-fun m!1396175 () Bool)

(assert (=> b!1513322 m!1396175))

(assert (=> b!1513328 m!1396173))

(assert (=> b!1513328 m!1396173))

(declare-fun m!1396177 () Bool)

(assert (=> b!1513328 m!1396177))

(assert (=> b!1513327 m!1396173))

(declare-fun m!1396179 () Bool)

(assert (=> b!1513327 m!1396179))

(declare-fun m!1396181 () Bool)

(assert (=> b!1513323 m!1396181))

(assert (=> b!1513323 m!1396181))

(declare-fun m!1396183 () Bool)

(assert (=> b!1513323 m!1396183))

(declare-fun m!1396185 () Bool)

(assert (=> b!1513326 m!1396185))

(assert (=> b!1513331 m!1396173))

(assert (=> b!1513331 m!1396173))

(declare-fun m!1396187 () Bool)

(assert (=> b!1513331 m!1396187))

(assert (=> b!1513331 m!1396187))

(assert (=> b!1513331 m!1396173))

(declare-fun m!1396189 () Bool)

(assert (=> b!1513331 m!1396189))

(declare-fun m!1396191 () Bool)

(assert (=> b!1513332 m!1396191))

(declare-fun m!1396193 () Bool)

(assert (=> start!129032 m!1396193))

(declare-fun m!1396195 () Bool)

(assert (=> start!129032 m!1396195))

(assert (=> b!1513333 m!1396173))

(assert (=> b!1513333 m!1396173))

(declare-fun m!1396197 () Bool)

(assert (=> b!1513333 m!1396197))

(assert (=> b!1513333 m!1396173))

(declare-fun m!1396199 () Bool)

(assert (=> b!1513333 m!1396199))

(declare-fun m!1396201 () Bool)

(assert (=> b!1513321 m!1396201))

(declare-fun m!1396203 () Bool)

(assert (=> b!1513321 m!1396203))

(assert (=> b!1513324 m!1396173))

(assert (=> b!1513324 m!1396173))

(declare-fun m!1396205 () Bool)

(assert (=> b!1513324 m!1396205))

(declare-fun m!1396207 () Bool)

(assert (=> b!1513329 m!1396207))

(assert (=> b!1513329 m!1396207))

(declare-fun m!1396209 () Bool)

(assert (=> b!1513329 m!1396209))

(declare-fun m!1396211 () Bool)

(assert (=> b!1513329 m!1396211))

(declare-fun m!1396213 () Bool)

(assert (=> b!1513329 m!1396213))

(check-sat (not b!1513323) (not b!1513326) (not b!1513333) (not b!1513322) (not b!1513321) (not b!1513324) (not b!1513331) (not b!1513328) (not b!1513332) (not b!1513325) (not start!129032) (not b!1513329))
(check-sat)
