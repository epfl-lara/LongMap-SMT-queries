; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44144 () Bool)

(assert start!44144)

(declare-fun b!486186 () Bool)

(declare-fun res!289771 () Bool)

(declare-fun e!286172 () Bool)

(assert (=> b!486186 (=> (not res!289771) (not e!286172))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31480 0))(
  ( (array!31481 (arr!15136 (Array (_ BitVec 32) (_ BitVec 64))) (size!15500 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31480)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486186 (= res!289771 (and (= (size!15500 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15500 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15500 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486187 () Bool)

(declare-fun res!289775 () Bool)

(declare-fun e!286171 () Bool)

(assert (=> b!486187 (=> (not res!289775) (not e!286171))))

(assert (=> b!486187 (= res!289775 (and (bvsle #b00000000000000000000000000000000 (size!15500 a!3235)) (bvslt (size!15500 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!486188 () Bool)

(declare-datatypes ((List!9201 0))(
  ( (Nil!9198) (Cons!9197 (h!10053 (_ BitVec 64)) (t!15421 List!9201)) )
))
(declare-fun noDuplicate!211 (List!9201) Bool)

(assert (=> b!486188 (= e!286171 (not (noDuplicate!211 Nil!9198)))))

(declare-fun res!289772 () Bool)

(assert (=> start!44144 (=> (not res!289772) (not e!286172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44144 (= res!289772 (validMask!0 mask!3524))))

(assert (=> start!44144 e!286172))

(assert (=> start!44144 true))

(declare-fun array_inv!10995 (array!31480) Bool)

(assert (=> start!44144 (array_inv!10995 a!3235)))

(declare-fun b!486189 () Bool)

(declare-fun res!289777 () Bool)

(assert (=> b!486189 (=> (not res!289777) (not e!286172))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486189 (= res!289777 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486190 () Bool)

(assert (=> b!486190 (= e!286172 e!286171)))

(declare-fun res!289773 () Bool)

(assert (=> b!486190 (=> (not res!289773) (not e!286171))))

(declare-datatypes ((SeekEntryResult!3559 0))(
  ( (MissingZero!3559 (index!16415 (_ BitVec 32))) (Found!3559 (index!16416 (_ BitVec 32))) (Intermediate!3559 (undefined!4371 Bool) (index!16417 (_ BitVec 32)) (x!45696 (_ BitVec 32))) (Undefined!3559) (MissingVacant!3559 (index!16418 (_ BitVec 32))) )
))
(declare-fun lt!219697 () SeekEntryResult!3559)

(assert (=> b!486190 (= res!289773 (or (= lt!219697 (MissingZero!3559 i!1204)) (= lt!219697 (MissingVacant!3559 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31480 (_ BitVec 32)) SeekEntryResult!3559)

(assert (=> b!486190 (= lt!219697 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486191 () Bool)

(declare-fun res!289776 () Bool)

(assert (=> b!486191 (=> (not res!289776) (not e!286172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486191 (= res!289776 (validKeyInArray!0 (select (arr!15136 a!3235) j!176)))))

(declare-fun b!486192 () Bool)

(declare-fun res!289774 () Bool)

(assert (=> b!486192 (=> (not res!289774) (not e!286172))))

(assert (=> b!486192 (= res!289774 (validKeyInArray!0 k0!2280))))

(declare-fun b!486193 () Bool)

(declare-fun res!289770 () Bool)

(assert (=> b!486193 (=> (not res!289770) (not e!286171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31480 (_ BitVec 32)) Bool)

(assert (=> b!486193 (= res!289770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44144 res!289772) b!486186))

(assert (= (and b!486186 res!289771) b!486191))

(assert (= (and b!486191 res!289776) b!486192))

(assert (= (and b!486192 res!289774) b!486189))

(assert (= (and b!486189 res!289777) b!486190))

(assert (= (and b!486190 res!289773) b!486193))

(assert (= (and b!486193 res!289770) b!486187))

(assert (= (and b!486187 res!289775) b!486188))

(declare-fun m!466429 () Bool)

(assert (=> b!486191 m!466429))

(assert (=> b!486191 m!466429))

(declare-fun m!466431 () Bool)

(assert (=> b!486191 m!466431))

(declare-fun m!466433 () Bool)

(assert (=> b!486192 m!466433))

(declare-fun m!466435 () Bool)

(assert (=> b!486188 m!466435))

(declare-fun m!466437 () Bool)

(assert (=> start!44144 m!466437))

(declare-fun m!466439 () Bool)

(assert (=> start!44144 m!466439))

(declare-fun m!466441 () Bool)

(assert (=> b!486190 m!466441))

(declare-fun m!466443 () Bool)

(assert (=> b!486193 m!466443))

(declare-fun m!466445 () Bool)

(assert (=> b!486189 m!466445))

(check-sat (not b!486189) (not b!486193) (not start!44144) (not b!486191) (not b!486190) (not b!486188) (not b!486192))
(check-sat)
(get-model)

(declare-fun b!486274 () Bool)

(declare-fun e!286216 () SeekEntryResult!3559)

(declare-fun e!286217 () SeekEntryResult!3559)

(assert (=> b!486274 (= e!286216 e!286217)))

(declare-fun lt!219717 () (_ BitVec 64))

(declare-fun lt!219718 () SeekEntryResult!3559)

(assert (=> b!486274 (= lt!219717 (select (arr!15136 a!3235) (index!16417 lt!219718)))))

(declare-fun c!58485 () Bool)

(assert (=> b!486274 (= c!58485 (= lt!219717 k0!2280))))

(declare-fun d!77535 () Bool)

(declare-fun lt!219716 () SeekEntryResult!3559)

(get-info :version)

(assert (=> d!77535 (and (or ((_ is Undefined!3559) lt!219716) (not ((_ is Found!3559) lt!219716)) (and (bvsge (index!16416 lt!219716) #b00000000000000000000000000000000) (bvslt (index!16416 lt!219716) (size!15500 a!3235)))) (or ((_ is Undefined!3559) lt!219716) ((_ is Found!3559) lt!219716) (not ((_ is MissingZero!3559) lt!219716)) (and (bvsge (index!16415 lt!219716) #b00000000000000000000000000000000) (bvslt (index!16415 lt!219716) (size!15500 a!3235)))) (or ((_ is Undefined!3559) lt!219716) ((_ is Found!3559) lt!219716) ((_ is MissingZero!3559) lt!219716) (not ((_ is MissingVacant!3559) lt!219716)) (and (bvsge (index!16418 lt!219716) #b00000000000000000000000000000000) (bvslt (index!16418 lt!219716) (size!15500 a!3235)))) (or ((_ is Undefined!3559) lt!219716) (ite ((_ is Found!3559) lt!219716) (= (select (arr!15136 a!3235) (index!16416 lt!219716)) k0!2280) (ite ((_ is MissingZero!3559) lt!219716) (= (select (arr!15136 a!3235) (index!16415 lt!219716)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3559) lt!219716) (= (select (arr!15136 a!3235) (index!16418 lt!219716)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77535 (= lt!219716 e!286216)))

(declare-fun c!58486 () Bool)

(assert (=> d!77535 (= c!58486 (and ((_ is Intermediate!3559) lt!219718) (undefined!4371 lt!219718)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31480 (_ BitVec 32)) SeekEntryResult!3559)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77535 (= lt!219718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77535 (validMask!0 mask!3524)))

(assert (=> d!77535 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!219716)))

(declare-fun b!486275 () Bool)

(assert (=> b!486275 (= e!286216 Undefined!3559)))

(declare-fun b!486276 () Bool)

(declare-fun c!58484 () Bool)

(assert (=> b!486276 (= c!58484 (= lt!219717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!286218 () SeekEntryResult!3559)

(assert (=> b!486276 (= e!286217 e!286218)))

(declare-fun b!486277 () Bool)

(assert (=> b!486277 (= e!286218 (MissingZero!3559 (index!16417 lt!219718)))))

(declare-fun b!486278 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31480 (_ BitVec 32)) SeekEntryResult!3559)

(assert (=> b!486278 (= e!286218 (seekKeyOrZeroReturnVacant!0 (x!45696 lt!219718) (index!16417 lt!219718) (index!16417 lt!219718) k0!2280 a!3235 mask!3524))))

(declare-fun b!486279 () Bool)

(assert (=> b!486279 (= e!286217 (Found!3559 (index!16417 lt!219718)))))

(assert (= (and d!77535 c!58486) b!486275))

(assert (= (and d!77535 (not c!58486)) b!486274))

(assert (= (and b!486274 c!58485) b!486279))

(assert (= (and b!486274 (not c!58485)) b!486276))

(assert (= (and b!486276 c!58484) b!486277))

(assert (= (and b!486276 (not c!58484)) b!486278))

(declare-fun m!466491 () Bool)

(assert (=> b!486274 m!466491))

(declare-fun m!466493 () Bool)

(assert (=> d!77535 m!466493))

(declare-fun m!466495 () Bool)

(assert (=> d!77535 m!466495))

(declare-fun m!466497 () Bool)

(assert (=> d!77535 m!466497))

(assert (=> d!77535 m!466495))

(declare-fun m!466499 () Bool)

(assert (=> d!77535 m!466499))

(declare-fun m!466501 () Bool)

(assert (=> d!77535 m!466501))

(assert (=> d!77535 m!466437))

(declare-fun m!466503 () Bool)

(assert (=> b!486278 m!466503))

(assert (=> b!486190 d!77535))

(declare-fun d!77545 () Bool)

(assert (=> d!77545 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44144 d!77545))

(declare-fun d!77549 () Bool)

(assert (=> d!77549 (= (array_inv!10995 a!3235) (bvsge (size!15500 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44144 d!77549))

(declare-fun d!77553 () Bool)

(assert (=> d!77553 (= (validKeyInArray!0 (select (arr!15136 a!3235) j!176)) (and (not (= (select (arr!15136 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15136 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486191 d!77553))

(declare-fun d!77557 () Bool)

(declare-fun res!289858 () Bool)

(declare-fun e!286250 () Bool)

(assert (=> d!77557 (=> res!289858 e!286250)))

(assert (=> d!77557 (= res!289858 (bvsge #b00000000000000000000000000000000 (size!15500 a!3235)))))

(assert (=> d!77557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286250)))

(declare-fun b!486324 () Bool)

(declare-fun e!286249 () Bool)

(declare-fun call!31259 () Bool)

(assert (=> b!486324 (= e!286249 call!31259)))

(declare-fun b!486325 () Bool)

(declare-fun e!286251 () Bool)

(assert (=> b!486325 (= e!286251 call!31259)))

(declare-fun b!486326 () Bool)

(assert (=> b!486326 (= e!286251 e!286249)))

(declare-fun lt!219744 () (_ BitVec 64))

(assert (=> b!486326 (= lt!219744 (select (arr!15136 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14157 0))(
  ( (Unit!14158) )
))
(declare-fun lt!219743 () Unit!14157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31480 (_ BitVec 64) (_ BitVec 32)) Unit!14157)

(assert (=> b!486326 (= lt!219743 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219744 #b00000000000000000000000000000000))))

(assert (=> b!486326 (arrayContainsKey!0 a!3235 lt!219744 #b00000000000000000000000000000000)))

(declare-fun lt!219745 () Unit!14157)

(assert (=> b!486326 (= lt!219745 lt!219743)))

(declare-fun res!289859 () Bool)

(assert (=> b!486326 (= res!289859 (= (seekEntryOrOpen!0 (select (arr!15136 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3559 #b00000000000000000000000000000000)))))

(assert (=> b!486326 (=> (not res!289859) (not e!286249))))

(declare-fun b!486327 () Bool)

(assert (=> b!486327 (= e!286250 e!286251)))

(declare-fun c!58501 () Bool)

(assert (=> b!486327 (= c!58501 (validKeyInArray!0 (select (arr!15136 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31256 () Bool)

(assert (=> bm!31256 (= call!31259 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77557 (not res!289858)) b!486327))

(assert (= (and b!486327 c!58501) b!486326))

(assert (= (and b!486327 (not c!58501)) b!486325))

(assert (= (and b!486326 res!289859) b!486324))

(assert (= (or b!486324 b!486325) bm!31256))

(declare-fun m!466533 () Bool)

(assert (=> b!486326 m!466533))

(declare-fun m!466535 () Bool)

(assert (=> b!486326 m!466535))

(declare-fun m!466537 () Bool)

(assert (=> b!486326 m!466537))

(assert (=> b!486326 m!466533))

(declare-fun m!466539 () Bool)

(assert (=> b!486326 m!466539))

(assert (=> b!486327 m!466533))

(assert (=> b!486327 m!466533))

(declare-fun m!466541 () Bool)

(assert (=> b!486327 m!466541))

(declare-fun m!466543 () Bool)

(assert (=> bm!31256 m!466543))

(assert (=> b!486193 d!77557))

(declare-fun d!77565 () Bool)

(assert (=> d!77565 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486192 d!77565))

(declare-fun d!77567 () Bool)

(declare-fun res!289866 () Bool)

(declare-fun e!286259 () Bool)

(assert (=> d!77567 (=> res!289866 e!286259)))

(assert (=> d!77567 (= res!289866 (= (select (arr!15136 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77567 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286259)))

(declare-fun b!486336 () Bool)

(declare-fun e!286260 () Bool)

(assert (=> b!486336 (= e!286259 e!286260)))

(declare-fun res!289867 () Bool)

(assert (=> b!486336 (=> (not res!289867) (not e!286260))))

(assert (=> b!486336 (= res!289867 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15500 a!3235)))))

(declare-fun b!486337 () Bool)

(assert (=> b!486337 (= e!286260 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77567 (not res!289866)) b!486336))

(assert (= (and b!486336 res!289867) b!486337))

(assert (=> d!77567 m!466533))

(declare-fun m!466557 () Bool)

(assert (=> b!486337 m!466557))

(assert (=> b!486189 d!77567))

(declare-fun d!77571 () Bool)

(declare-fun res!289878 () Bool)

(declare-fun e!286271 () Bool)

(assert (=> d!77571 (=> res!289878 e!286271)))

(assert (=> d!77571 (= res!289878 ((_ is Nil!9198) Nil!9198))))

(assert (=> d!77571 (= (noDuplicate!211 Nil!9198) e!286271)))

(declare-fun b!486348 () Bool)

(declare-fun e!286272 () Bool)

(assert (=> b!486348 (= e!286271 e!286272)))

(declare-fun res!289879 () Bool)

(assert (=> b!486348 (=> (not res!289879) (not e!286272))))

(declare-fun contains!2669 (List!9201 (_ BitVec 64)) Bool)

(assert (=> b!486348 (= res!289879 (not (contains!2669 (t!15421 Nil!9198) (h!10053 Nil!9198))))))

(declare-fun b!486349 () Bool)

(assert (=> b!486349 (= e!286272 (noDuplicate!211 (t!15421 Nil!9198)))))

(assert (= (and d!77571 (not res!289878)) b!486348))

(assert (= (and b!486348 res!289879) b!486349))

(declare-fun m!466561 () Bool)

(assert (=> b!486348 m!466561))

(declare-fun m!466563 () Bool)

(assert (=> b!486349 m!466563))

(assert (=> b!486188 d!77571))

(check-sat (not b!486327) (not b!486326) (not bm!31256) (not d!77535) (not b!486349) (not b!486337) (not b!486348) (not b!486278))
(check-sat)
