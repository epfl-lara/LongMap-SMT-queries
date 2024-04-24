; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129960 () Bool)

(assert start!129960)

(declare-fun res!1041300 () Bool)

(declare-fun e!849861 () Bool)

(assert (=> start!129960 (=> (not res!1041300) (not e!849861))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129960 (= res!1041300 (validMask!0 mask!2512))))

(assert (=> start!129960 e!849861))

(assert (=> start!129960 true))

(declare-datatypes ((array!101384 0))(
  ( (array!101385 (arr!48918 (Array (_ BitVec 32) (_ BitVec 64))) (size!49469 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101384)

(declare-fun array_inv!38199 (array!101384) Bool)

(assert (=> start!129960 (array_inv!38199 a!2804)))

(declare-fun b!1523502 () Bool)

(assert (=> b!1523502 (= e!849861 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12976 0))(
  ( (MissingZero!12976 (index!54299 (_ BitVec 32))) (Found!12976 (index!54300 (_ BitVec 32))) (Intermediate!12976 (undefined!13788 Bool) (index!54301 (_ BitVec 32)) (x!136201 (_ BitVec 32))) (Undefined!12976) (MissingVacant!12976 (index!54302 (_ BitVec 32))) )
))
(declare-fun lt!660172 () SeekEntryResult!12976)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101384 (_ BitVec 32)) SeekEntryResult!12976)

(assert (=> b!1523502 (= lt!660172 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48918 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523503 () Bool)

(declare-fun res!1041301 () Bool)

(assert (=> b!1523503 (=> (not res!1041301) (not e!849861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101384 (_ BitVec 32)) Bool)

(assert (=> b!1523503 (= res!1041301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523504 () Bool)

(declare-fun res!1041305 () Bool)

(assert (=> b!1523504 (=> (not res!1041305) (not e!849861))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523504 (= res!1041305 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49469 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49469 a!2804))))))

(declare-fun b!1523505 () Bool)

(declare-fun res!1041304 () Bool)

(assert (=> b!1523505 (=> (not res!1041304) (not e!849861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523505 (= res!1041304 (validKeyInArray!0 (select (arr!48918 a!2804) j!70)))))

(declare-fun b!1523506 () Bool)

(declare-fun res!1041303 () Bool)

(assert (=> b!1523506 (=> (not res!1041303) (not e!849861))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523506 (= res!1041303 (validKeyInArray!0 (select (arr!48918 a!2804) i!961)))))

(declare-fun b!1523507 () Bool)

(declare-fun res!1041299 () Bool)

(assert (=> b!1523507 (=> (not res!1041299) (not e!849861))))

(assert (=> b!1523507 (= res!1041299 (and (= (size!49469 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49469 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49469 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523508 () Bool)

(declare-fun res!1041302 () Bool)

(assert (=> b!1523508 (=> (not res!1041302) (not e!849861))))

(declare-datatypes ((List!35388 0))(
  ( (Nil!35385) (Cons!35384 (h!36823 (_ BitVec 64)) (t!50074 List!35388)) )
))
(declare-fun arrayNoDuplicates!0 (array!101384 (_ BitVec 32) List!35388) Bool)

(assert (=> b!1523508 (= res!1041302 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35385))))

(declare-fun b!1523509 () Bool)

(declare-fun res!1041298 () Bool)

(assert (=> b!1523509 (=> (not res!1041298) (not e!849861))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523509 (= res!1041298 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48918 a!2804) j!70) mask!2512) (select (arr!48918 a!2804) j!70) a!2804 mask!2512) (Intermediate!12976 false resIndex!21 resX!21)))))

(assert (= (and start!129960 res!1041300) b!1523507))

(assert (= (and b!1523507 res!1041299) b!1523506))

(assert (= (and b!1523506 res!1041303) b!1523505))

(assert (= (and b!1523505 res!1041304) b!1523503))

(assert (= (and b!1523503 res!1041301) b!1523508))

(assert (= (and b!1523508 res!1041302) b!1523504))

(assert (= (and b!1523504 res!1041305) b!1523509))

(assert (= (and b!1523509 res!1041298) b!1523502))

(declare-fun m!1406465 () Bool)

(assert (=> b!1523506 m!1406465))

(assert (=> b!1523506 m!1406465))

(declare-fun m!1406467 () Bool)

(assert (=> b!1523506 m!1406467))

(declare-fun m!1406469 () Bool)

(assert (=> b!1523509 m!1406469))

(assert (=> b!1523509 m!1406469))

(declare-fun m!1406471 () Bool)

(assert (=> b!1523509 m!1406471))

(assert (=> b!1523509 m!1406471))

(assert (=> b!1523509 m!1406469))

(declare-fun m!1406473 () Bool)

(assert (=> b!1523509 m!1406473))

(declare-fun m!1406475 () Bool)

(assert (=> start!129960 m!1406475))

(declare-fun m!1406477 () Bool)

(assert (=> start!129960 m!1406477))

(assert (=> b!1523505 m!1406469))

(assert (=> b!1523505 m!1406469))

(declare-fun m!1406479 () Bool)

(assert (=> b!1523505 m!1406479))

(declare-fun m!1406481 () Bool)

(assert (=> b!1523508 m!1406481))

(assert (=> b!1523502 m!1406469))

(assert (=> b!1523502 m!1406469))

(declare-fun m!1406483 () Bool)

(assert (=> b!1523502 m!1406483))

(declare-fun m!1406485 () Bool)

(assert (=> b!1523503 m!1406485))

(push 1)

(assert (not b!1523503))

(assert (not b!1523506))

(assert (not b!1523502))

(assert (not b!1523505))

(assert (not start!129960))

(assert (not b!1523508))

(assert (not b!1523509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

