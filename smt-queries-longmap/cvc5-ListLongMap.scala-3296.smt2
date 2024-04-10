; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45720 () Bool)

(assert start!45720)

(declare-fun b!505288 () Bool)

(declare-fun res!306373 () Bool)

(declare-fun e!295802 () Bool)

(assert (=> b!505288 (=> (not res!306373) (not e!295802))))

(declare-datatypes ((array!32476 0))(
  ( (array!32477 (arr!15618 (Array (_ BitVec 32) (_ BitVec 64))) (size!15982 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32476)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505288 (= res!306373 (validKeyInArray!0 (select (arr!15618 a!3235) j!176)))))

(declare-fun b!505289 () Bool)

(declare-fun res!306370 () Bool)

(assert (=> b!505289 (=> (not res!306370) (not e!295802))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505289 (= res!306370 (and (= (size!15982 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15982 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15982 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505290 () Bool)

(declare-fun res!306381 () Bool)

(assert (=> b!505290 (=> (not res!306381) (not e!295802))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!505290 (= res!306381 (validKeyInArray!0 k!2280))))

(declare-fun b!505291 () Bool)

(declare-datatypes ((Unit!15416 0))(
  ( (Unit!15417) )
))
(declare-fun e!295804 () Unit!15416)

(declare-fun Unit!15418 () Unit!15416)

(assert (=> b!505291 (= e!295804 Unit!15418)))

(declare-fun lt!230250 () (_ BitVec 32))

(declare-fun e!295806 () Bool)

(declare-datatypes ((SeekEntryResult!4085 0))(
  ( (MissingZero!4085 (index!18528 (_ BitVec 32))) (Found!4085 (index!18529 (_ BitVec 32))) (Intermediate!4085 (undefined!4897 Bool) (index!18530 (_ BitVec 32)) (x!47542 (_ BitVec 32))) (Undefined!4085) (MissingVacant!4085 (index!18531 (_ BitVec 32))) )
))
(declare-fun lt!230252 () SeekEntryResult!4085)

(declare-fun lt!230243 () SeekEntryResult!4085)

(declare-fun b!505292 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32476 (_ BitVec 32)) SeekEntryResult!4085)

(assert (=> b!505292 (= e!295806 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230250 (index!18530 lt!230243) (select (arr!15618 a!3235) j!176) a!3235 mask!3524) lt!230252)))))

(declare-fun b!505293 () Bool)

(declare-fun e!295808 () Bool)

(assert (=> b!505293 (= e!295802 e!295808)))

(declare-fun res!306382 () Bool)

(assert (=> b!505293 (=> (not res!306382) (not e!295808))))

(declare-fun lt!230242 () SeekEntryResult!4085)

(assert (=> b!505293 (= res!306382 (or (= lt!230242 (MissingZero!4085 i!1204)) (= lt!230242 (MissingVacant!4085 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32476 (_ BitVec 32)) SeekEntryResult!4085)

(assert (=> b!505293 (= lt!230242 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!505295 () Bool)

(declare-fun e!295801 () Bool)

(assert (=> b!505295 (= e!295801 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!230251 () (_ BitVec 64))

(declare-fun lt!230254 () array!32476)

(assert (=> b!505295 (= (seekEntryOrOpen!0 lt!230251 lt!230254 mask!3524) lt!230252)))

(declare-fun lt!230248 () Unit!15416)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15416)

(assert (=> b!505295 (= lt!230248 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230250 #b00000000000000000000000000000000 (index!18530 lt!230243) (x!47542 lt!230243) mask!3524))))

(declare-fun b!505296 () Bool)

(declare-fun res!306377 () Bool)

(assert (=> b!505296 (=> res!306377 e!295801)))

(declare-fun lt!230249 () SeekEntryResult!4085)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32476 (_ BitVec 32)) SeekEntryResult!4085)

(assert (=> b!505296 (= res!306377 (not (= lt!230249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230250 lt!230251 lt!230254 mask!3524))))))

(declare-fun b!505297 () Bool)

(declare-fun e!295805 () Bool)

(assert (=> b!505297 (= e!295805 false)))

(declare-fun b!505298 () Bool)

(declare-fun res!306379 () Bool)

(assert (=> b!505298 (=> (not res!306379) (not e!295808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32476 (_ BitVec 32)) Bool)

(assert (=> b!505298 (= res!306379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505299 () Bool)

(declare-fun Unit!15419 () Unit!15416)

(assert (=> b!505299 (= e!295804 Unit!15419)))

(declare-fun lt!230245 () Unit!15416)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15416)

(assert (=> b!505299 (= lt!230245 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230250 #b00000000000000000000000000000000 (index!18530 lt!230243) (x!47542 lt!230243) mask!3524))))

(declare-fun res!306380 () Bool)

(assert (=> b!505299 (= res!306380 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230250 lt!230251 lt!230254 mask!3524) (Intermediate!4085 false (index!18530 lt!230243) (x!47542 lt!230243))))))

(assert (=> b!505299 (=> (not res!306380) (not e!295805))))

(assert (=> b!505299 e!295805))

(declare-fun b!505300 () Bool)

(declare-fun res!306383 () Bool)

(assert (=> b!505300 (=> res!306383 e!295801)))

(assert (=> b!505300 (= res!306383 e!295806)))

(declare-fun res!306378 () Bool)

(assert (=> b!505300 (=> (not res!306378) (not e!295806))))

(assert (=> b!505300 (= res!306378 (bvsgt #b00000000000000000000000000000000 (x!47542 lt!230243)))))

(declare-fun b!505301 () Bool)

(declare-fun e!295809 () Bool)

(assert (=> b!505301 (= e!295808 (not e!295809))))

(declare-fun res!306369 () Bool)

(assert (=> b!505301 (=> res!306369 e!295809)))

(assert (=> b!505301 (= res!306369 (or (= lt!230243 lt!230249) (undefined!4897 lt!230243) (not (is-Intermediate!4085 lt!230243))))))

(declare-fun lt!230253 () (_ BitVec 32))

(assert (=> b!505301 (= lt!230249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230253 lt!230251 lt!230254 mask!3524))))

(assert (=> b!505301 (= lt!230243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230250 (select (arr!15618 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505301 (= lt!230253 (toIndex!0 lt!230251 mask!3524))))

(assert (=> b!505301 (= lt!230251 (select (store (arr!15618 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505301 (= lt!230250 (toIndex!0 (select (arr!15618 a!3235) j!176) mask!3524))))

(assert (=> b!505301 (= lt!230254 (array!32477 (store (arr!15618 a!3235) i!1204 k!2280) (size!15982 a!3235)))))

(assert (=> b!505301 (= lt!230252 (Found!4085 j!176))))

(declare-fun e!295803 () Bool)

(assert (=> b!505301 e!295803))

(declare-fun res!306372 () Bool)

(assert (=> b!505301 (=> (not res!306372) (not e!295803))))

(assert (=> b!505301 (= res!306372 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230246 () Unit!15416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15416)

(assert (=> b!505301 (= lt!230246 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505302 () Bool)

(declare-fun res!306375 () Bool)

(assert (=> b!505302 (=> (not res!306375) (not e!295802))))

(declare-fun arrayContainsKey!0 (array!32476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505302 (= res!306375 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!306371 () Bool)

(assert (=> start!45720 (=> (not res!306371) (not e!295802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45720 (= res!306371 (validMask!0 mask!3524))))

(assert (=> start!45720 e!295802))

(assert (=> start!45720 true))

(declare-fun array_inv!11414 (array!32476) Bool)

(assert (=> start!45720 (array_inv!11414 a!3235)))

(declare-fun b!505294 () Bool)

(assert (=> b!505294 (= e!295809 e!295801)))

(declare-fun res!306374 () Bool)

(assert (=> b!505294 (=> res!306374 e!295801)))

(assert (=> b!505294 (= res!306374 (or (bvsgt (x!47542 lt!230243) #b01111111111111111111111111111110) (bvslt lt!230250 #b00000000000000000000000000000000) (bvsge lt!230250 (size!15982 a!3235)) (bvslt (index!18530 lt!230243) #b00000000000000000000000000000000) (bvsge (index!18530 lt!230243) (size!15982 a!3235)) (not (= lt!230243 (Intermediate!4085 false (index!18530 lt!230243) (x!47542 lt!230243))))))))

(assert (=> b!505294 (= (index!18530 lt!230243) i!1204)))

(declare-fun lt!230244 () Unit!15416)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15416)

(assert (=> b!505294 (= lt!230244 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230250 #b00000000000000000000000000000000 (index!18530 lt!230243) (x!47542 lt!230243) mask!3524))))

(assert (=> b!505294 (and (or (= (select (arr!15618 a!3235) (index!18530 lt!230243)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15618 a!3235) (index!18530 lt!230243)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15618 a!3235) (index!18530 lt!230243)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15618 a!3235) (index!18530 lt!230243)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230247 () Unit!15416)

(assert (=> b!505294 (= lt!230247 e!295804)))

(declare-fun c!59738 () Bool)

(assert (=> b!505294 (= c!59738 (= (select (arr!15618 a!3235) (index!18530 lt!230243)) (select (arr!15618 a!3235) j!176)))))

(assert (=> b!505294 (and (bvslt (x!47542 lt!230243) #b01111111111111111111111111111110) (or (= (select (arr!15618 a!3235) (index!18530 lt!230243)) (select (arr!15618 a!3235) j!176)) (= (select (arr!15618 a!3235) (index!18530 lt!230243)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15618 a!3235) (index!18530 lt!230243)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505303 () Bool)

(declare-fun res!306376 () Bool)

(assert (=> b!505303 (=> (not res!306376) (not e!295808))))

(declare-datatypes ((List!9776 0))(
  ( (Nil!9773) (Cons!9772 (h!10649 (_ BitVec 64)) (t!16004 List!9776)) )
))
(declare-fun arrayNoDuplicates!0 (array!32476 (_ BitVec 32) List!9776) Bool)

(assert (=> b!505303 (= res!306376 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9773))))

(declare-fun b!505304 () Bool)

(assert (=> b!505304 (= e!295803 (= (seekEntryOrOpen!0 (select (arr!15618 a!3235) j!176) a!3235 mask!3524) (Found!4085 j!176)))))

(assert (= (and start!45720 res!306371) b!505289))

(assert (= (and b!505289 res!306370) b!505288))

(assert (= (and b!505288 res!306373) b!505290))

(assert (= (and b!505290 res!306381) b!505302))

(assert (= (and b!505302 res!306375) b!505293))

(assert (= (and b!505293 res!306382) b!505298))

(assert (= (and b!505298 res!306379) b!505303))

(assert (= (and b!505303 res!306376) b!505301))

(assert (= (and b!505301 res!306372) b!505304))

(assert (= (and b!505301 (not res!306369)) b!505294))

(assert (= (and b!505294 c!59738) b!505299))

(assert (= (and b!505294 (not c!59738)) b!505291))

(assert (= (and b!505299 res!306380) b!505297))

(assert (= (and b!505294 (not res!306374)) b!505300))

(assert (= (and b!505300 res!306378) b!505292))

(assert (= (and b!505300 (not res!306383)) b!505296))

(assert (= (and b!505296 (not res!306377)) b!505295))

(declare-fun m!485955 () Bool)

(assert (=> b!505295 m!485955))

(declare-fun m!485957 () Bool)

(assert (=> b!505295 m!485957))

(declare-fun m!485959 () Bool)

(assert (=> b!505292 m!485959))

(assert (=> b!505292 m!485959))

(declare-fun m!485961 () Bool)

(assert (=> b!505292 m!485961))

(assert (=> b!505288 m!485959))

(assert (=> b!505288 m!485959))

(declare-fun m!485963 () Bool)

(assert (=> b!505288 m!485963))

(declare-fun m!485965 () Bool)

(assert (=> b!505301 m!485965))

(assert (=> b!505301 m!485959))

(declare-fun m!485967 () Bool)

(assert (=> b!505301 m!485967))

(declare-fun m!485969 () Bool)

(assert (=> b!505301 m!485969))

(declare-fun m!485971 () Bool)

(assert (=> b!505301 m!485971))

(declare-fun m!485973 () Bool)

(assert (=> b!505301 m!485973))

(assert (=> b!505301 m!485959))

(declare-fun m!485975 () Bool)

(assert (=> b!505301 m!485975))

(assert (=> b!505301 m!485959))

(declare-fun m!485977 () Bool)

(assert (=> b!505301 m!485977))

(declare-fun m!485979 () Bool)

(assert (=> b!505301 m!485979))

(declare-fun m!485981 () Bool)

(assert (=> b!505294 m!485981))

(declare-fun m!485983 () Bool)

(assert (=> b!505294 m!485983))

(assert (=> b!505294 m!485959))

(declare-fun m!485985 () Bool)

(assert (=> b!505296 m!485985))

(declare-fun m!485987 () Bool)

(assert (=> b!505302 m!485987))

(declare-fun m!485989 () Bool)

(assert (=> b!505290 m!485989))

(declare-fun m!485991 () Bool)

(assert (=> start!45720 m!485991))

(declare-fun m!485993 () Bool)

(assert (=> start!45720 m!485993))

(declare-fun m!485995 () Bool)

(assert (=> b!505299 m!485995))

(assert (=> b!505299 m!485985))

(assert (=> b!505304 m!485959))

(assert (=> b!505304 m!485959))

(declare-fun m!485997 () Bool)

(assert (=> b!505304 m!485997))

(declare-fun m!485999 () Bool)

(assert (=> b!505298 m!485999))

(declare-fun m!486001 () Bool)

(assert (=> b!505303 m!486001))

(declare-fun m!486003 () Bool)

(assert (=> b!505293 m!486003))

(push 1)

