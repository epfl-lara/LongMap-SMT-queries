; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28098 () Bool)

(assert start!28098)

(declare-fun res!149673 () Bool)

(declare-fun e!182303 () Bool)

(assert (=> start!28098 (=> (not res!149673) (not e!182303))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28098 (= res!149673 (validMask!0 mask!3809))))

(assert (=> start!28098 e!182303))

(assert (=> start!28098 true))

(declare-datatypes ((array!14457 0))(
  ( (array!14458 (arr!6857 (Array (_ BitVec 32) (_ BitVec 64))) (size!7209 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14457)

(declare-fun array_inv!4820 (array!14457) Bool)

(assert (=> start!28098 (array_inv!4820 a!3312)))

(declare-fun b!287907 () Bool)

(declare-fun e!182302 () Bool)

(assert (=> b!287907 (= e!182303 e!182302)))

(declare-fun res!149675 () Bool)

(assert (=> b!287907 (=> (not res!149675) (not e!182302))))

(declare-datatypes ((SeekEntryResult!2006 0))(
  ( (MissingZero!2006 (index!10194 (_ BitVec 32))) (Found!2006 (index!10195 (_ BitVec 32))) (Intermediate!2006 (undefined!2818 Bool) (index!10196 (_ BitVec 32)) (x!28413 (_ BitVec 32))) (Undefined!2006) (MissingVacant!2006 (index!10197 (_ BitVec 32))) )
))
(declare-fun lt!141751 () SeekEntryResult!2006)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287907 (= res!149675 (or (= lt!141751 (MissingZero!2006 i!1256)) (= lt!141751 (MissingVacant!2006 i!1256))))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14457 (_ BitVec 32)) SeekEntryResult!2006)

(assert (=> b!287907 (= lt!141751 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287908 () Bool)

(declare-fun res!149676 () Bool)

(assert (=> b!287908 (=> (not res!149676) (not e!182303))))

(declare-fun arrayContainsKey!0 (array!14457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287908 (= res!149676 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287909 () Bool)

(declare-fun res!149674 () Bool)

(assert (=> b!287909 (=> (not res!149674) (not e!182302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14457 (_ BitVec 32)) Bool)

(assert (=> b!287909 (= res!149674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287910 () Bool)

(declare-fun res!149671 () Bool)

(assert (=> b!287910 (=> (not res!149671) (not e!182303))))

(assert (=> b!287910 (= res!149671 (and (= (size!7209 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7209 a!3312))))))

(declare-fun b!287911 () Bool)

(assert (=> b!287911 (= e!182302 false)))

(declare-fun lt!141753 () (_ BitVec 32))

(declare-fun lt!141754 () SeekEntryResult!2006)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14457 (_ BitVec 32)) SeekEntryResult!2006)

(assert (=> b!287911 (= lt!141754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141753 k!2524 (array!14458 (store (arr!6857 a!3312) i!1256 k!2524) (size!7209 a!3312)) mask!3809))))

(declare-fun lt!141752 () SeekEntryResult!2006)

(assert (=> b!287911 (= lt!141752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141753 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287911 (= lt!141753 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!287912 () Bool)

(declare-fun res!149672 () Bool)

(assert (=> b!287912 (=> (not res!149672) (not e!182303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287912 (= res!149672 (validKeyInArray!0 k!2524))))

(assert (= (and start!28098 res!149673) b!287910))

(assert (= (and b!287910 res!149671) b!287912))

(assert (= (and b!287912 res!149672) b!287908))

(assert (= (and b!287908 res!149676) b!287907))

(assert (= (and b!287907 res!149675) b!287909))

(assert (= (and b!287909 res!149674) b!287911))

(declare-fun m!302253 () Bool)

(assert (=> b!287907 m!302253))

(declare-fun m!302255 () Bool)

(assert (=> b!287912 m!302255))

(declare-fun m!302257 () Bool)

(assert (=> b!287909 m!302257))

(declare-fun m!302259 () Bool)

(assert (=> b!287911 m!302259))

(declare-fun m!302261 () Bool)

(assert (=> b!287911 m!302261))

(declare-fun m!302263 () Bool)

(assert (=> b!287911 m!302263))

(declare-fun m!302265 () Bool)

(assert (=> b!287911 m!302265))

(declare-fun m!302267 () Bool)

(assert (=> b!287908 m!302267))

(declare-fun m!302269 () Bool)

(assert (=> start!28098 m!302269))

(declare-fun m!302271 () Bool)

(assert (=> start!28098 m!302271))

(push 1)

