; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28206 () Bool)

(assert start!28206)

(declare-fun b!288829 () Bool)

(declare-fun res!150454 () Bool)

(declare-fun e!182873 () Bool)

(assert (=> b!288829 (=> (not res!150454) (not e!182873))))

(declare-datatypes ((array!14520 0))(
  ( (array!14521 (arr!6887 (Array (_ BitVec 32) (_ BitVec 64))) (size!7239 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14520)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14520 (_ BitVec 32)) Bool)

(assert (=> b!288829 (= res!150454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150456 () Bool)

(declare-fun e!182871 () Bool)

(assert (=> start!28206 (=> (not res!150456) (not e!182871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28206 (= res!150456 (validMask!0 mask!3809))))

(assert (=> start!28206 e!182871))

(assert (=> start!28206 true))

(declare-fun array_inv!4850 (array!14520) Bool)

(assert (=> start!28206 (array_inv!4850 a!3312)))

(declare-fun b!288830 () Bool)

(declare-fun e!182872 () Bool)

(assert (=> b!288830 (= e!182872 (not true))))

(declare-datatypes ((SeekEntryResult!2036 0))(
  ( (MissingZero!2036 (index!10314 (_ BitVec 32))) (Found!2036 (index!10315 (_ BitVec 32))) (Intermediate!2036 (undefined!2848 Bool) (index!10316 (_ BitVec 32)) (x!28529 (_ BitVec 32))) (Undefined!2036) (MissingVacant!2036 (index!10317 (_ BitVec 32))) )
))
(declare-fun lt!142374 () SeekEntryResult!2036)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288830 (and (= (select (arr!6887 a!3312) (index!10316 lt!142374)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10316 lt!142374) i!1256))))

(declare-fun b!288831 () Bool)

(assert (=> b!288831 (= e!182871 e!182873)))

(declare-fun res!150455 () Bool)

(assert (=> b!288831 (=> (not res!150455) (not e!182873))))

(declare-fun lt!142376 () SeekEntryResult!2036)

(declare-fun lt!142377 () Bool)

(assert (=> b!288831 (= res!150455 (or lt!142377 (= lt!142376 (MissingVacant!2036 i!1256))))))

(assert (=> b!288831 (= lt!142377 (= lt!142376 (MissingZero!2036 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14520 (_ BitVec 32)) SeekEntryResult!2036)

(assert (=> b!288831 (= lt!142376 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288832 () Bool)

(declare-fun e!182870 () Bool)

(assert (=> b!288832 (= e!182873 e!182870)))

(declare-fun res!150457 () Bool)

(assert (=> b!288832 (=> (not res!150457) (not e!182870))))

(assert (=> b!288832 (= res!150457 lt!142377)))

(declare-fun lt!142378 () (_ BitVec 32))

(declare-fun lt!142373 () SeekEntryResult!2036)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14520 (_ BitVec 32)) SeekEntryResult!2036)

(assert (=> b!288832 (= lt!142373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142378 k!2524 (array!14521 (store (arr!6887 a!3312) i!1256 k!2524) (size!7239 a!3312)) mask!3809))))

(assert (=> b!288832 (= lt!142374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142378 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288832 (= lt!142378 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288833 () Bool)

(declare-fun res!150452 () Bool)

(assert (=> b!288833 (=> (not res!150452) (not e!182871))))

(assert (=> b!288833 (= res!150452 (and (= (size!7239 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7239 a!3312))))))

(declare-fun b!288834 () Bool)

(declare-fun res!150453 () Bool)

(assert (=> b!288834 (=> (not res!150453) (not e!182871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288834 (= res!150453 (validKeyInArray!0 k!2524))))

(declare-fun b!288835 () Bool)

(declare-fun res!150458 () Bool)

(assert (=> b!288835 (=> (not res!150458) (not e!182871))))

(declare-fun arrayContainsKey!0 (array!14520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288835 (= res!150458 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288836 () Bool)

(assert (=> b!288836 (= e!182870 e!182872)))

(declare-fun res!150459 () Bool)

(assert (=> b!288836 (=> (not res!150459) (not e!182872))))

(declare-fun lt!142375 () Bool)

(assert (=> b!288836 (= res!150459 (and (or lt!142375 (not (undefined!2848 lt!142374))) (or lt!142375 (not (= (select (arr!6887 a!3312) (index!10316 lt!142374)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142375 (not (= (select (arr!6887 a!3312) (index!10316 lt!142374)) k!2524))) (not lt!142375)))))

(assert (=> b!288836 (= lt!142375 (not (is-Intermediate!2036 lt!142374)))))

(assert (= (and start!28206 res!150456) b!288833))

(assert (= (and b!288833 res!150452) b!288834))

(assert (= (and b!288834 res!150453) b!288835))

(assert (= (and b!288835 res!150458) b!288831))

(assert (= (and b!288831 res!150455) b!288829))

(assert (= (and b!288829 res!150454) b!288832))

(assert (= (and b!288832 res!150457) b!288836))

(assert (= (and b!288836 res!150459) b!288830))

(declare-fun m!303027 () Bool)

(assert (=> b!288829 m!303027))

(declare-fun m!303029 () Bool)

(assert (=> b!288831 m!303029))

(declare-fun m!303031 () Bool)

(assert (=> b!288834 m!303031))

(declare-fun m!303033 () Bool)

(assert (=> b!288830 m!303033))

(declare-fun m!303035 () Bool)

(assert (=> start!28206 m!303035))

(declare-fun m!303037 () Bool)

(assert (=> start!28206 m!303037))

(declare-fun m!303039 () Bool)

(assert (=> b!288835 m!303039))

(assert (=> b!288836 m!303033))

(declare-fun m!303041 () Bool)

(assert (=> b!288832 m!303041))

(declare-fun m!303043 () Bool)

(assert (=> b!288832 m!303043))

(declare-fun m!303045 () Bool)

(assert (=> b!288832 m!303045))

(declare-fun m!303047 () Bool)

(assert (=> b!288832 m!303047))

(push 1)

