; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49434 () Bool)

(assert start!49434)

(declare-fun b!544214 () Bool)

(declare-fun e!314617 () Bool)

(declare-fun e!314618 () Bool)

(assert (=> b!544214 (= e!314617 e!314618)))

(declare-fun res!338623 () Bool)

(assert (=> b!544214 (=> (not res!338623) (not e!314618))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4972 0))(
  ( (MissingZero!4972 (index!22112 (_ BitVec 32))) (Found!4972 (index!22113 (_ BitVec 32))) (Intermediate!4972 (undefined!5784 Bool) (index!22114 (_ BitVec 32)) (x!51037 (_ BitVec 32))) (Undefined!4972) (MissingVacant!4972 (index!22115 (_ BitVec 32))) )
))
(declare-fun lt!248269 () SeekEntryResult!4972)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544214 (= res!338623 (= lt!248269 (Intermediate!4972 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34371 0))(
  ( (array!34372 (arr!16517 (Array (_ BitVec 32) (_ BitVec 64))) (size!16882 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34371)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34371 (_ BitVec 32)) SeekEntryResult!4972)

(assert (=> b!544214 (= lt!248269 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16517 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544215 () Bool)

(declare-fun res!338626 () Bool)

(assert (=> b!544215 (=> (not res!338626) (not e!314618))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544215 (= res!338626 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16517 a!3154) j!147) mask!3216) (select (arr!16517 a!3154) j!147) a!3154 mask!3216) lt!248269))))

(declare-fun b!544216 () Bool)

(declare-fun res!338624 () Bool)

(assert (=> b!544216 (=> (not res!338624) (not e!314617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34371 (_ BitVec 32)) Bool)

(assert (=> b!544216 (= res!338624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544217 () Bool)

(declare-fun res!338619 () Bool)

(declare-fun e!314619 () Bool)

(assert (=> b!544217 (=> (not res!338619) (not e!314619))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544217 (= res!338619 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544219 () Bool)

(assert (=> b!544219 (= e!314619 e!314617)))

(declare-fun res!338622 () Bool)

(assert (=> b!544219 (=> (not res!338622) (not e!314617))))

(declare-fun lt!248268 () SeekEntryResult!4972)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544219 (= res!338622 (or (= lt!248268 (MissingZero!4972 i!1153)) (= lt!248268 (MissingVacant!4972 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34371 (_ BitVec 32)) SeekEntryResult!4972)

(assert (=> b!544219 (= lt!248268 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544220 () Bool)

(declare-fun res!338621 () Bool)

(assert (=> b!544220 (=> (not res!338621) (not e!314617))))

(assert (=> b!544220 (= res!338621 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16882 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16882 a!3154)) (= (select (arr!16517 a!3154) resIndex!32) (select (arr!16517 a!3154) j!147))))))

(declare-fun b!544221 () Bool)

(declare-fun res!338628 () Bool)

(assert (=> b!544221 (=> (not res!338628) (not e!314619))))

(assert (=> b!544221 (= res!338628 (and (= (size!16882 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16882 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16882 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544222 () Bool)

(declare-fun res!338630 () Bool)

(assert (=> b!544222 (=> (not res!338630) (not e!314619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544222 (= res!338630 (validKeyInArray!0 (select (arr!16517 a!3154) j!147)))))

(declare-fun b!544223 () Bool)

(declare-fun res!338625 () Bool)

(assert (=> b!544223 (=> (not res!338625) (not e!314619))))

(assert (=> b!544223 (= res!338625 (validKeyInArray!0 k0!1998))))

(declare-fun lt!248267 () (_ BitVec 32))

(declare-fun b!544224 () Bool)

(assert (=> b!544224 (= e!314618 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (or (bvslt lt!248267 #b00000000000000000000000000000000) (bvsge lt!248267 (size!16882 a!3154)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544224 (= lt!248267 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544225 () Bool)

(declare-fun res!338620 () Bool)

(assert (=> b!544225 (=> (not res!338620) (not e!314617))))

(declare-datatypes ((List!10675 0))(
  ( (Nil!10672) (Cons!10671 (h!11629 (_ BitVec 64)) (t!16894 List!10675)) )
))
(declare-fun arrayNoDuplicates!0 (array!34371 (_ BitVec 32) List!10675) Bool)

(assert (=> b!544225 (= res!338620 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10672))))

(declare-fun b!544218 () Bool)

(declare-fun res!338629 () Bool)

(assert (=> b!544218 (=> (not res!338629) (not e!314618))))

(assert (=> b!544218 (= res!338629 (and (not (= (select (arr!16517 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16517 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16517 a!3154) index!1177) (select (arr!16517 a!3154) j!147)))))))

(declare-fun res!338627 () Bool)

(assert (=> start!49434 (=> (not res!338627) (not e!314619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49434 (= res!338627 (validMask!0 mask!3216))))

(assert (=> start!49434 e!314619))

(assert (=> start!49434 true))

(declare-fun array_inv!12400 (array!34371) Bool)

(assert (=> start!49434 (array_inv!12400 a!3154)))

(assert (= (and start!49434 res!338627) b!544221))

(assert (= (and b!544221 res!338628) b!544222))

(assert (= (and b!544222 res!338630) b!544223))

(assert (= (and b!544223 res!338625) b!544217))

(assert (= (and b!544217 res!338619) b!544219))

(assert (= (and b!544219 res!338622) b!544216))

(assert (= (and b!544216 res!338624) b!544225))

(assert (= (and b!544225 res!338620) b!544220))

(assert (= (and b!544220 res!338621) b!544214))

(assert (= (and b!544214 res!338623) b!544215))

(assert (= (and b!544215 res!338626) b!544218))

(assert (= (and b!544218 res!338629) b!544224))

(declare-fun m!521623 () Bool)

(assert (=> b!544224 m!521623))

(declare-fun m!521625 () Bool)

(assert (=> b!544219 m!521625))

(declare-fun m!521627 () Bool)

(assert (=> start!49434 m!521627))

(declare-fun m!521629 () Bool)

(assert (=> start!49434 m!521629))

(declare-fun m!521631 () Bool)

(assert (=> b!544215 m!521631))

(assert (=> b!544215 m!521631))

(declare-fun m!521633 () Bool)

(assert (=> b!544215 m!521633))

(assert (=> b!544215 m!521633))

(assert (=> b!544215 m!521631))

(declare-fun m!521635 () Bool)

(assert (=> b!544215 m!521635))

(assert (=> b!544214 m!521631))

(assert (=> b!544214 m!521631))

(declare-fun m!521637 () Bool)

(assert (=> b!544214 m!521637))

(declare-fun m!521639 () Bool)

(assert (=> b!544217 m!521639))

(declare-fun m!521641 () Bool)

(assert (=> b!544216 m!521641))

(declare-fun m!521643 () Bool)

(assert (=> b!544225 m!521643))

(declare-fun m!521645 () Bool)

(assert (=> b!544223 m!521645))

(declare-fun m!521647 () Bool)

(assert (=> b!544218 m!521647))

(assert (=> b!544218 m!521631))

(assert (=> b!544222 m!521631))

(assert (=> b!544222 m!521631))

(declare-fun m!521649 () Bool)

(assert (=> b!544222 m!521649))

(declare-fun m!521651 () Bool)

(assert (=> b!544220 m!521651))

(assert (=> b!544220 m!521631))

(check-sat (not b!544216) (not start!49434) (not b!544214) (not b!544225) (not b!544217) (not b!544224) (not b!544219) (not b!544223) (not b!544215) (not b!544222))
(check-sat)
(get-model)

(declare-fun d!81883 () Bool)

(assert (=> d!81883 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49434 d!81883))

(declare-fun d!81885 () Bool)

(assert (=> d!81885 (= (array_inv!12400 a!3154) (bvsge (size!16882 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49434 d!81885))

(declare-fun d!81887 () Bool)

(assert (=> d!81887 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544223 d!81887))

(declare-fun d!81889 () Bool)

(assert (=> d!81889 (= (validKeyInArray!0 (select (arr!16517 a!3154) j!147)) (and (not (= (select (arr!16517 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16517 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!544222 d!81889))

(declare-fun d!81891 () Bool)

(declare-fun res!338707 () Bool)

(declare-fun e!314648 () Bool)

(assert (=> d!81891 (=> res!338707 e!314648)))

(assert (=> d!81891 (= res!338707 (= (select (arr!16517 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81891 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!314648)))

(declare-fun b!544302 () Bool)

(declare-fun e!314649 () Bool)

(assert (=> b!544302 (= e!314648 e!314649)))

(declare-fun res!338708 () Bool)

(assert (=> b!544302 (=> (not res!338708) (not e!314649))))

(assert (=> b!544302 (= res!338708 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16882 a!3154)))))

(declare-fun b!544303 () Bool)

(assert (=> b!544303 (= e!314649 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81891 (not res!338707)) b!544302))

(assert (= (and b!544302 res!338708) b!544303))

(declare-fun m!521713 () Bool)

(assert (=> d!81891 m!521713))

(declare-fun m!521715 () Bool)

(assert (=> b!544303 m!521715))

(assert (=> b!544217 d!81891))

(declare-fun b!544318 () Bool)

(declare-fun e!314664 () Bool)

(declare-fun e!314662 () Bool)

(assert (=> b!544318 (= e!314664 e!314662)))

(declare-fun c!63123 () Bool)

(assert (=> b!544318 (= c!63123 (validKeyInArray!0 (select (arr!16517 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544319 () Bool)

(declare-fun call!32071 () Bool)

(assert (=> b!544319 (= e!314662 call!32071)))

(declare-fun b!544320 () Bool)

(declare-fun e!314663 () Bool)

(assert (=> b!544320 (= e!314662 e!314663)))

(declare-fun lt!248295 () (_ BitVec 64))

(assert (=> b!544320 (= lt!248295 (select (arr!16517 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16894 0))(
  ( (Unit!16895) )
))
(declare-fun lt!248294 () Unit!16894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34371 (_ BitVec 64) (_ BitVec 32)) Unit!16894)

(assert (=> b!544320 (= lt!248294 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248295 #b00000000000000000000000000000000))))

(assert (=> b!544320 (arrayContainsKey!0 a!3154 lt!248295 #b00000000000000000000000000000000)))

(declare-fun lt!248296 () Unit!16894)

(assert (=> b!544320 (= lt!248296 lt!248294)))

(declare-fun res!338720 () Bool)

(assert (=> b!544320 (= res!338720 (= (seekEntryOrOpen!0 (select (arr!16517 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4972 #b00000000000000000000000000000000)))))

(assert (=> b!544320 (=> (not res!338720) (not e!314663))))

(declare-fun b!544321 () Bool)

(assert (=> b!544321 (= e!314663 call!32071)))

(declare-fun bm!32068 () Bool)

(assert (=> bm!32068 (= call!32071 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!81893 () Bool)

(declare-fun res!338719 () Bool)

(assert (=> d!81893 (=> res!338719 e!314664)))

(assert (=> d!81893 (= res!338719 (bvsge #b00000000000000000000000000000000 (size!16882 a!3154)))))

(assert (=> d!81893 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314664)))

(assert (= (and d!81893 (not res!338719)) b!544318))

(assert (= (and b!544318 c!63123) b!544320))

(assert (= (and b!544318 (not c!63123)) b!544319))

(assert (= (and b!544320 res!338720) b!544321))

(assert (= (or b!544321 b!544319) bm!32068))

(assert (=> b!544318 m!521713))

(assert (=> b!544318 m!521713))

(declare-fun m!521721 () Bool)

(assert (=> b!544318 m!521721))

(assert (=> b!544320 m!521713))

(declare-fun m!521723 () Bool)

(assert (=> b!544320 m!521723))

(declare-fun m!521725 () Bool)

(assert (=> b!544320 m!521725))

(assert (=> b!544320 m!521713))

(declare-fun m!521727 () Bool)

(assert (=> b!544320 m!521727))

(declare-fun m!521729 () Bool)

(assert (=> bm!32068 m!521729))

(assert (=> b!544216 d!81893))

(declare-fun b!544364 () Bool)

(declare-fun e!314692 () SeekEntryResult!4972)

(assert (=> b!544364 (= e!314692 (Intermediate!4972 false (toIndex!0 (select (arr!16517 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544365 () Bool)

(assert (=> b!544365 (= e!314692 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16517 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16517 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544366 () Bool)

(declare-fun e!314694 () Bool)

(declare-fun e!314693 () Bool)

(assert (=> b!544366 (= e!314694 e!314693)))

(declare-fun res!338735 () Bool)

(declare-fun lt!248313 () SeekEntryResult!4972)

(get-info :version)

(assert (=> b!544366 (= res!338735 (and ((_ is Intermediate!4972) lt!248313) (not (undefined!5784 lt!248313)) (bvslt (x!51037 lt!248313) #b01111111111111111111111111111110) (bvsge (x!51037 lt!248313) #b00000000000000000000000000000000) (bvsge (x!51037 lt!248313) #b00000000000000000000000000000000)))))

(assert (=> b!544366 (=> (not res!338735) (not e!314693))))

(declare-fun b!544367 () Bool)

(assert (=> b!544367 (and (bvsge (index!22114 lt!248313) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248313) (size!16882 a!3154)))))

(declare-fun res!338734 () Bool)

(assert (=> b!544367 (= res!338734 (= (select (arr!16517 a!3154) (index!22114 lt!248313)) (select (arr!16517 a!3154) j!147)))))

(declare-fun e!314690 () Bool)

(assert (=> b!544367 (=> res!338734 e!314690)))

(assert (=> b!544367 (= e!314693 e!314690)))

(declare-fun b!544368 () Bool)

(assert (=> b!544368 (and (bvsge (index!22114 lt!248313) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248313) (size!16882 a!3154)))))

(declare-fun res!338733 () Bool)

(assert (=> b!544368 (= res!338733 (= (select (arr!16517 a!3154) (index!22114 lt!248313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544368 (=> res!338733 e!314690)))

(declare-fun d!81901 () Bool)

(assert (=> d!81901 e!314694))

(declare-fun c!63139 () Bool)

(assert (=> d!81901 (= c!63139 (and ((_ is Intermediate!4972) lt!248313) (undefined!5784 lt!248313)))))

(declare-fun e!314691 () SeekEntryResult!4972)

(assert (=> d!81901 (= lt!248313 e!314691)))

(declare-fun c!63141 () Bool)

(assert (=> d!81901 (= c!63141 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248314 () (_ BitVec 64))

(assert (=> d!81901 (= lt!248314 (select (arr!16517 a!3154) (toIndex!0 (select (arr!16517 a!3154) j!147) mask!3216)))))

(assert (=> d!81901 (validMask!0 mask!3216)))

(assert (=> d!81901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16517 a!3154) j!147) mask!3216) (select (arr!16517 a!3154) j!147) a!3154 mask!3216) lt!248313)))

(declare-fun b!544369 () Bool)

(assert (=> b!544369 (= e!314691 (Intermediate!4972 true (toIndex!0 (select (arr!16517 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544370 () Bool)

(assert (=> b!544370 (and (bvsge (index!22114 lt!248313) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248313) (size!16882 a!3154)))))

(assert (=> b!544370 (= e!314690 (= (select (arr!16517 a!3154) (index!22114 lt!248313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544371 () Bool)

(assert (=> b!544371 (= e!314694 (bvsge (x!51037 lt!248313) #b01111111111111111111111111111110))))

(declare-fun b!544372 () Bool)

(assert (=> b!544372 (= e!314691 e!314692)))

(declare-fun c!63140 () Bool)

(assert (=> b!544372 (= c!63140 (or (= lt!248314 (select (arr!16517 a!3154) j!147)) (= (bvadd lt!248314 lt!248314) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!81901 c!63141) b!544369))

(assert (= (and d!81901 (not c!63141)) b!544372))

(assert (= (and b!544372 c!63140) b!544364))

(assert (= (and b!544372 (not c!63140)) b!544365))

(assert (= (and d!81901 c!63139) b!544371))

(assert (= (and d!81901 (not c!63139)) b!544366))

(assert (= (and b!544366 res!338735) b!544367))

(assert (= (and b!544367 (not res!338734)) b!544368))

(assert (= (and b!544368 (not res!338733)) b!544370))

(declare-fun m!521751 () Bool)

(assert (=> b!544368 m!521751))

(assert (=> b!544367 m!521751))

(assert (=> b!544370 m!521751))

(assert (=> d!81901 m!521633))

(declare-fun m!521753 () Bool)

(assert (=> d!81901 m!521753))

(assert (=> d!81901 m!521627))

(assert (=> b!544365 m!521633))

(declare-fun m!521755 () Bool)

(assert (=> b!544365 m!521755))

(assert (=> b!544365 m!521755))

(assert (=> b!544365 m!521631))

(declare-fun m!521757 () Bool)

(assert (=> b!544365 m!521757))

(assert (=> b!544215 d!81901))

(declare-fun d!81915 () Bool)

(declare-fun lt!248327 () (_ BitVec 32))

(declare-fun lt!248326 () (_ BitVec 32))

(assert (=> d!81915 (= lt!248327 (bvmul (bvxor lt!248326 (bvlshr lt!248326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81915 (= lt!248326 ((_ extract 31 0) (bvand (bvxor (select (arr!16517 a!3154) j!147) (bvlshr (select (arr!16517 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81915 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338736 (let ((h!11632 ((_ extract 31 0) (bvand (bvxor (select (arr!16517 a!3154) j!147) (bvlshr (select (arr!16517 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51042 (bvmul (bvxor h!11632 (bvlshr h!11632 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51042 (bvlshr x!51042 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338736 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338736 #b00000000000000000000000000000000))))))

(assert (=> d!81915 (= (toIndex!0 (select (arr!16517 a!3154) j!147) mask!3216) (bvand (bvxor lt!248327 (bvlshr lt!248327 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!544215 d!81915))

(declare-fun b!544381 () Bool)

(declare-fun e!314701 () SeekEntryResult!4972)

(assert (=> b!544381 (= e!314701 (Intermediate!4972 false index!1177 x!1030))))

(declare-fun b!544382 () Bool)

(assert (=> b!544382 (= e!314701 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16517 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544383 () Bool)

(declare-fun e!314703 () Bool)

(declare-fun e!314702 () Bool)

(assert (=> b!544383 (= e!314703 e!314702)))

(declare-fun res!338739 () Bool)

(declare-fun lt!248328 () SeekEntryResult!4972)

(assert (=> b!544383 (= res!338739 (and ((_ is Intermediate!4972) lt!248328) (not (undefined!5784 lt!248328)) (bvslt (x!51037 lt!248328) #b01111111111111111111111111111110) (bvsge (x!51037 lt!248328) #b00000000000000000000000000000000) (bvsge (x!51037 lt!248328) x!1030)))))

(assert (=> b!544383 (=> (not res!338739) (not e!314702))))

(declare-fun b!544384 () Bool)

(assert (=> b!544384 (and (bvsge (index!22114 lt!248328) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248328) (size!16882 a!3154)))))

(declare-fun res!338738 () Bool)

(assert (=> b!544384 (= res!338738 (= (select (arr!16517 a!3154) (index!22114 lt!248328)) (select (arr!16517 a!3154) j!147)))))

(declare-fun e!314699 () Bool)

(assert (=> b!544384 (=> res!338738 e!314699)))

(assert (=> b!544384 (= e!314702 e!314699)))

(declare-fun b!544385 () Bool)

(assert (=> b!544385 (and (bvsge (index!22114 lt!248328) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248328) (size!16882 a!3154)))))

(declare-fun res!338737 () Bool)

(assert (=> b!544385 (= res!338737 (= (select (arr!16517 a!3154) (index!22114 lt!248328)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544385 (=> res!338737 e!314699)))

(declare-fun d!81921 () Bool)

(assert (=> d!81921 e!314703))

(declare-fun c!63146 () Bool)

(assert (=> d!81921 (= c!63146 (and ((_ is Intermediate!4972) lt!248328) (undefined!5784 lt!248328)))))

(declare-fun e!314700 () SeekEntryResult!4972)

(assert (=> d!81921 (= lt!248328 e!314700)))

(declare-fun c!63148 () Bool)

(assert (=> d!81921 (= c!63148 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!248329 () (_ BitVec 64))

(assert (=> d!81921 (= lt!248329 (select (arr!16517 a!3154) index!1177))))

(assert (=> d!81921 (validMask!0 mask!3216)))

(assert (=> d!81921 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16517 a!3154) j!147) a!3154 mask!3216) lt!248328)))

(declare-fun b!544386 () Bool)

(assert (=> b!544386 (= e!314700 (Intermediate!4972 true index!1177 x!1030))))

(declare-fun b!544387 () Bool)

(assert (=> b!544387 (and (bvsge (index!22114 lt!248328) #b00000000000000000000000000000000) (bvslt (index!22114 lt!248328) (size!16882 a!3154)))))

(assert (=> b!544387 (= e!314699 (= (select (arr!16517 a!3154) (index!22114 lt!248328)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544388 () Bool)

(assert (=> b!544388 (= e!314703 (bvsge (x!51037 lt!248328) #b01111111111111111111111111111110))))

(declare-fun b!544389 () Bool)

(assert (=> b!544389 (= e!314700 e!314701)))

(declare-fun c!63147 () Bool)

(assert (=> b!544389 (= c!63147 (or (= lt!248329 (select (arr!16517 a!3154) j!147)) (= (bvadd lt!248329 lt!248329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!81921 c!63148) b!544386))

(assert (= (and d!81921 (not c!63148)) b!544389))

(assert (= (and b!544389 c!63147) b!544381))

(assert (= (and b!544389 (not c!63147)) b!544382))

(assert (= (and d!81921 c!63146) b!544388))

(assert (= (and d!81921 (not c!63146)) b!544383))

(assert (= (and b!544383 res!338739) b!544384))

(assert (= (and b!544384 (not res!338738)) b!544385))

(assert (= (and b!544385 (not res!338737)) b!544387))

(declare-fun m!521761 () Bool)

(assert (=> b!544385 m!521761))

(assert (=> b!544384 m!521761))

(assert (=> b!544387 m!521761))

(assert (=> d!81921 m!521647))

(assert (=> d!81921 m!521627))

(assert (=> b!544382 m!521623))

(assert (=> b!544382 m!521623))

(assert (=> b!544382 m!521631))

(declare-fun m!521763 () Bool)

(assert (=> b!544382 m!521763))

(assert (=> b!544214 d!81921))

(declare-fun d!81923 () Bool)

(declare-fun res!338755 () Bool)

(declare-fun e!314724 () Bool)

(assert (=> d!81923 (=> res!338755 e!314724)))

(assert (=> d!81923 (= res!338755 (bvsge #b00000000000000000000000000000000 (size!16882 a!3154)))))

(assert (=> d!81923 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10672) e!314724)))

(declare-fun b!544419 () Bool)

(declare-fun e!314723 () Bool)

(declare-fun call!32074 () Bool)

(assert (=> b!544419 (= e!314723 call!32074)))

(declare-fun b!544420 () Bool)

(declare-fun e!314725 () Bool)

(assert (=> b!544420 (= e!314725 e!314723)))

(declare-fun c!63156 () Bool)

(assert (=> b!544420 (= c!63156 (validKeyInArray!0 (select (arr!16517 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544421 () Bool)

(assert (=> b!544421 (= e!314724 e!314725)))

(declare-fun res!338757 () Bool)

(assert (=> b!544421 (=> (not res!338757) (not e!314725))))

(declare-fun e!314726 () Bool)

(assert (=> b!544421 (= res!338757 (not e!314726))))

(declare-fun res!338756 () Bool)

(assert (=> b!544421 (=> (not res!338756) (not e!314726))))

(assert (=> b!544421 (= res!338756 (validKeyInArray!0 (select (arr!16517 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32071 () Bool)

(assert (=> bm!32071 (= call!32074 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63156 (Cons!10671 (select (arr!16517 a!3154) #b00000000000000000000000000000000) Nil!10672) Nil!10672)))))

(declare-fun b!544422 () Bool)

(declare-fun contains!2788 (List!10675 (_ BitVec 64)) Bool)

(assert (=> b!544422 (= e!314726 (contains!2788 Nil!10672 (select (arr!16517 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544423 () Bool)

(assert (=> b!544423 (= e!314723 call!32074)))

(assert (= (and d!81923 (not res!338755)) b!544421))

(assert (= (and b!544421 res!338756) b!544422))

(assert (= (and b!544421 res!338757) b!544420))

(assert (= (and b!544420 c!63156) b!544419))

(assert (= (and b!544420 (not c!63156)) b!544423))

(assert (= (or b!544419 b!544423) bm!32071))

(assert (=> b!544420 m!521713))

(assert (=> b!544420 m!521713))

(assert (=> b!544420 m!521721))

(assert (=> b!544421 m!521713))

(assert (=> b!544421 m!521713))

(assert (=> b!544421 m!521721))

(assert (=> bm!32071 m!521713))

(declare-fun m!521769 () Bool)

(assert (=> bm!32071 m!521769))

(assert (=> b!544422 m!521713))

(assert (=> b!544422 m!521713))

(declare-fun m!521771 () Bool)

(assert (=> b!544422 m!521771))

(assert (=> b!544225 d!81923))

(declare-fun d!81927 () Bool)

(declare-fun lt!248334 () (_ BitVec 32))

(assert (=> d!81927 (and (bvsge lt!248334 #b00000000000000000000000000000000) (bvslt lt!248334 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81927 (= lt!248334 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!81927 (validMask!0 mask!3216)))

(assert (=> d!81927 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248334)))

(declare-fun bs!16962 () Bool)

(assert (= bs!16962 d!81927))

(declare-fun m!521773 () Bool)

(assert (=> bs!16962 m!521773))

(assert (=> bs!16962 m!521627))

(assert (=> b!544224 d!81927))

(declare-fun b!544503 () Bool)

(declare-fun e!314779 () SeekEntryResult!4972)

(declare-fun e!314778 () SeekEntryResult!4972)

(assert (=> b!544503 (= e!314779 e!314778)))

(declare-fun lt!248367 () (_ BitVec 64))

(declare-fun lt!248368 () SeekEntryResult!4972)

(assert (=> b!544503 (= lt!248367 (select (arr!16517 a!3154) (index!22114 lt!248368)))))

(declare-fun c!63184 () Bool)

(assert (=> b!544503 (= c!63184 (= lt!248367 k0!1998))))

(declare-fun b!544504 () Bool)

(declare-fun c!63183 () Bool)

(assert (=> b!544504 (= c!63183 (= lt!248367 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314777 () SeekEntryResult!4972)

(assert (=> b!544504 (= e!314778 e!314777)))

(declare-fun b!544505 () Bool)

(assert (=> b!544505 (= e!314778 (Found!4972 (index!22114 lt!248368)))))

(declare-fun b!544506 () Bool)

(assert (=> b!544506 (= e!314777 (MissingZero!4972 (index!22114 lt!248368)))))

(declare-fun d!81929 () Bool)

(declare-fun lt!248369 () SeekEntryResult!4972)

(assert (=> d!81929 (and (or ((_ is Undefined!4972) lt!248369) (not ((_ is Found!4972) lt!248369)) (and (bvsge (index!22113 lt!248369) #b00000000000000000000000000000000) (bvslt (index!22113 lt!248369) (size!16882 a!3154)))) (or ((_ is Undefined!4972) lt!248369) ((_ is Found!4972) lt!248369) (not ((_ is MissingZero!4972) lt!248369)) (and (bvsge (index!22112 lt!248369) #b00000000000000000000000000000000) (bvslt (index!22112 lt!248369) (size!16882 a!3154)))) (or ((_ is Undefined!4972) lt!248369) ((_ is Found!4972) lt!248369) ((_ is MissingZero!4972) lt!248369) (not ((_ is MissingVacant!4972) lt!248369)) (and (bvsge (index!22115 lt!248369) #b00000000000000000000000000000000) (bvslt (index!22115 lt!248369) (size!16882 a!3154)))) (or ((_ is Undefined!4972) lt!248369) (ite ((_ is Found!4972) lt!248369) (= (select (arr!16517 a!3154) (index!22113 lt!248369)) k0!1998) (ite ((_ is MissingZero!4972) lt!248369) (= (select (arr!16517 a!3154) (index!22112 lt!248369)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4972) lt!248369) (= (select (arr!16517 a!3154) (index!22115 lt!248369)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81929 (= lt!248369 e!314779)))

(declare-fun c!63182 () Bool)

(assert (=> d!81929 (= c!63182 (and ((_ is Intermediate!4972) lt!248368) (undefined!5784 lt!248368)))))

(assert (=> d!81929 (= lt!248368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81929 (validMask!0 mask!3216)))

(assert (=> d!81929 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248369)))

(declare-fun b!544507 () Bool)

(assert (=> b!544507 (= e!314779 Undefined!4972)))

(declare-fun b!544508 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34371 (_ BitVec 32)) SeekEntryResult!4972)

(assert (=> b!544508 (= e!314777 (seekKeyOrZeroReturnVacant!0 (x!51037 lt!248368) (index!22114 lt!248368) (index!22114 lt!248368) k0!1998 a!3154 mask!3216))))

(assert (= (and d!81929 c!63182) b!544507))

(assert (= (and d!81929 (not c!63182)) b!544503))

(assert (= (and b!544503 c!63184) b!544505))

(assert (= (and b!544503 (not c!63184)) b!544504))

(assert (= (and b!544504 c!63183) b!544506))

(assert (= (and b!544504 (not c!63183)) b!544508))

(declare-fun m!521793 () Bool)

(assert (=> b!544503 m!521793))

(assert (=> d!81929 m!521627))

(declare-fun m!521795 () Bool)

(assert (=> d!81929 m!521795))

(declare-fun m!521797 () Bool)

(assert (=> d!81929 m!521797))

(declare-fun m!521799 () Bool)

(assert (=> d!81929 m!521799))

(declare-fun m!521801 () Bool)

(assert (=> d!81929 m!521801))

(assert (=> d!81929 m!521797))

(declare-fun m!521803 () Bool)

(assert (=> d!81929 m!521803))

(declare-fun m!521805 () Bool)

(assert (=> b!544508 m!521805))

(assert (=> b!544219 d!81929))

(check-sat (not d!81929) (not bm!32071) (not b!544365) (not b!544508) (not b!544382) (not b!544421) (not d!81901) (not d!81927) (not b!544303) (not b!544320) (not b!544318) (not b!544420) (not d!81921) (not bm!32068) (not b!544422))
(check-sat)
