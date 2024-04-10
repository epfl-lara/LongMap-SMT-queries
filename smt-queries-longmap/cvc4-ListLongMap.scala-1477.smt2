; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28252 () Bool)

(assert start!28252)

(declare-fun b!289381 () Bool)

(declare-fun res!151005 () Bool)

(declare-fun e!183215 () Bool)

(assert (=> b!289381 (=> (not res!151005) (not e!183215))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14566 0))(
  ( (array!14567 (arr!6910 (Array (_ BitVec 32) (_ BitVec 64))) (size!7262 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14566)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289381 (= res!151005 (and (= (size!7262 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7262 a!3312))))))

(declare-fun b!289382 () Bool)

(declare-fun e!183218 () Bool)

(declare-fun e!183214 () Bool)

(assert (=> b!289382 (= e!183218 e!183214)))

(declare-fun res!151006 () Bool)

(assert (=> b!289382 (=> (not res!151006) (not e!183214))))

(declare-fun lt!142790 () Bool)

(assert (=> b!289382 (= res!151006 lt!142790)))

(declare-fun lt!142788 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2059 0))(
  ( (MissingZero!2059 (index!10406 (_ BitVec 32))) (Found!2059 (index!10407 (_ BitVec 32))) (Intermediate!2059 (undefined!2871 Bool) (index!10408 (_ BitVec 32)) (x!28608 (_ BitVec 32))) (Undefined!2059) (MissingVacant!2059 (index!10409 (_ BitVec 32))) )
))
(declare-fun lt!142792 () SeekEntryResult!2059)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14566 (_ BitVec 32)) SeekEntryResult!2059)

(assert (=> b!289382 (= lt!142792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142788 k!2524 (array!14567 (store (arr!6910 a!3312) i!1256 k!2524) (size!7262 a!3312)) mask!3809))))

(declare-fun lt!142791 () SeekEntryResult!2059)

(assert (=> b!289382 (= lt!142791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142788 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289382 (= lt!142788 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!151010 () Bool)

(assert (=> start!28252 (=> (not res!151010) (not e!183215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28252 (= res!151010 (validMask!0 mask!3809))))

(assert (=> start!28252 e!183215))

(assert (=> start!28252 true))

(declare-fun array_inv!4873 (array!14566) Bool)

(assert (=> start!28252 (array_inv!4873 a!3312)))

(declare-fun b!289383 () Bool)

(declare-fun res!151008 () Bool)

(assert (=> b!289383 (=> (not res!151008) (not e!183218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14566 (_ BitVec 32)) Bool)

(assert (=> b!289383 (= res!151008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289384 () Bool)

(declare-fun res!151009 () Bool)

(assert (=> b!289384 (=> (not res!151009) (not e!183215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289384 (= res!151009 (validKeyInArray!0 k!2524))))

(declare-fun b!289385 () Bool)

(assert (=> b!289385 (= e!183215 e!183218)))

(declare-fun res!151004 () Bool)

(assert (=> b!289385 (=> (not res!151004) (not e!183218))))

(declare-fun lt!142789 () SeekEntryResult!2059)

(assert (=> b!289385 (= res!151004 (or lt!142790 (= lt!142789 (MissingVacant!2059 i!1256))))))

(assert (=> b!289385 (= lt!142790 (= lt!142789 (MissingZero!2059 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14566 (_ BitVec 32)) SeekEntryResult!2059)

(assert (=> b!289385 (= lt!142789 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289386 () Bool)

(declare-fun res!151007 () Bool)

(assert (=> b!289386 (=> (not res!151007) (not e!183215))))

(declare-fun arrayContainsKey!0 (array!14566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289386 (= res!151007 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289387 () Bool)

(declare-fun e!183217 () Bool)

(assert (=> b!289387 (= e!183214 e!183217)))

(declare-fun res!151011 () Bool)

(assert (=> b!289387 (=> (not res!151011) (not e!183217))))

(declare-fun lt!142787 () Bool)

(assert (=> b!289387 (= res!151011 (and (or lt!142787 (not (undefined!2871 lt!142791))) (or lt!142787 (not (= (select (arr!6910 a!3312) (index!10408 lt!142791)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142787 (not (= (select (arr!6910 a!3312) (index!10408 lt!142791)) k!2524))) (not lt!142787)))))

(assert (=> b!289387 (= lt!142787 (not (is-Intermediate!2059 lt!142791)))))

(declare-fun b!289388 () Bool)

(assert (=> b!289388 (= e!183217 (not true))))

(assert (=> b!289388 (and (= (select (arr!6910 a!3312) (index!10408 lt!142791)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10408 lt!142791) i!1256))))

(assert (= (and start!28252 res!151010) b!289381))

(assert (= (and b!289381 res!151005) b!289384))

(assert (= (and b!289384 res!151009) b!289386))

(assert (= (and b!289386 res!151007) b!289385))

(assert (= (and b!289385 res!151004) b!289383))

(assert (= (and b!289383 res!151008) b!289382))

(assert (= (and b!289382 res!151006) b!289387))

(assert (= (and b!289387 res!151011) b!289388))

(declare-fun m!303533 () Bool)

(assert (=> start!28252 m!303533))

(declare-fun m!303535 () Bool)

(assert (=> start!28252 m!303535))

(declare-fun m!303537 () Bool)

(assert (=> b!289382 m!303537))

(declare-fun m!303539 () Bool)

(assert (=> b!289382 m!303539))

(declare-fun m!303541 () Bool)

(assert (=> b!289382 m!303541))

(declare-fun m!303543 () Bool)

(assert (=> b!289382 m!303543))

(declare-fun m!303545 () Bool)

(assert (=> b!289385 m!303545))

(declare-fun m!303547 () Bool)

(assert (=> b!289387 m!303547))

(declare-fun m!303549 () Bool)

(assert (=> b!289383 m!303549))

(declare-fun m!303551 () Bool)

(assert (=> b!289386 m!303551))

(assert (=> b!289388 m!303547))

(declare-fun m!303553 () Bool)

(assert (=> b!289384 m!303553))

(push 1)

