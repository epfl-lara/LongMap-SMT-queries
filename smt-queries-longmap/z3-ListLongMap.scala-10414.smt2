; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122642 () Bool)

(assert start!122642)

(declare-fun b!1420572 () Bool)

(declare-fun res!956064 () Bool)

(declare-fun e!803408 () Bool)

(assert (=> b!1420572 (=> (not res!956064) (not e!803408))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11110 0))(
  ( (MissingZero!11110 (index!46832 (_ BitVec 32))) (Found!11110 (index!46833 (_ BitVec 32))) (Intermediate!11110 (undefined!11922 Bool) (index!46834 (_ BitVec 32)) (x!128485 (_ BitVec 32))) (Undefined!11110) (MissingVacant!11110 (index!46835 (_ BitVec 32))) )
))
(declare-fun lt!625756 () SeekEntryResult!11110)

(declare-datatypes ((array!96960 0))(
  ( (array!96961 (arr!46798 (Array (_ BitVec 32) (_ BitVec 64))) (size!47350 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96960)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96960 (_ BitVec 32)) SeekEntryResult!11110)

(assert (=> b!1420572 (= res!956064 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46798 a!2831) j!81) a!2831 mask!2608) lt!625756))))

(declare-fun res!956056 () Bool)

(declare-fun e!803405 () Bool)

(assert (=> start!122642 (=> (not res!956056) (not e!803405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122642 (= res!956056 (validMask!0 mask!2608))))

(assert (=> start!122642 e!803405))

(assert (=> start!122642 true))

(declare-fun array_inv!36031 (array!96960) Bool)

(assert (=> start!122642 (array_inv!36031 a!2831)))

(declare-fun b!1420573 () Bool)

(declare-fun res!956061 () Bool)

(assert (=> b!1420573 (=> (not res!956061) (not e!803405))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420573 (= res!956061 (validKeyInArray!0 (select (arr!46798 a!2831) i!982)))))

(declare-fun b!1420574 () Bool)

(declare-fun res!956065 () Bool)

(assert (=> b!1420574 (=> (not res!956065) (not e!803405))))

(assert (=> b!1420574 (= res!956065 (and (= (size!47350 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47350 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47350 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420575 () Bool)

(declare-fun e!803406 () Bool)

(assert (=> b!1420575 (= e!803406 e!803408)))

(declare-fun res!956058 () Bool)

(assert (=> b!1420575 (=> (not res!956058) (not e!803408))))

(declare-fun lt!625754 () array!96960)

(declare-fun lt!625757 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420575 (= res!956058 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625757 mask!2608) lt!625757 lt!625754 mask!2608) (Intermediate!11110 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420575 (= lt!625757 (select (store (arr!46798 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420575 (= lt!625754 (array!96961 (store (arr!46798 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47350 a!2831)))))

(declare-fun b!1420576 () Bool)

(declare-fun res!956063 () Bool)

(assert (=> b!1420576 (=> (not res!956063) (not e!803405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96960 (_ BitVec 32)) Bool)

(assert (=> b!1420576 (= res!956063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420577 () Bool)

(assert (=> b!1420577 (= e!803405 e!803406)))

(declare-fun res!956059 () Bool)

(assert (=> b!1420577 (=> (not res!956059) (not e!803406))))

(assert (=> b!1420577 (= res!956059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46798 a!2831) j!81) mask!2608) (select (arr!46798 a!2831) j!81) a!2831 mask!2608) lt!625756))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420577 (= lt!625756 (Intermediate!11110 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420578 () Bool)

(declare-fun res!956057 () Bool)

(assert (=> b!1420578 (=> (not res!956057) (not e!803405))))

(declare-datatypes ((List!33386 0))(
  ( (Nil!33383) (Cons!33382 (h!34684 (_ BitVec 64)) (t!48072 List!33386)) )
))
(declare-fun arrayNoDuplicates!0 (array!96960 (_ BitVec 32) List!33386) Bool)

(assert (=> b!1420578 (= res!956057 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33383))))

(declare-fun b!1420579 () Bool)

(declare-fun res!956062 () Bool)

(assert (=> b!1420579 (=> (not res!956062) (not e!803405))))

(assert (=> b!1420579 (= res!956062 (validKeyInArray!0 (select (arr!46798 a!2831) j!81)))))

(declare-fun b!1420580 () Bool)

(assert (=> b!1420580 (= e!803408 false)))

(declare-fun lt!625755 () SeekEntryResult!11110)

(assert (=> b!1420580 (= lt!625755 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625757 lt!625754 mask!2608))))

(declare-fun b!1420581 () Bool)

(declare-fun res!956060 () Bool)

(assert (=> b!1420581 (=> (not res!956060) (not e!803405))))

(assert (=> b!1420581 (= res!956060 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47350 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47350 a!2831))))))

(assert (= (and start!122642 res!956056) b!1420574))

(assert (= (and b!1420574 res!956065) b!1420573))

(assert (= (and b!1420573 res!956061) b!1420579))

(assert (= (and b!1420579 res!956062) b!1420576))

(assert (= (and b!1420576 res!956063) b!1420578))

(assert (= (and b!1420578 res!956057) b!1420581))

(assert (= (and b!1420581 res!956060) b!1420577))

(assert (= (and b!1420577 res!956059) b!1420575))

(assert (= (and b!1420575 res!956058) b!1420572))

(assert (= (and b!1420572 res!956064) b!1420580))

(declare-fun m!1310619 () Bool)

(assert (=> b!1420573 m!1310619))

(assert (=> b!1420573 m!1310619))

(declare-fun m!1310621 () Bool)

(assert (=> b!1420573 m!1310621))

(declare-fun m!1310623 () Bool)

(assert (=> b!1420579 m!1310623))

(assert (=> b!1420579 m!1310623))

(declare-fun m!1310625 () Bool)

(assert (=> b!1420579 m!1310625))

(declare-fun m!1310627 () Bool)

(assert (=> start!122642 m!1310627))

(declare-fun m!1310629 () Bool)

(assert (=> start!122642 m!1310629))

(declare-fun m!1310631 () Bool)

(assert (=> b!1420575 m!1310631))

(assert (=> b!1420575 m!1310631))

(declare-fun m!1310633 () Bool)

(assert (=> b!1420575 m!1310633))

(declare-fun m!1310635 () Bool)

(assert (=> b!1420575 m!1310635))

(declare-fun m!1310637 () Bool)

(assert (=> b!1420575 m!1310637))

(declare-fun m!1310639 () Bool)

(assert (=> b!1420576 m!1310639))

(declare-fun m!1310641 () Bool)

(assert (=> b!1420580 m!1310641))

(declare-fun m!1310643 () Bool)

(assert (=> b!1420578 m!1310643))

(assert (=> b!1420572 m!1310623))

(assert (=> b!1420572 m!1310623))

(declare-fun m!1310645 () Bool)

(assert (=> b!1420572 m!1310645))

(assert (=> b!1420577 m!1310623))

(assert (=> b!1420577 m!1310623))

(declare-fun m!1310647 () Bool)

(assert (=> b!1420577 m!1310647))

(assert (=> b!1420577 m!1310647))

(assert (=> b!1420577 m!1310623))

(declare-fun m!1310649 () Bool)

(assert (=> b!1420577 m!1310649))

(check-sat (not start!122642) (not b!1420579) (not b!1420575) (not b!1420573) (not b!1420578) (not b!1420577) (not b!1420576) (not b!1420580) (not b!1420572))
(check-sat)
