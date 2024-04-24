; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129954 () Bool)

(assert start!129954)

(declare-fun b!1523430 () Bool)

(declare-fun res!1041227 () Bool)

(declare-fun e!849843 () Bool)

(assert (=> b!1523430 (=> (not res!1041227) (not e!849843))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101378 0))(
  ( (array!101379 (arr!48915 (Array (_ BitVec 32) (_ BitVec 64))) (size!49466 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101378)

(assert (=> b!1523430 (= res!1041227 (and (= (size!49466 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49466 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49466 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1041230 () Bool)

(assert (=> start!129954 (=> (not res!1041230) (not e!849843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129954 (= res!1041230 (validMask!0 mask!2512))))

(assert (=> start!129954 e!849843))

(assert (=> start!129954 true))

(declare-fun array_inv!38196 (array!101378) Bool)

(assert (=> start!129954 (array_inv!38196 a!2804)))

(declare-fun b!1523431 () Bool)

(assert (=> b!1523431 (= e!849843 false)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12973 0))(
  ( (MissingZero!12973 (index!54287 (_ BitVec 32))) (Found!12973 (index!54288 (_ BitVec 32))) (Intermediate!12973 (undefined!13785 Bool) (index!54289 (_ BitVec 32)) (x!136190 (_ BitVec 32))) (Undefined!12973) (MissingVacant!12973 (index!54290 (_ BitVec 32))) )
))
(declare-fun lt!660163 () SeekEntryResult!12973)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101378 (_ BitVec 32)) SeekEntryResult!12973)

(assert (=> b!1523431 (= lt!660163 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48915 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523432 () Bool)

(declare-fun res!1041228 () Bool)

(assert (=> b!1523432 (=> (not res!1041228) (not e!849843))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523432 (= res!1041228 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49466 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49466 a!2804))))))

(declare-fun b!1523433 () Bool)

(declare-fun res!1041229 () Bool)

(assert (=> b!1523433 (=> (not res!1041229) (not e!849843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523433 (= res!1041229 (validKeyInArray!0 (select (arr!48915 a!2804) i!961)))))

(declare-fun b!1523434 () Bool)

(declare-fun res!1041233 () Bool)

(assert (=> b!1523434 (=> (not res!1041233) (not e!849843))))

(assert (=> b!1523434 (= res!1041233 (validKeyInArray!0 (select (arr!48915 a!2804) j!70)))))

(declare-fun b!1523435 () Bool)

(declare-fun res!1041226 () Bool)

(assert (=> b!1523435 (=> (not res!1041226) (not e!849843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101378 (_ BitVec 32)) Bool)

(assert (=> b!1523435 (= res!1041226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523436 () Bool)

(declare-fun res!1041232 () Bool)

(assert (=> b!1523436 (=> (not res!1041232) (not e!849843))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523436 (= res!1041232 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48915 a!2804) j!70) mask!2512) (select (arr!48915 a!2804) j!70) a!2804 mask!2512) (Intermediate!12973 false resIndex!21 resX!21)))))

(declare-fun b!1523437 () Bool)

(declare-fun res!1041231 () Bool)

(assert (=> b!1523437 (=> (not res!1041231) (not e!849843))))

(declare-datatypes ((List!35385 0))(
  ( (Nil!35382) (Cons!35381 (h!36820 (_ BitVec 64)) (t!50071 List!35385)) )
))
(declare-fun arrayNoDuplicates!0 (array!101378 (_ BitVec 32) List!35385) Bool)

(assert (=> b!1523437 (= res!1041231 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35382))))

(assert (= (and start!129954 res!1041230) b!1523430))

(assert (= (and b!1523430 res!1041227) b!1523433))

(assert (= (and b!1523433 res!1041229) b!1523434))

(assert (= (and b!1523434 res!1041233) b!1523435))

(assert (= (and b!1523435 res!1041226) b!1523437))

(assert (= (and b!1523437 res!1041231) b!1523432))

(assert (= (and b!1523432 res!1041228) b!1523436))

(assert (= (and b!1523436 res!1041232) b!1523431))

(declare-fun m!1406399 () Bool)

(assert (=> b!1523431 m!1406399))

(assert (=> b!1523431 m!1406399))

(declare-fun m!1406401 () Bool)

(assert (=> b!1523431 m!1406401))

(assert (=> b!1523434 m!1406399))

(assert (=> b!1523434 m!1406399))

(declare-fun m!1406403 () Bool)

(assert (=> b!1523434 m!1406403))

(declare-fun m!1406405 () Bool)

(assert (=> start!129954 m!1406405))

(declare-fun m!1406407 () Bool)

(assert (=> start!129954 m!1406407))

(assert (=> b!1523436 m!1406399))

(assert (=> b!1523436 m!1406399))

(declare-fun m!1406409 () Bool)

(assert (=> b!1523436 m!1406409))

(assert (=> b!1523436 m!1406409))

(assert (=> b!1523436 m!1406399))

(declare-fun m!1406411 () Bool)

(assert (=> b!1523436 m!1406411))

(declare-fun m!1406413 () Bool)

(assert (=> b!1523433 m!1406413))

(assert (=> b!1523433 m!1406413))

(declare-fun m!1406415 () Bool)

(assert (=> b!1523433 m!1406415))

(declare-fun m!1406417 () Bool)

(assert (=> b!1523437 m!1406417))

(declare-fun m!1406419 () Bool)

(assert (=> b!1523435 m!1406419))

(push 1)

(assert (not b!1523434))

(assert (not b!1523437))

(assert (not b!1523431))

(assert (not b!1523435))

(assert (not b!1523436))

(assert (not start!129954))

(assert (not b!1523433))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

