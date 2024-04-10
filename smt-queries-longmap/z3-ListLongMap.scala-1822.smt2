; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32838 () Bool)

(assert start!32838)

(declare-fun b!327845 () Bool)

(declare-fun res!180601 () Bool)

(declare-fun e!201588 () Bool)

(assert (=> b!327845 (=> (not res!180601) (not e!201588))))

(declare-datatypes ((array!16785 0))(
  ( (array!16786 (arr!7944 (Array (_ BitVec 32) (_ BitVec 64))) (size!8296 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16785)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3075 0))(
  ( (MissingZero!3075 (index!14476 (_ BitVec 32))) (Found!3075 (index!14477 (_ BitVec 32))) (Intermediate!3075 (undefined!3887 Bool) (index!14478 (_ BitVec 32)) (x!32725 (_ BitVec 32))) (Undefined!3075) (MissingVacant!3075 (index!14479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16785 (_ BitVec 32)) SeekEntryResult!3075)

(assert (=> b!327845 (= res!180601 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3075 i!1250)))))

(declare-fun b!327846 () Bool)

(declare-fun res!180603 () Bool)

(assert (=> b!327846 (=> (not res!180603) (not e!201588))))

(declare-fun arrayContainsKey!0 (array!16785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327846 (= res!180603 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327847 () Bool)

(declare-fun res!180594 () Bool)

(assert (=> b!327847 (=> (not res!180594) (not e!201588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16785 (_ BitVec 32)) Bool)

(assert (=> b!327847 (= res!180594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327848 () Bool)

(declare-fun res!180595 () Bool)

(declare-fun e!201589 () Bool)

(assert (=> b!327848 (=> (not res!180595) (not e!201589))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327848 (= res!180595 (and (= (select (arr!7944 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8296 a!3305))))))

(declare-fun b!327849 () Bool)

(assert (=> b!327849 (= e!201588 e!201589)))

(declare-fun res!180600 () Bool)

(assert (=> b!327849 (=> (not res!180600) (not e!201589))))

(declare-fun lt!157697 () SeekEntryResult!3075)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16785 (_ BitVec 32)) SeekEntryResult!3075)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327849 (= res!180600 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157697))))

(assert (=> b!327849 (= lt!157697 (Intermediate!3075 false resIndex!58 resX!58))))

(declare-fun b!327850 () Bool)

(declare-fun res!180597 () Bool)

(assert (=> b!327850 (=> (not res!180597) (not e!201588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327850 (= res!180597 (validKeyInArray!0 k0!2497))))

(declare-fun b!327851 () Bool)

(declare-fun res!180598 () Bool)

(assert (=> b!327851 (=> (not res!180598) (not e!201589))))

(assert (=> b!327851 (= res!180598 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157697))))

(declare-fun b!327852 () Bool)

(declare-fun lt!157698 () SeekEntryResult!3075)

(get-info :version)

(assert (=> b!327852 (= e!201589 (and ((_ is Intermediate!3075) lt!157698) (bvslt (x!32725 lt!157698) (bvadd #b00000000000000000000000000000001 x!1490))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327852 (= lt!157698 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327853 () Bool)

(declare-fun res!180596 () Bool)

(assert (=> b!327853 (=> (not res!180596) (not e!201589))))

(assert (=> b!327853 (= res!180596 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7944 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7944 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7944 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!327854 () Bool)

(declare-fun res!180602 () Bool)

(assert (=> b!327854 (=> (not res!180602) (not e!201588))))

(assert (=> b!327854 (= res!180602 (and (= (size!8296 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8296 a!3305))))))

(declare-fun res!180599 () Bool)

(assert (=> start!32838 (=> (not res!180599) (not e!201588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32838 (= res!180599 (validMask!0 mask!3777))))

(assert (=> start!32838 e!201588))

(declare-fun array_inv!5907 (array!16785) Bool)

(assert (=> start!32838 (array_inv!5907 a!3305)))

(assert (=> start!32838 true))

(assert (= (and start!32838 res!180599) b!327854))

(assert (= (and b!327854 res!180602) b!327850))

(assert (= (and b!327850 res!180597) b!327846))

(assert (= (and b!327846 res!180603) b!327845))

(assert (= (and b!327845 res!180601) b!327847))

(assert (= (and b!327847 res!180594) b!327849))

(assert (= (and b!327849 res!180600) b!327848))

(assert (= (and b!327848 res!180595) b!327851))

(assert (= (and b!327851 res!180598) b!327853))

(assert (= (and b!327853 res!180596) b!327852))

(declare-fun m!334051 () Bool)

(assert (=> b!327846 m!334051))

(declare-fun m!334053 () Bool)

(assert (=> b!327849 m!334053))

(assert (=> b!327849 m!334053))

(declare-fun m!334055 () Bool)

(assert (=> b!327849 m!334055))

(declare-fun m!334057 () Bool)

(assert (=> b!327851 m!334057))

(declare-fun m!334059 () Bool)

(assert (=> b!327852 m!334059))

(assert (=> b!327852 m!334059))

(declare-fun m!334061 () Bool)

(assert (=> b!327852 m!334061))

(declare-fun m!334063 () Bool)

(assert (=> b!327845 m!334063))

(declare-fun m!334065 () Bool)

(assert (=> b!327847 m!334065))

(declare-fun m!334067 () Bool)

(assert (=> b!327848 m!334067))

(declare-fun m!334069 () Bool)

(assert (=> b!327850 m!334069))

(declare-fun m!334071 () Bool)

(assert (=> start!32838 m!334071))

(declare-fun m!334073 () Bool)

(assert (=> start!32838 m!334073))

(declare-fun m!334075 () Bool)

(assert (=> b!327853 m!334075))

(check-sat (not b!327851) (not b!327846) (not b!327852) (not b!327849) (not start!32838) (not b!327850) (not b!327847) (not b!327845))
(check-sat)
(get-model)

(declare-fun b!327924 () Bool)

(declare-fun c!51276 () Bool)

(declare-fun lt!157718 () (_ BitVec 64))

(assert (=> b!327924 (= c!51276 (= lt!157718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201621 () SeekEntryResult!3075)

(declare-fun e!201620 () SeekEntryResult!3075)

(assert (=> b!327924 (= e!201621 e!201620)))

(declare-fun b!327925 () Bool)

(declare-fun lt!157719 () SeekEntryResult!3075)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16785 (_ BitVec 32)) SeekEntryResult!3075)

(assert (=> b!327925 (= e!201620 (seekKeyOrZeroReturnVacant!0 (x!32725 lt!157719) (index!14478 lt!157719) (index!14478 lt!157719) k0!2497 a!3305 mask!3777))))

(declare-fun d!69913 () Bool)

(declare-fun lt!157717 () SeekEntryResult!3075)

(assert (=> d!69913 (and (or ((_ is Undefined!3075) lt!157717) (not ((_ is Found!3075) lt!157717)) (and (bvsge (index!14477 lt!157717) #b00000000000000000000000000000000) (bvslt (index!14477 lt!157717) (size!8296 a!3305)))) (or ((_ is Undefined!3075) lt!157717) ((_ is Found!3075) lt!157717) (not ((_ is MissingZero!3075) lt!157717)) (and (bvsge (index!14476 lt!157717) #b00000000000000000000000000000000) (bvslt (index!14476 lt!157717) (size!8296 a!3305)))) (or ((_ is Undefined!3075) lt!157717) ((_ is Found!3075) lt!157717) ((_ is MissingZero!3075) lt!157717) (not ((_ is MissingVacant!3075) lt!157717)) (and (bvsge (index!14479 lt!157717) #b00000000000000000000000000000000) (bvslt (index!14479 lt!157717) (size!8296 a!3305)))) (or ((_ is Undefined!3075) lt!157717) (ite ((_ is Found!3075) lt!157717) (= (select (arr!7944 a!3305) (index!14477 lt!157717)) k0!2497) (ite ((_ is MissingZero!3075) lt!157717) (= (select (arr!7944 a!3305) (index!14476 lt!157717)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3075) lt!157717) (= (select (arr!7944 a!3305) (index!14479 lt!157717)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!201622 () SeekEntryResult!3075)

(assert (=> d!69913 (= lt!157717 e!201622)))

(declare-fun c!51275 () Bool)

(assert (=> d!69913 (= c!51275 (and ((_ is Intermediate!3075) lt!157719) (undefined!3887 lt!157719)))))

(assert (=> d!69913 (= lt!157719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69913 (validMask!0 mask!3777)))

(assert (=> d!69913 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157717)))

(declare-fun b!327926 () Bool)

(assert (=> b!327926 (= e!201622 e!201621)))

(assert (=> b!327926 (= lt!157718 (select (arr!7944 a!3305) (index!14478 lt!157719)))))

(declare-fun c!51274 () Bool)

(assert (=> b!327926 (= c!51274 (= lt!157718 k0!2497))))

(declare-fun b!327927 () Bool)

(assert (=> b!327927 (= e!201620 (MissingZero!3075 (index!14478 lt!157719)))))

(declare-fun b!327928 () Bool)

(assert (=> b!327928 (= e!201621 (Found!3075 (index!14478 lt!157719)))))

(declare-fun b!327929 () Bool)

(assert (=> b!327929 (= e!201622 Undefined!3075)))

(assert (= (and d!69913 c!51275) b!327929))

(assert (= (and d!69913 (not c!51275)) b!327926))

(assert (= (and b!327926 c!51274) b!327928))

(assert (= (and b!327926 (not c!51274)) b!327924))

(assert (= (and b!327924 c!51276) b!327927))

(assert (= (and b!327924 (not c!51276)) b!327925))

(declare-fun m!334111 () Bool)

(assert (=> b!327925 m!334111))

(declare-fun m!334113 () Bool)

(assert (=> d!69913 m!334113))

(assert (=> d!69913 m!334053))

(assert (=> d!69913 m!334055))

(declare-fun m!334115 () Bool)

(assert (=> d!69913 m!334115))

(assert (=> d!69913 m!334071))

(assert (=> d!69913 m!334053))

(declare-fun m!334117 () Bool)

(assert (=> d!69913 m!334117))

(declare-fun m!334119 () Bool)

(assert (=> b!327926 m!334119))

(assert (=> b!327845 d!69913))

(declare-fun d!69919 () Bool)

(assert (=> d!69919 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!327850 d!69919))

(declare-fun d!69923 () Bool)

(declare-fun res!180648 () Bool)

(declare-fun e!201627 () Bool)

(assert (=> d!69923 (=> res!180648 e!201627)))

(assert (=> d!69923 (= res!180648 (= (select (arr!7944 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69923 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201627)))

(declare-fun b!327934 () Bool)

(declare-fun e!201628 () Bool)

(assert (=> b!327934 (= e!201627 e!201628)))

(declare-fun res!180649 () Bool)

(assert (=> b!327934 (=> (not res!180649) (not e!201628))))

(assert (=> b!327934 (= res!180649 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8296 a!3305)))))

(declare-fun b!327935 () Bool)

(assert (=> b!327935 (= e!201628 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69923 (not res!180648)) b!327934))

(assert (= (and b!327934 res!180649) b!327935))

(declare-fun m!334121 () Bool)

(assert (=> d!69923 m!334121))

(declare-fun m!334123 () Bool)

(assert (=> b!327935 m!334123))

(assert (=> b!327846 d!69923))

(declare-fun d!69929 () Bool)

(declare-fun e!201659 () Bool)

(assert (=> d!69929 e!201659))

(declare-fun c!51295 () Bool)

(declare-fun lt!157749 () SeekEntryResult!3075)

(assert (=> d!69929 (= c!51295 (and ((_ is Intermediate!3075) lt!157749) (undefined!3887 lt!157749)))))

(declare-fun e!201658 () SeekEntryResult!3075)

(assert (=> d!69929 (= lt!157749 e!201658)))

(declare-fun c!51296 () Bool)

(assert (=> d!69929 (= c!51296 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157748 () (_ BitVec 64))

(assert (=> d!69929 (= lt!157748 (select (arr!7944 a!3305) index!1840))))

(assert (=> d!69929 (validMask!0 mask!3777)))

(assert (=> d!69929 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157749)))

(declare-fun b!327984 () Bool)

(assert (=> b!327984 (and (bvsge (index!14478 lt!157749) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157749) (size!8296 a!3305)))))

(declare-fun res!180663 () Bool)

(assert (=> b!327984 (= res!180663 (= (select (arr!7944 a!3305) (index!14478 lt!157749)) k0!2497))))

(declare-fun e!201661 () Bool)

(assert (=> b!327984 (=> res!180663 e!201661)))

(declare-fun e!201657 () Bool)

(assert (=> b!327984 (= e!201657 e!201661)))

(declare-fun b!327985 () Bool)

(assert (=> b!327985 (= e!201659 (bvsge (x!32725 lt!157749) #b01111111111111111111111111111110))))

(declare-fun b!327986 () Bool)

(declare-fun e!201660 () SeekEntryResult!3075)

(assert (=> b!327986 (= e!201660 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!327987 () Bool)

(assert (=> b!327987 (= e!201658 (Intermediate!3075 true index!1840 x!1490))))

(declare-fun b!327988 () Bool)

(assert (=> b!327988 (= e!201660 (Intermediate!3075 false index!1840 x!1490))))

(declare-fun b!327989 () Bool)

(assert (=> b!327989 (= e!201659 e!201657)))

(declare-fun res!180662 () Bool)

(assert (=> b!327989 (= res!180662 (and ((_ is Intermediate!3075) lt!157749) (not (undefined!3887 lt!157749)) (bvslt (x!32725 lt!157749) #b01111111111111111111111111111110) (bvsge (x!32725 lt!157749) #b00000000000000000000000000000000) (bvsge (x!32725 lt!157749) x!1490)))))

(assert (=> b!327989 (=> (not res!180662) (not e!201657))))

(declare-fun b!327990 () Bool)

(assert (=> b!327990 (and (bvsge (index!14478 lt!157749) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157749) (size!8296 a!3305)))))

(assert (=> b!327990 (= e!201661 (= (select (arr!7944 a!3305) (index!14478 lt!157749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!327991 () Bool)

(assert (=> b!327991 (and (bvsge (index!14478 lt!157749) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157749) (size!8296 a!3305)))))

(declare-fun res!180664 () Bool)

(assert (=> b!327991 (= res!180664 (= (select (arr!7944 a!3305) (index!14478 lt!157749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!327991 (=> res!180664 e!201661)))

(declare-fun b!327992 () Bool)

(assert (=> b!327992 (= e!201658 e!201660)))

(declare-fun c!51297 () Bool)

(assert (=> b!327992 (= c!51297 (or (= lt!157748 k0!2497) (= (bvadd lt!157748 lt!157748) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69929 c!51296) b!327987))

(assert (= (and d!69929 (not c!51296)) b!327992))

(assert (= (and b!327992 c!51297) b!327988))

(assert (= (and b!327992 (not c!51297)) b!327986))

(assert (= (and d!69929 c!51295) b!327985))

(assert (= (and d!69929 (not c!51295)) b!327989))

(assert (= (and b!327989 res!180662) b!327984))

(assert (= (and b!327984 (not res!180663)) b!327991))

(assert (= (and b!327991 (not res!180664)) b!327990))

(assert (=> d!69929 m!334075))

(assert (=> d!69929 m!334071))

(assert (=> b!327986 m!334059))

(assert (=> b!327986 m!334059))

(declare-fun m!334147 () Bool)

(assert (=> b!327986 m!334147))

(declare-fun m!334149 () Bool)

(assert (=> b!327991 m!334149))

(assert (=> b!327984 m!334149))

(assert (=> b!327990 m!334149))

(assert (=> b!327851 d!69929))

(declare-fun d!69939 () Bool)

(declare-fun res!180669 () Bool)

(declare-fun e!201670 () Bool)

(assert (=> d!69939 (=> res!180669 e!201670)))

(assert (=> d!69939 (= res!180669 (bvsge #b00000000000000000000000000000000 (size!8296 a!3305)))))

(assert (=> d!69939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201670)))

(declare-fun b!328001 () Bool)

(declare-fun e!201668 () Bool)

(declare-fun e!201669 () Bool)

(assert (=> b!328001 (= e!201668 e!201669)))

(declare-fun lt!157757 () (_ BitVec 64))

(assert (=> b!328001 (= lt!157757 (select (arr!7944 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10184 0))(
  ( (Unit!10185) )
))
(declare-fun lt!157758 () Unit!10184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16785 (_ BitVec 64) (_ BitVec 32)) Unit!10184)

(assert (=> b!328001 (= lt!157758 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157757 #b00000000000000000000000000000000))))

(assert (=> b!328001 (arrayContainsKey!0 a!3305 lt!157757 #b00000000000000000000000000000000)))

(declare-fun lt!157756 () Unit!10184)

(assert (=> b!328001 (= lt!157756 lt!157758)))

(declare-fun res!180670 () Bool)

(assert (=> b!328001 (= res!180670 (= (seekEntryOrOpen!0 (select (arr!7944 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3075 #b00000000000000000000000000000000)))))

(assert (=> b!328001 (=> (not res!180670) (not e!201669))))

(declare-fun b!328002 () Bool)

(declare-fun call!26113 () Bool)

(assert (=> b!328002 (= e!201668 call!26113)))

(declare-fun bm!26110 () Bool)

(assert (=> bm!26110 (= call!26113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328003 () Bool)

(assert (=> b!328003 (= e!201670 e!201668)))

(declare-fun c!51300 () Bool)

(assert (=> b!328003 (= c!51300 (validKeyInArray!0 (select (arr!7944 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!328004 () Bool)

(assert (=> b!328004 (= e!201669 call!26113)))

(assert (= (and d!69939 (not res!180669)) b!328003))

(assert (= (and b!328003 c!51300) b!328001))

(assert (= (and b!328003 (not c!51300)) b!328002))

(assert (= (and b!328001 res!180670) b!328004))

(assert (= (or b!328004 b!328002) bm!26110))

(assert (=> b!328001 m!334121))

(declare-fun m!334151 () Bool)

(assert (=> b!328001 m!334151))

(declare-fun m!334153 () Bool)

(assert (=> b!328001 m!334153))

(assert (=> b!328001 m!334121))

(declare-fun m!334155 () Bool)

(assert (=> b!328001 m!334155))

(declare-fun m!334157 () Bool)

(assert (=> bm!26110 m!334157))

(assert (=> b!328003 m!334121))

(assert (=> b!328003 m!334121))

(declare-fun m!334159 () Bool)

(assert (=> b!328003 m!334159))

(assert (=> b!327847 d!69939))

(declare-fun d!69941 () Bool)

(declare-fun e!201673 () Bool)

(assert (=> d!69941 e!201673))

(declare-fun c!51301 () Bool)

(declare-fun lt!157760 () SeekEntryResult!3075)

(assert (=> d!69941 (= c!51301 (and ((_ is Intermediate!3075) lt!157760) (undefined!3887 lt!157760)))))

(declare-fun e!201672 () SeekEntryResult!3075)

(assert (=> d!69941 (= lt!157760 e!201672)))

(declare-fun c!51302 () Bool)

(assert (=> d!69941 (= c!51302 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!157759 () (_ BitVec 64))

(assert (=> d!69941 (= lt!157759 (select (arr!7944 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!69941 (validMask!0 mask!3777)))

(assert (=> d!69941 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777) lt!157760)))

(declare-fun b!328005 () Bool)

(assert (=> b!328005 (and (bvsge (index!14478 lt!157760) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157760) (size!8296 a!3305)))))

(declare-fun res!180672 () Bool)

(assert (=> b!328005 (= res!180672 (= (select (arr!7944 a!3305) (index!14478 lt!157760)) k0!2497))))

(declare-fun e!201675 () Bool)

(assert (=> b!328005 (=> res!180672 e!201675)))

(declare-fun e!201671 () Bool)

(assert (=> b!328005 (= e!201671 e!201675)))

(declare-fun b!328006 () Bool)

(assert (=> b!328006 (= e!201673 (bvsge (x!32725 lt!157760) #b01111111111111111111111111111110))))

(declare-fun e!201674 () SeekEntryResult!3075)

(declare-fun b!328007 () Bool)

(assert (=> b!328007 (= e!201674 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328008 () Bool)

(assert (=> b!328008 (= e!201672 (Intermediate!3075 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!328009 () Bool)

(assert (=> b!328009 (= e!201674 (Intermediate!3075 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!328010 () Bool)

(assert (=> b!328010 (= e!201673 e!201671)))

(declare-fun res!180671 () Bool)

(assert (=> b!328010 (= res!180671 (and ((_ is Intermediate!3075) lt!157760) (not (undefined!3887 lt!157760)) (bvslt (x!32725 lt!157760) #b01111111111111111111111111111110) (bvsge (x!32725 lt!157760) #b00000000000000000000000000000000) (bvsge (x!32725 lt!157760) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!328010 (=> (not res!180671) (not e!201671))))

(declare-fun b!328011 () Bool)

(assert (=> b!328011 (and (bvsge (index!14478 lt!157760) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157760) (size!8296 a!3305)))))

(assert (=> b!328011 (= e!201675 (= (select (arr!7944 a!3305) (index!14478 lt!157760)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328012 () Bool)

(assert (=> b!328012 (and (bvsge (index!14478 lt!157760) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157760) (size!8296 a!3305)))))

(declare-fun res!180673 () Bool)

(assert (=> b!328012 (= res!180673 (= (select (arr!7944 a!3305) (index!14478 lt!157760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328012 (=> res!180673 e!201675)))

(declare-fun b!328013 () Bool)

(assert (=> b!328013 (= e!201672 e!201674)))

(declare-fun c!51303 () Bool)

(assert (=> b!328013 (= c!51303 (or (= lt!157759 k0!2497) (= (bvadd lt!157759 lt!157759) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69941 c!51302) b!328008))

(assert (= (and d!69941 (not c!51302)) b!328013))

(assert (= (and b!328013 c!51303) b!328009))

(assert (= (and b!328013 (not c!51303)) b!328007))

(assert (= (and d!69941 c!51301) b!328006))

(assert (= (and d!69941 (not c!51301)) b!328010))

(assert (= (and b!328010 res!180671) b!328005))

(assert (= (and b!328005 (not res!180672)) b!328012))

(assert (= (and b!328012 (not res!180673)) b!328011))

(assert (=> d!69941 m!334059))

(declare-fun m!334161 () Bool)

(assert (=> d!69941 m!334161))

(assert (=> d!69941 m!334071))

(assert (=> b!328007 m!334059))

(declare-fun m!334163 () Bool)

(assert (=> b!328007 m!334163))

(assert (=> b!328007 m!334163))

(declare-fun m!334165 () Bool)

(assert (=> b!328007 m!334165))

(declare-fun m!334167 () Bool)

(assert (=> b!328012 m!334167))

(assert (=> b!328005 m!334167))

(assert (=> b!328011 m!334167))

(assert (=> b!327852 d!69941))

(declare-fun d!69943 () Bool)

(declare-fun lt!157767 () (_ BitVec 32))

(assert (=> d!69943 (and (bvsge lt!157767 #b00000000000000000000000000000000) (bvslt lt!157767 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69943 (= lt!157767 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69943 (validMask!0 mask!3777)))

(assert (=> d!69943 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!157767)))

(declare-fun bs!11381 () Bool)

(assert (= bs!11381 d!69943))

(declare-fun m!334169 () Bool)

(assert (=> bs!11381 m!334169))

(assert (=> bs!11381 m!334071))

(assert (=> b!327852 d!69943))

(declare-fun d!69945 () Bool)

(declare-fun e!201690 () Bool)

(assert (=> d!69945 e!201690))

(declare-fun c!51312 () Bool)

(declare-fun lt!157775 () SeekEntryResult!3075)

(assert (=> d!69945 (= c!51312 (and ((_ is Intermediate!3075) lt!157775) (undefined!3887 lt!157775)))))

(declare-fun e!201689 () SeekEntryResult!3075)

(assert (=> d!69945 (= lt!157775 e!201689)))

(declare-fun c!51313 () Bool)

(assert (=> d!69945 (= c!51313 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157774 () (_ BitVec 64))

(assert (=> d!69945 (= lt!157774 (select (arr!7944 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69945 (validMask!0 mask!3777)))

(assert (=> d!69945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157775)))

(declare-fun b!328036 () Bool)

(assert (=> b!328036 (and (bvsge (index!14478 lt!157775) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157775) (size!8296 a!3305)))))

(declare-fun res!180681 () Bool)

(assert (=> b!328036 (= res!180681 (= (select (arr!7944 a!3305) (index!14478 lt!157775)) k0!2497))))

(declare-fun e!201692 () Bool)

(assert (=> b!328036 (=> res!180681 e!201692)))

(declare-fun e!201688 () Bool)

(assert (=> b!328036 (= e!201688 e!201692)))

(declare-fun b!328037 () Bool)

(assert (=> b!328037 (= e!201690 (bvsge (x!32725 lt!157775) #b01111111111111111111111111111110))))

(declare-fun b!328038 () Bool)

(declare-fun e!201691 () SeekEntryResult!3075)

(assert (=> b!328038 (= e!201691 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328039 () Bool)

(assert (=> b!328039 (= e!201689 (Intermediate!3075 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328040 () Bool)

(assert (=> b!328040 (= e!201691 (Intermediate!3075 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328041 () Bool)

(assert (=> b!328041 (= e!201690 e!201688)))

(declare-fun res!180680 () Bool)

(assert (=> b!328041 (= res!180680 (and ((_ is Intermediate!3075) lt!157775) (not (undefined!3887 lt!157775)) (bvslt (x!32725 lt!157775) #b01111111111111111111111111111110) (bvsge (x!32725 lt!157775) #b00000000000000000000000000000000) (bvsge (x!32725 lt!157775) #b00000000000000000000000000000000)))))

(assert (=> b!328041 (=> (not res!180680) (not e!201688))))

(declare-fun b!328042 () Bool)

(assert (=> b!328042 (and (bvsge (index!14478 lt!157775) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157775) (size!8296 a!3305)))))

(assert (=> b!328042 (= e!201692 (= (select (arr!7944 a!3305) (index!14478 lt!157775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328043 () Bool)

(assert (=> b!328043 (and (bvsge (index!14478 lt!157775) #b00000000000000000000000000000000) (bvslt (index!14478 lt!157775) (size!8296 a!3305)))))

(declare-fun res!180682 () Bool)

(assert (=> b!328043 (= res!180682 (= (select (arr!7944 a!3305) (index!14478 lt!157775)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328043 (=> res!180682 e!201692)))

(declare-fun b!328044 () Bool)

(assert (=> b!328044 (= e!201689 e!201691)))

(declare-fun c!51314 () Bool)

(assert (=> b!328044 (= c!51314 (or (= lt!157774 k0!2497) (= (bvadd lt!157774 lt!157774) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!69945 c!51313) b!328039))

(assert (= (and d!69945 (not c!51313)) b!328044))

(assert (= (and b!328044 c!51314) b!328040))

(assert (= (and b!328044 (not c!51314)) b!328038))

(assert (= (and d!69945 c!51312) b!328037))

(assert (= (and d!69945 (not c!51312)) b!328041))

(assert (= (and b!328041 res!180680) b!328036))

(assert (= (and b!328036 (not res!180681)) b!328043))

(assert (= (and b!328043 (not res!180682)) b!328042))

(assert (=> d!69945 m!334053))

(declare-fun m!334171 () Bool)

(assert (=> d!69945 m!334171))

(assert (=> d!69945 m!334071))

(assert (=> b!328038 m!334053))

(declare-fun m!334173 () Bool)

(assert (=> b!328038 m!334173))

(assert (=> b!328038 m!334173))

(declare-fun m!334175 () Bool)

(assert (=> b!328038 m!334175))

(declare-fun m!334177 () Bool)

(assert (=> b!328043 m!334177))

(assert (=> b!328036 m!334177))

(assert (=> b!328042 m!334177))

(assert (=> b!327849 d!69945))

(declare-fun d!69947 () Bool)

(declare-fun lt!157786 () (_ BitVec 32))

(declare-fun lt!157785 () (_ BitVec 32))

(assert (=> d!69947 (= lt!157786 (bvmul (bvxor lt!157785 (bvlshr lt!157785 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69947 (= lt!157785 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69947 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180683 (let ((h!5404 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32732 (bvmul (bvxor h!5404 (bvlshr h!5404 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32732 (bvlshr x!32732 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180683 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180683 #b00000000000000000000000000000000))))))

(assert (=> d!69947 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157786 (bvlshr lt!157786 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!327849 d!69947))

(declare-fun d!69953 () Bool)

(assert (=> d!69953 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32838 d!69953))

(declare-fun d!69967 () Bool)

(assert (=> d!69967 (= (array_inv!5907 a!3305) (bvsge (size!8296 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32838 d!69967))

(check-sat (not b!328001) (not bm!26110) (not b!328007) (not b!328003) (not b!327986) (not d!69943) (not d!69941) (not d!69913) (not b!327935) (not b!327925) (not d!69945) (not d!69929) (not b!328038))
(check-sat)
