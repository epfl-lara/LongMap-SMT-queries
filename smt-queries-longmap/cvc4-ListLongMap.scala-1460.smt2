; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28102 () Bool)

(assert start!28102)

(declare-fun b!287943 () Bool)

(declare-fun res!149707 () Bool)

(declare-fun e!182321 () Bool)

(assert (=> b!287943 (=> (not res!149707) (not e!182321))))

(declare-datatypes ((array!14461 0))(
  ( (array!14462 (arr!6859 (Array (_ BitVec 32) (_ BitVec 64))) (size!7211 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14461)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14461 (_ BitVec 32)) Bool)

(assert (=> b!287943 (= res!149707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287944 () Bool)

(declare-fun e!182320 () Bool)

(assert (=> b!287944 (= e!182320 e!182321)))

(declare-fun res!149710 () Bool)

(assert (=> b!287944 (=> (not res!149710) (not e!182321))))

(declare-datatypes ((SeekEntryResult!2008 0))(
  ( (MissingZero!2008 (index!10202 (_ BitVec 32))) (Found!2008 (index!10203 (_ BitVec 32))) (Intermediate!2008 (undefined!2820 Bool) (index!10204 (_ BitVec 32)) (x!28415 (_ BitVec 32))) (Undefined!2008) (MissingVacant!2008 (index!10205 (_ BitVec 32))) )
))
(declare-fun lt!141778 () SeekEntryResult!2008)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287944 (= res!149710 (or (= lt!141778 (MissingZero!2008 i!1256)) (= lt!141778 (MissingVacant!2008 i!1256))))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14461 (_ BitVec 32)) SeekEntryResult!2008)

(assert (=> b!287944 (= lt!141778 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287945 () Bool)

(declare-fun res!149709 () Bool)

(assert (=> b!287945 (=> (not res!149709) (not e!182320))))

(declare-fun arrayContainsKey!0 (array!14461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287945 (= res!149709 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287946 () Bool)

(declare-fun res!149711 () Bool)

(assert (=> b!287946 (=> (not res!149711) (not e!182320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287946 (= res!149711 (validKeyInArray!0 k!2524))))

(declare-fun res!149712 () Bool)

(assert (=> start!28102 (=> (not res!149712) (not e!182320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28102 (= res!149712 (validMask!0 mask!3809))))

(assert (=> start!28102 e!182320))

(assert (=> start!28102 true))

(declare-fun array_inv!4822 (array!14461) Bool)

(assert (=> start!28102 (array_inv!4822 a!3312)))

(declare-fun b!287947 () Bool)

(declare-fun res!149708 () Bool)

(assert (=> b!287947 (=> (not res!149708) (not e!182320))))

(assert (=> b!287947 (= res!149708 (and (= (size!7211 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7211 a!3312))))))

(declare-fun b!287948 () Bool)

(assert (=> b!287948 (= e!182321 false)))

(declare-fun lt!141775 () SeekEntryResult!2008)

(declare-fun lt!141777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14461 (_ BitVec 32)) SeekEntryResult!2008)

(assert (=> b!287948 (= lt!141775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141777 k!2524 (array!14462 (store (arr!6859 a!3312) i!1256 k!2524) (size!7211 a!3312)) mask!3809))))

(declare-fun lt!141776 () SeekEntryResult!2008)

(assert (=> b!287948 (= lt!141776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141777 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287948 (= lt!141777 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28102 res!149712) b!287947))

(assert (= (and b!287947 res!149708) b!287946))

(assert (= (and b!287946 res!149711) b!287945))

(assert (= (and b!287945 res!149709) b!287944))

(assert (= (and b!287944 res!149710) b!287943))

(assert (= (and b!287943 res!149707) b!287948))

(declare-fun m!302293 () Bool)

(assert (=> start!28102 m!302293))

(declare-fun m!302295 () Bool)

(assert (=> start!28102 m!302295))

(declare-fun m!302297 () Bool)

(assert (=> b!287946 m!302297))

(declare-fun m!302299 () Bool)

(assert (=> b!287944 m!302299))

(declare-fun m!302301 () Bool)

(assert (=> b!287943 m!302301))

(declare-fun m!302303 () Bool)

(assert (=> b!287945 m!302303))

(declare-fun m!302305 () Bool)

(assert (=> b!287948 m!302305))

(declare-fun m!302307 () Bool)

(assert (=> b!287948 m!302307))

(declare-fun m!302309 () Bool)

(assert (=> b!287948 m!302309))

(declare-fun m!302311 () Bool)

(assert (=> b!287948 m!302311))

(push 1)

(assert (not b!287946))

(assert (not b!287943))

(assert (not b!287948))

