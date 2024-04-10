; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45410 () Bool)

(assert start!45410)

(declare-fun b!499188 () Bool)

(declare-fun res!301186 () Bool)

(declare-fun e!292539 () Bool)

(assert (=> b!499188 (=> (not res!301186) (not e!292539))))

(declare-datatypes ((array!32235 0))(
  ( (array!32236 (arr!15499 (Array (_ BitVec 32) (_ BitVec 64))) (size!15863 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32235)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32235 (_ BitVec 32)) Bool)

(assert (=> b!499188 (= res!301186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!301195 () Bool)

(declare-fun e!292535 () Bool)

(assert (=> start!45410 (=> (not res!301195) (not e!292535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45410 (= res!301195 (validMask!0 mask!3524))))

(assert (=> start!45410 e!292535))

(assert (=> start!45410 true))

(declare-fun array_inv!11295 (array!32235) Bool)

(assert (=> start!45410 (array_inv!11295 a!3235)))

(declare-fun b!499189 () Bool)

(declare-datatypes ((Unit!14940 0))(
  ( (Unit!14941) )
))
(declare-fun e!292541 () Unit!14940)

(declare-fun Unit!14942 () Unit!14940)

(assert (=> b!499189 (= e!292541 Unit!14942)))

(declare-fun b!499190 () Bool)

(declare-fun e!292536 () Bool)

(assert (=> b!499190 (= e!292536 false)))

(declare-fun b!499191 () Bool)

(declare-fun e!292542 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3966 0))(
  ( (MissingZero!3966 (index!18046 (_ BitVec 32))) (Found!3966 (index!18047 (_ BitVec 32))) (Intermediate!3966 (undefined!4778 Bool) (index!18048 (_ BitVec 32)) (x!47091 (_ BitVec 32))) (Undefined!3966) (MissingVacant!3966 (index!18049 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32235 (_ BitVec 32)) SeekEntryResult!3966)

(assert (=> b!499191 (= e!292542 (= (seekEntryOrOpen!0 (select (arr!15499 a!3235) j!176) a!3235 mask!3524) (Found!3966 j!176)))))

(declare-fun b!499192 () Bool)

(declare-fun e!292540 () Bool)

(assert (=> b!499192 (= e!292540 true)))

(declare-fun lt!226287 () SeekEntryResult!3966)

(declare-fun lt!226283 () (_ BitVec 64))

(declare-fun lt!226285 () array!32235)

(declare-fun lt!226282 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32235 (_ BitVec 32)) SeekEntryResult!3966)

(assert (=> b!499192 (= lt!226287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226282 lt!226283 lt!226285 mask!3524))))

(declare-fun b!499193 () Bool)

(declare-fun res!301193 () Bool)

(declare-fun e!292538 () Bool)

(assert (=> b!499193 (=> res!301193 e!292538)))

(declare-fun lt!226286 () SeekEntryResult!3966)

(get-info :version)

(assert (=> b!499193 (= res!301193 (or (undefined!4778 lt!226286) (not ((_ is Intermediate!3966) lt!226286))))))

(declare-fun b!499194 () Bool)

(assert (=> b!499194 (= e!292535 e!292539)))

(declare-fun res!301190 () Bool)

(assert (=> b!499194 (=> (not res!301190) (not e!292539))))

(declare-fun lt!226288 () SeekEntryResult!3966)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499194 (= res!301190 (or (= lt!226288 (MissingZero!3966 i!1204)) (= lt!226288 (MissingVacant!3966 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!499194 (= lt!226288 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499195 () Bool)

(declare-fun res!301194 () Bool)

(assert (=> b!499195 (=> (not res!301194) (not e!292535))))

(declare-fun arrayContainsKey!0 (array!32235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499195 (= res!301194 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499196 () Bool)

(assert (=> b!499196 (= e!292539 (not e!292538))))

(declare-fun res!301184 () Bool)

(assert (=> b!499196 (=> res!301184 e!292538)))

(declare-fun lt!226279 () (_ BitVec 32))

(assert (=> b!499196 (= res!301184 (= lt!226286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226279 lt!226283 lt!226285 mask!3524)))))

(assert (=> b!499196 (= lt!226286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226282 (select (arr!15499 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499196 (= lt!226279 (toIndex!0 lt!226283 mask!3524))))

(assert (=> b!499196 (= lt!226283 (select (store (arr!15499 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499196 (= lt!226282 (toIndex!0 (select (arr!15499 a!3235) j!176) mask!3524))))

(assert (=> b!499196 (= lt!226285 (array!32236 (store (arr!15499 a!3235) i!1204 k0!2280) (size!15863 a!3235)))))

(assert (=> b!499196 e!292542))

(declare-fun res!301189 () Bool)

(assert (=> b!499196 (=> (not res!301189) (not e!292542))))

(assert (=> b!499196 (= res!301189 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226280 () Unit!14940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14940)

(assert (=> b!499196 (= lt!226280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499197 () Bool)

(declare-fun res!301187 () Bool)

(assert (=> b!499197 (=> (not res!301187) (not e!292535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499197 (= res!301187 (validKeyInArray!0 k0!2280))))

(declare-fun b!499198 () Bool)

(declare-fun res!301185 () Bool)

(assert (=> b!499198 (=> (not res!301185) (not e!292535))))

(assert (=> b!499198 (= res!301185 (and (= (size!15863 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15863 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15863 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499199 () Bool)

(declare-fun Unit!14943 () Unit!14940)

(assert (=> b!499199 (= e!292541 Unit!14943)))

(declare-fun lt!226284 () Unit!14940)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14940)

(assert (=> b!499199 (= lt!226284 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226282 #b00000000000000000000000000000000 (index!18048 lt!226286) (x!47091 lt!226286) mask!3524))))

(declare-fun res!301191 () Bool)

(assert (=> b!499199 (= res!301191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226282 lt!226283 lt!226285 mask!3524) (Intermediate!3966 false (index!18048 lt!226286) (x!47091 lt!226286))))))

(assert (=> b!499199 (=> (not res!301191) (not e!292536))))

(assert (=> b!499199 e!292536))

(declare-fun b!499200 () Bool)

(declare-fun res!301192 () Bool)

(assert (=> b!499200 (=> (not res!301192) (not e!292539))))

(declare-datatypes ((List!9657 0))(
  ( (Nil!9654) (Cons!9653 (h!10527 (_ BitVec 64)) (t!15885 List!9657)) )
))
(declare-fun arrayNoDuplicates!0 (array!32235 (_ BitVec 32) List!9657) Bool)

(assert (=> b!499200 (= res!301192 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9654))))

(declare-fun b!499201 () Bool)

(declare-fun res!301188 () Bool)

(assert (=> b!499201 (=> (not res!301188) (not e!292535))))

(assert (=> b!499201 (= res!301188 (validKeyInArray!0 (select (arr!15499 a!3235) j!176)))))

(declare-fun b!499202 () Bool)

(assert (=> b!499202 (= e!292538 e!292540)))

(declare-fun res!301196 () Bool)

(assert (=> b!499202 (=> res!301196 e!292540)))

(assert (=> b!499202 (= res!301196 (or (bvsgt #b00000000000000000000000000000000 (x!47091 lt!226286)) (bvsgt (x!47091 lt!226286) #b01111111111111111111111111111110) (bvslt lt!226282 #b00000000000000000000000000000000) (bvsge lt!226282 (size!15863 a!3235)) (bvslt (index!18048 lt!226286) #b00000000000000000000000000000000) (bvsge (index!18048 lt!226286) (size!15863 a!3235)) (not (= lt!226286 (Intermediate!3966 false (index!18048 lt!226286) (x!47091 lt!226286))))))))

(assert (=> b!499202 (and (or (= (select (arr!15499 a!3235) (index!18048 lt!226286)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15499 a!3235) (index!18048 lt!226286)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15499 a!3235) (index!18048 lt!226286)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15499 a!3235) (index!18048 lt!226286)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226281 () Unit!14940)

(assert (=> b!499202 (= lt!226281 e!292541)))

(declare-fun c!59279 () Bool)

(assert (=> b!499202 (= c!59279 (= (select (arr!15499 a!3235) (index!18048 lt!226286)) (select (arr!15499 a!3235) j!176)))))

(assert (=> b!499202 (and (bvslt (x!47091 lt!226286) #b01111111111111111111111111111110) (or (= (select (arr!15499 a!3235) (index!18048 lt!226286)) (select (arr!15499 a!3235) j!176)) (= (select (arr!15499 a!3235) (index!18048 lt!226286)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15499 a!3235) (index!18048 lt!226286)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45410 res!301195) b!499198))

(assert (= (and b!499198 res!301185) b!499201))

(assert (= (and b!499201 res!301188) b!499197))

(assert (= (and b!499197 res!301187) b!499195))

(assert (= (and b!499195 res!301194) b!499194))

(assert (= (and b!499194 res!301190) b!499188))

(assert (= (and b!499188 res!301186) b!499200))

(assert (= (and b!499200 res!301192) b!499196))

(assert (= (and b!499196 res!301189) b!499191))

(assert (= (and b!499196 (not res!301184)) b!499193))

(assert (= (and b!499193 (not res!301193)) b!499202))

(assert (= (and b!499202 c!59279) b!499199))

(assert (= (and b!499202 (not c!59279)) b!499189))

(assert (= (and b!499199 res!301191) b!499190))

(assert (= (and b!499202 (not res!301196)) b!499192))

(declare-fun m!480405 () Bool)

(assert (=> b!499195 m!480405))

(declare-fun m!480407 () Bool)

(assert (=> b!499194 m!480407))

(declare-fun m!480409 () Bool)

(assert (=> b!499199 m!480409))

(declare-fun m!480411 () Bool)

(assert (=> b!499199 m!480411))

(declare-fun m!480413 () Bool)

(assert (=> b!499188 m!480413))

(assert (=> b!499192 m!480411))

(declare-fun m!480415 () Bool)

(assert (=> b!499202 m!480415))

(declare-fun m!480417 () Bool)

(assert (=> b!499202 m!480417))

(declare-fun m!480419 () Bool)

(assert (=> start!45410 m!480419))

(declare-fun m!480421 () Bool)

(assert (=> start!45410 m!480421))

(assert (=> b!499201 m!480417))

(assert (=> b!499201 m!480417))

(declare-fun m!480423 () Bool)

(assert (=> b!499201 m!480423))

(declare-fun m!480425 () Bool)

(assert (=> b!499196 m!480425))

(declare-fun m!480427 () Bool)

(assert (=> b!499196 m!480427))

(declare-fun m!480429 () Bool)

(assert (=> b!499196 m!480429))

(assert (=> b!499196 m!480417))

(declare-fun m!480431 () Bool)

(assert (=> b!499196 m!480431))

(assert (=> b!499196 m!480417))

(declare-fun m!480433 () Bool)

(assert (=> b!499196 m!480433))

(declare-fun m!480435 () Bool)

(assert (=> b!499196 m!480435))

(declare-fun m!480437 () Bool)

(assert (=> b!499196 m!480437))

(assert (=> b!499196 m!480417))

(declare-fun m!480439 () Bool)

(assert (=> b!499196 m!480439))

(assert (=> b!499191 m!480417))

(assert (=> b!499191 m!480417))

(declare-fun m!480441 () Bool)

(assert (=> b!499191 m!480441))

(declare-fun m!480443 () Bool)

(assert (=> b!499197 m!480443))

(declare-fun m!480445 () Bool)

(assert (=> b!499200 m!480445))

(check-sat (not b!499194) (not b!499192) (not start!45410) (not b!499188) (not b!499201) (not b!499197) (not b!499199) (not b!499191) (not b!499196) (not b!499195) (not b!499200))
(check-sat)
