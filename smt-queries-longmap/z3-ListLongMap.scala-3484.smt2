; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48326 () Bool)

(assert start!48326)

(declare-fun b!531380 () Bool)

(declare-fun e!309510 () Bool)

(declare-fun e!309509 () Bool)

(assert (=> b!531380 (= e!309510 e!309509)))

(declare-fun res!326946 () Bool)

(assert (=> b!531380 (=> (not res!326946) (not e!309509))))

(declare-datatypes ((SeekEntryResult!4641 0))(
  ( (MissingZero!4641 (index!20788 (_ BitVec 32))) (Found!4641 (index!20789 (_ BitVec 32))) (Intermediate!4641 (undefined!5453 Bool) (index!20790 (_ BitVec 32)) (x!49767 (_ BitVec 32))) (Undefined!4641) (MissingVacant!4641 (index!20791 (_ BitVec 32))) )
))
(declare-fun lt!244960 () SeekEntryResult!4641)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531380 (= res!326946 (or (= lt!244960 (MissingZero!4641 i!1153)) (= lt!244960 (MissingVacant!4641 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33679 0))(
  ( (array!33680 (arr!16183 (Array (_ BitVec 32) (_ BitVec 64))) (size!16547 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33679)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33679 (_ BitVec 32)) SeekEntryResult!4641)

(assert (=> b!531380 (= lt!244960 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531381 () Bool)

(declare-fun e!309508 () Bool)

(assert (=> b!531381 (= e!309509 e!309508)))

(declare-fun res!326947 () Bool)

(assert (=> b!531381 (=> res!326947 e!309508)))

(declare-datatypes ((List!10302 0))(
  ( (Nil!10299) (Cons!10298 (h!11238 (_ BitVec 64)) (t!16530 List!10302)) )
))
(declare-fun contains!2785 (List!10302 (_ BitVec 64)) Bool)

(assert (=> b!531381 (= res!326947 (contains!2785 Nil!10299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531382 () Bool)

(declare-fun res!326949 () Bool)

(assert (=> b!531382 (=> (not res!326949) (not e!309510))))

(declare-fun arrayContainsKey!0 (array!33679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531382 (= res!326949 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!326948 () Bool)

(assert (=> start!48326 (=> (not res!326948) (not e!309510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48326 (= res!326948 (validMask!0 mask!3216))))

(assert (=> start!48326 e!309510))

(assert (=> start!48326 true))

(declare-fun array_inv!11979 (array!33679) Bool)

(assert (=> start!48326 (array_inv!11979 a!3154)))

(declare-fun b!531383 () Bool)

(declare-fun res!326944 () Bool)

(assert (=> b!531383 (=> (not res!326944) (not e!309510))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531383 (= res!326944 (and (= (size!16547 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16547 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16547 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531384 () Bool)

(declare-fun res!326945 () Bool)

(assert (=> b!531384 (=> (not res!326945) (not e!309510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531384 (= res!326945 (validKeyInArray!0 (select (arr!16183 a!3154) j!147)))))

(declare-fun b!531385 () Bool)

(declare-fun res!326951 () Bool)

(assert (=> b!531385 (=> (not res!326951) (not e!309509))))

(declare-fun noDuplicate!217 (List!10302) Bool)

(assert (=> b!531385 (= res!326951 (noDuplicate!217 Nil!10299))))

(declare-fun b!531386 () Bool)

(declare-fun res!326942 () Bool)

(assert (=> b!531386 (=> (not res!326942) (not e!309510))))

(assert (=> b!531386 (= res!326942 (validKeyInArray!0 k0!1998))))

(declare-fun b!531387 () Bool)

(declare-fun res!326950 () Bool)

(assert (=> b!531387 (=> (not res!326950) (not e!309509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33679 (_ BitVec 32)) Bool)

(assert (=> b!531387 (= res!326950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531388 () Bool)

(assert (=> b!531388 (= e!309508 (contains!2785 Nil!10299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531389 () Bool)

(declare-fun res!326943 () Bool)

(assert (=> b!531389 (=> (not res!326943) (not e!309509))))

(assert (=> b!531389 (= res!326943 (and (bvsle #b00000000000000000000000000000000 (size!16547 a!3154)) (bvslt (size!16547 a!3154) #b01111111111111111111111111111111)))))

(assert (= (and start!48326 res!326948) b!531383))

(assert (= (and b!531383 res!326944) b!531384))

(assert (= (and b!531384 res!326945) b!531386))

(assert (= (and b!531386 res!326942) b!531382))

(assert (= (and b!531382 res!326949) b!531380))

(assert (= (and b!531380 res!326946) b!531387))

(assert (= (and b!531387 res!326950) b!531389))

(assert (= (and b!531389 res!326943) b!531385))

(assert (= (and b!531385 res!326951) b!531381))

(assert (= (and b!531381 (not res!326947)) b!531388))

(declare-fun m!511801 () Bool)

(assert (=> b!531381 m!511801))

(declare-fun m!511803 () Bool)

(assert (=> b!531380 m!511803))

(declare-fun m!511805 () Bool)

(assert (=> b!531387 m!511805))

(declare-fun m!511807 () Bool)

(assert (=> b!531386 m!511807))

(declare-fun m!511809 () Bool)

(assert (=> b!531388 m!511809))

(declare-fun m!511811 () Bool)

(assert (=> b!531382 m!511811))

(declare-fun m!511813 () Bool)

(assert (=> b!531384 m!511813))

(assert (=> b!531384 m!511813))

(declare-fun m!511815 () Bool)

(assert (=> b!531384 m!511815))

(declare-fun m!511817 () Bool)

(assert (=> start!48326 m!511817))

(declare-fun m!511819 () Bool)

(assert (=> start!48326 m!511819))

(declare-fun m!511821 () Bool)

(assert (=> b!531385 m!511821))

(check-sat (not b!531380) (not b!531387) (not b!531381) (not b!531386) (not b!531382) (not b!531388) (not b!531385) (not start!48326) (not b!531384))
(check-sat)
(get-model)

(declare-fun b!531432 () Bool)

(declare-fun lt!244971 () SeekEntryResult!4641)

(declare-fun e!309531 () SeekEntryResult!4641)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33679 (_ BitVec 32)) SeekEntryResult!4641)

(assert (=> b!531432 (= e!309531 (seekKeyOrZeroReturnVacant!0 (x!49767 lt!244971) (index!20790 lt!244971) (index!20790 lt!244971) k0!1998 a!3154 mask!3216))))

(declare-fun d!81259 () Bool)

(declare-fun lt!244970 () SeekEntryResult!4641)

(get-info :version)

(assert (=> d!81259 (and (or ((_ is Undefined!4641) lt!244970) (not ((_ is Found!4641) lt!244970)) (and (bvsge (index!20789 lt!244970) #b00000000000000000000000000000000) (bvslt (index!20789 lt!244970) (size!16547 a!3154)))) (or ((_ is Undefined!4641) lt!244970) ((_ is Found!4641) lt!244970) (not ((_ is MissingZero!4641) lt!244970)) (and (bvsge (index!20788 lt!244970) #b00000000000000000000000000000000) (bvslt (index!20788 lt!244970) (size!16547 a!3154)))) (or ((_ is Undefined!4641) lt!244970) ((_ is Found!4641) lt!244970) ((_ is MissingZero!4641) lt!244970) (not ((_ is MissingVacant!4641) lt!244970)) (and (bvsge (index!20791 lt!244970) #b00000000000000000000000000000000) (bvslt (index!20791 lt!244970) (size!16547 a!3154)))) (or ((_ is Undefined!4641) lt!244970) (ite ((_ is Found!4641) lt!244970) (= (select (arr!16183 a!3154) (index!20789 lt!244970)) k0!1998) (ite ((_ is MissingZero!4641) lt!244970) (= (select (arr!16183 a!3154) (index!20788 lt!244970)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4641) lt!244970) (= (select (arr!16183 a!3154) (index!20791 lt!244970)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!309529 () SeekEntryResult!4641)

(assert (=> d!81259 (= lt!244970 e!309529)))

(declare-fun c!62535 () Bool)

(assert (=> d!81259 (= c!62535 (and ((_ is Intermediate!4641) lt!244971) (undefined!5453 lt!244971)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33679 (_ BitVec 32)) SeekEntryResult!4641)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81259 (= lt!244971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81259 (validMask!0 mask!3216)))

(assert (=> d!81259 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!244970)))

(declare-fun b!531433 () Bool)

(declare-fun c!62537 () Bool)

(declare-fun lt!244972 () (_ BitVec 64))

(assert (=> b!531433 (= c!62537 (= lt!244972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309530 () SeekEntryResult!4641)

(assert (=> b!531433 (= e!309530 e!309531)))

(declare-fun b!531434 () Bool)

(assert (=> b!531434 (= e!309531 (MissingZero!4641 (index!20790 lt!244971)))))

(declare-fun b!531435 () Bool)

(assert (=> b!531435 (= e!309529 e!309530)))

(assert (=> b!531435 (= lt!244972 (select (arr!16183 a!3154) (index!20790 lt!244971)))))

(declare-fun c!62536 () Bool)

(assert (=> b!531435 (= c!62536 (= lt!244972 k0!1998))))

(declare-fun b!531436 () Bool)

(assert (=> b!531436 (= e!309530 (Found!4641 (index!20790 lt!244971)))))

(declare-fun b!531437 () Bool)

(assert (=> b!531437 (= e!309529 Undefined!4641)))

(assert (= (and d!81259 c!62535) b!531437))

(assert (= (and d!81259 (not c!62535)) b!531435))

(assert (= (and b!531435 c!62536) b!531436))

(assert (= (and b!531435 (not c!62536)) b!531433))

(assert (= (and b!531433 c!62537) b!531434))

(assert (= (and b!531433 (not c!62537)) b!531432))

(declare-fun m!511845 () Bool)

(assert (=> b!531432 m!511845))

(declare-fun m!511847 () Bool)

(assert (=> d!81259 m!511847))

(declare-fun m!511849 () Bool)

(assert (=> d!81259 m!511849))

(assert (=> d!81259 m!511817))

(declare-fun m!511851 () Bool)

(assert (=> d!81259 m!511851))

(assert (=> d!81259 m!511851))

(declare-fun m!511853 () Bool)

(assert (=> d!81259 m!511853))

(declare-fun m!511855 () Bool)

(assert (=> d!81259 m!511855))

(declare-fun m!511857 () Bool)

(assert (=> b!531435 m!511857))

(assert (=> b!531380 d!81259))

(declare-fun d!81267 () Bool)

(declare-fun res!326986 () Bool)

(declare-fun e!309536 () Bool)

(assert (=> d!81267 (=> res!326986 e!309536)))

(assert (=> d!81267 (= res!326986 ((_ is Nil!10299) Nil!10299))))

(assert (=> d!81267 (= (noDuplicate!217 Nil!10299) e!309536)))

(declare-fun b!531442 () Bool)

(declare-fun e!309537 () Bool)

(assert (=> b!531442 (= e!309536 e!309537)))

(declare-fun res!326987 () Bool)

(assert (=> b!531442 (=> (not res!326987) (not e!309537))))

(assert (=> b!531442 (= res!326987 (not (contains!2785 (t!16530 Nil!10299) (h!11238 Nil!10299))))))

(declare-fun b!531443 () Bool)

(assert (=> b!531443 (= e!309537 (noDuplicate!217 (t!16530 Nil!10299)))))

(assert (= (and d!81267 (not res!326986)) b!531442))

(assert (= (and b!531442 res!326987) b!531443))

(declare-fun m!511859 () Bool)

(assert (=> b!531442 m!511859))

(declare-fun m!511861 () Bool)

(assert (=> b!531443 m!511861))

(assert (=> b!531385 d!81267))

(declare-fun d!81269 () Bool)

(assert (=> d!81269 (= (validKeyInArray!0 (select (arr!16183 a!3154) j!147)) (and (not (= (select (arr!16183 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16183 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531384 d!81269))

(declare-fun d!81271 () Bool)

(assert (=> d!81271 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48326 d!81271))

(declare-fun d!81279 () Bool)

(assert (=> d!81279 (= (array_inv!11979 a!3154) (bvsge (size!16547 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48326 d!81279))

(declare-fun d!81281 () Bool)

(declare-fun lt!245000 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!222 (List!10302) (InoxSet (_ BitVec 64)))

(assert (=> d!81281 (= lt!245000 (select (content!222 Nil!10299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309574 () Bool)

(assert (=> d!81281 (= lt!245000 e!309574)))

(declare-fun res!327006 () Bool)

(assert (=> d!81281 (=> (not res!327006) (not e!309574))))

(assert (=> d!81281 (= res!327006 ((_ is Cons!10298) Nil!10299))))

(assert (=> d!81281 (= (contains!2785 Nil!10299 #b1000000000000000000000000000000000000000000000000000000000000000) lt!245000)))

(declare-fun b!531498 () Bool)

(declare-fun e!309575 () Bool)

(assert (=> b!531498 (= e!309574 e!309575)))

(declare-fun res!327007 () Bool)

(assert (=> b!531498 (=> res!327007 e!309575)))

(assert (=> b!531498 (= res!327007 (= (h!11238 Nil!10299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531499 () Bool)

(assert (=> b!531499 (= e!309575 (contains!2785 (t!16530 Nil!10299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81281 res!327006) b!531498))

(assert (= (and b!531498 (not res!327007)) b!531499))

(declare-fun m!511907 () Bool)

(assert (=> d!81281 m!511907))

(declare-fun m!511909 () Bool)

(assert (=> d!81281 m!511909))

(declare-fun m!511911 () Bool)

(assert (=> b!531499 m!511911))

(assert (=> b!531388 d!81281))

(declare-fun d!81289 () Bool)

(declare-fun res!327012 () Bool)

(declare-fun e!309580 () Bool)

(assert (=> d!81289 (=> res!327012 e!309580)))

(assert (=> d!81289 (= res!327012 (= (select (arr!16183 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81289 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309580)))

(declare-fun b!531504 () Bool)

(declare-fun e!309581 () Bool)

(assert (=> b!531504 (= e!309580 e!309581)))

(declare-fun res!327013 () Bool)

(assert (=> b!531504 (=> (not res!327013) (not e!309581))))

(assert (=> b!531504 (= res!327013 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16547 a!3154)))))

(declare-fun b!531505 () Bool)

(assert (=> b!531505 (= e!309581 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81289 (not res!327012)) b!531504))

(assert (= (and b!531504 res!327013) b!531505))

(declare-fun m!511913 () Bool)

(assert (=> d!81289 m!511913))

(declare-fun m!511915 () Bool)

(assert (=> b!531505 m!511915))

(assert (=> b!531382 d!81289))

(declare-fun d!81291 () Bool)

(declare-fun res!327027 () Bool)

(declare-fun e!309596 () Bool)

(assert (=> d!81291 (=> res!327027 e!309596)))

(assert (=> d!81291 (= res!327027 (bvsge #b00000000000000000000000000000000 (size!16547 a!3154)))))

(assert (=> d!81291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309596)))

(declare-fun b!531522 () Bool)

(declare-fun e!309597 () Bool)

(assert (=> b!531522 (= e!309596 e!309597)))

(declare-fun c!62558 () Bool)

(assert (=> b!531522 (= c!62558 (validKeyInArray!0 (select (arr!16183 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!531523 () Bool)

(declare-fun call!31955 () Bool)

(assert (=> b!531523 (= e!309597 call!31955)))

(declare-fun b!531524 () Bool)

(declare-fun e!309598 () Bool)

(assert (=> b!531524 (= e!309597 e!309598)))

(declare-fun lt!245008 () (_ BitVec 64))

(assert (=> b!531524 (= lt!245008 (select (arr!16183 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16834 0))(
  ( (Unit!16835) )
))
(declare-fun lt!245010 () Unit!16834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33679 (_ BitVec 64) (_ BitVec 32)) Unit!16834)

(assert (=> b!531524 (= lt!245010 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!245008 #b00000000000000000000000000000000))))

(assert (=> b!531524 (arrayContainsKey!0 a!3154 lt!245008 #b00000000000000000000000000000000)))

(declare-fun lt!245009 () Unit!16834)

(assert (=> b!531524 (= lt!245009 lt!245010)))

(declare-fun res!327026 () Bool)

(assert (=> b!531524 (= res!327026 (= (seekEntryOrOpen!0 (select (arr!16183 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4641 #b00000000000000000000000000000000)))))

(assert (=> b!531524 (=> (not res!327026) (not e!309598))))

(declare-fun bm!31952 () Bool)

(assert (=> bm!31952 (= call!31955 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!531525 () Bool)

(assert (=> b!531525 (= e!309598 call!31955)))

(assert (= (and d!81291 (not res!327027)) b!531522))

(assert (= (and b!531522 c!62558) b!531524))

(assert (= (and b!531522 (not c!62558)) b!531523))

(assert (= (and b!531524 res!327026) b!531525))

(assert (= (or b!531525 b!531523) bm!31952))

(assert (=> b!531522 m!511913))

(assert (=> b!531522 m!511913))

(declare-fun m!511925 () Bool)

(assert (=> b!531522 m!511925))

(assert (=> b!531524 m!511913))

(declare-fun m!511927 () Bool)

(assert (=> b!531524 m!511927))

(declare-fun m!511929 () Bool)

(assert (=> b!531524 m!511929))

(assert (=> b!531524 m!511913))

(declare-fun m!511931 () Bool)

(assert (=> b!531524 m!511931))

(declare-fun m!511933 () Bool)

(assert (=> bm!31952 m!511933))

(assert (=> b!531387 d!81291))

(declare-fun d!81307 () Bool)

(declare-fun lt!245011 () Bool)

(assert (=> d!81307 (= lt!245011 (select (content!222 Nil!10299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309599 () Bool)

(assert (=> d!81307 (= lt!245011 e!309599)))

(declare-fun res!327028 () Bool)

(assert (=> d!81307 (=> (not res!327028) (not e!309599))))

(assert (=> d!81307 (= res!327028 ((_ is Cons!10298) Nil!10299))))

(assert (=> d!81307 (= (contains!2785 Nil!10299 #b0000000000000000000000000000000000000000000000000000000000000000) lt!245011)))

(declare-fun b!531526 () Bool)

(declare-fun e!309600 () Bool)

(assert (=> b!531526 (= e!309599 e!309600)))

(declare-fun res!327029 () Bool)

(assert (=> b!531526 (=> res!327029 e!309600)))

(assert (=> b!531526 (= res!327029 (= (h!11238 Nil!10299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531527 () Bool)

(assert (=> b!531527 (= e!309600 (contains!2785 (t!16530 Nil!10299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!81307 res!327028) b!531526))

(assert (= (and b!531526 (not res!327029)) b!531527))

(assert (=> d!81307 m!511907))

(declare-fun m!511935 () Bool)

(assert (=> d!81307 m!511935))

(declare-fun m!511937 () Bool)

(assert (=> b!531527 m!511937))

(assert (=> b!531381 d!81307))

(declare-fun d!81309 () Bool)

(assert (=> d!81309 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531386 d!81309))

(check-sat (not d!81307) (not b!531442) (not d!81259) (not d!81281) (not b!531432) (not b!531505) (not b!531524) (not b!531527) (not b!531499) (not bm!31952) (not b!531443) (not b!531522))
(check-sat)
