; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44154 () Bool)

(assert start!44154)

(declare-fun b!486247 () Bool)

(declare-fun res!289782 () Bool)

(declare-fun e!286211 () Bool)

(assert (=> b!486247 (=> (not res!289782) (not e!286211))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486247 (= res!289782 (validKeyInArray!0 k!2280))))

(declare-fun b!486248 () Bool)

(declare-fun res!289780 () Bool)

(declare-fun e!286210 () Bool)

(assert (=> b!486248 (=> (not res!289780) (not e!286210))))

(declare-datatypes ((array!31489 0))(
  ( (array!31490 (arr!15141 (Array (_ BitVec 32) (_ BitVec 64))) (size!15505 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31489)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31489 (_ BitVec 32)) Bool)

(assert (=> b!486248 (= res!289780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!289783 () Bool)

(assert (=> start!44154 (=> (not res!289783) (not e!286211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44154 (= res!289783 (validMask!0 mask!3524))))

(assert (=> start!44154 e!286211))

(assert (=> start!44154 true))

(declare-fun array_inv!10937 (array!31489) Bool)

(assert (=> start!44154 (array_inv!10937 a!3235)))

(declare-fun b!486249 () Bool)

(declare-fun res!289784 () Bool)

(assert (=> b!486249 (=> (not res!289784) (not e!286211))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486249 (= res!289784 (validKeyInArray!0 (select (arr!15141 a!3235) j!176)))))

(declare-fun b!486250 () Bool)

(declare-fun res!289777 () Bool)

(assert (=> b!486250 (=> (not res!289777) (not e!286211))))

(declare-fun arrayContainsKey!0 (array!31489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486250 (= res!289777 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486251 () Bool)

(assert (=> b!486251 (= e!286211 e!286210)))

(declare-fun res!289781 () Bool)

(assert (=> b!486251 (=> (not res!289781) (not e!286210))))

(declare-datatypes ((SeekEntryResult!3608 0))(
  ( (MissingZero!3608 (index!16611 (_ BitVec 32))) (Found!3608 (index!16612 (_ BitVec 32))) (Intermediate!3608 (undefined!4420 Bool) (index!16613 (_ BitVec 32)) (x!45748 (_ BitVec 32))) (Undefined!3608) (MissingVacant!3608 (index!16614 (_ BitVec 32))) )
))
(declare-fun lt!219685 () SeekEntryResult!3608)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486251 (= res!289781 (or (= lt!219685 (MissingZero!3608 i!1204)) (= lt!219685 (MissingVacant!3608 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31489 (_ BitVec 32)) SeekEntryResult!3608)

(assert (=> b!486251 (= lt!219685 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486252 () Bool)

(declare-datatypes ((List!9299 0))(
  ( (Nil!9296) (Cons!9295 (h!10151 (_ BitVec 64)) (t!15527 List!9299)) )
))
(declare-fun noDuplicate!207 (List!9299) Bool)

(assert (=> b!486252 (= e!286210 (not (noDuplicate!207 Nil!9296)))))

(declare-fun b!486253 () Bool)

(declare-fun res!289778 () Bool)

(assert (=> b!486253 (=> (not res!289778) (not e!286210))))

(assert (=> b!486253 (= res!289778 (and (bvsle #b00000000000000000000000000000000 (size!15505 a!3235)) (bvslt (size!15505 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!486254 () Bool)

(declare-fun res!289779 () Bool)

(assert (=> b!486254 (=> (not res!289779) (not e!286211))))

(assert (=> b!486254 (= res!289779 (and (= (size!15505 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15505 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15505 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44154 res!289783) b!486254))

(assert (= (and b!486254 res!289779) b!486249))

(assert (= (and b!486249 res!289784) b!486247))

(assert (= (and b!486247 res!289782) b!486250))

(assert (= (and b!486250 res!289777) b!486251))

(assert (= (and b!486251 res!289781) b!486248))

(assert (= (and b!486248 res!289780) b!486253))

(assert (= (and b!486253 res!289778) b!486252))

(declare-fun m!466245 () Bool)

(assert (=> b!486252 m!466245))

(declare-fun m!466247 () Bool)

(assert (=> b!486249 m!466247))

(assert (=> b!486249 m!466247))

(declare-fun m!466249 () Bool)

(assert (=> b!486249 m!466249))

(declare-fun m!466251 () Bool)

(assert (=> b!486248 m!466251))

(declare-fun m!466253 () Bool)

(assert (=> b!486251 m!466253))

(declare-fun m!466255 () Bool)

(assert (=> b!486250 m!466255))

(declare-fun m!466257 () Bool)

(assert (=> b!486247 m!466257))

(declare-fun m!466259 () Bool)

(assert (=> start!44154 m!466259))

(declare-fun m!466261 () Bool)

(assert (=> start!44154 m!466261))

(push 1)

(assert (not start!44154))

(assert (not b!486248))

(assert (not b!486249))

(assert (not b!486251))

(assert (not b!486247))

(assert (not b!486252))

(assert (not b!486250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!486345 () Bool)

(declare-fun lt!219717 () SeekEntryResult!3608)

(declare-fun e!286261 () SeekEntryResult!3608)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31489 (_ BitVec 32)) SeekEntryResult!3608)

(assert (=> b!486345 (= e!286261 (seekKeyOrZeroReturnVacant!0 (x!45748 lt!219717) (index!16613 lt!219717) (index!16613 lt!219717) k!2280 a!3235 mask!3524))))

(declare-fun b!486346 () Bool)

(assert (=> b!486346 (= e!286261 (MissingZero!3608 (index!16613 lt!219717)))))

(declare-fun d!77505 () Bool)

(declare-fun lt!219716 () SeekEntryResult!3608)

(assert (=> d!77505 (and (or (is-Undefined!3608 lt!219716) (not (is-Found!3608 lt!219716)) (and (bvsge (index!16612 lt!219716) #b00000000000000000000000000000000) (bvslt (index!16612 lt!219716) (size!15505 a!3235)))) (or (is-Undefined!3608 lt!219716) (is-Found!3608 lt!219716) (not (is-MissingZero!3608 lt!219716)) (and (bvsge (index!16611 lt!219716) #b00000000000000000000000000000000) (bvslt (index!16611 lt!219716) (size!15505 a!3235)))) (or (is-Undefined!3608 lt!219716) (is-Found!3608 lt!219716) (is-MissingZero!3608 lt!219716) (not (is-MissingVacant!3608 lt!219716)) (and (bvsge (index!16614 lt!219716) #b00000000000000000000000000000000) (bvslt (index!16614 lt!219716) (size!15505 a!3235)))) (or (is-Undefined!3608 lt!219716) (ite (is-Found!3608 lt!219716) (= (select (arr!15141 a!3235) (index!16612 lt!219716)) k!2280) (ite (is-MissingZero!3608 lt!219716) (= (select (arr!15141 a!3235) (index!16611 lt!219716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3608 lt!219716) (= (select (arr!15141 a!3235) (index!16614 lt!219716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286263 () SeekEntryResult!3608)

(assert (=> d!77505 (= lt!219716 e!286263)))

(declare-fun c!58515 () Bool)

(assert (=> d!77505 (= c!58515 (and (is-Intermediate!3608 lt!219717) (undefined!4420 lt!219717)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31489 (_ BitVec 32)) SeekEntryResult!3608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77505 (= lt!219717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77505 (validMask!0 mask!3524)))

(assert (=> d!77505 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!219716)))

(declare-fun b!486347 () Bool)

(declare-fun e!286262 () SeekEntryResult!3608)

(assert (=> b!486347 (= e!286262 (Found!3608 (index!16613 lt!219717)))))

(declare-fun b!486348 () Bool)

(assert (=> b!486348 (= e!286263 Undefined!3608)))

(declare-fun b!486349 () Bool)

(assert (=> b!486349 (= e!286263 e!286262)))

(declare-fun lt!219718 () (_ BitVec 64))

(assert (=> b!486349 (= lt!219718 (select (arr!15141 a!3235) (index!16613 lt!219717)))))

(declare-fun c!58517 () Bool)

(assert (=> b!486349 (= c!58517 (= lt!219718 k!2280))))

(declare-fun b!486350 () Bool)

(declare-fun c!58516 () Bool)

(assert (=> b!486350 (= c!58516 (= lt!219718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486350 (= e!286262 e!286261)))

(assert (= (and d!77505 c!58515) b!486348))

(assert (= (and d!77505 (not c!58515)) b!486349))

(assert (= (and b!486349 c!58517) b!486347))

(assert (= (and b!486349 (not c!58517)) b!486350))

(assert (= (and b!486350 c!58516) b!486346))

(assert (= (and b!486350 (not c!58516)) b!486345))

(declare-fun m!466325 () Bool)

(assert (=> b!486345 m!466325))

(declare-fun m!466327 () Bool)

(assert (=> d!77505 m!466327))

(declare-fun m!466329 () Bool)

(assert (=> d!77505 m!466329))

(declare-fun m!466331 () Bool)

(assert (=> d!77505 m!466331))

(assert (=> d!77505 m!466259))

(assert (=> d!77505 m!466329))

(declare-fun m!466333 () Bool)

(assert (=> d!77505 m!466333))

(declare-fun m!466335 () Bool)

(assert (=> d!77505 m!466335))

(declare-fun m!466337 () Bool)

(assert (=> b!486349 m!466337))

(assert (=> b!486251 d!77505))

(declare-fun d!77517 () Bool)

(declare-fun res!289861 () Bool)

(declare-fun e!286274 () Bool)

(assert (=> d!77517 (=> res!289861 e!286274)))

(assert (=> d!77517 (= res!289861 (is-Nil!9296 Nil!9296))))

(assert (=> d!77517 (= (noDuplicate!207 Nil!9296) e!286274)))

(declare-fun b!486363 () Bool)

(declare-fun e!286275 () Bool)

(assert (=> b!486363 (= e!286274 e!286275)))

(declare-fun res!289862 () Bool)

(assert (=> b!486363 (=> (not res!289862) (not e!286275))))

(declare-fun contains!2693 (List!9299 (_ BitVec 64)) Bool)

(assert (=> b!486363 (= res!289862 (not (contains!2693 (t!15527 Nil!9296) (h!10151 Nil!9296))))))

(declare-fun b!486364 () Bool)

(assert (=> b!486364 (= e!286275 (noDuplicate!207 (t!15527 Nil!9296)))))

(assert (= (and d!77517 (not res!289861)) b!486363))

(assert (= (and b!486363 res!289862) b!486364))

(declare-fun m!466343 () Bool)

(assert (=> b!486363 m!466343))

(declare-fun m!466345 () Bool)

(assert (=> b!486364 m!466345))

(assert (=> b!486252 d!77517))

(declare-fun d!77523 () Bool)

(assert (=> d!77523 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44154 d!77523))

(declare-fun d!77531 () Bool)

(assert (=> d!77531 (= (array_inv!10937 a!3235) (bvsge (size!15505 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44154 d!77531))

(declare-fun d!77533 () Bool)

(assert (=> d!77533 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486247 d!77533))

(declare-fun b!486419 () Bool)

(declare-fun e!286312 () Bool)

(declare-fun call!31274 () Bool)

(assert (=> b!486419 (= e!286312 call!31274)))

(declare-fun b!486420 () Bool)

(declare-fun e!286313 () Bool)

(declare-fun e!286314 () Bool)

(assert (=> b!486420 (= e!286313 e!286314)))

(declare-fun c!58538 () Bool)

(assert (=> b!486420 (= c!58538 (validKeyInArray!0 (select (arr!15141 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77535 () Bool)

(declare-fun res!289880 () Bool)

(assert (=> d!77535 (=> res!289880 e!286313)))

(assert (=> d!77535 (= res!289880 (bvsge #b00000000000000000000000000000000 (size!15505 a!3235)))))

(assert (=> d!77535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286313)))

(declare-fun b!486421 () Bool)

(assert (=> b!486421 (= e!286314 e!286312)))

(declare-fun lt!219743 () (_ BitVec 64))

(assert (=> b!486421 (= lt!219743 (select (arr!15141 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14196 0))(
  ( (Unit!14197) )
))
(declare-fun lt!219744 () Unit!14196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31489 (_ BitVec 64) (_ BitVec 32)) Unit!14196)

(assert (=> b!486421 (= lt!219744 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219743 #b00000000000000000000000000000000))))

(assert (=> b!486421 (arrayContainsKey!0 a!3235 lt!219743 #b00000000000000000000000000000000)))

(declare-fun lt!219745 () Unit!14196)

(assert (=> b!486421 (= lt!219745 lt!219744)))

(declare-fun res!289879 () Bool)

(assert (=> b!486421 (= res!289879 (= (seekEntryOrOpen!0 (select (arr!15141 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3608 #b00000000000000000000000000000000)))))

(assert (=> b!486421 (=> (not res!289879) (not e!286312))))

(declare-fun bm!31271 () Bool)

(assert (=> bm!31271 (= call!31274 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!486422 () Bool)

(assert (=> b!486422 (= e!286314 call!31274)))

(assert (= (and d!77535 (not res!289880)) b!486420))

(assert (= (and b!486420 c!58538) b!486421))

(assert (= (and b!486420 (not c!58538)) b!486422))

(assert (= (and b!486421 res!289879) b!486419))

(assert (= (or b!486419 b!486422) bm!31271))

(declare-fun m!466381 () Bool)

(assert (=> b!486420 m!466381))

(assert (=> b!486420 m!466381))

(declare-fun m!466383 () Bool)

(assert (=> b!486420 m!466383))

(assert (=> b!486421 m!466381))

(declare-fun m!466385 () Bool)

