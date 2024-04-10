; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28232 () Bool)

(assert start!28232)

(declare-fun b!289141 () Bool)

(declare-fun res!150770 () Bool)

(declare-fun e!183064 () Bool)

(assert (=> b!289141 (=> (not res!150770) (not e!183064))))

(declare-datatypes ((array!14546 0))(
  ( (array!14547 (arr!6900 (Array (_ BitVec 32) (_ BitVec 64))) (size!7252 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14546)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14546 (_ BitVec 32)) Bool)

(assert (=> b!289141 (= res!150770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289142 () Bool)

(declare-fun e!183068 () Bool)

(assert (=> b!289142 (= e!183068 (not true))))

(declare-datatypes ((SeekEntryResult!2049 0))(
  ( (MissingZero!2049 (index!10366 (_ BitVec 32))) (Found!2049 (index!10367 (_ BitVec 32))) (Intermediate!2049 (undefined!2861 Bool) (index!10368 (_ BitVec 32)) (x!28574 (_ BitVec 32))) (Undefined!2049) (MissingVacant!2049 (index!10369 (_ BitVec 32))) )
))
(declare-fun lt!142607 () SeekEntryResult!2049)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289142 (and (= (select (arr!6900 a!3312) (index!10368 lt!142607)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10368 lt!142607) i!1256))))

(declare-fun res!150766 () Bool)

(declare-fun e!183065 () Bool)

(assert (=> start!28232 (=> (not res!150766) (not e!183065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28232 (= res!150766 (validMask!0 mask!3809))))

(assert (=> start!28232 e!183065))

(assert (=> start!28232 true))

(declare-fun array_inv!4863 (array!14546) Bool)

(assert (=> start!28232 (array_inv!4863 a!3312)))

(declare-fun b!289143 () Bool)

(declare-fun e!183067 () Bool)

(assert (=> b!289143 (= e!183067 e!183068)))

(declare-fun res!150764 () Bool)

(assert (=> b!289143 (=> (not res!150764) (not e!183068))))

(declare-fun lt!142609 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!289143 (= res!150764 (and (or lt!142609 (not (undefined!2861 lt!142607))) (or lt!142609 (not (= (select (arr!6900 a!3312) (index!10368 lt!142607)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142609 (not (= (select (arr!6900 a!3312) (index!10368 lt!142607)) k0!2524))) (not lt!142609)))))

(get-info :version)

(assert (=> b!289143 (= lt!142609 (not ((_ is Intermediate!2049) lt!142607)))))

(declare-fun b!289144 () Bool)

(assert (=> b!289144 (= e!183065 e!183064)))

(declare-fun res!150765 () Bool)

(assert (=> b!289144 (=> (not res!150765) (not e!183064))))

(declare-fun lt!142608 () Bool)

(declare-fun lt!142611 () SeekEntryResult!2049)

(assert (=> b!289144 (= res!150765 (or lt!142608 (= lt!142611 (MissingVacant!2049 i!1256))))))

(assert (=> b!289144 (= lt!142608 (= lt!142611 (MissingZero!2049 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14546 (_ BitVec 32)) SeekEntryResult!2049)

(assert (=> b!289144 (= lt!142611 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289145 () Bool)

(declare-fun res!150767 () Bool)

(assert (=> b!289145 (=> (not res!150767) (not e!183065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289145 (= res!150767 (validKeyInArray!0 k0!2524))))

(declare-fun b!289146 () Bool)

(declare-fun res!150769 () Bool)

(assert (=> b!289146 (=> (not res!150769) (not e!183065))))

(assert (=> b!289146 (= res!150769 (and (= (size!7252 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7252 a!3312))))))

(declare-fun b!289147 () Bool)

(assert (=> b!289147 (= e!183064 e!183067)))

(declare-fun res!150768 () Bool)

(assert (=> b!289147 (=> (not res!150768) (not e!183067))))

(assert (=> b!289147 (= res!150768 lt!142608)))

(declare-fun lt!142612 () (_ BitVec 32))

(declare-fun lt!142610 () SeekEntryResult!2049)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14546 (_ BitVec 32)) SeekEntryResult!2049)

(assert (=> b!289147 (= lt!142610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142612 k0!2524 (array!14547 (store (arr!6900 a!3312) i!1256 k0!2524) (size!7252 a!3312)) mask!3809))))

(assert (=> b!289147 (= lt!142607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142612 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289147 (= lt!142612 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289148 () Bool)

(declare-fun res!150771 () Bool)

(assert (=> b!289148 (=> (not res!150771) (not e!183065))))

(declare-fun arrayContainsKey!0 (array!14546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289148 (= res!150771 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28232 res!150766) b!289146))

(assert (= (and b!289146 res!150769) b!289145))

(assert (= (and b!289145 res!150767) b!289148))

(assert (= (and b!289148 res!150771) b!289144))

(assert (= (and b!289144 res!150765) b!289141))

(assert (= (and b!289141 res!150770) b!289147))

(assert (= (and b!289147 res!150768) b!289143))

(assert (= (and b!289143 res!150764) b!289142))

(declare-fun m!303313 () Bool)

(assert (=> b!289142 m!303313))

(declare-fun m!303315 () Bool)

(assert (=> b!289148 m!303315))

(assert (=> b!289143 m!303313))

(declare-fun m!303317 () Bool)

(assert (=> start!28232 m!303317))

(declare-fun m!303319 () Bool)

(assert (=> start!28232 m!303319))

(declare-fun m!303321 () Bool)

(assert (=> b!289144 m!303321))

(declare-fun m!303323 () Bool)

(assert (=> b!289145 m!303323))

(declare-fun m!303325 () Bool)

(assert (=> b!289147 m!303325))

(declare-fun m!303327 () Bool)

(assert (=> b!289147 m!303327))

(declare-fun m!303329 () Bool)

(assert (=> b!289147 m!303329))

(declare-fun m!303331 () Bool)

(assert (=> b!289147 m!303331))

(declare-fun m!303333 () Bool)

(assert (=> b!289141 m!303333))

(check-sat (not b!289141) (not start!28232) (not b!289144) (not b!289148) (not b!289147) (not b!289145))
(check-sat)
