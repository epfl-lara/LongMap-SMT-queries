; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28284 () Bool)

(assert start!28284)

(declare-fun b!289851 () Bool)

(declare-fun res!151335 () Bool)

(declare-fun e!183468 () Bool)

(assert (=> b!289851 (=> (not res!151335) (not e!183468))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289851 (= res!151335 (validKeyInArray!0 k!2524))))

(declare-fun b!289853 () Bool)

(declare-fun res!151333 () Bool)

(assert (=> b!289853 (=> (not res!151333) (not e!183468))))

(declare-datatypes ((array!14598 0))(
  ( (array!14599 (arr!6926 (Array (_ BitVec 32) (_ BitVec 64))) (size!7278 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14598)

(declare-fun arrayContainsKey!0 (array!14598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289853 (= res!151333 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289854 () Bool)

(declare-fun e!183469 () Bool)

(declare-fun lt!143093 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289854 (= e!183469 (and (not lt!143093) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2075 0))(
  ( (MissingZero!2075 (index!10470 (_ BitVec 32))) (Found!2075 (index!10471 (_ BitVec 32))) (Intermediate!2075 (undefined!2887 Bool) (index!10472 (_ BitVec 32)) (x!28672 (_ BitVec 32))) (Undefined!2075) (MissingVacant!2075 (index!10473 (_ BitVec 32))) )
))
(declare-fun lt!143095 () SeekEntryResult!2075)

(declare-fun lt!143094 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14598 (_ BitVec 32)) SeekEntryResult!2075)

(assert (=> b!289854 (= lt!143095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143094 k!2524 (array!14599 (store (arr!6926 a!3312) i!1256 k!2524) (size!7278 a!3312)) mask!3809))))

(declare-fun lt!143091 () SeekEntryResult!2075)

(assert (=> b!289854 (= lt!143091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143094 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289854 (= lt!143094 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289855 () Bool)

(assert (=> b!289855 (= e!183468 e!183469)))

(declare-fun res!151332 () Bool)

(assert (=> b!289855 (=> (not res!151332) (not e!183469))))

(declare-fun lt!143092 () SeekEntryResult!2075)

(assert (=> b!289855 (= res!151332 (or lt!143093 (= lt!143092 (MissingVacant!2075 i!1256))))))

(assert (=> b!289855 (= lt!143093 (= lt!143092 (MissingZero!2075 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14598 (_ BitVec 32)) SeekEntryResult!2075)

(assert (=> b!289855 (= lt!143092 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289856 () Bool)

(declare-fun res!151331 () Bool)

(assert (=> b!289856 (=> (not res!151331) (not e!183468))))

(assert (=> b!289856 (= res!151331 (and (= (size!7278 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7278 a!3312))))))

(declare-fun res!151334 () Bool)

(assert (=> start!28284 (=> (not res!151334) (not e!183468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28284 (= res!151334 (validMask!0 mask!3809))))

(assert (=> start!28284 e!183468))

(assert (=> start!28284 true))

(declare-fun array_inv!4889 (array!14598) Bool)

(assert (=> start!28284 (array_inv!4889 a!3312)))

(declare-fun b!289852 () Bool)

(declare-fun res!151330 () Bool)

(assert (=> b!289852 (=> (not res!151330) (not e!183469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14598 (_ BitVec 32)) Bool)

(assert (=> b!289852 (= res!151330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28284 res!151334) b!289856))

(assert (= (and b!289856 res!151331) b!289851))

(assert (= (and b!289851 res!151335) b!289853))

(assert (= (and b!289853 res!151333) b!289855))

(assert (= (and b!289855 res!151332) b!289852))

(assert (= (and b!289852 res!151330) b!289854))

(declare-fun m!303927 () Bool)

(assert (=> start!28284 m!303927))

(declare-fun m!303929 () Bool)

(assert (=> start!28284 m!303929))

(declare-fun m!303931 () Bool)

(assert (=> b!289851 m!303931))

(declare-fun m!303933 () Bool)

(assert (=> b!289855 m!303933))

(declare-fun m!303935 () Bool)

(assert (=> b!289852 m!303935))

(declare-fun m!303937 () Bool)

(assert (=> b!289854 m!303937))

(declare-fun m!303939 () Bool)

(assert (=> b!289854 m!303939))

(declare-fun m!303941 () Bool)

(assert (=> b!289854 m!303941))

(declare-fun m!303943 () Bool)

(assert (=> b!289854 m!303943))

(declare-fun m!303945 () Bool)

(assert (=> b!289853 m!303945))

(push 1)

