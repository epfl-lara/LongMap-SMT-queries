; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27868 () Bool)

(assert start!27868)

(declare-fun b!286593 () Bool)

(declare-fun res!148673 () Bool)

(declare-fun e!181581 () Bool)

(assert (=> b!286593 (=> (not res!148673) (not e!181581))))

(declare-datatypes ((array!14356 0))(
  ( (array!14357 (arr!6811 (Array (_ BitVec 32) (_ BitVec 64))) (size!7163 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14356)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286593 (= res!148673 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148674 () Bool)

(assert (=> start!27868 (=> (not res!148674) (not e!181581))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27868 (= res!148674 (validMask!0 mask!3809))))

(assert (=> start!27868 e!181581))

(assert (=> start!27868 true))

(declare-fun array_inv!4774 (array!14356) Bool)

(assert (=> start!27868 (array_inv!4774 a!3312)))

(declare-fun b!286594 () Bool)

(declare-fun e!181582 () Bool)

(assert (=> b!286594 (= e!181582 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141157 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286594 (= lt!141157 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!286595 () Bool)

(declare-fun res!148675 () Bool)

(assert (=> b!286595 (=> (not res!148675) (not e!181582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14356 (_ BitVec 32)) Bool)

(assert (=> b!286595 (= res!148675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286596 () Bool)

(declare-fun res!148672 () Bool)

(assert (=> b!286596 (=> (not res!148672) (not e!181581))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286596 (= res!148672 (and (= (size!7163 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7163 a!3312))))))

(declare-fun b!286597 () Bool)

(declare-fun res!148677 () Bool)

(assert (=> b!286597 (=> (not res!148677) (not e!181581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286597 (= res!148677 (validKeyInArray!0 k!2524))))

(declare-fun b!286598 () Bool)

(assert (=> b!286598 (= e!181581 e!181582)))

(declare-fun res!148676 () Bool)

(assert (=> b!286598 (=> (not res!148676) (not e!181582))))

(declare-datatypes ((SeekEntryResult!1960 0))(
  ( (MissingZero!1960 (index!10010 (_ BitVec 32))) (Found!1960 (index!10011 (_ BitVec 32))) (Intermediate!1960 (undefined!2772 Bool) (index!10012 (_ BitVec 32)) (x!28224 (_ BitVec 32))) (Undefined!1960) (MissingVacant!1960 (index!10013 (_ BitVec 32))) )
))
(declare-fun lt!141156 () SeekEntryResult!1960)

(assert (=> b!286598 (= res!148676 (or (= lt!141156 (MissingZero!1960 i!1256)) (= lt!141156 (MissingVacant!1960 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14356 (_ BitVec 32)) SeekEntryResult!1960)

(assert (=> b!286598 (= lt!141156 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!27868 res!148674) b!286596))

(assert (= (and b!286596 res!148672) b!286597))

(assert (= (and b!286597 res!148677) b!286593))

(assert (= (and b!286593 res!148673) b!286598))

(assert (= (and b!286598 res!148676) b!286595))

(assert (= (and b!286595 res!148675) b!286594))

(declare-fun m!301231 () Bool)

(assert (=> b!286598 m!301231))

(declare-fun m!301233 () Bool)

(assert (=> b!286597 m!301233))

(declare-fun m!301235 () Bool)

(assert (=> start!27868 m!301235))

(declare-fun m!301237 () Bool)

(assert (=> start!27868 m!301237))

(declare-fun m!301239 () Bool)

(assert (=> b!286593 m!301239))

(declare-fun m!301241 () Bool)

(assert (=> b!286595 m!301241))

(declare-fun m!301243 () Bool)

(assert (=> b!286594 m!301243))

(push 1)

(assert (not b!286598))

(assert (not b!286597))

(assert (not b!286595))

(assert (not b!286594))

(assert (not start!27868))

(assert (not b!286593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

