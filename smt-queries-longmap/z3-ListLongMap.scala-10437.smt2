; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122780 () Bool)

(assert start!122780)

(declare-fun e!804549 () Bool)

(declare-fun b!1423374 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97098 0))(
  ( (array!97099 (arr!46867 (Array (_ BitVec 32) (_ BitVec 64))) (size!47419 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97098)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11179 0))(
  ( (MissingZero!11179 (index!47108 (_ BitVec 32))) (Found!11179 (index!47109 (_ BitVec 32))) (Intermediate!11179 (undefined!11991 Bool) (index!47110 (_ BitVec 32)) (x!128738 (_ BitVec 32))) (Undefined!11179) (MissingVacant!11179 (index!47111 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97098 (_ BitVec 32)) SeekEntryResult!11179)

(assert (=> b!1423374 (= e!804549 (= (seekEntryOrOpen!0 (select (arr!46867 a!2831) j!81) a!2831 mask!2608) (Found!11179 j!81)))))

(declare-fun res!958861 () Bool)

(declare-fun e!804550 () Bool)

(assert (=> start!122780 (=> (not res!958861) (not e!804550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122780 (= res!958861 (validMask!0 mask!2608))))

(assert (=> start!122780 e!804550))

(assert (=> start!122780 true))

(declare-fun array_inv!36100 (array!97098) Bool)

(assert (=> start!122780 (array_inv!36100 a!2831)))

(declare-fun b!1423375 () Bool)

(declare-fun e!804548 () Bool)

(declare-fun e!804545 () Bool)

(assert (=> b!1423375 (= e!804548 e!804545)))

(declare-fun res!958864 () Bool)

(assert (=> b!1423375 (=> res!958864 e!804545)))

(declare-fun lt!626934 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1423375 (= res!958864 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626934 #b00000000000000000000000000000000) (bvsge lt!626934 (size!47419 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423375 (= lt!626934 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423376 () Bool)

(declare-fun res!958868 () Bool)

(assert (=> b!1423376 (=> (not res!958868) (not e!804550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97098 (_ BitVec 32)) Bool)

(assert (=> b!1423376 (= res!958868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423377 () Bool)

(declare-fun e!804547 () Bool)

(assert (=> b!1423377 (= e!804547 (not e!804548))))

(declare-fun res!958870 () Bool)

(assert (=> b!1423377 (=> res!958870 e!804548)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423377 (= res!958870 (or (= (select (arr!46867 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46867 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46867 a!2831) index!585) (select (arr!46867 a!2831) j!81)) (= (select (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423377 e!804549))

(declare-fun res!958859 () Bool)

(assert (=> b!1423377 (=> (not res!958859) (not e!804549))))

(assert (=> b!1423377 (= res!958859 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48033 0))(
  ( (Unit!48034) )
))
(declare-fun lt!626936 () Unit!48033)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48033)

(assert (=> b!1423377 (= lt!626936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423378 () Bool)

(declare-fun res!958866 () Bool)

(assert (=> b!1423378 (=> res!958866 e!804545)))

(declare-fun lt!626935 () SeekEntryResult!11179)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97098 (_ BitVec 32)) SeekEntryResult!11179)

(assert (=> b!1423378 (= res!958866 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626934 (select (arr!46867 a!2831) j!81) a!2831 mask!2608) lt!626935)))))

(declare-fun b!1423379 () Bool)

(declare-fun res!958873 () Bool)

(assert (=> b!1423379 (=> (not res!958873) (not e!804550))))

(assert (=> b!1423379 (= res!958873 (and (= (size!47419 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47419 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47419 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423380 () Bool)

(declare-fun res!958872 () Bool)

(assert (=> b!1423380 (=> (not res!958872) (not e!804547))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1423380 (= res!958872 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423381 () Bool)

(declare-fun res!958858 () Bool)

(assert (=> b!1423381 (=> (not res!958858) (not e!804550))))

(assert (=> b!1423381 (= res!958858 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47419 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47419 a!2831))))))

(declare-fun b!1423382 () Bool)

(declare-fun e!804551 () Bool)

(assert (=> b!1423382 (= e!804550 e!804551)))

(declare-fun res!958860 () Bool)

(assert (=> b!1423382 (=> (not res!958860) (not e!804551))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423382 (= res!958860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46867 a!2831) j!81) mask!2608) (select (arr!46867 a!2831) j!81) a!2831 mask!2608) lt!626935))))

(assert (=> b!1423382 (= lt!626935 (Intermediate!11179 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423383 () Bool)

(declare-fun res!958867 () Bool)

(assert (=> b!1423383 (=> (not res!958867) (not e!804550))))

(declare-datatypes ((List!33455 0))(
  ( (Nil!33452) (Cons!33451 (h!34753 (_ BitVec 64)) (t!48141 List!33455)) )
))
(declare-fun arrayNoDuplicates!0 (array!97098 (_ BitVec 32) List!33455) Bool)

(assert (=> b!1423383 (= res!958867 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33452))))

(declare-fun b!1423384 () Bool)

(declare-fun res!958871 () Bool)

(assert (=> b!1423384 (=> (not res!958871) (not e!804547))))

(declare-fun lt!626932 () array!97098)

(declare-fun lt!626931 () (_ BitVec 64))

(declare-fun lt!626933 () SeekEntryResult!11179)

(assert (=> b!1423384 (= res!958871 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626931 lt!626932 mask!2608) lt!626933))))

(declare-fun b!1423385 () Bool)

(declare-fun res!958865 () Bool)

(assert (=> b!1423385 (=> (not res!958865) (not e!804550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423385 (= res!958865 (validKeyInArray!0 (select (arr!46867 a!2831) j!81)))))

(declare-fun b!1423386 () Bool)

(assert (=> b!1423386 (= e!804551 e!804547)))

(declare-fun res!958869 () Bool)

(assert (=> b!1423386 (=> (not res!958869) (not e!804547))))

(assert (=> b!1423386 (= res!958869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626931 mask!2608) lt!626931 lt!626932 mask!2608) lt!626933))))

(assert (=> b!1423386 (= lt!626933 (Intermediate!11179 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423386 (= lt!626931 (select (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423386 (= lt!626932 (array!97099 (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47419 a!2831)))))

(declare-fun b!1423387 () Bool)

(declare-fun res!958863 () Bool)

(assert (=> b!1423387 (=> (not res!958863) (not e!804550))))

(assert (=> b!1423387 (= res!958863 (validKeyInArray!0 (select (arr!46867 a!2831) i!982)))))

(declare-fun b!1423388 () Bool)

(declare-fun res!958862 () Bool)

(assert (=> b!1423388 (=> (not res!958862) (not e!804547))))

(assert (=> b!1423388 (= res!958862 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46867 a!2831) j!81) a!2831 mask!2608) lt!626935))))

(declare-fun b!1423389 () Bool)

(assert (=> b!1423389 (= e!804545 true)))

(declare-fun lt!626930 () SeekEntryResult!11179)

(assert (=> b!1423389 (= lt!626930 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626934 lt!626931 lt!626932 mask!2608))))

(assert (= (and start!122780 res!958861) b!1423379))

(assert (= (and b!1423379 res!958873) b!1423387))

(assert (= (and b!1423387 res!958863) b!1423385))

(assert (= (and b!1423385 res!958865) b!1423376))

(assert (= (and b!1423376 res!958868) b!1423383))

(assert (= (and b!1423383 res!958867) b!1423381))

(assert (= (and b!1423381 res!958858) b!1423382))

(assert (= (and b!1423382 res!958860) b!1423386))

(assert (= (and b!1423386 res!958869) b!1423388))

(assert (= (and b!1423388 res!958862) b!1423384))

(assert (= (and b!1423384 res!958871) b!1423380))

(assert (= (and b!1423380 res!958872) b!1423377))

(assert (= (and b!1423377 res!958859) b!1423374))

(assert (= (and b!1423377 (not res!958870)) b!1423375))

(assert (= (and b!1423375 (not res!958864)) b!1423378))

(assert (= (and b!1423378 (not res!958866)) b!1423389))

(declare-fun m!1313451 () Bool)

(assert (=> b!1423389 m!1313451))

(declare-fun m!1313453 () Bool)

(assert (=> b!1423378 m!1313453))

(assert (=> b!1423378 m!1313453))

(declare-fun m!1313455 () Bool)

(assert (=> b!1423378 m!1313455))

(assert (=> b!1423388 m!1313453))

(assert (=> b!1423388 m!1313453))

(declare-fun m!1313457 () Bool)

(assert (=> b!1423388 m!1313457))

(declare-fun m!1313459 () Bool)

(assert (=> start!122780 m!1313459))

(declare-fun m!1313461 () Bool)

(assert (=> start!122780 m!1313461))

(declare-fun m!1313463 () Bool)

(assert (=> b!1423377 m!1313463))

(declare-fun m!1313465 () Bool)

(assert (=> b!1423377 m!1313465))

(declare-fun m!1313467 () Bool)

(assert (=> b!1423377 m!1313467))

(declare-fun m!1313469 () Bool)

(assert (=> b!1423377 m!1313469))

(assert (=> b!1423377 m!1313453))

(declare-fun m!1313471 () Bool)

(assert (=> b!1423377 m!1313471))

(declare-fun m!1313473 () Bool)

(assert (=> b!1423386 m!1313473))

(assert (=> b!1423386 m!1313473))

(declare-fun m!1313475 () Bool)

(assert (=> b!1423386 m!1313475))

(assert (=> b!1423386 m!1313463))

(declare-fun m!1313477 () Bool)

(assert (=> b!1423386 m!1313477))

(declare-fun m!1313479 () Bool)

(assert (=> b!1423387 m!1313479))

(assert (=> b!1423387 m!1313479))

(declare-fun m!1313481 () Bool)

(assert (=> b!1423387 m!1313481))

(declare-fun m!1313483 () Bool)

(assert (=> b!1423376 m!1313483))

(declare-fun m!1313485 () Bool)

(assert (=> b!1423384 m!1313485))

(assert (=> b!1423374 m!1313453))

(assert (=> b!1423374 m!1313453))

(declare-fun m!1313487 () Bool)

(assert (=> b!1423374 m!1313487))

(assert (=> b!1423382 m!1313453))

(assert (=> b!1423382 m!1313453))

(declare-fun m!1313489 () Bool)

(assert (=> b!1423382 m!1313489))

(assert (=> b!1423382 m!1313489))

(assert (=> b!1423382 m!1313453))

(declare-fun m!1313491 () Bool)

(assert (=> b!1423382 m!1313491))

(declare-fun m!1313493 () Bool)

(assert (=> b!1423383 m!1313493))

(declare-fun m!1313495 () Bool)

(assert (=> b!1423375 m!1313495))

(assert (=> b!1423385 m!1313453))

(assert (=> b!1423385 m!1313453))

(declare-fun m!1313497 () Bool)

(assert (=> b!1423385 m!1313497))

(check-sat (not b!1423383) (not b!1423388) (not b!1423382) (not b!1423377) (not b!1423386) (not b!1423389) (not b!1423385) (not b!1423384) (not start!122780) (not b!1423378) (not b!1423375) (not b!1423376) (not b!1423387) (not b!1423374))
(check-sat)
