; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63780 () Bool)

(assert start!63780)

(declare-fun res!480225 () Bool)

(declare-fun e!402827 () Bool)

(assert (=> start!63780 (=> (not res!480225) (not e!402827))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63780 (= res!480225 (validMask!0 mask!3328))))

(assert (=> start!63780 e!402827))

(declare-datatypes ((array!40643 0))(
  ( (array!40644 (arr!19453 (Array (_ BitVec 32) (_ BitVec 64))) (size!19874 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40643)

(declare-fun array_inv!15249 (array!40643) Bool)

(assert (=> start!63780 (array_inv!15249 a!3186)))

(assert (=> start!63780 true))

(declare-fun b!717509 () Bool)

(declare-fun e!402825 () Bool)

(assert (=> b!717509 (= e!402827 e!402825)))

(declare-fun res!480226 () Bool)

(assert (=> b!717509 (=> (not res!480226) (not e!402825))))

(declare-datatypes ((SeekEntryResult!7053 0))(
  ( (MissingZero!7053 (index!30580 (_ BitVec 32))) (Found!7053 (index!30581 (_ BitVec 32))) (Intermediate!7053 (undefined!7865 Bool) (index!30582 (_ BitVec 32)) (x!61601 (_ BitVec 32))) (Undefined!7053) (MissingVacant!7053 (index!30583 (_ BitVec 32))) )
))
(declare-fun lt!319106 () SeekEntryResult!7053)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717509 (= res!480226 (or (= lt!319106 (MissingZero!7053 i!1173)) (= lt!319106 (MissingVacant!7053 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40643 (_ BitVec 32)) SeekEntryResult!7053)

(assert (=> b!717509 (= lt!319106 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717510 () Bool)

(declare-fun res!480223 () Bool)

(assert (=> b!717510 (=> (not res!480223) (not e!402827))))

(declare-fun arrayContainsKey!0 (array!40643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717510 (= res!480223 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717511 () Bool)

(declare-fun res!480230 () Bool)

(assert (=> b!717511 (=> (not res!480230) (not e!402827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717511 (= res!480230 (validKeyInArray!0 k0!2102))))

(declare-fun b!717512 () Bool)

(declare-fun res!480228 () Bool)

(assert (=> b!717512 (=> (not res!480228) (not e!402825))))

(assert (=> b!717512 (= res!480228 (and (bvsle #b00000000000000000000000000000000 (size!19874 a!3186)) (bvslt (size!19874 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717513 () Bool)

(declare-fun res!480227 () Bool)

(assert (=> b!717513 (=> (not res!480227) (not e!402827))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717513 (= res!480227 (validKeyInArray!0 (select (arr!19453 a!3186) j!159)))))

(declare-fun b!717514 () Bool)

(declare-fun res!480229 () Bool)

(assert (=> b!717514 (=> (not res!480229) (not e!402825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40643 (_ BitVec 32)) Bool)

(assert (=> b!717514 (= res!480229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717515 () Bool)

(declare-datatypes ((List!13455 0))(
  ( (Nil!13452) (Cons!13451 (h!14496 (_ BitVec 64)) (t!19770 List!13455)) )
))
(declare-fun noDuplicate!1279 (List!13455) Bool)

(assert (=> b!717515 (= e!402825 (not (noDuplicate!1279 Nil!13452)))))

(declare-fun b!717516 () Bool)

(declare-fun res!480224 () Bool)

(assert (=> b!717516 (=> (not res!480224) (not e!402827))))

(assert (=> b!717516 (= res!480224 (and (= (size!19874 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19874 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19874 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63780 res!480225) b!717516))

(assert (= (and b!717516 res!480224) b!717513))

(assert (= (and b!717513 res!480227) b!717511))

(assert (= (and b!717511 res!480230) b!717510))

(assert (= (and b!717510 res!480223) b!717509))

(assert (= (and b!717509 res!480226) b!717514))

(assert (= (and b!717514 res!480229) b!717512))

(assert (= (and b!717512 res!480228) b!717515))

(declare-fun m!673393 () Bool)

(assert (=> b!717510 m!673393))

(declare-fun m!673395 () Bool)

(assert (=> b!717509 m!673395))

(declare-fun m!673397 () Bool)

(assert (=> b!717515 m!673397))

(declare-fun m!673399 () Bool)

(assert (=> b!717514 m!673399))

(declare-fun m!673401 () Bool)

(assert (=> start!63780 m!673401))

(declare-fun m!673403 () Bool)

(assert (=> start!63780 m!673403))

(declare-fun m!673405 () Bool)

(assert (=> b!717513 m!673405))

(assert (=> b!717513 m!673405))

(declare-fun m!673407 () Bool)

(assert (=> b!717513 m!673407))

(declare-fun m!673409 () Bool)

(assert (=> b!717511 m!673409))

(check-sat (not b!717510) (not b!717509) (not b!717515) (not b!717511) (not b!717513) (not start!63780) (not b!717514))
(check-sat)
(get-model)

(declare-fun d!98851 () Bool)

(assert (=> d!98851 (= (validKeyInArray!0 (select (arr!19453 a!3186) j!159)) (and (not (= (select (arr!19453 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19453 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717513 d!98851))

(declare-fun d!98855 () Bool)

(assert (=> d!98855 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63780 d!98855))

(declare-fun d!98861 () Bool)

(assert (=> d!98861 (= (array_inv!15249 a!3186) (bvsge (size!19874 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63780 d!98861))

(declare-fun b!717631 () Bool)

(declare-fun e!402897 () SeekEntryResult!7053)

(declare-fun e!402899 () SeekEntryResult!7053)

(assert (=> b!717631 (= e!402897 e!402899)))

(declare-fun lt!319154 () (_ BitVec 64))

(declare-fun lt!319152 () SeekEntryResult!7053)

(assert (=> b!717631 (= lt!319154 (select (arr!19453 a!3186) (index!30582 lt!319152)))))

(declare-fun c!79040 () Bool)

(assert (=> b!717631 (= c!79040 (= lt!319154 k0!2102))))

(declare-fun d!98863 () Bool)

(declare-fun lt!319153 () SeekEntryResult!7053)

(get-info :version)

(assert (=> d!98863 (and (or ((_ is Undefined!7053) lt!319153) (not ((_ is Found!7053) lt!319153)) (and (bvsge (index!30581 lt!319153) #b00000000000000000000000000000000) (bvslt (index!30581 lt!319153) (size!19874 a!3186)))) (or ((_ is Undefined!7053) lt!319153) ((_ is Found!7053) lt!319153) (not ((_ is MissingZero!7053) lt!319153)) (and (bvsge (index!30580 lt!319153) #b00000000000000000000000000000000) (bvslt (index!30580 lt!319153) (size!19874 a!3186)))) (or ((_ is Undefined!7053) lt!319153) ((_ is Found!7053) lt!319153) ((_ is MissingZero!7053) lt!319153) (not ((_ is MissingVacant!7053) lt!319153)) (and (bvsge (index!30583 lt!319153) #b00000000000000000000000000000000) (bvslt (index!30583 lt!319153) (size!19874 a!3186)))) (or ((_ is Undefined!7053) lt!319153) (ite ((_ is Found!7053) lt!319153) (= (select (arr!19453 a!3186) (index!30581 lt!319153)) k0!2102) (ite ((_ is MissingZero!7053) lt!319153) (= (select (arr!19453 a!3186) (index!30580 lt!319153)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7053) lt!319153) (= (select (arr!19453 a!3186) (index!30583 lt!319153)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98863 (= lt!319153 e!402897)))

(declare-fun c!79041 () Bool)

(assert (=> d!98863 (= c!79041 (and ((_ is Intermediate!7053) lt!319152) (undefined!7865 lt!319152)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40643 (_ BitVec 32)) SeekEntryResult!7053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98863 (= lt!319152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!98863 (validMask!0 mask!3328)))

(assert (=> d!98863 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319153)))

(declare-fun b!717632 () Bool)

(assert (=> b!717632 (= e!402899 (Found!7053 (index!30582 lt!319152)))))

(declare-fun b!717633 () Bool)

(declare-fun c!79042 () Bool)

(assert (=> b!717633 (= c!79042 (= lt!319154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402898 () SeekEntryResult!7053)

(assert (=> b!717633 (= e!402899 e!402898)))

(declare-fun b!717634 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40643 (_ BitVec 32)) SeekEntryResult!7053)

(assert (=> b!717634 (= e!402898 (seekKeyOrZeroReturnVacant!0 (x!61601 lt!319152) (index!30582 lt!319152) (index!30582 lt!319152) k0!2102 a!3186 mask!3328))))

(declare-fun b!717635 () Bool)

(assert (=> b!717635 (= e!402897 Undefined!7053)))

(declare-fun b!717636 () Bool)

(assert (=> b!717636 (= e!402898 (MissingZero!7053 (index!30582 lt!319152)))))

(assert (= (and d!98863 c!79041) b!717635))

(assert (= (and d!98863 (not c!79041)) b!717631))

(assert (= (and b!717631 c!79040) b!717632))

(assert (= (and b!717631 (not c!79040)) b!717633))

(assert (= (and b!717633 c!79042) b!717636))

(assert (= (and b!717633 (not c!79042)) b!717634))

(declare-fun m!673489 () Bool)

(assert (=> b!717631 m!673489))

(assert (=> d!98863 m!673401))

(declare-fun m!673491 () Bool)

(assert (=> d!98863 m!673491))

(declare-fun m!673493 () Bool)

(assert (=> d!98863 m!673493))

(declare-fun m!673495 () Bool)

(assert (=> d!98863 m!673495))

(declare-fun m!673497 () Bool)

(assert (=> d!98863 m!673497))

(declare-fun m!673499 () Bool)

(assert (=> d!98863 m!673499))

(assert (=> d!98863 m!673491))

(declare-fun m!673501 () Bool)

(assert (=> b!717634 m!673501))

(assert (=> b!717509 d!98863))

(declare-fun bm!34701 () Bool)

(declare-fun call!34704 () Bool)

(assert (=> bm!34701 (= call!34704 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717645 () Bool)

(declare-fun e!402906 () Bool)

(declare-fun e!402907 () Bool)

(assert (=> b!717645 (= e!402906 e!402907)))

(declare-fun lt!319162 () (_ BitVec 64))

(assert (=> b!717645 (= lt!319162 (select (arr!19453 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24652 0))(
  ( (Unit!24653) )
))
(declare-fun lt!319161 () Unit!24652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40643 (_ BitVec 64) (_ BitVec 32)) Unit!24652)

(assert (=> b!717645 (= lt!319161 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319162 #b00000000000000000000000000000000))))

(assert (=> b!717645 (arrayContainsKey!0 a!3186 lt!319162 #b00000000000000000000000000000000)))

(declare-fun lt!319163 () Unit!24652)

(assert (=> b!717645 (= lt!319163 lt!319161)))

(declare-fun res!480290 () Bool)

(assert (=> b!717645 (= res!480290 (= (seekEntryOrOpen!0 (select (arr!19453 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7053 #b00000000000000000000000000000000)))))

(assert (=> b!717645 (=> (not res!480290) (not e!402907))))

(declare-fun b!717646 () Bool)

(declare-fun e!402908 () Bool)

