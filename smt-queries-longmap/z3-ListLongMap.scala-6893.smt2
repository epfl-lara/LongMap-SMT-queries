; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86658 () Bool)

(assert start!86658)

(declare-fun b!1004701 () Bool)

(declare-fun e!565752 () Bool)

(declare-fun e!565751 () Bool)

(assert (=> b!1004701 (= e!565752 e!565751)))

(declare-fun res!674114 () Bool)

(assert (=> b!1004701 (=> (not res!674114) (not e!565751))))

(declare-datatypes ((SeekEntryResult!9458 0))(
  ( (MissingZero!9458 (index!40203 (_ BitVec 32))) (Found!9458 (index!40204 (_ BitVec 32))) (Intermediate!9458 (undefined!10270 Bool) (index!40205 (_ BitVec 32)) (x!87623 (_ BitVec 32))) (Undefined!9458) (MissingVacant!9458 (index!40206 (_ BitVec 32))) )
))
(declare-fun lt!444137 () SeekEntryResult!9458)

(declare-fun lt!444138 () SeekEntryResult!9458)

(assert (=> b!1004701 (= res!674114 (= lt!444137 lt!444138))))

(declare-datatypes ((array!63355 0))(
  ( (array!63356 (arr!30501 (Array (_ BitVec 32) (_ BitVec 64))) (size!31005 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63355)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63355 (_ BitVec 32)) SeekEntryResult!9458)

(assert (=> b!1004701 (= lt!444137 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30501 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004702 () Bool)

(declare-fun e!565749 () Bool)

(declare-fun e!565753 () Bool)

(assert (=> b!1004702 (= e!565749 e!565753)))

(declare-fun res!674109 () Bool)

(assert (=> b!1004702 (=> (not res!674109) (not e!565753))))

(declare-fun lt!444139 () SeekEntryResult!9458)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004702 (= res!674109 (or (= lt!444139 (MissingVacant!9458 i!1194)) (= lt!444139 (MissingZero!9458 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63355 (_ BitVec 32)) SeekEntryResult!9458)

(assert (=> b!1004702 (= lt!444139 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1004703 () Bool)

(declare-fun res!674108 () Bool)

(assert (=> b!1004703 (=> (not res!674108) (not e!565749))))

(assert (=> b!1004703 (= res!674108 (and (= (size!31005 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31005 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31005 a!3219)) (not (= i!1194 j!170))))))

(declare-fun e!565754 () Bool)

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun b!1004704 () Bool)

(assert (=> b!1004704 (= e!565754 (and (not (= index!1507 resIndex!38)) (= index!1507 i!1194)))))

(declare-fun res!674119 () Bool)

(assert (=> start!86658 (=> (not res!674119) (not e!565749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86658 (= res!674119 (validMask!0 mask!3464))))

(assert (=> start!86658 e!565749))

(declare-fun array_inv!23644 (array!63355) Bool)

(assert (=> start!86658 (array_inv!23644 a!3219)))

(assert (=> start!86658 true))

(declare-fun b!1004705 () Bool)

(declare-fun res!674113 () Bool)

(assert (=> b!1004705 (=> (not res!674113) (not e!565749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004705 (= res!674113 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004706 () Bool)

(declare-fun res!674112 () Bool)

(assert (=> b!1004706 (=> (not res!674112) (not e!565749))))

(assert (=> b!1004706 (= res!674112 (validKeyInArray!0 (select (arr!30501 a!3219) j!170)))))

(declare-fun b!1004707 () Bool)

(assert (=> b!1004707 (= e!565753 e!565752)))

(declare-fun res!674115 () Bool)

(assert (=> b!1004707 (=> (not res!674115) (not e!565752))))

(declare-fun lt!444136 () SeekEntryResult!9458)

(assert (=> b!1004707 (= res!674115 (= lt!444136 lt!444138))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004707 (= lt!444138 (Intermediate!9458 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004707 (= lt!444136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30501 a!3219) j!170) mask!3464) (select (arr!30501 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004708 () Bool)

(declare-fun res!674111 () Bool)

(assert (=> b!1004708 (=> (not res!674111) (not e!565754))))

(declare-fun lt!444135 () array!63355)

(declare-fun lt!444134 () (_ BitVec 64))

(assert (=> b!1004708 (= res!674111 (not (= lt!444137 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444134 lt!444135 mask!3464))))))

(declare-fun b!1004709 () Bool)

(declare-fun res!674110 () Bool)

(assert (=> b!1004709 (=> (not res!674110) (not e!565753))))

(assert (=> b!1004709 (= res!674110 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31005 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31005 a!3219))))))

(declare-fun b!1004710 () Bool)

(assert (=> b!1004710 (= e!565751 e!565754)))

(declare-fun res!674117 () Bool)

(assert (=> b!1004710 (=> (not res!674117) (not e!565754))))

(assert (=> b!1004710 (= res!674117 (not (= lt!444136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444134 mask!3464) lt!444134 lt!444135 mask!3464))))))

(assert (=> b!1004710 (= lt!444134 (select (store (arr!30501 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004710 (= lt!444135 (array!63356 (store (arr!30501 a!3219) i!1194 k0!2224) (size!31005 a!3219)))))

(declare-fun b!1004711 () Bool)

(declare-fun res!674118 () Bool)

(assert (=> b!1004711 (=> (not res!674118) (not e!565753))))

(declare-datatypes ((List!21243 0))(
  ( (Nil!21240) (Cons!21239 (h!22419 (_ BitVec 64)) (t!30235 List!21243)) )
))
(declare-fun arrayNoDuplicates!0 (array!63355 (_ BitVec 32) List!21243) Bool)

(assert (=> b!1004711 (= res!674118 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21240))))

(declare-fun b!1004712 () Bool)

(declare-fun res!674116 () Bool)

(assert (=> b!1004712 (=> (not res!674116) (not e!565753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63355 (_ BitVec 32)) Bool)

(assert (=> b!1004712 (= res!674116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004713 () Bool)

(declare-fun res!674120 () Bool)

(assert (=> b!1004713 (=> (not res!674120) (not e!565749))))

(declare-fun arrayContainsKey!0 (array!63355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004713 (= res!674120 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86658 res!674119) b!1004703))

(assert (= (and b!1004703 res!674108) b!1004706))

(assert (= (and b!1004706 res!674112) b!1004705))

(assert (= (and b!1004705 res!674113) b!1004713))

(assert (= (and b!1004713 res!674120) b!1004702))

(assert (= (and b!1004702 res!674109) b!1004712))

(assert (= (and b!1004712 res!674116) b!1004711))

(assert (= (and b!1004711 res!674118) b!1004709))

(assert (= (and b!1004709 res!674110) b!1004707))

(assert (= (and b!1004707 res!674115) b!1004701))

(assert (= (and b!1004701 res!674114) b!1004710))

(assert (= (and b!1004710 res!674117) b!1004708))

(assert (= (and b!1004708 res!674111) b!1004704))

(declare-fun m!929587 () Bool)

(assert (=> b!1004712 m!929587))

(declare-fun m!929589 () Bool)

(assert (=> b!1004710 m!929589))

(assert (=> b!1004710 m!929589))

(declare-fun m!929591 () Bool)

(assert (=> b!1004710 m!929591))

(declare-fun m!929593 () Bool)

(assert (=> b!1004710 m!929593))

(declare-fun m!929595 () Bool)

(assert (=> b!1004710 m!929595))

(declare-fun m!929597 () Bool)

(assert (=> b!1004707 m!929597))

(assert (=> b!1004707 m!929597))

(declare-fun m!929599 () Bool)

(assert (=> b!1004707 m!929599))

(assert (=> b!1004707 m!929599))

(assert (=> b!1004707 m!929597))

(declare-fun m!929601 () Bool)

(assert (=> b!1004707 m!929601))

(declare-fun m!929603 () Bool)

(assert (=> start!86658 m!929603))

(declare-fun m!929605 () Bool)

(assert (=> start!86658 m!929605))

(declare-fun m!929607 () Bool)

(assert (=> b!1004708 m!929607))

(declare-fun m!929609 () Bool)

(assert (=> b!1004702 m!929609))

(declare-fun m!929611 () Bool)

(assert (=> b!1004705 m!929611))

(declare-fun m!929613 () Bool)

(assert (=> b!1004711 m!929613))

(assert (=> b!1004701 m!929597))

(assert (=> b!1004701 m!929597))

(declare-fun m!929615 () Bool)

(assert (=> b!1004701 m!929615))

(declare-fun m!929617 () Bool)

(assert (=> b!1004713 m!929617))

(assert (=> b!1004706 m!929597))

(assert (=> b!1004706 m!929597))

(declare-fun m!929619 () Bool)

(assert (=> b!1004706 m!929619))

(check-sat (not b!1004706) (not b!1004705) (not b!1004710) (not b!1004713) (not b!1004707) (not b!1004708) (not b!1004702) (not b!1004701) (not b!1004712) (not start!86658) (not b!1004711))
(check-sat)
(get-model)

(declare-fun b!1004800 () Bool)

(declare-fun e!565797 () Bool)

(declare-fun e!565798 () Bool)

(assert (=> b!1004800 (= e!565797 e!565798)))

(declare-fun lt!444184 () (_ BitVec 64))

(assert (=> b!1004800 (= lt!444184 (select (arr!30501 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32875 0))(
  ( (Unit!32876) )
))
(declare-fun lt!444183 () Unit!32875)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63355 (_ BitVec 64) (_ BitVec 32)) Unit!32875)

(assert (=> b!1004800 (= lt!444183 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444184 #b00000000000000000000000000000000))))

(assert (=> b!1004800 (arrayContainsKey!0 a!3219 lt!444184 #b00000000000000000000000000000000)))

(declare-fun lt!444182 () Unit!32875)

(assert (=> b!1004800 (= lt!444182 lt!444183)))

(declare-fun res!674204 () Bool)

(assert (=> b!1004800 (= res!674204 (= (seekEntryOrOpen!0 (select (arr!30501 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9458 #b00000000000000000000000000000000)))))

(assert (=> b!1004800 (=> (not res!674204) (not e!565798))))

(declare-fun d!119319 () Bool)

(declare-fun res!674203 () Bool)

(declare-fun e!565799 () Bool)

(assert (=> d!119319 (=> res!674203 e!565799)))

(assert (=> d!119319 (= res!674203 (bvsge #b00000000000000000000000000000000 (size!31005 a!3219)))))

(assert (=> d!119319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!565799)))

(declare-fun b!1004801 () Bool)

(declare-fun call!42307 () Bool)

(assert (=> b!1004801 (= e!565797 call!42307)))

(declare-fun b!1004802 () Bool)

(assert (=> b!1004802 (= e!565799 e!565797)))

(declare-fun c!101449 () Bool)

(assert (=> b!1004802 (= c!101449 (validKeyInArray!0 (select (arr!30501 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42304 () Bool)

(assert (=> bm!42304 (= call!42307 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1004803 () Bool)

(assert (=> b!1004803 (= e!565798 call!42307)))

(assert (= (and d!119319 (not res!674203)) b!1004802))

(assert (= (and b!1004802 c!101449) b!1004800))

(assert (= (and b!1004802 (not c!101449)) b!1004801))

(assert (= (and b!1004800 res!674204) b!1004803))

(assert (= (or b!1004803 b!1004801) bm!42304))

(declare-fun m!929689 () Bool)

(assert (=> b!1004800 m!929689))

(declare-fun m!929691 () Bool)

(assert (=> b!1004800 m!929691))

(declare-fun m!929693 () Bool)

(assert (=> b!1004800 m!929693))

(assert (=> b!1004800 m!929689))

(declare-fun m!929695 () Bool)

(assert (=> b!1004800 m!929695))

(assert (=> b!1004802 m!929689))

(assert (=> b!1004802 m!929689))

(declare-fun m!929697 () Bool)

(assert (=> b!1004802 m!929697))

(declare-fun m!929699 () Bool)

(assert (=> bm!42304 m!929699))

(assert (=> b!1004712 d!119319))

(declare-fun d!119321 () Bool)

(declare-fun res!674209 () Bool)

(declare-fun e!565804 () Bool)

(assert (=> d!119321 (=> res!674209 e!565804)))

(assert (=> d!119321 (= res!674209 (= (select (arr!30501 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119321 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!565804)))

(declare-fun b!1004808 () Bool)

(declare-fun e!565805 () Bool)

(assert (=> b!1004808 (= e!565804 e!565805)))

(declare-fun res!674210 () Bool)

(assert (=> b!1004808 (=> (not res!674210) (not e!565805))))

(assert (=> b!1004808 (= res!674210 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31005 a!3219)))))

(declare-fun b!1004809 () Bool)

(assert (=> b!1004809 (= e!565805 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119321 (not res!674209)) b!1004808))

(assert (= (and b!1004808 res!674210) b!1004809))

(assert (=> d!119321 m!929689))

(declare-fun m!929701 () Bool)

(assert (=> b!1004809 m!929701))

(assert (=> b!1004713 d!119321))

(declare-fun lt!444192 () SeekEntryResult!9458)

(declare-fun b!1004822 () Bool)

(declare-fun e!565813 () SeekEntryResult!9458)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63355 (_ BitVec 32)) SeekEntryResult!9458)

(assert (=> b!1004822 (= e!565813 (seekKeyOrZeroReturnVacant!0 (x!87623 lt!444192) (index!40205 lt!444192) (index!40205 lt!444192) k0!2224 a!3219 mask!3464))))

(declare-fun b!1004823 () Bool)

(declare-fun e!565814 () SeekEntryResult!9458)

(assert (=> b!1004823 (= e!565814 Undefined!9458)))

(declare-fun d!119323 () Bool)

(declare-fun lt!444193 () SeekEntryResult!9458)

(get-info :version)

(assert (=> d!119323 (and (or ((_ is Undefined!9458) lt!444193) (not ((_ is Found!9458) lt!444193)) (and (bvsge (index!40204 lt!444193) #b00000000000000000000000000000000) (bvslt (index!40204 lt!444193) (size!31005 a!3219)))) (or ((_ is Undefined!9458) lt!444193) ((_ is Found!9458) lt!444193) (not ((_ is MissingZero!9458) lt!444193)) (and (bvsge (index!40203 lt!444193) #b00000000000000000000000000000000) (bvslt (index!40203 lt!444193) (size!31005 a!3219)))) (or ((_ is Undefined!9458) lt!444193) ((_ is Found!9458) lt!444193) ((_ is MissingZero!9458) lt!444193) (not ((_ is MissingVacant!9458) lt!444193)) (and (bvsge (index!40206 lt!444193) #b00000000000000000000000000000000) (bvslt (index!40206 lt!444193) (size!31005 a!3219)))) (or ((_ is Undefined!9458) lt!444193) (ite ((_ is Found!9458) lt!444193) (= (select (arr!30501 a!3219) (index!40204 lt!444193)) k0!2224) (ite ((_ is MissingZero!9458) lt!444193) (= (select (arr!30501 a!3219) (index!40203 lt!444193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9458) lt!444193) (= (select (arr!30501 a!3219) (index!40206 lt!444193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119323 (= lt!444193 e!565814)))

(declare-fun c!101456 () Bool)

(assert (=> d!119323 (= c!101456 (and ((_ is Intermediate!9458) lt!444192) (undefined!10270 lt!444192)))))

(assert (=> d!119323 (= lt!444192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119323 (validMask!0 mask!3464)))

(assert (=> d!119323 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!444193)))

(declare-fun b!1004824 () Bool)

(declare-fun e!565812 () SeekEntryResult!9458)

(assert (=> b!1004824 (= e!565812 (Found!9458 (index!40205 lt!444192)))))

(declare-fun b!1004825 () Bool)

(assert (=> b!1004825 (= e!565813 (MissingZero!9458 (index!40205 lt!444192)))))

(declare-fun b!1004826 () Bool)

(declare-fun c!101457 () Bool)

(declare-fun lt!444191 () (_ BitVec 64))

(assert (=> b!1004826 (= c!101457 (= lt!444191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004826 (= e!565812 e!565813)))

(declare-fun b!1004827 () Bool)

(assert (=> b!1004827 (= e!565814 e!565812)))

(assert (=> b!1004827 (= lt!444191 (select (arr!30501 a!3219) (index!40205 lt!444192)))))

(declare-fun c!101458 () Bool)

(assert (=> b!1004827 (= c!101458 (= lt!444191 k0!2224))))

(assert (= (and d!119323 c!101456) b!1004823))

(assert (= (and d!119323 (not c!101456)) b!1004827))

(assert (= (and b!1004827 c!101458) b!1004824))

(assert (= (and b!1004827 (not c!101458)) b!1004826))

(assert (= (and b!1004826 c!101457) b!1004825))

(assert (= (and b!1004826 (not c!101457)) b!1004822))

(declare-fun m!929703 () Bool)

(assert (=> b!1004822 m!929703))

(declare-fun m!929705 () Bool)

(assert (=> d!119323 m!929705))

(assert (=> d!119323 m!929603))

(declare-fun m!929707 () Bool)

(assert (=> d!119323 m!929707))

(declare-fun m!929709 () Bool)

(assert (=> d!119323 m!929709))

(declare-fun m!929711 () Bool)

(assert (=> d!119323 m!929711))

(assert (=> d!119323 m!929707))

(declare-fun m!929713 () Bool)

(assert (=> d!119323 m!929713))

(declare-fun m!929715 () Bool)

(assert (=> b!1004827 m!929715))

(assert (=> b!1004702 d!119323))

(declare-fun d!119329 () Bool)

(assert (=> d!119329 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004705 d!119329))

(declare-fun d!119331 () Bool)

(assert (=> d!119331 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86658 d!119331))

(declare-fun d!119333 () Bool)

(assert (=> d!119333 (= (array_inv!23644 a!3219) (bvsge (size!31005 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86658 d!119333))

(declare-fun d!119335 () Bool)

(assert (=> d!119335 (= (validKeyInArray!0 (select (arr!30501 a!3219) j!170)) (and (not (= (select (arr!30501 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30501 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004706 d!119335))

(declare-fun b!1004906 () Bool)

(declare-fun lt!444215 () SeekEntryResult!9458)

(assert (=> b!1004906 (and (bvsge (index!40205 lt!444215) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444215) (size!31005 a!3219)))))

(declare-fun e!565864 () Bool)

(assert (=> b!1004906 (= e!565864 (= (select (arr!30501 a!3219) (index!40205 lt!444215)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!565860 () SeekEntryResult!9458)

(declare-fun b!1004907 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004907 (= e!565860 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30501 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30501 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004908 () Bool)

(declare-fun e!565863 () Bool)

(assert (=> b!1004908 (= e!565863 (bvsge (x!87623 lt!444215) #b01111111111111111111111111111110))))

(declare-fun d!119337 () Bool)

(assert (=> d!119337 e!565863))

(declare-fun c!101486 () Bool)

(assert (=> d!119337 (= c!101486 (and ((_ is Intermediate!9458) lt!444215) (undefined!10270 lt!444215)))))

(declare-fun e!565862 () SeekEntryResult!9458)

(assert (=> d!119337 (= lt!444215 e!565862)))

(declare-fun c!101488 () Bool)

(assert (=> d!119337 (= c!101488 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444216 () (_ BitVec 64))

(assert (=> d!119337 (= lt!444216 (select (arr!30501 a!3219) (toIndex!0 (select (arr!30501 a!3219) j!170) mask!3464)))))

(assert (=> d!119337 (validMask!0 mask!3464)))

(assert (=> d!119337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30501 a!3219) j!170) mask!3464) (select (arr!30501 a!3219) j!170) a!3219 mask!3464) lt!444215)))

(declare-fun b!1004909 () Bool)

(assert (=> b!1004909 (= e!565862 e!565860)))

(declare-fun c!101487 () Bool)

(assert (=> b!1004909 (= c!101487 (or (= lt!444216 (select (arr!30501 a!3219) j!170)) (= (bvadd lt!444216 lt!444216) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004910 () Bool)

(assert (=> b!1004910 (= e!565862 (Intermediate!9458 true (toIndex!0 (select (arr!30501 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004911 () Bool)

(declare-fun e!565861 () Bool)

(assert (=> b!1004911 (= e!565863 e!565861)))

(declare-fun res!674237 () Bool)

(assert (=> b!1004911 (= res!674237 (and ((_ is Intermediate!9458) lt!444215) (not (undefined!10270 lt!444215)) (bvslt (x!87623 lt!444215) #b01111111111111111111111111111110) (bvsge (x!87623 lt!444215) #b00000000000000000000000000000000) (bvsge (x!87623 lt!444215) #b00000000000000000000000000000000)))))

(assert (=> b!1004911 (=> (not res!674237) (not e!565861))))

(declare-fun b!1004912 () Bool)

(assert (=> b!1004912 (= e!565860 (Intermediate!9458 false (toIndex!0 (select (arr!30501 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004913 () Bool)

(assert (=> b!1004913 (and (bvsge (index!40205 lt!444215) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444215) (size!31005 a!3219)))))

(declare-fun res!674235 () Bool)

(assert (=> b!1004913 (= res!674235 (= (select (arr!30501 a!3219) (index!40205 lt!444215)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004913 (=> res!674235 e!565864)))

(declare-fun b!1004914 () Bool)

(assert (=> b!1004914 (and (bvsge (index!40205 lt!444215) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444215) (size!31005 a!3219)))))

(declare-fun res!674236 () Bool)

(assert (=> b!1004914 (= res!674236 (= (select (arr!30501 a!3219) (index!40205 lt!444215)) (select (arr!30501 a!3219) j!170)))))

(assert (=> b!1004914 (=> res!674236 e!565864)))

(assert (=> b!1004914 (= e!565861 e!565864)))

(assert (= (and d!119337 c!101488) b!1004910))

(assert (= (and d!119337 (not c!101488)) b!1004909))

(assert (= (and b!1004909 c!101487) b!1004912))

(assert (= (and b!1004909 (not c!101487)) b!1004907))

(assert (= (and d!119337 c!101486) b!1004908))

(assert (= (and d!119337 (not c!101486)) b!1004911))

(assert (= (and b!1004911 res!674237) b!1004914))

(assert (= (and b!1004914 (not res!674236)) b!1004913))

(assert (= (and b!1004913 (not res!674235)) b!1004906))

(declare-fun m!929749 () Bool)

(assert (=> b!1004913 m!929749))

(assert (=> d!119337 m!929599))

(declare-fun m!929751 () Bool)

(assert (=> d!119337 m!929751))

(assert (=> d!119337 m!929603))

(assert (=> b!1004914 m!929749))

(assert (=> b!1004907 m!929599))

(declare-fun m!929753 () Bool)

(assert (=> b!1004907 m!929753))

(assert (=> b!1004907 m!929753))

(assert (=> b!1004907 m!929597))

(declare-fun m!929755 () Bool)

(assert (=> b!1004907 m!929755))

(assert (=> b!1004906 m!929749))

(assert (=> b!1004707 d!119337))

(declare-fun d!119353 () Bool)

(declare-fun lt!444224 () (_ BitVec 32))

(declare-fun lt!444223 () (_ BitVec 32))

(assert (=> d!119353 (= lt!444224 (bvmul (bvxor lt!444223 (bvlshr lt!444223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119353 (= lt!444223 ((_ extract 31 0) (bvand (bvxor (select (arr!30501 a!3219) j!170) (bvlshr (select (arr!30501 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119353 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674238 (let ((h!22422 ((_ extract 31 0) (bvand (bvxor (select (arr!30501 a!3219) j!170) (bvlshr (select (arr!30501 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87628 (bvmul (bvxor h!22422 (bvlshr h!22422 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87628 (bvlshr x!87628 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674238 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674238 #b00000000000000000000000000000000))))))

(assert (=> d!119353 (= (toIndex!0 (select (arr!30501 a!3219) j!170) mask!3464) (bvand (bvxor lt!444224 (bvlshr lt!444224 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004707 d!119353))

(declare-fun b!1004924 () Bool)

(declare-fun lt!444225 () SeekEntryResult!9458)

(assert (=> b!1004924 (and (bvsge (index!40205 lt!444225) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444225) (size!31005 lt!444135)))))

(declare-fun e!565874 () Bool)

(assert (=> b!1004924 (= e!565874 (= (select (arr!30501 lt!444135) (index!40205 lt!444225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!565870 () SeekEntryResult!9458)

(declare-fun b!1004925 () Bool)

(assert (=> b!1004925 (= e!565870 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444134 lt!444135 mask!3464))))

(declare-fun b!1004926 () Bool)

(declare-fun e!565873 () Bool)

(assert (=> b!1004926 (= e!565873 (bvsge (x!87623 lt!444225) #b01111111111111111111111111111110))))

(declare-fun d!119363 () Bool)

(assert (=> d!119363 e!565873))

(declare-fun c!101492 () Bool)

(assert (=> d!119363 (= c!101492 (and ((_ is Intermediate!9458) lt!444225) (undefined!10270 lt!444225)))))

(declare-fun e!565872 () SeekEntryResult!9458)

(assert (=> d!119363 (= lt!444225 e!565872)))

(declare-fun c!101494 () Bool)

(assert (=> d!119363 (= c!101494 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444226 () (_ BitVec 64))

(assert (=> d!119363 (= lt!444226 (select (arr!30501 lt!444135) index!1507))))

(assert (=> d!119363 (validMask!0 mask!3464)))

(assert (=> d!119363 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444134 lt!444135 mask!3464) lt!444225)))

(declare-fun b!1004927 () Bool)

(assert (=> b!1004927 (= e!565872 e!565870)))

(declare-fun c!101493 () Bool)

(assert (=> b!1004927 (= c!101493 (or (= lt!444226 lt!444134) (= (bvadd lt!444226 lt!444226) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004928 () Bool)

(assert (=> b!1004928 (= e!565872 (Intermediate!9458 true index!1507 x!1245))))

(declare-fun b!1004929 () Bool)

(declare-fun e!565871 () Bool)

(assert (=> b!1004929 (= e!565873 e!565871)))

(declare-fun res!674245 () Bool)

(assert (=> b!1004929 (= res!674245 (and ((_ is Intermediate!9458) lt!444225) (not (undefined!10270 lt!444225)) (bvslt (x!87623 lt!444225) #b01111111111111111111111111111110) (bvsge (x!87623 lt!444225) #b00000000000000000000000000000000) (bvsge (x!87623 lt!444225) x!1245)))))

(assert (=> b!1004929 (=> (not res!674245) (not e!565871))))

(declare-fun b!1004930 () Bool)

(assert (=> b!1004930 (= e!565870 (Intermediate!9458 false index!1507 x!1245))))

(declare-fun b!1004931 () Bool)

(assert (=> b!1004931 (and (bvsge (index!40205 lt!444225) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444225) (size!31005 lt!444135)))))

(declare-fun res!674243 () Bool)

(assert (=> b!1004931 (= res!674243 (= (select (arr!30501 lt!444135) (index!40205 lt!444225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004931 (=> res!674243 e!565874)))

(declare-fun b!1004932 () Bool)

(assert (=> b!1004932 (and (bvsge (index!40205 lt!444225) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444225) (size!31005 lt!444135)))))

(declare-fun res!674244 () Bool)

(assert (=> b!1004932 (= res!674244 (= (select (arr!30501 lt!444135) (index!40205 lt!444225)) lt!444134))))

(assert (=> b!1004932 (=> res!674244 e!565874)))

(assert (=> b!1004932 (= e!565871 e!565874)))

(assert (= (and d!119363 c!101494) b!1004928))

(assert (= (and d!119363 (not c!101494)) b!1004927))

(assert (= (and b!1004927 c!101493) b!1004930))

(assert (= (and b!1004927 (not c!101493)) b!1004925))

(assert (= (and d!119363 c!101492) b!1004926))

(assert (= (and d!119363 (not c!101492)) b!1004929))

(assert (= (and b!1004929 res!674245) b!1004932))

(assert (= (and b!1004932 (not res!674244)) b!1004931))

(assert (= (and b!1004931 (not res!674243)) b!1004924))

(declare-fun m!929765 () Bool)

(assert (=> b!1004931 m!929765))

(declare-fun m!929767 () Bool)

(assert (=> d!119363 m!929767))

(assert (=> d!119363 m!929603))

(assert (=> b!1004932 m!929765))

(declare-fun m!929769 () Bool)

(assert (=> b!1004925 m!929769))

(assert (=> b!1004925 m!929769))

(declare-fun m!929771 () Bool)

(assert (=> b!1004925 m!929771))

(assert (=> b!1004924 m!929765))

(assert (=> b!1004708 d!119363))

(declare-fun b!1004933 () Bool)

(declare-fun lt!444227 () SeekEntryResult!9458)

(assert (=> b!1004933 (and (bvsge (index!40205 lt!444227) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444227) (size!31005 lt!444135)))))

(declare-fun e!565879 () Bool)

(assert (=> b!1004933 (= e!565879 (= (select (arr!30501 lt!444135) (index!40205 lt!444227)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!565875 () SeekEntryResult!9458)

(declare-fun b!1004934 () Bool)

(assert (=> b!1004934 (= e!565875 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444134 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444134 lt!444135 mask!3464))))

(declare-fun b!1004935 () Bool)

(declare-fun e!565878 () Bool)

(assert (=> b!1004935 (= e!565878 (bvsge (x!87623 lt!444227) #b01111111111111111111111111111110))))

(declare-fun d!119365 () Bool)

(assert (=> d!119365 e!565878))

(declare-fun c!101495 () Bool)

(assert (=> d!119365 (= c!101495 (and ((_ is Intermediate!9458) lt!444227) (undefined!10270 lt!444227)))))

(declare-fun e!565877 () SeekEntryResult!9458)

(assert (=> d!119365 (= lt!444227 e!565877)))

(declare-fun c!101497 () Bool)

(assert (=> d!119365 (= c!101497 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444228 () (_ BitVec 64))

(assert (=> d!119365 (= lt!444228 (select (arr!30501 lt!444135) (toIndex!0 lt!444134 mask!3464)))))

(assert (=> d!119365 (validMask!0 mask!3464)))

(assert (=> d!119365 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444134 mask!3464) lt!444134 lt!444135 mask!3464) lt!444227)))

(declare-fun b!1004936 () Bool)

(assert (=> b!1004936 (= e!565877 e!565875)))

(declare-fun c!101496 () Bool)

(assert (=> b!1004936 (= c!101496 (or (= lt!444228 lt!444134) (= (bvadd lt!444228 lt!444228) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004937 () Bool)

(assert (=> b!1004937 (= e!565877 (Intermediate!9458 true (toIndex!0 lt!444134 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004938 () Bool)

(declare-fun e!565876 () Bool)

(assert (=> b!1004938 (= e!565878 e!565876)))

(declare-fun res!674248 () Bool)

(assert (=> b!1004938 (= res!674248 (and ((_ is Intermediate!9458) lt!444227) (not (undefined!10270 lt!444227)) (bvslt (x!87623 lt!444227) #b01111111111111111111111111111110) (bvsge (x!87623 lt!444227) #b00000000000000000000000000000000) (bvsge (x!87623 lt!444227) #b00000000000000000000000000000000)))))

(assert (=> b!1004938 (=> (not res!674248) (not e!565876))))

(declare-fun b!1004939 () Bool)

(assert (=> b!1004939 (= e!565875 (Intermediate!9458 false (toIndex!0 lt!444134 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004940 () Bool)

(assert (=> b!1004940 (and (bvsge (index!40205 lt!444227) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444227) (size!31005 lt!444135)))))

(declare-fun res!674246 () Bool)

(assert (=> b!1004940 (= res!674246 (= (select (arr!30501 lt!444135) (index!40205 lt!444227)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004940 (=> res!674246 e!565879)))

(declare-fun b!1004941 () Bool)

(assert (=> b!1004941 (and (bvsge (index!40205 lt!444227) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444227) (size!31005 lt!444135)))))

(declare-fun res!674247 () Bool)

(assert (=> b!1004941 (= res!674247 (= (select (arr!30501 lt!444135) (index!40205 lt!444227)) lt!444134))))

(assert (=> b!1004941 (=> res!674247 e!565879)))

(assert (=> b!1004941 (= e!565876 e!565879)))

(assert (= (and d!119365 c!101497) b!1004937))

(assert (= (and d!119365 (not c!101497)) b!1004936))

(assert (= (and b!1004936 c!101496) b!1004939))

(assert (= (and b!1004936 (not c!101496)) b!1004934))

(assert (= (and d!119365 c!101495) b!1004935))

(assert (= (and d!119365 (not c!101495)) b!1004938))

(assert (= (and b!1004938 res!674248) b!1004941))

(assert (= (and b!1004941 (not res!674247)) b!1004940))

(assert (= (and b!1004940 (not res!674246)) b!1004933))

(declare-fun m!929773 () Bool)

(assert (=> b!1004940 m!929773))

(assert (=> d!119365 m!929589))

(declare-fun m!929775 () Bool)

(assert (=> d!119365 m!929775))

(assert (=> d!119365 m!929603))

(assert (=> b!1004941 m!929773))

(assert (=> b!1004934 m!929589))

(declare-fun m!929777 () Bool)

(assert (=> b!1004934 m!929777))

(assert (=> b!1004934 m!929777))

(declare-fun m!929779 () Bool)

(assert (=> b!1004934 m!929779))

(assert (=> b!1004933 m!929773))

(assert (=> b!1004710 d!119365))

(declare-fun d!119367 () Bool)

(declare-fun lt!444234 () (_ BitVec 32))

(declare-fun lt!444233 () (_ BitVec 32))

(assert (=> d!119367 (= lt!444234 (bvmul (bvxor lt!444233 (bvlshr lt!444233 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119367 (= lt!444233 ((_ extract 31 0) (bvand (bvxor lt!444134 (bvlshr lt!444134 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119367 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674238 (let ((h!22422 ((_ extract 31 0) (bvand (bvxor lt!444134 (bvlshr lt!444134 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87628 (bvmul (bvxor h!22422 (bvlshr h!22422 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87628 (bvlshr x!87628 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674238 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674238 #b00000000000000000000000000000000))))))

(assert (=> d!119367 (= (toIndex!0 lt!444134 mask!3464) (bvand (bvxor lt!444234 (bvlshr lt!444234 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004710 d!119367))

(declare-fun b!1004958 () Bool)

(declare-fun e!565891 () Bool)

(declare-fun call!42310 () Bool)

(assert (=> b!1004958 (= e!565891 call!42310)))

(declare-fun b!1004959 () Bool)

(assert (=> b!1004959 (= e!565891 call!42310)))

(declare-fun bm!42307 () Bool)

(declare-fun c!101500 () Bool)

(assert (=> bm!42307 (= call!42310 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101500 (Cons!21239 (select (arr!30501 a!3219) #b00000000000000000000000000000000) Nil!21240) Nil!21240)))))

(declare-fun b!1004960 () Bool)

(declare-fun e!565890 () Bool)

(assert (=> b!1004960 (= e!565890 e!565891)))

(assert (=> b!1004960 (= c!101500 (validKeyInArray!0 (select (arr!30501 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119369 () Bool)

(declare-fun res!674257 () Bool)

(declare-fun e!565894 () Bool)

(assert (=> d!119369 (=> res!674257 e!565894)))

(assert (=> d!119369 (= res!674257 (bvsge #b00000000000000000000000000000000 (size!31005 a!3219)))))

(assert (=> d!119369 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21240) e!565894)))

(declare-fun b!1004961 () Bool)

(declare-fun e!565895 () Bool)

(declare-fun contains!5854 (List!21243 (_ BitVec 64)) Bool)

(assert (=> b!1004961 (= e!565895 (contains!5854 Nil!21240 (select (arr!30501 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004962 () Bool)

(assert (=> b!1004962 (= e!565894 e!565890)))

(declare-fun res!674259 () Bool)

(assert (=> b!1004962 (=> (not res!674259) (not e!565890))))

(assert (=> b!1004962 (= res!674259 (not e!565895))))

(declare-fun res!674258 () Bool)

(assert (=> b!1004962 (=> (not res!674258) (not e!565895))))

(assert (=> b!1004962 (= res!674258 (validKeyInArray!0 (select (arr!30501 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119369 (not res!674257)) b!1004962))

(assert (= (and b!1004962 res!674258) b!1004961))

(assert (= (and b!1004962 res!674259) b!1004960))

(assert (= (and b!1004960 c!101500) b!1004959))

(assert (= (and b!1004960 (not c!101500)) b!1004958))

(assert (= (or b!1004959 b!1004958) bm!42307))

(assert (=> bm!42307 m!929689))

(declare-fun m!929781 () Bool)

(assert (=> bm!42307 m!929781))

(assert (=> b!1004960 m!929689))

(assert (=> b!1004960 m!929689))

(assert (=> b!1004960 m!929697))

(assert (=> b!1004961 m!929689))

(assert (=> b!1004961 m!929689))

(declare-fun m!929783 () Bool)

(assert (=> b!1004961 m!929783))

(assert (=> b!1004962 m!929689))

(assert (=> b!1004962 m!929689))

(assert (=> b!1004962 m!929697))

(assert (=> b!1004711 d!119369))

(declare-fun b!1004973 () Bool)

(declare-fun lt!444247 () SeekEntryResult!9458)

(assert (=> b!1004973 (and (bvsge (index!40205 lt!444247) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444247) (size!31005 a!3219)))))

(declare-fun e!565906 () Bool)

(assert (=> b!1004973 (= e!565906 (= (select (arr!30501 a!3219) (index!40205 lt!444247)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004974 () Bool)

(declare-fun e!565902 () SeekEntryResult!9458)

(assert (=> b!1004974 (= e!565902 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30501 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004975 () Bool)

(declare-fun e!565905 () Bool)

(assert (=> b!1004975 (= e!565905 (bvsge (x!87623 lt!444247) #b01111111111111111111111111111110))))

(declare-fun d!119373 () Bool)

(assert (=> d!119373 e!565905))

(declare-fun c!101507 () Bool)

(assert (=> d!119373 (= c!101507 (and ((_ is Intermediate!9458) lt!444247) (undefined!10270 lt!444247)))))

(declare-fun e!565904 () SeekEntryResult!9458)

(assert (=> d!119373 (= lt!444247 e!565904)))

(declare-fun c!101509 () Bool)

(assert (=> d!119373 (= c!101509 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444248 () (_ BitVec 64))

(assert (=> d!119373 (= lt!444248 (select (arr!30501 a!3219) index!1507))))

(assert (=> d!119373 (validMask!0 mask!3464)))

(assert (=> d!119373 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30501 a!3219) j!170) a!3219 mask!3464) lt!444247)))

(declare-fun b!1004976 () Bool)

(assert (=> b!1004976 (= e!565904 e!565902)))

(declare-fun c!101508 () Bool)

(assert (=> b!1004976 (= c!101508 (or (= lt!444248 (select (arr!30501 a!3219) j!170)) (= (bvadd lt!444248 lt!444248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004977 () Bool)

(assert (=> b!1004977 (= e!565904 (Intermediate!9458 true index!1507 x!1245))))

(declare-fun b!1004978 () Bool)

(declare-fun e!565903 () Bool)

(assert (=> b!1004978 (= e!565905 e!565903)))

(declare-fun res!674264 () Bool)

(assert (=> b!1004978 (= res!674264 (and ((_ is Intermediate!9458) lt!444247) (not (undefined!10270 lt!444247)) (bvslt (x!87623 lt!444247) #b01111111111111111111111111111110) (bvsge (x!87623 lt!444247) #b00000000000000000000000000000000) (bvsge (x!87623 lt!444247) x!1245)))))

(assert (=> b!1004978 (=> (not res!674264) (not e!565903))))

(declare-fun b!1004979 () Bool)

(assert (=> b!1004979 (= e!565902 (Intermediate!9458 false index!1507 x!1245))))

(declare-fun b!1004980 () Bool)

(assert (=> b!1004980 (and (bvsge (index!40205 lt!444247) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444247) (size!31005 a!3219)))))

(declare-fun res!674262 () Bool)

(assert (=> b!1004980 (= res!674262 (= (select (arr!30501 a!3219) (index!40205 lt!444247)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004980 (=> res!674262 e!565906)))

(declare-fun b!1004981 () Bool)

(assert (=> b!1004981 (and (bvsge (index!40205 lt!444247) #b00000000000000000000000000000000) (bvslt (index!40205 lt!444247) (size!31005 a!3219)))))

(declare-fun res!674263 () Bool)

(assert (=> b!1004981 (= res!674263 (= (select (arr!30501 a!3219) (index!40205 lt!444247)) (select (arr!30501 a!3219) j!170)))))

(assert (=> b!1004981 (=> res!674263 e!565906)))

(assert (=> b!1004981 (= e!565903 e!565906)))

(assert (= (and d!119373 c!101509) b!1004977))

(assert (= (and d!119373 (not c!101509)) b!1004976))

(assert (= (and b!1004976 c!101508) b!1004979))

(assert (= (and b!1004976 (not c!101508)) b!1004974))

(assert (= (and d!119373 c!101507) b!1004975))

(assert (= (and d!119373 (not c!101507)) b!1004978))

(assert (= (and b!1004978 res!674264) b!1004981))

(assert (= (and b!1004981 (not res!674263)) b!1004980))

(assert (= (and b!1004980 (not res!674262)) b!1004973))

(declare-fun m!929785 () Bool)

(assert (=> b!1004980 m!929785))

(declare-fun m!929787 () Bool)

(assert (=> d!119373 m!929787))

(assert (=> d!119373 m!929603))

(assert (=> b!1004981 m!929785))

(assert (=> b!1004974 m!929769))

(assert (=> b!1004974 m!929769))

(assert (=> b!1004974 m!929597))

(declare-fun m!929789 () Bool)

(assert (=> b!1004974 m!929789))

(assert (=> b!1004973 m!929785))

(assert (=> b!1004701 d!119373))

(check-sat (not b!1004809) (not b!1004907) (not b!1004802) (not b!1004974) (not b!1004960) (not bm!42304) (not b!1004961) (not d!119323) (not bm!42307) (not b!1004962) (not b!1004822) (not b!1004925) (not d!119337) (not b!1004934) (not d!119363) (not b!1004800) (not d!119373) (not d!119365))
(check-sat)
