; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31428 () Bool)

(assert start!31428)

(declare-fun b!314854 () Bool)

(declare-fun e!196036 () Bool)

(declare-fun e!196037 () Bool)

(assert (=> b!314854 (= e!196036 e!196037)))

(declare-fun res!170519 () Bool)

(assert (=> b!314854 (=> (not res!170519) (not e!196037))))

(declare-datatypes ((array!16067 0))(
  ( (array!16068 (arr!7606 (Array (_ BitVec 32) (_ BitVec 64))) (size!7958 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16067)

(declare-datatypes ((SeekEntryResult!2711 0))(
  ( (MissingZero!2711 (index!13020 (_ BitVec 32))) (Found!2711 (index!13021 (_ BitVec 32))) (Intermediate!2711 (undefined!3523 Bool) (index!13022 (_ BitVec 32)) (x!31360 (_ BitVec 32))) (Undefined!2711) (MissingVacant!2711 (index!13023 (_ BitVec 32))) )
))
(declare-fun lt!154071 () SeekEntryResult!2711)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!154070 () SeekEntryResult!2711)

(assert (=> b!314854 (= res!170519 (and (= lt!154071 lt!154070) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7606 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7606 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7606 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16067 (_ BitVec 32)) SeekEntryResult!2711)

(assert (=> b!314854 (= lt!154071 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314855 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314855 (= e!196037 (not (= lt!154071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))))

(declare-fun b!314856 () Bool)

(declare-fun res!170513 () Bool)

(declare-fun e!196038 () Bool)

(assert (=> b!314856 (=> (not res!170513) (not e!196038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314856 (= res!170513 (validKeyInArray!0 k0!2441))))

(declare-fun b!314857 () Bool)

(declare-fun res!170520 () Bool)

(assert (=> b!314857 (=> (not res!170520) (not e!196038))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16067 (_ BitVec 32)) SeekEntryResult!2711)

(assert (=> b!314857 (= res!170520 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2711 i!1240)))))

(declare-fun b!314858 () Bool)

(declare-fun res!170518 () Bool)

(assert (=> b!314858 (=> (not res!170518) (not e!196038))))

(declare-fun arrayContainsKey!0 (array!16067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314858 (= res!170518 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314859 () Bool)

(declare-fun res!170516 () Bool)

(assert (=> b!314859 (=> (not res!170516) (not e!196038))))

(assert (=> b!314859 (= res!170516 (and (= (size!7958 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7958 a!3293))))))

(declare-fun res!170517 () Bool)

(assert (=> start!31428 (=> (not res!170517) (not e!196038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31428 (= res!170517 (validMask!0 mask!3709))))

(assert (=> start!31428 e!196038))

(declare-fun array_inv!5556 (array!16067) Bool)

(assert (=> start!31428 (array_inv!5556 a!3293)))

(assert (=> start!31428 true))

(declare-fun b!314860 () Bool)

(assert (=> b!314860 (= e!196038 e!196036)))

(declare-fun res!170515 () Bool)

(assert (=> b!314860 (=> (not res!170515) (not e!196036))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314860 (= res!170515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154070))))

(assert (=> b!314860 (= lt!154070 (Intermediate!2711 false resIndex!52 resX!52))))

(declare-fun b!314861 () Bool)

(declare-fun res!170514 () Bool)

(assert (=> b!314861 (=> (not res!170514) (not e!196038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16067 (_ BitVec 32)) Bool)

(assert (=> b!314861 (= res!170514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314862 () Bool)

(declare-fun res!170512 () Bool)

(assert (=> b!314862 (=> (not res!170512) (not e!196036))))

(assert (=> b!314862 (= res!170512 (and (= (select (arr!7606 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7958 a!3293))))))

(assert (= (and start!31428 res!170517) b!314859))

(assert (= (and b!314859 res!170516) b!314856))

(assert (= (and b!314856 res!170513) b!314858))

(assert (= (and b!314858 res!170518) b!314857))

(assert (= (and b!314857 res!170520) b!314861))

(assert (= (and b!314861 res!170514) b!314860))

(assert (= (and b!314860 res!170515) b!314862))

(assert (= (and b!314862 res!170512) b!314854))

(assert (= (and b!314854 res!170519) b!314855))

(declare-fun m!324463 () Bool)

(assert (=> b!314855 m!324463))

(assert (=> b!314855 m!324463))

(declare-fun m!324465 () Bool)

(assert (=> b!314855 m!324465))

(declare-fun m!324467 () Bool)

(assert (=> b!314860 m!324467))

(assert (=> b!314860 m!324467))

(declare-fun m!324469 () Bool)

(assert (=> b!314860 m!324469))

(declare-fun m!324471 () Bool)

(assert (=> b!314862 m!324471))

(declare-fun m!324473 () Bool)

(assert (=> b!314858 m!324473))

(declare-fun m!324475 () Bool)

(assert (=> start!31428 m!324475))

(declare-fun m!324477 () Bool)

(assert (=> start!31428 m!324477))

(declare-fun m!324479 () Bool)

(assert (=> b!314854 m!324479))

(declare-fun m!324481 () Bool)

(assert (=> b!314854 m!324481))

(declare-fun m!324483 () Bool)

(assert (=> b!314857 m!324483))

(declare-fun m!324485 () Bool)

(assert (=> b!314856 m!324485))

(declare-fun m!324487 () Bool)

(assert (=> b!314861 m!324487))

(check-sat (not b!314858) (not b!314861) (not b!314854) (not b!314855) (not start!31428) (not b!314860) (not b!314856) (not b!314857))
(check-sat)
(get-model)

(declare-fun d!68857 () Bool)

(assert (=> d!68857 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31428 d!68857))

(declare-fun d!68861 () Bool)

(assert (=> d!68861 (= (array_inv!5556 a!3293) (bvsge (size!7958 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31428 d!68861))

(declare-fun b!314974 () Bool)

(declare-fun e!196097 () Bool)

(declare-fun e!196101 () Bool)

(assert (=> b!314974 (= e!196097 e!196101)))

(declare-fun res!170597 () Bool)

(declare-fun lt!154104 () SeekEntryResult!2711)

(get-info :version)

(assert (=> b!314974 (= res!170597 (and ((_ is Intermediate!2711) lt!154104) (not (undefined!3523 lt!154104)) (bvslt (x!31360 lt!154104) #b01111111111111111111111111111110) (bvsge (x!31360 lt!154104) #b00000000000000000000000000000000) (bvsge (x!31360 lt!154104) x!1427)))))

(assert (=> b!314974 (=> (not res!170597) (not e!196101))))

(declare-fun b!314975 () Bool)

(declare-fun e!196098 () SeekEntryResult!2711)

(declare-fun e!196099 () SeekEntryResult!2711)

(assert (=> b!314975 (= e!196098 e!196099)))

(declare-fun c!49803 () Bool)

(declare-fun lt!154103 () (_ BitVec 64))

(assert (=> b!314975 (= c!49803 (or (= lt!154103 k0!2441) (= (bvadd lt!154103 lt!154103) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314977 () Bool)

(assert (=> b!314977 (and (bvsge (index!13022 lt!154104) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154104) (size!7958 a!3293)))))

(declare-fun res!170596 () Bool)

(assert (=> b!314977 (= res!170596 (= (select (arr!7606 a!3293) (index!13022 lt!154104)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196100 () Bool)

(assert (=> b!314977 (=> res!170596 e!196100)))

(declare-fun b!314978 () Bool)

(assert (=> b!314978 (= e!196097 (bvsge (x!31360 lt!154104) #b01111111111111111111111111111110))))

(declare-fun b!314979 () Bool)

(assert (=> b!314979 (= e!196098 (Intermediate!2711 true index!1781 x!1427))))

(declare-fun b!314980 () Bool)

(assert (=> b!314980 (and (bvsge (index!13022 lt!154104) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154104) (size!7958 a!3293)))))

(declare-fun res!170598 () Bool)

(assert (=> b!314980 (= res!170598 (= (select (arr!7606 a!3293) (index!13022 lt!154104)) k0!2441))))

(assert (=> b!314980 (=> res!170598 e!196100)))

(assert (=> b!314980 (= e!196101 e!196100)))

(declare-fun b!314981 () Bool)

(assert (=> b!314981 (= e!196099 (Intermediate!2711 false index!1781 x!1427))))

(declare-fun b!314982 () Bool)

(assert (=> b!314982 (= e!196099 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68863 () Bool)

(assert (=> d!68863 e!196097))

(declare-fun c!49805 () Bool)

(assert (=> d!68863 (= c!49805 (and ((_ is Intermediate!2711) lt!154104) (undefined!3523 lt!154104)))))

(assert (=> d!68863 (= lt!154104 e!196098)))

(declare-fun c!49804 () Bool)

(assert (=> d!68863 (= c!49804 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68863 (= lt!154103 (select (arr!7606 a!3293) index!1781))))

(assert (=> d!68863 (validMask!0 mask!3709)))

(assert (=> d!68863 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154104)))

(declare-fun b!314976 () Bool)

(assert (=> b!314976 (and (bvsge (index!13022 lt!154104) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154104) (size!7958 a!3293)))))

(assert (=> b!314976 (= e!196100 (= (select (arr!7606 a!3293) (index!13022 lt!154104)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68863 c!49804) b!314979))

(assert (= (and d!68863 (not c!49804)) b!314975))

(assert (= (and b!314975 c!49803) b!314981))

(assert (= (and b!314975 (not c!49803)) b!314982))

(assert (= (and d!68863 c!49805) b!314978))

(assert (= (and d!68863 (not c!49805)) b!314974))

(assert (= (and b!314974 res!170597) b!314980))

(assert (= (and b!314980 (not res!170598)) b!314977))

(assert (= (and b!314977 (not res!170596)) b!314976))

(declare-fun m!324559 () Bool)

(assert (=> b!314976 m!324559))

(declare-fun m!324561 () Bool)

(assert (=> b!314982 m!324561))

(assert (=> b!314982 m!324561))

(declare-fun m!324563 () Bool)

(assert (=> b!314982 m!324563))

(assert (=> b!314980 m!324559))

(assert (=> d!68863 m!324479))

(assert (=> d!68863 m!324475))

(assert (=> b!314977 m!324559))

(assert (=> b!314854 d!68863))

(declare-fun d!68871 () Bool)

(declare-fun res!170603 () Bool)

(declare-fun e!196106 () Bool)

(assert (=> d!68871 (=> res!170603 e!196106)))

(assert (=> d!68871 (= res!170603 (= (select (arr!7606 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68871 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!196106)))

(declare-fun b!314987 () Bool)

(declare-fun e!196107 () Bool)

(assert (=> b!314987 (= e!196106 e!196107)))

(declare-fun res!170604 () Bool)

(assert (=> b!314987 (=> (not res!170604) (not e!196107))))

(assert (=> b!314987 (= res!170604 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7958 a!3293)))))

(declare-fun b!314988 () Bool)

(assert (=> b!314988 (= e!196107 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68871 (not res!170603)) b!314987))

(assert (= (and b!314987 res!170604) b!314988))

(declare-fun m!324565 () Bool)

(assert (=> d!68871 m!324565))

(declare-fun m!324567 () Bool)

(assert (=> b!314988 m!324567))

(assert (=> b!314858 d!68871))

(declare-fun d!68877 () Bool)

(assert (=> d!68877 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314856 d!68877))

(declare-fun b!315052 () Bool)

(declare-fun e!196147 () SeekEntryResult!2711)

(declare-fun lt!154130 () SeekEntryResult!2711)

(assert (=> b!315052 (= e!196147 (MissingZero!2711 (index!13022 lt!154130)))))

(declare-fun b!315053 () Bool)

(declare-fun c!49828 () Bool)

(declare-fun lt!154132 () (_ BitVec 64))

(assert (=> b!315053 (= c!49828 (= lt!154132 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196145 () SeekEntryResult!2711)

(assert (=> b!315053 (= e!196145 e!196147)))

(declare-fun b!315054 () Bool)

(declare-fun e!196146 () SeekEntryResult!2711)

(assert (=> b!315054 (= e!196146 Undefined!2711)))

(declare-fun b!315056 () Bool)

(assert (=> b!315056 (= e!196145 (Found!2711 (index!13022 lt!154130)))))

(declare-fun b!315057 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16067 (_ BitVec 32)) SeekEntryResult!2711)

(assert (=> b!315057 (= e!196147 (seekKeyOrZeroReturnVacant!0 (x!31360 lt!154130) (index!13022 lt!154130) (index!13022 lt!154130) k0!2441 a!3293 mask!3709))))

(declare-fun b!315055 () Bool)

(assert (=> b!315055 (= e!196146 e!196145)))

(assert (=> b!315055 (= lt!154132 (select (arr!7606 a!3293) (index!13022 lt!154130)))))

(declare-fun c!49829 () Bool)

(assert (=> b!315055 (= c!49829 (= lt!154132 k0!2441))))

(declare-fun d!68881 () Bool)

(declare-fun lt!154131 () SeekEntryResult!2711)

(assert (=> d!68881 (and (or ((_ is Undefined!2711) lt!154131) (not ((_ is Found!2711) lt!154131)) (and (bvsge (index!13021 lt!154131) #b00000000000000000000000000000000) (bvslt (index!13021 lt!154131) (size!7958 a!3293)))) (or ((_ is Undefined!2711) lt!154131) ((_ is Found!2711) lt!154131) (not ((_ is MissingZero!2711) lt!154131)) (and (bvsge (index!13020 lt!154131) #b00000000000000000000000000000000) (bvslt (index!13020 lt!154131) (size!7958 a!3293)))) (or ((_ is Undefined!2711) lt!154131) ((_ is Found!2711) lt!154131) ((_ is MissingZero!2711) lt!154131) (not ((_ is MissingVacant!2711) lt!154131)) (and (bvsge (index!13023 lt!154131) #b00000000000000000000000000000000) (bvslt (index!13023 lt!154131) (size!7958 a!3293)))) (or ((_ is Undefined!2711) lt!154131) (ite ((_ is Found!2711) lt!154131) (= (select (arr!7606 a!3293) (index!13021 lt!154131)) k0!2441) (ite ((_ is MissingZero!2711) lt!154131) (= (select (arr!7606 a!3293) (index!13020 lt!154131)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2711) lt!154131) (= (select (arr!7606 a!3293) (index!13023 lt!154131)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68881 (= lt!154131 e!196146)))

(declare-fun c!49827 () Bool)

(assert (=> d!68881 (= c!49827 (and ((_ is Intermediate!2711) lt!154130) (undefined!3523 lt!154130)))))

(assert (=> d!68881 (= lt!154130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68881 (validMask!0 mask!3709)))

(assert (=> d!68881 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154131)))

(assert (= (and d!68881 c!49827) b!315054))

(assert (= (and d!68881 (not c!49827)) b!315055))

(assert (= (and b!315055 c!49829) b!315056))

(assert (= (and b!315055 (not c!49829)) b!315053))

(assert (= (and b!315053 c!49828) b!315052))

(assert (= (and b!315053 (not c!49828)) b!315057))

(declare-fun m!324599 () Bool)

(assert (=> b!315057 m!324599))

(declare-fun m!324601 () Bool)

(assert (=> b!315055 m!324601))

(declare-fun m!324603 () Bool)

(assert (=> d!68881 m!324603))

(assert (=> d!68881 m!324475))

(assert (=> d!68881 m!324467))

(declare-fun m!324607 () Bool)

(assert (=> d!68881 m!324607))

(declare-fun m!324609 () Bool)

(assert (=> d!68881 m!324609))

(assert (=> d!68881 m!324467))

(assert (=> d!68881 m!324469))

(assert (=> b!314857 d!68881))

(declare-fun b!315067 () Bool)

(declare-fun e!196153 () Bool)

(declare-fun e!196157 () Bool)

(assert (=> b!315067 (= e!196153 e!196157)))

(declare-fun res!170631 () Bool)

(declare-fun lt!154139 () SeekEntryResult!2711)

(assert (=> b!315067 (= res!170631 (and ((_ is Intermediate!2711) lt!154139) (not (undefined!3523 lt!154139)) (bvslt (x!31360 lt!154139) #b01111111111111111111111111111110) (bvsge (x!31360 lt!154139) #b00000000000000000000000000000000) (bvsge (x!31360 lt!154139) #b00000000000000000000000000000000)))))

(assert (=> b!315067 (=> (not res!170631) (not e!196157))))

(declare-fun b!315068 () Bool)

(declare-fun e!196154 () SeekEntryResult!2711)

(declare-fun e!196155 () SeekEntryResult!2711)

(assert (=> b!315068 (= e!196154 e!196155)))

(declare-fun c!49833 () Bool)

(declare-fun lt!154138 () (_ BitVec 64))

(assert (=> b!315068 (= c!49833 (or (= lt!154138 k0!2441) (= (bvadd lt!154138 lt!154138) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315070 () Bool)

(assert (=> b!315070 (and (bvsge (index!13022 lt!154139) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154139) (size!7958 a!3293)))))

(declare-fun res!170630 () Bool)

(assert (=> b!315070 (= res!170630 (= (select (arr!7606 a!3293) (index!13022 lt!154139)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196156 () Bool)

(assert (=> b!315070 (=> res!170630 e!196156)))

(declare-fun b!315071 () Bool)

(assert (=> b!315071 (= e!196153 (bvsge (x!31360 lt!154139) #b01111111111111111111111111111110))))

(declare-fun b!315072 () Bool)

(assert (=> b!315072 (= e!196154 (Intermediate!2711 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315073 () Bool)

(assert (=> b!315073 (and (bvsge (index!13022 lt!154139) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154139) (size!7958 a!3293)))))

(declare-fun res!170632 () Bool)

(assert (=> b!315073 (= res!170632 (= (select (arr!7606 a!3293) (index!13022 lt!154139)) k0!2441))))

(assert (=> b!315073 (=> res!170632 e!196156)))

(assert (=> b!315073 (= e!196157 e!196156)))

(declare-fun b!315074 () Bool)

(assert (=> b!315074 (= e!196155 (Intermediate!2711 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315075 () Bool)

(assert (=> b!315075 (= e!196155 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68901 () Bool)

(assert (=> d!68901 e!196153))

(declare-fun c!49835 () Bool)

(assert (=> d!68901 (= c!49835 (and ((_ is Intermediate!2711) lt!154139) (undefined!3523 lt!154139)))))

(assert (=> d!68901 (= lt!154139 e!196154)))

(declare-fun c!49834 () Bool)

(assert (=> d!68901 (= c!49834 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68901 (= lt!154138 (select (arr!7606 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68901 (validMask!0 mask!3709)))

(assert (=> d!68901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154139)))

(declare-fun b!315069 () Bool)

(assert (=> b!315069 (and (bvsge (index!13022 lt!154139) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154139) (size!7958 a!3293)))))

(assert (=> b!315069 (= e!196156 (= (select (arr!7606 a!3293) (index!13022 lt!154139)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68901 c!49834) b!315072))

(assert (= (and d!68901 (not c!49834)) b!315068))

(assert (= (and b!315068 c!49833) b!315074))

(assert (= (and b!315068 (not c!49833)) b!315075))

(assert (= (and d!68901 c!49835) b!315071))

(assert (= (and d!68901 (not c!49835)) b!315067))

(assert (= (and b!315067 res!170631) b!315073))

(assert (= (and b!315073 (not res!170632)) b!315070))

(assert (= (and b!315070 (not res!170630)) b!315069))

(declare-fun m!324615 () Bool)

(assert (=> b!315069 m!324615))

(assert (=> b!315075 m!324467))

(declare-fun m!324619 () Bool)

(assert (=> b!315075 m!324619))

(assert (=> b!315075 m!324619))

(declare-fun m!324621 () Bool)

(assert (=> b!315075 m!324621))

(assert (=> b!315073 m!324615))

(assert (=> d!68901 m!324467))

(declare-fun m!324623 () Bool)

(assert (=> d!68901 m!324623))

(assert (=> d!68901 m!324475))

(assert (=> b!315070 m!324615))

(assert (=> b!314860 d!68901))

(declare-fun d!68905 () Bool)

(declare-fun lt!154147 () (_ BitVec 32))

(declare-fun lt!154146 () (_ BitVec 32))

(assert (=> d!68905 (= lt!154147 (bvmul (bvxor lt!154146 (bvlshr lt!154146 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68905 (= lt!154146 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68905 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170633 (let ((h!5277 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31369 (bvmul (bvxor h!5277 (bvlshr h!5277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31369 (bvlshr x!31369 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170633 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170633 #b00000000000000000000000000000000))))))

(assert (=> d!68905 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154147 (bvlshr lt!154147 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314860 d!68905))

(declare-fun b!315085 () Bool)

(declare-fun e!196163 () Bool)

(declare-fun e!196167 () Bool)

(assert (=> b!315085 (= e!196163 e!196167)))

(declare-fun res!170639 () Bool)

(declare-fun lt!154149 () SeekEntryResult!2711)

(assert (=> b!315085 (= res!170639 (and ((_ is Intermediate!2711) lt!154149) (not (undefined!3523 lt!154149)) (bvslt (x!31360 lt!154149) #b01111111111111111111111111111110) (bvsge (x!31360 lt!154149) #b00000000000000000000000000000000) (bvsge (x!31360 lt!154149) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!315085 (=> (not res!170639) (not e!196167))))

(declare-fun b!315086 () Bool)

(declare-fun e!196164 () SeekEntryResult!2711)

(declare-fun e!196165 () SeekEntryResult!2711)

(assert (=> b!315086 (= e!196164 e!196165)))

(declare-fun c!49839 () Bool)

(declare-fun lt!154148 () (_ BitVec 64))

(assert (=> b!315086 (= c!49839 (or (= lt!154148 k0!2441) (= (bvadd lt!154148 lt!154148) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315088 () Bool)

(assert (=> b!315088 (and (bvsge (index!13022 lt!154149) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154149) (size!7958 a!3293)))))

(declare-fun res!170638 () Bool)

(assert (=> b!315088 (= res!170638 (= (select (arr!7606 a!3293) (index!13022 lt!154149)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196166 () Bool)

(assert (=> b!315088 (=> res!170638 e!196166)))

(declare-fun b!315089 () Bool)

(assert (=> b!315089 (= e!196163 (bvsge (x!31360 lt!154149) #b01111111111111111111111111111110))))

(declare-fun b!315090 () Bool)

(assert (=> b!315090 (= e!196164 (Intermediate!2711 true (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315091 () Bool)

(assert (=> b!315091 (and (bvsge (index!13022 lt!154149) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154149) (size!7958 a!3293)))))

(declare-fun res!170640 () Bool)

(assert (=> b!315091 (= res!170640 (= (select (arr!7606 a!3293) (index!13022 lt!154149)) k0!2441))))

(assert (=> b!315091 (=> res!170640 e!196166)))

(assert (=> b!315091 (= e!196167 e!196166)))

(declare-fun b!315092 () Bool)

(assert (=> b!315092 (= e!196165 (Intermediate!2711 false (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315093 () Bool)

(assert (=> b!315093 (= e!196165 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68911 () Bool)

(assert (=> d!68911 e!196163))

(declare-fun c!49841 () Bool)

(assert (=> d!68911 (= c!49841 (and ((_ is Intermediate!2711) lt!154149) (undefined!3523 lt!154149)))))

(assert (=> d!68911 (= lt!154149 e!196164)))

(declare-fun c!49840 () Bool)

(assert (=> d!68911 (= c!49840 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68911 (= lt!154148 (select (arr!7606 a!3293) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709)))))

(assert (=> d!68911 (validMask!0 mask!3709)))

(assert (=> d!68911 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709) lt!154149)))

(declare-fun b!315087 () Bool)

(assert (=> b!315087 (and (bvsge (index!13022 lt!154149) #b00000000000000000000000000000000) (bvslt (index!13022 lt!154149) (size!7958 a!3293)))))

(assert (=> b!315087 (= e!196166 (= (select (arr!7606 a!3293) (index!13022 lt!154149)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68911 c!49840) b!315090))

(assert (= (and d!68911 (not c!49840)) b!315086))

(assert (= (and b!315086 c!49839) b!315092))

(assert (= (and b!315086 (not c!49839)) b!315093))

(assert (= (and d!68911 c!49841) b!315089))

(assert (= (and d!68911 (not c!49841)) b!315085))

(assert (= (and b!315085 res!170639) b!315091))

(assert (= (and b!315091 (not res!170640)) b!315088))

(assert (= (and b!315088 (not res!170638)) b!315087))

(declare-fun m!324633 () Bool)

(assert (=> b!315087 m!324633))

(assert (=> b!315093 m!324463))

(declare-fun m!324635 () Bool)

(assert (=> b!315093 m!324635))

(assert (=> b!315093 m!324635))

(declare-fun m!324637 () Bool)

(assert (=> b!315093 m!324637))

(assert (=> b!315091 m!324633))

(assert (=> d!68911 m!324463))

(declare-fun m!324639 () Bool)

(assert (=> d!68911 m!324639))

(assert (=> d!68911 m!324475))

(assert (=> b!315088 m!324633))

(assert (=> b!314855 d!68911))

(declare-fun d!68913 () Bool)

(declare-fun lt!154164 () (_ BitVec 32))

(assert (=> d!68913 (and (bvsge lt!154164 #b00000000000000000000000000000000) (bvslt lt!154164 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68913 (= lt!154164 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!68913 (validMask!0 mask!3709)))

(assert (=> d!68913 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!154164)))

(declare-fun bs!11036 () Bool)

(assert (= bs!11036 d!68913))

(declare-fun m!324641 () Bool)

(assert (=> bs!11036 m!324641))

(assert (=> bs!11036 m!324475))

(assert (=> b!314855 d!68913))

(declare-fun d!68917 () Bool)

(declare-fun res!170646 () Bool)

(declare-fun e!196183 () Bool)

(assert (=> d!68917 (=> res!170646 e!196183)))

(assert (=> d!68917 (= res!170646 (bvsge #b00000000000000000000000000000000 (size!7958 a!3293)))))

(assert (=> d!68917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196183)))

(declare-fun b!315120 () Bool)

(declare-fun e!196185 () Bool)

(declare-fun call!25973 () Bool)

(assert (=> b!315120 (= e!196185 call!25973)))

(declare-fun b!315121 () Bool)

(declare-fun e!196184 () Bool)

(assert (=> b!315121 (= e!196184 e!196185)))

(declare-fun lt!154176 () (_ BitVec 64))

(assert (=> b!315121 (= lt!154176 (select (arr!7606 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9661 0))(
  ( (Unit!9662) )
))
(declare-fun lt!154174 () Unit!9661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16067 (_ BitVec 64) (_ BitVec 32)) Unit!9661)

(assert (=> b!315121 (= lt!154174 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154176 #b00000000000000000000000000000000))))

(assert (=> b!315121 (arrayContainsKey!0 a!3293 lt!154176 #b00000000000000000000000000000000)))

(declare-fun lt!154175 () Unit!9661)

(assert (=> b!315121 (= lt!154175 lt!154174)))

(declare-fun res!170645 () Bool)

(assert (=> b!315121 (= res!170645 (= (seekEntryOrOpen!0 (select (arr!7606 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2711 #b00000000000000000000000000000000)))))

(assert (=> b!315121 (=> (not res!170645) (not e!196185))))

(declare-fun bm!25970 () Bool)

(assert (=> bm!25970 (= call!25973 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!315122 () Bool)

(assert (=> b!315122 (= e!196183 e!196184)))

(declare-fun c!49853 () Bool)

(assert (=> b!315122 (= c!49853 (validKeyInArray!0 (select (arr!7606 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!315123 () Bool)

(assert (=> b!315123 (= e!196184 call!25973)))

(assert (= (and d!68917 (not res!170646)) b!315122))

(assert (= (and b!315122 c!49853) b!315121))

(assert (= (and b!315122 (not c!49853)) b!315123))

(assert (= (and b!315121 res!170645) b!315120))

(assert (= (or b!315120 b!315123) bm!25970))

(assert (=> b!315121 m!324565))

(declare-fun m!324653 () Bool)

(assert (=> b!315121 m!324653))

(declare-fun m!324655 () Bool)

(assert (=> b!315121 m!324655))

(assert (=> b!315121 m!324565))

(declare-fun m!324657 () Bool)

(assert (=> b!315121 m!324657))

(declare-fun m!324659 () Bool)

(assert (=> bm!25970 m!324659))

(assert (=> b!315122 m!324565))

(assert (=> b!315122 m!324565))

(declare-fun m!324661 () Bool)

(assert (=> b!315122 m!324661))

(assert (=> b!314861 d!68917))

(check-sat (not d!68881) (not d!68913) (not b!314982) (not d!68901) (not d!68863) (not b!314988) (not b!315075) (not b!315057) (not bm!25970) (not d!68911) (not b!315093) (not b!315122) (not b!315121))
(check-sat)
