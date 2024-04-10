; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28450 () Bool)

(assert start!28450)

(declare-fun b!291361 () Bool)

(declare-fun e!184366 () Bool)

(declare-fun e!184363 () Bool)

(assert (=> b!291361 (= e!184366 e!184363)))

(declare-fun res!152700 () Bool)

(assert (=> b!291361 (=> (not res!152700) (not e!184363))))

(declare-fun lt!144138 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2134 0))(
  ( (MissingZero!2134 (index!10706 (_ BitVec 32))) (Found!2134 (index!10707 (_ BitVec 32))) (Intermediate!2134 (undefined!2946 Bool) (index!10708 (_ BitVec 32)) (x!28889 (_ BitVec 32))) (Undefined!2134) (MissingVacant!2134 (index!10709 (_ BitVec 32))) )
))
(declare-fun lt!144139 () SeekEntryResult!2134)

(assert (=> b!291361 (= res!152700 (and (not lt!144138) (= lt!144139 (MissingVacant!2134 i!1256))))))

(declare-fun lt!144135 () (_ BitVec 32))

(declare-datatypes ((array!14719 0))(
  ( (array!14720 (arr!6985 (Array (_ BitVec 32) (_ BitVec 64))) (size!7337 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14719)

(declare-fun lt!144134 () SeekEntryResult!2134)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14719 (_ BitVec 32)) SeekEntryResult!2134)

(assert (=> b!291361 (= lt!144134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144135 k!2524 (array!14720 (store (arr!6985 a!3312) i!1256 k!2524) (size!7337 a!3312)) mask!3809))))

(declare-fun lt!144137 () SeekEntryResult!2134)

(assert (=> b!291361 (= lt!144137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144135 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291361 (= lt!144135 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!152706 () Bool)

(declare-fun e!184367 () Bool)

(assert (=> start!28450 (=> (not res!152706) (not e!184367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28450 (= res!152706 (validMask!0 mask!3809))))

(assert (=> start!28450 e!184367))

(assert (=> start!28450 true))

(declare-fun array_inv!4948 (array!14719) Bool)

(assert (=> start!28450 (array_inv!4948 a!3312)))

(declare-fun b!291362 () Bool)

(declare-fun res!152703 () Bool)

(assert (=> b!291362 (=> (not res!152703) (not e!184367))))

(assert (=> b!291362 (= res!152703 (and (= (size!7337 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7337 a!3312))))))

(declare-fun b!291363 () Bool)

(declare-fun e!184365 () Bool)

(assert (=> b!291363 (= e!184363 e!184365)))

(declare-fun res!152702 () Bool)

(assert (=> b!291363 (=> (not res!152702) (not e!184365))))

(declare-fun lt!144136 () Bool)

(assert (=> b!291363 (= res!152702 (and (or lt!144136 (not (undefined!2946 lt!144137))) (not lt!144136) (= (select (arr!6985 a!3312) (index!10708 lt!144137)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291363 (= lt!144136 (not (is-Intermediate!2134 lt!144137)))))

(declare-fun b!291364 () Bool)

(declare-fun res!152699 () Bool)

(assert (=> b!291364 (=> (not res!152699) (not e!184367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291364 (= res!152699 (validKeyInArray!0 k!2524))))

(declare-fun b!291365 () Bool)

(assert (=> b!291365 (= e!184367 e!184366)))

(declare-fun res!152701 () Bool)

(assert (=> b!291365 (=> (not res!152701) (not e!184366))))

(assert (=> b!291365 (= res!152701 (or lt!144138 (= lt!144139 (MissingVacant!2134 i!1256))))))

(assert (=> b!291365 (= lt!144138 (= lt!144139 (MissingZero!2134 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14719 (_ BitVec 32)) SeekEntryResult!2134)

(assert (=> b!291365 (= lt!144139 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291366 () Bool)

(declare-fun res!152704 () Bool)

(assert (=> b!291366 (=> (not res!152704) (not e!184367))))

(declare-fun arrayContainsKey!0 (array!14719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291366 (= res!152704 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291367 () Bool)

(declare-fun res!152705 () Bool)

(assert (=> b!291367 (=> (not res!152705) (not e!184366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14719 (_ BitVec 32)) Bool)

(assert (=> b!291367 (= res!152705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291368 () Bool)

(assert (=> b!291368 (= e!184365 (not true))))

(assert (=> b!291368 (= (index!10708 lt!144137) i!1256)))

(assert (= (and start!28450 res!152706) b!291362))

(assert (= (and b!291362 res!152703) b!291364))

(assert (= (and b!291364 res!152699) b!291366))

(assert (= (and b!291366 res!152704) b!291365))

(assert (= (and b!291365 res!152701) b!291367))

(assert (= (and b!291367 res!152705) b!291361))

(assert (= (and b!291361 res!152700) b!291363))

(assert (= (and b!291363 res!152702) b!291368))

(declare-fun m!305303 () Bool)

(assert (=> b!291365 m!305303))

(declare-fun m!305305 () Bool)

(assert (=> b!291361 m!305305))

(declare-fun m!305307 () Bool)

(assert (=> b!291361 m!305307))

(declare-fun m!305309 () Bool)

(assert (=> b!291361 m!305309))

(declare-fun m!305311 () Bool)

(assert (=> b!291361 m!305311))

(declare-fun m!305313 () Bool)

(assert (=> b!291367 m!305313))

(declare-fun m!305315 () Bool)

(assert (=> b!291364 m!305315))

(declare-fun m!305317 () Bool)

(assert (=> start!28450 m!305317))

(declare-fun m!305319 () Bool)

(assert (=> start!28450 m!305319))

(declare-fun m!305321 () Bool)

(assert (=> b!291363 m!305321))

(declare-fun m!305323 () Bool)

(assert (=> b!291366 m!305323))

(push 1)

