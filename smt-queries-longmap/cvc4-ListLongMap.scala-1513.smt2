; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28612 () Bool)

(assert start!28612)

(declare-fun res!153589 () Bool)

(declare-fun e!185072 () Bool)

(assert (=> start!28612 (=> (not res!153589) (not e!185072))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28612 (= res!153589 (validMask!0 mask!3809))))

(assert (=> start!28612 e!185072))

(assert (=> start!28612 true))

(declare-datatypes ((array!14791 0))(
  ( (array!14792 (arr!7018 (Array (_ BitVec 32) (_ BitVec 64))) (size!7370 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14791)

(declare-fun array_inv!4981 (array!14791) Bool)

(assert (=> start!28612 (array_inv!4981 a!3312)))

(declare-fun b!292533 () Bool)

(declare-fun res!153594 () Bool)

(declare-fun e!185070 () Bool)

(assert (=> b!292533 (=> (not res!153594) (not e!185070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14791 (_ BitVec 32)) Bool)

(assert (=> b!292533 (= res!153594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292534 () Bool)

(assert (=> b!292534 (= e!185072 e!185070)))

(declare-fun res!153592 () Bool)

(assert (=> b!292534 (=> (not res!153592) (not e!185070))))

(declare-datatypes ((SeekEntryResult!2167 0))(
  ( (MissingZero!2167 (index!10838 (_ BitVec 32))) (Found!2167 (index!10839 (_ BitVec 32))) (Intermediate!2167 (undefined!2979 Bool) (index!10840 (_ BitVec 32)) (x!29022 (_ BitVec 32))) (Undefined!2167) (MissingVacant!2167 (index!10841 (_ BitVec 32))) )
))
(declare-fun lt!144906 () SeekEntryResult!2167)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292534 (= res!153592 (or (= lt!144906 (MissingZero!2167 i!1256)) (= lt!144906 (MissingVacant!2167 i!1256))))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14791 (_ BitVec 32)) SeekEntryResult!2167)

(assert (=> b!292534 (= lt!144906 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292535 () Bool)

(declare-fun res!153590 () Bool)

(assert (=> b!292535 (=> (not res!153590) (not e!185072))))

(assert (=> b!292535 (= res!153590 (and (= (size!7370 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7370 a!3312))))))

(declare-fun b!292536 () Bool)

(assert (=> b!292536 (= e!185070 false)))

(declare-fun lt!144907 () (_ BitVec 32))

(declare-fun lt!144905 () SeekEntryResult!2167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14791 (_ BitVec 32)) SeekEntryResult!2167)

(assert (=> b!292536 (= lt!144905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144907 k!2524 (array!14792 (store (arr!7018 a!3312) i!1256 k!2524) (size!7370 a!3312)) mask!3809))))

(declare-fun lt!144904 () SeekEntryResult!2167)

(assert (=> b!292536 (= lt!144904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144907 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292536 (= lt!144907 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292537 () Bool)

(declare-fun res!153591 () Bool)

(assert (=> b!292537 (=> (not res!153591) (not e!185072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292537 (= res!153591 (validKeyInArray!0 k!2524))))

(declare-fun b!292538 () Bool)

(declare-fun res!153593 () Bool)

(assert (=> b!292538 (=> (not res!153593) (not e!185072))))

(declare-fun arrayContainsKey!0 (array!14791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292538 (= res!153593 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28612 res!153589) b!292535))

(assert (= (and b!292535 res!153590) b!292537))

(assert (= (and b!292537 res!153591) b!292538))

(assert (= (and b!292538 res!153593) b!292534))

(assert (= (and b!292534 res!153592) b!292533))

(assert (= (and b!292533 res!153594) b!292536))

(declare-fun m!306277 () Bool)

(assert (=> b!292536 m!306277))

(declare-fun m!306279 () Bool)

(assert (=> b!292536 m!306279))

(declare-fun m!306281 () Bool)

(assert (=> b!292536 m!306281))

(declare-fun m!306283 () Bool)

(assert (=> b!292536 m!306283))

(declare-fun m!306285 () Bool)

(assert (=> b!292533 m!306285))

(declare-fun m!306287 () Bool)

(assert (=> b!292534 m!306287))

(declare-fun m!306289 () Bool)

(assert (=> start!28612 m!306289))

(declare-fun m!306291 () Bool)

(assert (=> start!28612 m!306291))

(declare-fun m!306293 () Bool)

(assert (=> b!292538 m!306293))

(declare-fun m!306295 () Bool)

(assert (=> b!292537 m!306295))

(push 1)

(assert (not start!28612))

(assert (not b!292538))

(assert (not b!292536))

(assert (not b!292533))

