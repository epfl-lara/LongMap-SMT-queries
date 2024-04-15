; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122906 () Bool)

(assert start!122906)

(declare-fun b!1425558 () Bool)

(declare-fun e!805369 () Bool)

(declare-fun e!805368 () Bool)

(assert (=> b!1425558 (= e!805369 e!805368)))

(declare-fun res!961045 () Bool)

(assert (=> b!1425558 (=> (not res!961045) (not e!805368))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97224 0))(
  ( (array!97225 (arr!46930 (Array (_ BitVec 32) (_ BitVec 64))) (size!47482 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97224)

(declare-datatypes ((SeekEntryResult!11236 0))(
  ( (MissingZero!11236 (index!47336 (_ BitVec 32))) (Found!11236 (index!47337 (_ BitVec 32))) (Intermediate!11236 (undefined!12048 Bool) (index!47338 (_ BitVec 32)) (x!128963 (_ BitVec 32))) (Undefined!11236) (MissingVacant!11236 (index!47339 (_ BitVec 32))) )
))
(declare-fun lt!627656 () SeekEntryResult!11236)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97224 (_ BitVec 32)) SeekEntryResult!11236)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425558 (= res!961045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46930 a!2831) j!81) mask!2608) (select (arr!46930 a!2831) j!81) a!2831 mask!2608) lt!627656))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425558 (= lt!627656 (Intermediate!11236 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425559 () Bool)

(declare-fun res!961051 () Bool)

(assert (=> b!1425559 (=> (not res!961051) (not e!805369))))

(declare-datatypes ((List!33518 0))(
  ( (Nil!33515) (Cons!33514 (h!34816 (_ BitVec 64)) (t!48204 List!33518)) )
))
(declare-fun arrayNoDuplicates!0 (array!97224 (_ BitVec 32) List!33518) Bool)

(assert (=> b!1425559 (= res!961051 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33515))))

(declare-fun b!1425560 () Bool)

(declare-fun res!961043 () Bool)

(assert (=> b!1425560 (=> (not res!961043) (not e!805369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425560 (= res!961043 (validKeyInArray!0 (select (arr!46930 a!2831) j!81)))))

(declare-fun b!1425562 () Bool)

(declare-fun res!961042 () Bool)

(assert (=> b!1425562 (=> (not res!961042) (not e!805369))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425562 (= res!961042 (validKeyInArray!0 (select (arr!46930 a!2831) i!982)))))

(declare-fun b!1425563 () Bool)

(declare-fun e!805367 () Bool)

(assert (=> b!1425563 (= e!805368 e!805367)))

(declare-fun res!961046 () Bool)

(assert (=> b!1425563 (=> (not res!961046) (not e!805367))))

(declare-fun lt!627655 () array!97224)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun lt!627653 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1425563 (= res!961046 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627653 mask!2608) lt!627653 lt!627655 mask!2608) (Intermediate!11236 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425563 (= lt!627653 (select (store (arr!46930 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425563 (= lt!627655 (array!97225 (store (arr!46930 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47482 a!2831)))))

(declare-fun b!1425564 () Bool)

(declare-fun res!961044 () Bool)

(assert (=> b!1425564 (=> (not res!961044) (not e!805369))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425564 (= res!961044 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47482 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47482 a!2831))))))

(declare-fun b!1425565 () Bool)

(declare-fun res!961049 () Bool)

(assert (=> b!1425565 (=> (not res!961049) (not e!805369))))

(assert (=> b!1425565 (= res!961049 (and (= (size!47482 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47482 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47482 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425566 () Bool)

(declare-fun res!961050 () Bool)

(assert (=> b!1425566 (=> (not res!961050) (not e!805369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97224 (_ BitVec 32)) Bool)

(assert (=> b!1425566 (= res!961050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425567 () Bool)

(assert (=> b!1425567 (= e!805367 false)))

(declare-fun lt!627654 () SeekEntryResult!11236)

(assert (=> b!1425567 (= lt!627654 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627653 lt!627655 mask!2608))))

(declare-fun res!961048 () Bool)

(assert (=> start!122906 (=> (not res!961048) (not e!805369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122906 (= res!961048 (validMask!0 mask!2608))))

(assert (=> start!122906 e!805369))

(assert (=> start!122906 true))

(declare-fun array_inv!36163 (array!97224) Bool)

(assert (=> start!122906 (array_inv!36163 a!2831)))

(declare-fun b!1425561 () Bool)

(declare-fun res!961047 () Bool)

(assert (=> b!1425561 (=> (not res!961047) (not e!805367))))

(assert (=> b!1425561 (= res!961047 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46930 a!2831) j!81) a!2831 mask!2608) lt!627656))))

(assert (= (and start!122906 res!961048) b!1425565))

(assert (= (and b!1425565 res!961049) b!1425562))

(assert (= (and b!1425562 res!961042) b!1425560))

(assert (= (and b!1425560 res!961043) b!1425566))

(assert (= (and b!1425566 res!961050) b!1425559))

(assert (= (and b!1425559 res!961051) b!1425564))

(assert (= (and b!1425564 res!961044) b!1425558))

(assert (= (and b!1425558 res!961045) b!1425563))

(assert (= (and b!1425563 res!961046) b!1425561))

(assert (= (and b!1425561 res!961047) b!1425567))

(declare-fun m!1315683 () Bool)

(assert (=> b!1425560 m!1315683))

(assert (=> b!1425560 m!1315683))

(declare-fun m!1315685 () Bool)

(assert (=> b!1425560 m!1315685))

(assert (=> b!1425561 m!1315683))

(assert (=> b!1425561 m!1315683))

(declare-fun m!1315687 () Bool)

(assert (=> b!1425561 m!1315687))

(assert (=> b!1425558 m!1315683))

(assert (=> b!1425558 m!1315683))

(declare-fun m!1315689 () Bool)

(assert (=> b!1425558 m!1315689))

(assert (=> b!1425558 m!1315689))

(assert (=> b!1425558 m!1315683))

(declare-fun m!1315691 () Bool)

(assert (=> b!1425558 m!1315691))

(declare-fun m!1315693 () Bool)

(assert (=> b!1425566 m!1315693))

(declare-fun m!1315695 () Bool)

(assert (=> start!122906 m!1315695))

(declare-fun m!1315697 () Bool)

(assert (=> start!122906 m!1315697))

(declare-fun m!1315699 () Bool)

(assert (=> b!1425563 m!1315699))

(assert (=> b!1425563 m!1315699))

(declare-fun m!1315701 () Bool)

(assert (=> b!1425563 m!1315701))

(declare-fun m!1315703 () Bool)

(assert (=> b!1425563 m!1315703))

(declare-fun m!1315705 () Bool)

(assert (=> b!1425563 m!1315705))

(declare-fun m!1315707 () Bool)

(assert (=> b!1425567 m!1315707))

(declare-fun m!1315709 () Bool)

(assert (=> b!1425559 m!1315709))

(declare-fun m!1315711 () Bool)

(assert (=> b!1425562 m!1315711))

(assert (=> b!1425562 m!1315711))

(declare-fun m!1315713 () Bool)

(assert (=> b!1425562 m!1315713))

(check-sat (not b!1425560) (not b!1425563) (not b!1425558) (not b!1425562) (not b!1425567) (not start!122906) (not b!1425559) (not b!1425561) (not b!1425566))
(check-sat)
