; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86608 () Bool)

(assert start!86608)

(declare-fun b!1004526 () Bool)

(declare-fun res!674016 () Bool)

(declare-fun e!565649 () Bool)

(assert (=> b!1004526 (=> (not res!674016) (not e!565649))))

(declare-datatypes ((array!63409 0))(
  ( (array!63410 (arr!30530 (Array (_ BitVec 32) (_ BitVec 64))) (size!31032 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63409)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004526 (= res!674016 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun b!1004527 () Bool)

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun e!565648 () Bool)

(assert (=> b!1004527 (= e!565648 (and (= index!1507 resIndex!38) (not (= x!1245 resX!38))))))

(declare-fun b!1004528 () Bool)

(declare-fun res!674015 () Bool)

(assert (=> b!1004528 (=> (not res!674015) (not e!565648))))

(declare-fun lt!444221 () array!63409)

(declare-fun lt!444220 () (_ BitVec 64))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9462 0))(
  ( (MissingZero!9462 (index!40219 (_ BitVec 32))) (Found!9462 (index!40220 (_ BitVec 32))) (Intermediate!9462 (undefined!10274 Bool) (index!40221 (_ BitVec 32)) (x!87618 (_ BitVec 32))) (Undefined!9462) (MissingVacant!9462 (index!40222 (_ BitVec 32))) )
))
(declare-fun lt!444219 () SeekEntryResult!9462)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63409 (_ BitVec 32)) SeekEntryResult!9462)

(assert (=> b!1004528 (= res!674015 (not (= lt!444219 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444220 lt!444221 mask!3464))))))

(declare-fun b!1004530 () Bool)

(declare-fun res!674009 () Bool)

(assert (=> b!1004530 (=> (not res!674009) (not e!565649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004530 (= res!674009 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004531 () Bool)

(declare-fun res!674008 () Bool)

(declare-fun e!565650 () Bool)

(assert (=> b!1004531 (=> (not res!674008) (not e!565650))))

(assert (=> b!1004531 (= res!674008 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31032 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31032 a!3219))))))

(declare-fun b!1004532 () Bool)

(declare-fun res!674007 () Bool)

(assert (=> b!1004532 (=> (not res!674007) (not e!565650))))

(declare-datatypes ((List!21206 0))(
  ( (Nil!21203) (Cons!21202 (h!22379 (_ BitVec 64)) (t!30207 List!21206)) )
))
(declare-fun arrayNoDuplicates!0 (array!63409 (_ BitVec 32) List!21206) Bool)

(assert (=> b!1004532 (= res!674007 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21203))))

(declare-fun b!1004533 () Bool)

(declare-fun e!565647 () Bool)

(declare-fun e!565646 () Bool)

(assert (=> b!1004533 (= e!565647 e!565646)))

(declare-fun res!674011 () Bool)

(assert (=> b!1004533 (=> (not res!674011) (not e!565646))))

(declare-fun lt!444217 () SeekEntryResult!9462)

(assert (=> b!1004533 (= res!674011 (= lt!444219 lt!444217))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1004533 (= lt!444219 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30530 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004534 () Bool)

(declare-fun res!674006 () Bool)

(assert (=> b!1004534 (=> (not res!674006) (not e!565650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63409 (_ BitVec 32)) Bool)

(assert (=> b!1004534 (= res!674006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!674010 () Bool)

(assert (=> start!86608 (=> (not res!674010) (not e!565649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86608 (= res!674010 (validMask!0 mask!3464))))

(assert (=> start!86608 e!565649))

(declare-fun array_inv!23654 (array!63409) Bool)

(assert (=> start!86608 (array_inv!23654 a!3219)))

(assert (=> start!86608 true))

(declare-fun b!1004529 () Bool)

(assert (=> b!1004529 (= e!565649 e!565650)))

(declare-fun res!674004 () Bool)

(assert (=> b!1004529 (=> (not res!674004) (not e!565650))))

(declare-fun lt!444216 () SeekEntryResult!9462)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004529 (= res!674004 (or (= lt!444216 (MissingVacant!9462 i!1194)) (= lt!444216 (MissingZero!9462 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63409 (_ BitVec 32)) SeekEntryResult!9462)

(assert (=> b!1004529 (= lt!444216 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1004535 () Bool)

(declare-fun res!674014 () Bool)

(assert (=> b!1004535 (=> (not res!674014) (not e!565649))))

(assert (=> b!1004535 (= res!674014 (validKeyInArray!0 (select (arr!30530 a!3219) j!170)))))

(declare-fun b!1004536 () Bool)

(assert (=> b!1004536 (= e!565646 e!565648)))

(declare-fun res!674012 () Bool)

(assert (=> b!1004536 (=> (not res!674012) (not e!565648))))

(declare-fun lt!444218 () SeekEntryResult!9462)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004536 (= res!674012 (not (= lt!444218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444220 mask!3464) lt!444220 lt!444221 mask!3464))))))

(assert (=> b!1004536 (= lt!444220 (select (store (arr!30530 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004536 (= lt!444221 (array!63410 (store (arr!30530 a!3219) i!1194 k0!2224) (size!31032 a!3219)))))

(declare-fun b!1004537 () Bool)

(declare-fun res!674013 () Bool)

(assert (=> b!1004537 (=> (not res!674013) (not e!565649))))

(assert (=> b!1004537 (= res!674013 (and (= (size!31032 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31032 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31032 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004538 () Bool)

(assert (=> b!1004538 (= e!565650 e!565647)))

(declare-fun res!674005 () Bool)

(assert (=> b!1004538 (=> (not res!674005) (not e!565647))))

(assert (=> b!1004538 (= res!674005 (= lt!444218 lt!444217))))

(assert (=> b!1004538 (= lt!444217 (Intermediate!9462 false resIndex!38 resX!38))))

(assert (=> b!1004538 (= lt!444218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30530 a!3219) j!170) mask!3464) (select (arr!30530 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86608 res!674010) b!1004537))

(assert (= (and b!1004537 res!674013) b!1004535))

(assert (= (and b!1004535 res!674014) b!1004530))

(assert (= (and b!1004530 res!674009) b!1004526))

(assert (= (and b!1004526 res!674016) b!1004529))

(assert (= (and b!1004529 res!674004) b!1004534))

(assert (= (and b!1004534 res!674006) b!1004532))

(assert (= (and b!1004532 res!674007) b!1004531))

(assert (= (and b!1004531 res!674008) b!1004538))

(assert (= (and b!1004538 res!674005) b!1004533))

(assert (= (and b!1004533 res!674011) b!1004536))

(assert (= (and b!1004536 res!674012) b!1004528))

(assert (= (and b!1004528 res!674015) b!1004527))

(declare-fun m!930063 () Bool)

(assert (=> b!1004534 m!930063))

(declare-fun m!930065 () Bool)

(assert (=> b!1004533 m!930065))

(assert (=> b!1004533 m!930065))

(declare-fun m!930067 () Bool)

(assert (=> b!1004533 m!930067))

(declare-fun m!930069 () Bool)

(assert (=> b!1004529 m!930069))

(declare-fun m!930071 () Bool)

(assert (=> start!86608 m!930071))

(declare-fun m!930073 () Bool)

(assert (=> start!86608 m!930073))

(declare-fun m!930075 () Bool)

(assert (=> b!1004530 m!930075))

(declare-fun m!930077 () Bool)

(assert (=> b!1004532 m!930077))

(declare-fun m!930079 () Bool)

(assert (=> b!1004536 m!930079))

(assert (=> b!1004536 m!930079))

(declare-fun m!930081 () Bool)

(assert (=> b!1004536 m!930081))

(declare-fun m!930083 () Bool)

(assert (=> b!1004536 m!930083))

(declare-fun m!930085 () Bool)

(assert (=> b!1004536 m!930085))

(assert (=> b!1004538 m!930065))

(assert (=> b!1004538 m!930065))

(declare-fun m!930087 () Bool)

(assert (=> b!1004538 m!930087))

(assert (=> b!1004538 m!930087))

(assert (=> b!1004538 m!930065))

(declare-fun m!930089 () Bool)

(assert (=> b!1004538 m!930089))

(declare-fun m!930091 () Bool)

(assert (=> b!1004528 m!930091))

(declare-fun m!930093 () Bool)

(assert (=> b!1004526 m!930093))

(assert (=> b!1004535 m!930065))

(assert (=> b!1004535 m!930065))

(declare-fun m!930095 () Bool)

(assert (=> b!1004535 m!930095))

(check-sat (not b!1004526) (not b!1004535) (not b!1004536) (not b!1004530) (not b!1004534) (not b!1004528) (not b!1004529) (not b!1004538) (not b!1004533) (not start!86608) (not b!1004532))
(check-sat)
(get-model)

(declare-fun b!1004597 () Bool)

(declare-fun e!565681 () Bool)

(declare-fun lt!444245 () SeekEntryResult!9462)

(assert (=> b!1004597 (= e!565681 (bvsge (x!87618 lt!444245) #b01111111111111111111111111111110))))

(declare-fun b!1004598 () Bool)

(assert (=> b!1004598 (and (bvsge (index!40221 lt!444245) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444245) (size!31032 lt!444221)))))

(declare-fun res!674063 () Bool)

(assert (=> b!1004598 (= res!674063 (= (select (arr!30530 lt!444221) (index!40221 lt!444245)) lt!444220))))

(declare-fun e!565683 () Bool)

(assert (=> b!1004598 (=> res!674063 e!565683)))

(declare-fun e!565680 () Bool)

(assert (=> b!1004598 (= e!565680 e!565683)))

(declare-fun b!1004599 () Bool)

(assert (=> b!1004599 (and (bvsge (index!40221 lt!444245) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444245) (size!31032 lt!444221)))))

(declare-fun res!674062 () Bool)

(assert (=> b!1004599 (= res!674062 (= (select (arr!30530 lt!444221) (index!40221 lt!444245)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004599 (=> res!674062 e!565683)))

(declare-fun b!1004600 () Bool)

(assert (=> b!1004600 (and (bvsge (index!40221 lt!444245) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444245) (size!31032 lt!444221)))))

(assert (=> b!1004600 (= e!565683 (= (select (arr!30530 lt!444221) (index!40221 lt!444245)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004601 () Bool)

(declare-fun e!565682 () SeekEntryResult!9462)

(assert (=> b!1004601 (= e!565682 (Intermediate!9462 false index!1507 x!1245))))

(declare-fun b!1004602 () Bool)

(assert (=> b!1004602 (= e!565681 e!565680)))

(declare-fun res!674064 () Bool)

(get-info :version)

(assert (=> b!1004602 (= res!674064 (and ((_ is Intermediate!9462) lt!444245) (not (undefined!10274 lt!444245)) (bvslt (x!87618 lt!444245) #b01111111111111111111111111111110) (bvsge (x!87618 lt!444245) #b00000000000000000000000000000000) (bvsge (x!87618 lt!444245) x!1245)))))

(assert (=> b!1004602 (=> (not res!674064) (not e!565680))))

(declare-fun d!119407 () Bool)

(assert (=> d!119407 e!565681))

(declare-fun c!101416 () Bool)

(assert (=> d!119407 (= c!101416 (and ((_ is Intermediate!9462) lt!444245) (undefined!10274 lt!444245)))))

(declare-fun e!565684 () SeekEntryResult!9462)

(assert (=> d!119407 (= lt!444245 e!565684)))

(declare-fun c!101415 () Bool)

(assert (=> d!119407 (= c!101415 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444244 () (_ BitVec 64))

(assert (=> d!119407 (= lt!444244 (select (arr!30530 lt!444221) index!1507))))

(assert (=> d!119407 (validMask!0 mask!3464)))

(assert (=> d!119407 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444220 lt!444221 mask!3464) lt!444245)))

(declare-fun b!1004596 () Bool)

(assert (=> b!1004596 (= e!565684 e!565682)))

(declare-fun c!101417 () Bool)

(assert (=> b!1004596 (= c!101417 (or (= lt!444244 lt!444220) (= (bvadd lt!444244 lt!444244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004603 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004603 (= e!565682 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444220 lt!444221 mask!3464))))

(declare-fun b!1004604 () Bool)

(assert (=> b!1004604 (= e!565684 (Intermediate!9462 true index!1507 x!1245))))

(assert (= (and d!119407 c!101415) b!1004604))

(assert (= (and d!119407 (not c!101415)) b!1004596))

(assert (= (and b!1004596 c!101417) b!1004601))

(assert (= (and b!1004596 (not c!101417)) b!1004603))

(assert (= (and d!119407 c!101416) b!1004597))

(assert (= (and d!119407 (not c!101416)) b!1004602))

(assert (= (and b!1004602 res!674064) b!1004598))

(assert (= (and b!1004598 (not res!674063)) b!1004599))

(assert (= (and b!1004599 (not res!674062)) b!1004600))

(declare-fun m!930131 () Bool)

(assert (=> b!1004599 m!930131))

(declare-fun m!930133 () Bool)

(assert (=> d!119407 m!930133))

(assert (=> d!119407 m!930071))

(assert (=> b!1004598 m!930131))

(assert (=> b!1004600 m!930131))

(declare-fun m!930135 () Bool)

(assert (=> b!1004603 m!930135))

(assert (=> b!1004603 m!930135))

(declare-fun m!930137 () Bool)

(assert (=> b!1004603 m!930137))

(assert (=> b!1004528 d!119407))

(declare-fun b!1004606 () Bool)

(declare-fun e!565686 () Bool)

(declare-fun lt!444247 () SeekEntryResult!9462)

(assert (=> b!1004606 (= e!565686 (bvsge (x!87618 lt!444247) #b01111111111111111111111111111110))))

(declare-fun b!1004607 () Bool)

(assert (=> b!1004607 (and (bvsge (index!40221 lt!444247) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444247) (size!31032 a!3219)))))

(declare-fun res!674066 () Bool)

(assert (=> b!1004607 (= res!674066 (= (select (arr!30530 a!3219) (index!40221 lt!444247)) (select (arr!30530 a!3219) j!170)))))

(declare-fun e!565688 () Bool)

(assert (=> b!1004607 (=> res!674066 e!565688)))

(declare-fun e!565685 () Bool)

(assert (=> b!1004607 (= e!565685 e!565688)))

(declare-fun b!1004608 () Bool)

(assert (=> b!1004608 (and (bvsge (index!40221 lt!444247) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444247) (size!31032 a!3219)))))

(declare-fun res!674065 () Bool)

(assert (=> b!1004608 (= res!674065 (= (select (arr!30530 a!3219) (index!40221 lt!444247)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004608 (=> res!674065 e!565688)))

(declare-fun b!1004609 () Bool)

(assert (=> b!1004609 (and (bvsge (index!40221 lt!444247) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444247) (size!31032 a!3219)))))

(assert (=> b!1004609 (= e!565688 (= (select (arr!30530 a!3219) (index!40221 lt!444247)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004610 () Bool)

(declare-fun e!565687 () SeekEntryResult!9462)

(assert (=> b!1004610 (= e!565687 (Intermediate!9462 false index!1507 x!1245))))

(declare-fun b!1004611 () Bool)

(assert (=> b!1004611 (= e!565686 e!565685)))

(declare-fun res!674067 () Bool)

(assert (=> b!1004611 (= res!674067 (and ((_ is Intermediate!9462) lt!444247) (not (undefined!10274 lt!444247)) (bvslt (x!87618 lt!444247) #b01111111111111111111111111111110) (bvsge (x!87618 lt!444247) #b00000000000000000000000000000000) (bvsge (x!87618 lt!444247) x!1245)))))

(assert (=> b!1004611 (=> (not res!674067) (not e!565685))))

(declare-fun d!119409 () Bool)

(assert (=> d!119409 e!565686))

(declare-fun c!101419 () Bool)

(assert (=> d!119409 (= c!101419 (and ((_ is Intermediate!9462) lt!444247) (undefined!10274 lt!444247)))))

(declare-fun e!565689 () SeekEntryResult!9462)

(assert (=> d!119409 (= lt!444247 e!565689)))

(declare-fun c!101418 () Bool)

(assert (=> d!119409 (= c!101418 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444246 () (_ BitVec 64))

(assert (=> d!119409 (= lt!444246 (select (arr!30530 a!3219) index!1507))))

(assert (=> d!119409 (validMask!0 mask!3464)))

(assert (=> d!119409 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30530 a!3219) j!170) a!3219 mask!3464) lt!444247)))

(declare-fun b!1004605 () Bool)

(assert (=> b!1004605 (= e!565689 e!565687)))

(declare-fun c!101420 () Bool)

(assert (=> b!1004605 (= c!101420 (or (= lt!444246 (select (arr!30530 a!3219) j!170)) (= (bvadd lt!444246 lt!444246) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004612 () Bool)

(assert (=> b!1004612 (= e!565687 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30530 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004613 () Bool)

(assert (=> b!1004613 (= e!565689 (Intermediate!9462 true index!1507 x!1245))))

(assert (= (and d!119409 c!101418) b!1004613))

(assert (= (and d!119409 (not c!101418)) b!1004605))

(assert (= (and b!1004605 c!101420) b!1004610))

(assert (= (and b!1004605 (not c!101420)) b!1004612))

(assert (= (and d!119409 c!101419) b!1004606))

(assert (= (and d!119409 (not c!101419)) b!1004611))

(assert (= (and b!1004611 res!674067) b!1004607))

(assert (= (and b!1004607 (not res!674066)) b!1004608))

(assert (= (and b!1004608 (not res!674065)) b!1004609))

(declare-fun m!930139 () Bool)

(assert (=> b!1004608 m!930139))

(declare-fun m!930141 () Bool)

(assert (=> d!119409 m!930141))

(assert (=> d!119409 m!930071))

(assert (=> b!1004607 m!930139))

(assert (=> b!1004609 m!930139))

(assert (=> b!1004612 m!930135))

(assert (=> b!1004612 m!930135))

(assert (=> b!1004612 m!930065))

(declare-fun m!930143 () Bool)

(assert (=> b!1004612 m!930143))

(assert (=> b!1004533 d!119409))

(declare-fun b!1004622 () Bool)

(declare-fun e!565696 () Bool)

(declare-fun e!565698 () Bool)

(assert (=> b!1004622 (= e!565696 e!565698)))

(declare-fun lt!444256 () (_ BitVec 64))

(assert (=> b!1004622 (= lt!444256 (select (arr!30530 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32998 0))(
  ( (Unit!32999) )
))
(declare-fun lt!444255 () Unit!32998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63409 (_ BitVec 64) (_ BitVec 32)) Unit!32998)

(assert (=> b!1004622 (= lt!444255 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444256 #b00000000000000000000000000000000))))

(assert (=> b!1004622 (arrayContainsKey!0 a!3219 lt!444256 #b00000000000000000000000000000000)))

(declare-fun lt!444254 () Unit!32998)

(assert (=> b!1004622 (= lt!444254 lt!444255)))

(declare-fun res!674073 () Bool)

(assert (=> b!1004622 (= res!674073 (= (seekEntryOrOpen!0 (select (arr!30530 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9462 #b00000000000000000000000000000000)))))

(assert (=> b!1004622 (=> (not res!674073) (not e!565698))))

(declare-fun b!1004623 () Bool)

(declare-fun call!42314 () Bool)

(assert (=> b!1004623 (= e!565696 call!42314)))

(declare-fun d!119411 () Bool)

(declare-fun res!674072 () Bool)

(declare-fun e!565697 () Bool)

(assert (=> d!119411 (=> res!674072 e!565697)))

(assert (=> d!119411 (= res!674072 (bvsge #b00000000000000000000000000000000 (size!31032 a!3219)))))

(assert (=> d!119411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!565697)))

(declare-fun bm!42311 () Bool)

(assert (=> bm!42311 (= call!42314 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1004624 () Bool)

(assert (=> b!1004624 (= e!565698 call!42314)))

(declare-fun b!1004625 () Bool)

(assert (=> b!1004625 (= e!565697 e!565696)))

(declare-fun c!101423 () Bool)

(assert (=> b!1004625 (= c!101423 (validKeyInArray!0 (select (arr!30530 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119411 (not res!674072)) b!1004625))

(assert (= (and b!1004625 c!101423) b!1004622))

(assert (= (and b!1004625 (not c!101423)) b!1004623))

(assert (= (and b!1004622 res!674073) b!1004624))

(assert (= (or b!1004624 b!1004623) bm!42311))

(declare-fun m!930145 () Bool)

(assert (=> b!1004622 m!930145))

(declare-fun m!930147 () Bool)

(assert (=> b!1004622 m!930147))

(declare-fun m!930149 () Bool)

(assert (=> b!1004622 m!930149))

(assert (=> b!1004622 m!930145))

(declare-fun m!930151 () Bool)

(assert (=> b!1004622 m!930151))

(declare-fun m!930153 () Bool)

(assert (=> bm!42311 m!930153))

(assert (=> b!1004625 m!930145))

(assert (=> b!1004625 m!930145))

(declare-fun m!930155 () Bool)

(assert (=> b!1004625 m!930155))

(assert (=> b!1004534 d!119411))

(declare-fun lt!444268 () SeekEntryResult!9462)

(declare-fun e!565715 () SeekEntryResult!9462)

(declare-fun b!1004656 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63409 (_ BitVec 32)) SeekEntryResult!9462)

(assert (=> b!1004656 (= e!565715 (seekKeyOrZeroReturnVacant!0 (x!87618 lt!444268) (index!40221 lt!444268) (index!40221 lt!444268) k0!2224 a!3219 mask!3464))))

(declare-fun d!119415 () Bool)

(declare-fun lt!444269 () SeekEntryResult!9462)

(assert (=> d!119415 (and (or ((_ is Undefined!9462) lt!444269) (not ((_ is Found!9462) lt!444269)) (and (bvsge (index!40220 lt!444269) #b00000000000000000000000000000000) (bvslt (index!40220 lt!444269) (size!31032 a!3219)))) (or ((_ is Undefined!9462) lt!444269) ((_ is Found!9462) lt!444269) (not ((_ is MissingZero!9462) lt!444269)) (and (bvsge (index!40219 lt!444269) #b00000000000000000000000000000000) (bvslt (index!40219 lt!444269) (size!31032 a!3219)))) (or ((_ is Undefined!9462) lt!444269) ((_ is Found!9462) lt!444269) ((_ is MissingZero!9462) lt!444269) (not ((_ is MissingVacant!9462) lt!444269)) (and (bvsge (index!40222 lt!444269) #b00000000000000000000000000000000) (bvslt (index!40222 lt!444269) (size!31032 a!3219)))) (or ((_ is Undefined!9462) lt!444269) (ite ((_ is Found!9462) lt!444269) (= (select (arr!30530 a!3219) (index!40220 lt!444269)) k0!2224) (ite ((_ is MissingZero!9462) lt!444269) (= (select (arr!30530 a!3219) (index!40219 lt!444269)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9462) lt!444269) (= (select (arr!30530 a!3219) (index!40222 lt!444269)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!565717 () SeekEntryResult!9462)

(assert (=> d!119415 (= lt!444269 e!565717)))

(declare-fun c!101438 () Bool)

(assert (=> d!119415 (= c!101438 (and ((_ is Intermediate!9462) lt!444268) (undefined!10274 lt!444268)))))

(assert (=> d!119415 (= lt!444268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119415 (validMask!0 mask!3464)))

(assert (=> d!119415 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!444269)))

(declare-fun b!1004657 () Bool)

(assert (=> b!1004657 (= e!565715 (MissingZero!9462 (index!40221 lt!444268)))))

(declare-fun b!1004658 () Bool)

(assert (=> b!1004658 (= e!565717 Undefined!9462)))

(declare-fun b!1004659 () Bool)

(declare-fun e!565716 () SeekEntryResult!9462)

(assert (=> b!1004659 (= e!565716 (Found!9462 (index!40221 lt!444268)))))

(declare-fun b!1004660 () Bool)

(assert (=> b!1004660 (= e!565717 e!565716)))

(declare-fun lt!444267 () (_ BitVec 64))

(assert (=> b!1004660 (= lt!444267 (select (arr!30530 a!3219) (index!40221 lt!444268)))))

(declare-fun c!101436 () Bool)

(assert (=> b!1004660 (= c!101436 (= lt!444267 k0!2224))))

(declare-fun b!1004661 () Bool)

(declare-fun c!101437 () Bool)

(assert (=> b!1004661 (= c!101437 (= lt!444267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004661 (= e!565716 e!565715)))

(assert (= (and d!119415 c!101438) b!1004658))

(assert (= (and d!119415 (not c!101438)) b!1004660))

(assert (= (and b!1004660 c!101436) b!1004659))

(assert (= (and b!1004660 (not c!101436)) b!1004661))

(assert (= (and b!1004661 c!101437) b!1004657))

(assert (= (and b!1004661 (not c!101437)) b!1004656))

(declare-fun m!930157 () Bool)

(assert (=> b!1004656 m!930157))

(declare-fun m!930159 () Bool)

(assert (=> d!119415 m!930159))

(declare-fun m!930161 () Bool)

(assert (=> d!119415 m!930161))

(assert (=> d!119415 m!930159))

(declare-fun m!930163 () Bool)

(assert (=> d!119415 m!930163))

(declare-fun m!930165 () Bool)

(assert (=> d!119415 m!930165))

(assert (=> d!119415 m!930071))

(declare-fun m!930167 () Bool)

(assert (=> d!119415 m!930167))

(declare-fun m!930169 () Bool)

(assert (=> b!1004660 m!930169))

(assert (=> b!1004529 d!119415))

(declare-fun d!119421 () Bool)

(assert (=> d!119421 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004530 d!119421))

(declare-fun d!119423 () Bool)

(assert (=> d!119423 (= (validKeyInArray!0 (select (arr!30530 a!3219) j!170)) (and (not (= (select (arr!30530 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30530 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004535 d!119423))

(declare-fun b!1004663 () Bool)

(declare-fun e!565719 () Bool)

(declare-fun lt!444271 () SeekEntryResult!9462)

(assert (=> b!1004663 (= e!565719 (bvsge (x!87618 lt!444271) #b01111111111111111111111111111110))))

(declare-fun b!1004664 () Bool)

(assert (=> b!1004664 (and (bvsge (index!40221 lt!444271) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444271) (size!31032 lt!444221)))))

(declare-fun res!674081 () Bool)

(assert (=> b!1004664 (= res!674081 (= (select (arr!30530 lt!444221) (index!40221 lt!444271)) lt!444220))))

(declare-fun e!565721 () Bool)

(assert (=> b!1004664 (=> res!674081 e!565721)))

(declare-fun e!565718 () Bool)

(assert (=> b!1004664 (= e!565718 e!565721)))

(declare-fun b!1004665 () Bool)

(assert (=> b!1004665 (and (bvsge (index!40221 lt!444271) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444271) (size!31032 lt!444221)))))

(declare-fun res!674080 () Bool)

(assert (=> b!1004665 (= res!674080 (= (select (arr!30530 lt!444221) (index!40221 lt!444271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004665 (=> res!674080 e!565721)))

(declare-fun b!1004666 () Bool)

(assert (=> b!1004666 (and (bvsge (index!40221 lt!444271) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444271) (size!31032 lt!444221)))))

(assert (=> b!1004666 (= e!565721 (= (select (arr!30530 lt!444221) (index!40221 lt!444271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004667 () Bool)

(declare-fun e!565720 () SeekEntryResult!9462)

(assert (=> b!1004667 (= e!565720 (Intermediate!9462 false (toIndex!0 lt!444220 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004668 () Bool)

(assert (=> b!1004668 (= e!565719 e!565718)))

(declare-fun res!674082 () Bool)

(assert (=> b!1004668 (= res!674082 (and ((_ is Intermediate!9462) lt!444271) (not (undefined!10274 lt!444271)) (bvslt (x!87618 lt!444271) #b01111111111111111111111111111110) (bvsge (x!87618 lt!444271) #b00000000000000000000000000000000) (bvsge (x!87618 lt!444271) #b00000000000000000000000000000000)))))

(assert (=> b!1004668 (=> (not res!674082) (not e!565718))))

(declare-fun d!119425 () Bool)

(assert (=> d!119425 e!565719))

(declare-fun c!101440 () Bool)

(assert (=> d!119425 (= c!101440 (and ((_ is Intermediate!9462) lt!444271) (undefined!10274 lt!444271)))))

(declare-fun e!565722 () SeekEntryResult!9462)

(assert (=> d!119425 (= lt!444271 e!565722)))

(declare-fun c!101439 () Bool)

(assert (=> d!119425 (= c!101439 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444270 () (_ BitVec 64))

(assert (=> d!119425 (= lt!444270 (select (arr!30530 lt!444221) (toIndex!0 lt!444220 mask!3464)))))

(assert (=> d!119425 (validMask!0 mask!3464)))

(assert (=> d!119425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444220 mask!3464) lt!444220 lt!444221 mask!3464) lt!444271)))

(declare-fun b!1004662 () Bool)

(assert (=> b!1004662 (= e!565722 e!565720)))

(declare-fun c!101441 () Bool)

(assert (=> b!1004662 (= c!101441 (or (= lt!444270 lt!444220) (= (bvadd lt!444270 lt!444270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004669 () Bool)

(assert (=> b!1004669 (= e!565720 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444220 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444220 lt!444221 mask!3464))))

(declare-fun b!1004670 () Bool)

(assert (=> b!1004670 (= e!565722 (Intermediate!9462 true (toIndex!0 lt!444220 mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119425 c!101439) b!1004670))

(assert (= (and d!119425 (not c!101439)) b!1004662))

(assert (= (and b!1004662 c!101441) b!1004667))

(assert (= (and b!1004662 (not c!101441)) b!1004669))

(assert (= (and d!119425 c!101440) b!1004663))

(assert (= (and d!119425 (not c!101440)) b!1004668))

(assert (= (and b!1004668 res!674082) b!1004664))

(assert (= (and b!1004664 (not res!674081)) b!1004665))

(assert (= (and b!1004665 (not res!674080)) b!1004666))

(declare-fun m!930171 () Bool)

(assert (=> b!1004665 m!930171))

(assert (=> d!119425 m!930079))

(declare-fun m!930173 () Bool)

(assert (=> d!119425 m!930173))

(assert (=> d!119425 m!930071))

(assert (=> b!1004664 m!930171))

(assert (=> b!1004666 m!930171))

(assert (=> b!1004669 m!930079))

(declare-fun m!930175 () Bool)

(assert (=> b!1004669 m!930175))

(assert (=> b!1004669 m!930175))

(declare-fun m!930177 () Bool)

(assert (=> b!1004669 m!930177))

(assert (=> b!1004536 d!119425))

(declare-fun d!119427 () Bool)

(declare-fun lt!444288 () (_ BitVec 32))

(declare-fun lt!444287 () (_ BitVec 32))

(assert (=> d!119427 (= lt!444288 (bvmul (bvxor lt!444287 (bvlshr lt!444287 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119427 (= lt!444287 ((_ extract 31 0) (bvand (bvxor lt!444220 (bvlshr lt!444220 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119427 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674086 (let ((h!22381 ((_ extract 31 0) (bvand (bvxor lt!444220 (bvlshr lt!444220 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87622 (bvmul (bvxor h!22381 (bvlshr h!22381 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87622 (bvlshr x!87622 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674086 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674086 #b00000000000000000000000000000000))))))

(assert (=> d!119427 (= (toIndex!0 lt!444220 mask!3464) (bvand (bvxor lt!444288 (bvlshr lt!444288 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004536 d!119427))

(declare-fun d!119431 () Bool)

(declare-fun res!674092 () Bool)

(declare-fun e!565741 () Bool)

(assert (=> d!119431 (=> res!674092 e!565741)))

(assert (=> d!119431 (= res!674092 (= (select (arr!30530 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119431 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!565741)))

(declare-fun b!1004702 () Bool)

(declare-fun e!565742 () Bool)

(assert (=> b!1004702 (= e!565741 e!565742)))

(declare-fun res!674093 () Bool)

(assert (=> b!1004702 (=> (not res!674093) (not e!565742))))

(assert (=> b!1004702 (= res!674093 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31032 a!3219)))))

(declare-fun b!1004703 () Bool)

(assert (=> b!1004703 (= e!565742 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119431 (not res!674092)) b!1004702))

(assert (= (and b!1004702 res!674093) b!1004703))

(assert (=> d!119431 m!930145))

(declare-fun m!930201 () Bool)

(assert (=> b!1004703 m!930201))

(assert (=> b!1004526 d!119431))

(declare-fun d!119437 () Bool)

(assert (=> d!119437 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86608 d!119437))

(declare-fun d!119447 () Bool)

(assert (=> d!119447 (= (array_inv!23654 a!3219) (bvsge (size!31032 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86608 d!119447))

(declare-fun bm!42317 () Bool)

(declare-fun call!42320 () Bool)

(declare-fun c!101465 () Bool)

(assert (=> bm!42317 (= call!42320 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101465 (Cons!21202 (select (arr!30530 a!3219) #b00000000000000000000000000000000) Nil!21203) Nil!21203)))))

(declare-fun b!1004747 () Bool)

(declare-fun e!565776 () Bool)

(assert (=> b!1004747 (= e!565776 call!42320)))

(declare-fun d!119449 () Bool)

(declare-fun res!674115 () Bool)

(declare-fun e!565775 () Bool)

(assert (=> d!119449 (=> res!674115 e!565775)))

(assert (=> d!119449 (= res!674115 (bvsge #b00000000000000000000000000000000 (size!31032 a!3219)))))

(assert (=> d!119449 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21203) e!565775)))

(declare-fun b!1004748 () Bool)

(declare-fun e!565777 () Bool)

(declare-fun contains!5881 (List!21206 (_ BitVec 64)) Bool)

(assert (=> b!1004748 (= e!565777 (contains!5881 Nil!21203 (select (arr!30530 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004749 () Bool)

(declare-fun e!565778 () Bool)

(assert (=> b!1004749 (= e!565778 e!565776)))

(assert (=> b!1004749 (= c!101465 (validKeyInArray!0 (select (arr!30530 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004750 () Bool)

(assert (=> b!1004750 (= e!565775 e!565778)))

(declare-fun res!674116 () Bool)

(assert (=> b!1004750 (=> (not res!674116) (not e!565778))))

(assert (=> b!1004750 (= res!674116 (not e!565777))))

(declare-fun res!674117 () Bool)

(assert (=> b!1004750 (=> (not res!674117) (not e!565777))))

(assert (=> b!1004750 (= res!674117 (validKeyInArray!0 (select (arr!30530 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004751 () Bool)

(assert (=> b!1004751 (= e!565776 call!42320)))

(assert (= (and d!119449 (not res!674115)) b!1004750))

(assert (= (and b!1004750 res!674117) b!1004748))

(assert (= (and b!1004750 res!674116) b!1004749))

(assert (= (and b!1004749 c!101465) b!1004747))

(assert (= (and b!1004749 (not c!101465)) b!1004751))

(assert (= (or b!1004747 b!1004751) bm!42317))

(assert (=> bm!42317 m!930145))

(declare-fun m!930213 () Bool)

(assert (=> bm!42317 m!930213))

(assert (=> b!1004748 m!930145))

(assert (=> b!1004748 m!930145))

(declare-fun m!930215 () Bool)

(assert (=> b!1004748 m!930215))

(assert (=> b!1004749 m!930145))

(assert (=> b!1004749 m!930145))

(assert (=> b!1004749 m!930155))

(assert (=> b!1004750 m!930145))

(assert (=> b!1004750 m!930145))

(assert (=> b!1004750 m!930155))

(assert (=> b!1004532 d!119449))

(declare-fun b!1004753 () Bool)

(declare-fun e!565780 () Bool)

(declare-fun lt!444302 () SeekEntryResult!9462)

(assert (=> b!1004753 (= e!565780 (bvsge (x!87618 lt!444302) #b01111111111111111111111111111110))))

(declare-fun b!1004754 () Bool)

(assert (=> b!1004754 (and (bvsge (index!40221 lt!444302) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444302) (size!31032 a!3219)))))

(declare-fun res!674119 () Bool)

(assert (=> b!1004754 (= res!674119 (= (select (arr!30530 a!3219) (index!40221 lt!444302)) (select (arr!30530 a!3219) j!170)))))

(declare-fun e!565782 () Bool)

(assert (=> b!1004754 (=> res!674119 e!565782)))

(declare-fun e!565779 () Bool)

(assert (=> b!1004754 (= e!565779 e!565782)))

(declare-fun b!1004755 () Bool)

(assert (=> b!1004755 (and (bvsge (index!40221 lt!444302) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444302) (size!31032 a!3219)))))

(declare-fun res!674118 () Bool)

(assert (=> b!1004755 (= res!674118 (= (select (arr!30530 a!3219) (index!40221 lt!444302)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004755 (=> res!674118 e!565782)))

(declare-fun b!1004756 () Bool)

(assert (=> b!1004756 (and (bvsge (index!40221 lt!444302) #b00000000000000000000000000000000) (bvslt (index!40221 lt!444302) (size!31032 a!3219)))))

(assert (=> b!1004756 (= e!565782 (= (select (arr!30530 a!3219) (index!40221 lt!444302)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!565781 () SeekEntryResult!9462)

(declare-fun b!1004757 () Bool)

(assert (=> b!1004757 (= e!565781 (Intermediate!9462 false (toIndex!0 (select (arr!30530 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004758 () Bool)

(assert (=> b!1004758 (= e!565780 e!565779)))

(declare-fun res!674120 () Bool)

(assert (=> b!1004758 (= res!674120 (and ((_ is Intermediate!9462) lt!444302) (not (undefined!10274 lt!444302)) (bvslt (x!87618 lt!444302) #b01111111111111111111111111111110) (bvsge (x!87618 lt!444302) #b00000000000000000000000000000000) (bvsge (x!87618 lt!444302) #b00000000000000000000000000000000)))))

(assert (=> b!1004758 (=> (not res!674120) (not e!565779))))

(declare-fun d!119451 () Bool)

(assert (=> d!119451 e!565780))

(declare-fun c!101467 () Bool)

(assert (=> d!119451 (= c!101467 (and ((_ is Intermediate!9462) lt!444302) (undefined!10274 lt!444302)))))

(declare-fun e!565783 () SeekEntryResult!9462)

(assert (=> d!119451 (= lt!444302 e!565783)))

(declare-fun c!101466 () Bool)

(assert (=> d!119451 (= c!101466 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444301 () (_ BitVec 64))

(assert (=> d!119451 (= lt!444301 (select (arr!30530 a!3219) (toIndex!0 (select (arr!30530 a!3219) j!170) mask!3464)))))

(assert (=> d!119451 (validMask!0 mask!3464)))

(assert (=> d!119451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30530 a!3219) j!170) mask!3464) (select (arr!30530 a!3219) j!170) a!3219 mask!3464) lt!444302)))

(declare-fun b!1004752 () Bool)

(assert (=> b!1004752 (= e!565783 e!565781)))

(declare-fun c!101468 () Bool)

(assert (=> b!1004752 (= c!101468 (or (= lt!444301 (select (arr!30530 a!3219) j!170)) (= (bvadd lt!444301 lt!444301) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004759 () Bool)

(assert (=> b!1004759 (= e!565781 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30530 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30530 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004760 () Bool)

(assert (=> b!1004760 (= e!565783 (Intermediate!9462 true (toIndex!0 (select (arr!30530 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119451 c!101466) b!1004760))

(assert (= (and d!119451 (not c!101466)) b!1004752))

(assert (= (and b!1004752 c!101468) b!1004757))

(assert (= (and b!1004752 (not c!101468)) b!1004759))

(assert (= (and d!119451 c!101467) b!1004753))

(assert (= (and d!119451 (not c!101467)) b!1004758))

(assert (= (and b!1004758 res!674120) b!1004754))

(assert (= (and b!1004754 (not res!674119)) b!1004755))

(assert (= (and b!1004755 (not res!674118)) b!1004756))

(declare-fun m!930219 () Bool)

(assert (=> b!1004755 m!930219))

(assert (=> d!119451 m!930087))

(declare-fun m!930223 () Bool)

(assert (=> d!119451 m!930223))

(assert (=> d!119451 m!930071))

(assert (=> b!1004754 m!930219))

(assert (=> b!1004756 m!930219))

(assert (=> b!1004759 m!930087))

(declare-fun m!930229 () Bool)

(assert (=> b!1004759 m!930229))

(assert (=> b!1004759 m!930229))

(assert (=> b!1004759 m!930065))

(declare-fun m!930237 () Bool)

(assert (=> b!1004759 m!930237))

(assert (=> b!1004538 d!119451))

(declare-fun d!119459 () Bool)

(declare-fun lt!444307 () (_ BitVec 32))

(declare-fun lt!444306 () (_ BitVec 32))

(assert (=> d!119459 (= lt!444307 (bvmul (bvxor lt!444306 (bvlshr lt!444306 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119459 (= lt!444306 ((_ extract 31 0) (bvand (bvxor (select (arr!30530 a!3219) j!170) (bvlshr (select (arr!30530 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119459 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674086 (let ((h!22381 ((_ extract 31 0) (bvand (bvxor (select (arr!30530 a!3219) j!170) (bvlshr (select (arr!30530 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87622 (bvmul (bvxor h!22381 (bvlshr h!22381 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87622 (bvlshr x!87622 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674086 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674086 #b00000000000000000000000000000000))))))

(assert (=> d!119459 (= (toIndex!0 (select (arr!30530 a!3219) j!170) mask!3464) (bvand (bvxor lt!444307 (bvlshr lt!444307 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004538 d!119459))

(check-sat (not b!1004612) (not b!1004603) (not d!119407) (not b!1004625) (not bm!42311) (not b!1004759) (not b!1004703) (not b!1004669) (not d!119425) (not b!1004750) (not b!1004749) (not b!1004622) (not b!1004656) (not d!119415) (not d!119409) (not b!1004748) (not d!119451) (not bm!42317))
(check-sat)
