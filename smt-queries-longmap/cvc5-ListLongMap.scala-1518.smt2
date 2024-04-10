; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28638 () Bool)

(assert start!28638)

(declare-fun b!292767 () Bool)

(declare-fun e!185188 () Bool)

(declare-fun e!185187 () Bool)

(assert (=> b!292767 (= e!185188 e!185187)))

(declare-fun res!153827 () Bool)

(assert (=> b!292767 (=> (not res!153827) (not e!185187))))

(declare-datatypes ((SeekEntryResult!2180 0))(
  ( (MissingZero!2180 (index!10890 (_ BitVec 32))) (Found!2180 (index!10891 (_ BitVec 32))) (Intermediate!2180 (undefined!2992 Bool) (index!10892 (_ BitVec 32)) (x!29075 (_ BitVec 32))) (Undefined!2180) (MissingVacant!2180 (index!10893 (_ BitVec 32))) )
))
(declare-fun lt!145060 () SeekEntryResult!2180)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292767 (= res!153827 (or (= lt!145060 (MissingZero!2180 i!1256)) (= lt!145060 (MissingVacant!2180 i!1256))))))

(declare-datatypes ((array!14817 0))(
  ( (array!14818 (arr!7031 (Array (_ BitVec 32) (_ BitVec 64))) (size!7383 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14817)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14817 (_ BitVec 32)) SeekEntryResult!2180)

(assert (=> b!292767 (= lt!145060 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292768 () Bool)

(declare-fun res!153824 () Bool)

(assert (=> b!292768 (=> (not res!153824) (not e!185188))))

(assert (=> b!292768 (= res!153824 (and (= (size!7383 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7383 a!3312))))))

(declare-fun b!292769 () Bool)

(assert (=> b!292769 (= e!185187 false)))

(declare-fun lt!145062 () (_ BitVec 32))

(declare-fun lt!145061 () SeekEntryResult!2180)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14817 (_ BitVec 32)) SeekEntryResult!2180)

(assert (=> b!292769 (= lt!145061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145062 k!2524 (array!14818 (store (arr!7031 a!3312) i!1256 k!2524) (size!7383 a!3312)) mask!3809))))

(declare-fun lt!145063 () SeekEntryResult!2180)

(assert (=> b!292769 (= lt!145063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145062 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292769 (= lt!145062 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292770 () Bool)

(declare-fun res!153825 () Bool)

(assert (=> b!292770 (=> (not res!153825) (not e!185187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14817 (_ BitVec 32)) Bool)

(assert (=> b!292770 (= res!153825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153828 () Bool)

(assert (=> start!28638 (=> (not res!153828) (not e!185188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28638 (= res!153828 (validMask!0 mask!3809))))

(assert (=> start!28638 e!185188))

(assert (=> start!28638 true))

(declare-fun array_inv!4994 (array!14817) Bool)

(assert (=> start!28638 (array_inv!4994 a!3312)))

(declare-fun b!292771 () Bool)

(declare-fun res!153826 () Bool)

(assert (=> b!292771 (=> (not res!153826) (not e!185188))))

(declare-fun arrayContainsKey!0 (array!14817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292771 (= res!153826 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292772 () Bool)

(declare-fun res!153823 () Bool)

(assert (=> b!292772 (=> (not res!153823) (not e!185188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292772 (= res!153823 (validKeyInArray!0 k!2524))))

(assert (= (and start!28638 res!153828) b!292768))

(assert (= (and b!292768 res!153824) b!292772))

(assert (= (and b!292772 res!153823) b!292771))

(assert (= (and b!292771 res!153826) b!292767))

(assert (= (and b!292767 res!153827) b!292770))

(assert (= (and b!292770 res!153825) b!292769))

(declare-fun m!306537 () Bool)

(assert (=> b!292769 m!306537))

(declare-fun m!306539 () Bool)

(assert (=> b!292769 m!306539))

(declare-fun m!306541 () Bool)

(assert (=> b!292769 m!306541))

(declare-fun m!306543 () Bool)

(assert (=> b!292769 m!306543))

(declare-fun m!306545 () Bool)

(assert (=> start!28638 m!306545))

(declare-fun m!306547 () Bool)

(assert (=> start!28638 m!306547))

(declare-fun m!306549 () Bool)

(assert (=> b!292767 m!306549))

(declare-fun m!306551 () Bool)

(assert (=> b!292770 m!306551))

(declare-fun m!306553 () Bool)

(assert (=> b!292772 m!306553))

(declare-fun m!306555 () Bool)

(assert (=> b!292771 m!306555))

(push 1)

