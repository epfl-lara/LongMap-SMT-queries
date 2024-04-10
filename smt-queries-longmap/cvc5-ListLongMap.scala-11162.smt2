; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130514 () Bool)

(assert start!130514)

(declare-fun res!1048612 () Bool)

(declare-fun e!853354 () Bool)

(assert (=> start!130514 (=> (not res!1048612) (not e!853354))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130514 (= res!1048612 (validMask!0 mask!2512))))

(assert (=> start!130514 e!853354))

(assert (=> start!130514 true))

(declare-datatypes ((array!101693 0))(
  ( (array!101694 (arr!49067 (Array (_ BitVec 32) (_ BitVec 64))) (size!49617 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101693)

(declare-fun array_inv!38095 (array!101693) Bool)

(assert (=> start!130514 (array_inv!38095 a!2804)))

(declare-fun b!1531460 () Bool)

(declare-fun e!853357 () Bool)

(assert (=> b!1531460 (= e!853357 true)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!663256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13232 0))(
  ( (MissingZero!13232 (index!55323 (_ BitVec 32))) (Found!13232 (index!55324 (_ BitVec 32))) (Intermediate!13232 (undefined!14044 Bool) (index!55325 (_ BitVec 32)) (x!137026 (_ BitVec 32))) (Undefined!13232) (MissingVacant!13232 (index!55326 (_ BitVec 32))) )
))
(declare-fun lt!663255 () SeekEntryResult!13232)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101693 (_ BitVec 32)) SeekEntryResult!13232)

(assert (=> b!1531460 (= lt!663255 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663256 (select (arr!49067 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531461 () Bool)

(declare-fun e!853352 () Bool)

(assert (=> b!1531461 (= e!853354 e!853352)))

(declare-fun res!1048601 () Bool)

(assert (=> b!1531461 (=> (not res!1048601) (not e!853352))))

(declare-fun lt!663253 () SeekEntryResult!13232)

(declare-fun lt!663252 () SeekEntryResult!13232)

(assert (=> b!1531461 (= res!1048601 (= lt!663253 lt!663252))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531461 (= lt!663252 (Intermediate!13232 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531461 (= lt!663253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49067 a!2804) j!70) mask!2512) (select (arr!49067 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531462 () Bool)

(declare-fun res!1048611 () Bool)

(assert (=> b!1531462 (=> (not res!1048611) (not e!853354))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531462 (= res!1048611 (and (= (size!49617 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49617 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49617 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531463 () Bool)

(declare-fun res!1048607 () Bool)

(assert (=> b!1531463 (=> (not res!1048607) (not e!853354))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1531463 (= res!1048607 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49617 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49617 a!2804))))))

(declare-fun e!853356 () Bool)

(declare-fun b!1531464 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101693 (_ BitVec 32)) SeekEntryResult!13232)

(assert (=> b!1531464 (= e!853356 (= (seekEntry!0 (select (arr!49067 a!2804) j!70) a!2804 mask!2512) (Found!13232 j!70)))))

(declare-fun b!1531465 () Bool)

(declare-fun res!1048605 () Bool)

(assert (=> b!1531465 (=> (not res!1048605) (not e!853354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531465 (= res!1048605 (validKeyInArray!0 (select (arr!49067 a!2804) i!961)))))

(declare-fun b!1531466 () Bool)

(declare-fun res!1048600 () Bool)

(assert (=> b!1531466 (=> (not res!1048600) (not e!853354))))

(assert (=> b!1531466 (= res!1048600 (validKeyInArray!0 (select (arr!49067 a!2804) j!70)))))

(declare-fun b!1531467 () Bool)

(declare-fun res!1048610 () Bool)

(assert (=> b!1531467 (=> (not res!1048610) (not e!853354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101693 (_ BitVec 32)) Bool)

(assert (=> b!1531467 (= res!1048610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531468 () Bool)

(declare-fun res!1048608 () Bool)

(assert (=> b!1531468 (=> (not res!1048608) (not e!853352))))

(assert (=> b!1531468 (= res!1048608 (= lt!663253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49067 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49067 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101694 (store (arr!49067 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49617 a!2804)) mask!2512)))))

(declare-fun b!1531469 () Bool)

(declare-fun e!853353 () Bool)

(assert (=> b!1531469 (= e!853352 (not e!853353))))

(declare-fun res!1048602 () Bool)

(assert (=> b!1531469 (=> res!1048602 e!853353)))

(assert (=> b!1531469 (= res!1048602 (or (not (= (select (arr!49067 a!2804) j!70) (select (store (arr!49067 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1531469 e!853356))

(declare-fun res!1048606 () Bool)

(assert (=> b!1531469 (=> (not res!1048606) (not e!853356))))

(assert (=> b!1531469 (= res!1048606 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51248 0))(
  ( (Unit!51249) )
))
(declare-fun lt!663254 () Unit!51248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51248)

(assert (=> b!1531469 (= lt!663254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531470 () Bool)

(declare-fun res!1048609 () Bool)

(assert (=> b!1531470 (=> (not res!1048609) (not e!853352))))

(assert (=> b!1531470 (= res!1048609 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49067 a!2804) j!70) a!2804 mask!2512) lt!663252))))

(declare-fun b!1531471 () Bool)

(declare-fun res!1048604 () Bool)

(assert (=> b!1531471 (=> (not res!1048604) (not e!853354))))

(declare-datatypes ((List!35550 0))(
  ( (Nil!35547) (Cons!35546 (h!36991 (_ BitVec 64)) (t!50244 List!35550)) )
))
(declare-fun arrayNoDuplicates!0 (array!101693 (_ BitVec 32) List!35550) Bool)

(assert (=> b!1531471 (= res!1048604 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35547))))

(declare-fun b!1531472 () Bool)

(assert (=> b!1531472 (= e!853353 e!853357)))

(declare-fun res!1048603 () Bool)

(assert (=> b!1531472 (=> res!1048603 e!853357)))

(assert (=> b!1531472 (= res!1048603 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663256 #b00000000000000000000000000000000) (bvsge lt!663256 (size!49617 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531472 (= lt!663256 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130514 res!1048612) b!1531462))

(assert (= (and b!1531462 res!1048611) b!1531465))

(assert (= (and b!1531465 res!1048605) b!1531466))

(assert (= (and b!1531466 res!1048600) b!1531467))

(assert (= (and b!1531467 res!1048610) b!1531471))

(assert (= (and b!1531471 res!1048604) b!1531463))

(assert (= (and b!1531463 res!1048607) b!1531461))

(assert (= (and b!1531461 res!1048601) b!1531470))

(assert (= (and b!1531470 res!1048609) b!1531468))

(assert (= (and b!1531468 res!1048608) b!1531469))

(assert (= (and b!1531469 res!1048606) b!1531464))

(assert (= (and b!1531469 (not res!1048602)) b!1531472))

(assert (= (and b!1531472 (not res!1048603)) b!1531460))

(declare-fun m!1414119 () Bool)

(assert (=> b!1531461 m!1414119))

(assert (=> b!1531461 m!1414119))

(declare-fun m!1414121 () Bool)

(assert (=> b!1531461 m!1414121))

(assert (=> b!1531461 m!1414121))

(assert (=> b!1531461 m!1414119))

(declare-fun m!1414123 () Bool)

(assert (=> b!1531461 m!1414123))

(assert (=> b!1531460 m!1414119))

(assert (=> b!1531460 m!1414119))

(declare-fun m!1414125 () Bool)

(assert (=> b!1531460 m!1414125))

(assert (=> b!1531464 m!1414119))

(assert (=> b!1531464 m!1414119))

(declare-fun m!1414127 () Bool)

(assert (=> b!1531464 m!1414127))

(declare-fun m!1414129 () Bool)

(assert (=> b!1531472 m!1414129))

(declare-fun m!1414131 () Bool)

(assert (=> b!1531465 m!1414131))

(assert (=> b!1531465 m!1414131))

(declare-fun m!1414133 () Bool)

(assert (=> b!1531465 m!1414133))

(assert (=> b!1531466 m!1414119))

(assert (=> b!1531466 m!1414119))

(declare-fun m!1414135 () Bool)

(assert (=> b!1531466 m!1414135))

(assert (=> b!1531470 m!1414119))

(assert (=> b!1531470 m!1414119))

(declare-fun m!1414137 () Bool)

(assert (=> b!1531470 m!1414137))

(declare-fun m!1414139 () Bool)

(assert (=> b!1531471 m!1414139))

(assert (=> b!1531469 m!1414119))

(declare-fun m!1414141 () Bool)

(assert (=> b!1531469 m!1414141))

(declare-fun m!1414143 () Bool)

(assert (=> b!1531469 m!1414143))

(declare-fun m!1414145 () Bool)

(assert (=> b!1531469 m!1414145))

(declare-fun m!1414147 () Bool)

(assert (=> b!1531469 m!1414147))

(assert (=> b!1531468 m!1414143))

(assert (=> b!1531468 m!1414145))

(assert (=> b!1531468 m!1414145))

(declare-fun m!1414149 () Bool)

(assert (=> b!1531468 m!1414149))

(assert (=> b!1531468 m!1414149))

(assert (=> b!1531468 m!1414145))

(declare-fun m!1414151 () Bool)

(assert (=> b!1531468 m!1414151))

(declare-fun m!1414153 () Bool)

(assert (=> b!1531467 m!1414153))

(declare-fun m!1414155 () Bool)

(assert (=> start!130514 m!1414155))

(declare-fun m!1414157 () Bool)

(assert (=> start!130514 m!1414157))

(push 1)

