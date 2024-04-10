; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119206 () Bool)

(assert start!119206)

(declare-fun res!930705 () Bool)

(declare-fun e!787461 () Bool)

(assert (=> start!119206 (=> (not res!930705) (not e!787461))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119206 (= res!930705 (validMask!0 mask!2840))))

(assert (=> start!119206 e!787461))

(assert (=> start!119206 true))

(declare-datatypes ((array!95143 0))(
  ( (array!95144 (arr!45937 (Array (_ BitVec 32) (_ BitVec 64))) (size!46487 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95143)

(declare-fun array_inv!34965 (array!95143) Bool)

(assert (=> start!119206 (array_inv!34965 a!2901)))

(declare-fun b!1390539 () Bool)

(declare-fun res!930704 () Bool)

(assert (=> b!1390539 (=> (not res!930704) (not e!787461))))

(declare-datatypes ((List!32456 0))(
  ( (Nil!32453) (Cons!32452 (h!33670 (_ BitVec 64)) (t!47150 List!32456)) )
))
(declare-fun arrayNoDuplicates!0 (array!95143 (_ BitVec 32) List!32456) Bool)

(assert (=> b!1390539 (= res!930704 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32453))))

(declare-fun b!1390540 () Bool)

(declare-fun res!930701 () Bool)

(assert (=> b!1390540 (=> (not res!930701) (not e!787461))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390540 (= res!930701 (validKeyInArray!0 (select (arr!45937 a!2901) j!112)))))

(declare-fun b!1390541 () Bool)

(declare-fun res!930700 () Bool)

(assert (=> b!1390541 (=> (not res!930700) (not e!787461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95143 (_ BitVec 32)) Bool)

(assert (=> b!1390541 (= res!930700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!787463 () Bool)

(declare-fun b!1390542 () Bool)

(declare-datatypes ((SeekEntryResult!10254 0))(
  ( (MissingZero!10254 (index!43387 (_ BitVec 32))) (Found!10254 (index!43388 (_ BitVec 32))) (Intermediate!10254 (undefined!11066 Bool) (index!43389 (_ BitVec 32)) (x!125060 (_ BitVec 32))) (Undefined!10254) (MissingVacant!10254 (index!43390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95143 (_ BitVec 32)) SeekEntryResult!10254)

(assert (=> b!1390542 (= e!787463 (= (seekEntryOrOpen!0 (select (arr!45937 a!2901) j!112) a!2901 mask!2840) (Found!10254 j!112)))))

(declare-fun b!1390543 () Bool)

(declare-fun lt!610853 () SeekEntryResult!10254)

(assert (=> b!1390543 (= e!787461 (not (or (not (is-Intermediate!10254 lt!610853)) (undefined!11066 lt!610853) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(assert (=> b!1390543 e!787463))

(declare-fun res!930703 () Bool)

(assert (=> b!1390543 (=> (not res!930703) (not e!787463))))

(assert (=> b!1390543 (= res!930703 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46512 0))(
  ( (Unit!46513) )
))
(declare-fun lt!610854 () Unit!46512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46512)

(assert (=> b!1390543 (= lt!610854 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95143 (_ BitVec 32)) SeekEntryResult!10254)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390543 (= lt!610853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45937 a!2901) j!112) mask!2840) (select (arr!45937 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390544 () Bool)

(declare-fun res!930706 () Bool)

(assert (=> b!1390544 (=> (not res!930706) (not e!787461))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390544 (= res!930706 (validKeyInArray!0 (select (arr!45937 a!2901) i!1037)))))

(declare-fun b!1390545 () Bool)

(declare-fun res!930702 () Bool)

(assert (=> b!1390545 (=> (not res!930702) (not e!787461))))

(assert (=> b!1390545 (= res!930702 (and (= (size!46487 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46487 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46487 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119206 res!930705) b!1390545))

(assert (= (and b!1390545 res!930702) b!1390544))

(assert (= (and b!1390544 res!930706) b!1390540))

(assert (= (and b!1390540 res!930701) b!1390541))

(assert (= (and b!1390541 res!930700) b!1390539))

(assert (= (and b!1390539 res!930704) b!1390543))

(assert (= (and b!1390543 res!930703) b!1390542))

(declare-fun m!1276411 () Bool)

(assert (=> start!119206 m!1276411))

(declare-fun m!1276413 () Bool)

(assert (=> start!119206 m!1276413))

(declare-fun m!1276415 () Bool)

(assert (=> b!1390539 m!1276415))

(declare-fun m!1276417 () Bool)

(assert (=> b!1390541 m!1276417))

(declare-fun m!1276419 () Bool)

(assert (=> b!1390544 m!1276419))

(assert (=> b!1390544 m!1276419))

(declare-fun m!1276421 () Bool)

(assert (=> b!1390544 m!1276421))

(declare-fun m!1276423 () Bool)

(assert (=> b!1390542 m!1276423))

(assert (=> b!1390542 m!1276423))

(declare-fun m!1276425 () Bool)

(assert (=> b!1390542 m!1276425))

(assert (=> b!1390540 m!1276423))

(assert (=> b!1390540 m!1276423))

(declare-fun m!1276427 () Bool)

(assert (=> b!1390540 m!1276427))

(assert (=> b!1390543 m!1276423))

(declare-fun m!1276429 () Bool)

(assert (=> b!1390543 m!1276429))

(assert (=> b!1390543 m!1276423))

(declare-fun m!1276431 () Bool)

(assert (=> b!1390543 m!1276431))

(assert (=> b!1390543 m!1276429))

(assert (=> b!1390543 m!1276423))

(declare-fun m!1276433 () Bool)

(assert (=> b!1390543 m!1276433))

(declare-fun m!1276435 () Bool)

(assert (=> b!1390543 m!1276435))

(push 1)

(assert (not b!1390541))

(assert (not b!1390542))

(assert (not start!119206))

(assert (not b!1390540))

(assert (not b!1390544))

(assert (not b!1390539))

(assert (not b!1390543))

(check-sat)

