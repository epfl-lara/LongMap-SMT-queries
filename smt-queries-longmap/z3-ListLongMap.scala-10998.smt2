; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128822 () Bool)

(assert start!128822)

(declare-fun res!1029457 () Bool)

(declare-fun e!843133 () Bool)

(assert (=> start!128822 (=> (not res!1029457) (not e!843133))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128822 (= res!1029457 (validMask!0 mask!2512))))

(assert (=> start!128822 e!843133))

(assert (=> start!128822 true))

(declare-datatypes ((array!100678 0))(
  ( (array!100679 (arr!48576 (Array (_ BitVec 32) (_ BitVec 64))) (size!49126 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100678)

(declare-fun array_inv!37604 (array!100678) Bool)

(assert (=> start!128822 (array_inv!37604 a!2804)))

(declare-fun b!1509548 () Bool)

(declare-fun e!843132 () Bool)

(assert (=> b!1509548 (= e!843132 (not true))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100678 (_ BitVec 32)) Bool)

(assert (=> b!1509548 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50362 0))(
  ( (Unit!50363) )
))
(declare-fun lt!654927 () Unit!50362)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50362)

(assert (=> b!1509548 (= lt!654927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509549 () Bool)

(declare-fun res!1029455 () Bool)

(assert (=> b!1509549 (=> (not res!1029455) (not e!843133))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509549 (= res!1029455 (and (= (size!49126 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49126 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49126 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509550 () Bool)

(declare-fun res!1029459 () Bool)

(assert (=> b!1509550 (=> (not res!1029459) (not e!843133))))

(declare-datatypes ((List!35059 0))(
  ( (Nil!35056) (Cons!35055 (h!36467 (_ BitVec 64)) (t!49753 List!35059)) )
))
(declare-fun arrayNoDuplicates!0 (array!100678 (_ BitVec 32) List!35059) Bool)

(assert (=> b!1509550 (= res!1029459 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35056))))

(declare-fun b!1509551 () Bool)

(declare-fun res!1029456 () Bool)

(assert (=> b!1509551 (=> (not res!1029456) (not e!843133))))

(assert (=> b!1509551 (= res!1029456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509552 () Bool)

(declare-fun res!1029453 () Bool)

(assert (=> b!1509552 (=> (not res!1029453) (not e!843132))))

(declare-datatypes ((SeekEntryResult!12747 0))(
  ( (MissingZero!12747 (index!53383 (_ BitVec 32))) (Found!12747 (index!53384 (_ BitVec 32))) (Intermediate!12747 (undefined!13559 Bool) (index!53385 (_ BitVec 32)) (x!135137 (_ BitVec 32))) (Undefined!12747) (MissingVacant!12747 (index!53386 (_ BitVec 32))) )
))
(declare-fun lt!654926 () SeekEntryResult!12747)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100678 (_ BitVec 32)) SeekEntryResult!12747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509552 (= res!1029453 (= lt!654926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48576 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48576 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100679 (store (arr!48576 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49126 a!2804)) mask!2512)))))

(declare-fun b!1509553 () Bool)

(declare-fun res!1029458 () Bool)

(assert (=> b!1509553 (=> (not res!1029458) (not e!843133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509553 (= res!1029458 (validKeyInArray!0 (select (arr!48576 a!2804) j!70)))))

(declare-fun b!1509554 () Bool)

(declare-fun res!1029452 () Bool)

(assert (=> b!1509554 (=> (not res!1029452) (not e!843133))))

(assert (=> b!1509554 (= res!1029452 (validKeyInArray!0 (select (arr!48576 a!2804) i!961)))))

(declare-fun b!1509555 () Bool)

(assert (=> b!1509555 (= e!843133 e!843132)))

(declare-fun res!1029451 () Bool)

(assert (=> b!1509555 (=> (not res!1029451) (not e!843132))))

(declare-fun lt!654928 () SeekEntryResult!12747)

(assert (=> b!1509555 (= res!1029451 (= lt!654926 lt!654928))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509555 (= lt!654928 (Intermediate!12747 false resIndex!21 resX!21))))

(assert (=> b!1509555 (= lt!654926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48576 a!2804) j!70) mask!2512) (select (arr!48576 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509556 () Bool)

(declare-fun res!1029454 () Bool)

(assert (=> b!1509556 (=> (not res!1029454) (not e!843132))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509556 (= res!1029454 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48576 a!2804) j!70) a!2804 mask!2512) lt!654928))))

(declare-fun b!1509557 () Bool)

(declare-fun res!1029460 () Bool)

(assert (=> b!1509557 (=> (not res!1029460) (not e!843133))))

(assert (=> b!1509557 (= res!1029460 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49126 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49126 a!2804))))))

(assert (= (and start!128822 res!1029457) b!1509549))

(assert (= (and b!1509549 res!1029455) b!1509554))

(assert (= (and b!1509554 res!1029452) b!1509553))

(assert (= (and b!1509553 res!1029458) b!1509551))

(assert (= (and b!1509551 res!1029456) b!1509550))

(assert (= (and b!1509550 res!1029459) b!1509557))

(assert (= (and b!1509557 res!1029460) b!1509555))

(assert (= (and b!1509555 res!1029451) b!1509556))

(assert (= (and b!1509556 res!1029454) b!1509552))

(assert (= (and b!1509552 res!1029453) b!1509548))

(declare-fun m!1392041 () Bool)

(assert (=> b!1509554 m!1392041))

(assert (=> b!1509554 m!1392041))

(declare-fun m!1392043 () Bool)

(assert (=> b!1509554 m!1392043))

(declare-fun m!1392045 () Bool)

(assert (=> b!1509555 m!1392045))

(assert (=> b!1509555 m!1392045))

(declare-fun m!1392047 () Bool)

(assert (=> b!1509555 m!1392047))

(assert (=> b!1509555 m!1392047))

(assert (=> b!1509555 m!1392045))

(declare-fun m!1392049 () Bool)

(assert (=> b!1509555 m!1392049))

(declare-fun m!1392051 () Bool)

(assert (=> b!1509552 m!1392051))

(declare-fun m!1392053 () Bool)

(assert (=> b!1509552 m!1392053))

(assert (=> b!1509552 m!1392053))

(declare-fun m!1392055 () Bool)

(assert (=> b!1509552 m!1392055))

(assert (=> b!1509552 m!1392055))

(assert (=> b!1509552 m!1392053))

(declare-fun m!1392057 () Bool)

(assert (=> b!1509552 m!1392057))

(declare-fun m!1392059 () Bool)

(assert (=> b!1509550 m!1392059))

(declare-fun m!1392061 () Bool)

(assert (=> start!128822 m!1392061))

(declare-fun m!1392063 () Bool)

(assert (=> start!128822 m!1392063))

(declare-fun m!1392065 () Bool)

(assert (=> b!1509551 m!1392065))

(declare-fun m!1392067 () Bool)

(assert (=> b!1509548 m!1392067))

(declare-fun m!1392069 () Bool)

(assert (=> b!1509548 m!1392069))

(assert (=> b!1509556 m!1392045))

(assert (=> b!1509556 m!1392045))

(declare-fun m!1392071 () Bool)

(assert (=> b!1509556 m!1392071))

(assert (=> b!1509553 m!1392045))

(assert (=> b!1509553 m!1392045))

(declare-fun m!1392073 () Bool)

(assert (=> b!1509553 m!1392073))

(check-sat (not b!1509550) (not b!1509554) (not b!1509551) (not b!1509553) (not start!128822) (not b!1509555) (not b!1509552) (not b!1509548) (not b!1509556))
(check-sat)
