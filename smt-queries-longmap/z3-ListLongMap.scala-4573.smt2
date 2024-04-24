; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63798 () Bool)

(assert start!63798)

(declare-fun b!717640 () Bool)

(declare-fun e!402945 () Bool)

(declare-datatypes ((array!40627 0))(
  ( (array!40628 (arr!19444 (Array (_ BitVec 32) (_ BitVec 64))) (size!19864 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40627)

(assert (=> b!717640 (= e!402945 (and (bvsle #b00000000000000000000000000000000 (size!19864 a!3186)) (bvsge (size!19864 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717641 () Bool)

(declare-fun res!480280 () Bool)

(declare-fun e!402944 () Bool)

(assert (=> b!717641 (=> (not res!480280) (not e!402944))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717641 (= res!480280 (validKeyInArray!0 k0!2102))))

(declare-fun b!717642 () Bool)

(declare-fun res!480279 () Bool)

(assert (=> b!717642 (=> (not res!480279) (not e!402945))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40627 (_ BitVec 32)) Bool)

(assert (=> b!717642 (= res!480279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!717643 () Bool)

(declare-fun res!480277 () Bool)

(assert (=> b!717643 (=> (not res!480277) (not e!402944))))

(declare-fun arrayContainsKey!0 (array!40627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717643 (= res!480277 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717644 () Bool)

(assert (=> b!717644 (= e!402944 e!402945)))

(declare-fun res!480283 () Bool)

(assert (=> b!717644 (=> (not res!480283) (not e!402945))))

(declare-datatypes ((SeekEntryResult!7000 0))(
  ( (MissingZero!7000 (index!30368 (_ BitVec 32))) (Found!7000 (index!30369 (_ BitVec 32))) (Intermediate!7000 (undefined!7812 Bool) (index!30370 (_ BitVec 32)) (x!61543 (_ BitVec 32))) (Undefined!7000) (MissingVacant!7000 (index!30371 (_ BitVec 32))) )
))
(declare-fun lt!319170 () SeekEntryResult!7000)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717644 (= res!480283 (or (= lt!319170 (MissingZero!7000 i!1173)) (= lt!319170 (MissingVacant!7000 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40627 (_ BitVec 32)) SeekEntryResult!7000)

(assert (=> b!717644 (= lt!319170 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!480281 () Bool)

(assert (=> start!63798 (=> (not res!480281) (not e!402944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63798 (= res!480281 (validMask!0 mask!3328))))

(assert (=> start!63798 e!402944))

(declare-fun array_inv!15303 (array!40627) Bool)

(assert (=> start!63798 (array_inv!15303 a!3186)))

(assert (=> start!63798 true))

(declare-fun b!717645 () Bool)

(declare-fun res!480282 () Bool)

(assert (=> b!717645 (=> (not res!480282) (not e!402944))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!717645 (= res!480282 (and (= (size!19864 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19864 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19864 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717646 () Bool)

(declare-fun res!480278 () Bool)

(assert (=> b!717646 (=> (not res!480278) (not e!402944))))

(assert (=> b!717646 (= res!480278 (validKeyInArray!0 (select (arr!19444 a!3186) j!159)))))

(assert (= (and start!63798 res!480281) b!717645))

(assert (= (and b!717645 res!480282) b!717646))

(assert (= (and b!717646 res!480278) b!717641))

(assert (= (and b!717641 res!480280) b!717643))

(assert (= (and b!717643 res!480277) b!717644))

(assert (= (and b!717644 res!480283) b!717642))

(assert (= (and b!717642 res!480279) b!717640))

(declare-fun m!674091 () Bool)

(assert (=> b!717646 m!674091))

(assert (=> b!717646 m!674091))

(declare-fun m!674093 () Bool)

(assert (=> b!717646 m!674093))

(declare-fun m!674095 () Bool)

(assert (=> b!717643 m!674095))

(declare-fun m!674097 () Bool)

(assert (=> start!63798 m!674097))

(declare-fun m!674099 () Bool)

(assert (=> start!63798 m!674099))

(declare-fun m!674101 () Bool)

(assert (=> b!717642 m!674101))

(declare-fun m!674103 () Bool)

(assert (=> b!717644 m!674103))

(declare-fun m!674105 () Bool)

(assert (=> b!717641 m!674105))

(check-sat (not b!717646) (not b!717642) (not b!717644) (not b!717641) (not b!717643) (not start!63798))
(check-sat)
(get-model)

(declare-fun d!98991 () Bool)

(assert (=> d!98991 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717641 d!98991))

(declare-fun b!717703 () Bool)

(declare-fun e!402978 () Bool)

(declare-fun call!34698 () Bool)

(assert (=> b!717703 (= e!402978 call!34698)))

(declare-fun bm!34695 () Bool)

(assert (=> bm!34695 (= call!34698 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717704 () Bool)

(declare-fun e!402976 () Bool)

(assert (=> b!717704 (= e!402976 call!34698)))

(declare-fun b!717705 () Bool)

(assert (=> b!717705 (= e!402978 e!402976)))

(declare-fun lt!319183 () (_ BitVec 64))

(assert (=> b!717705 (= lt!319183 (select (arr!19444 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24621 0))(
  ( (Unit!24622) )
))
(declare-fun lt!319184 () Unit!24621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40627 (_ BitVec 64) (_ BitVec 32)) Unit!24621)

(assert (=> b!717705 (= lt!319184 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319183 #b00000000000000000000000000000000))))

(assert (=> b!717705 (arrayContainsKey!0 a!3186 lt!319183 #b00000000000000000000000000000000)))

(declare-fun lt!319185 () Unit!24621)

(assert (=> b!717705 (= lt!319185 lt!319184)))

(declare-fun res!480337 () Bool)

(assert (=> b!717705 (= res!480337 (= (seekEntryOrOpen!0 (select (arr!19444 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7000 #b00000000000000000000000000000000)))))

(assert (=> b!717705 (=> (not res!480337) (not e!402976))))

(declare-fun d!98993 () Bool)

(declare-fun res!480336 () Bool)

(declare-fun e!402977 () Bool)

(assert (=> d!98993 (=> res!480336 e!402977)))

(assert (=> d!98993 (= res!480336 (bvsge #b00000000000000000000000000000000 (size!19864 a!3186)))))

(assert (=> d!98993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402977)))

(declare-fun b!717706 () Bool)

(assert (=> b!717706 (= e!402977 e!402978)))

(declare-fun c!79052 () Bool)

(assert (=> b!717706 (= c!79052 (validKeyInArray!0 (select (arr!19444 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!98993 (not res!480336)) b!717706))

(assert (= (and b!717706 c!79052) b!717705))

(assert (= (and b!717706 (not c!79052)) b!717703))

(assert (= (and b!717705 res!480337) b!717704))

(assert (= (or b!717704 b!717703) bm!34695))

(declare-fun m!674143 () Bool)

(assert (=> bm!34695 m!674143))

(declare-fun m!674145 () Bool)

(assert (=> b!717705 m!674145))

(declare-fun m!674147 () Bool)

(assert (=> b!717705 m!674147))

(declare-fun m!674149 () Bool)

(assert (=> b!717705 m!674149))

(assert (=> b!717705 m!674145))

(declare-fun m!674151 () Bool)

(assert (=> b!717705 m!674151))

(assert (=> b!717706 m!674145))

(assert (=> b!717706 m!674145))

(declare-fun m!674153 () Bool)

(assert (=> b!717706 m!674153))

(assert (=> b!717642 d!98993))

(declare-fun d!99003 () Bool)

(assert (=> d!99003 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63798 d!99003))

(declare-fun d!99013 () Bool)

(assert (=> d!99013 (= (array_inv!15303 a!3186) (bvsge (size!19864 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63798 d!99013))

(declare-fun d!99015 () Bool)

(assert (=> d!99015 (= (validKeyInArray!0 (select (arr!19444 a!3186) j!159)) (and (not (= (select (arr!19444 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19444 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717646 d!99015))

(declare-fun d!99017 () Bool)

(declare-fun lt!319230 () SeekEntryResult!7000)

(get-info :version)

(assert (=> d!99017 (and (or ((_ is Undefined!7000) lt!319230) (not ((_ is Found!7000) lt!319230)) (and (bvsge (index!30369 lt!319230) #b00000000000000000000000000000000) (bvslt (index!30369 lt!319230) (size!19864 a!3186)))) (or ((_ is Undefined!7000) lt!319230) ((_ is Found!7000) lt!319230) (not ((_ is MissingZero!7000) lt!319230)) (and (bvsge (index!30368 lt!319230) #b00000000000000000000000000000000) (bvslt (index!30368 lt!319230) (size!19864 a!3186)))) (or ((_ is Undefined!7000) lt!319230) ((_ is Found!7000) lt!319230) ((_ is MissingZero!7000) lt!319230) (not ((_ is MissingVacant!7000) lt!319230)) (and (bvsge (index!30371 lt!319230) #b00000000000000000000000000000000) (bvslt (index!30371 lt!319230) (size!19864 a!3186)))) (or ((_ is Undefined!7000) lt!319230) (ite ((_ is Found!7000) lt!319230) (= (select (arr!19444 a!3186) (index!30369 lt!319230)) k0!2102) (ite ((_ is MissingZero!7000) lt!319230) (= (select (arr!19444 a!3186) (index!30368 lt!319230)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7000) lt!319230) (= (select (arr!19444 a!3186) (index!30371 lt!319230)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!403026 () SeekEntryResult!7000)

(assert (=> d!99017 (= lt!319230 e!403026)))

(declare-fun c!79084 () Bool)

(declare-fun lt!319228 () SeekEntryResult!7000)

(assert (=> d!99017 (= c!79084 (and ((_ is Intermediate!7000) lt!319228) (undefined!7812 lt!319228)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40627 (_ BitVec 32)) SeekEntryResult!7000)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99017 (= lt!319228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99017 (validMask!0 mask!3328)))

(assert (=> d!99017 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319230)))

(declare-fun b!717783 () Bool)

(assert (=> b!717783 (= e!403026 Undefined!7000)))

(declare-fun b!717784 () Bool)

(declare-fun e!403025 () SeekEntryResult!7000)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40627 (_ BitVec 32)) SeekEntryResult!7000)

(assert (=> b!717784 (= e!403025 (seekKeyOrZeroReturnVacant!0 (x!61543 lt!319228) (index!30370 lt!319228) (index!30370 lt!319228) k0!2102 a!3186 mask!3328))))

(declare-fun b!717785 () Bool)

(declare-fun e!403027 () SeekEntryResult!7000)

(assert (=> b!717785 (= e!403026 e!403027)))

(declare-fun lt!319229 () (_ BitVec 64))

(assert (=> b!717785 (= lt!319229 (select (arr!19444 a!3186) (index!30370 lt!319228)))))

(declare-fun c!79083 () Bool)

(assert (=> b!717785 (= c!79083 (= lt!319229 k0!2102))))

(declare-fun b!717786 () Bool)

(assert (=> b!717786 (= e!403025 (MissingZero!7000 (index!30370 lt!319228)))))

(declare-fun b!717787 () Bool)

(assert (=> b!717787 (= e!403027 (Found!7000 (index!30370 lt!319228)))))

(declare-fun b!717788 () Bool)

(declare-fun c!79085 () Bool)

(assert (=> b!717788 (= c!79085 (= lt!319229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!717788 (= e!403027 e!403025)))

(assert (= (and d!99017 c!79084) b!717783))

(assert (= (and d!99017 (not c!79084)) b!717785))

(assert (= (and b!717785 c!79083) b!717787))

(assert (= (and b!717785 (not c!79083)) b!717788))

(assert (= (and b!717788 c!79085) b!717786))

(assert (= (and b!717788 (not c!79085)) b!717784))

(declare-fun m!674205 () Bool)

(assert (=> d!99017 m!674205))

(declare-fun m!674207 () Bool)

(assert (=> d!99017 m!674207))

(assert (=> d!99017 m!674207))

(declare-fun m!674209 () Bool)

(assert (=> d!99017 m!674209))

(assert (=> d!99017 m!674097))

(declare-fun m!674211 () Bool)

(assert (=> d!99017 m!674211))

(declare-fun m!674213 () Bool)

(assert (=> d!99017 m!674213))

(declare-fun m!674215 () Bool)

(assert (=> b!717784 m!674215))

(declare-fun m!674217 () Bool)

(assert (=> b!717785 m!674217))

(assert (=> b!717644 d!99017))

(declare-fun d!99025 () Bool)

(declare-fun res!480360 () Bool)

(declare-fun e!403034 () Bool)

(assert (=> d!99025 (=> res!480360 e!403034)))

(assert (=> d!99025 (= res!480360 (= (select (arr!19444 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99025 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!403034)))

(declare-fun b!717795 () Bool)

(declare-fun e!403035 () Bool)

(assert (=> b!717795 (= e!403034 e!403035)))

(declare-fun res!480361 () Bool)

(assert (=> b!717795 (=> (not res!480361) (not e!403035))))

(assert (=> b!717795 (= res!480361 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19864 a!3186)))))

(declare-fun b!717796 () Bool)

(assert (=> b!717796 (= e!403035 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99025 (not res!480360)) b!717795))

(assert (= (and b!717795 res!480361) b!717796))

(assert (=> d!99025 m!674145))

(declare-fun m!674221 () Bool)

(assert (=> b!717796 m!674221))

(assert (=> b!717643 d!99025))

(check-sat (not b!717705) (not d!99017) (not bm!34695) (not b!717796) (not b!717706) (not b!717784))
(check-sat)
