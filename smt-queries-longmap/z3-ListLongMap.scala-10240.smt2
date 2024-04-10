; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120494 () Bool)

(assert start!120494)

(declare-fun b!1403054 () Bool)

(declare-fun e!794450 () Bool)

(assert (=> b!1403054 (= e!794450 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95903 0))(
  ( (array!95904 (arr!46302 (Array (_ BitVec 32) (_ BitVec 64))) (size!46852 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95903)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10619 0))(
  ( (MissingZero!10619 (index!44853 (_ BitVec 32))) (Found!10619 (index!44854 (_ BitVec 32))) (Intermediate!10619 (undefined!11431 Bool) (index!44855 (_ BitVec 32)) (x!126470 (_ BitVec 32))) (Undefined!10619) (MissingVacant!10619 (index!44856 (_ BitVec 32))) )
))
(declare-fun lt!618257 () SeekEntryResult!10619)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95903 (_ BitVec 32)) SeekEntryResult!10619)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403054 (= lt!618257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46302 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46302 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95904 (store (arr!46302 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46852 a!2901)) mask!2840))))

(declare-fun e!794451 () Bool)

(declare-fun b!1403055 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95903 (_ BitVec 32)) SeekEntryResult!10619)

(assert (=> b!1403055 (= e!794451 (= (seekEntryOrOpen!0 (select (arr!46302 a!2901) j!112) a!2901 mask!2840) (Found!10619 j!112)))))

(declare-fun b!1403056 () Bool)

(declare-fun res!941565 () Bool)

(declare-fun e!794452 () Bool)

(assert (=> b!1403056 (=> (not res!941565) (not e!794452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403056 (= res!941565 (validKeyInArray!0 (select (arr!46302 a!2901) j!112)))))

(declare-fun b!1403057 () Bool)

(declare-fun res!941567 () Bool)

(assert (=> b!1403057 (=> (not res!941567) (not e!794452))))

(assert (=> b!1403057 (= res!941567 (validKeyInArray!0 (select (arr!46302 a!2901) i!1037)))))

(declare-fun b!1403058 () Bool)

(declare-fun res!941571 () Bool)

(assert (=> b!1403058 (=> (not res!941571) (not e!794452))))

(assert (=> b!1403058 (= res!941571 (and (= (size!46852 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46852 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46852 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!941569 () Bool)

(assert (=> start!120494 (=> (not res!941569) (not e!794452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120494 (= res!941569 (validMask!0 mask!2840))))

(assert (=> start!120494 e!794452))

(assert (=> start!120494 true))

(declare-fun array_inv!35330 (array!95903) Bool)

(assert (=> start!120494 (array_inv!35330 a!2901)))

(declare-fun b!1403059 () Bool)

(declare-fun res!941570 () Bool)

(assert (=> b!1403059 (=> (not res!941570) (not e!794452))))

(declare-datatypes ((List!32821 0))(
  ( (Nil!32818) (Cons!32817 (h!34065 (_ BitVec 64)) (t!47515 List!32821)) )
))
(declare-fun arrayNoDuplicates!0 (array!95903 (_ BitVec 32) List!32821) Bool)

(assert (=> b!1403059 (= res!941570 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32818))))

(declare-fun b!1403060 () Bool)

(declare-fun res!941566 () Bool)

(assert (=> b!1403060 (=> (not res!941566) (not e!794452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95903 (_ BitVec 32)) Bool)

(assert (=> b!1403060 (= res!941566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403061 () Bool)

(assert (=> b!1403061 (= e!794452 (not e!794450))))

(declare-fun res!941572 () Bool)

(assert (=> b!1403061 (=> res!941572 e!794450)))

(declare-fun lt!618258 () SeekEntryResult!10619)

(get-info :version)

(assert (=> b!1403061 (= res!941572 (or (not ((_ is Intermediate!10619) lt!618258)) (undefined!11431 lt!618258)))))

(assert (=> b!1403061 e!794451))

(declare-fun res!941568 () Bool)

(assert (=> b!1403061 (=> (not res!941568) (not e!794451))))

(assert (=> b!1403061 (= res!941568 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47242 0))(
  ( (Unit!47243) )
))
(declare-fun lt!618256 () Unit!47242)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47242)

(assert (=> b!1403061 (= lt!618256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403061 (= lt!618258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46302 a!2901) j!112) mask!2840) (select (arr!46302 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120494 res!941569) b!1403058))

(assert (= (and b!1403058 res!941571) b!1403057))

(assert (= (and b!1403057 res!941567) b!1403056))

(assert (= (and b!1403056 res!941565) b!1403060))

(assert (= (and b!1403060 res!941566) b!1403059))

(assert (= (and b!1403059 res!941570) b!1403061))

(assert (= (and b!1403061 res!941568) b!1403055))

(assert (= (and b!1403061 (not res!941572)) b!1403054))

(declare-fun m!1291531 () Bool)

(assert (=> start!120494 m!1291531))

(declare-fun m!1291533 () Bool)

(assert (=> start!120494 m!1291533))

(declare-fun m!1291535 () Bool)

(assert (=> b!1403060 m!1291535))

(declare-fun m!1291537 () Bool)

(assert (=> b!1403057 m!1291537))

(assert (=> b!1403057 m!1291537))

(declare-fun m!1291539 () Bool)

(assert (=> b!1403057 m!1291539))

(declare-fun m!1291541 () Bool)

(assert (=> b!1403059 m!1291541))

(declare-fun m!1291543 () Bool)

(assert (=> b!1403054 m!1291543))

(declare-fun m!1291545 () Bool)

(assert (=> b!1403054 m!1291545))

(assert (=> b!1403054 m!1291545))

(declare-fun m!1291547 () Bool)

(assert (=> b!1403054 m!1291547))

(assert (=> b!1403054 m!1291547))

(assert (=> b!1403054 m!1291545))

(declare-fun m!1291549 () Bool)

(assert (=> b!1403054 m!1291549))

(declare-fun m!1291551 () Bool)

(assert (=> b!1403056 m!1291551))

(assert (=> b!1403056 m!1291551))

(declare-fun m!1291553 () Bool)

(assert (=> b!1403056 m!1291553))

(assert (=> b!1403061 m!1291551))

(declare-fun m!1291555 () Bool)

(assert (=> b!1403061 m!1291555))

(assert (=> b!1403061 m!1291551))

(declare-fun m!1291557 () Bool)

(assert (=> b!1403061 m!1291557))

(assert (=> b!1403061 m!1291555))

(assert (=> b!1403061 m!1291551))

(declare-fun m!1291559 () Bool)

(assert (=> b!1403061 m!1291559))

(declare-fun m!1291561 () Bool)

(assert (=> b!1403061 m!1291561))

(assert (=> b!1403055 m!1291551))

(assert (=> b!1403055 m!1291551))

(declare-fun m!1291563 () Bool)

(assert (=> b!1403055 m!1291563))

(check-sat (not b!1403056) (not b!1403057) (not start!120494) (not b!1403061) (not b!1403060) (not b!1403054) (not b!1403055) (not b!1403059))
