; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49078 () Bool)

(assert start!49078)

(declare-fun b!540558 () Bool)

(declare-fun res!335501 () Bool)

(declare-fun e!313175 () Bool)

(assert (=> b!540558 (=> (not res!335501) (not e!313175))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34187 0))(
  ( (array!34188 (arr!16429 (Array (_ BitVec 32) (_ BitVec 64))) (size!16793 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34187)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540558 (= res!335501 (and (= (size!16793 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16793 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16793 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540559 () Bool)

(declare-fun res!335508 () Bool)

(assert (=> b!540559 (=> (not res!335508) (not e!313175))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540559 (= res!335508 (validKeyInArray!0 k0!1998))))

(declare-fun b!540560 () Bool)

(declare-fun res!335507 () Bool)

(assert (=> b!540560 (=> (not res!335507) (not e!313175))))

(assert (=> b!540560 (= res!335507 (validKeyInArray!0 (select (arr!16429 a!3154) j!147)))))

(declare-fun b!540561 () Bool)

(declare-fun res!335500 () Bool)

(declare-fun e!313174 () Bool)

(assert (=> b!540561 (=> (not res!335500) (not e!313174))))

(declare-datatypes ((List!10455 0))(
  ( (Nil!10452) (Cons!10451 (h!11400 (_ BitVec 64)) (t!16675 List!10455)) )
))
(declare-fun arrayNoDuplicates!0 (array!34187 (_ BitVec 32) List!10455) Bool)

(assert (=> b!540561 (= res!335500 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10452))))

(declare-fun res!335502 () Bool)

(assert (=> start!49078 (=> (not res!335502) (not e!313175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49078 (= res!335502 (validMask!0 mask!3216))))

(assert (=> start!49078 e!313175))

(assert (=> start!49078 true))

(declare-fun array_inv!12288 (array!34187) Bool)

(assert (=> start!49078 (array_inv!12288 a!3154)))

(declare-fun b!540562 () Bool)

(declare-fun res!335506 () Bool)

(assert (=> b!540562 (=> (not res!335506) (not e!313174))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540562 (= res!335506 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16793 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16793 a!3154)) (= (select (arr!16429 a!3154) resIndex!32) (select (arr!16429 a!3154) j!147))))))

(declare-fun b!540563 () Bool)

(declare-fun res!335503 () Bool)

(assert (=> b!540563 (=> (not res!335503) (not e!313174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34187 (_ BitVec 32)) Bool)

(assert (=> b!540563 (= res!335503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540564 () Bool)

(declare-fun e!313173 () Bool)

(assert (=> b!540564 (= e!313173 (and (not (= (select (arr!16429 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16429 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540565 () Bool)

(assert (=> b!540565 (= e!313175 e!313174)))

(declare-fun res!335505 () Bool)

(assert (=> b!540565 (=> (not res!335505) (not e!313174))))

(declare-datatypes ((SeekEntryResult!4843 0))(
  ( (MissingZero!4843 (index!21596 (_ BitVec 32))) (Found!4843 (index!21597 (_ BitVec 32))) (Intermediate!4843 (undefined!5655 Bool) (index!21598 (_ BitVec 32)) (x!50659 (_ BitVec 32))) (Undefined!4843) (MissingVacant!4843 (index!21599 (_ BitVec 32))) )
))
(declare-fun lt!247470 () SeekEntryResult!4843)

(assert (=> b!540565 (= res!335505 (or (= lt!247470 (MissingZero!4843 i!1153)) (= lt!247470 (MissingVacant!4843 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34187 (_ BitVec 32)) SeekEntryResult!4843)

(assert (=> b!540565 (= lt!247470 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540566 () Bool)

(assert (=> b!540566 (= e!313174 e!313173)))

(declare-fun res!335509 () Bool)

(assert (=> b!540566 (=> (not res!335509) (not e!313173))))

(declare-fun lt!247471 () SeekEntryResult!4843)

(assert (=> b!540566 (= res!335509 (= lt!247471 (Intermediate!4843 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34187 (_ BitVec 32)) SeekEntryResult!4843)

(assert (=> b!540566 (= lt!247471 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16429 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540567 () Bool)

(declare-fun res!335499 () Bool)

(assert (=> b!540567 (=> (not res!335499) (not e!313175))))

(declare-fun arrayContainsKey!0 (array!34187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540567 (= res!335499 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540568 () Bool)

(declare-fun res!335504 () Bool)

(assert (=> b!540568 (=> (not res!335504) (not e!313173))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540568 (= res!335504 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16429 a!3154) j!147) mask!3216) (select (arr!16429 a!3154) j!147) a!3154 mask!3216) lt!247471))))

(assert (= (and start!49078 res!335502) b!540558))

(assert (= (and b!540558 res!335501) b!540560))

(assert (= (and b!540560 res!335507) b!540559))

(assert (= (and b!540559 res!335508) b!540567))

(assert (= (and b!540567 res!335499) b!540565))

(assert (= (and b!540565 res!335505) b!540563))

(assert (= (and b!540563 res!335503) b!540561))

(assert (= (and b!540561 res!335500) b!540562))

(assert (= (and b!540562 res!335506) b!540566))

(assert (= (and b!540566 res!335509) b!540568))

(assert (= (and b!540568 res!335504) b!540564))

(declare-fun m!519487 () Bool)

(assert (=> b!540567 m!519487))

(declare-fun m!519489 () Bool)

(assert (=> b!540562 m!519489))

(declare-fun m!519491 () Bool)

(assert (=> b!540562 m!519491))

(declare-fun m!519493 () Bool)

(assert (=> b!540563 m!519493))

(assert (=> b!540560 m!519491))

(assert (=> b!540560 m!519491))

(declare-fun m!519495 () Bool)

(assert (=> b!540560 m!519495))

(declare-fun m!519497 () Bool)

(assert (=> b!540565 m!519497))

(assert (=> b!540566 m!519491))

(assert (=> b!540566 m!519491))

(declare-fun m!519499 () Bool)

(assert (=> b!540566 m!519499))

(declare-fun m!519501 () Bool)

(assert (=> b!540561 m!519501))

(declare-fun m!519503 () Bool)

(assert (=> b!540559 m!519503))

(assert (=> b!540568 m!519491))

(assert (=> b!540568 m!519491))

(declare-fun m!519505 () Bool)

(assert (=> b!540568 m!519505))

(assert (=> b!540568 m!519505))

(assert (=> b!540568 m!519491))

(declare-fun m!519507 () Bool)

(assert (=> b!540568 m!519507))

(declare-fun m!519509 () Bool)

(assert (=> start!49078 m!519509))

(declare-fun m!519511 () Bool)

(assert (=> start!49078 m!519511))

(declare-fun m!519513 () Bool)

(assert (=> b!540564 m!519513))

(check-sat (not b!540560) (not start!49078) (not b!540566) (not b!540559) (not b!540565) (not b!540563) (not b!540568) (not b!540567) (not b!540561))
(check-sat)
(get-model)

(declare-fun d!81769 () Bool)

(declare-fun res!335580 () Bool)

(declare-fun e!313205 () Bool)

(assert (=> d!81769 (=> res!335580 e!313205)))

(assert (=> d!81769 (= res!335580 (= (select (arr!16429 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81769 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!313205)))

(declare-fun b!540639 () Bool)

(declare-fun e!313206 () Bool)

(assert (=> b!540639 (= e!313205 e!313206)))

(declare-fun res!335581 () Bool)

(assert (=> b!540639 (=> (not res!335581) (not e!313206))))

(assert (=> b!540639 (= res!335581 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16793 a!3154)))))

(declare-fun b!540640 () Bool)

(assert (=> b!540640 (= e!313206 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81769 (not res!335580)) b!540639))

(assert (= (and b!540639 res!335581) b!540640))

(declare-fun m!519571 () Bool)

(assert (=> d!81769 m!519571))

(declare-fun m!519573 () Bool)

(assert (=> b!540640 m!519573))

(assert (=> b!540567 d!81769))

(declare-fun b!540686 () Bool)

(declare-fun e!313235 () SeekEntryResult!4843)

(assert (=> b!540686 (= e!313235 (Intermediate!4843 false (toIndex!0 (select (arr!16429 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!540687 () Bool)

(declare-fun lt!247494 () SeekEntryResult!4843)

(assert (=> b!540687 (and (bvsge (index!21598 lt!247494) #b00000000000000000000000000000000) (bvslt (index!21598 lt!247494) (size!16793 a!3154)))))

(declare-fun res!335597 () Bool)

(assert (=> b!540687 (= res!335597 (= (select (arr!16429 a!3154) (index!21598 lt!247494)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313236 () Bool)

(assert (=> b!540687 (=> res!335597 e!313236)))

(declare-fun b!540688 () Bool)

(declare-fun e!313234 () SeekEntryResult!4843)

(assert (=> b!540688 (= e!313234 e!313235)))

(declare-fun lt!247495 () (_ BitVec 64))

(declare-fun c!62860 () Bool)

(assert (=> b!540688 (= c!62860 (or (= lt!247495 (select (arr!16429 a!3154) j!147)) (= (bvadd lt!247495 lt!247495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540689 () Bool)

(assert (=> b!540689 (and (bvsge (index!21598 lt!247494) #b00000000000000000000000000000000) (bvslt (index!21598 lt!247494) (size!16793 a!3154)))))

(assert (=> b!540689 (= e!313236 (= (select (arr!16429 a!3154) (index!21598 lt!247494)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!81771 () Bool)

(declare-fun e!313233 () Bool)

(assert (=> d!81771 e!313233))

(declare-fun c!62859 () Bool)

(get-info :version)

(assert (=> d!81771 (= c!62859 (and ((_ is Intermediate!4843) lt!247494) (undefined!5655 lt!247494)))))

(assert (=> d!81771 (= lt!247494 e!313234)))

(declare-fun c!62861 () Bool)

(assert (=> d!81771 (= c!62861 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81771 (= lt!247495 (select (arr!16429 a!3154) (toIndex!0 (select (arr!16429 a!3154) j!147) mask!3216)))))

(assert (=> d!81771 (validMask!0 mask!3216)))

(assert (=> d!81771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16429 a!3154) j!147) mask!3216) (select (arr!16429 a!3154) j!147) a!3154 mask!3216) lt!247494)))

(declare-fun b!540690 () Bool)

(assert (=> b!540690 (= e!313234 (Intermediate!4843 true (toIndex!0 (select (arr!16429 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!540691 () Bool)

(assert (=> b!540691 (and (bvsge (index!21598 lt!247494) #b00000000000000000000000000000000) (bvslt (index!21598 lt!247494) (size!16793 a!3154)))))

(declare-fun res!335599 () Bool)

(assert (=> b!540691 (= res!335599 (= (select (arr!16429 a!3154) (index!21598 lt!247494)) (select (arr!16429 a!3154) j!147)))))

(assert (=> b!540691 (=> res!335599 e!313236)))

(declare-fun e!313232 () Bool)

(assert (=> b!540691 (= e!313232 e!313236)))

(declare-fun b!540692 () Bool)

(assert (=> b!540692 (= e!313233 (bvsge (x!50659 lt!247494) #b01111111111111111111111111111110))))

(declare-fun b!540693 () Bool)

(assert (=> b!540693 (= e!313233 e!313232)))

(declare-fun res!335598 () Bool)

(assert (=> b!540693 (= res!335598 (and ((_ is Intermediate!4843) lt!247494) (not (undefined!5655 lt!247494)) (bvslt (x!50659 lt!247494) #b01111111111111111111111111111110) (bvsge (x!50659 lt!247494) #b00000000000000000000000000000000) (bvsge (x!50659 lt!247494) #b00000000000000000000000000000000)))))

(assert (=> b!540693 (=> (not res!335598) (not e!313232))))

(declare-fun b!540694 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540694 (= e!313235 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16429 a!3154) j!147) mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16429 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and d!81771 c!62861) b!540690))

(assert (= (and d!81771 (not c!62861)) b!540688))

(assert (= (and b!540688 c!62860) b!540686))

(assert (= (and b!540688 (not c!62860)) b!540694))

(assert (= (and d!81771 c!62859) b!540692))

(assert (= (and d!81771 (not c!62859)) b!540693))

(assert (= (and b!540693 res!335598) b!540691))

(assert (= (and b!540691 (not res!335599)) b!540687))

(assert (= (and b!540687 (not res!335597)) b!540689))

(declare-fun m!519583 () Bool)

(assert (=> b!540691 m!519583))

(assert (=> b!540694 m!519505))

(declare-fun m!519585 () Bool)

(assert (=> b!540694 m!519585))

(assert (=> b!540694 m!519585))

(assert (=> b!540694 m!519491))

(declare-fun m!519587 () Bool)

(assert (=> b!540694 m!519587))

(assert (=> d!81771 m!519505))

(declare-fun m!519589 () Bool)

(assert (=> d!81771 m!519589))

(assert (=> d!81771 m!519509))

(assert (=> b!540689 m!519583))

(assert (=> b!540687 m!519583))

(assert (=> b!540568 d!81771))

(declare-fun d!81779 () Bool)

(declare-fun lt!247507 () (_ BitVec 32))

(declare-fun lt!247506 () (_ BitVec 32))

(assert (=> d!81779 (= lt!247507 (bvmul (bvxor lt!247506 (bvlshr lt!247506 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81779 (= lt!247506 ((_ extract 31 0) (bvand (bvxor (select (arr!16429 a!3154) j!147) (bvlshr (select (arr!16429 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81779 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!335607 (let ((h!11404 ((_ extract 31 0) (bvand (bvxor (select (arr!16429 a!3154) j!147) (bvlshr (select (arr!16429 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50665 (bvmul (bvxor h!11404 (bvlshr h!11404 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50665 (bvlshr x!50665 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!335607 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!335607 #b00000000000000000000000000000000))))))

(assert (=> d!81779 (= (toIndex!0 (select (arr!16429 a!3154) j!147) mask!3216) (bvand (bvxor lt!247507 (bvlshr lt!247507 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!540568 d!81779))

(declare-fun b!540724 () Bool)

(declare-fun e!313263 () Bool)

(declare-fun call!32025 () Bool)

(assert (=> b!540724 (= e!313263 call!32025)))

(declare-fun d!81787 () Bool)

(declare-fun res!335622 () Bool)

(declare-fun e!313262 () Bool)

(assert (=> d!81787 (=> res!335622 e!313262)))

(assert (=> d!81787 (= res!335622 (bvsge #b00000000000000000000000000000000 (size!16793 a!3154)))))

(assert (=> d!81787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313262)))

(declare-fun bm!32022 () Bool)

(assert (=> bm!32022 (= call!32025 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!540725 () Bool)

(declare-fun e!313261 () Bool)

(assert (=> b!540725 (= e!313263 e!313261)))

(declare-fun lt!247515 () (_ BitVec 64))

(assert (=> b!540725 (= lt!247515 (select (arr!16429 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16865 0))(
  ( (Unit!16866) )
))
(declare-fun lt!247516 () Unit!16865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34187 (_ BitVec 64) (_ BitVec 32)) Unit!16865)

(assert (=> b!540725 (= lt!247516 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247515 #b00000000000000000000000000000000))))

(assert (=> b!540725 (arrayContainsKey!0 a!3154 lt!247515 #b00000000000000000000000000000000)))

(declare-fun lt!247514 () Unit!16865)

(assert (=> b!540725 (= lt!247514 lt!247516)))

(declare-fun res!335621 () Bool)

(assert (=> b!540725 (= res!335621 (= (seekEntryOrOpen!0 (select (arr!16429 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4843 #b00000000000000000000000000000000)))))

(assert (=> b!540725 (=> (not res!335621) (not e!313261))))

(declare-fun b!540726 () Bool)

(assert (=> b!540726 (= e!313262 e!313263)))

(declare-fun c!62867 () Bool)

(assert (=> b!540726 (= c!62867 (validKeyInArray!0 (select (arr!16429 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540727 () Bool)

(assert (=> b!540727 (= e!313261 call!32025)))

(assert (= (and d!81787 (not res!335622)) b!540726))

(assert (= (and b!540726 c!62867) b!540725))

(assert (= (and b!540726 (not c!62867)) b!540724))

(assert (= (and b!540725 res!335621) b!540727))

(assert (= (or b!540727 b!540724) bm!32022))

(declare-fun m!519603 () Bool)

(assert (=> bm!32022 m!519603))

(assert (=> b!540725 m!519571))

(declare-fun m!519605 () Bool)

(assert (=> b!540725 m!519605))

(declare-fun m!519607 () Bool)

(assert (=> b!540725 m!519607))

(assert (=> b!540725 m!519571))

(declare-fun m!519609 () Bool)

(assert (=> b!540725 m!519609))

(assert (=> b!540726 m!519571))

(assert (=> b!540726 m!519571))

(declare-fun m!519611 () Bool)

(assert (=> b!540726 m!519611))

(assert (=> b!540563 d!81787))

(declare-fun d!81795 () Bool)

(assert (=> d!81795 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49078 d!81795))

(declare-fun d!81801 () Bool)

(assert (=> d!81801 (= (array_inv!12288 a!3154) (bvsge (size!16793 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49078 d!81801))

(declare-fun d!81803 () Bool)

(assert (=> d!81803 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540559 d!81803))

(declare-fun d!81807 () Bool)

(assert (=> d!81807 (= (validKeyInArray!0 (select (arr!16429 a!3154) j!147)) (and (not (= (select (arr!16429 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16429 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!540560 d!81807))

(declare-fun b!540811 () Bool)

(declare-fun e!313310 () SeekEntryResult!4843)

(declare-fun e!313311 () SeekEntryResult!4843)

(assert (=> b!540811 (= e!313310 e!313311)))

(declare-fun lt!247553 () (_ BitVec 64))

(declare-fun lt!247555 () SeekEntryResult!4843)

(assert (=> b!540811 (= lt!247553 (select (arr!16429 a!3154) (index!21598 lt!247555)))))

(declare-fun c!62903 () Bool)

(assert (=> b!540811 (= c!62903 (= lt!247553 k0!1998))))

(declare-fun b!540812 () Bool)

(assert (=> b!540812 (= e!313311 (Found!4843 (index!21598 lt!247555)))))

(declare-fun e!313309 () SeekEntryResult!4843)

(declare-fun b!540813 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34187 (_ BitVec 32)) SeekEntryResult!4843)

(assert (=> b!540813 (= e!313309 (seekKeyOrZeroReturnVacant!0 (x!50659 lt!247555) (index!21598 lt!247555) (index!21598 lt!247555) k0!1998 a!3154 mask!3216))))

(declare-fun d!81809 () Bool)

(declare-fun lt!247554 () SeekEntryResult!4843)

(assert (=> d!81809 (and (or ((_ is Undefined!4843) lt!247554) (not ((_ is Found!4843) lt!247554)) (and (bvsge (index!21597 lt!247554) #b00000000000000000000000000000000) (bvslt (index!21597 lt!247554) (size!16793 a!3154)))) (or ((_ is Undefined!4843) lt!247554) ((_ is Found!4843) lt!247554) (not ((_ is MissingZero!4843) lt!247554)) (and (bvsge (index!21596 lt!247554) #b00000000000000000000000000000000) (bvslt (index!21596 lt!247554) (size!16793 a!3154)))) (or ((_ is Undefined!4843) lt!247554) ((_ is Found!4843) lt!247554) ((_ is MissingZero!4843) lt!247554) (not ((_ is MissingVacant!4843) lt!247554)) (and (bvsge (index!21599 lt!247554) #b00000000000000000000000000000000) (bvslt (index!21599 lt!247554) (size!16793 a!3154)))) (or ((_ is Undefined!4843) lt!247554) (ite ((_ is Found!4843) lt!247554) (= (select (arr!16429 a!3154) (index!21597 lt!247554)) k0!1998) (ite ((_ is MissingZero!4843) lt!247554) (= (select (arr!16429 a!3154) (index!21596 lt!247554)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4843) lt!247554) (= (select (arr!16429 a!3154) (index!21599 lt!247554)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81809 (= lt!247554 e!313310)))

(declare-fun c!62905 () Bool)

(assert (=> d!81809 (= c!62905 (and ((_ is Intermediate!4843) lt!247555) (undefined!5655 lt!247555)))))

(assert (=> d!81809 (= lt!247555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81809 (validMask!0 mask!3216)))

(assert (=> d!81809 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247554)))

(declare-fun b!540814 () Bool)

(assert (=> b!540814 (= e!313310 Undefined!4843)))

(declare-fun b!540815 () Bool)

(assert (=> b!540815 (= e!313309 (MissingZero!4843 (index!21598 lt!247555)))))

(declare-fun b!540816 () Bool)

(declare-fun c!62904 () Bool)

(assert (=> b!540816 (= c!62904 (= lt!247553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!540816 (= e!313311 e!313309)))

(assert (= (and d!81809 c!62905) b!540814))

(assert (= (and d!81809 (not c!62905)) b!540811))

(assert (= (and b!540811 c!62903) b!540812))

(assert (= (and b!540811 (not c!62903)) b!540816))

(assert (= (and b!540816 c!62904) b!540815))

(assert (= (and b!540816 (not c!62904)) b!540813))

(declare-fun m!519641 () Bool)

(assert (=> b!540811 m!519641))

(declare-fun m!519643 () Bool)

(assert (=> b!540813 m!519643))

(declare-fun m!519645 () Bool)

(assert (=> d!81809 m!519645))

(declare-fun m!519647 () Bool)

(assert (=> d!81809 m!519647))

(assert (=> d!81809 m!519509))

(declare-fun m!519651 () Bool)

(assert (=> d!81809 m!519651))

(declare-fun m!519653 () Bool)

(assert (=> d!81809 m!519653))

(assert (=> d!81809 m!519645))

(declare-fun m!519657 () Bool)

(assert (=> d!81809 m!519657))

(assert (=> b!540565 d!81809))

(declare-fun b!540817 () Bool)

(declare-fun e!313315 () SeekEntryResult!4843)

(assert (=> b!540817 (= e!313315 (Intermediate!4843 false index!1177 x!1030))))

(declare-fun b!540818 () Bool)

(declare-fun lt!247556 () SeekEntryResult!4843)

(assert (=> b!540818 (and (bvsge (index!21598 lt!247556) #b00000000000000000000000000000000) (bvslt (index!21598 lt!247556) (size!16793 a!3154)))))

(declare-fun res!335636 () Bool)

(assert (=> b!540818 (= res!335636 (= (select (arr!16429 a!3154) (index!21598 lt!247556)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!313316 () Bool)

(assert (=> b!540818 (=> res!335636 e!313316)))

(declare-fun b!540819 () Bool)

(declare-fun e!313314 () SeekEntryResult!4843)

(assert (=> b!540819 (= e!313314 e!313315)))

(declare-fun lt!247557 () (_ BitVec 64))

(declare-fun c!62907 () Bool)

(assert (=> b!540819 (= c!62907 (or (= lt!247557 (select (arr!16429 a!3154) j!147)) (= (bvadd lt!247557 lt!247557) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!540820 () Bool)

(assert (=> b!540820 (and (bvsge (index!21598 lt!247556) #b00000000000000000000000000000000) (bvslt (index!21598 lt!247556) (size!16793 a!3154)))))

(assert (=> b!540820 (= e!313316 (= (select (arr!16429 a!3154) (index!21598 lt!247556)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!81813 () Bool)

(declare-fun e!313313 () Bool)

(assert (=> d!81813 e!313313))

(declare-fun c!62906 () Bool)

(assert (=> d!81813 (= c!62906 (and ((_ is Intermediate!4843) lt!247556) (undefined!5655 lt!247556)))))

(assert (=> d!81813 (= lt!247556 e!313314)))

(declare-fun c!62908 () Bool)

(assert (=> d!81813 (= c!62908 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81813 (= lt!247557 (select (arr!16429 a!3154) index!1177))))

(assert (=> d!81813 (validMask!0 mask!3216)))

(assert (=> d!81813 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16429 a!3154) j!147) a!3154 mask!3216) lt!247556)))

(declare-fun b!540821 () Bool)

(assert (=> b!540821 (= e!313314 (Intermediate!4843 true index!1177 x!1030))))

(declare-fun b!540822 () Bool)

(assert (=> b!540822 (and (bvsge (index!21598 lt!247556) #b00000000000000000000000000000000) (bvslt (index!21598 lt!247556) (size!16793 a!3154)))))

(declare-fun res!335638 () Bool)

(assert (=> b!540822 (= res!335638 (= (select (arr!16429 a!3154) (index!21598 lt!247556)) (select (arr!16429 a!3154) j!147)))))

(assert (=> b!540822 (=> res!335638 e!313316)))

(declare-fun e!313312 () Bool)

(assert (=> b!540822 (= e!313312 e!313316)))

(declare-fun b!540823 () Bool)

(assert (=> b!540823 (= e!313313 (bvsge (x!50659 lt!247556) #b01111111111111111111111111111110))))

(declare-fun b!540824 () Bool)

(assert (=> b!540824 (= e!313313 e!313312)))

(declare-fun res!335637 () Bool)

(assert (=> b!540824 (= res!335637 (and ((_ is Intermediate!4843) lt!247556) (not (undefined!5655 lt!247556)) (bvslt (x!50659 lt!247556) #b01111111111111111111111111111110) (bvsge (x!50659 lt!247556) #b00000000000000000000000000000000) (bvsge (x!50659 lt!247556) x!1030)))))

(assert (=> b!540824 (=> (not res!335637) (not e!313312))))

(declare-fun b!540825 () Bool)

(assert (=> b!540825 (= e!313315 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16429 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and d!81813 c!62908) b!540821))

(assert (= (and d!81813 (not c!62908)) b!540819))

(assert (= (and b!540819 c!62907) b!540817))

(assert (= (and b!540819 (not c!62907)) b!540825))

(assert (= (and d!81813 c!62906) b!540823))

(assert (= (and d!81813 (not c!62906)) b!540824))

(assert (= (and b!540824 res!335637) b!540822))

(assert (= (and b!540822 (not res!335638)) b!540818))

(assert (= (and b!540818 (not res!335636)) b!540820))

(declare-fun m!519661 () Bool)

(assert (=> b!540822 m!519661))

(declare-fun m!519663 () Bool)

(assert (=> b!540825 m!519663))

(assert (=> b!540825 m!519663))

(assert (=> b!540825 m!519491))

(declare-fun m!519665 () Bool)

(assert (=> b!540825 m!519665))

(assert (=> d!81813 m!519513))

(assert (=> d!81813 m!519509))

(assert (=> b!540820 m!519661))

(assert (=> b!540818 m!519661))

(assert (=> b!540566 d!81813))

(declare-fun bm!32030 () Bool)

(declare-fun call!32033 () Bool)

(declare-fun c!62920 () Bool)

(assert (=> bm!32030 (= call!32033 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62920 (Cons!10451 (select (arr!16429 a!3154) #b00000000000000000000000000000000) Nil!10452) Nil!10452)))))

(declare-fun b!540874 () Bool)

(declare-fun e!313352 () Bool)

(declare-fun contains!2776 (List!10455 (_ BitVec 64)) Bool)

(assert (=> b!540874 (= e!313352 (contains!2776 Nil!10452 (select (arr!16429 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540875 () Bool)

(declare-fun e!313354 () Bool)

(declare-fun e!313355 () Bool)

(assert (=> b!540875 (= e!313354 e!313355)))

(declare-fun res!335668 () Bool)

(assert (=> b!540875 (=> (not res!335668) (not e!313355))))

(assert (=> b!540875 (= res!335668 (not e!313352))))

(declare-fun res!335666 () Bool)

(assert (=> b!540875 (=> (not res!335666) (not e!313352))))

(assert (=> b!540875 (= res!335666 (validKeyInArray!0 (select (arr!16429 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!540876 () Bool)

(declare-fun e!313353 () Bool)

(assert (=> b!540876 (= e!313353 call!32033)))

(declare-fun b!540877 () Bool)

(assert (=> b!540877 (= e!313355 e!313353)))

(assert (=> b!540877 (= c!62920 (validKeyInArray!0 (select (arr!16429 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81817 () Bool)

(declare-fun res!335667 () Bool)

(assert (=> d!81817 (=> res!335667 e!313354)))

(assert (=> d!81817 (= res!335667 (bvsge #b00000000000000000000000000000000 (size!16793 a!3154)))))

(assert (=> d!81817 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10452) e!313354)))

(declare-fun b!540878 () Bool)

(assert (=> b!540878 (= e!313353 call!32033)))

(assert (= (and d!81817 (not res!335667)) b!540875))

(assert (= (and b!540875 res!335666) b!540874))

(assert (= (and b!540875 res!335668) b!540877))

(assert (= (and b!540877 c!62920) b!540876))

(assert (= (and b!540877 (not c!62920)) b!540878))

(assert (= (or b!540876 b!540878) bm!32030))

(assert (=> bm!32030 m!519571))

(declare-fun m!519693 () Bool)

(assert (=> bm!32030 m!519693))

(assert (=> b!540874 m!519571))

(assert (=> b!540874 m!519571))

(declare-fun m!519695 () Bool)

(assert (=> b!540874 m!519695))

(assert (=> b!540875 m!519571))

(assert (=> b!540875 m!519571))

(assert (=> b!540875 m!519611))

(assert (=> b!540877 m!519571))

(assert (=> b!540877 m!519571))

(assert (=> b!540877 m!519611))

(assert (=> b!540561 d!81817))

(check-sat (not bm!32030) (not d!81813) (not b!540877) (not b!540813) (not b!540874) (not bm!32022) (not b!540825) (not b!540726) (not d!81809) (not b!540725) (not b!540640) (not b!540875) (not d!81771) (not b!540694))
(check-sat)
