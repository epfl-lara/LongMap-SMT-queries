; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122690 () Bool)

(assert start!122690)

(declare-fun b!1421350 () Bool)

(declare-fun res!956839 () Bool)

(declare-fun e!803695 () Bool)

(assert (=> b!1421350 (=> (not res!956839) (not e!803695))))

(declare-datatypes ((SeekEntryResult!11134 0))(
  ( (MissingZero!11134 (index!46928 (_ BitVec 32))) (Found!11134 (index!46929 (_ BitVec 32))) (Intermediate!11134 (undefined!11946 Bool) (index!46930 (_ BitVec 32)) (x!128573 (_ BitVec 32))) (Undefined!11134) (MissingVacant!11134 (index!46931 (_ BitVec 32))) )
))
(declare-fun lt!626075 () SeekEntryResult!11134)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626072 () (_ BitVec 64))

(declare-datatypes ((array!97008 0))(
  ( (array!97009 (arr!46822 (Array (_ BitVec 32) (_ BitVec 64))) (size!47374 (_ BitVec 32))) )
))
(declare-fun lt!626073 () array!97008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97008 (_ BitVec 32)) SeekEntryResult!11134)

(assert (=> b!1421350 (= res!956839 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626072 lt!626073 mask!2608) lt!626075))))

(declare-fun b!1421351 () Bool)

(declare-fun res!956843 () Bool)

(declare-fun e!803696 () Bool)

(assert (=> b!1421351 (=> (not res!956843) (not e!803696))))

(declare-fun a!2831 () array!97008)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421351 (= res!956843 (validKeyInArray!0 (select (arr!46822 a!2831) j!81)))))

(declare-fun b!1421352 () Bool)

(declare-fun e!803693 () Bool)

(assert (=> b!1421352 (= e!803696 e!803693)))

(declare-fun res!956844 () Bool)

(assert (=> b!1421352 (=> (not res!956844) (not e!803693))))

(declare-fun lt!626071 () SeekEntryResult!11134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421352 (= res!956844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46822 a!2831) j!81) mask!2608) (select (arr!46822 a!2831) j!81) a!2831 mask!2608) lt!626071))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1421352 (= lt!626071 (Intermediate!11134 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421353 () Bool)

(declare-fun res!956837 () Bool)

(assert (=> b!1421353 (=> (not res!956837) (not e!803695))))

(assert (=> b!1421353 (= res!956837 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46822 a!2831) j!81) a!2831 mask!2608) lt!626071))))

(declare-fun b!1421354 () Bool)

(declare-fun res!956836 () Bool)

(assert (=> b!1421354 (=> (not res!956836) (not e!803696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97008 (_ BitVec 32)) Bool)

(assert (=> b!1421354 (= res!956836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421355 () Bool)

(declare-fun res!956835 () Bool)

(assert (=> b!1421355 (=> (not res!956835) (not e!803696))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421355 (= res!956835 (and (= (size!47374 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47374 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47374 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421356 () Bool)

(assert (=> b!1421356 (= e!803695 (not true))))

(assert (=> b!1421356 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!47943 0))(
  ( (Unit!47944) )
))
(declare-fun lt!626074 () Unit!47943)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47943)

(assert (=> b!1421356 (= lt!626074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421357 () Bool)

(assert (=> b!1421357 (= e!803693 e!803695)))

(declare-fun res!956838 () Bool)

(assert (=> b!1421357 (=> (not res!956838) (not e!803695))))

(assert (=> b!1421357 (= res!956838 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626072 mask!2608) lt!626072 lt!626073 mask!2608) lt!626075))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421357 (= lt!626075 (Intermediate!11134 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421357 (= lt!626072 (select (store (arr!46822 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421357 (= lt!626073 (array!97009 (store (arr!46822 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47374 a!2831)))))

(declare-fun b!1421358 () Bool)

(declare-fun res!956834 () Bool)

(assert (=> b!1421358 (=> (not res!956834) (not e!803696))))

(assert (=> b!1421358 (= res!956834 (validKeyInArray!0 (select (arr!46822 a!2831) i!982)))))

(declare-fun res!956842 () Bool)

(assert (=> start!122690 (=> (not res!956842) (not e!803696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122690 (= res!956842 (validMask!0 mask!2608))))

(assert (=> start!122690 e!803696))

(assert (=> start!122690 true))

(declare-fun array_inv!36055 (array!97008) Bool)

(assert (=> start!122690 (array_inv!36055 a!2831)))

(declare-fun b!1421359 () Bool)

(declare-fun res!956840 () Bool)

(assert (=> b!1421359 (=> (not res!956840) (not e!803695))))

(assert (=> b!1421359 (= res!956840 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421360 () Bool)

(declare-fun res!956845 () Bool)

(assert (=> b!1421360 (=> (not res!956845) (not e!803696))))

(declare-datatypes ((List!33410 0))(
  ( (Nil!33407) (Cons!33406 (h!34708 (_ BitVec 64)) (t!48096 List!33410)) )
))
(declare-fun arrayNoDuplicates!0 (array!97008 (_ BitVec 32) List!33410) Bool)

(assert (=> b!1421360 (= res!956845 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33407))))

(declare-fun b!1421361 () Bool)

(declare-fun res!956841 () Bool)

(assert (=> b!1421361 (=> (not res!956841) (not e!803696))))

(assert (=> b!1421361 (= res!956841 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47374 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47374 a!2831))))))

(assert (= (and start!122690 res!956842) b!1421355))

(assert (= (and b!1421355 res!956835) b!1421358))

(assert (= (and b!1421358 res!956834) b!1421351))

(assert (= (and b!1421351 res!956843) b!1421354))

(assert (= (and b!1421354 res!956836) b!1421360))

(assert (= (and b!1421360 res!956845) b!1421361))

(assert (= (and b!1421361 res!956841) b!1421352))

(assert (= (and b!1421352 res!956844) b!1421357))

(assert (= (and b!1421357 res!956838) b!1421353))

(assert (= (and b!1421353 res!956837) b!1421350))

(assert (= (and b!1421350 res!956839) b!1421359))

(assert (= (and b!1421359 res!956840) b!1421356))

(declare-fun m!1311423 () Bool)

(assert (=> b!1421358 m!1311423))

(assert (=> b!1421358 m!1311423))

(declare-fun m!1311425 () Bool)

(assert (=> b!1421358 m!1311425))

(declare-fun m!1311427 () Bool)

(assert (=> b!1421360 m!1311427))

(declare-fun m!1311429 () Bool)

(assert (=> b!1421352 m!1311429))

(assert (=> b!1421352 m!1311429))

(declare-fun m!1311431 () Bool)

(assert (=> b!1421352 m!1311431))

(assert (=> b!1421352 m!1311431))

(assert (=> b!1421352 m!1311429))

(declare-fun m!1311433 () Bool)

(assert (=> b!1421352 m!1311433))

(assert (=> b!1421353 m!1311429))

(assert (=> b!1421353 m!1311429))

(declare-fun m!1311435 () Bool)

(assert (=> b!1421353 m!1311435))

(declare-fun m!1311437 () Bool)

(assert (=> b!1421354 m!1311437))

(declare-fun m!1311439 () Bool)

(assert (=> start!122690 m!1311439))

(declare-fun m!1311441 () Bool)

(assert (=> start!122690 m!1311441))

(assert (=> b!1421351 m!1311429))

(assert (=> b!1421351 m!1311429))

(declare-fun m!1311443 () Bool)

(assert (=> b!1421351 m!1311443))

(declare-fun m!1311445 () Bool)

(assert (=> b!1421356 m!1311445))

(declare-fun m!1311447 () Bool)

(assert (=> b!1421356 m!1311447))

(declare-fun m!1311449 () Bool)

(assert (=> b!1421350 m!1311449))

(declare-fun m!1311451 () Bool)

(assert (=> b!1421357 m!1311451))

(assert (=> b!1421357 m!1311451))

(declare-fun m!1311453 () Bool)

(assert (=> b!1421357 m!1311453))

(declare-fun m!1311455 () Bool)

(assert (=> b!1421357 m!1311455))

(declare-fun m!1311457 () Bool)

(assert (=> b!1421357 m!1311457))

(check-sat (not b!1421358) (not b!1421356) (not b!1421352) (not b!1421357) (not b!1421350) (not b!1421360) (not b!1421351) (not b!1421354) (not b!1421353) (not start!122690))
(check-sat)
