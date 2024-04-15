; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45678 () Bool)

(assert start!45678)

(declare-fun b!504252 () Bool)

(declare-fun res!305568 () Bool)

(declare-fun e!295227 () Bool)

(assert (=> b!504252 (=> res!305568 e!295227)))

(declare-fun e!295229 () Bool)

(assert (=> b!504252 (= res!305568 e!295229)))

(declare-fun res!305565 () Bool)

(assert (=> b!504252 (=> (not res!305565) (not e!295229))))

(declare-datatypes ((SeekEntryResult!4066 0))(
  ( (MissingZero!4066 (index!18452 (_ BitVec 32))) (Found!4066 (index!18453 (_ BitVec 32))) (Intermediate!4066 (undefined!4878 Bool) (index!18454 (_ BitVec 32)) (x!47478 (_ BitVec 32))) (Undefined!4066) (MissingVacant!4066 (index!18455 (_ BitVec 32))) )
))
(declare-fun lt!229498 () SeekEntryResult!4066)

(assert (=> b!504252 (= res!305565 (bvsgt #b00000000000000000000000000000000 (x!47478 lt!229498)))))

(declare-fun b!504253 () Bool)

(declare-fun res!305574 () Bool)

(declare-fun e!295223 () Bool)

(assert (=> b!504253 (=> (not res!305574) (not e!295223))))

(declare-datatypes ((array!32444 0))(
  ( (array!32445 (arr!15602 (Array (_ BitVec 32) (_ BitVec 64))) (size!15967 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32444)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504253 (= res!305574 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504254 () Bool)

(declare-fun res!305578 () Bool)

(assert (=> b!504254 (=> (not res!305578) (not e!295223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504254 (= res!305578 (validKeyInArray!0 k0!2280))))

(declare-fun b!504255 () Bool)

(declare-fun res!305571 () Bool)

(assert (=> b!504255 (=> (not res!305571) (not e!295223))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504255 (= res!305571 (and (= (size!15967 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15967 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15967 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504256 () Bool)

(declare-fun res!305576 () Bool)

(declare-fun e!295230 () Bool)

(assert (=> b!504256 (=> (not res!305576) (not e!295230))))

(declare-datatypes ((List!9799 0))(
  ( (Nil!9796) (Cons!9795 (h!10672 (_ BitVec 64)) (t!16018 List!9799)) )
))
(declare-fun arrayNoDuplicates!0 (array!32444 (_ BitVec 32) List!9799) Bool)

(assert (=> b!504256 (= res!305576 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9796))))

(declare-fun b!504257 () Bool)

(declare-fun e!295222 () Bool)

(assert (=> b!504257 (= e!295222 e!295227)))

(declare-fun res!305569 () Bool)

(assert (=> b!504257 (=> res!305569 e!295227)))

(declare-fun lt!229500 () (_ BitVec 32))

(assert (=> b!504257 (= res!305569 (or (bvsgt (x!47478 lt!229498) #b01111111111111111111111111111110) (bvslt lt!229500 #b00000000000000000000000000000000) (bvsge lt!229500 (size!15967 a!3235)) (bvslt (index!18454 lt!229498) #b00000000000000000000000000000000) (bvsge (index!18454 lt!229498) (size!15967 a!3235)) (not (= lt!229498 (Intermediate!4066 false (index!18454 lt!229498) (x!47478 lt!229498))))))))

(assert (=> b!504257 (= (index!18454 lt!229498) i!1204)))

(declare-datatypes ((Unit!15334 0))(
  ( (Unit!15335) )
))
(declare-fun lt!229501 () Unit!15334)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32444 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15334)

(assert (=> b!504257 (= lt!229501 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229500 #b00000000000000000000000000000000 (index!18454 lt!229498) (x!47478 lt!229498) mask!3524))))

(assert (=> b!504257 (and (or (= (select (arr!15602 a!3235) (index!18454 lt!229498)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15602 a!3235) (index!18454 lt!229498)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15602 a!3235) (index!18454 lt!229498)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15602 a!3235) (index!18454 lt!229498)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229494 () Unit!15334)

(declare-fun e!295226 () Unit!15334)

(assert (=> b!504257 (= lt!229494 e!295226)))

(declare-fun c!59622 () Bool)

(assert (=> b!504257 (= c!59622 (= (select (arr!15602 a!3235) (index!18454 lt!229498)) (select (arr!15602 a!3235) j!176)))))

(assert (=> b!504257 (and (bvslt (x!47478 lt!229498) #b01111111111111111111111111111110) (or (= (select (arr!15602 a!3235) (index!18454 lt!229498)) (select (arr!15602 a!3235) j!176)) (= (select (arr!15602 a!3235) (index!18454 lt!229498)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15602 a!3235) (index!18454 lt!229498)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504258 () Bool)

(declare-fun res!305572 () Bool)

(assert (=> b!504258 (=> (not res!305572) (not e!295223))))

(assert (=> b!504258 (= res!305572 (validKeyInArray!0 (select (arr!15602 a!3235) j!176)))))

(declare-fun b!504259 () Bool)

(declare-fun res!305577 () Bool)

(assert (=> b!504259 (=> (not res!305577) (not e!295230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32444 (_ BitVec 32)) Bool)

(assert (=> b!504259 (= res!305577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504260 () Bool)

(declare-fun Unit!15336 () Unit!15334)

(assert (=> b!504260 (= e!295226 Unit!15336)))

(declare-fun b!504261 () Bool)

(declare-fun res!305566 () Bool)

(assert (=> b!504261 (=> res!305566 e!295222)))

(get-info :version)

(assert (=> b!504261 (= res!305566 (or (undefined!4878 lt!229498) (not ((_ is Intermediate!4066) lt!229498))))))

(declare-fun b!504262 () Bool)

(declare-fun Unit!15337 () Unit!15334)

(assert (=> b!504262 (= e!295226 Unit!15337)))

(declare-fun lt!229492 () Unit!15334)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32444 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15334)

(assert (=> b!504262 (= lt!229492 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229500 #b00000000000000000000000000000000 (index!18454 lt!229498) (x!47478 lt!229498) mask!3524))))

(declare-fun res!305567 () Bool)

(declare-fun lt!229496 () (_ BitVec 64))

(declare-fun lt!229493 () array!32444)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32444 (_ BitVec 32)) SeekEntryResult!4066)

(assert (=> b!504262 (= res!305567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229500 lt!229496 lt!229493 mask!3524) (Intermediate!4066 false (index!18454 lt!229498) (x!47478 lt!229498))))))

(declare-fun e!295228 () Bool)

(assert (=> b!504262 (=> (not res!305567) (not e!295228))))

(assert (=> b!504262 e!295228))

(declare-fun b!504263 () Bool)

(declare-fun e!295225 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32444 (_ BitVec 32)) SeekEntryResult!4066)

(assert (=> b!504263 (= e!295225 (= (seekEntryOrOpen!0 (select (arr!15602 a!3235) j!176) a!3235 mask!3524) (Found!4066 j!176)))))

(declare-fun b!504264 () Bool)

(assert (=> b!504264 (= e!295223 e!295230)))

(declare-fun res!305579 () Bool)

(assert (=> b!504264 (=> (not res!305579) (not e!295230))))

(declare-fun lt!229497 () SeekEntryResult!4066)

(assert (=> b!504264 (= res!305579 (or (= lt!229497 (MissingZero!4066 i!1204)) (= lt!229497 (MissingVacant!4066 i!1204))))))

(assert (=> b!504264 (= lt!229497 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504265 () Bool)

(assert (=> b!504265 (= e!295227 true)))

(declare-fun lt!229491 () SeekEntryResult!4066)

(assert (=> b!504265 (= lt!229491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229500 lt!229496 lt!229493 mask!3524))))

(declare-fun res!305575 () Bool)

(assert (=> start!45678 (=> (not res!305575) (not e!295223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45678 (= res!305575 (validMask!0 mask!3524))))

(assert (=> start!45678 e!295223))

(assert (=> start!45678 true))

(declare-fun array_inv!11485 (array!32444) Bool)

(assert (=> start!45678 (array_inv!11485 a!3235)))

(declare-fun b!504266 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32444 (_ BitVec 32)) SeekEntryResult!4066)

(assert (=> b!504266 (= e!295229 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229500 (index!18454 lt!229498) (select (arr!15602 a!3235) j!176) a!3235 mask!3524) (Found!4066 j!176))))))

(declare-fun b!504267 () Bool)

(assert (=> b!504267 (= e!295230 (not e!295222))))

(declare-fun res!305570 () Bool)

(assert (=> b!504267 (=> res!305570 e!295222)))

(declare-fun lt!229495 () (_ BitVec 32))

(assert (=> b!504267 (= res!305570 (= lt!229498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229495 lt!229496 lt!229493 mask!3524)))))

(assert (=> b!504267 (= lt!229498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229500 (select (arr!15602 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504267 (= lt!229495 (toIndex!0 lt!229496 mask!3524))))

(assert (=> b!504267 (= lt!229496 (select (store (arr!15602 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504267 (= lt!229500 (toIndex!0 (select (arr!15602 a!3235) j!176) mask!3524))))

(assert (=> b!504267 (= lt!229493 (array!32445 (store (arr!15602 a!3235) i!1204 k0!2280) (size!15967 a!3235)))))

(assert (=> b!504267 e!295225))

(declare-fun res!305573 () Bool)

(assert (=> b!504267 (=> (not res!305573) (not e!295225))))

(assert (=> b!504267 (= res!305573 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229499 () Unit!15334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15334)

(assert (=> b!504267 (= lt!229499 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504268 () Bool)

(assert (=> b!504268 (= e!295228 false)))

(assert (= (and start!45678 res!305575) b!504255))

(assert (= (and b!504255 res!305571) b!504258))

(assert (= (and b!504258 res!305572) b!504254))

(assert (= (and b!504254 res!305578) b!504253))

(assert (= (and b!504253 res!305574) b!504264))

(assert (= (and b!504264 res!305579) b!504259))

(assert (= (and b!504259 res!305577) b!504256))

(assert (= (and b!504256 res!305576) b!504267))

(assert (= (and b!504267 res!305573) b!504263))

(assert (= (and b!504267 (not res!305570)) b!504261))

(assert (= (and b!504261 (not res!305566)) b!504257))

(assert (= (and b!504257 c!59622) b!504262))

(assert (= (and b!504257 (not c!59622)) b!504260))

(assert (= (and b!504262 res!305567) b!504268))

(assert (= (and b!504257 (not res!305569)) b!504252))

(assert (= (and b!504252 res!305565) b!504266))

(assert (= (and b!504252 (not res!305568)) b!504265))

(declare-fun m!484501 () Bool)

(assert (=> b!504257 m!484501))

(declare-fun m!484503 () Bool)

(assert (=> b!504257 m!484503))

(declare-fun m!484505 () Bool)

(assert (=> b!504257 m!484505))

(declare-fun m!484507 () Bool)

(assert (=> b!504264 m!484507))

(assert (=> b!504258 m!484505))

(assert (=> b!504258 m!484505))

(declare-fun m!484509 () Bool)

(assert (=> b!504258 m!484509))

(declare-fun m!484511 () Bool)

(assert (=> b!504259 m!484511))

(declare-fun m!484513 () Bool)

(assert (=> start!45678 m!484513))

(declare-fun m!484515 () Bool)

(assert (=> start!45678 m!484515))

(declare-fun m!484517 () Bool)

(assert (=> b!504262 m!484517))

(declare-fun m!484519 () Bool)

(assert (=> b!504262 m!484519))

(assert (=> b!504263 m!484505))

(assert (=> b!504263 m!484505))

(declare-fun m!484521 () Bool)

(assert (=> b!504263 m!484521))

(assert (=> b!504265 m!484519))

(declare-fun m!484523 () Bool)

(assert (=> b!504267 m!484523))

(declare-fun m!484525 () Bool)

(assert (=> b!504267 m!484525))

(declare-fun m!484527 () Bool)

(assert (=> b!504267 m!484527))

(assert (=> b!504267 m!484505))

(declare-fun m!484529 () Bool)

(assert (=> b!504267 m!484529))

(declare-fun m!484531 () Bool)

(assert (=> b!504267 m!484531))

(declare-fun m!484533 () Bool)

(assert (=> b!504267 m!484533))

(declare-fun m!484535 () Bool)

(assert (=> b!504267 m!484535))

(assert (=> b!504267 m!484505))

(declare-fun m!484537 () Bool)

(assert (=> b!504267 m!484537))

(assert (=> b!504267 m!484505))

(declare-fun m!484539 () Bool)

(assert (=> b!504253 m!484539))

(assert (=> b!504266 m!484505))

(assert (=> b!504266 m!484505))

(declare-fun m!484541 () Bool)

(assert (=> b!504266 m!484541))

(declare-fun m!484543 () Bool)

(assert (=> b!504254 m!484543))

(declare-fun m!484545 () Bool)

(assert (=> b!504256 m!484545))

(check-sat (not b!504258) (not b!504265) (not start!45678) (not b!504257) (not b!504267) (not b!504266) (not b!504263) (not b!504264) (not b!504259) (not b!504256) (not b!504262) (not b!504253) (not b!504254))
(check-sat)
