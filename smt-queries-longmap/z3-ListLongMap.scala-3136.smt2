; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44102 () Bool)

(assert start!44102)

(declare-fun b!486013 () Bool)

(declare-fun res!289671 () Bool)

(declare-fun e!286072 () Bool)

(assert (=> b!486013 (=> (not res!289671) (not e!286072))))

(declare-datatypes ((array!31471 0))(
  ( (array!31472 (arr!15133 (Array (_ BitVec 32) (_ BitVec 64))) (size!15497 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31471)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486013 (= res!289671 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486014 () Bool)

(declare-fun res!289673 () Bool)

(declare-fun e!286073 () Bool)

(assert (=> b!486014 (=> (not res!289673) (not e!286073))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31471 (_ BitVec 32)) Bool)

(assert (=> b!486014 (= res!289673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486015 () Bool)

(assert (=> b!486015 (= e!286073 (and (bvsle #b00000000000000000000000000000000 (size!15497 a!3235)) (bvsge (size!15497 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!486016 () Bool)

(assert (=> b!486016 (= e!286072 e!286073)))

(declare-fun res!289674 () Bool)

(assert (=> b!486016 (=> (not res!289674) (not e!286073))))

(declare-datatypes ((SeekEntryResult!3556 0))(
  ( (MissingZero!3556 (index!16403 (_ BitVec 32))) (Found!3556 (index!16404 (_ BitVec 32))) (Intermediate!3556 (undefined!4368 Bool) (index!16405 (_ BitVec 32)) (x!45685 (_ BitVec 32))) (Undefined!3556) (MissingVacant!3556 (index!16406 (_ BitVec 32))) )
))
(declare-fun lt!219634 () SeekEntryResult!3556)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486016 (= res!289674 (or (= lt!219634 (MissingZero!3556 i!1204)) (= lt!219634 (MissingVacant!3556 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31471 (_ BitVec 32)) SeekEntryResult!3556)

(assert (=> b!486016 (= lt!219634 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!289669 () Bool)

(assert (=> start!44102 (=> (not res!289669) (not e!286072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44102 (= res!289669 (validMask!0 mask!3524))))

(assert (=> start!44102 e!286072))

(assert (=> start!44102 true))

(declare-fun array_inv!10992 (array!31471) Bool)

(assert (=> start!44102 (array_inv!10992 a!3235)))

(declare-fun b!486017 () Bool)

(declare-fun res!289675 () Bool)

(assert (=> b!486017 (=> (not res!289675) (not e!286072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486017 (= res!289675 (validKeyInArray!0 k0!2280))))

(declare-fun b!486018 () Bool)

(declare-fun res!289672 () Bool)

(assert (=> b!486018 (=> (not res!289672) (not e!286072))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486018 (= res!289672 (validKeyInArray!0 (select (arr!15133 a!3235) j!176)))))

(declare-fun b!486019 () Bool)

(declare-fun res!289670 () Bool)

(assert (=> b!486019 (=> (not res!289670) (not e!286072))))

(assert (=> b!486019 (= res!289670 (and (= (size!15497 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15497 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15497 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44102 res!289669) b!486019))

(assert (= (and b!486019 res!289670) b!486018))

(assert (= (and b!486018 res!289672) b!486017))

(assert (= (and b!486017 res!289675) b!486013))

(assert (= (and b!486013 res!289671) b!486016))

(assert (= (and b!486016 res!289674) b!486014))

(assert (= (and b!486014 res!289673) b!486015))

(declare-fun m!466297 () Bool)

(assert (=> b!486013 m!466297))

(declare-fun m!466299 () Bool)

(assert (=> start!44102 m!466299))

(declare-fun m!466301 () Bool)

(assert (=> start!44102 m!466301))

(declare-fun m!466303 () Bool)

(assert (=> b!486016 m!466303))

(declare-fun m!466305 () Bool)

(assert (=> b!486017 m!466305))

(declare-fun m!466307 () Bool)

(assert (=> b!486018 m!466307))

(assert (=> b!486018 m!466307))

(declare-fun m!466309 () Bool)

(assert (=> b!486018 m!466309))

(declare-fun m!466311 () Bool)

(assert (=> b!486014 m!466311))

(check-sat (not b!486013) (not b!486018) (not start!44102) (not b!486016) (not b!486017) (not b!486014))
(check-sat)
(get-model)

(declare-fun b!486070 () Bool)

(declare-fun e!286099 () Bool)

(declare-fun call!31245 () Bool)

(assert (=> b!486070 (= e!286099 call!31245)))

(declare-fun bm!31242 () Bool)

(assert (=> bm!31242 (= call!31245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!486071 () Bool)

(declare-fun e!286100 () Bool)

(assert (=> b!486071 (= e!286100 call!31245)))

(declare-fun d!77491 () Bool)

(declare-fun res!289722 () Bool)

(declare-fun e!286101 () Bool)

(assert (=> d!77491 (=> res!289722 e!286101)))

(assert (=> d!77491 (= res!289722 (bvsge #b00000000000000000000000000000000 (size!15497 a!3235)))))

(assert (=> d!77491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286101)))

(declare-fun b!486072 () Bool)

(assert (=> b!486072 (= e!286100 e!286099)))

(declare-fun lt!219648 () (_ BitVec 64))

(assert (=> b!486072 (= lt!219648 (select (arr!15133 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14153 0))(
  ( (Unit!14154) )
))
(declare-fun lt!219649 () Unit!14153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31471 (_ BitVec 64) (_ BitVec 32)) Unit!14153)

(assert (=> b!486072 (= lt!219649 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219648 #b00000000000000000000000000000000))))

(assert (=> b!486072 (arrayContainsKey!0 a!3235 lt!219648 #b00000000000000000000000000000000)))

(declare-fun lt!219647 () Unit!14153)

(assert (=> b!486072 (= lt!219647 lt!219649)))

(declare-fun res!289723 () Bool)

(assert (=> b!486072 (= res!289723 (= (seekEntryOrOpen!0 (select (arr!15133 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3556 #b00000000000000000000000000000000)))))

(assert (=> b!486072 (=> (not res!289723) (not e!286099))))

(declare-fun b!486073 () Bool)

(assert (=> b!486073 (= e!286101 e!286100)))

(declare-fun c!58442 () Bool)

(assert (=> b!486073 (= c!58442 (validKeyInArray!0 (select (arr!15133 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77491 (not res!289722)) b!486073))

(assert (= (and b!486073 c!58442) b!486072))

(assert (= (and b!486073 (not c!58442)) b!486071))

(assert (= (and b!486072 res!289723) b!486070))

(assert (= (or b!486070 b!486071) bm!31242))

(declare-fun m!466345 () Bool)

(assert (=> bm!31242 m!466345))

(declare-fun m!466347 () Bool)

(assert (=> b!486072 m!466347))

(declare-fun m!466349 () Bool)

(assert (=> b!486072 m!466349))

(declare-fun m!466351 () Bool)

(assert (=> b!486072 m!466351))

(assert (=> b!486072 m!466347))

(declare-fun m!466353 () Bool)

(assert (=> b!486072 m!466353))

(assert (=> b!486073 m!466347))

(assert (=> b!486073 m!466347))

(declare-fun m!466355 () Bool)

(assert (=> b!486073 m!466355))

(assert (=> b!486014 d!77491))

(declare-fun d!77495 () Bool)

(assert (=> d!77495 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44102 d!77495))

(declare-fun d!77507 () Bool)

(assert (=> d!77507 (= (array_inv!10992 a!3235) (bvsge (size!15497 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44102 d!77507))

(declare-fun d!77509 () Bool)

(declare-fun res!289740 () Bool)

(declare-fun e!286118 () Bool)

(assert (=> d!77509 (=> res!289740 e!286118)))

(assert (=> d!77509 (= res!289740 (= (select (arr!15133 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77509 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286118)))

(declare-fun b!486090 () Bool)

(declare-fun e!286119 () Bool)

(assert (=> b!486090 (= e!286118 e!286119)))

(declare-fun res!289741 () Bool)

(assert (=> b!486090 (=> (not res!289741) (not e!286119))))

(assert (=> b!486090 (= res!289741 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15497 a!3235)))))

(declare-fun b!486091 () Bool)

(assert (=> b!486091 (= e!286119 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77509 (not res!289740)) b!486090))

(assert (= (and b!486090 res!289741) b!486091))

(assert (=> d!77509 m!466347))

(declare-fun m!466365 () Bool)

(assert (=> b!486091 m!466365))

(assert (=> b!486013 d!77509))

(declare-fun d!77515 () Bool)

(declare-fun lt!219674 () SeekEntryResult!3556)

(get-info :version)

(assert (=> d!77515 (and (or ((_ is Undefined!3556) lt!219674) (not ((_ is Found!3556) lt!219674)) (and (bvsge (index!16404 lt!219674) #b00000000000000000000000000000000) (bvslt (index!16404 lt!219674) (size!15497 a!3235)))) (or ((_ is Undefined!3556) lt!219674) ((_ is Found!3556) lt!219674) (not ((_ is MissingZero!3556) lt!219674)) (and (bvsge (index!16403 lt!219674) #b00000000000000000000000000000000) (bvslt (index!16403 lt!219674) (size!15497 a!3235)))) (or ((_ is Undefined!3556) lt!219674) ((_ is Found!3556) lt!219674) ((_ is MissingZero!3556) lt!219674) (not ((_ is MissingVacant!3556) lt!219674)) (and (bvsge (index!16406 lt!219674) #b00000000000000000000000000000000) (bvslt (index!16406 lt!219674) (size!15497 a!3235)))) (or ((_ is Undefined!3556) lt!219674) (ite ((_ is Found!3556) lt!219674) (= (select (arr!15133 a!3235) (index!16404 lt!219674)) k0!2280) (ite ((_ is MissingZero!3556) lt!219674) (= (select (arr!15133 a!3235) (index!16403 lt!219674)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3556) lt!219674) (= (select (arr!15133 a!3235) (index!16406 lt!219674)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286146 () SeekEntryResult!3556)

(assert (=> d!77515 (= lt!219674 e!286146)))

(declare-fun c!58463 () Bool)

(declare-fun lt!219675 () SeekEntryResult!3556)

(assert (=> d!77515 (= c!58463 (and ((_ is Intermediate!3556) lt!219675) (undefined!4368 lt!219675)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31471 (_ BitVec 32)) SeekEntryResult!3556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77515 (= lt!219675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77515 (validMask!0 mask!3524)))

(assert (=> d!77515 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!219674)))

(declare-fun b!486134 () Bool)

(assert (=> b!486134 (= e!286146 Undefined!3556)))

(declare-fun b!486135 () Bool)

(declare-fun e!286145 () SeekEntryResult!3556)

(assert (=> b!486135 (= e!286145 (Found!3556 (index!16405 lt!219675)))))

(declare-fun b!486136 () Bool)

(declare-fun e!286144 () SeekEntryResult!3556)

(assert (=> b!486136 (= e!286144 (MissingZero!3556 (index!16405 lt!219675)))))

(declare-fun b!486137 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31471 (_ BitVec 32)) SeekEntryResult!3556)

(assert (=> b!486137 (= e!286144 (seekKeyOrZeroReturnVacant!0 (x!45685 lt!219675) (index!16405 lt!219675) (index!16405 lt!219675) k0!2280 a!3235 mask!3524))))

(declare-fun b!486138 () Bool)

(declare-fun c!58462 () Bool)

(declare-fun lt!219676 () (_ BitVec 64))

(assert (=> b!486138 (= c!58462 (= lt!219676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486138 (= e!286145 e!286144)))

(declare-fun b!486139 () Bool)

(assert (=> b!486139 (= e!286146 e!286145)))

(assert (=> b!486139 (= lt!219676 (select (arr!15133 a!3235) (index!16405 lt!219675)))))

(declare-fun c!58461 () Bool)

(assert (=> b!486139 (= c!58461 (= lt!219676 k0!2280))))

(assert (= (and d!77515 c!58463) b!486134))

(assert (= (and d!77515 (not c!58463)) b!486139))

(assert (= (and b!486139 c!58461) b!486135))

(assert (= (and b!486139 (not c!58461)) b!486138))

(assert (= (and b!486138 c!58462) b!486136))

(assert (= (and b!486138 (not c!58462)) b!486137))

(declare-fun m!466391 () Bool)

(assert (=> d!77515 m!466391))

(declare-fun m!466393 () Bool)

(assert (=> d!77515 m!466393))

(declare-fun m!466395 () Bool)

(assert (=> d!77515 m!466395))

(assert (=> d!77515 m!466299))

(declare-fun m!466397 () Bool)

(assert (=> d!77515 m!466397))

(assert (=> d!77515 m!466397))

(declare-fun m!466399 () Bool)

(assert (=> d!77515 m!466399))

(declare-fun m!466401 () Bool)

(assert (=> b!486137 m!466401))

(declare-fun m!466403 () Bool)

(assert (=> b!486139 m!466403))

(assert (=> b!486016 d!77515))

(declare-fun d!77525 () Bool)

(assert (=> d!77525 (= (validKeyInArray!0 (select (arr!15133 a!3235) j!176)) (and (not (= (select (arr!15133 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15133 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486018 d!77525))

(declare-fun d!77527 () Bool)

(assert (=> d!77527 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486017 d!77527))

(check-sat (not b!486072) (not bm!31242) (not b!486137) (not d!77515) (not b!486073) (not b!486091))
(check-sat)
