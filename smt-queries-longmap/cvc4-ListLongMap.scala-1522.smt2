; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28666 () Bool)

(assert start!28666)

(declare-fun b!293019 () Bool)

(declare-fun res!154080 () Bool)

(declare-fun e!185315 () Bool)

(assert (=> b!293019 (=> (not res!154080) (not e!185315))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14845 0))(
  ( (array!14846 (arr!7045 (Array (_ BitVec 32) (_ BitVec 64))) (size!7397 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14845)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!293019 (= res!154080 (and (= (size!7397 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7397 a!3312))))))

(declare-fun b!293020 () Bool)

(declare-fun res!154077 () Bool)

(assert (=> b!293020 (=> (not res!154077) (not e!185315))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293020 (= res!154077 (validKeyInArray!0 k!2524))))

(declare-fun b!293021 () Bool)

(declare-fun res!154079 () Bool)

(assert (=> b!293021 (=> (not res!154079) (not e!185315))))

(declare-fun arrayContainsKey!0 (array!14845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293021 (= res!154079 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293022 () Bool)

(declare-fun e!185313 () Bool)

(assert (=> b!293022 (= e!185315 e!185313)))

(declare-fun res!154078 () Bool)

(assert (=> b!293022 (=> (not res!154078) (not e!185313))))

(declare-datatypes ((SeekEntryResult!2194 0))(
  ( (MissingZero!2194 (index!10946 (_ BitVec 32))) (Found!2194 (index!10947 (_ BitVec 32))) (Intermediate!2194 (undefined!3006 Bool) (index!10948 (_ BitVec 32)) (x!29121 (_ BitVec 32))) (Undefined!2194) (MissingVacant!2194 (index!10949 (_ BitVec 32))) )
))
(declare-fun lt!145230 () SeekEntryResult!2194)

(assert (=> b!293022 (= res!154078 (or (= lt!145230 (MissingZero!2194 i!1256)) (= lt!145230 (MissingVacant!2194 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14845 (_ BitVec 32)) SeekEntryResult!2194)

(assert (=> b!293022 (= lt!145230 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!154075 () Bool)

(assert (=> start!28666 (=> (not res!154075) (not e!185315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28666 (= res!154075 (validMask!0 mask!3809))))

(assert (=> start!28666 e!185315))

(assert (=> start!28666 true))

(declare-fun array_inv!5008 (array!14845) Bool)

(assert (=> start!28666 (array_inv!5008 a!3312)))

(declare-fun b!293023 () Bool)

(declare-fun res!154076 () Bool)

(assert (=> b!293023 (=> (not res!154076) (not e!185313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14845 (_ BitVec 32)) Bool)

(assert (=> b!293023 (= res!154076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293024 () Bool)

(assert (=> b!293024 (= e!185313 false)))

(declare-fun lt!145229 () SeekEntryResult!2194)

(declare-fun lt!145231 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14845 (_ BitVec 32)) SeekEntryResult!2194)

(assert (=> b!293024 (= lt!145229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145231 k!2524 (array!14846 (store (arr!7045 a!3312) i!1256 k!2524) (size!7397 a!3312)) mask!3809))))

(declare-fun lt!145228 () SeekEntryResult!2194)

(assert (=> b!293024 (= lt!145228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145231 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293024 (= lt!145231 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28666 res!154075) b!293019))

(assert (= (and b!293019 res!154080) b!293020))

(assert (= (and b!293020 res!154077) b!293021))

(assert (= (and b!293021 res!154079) b!293022))

(assert (= (and b!293022 res!154078) b!293023))

(assert (= (and b!293023 res!154076) b!293024))

(declare-fun m!306817 () Bool)

(assert (=> b!293023 m!306817))

(declare-fun m!306819 () Bool)

(assert (=> b!293024 m!306819))

(declare-fun m!306821 () Bool)

(assert (=> b!293024 m!306821))

(declare-fun m!306823 () Bool)

(assert (=> b!293024 m!306823))

(declare-fun m!306825 () Bool)

(assert (=> b!293024 m!306825))

(declare-fun m!306827 () Bool)

(assert (=> b!293020 m!306827))

(declare-fun m!306829 () Bool)

(assert (=> b!293021 m!306829))

(declare-fun m!306831 () Bool)

(assert (=> start!28666 m!306831))

(declare-fun m!306833 () Bool)

(assert (=> start!28666 m!306833))

(declare-fun m!306835 () Bool)

(assert (=> b!293022 m!306835))

(push 1)

(assert (not b!293022))

(assert (not b!293024))

(assert (not b!293021))

(assert (not start!28666))

(assert (not b!293023))

(assert (not b!293020))

(check-sat)

(pop 1)

