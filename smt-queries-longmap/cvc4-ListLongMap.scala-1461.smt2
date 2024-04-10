; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28108 () Bool)

(assert start!28108)

(declare-fun b!288013 () Bool)

(declare-fun e!182364 () Bool)

(declare-fun e!182363 () Bool)

(assert (=> b!288013 (= e!182364 e!182363)))

(declare-fun res!149784 () Bool)

(assert (=> b!288013 (=> (not res!149784) (not e!182363))))

(declare-fun lt!141830 () Bool)

(assert (=> b!288013 (= res!149784 lt!141830)))

(declare-fun lt!141832 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2011 0))(
  ( (MissingZero!2011 (index!10214 (_ BitVec 32))) (Found!2011 (index!10215 (_ BitVec 32))) (Intermediate!2011 (undefined!2823 Bool) (index!10216 (_ BitVec 32)) (x!28426 (_ BitVec 32))) (Undefined!2011) (MissingVacant!2011 (index!10217 (_ BitVec 32))) )
))
(declare-fun lt!141827 () SeekEntryResult!2011)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14467 0))(
  ( (array!14468 (arr!6862 (Array (_ BitVec 32) (_ BitVec 64))) (size!7214 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14467)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14467 (_ BitVec 32)) SeekEntryResult!2011)

(assert (=> b!288013 (= lt!141827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141832 k!2524 (array!14468 (store (arr!6862 a!3312) i!1256 k!2524) (size!7214 a!3312)) mask!3809))))

(declare-fun lt!141828 () SeekEntryResult!2011)

(assert (=> b!288013 (= lt!141828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141832 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288013 (= lt!141832 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288014 () Bool)

(declare-fun res!149781 () Bool)

(declare-fun e!182362 () Bool)

(assert (=> b!288014 (=> (not res!149781) (not e!182362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288014 (= res!149781 (validKeyInArray!0 k!2524))))

(declare-fun b!288015 () Bool)

(declare-fun res!149780 () Bool)

(assert (=> b!288015 (=> (not res!149780) (not e!182362))))

(assert (=> b!288015 (= res!149780 (and (= (size!7214 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7214 a!3312))))))

(declare-fun b!288016 () Bool)

(declare-fun e!182366 () Bool)

(assert (=> b!288016 (= e!182363 e!182366)))

(declare-fun res!149782 () Bool)

(assert (=> b!288016 (=> (not res!149782) (not e!182366))))

(declare-fun lt!141829 () Bool)

(assert (=> b!288016 (= res!149782 (and (or lt!141829 (not (undefined!2823 lt!141828))) (or lt!141829 (not (= (select (arr!6862 a!3312) (index!10216 lt!141828)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141829 (not (= (select (arr!6862 a!3312) (index!10216 lt!141828)) k!2524))) (not lt!141829)))))

(assert (=> b!288016 (= lt!141829 (not (is-Intermediate!2011 lt!141828)))))

(declare-fun b!288017 () Bool)

(assert (=> b!288017 (= e!182366 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(assert (=> b!288017 (and (= (select (arr!6862 a!3312) (index!10216 lt!141828)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10216 lt!141828) i!1256))))

(declare-fun res!149783 () Bool)

(assert (=> start!28108 (=> (not res!149783) (not e!182362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28108 (= res!149783 (validMask!0 mask!3809))))

(assert (=> start!28108 e!182362))

(assert (=> start!28108 true))

(declare-fun array_inv!4825 (array!14467) Bool)

(assert (=> start!28108 (array_inv!4825 a!3312)))

(declare-fun b!288018 () Bool)

(declare-fun res!149777 () Bool)

(assert (=> b!288018 (=> (not res!149777) (not e!182362))))

(declare-fun arrayContainsKey!0 (array!14467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288018 (= res!149777 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288019 () Bool)

(declare-fun res!149779 () Bool)

(assert (=> b!288019 (=> (not res!149779) (not e!182364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14467 (_ BitVec 32)) Bool)

(assert (=> b!288019 (= res!149779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288020 () Bool)

(assert (=> b!288020 (= e!182362 e!182364)))

(declare-fun res!149778 () Bool)

(assert (=> b!288020 (=> (not res!149778) (not e!182364))))

(declare-fun lt!141831 () SeekEntryResult!2011)

(assert (=> b!288020 (= res!149778 (or lt!141830 (= lt!141831 (MissingVacant!2011 i!1256))))))

(assert (=> b!288020 (= lt!141830 (= lt!141831 (MissingZero!2011 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14467 (_ BitVec 32)) SeekEntryResult!2011)

(assert (=> b!288020 (= lt!141831 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28108 res!149783) b!288015))

(assert (= (and b!288015 res!149780) b!288014))

(assert (= (and b!288014 res!149781) b!288018))

(assert (= (and b!288018 res!149777) b!288020))

(assert (= (and b!288020 res!149778) b!288019))

(assert (= (and b!288019 res!149779) b!288013))

(assert (= (and b!288013 res!149784) b!288016))

(assert (= (and b!288016 res!149782) b!288017))

(declare-fun m!302357 () Bool)

(assert (=> b!288020 m!302357))

(declare-fun m!302359 () Bool)

(assert (=> b!288018 m!302359))

(declare-fun m!302361 () Bool)

(assert (=> start!28108 m!302361))

(declare-fun m!302363 () Bool)

(assert (=> start!28108 m!302363))

(declare-fun m!302365 () Bool)

(assert (=> b!288016 m!302365))

(declare-fun m!302367 () Bool)

(assert (=> b!288014 m!302367))

(declare-fun m!302369 () Bool)

(assert (=> b!288019 m!302369))

(declare-fun m!302371 () Bool)

(assert (=> b!288013 m!302371))

(declare-fun m!302373 () Bool)

(assert (=> b!288013 m!302373))

(declare-fun m!302375 () Bool)

(assert (=> b!288013 m!302375))

(declare-fun m!302377 () Bool)

(assert (=> b!288013 m!302377))

(assert (=> b!288017 m!302365))

(push 1)

(assert (not b!288019))

(assert (not b!288013))

(assert (not b!288020))

(assert (not b!288018))

(assert (not b!288014))

(assert (not start!28108))

(check-sat)

(pop 1)

