; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122822 () Bool)

(assert start!122822)

(declare-fun b!1424382 () Bool)

(declare-fun res!959869 () Bool)

(declare-fun e!804992 () Bool)

(assert (=> b!1424382 (=> res!959869 e!804992)))

(declare-datatypes ((SeekEntryResult!11200 0))(
  ( (MissingZero!11200 (index!47192 (_ BitVec 32))) (Found!11200 (index!47193 (_ BitVec 32))) (Intermediate!11200 (undefined!12012 Bool) (index!47194 (_ BitVec 32)) (x!128815 (_ BitVec 32))) (Undefined!11200) (MissingVacant!11200 (index!47195 (_ BitVec 32))) )
))
(declare-fun lt!627375 () SeekEntryResult!11200)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97140 0))(
  ( (array!97141 (arr!46888 (Array (_ BitVec 32) (_ BitVec 64))) (size!47440 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97140)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627377 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97140 (_ BitVec 32)) SeekEntryResult!11200)

(assert (=> b!1424382 (= res!959869 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627377 (select (arr!46888 a!2831) j!81) a!2831 mask!2608) lt!627375)))))

(declare-fun b!1424383 () Bool)

(declare-fun e!804990 () Bool)

(declare-fun e!804987 () Bool)

(assert (=> b!1424383 (= e!804990 (not e!804987))))

(declare-fun res!959871 () Bool)

(assert (=> b!1424383 (=> res!959871 e!804987)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424383 (= res!959871 (or (= (select (arr!46888 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46888 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46888 a!2831) index!585) (select (arr!46888 a!2831) j!81)) (= (select (store (arr!46888 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804988 () Bool)

(assert (=> b!1424383 e!804988))

(declare-fun res!959872 () Bool)

(assert (=> b!1424383 (=> (not res!959872) (not e!804988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97140 (_ BitVec 32)) Bool)

(assert (=> b!1424383 (= res!959872 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48075 0))(
  ( (Unit!48076) )
))
(declare-fun lt!627374 () Unit!48075)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48075)

(assert (=> b!1424383 (= lt!627374 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424384 () Bool)

(declare-fun e!804986 () Bool)

(declare-fun e!804991 () Bool)

(assert (=> b!1424384 (= e!804986 e!804991)))

(declare-fun res!959874 () Bool)

(assert (=> b!1424384 (=> (not res!959874) (not e!804991))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424384 (= res!959874 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46888 a!2831) j!81) mask!2608) (select (arr!46888 a!2831) j!81) a!2831 mask!2608) lt!627375))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424384 (= lt!627375 (Intermediate!11200 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424385 () Bool)

(declare-fun res!959866 () Bool)

(assert (=> b!1424385 (=> (not res!959866) (not e!804986))))

(assert (=> b!1424385 (= res!959866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424386 () Bool)

(declare-fun res!959881 () Bool)

(assert (=> b!1424386 (=> (not res!959881) (not e!804986))))

(assert (=> b!1424386 (= res!959881 (and (= (size!47440 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47440 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47440 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!959873 () Bool)

(assert (=> start!122822 (=> (not res!959873) (not e!804986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122822 (= res!959873 (validMask!0 mask!2608))))

(assert (=> start!122822 e!804986))

(assert (=> start!122822 true))

(declare-fun array_inv!36121 (array!97140) Bool)

(assert (=> start!122822 (array_inv!36121 a!2831)))

(declare-fun b!1424387 () Bool)

(declare-fun res!959877 () Bool)

(assert (=> b!1424387 (=> (not res!959877) (not e!804990))))

(assert (=> b!1424387 (= res!959877 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46888 a!2831) j!81) a!2831 mask!2608) lt!627375))))

(declare-fun b!1424388 () Bool)

(declare-fun res!959880 () Bool)

(assert (=> b!1424388 (=> (not res!959880) (not e!804986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424388 (= res!959880 (validKeyInArray!0 (select (arr!46888 a!2831) i!982)))))

(declare-fun b!1424389 () Bool)

(declare-fun res!959867 () Bool)

(assert (=> b!1424389 (=> (not res!959867) (not e!804990))))

(declare-fun lt!627373 () array!97140)

(declare-fun lt!627371 () SeekEntryResult!11200)

(declare-fun lt!627372 () (_ BitVec 64))

(assert (=> b!1424389 (= res!959867 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627372 lt!627373 mask!2608) lt!627371))))

(declare-fun b!1424390 () Bool)

(declare-fun res!959878 () Bool)

(assert (=> b!1424390 (=> (not res!959878) (not e!804990))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424390 (= res!959878 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424391 () Bool)

(declare-fun res!959879 () Bool)

(assert (=> b!1424391 (=> (not res!959879) (not e!804986))))

(declare-datatypes ((List!33476 0))(
  ( (Nil!33473) (Cons!33472 (h!34774 (_ BitVec 64)) (t!48162 List!33476)) )
))
(declare-fun arrayNoDuplicates!0 (array!97140 (_ BitVec 32) List!33476) Bool)

(assert (=> b!1424391 (= res!959879 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33473))))

(declare-fun b!1424392 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97140 (_ BitVec 32)) SeekEntryResult!11200)

(assert (=> b!1424392 (= e!804988 (= (seekEntryOrOpen!0 (select (arr!46888 a!2831) j!81) a!2831 mask!2608) (Found!11200 j!81)))))

(declare-fun b!1424393 () Bool)

(declare-fun res!959876 () Bool)

(assert (=> b!1424393 (=> (not res!959876) (not e!804986))))

(assert (=> b!1424393 (= res!959876 (validKeyInArray!0 (select (arr!46888 a!2831) j!81)))))

(declare-fun b!1424394 () Bool)

(assert (=> b!1424394 (= e!804992 true)))

(declare-fun lt!627376 () SeekEntryResult!11200)

(assert (=> b!1424394 (= lt!627376 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627377 lt!627372 lt!627373 mask!2608))))

(declare-fun b!1424395 () Bool)

(assert (=> b!1424395 (= e!804987 e!804992)))

(declare-fun res!959870 () Bool)

(assert (=> b!1424395 (=> res!959870 e!804992)))

(assert (=> b!1424395 (= res!959870 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627377 #b00000000000000000000000000000000) (bvsge lt!627377 (size!47440 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424395 (= lt!627377 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424396 () Bool)

(assert (=> b!1424396 (= e!804991 e!804990)))

(declare-fun res!959875 () Bool)

(assert (=> b!1424396 (=> (not res!959875) (not e!804990))))

(assert (=> b!1424396 (= res!959875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627372 mask!2608) lt!627372 lt!627373 mask!2608) lt!627371))))

(assert (=> b!1424396 (= lt!627371 (Intermediate!11200 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424396 (= lt!627372 (select (store (arr!46888 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424396 (= lt!627373 (array!97141 (store (arr!46888 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47440 a!2831)))))

(declare-fun b!1424397 () Bool)

(declare-fun res!959868 () Bool)

(assert (=> b!1424397 (=> (not res!959868) (not e!804986))))

(assert (=> b!1424397 (= res!959868 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47440 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47440 a!2831))))))

(assert (= (and start!122822 res!959873) b!1424386))

(assert (= (and b!1424386 res!959881) b!1424388))

(assert (= (and b!1424388 res!959880) b!1424393))

(assert (= (and b!1424393 res!959876) b!1424385))

(assert (= (and b!1424385 res!959866) b!1424391))

(assert (= (and b!1424391 res!959879) b!1424397))

(assert (= (and b!1424397 res!959868) b!1424384))

(assert (= (and b!1424384 res!959874) b!1424396))

(assert (= (and b!1424396 res!959875) b!1424387))

(assert (= (and b!1424387 res!959877) b!1424389))

(assert (= (and b!1424389 res!959867) b!1424390))

(assert (= (and b!1424390 res!959878) b!1424383))

(assert (= (and b!1424383 res!959872) b!1424392))

(assert (= (and b!1424383 (not res!959871)) b!1424395))

(assert (= (and b!1424395 (not res!959870)) b!1424382))

(assert (= (and b!1424382 (not res!959869)) b!1424394))

(declare-fun m!1314459 () Bool)

(assert (=> b!1424385 m!1314459))

(declare-fun m!1314461 () Bool)

(assert (=> b!1424391 m!1314461))

(declare-fun m!1314463 () Bool)

(assert (=> b!1424393 m!1314463))

(assert (=> b!1424393 m!1314463))

(declare-fun m!1314465 () Bool)

(assert (=> b!1424393 m!1314465))

(declare-fun m!1314467 () Bool)

(assert (=> b!1424389 m!1314467))

(assert (=> b!1424382 m!1314463))

(assert (=> b!1424382 m!1314463))

(declare-fun m!1314469 () Bool)

(assert (=> b!1424382 m!1314469))

(declare-fun m!1314471 () Bool)

(assert (=> b!1424383 m!1314471))

(declare-fun m!1314473 () Bool)

(assert (=> b!1424383 m!1314473))

(declare-fun m!1314475 () Bool)

(assert (=> b!1424383 m!1314475))

(declare-fun m!1314477 () Bool)

(assert (=> b!1424383 m!1314477))

(assert (=> b!1424383 m!1314463))

(declare-fun m!1314479 () Bool)

(assert (=> b!1424383 m!1314479))

(declare-fun m!1314481 () Bool)

(assert (=> b!1424395 m!1314481))

(declare-fun m!1314483 () Bool)

(assert (=> b!1424394 m!1314483))

(declare-fun m!1314485 () Bool)

(assert (=> start!122822 m!1314485))

(declare-fun m!1314487 () Bool)

(assert (=> start!122822 m!1314487))

(assert (=> b!1424392 m!1314463))

(assert (=> b!1424392 m!1314463))

(declare-fun m!1314489 () Bool)

(assert (=> b!1424392 m!1314489))

(declare-fun m!1314491 () Bool)

(assert (=> b!1424396 m!1314491))

(assert (=> b!1424396 m!1314491))

(declare-fun m!1314493 () Bool)

(assert (=> b!1424396 m!1314493))

(assert (=> b!1424396 m!1314471))

(declare-fun m!1314495 () Bool)

(assert (=> b!1424396 m!1314495))

(declare-fun m!1314497 () Bool)

(assert (=> b!1424388 m!1314497))

(assert (=> b!1424388 m!1314497))

(declare-fun m!1314499 () Bool)

(assert (=> b!1424388 m!1314499))

(assert (=> b!1424387 m!1314463))

(assert (=> b!1424387 m!1314463))

(declare-fun m!1314501 () Bool)

(assert (=> b!1424387 m!1314501))

(assert (=> b!1424384 m!1314463))

(assert (=> b!1424384 m!1314463))

(declare-fun m!1314503 () Bool)

(assert (=> b!1424384 m!1314503))

(assert (=> b!1424384 m!1314503))

(assert (=> b!1424384 m!1314463))

(declare-fun m!1314505 () Bool)

(assert (=> b!1424384 m!1314505))

(check-sat (not b!1424392) (not b!1424384) (not b!1424396) (not b!1424388) (not b!1424394) (not start!122822) (not b!1424385) (not b!1424383) (not b!1424393) (not b!1424395) (not b!1424387) (not b!1424391) (not b!1424382) (not b!1424389))
(check-sat)
