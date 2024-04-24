; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49396 () Bool)

(assert start!49396)

(declare-fun b!543998 () Bool)

(declare-fun res!338450 () Bool)

(declare-fun e!314550 () Bool)

(assert (=> b!543998 (=> (not res!338450) (not e!314550))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543998 (= res!338450 (validKeyInArray!0 k0!1998))))

(declare-fun b!543999 () Bool)

(declare-fun e!314548 () Bool)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543999 (= e!314548 (bvsgt (bvadd #b00000000000000000000000000000001 x!1030) resX!32))))

(declare-fun lt!248370 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543999 (= lt!248370 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!544000 () Bool)

(declare-fun res!338451 () Bool)

(assert (=> b!544000 (=> (not res!338451) (not e!314550))))

(declare-datatypes ((array!34352 0))(
  ( (array!34353 (arr!16507 (Array (_ BitVec 32) (_ BitVec 64))) (size!16871 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34352)

(declare-fun arrayContainsKey!0 (array!34352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544000 (= res!338451 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544001 () Bool)

(declare-fun res!338447 () Bool)

(assert (=> b!544001 (=> (not res!338447) (not e!314550))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544001 (= res!338447 (and (= (size!16871 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16871 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16871 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544002 () Bool)

(declare-fun res!338444 () Bool)

(assert (=> b!544002 (=> (not res!338444) (not e!314548))))

(assert (=> b!544002 (= res!338444 (and (not (= (select (arr!16507 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16507 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16507 a!3154) index!1177) (select (arr!16507 a!3154) j!147)))))))

(declare-fun b!544003 () Bool)

(declare-fun e!314549 () Bool)

(assert (=> b!544003 (= e!314550 e!314549)))

(declare-fun res!338446 () Bool)

(assert (=> b!544003 (=> (not res!338446) (not e!314549))))

(declare-datatypes ((SeekEntryResult!4921 0))(
  ( (MissingZero!4921 (index!21908 (_ BitVec 32))) (Found!4921 (index!21909 (_ BitVec 32))) (Intermediate!4921 (undefined!5733 Bool) (index!21910 (_ BitVec 32)) (x!50963 (_ BitVec 32))) (Undefined!4921) (MissingVacant!4921 (index!21911 (_ BitVec 32))) )
))
(declare-fun lt!248371 () SeekEntryResult!4921)

(assert (=> b!544003 (= res!338446 (or (= lt!248371 (MissingZero!4921 i!1153)) (= lt!248371 (MissingVacant!4921 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34352 (_ BitVec 32)) SeekEntryResult!4921)

(assert (=> b!544003 (= lt!248371 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544004 () Bool)

(declare-fun res!338445 () Bool)

(assert (=> b!544004 (=> (not res!338445) (not e!314549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34352 (_ BitVec 32)) Bool)

(assert (=> b!544004 (= res!338445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544005 () Bool)

(declare-fun res!338453 () Bool)

(assert (=> b!544005 (=> (not res!338453) (not e!314548))))

(declare-fun lt!248369 () SeekEntryResult!4921)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34352 (_ BitVec 32)) SeekEntryResult!4921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544005 (= res!338453 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216) lt!248369))))

(declare-fun b!544006 () Bool)

(assert (=> b!544006 (= e!314549 e!314548)))

(declare-fun res!338449 () Bool)

(assert (=> b!544006 (=> (not res!338449) (not e!314548))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!544006 (= res!338449 (= lt!248369 (Intermediate!4921 false resIndex!32 resX!32)))))

(assert (=> b!544006 (= lt!248369 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16507 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544007 () Bool)

(declare-fun res!338448 () Bool)

(assert (=> b!544007 (=> (not res!338448) (not e!314550))))

(assert (=> b!544007 (= res!338448 (validKeyInArray!0 (select (arr!16507 a!3154) j!147)))))

(declare-fun b!544008 () Bool)

(declare-fun res!338454 () Bool)

(assert (=> b!544008 (=> (not res!338454) (not e!314549))))

(declare-datatypes ((List!10533 0))(
  ( (Nil!10530) (Cons!10529 (h!11487 (_ BitVec 64)) (t!16753 List!10533)) )
))
(declare-fun arrayNoDuplicates!0 (array!34352 (_ BitVec 32) List!10533) Bool)

(assert (=> b!544008 (= res!338454 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10530))))

(declare-fun res!338452 () Bool)

(assert (=> start!49396 (=> (not res!338452) (not e!314550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49396 (= res!338452 (validMask!0 mask!3216))))

(assert (=> start!49396 e!314550))

(assert (=> start!49396 true))

(declare-fun array_inv!12366 (array!34352) Bool)

(assert (=> start!49396 (array_inv!12366 a!3154)))

(declare-fun b!544009 () Bool)

(declare-fun res!338455 () Bool)

(assert (=> b!544009 (=> (not res!338455) (not e!314549))))

(assert (=> b!544009 (= res!338455 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16871 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16871 a!3154)) (= (select (arr!16507 a!3154) resIndex!32) (select (arr!16507 a!3154) j!147))))))

(assert (= (and start!49396 res!338452) b!544001))

(assert (= (and b!544001 res!338447) b!544007))

(assert (= (and b!544007 res!338448) b!543998))

(assert (= (and b!543998 res!338450) b!544000))

(assert (= (and b!544000 res!338451) b!544003))

(assert (= (and b!544003 res!338446) b!544004))

(assert (= (and b!544004 res!338445) b!544008))

(assert (= (and b!544008 res!338454) b!544009))

(assert (= (and b!544009 res!338455) b!544006))

(assert (= (and b!544006 res!338449) b!544005))

(assert (= (and b!544005 res!338453) b!544002))

(assert (= (and b!544002 res!338444) b!543999))

(declare-fun m!522151 () Bool)

(assert (=> b!544007 m!522151))

(assert (=> b!544007 m!522151))

(declare-fun m!522153 () Bool)

(assert (=> b!544007 m!522153))

(declare-fun m!522155 () Bool)

(assert (=> start!49396 m!522155))

(declare-fun m!522157 () Bool)

(assert (=> start!49396 m!522157))

(declare-fun m!522159 () Bool)

(assert (=> b!544009 m!522159))

(assert (=> b!544009 m!522151))

(declare-fun m!522161 () Bool)

(assert (=> b!544002 m!522161))

(assert (=> b!544002 m!522151))

(declare-fun m!522163 () Bool)

(assert (=> b!544003 m!522163))

(assert (=> b!544006 m!522151))

(assert (=> b!544006 m!522151))

(declare-fun m!522165 () Bool)

(assert (=> b!544006 m!522165))

(declare-fun m!522167 () Bool)

(assert (=> b!543999 m!522167))

(assert (=> b!544005 m!522151))

(assert (=> b!544005 m!522151))

(declare-fun m!522169 () Bool)

(assert (=> b!544005 m!522169))

(assert (=> b!544005 m!522169))

(assert (=> b!544005 m!522151))

(declare-fun m!522171 () Bool)

(assert (=> b!544005 m!522171))

(declare-fun m!522173 () Bool)

(assert (=> b!544008 m!522173))

(declare-fun m!522175 () Bool)

(assert (=> b!544000 m!522175))

(declare-fun m!522177 () Bool)

(assert (=> b!543998 m!522177))

(declare-fun m!522179 () Bool)

(assert (=> b!544004 m!522179))

(check-sat (not b!544006) (not b!544008) (not b!543998) (not b!544007) (not start!49396) (not b!543999) (not b!544003) (not b!544005) (not b!544004) (not b!544000))
(check-sat)
(get-model)

(declare-fun d!82025 () Bool)

(declare-fun res!338532 () Bool)

(declare-fun e!314579 () Bool)

(assert (=> d!82025 (=> res!338532 e!314579)))

(assert (=> d!82025 (= res!338532 (= (select (arr!16507 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!82025 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!314579)))

(declare-fun b!544086 () Bool)

(declare-fun e!314580 () Bool)

(assert (=> b!544086 (= e!314579 e!314580)))

(declare-fun res!338533 () Bool)

(assert (=> b!544086 (=> (not res!338533) (not e!314580))))

(assert (=> b!544086 (= res!338533 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16871 a!3154)))))

(declare-fun b!544087 () Bool)

(assert (=> b!544087 (= e!314580 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82025 (not res!338532)) b!544086))

(assert (= (and b!544086 res!338533) b!544087))

(declare-fun m!522241 () Bool)

(assert (=> d!82025 m!522241))

(declare-fun m!522243 () Bool)

(assert (=> b!544087 m!522243))

(assert (=> b!544000 d!82025))

(declare-fun b!544121 () Bool)

(declare-fun e!314607 () SeekEntryResult!4921)

(assert (=> b!544121 (= e!314607 (Intermediate!4921 false index!1177 x!1030))))

(declare-fun d!82027 () Bool)

(declare-fun e!314604 () Bool)

(assert (=> d!82027 e!314604))

(declare-fun c!63105 () Bool)

(declare-fun lt!248395 () SeekEntryResult!4921)

(get-info :version)

(assert (=> d!82027 (= c!63105 (and ((_ is Intermediate!4921) lt!248395) (undefined!5733 lt!248395)))))

(declare-fun e!314603 () SeekEntryResult!4921)

(assert (=> d!82027 (= lt!248395 e!314603)))

(declare-fun c!63107 () Bool)

(assert (=> d!82027 (= c!63107 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!248394 () (_ BitVec 64))

(assert (=> d!82027 (= lt!248394 (select (arr!16507 a!3154) index!1177))))

(assert (=> d!82027 (validMask!0 mask!3216)))

(assert (=> d!82027 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16507 a!3154) j!147) a!3154 mask!3216) lt!248395)))

(declare-fun b!544122 () Bool)

(assert (=> b!544122 (= e!314604 (bvsge (x!50963 lt!248395) #b01111111111111111111111111111110))))

(declare-fun b!544123 () Bool)

(assert (=> b!544123 (= e!314603 e!314607)))

(declare-fun c!63106 () Bool)

(assert (=> b!544123 (= c!63106 (or (= lt!248394 (select (arr!16507 a!3154) j!147)) (= (bvadd lt!248394 lt!248394) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544124 () Bool)

(assert (=> b!544124 (and (bvsge (index!21910 lt!248395) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248395) (size!16871 a!3154)))))

(declare-fun res!338551 () Bool)

(assert (=> b!544124 (= res!338551 (= (select (arr!16507 a!3154) (index!21910 lt!248395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314606 () Bool)

(assert (=> b!544124 (=> res!338551 e!314606)))

(declare-fun b!544125 () Bool)

(declare-fun e!314605 () Bool)

(assert (=> b!544125 (= e!314604 e!314605)))

(declare-fun res!338549 () Bool)

(assert (=> b!544125 (= res!338549 (and ((_ is Intermediate!4921) lt!248395) (not (undefined!5733 lt!248395)) (bvslt (x!50963 lt!248395) #b01111111111111111111111111111110) (bvsge (x!50963 lt!248395) #b00000000000000000000000000000000) (bvsge (x!50963 lt!248395) x!1030)))))

(assert (=> b!544125 (=> (not res!338549) (not e!314605))))

(declare-fun b!544126 () Bool)

(assert (=> b!544126 (and (bvsge (index!21910 lt!248395) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248395) (size!16871 a!3154)))))

(assert (=> b!544126 (= e!314606 (= (select (arr!16507 a!3154) (index!21910 lt!248395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544127 () Bool)

(assert (=> b!544127 (= e!314603 (Intermediate!4921 true index!1177 x!1030))))

(declare-fun b!544128 () Bool)

(assert (=> b!544128 (= e!314607 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544129 () Bool)

(assert (=> b!544129 (and (bvsge (index!21910 lt!248395) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248395) (size!16871 a!3154)))))

(declare-fun res!338550 () Bool)

(assert (=> b!544129 (= res!338550 (= (select (arr!16507 a!3154) (index!21910 lt!248395)) (select (arr!16507 a!3154) j!147)))))

(assert (=> b!544129 (=> res!338550 e!314606)))

(assert (=> b!544129 (= e!314605 e!314606)))

(assert (= (and d!82027 c!63107) b!544127))

(assert (= (and d!82027 (not c!63107)) b!544123))

(assert (= (and b!544123 c!63106) b!544121))

(assert (= (and b!544123 (not c!63106)) b!544128))

(assert (= (and d!82027 c!63105) b!544122))

(assert (= (and d!82027 (not c!63105)) b!544125))

(assert (= (and b!544125 res!338549) b!544129))

(assert (= (and b!544129 (not res!338550)) b!544124))

(assert (= (and b!544124 (not res!338551)) b!544126))

(declare-fun m!522253 () Bool)

(assert (=> b!544128 m!522253))

(assert (=> b!544128 m!522253))

(assert (=> b!544128 m!522151))

(declare-fun m!522255 () Bool)

(assert (=> b!544128 m!522255))

(declare-fun m!522257 () Bool)

(assert (=> b!544126 m!522257))

(assert (=> b!544129 m!522257))

(assert (=> b!544124 m!522257))

(assert (=> d!82027 m!522161))

(assert (=> d!82027 m!522155))

(assert (=> b!544006 d!82027))

(declare-fun d!82037 () Bool)

(assert (=> d!82037 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49396 d!82037))

(declare-fun d!82041 () Bool)

(assert (=> d!82041 (= (array_inv!12366 a!3154) (bvsge (size!16871 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49396 d!82041))

(declare-fun d!82043 () Bool)

(assert (=> d!82043 (= (validKeyInArray!0 (select (arr!16507 a!3154) j!147)) (and (not (= (select (arr!16507 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16507 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544007 d!82043))

(declare-fun b!544204 () Bool)

(declare-fun e!314654 () Bool)

(declare-fun e!314657 () Bool)

(assert (=> b!544204 (= e!314654 e!314657)))

(declare-fun res!338583 () Bool)

(assert (=> b!544204 (=> (not res!338583) (not e!314657))))

(declare-fun e!314656 () Bool)

(assert (=> b!544204 (= res!338583 (not e!314656))))

(declare-fun res!338585 () Bool)

(assert (=> b!544204 (=> (not res!338585) (not e!314656))))

(assert (=> b!544204 (= res!338585 (validKeyInArray!0 (select (arr!16507 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544205 () Bool)

(declare-fun e!314655 () Bool)

(declare-fun call!32081 () Bool)

(assert (=> b!544205 (= e!314655 call!32081)))

(declare-fun b!544206 () Bool)

(assert (=> b!544206 (= e!314657 e!314655)))

(declare-fun c!63130 () Bool)

(assert (=> b!544206 (= c!63130 (validKeyInArray!0 (select (arr!16507 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82045 () Bool)

(declare-fun res!338584 () Bool)

(assert (=> d!82045 (=> res!338584 e!314654)))

(assert (=> d!82045 (= res!338584 (bvsge #b00000000000000000000000000000000 (size!16871 a!3154)))))

(assert (=> d!82045 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10530) e!314654)))

(declare-fun bm!32078 () Bool)

(assert (=> bm!32078 (= call!32081 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63130 (Cons!10529 (select (arr!16507 a!3154) #b00000000000000000000000000000000) Nil!10530) Nil!10530)))))

(declare-fun b!544207 () Bool)

(declare-fun contains!2784 (List!10533 (_ BitVec 64)) Bool)

(assert (=> b!544207 (= e!314656 (contains!2784 Nil!10530 (select (arr!16507 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544208 () Bool)

(assert (=> b!544208 (= e!314655 call!32081)))

(assert (= (and d!82045 (not res!338584)) b!544204))

(assert (= (and b!544204 res!338585) b!544207))

(assert (= (and b!544204 res!338583) b!544206))

(assert (= (and b!544206 c!63130) b!544205))

(assert (= (and b!544206 (not c!63130)) b!544208))

(assert (= (or b!544205 b!544208) bm!32078))

(assert (=> b!544204 m!522241))

(assert (=> b!544204 m!522241))

(declare-fun m!522273 () Bool)

(assert (=> b!544204 m!522273))

(assert (=> b!544206 m!522241))

(assert (=> b!544206 m!522241))

(assert (=> b!544206 m!522273))

(assert (=> bm!32078 m!522241))

(declare-fun m!522275 () Bool)

(assert (=> bm!32078 m!522275))

(assert (=> b!544207 m!522241))

(assert (=> b!544207 m!522241))

(declare-fun m!522277 () Bool)

(assert (=> b!544207 m!522277))

(assert (=> b!544008 d!82045))

(declare-fun b!544265 () Bool)

(declare-fun e!314696 () SeekEntryResult!4921)

(declare-fun lt!248438 () SeekEntryResult!4921)

(assert (=> b!544265 (= e!314696 (MissingZero!4921 (index!21910 lt!248438)))))

(declare-fun b!544266 () Bool)

(declare-fun c!63151 () Bool)

(declare-fun lt!248439 () (_ BitVec 64))

(assert (=> b!544266 (= c!63151 (= lt!248439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314694 () SeekEntryResult!4921)

(assert (=> b!544266 (= e!314694 e!314696)))

(declare-fun b!544267 () Bool)

(assert (=> b!544267 (= e!314694 (Found!4921 (index!21910 lt!248438)))))

(declare-fun b!544268 () Bool)

(declare-fun e!314695 () SeekEntryResult!4921)

(assert (=> b!544268 (= e!314695 Undefined!4921)))

(declare-fun b!544269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34352 (_ BitVec 32)) SeekEntryResult!4921)

(assert (=> b!544269 (= e!314696 (seekKeyOrZeroReturnVacant!0 (x!50963 lt!248438) (index!21910 lt!248438) (index!21910 lt!248438) k0!1998 a!3154 mask!3216))))

(declare-fun d!82051 () Bool)

(declare-fun lt!248437 () SeekEntryResult!4921)

(assert (=> d!82051 (and (or ((_ is Undefined!4921) lt!248437) (not ((_ is Found!4921) lt!248437)) (and (bvsge (index!21909 lt!248437) #b00000000000000000000000000000000) (bvslt (index!21909 lt!248437) (size!16871 a!3154)))) (or ((_ is Undefined!4921) lt!248437) ((_ is Found!4921) lt!248437) (not ((_ is MissingZero!4921) lt!248437)) (and (bvsge (index!21908 lt!248437) #b00000000000000000000000000000000) (bvslt (index!21908 lt!248437) (size!16871 a!3154)))) (or ((_ is Undefined!4921) lt!248437) ((_ is Found!4921) lt!248437) ((_ is MissingZero!4921) lt!248437) (not ((_ is MissingVacant!4921) lt!248437)) (and (bvsge (index!21911 lt!248437) #b00000000000000000000000000000000) (bvslt (index!21911 lt!248437) (size!16871 a!3154)))) (or ((_ is Undefined!4921) lt!248437) (ite ((_ is Found!4921) lt!248437) (= (select (arr!16507 a!3154) (index!21909 lt!248437)) k0!1998) (ite ((_ is MissingZero!4921) lt!248437) (= (select (arr!16507 a!3154) (index!21908 lt!248437)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4921) lt!248437) (= (select (arr!16507 a!3154) (index!21911 lt!248437)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82051 (= lt!248437 e!314695)))

(declare-fun c!63150 () Bool)

(assert (=> d!82051 (= c!63150 (and ((_ is Intermediate!4921) lt!248438) (undefined!5733 lt!248438)))))

(assert (=> d!82051 (= lt!248438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!82051 (validMask!0 mask!3216)))

(assert (=> d!82051 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248437)))

(declare-fun b!544270 () Bool)

(assert (=> b!544270 (= e!314695 e!314694)))

(assert (=> b!544270 (= lt!248439 (select (arr!16507 a!3154) (index!21910 lt!248438)))))

(declare-fun c!63152 () Bool)

(assert (=> b!544270 (= c!63152 (= lt!248439 k0!1998))))

(assert (= (and d!82051 c!63150) b!544268))

(assert (= (and d!82051 (not c!63150)) b!544270))

(assert (= (and b!544270 c!63152) b!544267))

(assert (= (and b!544270 (not c!63152)) b!544266))

(assert (= (and b!544266 c!63151) b!544265))

(assert (= (and b!544266 (not c!63151)) b!544269))

(declare-fun m!522303 () Bool)

(assert (=> b!544269 m!522303))

(assert (=> d!82051 m!522155))

(declare-fun m!522305 () Bool)

(assert (=> d!82051 m!522305))

(declare-fun m!522307 () Bool)

(assert (=> d!82051 m!522307))

(assert (=> d!82051 m!522307))

(declare-fun m!522309 () Bool)

(assert (=> d!82051 m!522309))

(declare-fun m!522311 () Bool)

(assert (=> d!82051 m!522311))

(declare-fun m!522313 () Bool)

(assert (=> d!82051 m!522313))

(declare-fun m!522315 () Bool)

(assert (=> b!544270 m!522315))

(assert (=> b!544003 d!82051))

(declare-fun d!82063 () Bool)

(assert (=> d!82063 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543998 d!82063))

(declare-fun b!544285 () Bool)

(declare-fun e!314707 () Bool)

(declare-fun call!32088 () Bool)

(assert (=> b!544285 (= e!314707 call!32088)))

(declare-fun b!544286 () Bool)

(declare-fun e!314708 () Bool)

(assert (=> b!544286 (= e!314708 e!314707)))

(declare-fun lt!248449 () (_ BitVec 64))

(assert (=> b!544286 (= lt!248449 (select (arr!16507 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16881 0))(
  ( (Unit!16882) )
))
(declare-fun lt!248450 () Unit!16881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34352 (_ BitVec 64) (_ BitVec 32)) Unit!16881)

(assert (=> b!544286 (= lt!248450 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248449 #b00000000000000000000000000000000))))

(assert (=> b!544286 (arrayContainsKey!0 a!3154 lt!248449 #b00000000000000000000000000000000)))

(declare-fun lt!248451 () Unit!16881)

(assert (=> b!544286 (= lt!248451 lt!248450)))

(declare-fun res!338609 () Bool)

(assert (=> b!544286 (= res!338609 (= (seekEntryOrOpen!0 (select (arr!16507 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4921 #b00000000000000000000000000000000)))))

(assert (=> b!544286 (=> (not res!338609) (not e!314707))))

(declare-fun b!544287 () Bool)

(declare-fun e!314706 () Bool)

(assert (=> b!544287 (= e!314706 e!314708)))

(declare-fun c!63158 () Bool)

(assert (=> b!544287 (= c!63158 (validKeyInArray!0 (select (arr!16507 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32085 () Bool)

(assert (=> bm!32085 (= call!32088 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!544288 () Bool)

(assert (=> b!544288 (= e!314708 call!32088)))

(declare-fun d!82065 () Bool)

(declare-fun res!338608 () Bool)

(assert (=> d!82065 (=> res!338608 e!314706)))

(assert (=> d!82065 (= res!338608 (bvsge #b00000000000000000000000000000000 (size!16871 a!3154)))))

(assert (=> d!82065 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314706)))

(assert (= (and d!82065 (not res!338608)) b!544287))

(assert (= (and b!544287 c!63158) b!544286))

(assert (= (and b!544287 (not c!63158)) b!544288))

(assert (= (and b!544286 res!338609) b!544285))

(assert (= (or b!544285 b!544288) bm!32085))

(assert (=> b!544286 m!522241))

(declare-fun m!522331 () Bool)

(assert (=> b!544286 m!522331))

(declare-fun m!522333 () Bool)

(assert (=> b!544286 m!522333))

(assert (=> b!544286 m!522241))

(declare-fun m!522335 () Bool)

(assert (=> b!544286 m!522335))

(assert (=> b!544287 m!522241))

(assert (=> b!544287 m!522241))

(assert (=> b!544287 m!522273))

(declare-fun m!522337 () Bool)

(assert (=> bm!32085 m!522337))

(assert (=> b!544004 d!82065))

(declare-fun d!82069 () Bool)

(declare-fun lt!248460 () (_ BitVec 32))

(assert (=> d!82069 (and (bvsge lt!248460 #b00000000000000000000000000000000) (bvslt lt!248460 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82069 (= lt!248460 (choose!52 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (=> d!82069 (validMask!0 mask!3216)))

(assert (=> d!82069 (= (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) lt!248460)))

(declare-fun bs!16991 () Bool)

(assert (= bs!16991 d!82069))

(declare-fun m!522339 () Bool)

(assert (=> bs!16991 m!522339))

(assert (=> bs!16991 m!522155))

(assert (=> b!543999 d!82069))

(declare-fun b!544301 () Bool)

(declare-fun e!314719 () SeekEntryResult!4921)

(assert (=> b!544301 (= e!314719 (Intermediate!4921 false (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun d!82075 () Bool)

(declare-fun e!314716 () Bool)

(assert (=> d!82075 e!314716))

(declare-fun c!63165 () Bool)

(declare-fun lt!248462 () SeekEntryResult!4921)

(assert (=> d!82075 (= c!63165 (and ((_ is Intermediate!4921) lt!248462) (undefined!5733 lt!248462)))))

(declare-fun e!314715 () SeekEntryResult!4921)

(assert (=> d!82075 (= lt!248462 e!314715)))

(declare-fun c!63167 () Bool)

(assert (=> d!82075 (= c!63167 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248461 () (_ BitVec 64))

(assert (=> d!82075 (= lt!248461 (select (arr!16507 a!3154) (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216)))))

(assert (=> d!82075 (validMask!0 mask!3216)))

(assert (=> d!82075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216) lt!248462)))

(declare-fun b!544302 () Bool)

(assert (=> b!544302 (= e!314716 (bvsge (x!50963 lt!248462) #b01111111111111111111111111111110))))

(declare-fun b!544303 () Bool)

(assert (=> b!544303 (= e!314715 e!314719)))

(declare-fun c!63166 () Bool)

(assert (=> b!544303 (= c!63166 (or (= lt!248461 (select (arr!16507 a!3154) j!147)) (= (bvadd lt!248461 lt!248461) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544304 () Bool)

(assert (=> b!544304 (and (bvsge (index!21910 lt!248462) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248462) (size!16871 a!3154)))))

(declare-fun res!338612 () Bool)

(assert (=> b!544304 (= res!338612 (= (select (arr!16507 a!3154) (index!21910 lt!248462)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314718 () Bool)

(assert (=> b!544304 (=> res!338612 e!314718)))

(declare-fun b!544305 () Bool)

(declare-fun e!314717 () Bool)

(assert (=> b!544305 (= e!314716 e!314717)))

(declare-fun res!338610 () Bool)

(assert (=> b!544305 (= res!338610 (and ((_ is Intermediate!4921) lt!248462) (not (undefined!5733 lt!248462)) (bvslt (x!50963 lt!248462) #b01111111111111111111111111111110) (bvsge (x!50963 lt!248462) #b00000000000000000000000000000000) (bvsge (x!50963 lt!248462) #b00000000000000000000000000000000)))))

(assert (=> b!544305 (=> (not res!338610) (not e!314717))))

(declare-fun b!544306 () Bool)

(assert (=> b!544306 (and (bvsge (index!21910 lt!248462) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248462) (size!16871 a!3154)))))

(assert (=> b!544306 (= e!314718 (= (select (arr!16507 a!3154) (index!21910 lt!248462)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544307 () Bool)

(assert (=> b!544307 (= e!314715 (Intermediate!4921 true (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544308 () Bool)

(assert (=> b!544308 (= e!314719 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544309 () Bool)

(assert (=> b!544309 (and (bvsge (index!21910 lt!248462) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248462) (size!16871 a!3154)))))

(declare-fun res!338611 () Bool)

(assert (=> b!544309 (= res!338611 (= (select (arr!16507 a!3154) (index!21910 lt!248462)) (select (arr!16507 a!3154) j!147)))))

(assert (=> b!544309 (=> res!338611 e!314718)))

(assert (=> b!544309 (= e!314717 e!314718)))

(assert (= (and d!82075 c!63167) b!544307))

(assert (= (and d!82075 (not c!63167)) b!544303))

(assert (= (and b!544303 c!63166) b!544301))

(assert (= (and b!544303 (not c!63166)) b!544308))

(assert (= (and d!82075 c!63165) b!544302))

(assert (= (and d!82075 (not c!63165)) b!544305))

(assert (= (and b!544305 res!338610) b!544309))

(assert (= (and b!544309 (not res!338611)) b!544304))

(assert (= (and b!544304 (not res!338612)) b!544306))

(assert (=> b!544308 m!522169))

(declare-fun m!522341 () Bool)

(assert (=> b!544308 m!522341))

(assert (=> b!544308 m!522341))

(assert (=> b!544308 m!522151))

(declare-fun m!522343 () Bool)

(assert (=> b!544308 m!522343))

(declare-fun m!522345 () Bool)

(assert (=> b!544306 m!522345))

(assert (=> b!544309 m!522345))

(assert (=> b!544304 m!522345))

(assert (=> d!82075 m!522169))

(declare-fun m!522347 () Bool)

(assert (=> d!82075 m!522347))

(assert (=> d!82075 m!522155))

(assert (=> b!544005 d!82075))

(declare-fun d!82077 () Bool)

(declare-fun lt!248480 () (_ BitVec 32))

(declare-fun lt!248479 () (_ BitVec 32))

(assert (=> d!82077 (= lt!248480 (bvmul (bvxor lt!248479 (bvlshr lt!248479 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82077 (= lt!248479 ((_ extract 31 0) (bvand (bvxor (select (arr!16507 a!3154) j!147) (bvlshr (select (arr!16507 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82077 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338613 (let ((h!11491 ((_ extract 31 0) (bvand (bvxor (select (arr!16507 a!3154) j!147) (bvlshr (select (arr!16507 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50971 (bvmul (bvxor h!11491 (bvlshr h!11491 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50971 (bvlshr x!50971 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338613 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338613 #b00000000000000000000000000000000))))))

(assert (=> d!82077 (= (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvand (bvxor lt!248480 (bvlshr lt!248480 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!544005 d!82077))

(check-sat (not d!82075) (not b!544286) (not b!544204) (not b!544287) (not bm!32085) (not b!544206) (not b!544308) (not b!544087) (not d!82051) (not b!544269) (not b!544128) (not d!82069) (not d!82027) (not b!544207) (not bm!32078))
(check-sat)
(get-model)

(declare-fun b!544343 () Bool)

(declare-fun e!314744 () Bool)

(declare-fun call!32092 () Bool)

(assert (=> b!544343 (= e!314744 call!32092)))

(declare-fun b!544344 () Bool)

(declare-fun e!314745 () Bool)

(assert (=> b!544344 (= e!314745 e!314744)))

(declare-fun lt!248495 () (_ BitVec 64))

(assert (=> b!544344 (= lt!248495 (select (arr!16507 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!248496 () Unit!16881)

(assert (=> b!544344 (= lt!248496 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248495 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!544344 (arrayContainsKey!0 a!3154 lt!248495 #b00000000000000000000000000000000)))

(declare-fun lt!248497 () Unit!16881)

(assert (=> b!544344 (= lt!248497 lt!248496)))

(declare-fun res!338631 () Bool)

(assert (=> b!544344 (= res!338631 (= (seekEntryOrOpen!0 (select (arr!16507 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3154 mask!3216) (Found!4921 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!544344 (=> (not res!338631) (not e!314744))))

(declare-fun b!544345 () Bool)

(declare-fun e!314743 () Bool)

(assert (=> b!544345 (= e!314743 e!314745)))

(declare-fun c!63177 () Bool)

(assert (=> b!544345 (= c!63177 (validKeyInArray!0 (select (arr!16507 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!32089 () Bool)

(assert (=> bm!32089 (= call!32092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!544346 () Bool)

(assert (=> b!544346 (= e!314745 call!32092)))

(declare-fun d!82097 () Bool)

(declare-fun res!338630 () Bool)

(assert (=> d!82097 (=> res!338630 e!314743)))

(assert (=> d!82097 (= res!338630 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16871 a!3154)))))

(assert (=> d!82097 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216) e!314743)))

(assert (= (and d!82097 (not res!338630)) b!544345))

(assert (= (and b!544345 c!63177) b!544344))

(assert (= (and b!544345 (not c!63177)) b!544346))

(assert (= (and b!544344 res!338631) b!544343))

(assert (= (or b!544343 b!544346) bm!32089))

(declare-fun m!522385 () Bool)

(assert (=> b!544344 m!522385))

(declare-fun m!522387 () Bool)

(assert (=> b!544344 m!522387))

(declare-fun m!522389 () Bool)

(assert (=> b!544344 m!522389))

(assert (=> b!544344 m!522385))

(declare-fun m!522391 () Bool)

(assert (=> b!544344 m!522391))

(assert (=> b!544345 m!522385))

(assert (=> b!544345 m!522385))

(declare-fun m!522393 () Bool)

(assert (=> b!544345 m!522393))

(declare-fun m!522395 () Bool)

(assert (=> bm!32089 m!522395))

(assert (=> bm!32085 d!82097))

(declare-fun d!82099 () Bool)

(assert (=> d!82099 (= (validKeyInArray!0 (select (arr!16507 a!3154) #b00000000000000000000000000000000)) (and (not (= (select (arr!16507 a!3154) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16507 a!3154) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544287 d!82099))

(assert (=> d!82027 d!82037))

(declare-fun d!82101 () Bool)

(declare-fun res!338634 () (_ BitVec 32))

(assert (=> d!82101 (and (bvsge res!338634 #b00000000000000000000000000000000) (bvslt res!338634 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82101 true))

(assert (=> d!82101 (= (choose!52 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) res!338634)))

(assert (=> d!82069 d!82101))

(assert (=> d!82069 d!82037))

(declare-fun d!82103 () Bool)

(assert (=> d!82103 (arrayContainsKey!0 a!3154 lt!248449 #b00000000000000000000000000000000)))

(declare-fun lt!248500 () Unit!16881)

(declare-fun choose!13 (array!34352 (_ BitVec 64) (_ BitVec 32)) Unit!16881)

(assert (=> d!82103 (= lt!248500 (choose!13 a!3154 lt!248449 #b00000000000000000000000000000000))))

(assert (=> d!82103 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!82103 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248449 #b00000000000000000000000000000000) lt!248500)))

(declare-fun bs!16994 () Bool)

(assert (= bs!16994 d!82103))

(assert (=> bs!16994 m!522333))

(declare-fun m!522397 () Bool)

(assert (=> bs!16994 m!522397))

(assert (=> b!544286 d!82103))

(declare-fun d!82105 () Bool)

(declare-fun res!338635 () Bool)

(declare-fun e!314746 () Bool)

(assert (=> d!82105 (=> res!338635 e!314746)))

(assert (=> d!82105 (= res!338635 (= (select (arr!16507 a!3154) #b00000000000000000000000000000000) lt!248449))))

(assert (=> d!82105 (= (arrayContainsKey!0 a!3154 lt!248449 #b00000000000000000000000000000000) e!314746)))

(declare-fun b!544347 () Bool)

(declare-fun e!314747 () Bool)

(assert (=> b!544347 (= e!314746 e!314747)))

(declare-fun res!338636 () Bool)

(assert (=> b!544347 (=> (not res!338636) (not e!314747))))

(assert (=> b!544347 (= res!338636 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16871 a!3154)))))

(declare-fun b!544348 () Bool)

(assert (=> b!544348 (= e!314747 (arrayContainsKey!0 a!3154 lt!248449 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82105 (not res!338635)) b!544347))

(assert (= (and b!544347 res!338636) b!544348))

(assert (=> d!82105 m!522241))

(declare-fun m!522399 () Bool)

(assert (=> b!544348 m!522399))

(assert (=> b!544286 d!82105))

(declare-fun b!544349 () Bool)

(declare-fun e!314750 () SeekEntryResult!4921)

(declare-fun lt!248502 () SeekEntryResult!4921)

(assert (=> b!544349 (= e!314750 (MissingZero!4921 (index!21910 lt!248502)))))

(declare-fun b!544350 () Bool)

(declare-fun c!63179 () Bool)

(declare-fun lt!248503 () (_ BitVec 64))

(assert (=> b!544350 (= c!63179 (= lt!248503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314748 () SeekEntryResult!4921)

(assert (=> b!544350 (= e!314748 e!314750)))

(declare-fun b!544351 () Bool)

(assert (=> b!544351 (= e!314748 (Found!4921 (index!21910 lt!248502)))))

(declare-fun b!544352 () Bool)

(declare-fun e!314749 () SeekEntryResult!4921)

(assert (=> b!544352 (= e!314749 Undefined!4921)))

(declare-fun b!544353 () Bool)

(assert (=> b!544353 (= e!314750 (seekKeyOrZeroReturnVacant!0 (x!50963 lt!248502) (index!21910 lt!248502) (index!21910 lt!248502) (select (arr!16507 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(declare-fun d!82107 () Bool)

(declare-fun lt!248501 () SeekEntryResult!4921)

(assert (=> d!82107 (and (or ((_ is Undefined!4921) lt!248501) (not ((_ is Found!4921) lt!248501)) (and (bvsge (index!21909 lt!248501) #b00000000000000000000000000000000) (bvslt (index!21909 lt!248501) (size!16871 a!3154)))) (or ((_ is Undefined!4921) lt!248501) ((_ is Found!4921) lt!248501) (not ((_ is MissingZero!4921) lt!248501)) (and (bvsge (index!21908 lt!248501) #b00000000000000000000000000000000) (bvslt (index!21908 lt!248501) (size!16871 a!3154)))) (or ((_ is Undefined!4921) lt!248501) ((_ is Found!4921) lt!248501) ((_ is MissingZero!4921) lt!248501) (not ((_ is MissingVacant!4921) lt!248501)) (and (bvsge (index!21911 lt!248501) #b00000000000000000000000000000000) (bvslt (index!21911 lt!248501) (size!16871 a!3154)))) (or ((_ is Undefined!4921) lt!248501) (ite ((_ is Found!4921) lt!248501) (= (select (arr!16507 a!3154) (index!21909 lt!248501)) (select (arr!16507 a!3154) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!4921) lt!248501) (= (select (arr!16507 a!3154) (index!21908 lt!248501)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4921) lt!248501) (= (select (arr!16507 a!3154) (index!21911 lt!248501)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82107 (= lt!248501 e!314749)))

(declare-fun c!63178 () Bool)

(assert (=> d!82107 (= c!63178 (and ((_ is Intermediate!4921) lt!248502) (undefined!5733 lt!248502)))))

(assert (=> d!82107 (= lt!248502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16507 a!3154) #b00000000000000000000000000000000) mask!3216) (select (arr!16507 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(assert (=> d!82107 (validMask!0 mask!3216)))

(assert (=> d!82107 (= (seekEntryOrOpen!0 (select (arr!16507 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) lt!248501)))

(declare-fun b!544354 () Bool)

(assert (=> b!544354 (= e!314749 e!314748)))

(assert (=> b!544354 (= lt!248503 (select (arr!16507 a!3154) (index!21910 lt!248502)))))

(declare-fun c!63180 () Bool)

(assert (=> b!544354 (= c!63180 (= lt!248503 (select (arr!16507 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82107 c!63178) b!544352))

(assert (= (and d!82107 (not c!63178)) b!544354))

(assert (= (and b!544354 c!63180) b!544351))

(assert (= (and b!544354 (not c!63180)) b!544350))

(assert (= (and b!544350 c!63179) b!544349))

(assert (= (and b!544350 (not c!63179)) b!544353))

(assert (=> b!544353 m!522241))

(declare-fun m!522401 () Bool)

(assert (=> b!544353 m!522401))

(assert (=> d!82107 m!522155))

(declare-fun m!522403 () Bool)

(assert (=> d!82107 m!522403))

(assert (=> d!82107 m!522241))

(declare-fun m!522405 () Bool)

(assert (=> d!82107 m!522405))

(assert (=> d!82107 m!522405))

(assert (=> d!82107 m!522241))

(declare-fun m!522407 () Bool)

(assert (=> d!82107 m!522407))

(declare-fun m!522409 () Bool)

(assert (=> d!82107 m!522409))

(declare-fun m!522411 () Bool)

(assert (=> d!82107 m!522411))

(declare-fun m!522413 () Bool)

(assert (=> b!544354 m!522413))

(assert (=> b!544286 d!82107))

(declare-fun b!544367 () Bool)

(declare-fun e!314759 () SeekEntryResult!4921)

(declare-fun e!314758 () SeekEntryResult!4921)

(assert (=> b!544367 (= e!314759 e!314758)))

(declare-fun c!63187 () Bool)

(declare-fun lt!248508 () (_ BitVec 64))

(assert (=> b!544367 (= c!63187 (= lt!248508 k0!1998))))

(declare-fun b!544368 () Bool)

(declare-fun c!63188 () Bool)

(assert (=> b!544368 (= c!63188 (= lt!248508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314757 () SeekEntryResult!4921)

(assert (=> b!544368 (= e!314758 e!314757)))

(declare-fun b!544369 () Bool)

(assert (=> b!544369 (= e!314759 Undefined!4921)))

(declare-fun b!544370 () Bool)

(assert (=> b!544370 (= e!314757 (MissingVacant!4921 (index!21910 lt!248438)))))

(declare-fun d!82109 () Bool)

(declare-fun lt!248509 () SeekEntryResult!4921)

(assert (=> d!82109 (and (or ((_ is Undefined!4921) lt!248509) (not ((_ is Found!4921) lt!248509)) (and (bvsge (index!21909 lt!248509) #b00000000000000000000000000000000) (bvslt (index!21909 lt!248509) (size!16871 a!3154)))) (or ((_ is Undefined!4921) lt!248509) ((_ is Found!4921) lt!248509) (not ((_ is MissingVacant!4921) lt!248509)) (not (= (index!21911 lt!248509) (index!21910 lt!248438))) (and (bvsge (index!21911 lt!248509) #b00000000000000000000000000000000) (bvslt (index!21911 lt!248509) (size!16871 a!3154)))) (or ((_ is Undefined!4921) lt!248509) (ite ((_ is Found!4921) lt!248509) (= (select (arr!16507 a!3154) (index!21909 lt!248509)) k0!1998) (and ((_ is MissingVacant!4921) lt!248509) (= (index!21911 lt!248509) (index!21910 lt!248438)) (= (select (arr!16507 a!3154) (index!21911 lt!248509)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!82109 (= lt!248509 e!314759)))

(declare-fun c!63189 () Bool)

(assert (=> d!82109 (= c!63189 (bvsge (x!50963 lt!248438) #b01111111111111111111111111111110))))

(assert (=> d!82109 (= lt!248508 (select (arr!16507 a!3154) (index!21910 lt!248438)))))

(assert (=> d!82109 (validMask!0 mask!3216)))

(assert (=> d!82109 (= (seekKeyOrZeroReturnVacant!0 (x!50963 lt!248438) (index!21910 lt!248438) (index!21910 lt!248438) k0!1998 a!3154 mask!3216) lt!248509)))

(declare-fun b!544371 () Bool)

(assert (=> b!544371 (= e!314758 (Found!4921 (index!21910 lt!248438)))))

(declare-fun b!544372 () Bool)

(assert (=> b!544372 (= e!314757 (seekKeyOrZeroReturnVacant!0 (bvadd (x!50963 lt!248438) #b00000000000000000000000000000001) (nextIndex!0 (index!21910 lt!248438) (bvadd (x!50963 lt!248438) #b00000000000000000000000000000001) mask!3216) (index!21910 lt!248438) k0!1998 a!3154 mask!3216))))

(assert (= (and d!82109 c!63189) b!544369))

(assert (= (and d!82109 (not c!63189)) b!544367))

(assert (= (and b!544367 c!63187) b!544371))

(assert (= (and b!544367 (not c!63187)) b!544368))

(assert (= (and b!544368 c!63188) b!544370))

(assert (= (and b!544368 (not c!63188)) b!544372))

(declare-fun m!522415 () Bool)

(assert (=> d!82109 m!522415))

(declare-fun m!522417 () Bool)

(assert (=> d!82109 m!522417))

(assert (=> d!82109 m!522315))

(assert (=> d!82109 m!522155))

(declare-fun m!522419 () Bool)

(assert (=> b!544372 m!522419))

(assert (=> b!544372 m!522419))

(declare-fun m!522421 () Bool)

(assert (=> b!544372 m!522421))

(assert (=> b!544269 d!82109))

(declare-fun e!314764 () SeekEntryResult!4921)

(declare-fun b!544373 () Bool)

(assert (=> b!544373 (= e!314764 (Intermediate!4921 false (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun d!82113 () Bool)

(declare-fun e!314761 () Bool)

(assert (=> d!82113 e!314761))

(declare-fun c!63190 () Bool)

(declare-fun lt!248511 () SeekEntryResult!4921)

(assert (=> d!82113 (= c!63190 (and ((_ is Intermediate!4921) lt!248511) (undefined!5733 lt!248511)))))

(declare-fun e!314760 () SeekEntryResult!4921)

(assert (=> d!82113 (= lt!248511 e!314760)))

(declare-fun c!63192 () Bool)

(assert (=> d!82113 (= c!63192 (bvsge (bvadd x!1030 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!248510 () (_ BitVec 64))

(assert (=> d!82113 (= lt!248510 (select (arr!16507 a!3154) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216)))))

(assert (=> d!82113 (validMask!0 mask!3216)))

(assert (=> d!82113 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216) lt!248511)))

(declare-fun b!544374 () Bool)

(assert (=> b!544374 (= e!314761 (bvsge (x!50963 lt!248511) #b01111111111111111111111111111110))))

(declare-fun b!544375 () Bool)

(assert (=> b!544375 (= e!314760 e!314764)))

(declare-fun c!63191 () Bool)

(assert (=> b!544375 (= c!63191 (or (= lt!248510 (select (arr!16507 a!3154) j!147)) (= (bvadd lt!248510 lt!248510) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544376 () Bool)

(assert (=> b!544376 (and (bvsge (index!21910 lt!248511) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248511) (size!16871 a!3154)))))

(declare-fun res!338639 () Bool)

(assert (=> b!544376 (= res!338639 (= (select (arr!16507 a!3154) (index!21910 lt!248511)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314763 () Bool)

(assert (=> b!544376 (=> res!338639 e!314763)))

(declare-fun b!544377 () Bool)

(declare-fun e!314762 () Bool)

(assert (=> b!544377 (= e!314761 e!314762)))

(declare-fun res!338637 () Bool)

(assert (=> b!544377 (= res!338637 (and ((_ is Intermediate!4921) lt!248511) (not (undefined!5733 lt!248511)) (bvslt (x!50963 lt!248511) #b01111111111111111111111111111110) (bvsge (x!50963 lt!248511) #b00000000000000000000000000000000) (bvsge (x!50963 lt!248511) (bvadd x!1030 #b00000000000000000000000000000001))))))

(assert (=> b!544377 (=> (not res!338637) (not e!314762))))

(declare-fun b!544378 () Bool)

(assert (=> b!544378 (and (bvsge (index!21910 lt!248511) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248511) (size!16871 a!3154)))))

(assert (=> b!544378 (= e!314763 (= (select (arr!16507 a!3154) (index!21910 lt!248511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544379 () Bool)

(assert (=> b!544379 (= e!314760 (Intermediate!4921 true (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun b!544380 () Bool)

(assert (=> b!544380 (= e!314764 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (bvadd x!1030 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544381 () Bool)

(assert (=> b!544381 (and (bvsge (index!21910 lt!248511) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248511) (size!16871 a!3154)))))

(declare-fun res!338638 () Bool)

(assert (=> b!544381 (= res!338638 (= (select (arr!16507 a!3154) (index!21910 lt!248511)) (select (arr!16507 a!3154) j!147)))))

(assert (=> b!544381 (=> res!338638 e!314763)))

(assert (=> b!544381 (= e!314762 e!314763)))

(assert (= (and d!82113 c!63192) b!544379))

(assert (= (and d!82113 (not c!63192)) b!544375))

(assert (= (and b!544375 c!63191) b!544373))

(assert (= (and b!544375 (not c!63191)) b!544380))

(assert (= (and d!82113 c!63190) b!544374))

(assert (= (and d!82113 (not c!63190)) b!544377))

(assert (= (and b!544377 res!338637) b!544381))

(assert (= (and b!544381 (not res!338638)) b!544376))

(assert (= (and b!544376 (not res!338639)) b!544378))

(assert (=> b!544380 m!522253))

(declare-fun m!522423 () Bool)

(assert (=> b!544380 m!522423))

(assert (=> b!544380 m!522423))

(assert (=> b!544380 m!522151))

(declare-fun m!522425 () Bool)

(assert (=> b!544380 m!522425))

(declare-fun m!522427 () Bool)

(assert (=> b!544378 m!522427))

(assert (=> b!544381 m!522427))

(assert (=> b!544376 m!522427))

(assert (=> d!82113 m!522253))

(declare-fun m!522429 () Bool)

(assert (=> d!82113 m!522429))

(assert (=> d!82113 m!522155))

(assert (=> b!544128 d!82113))

(declare-fun d!82115 () Bool)

(declare-fun lt!248512 () (_ BitVec 32))

(assert (=> d!82115 (and (bvsge lt!248512 #b00000000000000000000000000000000) (bvslt lt!248512 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82115 (= lt!248512 (choose!52 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216))))

(assert (=> d!82115 (validMask!0 mask!3216)))

(assert (=> d!82115 (= (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) lt!248512)))

(declare-fun bs!16995 () Bool)

(assert (= bs!16995 d!82115))

(declare-fun m!522431 () Bool)

(assert (=> bs!16995 m!522431))

(assert (=> bs!16995 m!522155))

(assert (=> b!544128 d!82115))

(declare-fun d!82117 () Bool)

(declare-fun lt!248519 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!225 (List!10533) (InoxSet (_ BitVec 64)))

(assert (=> d!82117 (= lt!248519 (select (content!225 Nil!10530) (select (arr!16507 a!3154) #b00000000000000000000000000000000)))))

(declare-fun e!314775 () Bool)

(assert (=> d!82117 (= lt!248519 e!314775)))

(declare-fun res!338644 () Bool)

(assert (=> d!82117 (=> (not res!338644) (not e!314775))))

(assert (=> d!82117 (= res!338644 ((_ is Cons!10529) Nil!10530))))

(assert (=> d!82117 (= (contains!2784 Nil!10530 (select (arr!16507 a!3154) #b00000000000000000000000000000000)) lt!248519)))

(declare-fun b!544398 () Bool)

(declare-fun e!314776 () Bool)

(assert (=> b!544398 (= e!314775 e!314776)))

(declare-fun res!338645 () Bool)

(assert (=> b!544398 (=> res!338645 e!314776)))

(assert (=> b!544398 (= res!338645 (= (h!11487 Nil!10530) (select (arr!16507 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544399 () Bool)

(assert (=> b!544399 (= e!314776 (contains!2784 (t!16753 Nil!10530) (select (arr!16507 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82117 res!338644) b!544398))

(assert (= (and b!544398 (not res!338645)) b!544399))

(declare-fun m!522433 () Bool)

(assert (=> d!82117 m!522433))

(assert (=> d!82117 m!522241))

(declare-fun m!522435 () Bool)

(assert (=> d!82117 m!522435))

(assert (=> b!544399 m!522241))

(declare-fun m!522437 () Bool)

(assert (=> b!544399 m!522437))

(assert (=> b!544207 d!82117))

(declare-fun b!544400 () Bool)

(declare-fun e!314777 () Bool)

(declare-fun e!314780 () Bool)

(assert (=> b!544400 (= e!314777 e!314780)))

(declare-fun res!338646 () Bool)

(assert (=> b!544400 (=> (not res!338646) (not e!314780))))

(declare-fun e!314779 () Bool)

(assert (=> b!544400 (= res!338646 (not e!314779))))

(declare-fun res!338648 () Bool)

(assert (=> b!544400 (=> (not res!338648) (not e!314779))))

(assert (=> b!544400 (= res!338648 (validKeyInArray!0 (select (arr!16507 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544401 () Bool)

(declare-fun e!314778 () Bool)

(declare-fun call!32093 () Bool)

(assert (=> b!544401 (= e!314778 call!32093)))

(declare-fun b!544402 () Bool)

(assert (=> b!544402 (= e!314780 e!314778)))

(declare-fun c!63199 () Bool)

(assert (=> b!544402 (= c!63199 (validKeyInArray!0 (select (arr!16507 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!82119 () Bool)

(declare-fun res!338647 () Bool)

(assert (=> d!82119 (=> res!338647 e!314777)))

(assert (=> d!82119 (= res!338647 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16871 a!3154)))))

(assert (=> d!82119 (= (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63130 (Cons!10529 (select (arr!16507 a!3154) #b00000000000000000000000000000000) Nil!10530) Nil!10530)) e!314777)))

(declare-fun bm!32090 () Bool)

(assert (=> bm!32090 (= call!32093 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!63199 (Cons!10529 (select (arr!16507 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!63130 (Cons!10529 (select (arr!16507 a!3154) #b00000000000000000000000000000000) Nil!10530) Nil!10530)) (ite c!63130 (Cons!10529 (select (arr!16507 a!3154) #b00000000000000000000000000000000) Nil!10530) Nil!10530))))))

(declare-fun b!544403 () Bool)

(assert (=> b!544403 (= e!314779 (contains!2784 (ite c!63130 (Cons!10529 (select (arr!16507 a!3154) #b00000000000000000000000000000000) Nil!10530) Nil!10530) (select (arr!16507 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544404 () Bool)

(assert (=> b!544404 (= e!314778 call!32093)))

(assert (= (and d!82119 (not res!338647)) b!544400))

(assert (= (and b!544400 res!338648) b!544403))

(assert (= (and b!544400 res!338646) b!544402))

(assert (= (and b!544402 c!63199) b!544401))

(assert (= (and b!544402 (not c!63199)) b!544404))

(assert (= (or b!544401 b!544404) bm!32090))

(assert (=> b!544400 m!522385))

(assert (=> b!544400 m!522385))

(assert (=> b!544400 m!522393))

(assert (=> b!544402 m!522385))

(assert (=> b!544402 m!522385))

(assert (=> b!544402 m!522393))

(assert (=> bm!32090 m!522385))

(declare-fun m!522439 () Bool)

(assert (=> bm!32090 m!522439))

(assert (=> b!544403 m!522385))

(assert (=> b!544403 m!522385))

(declare-fun m!522441 () Bool)

(assert (=> b!544403 m!522441))

(assert (=> bm!32078 d!82119))

(assert (=> d!82075 d!82037))

(declare-fun b!544405 () Bool)

(declare-fun e!314785 () SeekEntryResult!4921)

(assert (=> b!544405 (= e!314785 (Intermediate!4921 false (nextIndex!0 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun d!82121 () Bool)

(declare-fun e!314782 () Bool)

(assert (=> d!82121 e!314782))

(declare-fun c!63200 () Bool)

(declare-fun lt!248521 () SeekEntryResult!4921)

(assert (=> d!82121 (= c!63200 (and ((_ is Intermediate!4921) lt!248521) (undefined!5733 lt!248521)))))

(declare-fun e!314781 () SeekEntryResult!4921)

(assert (=> d!82121 (= lt!248521 e!314781)))

(declare-fun c!63202 () Bool)

(assert (=> d!82121 (= c!63202 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!248520 () (_ BitVec 64))

(assert (=> d!82121 (= lt!248520 (select (arr!16507 a!3154) (nextIndex!0 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216)))))

(assert (=> d!82121 (validMask!0 mask!3216)))

(assert (=> d!82121 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216) lt!248521)))

(declare-fun b!544406 () Bool)

(assert (=> b!544406 (= e!314782 (bvsge (x!50963 lt!248521) #b01111111111111111111111111111110))))

(declare-fun b!544407 () Bool)

(assert (=> b!544407 (= e!314781 e!314785)))

(declare-fun c!63201 () Bool)

(assert (=> b!544407 (= c!63201 (or (= lt!248520 (select (arr!16507 a!3154) j!147)) (= (bvadd lt!248520 lt!248520) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544408 () Bool)

(assert (=> b!544408 (and (bvsge (index!21910 lt!248521) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248521) (size!16871 a!3154)))))

(declare-fun res!338651 () Bool)

(assert (=> b!544408 (= res!338651 (= (select (arr!16507 a!3154) (index!21910 lt!248521)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314784 () Bool)

(assert (=> b!544408 (=> res!338651 e!314784)))

(declare-fun b!544409 () Bool)

(declare-fun e!314783 () Bool)

(assert (=> b!544409 (= e!314782 e!314783)))

(declare-fun res!338649 () Bool)

(assert (=> b!544409 (= res!338649 (and ((_ is Intermediate!4921) lt!248521) (not (undefined!5733 lt!248521)) (bvslt (x!50963 lt!248521) #b01111111111111111111111111111110) (bvsge (x!50963 lt!248521) #b00000000000000000000000000000000) (bvsge (x!50963 lt!248521) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!544409 (=> (not res!338649) (not e!314783))))

(declare-fun b!544410 () Bool)

(assert (=> b!544410 (and (bvsge (index!21910 lt!248521) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248521) (size!16871 a!3154)))))

(assert (=> b!544410 (= e!314784 (= (select (arr!16507 a!3154) (index!21910 lt!248521)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544411 () Bool)

(assert (=> b!544411 (= e!314781 (Intermediate!4921 true (nextIndex!0 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!544412 () Bool)

(assert (=> b!544412 (= e!314785 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544413 () Bool)

(assert (=> b!544413 (and (bvsge (index!21910 lt!248521) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248521) (size!16871 a!3154)))))

(declare-fun res!338650 () Bool)

(assert (=> b!544413 (= res!338650 (= (select (arr!16507 a!3154) (index!21910 lt!248521)) (select (arr!16507 a!3154) j!147)))))

(assert (=> b!544413 (=> res!338650 e!314784)))

(assert (=> b!544413 (= e!314783 e!314784)))

(assert (= (and d!82121 c!63202) b!544411))

(assert (= (and d!82121 (not c!63202)) b!544407))

(assert (= (and b!544407 c!63201) b!544405))

(assert (= (and b!544407 (not c!63201)) b!544412))

(assert (= (and d!82121 c!63200) b!544406))

(assert (= (and d!82121 (not c!63200)) b!544409))

(assert (= (and b!544409 res!338649) b!544413))

(assert (= (and b!544413 (not res!338650)) b!544408))

(assert (= (and b!544408 (not res!338651)) b!544410))

(assert (=> b!544412 m!522341))

(declare-fun m!522443 () Bool)

(assert (=> b!544412 m!522443))

(assert (=> b!544412 m!522443))

(assert (=> b!544412 m!522151))

(declare-fun m!522445 () Bool)

(assert (=> b!544412 m!522445))

(declare-fun m!522447 () Bool)

(assert (=> b!544410 m!522447))

(assert (=> b!544413 m!522447))

(assert (=> b!544408 m!522447))

(assert (=> d!82121 m!522341))

(declare-fun m!522449 () Bool)

(assert (=> d!82121 m!522449))

(assert (=> d!82121 m!522155))

(assert (=> b!544308 d!82121))

(declare-fun d!82123 () Bool)

(declare-fun lt!248522 () (_ BitVec 32))

(assert (=> d!82123 (and (bvsge lt!248522 #b00000000000000000000000000000000) (bvslt lt!248522 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82123 (= lt!248522 (choose!52 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216))))

(assert (=> d!82123 (validMask!0 mask!3216)))

(assert (=> d!82123 (= (nextIndex!0 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) lt!248522)))

(declare-fun bs!16996 () Bool)

(assert (= bs!16996 d!82123))

(assert (=> bs!16996 m!522169))

(declare-fun m!522451 () Bool)

(assert (=> bs!16996 m!522451))

(assert (=> bs!16996 m!522155))

(assert (=> b!544308 d!82123))

(assert (=> b!544206 d!82099))

(declare-fun d!82125 () Bool)

(declare-fun res!338652 () Bool)

(declare-fun e!314789 () Bool)

(assert (=> d!82125 (=> res!338652 e!314789)))

(assert (=> d!82125 (= res!338652 (= (select (arr!16507 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1998))))

(assert (=> d!82125 (= (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!314789)))

(declare-fun b!544420 () Bool)

(declare-fun e!314790 () Bool)

(assert (=> b!544420 (= e!314789 e!314790)))

(declare-fun res!338653 () Bool)

(assert (=> b!544420 (=> (not res!338653) (not e!314790))))

(assert (=> b!544420 (= res!338653 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!16871 a!3154)))))

(declare-fun b!544421 () Bool)

(assert (=> b!544421 (= e!314790 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!82125 (not res!338652)) b!544420))

(assert (= (and b!544420 res!338653) b!544421))

(assert (=> d!82125 m!522385))

(declare-fun m!522453 () Bool)

(assert (=> b!544421 m!522453))

(assert (=> b!544087 d!82125))

(assert (=> b!544204 d!82099))

(declare-fun b!544422 () Bool)

(declare-fun e!314795 () SeekEntryResult!4921)

(assert (=> b!544422 (= e!314795 (Intermediate!4921 false (toIndex!0 k0!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun d!82127 () Bool)

(declare-fun e!314792 () Bool)

(assert (=> d!82127 e!314792))

(declare-fun c!63206 () Bool)

(declare-fun lt!248526 () SeekEntryResult!4921)

(assert (=> d!82127 (= c!63206 (and ((_ is Intermediate!4921) lt!248526) (undefined!5733 lt!248526)))))

(declare-fun e!314791 () SeekEntryResult!4921)

(assert (=> d!82127 (= lt!248526 e!314791)))

(declare-fun c!63208 () Bool)

(assert (=> d!82127 (= c!63208 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248525 () (_ BitVec 64))

(assert (=> d!82127 (= lt!248525 (select (arr!16507 a!3154) (toIndex!0 k0!1998 mask!3216)))))

(assert (=> d!82127 (validMask!0 mask!3216)))

(assert (=> d!82127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216) lt!248526)))

(declare-fun b!544423 () Bool)

(assert (=> b!544423 (= e!314792 (bvsge (x!50963 lt!248526) #b01111111111111111111111111111110))))

(declare-fun b!544424 () Bool)

(assert (=> b!544424 (= e!314791 e!314795)))

(declare-fun c!63207 () Bool)

(assert (=> b!544424 (= c!63207 (or (= lt!248525 k0!1998) (= (bvadd lt!248525 lt!248525) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544425 () Bool)

(assert (=> b!544425 (and (bvsge (index!21910 lt!248526) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248526) (size!16871 a!3154)))))

(declare-fun res!338656 () Bool)

(assert (=> b!544425 (= res!338656 (= (select (arr!16507 a!3154) (index!21910 lt!248526)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314794 () Bool)

(assert (=> b!544425 (=> res!338656 e!314794)))

(declare-fun b!544426 () Bool)

(declare-fun e!314793 () Bool)

(assert (=> b!544426 (= e!314792 e!314793)))

(declare-fun res!338654 () Bool)

(assert (=> b!544426 (= res!338654 (and ((_ is Intermediate!4921) lt!248526) (not (undefined!5733 lt!248526)) (bvslt (x!50963 lt!248526) #b01111111111111111111111111111110) (bvsge (x!50963 lt!248526) #b00000000000000000000000000000000) (bvsge (x!50963 lt!248526) #b00000000000000000000000000000000)))))

(assert (=> b!544426 (=> (not res!338654) (not e!314793))))

(declare-fun b!544427 () Bool)

(assert (=> b!544427 (and (bvsge (index!21910 lt!248526) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248526) (size!16871 a!3154)))))

(assert (=> b!544427 (= e!314794 (= (select (arr!16507 a!3154) (index!21910 lt!248526)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544428 () Bool)

(assert (=> b!544428 (= e!314791 (Intermediate!4921 true (toIndex!0 k0!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544429 () Bool)

(assert (=> b!544429 (= e!314795 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!1998 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) k0!1998 a!3154 mask!3216))))

(declare-fun b!544430 () Bool)

(assert (=> b!544430 (and (bvsge (index!21910 lt!248526) #b00000000000000000000000000000000) (bvslt (index!21910 lt!248526) (size!16871 a!3154)))))

(declare-fun res!338655 () Bool)

(assert (=> b!544430 (= res!338655 (= (select (arr!16507 a!3154) (index!21910 lt!248526)) k0!1998))))

(assert (=> b!544430 (=> res!338655 e!314794)))

(assert (=> b!544430 (= e!314793 e!314794)))

(assert (= (and d!82127 c!63208) b!544428))

(assert (= (and d!82127 (not c!63208)) b!544424))

(assert (= (and b!544424 c!63207) b!544422))

(assert (= (and b!544424 (not c!63207)) b!544429))

(assert (= (and d!82127 c!63206) b!544423))

(assert (= (and d!82127 (not c!63206)) b!544426))

(assert (= (and b!544426 res!338654) b!544430))

(assert (= (and b!544430 (not res!338655)) b!544425))

(assert (= (and b!544425 (not res!338656)) b!544427))

(assert (=> b!544429 m!522307))

(declare-fun m!522463 () Bool)

(assert (=> b!544429 m!522463))

(assert (=> b!544429 m!522463))

(declare-fun m!522465 () Bool)

(assert (=> b!544429 m!522465))

(declare-fun m!522467 () Bool)

(assert (=> b!544427 m!522467))

(assert (=> b!544430 m!522467))

(assert (=> b!544425 m!522467))

(assert (=> d!82127 m!522307))

(declare-fun m!522469 () Bool)

(assert (=> d!82127 m!522469))

(assert (=> d!82127 m!522155))

(assert (=> d!82051 d!82127))

(declare-fun d!82133 () Bool)

(declare-fun lt!248528 () (_ BitVec 32))

(declare-fun lt!248527 () (_ BitVec 32))

(assert (=> d!82133 (= lt!248528 (bvmul (bvxor lt!248527 (bvlshr lt!248527 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82133 (= lt!248527 ((_ extract 31 0) (bvand (bvxor k0!1998 (bvlshr k0!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82133 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338613 (let ((h!11491 ((_ extract 31 0) (bvand (bvxor k0!1998 (bvlshr k0!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50971 (bvmul (bvxor h!11491 (bvlshr h!11491 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50971 (bvlshr x!50971 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338613 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338613 #b00000000000000000000000000000000))))))

(assert (=> d!82133 (= (toIndex!0 k0!1998 mask!3216) (bvand (bvxor lt!248528 (bvlshr lt!248528 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> d!82051 d!82133))

(assert (=> d!82051 d!82037))

(check-sat (not d!82103) (not bm!32090) (not b!544372) (not b!544348) (not b!544399) (not d!82107) (not b!544402) (not d!82117) (not d!82113) (not d!82109) (not b!544345) (not b!544421) (not b!544400) (not d!82121) (not d!82123) (not b!544403) (not bm!32089) (not b!544344) (not b!544353) (not d!82127) (not b!544412) (not d!82115) (not b!544380) (not b!544429))
(check-sat)
