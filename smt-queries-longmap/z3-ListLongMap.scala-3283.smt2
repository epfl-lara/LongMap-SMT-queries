; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45632 () Bool)

(assert start!45632)

(declare-fun b!503238 () Bool)

(declare-datatypes ((Unit!15223 0))(
  ( (Unit!15224) )
))
(declare-fun e!294716 () Unit!15223)

(declare-fun Unit!15225 () Unit!15223)

(assert (=> b!503238 (= e!294716 Unit!15225)))

(declare-fun b!503239 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32389 0))(
  ( (array!32390 (arr!15574 (Array (_ BitVec 32) (_ BitVec 64))) (size!15938 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32389)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!294717 () Bool)

(declare-datatypes ((SeekEntryResult!3997 0))(
  ( (MissingZero!3997 (index!18176 (_ BitVec 32))) (Found!3997 (index!18177 (_ BitVec 32))) (Intermediate!3997 (undefined!4809 Bool) (index!18178 (_ BitVec 32)) (x!47347 (_ BitVec 32))) (Undefined!3997) (MissingVacant!3997 (index!18179 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32389 (_ BitVec 32)) SeekEntryResult!3997)

(assert (=> b!503239 (= e!294717 (= (seekEntryOrOpen!0 (select (arr!15574 a!3235) j!176) a!3235 mask!3524) (Found!3997 j!176)))))

(declare-fun b!503240 () Bool)

(declare-fun e!294714 () Bool)

(assert (=> b!503240 (= e!294714 true)))

(declare-fun lt!228947 () (_ BitVec 32))

(declare-fun lt!228946 () SeekEntryResult!3997)

(declare-fun lt!228950 () (_ BitVec 64))

(declare-fun lt!228952 () array!32389)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32389 (_ BitVec 32)) SeekEntryResult!3997)

(assert (=> b!503240 (= lt!228946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228947 lt!228950 lt!228952 mask!3524))))

(declare-fun b!503241 () Bool)

(declare-fun res!304614 () Bool)

(declare-fun e!294709 () Bool)

(assert (=> b!503241 (=> (not res!304614) (not e!294709))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503241 (= res!304614 (and (= (size!15938 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15938 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15938 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503242 () Bool)

(declare-fun res!304609 () Bool)

(assert (=> b!503242 (=> (not res!304609) (not e!294709))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503242 (= res!304609 (validKeyInArray!0 k0!2280))))

(declare-fun b!503243 () Bool)

(declare-fun Unit!15226 () Unit!15223)

(assert (=> b!503243 (= e!294716 Unit!15226)))

(declare-fun lt!228953 () SeekEntryResult!3997)

(declare-fun lt!228945 () Unit!15223)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15223)

(assert (=> b!503243 (= lt!228945 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228947 #b00000000000000000000000000000000 (index!18178 lt!228953) (x!47347 lt!228953) mask!3524))))

(declare-fun res!304615 () Bool)

(assert (=> b!503243 (= res!304615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228947 lt!228950 lt!228952 mask!3524) (Intermediate!3997 false (index!18178 lt!228953) (x!47347 lt!228953))))))

(declare-fun e!294710 () Bool)

(assert (=> b!503243 (=> (not res!304615) (not e!294710))))

(assert (=> b!503243 e!294710))

(declare-fun b!503244 () Bool)

(declare-fun res!304621 () Bool)

(declare-fun e!294713 () Bool)

(assert (=> b!503244 (=> (not res!304621) (not e!294713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32389 (_ BitVec 32)) Bool)

(assert (=> b!503244 (= res!304621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503245 () Bool)

(declare-fun e!294712 () Bool)

(assert (=> b!503245 (= e!294712 e!294714)))

(declare-fun res!304619 () Bool)

(assert (=> b!503245 (=> res!304619 e!294714)))

(assert (=> b!503245 (= res!304619 (or (bvsgt (x!47347 lt!228953) #b01111111111111111111111111111110) (bvslt lt!228947 #b00000000000000000000000000000000) (bvsge lt!228947 (size!15938 a!3235)) (bvslt (index!18178 lt!228953) #b00000000000000000000000000000000) (bvsge (index!18178 lt!228953) (size!15938 a!3235)) (not (= lt!228953 (Intermediate!3997 false (index!18178 lt!228953) (x!47347 lt!228953))))))))

(assert (=> b!503245 (= (index!18178 lt!228953) i!1204)))

(declare-fun lt!228949 () Unit!15223)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15223)

(assert (=> b!503245 (= lt!228949 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228947 #b00000000000000000000000000000000 (index!18178 lt!228953) (x!47347 lt!228953) mask!3524))))

(assert (=> b!503245 (and (or (= (select (arr!15574 a!3235) (index!18178 lt!228953)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15574 a!3235) (index!18178 lt!228953)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15574 a!3235) (index!18178 lt!228953)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15574 a!3235) (index!18178 lt!228953)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228951 () Unit!15223)

(assert (=> b!503245 (= lt!228951 e!294716)))

(declare-fun c!59594 () Bool)

(assert (=> b!503245 (= c!59594 (= (select (arr!15574 a!3235) (index!18178 lt!228953)) (select (arr!15574 a!3235) j!176)))))

(assert (=> b!503245 (and (bvslt (x!47347 lt!228953) #b01111111111111111111111111111110) (or (= (select (arr!15574 a!3235) (index!18178 lt!228953)) (select (arr!15574 a!3235) j!176)) (= (select (arr!15574 a!3235) (index!18178 lt!228953)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15574 a!3235) (index!18178 lt!228953)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503246 () Bool)

(assert (=> b!503246 (= e!294713 (not e!294712))))

(declare-fun res!304611 () Bool)

(assert (=> b!503246 (=> res!304611 e!294712)))

(declare-fun lt!228954 () (_ BitVec 32))

(assert (=> b!503246 (= res!304611 (= lt!228953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228954 lt!228950 lt!228952 mask!3524)))))

(assert (=> b!503246 (= lt!228953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228947 (select (arr!15574 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503246 (= lt!228954 (toIndex!0 lt!228950 mask!3524))))

(assert (=> b!503246 (= lt!228950 (select (store (arr!15574 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503246 (= lt!228947 (toIndex!0 (select (arr!15574 a!3235) j!176) mask!3524))))

(assert (=> b!503246 (= lt!228952 (array!32390 (store (arr!15574 a!3235) i!1204 k0!2280) (size!15938 a!3235)))))

(assert (=> b!503246 e!294717))

(declare-fun res!304608 () Bool)

(assert (=> b!503246 (=> (not res!304608) (not e!294717))))

(assert (=> b!503246 (= res!304608 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228955 () Unit!15223)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15223)

(assert (=> b!503246 (= lt!228955 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503247 () Bool)

(declare-fun res!304610 () Bool)

(assert (=> b!503247 (=> (not res!304610) (not e!294709))))

(declare-fun arrayContainsKey!0 (array!32389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503247 (= res!304610 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503248 () Bool)

(declare-fun res!304616 () Bool)

(assert (=> b!503248 (=> (not res!304616) (not e!294709))))

(assert (=> b!503248 (= res!304616 (validKeyInArray!0 (select (arr!15574 a!3235) j!176)))))

(declare-fun res!304620 () Bool)

(assert (=> start!45632 (=> (not res!304620) (not e!294709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45632 (= res!304620 (validMask!0 mask!3524))))

(assert (=> start!45632 e!294709))

(assert (=> start!45632 true))

(declare-fun array_inv!11433 (array!32389) Bool)

(assert (=> start!45632 (array_inv!11433 a!3235)))

(declare-fun b!503249 () Bool)

(declare-fun res!304613 () Bool)

(assert (=> b!503249 (=> res!304613 e!294712)))

(get-info :version)

(assert (=> b!503249 (= res!304613 (or (undefined!4809 lt!228953) (not ((_ is Intermediate!3997) lt!228953))))))

(declare-fun b!503250 () Bool)

(declare-fun res!304617 () Bool)

(assert (=> b!503250 (=> res!304617 e!294714)))

(declare-fun e!294711 () Bool)

(assert (=> b!503250 (= res!304617 e!294711)))

(declare-fun res!304607 () Bool)

(assert (=> b!503250 (=> (not res!304607) (not e!294711))))

(assert (=> b!503250 (= res!304607 (bvsgt #b00000000000000000000000000000000 (x!47347 lt!228953)))))

(declare-fun b!503251 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32389 (_ BitVec 32)) SeekEntryResult!3997)

(assert (=> b!503251 (= e!294711 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228947 (index!18178 lt!228953) (select (arr!15574 a!3235) j!176) a!3235 mask!3524) (Found!3997 j!176))))))

(declare-fun b!503252 () Bool)

(assert (=> b!503252 (= e!294709 e!294713)))

(declare-fun res!304612 () Bool)

(assert (=> b!503252 (=> (not res!304612) (not e!294713))))

(declare-fun lt!228948 () SeekEntryResult!3997)

(assert (=> b!503252 (= res!304612 (or (= lt!228948 (MissingZero!3997 i!1204)) (= lt!228948 (MissingVacant!3997 i!1204))))))

(assert (=> b!503252 (= lt!228948 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503253 () Bool)

(assert (=> b!503253 (= e!294710 false)))

(declare-fun b!503254 () Bool)

(declare-fun res!304618 () Bool)

(assert (=> b!503254 (=> (not res!304618) (not e!294713))))

(declare-datatypes ((List!9639 0))(
  ( (Nil!9636) (Cons!9635 (h!10512 (_ BitVec 64)) (t!15859 List!9639)) )
))
(declare-fun arrayNoDuplicates!0 (array!32389 (_ BitVec 32) List!9639) Bool)

(assert (=> b!503254 (= res!304618 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9636))))

(assert (= (and start!45632 res!304620) b!503241))

(assert (= (and b!503241 res!304614) b!503248))

(assert (= (and b!503248 res!304616) b!503242))

(assert (= (and b!503242 res!304609) b!503247))

(assert (= (and b!503247 res!304610) b!503252))

(assert (= (and b!503252 res!304612) b!503244))

(assert (= (and b!503244 res!304621) b!503254))

(assert (= (and b!503254 res!304618) b!503246))

(assert (= (and b!503246 res!304608) b!503239))

(assert (= (and b!503246 (not res!304611)) b!503249))

(assert (= (and b!503249 (not res!304613)) b!503245))

(assert (= (and b!503245 c!59594) b!503243))

(assert (= (and b!503245 (not c!59594)) b!503238))

(assert (= (and b!503243 res!304615) b!503253))

(assert (= (and b!503245 (not res!304619)) b!503250))

(assert (= (and b!503250 res!304607) b!503251))

(assert (= (and b!503250 (not res!304617)) b!503240))

(declare-fun m!484333 () Bool)

(assert (=> b!503242 m!484333))

(declare-fun m!484335 () Bool)

(assert (=> b!503243 m!484335))

(declare-fun m!484337 () Bool)

(assert (=> b!503243 m!484337))

(declare-fun m!484339 () Bool)

(assert (=> b!503246 m!484339))

(declare-fun m!484341 () Bool)

(assert (=> b!503246 m!484341))

(declare-fun m!484343 () Bool)

(assert (=> b!503246 m!484343))

(declare-fun m!484345 () Bool)

(assert (=> b!503246 m!484345))

(declare-fun m!484347 () Bool)

(assert (=> b!503246 m!484347))

(declare-fun m!484349 () Bool)

(assert (=> b!503246 m!484349))

(declare-fun m!484351 () Bool)

(assert (=> b!503246 m!484351))

(assert (=> b!503246 m!484347))

(declare-fun m!484353 () Bool)

(assert (=> b!503246 m!484353))

(assert (=> b!503246 m!484347))

(declare-fun m!484355 () Bool)

(assert (=> b!503246 m!484355))

(declare-fun m!484357 () Bool)

(assert (=> b!503245 m!484357))

(declare-fun m!484359 () Bool)

(assert (=> b!503245 m!484359))

(assert (=> b!503245 m!484347))

(assert (=> b!503240 m!484337))

(assert (=> b!503251 m!484347))

(assert (=> b!503251 m!484347))

(declare-fun m!484361 () Bool)

(assert (=> b!503251 m!484361))

(declare-fun m!484363 () Bool)

(assert (=> b!503247 m!484363))

(declare-fun m!484365 () Bool)

(assert (=> start!45632 m!484365))

(declare-fun m!484367 () Bool)

(assert (=> start!45632 m!484367))

(declare-fun m!484369 () Bool)

(assert (=> b!503244 m!484369))

(declare-fun m!484371 () Bool)

(assert (=> b!503254 m!484371))

(declare-fun m!484373 () Bool)

(assert (=> b!503252 m!484373))

(assert (=> b!503239 m!484347))

(assert (=> b!503239 m!484347))

(declare-fun m!484375 () Bool)

(assert (=> b!503239 m!484375))

(assert (=> b!503248 m!484347))

(assert (=> b!503248 m!484347))

(declare-fun m!484377 () Bool)

(assert (=> b!503248 m!484377))

(check-sat (not b!503245) (not b!503248) (not b!503243) (not start!45632) (not b!503251) (not b!503247) (not b!503244) (not b!503252) (not b!503242) (not b!503246) (not b!503254) (not b!503239) (not b!503240))
(check-sat)
