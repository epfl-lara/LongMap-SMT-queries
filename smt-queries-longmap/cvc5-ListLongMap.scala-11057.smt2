; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129174 () Bool)

(assert start!129174)

(declare-fun b!1516180 () Bool)

(declare-fun res!1036092 () Bool)

(declare-fun e!846049 () Bool)

(assert (=> b!1516180 (=> (not res!1036092) (not e!846049))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101030 0))(
  ( (array!101031 (arr!48752 (Array (_ BitVec 32) (_ BitVec 64))) (size!49302 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101030)

(declare-datatypes ((SeekEntryResult!12923 0))(
  ( (MissingZero!12923 (index!54087 (_ BitVec 32))) (Found!12923 (index!54088 (_ BitVec 32))) (Intermediate!12923 (undefined!13735 Bool) (index!54089 (_ BitVec 32)) (x!135785 (_ BitVec 32))) (Undefined!12923) (MissingVacant!12923 (index!54090 (_ BitVec 32))) )
))
(declare-fun lt!657320 () SeekEntryResult!12923)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101030 (_ BitVec 32)) SeekEntryResult!12923)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516180 (= res!1036092 (= lt!657320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48752 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48752 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101031 (store (arr!48752 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49302 a!2804)) mask!2512)))))

(declare-fun b!1516181 () Bool)

(declare-fun res!1036088 () Bool)

(declare-fun e!846051 () Bool)

(assert (=> b!1516181 (=> (not res!1036088) (not e!846051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101030 (_ BitVec 32)) Bool)

(assert (=> b!1516181 (= res!1036088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516182 () Bool)

(declare-fun res!1036093 () Bool)

(assert (=> b!1516182 (=> (not res!1036093) (not e!846051))))

(assert (=> b!1516182 (= res!1036093 (and (= (size!49302 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49302 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49302 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516183 () Bool)

(declare-fun res!1036083 () Bool)

(assert (=> b!1516183 (=> (not res!1036083) (not e!846051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516183 (= res!1036083 (validKeyInArray!0 (select (arr!48752 a!2804) i!961)))))

(declare-fun b!1516184 () Bool)

(assert (=> b!1516184 (= e!846051 e!846049)))

(declare-fun res!1036090 () Bool)

(assert (=> b!1516184 (=> (not res!1036090) (not e!846049))))

(declare-fun lt!657321 () SeekEntryResult!12923)

(assert (=> b!1516184 (= res!1036090 (= lt!657320 lt!657321))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516184 (= lt!657321 (Intermediate!12923 false resIndex!21 resX!21))))

(assert (=> b!1516184 (= lt!657320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48752 a!2804) j!70) mask!2512) (select (arr!48752 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516185 () Bool)

(declare-fun res!1036086 () Bool)

(assert (=> b!1516185 (=> (not res!1036086) (not e!846051))))

(assert (=> b!1516185 (= res!1036086 (validKeyInArray!0 (select (arr!48752 a!2804) j!70)))))

(declare-fun b!1516186 () Bool)

(declare-fun e!846052 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101030 (_ BitVec 32)) SeekEntryResult!12923)

(assert (=> b!1516186 (= e!846052 (= (seekEntry!0 (select (arr!48752 a!2804) j!70) a!2804 mask!2512) (Found!12923 j!70)))))

(declare-fun b!1516187 () Bool)

(declare-fun res!1036087 () Bool)

(assert (=> b!1516187 (=> (not res!1036087) (not e!846049))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516187 (= res!1036087 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48752 a!2804) j!70) a!2804 mask!2512) lt!657321))))

(declare-fun b!1516188 () Bool)

(assert (=> b!1516188 (= e!846049 (not (or (not (= (select (arr!48752 a!2804) j!70) (select (store (arr!48752 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(assert (=> b!1516188 e!846052))

(declare-fun res!1036089 () Bool)

(assert (=> b!1516188 (=> (not res!1036089) (not e!846052))))

(assert (=> b!1516188 (= res!1036089 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50714 0))(
  ( (Unit!50715) )
))
(declare-fun lt!657322 () Unit!50714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50714)

(assert (=> b!1516188 (= lt!657322 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1036085 () Bool)

(assert (=> start!129174 (=> (not res!1036085) (not e!846051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129174 (= res!1036085 (validMask!0 mask!2512))))

(assert (=> start!129174 e!846051))

(assert (=> start!129174 true))

(declare-fun array_inv!37780 (array!101030) Bool)

(assert (=> start!129174 (array_inv!37780 a!2804)))

(declare-fun b!1516189 () Bool)

(declare-fun res!1036091 () Bool)

(assert (=> b!1516189 (=> (not res!1036091) (not e!846051))))

(declare-datatypes ((List!35235 0))(
  ( (Nil!35232) (Cons!35231 (h!36643 (_ BitVec 64)) (t!49929 List!35235)) )
))
(declare-fun arrayNoDuplicates!0 (array!101030 (_ BitVec 32) List!35235) Bool)

(assert (=> b!1516189 (= res!1036091 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35232))))

(declare-fun b!1516190 () Bool)

(declare-fun res!1036084 () Bool)

(assert (=> b!1516190 (=> (not res!1036084) (not e!846051))))

(assert (=> b!1516190 (= res!1036084 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49302 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49302 a!2804))))))

(assert (= (and start!129174 res!1036085) b!1516182))

(assert (= (and b!1516182 res!1036093) b!1516183))

(assert (= (and b!1516183 res!1036083) b!1516185))

(assert (= (and b!1516185 res!1036086) b!1516181))

(assert (= (and b!1516181 res!1036088) b!1516189))

(assert (= (and b!1516189 res!1036091) b!1516190))

(assert (= (and b!1516190 res!1036084) b!1516184))

(assert (= (and b!1516184 res!1036090) b!1516187))

(assert (= (and b!1516187 res!1036087) b!1516180))

(assert (= (and b!1516180 res!1036092) b!1516188))

(assert (= (and b!1516188 res!1036089) b!1516186))

(declare-fun m!1399429 () Bool)

(assert (=> b!1516189 m!1399429))

(declare-fun m!1399431 () Bool)

(assert (=> b!1516183 m!1399431))

(assert (=> b!1516183 m!1399431))

(declare-fun m!1399433 () Bool)

(assert (=> b!1516183 m!1399433))

(declare-fun m!1399435 () Bool)

(assert (=> b!1516181 m!1399435))

(declare-fun m!1399437 () Bool)

(assert (=> b!1516188 m!1399437))

(declare-fun m!1399439 () Bool)

(assert (=> b!1516188 m!1399439))

(declare-fun m!1399441 () Bool)

(assert (=> b!1516188 m!1399441))

(declare-fun m!1399443 () Bool)

(assert (=> b!1516188 m!1399443))

(declare-fun m!1399445 () Bool)

(assert (=> b!1516188 m!1399445))

(assert (=> b!1516184 m!1399437))

(assert (=> b!1516184 m!1399437))

(declare-fun m!1399447 () Bool)

(assert (=> b!1516184 m!1399447))

(assert (=> b!1516184 m!1399447))

(assert (=> b!1516184 m!1399437))

(declare-fun m!1399449 () Bool)

(assert (=> b!1516184 m!1399449))

(assert (=> b!1516180 m!1399441))

(assert (=> b!1516180 m!1399443))

(assert (=> b!1516180 m!1399443))

(declare-fun m!1399451 () Bool)

(assert (=> b!1516180 m!1399451))

(assert (=> b!1516180 m!1399451))

(assert (=> b!1516180 m!1399443))

(declare-fun m!1399453 () Bool)

(assert (=> b!1516180 m!1399453))

(assert (=> b!1516186 m!1399437))

(assert (=> b!1516186 m!1399437))

(declare-fun m!1399455 () Bool)

(assert (=> b!1516186 m!1399455))

(assert (=> b!1516185 m!1399437))

(assert (=> b!1516185 m!1399437))

(declare-fun m!1399457 () Bool)

(assert (=> b!1516185 m!1399457))

(assert (=> b!1516187 m!1399437))

(assert (=> b!1516187 m!1399437))

(declare-fun m!1399459 () Bool)

(assert (=> b!1516187 m!1399459))

(declare-fun m!1399461 () Bool)

(assert (=> start!129174 m!1399461))

(declare-fun m!1399463 () Bool)

(assert (=> start!129174 m!1399463))

(push 1)

(assert (not b!1516183))

(assert (not b!1516185))

(assert (not b!1516186))

(assert (not b!1516180))

(assert (not b!1516189))

(assert (not start!129174))

(assert (not b!1516188))

(assert (not b!1516184))

(assert (not b!1516181))

(assert (not b!1516187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

