; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128582 () Bool)

(assert start!128582)

(declare-fun b!1507432 () Bool)

(declare-fun res!1027655 () Bool)

(declare-fun e!842263 () Bool)

(assert (=> b!1507432 (=> (not res!1027655) (not e!842263))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100555 0))(
  ( (array!100556 (arr!48519 (Array (_ BitVec 32) (_ BitVec 64))) (size!49069 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100555)

(assert (=> b!1507432 (= res!1027655 (and (= (size!49069 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49069 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49069 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507433 () Bool)

(declare-fun res!1027654 () Bool)

(assert (=> b!1507433 (=> (not res!1027654) (not e!842263))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12690 0))(
  ( (MissingZero!12690 (index!53155 (_ BitVec 32))) (Found!12690 (index!53156 (_ BitVec 32))) (Intermediate!12690 (undefined!13502 Bool) (index!53157 (_ BitVec 32)) (x!134910 (_ BitVec 32))) (Undefined!12690) (MissingVacant!12690 (index!53158 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100555 (_ BitVec 32)) SeekEntryResult!12690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507433 (= res!1027654 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48519 a!2804) j!70) mask!2512) (select (arr!48519 a!2804) j!70) a!2804 mask!2512) (Intermediate!12690 false resIndex!21 resX!21)))))

(declare-fun b!1507434 () Bool)

(declare-fun res!1027656 () Bool)

(assert (=> b!1507434 (=> (not res!1027656) (not e!842263))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507434 (= res!1027656 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49069 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49069 a!2804))))))

(declare-fun b!1507435 () Bool)

(declare-fun res!1027650 () Bool)

(assert (=> b!1507435 (=> (not res!1027650) (not e!842263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507435 (= res!1027650 (validKeyInArray!0 (select (arr!48519 a!2804) j!70)))))

(declare-fun b!1507436 () Bool)

(declare-fun res!1027652 () Bool)

(assert (=> b!1507436 (=> (not res!1027652) (not e!842263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100555 (_ BitVec 32)) Bool)

(assert (=> b!1507436 (= res!1027652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1027657 () Bool)

(assert (=> start!128582 (=> (not res!1027657) (not e!842263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128582 (= res!1027657 (validMask!0 mask!2512))))

(assert (=> start!128582 e!842263))

(assert (=> start!128582 true))

(declare-fun array_inv!37547 (array!100555) Bool)

(assert (=> start!128582 (array_inv!37547 a!2804)))

(declare-fun b!1507437 () Bool)

(assert (=> b!1507437 (= e!842263 false)))

(declare-fun lt!654388 () SeekEntryResult!12690)

(assert (=> b!1507437 (= lt!654388 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48519 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507438 () Bool)

(declare-fun res!1027653 () Bool)

(assert (=> b!1507438 (=> (not res!1027653) (not e!842263))))

(assert (=> b!1507438 (= res!1027653 (validKeyInArray!0 (select (arr!48519 a!2804) i!961)))))

(declare-fun b!1507439 () Bool)

(declare-fun res!1027651 () Bool)

(assert (=> b!1507439 (=> (not res!1027651) (not e!842263))))

(declare-datatypes ((List!35002 0))(
  ( (Nil!34999) (Cons!34998 (h!36401 (_ BitVec 64)) (t!49696 List!35002)) )
))
(declare-fun arrayNoDuplicates!0 (array!100555 (_ BitVec 32) List!35002) Bool)

(assert (=> b!1507439 (= res!1027651 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34999))))

(assert (= (and start!128582 res!1027657) b!1507432))

(assert (= (and b!1507432 res!1027655) b!1507438))

(assert (= (and b!1507438 res!1027653) b!1507435))

(assert (= (and b!1507435 res!1027650) b!1507436))

(assert (= (and b!1507436 res!1027652) b!1507439))

(assert (= (and b!1507439 res!1027651) b!1507434))

(assert (= (and b!1507434 res!1027656) b!1507433))

(assert (= (and b!1507433 res!1027654) b!1507437))

(declare-fun m!1390181 () Bool)

(assert (=> b!1507435 m!1390181))

(assert (=> b!1507435 m!1390181))

(declare-fun m!1390183 () Bool)

(assert (=> b!1507435 m!1390183))

(declare-fun m!1390185 () Bool)

(assert (=> b!1507436 m!1390185))

(declare-fun m!1390187 () Bool)

(assert (=> b!1507439 m!1390187))

(declare-fun m!1390189 () Bool)

(assert (=> b!1507438 m!1390189))

(assert (=> b!1507438 m!1390189))

(declare-fun m!1390191 () Bool)

(assert (=> b!1507438 m!1390191))

(assert (=> b!1507437 m!1390181))

(assert (=> b!1507437 m!1390181))

(declare-fun m!1390193 () Bool)

(assert (=> b!1507437 m!1390193))

(assert (=> b!1507433 m!1390181))

(assert (=> b!1507433 m!1390181))

(declare-fun m!1390195 () Bool)

(assert (=> b!1507433 m!1390195))

(assert (=> b!1507433 m!1390195))

(assert (=> b!1507433 m!1390181))

(declare-fun m!1390197 () Bool)

(assert (=> b!1507433 m!1390197))

(declare-fun m!1390199 () Bool)

(assert (=> start!128582 m!1390199))

(declare-fun m!1390201 () Bool)

(assert (=> start!128582 m!1390201))

(check-sat (not b!1507439) (not start!128582) (not b!1507436) (not b!1507435) (not b!1507433) (not b!1507438) (not b!1507437))
