; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45368 () Bool)

(assert start!45368)

(declare-fun b!498243 () Bool)

(declare-fun e!292036 () Bool)

(declare-fun e!292037 () Bool)

(assert (=> b!498243 (= e!292036 e!292037)))

(declare-fun res!300369 () Bool)

(assert (=> b!498243 (=> res!300369 e!292037)))

(declare-datatypes ((SeekEntryResult!3945 0))(
  ( (MissingZero!3945 (index!17962 (_ BitVec 32))) (Found!3945 (index!17963 (_ BitVec 32))) (Intermediate!3945 (undefined!4757 Bool) (index!17964 (_ BitVec 32)) (x!47014 (_ BitVec 32))) (Undefined!3945) (MissingVacant!3945 (index!17965 (_ BitVec 32))) )
))
(declare-fun lt!225654 () SeekEntryResult!3945)

(declare-datatypes ((array!32193 0))(
  ( (array!32194 (arr!15478 (Array (_ BitVec 32) (_ BitVec 64))) (size!15842 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32193)

(declare-fun lt!225656 () (_ BitVec 32))

(assert (=> b!498243 (= res!300369 (or (bvsgt #b00000000000000000000000000000000 (x!47014 lt!225654)) (bvsgt (x!47014 lt!225654) #b01111111111111111111111111111110) (bvslt lt!225656 #b00000000000000000000000000000000) (bvsge lt!225656 (size!15842 a!3235)) (bvslt (index!17964 lt!225654) #b00000000000000000000000000000000) (bvsge (index!17964 lt!225654) (size!15842 a!3235)) (not (= lt!225654 (Intermediate!3945 false (index!17964 lt!225654) (x!47014 lt!225654))))))))

(assert (=> b!498243 (and (or (= (select (arr!15478 a!3235) (index!17964 lt!225654)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15478 a!3235) (index!17964 lt!225654)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15478 a!3235) (index!17964 lt!225654)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15478 a!3235) (index!17964 lt!225654)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14856 0))(
  ( (Unit!14857) )
))
(declare-fun lt!225658 () Unit!14856)

(declare-fun e!292038 () Unit!14856)

(assert (=> b!498243 (= lt!225658 e!292038)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!59216 () Bool)

(assert (=> b!498243 (= c!59216 (= (select (arr!15478 a!3235) (index!17964 lt!225654)) (select (arr!15478 a!3235) j!176)))))

(assert (=> b!498243 (and (bvslt (x!47014 lt!225654) #b01111111111111111111111111111110) (or (= (select (arr!15478 a!3235) (index!17964 lt!225654)) (select (arr!15478 a!3235) j!176)) (= (select (arr!15478 a!3235) (index!17964 lt!225654)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15478 a!3235) (index!17964 lt!225654)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498245 () Bool)

(declare-fun res!300375 () Bool)

(assert (=> b!498245 (=> res!300375 e!292036)))

(get-info :version)

(assert (=> b!498245 (= res!300375 (or (undefined!4757 lt!225654) (not ((_ is Intermediate!3945) lt!225654))))))

(declare-fun b!498246 () Bool)

(declare-fun res!300376 () Bool)

(declare-fun e!292031 () Bool)

(assert (=> b!498246 (=> (not res!300376) (not e!292031))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498246 (= res!300376 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498247 () Bool)

(declare-fun res!300372 () Bool)

(assert (=> b!498247 (=> (not res!300372) (not e!292031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498247 (= res!300372 (validKeyInArray!0 k0!2280))))

(declare-fun b!498248 () Bool)

(declare-fun Unit!14858 () Unit!14856)

(assert (=> b!498248 (= e!292038 Unit!14858)))

(declare-fun e!292034 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!498249 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32193 (_ BitVec 32)) SeekEntryResult!3945)

(assert (=> b!498249 (= e!292034 (= (seekEntryOrOpen!0 (select (arr!15478 a!3235) j!176) a!3235 mask!3524) (Found!3945 j!176)))))

(declare-fun b!498250 () Bool)

(declare-fun res!300374 () Bool)

(assert (=> b!498250 (=> (not res!300374) (not e!292031))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498250 (= res!300374 (and (= (size!15842 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15842 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15842 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498251 () Bool)

(declare-fun res!300367 () Bool)

(declare-fun e!292032 () Bool)

(assert (=> b!498251 (=> (not res!300367) (not e!292032))))

(declare-datatypes ((List!9636 0))(
  ( (Nil!9633) (Cons!9632 (h!10506 (_ BitVec 64)) (t!15864 List!9636)) )
))
(declare-fun arrayNoDuplicates!0 (array!32193 (_ BitVec 32) List!9636) Bool)

(assert (=> b!498251 (= res!300367 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9633))))

(declare-fun b!498252 () Bool)

(declare-fun res!300365 () Bool)

(assert (=> b!498252 (=> (not res!300365) (not e!292031))))

(assert (=> b!498252 (= res!300365 (validKeyInArray!0 (select (arr!15478 a!3235) j!176)))))

(declare-fun b!498253 () Bool)

(assert (=> b!498253 (= e!292037 true)))

(declare-fun lt!225653 () array!32193)

(declare-fun lt!225652 () SeekEntryResult!3945)

(declare-fun lt!225655 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32193 (_ BitVec 32)) SeekEntryResult!3945)

(assert (=> b!498253 (= lt!225652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225656 lt!225655 lt!225653 mask!3524))))

(declare-fun b!498254 () Bool)

(declare-fun Unit!14859 () Unit!14856)

(assert (=> b!498254 (= e!292038 Unit!14859)))

(declare-fun lt!225649 () Unit!14856)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14856)

(assert (=> b!498254 (= lt!225649 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225656 #b00000000000000000000000000000000 (index!17964 lt!225654) (x!47014 lt!225654) mask!3524))))

(declare-fun res!300371 () Bool)

(assert (=> b!498254 (= res!300371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225656 lt!225655 lt!225653 mask!3524) (Intermediate!3945 false (index!17964 lt!225654) (x!47014 lt!225654))))))

(declare-fun e!292033 () Bool)

(assert (=> b!498254 (=> (not res!300371) (not e!292033))))

(assert (=> b!498254 e!292033))

(declare-fun b!498255 () Bool)

(assert (=> b!498255 (= e!292032 (not e!292036))))

(declare-fun res!300368 () Bool)

(assert (=> b!498255 (=> res!300368 e!292036)))

(declare-fun lt!225657 () (_ BitVec 32))

(assert (=> b!498255 (= res!300368 (= lt!225654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225657 lt!225655 lt!225653 mask!3524)))))

(assert (=> b!498255 (= lt!225654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225656 (select (arr!15478 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498255 (= lt!225657 (toIndex!0 lt!225655 mask!3524))))

(assert (=> b!498255 (= lt!225655 (select (store (arr!15478 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498255 (= lt!225656 (toIndex!0 (select (arr!15478 a!3235) j!176) mask!3524))))

(assert (=> b!498255 (= lt!225653 (array!32194 (store (arr!15478 a!3235) i!1204 k0!2280) (size!15842 a!3235)))))

(assert (=> b!498255 e!292034))

(declare-fun res!300366 () Bool)

(assert (=> b!498255 (=> (not res!300366) (not e!292034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32193 (_ BitVec 32)) Bool)

(assert (=> b!498255 (= res!300366 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225650 () Unit!14856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14856)

(assert (=> b!498255 (= lt!225650 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498256 () Bool)

(assert (=> b!498256 (= e!292031 e!292032)))

(declare-fun res!300377 () Bool)

(assert (=> b!498256 (=> (not res!300377) (not e!292032))))

(declare-fun lt!225651 () SeekEntryResult!3945)

(assert (=> b!498256 (= res!300377 (or (= lt!225651 (MissingZero!3945 i!1204)) (= lt!225651 (MissingVacant!3945 i!1204))))))

(assert (=> b!498256 (= lt!225651 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498257 () Bool)

(assert (=> b!498257 (= e!292033 false)))

(declare-fun b!498244 () Bool)

(declare-fun res!300373 () Bool)

(assert (=> b!498244 (=> (not res!300373) (not e!292032))))

(assert (=> b!498244 (= res!300373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!300370 () Bool)

(assert (=> start!45368 (=> (not res!300370) (not e!292031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45368 (= res!300370 (validMask!0 mask!3524))))

(assert (=> start!45368 e!292031))

(assert (=> start!45368 true))

(declare-fun array_inv!11274 (array!32193) Bool)

(assert (=> start!45368 (array_inv!11274 a!3235)))

(assert (= (and start!45368 res!300370) b!498250))

(assert (= (and b!498250 res!300374) b!498252))

(assert (= (and b!498252 res!300365) b!498247))

(assert (= (and b!498247 res!300372) b!498246))

(assert (= (and b!498246 res!300376) b!498256))

(assert (= (and b!498256 res!300377) b!498244))

(assert (= (and b!498244 res!300373) b!498251))

(assert (= (and b!498251 res!300367) b!498255))

(assert (= (and b!498255 res!300366) b!498249))

(assert (= (and b!498255 (not res!300368)) b!498245))

(assert (= (and b!498245 (not res!300375)) b!498243))

(assert (= (and b!498243 c!59216) b!498254))

(assert (= (and b!498243 (not c!59216)) b!498248))

(assert (= (and b!498254 res!300371) b!498257))

(assert (= (and b!498243 (not res!300369)) b!498253))

(declare-fun m!479523 () Bool)

(assert (=> b!498243 m!479523))

(declare-fun m!479525 () Bool)

(assert (=> b!498243 m!479525))

(declare-fun m!479527 () Bool)

(assert (=> b!498244 m!479527))

(assert (=> b!498249 m!479525))

(assert (=> b!498249 m!479525))

(declare-fun m!479529 () Bool)

(assert (=> b!498249 m!479529))

(declare-fun m!479531 () Bool)

(assert (=> b!498253 m!479531))

(declare-fun m!479533 () Bool)

(assert (=> b!498251 m!479533))

(declare-fun m!479535 () Bool)

(assert (=> b!498246 m!479535))

(declare-fun m!479537 () Bool)

(assert (=> b!498256 m!479537))

(declare-fun m!479539 () Bool)

(assert (=> b!498247 m!479539))

(declare-fun m!479541 () Bool)

(assert (=> start!45368 m!479541))

(declare-fun m!479543 () Bool)

(assert (=> start!45368 m!479543))

(declare-fun m!479545 () Bool)

(assert (=> b!498255 m!479545))

(declare-fun m!479547 () Bool)

(assert (=> b!498255 m!479547))

(assert (=> b!498255 m!479525))

(declare-fun m!479549 () Bool)

(assert (=> b!498255 m!479549))

(assert (=> b!498255 m!479525))

(declare-fun m!479551 () Bool)

(assert (=> b!498255 m!479551))

(assert (=> b!498255 m!479525))

(declare-fun m!479553 () Bool)

(assert (=> b!498255 m!479553))

(declare-fun m!479555 () Bool)

(assert (=> b!498255 m!479555))

(declare-fun m!479557 () Bool)

(assert (=> b!498255 m!479557))

(declare-fun m!479559 () Bool)

(assert (=> b!498255 m!479559))

(declare-fun m!479561 () Bool)

(assert (=> b!498254 m!479561))

(assert (=> b!498254 m!479531))

(assert (=> b!498252 m!479525))

(assert (=> b!498252 m!479525))

(declare-fun m!479563 () Bool)

(assert (=> b!498252 m!479563))

(check-sat (not b!498255) (not b!498254) (not b!498256) (not b!498247) (not b!498253) (not b!498249) (not b!498246) (not start!45368) (not b!498252) (not b!498244) (not b!498251))
(check-sat)
