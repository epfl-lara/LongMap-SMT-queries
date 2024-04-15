; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136672 () Bool)

(assert start!136672)

(declare-fun res!1078306 () Bool)

(declare-fun e!880211 () Bool)

(assert (=> start!136672 (=> (not res!1078306) (not e!880211))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136672 (= res!1078306 (validMask!0 mask!918))))

(assert (=> start!136672 e!880211))

(assert (=> start!136672 true))

(declare-datatypes ((array!105674 0))(
  ( (array!105675 (arr!50948 (Array (_ BitVec 32) (_ BitVec 64))) (size!51500 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105674)

(declare-fun array_inv!39884 (array!105674) Bool)

(assert (=> start!136672 (array_inv!39884 _keys!614)))

(declare-fun b!1578128 () Bool)

(declare-fun res!1078308 () Bool)

(assert (=> b!1578128 (=> (not res!1078308) (not e!880211))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun x!466 () (_ BitVec 32))

(assert (=> b!1578128 (= res!1078308 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51500 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50948 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578131 () Bool)

(declare-fun k0!772 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13770 0))(
  ( (MissingZero!13770 (index!57478 (_ BitVec 32))) (Found!13770 (index!57479 (_ BitVec 32))) (Intermediate!13770 (undefined!14582 Bool) (index!57480 (_ BitVec 32)) (x!142739 (_ BitVec 32))) (Undefined!13770) (MissingVacant!13770 (index!57481 (_ BitVec 32))) )
))
(declare-fun lt!675978 () SeekEntryResult!13770)

(get-info :version)

(assert (=> b!1578131 (= e!880211 (and (not ((_ is Undefined!13770) lt!675978)) (ite ((_ is Found!13770) lt!675978) (not (= (select (arr!50948 _keys!614) (index!57479 lt!675978)) k0!772)) (or (not ((_ is MissingVacant!13770) lt!675978)) (not (= (index!57481 lt!675978) vacantSpotIndex!10)) (not (= (select (arr!50948 _keys!614) (index!57481 lt!675978)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105674 (_ BitVec 32)) SeekEntryResult!13770)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578131 (= lt!675978 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun b!1578130 () Bool)

(declare-fun res!1078305 () Bool)

(assert (=> b!1578130 (=> (not res!1078305) (not e!880211))))

(assert (=> b!1578130 (= res!1078305 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50948 _keys!614) ee!18) k0!772)) (not (= (select (arr!50948 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578129 () Bool)

(declare-fun res!1078307 () Bool)

(assert (=> b!1578129 (=> (not res!1078307) (not e!880211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578129 (= res!1078307 (validKeyInArray!0 k0!772))))

(assert (= (and start!136672 res!1078306) b!1578128))

(assert (= (and b!1578128 res!1078308) b!1578129))

(assert (= (and b!1578129 res!1078307) b!1578130))

(assert (= (and b!1578130 res!1078305) b!1578131))

(declare-fun m!1449645 () Bool)

(assert (=> b!1578128 m!1449645))

(declare-fun m!1449647 () Bool)

(assert (=> b!1578131 m!1449647))

(declare-fun m!1449649 () Bool)

(assert (=> b!1578131 m!1449649))

(declare-fun m!1449651 () Bool)

(assert (=> b!1578131 m!1449651))

(assert (=> b!1578131 m!1449651))

(declare-fun m!1449653 () Bool)

(assert (=> b!1578131 m!1449653))

(declare-fun m!1449655 () Bool)

(assert (=> start!136672 m!1449655))

(declare-fun m!1449657 () Bool)

(assert (=> start!136672 m!1449657))

(declare-fun m!1449659 () Bool)

(assert (=> b!1578129 m!1449659))

(declare-fun m!1449661 () Bool)

(assert (=> b!1578130 m!1449661))

(check-sat (not b!1578131) (not start!136672) (not b!1578129))
(check-sat)
(get-model)

(declare-fun b!1578168 () Bool)

(declare-fun e!880230 () SeekEntryResult!13770)

(declare-fun e!880231 () SeekEntryResult!13770)

(assert (=> b!1578168 (= e!880230 e!880231)))

(declare-fun c!146204 () Bool)

(declare-fun lt!675989 () (_ BitVec 64))

(assert (=> b!1578168 (= c!146204 (= lt!675989 k0!772))))

(declare-fun b!1578169 () Bool)

(assert (=> b!1578169 (= e!880230 Undefined!13770)))

(declare-fun b!1578170 () Bool)

(declare-fun c!146206 () Bool)

(assert (=> b!1578170 (= c!146206 (= lt!675989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880232 () SeekEntryResult!13770)

(assert (=> b!1578170 (= e!880231 e!880232)))

(declare-fun b!1578172 () Bool)

(assert (=> b!1578172 (= e!880232 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!18 x!466 mask!918) (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun b!1578173 () Bool)

(assert (=> b!1578173 (= e!880231 (Found!13770 (nextIndex!0 ee!18 x!466 mask!918)))))

(declare-fun d!165837 () Bool)

(declare-fun lt!675990 () SeekEntryResult!13770)

(assert (=> d!165837 (and (or ((_ is Undefined!13770) lt!675990) (not ((_ is Found!13770) lt!675990)) (and (bvsge (index!57479 lt!675990) #b00000000000000000000000000000000) (bvslt (index!57479 lt!675990) (size!51500 _keys!614)))) (or ((_ is Undefined!13770) lt!675990) ((_ is Found!13770) lt!675990) (not ((_ is MissingVacant!13770) lt!675990)) (not (= (index!57481 lt!675990) vacantSpotIndex!10)) (and (bvsge (index!57481 lt!675990) #b00000000000000000000000000000000) (bvslt (index!57481 lt!675990) (size!51500 _keys!614)))) (or ((_ is Undefined!13770) lt!675990) (ite ((_ is Found!13770) lt!675990) (= (select (arr!50948 _keys!614) (index!57479 lt!675990)) k0!772) (and ((_ is MissingVacant!13770) lt!675990) (= (index!57481 lt!675990) vacantSpotIndex!10) (= (select (arr!50948 _keys!614) (index!57481 lt!675990)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165837 (= lt!675990 e!880230)))

(declare-fun c!146205 () Bool)

(assert (=> d!165837 (= c!146205 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(assert (=> d!165837 (= lt!675989 (select (arr!50948 _keys!614) (nextIndex!0 ee!18 x!466 mask!918)))))

(assert (=> d!165837 (validMask!0 mask!918)))

(assert (=> d!165837 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918) lt!675990)))

(declare-fun b!1578171 () Bool)

(assert (=> b!1578171 (= e!880232 (MissingVacant!13770 vacantSpotIndex!10))))

(assert (= (and d!165837 c!146205) b!1578169))

(assert (= (and d!165837 (not c!146205)) b!1578168))

(assert (= (and b!1578168 c!146204) b!1578173))

(assert (= (and b!1578168 (not c!146204)) b!1578170))

(assert (= (and b!1578170 c!146206) b!1578171))

(assert (= (and b!1578170 (not c!146206)) b!1578172))

(assert (=> b!1578172 m!1449651))

(declare-fun m!1449699 () Bool)

(assert (=> b!1578172 m!1449699))

(assert (=> b!1578172 m!1449699))

(declare-fun m!1449701 () Bool)

(assert (=> b!1578172 m!1449701))

(declare-fun m!1449703 () Bool)

(assert (=> d!165837 m!1449703))

(declare-fun m!1449705 () Bool)

(assert (=> d!165837 m!1449705))

(assert (=> d!165837 m!1449651))

(declare-fun m!1449707 () Bool)

(assert (=> d!165837 m!1449707))

(assert (=> d!165837 m!1449655))

(assert (=> b!1578131 d!165837))

(declare-fun d!165841 () Bool)

(declare-fun lt!675993 () (_ BitVec 32))

(assert (=> d!165841 (and (bvsge lt!675993 #b00000000000000000000000000000000) (bvslt lt!675993 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165841 (= lt!675993 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!165841 (validMask!0 mask!918)))

(assert (=> d!165841 (= (nextIndex!0 ee!18 x!466 mask!918) lt!675993)))

(declare-fun bs!45615 () Bool)

(assert (= bs!45615 d!165841))

(declare-fun m!1449709 () Bool)

(assert (=> bs!45615 m!1449709))

(assert (=> bs!45615 m!1449655))

(assert (=> b!1578131 d!165841))

(declare-fun d!165843 () Bool)

(assert (=> d!165843 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136672 d!165843))

(declare-fun d!165853 () Bool)

(assert (=> d!165853 (= (array_inv!39884 _keys!614) (bvsge (size!51500 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136672 d!165853))

(declare-fun d!165855 () Bool)

(assert (=> d!165855 (= (validKeyInArray!0 k0!772) (and (not (= k0!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578129 d!165855))

(check-sat (not b!1578172) (not d!165841) (not d!165837))
(check-sat)
