; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86482 () Bool)

(assert start!86482)

(declare-fun b!1001517 () Bool)

(declare-fun res!671003 () Bool)

(declare-fun e!564328 () Bool)

(assert (=> b!1001517 (=> (not res!671003) (not e!564328))))

(declare-datatypes ((array!63283 0))(
  ( (array!63284 (arr!30467 (Array (_ BitVec 32) (_ BitVec 64))) (size!30969 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63283)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001517 (= res!671003 (and (= (size!30969 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30969 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30969 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001518 () Bool)

(declare-fun e!564334 () Bool)

(declare-fun e!564332 () Bool)

(assert (=> b!1001518 (= e!564334 e!564332)))

(declare-fun res!671009 () Bool)

(assert (=> b!1001518 (=> (not res!671009) (not e!564332))))

(declare-fun lt!442716 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001518 (= res!671009 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442716 #b00000000000000000000000000000000) (bvslt lt!442716 (size!30969 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001518 (= lt!442716 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001519 () Bool)

(declare-fun res!671008 () Bool)

(assert (=> b!1001519 (=> (not res!671008) (not e!564332))))

(declare-datatypes ((SeekEntryResult!9399 0))(
  ( (MissingZero!9399 (index!39967 (_ BitVec 32))) (Found!9399 (index!39968 (_ BitVec 32))) (Intermediate!9399 (undefined!10211 Bool) (index!39969 (_ BitVec 32)) (x!87387 (_ BitVec 32))) (Undefined!9399) (MissingVacant!9399 (index!39970 (_ BitVec 32))) )
))
(declare-fun lt!442717 () SeekEntryResult!9399)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63283 (_ BitVec 32)) SeekEntryResult!9399)

(assert (=> b!1001519 (= res!671008 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442716 (select (arr!30467 a!3219) j!170) a!3219 mask!3464) lt!442717))))

(declare-fun b!1001520 () Bool)

(declare-fun res!670998 () Bool)

(assert (=> b!1001520 (=> (not res!670998) (not e!564328))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001520 (= res!670998 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001521 () Bool)

(declare-fun res!671000 () Bool)

(assert (=> b!1001521 (=> (not res!671000) (not e!564328))))

(declare-fun arrayContainsKey!0 (array!63283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001521 (= res!671000 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001522 () Bool)

(declare-fun res!671004 () Bool)

(declare-fun e!564329 () Bool)

(assert (=> b!1001522 (=> (not res!671004) (not e!564329))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001522 (= res!671004 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30969 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30969 a!3219))))))

(declare-fun b!1001523 () Bool)

(declare-fun res!671007 () Bool)

(assert (=> b!1001523 (=> (not res!671007) (not e!564334))))

(assert (=> b!1001523 (= res!671007 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001524 () Bool)

(declare-fun res!671005 () Bool)

(assert (=> b!1001524 (=> (not res!671005) (not e!564329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63283 (_ BitVec 32)) Bool)

(assert (=> b!1001524 (= res!671005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001525 () Bool)

(assert (=> b!1001525 (= e!564332 false)))

(declare-fun lt!442715 () (_ BitVec 64))

(declare-fun lt!442720 () array!63283)

(declare-fun lt!442719 () SeekEntryResult!9399)

(assert (=> b!1001525 (= lt!442719 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442716 lt!442715 lt!442720 mask!3464))))

(declare-fun b!1001526 () Bool)

(declare-fun e!564333 () Bool)

(declare-fun e!564330 () Bool)

(assert (=> b!1001526 (= e!564333 e!564330)))

(declare-fun res!670999 () Bool)

(assert (=> b!1001526 (=> (not res!670999) (not e!564330))))

(declare-fun lt!442718 () SeekEntryResult!9399)

(assert (=> b!1001526 (= res!670999 (= lt!442718 lt!442717))))

(assert (=> b!1001526 (= lt!442718 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30467 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001527 () Bool)

(declare-fun res!671010 () Bool)

(assert (=> b!1001527 (=> (not res!671010) (not e!564329))))

(declare-datatypes ((List!21143 0))(
  ( (Nil!21140) (Cons!21139 (h!22316 (_ BitVec 64)) (t!30144 List!21143)) )
))
(declare-fun arrayNoDuplicates!0 (array!63283 (_ BitVec 32) List!21143) Bool)

(assert (=> b!1001527 (= res!671010 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21140))))

(declare-fun b!1001528 () Bool)

(assert (=> b!1001528 (= e!564328 e!564329)))

(declare-fun res!671002 () Bool)

(assert (=> b!1001528 (=> (not res!671002) (not e!564329))))

(declare-fun lt!442714 () SeekEntryResult!9399)

(assert (=> b!1001528 (= res!671002 (or (= lt!442714 (MissingVacant!9399 i!1194)) (= lt!442714 (MissingZero!9399 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63283 (_ BitVec 32)) SeekEntryResult!9399)

(assert (=> b!1001528 (= lt!442714 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001529 () Bool)

(declare-fun res!671001 () Bool)

(assert (=> b!1001529 (=> (not res!671001) (not e!564334))))

(assert (=> b!1001529 (= res!671001 (not (= lt!442718 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442715 lt!442720 mask!3464))))))

(declare-fun b!1001530 () Bool)

(assert (=> b!1001530 (= e!564330 e!564334)))

(declare-fun res!670997 () Bool)

(assert (=> b!1001530 (=> (not res!670997) (not e!564334))))

(declare-fun lt!442721 () SeekEntryResult!9399)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001530 (= res!670997 (not (= lt!442721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442715 mask!3464) lt!442715 lt!442720 mask!3464))))))

(assert (=> b!1001530 (= lt!442715 (select (store (arr!30467 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001530 (= lt!442720 (array!63284 (store (arr!30467 a!3219) i!1194 k0!2224) (size!30969 a!3219)))))

(declare-fun b!1001531 () Bool)

(declare-fun res!670996 () Bool)

(assert (=> b!1001531 (=> (not res!670996) (not e!564328))))

(assert (=> b!1001531 (= res!670996 (validKeyInArray!0 (select (arr!30467 a!3219) j!170)))))

(declare-fun b!1001532 () Bool)

(assert (=> b!1001532 (= e!564329 e!564333)))

(declare-fun res!670995 () Bool)

(assert (=> b!1001532 (=> (not res!670995) (not e!564333))))

(assert (=> b!1001532 (= res!670995 (= lt!442721 lt!442717))))

(assert (=> b!1001532 (= lt!442717 (Intermediate!9399 false resIndex!38 resX!38))))

(assert (=> b!1001532 (= lt!442721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30467 a!3219) j!170) mask!3464) (select (arr!30467 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!671006 () Bool)

(assert (=> start!86482 (=> (not res!671006) (not e!564328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86482 (= res!671006 (validMask!0 mask!3464))))

(assert (=> start!86482 e!564328))

(declare-fun array_inv!23591 (array!63283) Bool)

(assert (=> start!86482 (array_inv!23591 a!3219)))

(assert (=> start!86482 true))

(assert (= (and start!86482 res!671006) b!1001517))

(assert (= (and b!1001517 res!671003) b!1001531))

(assert (= (and b!1001531 res!670996) b!1001520))

(assert (= (and b!1001520 res!670998) b!1001521))

(assert (= (and b!1001521 res!671000) b!1001528))

(assert (= (and b!1001528 res!671002) b!1001524))

(assert (= (and b!1001524 res!671005) b!1001527))

(assert (= (and b!1001527 res!671010) b!1001522))

(assert (= (and b!1001522 res!671004) b!1001532))

(assert (= (and b!1001532 res!670995) b!1001526))

(assert (= (and b!1001526 res!670999) b!1001530))

(assert (= (and b!1001530 res!670997) b!1001529))

(assert (= (and b!1001529 res!671001) b!1001523))

(assert (= (and b!1001523 res!671007) b!1001518))

(assert (= (and b!1001518 res!671009) b!1001519))

(assert (= (and b!1001519 res!671008) b!1001525))

(declare-fun m!927549 () Bool)

(assert (=> b!1001519 m!927549))

(assert (=> b!1001519 m!927549))

(declare-fun m!927551 () Bool)

(assert (=> b!1001519 m!927551))

(declare-fun m!927553 () Bool)

(assert (=> b!1001520 m!927553))

(declare-fun m!927555 () Bool)

(assert (=> b!1001528 m!927555))

(declare-fun m!927557 () Bool)

(assert (=> b!1001525 m!927557))

(declare-fun m!927559 () Bool)

(assert (=> b!1001518 m!927559))

(declare-fun m!927561 () Bool)

(assert (=> b!1001524 m!927561))

(declare-fun m!927563 () Bool)

(assert (=> start!86482 m!927563))

(declare-fun m!927565 () Bool)

(assert (=> start!86482 m!927565))

(assert (=> b!1001526 m!927549))

(assert (=> b!1001526 m!927549))

(declare-fun m!927567 () Bool)

(assert (=> b!1001526 m!927567))

(assert (=> b!1001532 m!927549))

(assert (=> b!1001532 m!927549))

(declare-fun m!927569 () Bool)

(assert (=> b!1001532 m!927569))

(assert (=> b!1001532 m!927569))

(assert (=> b!1001532 m!927549))

(declare-fun m!927571 () Bool)

(assert (=> b!1001532 m!927571))

(declare-fun m!927573 () Bool)

(assert (=> b!1001530 m!927573))

(assert (=> b!1001530 m!927573))

(declare-fun m!927575 () Bool)

(assert (=> b!1001530 m!927575))

(declare-fun m!927577 () Bool)

(assert (=> b!1001530 m!927577))

(declare-fun m!927579 () Bool)

(assert (=> b!1001530 m!927579))

(declare-fun m!927581 () Bool)

(assert (=> b!1001527 m!927581))

(assert (=> b!1001531 m!927549))

(assert (=> b!1001531 m!927549))

(declare-fun m!927583 () Bool)

(assert (=> b!1001531 m!927583))

(declare-fun m!927585 () Bool)

(assert (=> b!1001521 m!927585))

(declare-fun m!927587 () Bool)

(assert (=> b!1001529 m!927587))

(check-sat (not b!1001525) (not b!1001531) (not b!1001532) (not start!86482) (not b!1001529) (not b!1001524) (not b!1001519) (not b!1001520) (not b!1001526) (not b!1001530) (not b!1001518) (not b!1001528) (not b!1001527) (not b!1001521))
(check-sat)
