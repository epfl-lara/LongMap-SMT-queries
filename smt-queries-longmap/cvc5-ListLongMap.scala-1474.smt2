; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28230 () Bool)

(assert start!28230)

(declare-fun b!289117 () Bool)

(declare-fun res!150747 () Bool)

(declare-fun e!183052 () Bool)

(assert (=> b!289117 (=> (not res!150747) (not e!183052))))

(declare-datatypes ((array!14544 0))(
  ( (array!14545 (arr!6899 (Array (_ BitVec 32) (_ BitVec 64))) (size!7251 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14544)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14544 (_ BitVec 32)) Bool)

(assert (=> b!289117 (= res!150747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289118 () Bool)

(declare-fun res!150744 () Bool)

(declare-fun e!183050 () Bool)

(assert (=> b!289118 (=> (not res!150744) (not e!183050))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289118 (= res!150744 (validKeyInArray!0 k!2524))))

(declare-fun b!289119 () Bool)

(declare-fun res!150746 () Bool)

(assert (=> b!289119 (=> (not res!150746) (not e!183050))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289119 (= res!150746 (and (= (size!7251 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7251 a!3312))))))

(declare-fun res!150743 () Bool)

(assert (=> start!28230 (=> (not res!150743) (not e!183050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28230 (= res!150743 (validMask!0 mask!3809))))

(assert (=> start!28230 e!183050))

(assert (=> start!28230 true))

(declare-fun array_inv!4862 (array!14544) Bool)

(assert (=> start!28230 (array_inv!4862 a!3312)))

(declare-fun b!289120 () Bool)

(declare-fun res!150741 () Bool)

(assert (=> b!289120 (=> (not res!150741) (not e!183050))))

(declare-fun arrayContainsKey!0 (array!14544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289120 (= res!150741 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289121 () Bool)

(declare-fun e!183053 () Bool)

(declare-fun e!183049 () Bool)

(assert (=> b!289121 (= e!183053 e!183049)))

(declare-fun res!150745 () Bool)

(assert (=> b!289121 (=> (not res!150745) (not e!183049))))

(declare-datatypes ((SeekEntryResult!2048 0))(
  ( (MissingZero!2048 (index!10362 (_ BitVec 32))) (Found!2048 (index!10363 (_ BitVec 32))) (Intermediate!2048 (undefined!2860 Bool) (index!10364 (_ BitVec 32)) (x!28573 (_ BitVec 32))) (Undefined!2048) (MissingVacant!2048 (index!10365 (_ BitVec 32))) )
))
(declare-fun lt!142591 () SeekEntryResult!2048)

(declare-fun lt!142593 () Bool)

(assert (=> b!289121 (= res!150745 (and (or lt!142593 (not (undefined!2860 lt!142591))) (or lt!142593 (not (= (select (arr!6899 a!3312) (index!10364 lt!142591)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142593 (not (= (select (arr!6899 a!3312) (index!10364 lt!142591)) k!2524))) (not lt!142593)))))

(assert (=> b!289121 (= lt!142593 (not (is-Intermediate!2048 lt!142591)))))

(declare-fun b!289122 () Bool)

(assert (=> b!289122 (= e!183049 (not true))))

(assert (=> b!289122 (and (= (select (arr!6899 a!3312) (index!10364 lt!142591)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10364 lt!142591) i!1256))))

(declare-fun b!289123 () Bool)

(assert (=> b!289123 (= e!183052 e!183053)))

(declare-fun res!150740 () Bool)

(assert (=> b!289123 (=> (not res!150740) (not e!183053))))

(declare-fun lt!142590 () Bool)

(assert (=> b!289123 (= res!150740 lt!142590)))

(declare-fun lt!142594 () SeekEntryResult!2048)

(declare-fun lt!142589 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14544 (_ BitVec 32)) SeekEntryResult!2048)

(assert (=> b!289123 (= lt!142594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142589 k!2524 (array!14545 (store (arr!6899 a!3312) i!1256 k!2524) (size!7251 a!3312)) mask!3809))))

(assert (=> b!289123 (= lt!142591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142589 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289123 (= lt!142589 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289124 () Bool)

(assert (=> b!289124 (= e!183050 e!183052)))

(declare-fun res!150742 () Bool)

(assert (=> b!289124 (=> (not res!150742) (not e!183052))))

(declare-fun lt!142592 () SeekEntryResult!2048)

(assert (=> b!289124 (= res!150742 (or lt!142590 (= lt!142592 (MissingVacant!2048 i!1256))))))

(assert (=> b!289124 (= lt!142590 (= lt!142592 (MissingZero!2048 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14544 (_ BitVec 32)) SeekEntryResult!2048)

(assert (=> b!289124 (= lt!142592 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28230 res!150743) b!289119))

(assert (= (and b!289119 res!150746) b!289118))

(assert (= (and b!289118 res!150744) b!289120))

(assert (= (and b!289120 res!150741) b!289124))

(assert (= (and b!289124 res!150742) b!289117))

(assert (= (and b!289117 res!150747) b!289123))

(assert (= (and b!289123 res!150740) b!289121))

(assert (= (and b!289121 res!150745) b!289122))

(declare-fun m!303291 () Bool)

(assert (=> b!289120 m!303291))

(declare-fun m!303293 () Bool)

(assert (=> b!289121 m!303293))

(declare-fun m!303295 () Bool)

(assert (=> start!28230 m!303295))

(declare-fun m!303297 () Bool)

(assert (=> start!28230 m!303297))

(declare-fun m!303299 () Bool)

(assert (=> b!289124 m!303299))

(declare-fun m!303301 () Bool)

(assert (=> b!289118 m!303301))

(declare-fun m!303303 () Bool)

(assert (=> b!289117 m!303303))

(declare-fun m!303305 () Bool)

(assert (=> b!289123 m!303305))

(declare-fun m!303307 () Bool)

(assert (=> b!289123 m!303307))

(declare-fun m!303309 () Bool)

(assert (=> b!289123 m!303309))

(declare-fun m!303311 () Bool)

(assert (=> b!289123 m!303311))

(assert (=> b!289122 m!303293))

(push 1)

