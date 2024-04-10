; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45404 () Bool)

(assert start!45404)

(declare-fun b!499053 () Bool)

(declare-fun res!301073 () Bool)

(declare-fun e!292466 () Bool)

(assert (=> b!499053 (=> (not res!301073) (not e!292466))))

(declare-datatypes ((array!32229 0))(
  ( (array!32230 (arr!15496 (Array (_ BitVec 32) (_ BitVec 64))) (size!15860 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32229)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499053 (= res!301073 (validKeyInArray!0 (select (arr!15496 a!3235) j!176)))))

(declare-fun b!499054 () Bool)

(declare-fun e!292470 () Bool)

(declare-fun e!292463 () Bool)

(assert (=> b!499054 (= e!292470 (not e!292463))))

(declare-fun res!301072 () Bool)

(assert (=> b!499054 (=> res!301072 e!292463)))

(declare-fun lt!226190 () array!32229)

(declare-fun lt!226189 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3963 0))(
  ( (MissingZero!3963 (index!18034 (_ BitVec 32))) (Found!3963 (index!18035 (_ BitVec 32))) (Intermediate!3963 (undefined!4775 Bool) (index!18036 (_ BitVec 32)) (x!47080 (_ BitVec 32))) (Undefined!3963) (MissingVacant!3963 (index!18037 (_ BitVec 32))) )
))
(declare-fun lt!226193 () SeekEntryResult!3963)

(declare-fun lt!226196 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32229 (_ BitVec 32)) SeekEntryResult!3963)

(assert (=> b!499054 (= res!301072 (= lt!226193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226189 lt!226196 lt!226190 mask!3524)))))

(declare-fun lt!226197 () (_ BitVec 32))

(assert (=> b!499054 (= lt!226193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226197 (select (arr!15496 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499054 (= lt!226189 (toIndex!0 lt!226196 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499054 (= lt!226196 (select (store (arr!15496 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499054 (= lt!226197 (toIndex!0 (select (arr!15496 a!3235) j!176) mask!3524))))

(assert (=> b!499054 (= lt!226190 (array!32230 (store (arr!15496 a!3235) i!1204 k0!2280) (size!15860 a!3235)))))

(declare-fun e!292468 () Bool)

(assert (=> b!499054 e!292468))

(declare-fun res!301068 () Bool)

(assert (=> b!499054 (=> (not res!301068) (not e!292468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32229 (_ BitVec 32)) Bool)

(assert (=> b!499054 (= res!301068 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14928 0))(
  ( (Unit!14929) )
))
(declare-fun lt!226192 () Unit!14928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14928)

(assert (=> b!499054 (= lt!226192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499055 () Bool)

(declare-fun res!301067 () Bool)

(assert (=> b!499055 (=> (not res!301067) (not e!292466))))

(assert (=> b!499055 (= res!301067 (validKeyInArray!0 k0!2280))))

(declare-fun b!499056 () Bool)

(declare-fun e!292464 () Unit!14928)

(declare-fun Unit!14930 () Unit!14928)

(assert (=> b!499056 (= e!292464 Unit!14930)))

(declare-fun lt!226198 () Unit!14928)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14928)

(assert (=> b!499056 (= lt!226198 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226197 #b00000000000000000000000000000000 (index!18036 lt!226193) (x!47080 lt!226193) mask!3524))))

(declare-fun res!301070 () Bool)

(assert (=> b!499056 (= res!301070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226197 lt!226196 lt!226190 mask!3524) (Intermediate!3963 false (index!18036 lt!226193) (x!47080 lt!226193))))))

(declare-fun e!292467 () Bool)

(assert (=> b!499056 (=> (not res!301070) (not e!292467))))

(assert (=> b!499056 e!292467))

(declare-fun b!499057 () Bool)

(declare-fun e!292465 () Bool)

(assert (=> b!499057 (= e!292465 true)))

(declare-fun lt!226194 () SeekEntryResult!3963)

(assert (=> b!499057 (= lt!226194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226197 lt!226196 lt!226190 mask!3524))))

(declare-fun b!499058 () Bool)

(assert (=> b!499058 (= e!292466 e!292470)))

(declare-fun res!301069 () Bool)

(assert (=> b!499058 (=> (not res!301069) (not e!292470))))

(declare-fun lt!226191 () SeekEntryResult!3963)

(assert (=> b!499058 (= res!301069 (or (= lt!226191 (MissingZero!3963 i!1204)) (= lt!226191 (MissingVacant!3963 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32229 (_ BitVec 32)) SeekEntryResult!3963)

(assert (=> b!499058 (= lt!226191 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499059 () Bool)

(declare-fun res!301076 () Bool)

(assert (=> b!499059 (=> (not res!301076) (not e!292470))))

(declare-datatypes ((List!9654 0))(
  ( (Nil!9651) (Cons!9650 (h!10524 (_ BitVec 64)) (t!15882 List!9654)) )
))
(declare-fun arrayNoDuplicates!0 (array!32229 (_ BitVec 32) List!9654) Bool)

(assert (=> b!499059 (= res!301076 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9651))))

(declare-fun b!499060 () Bool)

(assert (=> b!499060 (= e!292468 (= (seekEntryOrOpen!0 (select (arr!15496 a!3235) j!176) a!3235 mask!3524) (Found!3963 j!176)))))

(declare-fun b!499062 () Bool)

(declare-fun res!301077 () Bool)

(assert (=> b!499062 (=> (not res!301077) (not e!292466))))

(assert (=> b!499062 (= res!301077 (and (= (size!15860 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15860 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15860 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499063 () Bool)

(declare-fun res!301078 () Bool)

(assert (=> b!499063 (=> res!301078 e!292463)))

(get-info :version)

(assert (=> b!499063 (= res!301078 (or (undefined!4775 lt!226193) (not ((_ is Intermediate!3963) lt!226193))))))

(declare-fun b!499064 () Bool)

(declare-fun res!301079 () Bool)

(assert (=> b!499064 (=> (not res!301079) (not e!292466))))

(declare-fun arrayContainsKey!0 (array!32229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499064 (= res!301079 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499065 () Bool)

(assert (=> b!499065 (= e!292467 false)))

(declare-fun b!499061 () Bool)

(assert (=> b!499061 (= e!292463 e!292465)))

(declare-fun res!301075 () Bool)

(assert (=> b!499061 (=> res!301075 e!292465)))

(assert (=> b!499061 (= res!301075 (or (bvsgt #b00000000000000000000000000000000 (x!47080 lt!226193)) (bvsgt (x!47080 lt!226193) #b01111111111111111111111111111110) (bvslt lt!226197 #b00000000000000000000000000000000) (bvsge lt!226197 (size!15860 a!3235)) (bvslt (index!18036 lt!226193) #b00000000000000000000000000000000) (bvsge (index!18036 lt!226193) (size!15860 a!3235)) (not (= lt!226193 (Intermediate!3963 false (index!18036 lt!226193) (x!47080 lt!226193))))))))

(assert (=> b!499061 (and (or (= (select (arr!15496 a!3235) (index!18036 lt!226193)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15496 a!3235) (index!18036 lt!226193)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15496 a!3235) (index!18036 lt!226193)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15496 a!3235) (index!18036 lt!226193)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226195 () Unit!14928)

(assert (=> b!499061 (= lt!226195 e!292464)))

(declare-fun c!59270 () Bool)

(assert (=> b!499061 (= c!59270 (= (select (arr!15496 a!3235) (index!18036 lt!226193)) (select (arr!15496 a!3235) j!176)))))

(assert (=> b!499061 (and (bvslt (x!47080 lt!226193) #b01111111111111111111111111111110) (or (= (select (arr!15496 a!3235) (index!18036 lt!226193)) (select (arr!15496 a!3235) j!176)) (= (select (arr!15496 a!3235) (index!18036 lt!226193)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15496 a!3235) (index!18036 lt!226193)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!301074 () Bool)

(assert (=> start!45404 (=> (not res!301074) (not e!292466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45404 (= res!301074 (validMask!0 mask!3524))))

(assert (=> start!45404 e!292466))

(assert (=> start!45404 true))

(declare-fun array_inv!11292 (array!32229) Bool)

(assert (=> start!45404 (array_inv!11292 a!3235)))

(declare-fun b!499066 () Bool)

(declare-fun res!301071 () Bool)

(assert (=> b!499066 (=> (not res!301071) (not e!292470))))

(assert (=> b!499066 (= res!301071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499067 () Bool)

(declare-fun Unit!14931 () Unit!14928)

(assert (=> b!499067 (= e!292464 Unit!14931)))

(assert (= (and start!45404 res!301074) b!499062))

(assert (= (and b!499062 res!301077) b!499053))

(assert (= (and b!499053 res!301073) b!499055))

(assert (= (and b!499055 res!301067) b!499064))

(assert (= (and b!499064 res!301079) b!499058))

(assert (= (and b!499058 res!301069) b!499066))

(assert (= (and b!499066 res!301071) b!499059))

(assert (= (and b!499059 res!301076) b!499054))

(assert (= (and b!499054 res!301068) b!499060))

(assert (= (and b!499054 (not res!301072)) b!499063))

(assert (= (and b!499063 (not res!301078)) b!499061))

(assert (= (and b!499061 c!59270) b!499056))

(assert (= (and b!499061 (not c!59270)) b!499067))

(assert (= (and b!499056 res!301070) b!499065))

(assert (= (and b!499061 (not res!301075)) b!499057))

(declare-fun m!480279 () Bool)

(assert (=> b!499057 m!480279))

(declare-fun m!480281 () Bool)

(assert (=> b!499058 m!480281))

(declare-fun m!480283 () Bool)

(assert (=> b!499054 m!480283))

(declare-fun m!480285 () Bool)

(assert (=> b!499054 m!480285))

(declare-fun m!480287 () Bool)

(assert (=> b!499054 m!480287))

(declare-fun m!480289 () Bool)

(assert (=> b!499054 m!480289))

(declare-fun m!480291 () Bool)

(assert (=> b!499054 m!480291))

(declare-fun m!480293 () Bool)

(assert (=> b!499054 m!480293))

(assert (=> b!499054 m!480291))

(declare-fun m!480295 () Bool)

(assert (=> b!499054 m!480295))

(declare-fun m!480297 () Bool)

(assert (=> b!499054 m!480297))

(assert (=> b!499054 m!480291))

(declare-fun m!480299 () Bool)

(assert (=> b!499054 m!480299))

(assert (=> b!499060 m!480291))

(assert (=> b!499060 m!480291))

(declare-fun m!480301 () Bool)

(assert (=> b!499060 m!480301))

(declare-fun m!480303 () Bool)

(assert (=> b!499059 m!480303))

(declare-fun m!480305 () Bool)

(assert (=> start!45404 m!480305))

(declare-fun m!480307 () Bool)

(assert (=> start!45404 m!480307))

(declare-fun m!480309 () Bool)

(assert (=> b!499064 m!480309))

(declare-fun m!480311 () Bool)

(assert (=> b!499061 m!480311))

(assert (=> b!499061 m!480291))

(declare-fun m!480313 () Bool)

(assert (=> b!499055 m!480313))

(declare-fun m!480315 () Bool)

(assert (=> b!499056 m!480315))

(assert (=> b!499056 m!480279))

(declare-fun m!480317 () Bool)

(assert (=> b!499066 m!480317))

(assert (=> b!499053 m!480291))

(assert (=> b!499053 m!480291))

(declare-fun m!480319 () Bool)

(assert (=> b!499053 m!480319))

(check-sat (not b!499053) (not b!499058) (not start!45404) (not b!499054) (not b!499055) (not b!499060) (not b!499059) (not b!499064) (not b!499056) (not b!499066) (not b!499057))
(check-sat)
