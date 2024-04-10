; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49448 () Bool)

(assert start!49448)

(declare-fun b!544521 () Bool)

(declare-fun res!338793 () Bool)

(declare-fun e!314805 () Bool)

(assert (=> b!544521 (=> (not res!338793) (not e!314805))))

(declare-datatypes ((array!34375 0))(
  ( (array!34376 (arr!16519 (Array (_ BitVec 32) (_ BitVec 64))) (size!16883 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34375)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544521 (= res!338793 (validKeyInArray!0 (select (arr!16519 a!3154) j!147)))))

(declare-fun b!544522 () Bool)

(declare-fun res!338794 () Bool)

(declare-fun e!314803 () Bool)

(assert (=> b!544522 (=> (not res!338794) (not e!314803))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34375 (_ BitVec 32)) Bool)

(assert (=> b!544522 (= res!338794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544523 () Bool)

(declare-fun e!314804 () Bool)

(assert (=> b!544523 (= e!314803 e!314804)))

(declare-fun res!338790 () Bool)

(assert (=> b!544523 (=> (not res!338790) (not e!314804))))

(declare-datatypes ((SeekEntryResult!4977 0))(
  ( (MissingZero!4977 (index!22132 (_ BitVec 32))) (Found!4977 (index!22133 (_ BitVec 32))) (Intermediate!4977 (undefined!5789 Bool) (index!22134 (_ BitVec 32)) (x!51047 (_ BitVec 32))) (Undefined!4977) (MissingVacant!4977 (index!22135 (_ BitVec 32))) )
))
(declare-fun lt!248511 () SeekEntryResult!4977)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544523 (= res!338790 (= lt!248511 (Intermediate!4977 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34375 (_ BitVec 32)) SeekEntryResult!4977)

(assert (=> b!544523 (= lt!248511 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16519 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544524 () Bool)

(declare-fun res!338784 () Bool)

(assert (=> b!544524 (=> (not res!338784) (not e!314805))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544524 (= res!338784 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544525 () Bool)

(declare-fun res!338787 () Bool)

(assert (=> b!544525 (=> (not res!338787) (not e!314805))))

(assert (=> b!544525 (= res!338787 (validKeyInArray!0 k0!1998))))

(declare-fun b!544526 () Bool)

(declare-fun lt!248510 () (_ BitVec 32))

(assert (=> b!544526 (= e!314804 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (or (bvslt lt!248510 #b00000000000000000000000000000000) (bvsge lt!248510 (size!16883 a!3154)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544526 (= lt!248510 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544527 () Bool)

(declare-fun res!338792 () Bool)

(assert (=> b!544527 (=> (not res!338792) (not e!314803))))

(assert (=> b!544527 (= res!338792 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16883 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16883 a!3154)) (= (select (arr!16519 a!3154) resIndex!32) (select (arr!16519 a!3154) j!147))))))

(declare-fun b!544528 () Bool)

(assert (=> b!544528 (= e!314805 e!314803)))

(declare-fun res!338785 () Bool)

(assert (=> b!544528 (=> (not res!338785) (not e!314803))))

(declare-fun lt!248512 () SeekEntryResult!4977)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544528 (= res!338785 (or (= lt!248512 (MissingZero!4977 i!1153)) (= lt!248512 (MissingVacant!4977 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34375 (_ BitVec 32)) SeekEntryResult!4977)

(assert (=> b!544528 (= lt!248512 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544529 () Bool)

(declare-fun res!338791 () Bool)

(assert (=> b!544529 (=> (not res!338791) (not e!314805))))

(assert (=> b!544529 (= res!338791 (and (= (size!16883 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16883 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16883 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544530 () Bool)

(declare-fun res!338795 () Bool)

(assert (=> b!544530 (=> (not res!338795) (not e!314803))))

(declare-datatypes ((List!10638 0))(
  ( (Nil!10635) (Cons!10634 (h!11592 (_ BitVec 64)) (t!16866 List!10638)) )
))
(declare-fun arrayNoDuplicates!0 (array!34375 (_ BitVec 32) List!10638) Bool)

(assert (=> b!544530 (= res!338795 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10635))))

(declare-fun b!544531 () Bool)

(declare-fun res!338786 () Bool)

(assert (=> b!544531 (=> (not res!338786) (not e!314804))))

(assert (=> b!544531 (= res!338786 (and (not (= (select (arr!16519 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16519 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16519 a!3154) index!1177) (select (arr!16519 a!3154) j!147)))))))

(declare-fun b!544532 () Bool)

(declare-fun res!338789 () Bool)

(assert (=> b!544532 (=> (not res!338789) (not e!314804))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544532 (= res!338789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16519 a!3154) j!147) mask!3216) (select (arr!16519 a!3154) j!147) a!3154 mask!3216) lt!248511))))

(declare-fun res!338788 () Bool)

(assert (=> start!49448 (=> (not res!338788) (not e!314805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49448 (= res!338788 (validMask!0 mask!3216))))

(assert (=> start!49448 e!314805))

(assert (=> start!49448 true))

(declare-fun array_inv!12315 (array!34375) Bool)

(assert (=> start!49448 (array_inv!12315 a!3154)))

(assert (= (and start!49448 res!338788) b!544529))

(assert (= (and b!544529 res!338791) b!544521))

(assert (= (and b!544521 res!338793) b!544525))

(assert (= (and b!544525 res!338787) b!544524))

(assert (= (and b!544524 res!338784) b!544528))

(assert (= (and b!544528 res!338785) b!544522))

(assert (= (and b!544522 res!338794) b!544530))

(assert (= (and b!544530 res!338795) b!544527))

(assert (= (and b!544527 res!338792) b!544523))

(assert (= (and b!544523 res!338790) b!544532))

(assert (= (and b!544532 res!338789) b!544531))

(assert (= (and b!544531 res!338786) b!544526))

(declare-fun m!522405 () Bool)

(assert (=> b!544526 m!522405))

(declare-fun m!522407 () Bool)

(assert (=> start!49448 m!522407))

(declare-fun m!522409 () Bool)

(assert (=> start!49448 m!522409))

(declare-fun m!522411 () Bool)

(assert (=> b!544531 m!522411))

(declare-fun m!522413 () Bool)

(assert (=> b!544531 m!522413))

(declare-fun m!522415 () Bool)

(assert (=> b!544522 m!522415))

(declare-fun m!522417 () Bool)

(assert (=> b!544528 m!522417))

(assert (=> b!544523 m!522413))

(assert (=> b!544523 m!522413))

(declare-fun m!522419 () Bool)

(assert (=> b!544523 m!522419))

(assert (=> b!544521 m!522413))

(assert (=> b!544521 m!522413))

(declare-fun m!522421 () Bool)

(assert (=> b!544521 m!522421))

(declare-fun m!522423 () Bool)

(assert (=> b!544530 m!522423))

(assert (=> b!544532 m!522413))

(assert (=> b!544532 m!522413))

(declare-fun m!522425 () Bool)

(assert (=> b!544532 m!522425))

(assert (=> b!544532 m!522425))

(assert (=> b!544532 m!522413))

(declare-fun m!522427 () Bool)

(assert (=> b!544532 m!522427))

(declare-fun m!522429 () Bool)

(assert (=> b!544525 m!522429))

(declare-fun m!522431 () Bool)

(assert (=> b!544527 m!522431))

(assert (=> b!544527 m!522413))

(declare-fun m!522433 () Bool)

(assert (=> b!544524 m!522433))

(check-sat (not b!544526) (not b!544530) (not b!544521) (not b!544522) (not b!544525) (not b!544532) (not start!49448) (not b!544528) (not b!544524) (not b!544523))
(check-sat)
(get-model)

(declare-fun b!544579 () Bool)

(declare-fun e!314828 () Bool)

(declare-fun e!314826 () Bool)

(assert (=> b!544579 (= e!314828 e!314826)))

(declare-fun c!63194 () Bool)

(assert (=> b!544579 (= c!63194 (validKeyInArray!0 (select (arr!16519 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544580 () Bool)

(declare-fun call!32096 () Bool)

(assert (=> b!544580 (= e!314826 call!32096)))

(declare-fun b!544581 () Bool)

(declare-fun e!314827 () Bool)

(declare-fun contains!2808 (List!10638 (_ BitVec 64)) Bool)

(assert (=> b!544581 (= e!314827 (contains!2808 Nil!10635 (select (arr!16519 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82089 () Bool)

(declare-fun res!338839 () Bool)

(declare-fun e!314829 () Bool)

(assert (=> d!82089 (=> res!338839 e!314829)))

(assert (=> d!82089 (= res!338839 (bvsge #b00000000000000000000000000000000 (size!16883 a!3154)))))

(assert (=> d!82089 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10635) e!314829)))

(declare-fun b!544582 () Bool)

(assert (=> b!544582 (= e!314826 call!32096)))

(declare-fun bm!32093 () Bool)

(assert (=> bm!32093 (= call!32096 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63194 (Cons!10634 (select (arr!16519 a!3154) #b00000000000000000000000000000000) Nil!10635) Nil!10635)))))

(declare-fun b!544583 () Bool)

(assert (=> b!544583 (= e!314829 e!314828)))

(declare-fun res!338840 () Bool)

(assert (=> b!544583 (=> (not res!338840) (not e!314828))))

(assert (=> b!544583 (= res!338840 (not e!314827))))

(declare-fun res!338838 () Bool)

(assert (=> b!544583 (=> (not res!338838) (not e!314827))))

(assert (=> b!544583 (= res!338838 (validKeyInArray!0 (select (arr!16519 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82089 (not res!338839)) b!544583))

(assert (= (and b!544583 res!338838) b!544581))

(assert (= (and b!544583 res!338840) b!544579))

(assert (= (and b!544579 c!63194) b!544580))

(assert (= (and b!544579 (not c!63194)) b!544582))

(assert (= (or b!544580 b!544582) bm!32093))

(declare-fun m!522465 () Bool)

(assert (=> b!544579 m!522465))

(assert (=> b!544579 m!522465))

(declare-fun m!522467 () Bool)

(assert (=> b!544579 m!522467))

(assert (=> b!544581 m!522465))

(assert (=> b!544581 m!522465))

(declare-fun m!522469 () Bool)

(assert (=> b!544581 m!522469))

(assert (=> bm!32093 m!522465))

(declare-fun m!522471 () Bool)

(assert (=> bm!32093 m!522471))

(assert (=> b!544583 m!522465))

(assert (=> b!544583 m!522465))

(assert (=> b!544583 m!522467))

(assert (=> b!544530 d!82089))

(declare-fun d!82091 () Bool)

(assert (=> d!82091 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49448 d!82091))

(declare-fun d!82093 () Bool)

(assert (=> d!82093 (= (array_inv!12315 a!3154) (bvsge (size!16883 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49448 d!82093))

(declare-fun d!82095 () Bool)

(assert (=> d!82095 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544525 d!82095))

(declare-fun b!544626 () Bool)

(declare-fun e!314855 () Bool)

(declare-fun lt!248542 () SeekEntryResult!4977)

(assert (=> b!544626 (= e!314855 (bvsge (x!51047 lt!248542) #b01111111111111111111111111111110))))

(declare-fun b!544627 () Bool)

(declare-fun e!314856 () SeekEntryResult!4977)

(assert (=> b!544627 (= e!314856 (Intermediate!4977 false index!1177 x!1030))))

(declare-fun b!544628 () Bool)

(declare-fun e!314858 () SeekEntryResult!4977)

(assert (=> b!544628 (= e!314858 (Intermediate!4977 true index!1177 x!1030))))

(declare-fun b!544629 () Bool)

(assert (=> b!544629 (and (bvsge (index!22134 lt!248542) #b00000000000000000000000000000000) (bvslt (index!22134 lt!248542) (size!16883 a!3154)))))

(declare-fun res!338854 () Bool)

(assert (=> b!544629 (= res!338854 (= (select (arr!16519 a!3154) (index!22134 lt!248542)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314857 () Bool)

(assert (=> b!544629 (=> res!338854 e!314857)))

(declare-fun d!82097 () Bool)

(assert (=> d!82097 e!314855))

(declare-fun c!63212 () Bool)

(get-info :version)

(assert (=> d!82097 (= c!63212 (and ((_ is Intermediate!4977) lt!248542) (undefined!5789 lt!248542)))))

(assert (=> d!82097 (= lt!248542 e!314858)))

(declare-fun c!63211 () Bool)

(assert (=> d!82097 (= c!63211 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!248541 () (_ BitVec 64))

(assert (=> d!82097 (= lt!248541 (select (arr!16519 a!3154) index!1177))))

(assert (=> d!82097 (validMask!0 mask!3216)))

(assert (=> d!82097 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16519 a!3154) j!147) a!3154 mask!3216) lt!248542)))

(declare-fun b!544630 () Bool)

(assert (=> b!544630 (and (bvsge (index!22134 lt!248542) #b00000000000000000000000000000000) (bvslt (index!22134 lt!248542) (size!16883 a!3154)))))

(assert (=> b!544630 (= e!314857 (= (select (arr!16519 a!3154) (index!22134 lt!248542)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544631 () Bool)

(declare-fun e!314859 () Bool)

(assert (=> b!544631 (= e!314855 e!314859)))

(declare-fun res!338855 () Bool)

(assert (=> b!544631 (= res!338855 (and ((_ is Intermediate!4977) lt!248542) (not (undefined!5789 lt!248542)) (bvslt (x!51047 lt!248542) #b01111111111111111111111111111110) (bvsge (x!51047 lt!248542) #b00000000000000000000000000000000) (bvsge (x!51047 lt!248542) x!1030)))))

(assert (=> b!544631 (=> (not res!338855) (not e!314859))))

(declare-fun b!544632 () Bool)

(assert (=> b!544632 (= e!314856 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16519 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544633 () Bool)

(assert (=> b!544633 (= e!314858 e!314856)))

(declare-fun c!63210 () Bool)

(assert (=> b!544633 (= c!63210 (or (= lt!248541 (select (arr!16519 a!3154) j!147)) (= (bvadd lt!248541 lt!248541) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544634 () Bool)

(assert (=> b!544634 (and (bvsge (index!22134 lt!248542) #b00000000000000000000000000000000) (bvslt (index!22134 lt!248542) (size!16883 a!3154)))))

(declare-fun res!338853 () Bool)

(assert (=> b!544634 (= res!338853 (= (select (arr!16519 a!3154) (index!22134 lt!248542)) (select (arr!16519 a!3154) j!147)))))

(assert (=> b!544634 (=> res!338853 e!314857)))

(assert (=> b!544634 (= e!314859 e!314857)))

(assert (= (and d!82097 c!63211) b!544628))

(assert (= (and d!82097 (not c!63211)) b!544633))

(assert (= (and b!544633 c!63210) b!544627))

(assert (= (and b!544633 (not c!63210)) b!544632))

(assert (= (and d!82097 c!63212) b!544626))

(assert (= (and d!82097 (not c!63212)) b!544631))

(assert (= (and b!544631 res!338855) b!544634))

(assert (= (and b!544634 (not res!338853)) b!544629))

(assert (= (and b!544629 (not res!338854)) b!544630))

(declare-fun m!522485 () Bool)

(assert (=> b!544630 m!522485))

(assert (=> b!544634 m!522485))

(assert (=> b!544629 m!522485))

(assert (=> d!82097 m!522411))

(assert (=> d!82097 m!522407))

(assert (=> b!544632 m!522405))

(assert (=> b!544632 m!522405))

(assert (=> b!544632 m!522413))

(declare-fun m!522487 () Bool)

(assert (=> b!544632 m!522487))

(assert (=> b!544523 d!82097))

(declare-fun d!82105 () Bool)

(declare-fun res!338866 () Bool)

(declare-fun e!314870 () Bool)

(assert (=> d!82105 (=> res!338866 e!314870)))

(assert (=> d!82105 (= res!338866 (= (select (arr!16519 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!82105 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!314870)))

(declare-fun b!544645 () Bool)

(declare-fun e!314871 () Bool)

(assert (=> b!544645 (= e!314870 e!314871)))

(declare-fun res!338867 () Bool)

(assert (=> b!544645 (=> (not res!338867) (not e!314871))))

(assert (=> b!544645 (= res!338867 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16883 a!3154)))))

(declare-fun b!544646 () Bool)

(assert (=> b!544646 (= e!314871 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82105 (not res!338866)) b!544645))

(assert (= (and b!544645 res!338867) b!544646))

(assert (=> d!82105 m!522465))

(declare-fun m!522491 () Bool)

(assert (=> b!544646 m!522491))

(assert (=> b!544524 d!82105))

(declare-fun bm!32099 () Bool)

(declare-fun call!32102 () Bool)

(assert (=> bm!32099 (= call!32102 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!544661 () Bool)

(declare-fun e!314882 () Bool)

(declare-fun e!314881 () Bool)

(assert (=> b!544661 (= e!314882 e!314881)))

(declare-fun lt!248553 () (_ BitVec 64))

(assert (=> b!544661 (= lt!248553 (select (arr!16519 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16910 0))(
  ( (Unit!16911) )
))
(declare-fun lt!248552 () Unit!16910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34375 (_ BitVec 64) (_ BitVec 32)) Unit!16910)

(assert (=> b!544661 (= lt!248552 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248553 #b00000000000000000000000000000000))))

(assert (=> b!544661 (arrayContainsKey!0 a!3154 lt!248553 #b00000000000000000000000000000000)))

(declare-fun lt!248554 () Unit!16910)

(assert (=> b!544661 (= lt!248554 lt!248552)))

(declare-fun res!338873 () Bool)

(assert (=> b!544661 (= res!338873 (= (seekEntryOrOpen!0 (select (arr!16519 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4977 #b00000000000000000000000000000000)))))

(assert (=> b!544661 (=> (not res!338873) (not e!314881))))

(declare-fun b!544662 () Bool)

(declare-fun e!314883 () Bool)

(assert (=> b!544662 (= e!314883 e!314882)))

(declare-fun c!63218 () Bool)

(assert (=> b!544662 (= c!63218 (validKeyInArray!0 (select (arr!16519 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544663 () Bool)

(assert (=> b!544663 (= e!314881 call!32102)))

(declare-fun d!82109 () Bool)

(declare-fun res!338872 () Bool)

(assert (=> d!82109 (=> res!338872 e!314883)))

(assert (=> d!82109 (= res!338872 (bvsge #b00000000000000000000000000000000 (size!16883 a!3154)))))

(assert (=> d!82109 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314883)))

(declare-fun b!544664 () Bool)

(assert (=> b!544664 (= e!314882 call!32102)))

(assert (= (and d!82109 (not res!338872)) b!544662))

(assert (= (and b!544662 c!63218) b!544661))

(assert (= (and b!544662 (not c!63218)) b!544664))

(assert (= (and b!544661 res!338873) b!544663))

(assert (= (or b!544663 b!544664) bm!32099))

(declare-fun m!522507 () Bool)

(assert (=> bm!32099 m!522507))

(assert (=> b!544661 m!522465))

(declare-fun m!522509 () Bool)

(assert (=> b!544661 m!522509))

(declare-fun m!522511 () Bool)

(assert (=> b!544661 m!522511))

(assert (=> b!544661 m!522465))

(declare-fun m!522513 () Bool)

(assert (=> b!544661 m!522513))

(assert (=> b!544662 m!522465))

(assert (=> b!544662 m!522465))

(assert (=> b!544662 m!522467))

(assert (=> b!544522 d!82109))

(declare-fun b!544747 () Bool)

(declare-fun e!314934 () SeekEntryResult!4977)

(declare-fun lt!248577 () SeekEntryResult!4977)

(assert (=> b!544747 (= e!314934 (MissingZero!4977 (index!22134 lt!248577)))))

(declare-fun b!544748 () Bool)

(declare-fun c!63245 () Bool)

(declare-fun lt!248578 () (_ BitVec 64))

(assert (=> b!544748 (= c!63245 (= lt!248578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314935 () SeekEntryResult!4977)

(assert (=> b!544748 (= e!314935 e!314934)))

(declare-fun b!544749 () Bool)

(assert (=> b!544749 (= e!314935 (Found!4977 (index!22134 lt!248577)))))

(declare-fun b!544750 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34375 (_ BitVec 32)) SeekEntryResult!4977)

(assert (=> b!544750 (= e!314934 (seekKeyOrZeroReturnVacant!0 (x!51047 lt!248577) (index!22134 lt!248577) (index!22134 lt!248577) k0!1998 a!3154 mask!3216))))

(declare-fun d!82115 () Bool)

(declare-fun lt!248576 () SeekEntryResult!4977)

(assert (=> d!82115 (and (or ((_ is Undefined!4977) lt!248576) (not ((_ is Found!4977) lt!248576)) (and (bvsge (index!22133 lt!248576) #b00000000000000000000000000000000) (bvslt (index!22133 lt!248576) (size!16883 a!3154)))) (or ((_ is Undefined!4977) lt!248576) ((_ is Found!4977) lt!248576) (not ((_ is MissingZero!4977) lt!248576)) (and (bvsge (index!22132 lt!248576) #b00000000000000000000000000000000) (bvslt (index!22132 lt!248576) (size!16883 a!3154)))) (or ((_ is Undefined!4977) lt!248576) ((_ is Found!4977) lt!248576) ((_ is MissingZero!4977) lt!248576) (not ((_ is MissingVacant!4977) lt!248576)) (and (bvsge (index!22135 lt!248576) #b00000000000000000000000000000000) (bvslt (index!22135 lt!248576) (size!16883 a!3154)))) (or ((_ is Undefined!4977) lt!248576) (ite ((_ is Found!4977) lt!248576) (= (select (arr!16519 a!3154) (index!22133 lt!248576)) k0!1998) (ite ((_ is MissingZero!4977) lt!248576) (= (select (arr!16519 a!3154) (index!22132 lt!248576)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4977) lt!248576) (= (select (arr!16519 a!3154) (index!22135 lt!248576)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!314936 () SeekEntryResult!4977)

(assert (=> d!82115 (= lt!248576 e!314936)))

(declare-fun c!63247 () Bool)

(assert (=> d!82115 (= c!63247 (and ((_ is Intermediate!4977) lt!248577) (undefined!5789 lt!248577)))))

(assert (=> d!82115 (= lt!248577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!82115 (validMask!0 mask!3216)))

(assert (=> d!82115 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248576)))

(declare-fun b!544751 () Bool)

(assert (=> b!544751 (= e!314936 e!314935)))

(assert (=> b!544751 (= lt!248578 (select (arr!16519 a!3154) (index!22134 lt!248577)))))

(declare-fun c!63246 () Bool)

(assert (=> b!544751 (= c!63246 (= lt!248578 k0!1998))))

(declare-fun b!544752 () Bool)

(assert (=> b!544752 (= e!314936 Undefined!4977)))

(assert (= (and d!82115 c!63247) b!544752))

(assert (= (and d!82115 (not c!63247)) b!544751))

(assert (= (and b!544751 c!63246) b!544749))

(assert (= (and b!544751 (not c!63246)) b!544748))

(assert (= (and b!544748 c!63245) b!544747))

(assert (= (and b!544748 (not c!63245)) b!544750))

(declare-fun m!522529 () Bool)

(assert (=> b!544750 m!522529))

(declare-fun m!522531 () Bool)

(assert (=> d!82115 m!522531))

(declare-fun m!522533 () Bool)

(assert (=> d!82115 m!522533))

(declare-fun m!522535 () Bool)

(assert (=> d!82115 m!522535))

(declare-fun m!522537 () Bool)

(assert (=> d!82115 m!522537))

(declare-fun m!522539 () Bool)

(assert (=> d!82115 m!522539))

(assert (=> d!82115 m!522407))

(assert (=> d!82115 m!522533))

(declare-fun m!522541 () Bool)

(assert (=> b!544751 m!522541))

(assert (=> b!544528 d!82115))

(declare-fun d!82129 () Bool)

(declare-fun lt!248581 () (_ BitVec 32))

(assert (=> d!82129 (and (bvsge lt!248581 #b00000000000000000000000000000000) (bvslt lt!248581 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82129 (= lt!248581 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82129 (validMask!0 mask!3216)))

(assert (=> d!82129 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248581)))

(declare-fun bs!16991 () Bool)

(assert (= bs!16991 d!82129))

(declare-fun m!522549 () Bool)

(assert (=> bs!16991 m!522549))

(assert (=> bs!16991 m!522407))

(assert (=> b!544526 d!82129))

(declare-fun b!544758 () Bool)

(declare-fun e!314941 () Bool)

(declare-fun lt!248583 () SeekEntryResult!4977)

(assert (=> b!544758 (= e!314941 (bvsge (x!51047 lt!248583) #b01111111111111111111111111111110))))

(declare-fun e!314942 () SeekEntryResult!4977)

(declare-fun b!544759 () Bool)

(assert (=> b!544759 (= e!314942 (Intermediate!4977 false (toIndex!0 (select (arr!16519 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544760 () Bool)

(declare-fun e!314944 () SeekEntryResult!4977)

(assert (=> b!544760 (= e!314944 (Intermediate!4977 true (toIndex!0 (select (arr!16519 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544761 () Bool)

(assert (=> b!544761 (and (bvsge (index!22134 lt!248583) #b00000000000000000000000000000000) (bvslt (index!22134 lt!248583) (size!16883 a!3154)))))

(declare-fun res!338908 () Bool)

(assert (=> b!544761 (= res!338908 (= (select (arr!16519 a!3154) (index!22134 lt!248583)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314943 () Bool)

(assert (=> b!544761 (=> res!338908 e!314943)))

(declare-fun d!82135 () Bool)

(assert (=> d!82135 e!314941))

(declare-fun c!63251 () Bool)

(assert (=> d!82135 (= c!63251 (and ((_ is Intermediate!4977) lt!248583) (undefined!5789 lt!248583)))))

(assert (=> d!82135 (= lt!248583 e!314944)))

(declare-fun c!63250 () Bool)

(assert (=> d!82135 (= c!63250 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248582 () (_ BitVec 64))

(assert (=> d!82135 (= lt!248582 (select (arr!16519 a!3154) (toIndex!0 (select (arr!16519 a!3154) j!147) mask!3216)))))

(assert (=> d!82135 (validMask!0 mask!3216)))

(assert (=> d!82135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16519 a!3154) j!147) mask!3216) (select (arr!16519 a!3154) j!147) a!3154 mask!3216) lt!248583)))

(declare-fun b!544762 () Bool)

(assert (=> b!544762 (and (bvsge (index!22134 lt!248583) #b00000000000000000000000000000000) (bvslt (index!22134 lt!248583) (size!16883 a!3154)))))

(assert (=> b!544762 (= e!314943 (= (select (arr!16519 a!3154) (index!22134 lt!248583)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544763 () Bool)

(declare-fun e!314945 () Bool)

(assert (=> b!544763 (= e!314941 e!314945)))

(declare-fun res!338909 () Bool)

(assert (=> b!544763 (= res!338909 (and ((_ is Intermediate!4977) lt!248583) (not (undefined!5789 lt!248583)) (bvslt (x!51047 lt!248583) #b01111111111111111111111111111110) (bvsge (x!51047 lt!248583) #b00000000000000000000000000000000) (bvsge (x!51047 lt!248583) #b00000000000000000000000000000000)))))

(assert (=> b!544763 (=> (not res!338909) (not e!314945))))

(declare-fun b!544764 () Bool)

(assert (=> b!544764 (= e!314942 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16519 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16519 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544765 () Bool)

(assert (=> b!544765 (= e!314944 e!314942)))

(declare-fun c!63249 () Bool)

(assert (=> b!544765 (= c!63249 (or (= lt!248582 (select (arr!16519 a!3154) j!147)) (= (bvadd lt!248582 lt!248582) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544766 () Bool)

(assert (=> b!544766 (and (bvsge (index!22134 lt!248583) #b00000000000000000000000000000000) (bvslt (index!22134 lt!248583) (size!16883 a!3154)))))

(declare-fun res!338907 () Bool)

(assert (=> b!544766 (= res!338907 (= (select (arr!16519 a!3154) (index!22134 lt!248583)) (select (arr!16519 a!3154) j!147)))))

(assert (=> b!544766 (=> res!338907 e!314943)))

(assert (=> b!544766 (= e!314945 e!314943)))

(assert (= (and d!82135 c!63250) b!544760))

(assert (= (and d!82135 (not c!63250)) b!544765))

(assert (= (and b!544765 c!63249) b!544759))

(assert (= (and b!544765 (not c!63249)) b!544764))

(assert (= (and d!82135 c!63251) b!544758))

(assert (= (and d!82135 (not c!63251)) b!544763))

(assert (= (and b!544763 res!338909) b!544766))

(assert (= (and b!544766 (not res!338907)) b!544761))

(assert (= (and b!544761 (not res!338908)) b!544762))

(declare-fun m!522551 () Bool)

(assert (=> b!544762 m!522551))

(assert (=> b!544766 m!522551))

(assert (=> b!544761 m!522551))

(assert (=> d!82135 m!522425))

(declare-fun m!522553 () Bool)

(assert (=> d!82135 m!522553))

(assert (=> d!82135 m!522407))

(assert (=> b!544764 m!522425))

(declare-fun m!522555 () Bool)

(assert (=> b!544764 m!522555))

(assert (=> b!544764 m!522555))

(assert (=> b!544764 m!522413))

(declare-fun m!522557 () Bool)

(assert (=> b!544764 m!522557))

(assert (=> b!544532 d!82135))

(declare-fun d!82139 () Bool)

(declare-fun lt!248595 () (_ BitVec 32))

(declare-fun lt!248594 () (_ BitVec 32))

(assert (=> d!82139 (= lt!248595 (bvmul (bvxor lt!248594 (bvlshr lt!248594 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82139 (= lt!248594 ((_ extract 31 0) (bvand (bvxor (select (arr!16519 a!3154) j!147) (bvlshr (select (arr!16519 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82139 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338910 (let ((h!11594 ((_ extract 31 0) (bvand (bvxor (select (arr!16519 a!3154) j!147) (bvlshr (select (arr!16519 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51054 (bvmul (bvxor h!11594 (bvlshr h!11594 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51054 (bvlshr x!51054 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338910 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338910 #b00000000000000000000000000000000))))))

(assert (=> d!82139 (= (toIndex!0 (select (arr!16519 a!3154) j!147) mask!3216) (bvand (bvxor lt!248595 (bvlshr lt!248595 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!544532 d!82139))

(declare-fun d!82141 () Bool)

(assert (=> d!82141 (= (validKeyInArray!0 (select (arr!16519 a!3154) j!147)) (and (not (= (select (arr!16519 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16519 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544521 d!82141))

(check-sat (not d!82097) (not b!544646) (not b!544662) (not b!544750) (not bm!32093) (not b!544661) (not b!544764) (not d!82129) (not b!544632) (not b!544583) (not d!82135) (not d!82115) (not b!544581) (not bm!32099) (not b!544579))
(check-sat)
