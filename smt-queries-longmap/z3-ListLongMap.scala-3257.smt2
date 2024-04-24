; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45404 () Bool)

(assert start!45404)

(declare-fun b!499217 () Bool)

(declare-fun res!301266 () Bool)

(declare-fun e!292551 () Bool)

(assert (=> b!499217 (=> (not res!301266) (not e!292551))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32230 0))(
  ( (array!32231 (arr!15496 (Array (_ BitVec 32) (_ BitVec 64))) (size!15860 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32230)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499217 (= res!301266 (and (= (size!15860 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15860 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15860 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!292549 () Bool)

(declare-fun b!499218 () Bool)

(declare-datatypes ((SeekEntryResult!3919 0))(
  ( (MissingZero!3919 (index!17858 (_ BitVec 32))) (Found!3919 (index!17859 (_ BitVec 32))) (Intermediate!3919 (undefined!4731 Bool) (index!17860 (_ BitVec 32)) (x!47049 (_ BitVec 32))) (Undefined!3919) (MissingVacant!3919 (index!17861 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32230 (_ BitVec 32)) SeekEntryResult!3919)

(assert (=> b!499218 (= e!292549 (= (seekEntryOrOpen!0 (select (arr!15496 a!3235) j!176) a!3235 mask!3524) (Found!3919 j!176)))))

(declare-fun b!499219 () Bool)

(declare-fun e!292546 () Bool)

(assert (=> b!499219 (= e!292546 false)))

(declare-fun b!499220 () Bool)

(declare-fun res!301265 () Bool)

(assert (=> b!499220 (=> (not res!301265) (not e!292551))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499220 (= res!301265 (validKeyInArray!0 k0!2280))))

(declare-fun b!499221 () Bool)

(declare-fun res!301256 () Bool)

(assert (=> b!499221 (=> (not res!301256) (not e!292551))))

(declare-fun arrayContainsKey!0 (array!32230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499221 (= res!301256 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499222 () Bool)

(declare-fun res!301261 () Bool)

(declare-fun e!292548 () Bool)

(assert (=> b!499222 (=> (not res!301261) (not e!292548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32230 (_ BitVec 32)) Bool)

(assert (=> b!499222 (= res!301261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499223 () Bool)

(assert (=> b!499223 (= e!292551 e!292548)))

(declare-fun res!301263 () Bool)

(assert (=> b!499223 (=> (not res!301263) (not e!292548))))

(declare-fun lt!226356 () SeekEntryResult!3919)

(assert (=> b!499223 (= res!301263 (or (= lt!226356 (MissingZero!3919 i!1204)) (= lt!226356 (MissingVacant!3919 i!1204))))))

(assert (=> b!499223 (= lt!226356 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499224 () Bool)

(declare-fun e!292550 () Bool)

(assert (=> b!499224 (= e!292548 (not e!292550))))

(declare-fun res!301264 () Bool)

(assert (=> b!499224 (=> res!301264 e!292550)))

(declare-fun lt!226352 () SeekEntryResult!3919)

(declare-fun lt!226355 () array!32230)

(declare-fun lt!226360 () (_ BitVec 32))

(declare-fun lt!226354 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32230 (_ BitVec 32)) SeekEntryResult!3919)

(assert (=> b!499224 (= res!301264 (= lt!226352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226360 lt!226354 lt!226355 mask!3524)))))

(declare-fun lt!226353 () (_ BitVec 32))

(assert (=> b!499224 (= lt!226352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226353 (select (arr!15496 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499224 (= lt!226360 (toIndex!0 lt!226354 mask!3524))))

(assert (=> b!499224 (= lt!226354 (select (store (arr!15496 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499224 (= lt!226353 (toIndex!0 (select (arr!15496 a!3235) j!176) mask!3524))))

(assert (=> b!499224 (= lt!226355 (array!32231 (store (arr!15496 a!3235) i!1204 k0!2280) (size!15860 a!3235)))))

(assert (=> b!499224 e!292549))

(declare-fun res!301257 () Bool)

(assert (=> b!499224 (=> (not res!301257) (not e!292549))))

(assert (=> b!499224 (= res!301257 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14911 0))(
  ( (Unit!14912) )
))
(declare-fun lt!226357 () Unit!14911)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14911)

(assert (=> b!499224 (= lt!226357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499225 () Bool)

(declare-fun e!292547 () Unit!14911)

(declare-fun Unit!14913 () Unit!14911)

(assert (=> b!499225 (= e!292547 Unit!14913)))

(declare-fun lt!226351 () Unit!14911)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32230 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14911)

(assert (=> b!499225 (= lt!226351 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226353 #b00000000000000000000000000000000 (index!17860 lt!226352) (x!47049 lt!226352) mask!3524))))

(declare-fun res!301260 () Bool)

(assert (=> b!499225 (= res!301260 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226353 lt!226354 lt!226355 mask!3524) (Intermediate!3919 false (index!17860 lt!226352) (x!47049 lt!226352))))))

(assert (=> b!499225 (=> (not res!301260) (not e!292546))))

(assert (=> b!499225 e!292546))

(declare-fun b!499226 () Bool)

(declare-fun res!301258 () Bool)

(assert (=> b!499226 (=> (not res!301258) (not e!292551))))

(assert (=> b!499226 (= res!301258 (validKeyInArray!0 (select (arr!15496 a!3235) j!176)))))

(declare-fun b!499227 () Bool)

(declare-fun res!301262 () Bool)

(assert (=> b!499227 (=> res!301262 e!292550)))

(get-info :version)

(assert (=> b!499227 (= res!301262 (or (undefined!4731 lt!226352) (not ((_ is Intermediate!3919) lt!226352))))))

(declare-fun b!499228 () Bool)

(declare-fun e!292544 () Bool)

(assert (=> b!499228 (= e!292550 e!292544)))

(declare-fun res!301259 () Bool)

(assert (=> b!499228 (=> res!301259 e!292544)))

(assert (=> b!499228 (= res!301259 (or (bvsgt #b00000000000000000000000000000000 (x!47049 lt!226352)) (bvsgt (x!47049 lt!226352) #b01111111111111111111111111111110) (bvslt lt!226353 #b00000000000000000000000000000000) (bvsge lt!226353 (size!15860 a!3235)) (bvslt (index!17860 lt!226352) #b00000000000000000000000000000000) (bvsge (index!17860 lt!226352) (size!15860 a!3235)) (not (= lt!226352 (Intermediate!3919 false (index!17860 lt!226352) (x!47049 lt!226352))))))))

(assert (=> b!499228 (and (or (= (select (arr!15496 a!3235) (index!17860 lt!226352)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15496 a!3235) (index!17860 lt!226352)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15496 a!3235) (index!17860 lt!226352)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15496 a!3235) (index!17860 lt!226352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226359 () Unit!14911)

(assert (=> b!499228 (= lt!226359 e!292547)))

(declare-fun c!59258 () Bool)

(assert (=> b!499228 (= c!59258 (= (select (arr!15496 a!3235) (index!17860 lt!226352)) (select (arr!15496 a!3235) j!176)))))

(assert (=> b!499228 (and (bvslt (x!47049 lt!226352) #b01111111111111111111111111111110) (or (= (select (arr!15496 a!3235) (index!17860 lt!226352)) (select (arr!15496 a!3235) j!176)) (= (select (arr!15496 a!3235) (index!17860 lt!226352)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15496 a!3235) (index!17860 lt!226352)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499229 () Bool)

(declare-fun Unit!14914 () Unit!14911)

(assert (=> b!499229 (= e!292547 Unit!14914)))

(declare-fun res!301267 () Bool)

(assert (=> start!45404 (=> (not res!301267) (not e!292551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45404 (= res!301267 (validMask!0 mask!3524))))

(assert (=> start!45404 e!292551))

(assert (=> start!45404 true))

(declare-fun array_inv!11355 (array!32230) Bool)

(assert (=> start!45404 (array_inv!11355 a!3235)))

(declare-fun b!499230 () Bool)

(assert (=> b!499230 (= e!292544 true)))

(declare-fun lt!226358 () SeekEntryResult!3919)

(assert (=> b!499230 (= lt!226358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226353 lt!226354 lt!226355 mask!3524))))

(declare-fun b!499231 () Bool)

(declare-fun res!301255 () Bool)

(assert (=> b!499231 (=> (not res!301255) (not e!292548))))

(declare-datatypes ((List!9561 0))(
  ( (Nil!9558) (Cons!9557 (h!10431 (_ BitVec 64)) (t!15781 List!9561)) )
))
(declare-fun arrayNoDuplicates!0 (array!32230 (_ BitVec 32) List!9561) Bool)

(assert (=> b!499231 (= res!301255 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9558))))

(assert (= (and start!45404 res!301267) b!499217))

(assert (= (and b!499217 res!301266) b!499226))

(assert (= (and b!499226 res!301258) b!499220))

(assert (= (and b!499220 res!301265) b!499221))

(assert (= (and b!499221 res!301256) b!499223))

(assert (= (and b!499223 res!301263) b!499222))

(assert (= (and b!499222 res!301261) b!499231))

(assert (= (and b!499231 res!301255) b!499224))

(assert (= (and b!499224 res!301257) b!499218))

(assert (= (and b!499224 (not res!301264)) b!499227))

(assert (= (and b!499227 (not res!301262)) b!499228))

(assert (= (and b!499228 c!59258) b!499225))

(assert (= (and b!499228 (not c!59258)) b!499229))

(assert (= (and b!499225 res!301260) b!499219))

(assert (= (and b!499228 (not res!301259)) b!499230))

(declare-fun m!480673 () Bool)

(assert (=> b!499230 m!480673))

(declare-fun m!480675 () Bool)

(assert (=> b!499226 m!480675))

(assert (=> b!499226 m!480675))

(declare-fun m!480677 () Bool)

(assert (=> b!499226 m!480677))

(declare-fun m!480679 () Bool)

(assert (=> b!499225 m!480679))

(assert (=> b!499225 m!480673))

(declare-fun m!480681 () Bool)

(assert (=> b!499220 m!480681))

(declare-fun m!480683 () Bool)

(assert (=> b!499223 m!480683))

(declare-fun m!480685 () Bool)

(assert (=> start!45404 m!480685))

(declare-fun m!480687 () Bool)

(assert (=> start!45404 m!480687))

(declare-fun m!480689 () Bool)

(assert (=> b!499222 m!480689))

(declare-fun m!480691 () Bool)

(assert (=> b!499228 m!480691))

(assert (=> b!499228 m!480675))

(assert (=> b!499218 m!480675))

(assert (=> b!499218 m!480675))

(declare-fun m!480693 () Bool)

(assert (=> b!499218 m!480693))

(declare-fun m!480695 () Bool)

(assert (=> b!499224 m!480695))

(assert (=> b!499224 m!480675))

(declare-fun m!480697 () Bool)

(assert (=> b!499224 m!480697))

(declare-fun m!480699 () Bool)

(assert (=> b!499224 m!480699))

(declare-fun m!480701 () Bool)

(assert (=> b!499224 m!480701))

(assert (=> b!499224 m!480675))

(declare-fun m!480703 () Bool)

(assert (=> b!499224 m!480703))

(declare-fun m!480705 () Bool)

(assert (=> b!499224 m!480705))

(assert (=> b!499224 m!480675))

(declare-fun m!480707 () Bool)

(assert (=> b!499224 m!480707))

(declare-fun m!480709 () Bool)

(assert (=> b!499224 m!480709))

(declare-fun m!480711 () Bool)

(assert (=> b!499221 m!480711))

(declare-fun m!480713 () Bool)

(assert (=> b!499231 m!480713))

(check-sat (not b!499225) (not b!499223) (not b!499231) (not b!499230) (not start!45404) (not b!499218) (not b!499220) (not b!499226) (not b!499224) (not b!499222) (not b!499221))
(check-sat)
