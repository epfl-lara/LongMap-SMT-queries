; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59590 () Bool)

(assert start!59590)

(declare-fun b!658515 () Bool)

(declare-fun res!427051 () Bool)

(declare-fun e!378311 () Bool)

(assert (=> b!658515 (=> (not res!427051) (not e!378311))))

(declare-datatypes ((array!38748 0))(
  ( (array!38749 (arr!18571 (Array (_ BitVec 32) (_ BitVec 64))) (size!18935 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38748)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658515 (= res!427051 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658516 () Bool)

(declare-fun e!378307 () Bool)

(assert (=> b!658516 (= e!378311 e!378307)))

(declare-fun res!427046 () Bool)

(assert (=> b!658516 (=> (not res!427046) (not e!378307))))

(declare-datatypes ((SeekEntryResult!7011 0))(
  ( (MissingZero!7011 (index!30409 (_ BitVec 32))) (Found!7011 (index!30410 (_ BitVec 32))) (Intermediate!7011 (undefined!7823 Bool) (index!30411 (_ BitVec 32)) (x!59198 (_ BitVec 32))) (Undefined!7011) (MissingVacant!7011 (index!30412 (_ BitVec 32))) )
))
(declare-fun lt!307932 () SeekEntryResult!7011)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!658516 (= res!427046 (or (= lt!307932 (MissingZero!7011 i!1108)) (= lt!307932 (MissingVacant!7011 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38748 (_ BitVec 32)) SeekEntryResult!7011)

(assert (=> b!658516 (= lt!307932 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658517 () Bool)

(declare-fun res!427057 () Bool)

(assert (=> b!658517 (=> (not res!427057) (not e!378307))))

(declare-datatypes ((List!12612 0))(
  ( (Nil!12609) (Cons!12608 (h!13653 (_ BitVec 64)) (t!18840 List!12612)) )
))
(declare-fun arrayNoDuplicates!0 (array!38748 (_ BitVec 32) List!12612) Bool)

(assert (=> b!658517 (= res!427057 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12609))))

(declare-fun b!658518 () Bool)

(declare-fun res!427053 () Bool)

(assert (=> b!658518 (=> (not res!427053) (not e!378311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658518 (= res!427053 (validKeyInArray!0 k0!1786))))

(declare-fun b!658519 () Bool)

(declare-fun e!378303 () Bool)

(declare-fun lt!307941 () SeekEntryResult!7011)

(declare-fun lt!307948 () SeekEntryResult!7011)

(assert (=> b!658519 (= e!378303 (= lt!307941 lt!307948))))

(declare-fun b!658520 () Bool)

(declare-datatypes ((Unit!22864 0))(
  ( (Unit!22865) )
))
(declare-fun e!378299 () Unit!22864)

(declare-fun Unit!22866 () Unit!22864)

(assert (=> b!658520 (= e!378299 Unit!22866)))

(declare-fun b!658521 () Bool)

(assert (=> b!658521 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!307947 () Unit!22864)

(declare-fun lt!307933 () array!38748)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38748 (_ BitVec 64) (_ BitVec 32) List!12612) Unit!22864)

(assert (=> b!658521 (= lt!307947 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307933 (select (arr!18571 a!2986) j!136) j!136 Nil!12609))))

(assert (=> b!658521 (arrayNoDuplicates!0 lt!307933 j!136 Nil!12609)))

(declare-fun lt!307942 () Unit!22864)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38748 (_ BitVec 32) (_ BitVec 32)) Unit!22864)

(assert (=> b!658521 (= lt!307942 (lemmaNoDuplicateFromThenFromBigger!0 lt!307933 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658521 (arrayNoDuplicates!0 lt!307933 #b00000000000000000000000000000000 Nil!12609)))

(declare-fun lt!307938 () Unit!22864)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12612) Unit!22864)

(assert (=> b!658521 (= lt!307938 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12609))))

(assert (=> b!658521 (arrayContainsKey!0 lt!307933 (select (arr!18571 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307934 () Unit!22864)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22864)

(assert (=> b!658521 (= lt!307934 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307933 (select (arr!18571 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378305 () Unit!22864)

(declare-fun Unit!22867 () Unit!22864)

(assert (=> b!658521 (= e!378305 Unit!22867)))

(declare-fun b!658522 () Bool)

(declare-fun e!378309 () Bool)

(assert (=> b!658522 (= e!378307 e!378309)))

(declare-fun res!427045 () Bool)

(assert (=> b!658522 (=> (not res!427045) (not e!378309))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!658522 (= res!427045 (= (select (store (arr!18571 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658522 (= lt!307933 (array!38749 (store (arr!18571 a!2986) i!1108 k0!1786) (size!18935 a!2986)))))

(declare-fun b!658523 () Bool)

(assert (=> b!658523 false))

(declare-fun lt!307943 () Unit!22864)

(assert (=> b!658523 (= lt!307943 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307933 (select (arr!18571 a!2986) j!136) index!984 Nil!12609))))

(assert (=> b!658523 (arrayNoDuplicates!0 lt!307933 index!984 Nil!12609)))

(declare-fun lt!307940 () Unit!22864)

(assert (=> b!658523 (= lt!307940 (lemmaNoDuplicateFromThenFromBigger!0 lt!307933 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658523 (arrayNoDuplicates!0 lt!307933 #b00000000000000000000000000000000 Nil!12609)))

(declare-fun lt!307935 () Unit!22864)

(assert (=> b!658523 (= lt!307935 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12609))))

(assert (=> b!658523 (arrayContainsKey!0 lt!307933 (select (arr!18571 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307939 () Unit!22864)

(assert (=> b!658523 (= lt!307939 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307933 (select (arr!18571 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378301 () Bool)

(assert (=> b!658523 e!378301))

(declare-fun res!427044 () Bool)

(assert (=> b!658523 (=> (not res!427044) (not e!378301))))

(assert (=> b!658523 (= res!427044 (arrayContainsKey!0 lt!307933 (select (arr!18571 a!2986) j!136) j!136))))

(declare-fun Unit!22868 () Unit!22864)

(assert (=> b!658523 (= e!378299 Unit!22868)))

(declare-fun b!658524 () Bool)

(assert (=> b!658524 (= e!378301 (arrayContainsKey!0 lt!307933 (select (arr!18571 a!2986) j!136) index!984))))

(declare-fun b!658525 () Bool)

(declare-fun e!378304 () Unit!22864)

(declare-fun Unit!22869 () Unit!22864)

(assert (=> b!658525 (= e!378304 Unit!22869)))

(assert (=> b!658525 false))

(declare-fun b!658526 () Bool)

(declare-fun e!378302 () Bool)

(assert (=> b!658526 (= e!378302 (not true))))

(declare-fun lt!307945 () Unit!22864)

(declare-fun e!378312 () Unit!22864)

(assert (=> b!658526 (= lt!307945 e!378312)))

(declare-fun c!76106 () Bool)

(declare-fun lt!307930 () SeekEntryResult!7011)

(assert (=> b!658526 (= c!76106 (= lt!307930 (Found!7011 index!984)))))

(declare-fun lt!307936 () Unit!22864)

(assert (=> b!658526 (= lt!307936 e!378304)))

(declare-fun c!76105 () Bool)

(assert (=> b!658526 (= c!76105 (= lt!307930 Undefined!7011))))

(declare-fun lt!307931 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38748 (_ BitVec 32)) SeekEntryResult!7011)

(assert (=> b!658526 (= lt!307930 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307931 lt!307933 mask!3053))))

(assert (=> b!658526 e!378303))

(declare-fun res!427050 () Bool)

(assert (=> b!658526 (=> (not res!427050) (not e!378303))))

(declare-fun lt!307944 () (_ BitVec 32))

(assert (=> b!658526 (= res!427050 (= lt!307948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307944 vacantSpotIndex!68 lt!307931 lt!307933 mask!3053)))))

(assert (=> b!658526 (= lt!307948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307944 vacantSpotIndex!68 (select (arr!18571 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658526 (= lt!307931 (select (store (arr!18571 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307937 () Unit!22864)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38748 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22864)

(assert (=> b!658526 (= lt!307937 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307944 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658526 (= lt!307944 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!427058 () Bool)

(declare-fun b!658527 () Bool)

(assert (=> b!658527 (= res!427058 (arrayContainsKey!0 lt!307933 (select (arr!18571 a!2986) j!136) j!136))))

(declare-fun e!378308 () Bool)

(assert (=> b!658527 (=> (not res!427058) (not e!378308))))

(declare-fun e!378300 () Bool)

(assert (=> b!658527 (= e!378300 e!378308)))

(declare-fun b!658528 () Bool)

(declare-fun Unit!22870 () Unit!22864)

(assert (=> b!658528 (= e!378312 Unit!22870)))

(declare-fun b!658529 () Bool)

(assert (=> b!658529 (= e!378309 e!378302)))

(declare-fun res!427043 () Bool)

(assert (=> b!658529 (=> (not res!427043) (not e!378302))))

(assert (=> b!658529 (= res!427043 (and (= lt!307941 (Found!7011 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18571 a!2986) index!984) (select (arr!18571 a!2986) j!136))) (not (= (select (arr!18571 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658529 (= lt!307941 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18571 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658530 () Bool)

(declare-fun res!427048 () Bool)

(assert (=> b!658530 (=> (not res!427048) (not e!378307))))

(assert (=> b!658530 (= res!427048 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18571 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658531 () Bool)

(declare-fun res!427055 () Bool)

(assert (=> b!658531 (=> (not res!427055) (not e!378311))))

(assert (=> b!658531 (= res!427055 (validKeyInArray!0 (select (arr!18571 a!2986) j!136)))))

(declare-fun b!658532 () Bool)

(declare-fun Unit!22871 () Unit!22864)

(assert (=> b!658532 (= e!378312 Unit!22871)))

(declare-fun res!427056 () Bool)

(assert (=> b!658532 (= res!427056 (= (select (store (arr!18571 a!2986) i!1108 k0!1786) index!984) (select (arr!18571 a!2986) j!136)))))

(declare-fun e!378310 () Bool)

(assert (=> b!658532 (=> (not res!427056) (not e!378310))))

(assert (=> b!658532 e!378310))

(declare-fun c!76103 () Bool)

(assert (=> b!658532 (= c!76103 (bvslt j!136 index!984))))

(declare-fun lt!307946 () Unit!22864)

(assert (=> b!658532 (= lt!307946 e!378305)))

(declare-fun c!76104 () Bool)

(assert (=> b!658532 (= c!76104 (bvslt index!984 j!136))))

(declare-fun lt!307929 () Unit!22864)

(assert (=> b!658532 (= lt!307929 e!378299)))

(assert (=> b!658532 false))

(declare-fun b!658533 () Bool)

(declare-fun Unit!22872 () Unit!22864)

(assert (=> b!658533 (= e!378304 Unit!22872)))

(declare-fun b!658534 () Bool)

(declare-fun Unit!22873 () Unit!22864)

(assert (=> b!658534 (= e!378305 Unit!22873)))

(declare-fun b!658535 () Bool)

(assert (=> b!658535 (= e!378308 (arrayContainsKey!0 lt!307933 (select (arr!18571 a!2986) j!136) index!984))))

(declare-fun b!658536 () Bool)

(declare-fun res!427049 () Bool)

(assert (=> b!658536 (=> (not res!427049) (not e!378311))))

(assert (=> b!658536 (= res!427049 (and (= (size!18935 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18935 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18935 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!427054 () Bool)

(assert (=> start!59590 (=> (not res!427054) (not e!378311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59590 (= res!427054 (validMask!0 mask!3053))))

(assert (=> start!59590 e!378311))

(assert (=> start!59590 true))

(declare-fun array_inv!14367 (array!38748) Bool)

(assert (=> start!59590 (array_inv!14367 a!2986)))

(declare-fun b!658537 () Bool)

(declare-fun res!427052 () Bool)

(assert (=> b!658537 (= res!427052 (bvsge j!136 index!984))))

(assert (=> b!658537 (=> res!427052 e!378300)))

(assert (=> b!658537 (= e!378310 e!378300)))

(declare-fun b!658538 () Bool)

(declare-fun res!427047 () Bool)

(assert (=> b!658538 (=> (not res!427047) (not e!378307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38748 (_ BitVec 32)) Bool)

(assert (=> b!658538 (= res!427047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59590 res!427054) b!658536))

(assert (= (and b!658536 res!427049) b!658531))

(assert (= (and b!658531 res!427055) b!658518))

(assert (= (and b!658518 res!427053) b!658515))

(assert (= (and b!658515 res!427051) b!658516))

(assert (= (and b!658516 res!427046) b!658538))

(assert (= (and b!658538 res!427047) b!658517))

(assert (= (and b!658517 res!427057) b!658530))

(assert (= (and b!658530 res!427048) b!658522))

(assert (= (and b!658522 res!427045) b!658529))

(assert (= (and b!658529 res!427043) b!658526))

(assert (= (and b!658526 res!427050) b!658519))

(assert (= (and b!658526 c!76105) b!658525))

(assert (= (and b!658526 (not c!76105)) b!658533))

(assert (= (and b!658526 c!76106) b!658532))

(assert (= (and b!658526 (not c!76106)) b!658528))

(assert (= (and b!658532 res!427056) b!658537))

(assert (= (and b!658537 (not res!427052)) b!658527))

(assert (= (and b!658527 res!427058) b!658535))

(assert (= (and b!658532 c!76103) b!658521))

(assert (= (and b!658532 (not c!76103)) b!658534))

(assert (= (and b!658532 c!76104) b!658523))

(assert (= (and b!658532 (not c!76104)) b!658520))

(assert (= (and b!658523 res!427044) b!658524))

(declare-fun m!631497 () Bool)

(assert (=> b!658532 m!631497))

(declare-fun m!631499 () Bool)

(assert (=> b!658532 m!631499))

(declare-fun m!631501 () Bool)

(assert (=> b!658532 m!631501))

(declare-fun m!631503 () Bool)

(assert (=> b!658517 m!631503))

(declare-fun m!631505 () Bool)

(assert (=> b!658530 m!631505))

(declare-fun m!631507 () Bool)

(assert (=> b!658538 m!631507))

(declare-fun m!631509 () Bool)

(assert (=> b!658518 m!631509))

(declare-fun m!631511 () Bool)

(assert (=> b!658515 m!631511))

(declare-fun m!631513 () Bool)

(assert (=> b!658526 m!631513))

(declare-fun m!631515 () Bool)

(assert (=> b!658526 m!631515))

(declare-fun m!631517 () Bool)

(assert (=> b!658526 m!631517))

(assert (=> b!658526 m!631501))

(declare-fun m!631519 () Bool)

(assert (=> b!658526 m!631519))

(assert (=> b!658526 m!631497))

(declare-fun m!631521 () Bool)

(assert (=> b!658526 m!631521))

(assert (=> b!658526 m!631501))

(declare-fun m!631523 () Bool)

(assert (=> b!658526 m!631523))

(declare-fun m!631525 () Bool)

(assert (=> b!658529 m!631525))

(assert (=> b!658529 m!631501))

(assert (=> b!658529 m!631501))

(declare-fun m!631527 () Bool)

(assert (=> b!658529 m!631527))

(assert (=> b!658524 m!631501))

(assert (=> b!658524 m!631501))

(declare-fun m!631529 () Bool)

(assert (=> b!658524 m!631529))

(assert (=> b!658535 m!631501))

(assert (=> b!658535 m!631501))

(assert (=> b!658535 m!631529))

(assert (=> b!658522 m!631497))

(declare-fun m!631531 () Bool)

(assert (=> b!658522 m!631531))

(declare-fun m!631533 () Bool)

(assert (=> b!658516 m!631533))

(assert (=> b!658527 m!631501))

(assert (=> b!658527 m!631501))

(declare-fun m!631535 () Bool)

(assert (=> b!658527 m!631535))

(assert (=> b!658523 m!631501))

(declare-fun m!631537 () Bool)

(assert (=> b!658523 m!631537))

(assert (=> b!658523 m!631501))

(assert (=> b!658523 m!631501))

(declare-fun m!631539 () Bool)

(assert (=> b!658523 m!631539))

(declare-fun m!631541 () Bool)

(assert (=> b!658523 m!631541))

(assert (=> b!658523 m!631501))

(assert (=> b!658523 m!631535))

(declare-fun m!631543 () Bool)

(assert (=> b!658523 m!631543))

(declare-fun m!631545 () Bool)

(assert (=> b!658523 m!631545))

(declare-fun m!631547 () Bool)

(assert (=> b!658523 m!631547))

(assert (=> b!658523 m!631501))

(declare-fun m!631549 () Bool)

(assert (=> b!658523 m!631549))

(declare-fun m!631551 () Bool)

(assert (=> start!59590 m!631551))

(declare-fun m!631553 () Bool)

(assert (=> start!59590 m!631553))

(declare-fun m!631555 () Bool)

(assert (=> b!658521 m!631555))

(assert (=> b!658521 m!631501))

(assert (=> b!658521 m!631501))

(declare-fun m!631557 () Bool)

(assert (=> b!658521 m!631557))

(assert (=> b!658521 m!631501))

(declare-fun m!631559 () Bool)

(assert (=> b!658521 m!631559))

(declare-fun m!631561 () Bool)

(assert (=> b!658521 m!631561))

(assert (=> b!658521 m!631501))

(declare-fun m!631563 () Bool)

(assert (=> b!658521 m!631563))

(assert (=> b!658521 m!631543))

(assert (=> b!658521 m!631545))

(assert (=> b!658531 m!631501))

(assert (=> b!658531 m!631501))

(declare-fun m!631565 () Bool)

(assert (=> b!658531 m!631565))

(check-sat (not b!658535) (not b!658527) (not b!658529) (not b!658526) (not b!658518) (not b!658521) (not b!658531) (not b!658517) (not b!658515) (not start!59590) (not b!658538) (not b!658524) (not b!658516) (not b!658523))
