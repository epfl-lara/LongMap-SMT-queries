; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26102 () Bool)

(assert start!26102)

(declare-fun b!269279 () Bool)

(declare-fun e!173780 () Bool)

(assert (=> b!269279 (= e!173780 false)))

(declare-datatypes ((Unit!8326 0))(
  ( (Unit!8327) )
))
(declare-fun lt!135149 () Unit!8326)

(declare-fun e!173781 () Unit!8326)

(assert (=> b!269279 (= lt!135149 e!173781)))

(declare-fun c!45435 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13199 0))(
  ( (array!13200 (arr!6249 (Array (_ BitVec 32) (_ BitVec 64))) (size!6601 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13199)

(assert (=> b!269279 (= c!45435 (bvslt startIndex!26 (bvsub (size!6601 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269280 () Bool)

(declare-fun res!133515 () Bool)

(declare-fun e!173783 () Bool)

(assert (=> b!269280 (=> (not res!133515) (not e!173783))))

(declare-datatypes ((List!4057 0))(
  ( (Nil!4054) (Cons!4053 (h!4720 (_ BitVec 64)) (t!9139 List!4057)) )
))
(declare-fun arrayNoDuplicates!0 (array!13199 (_ BitVec 32) List!4057) Bool)

(assert (=> b!269280 (= res!133515 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4054))))

(declare-fun b!269281 () Bool)

(declare-fun lt!135151 () Unit!8326)

(assert (=> b!269281 (= e!173781 lt!135151)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13199 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8326)

(assert (=> b!269281 (= lt!135151 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13199 (_ BitVec 32)) Bool)

(assert (=> b!269281 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13200 (store (arr!6249 a!3325) i!1267 k0!2581) (size!6601 a!3325)) mask!3868)))

(declare-fun res!133516 () Bool)

(assert (=> start!26102 (=> (not res!133516) (not e!173783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26102 (= res!133516 (validMask!0 mask!3868))))

(assert (=> start!26102 e!173783))

(declare-fun array_inv!4212 (array!13199) Bool)

(assert (=> start!26102 (array_inv!4212 a!3325)))

(assert (=> start!26102 true))

(declare-fun b!269282 () Bool)

(declare-fun res!133513 () Bool)

(assert (=> b!269282 (=> (not res!133513) (not e!173780))))

(assert (=> b!269282 (= res!133513 (= startIndex!26 i!1267))))

(declare-fun b!269283 () Bool)

(declare-fun Unit!8328 () Unit!8326)

(assert (=> b!269283 (= e!173781 Unit!8328)))

(declare-fun b!269284 () Bool)

(declare-fun res!133512 () Bool)

(assert (=> b!269284 (=> (not res!133512) (not e!173783))))

(assert (=> b!269284 (= res!133512 (and (= (size!6601 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6601 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6601 a!3325))))))

(declare-fun b!269285 () Bool)

(declare-fun res!133518 () Bool)

(assert (=> b!269285 (=> (not res!133518) (not e!173780))))

(assert (=> b!269285 (= res!133518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269286 () Bool)

(declare-fun res!133517 () Bool)

(assert (=> b!269286 (=> (not res!133517) (not e!173783))))

(declare-fun arrayContainsKey!0 (array!13199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269286 (= res!133517 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269287 () Bool)

(assert (=> b!269287 (= e!173783 e!173780)))

(declare-fun res!133511 () Bool)

(assert (=> b!269287 (=> (not res!133511) (not e!173780))))

(declare-datatypes ((SeekEntryResult!1407 0))(
  ( (MissingZero!1407 (index!7798 (_ BitVec 32))) (Found!1407 (index!7799 (_ BitVec 32))) (Intermediate!1407 (undefined!2219 Bool) (index!7800 (_ BitVec 32)) (x!26148 (_ BitVec 32))) (Undefined!1407) (MissingVacant!1407 (index!7801 (_ BitVec 32))) )
))
(declare-fun lt!135150 () SeekEntryResult!1407)

(assert (=> b!269287 (= res!133511 (or (= lt!135150 (MissingZero!1407 i!1267)) (= lt!135150 (MissingVacant!1407 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13199 (_ BitVec 32)) SeekEntryResult!1407)

(assert (=> b!269287 (= lt!135150 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269288 () Bool)

(declare-fun res!133514 () Bool)

(assert (=> b!269288 (=> (not res!133514) (not e!173783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269288 (= res!133514 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26102 res!133516) b!269284))

(assert (= (and b!269284 res!133512) b!269288))

(assert (= (and b!269288 res!133514) b!269280))

(assert (= (and b!269280 res!133515) b!269286))

(assert (= (and b!269286 res!133517) b!269287))

(assert (= (and b!269287 res!133511) b!269285))

(assert (= (and b!269285 res!133518) b!269282))

(assert (= (and b!269282 res!133513) b!269279))

(assert (= (and b!269279 c!45435) b!269281))

(assert (= (and b!269279 (not c!45435)) b!269283))

(declare-fun m!285191 () Bool)

(assert (=> b!269281 m!285191))

(declare-fun m!285193 () Bool)

(assert (=> b!269281 m!285193))

(declare-fun m!285195 () Bool)

(assert (=> b!269281 m!285195))

(declare-fun m!285197 () Bool)

(assert (=> start!26102 m!285197))

(declare-fun m!285199 () Bool)

(assert (=> start!26102 m!285199))

(declare-fun m!285201 () Bool)

(assert (=> b!269280 m!285201))

(declare-fun m!285203 () Bool)

(assert (=> b!269286 m!285203))

(declare-fun m!285205 () Bool)

(assert (=> b!269288 m!285205))

(declare-fun m!285207 () Bool)

(assert (=> b!269287 m!285207))

(declare-fun m!285209 () Bool)

(assert (=> b!269285 m!285209))

(check-sat (not b!269288) (not b!269280) (not start!26102) (not b!269286) (not b!269287) (not b!269285) (not b!269281))
(check-sat)
