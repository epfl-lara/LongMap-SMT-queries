; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53022 () Bool)

(assert start!53022)

(declare-fun b!577213 () Bool)

(declare-fun e!331971 () Bool)

(declare-datatypes ((array!36054 0))(
  ( (array!36055 (arr!17306 (Array (_ BitVec 32) (_ BitVec 64))) (size!17671 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36054)

(assert (=> b!577213 (= e!331971 (and (bvsle #b00000000000000000000000000000000 (size!17671 a!2986)) (bvsge (size!17671 a!2986) #b01111111111111111111111111111111)))))

(declare-fun res!365387 () Bool)

(declare-fun e!331970 () Bool)

(assert (=> start!53022 (=> (not res!365387) (not e!331970))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53022 (= res!365387 (validMask!0 mask!3053))))

(assert (=> start!53022 e!331970))

(assert (=> start!53022 true))

(declare-fun array_inv!13189 (array!36054) Bool)

(assert (=> start!53022 (array_inv!13189 a!2986)))

(declare-fun b!577214 () Bool)

(declare-fun res!365390 () Bool)

(assert (=> b!577214 (=> (not res!365390) (not e!331970))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577214 (= res!365390 (validKeyInArray!0 k0!1786))))

(declare-fun b!577215 () Bool)

(declare-fun res!365389 () Bool)

(assert (=> b!577215 (=> (not res!365389) (not e!331970))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577215 (= res!365389 (validKeyInArray!0 (select (arr!17306 a!2986) j!136)))))

(declare-fun b!577216 () Bool)

(assert (=> b!577216 (= e!331970 e!331971)))

(declare-fun res!365392 () Bool)

(assert (=> b!577216 (=> (not res!365392) (not e!331971))))

(declare-datatypes ((SeekEntryResult!5743 0))(
  ( (MissingZero!5743 (index!25199 (_ BitVec 32))) (Found!5743 (index!25200 (_ BitVec 32))) (Intermediate!5743 (undefined!6555 Bool) (index!25201 (_ BitVec 32)) (x!54119 (_ BitVec 32))) (Undefined!5743) (MissingVacant!5743 (index!25202 (_ BitVec 32))) )
))
(declare-fun lt!263737 () SeekEntryResult!5743)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577216 (= res!365392 (or (= lt!263737 (MissingZero!5743 i!1108)) (= lt!263737 (MissingVacant!5743 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36054 (_ BitVec 32)) SeekEntryResult!5743)

(assert (=> b!577216 (= lt!263737 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577217 () Bool)

(declare-fun res!365391 () Bool)

(assert (=> b!577217 (=> (not res!365391) (not e!331970))))

(assert (=> b!577217 (= res!365391 (and (= (size!17671 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17671 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17671 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577218 () Bool)

(declare-fun res!365388 () Bool)

(assert (=> b!577218 (=> (not res!365388) (not e!331971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36054 (_ BitVec 32)) Bool)

(assert (=> b!577218 (= res!365388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577219 () Bool)

(declare-fun res!365393 () Bool)

(assert (=> b!577219 (=> (not res!365393) (not e!331970))))

(declare-fun arrayContainsKey!0 (array!36054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577219 (= res!365393 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53022 res!365387) b!577217))

(assert (= (and b!577217 res!365391) b!577215))

(assert (= (and b!577215 res!365389) b!577214))

(assert (= (and b!577214 res!365390) b!577219))

(assert (= (and b!577219 res!365393) b!577216))

(assert (= (and b!577216 res!365392) b!577218))

(assert (= (and b!577218 res!365388) b!577213))

(declare-fun m!555587 () Bool)

(assert (=> b!577216 m!555587))

(declare-fun m!555589 () Bool)

(assert (=> start!53022 m!555589))

(declare-fun m!555591 () Bool)

(assert (=> start!53022 m!555591))

(declare-fun m!555593 () Bool)

(assert (=> b!577214 m!555593))

(declare-fun m!555595 () Bool)

(assert (=> b!577218 m!555595))

(declare-fun m!555597 () Bool)

(assert (=> b!577215 m!555597))

(assert (=> b!577215 m!555597))

(declare-fun m!555599 () Bool)

(assert (=> b!577215 m!555599))

(declare-fun m!555601 () Bool)

(assert (=> b!577219 m!555601))

(check-sat (not b!577218) (not b!577219) (not b!577216) (not b!577215) (not start!53022) (not b!577214))
(check-sat)
(get-model)

(declare-fun d!85329 () Bool)

(assert (=> d!85329 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53022 d!85329))

(declare-fun d!85331 () Bool)

(assert (=> d!85331 (= (array_inv!13189 a!2986) (bvsge (size!17671 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53022 d!85331))

(declare-fun b!577284 () Bool)

(declare-fun e!332009 () Bool)

(declare-fun e!332010 () Bool)

(assert (=> b!577284 (= e!332009 e!332010)))

(declare-fun c!66284 () Bool)

(assert (=> b!577284 (= c!66284 (validKeyInArray!0 (select (arr!17306 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!85333 () Bool)

(declare-fun res!365451 () Bool)

(assert (=> d!85333 (=> res!365451 e!332009)))

(assert (=> d!85333 (= res!365451 (bvsge #b00000000000000000000000000000000 (size!17671 a!2986)))))

(assert (=> d!85333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!332009)))

(declare-fun bm!32725 () Bool)

(declare-fun call!32728 () Bool)

(assert (=> bm!32725 (= call!32728 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!577285 () Bool)

(declare-fun e!332008 () Bool)

(assert (=> b!577285 (= e!332008 call!32728)))

(declare-fun b!577286 () Bool)

(assert (=> b!577286 (= e!332010 call!32728)))

(declare-fun b!577287 () Bool)

(assert (=> b!577287 (= e!332010 e!332008)))

(declare-fun lt!263758 () (_ BitVec 64))

(assert (=> b!577287 (= lt!263758 (select (arr!17306 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18120 0))(
  ( (Unit!18121) )
))
(declare-fun lt!263757 () Unit!18120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36054 (_ BitVec 64) (_ BitVec 32)) Unit!18120)

(assert (=> b!577287 (= lt!263757 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!263758 #b00000000000000000000000000000000))))

(assert (=> b!577287 (arrayContainsKey!0 a!2986 lt!263758 #b00000000000000000000000000000000)))

(declare-fun lt!263756 () Unit!18120)

(assert (=> b!577287 (= lt!263756 lt!263757)))

(declare-fun res!365450 () Bool)

(assert (=> b!577287 (= res!365450 (= (seekEntryOrOpen!0 (select (arr!17306 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5743 #b00000000000000000000000000000000)))))

(assert (=> b!577287 (=> (not res!365450) (not e!332008))))

(assert (= (and d!85333 (not res!365451)) b!577284))

(assert (= (and b!577284 c!66284) b!577287))

(assert (= (and b!577284 (not c!66284)) b!577286))

(assert (= (and b!577287 res!365450) b!577285))

(assert (= (or b!577285 b!577286) bm!32725))

(declare-fun m!555639 () Bool)

(assert (=> b!577284 m!555639))

(assert (=> b!577284 m!555639))

(declare-fun m!555641 () Bool)

(assert (=> b!577284 m!555641))

(declare-fun m!555643 () Bool)

(assert (=> bm!32725 m!555643))

(assert (=> b!577287 m!555639))

(declare-fun m!555645 () Bool)

(assert (=> b!577287 m!555645))

(declare-fun m!555647 () Bool)

(assert (=> b!577287 m!555647))

(assert (=> b!577287 m!555639))

(declare-fun m!555649 () Bool)

(assert (=> b!577287 m!555649))

(assert (=> b!577218 d!85333))

(declare-fun b!577324 () Bool)

(declare-fun e!332032 () SeekEntryResult!5743)

(declare-fun e!332034 () SeekEntryResult!5743)

(assert (=> b!577324 (= e!332032 e!332034)))

(declare-fun lt!263782 () (_ BitVec 64))

(declare-fun lt!263780 () SeekEntryResult!5743)

(assert (=> b!577324 (= lt!263782 (select (arr!17306 a!2986) (index!25201 lt!263780)))))

(declare-fun c!66302 () Bool)

(assert (=> b!577324 (= c!66302 (= lt!263782 k0!1786))))

(declare-fun b!577325 () Bool)

(declare-fun e!332033 () SeekEntryResult!5743)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36054 (_ BitVec 32)) SeekEntryResult!5743)

(assert (=> b!577325 (= e!332033 (seekKeyOrZeroReturnVacant!0 (x!54119 lt!263780) (index!25201 lt!263780) (index!25201 lt!263780) k0!1786 a!2986 mask!3053))))

(declare-fun b!577326 () Bool)

(declare-fun c!66300 () Bool)

(assert (=> b!577326 (= c!66300 (= lt!263782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!577326 (= e!332034 e!332033)))

(declare-fun b!577327 () Bool)

(assert (=> b!577327 (= e!332034 (Found!5743 (index!25201 lt!263780)))))

(declare-fun b!577328 () Bool)

(assert (=> b!577328 (= e!332032 Undefined!5743)))

(declare-fun d!85339 () Bool)

(declare-fun lt!263781 () SeekEntryResult!5743)

(get-info :version)

(assert (=> d!85339 (and (or ((_ is Undefined!5743) lt!263781) (not ((_ is Found!5743) lt!263781)) (and (bvsge (index!25200 lt!263781) #b00000000000000000000000000000000) (bvslt (index!25200 lt!263781) (size!17671 a!2986)))) (or ((_ is Undefined!5743) lt!263781) ((_ is Found!5743) lt!263781) (not ((_ is MissingZero!5743) lt!263781)) (and (bvsge (index!25199 lt!263781) #b00000000000000000000000000000000) (bvslt (index!25199 lt!263781) (size!17671 a!2986)))) (or ((_ is Undefined!5743) lt!263781) ((_ is Found!5743) lt!263781) ((_ is MissingZero!5743) lt!263781) (not ((_ is MissingVacant!5743) lt!263781)) (and (bvsge (index!25202 lt!263781) #b00000000000000000000000000000000) (bvslt (index!25202 lt!263781) (size!17671 a!2986)))) (or ((_ is Undefined!5743) lt!263781) (ite ((_ is Found!5743) lt!263781) (= (select (arr!17306 a!2986) (index!25200 lt!263781)) k0!1786) (ite ((_ is MissingZero!5743) lt!263781) (= (select (arr!17306 a!2986) (index!25199 lt!263781)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5743) lt!263781) (= (select (arr!17306 a!2986) (index!25202 lt!263781)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85339 (= lt!263781 e!332032)))

(declare-fun c!66301 () Bool)

(assert (=> d!85339 (= c!66301 (and ((_ is Intermediate!5743) lt!263780) (undefined!6555 lt!263780)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36054 (_ BitVec 32)) SeekEntryResult!5743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85339 (= lt!263780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85339 (validMask!0 mask!3053)))

(assert (=> d!85339 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!263781)))

(declare-fun b!577329 () Bool)

(assert (=> b!577329 (= e!332033 (MissingZero!5743 (index!25201 lt!263780)))))

(assert (= (and d!85339 c!66301) b!577328))

(assert (= (and d!85339 (not c!66301)) b!577324))

(assert (= (and b!577324 c!66302) b!577327))

(assert (= (and b!577324 (not c!66302)) b!577326))

(assert (= (and b!577326 c!66300) b!577329))

(assert (= (and b!577326 (not c!66300)) b!577325))

(declare-fun m!555661 () Bool)

(assert (=> b!577324 m!555661))

(declare-fun m!555663 () Bool)

(assert (=> b!577325 m!555663))

(declare-fun m!555665 () Bool)

(assert (=> d!85339 m!555665))

(declare-fun m!555667 () Bool)

(assert (=> d!85339 m!555667))

(assert (=> d!85339 m!555589))

(assert (=> d!85339 m!555665))

(declare-fun m!555669 () Bool)

(assert (=> d!85339 m!555669))

(declare-fun m!555671 () Bool)

(assert (=> d!85339 m!555671))

(declare-fun m!555673 () Bool)

(assert (=> d!85339 m!555673))

(assert (=> b!577216 d!85339))

(declare-fun d!85351 () Bool)

(assert (=> d!85351 (= (validKeyInArray!0 (select (arr!17306 a!2986) j!136)) (and (not (= (select (arr!17306 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17306 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577215 d!85351))

(declare-fun d!85353 () Bool)

(assert (=> d!85353 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577214 d!85353))

(declare-fun d!85355 () Bool)

(declare-fun res!365464 () Bool)

(declare-fun e!332045 () Bool)

(assert (=> d!85355 (=> res!365464 e!332045)))

(assert (=> d!85355 (= res!365464 (= (select (arr!17306 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85355 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!332045)))

(declare-fun b!577344 () Bool)

(declare-fun e!332046 () Bool)

(assert (=> b!577344 (= e!332045 e!332046)))

(declare-fun res!365465 () Bool)

(assert (=> b!577344 (=> (not res!365465) (not e!332046))))

(assert (=> b!577344 (= res!365465 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17671 a!2986)))))

(declare-fun b!577345 () Bool)

(assert (=> b!577345 (= e!332046 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85355 (not res!365464)) b!577344))

(assert (= (and b!577344 res!365465) b!577345))

(assert (=> d!85355 m!555639))

(declare-fun m!555689 () Bool)

(assert (=> b!577345 m!555689))

(assert (=> b!577219 d!85355))

(check-sat (not bm!32725) (not b!577345) (not b!577325) (not b!577284) (not d!85339) (not b!577287))
(check-sat)
