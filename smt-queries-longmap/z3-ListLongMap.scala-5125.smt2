; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69740 () Bool)

(assert start!69740)

(declare-fun b!811783 () Bool)

(declare-fun res!554522 () Bool)

(declare-fun e!449392 () Bool)

(assert (=> b!811783 (=> (not res!554522) (not e!449392))))

(declare-datatypes ((array!44068 0))(
  ( (array!44069 (arr!21100 (Array (_ BitVec 32) (_ BitVec 64))) (size!21520 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44068)

(declare-datatypes ((List!14970 0))(
  ( (Nil!14967) (Cons!14966 (h!16101 (_ BitVec 64)) (t!21277 List!14970)) )
))
(declare-fun arrayNoDuplicates!0 (array!44068 (_ BitVec 32) List!14970) Bool)

(assert (=> b!811783 (= res!554522 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14967))))

(declare-fun b!811785 () Bool)

(declare-fun res!554515 () Bool)

(declare-fun e!449387 () Bool)

(assert (=> b!811785 (=> (not res!554515) (not e!449387))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!811785 (= res!554515 (and (= (size!21520 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21520 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21520 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811786 () Bool)

(declare-fun e!449388 () Bool)

(assert (=> b!811786 (= e!449392 e!449388)))

(declare-fun res!554520 () Bool)

(assert (=> b!811786 (=> (not res!554520) (not e!449388))))

(declare-datatypes ((SeekEntryResult!8647 0))(
  ( (MissingZero!8647 (index!36956 (_ BitVec 32))) (Found!8647 (index!36957 (_ BitVec 32))) (Intermediate!8647 (undefined!9459 Bool) (index!36958 (_ BitVec 32)) (x!67929 (_ BitVec 32))) (Undefined!8647) (MissingVacant!8647 (index!36959 (_ BitVec 32))) )
))
(declare-fun lt!363880 () SeekEntryResult!8647)

(declare-fun lt!363875 () SeekEntryResult!8647)

(assert (=> b!811786 (= res!554520 (= lt!363880 lt!363875))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363876 () (_ BitVec 64))

(declare-fun lt!363873 () array!44068)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44068 (_ BitVec 32)) SeekEntryResult!8647)

(assert (=> b!811786 (= lt!363875 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363876 lt!363873 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44068 (_ BitVec 32)) SeekEntryResult!8647)

(assert (=> b!811786 (= lt!363880 (seekEntryOrOpen!0 lt!363876 lt!363873 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!811786 (= lt!363876 (select (store (arr!21100 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811786 (= lt!363873 (array!44069 (store (arr!21100 a!3170) i!1163 k0!2044) (size!21520 a!3170)))))

(declare-fun b!811787 () Bool)

(declare-fun res!554523 () Bool)

(assert (=> b!811787 (=> (not res!554523) (not e!449387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811787 (= res!554523 (validKeyInArray!0 (select (arr!21100 a!3170) j!153)))))

(declare-fun b!811788 () Bool)

(assert (=> b!811788 (= e!449387 e!449392)))

(declare-fun res!554517 () Bool)

(assert (=> b!811788 (=> (not res!554517) (not e!449392))))

(declare-fun lt!363872 () SeekEntryResult!8647)

(assert (=> b!811788 (= res!554517 (or (= lt!363872 (MissingZero!8647 i!1163)) (= lt!363872 (MissingVacant!8647 i!1163))))))

(assert (=> b!811788 (= lt!363872 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811789 () Bool)

(declare-fun res!554516 () Bool)

(assert (=> b!811789 (=> (not res!554516) (not e!449387))))

(declare-fun arrayContainsKey!0 (array!44068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811789 (= res!554516 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811790 () Bool)

(declare-fun e!449389 () Bool)

(declare-fun e!449391 () Bool)

(assert (=> b!811790 (= e!449389 e!449391)))

(declare-fun res!554518 () Bool)

(assert (=> b!811790 (=> (not res!554518) (not e!449391))))

(declare-fun lt!363878 () SeekEntryResult!8647)

(declare-fun lt!363881 () SeekEntryResult!8647)

(assert (=> b!811790 (= res!554518 (and (= lt!363878 lt!363881) (not (= (select (arr!21100 a!3170) index!1236) (select (arr!21100 a!3170) j!153)))))))

(assert (=> b!811790 (= lt!363881 (Found!8647 j!153))))

(declare-fun b!811791 () Bool)

(assert (=> b!811791 (= e!449388 e!449389)))

(declare-fun res!554512 () Bool)

(assert (=> b!811791 (=> (not res!554512) (not e!449389))))

(declare-fun lt!363874 () SeekEntryResult!8647)

(assert (=> b!811791 (= res!554512 (= lt!363874 lt!363878))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!811791 (= lt!363878 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811791 (= lt!363874 (seekEntryOrOpen!0 (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811792 () Bool)

(declare-fun res!554514 () Bool)

(assert (=> b!811792 (=> (not res!554514) (not e!449392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44068 (_ BitVec 32)) Bool)

(assert (=> b!811792 (= res!554514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!554521 () Bool)

(assert (=> start!69740 (=> (not res!554521) (not e!449387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69740 (= res!554521 (validMask!0 mask!3266))))

(assert (=> start!69740 e!449387))

(assert (=> start!69740 true))

(declare-fun array_inv!16959 (array!44068) Bool)

(assert (=> start!69740 (array_inv!16959 a!3170)))

(declare-fun b!811784 () Bool)

(declare-fun res!554519 () Bool)

(assert (=> b!811784 (=> (not res!554519) (not e!449387))))

(assert (=> b!811784 (= res!554519 (validKeyInArray!0 k0!2044))))

(declare-fun b!811793 () Bool)

(assert (=> b!811793 (= e!449391 (not (= lt!363875 lt!363881)))))

(declare-fun lt!363877 () (_ BitVec 32))

(assert (=> b!811793 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363877 vacantAfter!23 lt!363876 lt!363873 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363877 vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27639 0))(
  ( (Unit!27640) )
))
(declare-fun lt!363879 () Unit!27639)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27639)

(assert (=> b!811793 (= lt!363879 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363877 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811793 (= lt!363877 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!811794 () Bool)

(declare-fun res!554513 () Bool)

(assert (=> b!811794 (=> (not res!554513) (not e!449392))))

(assert (=> b!811794 (= res!554513 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21520 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21100 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21520 a!3170)) (= (select (arr!21100 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69740 res!554521) b!811785))

(assert (= (and b!811785 res!554515) b!811787))

(assert (= (and b!811787 res!554523) b!811784))

(assert (= (and b!811784 res!554519) b!811789))

(assert (= (and b!811789 res!554516) b!811788))

(assert (= (and b!811788 res!554517) b!811792))

(assert (= (and b!811792 res!554514) b!811783))

(assert (= (and b!811783 res!554522) b!811794))

(assert (= (and b!811794 res!554513) b!811786))

(assert (= (and b!811786 res!554520) b!811791))

(assert (= (and b!811791 res!554512) b!811790))

(assert (= (and b!811790 res!554518) b!811793))

(declare-fun m!754465 () Bool)

(assert (=> b!811791 m!754465))

(assert (=> b!811791 m!754465))

(declare-fun m!754467 () Bool)

(assert (=> b!811791 m!754467))

(assert (=> b!811791 m!754465))

(declare-fun m!754469 () Bool)

(assert (=> b!811791 m!754469))

(declare-fun m!754471 () Bool)

(assert (=> b!811790 m!754471))

(assert (=> b!811790 m!754465))

(declare-fun m!754473 () Bool)

(assert (=> b!811792 m!754473))

(declare-fun m!754475 () Bool)

(assert (=> b!811794 m!754475))

(declare-fun m!754477 () Bool)

(assert (=> b!811794 m!754477))

(assert (=> b!811787 m!754465))

(assert (=> b!811787 m!754465))

(declare-fun m!754479 () Bool)

(assert (=> b!811787 m!754479))

(declare-fun m!754481 () Bool)

(assert (=> b!811784 m!754481))

(declare-fun m!754483 () Bool)

(assert (=> start!69740 m!754483))

(declare-fun m!754485 () Bool)

(assert (=> start!69740 m!754485))

(assert (=> b!811793 m!754465))

(declare-fun m!754487 () Bool)

(assert (=> b!811793 m!754487))

(assert (=> b!811793 m!754465))

(declare-fun m!754489 () Bool)

(assert (=> b!811793 m!754489))

(declare-fun m!754491 () Bool)

(assert (=> b!811793 m!754491))

(declare-fun m!754493 () Bool)

(assert (=> b!811793 m!754493))

(declare-fun m!754495 () Bool)

(assert (=> b!811786 m!754495))

(declare-fun m!754497 () Bool)

(assert (=> b!811786 m!754497))

(declare-fun m!754499 () Bool)

(assert (=> b!811786 m!754499))

(declare-fun m!754501 () Bool)

(assert (=> b!811786 m!754501))

(declare-fun m!754503 () Bool)

(assert (=> b!811789 m!754503))

(declare-fun m!754505 () Bool)

(assert (=> b!811783 m!754505))

(declare-fun m!754507 () Bool)

(assert (=> b!811788 m!754507))

(check-sat (not b!811787) (not b!811791) (not b!811784) (not b!811793) (not b!811789) (not start!69740) (not b!811792) (not b!811783) (not b!811786) (not b!811788))
(check-sat)
(get-model)

(declare-fun d!104423 () Bool)

(assert (=> d!104423 (= (validKeyInArray!0 (select (arr!21100 a!3170) j!153)) (and (not (= (select (arr!21100 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21100 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!811787 d!104423))

(declare-fun b!811875 () Bool)

(declare-fun e!449435 () Bool)

(declare-fun e!449437 () Bool)

(assert (=> b!811875 (= e!449435 e!449437)))

(declare-fun lt!363949 () (_ BitVec 64))

(assert (=> b!811875 (= lt!363949 (select (arr!21100 a!3170) #b00000000000000000000000000000000))))

(declare-fun lt!363950 () Unit!27639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44068 (_ BitVec 64) (_ BitVec 32)) Unit!27639)

(assert (=> b!811875 (= lt!363950 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363949 #b00000000000000000000000000000000))))

(assert (=> b!811875 (arrayContainsKey!0 a!3170 lt!363949 #b00000000000000000000000000000000)))

(declare-fun lt!363948 () Unit!27639)

(assert (=> b!811875 (= lt!363948 lt!363950)))

(declare-fun res!554601 () Bool)

(assert (=> b!811875 (= res!554601 (= (seekEntryOrOpen!0 (select (arr!21100 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8647 #b00000000000000000000000000000000)))))

(assert (=> b!811875 (=> (not res!554601) (not e!449437))))

(declare-fun b!811876 () Bool)

(declare-fun e!449436 () Bool)

(assert (=> b!811876 (= e!449436 e!449435)))

(declare-fun c!89051 () Bool)

(assert (=> b!811876 (= c!89051 (validKeyInArray!0 (select (arr!21100 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811877 () Bool)

(declare-fun call!35502 () Bool)

(assert (=> b!811877 (= e!449437 call!35502)))

(declare-fun b!811878 () Bool)

(assert (=> b!811878 (= e!449435 call!35502)))

(declare-fun d!104425 () Bool)

(declare-fun res!554600 () Bool)

(assert (=> d!104425 (=> res!554600 e!449436)))

(assert (=> d!104425 (= res!554600 (bvsge #b00000000000000000000000000000000 (size!21520 a!3170)))))

(assert (=> d!104425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!449436)))

(declare-fun bm!35499 () Bool)

(assert (=> bm!35499 (= call!35502 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(assert (= (and d!104425 (not res!554600)) b!811876))

(assert (= (and b!811876 c!89051) b!811875))

(assert (= (and b!811876 (not c!89051)) b!811878))

(assert (= (and b!811875 res!554601) b!811877))

(assert (= (or b!811877 b!811878) bm!35499))

(declare-fun m!754597 () Bool)

(assert (=> b!811875 m!754597))

(declare-fun m!754599 () Bool)

(assert (=> b!811875 m!754599))

(declare-fun m!754601 () Bool)

(assert (=> b!811875 m!754601))

(assert (=> b!811875 m!754597))

(declare-fun m!754603 () Bool)

(assert (=> b!811875 m!754603))

(assert (=> b!811876 m!754597))

(assert (=> b!811876 m!754597))

(declare-fun m!754605 () Bool)

(assert (=> b!811876 m!754605))

(declare-fun m!754607 () Bool)

(assert (=> bm!35499 m!754607))

(assert (=> b!811792 d!104425))

(declare-fun b!811891 () Bool)

(declare-fun e!449444 () SeekEntryResult!8647)

(assert (=> b!811891 (= e!449444 (Found!8647 index!1236))))

(declare-fun b!811892 () Bool)

(declare-fun c!89058 () Bool)

(declare-fun lt!363956 () (_ BitVec 64))

(assert (=> b!811892 (= c!89058 (= lt!363956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449446 () SeekEntryResult!8647)

(assert (=> b!811892 (= e!449444 e!449446)))

(declare-fun d!104427 () Bool)

(declare-fun lt!363955 () SeekEntryResult!8647)

(get-info :version)

(assert (=> d!104427 (and (or ((_ is Undefined!8647) lt!363955) (not ((_ is Found!8647) lt!363955)) (and (bvsge (index!36957 lt!363955) #b00000000000000000000000000000000) (bvslt (index!36957 lt!363955) (size!21520 lt!363873)))) (or ((_ is Undefined!8647) lt!363955) ((_ is Found!8647) lt!363955) (not ((_ is MissingVacant!8647) lt!363955)) (not (= (index!36959 lt!363955) vacantAfter!23)) (and (bvsge (index!36959 lt!363955) #b00000000000000000000000000000000) (bvslt (index!36959 lt!363955) (size!21520 lt!363873)))) (or ((_ is Undefined!8647) lt!363955) (ite ((_ is Found!8647) lt!363955) (= (select (arr!21100 lt!363873) (index!36957 lt!363955)) lt!363876) (and ((_ is MissingVacant!8647) lt!363955) (= (index!36959 lt!363955) vacantAfter!23) (= (select (arr!21100 lt!363873) (index!36959 lt!363955)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!449445 () SeekEntryResult!8647)

(assert (=> d!104427 (= lt!363955 e!449445)))

(declare-fun c!89059 () Bool)

(assert (=> d!104427 (= c!89059 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104427 (= lt!363956 (select (arr!21100 lt!363873) index!1236))))

(assert (=> d!104427 (validMask!0 mask!3266)))

(assert (=> d!104427 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363876 lt!363873 mask!3266) lt!363955)))

(declare-fun b!811893 () Bool)

(assert (=> b!811893 (= e!449446 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!363876 lt!363873 mask!3266))))

(declare-fun b!811894 () Bool)

(assert (=> b!811894 (= e!449445 e!449444)))

(declare-fun c!89060 () Bool)

(assert (=> b!811894 (= c!89060 (= lt!363956 lt!363876))))

(declare-fun b!811895 () Bool)

(assert (=> b!811895 (= e!449445 Undefined!8647)))

(declare-fun b!811896 () Bool)

(assert (=> b!811896 (= e!449446 (MissingVacant!8647 vacantAfter!23))))

(assert (= (and d!104427 c!89059) b!811895))

(assert (= (and d!104427 (not c!89059)) b!811894))

(assert (= (and b!811894 c!89060) b!811891))

(assert (= (and b!811894 (not c!89060)) b!811892))

(assert (= (and b!811892 c!89058) b!811896))

(assert (= (and b!811892 (not c!89058)) b!811893))

(declare-fun m!754609 () Bool)

(assert (=> d!104427 m!754609))

(declare-fun m!754611 () Bool)

(assert (=> d!104427 m!754611))

(declare-fun m!754613 () Bool)

(assert (=> d!104427 m!754613))

(assert (=> d!104427 m!754483))

(declare-fun m!754615 () Bool)

(assert (=> b!811893 m!754615))

(assert (=> b!811893 m!754615))

(declare-fun m!754617 () Bool)

(assert (=> b!811893 m!754617))

(assert (=> b!811786 d!104427))

(declare-fun d!104429 () Bool)

(declare-fun lt!363968 () SeekEntryResult!8647)

(assert (=> d!104429 (and (or ((_ is Undefined!8647) lt!363968) (not ((_ is Found!8647) lt!363968)) (and (bvsge (index!36957 lt!363968) #b00000000000000000000000000000000) (bvslt (index!36957 lt!363968) (size!21520 lt!363873)))) (or ((_ is Undefined!8647) lt!363968) ((_ is Found!8647) lt!363968) (not ((_ is MissingZero!8647) lt!363968)) (and (bvsge (index!36956 lt!363968) #b00000000000000000000000000000000) (bvslt (index!36956 lt!363968) (size!21520 lt!363873)))) (or ((_ is Undefined!8647) lt!363968) ((_ is Found!8647) lt!363968) ((_ is MissingZero!8647) lt!363968) (not ((_ is MissingVacant!8647) lt!363968)) (and (bvsge (index!36959 lt!363968) #b00000000000000000000000000000000) (bvslt (index!36959 lt!363968) (size!21520 lt!363873)))) (or ((_ is Undefined!8647) lt!363968) (ite ((_ is Found!8647) lt!363968) (= (select (arr!21100 lt!363873) (index!36957 lt!363968)) lt!363876) (ite ((_ is MissingZero!8647) lt!363968) (= (select (arr!21100 lt!363873) (index!36956 lt!363968)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8647) lt!363968) (= (select (arr!21100 lt!363873) (index!36959 lt!363968)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!449461 () SeekEntryResult!8647)

(assert (=> d!104429 (= lt!363968 e!449461)))

(declare-fun c!89075 () Bool)

(declare-fun lt!363969 () SeekEntryResult!8647)

(assert (=> d!104429 (= c!89075 (and ((_ is Intermediate!8647) lt!363969) (undefined!9459 lt!363969)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44068 (_ BitVec 32)) SeekEntryResult!8647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104429 (= lt!363969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!363876 mask!3266) lt!363876 lt!363873 mask!3266))))

(assert (=> d!104429 (validMask!0 mask!3266)))

(assert (=> d!104429 (= (seekEntryOrOpen!0 lt!363876 lt!363873 mask!3266) lt!363968)))

(declare-fun b!811921 () Bool)

(assert (=> b!811921 (= e!449461 Undefined!8647)))

(declare-fun b!811922 () Bool)

(declare-fun e!449460 () SeekEntryResult!8647)

(assert (=> b!811922 (= e!449460 (Found!8647 (index!36958 lt!363969)))))

(declare-fun b!811923 () Bool)

(declare-fun c!89073 () Bool)

(declare-fun lt!363967 () (_ BitVec 64))

(assert (=> b!811923 (= c!89073 (= lt!363967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449459 () SeekEntryResult!8647)

(assert (=> b!811923 (= e!449460 e!449459)))

(declare-fun b!811924 () Bool)

(assert (=> b!811924 (= e!449459 (MissingZero!8647 (index!36958 lt!363969)))))

(declare-fun b!811925 () Bool)

(assert (=> b!811925 (= e!449459 (seekKeyOrZeroReturnVacant!0 (x!67929 lt!363969) (index!36958 lt!363969) (index!36958 lt!363969) lt!363876 lt!363873 mask!3266))))

(declare-fun b!811926 () Bool)

(assert (=> b!811926 (= e!449461 e!449460)))

(assert (=> b!811926 (= lt!363967 (select (arr!21100 lt!363873) (index!36958 lt!363969)))))

(declare-fun c!89074 () Bool)

(assert (=> b!811926 (= c!89074 (= lt!363967 lt!363876))))

(assert (= (and d!104429 c!89075) b!811921))

(assert (= (and d!104429 (not c!89075)) b!811926))

(assert (= (and b!811926 c!89074) b!811922))

(assert (= (and b!811926 (not c!89074)) b!811923))

(assert (= (and b!811923 c!89073) b!811924))

(assert (= (and b!811923 (not c!89073)) b!811925))

(declare-fun m!754619 () Bool)

(assert (=> d!104429 m!754619))

(declare-fun m!754621 () Bool)

(assert (=> d!104429 m!754621))

(declare-fun m!754623 () Bool)

(assert (=> d!104429 m!754623))

(assert (=> d!104429 m!754619))

(declare-fun m!754625 () Bool)

(assert (=> d!104429 m!754625))

(assert (=> d!104429 m!754483))

(declare-fun m!754627 () Bool)

(assert (=> d!104429 m!754627))

(declare-fun m!754629 () Bool)

(assert (=> b!811925 m!754629))

(declare-fun m!754631 () Bool)

(assert (=> b!811926 m!754631))

(assert (=> b!811786 d!104429))

(declare-fun d!104439 () Bool)

(assert (=> d!104439 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69740 d!104439))

(declare-fun d!104443 () Bool)

(assert (=> d!104443 (= (array_inv!16959 a!3170) (bvsge (size!21520 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69740 d!104443))

(declare-fun b!811933 () Bool)

(declare-fun e!449465 () SeekEntryResult!8647)

(assert (=> b!811933 (= e!449465 (Found!8647 index!1236))))

(declare-fun b!811934 () Bool)

(declare-fun c!89079 () Bool)

(declare-fun lt!363973 () (_ BitVec 64))

(assert (=> b!811934 (= c!89079 (= lt!363973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449467 () SeekEntryResult!8647)

(assert (=> b!811934 (= e!449465 e!449467)))

(declare-fun lt!363972 () SeekEntryResult!8647)

(declare-fun d!104445 () Bool)

(assert (=> d!104445 (and (or ((_ is Undefined!8647) lt!363972) (not ((_ is Found!8647) lt!363972)) (and (bvsge (index!36957 lt!363972) #b00000000000000000000000000000000) (bvslt (index!36957 lt!363972) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!363972) ((_ is Found!8647) lt!363972) (not ((_ is MissingVacant!8647) lt!363972)) (not (= (index!36959 lt!363972) vacantBefore!23)) (and (bvsge (index!36959 lt!363972) #b00000000000000000000000000000000) (bvslt (index!36959 lt!363972) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!363972) (ite ((_ is Found!8647) lt!363972) (= (select (arr!21100 a!3170) (index!36957 lt!363972)) (select (arr!21100 a!3170) j!153)) (and ((_ is MissingVacant!8647) lt!363972) (= (index!36959 lt!363972) vacantBefore!23) (= (select (arr!21100 a!3170) (index!36959 lt!363972)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!449466 () SeekEntryResult!8647)

(assert (=> d!104445 (= lt!363972 e!449466)))

(declare-fun c!89080 () Bool)

(assert (=> d!104445 (= c!89080 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104445 (= lt!363973 (select (arr!21100 a!3170) index!1236))))

(assert (=> d!104445 (validMask!0 mask!3266)))

(assert (=> d!104445 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266) lt!363972)))

(declare-fun b!811935 () Bool)

(assert (=> b!811935 (= e!449467 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811936 () Bool)

(assert (=> b!811936 (= e!449466 e!449465)))

(declare-fun c!89081 () Bool)

(assert (=> b!811936 (= c!89081 (= lt!363973 (select (arr!21100 a!3170) j!153)))))

(declare-fun b!811937 () Bool)

(assert (=> b!811937 (= e!449466 Undefined!8647)))

(declare-fun b!811938 () Bool)

(assert (=> b!811938 (= e!449467 (MissingVacant!8647 vacantBefore!23))))

(assert (= (and d!104445 c!89080) b!811937))

(assert (= (and d!104445 (not c!89080)) b!811936))

(assert (= (and b!811936 c!89081) b!811933))

(assert (= (and b!811936 (not c!89081)) b!811934))

(assert (= (and b!811934 c!89079) b!811938))

(assert (= (and b!811934 (not c!89079)) b!811935))

(declare-fun m!754643 () Bool)

(assert (=> d!104445 m!754643))

(declare-fun m!754645 () Bool)

(assert (=> d!104445 m!754645))

(assert (=> d!104445 m!754471))

(assert (=> d!104445 m!754483))

(assert (=> b!811935 m!754615))

(assert (=> b!811935 m!754615))

(assert (=> b!811935 m!754465))

(declare-fun m!754647 () Bool)

(assert (=> b!811935 m!754647))

(assert (=> b!811791 d!104445))

(declare-fun d!104447 () Bool)

(declare-fun lt!363975 () SeekEntryResult!8647)

(assert (=> d!104447 (and (or ((_ is Undefined!8647) lt!363975) (not ((_ is Found!8647) lt!363975)) (and (bvsge (index!36957 lt!363975) #b00000000000000000000000000000000) (bvslt (index!36957 lt!363975) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!363975) ((_ is Found!8647) lt!363975) (not ((_ is MissingZero!8647) lt!363975)) (and (bvsge (index!36956 lt!363975) #b00000000000000000000000000000000) (bvslt (index!36956 lt!363975) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!363975) ((_ is Found!8647) lt!363975) ((_ is MissingZero!8647) lt!363975) (not ((_ is MissingVacant!8647) lt!363975)) (and (bvsge (index!36959 lt!363975) #b00000000000000000000000000000000) (bvslt (index!36959 lt!363975) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!363975) (ite ((_ is Found!8647) lt!363975) (= (select (arr!21100 a!3170) (index!36957 lt!363975)) (select (arr!21100 a!3170) j!153)) (ite ((_ is MissingZero!8647) lt!363975) (= (select (arr!21100 a!3170) (index!36956 lt!363975)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8647) lt!363975) (= (select (arr!21100 a!3170) (index!36959 lt!363975)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!449470 () SeekEntryResult!8647)

(assert (=> d!104447 (= lt!363975 e!449470)))

(declare-fun c!89084 () Bool)

(declare-fun lt!363976 () SeekEntryResult!8647)

(assert (=> d!104447 (= c!89084 (and ((_ is Intermediate!8647) lt!363976) (undefined!9459 lt!363976)))))

(assert (=> d!104447 (= lt!363976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21100 a!3170) j!153) mask!3266) (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104447 (validMask!0 mask!3266)))

(assert (=> d!104447 (= (seekEntryOrOpen!0 (select (arr!21100 a!3170) j!153) a!3170 mask!3266) lt!363975)))

(declare-fun b!811939 () Bool)

(assert (=> b!811939 (= e!449470 Undefined!8647)))

(declare-fun b!811940 () Bool)

(declare-fun e!449469 () SeekEntryResult!8647)

(assert (=> b!811940 (= e!449469 (Found!8647 (index!36958 lt!363976)))))

(declare-fun b!811941 () Bool)

(declare-fun c!89082 () Bool)

(declare-fun lt!363974 () (_ BitVec 64))

(assert (=> b!811941 (= c!89082 (= lt!363974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449468 () SeekEntryResult!8647)

(assert (=> b!811941 (= e!449469 e!449468)))

(declare-fun b!811942 () Bool)

(assert (=> b!811942 (= e!449468 (MissingZero!8647 (index!36958 lt!363976)))))

(declare-fun b!811943 () Bool)

(assert (=> b!811943 (= e!449468 (seekKeyOrZeroReturnVacant!0 (x!67929 lt!363976) (index!36958 lt!363976) (index!36958 lt!363976) (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811944 () Bool)

(assert (=> b!811944 (= e!449470 e!449469)))

(assert (=> b!811944 (= lt!363974 (select (arr!21100 a!3170) (index!36958 lt!363976)))))

(declare-fun c!89083 () Bool)

(assert (=> b!811944 (= c!89083 (= lt!363974 (select (arr!21100 a!3170) j!153)))))

(assert (= (and d!104447 c!89084) b!811939))

(assert (= (and d!104447 (not c!89084)) b!811944))

(assert (= (and b!811944 c!89083) b!811940))

(assert (= (and b!811944 (not c!89083)) b!811941))

(assert (= (and b!811941 c!89082) b!811942))

(assert (= (and b!811941 (not c!89082)) b!811943))

(declare-fun m!754649 () Bool)

(assert (=> d!104447 m!754649))

(assert (=> d!104447 m!754465))

(declare-fun m!754651 () Bool)

(assert (=> d!104447 m!754651))

(declare-fun m!754653 () Bool)

(assert (=> d!104447 m!754653))

(assert (=> d!104447 m!754465))

(assert (=> d!104447 m!754649))

(declare-fun m!754655 () Bool)

(assert (=> d!104447 m!754655))

(assert (=> d!104447 m!754483))

(declare-fun m!754657 () Bool)

(assert (=> d!104447 m!754657))

(assert (=> b!811943 m!754465))

(declare-fun m!754659 () Bool)

(assert (=> b!811943 m!754659))

(declare-fun m!754661 () Bool)

(assert (=> b!811944 m!754661))

(assert (=> b!811791 d!104447))

(declare-fun d!104449 () Bool)

(assert (=> d!104449 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!811784 d!104449))

(declare-fun d!104451 () Bool)

(declare-fun res!554606 () Bool)

(declare-fun e!449481 () Bool)

(assert (=> d!104451 (=> res!554606 e!449481)))

(assert (=> d!104451 (= res!554606 (= (select (arr!21100 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!104451 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!449481)))

(declare-fun b!811961 () Bool)

(declare-fun e!449482 () Bool)

(assert (=> b!811961 (= e!449481 e!449482)))

(declare-fun res!554607 () Bool)

(assert (=> b!811961 (=> (not res!554607) (not e!449482))))

(assert (=> b!811961 (= res!554607 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21520 a!3170)))))

(declare-fun b!811962 () Bool)

(assert (=> b!811962 (= e!449482 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104451 (not res!554606)) b!811961))

(assert (= (and b!811961 res!554607) b!811962))

(assert (=> d!104451 m!754597))

(declare-fun m!754663 () Bool)

(assert (=> b!811962 m!754663))

(assert (=> b!811789 d!104451))

(declare-fun b!811991 () Bool)

(declare-fun e!449500 () Bool)

(declare-fun contains!4114 (List!14970 (_ BitVec 64)) Bool)

(assert (=> b!811991 (= e!449500 (contains!4114 Nil!14967 (select (arr!21100 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811992 () Bool)

(declare-fun e!449502 () Bool)

(declare-fun call!35505 () Bool)

(assert (=> b!811992 (= e!449502 call!35505)))

(declare-fun b!811993 () Bool)

(declare-fun e!449501 () Bool)

(assert (=> b!811993 (= e!449501 e!449502)))

(declare-fun c!89102 () Bool)

(assert (=> b!811993 (= c!89102 (validKeyInArray!0 (select (arr!21100 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35502 () Bool)

(assert (=> bm!35502 (= call!35505 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89102 (Cons!14966 (select (arr!21100 a!3170) #b00000000000000000000000000000000) Nil!14967) Nil!14967)))))

(declare-fun b!811994 () Bool)

(declare-fun e!449503 () Bool)

(assert (=> b!811994 (= e!449503 e!449501)))

(declare-fun res!554616 () Bool)

(assert (=> b!811994 (=> (not res!554616) (not e!449501))))

(assert (=> b!811994 (= res!554616 (not e!449500))))

(declare-fun res!554615 () Bool)

(assert (=> b!811994 (=> (not res!554615) (not e!449500))))

(assert (=> b!811994 (= res!554615 (validKeyInArray!0 (select (arr!21100 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!104453 () Bool)

(declare-fun res!554614 () Bool)

(assert (=> d!104453 (=> res!554614 e!449503)))

(assert (=> d!104453 (= res!554614 (bvsge #b00000000000000000000000000000000 (size!21520 a!3170)))))

(assert (=> d!104453 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14967) e!449503)))

(declare-fun b!811995 () Bool)

(assert (=> b!811995 (= e!449502 call!35505)))

(assert (= (and d!104453 (not res!554614)) b!811994))

(assert (= (and b!811994 res!554615) b!811991))

(assert (= (and b!811994 res!554616) b!811993))

(assert (= (and b!811993 c!89102) b!811992))

(assert (= (and b!811993 (not c!89102)) b!811995))

(assert (= (or b!811992 b!811995) bm!35502))

(assert (=> b!811991 m!754597))

(assert (=> b!811991 m!754597))

(declare-fun m!754679 () Bool)

(assert (=> b!811991 m!754679))

(assert (=> b!811993 m!754597))

(assert (=> b!811993 m!754597))

(assert (=> b!811993 m!754605))

(assert (=> bm!35502 m!754597))

(declare-fun m!754681 () Bool)

(assert (=> bm!35502 m!754681))

(assert (=> b!811994 m!754597))

(assert (=> b!811994 m!754597))

(assert (=> b!811994 m!754605))

(assert (=> b!811783 d!104453))

(declare-fun d!104457 () Bool)

(declare-fun lt!363993 () SeekEntryResult!8647)

(assert (=> d!104457 (and (or ((_ is Undefined!8647) lt!363993) (not ((_ is Found!8647) lt!363993)) (and (bvsge (index!36957 lt!363993) #b00000000000000000000000000000000) (bvslt (index!36957 lt!363993) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!363993) ((_ is Found!8647) lt!363993) (not ((_ is MissingZero!8647) lt!363993)) (and (bvsge (index!36956 lt!363993) #b00000000000000000000000000000000) (bvslt (index!36956 lt!363993) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!363993) ((_ is Found!8647) lt!363993) ((_ is MissingZero!8647) lt!363993) (not ((_ is MissingVacant!8647) lt!363993)) (and (bvsge (index!36959 lt!363993) #b00000000000000000000000000000000) (bvslt (index!36959 lt!363993) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!363993) (ite ((_ is Found!8647) lt!363993) (= (select (arr!21100 a!3170) (index!36957 lt!363993)) k0!2044) (ite ((_ is MissingZero!8647) lt!363993) (= (select (arr!21100 a!3170) (index!36956 lt!363993)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8647) lt!363993) (= (select (arr!21100 a!3170) (index!36959 lt!363993)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!449506 () SeekEntryResult!8647)

(assert (=> d!104457 (= lt!363993 e!449506)))

(declare-fun c!89105 () Bool)

(declare-fun lt!363994 () SeekEntryResult!8647)

(assert (=> d!104457 (= c!89105 (and ((_ is Intermediate!8647) lt!363994) (undefined!9459 lt!363994)))))

(assert (=> d!104457 (= lt!363994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!104457 (validMask!0 mask!3266)))

(assert (=> d!104457 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!363993)))

(declare-fun b!811996 () Bool)

(assert (=> b!811996 (= e!449506 Undefined!8647)))

(declare-fun b!811997 () Bool)

(declare-fun e!449505 () SeekEntryResult!8647)

(assert (=> b!811997 (= e!449505 (Found!8647 (index!36958 lt!363994)))))

(declare-fun b!811998 () Bool)

(declare-fun c!89103 () Bool)

(declare-fun lt!363992 () (_ BitVec 64))

(assert (=> b!811998 (= c!89103 (= lt!363992 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449504 () SeekEntryResult!8647)

(assert (=> b!811998 (= e!449505 e!449504)))

(declare-fun b!811999 () Bool)

(assert (=> b!811999 (= e!449504 (MissingZero!8647 (index!36958 lt!363994)))))

(declare-fun b!812000 () Bool)

(assert (=> b!812000 (= e!449504 (seekKeyOrZeroReturnVacant!0 (x!67929 lt!363994) (index!36958 lt!363994) (index!36958 lt!363994) k0!2044 a!3170 mask!3266))))

(declare-fun b!812001 () Bool)

(assert (=> b!812001 (= e!449506 e!449505)))

(assert (=> b!812001 (= lt!363992 (select (arr!21100 a!3170) (index!36958 lt!363994)))))

(declare-fun c!89104 () Bool)

(assert (=> b!812001 (= c!89104 (= lt!363992 k0!2044))))

(assert (= (and d!104457 c!89105) b!811996))

(assert (= (and d!104457 (not c!89105)) b!812001))

(assert (= (and b!812001 c!89104) b!811997))

(assert (= (and b!812001 (not c!89104)) b!811998))

(assert (= (and b!811998 c!89103) b!811999))

(assert (= (and b!811998 (not c!89103)) b!812000))

(declare-fun m!754683 () Bool)

(assert (=> d!104457 m!754683))

(declare-fun m!754685 () Bool)

(assert (=> d!104457 m!754685))

(declare-fun m!754687 () Bool)

(assert (=> d!104457 m!754687))

(assert (=> d!104457 m!754683))

(declare-fun m!754689 () Bool)

(assert (=> d!104457 m!754689))

(assert (=> d!104457 m!754483))

(declare-fun m!754691 () Bool)

(assert (=> d!104457 m!754691))

(declare-fun m!754693 () Bool)

(assert (=> b!812000 m!754693))

(declare-fun m!754695 () Bool)

(assert (=> b!812001 m!754695))

(assert (=> b!811788 d!104457))

(declare-fun b!812008 () Bool)

(declare-fun e!449510 () SeekEntryResult!8647)

(assert (=> b!812008 (= e!449510 (Found!8647 lt!363877))))

(declare-fun b!812009 () Bool)

(declare-fun c!89109 () Bool)

(declare-fun lt!363999 () (_ BitVec 64))

(assert (=> b!812009 (= c!89109 (= lt!363999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449512 () SeekEntryResult!8647)

(assert (=> b!812009 (= e!449510 e!449512)))

(declare-fun d!104459 () Bool)

(declare-fun lt!363998 () SeekEntryResult!8647)

(assert (=> d!104459 (and (or ((_ is Undefined!8647) lt!363998) (not ((_ is Found!8647) lt!363998)) (and (bvsge (index!36957 lt!363998) #b00000000000000000000000000000000) (bvslt (index!36957 lt!363998) (size!21520 lt!363873)))) (or ((_ is Undefined!8647) lt!363998) ((_ is Found!8647) lt!363998) (not ((_ is MissingVacant!8647) lt!363998)) (not (= (index!36959 lt!363998) vacantAfter!23)) (and (bvsge (index!36959 lt!363998) #b00000000000000000000000000000000) (bvslt (index!36959 lt!363998) (size!21520 lt!363873)))) (or ((_ is Undefined!8647) lt!363998) (ite ((_ is Found!8647) lt!363998) (= (select (arr!21100 lt!363873) (index!36957 lt!363998)) lt!363876) (and ((_ is MissingVacant!8647) lt!363998) (= (index!36959 lt!363998) vacantAfter!23) (= (select (arr!21100 lt!363873) (index!36959 lt!363998)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!449511 () SeekEntryResult!8647)

(assert (=> d!104459 (= lt!363998 e!449511)))

(declare-fun c!89110 () Bool)

(assert (=> d!104459 (= c!89110 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104459 (= lt!363999 (select (arr!21100 lt!363873) lt!363877))))

(assert (=> d!104459 (validMask!0 mask!3266)))

(assert (=> d!104459 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363877 vacantAfter!23 lt!363876 lt!363873 mask!3266) lt!363998)))

(declare-fun b!812010 () Bool)

(assert (=> b!812010 (= e!449512 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363877 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!363876 lt!363873 mask!3266))))

(declare-fun b!812011 () Bool)

(assert (=> b!812011 (= e!449511 e!449510)))

(declare-fun c!89111 () Bool)

(assert (=> b!812011 (= c!89111 (= lt!363999 lt!363876))))

(declare-fun b!812012 () Bool)

(assert (=> b!812012 (= e!449511 Undefined!8647)))

(declare-fun b!812013 () Bool)

(assert (=> b!812013 (= e!449512 (MissingVacant!8647 vacantAfter!23))))

(assert (= (and d!104459 c!89110) b!812012))

(assert (= (and d!104459 (not c!89110)) b!812011))

(assert (= (and b!812011 c!89111) b!812008))

(assert (= (and b!812011 (not c!89111)) b!812009))

(assert (= (and b!812009 c!89109) b!812013))

(assert (= (and b!812009 (not c!89109)) b!812010))

(declare-fun m!754697 () Bool)

(assert (=> d!104459 m!754697))

(declare-fun m!754701 () Bool)

(assert (=> d!104459 m!754701))

(declare-fun m!754703 () Bool)

(assert (=> d!104459 m!754703))

(assert (=> d!104459 m!754483))

(declare-fun m!754709 () Bool)

(assert (=> b!812010 m!754709))

(assert (=> b!812010 m!754709))

(declare-fun m!754715 () Bool)

(assert (=> b!812010 m!754715))

(assert (=> b!811793 d!104459))

(declare-fun b!812014 () Bool)

(declare-fun e!449513 () SeekEntryResult!8647)

(assert (=> b!812014 (= e!449513 (Found!8647 lt!363877))))

(declare-fun b!812015 () Bool)

(declare-fun c!89112 () Bool)

(declare-fun lt!364001 () (_ BitVec 64))

(assert (=> b!812015 (= c!89112 (= lt!364001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449515 () SeekEntryResult!8647)

(assert (=> b!812015 (= e!449513 e!449515)))

(declare-fun d!104461 () Bool)

(declare-fun lt!364000 () SeekEntryResult!8647)

(assert (=> d!104461 (and (or ((_ is Undefined!8647) lt!364000) (not ((_ is Found!8647) lt!364000)) (and (bvsge (index!36957 lt!364000) #b00000000000000000000000000000000) (bvslt (index!36957 lt!364000) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!364000) ((_ is Found!8647) lt!364000) (not ((_ is MissingVacant!8647) lt!364000)) (not (= (index!36959 lt!364000) vacantBefore!23)) (and (bvsge (index!36959 lt!364000) #b00000000000000000000000000000000) (bvslt (index!36959 lt!364000) (size!21520 a!3170)))) (or ((_ is Undefined!8647) lt!364000) (ite ((_ is Found!8647) lt!364000) (= (select (arr!21100 a!3170) (index!36957 lt!364000)) (select (arr!21100 a!3170) j!153)) (and ((_ is MissingVacant!8647) lt!364000) (= (index!36959 lt!364000) vacantBefore!23) (= (select (arr!21100 a!3170) (index!36959 lt!364000)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!449514 () SeekEntryResult!8647)

(assert (=> d!104461 (= lt!364000 e!449514)))

(declare-fun c!89113 () Bool)

(assert (=> d!104461 (= c!89113 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104461 (= lt!364001 (select (arr!21100 a!3170) lt!363877))))

(assert (=> d!104461 (validMask!0 mask!3266)))

(assert (=> d!104461 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363877 vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266) lt!364000)))

(declare-fun b!812016 () Bool)

(assert (=> b!812016 (= e!449515 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363877 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!812017 () Bool)

(assert (=> b!812017 (= e!449514 e!449513)))

(declare-fun c!89114 () Bool)

(assert (=> b!812017 (= c!89114 (= lt!364001 (select (arr!21100 a!3170) j!153)))))

(declare-fun b!812018 () Bool)

(assert (=> b!812018 (= e!449514 Undefined!8647)))

(declare-fun b!812019 () Bool)

(assert (=> b!812019 (= e!449515 (MissingVacant!8647 vacantBefore!23))))

(assert (= (and d!104461 c!89113) b!812018))

(assert (= (and d!104461 (not c!89113)) b!812017))

(assert (= (and b!812017 c!89114) b!812014))

(assert (= (and b!812017 (not c!89114)) b!812015))

(assert (= (and b!812015 c!89112) b!812019))

(assert (= (and b!812015 (not c!89112)) b!812016))

(declare-fun m!754721 () Bool)

(assert (=> d!104461 m!754721))

(declare-fun m!754723 () Bool)

(assert (=> d!104461 m!754723))

(declare-fun m!754725 () Bool)

(assert (=> d!104461 m!754725))

(assert (=> d!104461 m!754483))

(assert (=> b!812016 m!754709))

(assert (=> b!812016 m!754709))

(assert (=> b!812016 m!754465))

(declare-fun m!754727 () Bool)

(assert (=> b!812016 m!754727))

(assert (=> b!811793 d!104461))

(declare-fun d!104465 () Bool)

(declare-fun e!449548 () Bool)

(assert (=> d!104465 e!449548))

(declare-fun res!554625 () Bool)

(assert (=> d!104465 (=> (not res!554625) (not e!449548))))

(assert (=> d!104465 (= res!554625 (and (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21520 a!3170)) (and (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21520 a!3170)))) (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21520 a!3170)) (and (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21520 a!3170)))) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21520 a!3170))))))

(declare-fun lt!364029 () Unit!27639)

(declare-fun choose!112 (array!44068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27639)

(assert (=> d!104465 (= lt!364029 (choose!112 a!3170 i!1163 k0!2044 j!153 lt!363877 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(assert (=> d!104465 (validMask!0 mask!3266)))

(assert (=> d!104465 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363877 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266) lt!364029)))

(declare-fun b!812076 () Bool)

(assert (=> b!812076 (= e!449548 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363877 vacantAfter!23 (select (store (arr!21100 a!3170) i!1163 k0!2044) j!153) (array!44069 (store (arr!21100 a!3170) i!1163 k0!2044) (size!21520 a!3170)) mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363877 vacantBefore!23 (select (arr!21100 a!3170) j!153) a!3170 mask!3266)))))

(assert (= (and d!104465 res!554625) b!812076))

(declare-fun m!754793 () Bool)

(assert (=> d!104465 m!754793))

(assert (=> d!104465 m!754483))

(assert (=> b!812076 m!754465))

(assert (=> b!812076 m!754499))

(assert (=> b!812076 m!754501))

(declare-fun m!754795 () Bool)

(assert (=> b!812076 m!754795))

(assert (=> b!812076 m!754465))

(assert (=> b!812076 m!754489))

(assert (=> b!812076 m!754501))

(assert (=> b!811793 d!104465))

(declare-fun d!104481 () Bool)

(declare-fun lt!364032 () (_ BitVec 32))

(assert (=> d!104481 (and (bvsge lt!364032 #b00000000000000000000000000000000) (bvslt lt!364032 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104481 (= lt!364032 (choose!52 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (=> d!104481 (validMask!0 mask!3266)))

(assert (=> d!104481 (= (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) lt!364032)))

(declare-fun bs!22466 () Bool)

(assert (= bs!22466 d!104481))

(declare-fun m!754799 () Bool)

(assert (=> bs!22466 m!754799))

(assert (=> bs!22466 m!754483))

(assert (=> b!811793 d!104481))

(check-sat (not d!104465) (not b!811876) (not b!811993) (not b!811875) (not bm!35499) (not b!812000) (not b!811935) (not b!811943) (not b!812076) (not b!811994) (not d!104427) (not d!104481) (not d!104461) (not b!811925) (not d!104445) (not d!104447) (not b!811962) (not d!104457) (not d!104429) (not b!811893) (not bm!35502) (not d!104459) (not b!812016) (not b!812010) (not b!811991))
(check-sat)
