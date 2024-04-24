; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28216 () Bool)

(assert start!28216)

(declare-fun b!289092 () Bool)

(declare-fun e!183028 () Bool)

(declare-fun e!183030 () Bool)

(assert (=> b!289092 (= e!183028 e!183030)))

(declare-fun res!150691 () Bool)

(assert (=> b!289092 (=> (not res!150691) (not e!183030))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142599 () Bool)

(declare-datatypes ((SeekEntryResult!2009 0))(
  ( (MissingZero!2009 (index!10206 (_ BitVec 32))) (Found!2009 (index!10207 (_ BitVec 32))) (Intermediate!2009 (undefined!2821 Bool) (index!10208 (_ BitVec 32)) (x!28526 (_ BitVec 32))) (Undefined!2009) (MissingVacant!2009 (index!10209 (_ BitVec 32))) )
))
(declare-fun lt!142598 () SeekEntryResult!2009)

(assert (=> b!289092 (= res!150691 (or lt!142599 (= lt!142598 (MissingVacant!2009 i!1256))))))

(assert (=> b!289092 (= lt!142599 (= lt!142598 (MissingZero!2009 i!1256)))))

(declare-datatypes ((array!14535 0))(
  ( (array!14536 (arr!6895 (Array (_ BitVec 32) (_ BitVec 64))) (size!7247 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14535)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14535 (_ BitVec 32)) SeekEntryResult!2009)

(assert (=> b!289092 (= lt!142598 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289093 () Bool)

(declare-fun e!183029 () Bool)

(declare-fun e!183031 () Bool)

(assert (=> b!289093 (= e!183029 e!183031)))

(declare-fun res!150696 () Bool)

(assert (=> b!289093 (=> (not res!150696) (not e!183031))))

(declare-fun lt!142595 () Bool)

(declare-fun lt!142597 () SeekEntryResult!2009)

(assert (=> b!289093 (= res!150696 (and (or lt!142595 (not (undefined!2821 lt!142597))) (or lt!142595 (not (= (select (arr!6895 a!3312) (index!10208 lt!142597)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142595 (not (= (select (arr!6895 a!3312) (index!10208 lt!142597)) k0!2524))) (not lt!142595)))))

(get-info :version)

(assert (=> b!289093 (= lt!142595 (not ((_ is Intermediate!2009) lt!142597)))))

(declare-fun b!289094 () Bool)

(declare-fun res!150689 () Bool)

(assert (=> b!289094 (=> (not res!150689) (not e!183028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289094 (= res!150689 (validKeyInArray!0 k0!2524))))

(declare-fun b!289095 () Bool)

(declare-fun res!150690 () Bool)

(assert (=> b!289095 (=> (not res!150690) (not e!183028))))

(declare-fun arrayContainsKey!0 (array!14535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289095 (= res!150690 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289096 () Bool)

(declare-fun res!150693 () Bool)

(assert (=> b!289096 (=> (not res!150693) (not e!183030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14535 (_ BitVec 32)) Bool)

(assert (=> b!289096 (= res!150693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289097 () Bool)

(assert (=> b!289097 (= e!183030 e!183029)))

(declare-fun res!150695 () Bool)

(assert (=> b!289097 (=> (not res!150695) (not e!183029))))

(assert (=> b!289097 (= res!150695 lt!142599)))

(declare-fun lt!142596 () SeekEntryResult!2009)

(declare-fun lt!142594 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14535 (_ BitVec 32)) SeekEntryResult!2009)

(assert (=> b!289097 (= lt!142596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142594 k0!2524 (array!14536 (store (arr!6895 a!3312) i!1256 k0!2524) (size!7247 a!3312)) mask!3809))))

(assert (=> b!289097 (= lt!142597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142594 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289097 (= lt!142594 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!150692 () Bool)

(assert (=> start!28216 (=> (not res!150692) (not e!183028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28216 (= res!150692 (validMask!0 mask!3809))))

(assert (=> start!28216 e!183028))

(assert (=> start!28216 true))

(declare-fun array_inv!4845 (array!14535) Bool)

(assert (=> start!28216 (array_inv!4845 a!3312)))

(declare-fun b!289098 () Bool)

(assert (=> b!289098 (= e!183031 (not true))))

(assert (=> b!289098 (and (= (select (arr!6895 a!3312) (index!10208 lt!142597)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10208 lt!142597) i!1256))))

(declare-fun b!289099 () Bool)

(declare-fun res!150694 () Bool)

(assert (=> b!289099 (=> (not res!150694) (not e!183028))))

(assert (=> b!289099 (= res!150694 (and (= (size!7247 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7247 a!3312))))))

(assert (= (and start!28216 res!150692) b!289099))

(assert (= (and b!289099 res!150694) b!289094))

(assert (= (and b!289094 res!150689) b!289095))

(assert (= (and b!289095 res!150690) b!289092))

(assert (= (and b!289092 res!150691) b!289096))

(assert (= (and b!289096 res!150693) b!289097))

(assert (= (and b!289097 res!150695) b!289093))

(assert (= (and b!289093 res!150696) b!289098))

(declare-fun m!303431 () Bool)

(assert (=> b!289095 m!303431))

(declare-fun m!303433 () Bool)

(assert (=> b!289092 m!303433))

(declare-fun m!303435 () Bool)

(assert (=> b!289096 m!303435))

(declare-fun m!303437 () Bool)

(assert (=> b!289094 m!303437))

(declare-fun m!303439 () Bool)

(assert (=> b!289093 m!303439))

(declare-fun m!303441 () Bool)

(assert (=> b!289097 m!303441))

(declare-fun m!303443 () Bool)

(assert (=> b!289097 m!303443))

(declare-fun m!303445 () Bool)

(assert (=> b!289097 m!303445))

(declare-fun m!303447 () Bool)

(assert (=> b!289097 m!303447))

(assert (=> b!289098 m!303439))

(declare-fun m!303449 () Bool)

(assert (=> start!28216 m!303449))

(declare-fun m!303451 () Bool)

(assert (=> start!28216 m!303451))

(check-sat (not start!28216) (not b!289097) (not b!289094) (not b!289096) (not b!289092) (not b!289095))
(check-sat)
