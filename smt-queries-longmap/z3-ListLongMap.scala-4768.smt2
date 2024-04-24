; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65796 () Bool)

(assert start!65796)

(declare-fun b!753204 () Bool)

(declare-fun res!508474 () Bool)

(declare-fun e!420197 () Bool)

(assert (=> b!753204 (=> (not res!508474) (not e!420197))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41839 0))(
  ( (array!41840 (arr!20029 (Array (_ BitVec 32) (_ BitVec 64))) (size!20449 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41839)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753204 (= res!508474 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20029 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753205 () Bool)

(declare-fun res!508469 () Bool)

(declare-fun e!420205 () Bool)

(assert (=> b!753205 (=> (not res!508469) (not e!420205))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753205 (= res!508469 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753206 () Bool)

(declare-fun e!420196 () Bool)

(assert (=> b!753206 (= e!420197 e!420196)))

(declare-fun res!508464 () Bool)

(assert (=> b!753206 (=> (not res!508464) (not e!420196))))

(declare-datatypes ((SeekEntryResult!7585 0))(
  ( (MissingZero!7585 (index!32708 (_ BitVec 32))) (Found!7585 (index!32709 (_ BitVec 32))) (Intermediate!7585 (undefined!8397 Bool) (index!32710 (_ BitVec 32)) (x!63787 (_ BitVec 32))) (Undefined!7585) (MissingVacant!7585 (index!32711 (_ BitVec 32))) )
))
(declare-fun lt!335030 () SeekEntryResult!7585)

(declare-fun lt!335024 () SeekEntryResult!7585)

(assert (=> b!753206 (= res!508464 (= lt!335030 lt!335024))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!335025 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!335033 () array!41839)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41839 (_ BitVec 32)) SeekEntryResult!7585)

(assert (=> b!753206 (= lt!335024 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335025 lt!335033 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753206 (= lt!335030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335025 mask!3328) lt!335025 lt!335033 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!753206 (= lt!335025 (select (store (arr!20029 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753206 (= lt!335033 (array!41840 (store (arr!20029 a!3186) i!1173 k0!2102) (size!20449 a!3186)))))

(declare-fun b!753207 () Bool)

(declare-fun e!420206 () Bool)

(assert (=> b!753207 (= e!420206 e!420197)))

(declare-fun res!508460 () Bool)

(assert (=> b!753207 (=> (not res!508460) (not e!420197))))

(declare-fun lt!335029 () SeekEntryResult!7585)

(assert (=> b!753207 (= res!508460 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20029 a!3186) j!159) mask!3328) (select (arr!20029 a!3186) j!159) a!3186 mask!3328) lt!335029))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753207 (= lt!335029 (Intermediate!7585 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!420204 () Bool)

(declare-fun b!753208 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41839 (_ BitVec 32)) SeekEntryResult!7585)

(assert (=> b!753208 (= e!420204 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20029 a!3186) j!159) a!3186 mask!3328) (Found!7585 j!159)))))

(declare-fun b!753209 () Bool)

(declare-datatypes ((Unit!25897 0))(
  ( (Unit!25898) )
))
(declare-fun e!420198 () Unit!25897)

(declare-fun Unit!25899 () Unit!25897)

(assert (=> b!753209 (= e!420198 Unit!25899)))

(assert (=> b!753209 false))

(declare-fun b!753210 () Bool)

(declare-fun e!420202 () Bool)

(assert (=> b!753210 (= e!420202 true)))

(declare-fun e!420199 () Bool)

(assert (=> b!753210 e!420199))

(declare-fun res!508459 () Bool)

(assert (=> b!753210 (=> (not res!508459) (not e!420199))))

(declare-fun lt!335032 () (_ BitVec 64))

(assert (=> b!753210 (= res!508459 (= lt!335032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335023 () Unit!25897)

(assert (=> b!753210 (= lt!335023 e!420198)))

(declare-fun c!82757 () Bool)

(assert (=> b!753210 (= c!82757 (= lt!335032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!508468 () Bool)

(assert (=> start!65796 (=> (not res!508468) (not e!420205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65796 (= res!508468 (validMask!0 mask!3328))))

(assert (=> start!65796 e!420205))

(assert (=> start!65796 true))

(declare-fun array_inv!15888 (array!41839) Bool)

(assert (=> start!65796 (array_inv!15888 a!3186)))

(declare-fun b!753211 () Bool)

(assert (=> b!753211 (= e!420205 e!420206)))

(declare-fun res!508463 () Bool)

(assert (=> b!753211 (=> (not res!508463) (not e!420206))))

(declare-fun lt!335027 () SeekEntryResult!7585)

(assert (=> b!753211 (= res!508463 (or (= lt!335027 (MissingZero!7585 i!1173)) (= lt!335027 (MissingVacant!7585 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41839 (_ BitVec 32)) SeekEntryResult!7585)

(assert (=> b!753211 (= lt!335027 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753212 () Bool)

(declare-fun res!508461 () Bool)

(assert (=> b!753212 (=> (not res!508461) (not e!420206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41839 (_ BitVec 32)) Bool)

(assert (=> b!753212 (= res!508461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753213 () Bool)

(declare-fun res!508466 () Bool)

(assert (=> b!753213 (=> (not res!508466) (not e!420205))))

(assert (=> b!753213 (= res!508466 (and (= (size!20449 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20449 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20449 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753214 () Bool)

(assert (=> b!753214 (= e!420204 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20029 a!3186) j!159) a!3186 mask!3328) lt!335029))))

(declare-fun b!753215 () Bool)

(declare-fun e!420201 () Bool)

(declare-fun e!420207 () Bool)

(assert (=> b!753215 (= e!420201 e!420207)))

(declare-fun res!508476 () Bool)

(assert (=> b!753215 (=> res!508476 e!420207)))

(declare-fun lt!335028 () SeekEntryResult!7585)

(declare-fun lt!335031 () SeekEntryResult!7585)

(assert (=> b!753215 (= res!508476 (not (= lt!335028 lt!335031)))))

(assert (=> b!753215 (= lt!335028 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20029 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753216 () Bool)

(declare-fun res!508462 () Bool)

(assert (=> b!753216 (=> (not res!508462) (not e!420206))))

(declare-datatypes ((List!13938 0))(
  ( (Nil!13935) (Cons!13934 (h!15012 (_ BitVec 64)) (t!20245 List!13938)) )
))
(declare-fun arrayNoDuplicates!0 (array!41839 (_ BitVec 32) List!13938) Bool)

(assert (=> b!753216 (= res!508462 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13935))))

(declare-fun b!753217 () Bool)

(declare-fun res!508477 () Bool)

(assert (=> b!753217 (=> (not res!508477) (not e!420199))))

(assert (=> b!753217 (= res!508477 (= (seekEntryOrOpen!0 lt!335025 lt!335033 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335025 lt!335033 mask!3328)))))

(declare-fun b!753218 () Bool)

(declare-fun lt!335026 () SeekEntryResult!7585)

(assert (=> b!753218 (= e!420199 (= lt!335026 lt!335028))))

(declare-fun b!753219 () Bool)

(assert (=> b!753219 (= e!420207 e!420202)))

(declare-fun res!508473 () Bool)

(assert (=> b!753219 (=> res!508473 e!420202)))

(assert (=> b!753219 (= res!508473 (= lt!335032 lt!335025))))

(assert (=> b!753219 (= lt!335032 (select (store (arr!20029 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753220 () Bool)

(assert (=> b!753220 (= e!420196 (not e!420201))))

(declare-fun res!508467 () Bool)

(assert (=> b!753220 (=> res!508467 e!420201)))

(get-info :version)

(assert (=> b!753220 (= res!508467 (or (not ((_ is Intermediate!7585) lt!335024)) (bvslt x!1131 (x!63787 lt!335024)) (not (= x!1131 (x!63787 lt!335024))) (not (= index!1321 (index!32710 lt!335024)))))))

(declare-fun e!420200 () Bool)

(assert (=> b!753220 e!420200))

(declare-fun res!508472 () Bool)

(assert (=> b!753220 (=> (not res!508472) (not e!420200))))

(assert (=> b!753220 (= res!508472 (= lt!335026 lt!335031))))

(assert (=> b!753220 (= lt!335031 (Found!7585 j!159))))

(assert (=> b!753220 (= lt!335026 (seekEntryOrOpen!0 (select (arr!20029 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753220 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335034 () Unit!25897)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25897)

(assert (=> b!753220 (= lt!335034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753221 () Bool)

(declare-fun res!508465 () Bool)

(assert (=> b!753221 (=> (not res!508465) (not e!420205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753221 (= res!508465 (validKeyInArray!0 k0!2102))))

(declare-fun b!753222 () Bool)

(declare-fun res!508471 () Bool)

(assert (=> b!753222 (=> (not res!508471) (not e!420197))))

(assert (=> b!753222 (= res!508471 e!420204)))

(declare-fun c!82756 () Bool)

(assert (=> b!753222 (= c!82756 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753223 () Bool)

(declare-fun res!508475 () Bool)

(assert (=> b!753223 (=> (not res!508475) (not e!420205))))

(assert (=> b!753223 (= res!508475 (validKeyInArray!0 (select (arr!20029 a!3186) j!159)))))

(declare-fun b!753224 () Bool)

(assert (=> b!753224 (= e!420200 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20029 a!3186) j!159) a!3186 mask!3328) lt!335031))))

(declare-fun b!753225 () Bool)

(declare-fun res!508470 () Bool)

(assert (=> b!753225 (=> (not res!508470) (not e!420206))))

(assert (=> b!753225 (= res!508470 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20449 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20449 a!3186))))))

(declare-fun b!753226 () Bool)

(declare-fun Unit!25900 () Unit!25897)

(assert (=> b!753226 (= e!420198 Unit!25900)))

(assert (= (and start!65796 res!508468) b!753213))

(assert (= (and b!753213 res!508466) b!753223))

(assert (= (and b!753223 res!508475) b!753221))

(assert (= (and b!753221 res!508465) b!753205))

(assert (= (and b!753205 res!508469) b!753211))

(assert (= (and b!753211 res!508463) b!753212))

(assert (= (and b!753212 res!508461) b!753216))

(assert (= (and b!753216 res!508462) b!753225))

(assert (= (and b!753225 res!508470) b!753207))

(assert (= (and b!753207 res!508460) b!753204))

(assert (= (and b!753204 res!508474) b!753222))

(assert (= (and b!753222 c!82756) b!753214))

(assert (= (and b!753222 (not c!82756)) b!753208))

(assert (= (and b!753222 res!508471) b!753206))

(assert (= (and b!753206 res!508464) b!753220))

(assert (= (and b!753220 res!508472) b!753224))

(assert (= (and b!753220 (not res!508467)) b!753215))

(assert (= (and b!753215 (not res!508476)) b!753219))

(assert (= (and b!753219 (not res!508473)) b!753210))

(assert (= (and b!753210 c!82757) b!753209))

(assert (= (and b!753210 (not c!82757)) b!753226))

(assert (= (and b!753210 res!508459) b!753217))

(assert (= (and b!753217 res!508477) b!753218))

(declare-fun m!702555 () Bool)

(assert (=> b!753219 m!702555))

(declare-fun m!702557 () Bool)

(assert (=> b!753219 m!702557))

(declare-fun m!702559 () Bool)

(assert (=> b!753221 m!702559))

(declare-fun m!702561 () Bool)

(assert (=> b!753220 m!702561))

(assert (=> b!753220 m!702561))

(declare-fun m!702563 () Bool)

(assert (=> b!753220 m!702563))

(declare-fun m!702565 () Bool)

(assert (=> b!753220 m!702565))

(declare-fun m!702567 () Bool)

(assert (=> b!753220 m!702567))

(declare-fun m!702569 () Bool)

(assert (=> start!65796 m!702569))

(declare-fun m!702571 () Bool)

(assert (=> start!65796 m!702571))

(assert (=> b!753224 m!702561))

(assert (=> b!753224 m!702561))

(declare-fun m!702573 () Bool)

(assert (=> b!753224 m!702573))

(assert (=> b!753214 m!702561))

(assert (=> b!753214 m!702561))

(declare-fun m!702575 () Bool)

(assert (=> b!753214 m!702575))

(assert (=> b!753223 m!702561))

(assert (=> b!753223 m!702561))

(declare-fun m!702577 () Bool)

(assert (=> b!753223 m!702577))

(declare-fun m!702579 () Bool)

(assert (=> b!753216 m!702579))

(assert (=> b!753215 m!702561))

(assert (=> b!753215 m!702561))

(declare-fun m!702581 () Bool)

(assert (=> b!753215 m!702581))

(declare-fun m!702583 () Bool)

(assert (=> b!753205 m!702583))

(assert (=> b!753207 m!702561))

(assert (=> b!753207 m!702561))

(declare-fun m!702585 () Bool)

(assert (=> b!753207 m!702585))

(assert (=> b!753207 m!702585))

(assert (=> b!753207 m!702561))

(declare-fun m!702587 () Bool)

(assert (=> b!753207 m!702587))

(declare-fun m!702589 () Bool)

(assert (=> b!753211 m!702589))

(declare-fun m!702591 () Bool)

(assert (=> b!753204 m!702591))

(declare-fun m!702593 () Bool)

(assert (=> b!753212 m!702593))

(declare-fun m!702595 () Bool)

(assert (=> b!753206 m!702595))

(declare-fun m!702597 () Bool)

(assert (=> b!753206 m!702597))

(assert (=> b!753206 m!702595))

(declare-fun m!702599 () Bool)

(assert (=> b!753206 m!702599))

(declare-fun m!702601 () Bool)

(assert (=> b!753206 m!702601))

(assert (=> b!753206 m!702555))

(declare-fun m!702603 () Bool)

(assert (=> b!753217 m!702603))

(declare-fun m!702605 () Bool)

(assert (=> b!753217 m!702605))

(assert (=> b!753208 m!702561))

(assert (=> b!753208 m!702561))

(assert (=> b!753208 m!702581))

(check-sat (not b!753205) (not b!753224) (not b!753211) (not b!753206) (not b!753214) (not b!753221) (not b!753215) (not start!65796) (not b!753223) (not b!753208) (not b!753220) (not b!753216) (not b!753207) (not b!753212) (not b!753217))
(check-sat)
