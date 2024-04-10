; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122810 () Bool)

(assert start!122810)

(declare-fun b!1424079 () Bool)

(declare-fun res!959520 () Bool)

(declare-fun e!804862 () Bool)

(assert (=> b!1424079 (=> (not res!959520) (not e!804862))))

(declare-datatypes ((array!97175 0))(
  ( (array!97176 (arr!46905 (Array (_ BitVec 32) (_ BitVec 64))) (size!47455 (_ BitVec 32))) )
))
(declare-fun lt!627393 () array!97175)

(declare-datatypes ((SeekEntryResult!11190 0))(
  ( (MissingZero!11190 (index!47152 (_ BitVec 32))) (Found!11190 (index!47153 (_ BitVec 32))) (Intermediate!11190 (undefined!12002 Bool) (index!47154 (_ BitVec 32)) (x!128784 (_ BitVec 32))) (Undefined!11190) (MissingVacant!11190 (index!47155 (_ BitVec 32))) )
))
(declare-fun lt!627399 () SeekEntryResult!11190)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627397 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97175 (_ BitVec 32)) SeekEntryResult!11190)

(assert (=> b!1424079 (= res!959520 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627397 lt!627393 mask!2608) lt!627399))))

(declare-fun b!1424080 () Bool)

(declare-fun e!804860 () Bool)

(assert (=> b!1424080 (= e!804860 e!804862)))

(declare-fun res!959522 () Bool)

(assert (=> b!1424080 (=> (not res!959522) (not e!804862))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424080 (= res!959522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627397 mask!2608) lt!627397 lt!627393 mask!2608) lt!627399))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424080 (= lt!627399 (Intermediate!11190 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97175)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424080 (= lt!627397 (select (store (arr!46905 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424080 (= lt!627393 (array!97176 (store (arr!46905 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47455 a!2831)))))

(declare-fun b!1424081 () Bool)

(declare-fun res!959517 () Bool)

(declare-fun e!804857 () Bool)

(assert (=> b!1424081 (=> (not res!959517) (not e!804857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424081 (= res!959517 (validKeyInArray!0 (select (arr!46905 a!2831) j!81)))))

(declare-fun b!1424082 () Bool)

(declare-fun res!959526 () Bool)

(assert (=> b!1424082 (=> (not res!959526) (not e!804862))))

(declare-fun lt!627398 () SeekEntryResult!11190)

(assert (=> b!1424082 (= res!959526 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46905 a!2831) j!81) a!2831 mask!2608) lt!627398))))

(declare-fun b!1424083 () Bool)

(declare-fun res!959514 () Bool)

(assert (=> b!1424083 (=> (not res!959514) (not e!804857))))

(assert (=> b!1424083 (= res!959514 (validKeyInArray!0 (select (arr!46905 a!2831) i!982)))))

(declare-fun b!1424084 () Bool)

(declare-fun res!959525 () Bool)

(assert (=> b!1424084 (=> (not res!959525) (not e!804857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97175 (_ BitVec 32)) Bool)

(assert (=> b!1424084 (= res!959525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424085 () Bool)

(declare-fun res!959527 () Bool)

(assert (=> b!1424085 (=> (not res!959527) (not e!804862))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1424085 (= res!959527 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun e!804861 () Bool)

(declare-fun b!1424086 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97175 (_ BitVec 32)) SeekEntryResult!11190)

(assert (=> b!1424086 (= e!804861 (= (seekEntryOrOpen!0 (select (arr!46905 a!2831) j!81) a!2831 mask!2608) (Found!11190 j!81)))))

(declare-fun b!1424087 () Bool)

(declare-fun e!804863 () Bool)

(assert (=> b!1424087 (= e!804863 true)))

(declare-fun lt!627396 () SeekEntryResult!11190)

(declare-fun lt!627394 () (_ BitVec 32))

(assert (=> b!1424087 (= lt!627396 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627394 lt!627397 lt!627393 mask!2608))))

(declare-fun b!1424088 () Bool)

(assert (=> b!1424088 (= e!804857 e!804860)))

(declare-fun res!959516 () Bool)

(assert (=> b!1424088 (=> (not res!959516) (not e!804860))))

(assert (=> b!1424088 (= res!959516 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46905 a!2831) j!81) mask!2608) (select (arr!46905 a!2831) j!81) a!2831 mask!2608) lt!627398))))

(assert (=> b!1424088 (= lt!627398 (Intermediate!11190 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424089 () Bool)

(declare-fun res!959523 () Bool)

(assert (=> b!1424089 (=> (not res!959523) (not e!804857))))

(assert (=> b!1424089 (= res!959523 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47455 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47455 a!2831))))))

(declare-fun b!1424090 () Bool)

(declare-fun res!959515 () Bool)

(assert (=> b!1424090 (=> (not res!959515) (not e!804857))))

(assert (=> b!1424090 (= res!959515 (and (= (size!47455 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47455 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47455 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424091 () Bool)

(declare-fun res!959521 () Bool)

(assert (=> b!1424091 (=> (not res!959521) (not e!804857))))

(declare-datatypes ((List!33415 0))(
  ( (Nil!33412) (Cons!33411 (h!34713 (_ BitVec 64)) (t!48109 List!33415)) )
))
(declare-fun arrayNoDuplicates!0 (array!97175 (_ BitVec 32) List!33415) Bool)

(assert (=> b!1424091 (= res!959521 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33412))))

(declare-fun b!1424092 () Bool)

(declare-fun e!804859 () Bool)

(assert (=> b!1424092 (= e!804862 (not e!804859))))

(declare-fun res!959518 () Bool)

(assert (=> b!1424092 (=> res!959518 e!804859)))

(assert (=> b!1424092 (= res!959518 (or (= (select (arr!46905 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46905 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46905 a!2831) index!585) (select (arr!46905 a!2831) j!81)) (= (select (store (arr!46905 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424092 e!804861))

(declare-fun res!959524 () Bool)

(assert (=> b!1424092 (=> (not res!959524) (not e!804861))))

(assert (=> b!1424092 (= res!959524 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48216 0))(
  ( (Unit!48217) )
))
(declare-fun lt!627395 () Unit!48216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48216)

(assert (=> b!1424092 (= lt!627395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!959512 () Bool)

(assert (=> start!122810 (=> (not res!959512) (not e!804857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122810 (= res!959512 (validMask!0 mask!2608))))

(assert (=> start!122810 e!804857))

(assert (=> start!122810 true))

(declare-fun array_inv!35933 (array!97175) Bool)

(assert (=> start!122810 (array_inv!35933 a!2831)))

(declare-fun b!1424093 () Bool)

(declare-fun res!959519 () Bool)

(assert (=> b!1424093 (=> res!959519 e!804863)))

(assert (=> b!1424093 (= res!959519 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627394 (select (arr!46905 a!2831) j!81) a!2831 mask!2608) lt!627398)))))

(declare-fun b!1424094 () Bool)

(assert (=> b!1424094 (= e!804859 e!804863)))

(declare-fun res!959513 () Bool)

(assert (=> b!1424094 (=> res!959513 e!804863)))

(assert (=> b!1424094 (= res!959513 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627394 #b00000000000000000000000000000000) (bvsge lt!627394 (size!47455 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424094 (= lt!627394 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!122810 res!959512) b!1424090))

(assert (= (and b!1424090 res!959515) b!1424083))

(assert (= (and b!1424083 res!959514) b!1424081))

(assert (= (and b!1424081 res!959517) b!1424084))

(assert (= (and b!1424084 res!959525) b!1424091))

(assert (= (and b!1424091 res!959521) b!1424089))

(assert (= (and b!1424089 res!959523) b!1424088))

(assert (= (and b!1424088 res!959516) b!1424080))

(assert (= (and b!1424080 res!959522) b!1424082))

(assert (= (and b!1424082 res!959526) b!1424079))

(assert (= (and b!1424079 res!959520) b!1424085))

(assert (= (and b!1424085 res!959527) b!1424092))

(assert (= (and b!1424092 res!959524) b!1424086))

(assert (= (and b!1424092 (not res!959518)) b!1424094))

(assert (= (and b!1424094 (not res!959513)) b!1424093))

(assert (= (and b!1424093 (not res!959519)) b!1424087))

(declare-fun m!1314627 () Bool)

(assert (=> b!1424092 m!1314627))

(declare-fun m!1314629 () Bool)

(assert (=> b!1424092 m!1314629))

(declare-fun m!1314631 () Bool)

(assert (=> b!1424092 m!1314631))

(declare-fun m!1314633 () Bool)

(assert (=> b!1424092 m!1314633))

(declare-fun m!1314635 () Bool)

(assert (=> b!1424092 m!1314635))

(declare-fun m!1314637 () Bool)

(assert (=> b!1424092 m!1314637))

(assert (=> b!1424088 m!1314635))

(assert (=> b!1424088 m!1314635))

(declare-fun m!1314639 () Bool)

(assert (=> b!1424088 m!1314639))

(assert (=> b!1424088 m!1314639))

(assert (=> b!1424088 m!1314635))

(declare-fun m!1314641 () Bool)

(assert (=> b!1424088 m!1314641))

(assert (=> b!1424081 m!1314635))

(assert (=> b!1424081 m!1314635))

(declare-fun m!1314643 () Bool)

(assert (=> b!1424081 m!1314643))

(declare-fun m!1314645 () Bool)

(assert (=> b!1424083 m!1314645))

(assert (=> b!1424083 m!1314645))

(declare-fun m!1314647 () Bool)

(assert (=> b!1424083 m!1314647))

(declare-fun m!1314649 () Bool)

(assert (=> b!1424094 m!1314649))

(declare-fun m!1314651 () Bool)

(assert (=> start!122810 m!1314651))

(declare-fun m!1314653 () Bool)

(assert (=> start!122810 m!1314653))

(assert (=> b!1424086 m!1314635))

(assert (=> b!1424086 m!1314635))

(declare-fun m!1314655 () Bool)

(assert (=> b!1424086 m!1314655))

(declare-fun m!1314657 () Bool)

(assert (=> b!1424087 m!1314657))

(assert (=> b!1424093 m!1314635))

(assert (=> b!1424093 m!1314635))

(declare-fun m!1314659 () Bool)

(assert (=> b!1424093 m!1314659))

(declare-fun m!1314661 () Bool)

(assert (=> b!1424080 m!1314661))

(assert (=> b!1424080 m!1314661))

(declare-fun m!1314663 () Bool)

(assert (=> b!1424080 m!1314663))

(assert (=> b!1424080 m!1314627))

(declare-fun m!1314665 () Bool)

(assert (=> b!1424080 m!1314665))

(declare-fun m!1314667 () Bool)

(assert (=> b!1424091 m!1314667))

(declare-fun m!1314669 () Bool)

(assert (=> b!1424084 m!1314669))

(declare-fun m!1314671 () Bool)

(assert (=> b!1424079 m!1314671))

(assert (=> b!1424082 m!1314635))

(assert (=> b!1424082 m!1314635))

(declare-fun m!1314673 () Bool)

(assert (=> b!1424082 m!1314673))

(check-sat (not b!1424084) (not b!1424091) (not b!1424087) (not b!1424083) (not b!1424086) (not b!1424079) (not b!1424082) (not b!1424088) (not b!1424094) (not b!1424093) (not b!1424081) (not b!1424092) (not b!1424080) (not start!122810))
(check-sat)
