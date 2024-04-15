; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28412 () Bool)

(assert start!28412)

(declare-fun b!290806 () Bool)

(declare-fun e!184008 () Bool)

(declare-fun e!184010 () Bool)

(assert (=> b!290806 (= e!184008 e!184010)))

(declare-fun res!152199 () Bool)

(assert (=> b!290806 (=> (not res!152199) (not e!184010))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143648 () Bool)

(declare-datatypes ((SeekEntryResult!2111 0))(
  ( (MissingZero!2111 (index!10614 (_ BitVec 32))) (Found!2111 (index!10615 (_ BitVec 32))) (Intermediate!2111 (undefined!2923 Bool) (index!10616 (_ BitVec 32)) (x!28825 (_ BitVec 32))) (Undefined!2111) (MissingVacant!2111 (index!10617 (_ BitVec 32))) )
))
(declare-fun lt!143650 () SeekEntryResult!2111)

(assert (=> b!290806 (= res!152199 (or lt!143648 (= lt!143650 (MissingVacant!2111 i!1256))))))

(assert (=> b!290806 (= lt!143648 (= lt!143650 (MissingZero!2111 i!1256)))))

(declare-datatypes ((array!14674 0))(
  ( (array!14675 (arr!6963 (Array (_ BitVec 32) (_ BitVec 64))) (size!7316 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14674)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14674 (_ BitVec 32)) SeekEntryResult!2111)

(assert (=> b!290806 (= lt!143650 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290807 () Bool)

(declare-fun e!184011 () Bool)

(assert (=> b!290807 (= e!184010 e!184011)))

(declare-fun res!152201 () Bool)

(assert (=> b!290807 (=> (not res!152201) (not e!184011))))

(assert (=> b!290807 (= res!152201 (and (not lt!143648) (= lt!143650 (MissingVacant!2111 i!1256))))))

(declare-fun lt!143647 () (_ BitVec 32))

(declare-fun lt!143652 () SeekEntryResult!2111)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14674 (_ BitVec 32)) SeekEntryResult!2111)

(assert (=> b!290807 (= lt!143652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143647 k0!2524 (array!14675 (store (arr!6963 a!3312) i!1256 k0!2524) (size!7316 a!3312)) mask!3809))))

(declare-fun lt!143649 () SeekEntryResult!2111)

(assert (=> b!290807 (= lt!143649 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143647 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290807 (= lt!143647 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290808 () Bool)

(declare-fun res!152196 () Bool)

(assert (=> b!290808 (=> (not res!152196) (not e!184008))))

(declare-fun arrayContainsKey!0 (array!14674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290808 (= res!152196 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290809 () Bool)

(declare-fun res!152198 () Bool)

(assert (=> b!290809 (=> (not res!152198) (not e!184010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14674 (_ BitVec 32)) Bool)

(assert (=> b!290809 (= res!152198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290810 () Bool)

(declare-fun e!184007 () Bool)

(assert (=> b!290810 (= e!184007 (not true))))

(assert (=> b!290810 (= (index!10616 lt!143649) i!1256)))

(declare-fun b!290811 () Bool)

(declare-fun res!152203 () Bool)

(assert (=> b!290811 (=> (not res!152203) (not e!184008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290811 (= res!152203 (validKeyInArray!0 k0!2524))))

(declare-fun res!152202 () Bool)

(assert (=> start!28412 (=> (not res!152202) (not e!184008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28412 (= res!152202 (validMask!0 mask!3809))))

(assert (=> start!28412 e!184008))

(assert (=> start!28412 true))

(declare-fun array_inv!4935 (array!14674) Bool)

(assert (=> start!28412 (array_inv!4935 a!3312)))

(declare-fun b!290812 () Bool)

(declare-fun res!152200 () Bool)

(assert (=> b!290812 (=> (not res!152200) (not e!184008))))

(assert (=> b!290812 (= res!152200 (and (= (size!7316 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7316 a!3312))))))

(declare-fun b!290813 () Bool)

(assert (=> b!290813 (= e!184011 e!184007)))

(declare-fun res!152197 () Bool)

(assert (=> b!290813 (=> (not res!152197) (not e!184007))))

(declare-fun lt!143651 () Bool)

(assert (=> b!290813 (= res!152197 (and (or lt!143651 (not (undefined!2923 lt!143649))) (not lt!143651) (= (select (arr!6963 a!3312) (index!10616 lt!143649)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290813 (= lt!143651 (not ((_ is Intermediate!2111) lt!143649)))))

(assert (= (and start!28412 res!152202) b!290812))

(assert (= (and b!290812 res!152200) b!290811))

(assert (= (and b!290811 res!152203) b!290808))

(assert (= (and b!290808 res!152196) b!290806))

(assert (= (and b!290806 res!152199) b!290809))

(assert (= (and b!290809 res!152198) b!290807))

(assert (= (and b!290807 res!152201) b!290813))

(assert (= (and b!290813 res!152197) b!290810))

(declare-fun m!304337 () Bool)

(assert (=> b!290813 m!304337))

(declare-fun m!304339 () Bool)

(assert (=> b!290806 m!304339))

(declare-fun m!304341 () Bool)

(assert (=> b!290807 m!304341))

(declare-fun m!304343 () Bool)

(assert (=> b!290807 m!304343))

(declare-fun m!304345 () Bool)

(assert (=> b!290807 m!304345))

(declare-fun m!304347 () Bool)

(assert (=> b!290807 m!304347))

(declare-fun m!304349 () Bool)

(assert (=> b!290809 m!304349))

(declare-fun m!304351 () Bool)

(assert (=> start!28412 m!304351))

(declare-fun m!304353 () Bool)

(assert (=> start!28412 m!304353))

(declare-fun m!304355 () Bool)

(assert (=> b!290811 m!304355))

(declare-fun m!304357 () Bool)

(assert (=> b!290808 m!304357))

(check-sat (not b!290806) (not b!290807) (not start!28412) (not b!290809) (not b!290808) (not b!290811))
(check-sat)
