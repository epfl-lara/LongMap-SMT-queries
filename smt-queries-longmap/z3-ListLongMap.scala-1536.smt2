; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29132 () Bool)

(assert start!29132)

(declare-fun b!295455 () Bool)

(declare-fun e!186741 () Bool)

(declare-fun e!186742 () Bool)

(assert (=> b!295455 (= e!186741 e!186742)))

(declare-fun res!155392 () Bool)

(assert (=> b!295455 (=> (not res!155392) (not e!186742))))

(declare-datatypes ((SeekEntryResult!2228 0))(
  ( (MissingZero!2228 (index!11082 (_ BitVec 32))) (Found!2228 (index!11083 (_ BitVec 32))) (Intermediate!2228 (undefined!3040 Bool) (index!11084 (_ BitVec 32)) (x!29316 (_ BitVec 32))) (Undefined!2228) (MissingVacant!2228 (index!11085 (_ BitVec 32))) )
))
(declare-fun lt!146440 () SeekEntryResult!2228)

(declare-datatypes ((array!14938 0))(
  ( (array!14939 (arr!7080 (Array (_ BitVec 32) (_ BitVec 64))) (size!7433 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14938)

(declare-fun lt!146444 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!295455 (= res!155392 (and (or lt!146444 (not (undefined!3040 lt!146440))) (or lt!146444 (not (= (select (arr!7080 a!3312) (index!11084 lt!146440)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146444 (not (= (select (arr!7080 a!3312) (index!11084 lt!146440)) k0!2524))) (not lt!146444)))))

(get-info :version)

(assert (=> b!295455 (= lt!146444 (not ((_ is Intermediate!2228) lt!146440)))))

(declare-fun b!295456 () Bool)

(declare-fun res!155396 () Bool)

(declare-fun e!186739 () Bool)

(assert (=> b!295456 (=> (not res!155396) (not e!186739))))

(declare-fun arrayContainsKey!0 (array!14938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295456 (= res!155396 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295457 () Bool)

(declare-fun e!186738 () Bool)

(assert (=> b!295457 (= e!186738 e!186741)))

(declare-fun res!155398 () Bool)

(assert (=> b!295457 (=> (not res!155398) (not e!186741))))

(declare-fun lt!146443 () Bool)

(assert (=> b!295457 (= res!155398 lt!146443)))

(declare-fun lt!146445 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146441 () SeekEntryResult!2228)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14938 (_ BitVec 32)) SeekEntryResult!2228)

(assert (=> b!295457 (= lt!146441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146445 k0!2524 (array!14939 (store (arr!7080 a!3312) i!1256 k0!2524) (size!7433 a!3312)) mask!3809))))

(assert (=> b!295457 (= lt!146440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146445 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295457 (= lt!146445 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295458 () Bool)

(declare-fun res!155391 () Bool)

(assert (=> b!295458 (=> (not res!155391) (not e!186738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14938 (_ BitVec 32)) Bool)

(assert (=> b!295458 (= res!155391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295459 () Bool)

(assert (=> b!295459 (= e!186742 (not true))))

(assert (=> b!295459 (and (= (select (arr!7080 a!3312) (index!11084 lt!146440)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11084 lt!146440) i!1256))))

(declare-fun b!295460 () Bool)

(declare-fun res!155394 () Bool)

(assert (=> b!295460 (=> (not res!155394) (not e!186739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295460 (= res!155394 (validKeyInArray!0 k0!2524))))

(declare-fun b!295461 () Bool)

(assert (=> b!295461 (= e!186739 e!186738)))

(declare-fun res!155393 () Bool)

(assert (=> b!295461 (=> (not res!155393) (not e!186738))))

(declare-fun lt!146442 () SeekEntryResult!2228)

(assert (=> b!295461 (= res!155393 (or lt!146443 (= lt!146442 (MissingVacant!2228 i!1256))))))

(assert (=> b!295461 (= lt!146443 (= lt!146442 (MissingZero!2228 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14938 (_ BitVec 32)) SeekEntryResult!2228)

(assert (=> b!295461 (= lt!146442 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!155397 () Bool)

(assert (=> start!29132 (=> (not res!155397) (not e!186739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29132 (= res!155397 (validMask!0 mask!3809))))

(assert (=> start!29132 e!186739))

(assert (=> start!29132 true))

(declare-fun array_inv!5052 (array!14938) Bool)

(assert (=> start!29132 (array_inv!5052 a!3312)))

(declare-fun b!295462 () Bool)

(declare-fun res!155395 () Bool)

(assert (=> b!295462 (=> (not res!155395) (not e!186739))))

(assert (=> b!295462 (= res!155395 (and (= (size!7433 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7433 a!3312))))))

(assert (= (and start!29132 res!155397) b!295462))

(assert (= (and b!295462 res!155395) b!295460))

(assert (= (and b!295460 res!155394) b!295456))

(assert (= (and b!295456 res!155396) b!295461))

(assert (= (and b!295461 res!155393) b!295458))

(assert (= (and b!295458 res!155391) b!295457))

(assert (= (and b!295457 res!155398) b!295455))

(assert (= (and b!295455 res!155392) b!295459))

(declare-fun m!308091 () Bool)

(assert (=> b!295460 m!308091))

(declare-fun m!308093 () Bool)

(assert (=> start!29132 m!308093))

(declare-fun m!308095 () Bool)

(assert (=> start!29132 m!308095))

(declare-fun m!308097 () Bool)

(assert (=> b!295457 m!308097))

(declare-fun m!308099 () Bool)

(assert (=> b!295457 m!308099))

(declare-fun m!308101 () Bool)

(assert (=> b!295457 m!308101))

(declare-fun m!308103 () Bool)

(assert (=> b!295457 m!308103))

(declare-fun m!308105 () Bool)

(assert (=> b!295459 m!308105))

(declare-fun m!308107 () Bool)

(assert (=> b!295461 m!308107))

(declare-fun m!308109 () Bool)

(assert (=> b!295456 m!308109))

(declare-fun m!308111 () Bool)

(assert (=> b!295458 m!308111))

(assert (=> b!295455 m!308105))

(check-sat (not start!29132) (not b!295456) (not b!295460) (not b!295457) (not b!295458) (not b!295461))
(check-sat)
