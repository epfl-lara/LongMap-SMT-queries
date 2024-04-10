; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87266 () Bool)

(assert start!87266)

(declare-fun b!1011553 () Bool)

(declare-fun e!569071 () Bool)

(declare-fun e!569072 () Bool)

(assert (=> b!1011553 (= e!569071 e!569072)))

(declare-fun res!679515 () Bool)

(assert (=> b!1011553 (=> (not res!679515) (not e!569072))))

(declare-datatypes ((SeekEntryResult!9582 0))(
  ( (MissingZero!9582 (index!40699 (_ BitVec 32))) (Found!9582 (index!40700 (_ BitVec 32))) (Intermediate!9582 (undefined!10394 Bool) (index!40701 (_ BitVec 32)) (x!88116 (_ BitVec 32))) (Undefined!9582) (MissingVacant!9582 (index!40702 (_ BitVec 32))) )
))
(declare-fun lt!447069 () SeekEntryResult!9582)

(declare-fun lt!447075 () SeekEntryResult!9582)

(assert (=> b!1011553 (= res!679515 (= lt!447069 lt!447075))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011553 (= lt!447075 (Intermediate!9582 false resIndex!38 resX!38))))

(declare-datatypes ((array!63670 0))(
  ( (array!63671 (arr!30650 (Array (_ BitVec 32) (_ BitVec 64))) (size!31152 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63670)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63670 (_ BitVec 32)) SeekEntryResult!9582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011553 (= lt!447069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30650 a!3219) j!170) mask!3464) (select (arr!30650 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011554 () Bool)

(declare-fun res!679512 () Bool)

(assert (=> b!1011554 (=> (not res!679512) (not e!569071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63670 (_ BitVec 32)) Bool)

(assert (=> b!1011554 (= res!679512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011555 () Bool)

(declare-fun res!679516 () Bool)

(declare-fun e!569069 () Bool)

(assert (=> b!1011555 (=> (not res!679516) (not e!569069))))

(declare-fun lt!447074 () (_ BitVec 32))

(declare-fun lt!447068 () SeekEntryResult!9582)

(declare-fun lt!447070 () (_ BitVec 64))

(declare-fun lt!447073 () array!63670)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1011555 (= res!679516 (not (= lt!447068 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447074 lt!447070 lt!447073 mask!3464))))))

(declare-fun res!679509 () Bool)

(declare-fun e!569074 () Bool)

(assert (=> start!87266 (=> (not res!679509) (not e!569074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87266 (= res!679509 (validMask!0 mask!3464))))

(assert (=> start!87266 e!569074))

(declare-fun array_inv!23774 (array!63670) Bool)

(assert (=> start!87266 (array_inv!23774 a!3219)))

(assert (=> start!87266 true))

(declare-fun b!1011556 () Bool)

(declare-fun e!569067 () Bool)

(assert (=> b!1011556 (= e!569072 e!569067)))

(declare-fun res!679517 () Bool)

(assert (=> b!1011556 (=> (not res!679517) (not e!569067))))

(declare-fun lt!447071 () SeekEntryResult!9582)

(assert (=> b!1011556 (= res!679517 (= lt!447071 lt!447075))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1011556 (= lt!447071 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30650 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011557 () Bool)

(declare-fun res!679503 () Bool)

(assert (=> b!1011557 (=> (not res!679503) (not e!569074))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011557 (= res!679503 (validKeyInArray!0 k0!2224))))

(declare-fun b!1011558 () Bool)

(declare-fun res!679508 () Bool)

(declare-fun e!569068 () Bool)

(assert (=> b!1011558 (=> (not res!679508) (not e!569068))))

(assert (=> b!1011558 (= res!679508 (not (= lt!447071 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447070 lt!447073 mask!3464))))))

(declare-fun b!1011559 () Bool)

(declare-fun e!569070 () Bool)

(assert (=> b!1011559 (= e!569070 e!569069)))

(declare-fun res!679513 () Bool)

(assert (=> b!1011559 (=> (not res!679513) (not e!569069))))

(assert (=> b!1011559 (= res!679513 (= lt!447068 lt!447075))))

(assert (=> b!1011559 (= lt!447068 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447074 (select (arr!30650 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011560 () Bool)

(declare-fun res!679514 () Bool)

(assert (=> b!1011560 (=> (not res!679514) (not e!569074))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011560 (= res!679514 (and (= (size!31152 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31152 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31152 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011561 () Bool)

(declare-fun res!679510 () Bool)

(assert (=> b!1011561 (=> (not res!679510) (not e!569074))))

(assert (=> b!1011561 (= res!679510 (validKeyInArray!0 (select (arr!30650 a!3219) j!170)))))

(declare-fun b!1011562 () Bool)

(declare-fun res!679518 () Bool)

(assert (=> b!1011562 (=> (not res!679518) (not e!569074))))

(declare-fun arrayContainsKey!0 (array!63670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011562 (= res!679518 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011563 () Bool)

(declare-fun res!679502 () Bool)

(assert (=> b!1011563 (=> (not res!679502) (not e!569071))))

(declare-datatypes ((List!21326 0))(
  ( (Nil!21323) (Cons!21322 (h!22520 (_ BitVec 64)) (t!30327 List!21326)) )
))
(declare-fun arrayNoDuplicates!0 (array!63670 (_ BitVec 32) List!21326) Bool)

(assert (=> b!1011563 (= res!679502 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21323))))

(declare-fun b!1011564 () Bool)

(assert (=> b!1011564 (= e!569068 e!569070)))

(declare-fun res!679506 () Bool)

(assert (=> b!1011564 (=> (not res!679506) (not e!569070))))

(assert (=> b!1011564 (= res!679506 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447074 #b00000000000000000000000000000000) (bvslt lt!447074 (size!31152 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011564 (= lt!447074 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011565 () Bool)

(declare-fun res!679507 () Bool)

(assert (=> b!1011565 (=> (not res!679507) (not e!569071))))

(assert (=> b!1011565 (= res!679507 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31152 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31152 a!3219))))))

(declare-fun b!1011566 () Bool)

(declare-fun res!679505 () Bool)

(assert (=> b!1011566 (=> (not res!679505) (not e!569068))))

(assert (=> b!1011566 (= res!679505 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011567 () Bool)

(assert (=> b!1011567 (= e!569069 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1245)) (bvsub #b01111111111111111111111111111110 x!1245)))))

(declare-fun b!1011568 () Bool)

(assert (=> b!1011568 (= e!569074 e!569071)))

(declare-fun res!679504 () Bool)

(assert (=> b!1011568 (=> (not res!679504) (not e!569071))))

(declare-fun lt!447072 () SeekEntryResult!9582)

(assert (=> b!1011568 (= res!679504 (or (= lt!447072 (MissingVacant!9582 i!1194)) (= lt!447072 (MissingZero!9582 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63670 (_ BitVec 32)) SeekEntryResult!9582)

(assert (=> b!1011568 (= lt!447072 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1011569 () Bool)

(assert (=> b!1011569 (= e!569067 e!569068)))

(declare-fun res!679511 () Bool)

(assert (=> b!1011569 (=> (not res!679511) (not e!569068))))

(assert (=> b!1011569 (= res!679511 (not (= lt!447069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447070 mask!3464) lt!447070 lt!447073 mask!3464))))))

(assert (=> b!1011569 (= lt!447070 (select (store (arr!30650 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011569 (= lt!447073 (array!63671 (store (arr!30650 a!3219) i!1194 k0!2224) (size!31152 a!3219)))))

(assert (= (and start!87266 res!679509) b!1011560))

(assert (= (and b!1011560 res!679514) b!1011561))

(assert (= (and b!1011561 res!679510) b!1011557))

(assert (= (and b!1011557 res!679503) b!1011562))

(assert (= (and b!1011562 res!679518) b!1011568))

(assert (= (and b!1011568 res!679504) b!1011554))

(assert (= (and b!1011554 res!679512) b!1011563))

(assert (= (and b!1011563 res!679502) b!1011565))

(assert (= (and b!1011565 res!679507) b!1011553))

(assert (= (and b!1011553 res!679515) b!1011556))

(assert (= (and b!1011556 res!679517) b!1011569))

(assert (= (and b!1011569 res!679511) b!1011558))

(assert (= (and b!1011558 res!679508) b!1011566))

(assert (= (and b!1011566 res!679505) b!1011564))

(assert (= (and b!1011564 res!679506) b!1011559))

(assert (= (and b!1011559 res!679513) b!1011555))

(assert (= (and b!1011555 res!679516) b!1011567))

(declare-fun m!935533 () Bool)

(assert (=> start!87266 m!935533))

(declare-fun m!935535 () Bool)

(assert (=> start!87266 m!935535))

(declare-fun m!935537 () Bool)

(assert (=> b!1011558 m!935537))

(declare-fun m!935539 () Bool)

(assert (=> b!1011554 m!935539))

(declare-fun m!935541 () Bool)

(assert (=> b!1011555 m!935541))

(declare-fun m!935543 () Bool)

(assert (=> b!1011561 m!935543))

(assert (=> b!1011561 m!935543))

(declare-fun m!935545 () Bool)

(assert (=> b!1011561 m!935545))

(declare-fun m!935547 () Bool)

(assert (=> b!1011563 m!935547))

(assert (=> b!1011553 m!935543))

(assert (=> b!1011553 m!935543))

(declare-fun m!935549 () Bool)

(assert (=> b!1011553 m!935549))

(assert (=> b!1011553 m!935549))

(assert (=> b!1011553 m!935543))

(declare-fun m!935551 () Bool)

(assert (=> b!1011553 m!935551))

(declare-fun m!935553 () Bool)

(assert (=> b!1011564 m!935553))

(assert (=> b!1011556 m!935543))

(assert (=> b!1011556 m!935543))

(declare-fun m!935555 () Bool)

(assert (=> b!1011556 m!935555))

(declare-fun m!935557 () Bool)

(assert (=> b!1011562 m!935557))

(declare-fun m!935559 () Bool)

(assert (=> b!1011557 m!935559))

(declare-fun m!935561 () Bool)

(assert (=> b!1011569 m!935561))

(assert (=> b!1011569 m!935561))

(declare-fun m!935563 () Bool)

(assert (=> b!1011569 m!935563))

(declare-fun m!935565 () Bool)

(assert (=> b!1011569 m!935565))

(declare-fun m!935567 () Bool)

(assert (=> b!1011569 m!935567))

(declare-fun m!935569 () Bool)

(assert (=> b!1011568 m!935569))

(assert (=> b!1011559 m!935543))

(assert (=> b!1011559 m!935543))

(declare-fun m!935571 () Bool)

(assert (=> b!1011559 m!935571))

(check-sat (not b!1011553) (not b!1011563) (not b!1011558) (not b!1011562) (not start!87266) (not b!1011557) (not b!1011559) (not b!1011561) (not b!1011568) (not b!1011556) (not b!1011564) (not b!1011554) (not b!1011555) (not b!1011569))
(check-sat)
