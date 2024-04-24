; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69272 () Bool)

(assert start!69272)

(declare-fun b!806959 () Bool)

(declare-fun e!446950 () Bool)

(declare-fun e!446949 () Bool)

(assert (=> b!806959 (= e!446950 e!446949)))

(declare-fun res!550732 () Bool)

(assert (=> b!806959 (=> (not res!550732) (not e!446949))))

(declare-datatypes ((array!43849 0))(
  ( (array!43850 (arr!20998 (Array (_ BitVec 32) (_ BitVec 64))) (size!21418 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43849)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8545 0))(
  ( (MissingZero!8545 (index!36548 (_ BitVec 32))) (Found!8545 (index!36549 (_ BitVec 32))) (Intermediate!8545 (undefined!9357 Bool) (index!36550 (_ BitVec 32)) (x!67528 (_ BitVec 32))) (Undefined!8545) (MissingVacant!8545 (index!36551 (_ BitVec 32))) )
))
(declare-fun lt!361333 () SeekEntryResult!8545)

(declare-fun lt!361327 () SeekEntryResult!8545)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806959 (= res!550732 (and (= lt!361327 lt!361333) (= (select (arr!20998 a!3170) index!1236) (select (arr!20998 a!3170) j!153))))))

(assert (=> b!806959 (= lt!361333 (Found!8545 j!153))))

(declare-fun b!806960 () Bool)

(declare-fun res!550741 () Bool)

(declare-fun e!446953 () Bool)

(assert (=> b!806960 (=> (not res!550741) (not e!446953))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806960 (= res!550741 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21418 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20998 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21418 a!3170)) (= (select (arr!20998 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806961 () Bool)

(declare-fun res!550733 () Bool)

(assert (=> b!806961 (=> (not res!550733) (not e!446953))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43849 (_ BitVec 32)) Bool)

(assert (=> b!806961 (= res!550733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806962 () Bool)

(declare-fun res!550736 () Bool)

(assert (=> b!806962 (=> (not res!550736) (not e!446953))))

(declare-datatypes ((List!14868 0))(
  ( (Nil!14865) (Cons!14864 (h!15999 (_ BitVec 64)) (t!21175 List!14868)) )
))
(declare-fun arrayNoDuplicates!0 (array!43849 (_ BitVec 32) List!14868) Bool)

(assert (=> b!806962 (= res!550736 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14865))))

(declare-fun b!806963 () Bool)

(declare-fun res!550743 () Bool)

(declare-fun e!446952 () Bool)

(assert (=> b!806963 (=> (not res!550743) (not e!446952))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806963 (= res!550743 (validKeyInArray!0 k0!2044))))

(declare-fun res!550742 () Bool)

(assert (=> start!69272 (=> (not res!550742) (not e!446952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69272 (= res!550742 (validMask!0 mask!3266))))

(assert (=> start!69272 e!446952))

(assert (=> start!69272 true))

(declare-fun array_inv!16857 (array!43849) Bool)

(assert (=> start!69272 (array_inv!16857 a!3170)))

(declare-fun b!806964 () Bool)

(declare-fun e!446951 () Bool)

(assert (=> b!806964 (= e!446953 e!446951)))

(declare-fun res!550734 () Bool)

(assert (=> b!806964 (=> (not res!550734) (not e!446951))))

(declare-fun lt!361328 () SeekEntryResult!8545)

(declare-fun lt!361329 () SeekEntryResult!8545)

(assert (=> b!806964 (= res!550734 (= lt!361328 lt!361329))))

(declare-fun lt!361332 () array!43849)

(declare-fun lt!361330 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43849 (_ BitVec 32)) SeekEntryResult!8545)

(assert (=> b!806964 (= lt!361329 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361330 lt!361332 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43849 (_ BitVec 32)) SeekEntryResult!8545)

(assert (=> b!806964 (= lt!361328 (seekEntryOrOpen!0 lt!361330 lt!361332 mask!3266))))

(assert (=> b!806964 (= lt!361330 (select (store (arr!20998 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806964 (= lt!361332 (array!43850 (store (arr!20998 a!3170) i!1163 k0!2044) (size!21418 a!3170)))))

(declare-fun b!806965 () Bool)

(assert (=> b!806965 (= e!446949 (not (= lt!361329 lt!361333)))))

(assert (=> b!806965 (= lt!361329 (Found!8545 index!1236))))

(declare-fun b!806966 () Bool)

(declare-fun res!550735 () Bool)

(assert (=> b!806966 (=> (not res!550735) (not e!446952))))

(declare-fun arrayContainsKey!0 (array!43849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806966 (= res!550735 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806967 () Bool)

(declare-fun res!550739 () Bool)

(assert (=> b!806967 (=> (not res!550739) (not e!446952))))

(assert (=> b!806967 (= res!550739 (validKeyInArray!0 (select (arr!20998 a!3170) j!153)))))

(declare-fun b!806968 () Bool)

(assert (=> b!806968 (= e!446951 e!446950)))

(declare-fun res!550740 () Bool)

(assert (=> b!806968 (=> (not res!550740) (not e!446950))))

(declare-fun lt!361331 () SeekEntryResult!8545)

(assert (=> b!806968 (= res!550740 (= lt!361331 lt!361327))))

(assert (=> b!806968 (= lt!361327 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20998 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806968 (= lt!361331 (seekEntryOrOpen!0 (select (arr!20998 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806969 () Bool)

(declare-fun res!550738 () Bool)

(assert (=> b!806969 (=> (not res!550738) (not e!446952))))

(assert (=> b!806969 (= res!550738 (and (= (size!21418 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21418 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21418 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806970 () Bool)

(assert (=> b!806970 (= e!446952 e!446953)))

(declare-fun res!550737 () Bool)

(assert (=> b!806970 (=> (not res!550737) (not e!446953))))

(declare-fun lt!361334 () SeekEntryResult!8545)

(assert (=> b!806970 (= res!550737 (or (= lt!361334 (MissingZero!8545 i!1163)) (= lt!361334 (MissingVacant!8545 i!1163))))))

(assert (=> b!806970 (= lt!361334 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69272 res!550742) b!806969))

(assert (= (and b!806969 res!550738) b!806967))

(assert (= (and b!806967 res!550739) b!806963))

(assert (= (and b!806963 res!550743) b!806966))

(assert (= (and b!806966 res!550735) b!806970))

(assert (= (and b!806970 res!550737) b!806961))

(assert (= (and b!806961 res!550733) b!806962))

(assert (= (and b!806962 res!550736) b!806960))

(assert (= (and b!806960 res!550741) b!806964))

(assert (= (and b!806964 res!550734) b!806968))

(assert (= (and b!806968 res!550740) b!806959))

(assert (= (and b!806959 res!550732) b!806965))

(declare-fun m!749281 () Bool)

(assert (=> b!806968 m!749281))

(assert (=> b!806968 m!749281))

(declare-fun m!749283 () Bool)

(assert (=> b!806968 m!749283))

(assert (=> b!806968 m!749281))

(declare-fun m!749285 () Bool)

(assert (=> b!806968 m!749285))

(declare-fun m!749287 () Bool)

(assert (=> b!806966 m!749287))

(declare-fun m!749289 () Bool)

(assert (=> b!806960 m!749289))

(declare-fun m!749291 () Bool)

(assert (=> b!806960 m!749291))

(declare-fun m!749293 () Bool)

(assert (=> start!69272 m!749293))

(declare-fun m!749295 () Bool)

(assert (=> start!69272 m!749295))

(declare-fun m!749297 () Bool)

(assert (=> b!806963 m!749297))

(declare-fun m!749299 () Bool)

(assert (=> b!806959 m!749299))

(assert (=> b!806959 m!749281))

(assert (=> b!806967 m!749281))

(assert (=> b!806967 m!749281))

(declare-fun m!749301 () Bool)

(assert (=> b!806967 m!749301))

(declare-fun m!749303 () Bool)

(assert (=> b!806962 m!749303))

(declare-fun m!749305 () Bool)

(assert (=> b!806970 m!749305))

(declare-fun m!749307 () Bool)

(assert (=> b!806961 m!749307))

(declare-fun m!749309 () Bool)

(assert (=> b!806964 m!749309))

(declare-fun m!749311 () Bool)

(assert (=> b!806964 m!749311))

(declare-fun m!749313 () Bool)

(assert (=> b!806964 m!749313))

(declare-fun m!749315 () Bool)

(assert (=> b!806964 m!749315))

(check-sat (not b!806966) (not b!806970) (not b!806968) (not b!806962) (not b!806967) (not start!69272) (not b!806963) (not b!806961) (not b!806964))
(check-sat)
(get-model)

(declare-fun d!103953 () Bool)

(declare-fun res!550820 () Bool)

(declare-fun e!446994 () Bool)

(assert (=> d!103953 (=> res!550820 e!446994)))

(assert (=> d!103953 (= res!550820 (= (select (arr!20998 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103953 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!446994)))

(declare-fun b!807047 () Bool)

(declare-fun e!446995 () Bool)

(assert (=> b!807047 (= e!446994 e!446995)))

(declare-fun res!550821 () Bool)

(assert (=> b!807047 (=> (not res!550821) (not e!446995))))

(assert (=> b!807047 (= res!550821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21418 a!3170)))))

(declare-fun b!807048 () Bool)

(assert (=> b!807048 (= e!446995 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103953 (not res!550820)) b!807047))

(assert (= (and b!807047 res!550821) b!807048))

(declare-fun m!749389 () Bool)

(assert (=> d!103953 m!749389))

(declare-fun m!749391 () Bool)

(assert (=> b!807048 m!749391))

(assert (=> b!806966 d!103953))

(declare-fun b!807057 () Bool)

(declare-fun e!447003 () Bool)

(declare-fun call!35412 () Bool)

(assert (=> b!807057 (= e!447003 call!35412)))

(declare-fun d!103955 () Bool)

(declare-fun res!550826 () Bool)

(declare-fun e!447002 () Bool)

(assert (=> d!103955 (=> res!550826 e!447002)))

(assert (=> d!103955 (= res!550826 (bvsge #b00000000000000000000000000000000 (size!21418 a!3170)))))

(assert (=> d!103955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!447002)))

(declare-fun b!807058 () Bool)

(declare-fun e!447004 () Bool)

(assert (=> b!807058 (= e!447004 call!35412)))

(declare-fun bm!35409 () Bool)

(assert (=> bm!35409 (= call!35412 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!807059 () Bool)

(assert (=> b!807059 (= e!447003 e!447004)))

(declare-fun lt!361389 () (_ BitVec 64))

(assert (=> b!807059 (= lt!361389 (select (arr!20998 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27593 0))(
  ( (Unit!27594) )
))
(declare-fun lt!361391 () Unit!27593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43849 (_ BitVec 64) (_ BitVec 32)) Unit!27593)

(assert (=> b!807059 (= lt!361391 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!361389 #b00000000000000000000000000000000))))

(assert (=> b!807059 (arrayContainsKey!0 a!3170 lt!361389 #b00000000000000000000000000000000)))

(declare-fun lt!361390 () Unit!27593)

(assert (=> b!807059 (= lt!361390 lt!361391)))

(declare-fun res!550827 () Bool)

(assert (=> b!807059 (= res!550827 (= (seekEntryOrOpen!0 (select (arr!20998 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8545 #b00000000000000000000000000000000)))))

(assert (=> b!807059 (=> (not res!550827) (not e!447004))))

(declare-fun b!807060 () Bool)

(assert (=> b!807060 (= e!447002 e!447003)))

(declare-fun c!88529 () Bool)

(assert (=> b!807060 (= c!88529 (validKeyInArray!0 (select (arr!20998 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!103955 (not res!550826)) b!807060))

(assert (= (and b!807060 c!88529) b!807059))

(assert (= (and b!807060 (not c!88529)) b!807057))

(assert (= (and b!807059 res!550827) b!807058))

(assert (= (or b!807058 b!807057) bm!35409))

(declare-fun m!749393 () Bool)

(assert (=> bm!35409 m!749393))

(assert (=> b!807059 m!749389))

(declare-fun m!749395 () Bool)

(assert (=> b!807059 m!749395))

(declare-fun m!749397 () Bool)

(assert (=> b!807059 m!749397))

(assert (=> b!807059 m!749389))

(declare-fun m!749399 () Bool)

(assert (=> b!807059 m!749399))

(assert (=> b!807060 m!749389))

(assert (=> b!807060 m!749389))

(declare-fun m!749401 () Bool)

(assert (=> b!807060 m!749401))

(assert (=> b!806961 d!103955))

(declare-fun b!807071 () Bool)

(declare-fun e!447014 () Bool)

(declare-fun call!35415 () Bool)

(assert (=> b!807071 (= e!447014 call!35415)))

(declare-fun b!807072 () Bool)

(declare-fun e!447016 () Bool)

(assert (=> b!807072 (= e!447016 e!447014)))

(declare-fun c!88532 () Bool)

(assert (=> b!807072 (= c!88532 (validKeyInArray!0 (select (arr!20998 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!807073 () Bool)

(declare-fun e!447015 () Bool)

(assert (=> b!807073 (= e!447015 e!447016)))

(declare-fun res!550836 () Bool)

(assert (=> b!807073 (=> (not res!550836) (not e!447016))))

(declare-fun e!447013 () Bool)

(assert (=> b!807073 (= res!550836 (not e!447013))))

(declare-fun res!550834 () Bool)

(assert (=> b!807073 (=> (not res!550834) (not e!447013))))

(assert (=> b!807073 (= res!550834 (validKeyInArray!0 (select (arr!20998 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!807074 () Bool)

(declare-fun contains!4101 (List!14868 (_ BitVec 64)) Bool)

(assert (=> b!807074 (= e!447013 (contains!4101 Nil!14865 (select (arr!20998 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!103957 () Bool)

(declare-fun res!550835 () Bool)

(assert (=> d!103957 (=> res!550835 e!447015)))

(assert (=> d!103957 (= res!550835 (bvsge #b00000000000000000000000000000000 (size!21418 a!3170)))))

(assert (=> d!103957 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14865) e!447015)))

(declare-fun bm!35412 () Bool)

(assert (=> bm!35412 (= call!35415 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88532 (Cons!14864 (select (arr!20998 a!3170) #b00000000000000000000000000000000) Nil!14865) Nil!14865)))))

(declare-fun b!807075 () Bool)

(assert (=> b!807075 (= e!447014 call!35415)))

(assert (= (and d!103957 (not res!550835)) b!807073))

(assert (= (and b!807073 res!550834) b!807074))

(assert (= (and b!807073 res!550836) b!807072))

(assert (= (and b!807072 c!88532) b!807075))

(assert (= (and b!807072 (not c!88532)) b!807071))

(assert (= (or b!807075 b!807071) bm!35412))

(assert (=> b!807072 m!749389))

(assert (=> b!807072 m!749389))

(assert (=> b!807072 m!749401))

(assert (=> b!807073 m!749389))

(assert (=> b!807073 m!749389))

(assert (=> b!807073 m!749401))

(assert (=> b!807074 m!749389))

(assert (=> b!807074 m!749389))

(declare-fun m!749403 () Bool)

(assert (=> b!807074 m!749403))

(assert (=> bm!35412 m!749389))

(declare-fun m!749405 () Bool)

(assert (=> bm!35412 m!749405))

(assert (=> b!806962 d!103957))

(declare-fun d!103959 () Bool)

(assert (=> d!103959 (= (validKeyInArray!0 (select (arr!20998 a!3170) j!153)) (and (not (= (select (arr!20998 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20998 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806967 d!103959))

(declare-fun d!103961 () Bool)

(declare-fun lt!361397 () SeekEntryResult!8545)

(get-info :version)

(assert (=> d!103961 (and (or ((_ is Undefined!8545) lt!361397) (not ((_ is Found!8545) lt!361397)) (and (bvsge (index!36549 lt!361397) #b00000000000000000000000000000000) (bvslt (index!36549 lt!361397) (size!21418 a!3170)))) (or ((_ is Undefined!8545) lt!361397) ((_ is Found!8545) lt!361397) (not ((_ is MissingVacant!8545) lt!361397)) (not (= (index!36551 lt!361397) vacantBefore!23)) (and (bvsge (index!36551 lt!361397) #b00000000000000000000000000000000) (bvslt (index!36551 lt!361397) (size!21418 a!3170)))) (or ((_ is Undefined!8545) lt!361397) (ite ((_ is Found!8545) lt!361397) (= (select (arr!20998 a!3170) (index!36549 lt!361397)) (select (arr!20998 a!3170) j!153)) (and ((_ is MissingVacant!8545) lt!361397) (= (index!36551 lt!361397) vacantBefore!23) (= (select (arr!20998 a!3170) (index!36551 lt!361397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447023 () SeekEntryResult!8545)

(assert (=> d!103961 (= lt!361397 e!447023)))

(declare-fun c!88540 () Bool)

(assert (=> d!103961 (= c!88540 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!361396 () (_ BitVec 64))

(assert (=> d!103961 (= lt!361396 (select (arr!20998 a!3170) index!1236))))

(assert (=> d!103961 (validMask!0 mask!3266)))

(assert (=> d!103961 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20998 a!3170) j!153) a!3170 mask!3266) lt!361397)))

(declare-fun b!807088 () Bool)

(declare-fun e!447024 () SeekEntryResult!8545)

(assert (=> b!807088 (= e!447024 (Found!8545 index!1236))))

(declare-fun b!807089 () Bool)

(assert (=> b!807089 (= e!447023 e!447024)))

(declare-fun c!88539 () Bool)

(assert (=> b!807089 (= c!88539 (= lt!361396 (select (arr!20998 a!3170) j!153)))))

(declare-fun b!807090 () Bool)

(declare-fun c!88541 () Bool)

(assert (=> b!807090 (= c!88541 (= lt!361396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447025 () SeekEntryResult!8545)

(assert (=> b!807090 (= e!447024 e!447025)))

(declare-fun b!807091 () Bool)

(assert (=> b!807091 (= e!447023 Undefined!8545)))

(declare-fun b!807092 () Bool)

(assert (=> b!807092 (= e!447025 (MissingVacant!8545 vacantBefore!23))))

(declare-fun b!807093 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807093 (= e!447025 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!20998 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!103961 c!88540) b!807091))

(assert (= (and d!103961 (not c!88540)) b!807089))

(assert (= (and b!807089 c!88539) b!807088))

(assert (= (and b!807089 (not c!88539)) b!807090))

(assert (= (and b!807090 c!88541) b!807092))

(assert (= (and b!807090 (not c!88541)) b!807093))

(declare-fun m!749407 () Bool)

(assert (=> d!103961 m!749407))

(declare-fun m!749409 () Bool)

(assert (=> d!103961 m!749409))

(assert (=> d!103961 m!749299))

(assert (=> d!103961 m!749293))

(declare-fun m!749411 () Bool)

(assert (=> b!807093 m!749411))

(assert (=> b!807093 m!749411))

(assert (=> b!807093 m!749281))

(declare-fun m!749413 () Bool)

(assert (=> b!807093 m!749413))

(assert (=> b!806968 d!103961))

(declare-fun b!807136 () Bool)

(declare-fun c!88562 () Bool)

(declare-fun lt!361419 () (_ BitVec 64))

(assert (=> b!807136 (= c!88562 (= lt!361419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447051 () SeekEntryResult!8545)

(declare-fun e!447052 () SeekEntryResult!8545)

(assert (=> b!807136 (= e!447051 e!447052)))

(declare-fun b!807137 () Bool)

(declare-fun lt!361420 () SeekEntryResult!8545)

(assert (=> b!807137 (= e!447051 (Found!8545 (index!36550 lt!361420)))))

(declare-fun b!807138 () Bool)

(declare-fun e!447050 () SeekEntryResult!8545)

(assert (=> b!807138 (= e!447050 e!447051)))

(assert (=> b!807138 (= lt!361419 (select (arr!20998 a!3170) (index!36550 lt!361420)))))

(declare-fun c!88561 () Bool)

(assert (=> b!807138 (= c!88561 (= lt!361419 (select (arr!20998 a!3170) j!153)))))

(declare-fun b!807139 () Bool)

(assert (=> b!807139 (= e!447050 Undefined!8545)))

(declare-fun b!807140 () Bool)

(assert (=> b!807140 (= e!447052 (MissingZero!8545 (index!36550 lt!361420)))))

(declare-fun b!807141 () Bool)

(assert (=> b!807141 (= e!447052 (seekKeyOrZeroReturnVacant!0 (x!67528 lt!361420) (index!36550 lt!361420) (index!36550 lt!361420) (select (arr!20998 a!3170) j!153) a!3170 mask!3266))))

(declare-fun d!103973 () Bool)

(declare-fun lt!361421 () SeekEntryResult!8545)

(assert (=> d!103973 (and (or ((_ is Undefined!8545) lt!361421) (not ((_ is Found!8545) lt!361421)) (and (bvsge (index!36549 lt!361421) #b00000000000000000000000000000000) (bvslt (index!36549 lt!361421) (size!21418 a!3170)))) (or ((_ is Undefined!8545) lt!361421) ((_ is Found!8545) lt!361421) (not ((_ is MissingZero!8545) lt!361421)) (and (bvsge (index!36548 lt!361421) #b00000000000000000000000000000000) (bvslt (index!36548 lt!361421) (size!21418 a!3170)))) (or ((_ is Undefined!8545) lt!361421) ((_ is Found!8545) lt!361421) ((_ is MissingZero!8545) lt!361421) (not ((_ is MissingVacant!8545) lt!361421)) (and (bvsge (index!36551 lt!361421) #b00000000000000000000000000000000) (bvslt (index!36551 lt!361421) (size!21418 a!3170)))) (or ((_ is Undefined!8545) lt!361421) (ite ((_ is Found!8545) lt!361421) (= (select (arr!20998 a!3170) (index!36549 lt!361421)) (select (arr!20998 a!3170) j!153)) (ite ((_ is MissingZero!8545) lt!361421) (= (select (arr!20998 a!3170) (index!36548 lt!361421)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8545) lt!361421) (= (select (arr!20998 a!3170) (index!36551 lt!361421)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103973 (= lt!361421 e!447050)))

(declare-fun c!88560 () Bool)

(assert (=> d!103973 (= c!88560 (and ((_ is Intermediate!8545) lt!361420) (undefined!9357 lt!361420)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43849 (_ BitVec 32)) SeekEntryResult!8545)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103973 (= lt!361420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20998 a!3170) j!153) mask!3266) (select (arr!20998 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103973 (validMask!0 mask!3266)))

(assert (=> d!103973 (= (seekEntryOrOpen!0 (select (arr!20998 a!3170) j!153) a!3170 mask!3266) lt!361421)))

(assert (= (and d!103973 c!88560) b!807139))

(assert (= (and d!103973 (not c!88560)) b!807138))

(assert (= (and b!807138 c!88561) b!807137))

(assert (= (and b!807138 (not c!88561)) b!807136))

(assert (= (and b!807136 c!88562) b!807140))

(assert (= (and b!807136 (not c!88562)) b!807141))

(declare-fun m!749437 () Bool)

(assert (=> b!807138 m!749437))

(assert (=> b!807141 m!749281))

(declare-fun m!749439 () Bool)

(assert (=> b!807141 m!749439))

(assert (=> d!103973 m!749293))

(declare-fun m!749441 () Bool)

(assert (=> d!103973 m!749441))

(declare-fun m!749443 () Bool)

(assert (=> d!103973 m!749443))

(assert (=> d!103973 m!749281))

(declare-fun m!749445 () Bool)

(assert (=> d!103973 m!749445))

(assert (=> d!103973 m!749445))

(assert (=> d!103973 m!749281))

(declare-fun m!749447 () Bool)

(assert (=> d!103973 m!749447))

(declare-fun m!749449 () Bool)

(assert (=> d!103973 m!749449))

(assert (=> b!806968 d!103973))

(declare-fun d!103985 () Bool)

(assert (=> d!103985 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69272 d!103985))

(declare-fun d!103987 () Bool)

(assert (=> d!103987 (= (array_inv!16857 a!3170) (bvsge (size!21418 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69272 d!103987))

(declare-fun d!103989 () Bool)

(assert (=> d!103989 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!806963 d!103989))

(declare-fun lt!361436 () SeekEntryResult!8545)

(declare-fun d!103991 () Bool)

(assert (=> d!103991 (and (or ((_ is Undefined!8545) lt!361436) (not ((_ is Found!8545) lt!361436)) (and (bvsge (index!36549 lt!361436) #b00000000000000000000000000000000) (bvslt (index!36549 lt!361436) (size!21418 lt!361332)))) (or ((_ is Undefined!8545) lt!361436) ((_ is Found!8545) lt!361436) (not ((_ is MissingVacant!8545) lt!361436)) (not (= (index!36551 lt!361436) vacantAfter!23)) (and (bvsge (index!36551 lt!361436) #b00000000000000000000000000000000) (bvslt (index!36551 lt!361436) (size!21418 lt!361332)))) (or ((_ is Undefined!8545) lt!361436) (ite ((_ is Found!8545) lt!361436) (= (select (arr!20998 lt!361332) (index!36549 lt!361436)) lt!361330) (and ((_ is MissingVacant!8545) lt!361436) (= (index!36551 lt!361436) vacantAfter!23) (= (select (arr!20998 lt!361332) (index!36551 lt!361436)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!447068 () SeekEntryResult!8545)

(assert (=> d!103991 (= lt!361436 e!447068)))

(declare-fun c!88579 () Bool)

(assert (=> d!103991 (= c!88579 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!361435 () (_ BitVec 64))

(assert (=> d!103991 (= lt!361435 (select (arr!20998 lt!361332) index!1236))))

(assert (=> d!103991 (validMask!0 mask!3266)))

(assert (=> d!103991 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361330 lt!361332 mask!3266) lt!361436)))

(declare-fun b!807172 () Bool)

(declare-fun e!447069 () SeekEntryResult!8545)

(assert (=> b!807172 (= e!447069 (Found!8545 index!1236))))

(declare-fun b!807173 () Bool)

(assert (=> b!807173 (= e!447068 e!447069)))

(declare-fun c!88578 () Bool)

(assert (=> b!807173 (= c!88578 (= lt!361435 lt!361330))))

(declare-fun b!807174 () Bool)

(declare-fun c!88580 () Bool)

(assert (=> b!807174 (= c!88580 (= lt!361435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447070 () SeekEntryResult!8545)

(assert (=> b!807174 (= e!447069 e!447070)))

(declare-fun b!807175 () Bool)

(assert (=> b!807175 (= e!447068 Undefined!8545)))

(declare-fun b!807176 () Bool)

(assert (=> b!807176 (= e!447070 (MissingVacant!8545 vacantAfter!23))))

(declare-fun b!807177 () Bool)

(assert (=> b!807177 (= e!447070 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!361330 lt!361332 mask!3266))))

(assert (= (and d!103991 c!88579) b!807175))

(assert (= (and d!103991 (not c!88579)) b!807173))

(assert (= (and b!807173 c!88578) b!807172))

(assert (= (and b!807173 (not c!88578)) b!807174))

(assert (= (and b!807174 c!88580) b!807176))

(assert (= (and b!807174 (not c!88580)) b!807177))

(declare-fun m!749465 () Bool)

(assert (=> d!103991 m!749465))

(declare-fun m!749467 () Bool)

(assert (=> d!103991 m!749467))

(declare-fun m!749469 () Bool)

(assert (=> d!103991 m!749469))

(assert (=> d!103991 m!749293))

(assert (=> b!807177 m!749411))

(assert (=> b!807177 m!749411))

(declare-fun m!749471 () Bool)

(assert (=> b!807177 m!749471))

(assert (=> b!806964 d!103991))

(declare-fun b!807184 () Bool)

(declare-fun c!88586 () Bool)

(declare-fun lt!361439 () (_ BitVec 64))

(assert (=> b!807184 (= c!88586 (= lt!361439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447075 () SeekEntryResult!8545)

(declare-fun e!447076 () SeekEntryResult!8545)

(assert (=> b!807184 (= e!447075 e!447076)))

(declare-fun b!807185 () Bool)

(declare-fun lt!361440 () SeekEntryResult!8545)

(assert (=> b!807185 (= e!447075 (Found!8545 (index!36550 lt!361440)))))

(declare-fun b!807186 () Bool)

(declare-fun e!447074 () SeekEntryResult!8545)

(assert (=> b!807186 (= e!447074 e!447075)))

(assert (=> b!807186 (= lt!361439 (select (arr!20998 lt!361332) (index!36550 lt!361440)))))

(declare-fun c!88585 () Bool)

(assert (=> b!807186 (= c!88585 (= lt!361439 lt!361330))))

(declare-fun b!807187 () Bool)

(assert (=> b!807187 (= e!447074 Undefined!8545)))

(declare-fun b!807188 () Bool)

(assert (=> b!807188 (= e!447076 (MissingZero!8545 (index!36550 lt!361440)))))

(declare-fun b!807189 () Bool)

(assert (=> b!807189 (= e!447076 (seekKeyOrZeroReturnVacant!0 (x!67528 lt!361440) (index!36550 lt!361440) (index!36550 lt!361440) lt!361330 lt!361332 mask!3266))))

(declare-fun d!103995 () Bool)

(declare-fun lt!361441 () SeekEntryResult!8545)

(assert (=> d!103995 (and (or ((_ is Undefined!8545) lt!361441) (not ((_ is Found!8545) lt!361441)) (and (bvsge (index!36549 lt!361441) #b00000000000000000000000000000000) (bvslt (index!36549 lt!361441) (size!21418 lt!361332)))) (or ((_ is Undefined!8545) lt!361441) ((_ is Found!8545) lt!361441) (not ((_ is MissingZero!8545) lt!361441)) (and (bvsge (index!36548 lt!361441) #b00000000000000000000000000000000) (bvslt (index!36548 lt!361441) (size!21418 lt!361332)))) (or ((_ is Undefined!8545) lt!361441) ((_ is Found!8545) lt!361441) ((_ is MissingZero!8545) lt!361441) (not ((_ is MissingVacant!8545) lt!361441)) (and (bvsge (index!36551 lt!361441) #b00000000000000000000000000000000) (bvslt (index!36551 lt!361441) (size!21418 lt!361332)))) (or ((_ is Undefined!8545) lt!361441) (ite ((_ is Found!8545) lt!361441) (= (select (arr!20998 lt!361332) (index!36549 lt!361441)) lt!361330) (ite ((_ is MissingZero!8545) lt!361441) (= (select (arr!20998 lt!361332) (index!36548 lt!361441)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8545) lt!361441) (= (select (arr!20998 lt!361332) (index!36551 lt!361441)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103995 (= lt!361441 e!447074)))

(declare-fun c!88584 () Bool)

(assert (=> d!103995 (= c!88584 (and ((_ is Intermediate!8545) lt!361440) (undefined!9357 lt!361440)))))

(assert (=> d!103995 (= lt!361440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!361330 mask!3266) lt!361330 lt!361332 mask!3266))))

(assert (=> d!103995 (validMask!0 mask!3266)))

(assert (=> d!103995 (= (seekEntryOrOpen!0 lt!361330 lt!361332 mask!3266) lt!361441)))

(assert (= (and d!103995 c!88584) b!807187))

(assert (= (and d!103995 (not c!88584)) b!807186))

(assert (= (and b!807186 c!88585) b!807185))

(assert (= (and b!807186 (not c!88585)) b!807184))

(assert (= (and b!807184 c!88586) b!807188))

(assert (= (and b!807184 (not c!88586)) b!807189))

(declare-fun m!749483 () Bool)

(assert (=> b!807186 m!749483))

(declare-fun m!749485 () Bool)

(assert (=> b!807189 m!749485))

(assert (=> d!103995 m!749293))

(declare-fun m!749487 () Bool)

(assert (=> d!103995 m!749487))

(declare-fun m!749489 () Bool)

(assert (=> d!103995 m!749489))

(declare-fun m!749491 () Bool)

(assert (=> d!103995 m!749491))

(assert (=> d!103995 m!749491))

(declare-fun m!749493 () Bool)

(assert (=> d!103995 m!749493))

(declare-fun m!749495 () Bool)

(assert (=> d!103995 m!749495))

(assert (=> b!806964 d!103995))

(declare-fun b!807194 () Bool)

(declare-fun c!88589 () Bool)

(declare-fun lt!361442 () (_ BitVec 64))

(assert (=> b!807194 (= c!88589 (= lt!361442 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!447082 () SeekEntryResult!8545)

(declare-fun e!447083 () SeekEntryResult!8545)

(assert (=> b!807194 (= e!447082 e!447083)))

(declare-fun b!807195 () Bool)

(declare-fun lt!361443 () SeekEntryResult!8545)

(assert (=> b!807195 (= e!447082 (Found!8545 (index!36550 lt!361443)))))

(declare-fun b!807196 () Bool)

(declare-fun e!447081 () SeekEntryResult!8545)

(assert (=> b!807196 (= e!447081 e!447082)))

(assert (=> b!807196 (= lt!361442 (select (arr!20998 a!3170) (index!36550 lt!361443)))))

(declare-fun c!88588 () Bool)

(assert (=> b!807196 (= c!88588 (= lt!361442 k0!2044))))

(declare-fun b!807197 () Bool)

(assert (=> b!807197 (= e!447081 Undefined!8545)))

(declare-fun b!807198 () Bool)

(assert (=> b!807198 (= e!447083 (MissingZero!8545 (index!36550 lt!361443)))))

(declare-fun b!807199 () Bool)

(assert (=> b!807199 (= e!447083 (seekKeyOrZeroReturnVacant!0 (x!67528 lt!361443) (index!36550 lt!361443) (index!36550 lt!361443) k0!2044 a!3170 mask!3266))))

(declare-fun d!103999 () Bool)

(declare-fun lt!361444 () SeekEntryResult!8545)

(assert (=> d!103999 (and (or ((_ is Undefined!8545) lt!361444) (not ((_ is Found!8545) lt!361444)) (and (bvsge (index!36549 lt!361444) #b00000000000000000000000000000000) (bvslt (index!36549 lt!361444) (size!21418 a!3170)))) (or ((_ is Undefined!8545) lt!361444) ((_ is Found!8545) lt!361444) (not ((_ is MissingZero!8545) lt!361444)) (and (bvsge (index!36548 lt!361444) #b00000000000000000000000000000000) (bvslt (index!36548 lt!361444) (size!21418 a!3170)))) (or ((_ is Undefined!8545) lt!361444) ((_ is Found!8545) lt!361444) ((_ is MissingZero!8545) lt!361444) (not ((_ is MissingVacant!8545) lt!361444)) (and (bvsge (index!36551 lt!361444) #b00000000000000000000000000000000) (bvslt (index!36551 lt!361444) (size!21418 a!3170)))) (or ((_ is Undefined!8545) lt!361444) (ite ((_ is Found!8545) lt!361444) (= (select (arr!20998 a!3170) (index!36549 lt!361444)) k0!2044) (ite ((_ is MissingZero!8545) lt!361444) (= (select (arr!20998 a!3170) (index!36548 lt!361444)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8545) lt!361444) (= (select (arr!20998 a!3170) (index!36551 lt!361444)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103999 (= lt!361444 e!447081)))

(declare-fun c!88587 () Bool)

(assert (=> d!103999 (= c!88587 (and ((_ is Intermediate!8545) lt!361443) (undefined!9357 lt!361443)))))

(assert (=> d!103999 (= lt!361443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103999 (validMask!0 mask!3266)))

(assert (=> d!103999 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!361444)))

(assert (= (and d!103999 c!88587) b!807197))

(assert (= (and d!103999 (not c!88587)) b!807196))

(assert (= (and b!807196 c!88588) b!807195))

(assert (= (and b!807196 (not c!88588)) b!807194))

(assert (= (and b!807194 c!88589) b!807198))

(assert (= (and b!807194 (not c!88589)) b!807199))

(declare-fun m!749497 () Bool)

(assert (=> b!807196 m!749497))

(declare-fun m!749499 () Bool)

(assert (=> b!807199 m!749499))

(assert (=> d!103999 m!749293))

(declare-fun m!749502 () Bool)

(assert (=> d!103999 m!749502))

(declare-fun m!749505 () Bool)

(assert (=> d!103999 m!749505))

(declare-fun m!749509 () Bool)

(assert (=> d!103999 m!749509))

(assert (=> d!103999 m!749509))

(declare-fun m!749511 () Bool)

(assert (=> d!103999 m!749511))

(declare-fun m!749513 () Bool)

(assert (=> d!103999 m!749513))

(assert (=> b!806970 d!103999))

(check-sat (not d!103961) (not b!807073) (not b!807199) (not d!103973) (not b!807141) (not b!807093) (not d!103995) (not b!807189) (not b!807059) (not b!807048) (not d!103999) (not d!103991) (not b!807072) (not b!807074) (not b!807177) (not bm!35409) (not b!807060) (not bm!35412))
(check-sat)
