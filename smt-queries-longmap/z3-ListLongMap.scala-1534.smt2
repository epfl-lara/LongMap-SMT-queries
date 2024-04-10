; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29136 () Bool)

(assert start!29136)

(declare-fun b!295582 () Bool)

(declare-fun e!186822 () Bool)

(assert (=> b!295582 (= e!186822 (not true))))

(declare-datatypes ((array!14939 0))(
  ( (array!14940 (arr!7080 (Array (_ BitVec 32) (_ BitVec 64))) (size!7432 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14939)

(declare-datatypes ((SeekEntryResult!2229 0))(
  ( (MissingZero!2229 (index!11086 (_ BitVec 32))) (Found!2229 (index!11087 (_ BitVec 32))) (Intermediate!2229 (undefined!3041 Bool) (index!11088 (_ BitVec 32)) (x!29305 (_ BitVec 32))) (Undefined!2229) (MissingVacant!2229 (index!11089 (_ BitVec 32))) )
))
(declare-fun lt!146574 () SeekEntryResult!2229)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295582 (and (= (select (arr!7080 a!3312) (index!11088 lt!146574)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11088 lt!146574) i!1256))))

(declare-fun b!295584 () Bool)

(declare-fun res!155397 () Bool)

(declare-fun e!186824 () Bool)

(assert (=> b!295584 (=> (not res!155397) (not e!186824))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295584 (= res!155397 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295585 () Bool)

(declare-fun res!155394 () Bool)

(assert (=> b!295585 (=> (not res!155394) (not e!186824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295585 (= res!155394 (validKeyInArray!0 k0!2524))))

(declare-fun b!295586 () Bool)

(declare-fun e!186823 () Bool)

(assert (=> b!295586 (= e!186823 e!186822)))

(declare-fun res!155392 () Bool)

(assert (=> b!295586 (=> (not res!155392) (not e!186822))))

(declare-fun lt!146577 () Bool)

(assert (=> b!295586 (= res!155392 (and (or lt!146577 (not (undefined!3041 lt!146574))) (or lt!146577 (not (= (select (arr!7080 a!3312) (index!11088 lt!146574)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146577 (not (= (select (arr!7080 a!3312) (index!11088 lt!146574)) k0!2524))) (not lt!146577)))))

(get-info :version)

(assert (=> b!295586 (= lt!146577 (not ((_ is Intermediate!2229) lt!146574)))))

(declare-fun b!295587 () Bool)

(declare-fun e!186825 () Bool)

(assert (=> b!295587 (= e!186824 e!186825)))

(declare-fun res!155391 () Bool)

(assert (=> b!295587 (=> (not res!155391) (not e!186825))))

(declare-fun lt!146573 () SeekEntryResult!2229)

(declare-fun lt!146576 () Bool)

(assert (=> b!295587 (= res!155391 (or lt!146576 (= lt!146573 (MissingVacant!2229 i!1256))))))

(assert (=> b!295587 (= lt!146576 (= lt!146573 (MissingZero!2229 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14939 (_ BitVec 32)) SeekEntryResult!2229)

(assert (=> b!295587 (= lt!146573 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295583 () Bool)

(assert (=> b!295583 (= e!186825 e!186823)))

(declare-fun res!155396 () Bool)

(assert (=> b!295583 (=> (not res!155396) (not e!186823))))

(assert (=> b!295583 (= res!155396 lt!146576)))

(declare-fun lt!146575 () SeekEntryResult!2229)

(declare-fun lt!146572 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14939 (_ BitVec 32)) SeekEntryResult!2229)

(assert (=> b!295583 (= lt!146575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146572 k0!2524 (array!14940 (store (arr!7080 a!3312) i!1256 k0!2524) (size!7432 a!3312)) mask!3809))))

(assert (=> b!295583 (= lt!146574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146572 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295583 (= lt!146572 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!155393 () Bool)

(assert (=> start!29136 (=> (not res!155393) (not e!186824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29136 (= res!155393 (validMask!0 mask!3809))))

(assert (=> start!29136 e!186824))

(assert (=> start!29136 true))

(declare-fun array_inv!5043 (array!14939) Bool)

(assert (=> start!29136 (array_inv!5043 a!3312)))

(declare-fun b!295588 () Bool)

(declare-fun res!155390 () Bool)

(assert (=> b!295588 (=> (not res!155390) (not e!186824))))

(assert (=> b!295588 (= res!155390 (and (= (size!7432 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7432 a!3312))))))

(declare-fun b!295589 () Bool)

(declare-fun res!155395 () Bool)

(assert (=> b!295589 (=> (not res!155395) (not e!186825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14939 (_ BitVec 32)) Bool)

(assert (=> b!295589 (= res!155395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29136 res!155393) b!295588))

(assert (= (and b!295588 res!155390) b!295585))

(assert (= (and b!295585 res!155394) b!295584))

(assert (= (and b!295584 res!155397) b!295587))

(assert (= (and b!295587 res!155391) b!295589))

(assert (= (and b!295589 res!155395) b!295583))

(assert (= (and b!295583 res!155396) b!295586))

(assert (= (and b!295586 res!155392) b!295582))

(declare-fun m!308677 () Bool)

(assert (=> b!295582 m!308677))

(declare-fun m!308679 () Bool)

(assert (=> start!29136 m!308679))

(declare-fun m!308681 () Bool)

(assert (=> start!29136 m!308681))

(declare-fun m!308683 () Bool)

(assert (=> b!295587 m!308683))

(assert (=> b!295586 m!308677))

(declare-fun m!308685 () Bool)

(assert (=> b!295585 m!308685))

(declare-fun m!308687 () Bool)

(assert (=> b!295589 m!308687))

(declare-fun m!308689 () Bool)

(assert (=> b!295583 m!308689))

(declare-fun m!308691 () Bool)

(assert (=> b!295583 m!308691))

(declare-fun m!308693 () Bool)

(assert (=> b!295583 m!308693))

(declare-fun m!308695 () Bool)

(assert (=> b!295583 m!308695))

(declare-fun m!308697 () Bool)

(assert (=> b!295584 m!308697))

(check-sat (not b!295587) (not b!295583) (not start!29136) (not b!295585) (not b!295584) (not b!295589))
(check-sat)
