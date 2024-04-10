; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28446 () Bool)

(assert start!28446)

(declare-fun b!291313 () Bool)

(declare-fun e!184336 () Bool)

(declare-fun e!184335 () Bool)

(assert (=> b!291313 (= e!184336 e!184335)))

(declare-fun res!152654 () Bool)

(assert (=> b!291313 (=> (not res!152654) (not e!184335))))

(declare-datatypes ((array!14715 0))(
  ( (array!14716 (arr!6983 (Array (_ BitVec 32) (_ BitVec 64))) (size!7335 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14715)

(declare-datatypes ((SeekEntryResult!2132 0))(
  ( (MissingZero!2132 (index!10698 (_ BitVec 32))) (Found!2132 (index!10699 (_ BitVec 32))) (Intermediate!2132 (undefined!2944 Bool) (index!10700 (_ BitVec 32)) (x!28887 (_ BitVec 32))) (Undefined!2132) (MissingVacant!2132 (index!10701 (_ BitVec 32))) )
))
(declare-fun lt!144102 () SeekEntryResult!2132)

(declare-fun lt!144101 () Bool)

(assert (=> b!291313 (= res!152654 (and (or lt!144101 (not (undefined!2944 lt!144102))) (not lt!144101) (= (select (arr!6983 a!3312) (index!10700 lt!144102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291313 (= lt!144101 (not (is-Intermediate!2132 lt!144102)))))

(declare-fun b!291314 () Bool)

(declare-fun e!184337 () Bool)

(declare-fun e!184333 () Bool)

(assert (=> b!291314 (= e!184337 e!184333)))

(declare-fun res!152657 () Bool)

(assert (=> b!291314 (=> (not res!152657) (not e!184333))))

(declare-fun lt!144100 () SeekEntryResult!2132)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144098 () Bool)

(assert (=> b!291314 (= res!152657 (or lt!144098 (= lt!144100 (MissingVacant!2132 i!1256))))))

(assert (=> b!291314 (= lt!144098 (= lt!144100 (MissingZero!2132 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14715 (_ BitVec 32)) SeekEntryResult!2132)

(assert (=> b!291314 (= lt!144100 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!152653 () Bool)

(assert (=> start!28446 (=> (not res!152653) (not e!184337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28446 (= res!152653 (validMask!0 mask!3809))))

(assert (=> start!28446 e!184337))

(assert (=> start!28446 true))

(declare-fun array_inv!4946 (array!14715) Bool)

(assert (=> start!28446 (array_inv!4946 a!3312)))

(declare-fun b!291315 () Bool)

(declare-fun res!152656 () Bool)

(assert (=> b!291315 (=> (not res!152656) (not e!184337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291315 (= res!152656 (validKeyInArray!0 k!2524))))

(declare-fun b!291316 () Bool)

(declare-fun res!152655 () Bool)

(assert (=> b!291316 (=> (not res!152655) (not e!184337))))

(assert (=> b!291316 (= res!152655 (and (= (size!7335 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7335 a!3312))))))

(declare-fun b!291317 () Bool)

(assert (=> b!291317 (= e!184333 e!184336)))

(declare-fun res!152652 () Bool)

(assert (=> b!291317 (=> (not res!152652) (not e!184336))))

(assert (=> b!291317 (= res!152652 (and (not lt!144098) (= lt!144100 (MissingVacant!2132 i!1256))))))

(declare-fun lt!144103 () SeekEntryResult!2132)

(declare-fun lt!144099 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14715 (_ BitVec 32)) SeekEntryResult!2132)

(assert (=> b!291317 (= lt!144103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144099 k!2524 (array!14716 (store (arr!6983 a!3312) i!1256 k!2524) (size!7335 a!3312)) mask!3809))))

(assert (=> b!291317 (= lt!144102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144099 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291317 (= lt!144099 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291318 () Bool)

(assert (=> b!291318 (= e!184335 (not true))))

(assert (=> b!291318 (= (index!10700 lt!144102) i!1256)))

(declare-fun b!291319 () Bool)

(declare-fun res!152658 () Bool)

(assert (=> b!291319 (=> (not res!152658) (not e!184337))))

(declare-fun arrayContainsKey!0 (array!14715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291319 (= res!152658 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291320 () Bool)

(declare-fun res!152651 () Bool)

(assert (=> b!291320 (=> (not res!152651) (not e!184333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14715 (_ BitVec 32)) Bool)

(assert (=> b!291320 (= res!152651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28446 res!152653) b!291316))

(assert (= (and b!291316 res!152655) b!291315))

(assert (= (and b!291315 res!152656) b!291319))

(assert (= (and b!291319 res!152658) b!291314))

(assert (= (and b!291314 res!152657) b!291320))

(assert (= (and b!291320 res!152651) b!291317))

(assert (= (and b!291317 res!152652) b!291313))

(assert (= (and b!291313 res!152654) b!291318))

(declare-fun m!305259 () Bool)

(assert (=> b!291315 m!305259))

(declare-fun m!305261 () Bool)

(assert (=> b!291320 m!305261))

(declare-fun m!305263 () Bool)

(assert (=> b!291313 m!305263))

(declare-fun m!305265 () Bool)

(assert (=> b!291317 m!305265))

(declare-fun m!305267 () Bool)

(assert (=> b!291317 m!305267))

(declare-fun m!305269 () Bool)

(assert (=> b!291317 m!305269))

(declare-fun m!305271 () Bool)

(assert (=> b!291317 m!305271))

(declare-fun m!305273 () Bool)

(assert (=> start!28446 m!305273))

(declare-fun m!305275 () Bool)

(assert (=> start!28446 m!305275))

(declare-fun m!305277 () Bool)

(assert (=> b!291319 m!305277))

(declare-fun m!305279 () Bool)

(assert (=> b!291314 m!305279))

(push 1)

