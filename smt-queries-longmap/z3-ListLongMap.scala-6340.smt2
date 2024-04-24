; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81864 () Bool)

(assert start!81864)

(declare-fun b!954377 () Bool)

(declare-fun res!638986 () Bool)

(declare-fun e!537647 () Bool)

(assert (=> b!954377 (=> (not res!638986) (not e!537647))))

(declare-datatypes ((array!57787 0))(
  ( (array!57788 (arr!27775 (Array (_ BitVec 32) (_ BitVec 64))) (size!28255 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57787)

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57787 (_ BitVec 32)) Bool)

(assert (=> b!954377 (= res!638986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!954378 () Bool)

(declare-datatypes ((SeekEntryResult!9136 0))(
  ( (MissingZero!9136 (index!38915 (_ BitVec 32))) (Found!9136 (index!38916 (_ BitVec 32))) (Intermediate!9136 (undefined!9948 Bool) (index!38917 (_ BitVec 32)) (x!82054 (_ BitVec 32))) (Undefined!9136) (MissingVacant!9136 (index!38918 (_ BitVec 32))) )
))
(declare-fun lt!430085 () SeekEntryResult!9136)

(declare-fun i!1375 () (_ BitVec 32))

(get-info :version)

(assert (=> b!954378 (= e!537647 (or (not ((_ is Found!9136) lt!430085)) (not (= (index!38916 lt!430085) i!1375))))))

(declare-fun k0!2725 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57787 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!954378 (= lt!430085 (seekEntry!0 k0!2725 a!3460 mask!4034))))

(declare-fun b!954379 () Bool)

(declare-fun res!638988 () Bool)

(assert (=> b!954379 (=> (not res!638988) (not e!537647))))

(assert (=> b!954379 (= res!638988 (= (size!28255 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!954380 () Bool)

(declare-fun res!638987 () Bool)

(assert (=> b!954380 (=> (not res!638987) (not e!537647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954380 (= res!638987 (validKeyInArray!0 k0!2725))))

(declare-fun res!638984 () Bool)

(assert (=> start!81864 (=> (not res!638984) (not e!537647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81864 (= res!638984 (validMask!0 mask!4034))))

(assert (=> start!81864 e!537647))

(assert (=> start!81864 true))

(declare-fun array_inv!21634 (array!57787) Bool)

(assert (=> start!81864 (array_inv!21634 a!3460)))

(declare-fun b!954381 () Bool)

(declare-fun res!638985 () Bool)

(assert (=> b!954381 (=> (not res!638985) (not e!537647))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57787 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!954381 (= res!638985 (= (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034) (Found!9136 i!1375)))))

(assert (= (and start!81864 res!638984) b!954379))

(assert (= (and b!954379 res!638988) b!954377))

(assert (= (and b!954377 res!638986) b!954380))

(assert (= (and b!954380 res!638987) b!954381))

(assert (= (and b!954381 res!638985) b!954378))

(declare-fun m!886817 () Bool)

(assert (=> b!954380 m!886817))

(declare-fun m!886819 () Bool)

(assert (=> b!954377 m!886819))

(declare-fun m!886821 () Bool)

(assert (=> b!954378 m!886821))

(declare-fun m!886823 () Bool)

(assert (=> start!81864 m!886823))

(declare-fun m!886825 () Bool)

(assert (=> start!81864 m!886825))

(declare-fun m!886827 () Bool)

(assert (=> b!954381 m!886827))

(check-sat (not start!81864) (not b!954377) (not b!954381) (not b!954380) (not b!954378))
(check-sat)
(get-model)

(declare-fun b!954436 () Bool)

(declare-fun e!537672 () SeekEntryResult!9136)

(declare-fun lt!430107 () SeekEntryResult!9136)

(assert (=> b!954436 (= e!537672 (Found!9136 (index!38917 lt!430107)))))

(declare-fun b!954437 () Bool)

(declare-fun c!100087 () Bool)

(declare-fun lt!430106 () (_ BitVec 64))

(assert (=> b!954437 (= c!100087 (= lt!430106 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537674 () SeekEntryResult!9136)

(assert (=> b!954437 (= e!537672 e!537674)))

(declare-fun d!115999 () Bool)

(declare-fun lt!430108 () SeekEntryResult!9136)

(assert (=> d!115999 (and (or ((_ is Undefined!9136) lt!430108) (not ((_ is Found!9136) lt!430108)) (and (bvsge (index!38916 lt!430108) #b00000000000000000000000000000000) (bvslt (index!38916 lt!430108) (size!28255 a!3460)))) (or ((_ is Undefined!9136) lt!430108) ((_ is Found!9136) lt!430108) (not ((_ is MissingZero!9136) lt!430108)) (and (bvsge (index!38915 lt!430108) #b00000000000000000000000000000000) (bvslt (index!38915 lt!430108) (size!28255 a!3460)))) (or ((_ is Undefined!9136) lt!430108) ((_ is Found!9136) lt!430108) ((_ is MissingZero!9136) lt!430108) (not ((_ is MissingVacant!9136) lt!430108)) (and (bvsge (index!38918 lt!430108) #b00000000000000000000000000000000) (bvslt (index!38918 lt!430108) (size!28255 a!3460)))) (or ((_ is Undefined!9136) lt!430108) (ite ((_ is Found!9136) lt!430108) (= (select (arr!27775 a!3460) (index!38916 lt!430108)) k0!2725) (ite ((_ is MissingZero!9136) lt!430108) (= (select (arr!27775 a!3460) (index!38915 lt!430108)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9136) lt!430108) (= (select (arr!27775 a!3460) (index!38918 lt!430108)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!537673 () SeekEntryResult!9136)

(assert (=> d!115999 (= lt!430108 e!537673)))

(declare-fun c!100086 () Bool)

(assert (=> d!115999 (= c!100086 (and ((_ is Intermediate!9136) lt!430107) (undefined!9948 lt!430107)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57787 (_ BitVec 32)) SeekEntryResult!9136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115999 (= lt!430107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2725 mask!4034) k0!2725 a!3460 mask!4034))))

(assert (=> d!115999 (validMask!0 mask!4034)))

(assert (=> d!115999 (= (seekEntryOrOpen!0 k0!2725 a!3460 mask!4034) lt!430108)))

(declare-fun b!954438 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57787 (_ BitVec 32)) SeekEntryResult!9136)

(assert (=> b!954438 (= e!537674 (seekKeyOrZeroReturnVacant!0 (x!82054 lt!430107) (index!38917 lt!430107) (index!38917 lt!430107) k0!2725 a!3460 mask!4034))))

(declare-fun b!954439 () Bool)

(assert (=> b!954439 (= e!537673 Undefined!9136)))

(declare-fun b!954440 () Bool)

(assert (=> b!954440 (= e!537674 (MissingZero!9136 (index!38917 lt!430107)))))

(declare-fun b!954441 () Bool)

(assert (=> b!954441 (= e!537673 e!537672)))

(assert (=> b!954441 (= lt!430106 (select (arr!27775 a!3460) (index!38917 lt!430107)))))

(declare-fun c!100088 () Bool)

(assert (=> b!954441 (= c!100088 (= lt!430106 k0!2725))))

(assert (= (and d!115999 c!100086) b!954439))

(assert (= (and d!115999 (not c!100086)) b!954441))

(assert (= (and b!954441 c!100088) b!954436))

(assert (= (and b!954441 (not c!100088)) b!954437))

(assert (= (and b!954437 c!100087) b!954440))

(assert (= (and b!954437 (not c!100087)) b!954438))

(declare-fun m!886853 () Bool)

(assert (=> d!115999 m!886853))

(declare-fun m!886855 () Bool)

(assert (=> d!115999 m!886855))

(declare-fun m!886857 () Bool)

(assert (=> d!115999 m!886857))

(declare-fun m!886859 () Bool)

(assert (=> d!115999 m!886859))

(assert (=> d!115999 m!886853))

(declare-fun m!886861 () Bool)

(assert (=> d!115999 m!886861))

(assert (=> d!115999 m!886823))

(declare-fun m!886863 () Bool)

(assert (=> b!954438 m!886863))

(declare-fun m!886865 () Bool)

(assert (=> b!954441 m!886865))

(assert (=> b!954381 d!115999))

(declare-fun b!954474 () Bool)

(declare-fun e!537693 () Bool)

(declare-fun e!537694 () Bool)

(assert (=> b!954474 (= e!537693 e!537694)))

(declare-fun lt!430131 () (_ BitVec 64))

(assert (=> b!954474 (= lt!430131 (select (arr!27775 a!3460) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32058 0))(
  ( (Unit!32059) )
))
(declare-fun lt!430133 () Unit!32058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57787 (_ BitVec 64) (_ BitVec 32)) Unit!32058)

(assert (=> b!954474 (= lt!430133 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3460 lt!430131 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!954474 (arrayContainsKey!0 a!3460 lt!430131 #b00000000000000000000000000000000)))

(declare-fun lt!430132 () Unit!32058)

(assert (=> b!954474 (= lt!430132 lt!430133)))

(declare-fun res!639024 () Bool)

(assert (=> b!954474 (= res!639024 (= (seekEntryOrOpen!0 (select (arr!27775 a!3460) #b00000000000000000000000000000000) a!3460 mask!4034) (Found!9136 #b00000000000000000000000000000000)))))

(assert (=> b!954474 (=> (not res!639024) (not e!537694))))

(declare-fun b!954475 () Bool)

(declare-fun e!537695 () Bool)

(assert (=> b!954475 (= e!537695 e!537693)))

(declare-fun c!100103 () Bool)

(assert (=> b!954475 (= c!100103 (validKeyInArray!0 (select (arr!27775 a!3460) #b00000000000000000000000000000000)))))

(declare-fun b!954476 () Bool)

(declare-fun call!41705 () Bool)

(assert (=> b!954476 (= e!537694 call!41705)))

(declare-fun b!954477 () Bool)

(assert (=> b!954477 (= e!537693 call!41705)))

(declare-fun d!116009 () Bool)

(declare-fun res!639023 () Bool)

(assert (=> d!116009 (=> res!639023 e!537695)))

(assert (=> d!116009 (= res!639023 (bvsge #b00000000000000000000000000000000 (size!28255 a!3460)))))

(assert (=> d!116009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034) e!537695)))

(declare-fun bm!41702 () Bool)

(assert (=> bm!41702 (= call!41705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3460 mask!4034))))

(assert (= (and d!116009 (not res!639023)) b!954475))

(assert (= (and b!954475 c!100103) b!954474))

(assert (= (and b!954475 (not c!100103)) b!954477))

(assert (= (and b!954474 res!639024) b!954476))

(assert (= (or b!954476 b!954477) bm!41702))

(declare-fun m!886887 () Bool)

(assert (=> b!954474 m!886887))

(declare-fun m!886889 () Bool)

(assert (=> b!954474 m!886889))

(declare-fun m!886891 () Bool)

(assert (=> b!954474 m!886891))

(assert (=> b!954474 m!886887))

(declare-fun m!886893 () Bool)

(assert (=> b!954474 m!886893))

(assert (=> b!954475 m!886887))

(assert (=> b!954475 m!886887))

(declare-fun m!886895 () Bool)

(assert (=> b!954475 m!886895))

(declare-fun m!886897 () Bool)

(assert (=> bm!41702 m!886897))

(assert (=> b!954377 d!116009))

(declare-fun b!954514 () Bool)

(declare-fun e!537722 () SeekEntryResult!9136)

(assert (=> b!954514 (= e!537722 Undefined!9136)))

(declare-fun b!954515 () Bool)

(declare-fun c!100118 () Bool)

(declare-fun lt!430160 () (_ BitVec 64))

(assert (=> b!954515 (= c!100118 (= lt!430160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!537720 () SeekEntryResult!9136)

(declare-fun e!537721 () SeekEntryResult!9136)

(assert (=> b!954515 (= e!537720 e!537721)))

(declare-fun b!954516 () Bool)

(assert (=> b!954516 (= e!537722 e!537720)))

(declare-fun lt!430161 () SeekEntryResult!9136)

(assert (=> b!954516 (= lt!430160 (select (arr!27775 a!3460) (index!38917 lt!430161)))))

(declare-fun c!100116 () Bool)

(assert (=> b!954516 (= c!100116 (= lt!430160 k0!2725))))

(declare-fun b!954517 () Bool)

(declare-fun lt!430163 () SeekEntryResult!9136)

(assert (=> b!954517 (= e!537721 (ite ((_ is MissingVacant!9136) lt!430163) (MissingZero!9136 (index!38918 lt!430163)) lt!430163))))

(assert (=> b!954517 (= lt!430163 (seekKeyOrZeroReturnVacant!0 (x!82054 lt!430161) (index!38917 lt!430161) (index!38917 lt!430161) k0!2725 a!3460 mask!4034))))

(declare-fun d!116015 () Bool)

(declare-fun lt!430162 () SeekEntryResult!9136)

(assert (=> d!116015 (and (or ((_ is MissingVacant!9136) lt!430162) (not ((_ is Found!9136) lt!430162)) (and (bvsge (index!38916 lt!430162) #b00000000000000000000000000000000) (bvslt (index!38916 lt!430162) (size!28255 a!3460)))) (not ((_ is MissingVacant!9136) lt!430162)) (or (not ((_ is Found!9136) lt!430162)) (= (select (arr!27775 a!3460) (index!38916 lt!430162)) k0!2725)))))

(assert (=> d!116015 (= lt!430162 e!537722)))

(declare-fun c!100117 () Bool)

(assert (=> d!116015 (= c!100117 (and ((_ is Intermediate!9136) lt!430161) (undefined!9948 lt!430161)))))

(assert (=> d!116015 (= lt!430161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2725 mask!4034) k0!2725 a!3460 mask!4034))))

(assert (=> d!116015 (validMask!0 mask!4034)))

(assert (=> d!116015 (= (seekEntry!0 k0!2725 a!3460 mask!4034) lt!430162)))

(declare-fun b!954518 () Bool)

(assert (=> b!954518 (= e!537721 (MissingZero!9136 (index!38917 lt!430161)))))

(declare-fun b!954519 () Bool)

(assert (=> b!954519 (= e!537720 (Found!9136 (index!38917 lt!430161)))))

(assert (= (and d!116015 c!100117) b!954514))

(assert (= (and d!116015 (not c!100117)) b!954516))

(assert (= (and b!954516 c!100116) b!954519))

(assert (= (and b!954516 (not c!100116)) b!954515))

(assert (= (and b!954515 c!100118) b!954518))

(assert (= (and b!954515 (not c!100118)) b!954517))

(declare-fun m!886923 () Bool)

(assert (=> b!954516 m!886923))

(declare-fun m!886925 () Bool)

(assert (=> b!954517 m!886925))

(declare-fun m!886927 () Bool)

(assert (=> d!116015 m!886927))

(assert (=> d!116015 m!886853))

(assert (=> d!116015 m!886853))

(assert (=> d!116015 m!886855))

(assert (=> d!116015 m!886823))

(assert (=> b!954378 d!116015))

(declare-fun d!116027 () Bool)

(assert (=> d!116027 (= (validKeyInArray!0 k0!2725) (and (not (= k0!2725 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2725 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!954380 d!116027))

(declare-fun d!116029 () Bool)

(assert (=> d!116029 (= (validMask!0 mask!4034) (and (or (= mask!4034 #b00000000000000000000000000000111) (= mask!4034 #b00000000000000000000000000001111) (= mask!4034 #b00000000000000000000000000011111) (= mask!4034 #b00000000000000000000000000111111) (= mask!4034 #b00000000000000000000000001111111) (= mask!4034 #b00000000000000000000000011111111) (= mask!4034 #b00000000000000000000000111111111) (= mask!4034 #b00000000000000000000001111111111) (= mask!4034 #b00000000000000000000011111111111) (= mask!4034 #b00000000000000000000111111111111) (= mask!4034 #b00000000000000000001111111111111) (= mask!4034 #b00000000000000000011111111111111) (= mask!4034 #b00000000000000000111111111111111) (= mask!4034 #b00000000000000001111111111111111) (= mask!4034 #b00000000000000011111111111111111) (= mask!4034 #b00000000000000111111111111111111) (= mask!4034 #b00000000000001111111111111111111) (= mask!4034 #b00000000000011111111111111111111) (= mask!4034 #b00000000000111111111111111111111) (= mask!4034 #b00000000001111111111111111111111) (= mask!4034 #b00000000011111111111111111111111) (= mask!4034 #b00000000111111111111111111111111) (= mask!4034 #b00000001111111111111111111111111) (= mask!4034 #b00000011111111111111111111111111) (= mask!4034 #b00000111111111111111111111111111) (= mask!4034 #b00001111111111111111111111111111) (= mask!4034 #b00011111111111111111111111111111) (= mask!4034 #b00111111111111111111111111111111)) (bvsle mask!4034 #b00111111111111111111111111111111)))))

(assert (=> start!81864 d!116029))

(declare-fun d!116031 () Bool)

(assert (=> d!116031 (= (array_inv!21634 a!3460) (bvsge (size!28255 a!3460) #b00000000000000000000000000000000))))

(assert (=> start!81864 d!116031))

(check-sat (not bm!41702) (not d!116015) (not b!954438) (not b!954475) (not b!954517) (not b!954474) (not d!115999))
(check-sat)
