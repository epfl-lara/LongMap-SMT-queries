; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130932 () Bool)

(assert start!130932)

(declare-fun b!1534502 () Bool)

(declare-fun e!855138 () Bool)

(declare-fun e!855135 () Bool)

(assert (=> b!1534502 (= e!855138 e!855135)))

(declare-fun res!1050159 () Bool)

(assert (=> b!1534502 (=> res!1050159 e!855135)))

(declare-fun lt!664469 () (_ BitVec 32))

(declare-datatypes ((array!101848 0))(
  ( (array!101849 (arr!49138 (Array (_ BitVec 32) (_ BitVec 64))) (size!49689 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101848)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1534502 (= res!1050159 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!664469 #b00000000000000000000000000000000) (bvsge lt!664469 (size!49689 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534502 (= lt!664469 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1534503 () Bool)

(declare-fun res!1050164 () Bool)

(declare-fun e!855136 () Bool)

(assert (=> b!1534503 (=> (not res!1050164) (not e!855136))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1534503 (= res!1050164 (and (= (size!49689 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49689 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49689 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1534504 () Bool)

(declare-fun res!1050157 () Bool)

(assert (=> b!1534504 (=> (not res!1050157) (not e!855136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534504 (= res!1050157 (validKeyInArray!0 (select (arr!49138 a!2804) i!961)))))

(declare-fun b!1534505 () Bool)

(assert (=> b!1534505 (= e!855135 true)))

(declare-fun lt!664470 () array!101848)

(declare-fun lt!664467 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13196 0))(
  ( (MissingZero!13196 (index!55179 (_ BitVec 32))) (Found!13196 (index!55180 (_ BitVec 32))) (Intermediate!13196 (undefined!14008 Bool) (index!55181 (_ BitVec 32)) (x!137085 (_ BitVec 32))) (Undefined!13196) (MissingVacant!13196 (index!55182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101848 (_ BitVec 32)) SeekEntryResult!13196)

(assert (=> b!1534505 (= (seekEntryOrOpen!0 (select (arr!49138 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!664467 lt!664470 mask!2512))))

(declare-datatypes ((Unit!51211 0))(
  ( (Unit!51212) )
))
(declare-fun lt!664466 () Unit!51211)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51211)

(assert (=> b!1534505 (= lt!664466 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!664469 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1534506 () Bool)

(declare-fun e!855134 () Bool)

(assert (=> b!1534506 (= e!855134 (not e!855138))))

(declare-fun res!1050163 () Bool)

(assert (=> b!1534506 (=> res!1050163 e!855138)))

(assert (=> b!1534506 (= res!1050163 (or (not (= (select (arr!49138 a!2804) j!70) lt!664467)) (= x!534 resX!21)))))

(declare-fun e!855137 () Bool)

(assert (=> b!1534506 e!855137))

(declare-fun res!1050167 () Bool)

(assert (=> b!1534506 (=> (not res!1050167) (not e!855137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101848 (_ BitVec 32)) Bool)

(assert (=> b!1534506 (= res!1050167 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!664465 () Unit!51211)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51211)

(assert (=> b!1534506 (= lt!664465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1534507 () Bool)

(declare-fun res!1050161 () Bool)

(declare-fun e!855139 () Bool)

(assert (=> b!1534507 (=> (not res!1050161) (not e!855139))))

(declare-fun lt!664468 () SeekEntryResult!13196)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101848 (_ BitVec 32)) SeekEntryResult!13196)

(assert (=> b!1534507 (= res!1050161 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49138 a!2804) j!70) a!2804 mask!2512) lt!664468))))

(declare-fun b!1534508 () Bool)

(declare-fun res!1050160 () Bool)

(assert (=> b!1534508 (=> (not res!1050160) (not e!855136))))

(assert (=> b!1534508 (= res!1050160 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49689 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49689 a!2804))))))

(declare-fun b!1534509 () Bool)

(assert (=> b!1534509 (= e!855136 e!855139)))

(declare-fun res!1050165 () Bool)

(assert (=> b!1534509 (=> (not res!1050165) (not e!855139))))

(declare-fun lt!664464 () SeekEntryResult!13196)

(assert (=> b!1534509 (= res!1050165 (= lt!664464 lt!664468))))

(assert (=> b!1534509 (= lt!664468 (Intermediate!13196 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534509 (= lt!664464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49138 a!2804) j!70) mask!2512) (select (arr!49138 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1534510 () Bool)

(declare-fun res!1050168 () Bool)

(assert (=> b!1534510 (=> res!1050168 e!855135)))

(assert (=> b!1534510 (= res!1050168 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!664469 (select (arr!49138 a!2804) j!70) a!2804 mask!2512) lt!664468)))))

(declare-fun b!1534511 () Bool)

(declare-fun res!1050166 () Bool)

(assert (=> b!1534511 (=> (not res!1050166) (not e!855136))))

(declare-datatypes ((List!35608 0))(
  ( (Nil!35605) (Cons!35604 (h!37067 (_ BitVec 64)) (t!50294 List!35608)) )
))
(declare-fun arrayNoDuplicates!0 (array!101848 (_ BitVec 32) List!35608) Bool)

(assert (=> b!1534511 (= res!1050166 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35605))))

(declare-fun b!1534512 () Bool)

(assert (=> b!1534512 (= e!855139 e!855134)))

(declare-fun res!1050155 () Bool)

(assert (=> b!1534512 (=> (not res!1050155) (not e!855134))))

(assert (=> b!1534512 (= res!1050155 (= lt!664464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!664467 mask!2512) lt!664467 lt!664470 mask!2512)))))

(assert (=> b!1534512 (= lt!664467 (select (store (arr!49138 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1534512 (= lt!664470 (array!101849 (store (arr!49138 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49689 a!2804)))))

(declare-fun b!1534501 () Bool)

(declare-fun res!1050158 () Bool)

(assert (=> b!1534501 (=> (not res!1050158) (not e!855136))))

(assert (=> b!1534501 (= res!1050158 (validKeyInArray!0 (select (arr!49138 a!2804) j!70)))))

(declare-fun res!1050162 () Bool)

(assert (=> start!130932 (=> (not res!1050162) (not e!855136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130932 (= res!1050162 (validMask!0 mask!2512))))

(assert (=> start!130932 e!855136))

(assert (=> start!130932 true))

(declare-fun array_inv!38419 (array!101848) Bool)

(assert (=> start!130932 (array_inv!38419 a!2804)))

(declare-fun b!1534513 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101848 (_ BitVec 32)) SeekEntryResult!13196)

(assert (=> b!1534513 (= e!855137 (= (seekEntry!0 (select (arr!49138 a!2804) j!70) a!2804 mask!2512) (Found!13196 j!70)))))

(declare-fun b!1534514 () Bool)

(declare-fun res!1050156 () Bool)

(assert (=> b!1534514 (=> (not res!1050156) (not e!855136))))

(assert (=> b!1534514 (= res!1050156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130932 res!1050162) b!1534503))

(assert (= (and b!1534503 res!1050164) b!1534504))

(assert (= (and b!1534504 res!1050157) b!1534501))

(assert (= (and b!1534501 res!1050158) b!1534514))

(assert (= (and b!1534514 res!1050156) b!1534511))

(assert (= (and b!1534511 res!1050166) b!1534508))

(assert (= (and b!1534508 res!1050160) b!1534509))

(assert (= (and b!1534509 res!1050165) b!1534507))

(assert (= (and b!1534507 res!1050161) b!1534512))

(assert (= (and b!1534512 res!1050155) b!1534506))

(assert (= (and b!1534506 res!1050167) b!1534513))

(assert (= (and b!1534506 (not res!1050163)) b!1534502))

(assert (= (and b!1534502 (not res!1050159)) b!1534510))

(assert (= (and b!1534510 (not res!1050168)) b!1534505))

(declare-fun m!1417069 () Bool)

(assert (=> b!1534510 m!1417069))

(assert (=> b!1534510 m!1417069))

(declare-fun m!1417071 () Bool)

(assert (=> b!1534510 m!1417071))

(declare-fun m!1417073 () Bool)

(assert (=> start!130932 m!1417073))

(declare-fun m!1417075 () Bool)

(assert (=> start!130932 m!1417075))

(declare-fun m!1417077 () Bool)

(assert (=> b!1534514 m!1417077))

(assert (=> b!1534513 m!1417069))

(assert (=> b!1534513 m!1417069))

(declare-fun m!1417079 () Bool)

(assert (=> b!1534513 m!1417079))

(assert (=> b!1534507 m!1417069))

(assert (=> b!1534507 m!1417069))

(declare-fun m!1417081 () Bool)

(assert (=> b!1534507 m!1417081))

(declare-fun m!1417083 () Bool)

(assert (=> b!1534502 m!1417083))

(declare-fun m!1417085 () Bool)

(assert (=> b!1534511 m!1417085))

(assert (=> b!1534501 m!1417069))

(assert (=> b!1534501 m!1417069))

(declare-fun m!1417087 () Bool)

(assert (=> b!1534501 m!1417087))

(declare-fun m!1417089 () Bool)

(assert (=> b!1534504 m!1417089))

(assert (=> b!1534504 m!1417089))

(declare-fun m!1417091 () Bool)

(assert (=> b!1534504 m!1417091))

(assert (=> b!1534509 m!1417069))

(assert (=> b!1534509 m!1417069))

(declare-fun m!1417093 () Bool)

(assert (=> b!1534509 m!1417093))

(assert (=> b!1534509 m!1417093))

(assert (=> b!1534509 m!1417069))

(declare-fun m!1417095 () Bool)

(assert (=> b!1534509 m!1417095))

(assert (=> b!1534505 m!1417069))

(assert (=> b!1534505 m!1417069))

(declare-fun m!1417097 () Bool)

(assert (=> b!1534505 m!1417097))

(declare-fun m!1417099 () Bool)

(assert (=> b!1534505 m!1417099))

(declare-fun m!1417101 () Bool)

(assert (=> b!1534505 m!1417101))

(assert (=> b!1534506 m!1417069))

(declare-fun m!1417103 () Bool)

(assert (=> b!1534506 m!1417103))

(declare-fun m!1417105 () Bool)

(assert (=> b!1534506 m!1417105))

(declare-fun m!1417107 () Bool)

(assert (=> b!1534512 m!1417107))

(assert (=> b!1534512 m!1417107))

(declare-fun m!1417109 () Bool)

(assert (=> b!1534512 m!1417109))

(declare-fun m!1417111 () Bool)

(assert (=> b!1534512 m!1417111))

(declare-fun m!1417113 () Bool)

(assert (=> b!1534512 m!1417113))

(check-sat (not b!1534501) (not b!1534511) (not b!1534509) (not b!1534506) (not b!1534512) (not b!1534505) (not b!1534514) (not b!1534507) (not start!130932) (not b!1534513) (not b!1534502) (not b!1534504) (not b!1534510))
(check-sat)
