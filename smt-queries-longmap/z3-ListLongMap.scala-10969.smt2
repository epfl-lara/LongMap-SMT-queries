; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128480 () Bool)

(assert start!128480)

(declare-fun b!1506527 () Bool)

(declare-fun res!1026854 () Bool)

(declare-fun e!841933 () Bool)

(assert (=> b!1506527 (=> (not res!1026854) (not e!841933))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100492 0))(
  ( (array!100493 (arr!48489 (Array (_ BitVec 32) (_ BitVec 64))) (size!49039 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100492)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506527 (= res!1026854 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49039 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49039 a!2804))))))

(declare-fun res!1026851 () Bool)

(assert (=> start!128480 (=> (not res!1026851) (not e!841933))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128480 (= res!1026851 (validMask!0 mask!2512))))

(assert (=> start!128480 e!841933))

(assert (=> start!128480 true))

(declare-fun array_inv!37517 (array!100492) Bool)

(assert (=> start!128480 (array_inv!37517 a!2804)))

(declare-fun b!1506528 () Bool)

(declare-fun res!1026850 () Bool)

(assert (=> b!1506528 (=> (not res!1026850) (not e!841933))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506528 (= res!1026850 (validKeyInArray!0 (select (arr!48489 a!2804) i!961)))))

(declare-fun b!1506529 () Bool)

(declare-fun res!1026856 () Bool)

(assert (=> b!1506529 (=> (not res!1026856) (not e!841933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100492 (_ BitVec 32)) Bool)

(assert (=> b!1506529 (= res!1026856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506530 () Bool)

(declare-fun res!1026852 () Bool)

(assert (=> b!1506530 (=> (not res!1026852) (not e!841933))))

(declare-datatypes ((List!34972 0))(
  ( (Nil!34969) (Cons!34968 (h!36368 (_ BitVec 64)) (t!49666 List!34972)) )
))
(declare-fun arrayNoDuplicates!0 (array!100492 (_ BitVec 32) List!34972) Bool)

(assert (=> b!1506530 (= res!1026852 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34969))))

(declare-fun b!1506531 () Bool)

(assert (=> b!1506531 (= e!841933 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12660 0))(
  ( (MissingZero!12660 (index!53035 (_ BitVec 32))) (Found!12660 (index!53036 (_ BitVec 32))) (Intermediate!12660 (undefined!13472 Bool) (index!53037 (_ BitVec 32)) (x!134794 (_ BitVec 32))) (Undefined!12660) (MissingVacant!12660 (index!53038 (_ BitVec 32))) )
))
(declare-fun lt!654247 () SeekEntryResult!12660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100492 (_ BitVec 32)) SeekEntryResult!12660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506531 (= lt!654247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48489 a!2804) j!70) mask!2512) (select (arr!48489 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506532 () Bool)

(declare-fun res!1026855 () Bool)

(assert (=> b!1506532 (=> (not res!1026855) (not e!841933))))

(assert (=> b!1506532 (= res!1026855 (validKeyInArray!0 (select (arr!48489 a!2804) j!70)))))

(declare-fun b!1506533 () Bool)

(declare-fun res!1026853 () Bool)

(assert (=> b!1506533 (=> (not res!1026853) (not e!841933))))

(assert (=> b!1506533 (= res!1026853 (and (= (size!49039 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49039 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49039 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128480 res!1026851) b!1506533))

(assert (= (and b!1506533 res!1026853) b!1506528))

(assert (= (and b!1506528 res!1026850) b!1506532))

(assert (= (and b!1506532 res!1026855) b!1506529))

(assert (= (and b!1506529 res!1026856) b!1506530))

(assert (= (and b!1506530 res!1026852) b!1506527))

(assert (= (and b!1506527 res!1026854) b!1506531))

(declare-fun m!1389459 () Bool)

(assert (=> b!1506529 m!1389459))

(declare-fun m!1389461 () Bool)

(assert (=> b!1506531 m!1389461))

(assert (=> b!1506531 m!1389461))

(declare-fun m!1389463 () Bool)

(assert (=> b!1506531 m!1389463))

(assert (=> b!1506531 m!1389463))

(assert (=> b!1506531 m!1389461))

(declare-fun m!1389465 () Bool)

(assert (=> b!1506531 m!1389465))

(declare-fun m!1389467 () Bool)

(assert (=> b!1506530 m!1389467))

(declare-fun m!1389469 () Bool)

(assert (=> start!128480 m!1389469))

(declare-fun m!1389471 () Bool)

(assert (=> start!128480 m!1389471))

(declare-fun m!1389473 () Bool)

(assert (=> b!1506528 m!1389473))

(assert (=> b!1506528 m!1389473))

(declare-fun m!1389475 () Bool)

(assert (=> b!1506528 m!1389475))

(assert (=> b!1506532 m!1389461))

(assert (=> b!1506532 m!1389461))

(declare-fun m!1389477 () Bool)

(assert (=> b!1506532 m!1389477))

(check-sat (not start!128480) (not b!1506531) (not b!1506530) (not b!1506528) (not b!1506532) (not b!1506529))
