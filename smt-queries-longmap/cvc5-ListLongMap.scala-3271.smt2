; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45498 () Bool)

(assert start!45498)

(declare-fun b!501157 () Bool)

(declare-fun e!293583 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!501157 (= e!293583 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(declare-datatypes ((SeekEntryResult!4010 0))(
  ( (MissingZero!4010 (index!18222 (_ BitVec 32))) (Found!4010 (index!18223 (_ BitVec 32))) (Intermediate!4010 (undefined!4822 Bool) (index!18224 (_ BitVec 32)) (x!47255 (_ BitVec 32))) (Undefined!4010) (MissingVacant!4010 (index!18225 (_ BitVec 32))) )
))
(declare-fun lt!227601 () SeekEntryResult!4010)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501157 (= (index!18224 lt!227601) i!1204)))

(declare-datatypes ((Unit!15116 0))(
  ( (Unit!15117) )
))
(declare-fun lt!227602 () Unit!15116)

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!32323 0))(
  ( (array!32324 (arr!15543 (Array (_ BitVec 32) (_ BitVec 64))) (size!15907 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32323)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!227608 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15116)

(assert (=> b!501157 (= lt!227602 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227608 #b00000000000000000000000000000000 (index!18224 lt!227601) (x!47255 lt!227601) mask!3524))))

(assert (=> b!501157 (and (or (= (select (arr!15543 a!3235) (index!18224 lt!227601)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15543 a!3235) (index!18224 lt!227601)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15543 a!3235) (index!18224 lt!227601)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15543 a!3235) (index!18224 lt!227601)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227607 () Unit!15116)

(declare-fun e!293581 () Unit!15116)

(assert (=> b!501157 (= lt!227607 e!293581)))

(declare-fun c!59411 () Bool)

(assert (=> b!501157 (= c!59411 (= (select (arr!15543 a!3235) (index!18224 lt!227601)) (select (arr!15543 a!3235) j!176)))))

(assert (=> b!501157 (and (bvslt (x!47255 lt!227601) #b01111111111111111111111111111110) (or (= (select (arr!15543 a!3235) (index!18224 lt!227601)) (select (arr!15543 a!3235) j!176)) (= (select (arr!15543 a!3235) (index!18224 lt!227601)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15543 a!3235) (index!18224 lt!227601)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501158 () Bool)

(declare-fun res!302898 () Bool)

(declare-fun e!293580 () Bool)

(assert (=> b!501158 (=> (not res!302898) (not e!293580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32323 (_ BitVec 32)) Bool)

(assert (=> b!501158 (= res!302898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501159 () Bool)

(declare-fun Unit!15118 () Unit!15116)

(assert (=> b!501159 (= e!293581 Unit!15118)))

(declare-fun lt!227606 () Unit!15116)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15116)

(assert (=> b!501159 (= lt!227606 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227608 #b00000000000000000000000000000000 (index!18224 lt!227601) (x!47255 lt!227601) mask!3524))))

(declare-fun lt!227604 () (_ BitVec 64))

(declare-fun res!302897 () Bool)

(declare-fun lt!227603 () array!32323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32323 (_ BitVec 32)) SeekEntryResult!4010)

(assert (=> b!501159 (= res!302897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227608 lt!227604 lt!227603 mask!3524) (Intermediate!4010 false (index!18224 lt!227601) (x!47255 lt!227601))))))

(declare-fun e!293582 () Bool)

(assert (=> b!501159 (=> (not res!302897) (not e!293582))))

(assert (=> b!501159 e!293582))

(declare-fun b!501160 () Bool)

(declare-fun res!302891 () Bool)

(declare-fun e!293586 () Bool)

(assert (=> b!501160 (=> (not res!302891) (not e!293586))))

(assert (=> b!501160 (= res!302891 (and (= (size!15907 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15907 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15907 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501161 () Bool)

(declare-fun Unit!15119 () Unit!15116)

(assert (=> b!501161 (= e!293581 Unit!15119)))

(declare-fun b!501163 () Bool)

(declare-fun res!302900 () Bool)

(assert (=> b!501163 (=> (not res!302900) (not e!293586))))

(declare-fun arrayContainsKey!0 (array!32323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501163 (= res!302900 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501164 () Bool)

(declare-fun res!302899 () Bool)

(assert (=> b!501164 (=> res!302899 e!293583)))

(assert (=> b!501164 (= res!302899 (or (undefined!4822 lt!227601) (not (is-Intermediate!4010 lt!227601))))))

(declare-fun b!501165 () Bool)

(assert (=> b!501165 (= e!293580 (not e!293583))))

(declare-fun res!302895 () Bool)

(assert (=> b!501165 (=> res!302895 e!293583)))

(declare-fun lt!227605 () (_ BitVec 32))

(assert (=> b!501165 (= res!302895 (= lt!227601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227605 lt!227604 lt!227603 mask!3524)))))

(assert (=> b!501165 (= lt!227601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227608 (select (arr!15543 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501165 (= lt!227605 (toIndex!0 lt!227604 mask!3524))))

(assert (=> b!501165 (= lt!227604 (select (store (arr!15543 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501165 (= lt!227608 (toIndex!0 (select (arr!15543 a!3235) j!176) mask!3524))))

(assert (=> b!501165 (= lt!227603 (array!32324 (store (arr!15543 a!3235) i!1204 k!2280) (size!15907 a!3235)))))

(declare-fun e!293585 () Bool)

(assert (=> b!501165 e!293585))

(declare-fun res!302892 () Bool)

(assert (=> b!501165 (=> (not res!302892) (not e!293585))))

(assert (=> b!501165 (= res!302892 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227599 () Unit!15116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15116)

(assert (=> b!501165 (= lt!227599 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501166 () Bool)

(assert (=> b!501166 (= e!293582 false)))

(declare-fun b!501162 () Bool)

(declare-fun res!302890 () Bool)

(assert (=> b!501162 (=> (not res!302890) (not e!293586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501162 (= res!302890 (validKeyInArray!0 (select (arr!15543 a!3235) j!176)))))

(declare-fun res!302889 () Bool)

(assert (=> start!45498 (=> (not res!302889) (not e!293586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45498 (= res!302889 (validMask!0 mask!3524))))

(assert (=> start!45498 e!293586))

(assert (=> start!45498 true))

(declare-fun array_inv!11339 (array!32323) Bool)

(assert (=> start!45498 (array_inv!11339 a!3235)))

(declare-fun b!501167 () Bool)

(assert (=> b!501167 (= e!293586 e!293580)))

(declare-fun res!302894 () Bool)

(assert (=> b!501167 (=> (not res!302894) (not e!293580))))

(declare-fun lt!227600 () SeekEntryResult!4010)

(assert (=> b!501167 (= res!302894 (or (= lt!227600 (MissingZero!4010 i!1204)) (= lt!227600 (MissingVacant!4010 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32323 (_ BitVec 32)) SeekEntryResult!4010)

(assert (=> b!501167 (= lt!227600 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501168 () Bool)

(declare-fun res!302896 () Bool)

(assert (=> b!501168 (=> (not res!302896) (not e!293586))))

(assert (=> b!501168 (= res!302896 (validKeyInArray!0 k!2280))))

(declare-fun b!501169 () Bool)

(declare-fun res!302893 () Bool)

(assert (=> b!501169 (=> (not res!302893) (not e!293580))))

(declare-datatypes ((List!9701 0))(
  ( (Nil!9698) (Cons!9697 (h!10571 (_ BitVec 64)) (t!15929 List!9701)) )
))
(declare-fun arrayNoDuplicates!0 (array!32323 (_ BitVec 32) List!9701) Bool)

(assert (=> b!501169 (= res!302893 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9698))))

(declare-fun b!501170 () Bool)

(assert (=> b!501170 (= e!293585 (= (seekEntryOrOpen!0 (select (arr!15543 a!3235) j!176) a!3235 mask!3524) (Found!4010 j!176)))))

(assert (= (and start!45498 res!302889) b!501160))

(assert (= (and b!501160 res!302891) b!501162))

(assert (= (and b!501162 res!302890) b!501168))

(assert (= (and b!501168 res!302896) b!501163))

(assert (= (and b!501163 res!302900) b!501167))

(assert (= (and b!501167 res!302894) b!501158))

(assert (= (and b!501158 res!302898) b!501169))

(assert (= (and b!501169 res!302893) b!501165))

(assert (= (and b!501165 res!302892) b!501170))

(assert (= (and b!501165 (not res!302895)) b!501164))

(assert (= (and b!501164 (not res!302899)) b!501157))

(assert (= (and b!501157 c!59411) b!501159))

(assert (= (and b!501157 (not c!59411)) b!501161))

(assert (= (and b!501159 res!302897) b!501166))

(declare-fun m!482259 () Bool)

(assert (=> b!501165 m!482259))

(declare-fun m!482261 () Bool)

(assert (=> b!501165 m!482261))

(declare-fun m!482263 () Bool)

(assert (=> b!501165 m!482263))

(declare-fun m!482265 () Bool)

(assert (=> b!501165 m!482265))

(declare-fun m!482267 () Bool)

(assert (=> b!501165 m!482267))

(declare-fun m!482269 () Bool)

(assert (=> b!501165 m!482269))

(assert (=> b!501165 m!482267))

(declare-fun m!482271 () Bool)

(assert (=> b!501165 m!482271))

(assert (=> b!501165 m!482267))

(declare-fun m!482273 () Bool)

(assert (=> b!501165 m!482273))

(declare-fun m!482275 () Bool)

(assert (=> b!501165 m!482275))

(declare-fun m!482277 () Bool)

(assert (=> b!501167 m!482277))

(assert (=> b!501162 m!482267))

(assert (=> b!501162 m!482267))

(declare-fun m!482279 () Bool)

(assert (=> b!501162 m!482279))

(declare-fun m!482281 () Bool)

(assert (=> b!501159 m!482281))

(declare-fun m!482283 () Bool)

(assert (=> b!501159 m!482283))

(declare-fun m!482285 () Bool)

(assert (=> b!501168 m!482285))

(declare-fun m!482287 () Bool)

(assert (=> b!501163 m!482287))

(declare-fun m!482289 () Bool)

(assert (=> start!45498 m!482289))

(declare-fun m!482291 () Bool)

(assert (=> start!45498 m!482291))

(declare-fun m!482293 () Bool)

(assert (=> b!501169 m!482293))

(declare-fun m!482295 () Bool)

(assert (=> b!501158 m!482295))

(declare-fun m!482297 () Bool)

(assert (=> b!501157 m!482297))

(declare-fun m!482299 () Bool)

(assert (=> b!501157 m!482299))

(assert (=> b!501157 m!482267))

(assert (=> b!501170 m!482267))

(assert (=> b!501170 m!482267))

(declare-fun m!482301 () Bool)

(assert (=> b!501170 m!482301))

(push 1)

(assert (not b!501158))

(assert (not b!501159))

(assert (not b!501170))

(assert (not b!501157))

(assert (not b!501163))

(assert (not b!501162))

(assert (not b!501168))

(assert (not b!501169))

(assert (not b!501167))

(assert (not b!501165))

(assert (not start!45498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!501324 () Bool)

(declare-fun e!293676 () SeekEntryResult!4010)

(assert (=> b!501324 (= e!293676 (Intermediate!4010 false lt!227608 #b00000000000000000000000000000000))))

(declare-fun b!501325 () Bool)

(declare-fun lt!227695 () SeekEntryResult!4010)

(assert (=> b!501325 (and (bvsge (index!18224 lt!227695) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227695) (size!15907 a!3235)))))

(declare-fun e!293674 () Bool)

(assert (=> b!501325 (= e!293674 (= (select (arr!15543 a!3235) (index!18224 lt!227695)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501326 () Bool)

(assert (=> b!501326 (and (bvsge (index!18224 lt!227695) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227695) (size!15907 a!3235)))))

(declare-fun res!302995 () Bool)

(assert (=> b!501326 (= res!302995 (= (select (arr!15543 a!3235) (index!18224 lt!227695)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501326 (=> res!302995 e!293674)))

(declare-fun b!501327 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501327 (= e!293676 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227608 #b00000000000000000000000000000000 mask!3524) (select (arr!15543 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!501328 () Bool)

(declare-fun e!293672 () Bool)

(assert (=> b!501328 (= e!293672 (bvsge (x!47255 lt!227695) #b01111111111111111111111111111110))))

(declare-fun b!501329 () Bool)

(declare-fun e!293673 () SeekEntryResult!4010)

(assert (=> b!501329 (= e!293673 (Intermediate!4010 true lt!227608 #b00000000000000000000000000000000))))

(declare-fun b!501330 () Bool)

(declare-fun e!293675 () Bool)

(assert (=> b!501330 (= e!293672 e!293675)))

(declare-fun res!302994 () Bool)

(assert (=> b!501330 (= res!302994 (and (is-Intermediate!4010 lt!227695) (not (undefined!4822 lt!227695)) (bvslt (x!47255 lt!227695) #b01111111111111111111111111111110) (bvsge (x!47255 lt!227695) #b00000000000000000000000000000000) (bvsge (x!47255 lt!227695) #b00000000000000000000000000000000)))))

(assert (=> b!501330 (=> (not res!302994) (not e!293675))))

(declare-fun b!501331 () Bool)

(assert (=> b!501331 (and (bvsge (index!18224 lt!227695) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227695) (size!15907 a!3235)))))

(declare-fun res!302996 () Bool)

(assert (=> b!501331 (= res!302996 (= (select (arr!15543 a!3235) (index!18224 lt!227695)) (select (arr!15543 a!3235) j!176)))))

(assert (=> b!501331 (=> res!302996 e!293674)))

(assert (=> b!501331 (= e!293675 e!293674)))

(declare-fun b!501332 () Bool)

(assert (=> b!501332 (= e!293673 e!293676)))

(declare-fun lt!227694 () (_ BitVec 64))

(declare-fun c!59443 () Bool)

(assert (=> b!501332 (= c!59443 (or (= lt!227694 (select (arr!15543 a!3235) j!176)) (= (bvadd lt!227694 lt!227694) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!78529 () Bool)

(assert (=> d!78529 e!293672))

(declare-fun c!59444 () Bool)

(assert (=> d!78529 (= c!59444 (and (is-Intermediate!4010 lt!227695) (undefined!4822 lt!227695)))))

(assert (=> d!78529 (= lt!227695 e!293673)))

(declare-fun c!59442 () Bool)

(assert (=> d!78529 (= c!59442 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78529 (= lt!227694 (select (arr!15543 a!3235) lt!227608))))

(assert (=> d!78529 (validMask!0 mask!3524)))

(assert (=> d!78529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227608 (select (arr!15543 a!3235) j!176) a!3235 mask!3524) lt!227695)))

(assert (= (and d!78529 c!59442) b!501329))

(assert (= (and d!78529 (not c!59442)) b!501332))

(assert (= (and b!501332 c!59443) b!501324))

(assert (= (and b!501332 (not c!59443)) b!501327))

(assert (= (and d!78529 c!59444) b!501328))

(assert (= (and d!78529 (not c!59444)) b!501330))

(assert (= (and b!501330 res!302994) b!501331))

(assert (= (and b!501331 (not res!302996)) b!501326))

(assert (= (and b!501326 (not res!302995)) b!501325))

(declare-fun m!482433 () Bool)

(assert (=> b!501325 m!482433))

(assert (=> b!501326 m!482433))

(declare-fun m!482435 () Bool)

(assert (=> d!78529 m!482435))

(assert (=> d!78529 m!482289))

(assert (=> b!501331 m!482433))

(declare-fun m!482437 () Bool)

(assert (=> b!501327 m!482437))

(assert (=> b!501327 m!482437))

(assert (=> b!501327 m!482267))

(declare-fun m!482439 () Bool)

(assert (=> b!501327 m!482439))

(assert (=> b!501165 d!78529))

(declare-fun d!78541 () Bool)

(declare-fun lt!227710 () (_ BitVec 32))

(declare-fun lt!227709 () (_ BitVec 32))

(assert (=> d!78541 (= lt!227710 (bvmul (bvxor lt!227709 (bvlshr lt!227709 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78541 (= lt!227709 ((_ extract 31 0) (bvand (bvxor (select (arr!15543 a!3235) j!176) (bvlshr (select (arr!15543 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78541 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!302997 (let ((h!10574 ((_ extract 31 0) (bvand (bvxor (select (arr!15543 a!3235) j!176) (bvlshr (select (arr!15543 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47259 (bvmul (bvxor h!10574 (bvlshr h!10574 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47259 (bvlshr x!47259 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!302997 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!302997 #b00000000000000000000000000000000))))))

(assert (=> d!78541 (= (toIndex!0 (select (arr!15543 a!3235) j!176) mask!3524) (bvand (bvxor lt!227710 (bvlshr lt!227710 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!501165 d!78541))

(declare-fun call!31460 () Bool)

(declare-fun bm!31457 () Bool)

(assert (=> bm!31457 (= call!31460 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!501368 () Bool)

(declare-fun e!293701 () Bool)

(assert (=> b!501368 (= e!293701 call!31460)))

(declare-fun b!501369 () Bool)

(declare-fun e!293699 () Bool)

(assert (=> b!501369 (= e!293699 call!31460)))

(declare-fun b!501370 () Bool)

(assert (=> b!501370 (= e!293701 e!293699)))

(declare-fun lt!227727 () (_ BitVec 64))

(assert (=> b!501370 (= lt!227727 (select (arr!15543 a!3235) j!176))))

(declare-fun lt!227726 () Unit!15116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32323 (_ BitVec 64) (_ BitVec 32)) Unit!15116)

(assert (=> b!501370 (= lt!227726 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227727 j!176))))

(assert (=> b!501370 (arrayContainsKey!0 a!3235 lt!227727 #b00000000000000000000000000000000)))

(declare-fun lt!227728 () Unit!15116)

(assert (=> b!501370 (= lt!227728 lt!227726)))

(declare-fun res!303008 () Bool)

(assert (=> b!501370 (= res!303008 (= (seekEntryOrOpen!0 (select (arr!15543 a!3235) j!176) a!3235 mask!3524) (Found!4010 j!176)))))

(assert (=> b!501370 (=> (not res!303008) (not e!293699))))

(declare-fun d!78545 () Bool)

(declare-fun res!303007 () Bool)

(declare-fun e!293700 () Bool)

(assert (=> d!78545 (=> res!303007 e!293700)))

(assert (=> d!78545 (= res!303007 (bvsge j!176 (size!15907 a!3235)))))

(assert (=> d!78545 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!293700)))

(declare-fun b!501371 () Bool)

(assert (=> b!501371 (= e!293700 e!293701)))

(declare-fun c!59458 () Bool)

(assert (=> b!501371 (= c!59458 (validKeyInArray!0 (select (arr!15543 a!3235) j!176)))))

(assert (= (and d!78545 (not res!303007)) b!501371))

(assert (= (and b!501371 c!59458) b!501370))

(assert (= (and b!501371 (not c!59458)) b!501368))

(assert (= (and b!501370 res!303008) b!501369))

(assert (= (or b!501369 b!501368) bm!31457))

(declare-fun m!482457 () Bool)

(assert (=> bm!31457 m!482457))

(assert (=> b!501370 m!482267))

(declare-fun m!482459 () Bool)

(assert (=> b!501370 m!482459))

(declare-fun m!482461 () Bool)

(assert (=> b!501370 m!482461))

(assert (=> b!501370 m!482267))

(assert (=> b!501370 m!482301))

(assert (=> b!501371 m!482267))

(assert (=> b!501371 m!482267))

(assert (=> b!501371 m!482279))

(assert (=> b!501165 d!78545))

(declare-fun d!78549 () Bool)

(declare-fun lt!227730 () (_ BitVec 32))

(declare-fun lt!227729 () (_ BitVec 32))

(assert (=> d!78549 (= lt!227730 (bvmul (bvxor lt!227729 (bvlshr lt!227729 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78549 (= lt!227729 ((_ extract 31 0) (bvand (bvxor lt!227604 (bvlshr lt!227604 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78549 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!302997 (let ((h!10574 ((_ extract 31 0) (bvand (bvxor lt!227604 (bvlshr lt!227604 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47259 (bvmul (bvxor h!10574 (bvlshr h!10574 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47259 (bvlshr x!47259 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!302997 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!302997 #b00000000000000000000000000000000))))))

(assert (=> d!78549 (= (toIndex!0 lt!227604 mask!3524) (bvand (bvxor lt!227730 (bvlshr lt!227730 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!501165 d!78549))

(declare-fun d!78551 () Bool)

(assert (=> d!78551 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!227736 () Unit!15116)

(declare-fun choose!38 (array!32323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15116)

(assert (=> d!78551 (= lt!227736 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78551 (validMask!0 mask!3524)))

(assert (=> d!78551 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!227736)))

(declare-fun bs!15928 () Bool)

(assert (= bs!15928 d!78551))

(assert (=> bs!15928 m!482271))

(declare-fun m!482469 () Bool)

(assert (=> bs!15928 m!482469))

(assert (=> bs!15928 m!482289))

(assert (=> b!501165 d!78551))

(declare-fun b!501378 () Bool)

(declare-fun e!293711 () SeekEntryResult!4010)

(assert (=> b!501378 (= e!293711 (Intermediate!4010 false lt!227605 #b00000000000000000000000000000000))))

(declare-fun b!501379 () Bool)

(declare-fun lt!227738 () SeekEntryResult!4010)

(assert (=> b!501379 (and (bvsge (index!18224 lt!227738) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227738) (size!15907 lt!227603)))))

(declare-fun e!293709 () Bool)

(assert (=> b!501379 (= e!293709 (= (select (arr!15543 lt!227603) (index!18224 lt!227738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501380 () Bool)

(assert (=> b!501380 (and (bvsge (index!18224 lt!227738) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227738) (size!15907 lt!227603)))))

(declare-fun res!303014 () Bool)

(assert (=> b!501380 (= res!303014 (= (select (arr!15543 lt!227603) (index!18224 lt!227738)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501380 (=> res!303014 e!293709)))

(declare-fun b!501381 () Bool)

(assert (=> b!501381 (= e!293711 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227605 #b00000000000000000000000000000000 mask!3524) lt!227604 lt!227603 mask!3524))))

(declare-fun b!501382 () Bool)

(declare-fun e!293707 () Bool)

(assert (=> b!501382 (= e!293707 (bvsge (x!47255 lt!227738) #b01111111111111111111111111111110))))

(declare-fun b!501383 () Bool)

(declare-fun e!293708 () SeekEntryResult!4010)

(assert (=> b!501383 (= e!293708 (Intermediate!4010 true lt!227605 #b00000000000000000000000000000000))))

(declare-fun b!501384 () Bool)

(declare-fun e!293710 () Bool)

(assert (=> b!501384 (= e!293707 e!293710)))

(declare-fun res!303013 () Bool)

(assert (=> b!501384 (= res!303013 (and (is-Intermediate!4010 lt!227738) (not (undefined!4822 lt!227738)) (bvslt (x!47255 lt!227738) #b01111111111111111111111111111110) (bvsge (x!47255 lt!227738) #b00000000000000000000000000000000) (bvsge (x!47255 lt!227738) #b00000000000000000000000000000000)))))

(assert (=> b!501384 (=> (not res!303013) (not e!293710))))

(declare-fun b!501385 () Bool)

(assert (=> b!501385 (and (bvsge (index!18224 lt!227738) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227738) (size!15907 lt!227603)))))

(declare-fun res!303015 () Bool)

(assert (=> b!501385 (= res!303015 (= (select (arr!15543 lt!227603) (index!18224 lt!227738)) lt!227604))))

(assert (=> b!501385 (=> res!303015 e!293709)))

(assert (=> b!501385 (= e!293710 e!293709)))

(declare-fun b!501386 () Bool)

(assert (=> b!501386 (= e!293708 e!293711)))

(declare-fun c!59461 () Bool)

(declare-fun lt!227737 () (_ BitVec 64))

(assert (=> b!501386 (= c!59461 (or (= lt!227737 lt!227604) (= (bvadd lt!227737 lt!227737) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!78555 () Bool)

(assert (=> d!78555 e!293707))

(declare-fun c!59462 () Bool)

(assert (=> d!78555 (= c!59462 (and (is-Intermediate!4010 lt!227738) (undefined!4822 lt!227738)))))

(assert (=> d!78555 (= lt!227738 e!293708)))

(declare-fun c!59460 () Bool)

(assert (=> d!78555 (= c!59460 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78555 (= lt!227737 (select (arr!15543 lt!227603) lt!227605))))

(assert (=> d!78555 (validMask!0 mask!3524)))

(assert (=> d!78555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227605 lt!227604 lt!227603 mask!3524) lt!227738)))

(assert (= (and d!78555 c!59460) b!501383))

(assert (= (and d!78555 (not c!59460)) b!501386))

(assert (= (and b!501386 c!59461) b!501378))

(assert (= (and b!501386 (not c!59461)) b!501381))

(assert (= (and d!78555 c!59462) b!501382))

(assert (= (and d!78555 (not c!59462)) b!501384))

(assert (= (and b!501384 res!303013) b!501385))

(assert (= (and b!501385 (not res!303015)) b!501380))

(assert (= (and b!501380 (not res!303014)) b!501379))

(declare-fun m!482471 () Bool)

(assert (=> b!501379 m!482471))

(assert (=> b!501380 m!482471))

(declare-fun m!482473 () Bool)

(assert (=> d!78555 m!482473))

(assert (=> d!78555 m!482289))

(assert (=> b!501385 m!482471))

(declare-fun m!482475 () Bool)

(assert (=> b!501381 m!482475))

(assert (=> b!501381 m!482475))

(declare-fun m!482477 () Bool)

(assert (=> b!501381 m!482477))

(assert (=> b!501165 d!78555))

(declare-fun d!78557 () Bool)

(assert (=> d!78557 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45498 d!78557))

(declare-fun d!78563 () Bool)

(assert (=> d!78563 (= (array_inv!11339 a!3235) (bvsge (size!15907 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45498 d!78563))

(declare-fun b!501487 () Bool)

(declare-fun e!293771 () SeekEntryResult!4010)

(declare-fun lt!227790 () SeekEntryResult!4010)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32323 (_ BitVec 32)) SeekEntryResult!4010)

(assert (=> b!501487 (= e!293771 (seekKeyOrZeroReturnVacant!0 (x!47255 lt!227790) (index!18224 lt!227790) (index!18224 lt!227790) (select (arr!15543 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!501488 () Bool)

(declare-fun e!293770 () SeekEntryResult!4010)

(assert (=> b!501488 (= e!293770 Undefined!4010)))

(declare-fun b!501489 () Bool)

(declare-fun e!293772 () SeekEntryResult!4010)

(assert (=> b!501489 (= e!293772 (Found!4010 (index!18224 lt!227790)))))

(declare-fun d!78565 () Bool)

(declare-fun lt!227789 () SeekEntryResult!4010)

(assert (=> d!78565 (and (or (is-Undefined!4010 lt!227789) (not (is-Found!4010 lt!227789)) (and (bvsge (index!18223 lt!227789) #b00000000000000000000000000000000) (bvslt (index!18223 lt!227789) (size!15907 a!3235)))) (or (is-Undefined!4010 lt!227789) (is-Found!4010 lt!227789) (not (is-MissingZero!4010 lt!227789)) (and (bvsge (index!18222 lt!227789) #b00000000000000000000000000000000) (bvslt (index!18222 lt!227789) (size!15907 a!3235)))) (or (is-Undefined!4010 lt!227789) (is-Found!4010 lt!227789) (is-MissingZero!4010 lt!227789) (not (is-MissingVacant!4010 lt!227789)) (and (bvsge (index!18225 lt!227789) #b00000000000000000000000000000000) (bvslt (index!18225 lt!227789) (size!15907 a!3235)))) (or (is-Undefined!4010 lt!227789) (ite (is-Found!4010 lt!227789) (= (select (arr!15543 a!3235) (index!18223 lt!227789)) (select (arr!15543 a!3235) j!176)) (ite (is-MissingZero!4010 lt!227789) (= (select (arr!15543 a!3235) (index!18222 lt!227789)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4010 lt!227789) (= (select (arr!15543 a!3235) (index!18225 lt!227789)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78565 (= lt!227789 e!293770)))

(declare-fun c!59498 () Bool)

(assert (=> d!78565 (= c!59498 (and (is-Intermediate!4010 lt!227790) (undefined!4822 lt!227790)))))

(assert (=> d!78565 (= lt!227790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15543 a!3235) j!176) mask!3524) (select (arr!15543 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78565 (validMask!0 mask!3524)))

(assert (=> d!78565 (= (seekEntryOrOpen!0 (select (arr!15543 a!3235) j!176) a!3235 mask!3524) lt!227789)))

(declare-fun b!501490 () Bool)

(assert (=> b!501490 (= e!293771 (MissingZero!4010 (index!18224 lt!227790)))))

(declare-fun b!501491 () Bool)

(declare-fun c!59499 () Bool)

(declare-fun lt!227791 () (_ BitVec 64))

(assert (=> b!501491 (= c!59499 (= lt!227791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501491 (= e!293772 e!293771)))

(declare-fun b!501492 () Bool)

(assert (=> b!501492 (= e!293770 e!293772)))

(assert (=> b!501492 (= lt!227791 (select (arr!15543 a!3235) (index!18224 lt!227790)))))

(declare-fun c!59497 () Bool)

(assert (=> b!501492 (= c!59497 (= lt!227791 (select (arr!15543 a!3235) j!176)))))

(assert (= (and d!78565 c!59498) b!501488))

(assert (= (and d!78565 (not c!59498)) b!501492))

(assert (= (and b!501492 c!59497) b!501489))

(assert (= (and b!501492 (not c!59497)) b!501491))

(assert (= (and b!501491 c!59499) b!501490))

(assert (= (and b!501491 (not c!59499)) b!501487))

(assert (=> b!501487 m!482267))

(declare-fun m!482537 () Bool)

(assert (=> b!501487 m!482537))

(assert (=> d!78565 m!482267))

(assert (=> d!78565 m!482269))

(declare-fun m!482539 () Bool)

(assert (=> d!78565 m!482539))

(declare-fun m!482541 () Bool)

(assert (=> d!78565 m!482541))

(assert (=> d!78565 m!482289))

(assert (=> d!78565 m!482269))

(assert (=> d!78565 m!482267))

(declare-fun m!482543 () Bool)

(assert (=> d!78565 m!482543))

(declare-fun m!482545 () Bool)

(assert (=> d!78565 m!482545))

(declare-fun m!482547 () Bool)

(assert (=> b!501492 m!482547))

(assert (=> b!501170 d!78565))

(declare-fun e!293774 () SeekEntryResult!4010)

(declare-fun b!501493 () Bool)

(declare-fun lt!227793 () SeekEntryResult!4010)

(assert (=> b!501493 (= e!293774 (seekKeyOrZeroReturnVacant!0 (x!47255 lt!227793) (index!18224 lt!227793) (index!18224 lt!227793) k!2280 a!3235 mask!3524))))

(declare-fun b!501494 () Bool)

(declare-fun e!293773 () SeekEntryResult!4010)

(assert (=> b!501494 (= e!293773 Undefined!4010)))

(declare-fun b!501495 () Bool)

(declare-fun e!293775 () SeekEntryResult!4010)

(assert (=> b!501495 (= e!293775 (Found!4010 (index!18224 lt!227793)))))

(declare-fun d!78597 () Bool)

(declare-fun lt!227792 () SeekEntryResult!4010)

(assert (=> d!78597 (and (or (is-Undefined!4010 lt!227792) (not (is-Found!4010 lt!227792)) (and (bvsge (index!18223 lt!227792) #b00000000000000000000000000000000) (bvslt (index!18223 lt!227792) (size!15907 a!3235)))) (or (is-Undefined!4010 lt!227792) (is-Found!4010 lt!227792) (not (is-MissingZero!4010 lt!227792)) (and (bvsge (index!18222 lt!227792) #b00000000000000000000000000000000) (bvslt (index!18222 lt!227792) (size!15907 a!3235)))) (or (is-Undefined!4010 lt!227792) (is-Found!4010 lt!227792) (is-MissingZero!4010 lt!227792) (not (is-MissingVacant!4010 lt!227792)) (and (bvsge (index!18225 lt!227792) #b00000000000000000000000000000000) (bvslt (index!18225 lt!227792) (size!15907 a!3235)))) (or (is-Undefined!4010 lt!227792) (ite (is-Found!4010 lt!227792) (= (select (arr!15543 a!3235) (index!18223 lt!227792)) k!2280) (ite (is-MissingZero!4010 lt!227792) (= (select (arr!15543 a!3235) (index!18222 lt!227792)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4010 lt!227792) (= (select (arr!15543 a!3235) (index!18225 lt!227792)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78597 (= lt!227792 e!293773)))

(declare-fun c!59501 () Bool)

(assert (=> d!78597 (= c!59501 (and (is-Intermediate!4010 lt!227793) (undefined!4822 lt!227793)))))

(assert (=> d!78597 (= lt!227793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78597 (validMask!0 mask!3524)))

(assert (=> d!78597 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!227792)))

(declare-fun b!501496 () Bool)

(assert (=> b!501496 (= e!293774 (MissingZero!4010 (index!18224 lt!227793)))))

(declare-fun b!501497 () Bool)

(declare-fun c!59502 () Bool)

(declare-fun lt!227794 () (_ BitVec 64))

(assert (=> b!501497 (= c!59502 (= lt!227794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501497 (= e!293775 e!293774)))

(declare-fun b!501498 () Bool)

(assert (=> b!501498 (= e!293773 e!293775)))

(assert (=> b!501498 (= lt!227794 (select (arr!15543 a!3235) (index!18224 lt!227793)))))

(declare-fun c!59500 () Bool)

(assert (=> b!501498 (= c!59500 (= lt!227794 k!2280))))

(assert (= (and d!78597 c!59501) b!501494))

(assert (= (and d!78597 (not c!59501)) b!501498))

(assert (= (and b!501498 c!59500) b!501495))

(assert (= (and b!501498 (not c!59500)) b!501497))

(assert (= (and b!501497 c!59502) b!501496))

(assert (= (and b!501497 (not c!59502)) b!501493))

(declare-fun m!482549 () Bool)

(assert (=> b!501493 m!482549))

(declare-fun m!482551 () Bool)

(assert (=> d!78597 m!482551))

(declare-fun m!482553 () Bool)

(assert (=> d!78597 m!482553))

(declare-fun m!482555 () Bool)

(assert (=> d!78597 m!482555))

(assert (=> d!78597 m!482289))

(assert (=> d!78597 m!482551))

(declare-fun m!482557 () Bool)

(assert (=> d!78597 m!482557))

(declare-fun m!482559 () Bool)

(assert (=> d!78597 m!482559))

(declare-fun m!482561 () Bool)

(assert (=> b!501498 m!482561))

(assert (=> b!501167 d!78597))

(declare-fun d!78601 () Bool)

(declare-fun res!303057 () Bool)

(declare-fun e!293785 () Bool)

(assert (=> d!78601 (=> res!303057 e!293785)))

(assert (=> d!78601 (= res!303057 (= (select (arr!15543 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78601 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!293785)))

(declare-fun b!501512 () Bool)

(declare-fun e!293786 () Bool)

(assert (=> b!501512 (= e!293785 e!293786)))

(declare-fun res!303058 () Bool)

(assert (=> b!501512 (=> (not res!303058) (not e!293786))))

(assert (=> b!501512 (= res!303058 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15907 a!3235)))))

(declare-fun b!501513 () Bool)

(assert (=> b!501513 (= e!293786 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78601 (not res!303057)) b!501512))

(assert (= (and b!501512 res!303058) b!501513))

(declare-fun m!482573 () Bool)

(assert (=> d!78601 m!482573))

(declare-fun m!482575 () Bool)

(assert (=> b!501513 m!482575))

(assert (=> b!501163 d!78601))

(declare-fun d!78607 () Bool)

(assert (=> d!78607 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!501168 d!78607))

(declare-fun d!78609 () Bool)

(assert (=> d!78609 (= (index!18224 lt!227601) i!1204)))

(declare-fun lt!227805 () Unit!15116)

(declare-fun choose!104 (array!32323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15116)

(assert (=> d!78609 (= lt!227805 (choose!104 a!3235 i!1204 k!2280 j!176 lt!227608 #b00000000000000000000000000000000 (index!18224 lt!227601) (x!47255 lt!227601) mask!3524))))

(assert (=> d!78609 (validMask!0 mask!3524)))

(assert (=> d!78609 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227608 #b00000000000000000000000000000000 (index!18224 lt!227601) (x!47255 lt!227601) mask!3524) lt!227805)))

(declare-fun bs!15933 () Bool)

(assert (= bs!15933 d!78609))

(declare-fun m!482581 () Bool)

(assert (=> bs!15933 m!482581))

(assert (=> bs!15933 m!482289))

(assert (=> b!501157 d!78609))

(declare-fun d!78613 () Bool)

(assert (=> d!78613 (= (validKeyInArray!0 (select (arr!15543 a!3235) j!176)) (and (not (= (select (arr!15543 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15543 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!501162 d!78613))

(declare-fun d!78615 () Bool)

(declare-fun e!293795 () Bool)

(assert (=> d!78615 e!293795))

(declare-fun res!303067 () Bool)

(assert (=> d!78615 (=> (not res!303067) (not e!293795))))

(assert (=> d!78615 (= res!303067 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15907 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15907 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15907 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15907 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15907 a!3235))))))

(declare-fun lt!227808 () Unit!15116)

(declare-fun choose!47 (array!32323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15116)

(assert (=> d!78615 (= lt!227808 (choose!47 a!3235 i!1204 k!2280 j!176 lt!227608 #b00000000000000000000000000000000 (index!18224 lt!227601) (x!47255 lt!227601) mask!3524))))

(assert (=> d!78615 (validMask!0 mask!3524)))

(assert (=> d!78615 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227608 #b00000000000000000000000000000000 (index!18224 lt!227601) (x!47255 lt!227601) mask!3524) lt!227808)))

(declare-fun b!501522 () Bool)

(assert (=> b!501522 (= e!293795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227608 (select (store (arr!15543 a!3235) i!1204 k!2280) j!176) (array!32324 (store (arr!15543 a!3235) i!1204 k!2280) (size!15907 a!3235)) mask!3524) (Intermediate!4010 false (index!18224 lt!227601) (x!47255 lt!227601))))))

(assert (= (and d!78615 res!303067) b!501522))

(declare-fun m!482583 () Bool)

(assert (=> d!78615 m!482583))

(assert (=> d!78615 m!482289))

(assert (=> b!501522 m!482259))

(assert (=> b!501522 m!482263))

(assert (=> b!501522 m!482263))

(declare-fun m!482585 () Bool)

(assert (=> b!501522 m!482585))

(assert (=> b!501159 d!78615))

(declare-fun b!501523 () Bool)

(declare-fun e!293800 () SeekEntryResult!4010)

(assert (=> b!501523 (= e!293800 (Intermediate!4010 false lt!227608 #b00000000000000000000000000000000))))

(declare-fun b!501524 () Bool)

(declare-fun lt!227810 () SeekEntryResult!4010)

(assert (=> b!501524 (and (bvsge (index!18224 lt!227810) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227810) (size!15907 lt!227603)))))

(declare-fun e!293798 () Bool)

(assert (=> b!501524 (= e!293798 (= (select (arr!15543 lt!227603) (index!18224 lt!227810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501525 () Bool)

(assert (=> b!501525 (and (bvsge (index!18224 lt!227810) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227810) (size!15907 lt!227603)))))

(declare-fun res!303069 () Bool)

(assert (=> b!501525 (= res!303069 (= (select (arr!15543 lt!227603) (index!18224 lt!227810)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501525 (=> res!303069 e!293798)))

(declare-fun b!501526 () Bool)

(assert (=> b!501526 (= e!293800 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227608 #b00000000000000000000000000000000 mask!3524) lt!227604 lt!227603 mask!3524))))

(declare-fun b!501527 () Bool)

(declare-fun e!293796 () Bool)

(assert (=> b!501527 (= e!293796 (bvsge (x!47255 lt!227810) #b01111111111111111111111111111110))))

(declare-fun b!501528 () Bool)

(declare-fun e!293797 () SeekEntryResult!4010)

(assert (=> b!501528 (= e!293797 (Intermediate!4010 true lt!227608 #b00000000000000000000000000000000))))

(declare-fun b!501529 () Bool)

(declare-fun e!293799 () Bool)

(assert (=> b!501529 (= e!293796 e!293799)))

(declare-fun res!303068 () Bool)

(assert (=> b!501529 (= res!303068 (and (is-Intermediate!4010 lt!227810) (not (undefined!4822 lt!227810)) (bvslt (x!47255 lt!227810) #b01111111111111111111111111111110) (bvsge (x!47255 lt!227810) #b00000000000000000000000000000000) (bvsge (x!47255 lt!227810) #b00000000000000000000000000000000)))))

(assert (=> b!501529 (=> (not res!303068) (not e!293799))))

(declare-fun b!501530 () Bool)

(assert (=> b!501530 (and (bvsge (index!18224 lt!227810) #b00000000000000000000000000000000) (bvslt (index!18224 lt!227810) (size!15907 lt!227603)))))

(declare-fun res!303070 () Bool)

(assert (=> b!501530 (= res!303070 (= (select (arr!15543 lt!227603) (index!18224 lt!227810)) lt!227604))))

(assert (=> b!501530 (=> res!303070 e!293798)))

(assert (=> b!501530 (= e!293799 e!293798)))

(declare-fun b!501531 () Bool)

(assert (=> b!501531 (= e!293797 e!293800)))

(declare-fun c!59507 () Bool)

(declare-fun lt!227809 () (_ BitVec 64))

(assert (=> b!501531 (= c!59507 (or (= lt!227809 lt!227604) (= (bvadd lt!227809 lt!227809) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!78621 () Bool)

(assert (=> d!78621 e!293796))

(declare-fun c!59508 () Bool)

(assert (=> d!78621 (= c!59508 (and (is-Intermediate!4010 lt!227810) (undefined!4822 lt!227810)))))

(assert (=> d!78621 (= lt!227810 e!293797)))

(declare-fun c!59506 () Bool)

(assert (=> d!78621 (= c!59506 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78621 (= lt!227809 (select (arr!15543 lt!227603) lt!227608))))

(assert (=> d!78621 (validMask!0 mask!3524)))

(assert (=> d!78621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227608 lt!227604 lt!227603 mask!3524) lt!227810)))

(assert (= (and d!78621 c!59506) b!501528))

(assert (= (and d!78621 (not c!59506)) b!501531))

(assert (= (and b!501531 c!59507) b!501523))

(assert (= (and b!501531 (not c!59507)) b!501526))

(assert (= (and d!78621 c!59508) b!501527))

(assert (= (and d!78621 (not c!59508)) b!501529))

(assert (= (and b!501529 res!303068) b!501530))

(assert (= (and b!501530 (not res!303070)) b!501525))

(assert (= (and b!501525 (not res!303069)) b!501524))

(declare-fun m!482587 () Bool)

(assert (=> b!501524 m!482587))

(assert (=> b!501525 m!482587))

(declare-fun m!482589 () Bool)

(assert (=> d!78621 m!482589))

(assert (=> d!78621 m!482289))

(assert (=> b!501530 m!482587))

(assert (=> b!501526 m!482437))

(assert (=> b!501526 m!482437))

(declare-fun m!482591 () Bool)

(assert (=> b!501526 m!482591))

(assert (=> b!501159 d!78621))

(declare-fun b!501558 () Bool)

(declare-fun e!293821 () Bool)

(declare-fun e!293822 () Bool)

(assert (=> b!501558 (= e!293821 e!293822)))

(declare-fun c!59515 () Bool)

(assert (=> b!501558 (= c!59515 (validKeyInArray!0 (select (arr!15543 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78623 () Bool)

(declare-fun res!303085 () Bool)

(declare-fun e!293820 () Bool)

(assert (=> d!78623 (=> res!303085 e!293820)))

(assert (=> d!78623 (= res!303085 (bvsge #b00000000000000000000000000000000 (size!15907 a!3235)))))

(assert (=> d!78623 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9698) e!293820)))

(declare-fun bm!31465 () Bool)

(declare-fun call!31468 () Bool)

(assert (=> bm!31465 (= call!31468 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59515 (Cons!9697 (select (arr!15543 a!3235) #b00000000000000000000000000000000) Nil!9698) Nil!9698)))))

(declare-fun b!501559 () Bool)

(assert (=> b!501559 (= e!293820 e!293821)))

(declare-fun res!303087 () Bool)

(assert (=> b!501559 (=> (not res!303087) (not e!293821))))

(declare-fun e!293823 () Bool)

(assert (=> b!501559 (= res!303087 (not e!293823))))

(declare-fun res!303086 () Bool)

(assert (=> b!501559 (=> (not res!303086) (not e!293823))))

(assert (=> b!501559 (= res!303086 (validKeyInArray!0 (select (arr!15543 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501560 () Bool)

(declare-fun contains!2718 (List!9701 (_ BitVec 64)) Bool)

(assert (=> b!501560 (= e!293823 (contains!2718 Nil!9698 (select (arr!15543 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501561 () Bool)

(assert (=> b!501561 (= e!293822 call!31468)))

(declare-fun b!501562 () Bool)

(assert (=> b!501562 (= e!293822 call!31468)))

(assert (= (and d!78623 (not res!303085)) b!501559))

(assert (= (and b!501559 res!303086) b!501560))

(assert (= (and b!501559 res!303087) b!501558))

(assert (= (and b!501558 c!59515) b!501562))

(assert (= (and b!501558 (not c!59515)) b!501561))

(assert (= (or b!501562 b!501561) bm!31465))

(assert (=> b!501558 m!482573))

(assert (=> b!501558 m!482573))

(declare-fun m!482611 () Bool)

(assert (=> b!501558 m!482611))

(assert (=> bm!31465 m!482573))

(declare-fun m!482615 () Bool)

(assert (=> bm!31465 m!482615))

(assert (=> b!501559 m!482573))

(assert (=> b!501559 m!482573))

(assert (=> b!501559 m!482611))

(assert (=> b!501560 m!482573))

(assert (=> b!501560 m!482573))

(declare-fun m!482617 () Bool)

(assert (=> b!501560 m!482617))

(assert (=> b!501169 d!78623))

(declare-fun bm!31466 () Bool)

(declare-fun call!31469 () Bool)

(assert (=> bm!31466 (= call!31469 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!501563 () Bool)

(declare-fun e!293826 () Bool)

(assert (=> b!501563 (= e!293826 call!31469)))

(declare-fun b!501564 () Bool)

(declare-fun e!293824 () Bool)

(assert (=> b!501564 (= e!293824 call!31469)))

(declare-fun b!501565 () Bool)

(assert (=> b!501565 (= e!293826 e!293824)))

(declare-fun lt!227820 () (_ BitVec 64))

(assert (=> b!501565 (= lt!227820 (select (arr!15543 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!227819 () Unit!15116)

(assert (=> b!501565 (= lt!227819 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227820 #b00000000000000000000000000000000))))

(assert (=> b!501565 (arrayContainsKey!0 a!3235 lt!227820 #b00000000000000000000000000000000)))

(declare-fun lt!227821 () Unit!15116)

(assert (=> b!501565 (= lt!227821 lt!227819)))

(declare-fun res!303089 () Bool)

(assert (=> b!501565 (= res!303089 (= (seekEntryOrOpen!0 (select (arr!15543 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4010 #b00000000000000000000000000000000)))))

(assert (=> b!501565 (=> (not res!303089) (not e!293824))))

(declare-fun d!78631 () Bool)

(declare-fun res!303088 () Bool)

(declare-fun e!293825 () Bool)

(assert (=> d!78631 (=> res!303088 e!293825)))

(assert (=> d!78631 (= res!303088 (bvsge #b00000000000000000000000000000000 (size!15907 a!3235)))))

(assert (=> d!78631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!293825)))

(declare-fun b!501566 () Bool)

(assert (=> b!501566 (= e!293825 e!293826)))

(declare-fun c!59516 () Bool)

(assert (=> b!501566 (= c!59516 (validKeyInArray!0 (select (arr!15543 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78631 (not res!303088)) b!501566))

(assert (= (and b!501566 c!59516) b!501565))

(assert (= (and b!501566 (not c!59516)) b!501563))

(assert (= (and b!501565 res!303089) b!501564))

(assert (= (or b!501564 b!501563) bm!31466))

(declare-fun m!482619 () Bool)

(assert (=> bm!31466 m!482619))

(assert (=> b!501565 m!482573))

(declare-fun m!482621 () Bool)

(assert (=> b!501565 m!482621))

(declare-fun m!482623 () Bool)

(assert (=> b!501565 m!482623))

(assert (=> b!501565 m!482573))

(declare-fun m!482625 () Bool)

(assert (=> b!501565 m!482625))

(assert (=> b!501566 m!482573))

(assert (=> b!501566 m!482573))

(assert (=> b!501566 m!482611))

(assert (=> b!501158 d!78631))

(push 1)

