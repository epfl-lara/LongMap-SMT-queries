; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30460 () Bool)

(assert start!30460)

(declare-fun b!305025 () Bool)

(declare-fun e!191598 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150586 () (_ BitVec 32))

(assert (=> b!305025 (= e!191598 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!150586 #b00000000000000000000000000000000) (bvslt lt!150586 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(declare-datatypes ((array!15515 0))(
  ( (array!15516 (arr!7344 (Array (_ BitVec 32) (_ BitVec 64))) (size!7696 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15515)

(declare-datatypes ((SeekEntryResult!2484 0))(
  ( (MissingZero!2484 (index!12112 (_ BitVec 32))) (Found!2484 (index!12113 (_ BitVec 32))) (Intermediate!2484 (undefined!3296 Bool) (index!12114 (_ BitVec 32)) (x!30366 (_ BitVec 32))) (Undefined!2484) (MissingVacant!2484 (index!12115 (_ BitVec 32))) )
))
(declare-fun lt!150588 () SeekEntryResult!2484)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15515 (_ BitVec 32)) SeekEntryResult!2484)

(assert (=> b!305025 (= lt!150588 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150586 k0!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305025 (= lt!150586 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!305026 () Bool)

(declare-fun res!162373 () Bool)

(declare-fun e!191597 () Bool)

(assert (=> b!305026 (=> (not res!162373) (not e!191597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15515 (_ BitVec 32)) Bool)

(assert (=> b!305026 (= res!162373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305027 () Bool)

(declare-fun res!162374 () Bool)

(assert (=> b!305027 (=> (not res!162374) (not e!191597))))

(declare-fun arrayContainsKey!0 (array!15515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305027 (= res!162374 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!162372 () Bool)

(assert (=> start!30460 (=> (not res!162372) (not e!191597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30460 (= res!162372 (validMask!0 mask!3709))))

(assert (=> start!30460 e!191597))

(declare-fun array_inv!5307 (array!15515) Bool)

(assert (=> start!30460 (array_inv!5307 a!3293)))

(assert (=> start!30460 true))

(declare-fun b!305028 () Bool)

(declare-fun res!162370 () Bool)

(assert (=> b!305028 (=> (not res!162370) (not e!191597))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15515 (_ BitVec 32)) SeekEntryResult!2484)

(assert (=> b!305028 (= res!162370 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2484 i!1240)))))

(declare-fun b!305029 () Bool)

(declare-fun res!162371 () Bool)

(declare-fun e!191599 () Bool)

(assert (=> b!305029 (=> (not res!162371) (not e!191599))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305029 (= res!162371 (and (= (select (arr!7344 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7696 a!3293))))))

(declare-fun b!305030 () Bool)

(assert (=> b!305030 (= e!191597 e!191599)))

(declare-fun res!162376 () Bool)

(assert (=> b!305030 (=> (not res!162376) (not e!191599))))

(declare-fun lt!150587 () SeekEntryResult!2484)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305030 (= res!162376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150587))))

(assert (=> b!305030 (= lt!150587 (Intermediate!2484 false resIndex!52 resX!52))))

(declare-fun b!305031 () Bool)

(declare-fun res!162378 () Bool)

(assert (=> b!305031 (=> (not res!162378) (not e!191597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305031 (= res!162378 (validKeyInArray!0 k0!2441))))

(declare-fun b!305032 () Bool)

(declare-fun res!162375 () Bool)

(assert (=> b!305032 (=> (not res!162375) (not e!191597))))

(assert (=> b!305032 (= res!162375 (and (= (size!7696 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7696 a!3293))))))

(declare-fun b!305033 () Bool)

(assert (=> b!305033 (= e!191599 e!191598)))

(declare-fun res!162377 () Bool)

(assert (=> b!305033 (=> (not res!162377) (not e!191598))))

(assert (=> b!305033 (= res!162377 (and (= lt!150588 lt!150587) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7344 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7344 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7344 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305033 (= lt!150588 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30460 res!162372) b!305032))

(assert (= (and b!305032 res!162375) b!305031))

(assert (= (and b!305031 res!162378) b!305027))

(assert (= (and b!305027 res!162374) b!305028))

(assert (= (and b!305028 res!162370) b!305026))

(assert (= (and b!305026 res!162373) b!305030))

(assert (= (and b!305030 res!162376) b!305029))

(assert (= (and b!305029 res!162371) b!305033))

(assert (= (and b!305033 res!162377) b!305025))

(declare-fun m!316099 () Bool)

(assert (=> b!305027 m!316099))

(declare-fun m!316101 () Bool)

(assert (=> start!30460 m!316101))

(declare-fun m!316103 () Bool)

(assert (=> start!30460 m!316103))

(declare-fun m!316105 () Bool)

(assert (=> b!305031 m!316105))

(declare-fun m!316107 () Bool)

(assert (=> b!305026 m!316107))

(declare-fun m!316109 () Bool)

(assert (=> b!305030 m!316109))

(assert (=> b!305030 m!316109))

(declare-fun m!316111 () Bool)

(assert (=> b!305030 m!316111))

(declare-fun m!316113 () Bool)

(assert (=> b!305029 m!316113))

(declare-fun m!316115 () Bool)

(assert (=> b!305028 m!316115))

(declare-fun m!316117 () Bool)

(assert (=> b!305033 m!316117))

(declare-fun m!316119 () Bool)

(assert (=> b!305033 m!316119))

(declare-fun m!316121 () Bool)

(assert (=> b!305025 m!316121))

(declare-fun m!316123 () Bool)

(assert (=> b!305025 m!316123))

(check-sat (not start!30460) (not b!305027) (not b!305026) (not b!305033) (not b!305028) (not b!305030) (not b!305025) (not b!305031))
(check-sat)
(get-model)

(declare-fun b!305079 () Bool)

(declare-fun e!191623 () SeekEntryResult!2484)

(assert (=> b!305079 (= e!191623 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!305080 () Bool)

(declare-fun e!191626 () Bool)

(declare-fun e!191625 () Bool)

(assert (=> b!305080 (= e!191626 e!191625)))

(declare-fun res!162412 () Bool)

(declare-fun lt!150602 () SeekEntryResult!2484)

(get-info :version)

(assert (=> b!305080 (= res!162412 (and ((_ is Intermediate!2484) lt!150602) (not (undefined!3296 lt!150602)) (bvslt (x!30366 lt!150602) #b01111111111111111111111111111110) (bvsge (x!30366 lt!150602) #b00000000000000000000000000000000) (bvsge (x!30366 lt!150602) x!1427)))))

(assert (=> b!305080 (=> (not res!162412) (not e!191625))))

(declare-fun d!68131 () Bool)

(assert (=> d!68131 e!191626))

(declare-fun c!48935 () Bool)

(assert (=> d!68131 (= c!48935 (and ((_ is Intermediate!2484) lt!150602) (undefined!3296 lt!150602)))))

(declare-fun e!191624 () SeekEntryResult!2484)

(assert (=> d!68131 (= lt!150602 e!191624)))

(declare-fun c!48936 () Bool)

(assert (=> d!68131 (= c!48936 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!150603 () (_ BitVec 64))

(assert (=> d!68131 (= lt!150603 (select (arr!7344 a!3293) index!1781))))

(assert (=> d!68131 (validMask!0 mask!3709)))

(assert (=> d!68131 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150602)))

(declare-fun b!305081 () Bool)

(assert (=> b!305081 (= e!191623 (Intermediate!2484 false index!1781 x!1427))))

(declare-fun b!305082 () Bool)

(assert (=> b!305082 (= e!191626 (bvsge (x!30366 lt!150602) #b01111111111111111111111111111110))))

(declare-fun b!305083 () Bool)

(assert (=> b!305083 (= e!191624 e!191623)))

(declare-fun c!48934 () Bool)

(assert (=> b!305083 (= c!48934 (or (= lt!150603 k0!2441) (= (bvadd lt!150603 lt!150603) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305084 () Bool)

(assert (=> b!305084 (and (bvsge (index!12114 lt!150602) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150602) (size!7696 a!3293)))))

(declare-fun e!191622 () Bool)

(assert (=> b!305084 (= e!191622 (= (select (arr!7344 a!3293) (index!12114 lt!150602)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!305085 () Bool)

(assert (=> b!305085 (and (bvsge (index!12114 lt!150602) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150602) (size!7696 a!3293)))))

(declare-fun res!162414 () Bool)

(assert (=> b!305085 (= res!162414 (= (select (arr!7344 a!3293) (index!12114 lt!150602)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305085 (=> res!162414 e!191622)))

(declare-fun b!305086 () Bool)

(assert (=> b!305086 (and (bvsge (index!12114 lt!150602) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150602) (size!7696 a!3293)))))

(declare-fun res!162413 () Bool)

(assert (=> b!305086 (= res!162413 (= (select (arr!7344 a!3293) (index!12114 lt!150602)) k0!2441))))

(assert (=> b!305086 (=> res!162413 e!191622)))

(assert (=> b!305086 (= e!191625 e!191622)))

(declare-fun b!305087 () Bool)

(assert (=> b!305087 (= e!191624 (Intermediate!2484 true index!1781 x!1427))))

(assert (= (and d!68131 c!48936) b!305087))

(assert (= (and d!68131 (not c!48936)) b!305083))

(assert (= (and b!305083 c!48934) b!305081))

(assert (= (and b!305083 (not c!48934)) b!305079))

(assert (= (and d!68131 c!48935) b!305082))

(assert (= (and d!68131 (not c!48935)) b!305080))

(assert (= (and b!305080 res!162412) b!305086))

(assert (= (and b!305086 (not res!162413)) b!305085))

(assert (= (and b!305085 (not res!162414)) b!305084))

(declare-fun m!316151 () Bool)

(assert (=> b!305084 m!316151))

(assert (=> d!68131 m!316117))

(assert (=> d!68131 m!316101))

(assert (=> b!305085 m!316151))

(assert (=> b!305079 m!316123))

(assert (=> b!305079 m!316123))

(declare-fun m!316153 () Bool)

(assert (=> b!305079 m!316153))

(assert (=> b!305086 m!316151))

(assert (=> b!305033 d!68131))

(declare-fun b!305145 () Bool)

(declare-fun e!191658 () SeekEntryResult!2484)

(declare-fun lt!150628 () SeekEntryResult!2484)

(assert (=> b!305145 (= e!191658 (MissingZero!2484 (index!12114 lt!150628)))))

(declare-fun d!68135 () Bool)

(declare-fun lt!150626 () SeekEntryResult!2484)

(assert (=> d!68135 (and (or ((_ is Undefined!2484) lt!150626) (not ((_ is Found!2484) lt!150626)) (and (bvsge (index!12113 lt!150626) #b00000000000000000000000000000000) (bvslt (index!12113 lt!150626) (size!7696 a!3293)))) (or ((_ is Undefined!2484) lt!150626) ((_ is Found!2484) lt!150626) (not ((_ is MissingZero!2484) lt!150626)) (and (bvsge (index!12112 lt!150626) #b00000000000000000000000000000000) (bvslt (index!12112 lt!150626) (size!7696 a!3293)))) (or ((_ is Undefined!2484) lt!150626) ((_ is Found!2484) lt!150626) ((_ is MissingZero!2484) lt!150626) (not ((_ is MissingVacant!2484) lt!150626)) (and (bvsge (index!12115 lt!150626) #b00000000000000000000000000000000) (bvslt (index!12115 lt!150626) (size!7696 a!3293)))) (or ((_ is Undefined!2484) lt!150626) (ite ((_ is Found!2484) lt!150626) (= (select (arr!7344 a!3293) (index!12113 lt!150626)) k0!2441) (ite ((_ is MissingZero!2484) lt!150626) (= (select (arr!7344 a!3293) (index!12112 lt!150626)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2484) lt!150626) (= (select (arr!7344 a!3293) (index!12115 lt!150626)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!191659 () SeekEntryResult!2484)

(assert (=> d!68135 (= lt!150626 e!191659)))

(declare-fun c!48958 () Bool)

(assert (=> d!68135 (= c!48958 (and ((_ is Intermediate!2484) lt!150628) (undefined!3296 lt!150628)))))

(assert (=> d!68135 (= lt!150628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68135 (validMask!0 mask!3709)))

(assert (=> d!68135 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!150626)))

(declare-fun b!305146 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15515 (_ BitVec 32)) SeekEntryResult!2484)

(assert (=> b!305146 (= e!191658 (seekKeyOrZeroReturnVacant!0 (x!30366 lt!150628) (index!12114 lt!150628) (index!12114 lt!150628) k0!2441 a!3293 mask!3709))))

(declare-fun b!305147 () Bool)

(declare-fun e!191660 () SeekEntryResult!2484)

(assert (=> b!305147 (= e!191659 e!191660)))

(declare-fun lt!150627 () (_ BitVec 64))

(assert (=> b!305147 (= lt!150627 (select (arr!7344 a!3293) (index!12114 lt!150628)))))

(declare-fun c!48960 () Bool)

(assert (=> b!305147 (= c!48960 (= lt!150627 k0!2441))))

(declare-fun b!305148 () Bool)

(assert (=> b!305148 (= e!191659 Undefined!2484)))

(declare-fun b!305149 () Bool)

(assert (=> b!305149 (= e!191660 (Found!2484 (index!12114 lt!150628)))))

(declare-fun b!305150 () Bool)

(declare-fun c!48959 () Bool)

(assert (=> b!305150 (= c!48959 (= lt!150627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305150 (= e!191660 e!191658)))

(assert (= (and d!68135 c!48958) b!305148))

(assert (= (and d!68135 (not c!48958)) b!305147))

(assert (= (and b!305147 c!48960) b!305149))

(assert (= (and b!305147 (not c!48960)) b!305150))

(assert (= (and b!305150 c!48959) b!305145))

(assert (= (and b!305150 (not c!48959)) b!305146))

(declare-fun m!316163 () Bool)

(assert (=> d!68135 m!316163))

(declare-fun m!316165 () Bool)

(assert (=> d!68135 m!316165))

(assert (=> d!68135 m!316101))

(declare-fun m!316167 () Bool)

(assert (=> d!68135 m!316167))

(assert (=> d!68135 m!316109))

(assert (=> d!68135 m!316111))

(assert (=> d!68135 m!316109))

(declare-fun m!316169 () Bool)

(assert (=> b!305146 m!316169))

(declare-fun m!316171 () Bool)

(assert (=> b!305147 m!316171))

(assert (=> b!305028 d!68135))

(declare-fun d!68143 () Bool)

(declare-fun res!162441 () Bool)

(declare-fun e!191675 () Bool)

(assert (=> d!68143 (=> res!162441 e!191675)))

(assert (=> d!68143 (= res!162441 (= (select (arr!7344 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68143 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!191675)))

(declare-fun b!305173 () Bool)

(declare-fun e!191676 () Bool)

(assert (=> b!305173 (= e!191675 e!191676)))

(declare-fun res!162442 () Bool)

(assert (=> b!305173 (=> (not res!162442) (not e!191676))))

(assert (=> b!305173 (= res!162442 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7696 a!3293)))))

(declare-fun b!305174 () Bool)

(assert (=> b!305174 (= e!191676 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68143 (not res!162441)) b!305173))

(assert (= (and b!305173 res!162442) b!305174))

(declare-fun m!316181 () Bool)

(assert (=> d!68143 m!316181))

(declare-fun m!316185 () Bool)

(assert (=> b!305174 m!316185))

(assert (=> b!305027 d!68143))

(declare-fun d!68147 () Bool)

(assert (=> d!68147 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30460 d!68147))

(declare-fun d!68157 () Bool)

(assert (=> d!68157 (= (array_inv!5307 a!3293) (bvsge (size!7696 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30460 d!68157))

(declare-fun d!68159 () Bool)

(assert (=> d!68159 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305031 d!68159))

(declare-fun b!305228 () Bool)

(declare-fun e!191707 () Bool)

(declare-fun call!25903 () Bool)

(assert (=> b!305228 (= e!191707 call!25903)))

(declare-fun b!305229 () Bool)

(declare-fun e!191708 () Bool)

(assert (=> b!305229 (= e!191708 call!25903)))

(declare-fun d!68161 () Bool)

(declare-fun res!162458 () Bool)

(declare-fun e!191709 () Bool)

(assert (=> d!68161 (=> res!162458 e!191709)))

(assert (=> d!68161 (= res!162458 (bvsge #b00000000000000000000000000000000 (size!7696 a!3293)))))

(assert (=> d!68161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191709)))

(declare-fun b!305230 () Bool)

(assert (=> b!305230 (= e!191709 e!191707)))

(declare-fun c!48987 () Bool)

(assert (=> b!305230 (= c!48987 (validKeyInArray!0 (select (arr!7344 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25900 () Bool)

(assert (=> bm!25900 (= call!25903 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!305231 () Bool)

(assert (=> b!305231 (= e!191707 e!191708)))

(declare-fun lt!150664 () (_ BitVec 64))

(assert (=> b!305231 (= lt!150664 (select (arr!7344 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9395 0))(
  ( (Unit!9396) )
))
(declare-fun lt!150663 () Unit!9395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15515 (_ BitVec 64) (_ BitVec 32)) Unit!9395)

(assert (=> b!305231 (= lt!150663 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150664 #b00000000000000000000000000000000))))

(assert (=> b!305231 (arrayContainsKey!0 a!3293 lt!150664 #b00000000000000000000000000000000)))

(declare-fun lt!150665 () Unit!9395)

(assert (=> b!305231 (= lt!150665 lt!150663)))

(declare-fun res!162457 () Bool)

(assert (=> b!305231 (= res!162457 (= (seekEntryOrOpen!0 (select (arr!7344 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2484 #b00000000000000000000000000000000)))))

(assert (=> b!305231 (=> (not res!162457) (not e!191708))))

(assert (= (and d!68161 (not res!162458)) b!305230))

(assert (= (and b!305230 c!48987) b!305231))

(assert (= (and b!305230 (not c!48987)) b!305228))

(assert (= (and b!305231 res!162457) b!305229))

(assert (= (or b!305229 b!305228) bm!25900))

(assert (=> b!305230 m!316181))

(assert (=> b!305230 m!316181))

(declare-fun m!316221 () Bool)

(assert (=> b!305230 m!316221))

(declare-fun m!316223 () Bool)

(assert (=> bm!25900 m!316223))

(assert (=> b!305231 m!316181))

(declare-fun m!316225 () Bool)

(assert (=> b!305231 m!316225))

(declare-fun m!316227 () Bool)

(assert (=> b!305231 m!316227))

(assert (=> b!305231 m!316181))

(declare-fun m!316229 () Bool)

(assert (=> b!305231 m!316229))

(assert (=> b!305026 d!68161))

(declare-fun b!305232 () Bool)

(declare-fun e!191711 () SeekEntryResult!2484)

(assert (=> b!305232 (= e!191711 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!150586 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!305233 () Bool)

(declare-fun e!191714 () Bool)

(declare-fun e!191713 () Bool)

(assert (=> b!305233 (= e!191714 e!191713)))

(declare-fun res!162459 () Bool)

(declare-fun lt!150668 () SeekEntryResult!2484)

(assert (=> b!305233 (= res!162459 (and ((_ is Intermediate!2484) lt!150668) (not (undefined!3296 lt!150668)) (bvslt (x!30366 lt!150668) #b01111111111111111111111111111110) (bvsge (x!30366 lt!150668) #b00000000000000000000000000000000) (bvsge (x!30366 lt!150668) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!305233 (=> (not res!162459) (not e!191713))))

(declare-fun d!68169 () Bool)

(assert (=> d!68169 e!191714))

(declare-fun c!48989 () Bool)

(assert (=> d!68169 (= c!48989 (and ((_ is Intermediate!2484) lt!150668) (undefined!3296 lt!150668)))))

(declare-fun e!191712 () SeekEntryResult!2484)

(assert (=> d!68169 (= lt!150668 e!191712)))

(declare-fun c!48990 () Bool)

(assert (=> d!68169 (= c!48990 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!150669 () (_ BitVec 64))

(assert (=> d!68169 (= lt!150669 (select (arr!7344 a!3293) lt!150586))))

(assert (=> d!68169 (validMask!0 mask!3709)))

(assert (=> d!68169 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150586 k0!2441 a!3293 mask!3709) lt!150668)))

(declare-fun b!305234 () Bool)

(assert (=> b!305234 (= e!191711 (Intermediate!2484 false lt!150586 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!305235 () Bool)

(assert (=> b!305235 (= e!191714 (bvsge (x!30366 lt!150668) #b01111111111111111111111111111110))))

(declare-fun b!305236 () Bool)

(assert (=> b!305236 (= e!191712 e!191711)))

(declare-fun c!48988 () Bool)

(assert (=> b!305236 (= c!48988 (or (= lt!150669 k0!2441) (= (bvadd lt!150669 lt!150669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305237 () Bool)

(assert (=> b!305237 (and (bvsge (index!12114 lt!150668) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150668) (size!7696 a!3293)))))

(declare-fun e!191710 () Bool)

(assert (=> b!305237 (= e!191710 (= (select (arr!7344 a!3293) (index!12114 lt!150668)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!305238 () Bool)

(assert (=> b!305238 (and (bvsge (index!12114 lt!150668) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150668) (size!7696 a!3293)))))

(declare-fun res!162461 () Bool)

(assert (=> b!305238 (= res!162461 (= (select (arr!7344 a!3293) (index!12114 lt!150668)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305238 (=> res!162461 e!191710)))

(declare-fun b!305239 () Bool)

(assert (=> b!305239 (and (bvsge (index!12114 lt!150668) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150668) (size!7696 a!3293)))))

(declare-fun res!162460 () Bool)

(assert (=> b!305239 (= res!162460 (= (select (arr!7344 a!3293) (index!12114 lt!150668)) k0!2441))))

(assert (=> b!305239 (=> res!162460 e!191710)))

(assert (=> b!305239 (= e!191713 e!191710)))

(declare-fun b!305240 () Bool)

(assert (=> b!305240 (= e!191712 (Intermediate!2484 true lt!150586 (bvadd #b00000000000000000000000000000001 x!1427)))))

(assert (= (and d!68169 c!48990) b!305240))

(assert (= (and d!68169 (not c!48990)) b!305236))

(assert (= (and b!305236 c!48988) b!305234))

(assert (= (and b!305236 (not c!48988)) b!305232))

(assert (= (and d!68169 c!48989) b!305235))

(assert (= (and d!68169 (not c!48989)) b!305233))

(assert (= (and b!305233 res!162459) b!305239))

(assert (= (and b!305239 (not res!162460)) b!305238))

(assert (= (and b!305238 (not res!162461)) b!305237))

(declare-fun m!316233 () Bool)

(assert (=> b!305237 m!316233))

(declare-fun m!316235 () Bool)

(assert (=> d!68169 m!316235))

(assert (=> d!68169 m!316101))

(assert (=> b!305238 m!316233))

(declare-fun m!316237 () Bool)

(assert (=> b!305232 m!316237))

(assert (=> b!305232 m!316237))

(declare-fun m!316239 () Bool)

(assert (=> b!305232 m!316239))

(assert (=> b!305239 m!316233))

(assert (=> b!305025 d!68169))

(declare-fun d!68173 () Bool)

(declare-fun lt!150679 () (_ BitVec 32))

(assert (=> d!68173 (and (bvsge lt!150679 #b00000000000000000000000000000000) (bvslt lt!150679 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68173 (= lt!150679 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68173 (validMask!0 mask!3709)))

(assert (=> d!68173 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!150679)))

(declare-fun bs!10744 () Bool)

(assert (= bs!10744 d!68173))

(declare-fun m!316241 () Bool)

(assert (=> bs!10744 m!316241))

(assert (=> bs!10744 m!316101))

(assert (=> b!305025 d!68173))

(declare-fun e!191722 () SeekEntryResult!2484)

(declare-fun b!305253 () Bool)

(assert (=> b!305253 (= e!191722 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!305254 () Bool)

(declare-fun e!191725 () Bool)

(declare-fun e!191724 () Bool)

(assert (=> b!305254 (= e!191725 e!191724)))

(declare-fun res!162462 () Bool)

(declare-fun lt!150680 () SeekEntryResult!2484)

(assert (=> b!305254 (= res!162462 (and ((_ is Intermediate!2484) lt!150680) (not (undefined!3296 lt!150680)) (bvslt (x!30366 lt!150680) #b01111111111111111111111111111110) (bvsge (x!30366 lt!150680) #b00000000000000000000000000000000) (bvsge (x!30366 lt!150680) #b00000000000000000000000000000000)))))

(assert (=> b!305254 (=> (not res!162462) (not e!191724))))

(declare-fun d!68175 () Bool)

(assert (=> d!68175 e!191725))

(declare-fun c!48998 () Bool)

(assert (=> d!68175 (= c!48998 (and ((_ is Intermediate!2484) lt!150680) (undefined!3296 lt!150680)))))

(declare-fun e!191723 () SeekEntryResult!2484)

(assert (=> d!68175 (= lt!150680 e!191723)))

(declare-fun c!48999 () Bool)

(assert (=> d!68175 (= c!48999 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!150681 () (_ BitVec 64))

(assert (=> d!68175 (= lt!150681 (select (arr!7344 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68175 (validMask!0 mask!3709)))

(assert (=> d!68175 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150680)))

(declare-fun b!305255 () Bool)

(assert (=> b!305255 (= e!191722 (Intermediate!2484 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!305256 () Bool)

(assert (=> b!305256 (= e!191725 (bvsge (x!30366 lt!150680) #b01111111111111111111111111111110))))

(declare-fun b!305257 () Bool)

(assert (=> b!305257 (= e!191723 e!191722)))

(declare-fun c!48997 () Bool)

(assert (=> b!305257 (= c!48997 (or (= lt!150681 k0!2441) (= (bvadd lt!150681 lt!150681) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305258 () Bool)

(assert (=> b!305258 (and (bvsge (index!12114 lt!150680) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150680) (size!7696 a!3293)))))

(declare-fun e!191721 () Bool)

(assert (=> b!305258 (= e!191721 (= (select (arr!7344 a!3293) (index!12114 lt!150680)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!305259 () Bool)

(assert (=> b!305259 (and (bvsge (index!12114 lt!150680) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150680) (size!7696 a!3293)))))

(declare-fun res!162464 () Bool)

(assert (=> b!305259 (= res!162464 (= (select (arr!7344 a!3293) (index!12114 lt!150680)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305259 (=> res!162464 e!191721)))

(declare-fun b!305260 () Bool)

(assert (=> b!305260 (and (bvsge (index!12114 lt!150680) #b00000000000000000000000000000000) (bvslt (index!12114 lt!150680) (size!7696 a!3293)))))

(declare-fun res!162463 () Bool)

(assert (=> b!305260 (= res!162463 (= (select (arr!7344 a!3293) (index!12114 lt!150680)) k0!2441))))

(assert (=> b!305260 (=> res!162463 e!191721)))

(assert (=> b!305260 (= e!191724 e!191721)))

(declare-fun b!305261 () Bool)

(assert (=> b!305261 (= e!191723 (Intermediate!2484 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68175 c!48999) b!305261))

(assert (= (and d!68175 (not c!48999)) b!305257))

(assert (= (and b!305257 c!48997) b!305255))

(assert (= (and b!305257 (not c!48997)) b!305253))

(assert (= (and d!68175 c!48998) b!305256))

(assert (= (and d!68175 (not c!48998)) b!305254))

(assert (= (and b!305254 res!162462) b!305260))

(assert (= (and b!305260 (not res!162463)) b!305259))

(assert (= (and b!305259 (not res!162464)) b!305258))

(declare-fun m!316243 () Bool)

(assert (=> b!305258 m!316243))

(assert (=> d!68175 m!316109))

(declare-fun m!316245 () Bool)

(assert (=> d!68175 m!316245))

(assert (=> d!68175 m!316101))

(assert (=> b!305259 m!316243))

(assert (=> b!305253 m!316109))

(declare-fun m!316247 () Bool)

(assert (=> b!305253 m!316247))

(assert (=> b!305253 m!316247))

(declare-fun m!316249 () Bool)

(assert (=> b!305253 m!316249))

(assert (=> b!305260 m!316243))

(assert (=> b!305030 d!68175))

(declare-fun d!68177 () Bool)

(declare-fun lt!150699 () (_ BitVec 32))

(declare-fun lt!150698 () (_ BitVec 32))

(assert (=> d!68177 (= lt!150699 (bvmul (bvxor lt!150698 (bvlshr lt!150698 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68177 (= lt!150698 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68177 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!162465 (let ((h!5339 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30376 (bvmul (bvxor h!5339 (bvlshr h!5339 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30376 (bvlshr x!30376 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!162465 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!162465 #b00000000000000000000000000000000))))))

(assert (=> d!68177 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!150699 (bvlshr lt!150699 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!305030 d!68177))

(check-sat (not b!305146) (not b!305079) (not d!68169) (not b!305230) (not d!68135) (not bm!25900) (not b!305174) (not d!68175) (not b!305231) (not b!305253) (not b!305232) (not d!68131) (not d!68173))
(check-sat)
