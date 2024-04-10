; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44112 () Bool)

(assert start!44112)

(declare-fun b!486074 () Bool)

(declare-fun res!289682 () Bool)

(declare-fun e!286112 () Bool)

(assert (=> b!486074 (=> (not res!289682) (not e!286112))))

(declare-datatypes ((array!31480 0))(
  ( (array!31481 (arr!15138 (Array (_ BitVec 32) (_ BitVec 64))) (size!15502 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31480)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486074 (= res!289682 (validKeyInArray!0 (select (arr!15138 a!3235) j!176)))))

(declare-fun b!486075 () Bool)

(declare-fun e!286113 () Bool)

(assert (=> b!486075 (= e!286113 (and (bvsle #b00000000000000000000000000000000 (size!15502 a!3235)) (bvsge (size!15502 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!486076 () Bool)

(declare-fun res!289678 () Bool)

(assert (=> b!486076 (=> (not res!289678) (not e!286112))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486076 (= res!289678 (and (= (size!15502 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15502 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15502 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486077 () Bool)

(declare-fun res!289676 () Bool)

(assert (=> b!486077 (=> (not res!289676) (not e!286112))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!486077 (= res!289676 (validKeyInArray!0 k!2280))))

(declare-fun b!486078 () Bool)

(declare-fun res!289681 () Bool)

(assert (=> b!486078 (=> (not res!289681) (not e!286113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31480 (_ BitVec 32)) Bool)

(assert (=> b!486078 (= res!289681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!289677 () Bool)

(assert (=> start!44112 (=> (not res!289677) (not e!286112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44112 (= res!289677 (validMask!0 mask!3524))))

(assert (=> start!44112 e!286112))

(assert (=> start!44112 true))

(declare-fun array_inv!10934 (array!31480) Bool)

(assert (=> start!44112 (array_inv!10934 a!3235)))

(declare-fun b!486079 () Bool)

(declare-fun res!289679 () Bool)

(assert (=> b!486079 (=> (not res!289679) (not e!286112))))

(declare-fun arrayContainsKey!0 (array!31480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486079 (= res!289679 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486080 () Bool)

(assert (=> b!486080 (= e!286112 e!286113)))

(declare-fun res!289680 () Bool)

(assert (=> b!486080 (=> (not res!289680) (not e!286113))))

(declare-datatypes ((SeekEntryResult!3605 0))(
  ( (MissingZero!3605 (index!16599 (_ BitVec 32))) (Found!3605 (index!16600 (_ BitVec 32))) (Intermediate!3605 (undefined!4417 Bool) (index!16601 (_ BitVec 32)) (x!45737 (_ BitVec 32))) (Undefined!3605) (MissingVacant!3605 (index!16602 (_ BitVec 32))) )
))
(declare-fun lt!219622 () SeekEntryResult!3605)

(assert (=> b!486080 (= res!289680 (or (= lt!219622 (MissingZero!3605 i!1204)) (= lt!219622 (MissingVacant!3605 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31480 (_ BitVec 32)) SeekEntryResult!3605)

(assert (=> b!486080 (= lt!219622 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44112 res!289677) b!486076))

(assert (= (and b!486076 res!289678) b!486074))

(assert (= (and b!486074 res!289682) b!486077))

(assert (= (and b!486077 res!289676) b!486079))

(assert (= (and b!486079 res!289679) b!486080))

(assert (= (and b!486080 res!289680) b!486078))

(assert (= (and b!486078 res!289681) b!486075))

(declare-fun m!466113 () Bool)

(assert (=> b!486077 m!466113))

(declare-fun m!466115 () Bool)

(assert (=> b!486079 m!466115))

(declare-fun m!466117 () Bool)

(assert (=> b!486080 m!466117))

(declare-fun m!466119 () Bool)

(assert (=> b!486074 m!466119))

(assert (=> b!486074 m!466119))

(declare-fun m!466121 () Bool)

(assert (=> b!486074 m!466121))

(declare-fun m!466123 () Bool)

(assert (=> b!486078 m!466123))

(declare-fun m!466125 () Bool)

(assert (=> start!44112 m!466125))

(declare-fun m!466127 () Bool)

(assert (=> start!44112 m!466127))

(push 1)

(assert (not b!486078))

(assert (not b!486077))

(assert (not b!486080))

(assert (not b!486079))

(assert (not start!44112))

(assert (not b!486074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!486173 () Bool)

(declare-fun e!286160 () SeekEntryResult!3605)

(declare-fun lt!219658 () SeekEntryResult!3605)

(assert (=> b!486173 (= e!286160 (Found!3605 (index!16601 lt!219658)))))

(declare-fun b!486174 () Bool)

(declare-fun e!286161 () SeekEntryResult!3605)

(assert (=> b!486174 (= e!286161 (MissingZero!3605 (index!16601 lt!219658)))))

(declare-fun b!486175 () Bool)

(declare-fun c!58490 () Bool)

(declare-fun lt!219656 () (_ BitVec 64))

(assert (=> b!486175 (= c!58490 (= lt!219656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486175 (= e!286160 e!286161)))

(declare-fun b!486176 () Bool)

(declare-fun e!286159 () SeekEntryResult!3605)

(assert (=> b!486176 (= e!286159 Undefined!3605)))

(declare-fun b!486177 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31480 (_ BitVec 32)) SeekEntryResult!3605)

(assert (=> b!486177 (= e!286161 (seekKeyOrZeroReturnVacant!0 (x!45737 lt!219658) (index!16601 lt!219658) (index!16601 lt!219658) k!2280 a!3235 mask!3524))))

(declare-fun b!486178 () Bool)

(assert (=> b!486178 (= e!286159 e!286160)))

(assert (=> b!486178 (= lt!219656 (select (arr!15138 a!3235) (index!16601 lt!219658)))))

(declare-fun c!58491 () Bool)

(assert (=> b!486178 (= c!58491 (= lt!219656 k!2280))))

(declare-fun d!77459 () Bool)

(declare-fun lt!219657 () SeekEntryResult!3605)

(assert (=> d!77459 (and (or (is-Undefined!3605 lt!219657) (not (is-Found!3605 lt!219657)) (and (bvsge (index!16600 lt!219657) #b00000000000000000000000000000000) (bvslt (index!16600 lt!219657) (size!15502 a!3235)))) (or (is-Undefined!3605 lt!219657) (is-Found!3605 lt!219657) (not (is-MissingZero!3605 lt!219657)) (and (bvsge (index!16599 lt!219657) #b00000000000000000000000000000000) (bvslt (index!16599 lt!219657) (size!15502 a!3235)))) (or (is-Undefined!3605 lt!219657) (is-Found!3605 lt!219657) (is-MissingZero!3605 lt!219657) (not (is-MissingVacant!3605 lt!219657)) (and (bvsge (index!16602 lt!219657) #b00000000000000000000000000000000) (bvslt (index!16602 lt!219657) (size!15502 a!3235)))) (or (is-Undefined!3605 lt!219657) (ite (is-Found!3605 lt!219657) (= (select (arr!15138 a!3235) (index!16600 lt!219657)) k!2280) (ite (is-MissingZero!3605 lt!219657) (= (select (arr!15138 a!3235) (index!16599 lt!219657)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3605 lt!219657) (= (select (arr!15138 a!3235) (index!16602 lt!219657)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77459 (= lt!219657 e!286159)))

(declare-fun c!58492 () Bool)

(assert (=> d!77459 (= c!58492 (and (is-Intermediate!3605 lt!219658) (undefined!4417 lt!219658)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31480 (_ BitVec 32)) SeekEntryResult!3605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77459 (= lt!219658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!77459 (validMask!0 mask!3524)))

(assert (=> d!77459 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!219657)))

(assert (= (and d!77459 c!58492) b!486176))

(assert (= (and d!77459 (not c!58492)) b!486178))

(assert (= (and b!486178 c!58491) b!486173))

(assert (= (and b!486178 (not c!58491)) b!486175))

(assert (= (and b!486175 c!58490) b!486174))

(assert (= (and b!486175 (not c!58490)) b!486177))

(declare-fun m!466175 () Bool)

(assert (=> b!486177 m!466175))

(declare-fun m!466177 () Bool)

(assert (=> b!486178 m!466177))

(declare-fun m!466179 () Bool)

(assert (=> d!77459 m!466179))

(assert (=> d!77459 m!466125))

(declare-fun m!466181 () Bool)

(assert (=> d!77459 m!466181))

(declare-fun m!466183 () Bool)

(assert (=> d!77459 m!466183))

(declare-fun m!466185 () Bool)

(assert (=> d!77459 m!466185))

(assert (=> d!77459 m!466181))

(declare-fun m!466187 () Bool)

(assert (=> d!77459 m!466187))

(assert (=> b!486080 d!77459))

(declare-fun d!77467 () Bool)

(assert (=> d!77467 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486077 d!77467))

(declare-fun b!486205 () Bool)

(declare-fun e!286180 () Bool)

(declare-fun call!31264 () Bool)

(assert (=> b!486205 (= e!286180 call!31264)))

(declare-fun bm!31261 () Bool)

(assert (=> bm!31261 (= call!31264 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!486206 () Bool)

(declare-fun e!286182 () Bool)

(assert (=> b!486206 (= e!286182 call!31264)))

(declare-fun d!77469 () Bool)

(declare-fun res!289740 () Bool)

(declare-fun e!286181 () Bool)

(assert (=> d!77469 (=> res!289740 e!286181)))

(assert (=> d!77469 (= res!289740 (bvsge #b00000000000000000000000000000000 (size!15502 a!3235)))))

(assert (=> d!77469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286181)))

(declare-fun b!486207 () Bool)

(assert (=> b!486207 (= e!286180 e!286182)))

(declare-fun lt!219677 () (_ BitVec 64))

(assert (=> b!486207 (= lt!219677 (select (arr!15138 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14190 0))(
  ( (Unit!14191) )
))
(declare-fun lt!219679 () Unit!14190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31480 (_ BitVec 64) (_ BitVec 32)) Unit!14190)

(assert (=> b!486207 (= lt!219679 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219677 #b00000000000000000000000000000000))))

(assert (=> b!486207 (arrayContainsKey!0 a!3235 lt!219677 #b00000000000000000000000000000000)))

(declare-fun lt!219678 () Unit!14190)

(assert (=> b!486207 (= lt!219678 lt!219679)))

(declare-fun res!289739 () Bool)

(assert (=> b!486207 (= res!289739 (= (seekEntryOrOpen!0 (select (arr!15138 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3605 #b00000000000000000000000000000000)))))

(assert (=> b!486207 (=> (not res!289739) (not e!286182))))

(declare-fun b!486208 () Bool)

(assert (=> b!486208 (= e!286181 e!286180)))

(declare-fun c!58501 () Bool)

(assert (=> b!486208 (= c!58501 (validKeyInArray!0 (select (arr!15138 a!3235) #b00000000000000000000000000000000)))))

