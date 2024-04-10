; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28248 () Bool)

(assert start!28248)

(declare-fun b!289333 () Bool)

(declare-fun e!183188 () Bool)

(declare-fun e!183187 () Bool)

(assert (=> b!289333 (= e!183188 e!183187)))

(declare-fun res!150962 () Bool)

(assert (=> b!289333 (=> (not res!150962) (not e!183187))))

(declare-datatypes ((SeekEntryResult!2057 0))(
  ( (MissingZero!2057 (index!10398 (_ BitVec 32))) (Found!2057 (index!10399 (_ BitVec 32))) (Intermediate!2057 (undefined!2869 Bool) (index!10400 (_ BitVec 32)) (x!28606 (_ BitVec 32))) (Undefined!2057) (MissingVacant!2057 (index!10401 (_ BitVec 32))) )
))
(declare-fun lt!142752 () SeekEntryResult!2057)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142753 () Bool)

(assert (=> b!289333 (= res!150962 (or lt!142753 (= lt!142752 (MissingVacant!2057 i!1256))))))

(assert (=> b!289333 (= lt!142753 (= lt!142752 (MissingZero!2057 i!1256)))))

(declare-datatypes ((array!14562 0))(
  ( (array!14563 (arr!6908 (Array (_ BitVec 32) (_ BitVec 64))) (size!7260 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14562)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14562 (_ BitVec 32)) SeekEntryResult!2057)

(assert (=> b!289333 (= lt!142752 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289334 () Bool)

(declare-fun res!150958 () Bool)

(assert (=> b!289334 (=> (not res!150958) (not e!183187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14562 (_ BitVec 32)) Bool)

(assert (=> b!289334 (= res!150958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150961 () Bool)

(assert (=> start!28248 (=> (not res!150961) (not e!183188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28248 (= res!150961 (validMask!0 mask!3809))))

(assert (=> start!28248 e!183188))

(assert (=> start!28248 true))

(declare-fun array_inv!4871 (array!14562) Bool)

(assert (=> start!28248 (array_inv!4871 a!3312)))

(declare-fun b!289335 () Bool)

(declare-fun e!183185 () Bool)

(assert (=> b!289335 (= e!183185 (not true))))

(declare-fun lt!142751 () SeekEntryResult!2057)

(assert (=> b!289335 (and (= (select (arr!6908 a!3312) (index!10400 lt!142751)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10400 lt!142751) i!1256))))

(declare-fun b!289336 () Bool)

(declare-fun res!150960 () Bool)

(assert (=> b!289336 (=> (not res!150960) (not e!183188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289336 (= res!150960 (validKeyInArray!0 k!2524))))

(declare-fun b!289337 () Bool)

(declare-fun res!150957 () Bool)

(assert (=> b!289337 (=> (not res!150957) (not e!183188))))

(assert (=> b!289337 (= res!150957 (and (= (size!7260 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7260 a!3312))))))

(declare-fun b!289338 () Bool)

(declare-fun res!150956 () Bool)

(assert (=> b!289338 (=> (not res!150956) (not e!183188))))

(declare-fun arrayContainsKey!0 (array!14562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289338 (= res!150956 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289339 () Bool)

(declare-fun e!183184 () Bool)

(assert (=> b!289339 (= e!183187 e!183184)))

(declare-fun res!150963 () Bool)

(assert (=> b!289339 (=> (not res!150963) (not e!183184))))

(assert (=> b!289339 (= res!150963 lt!142753)))

(declare-fun lt!142756 () (_ BitVec 32))

(declare-fun lt!142755 () SeekEntryResult!2057)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14562 (_ BitVec 32)) SeekEntryResult!2057)

(assert (=> b!289339 (= lt!142755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142756 k!2524 (array!14563 (store (arr!6908 a!3312) i!1256 k!2524) (size!7260 a!3312)) mask!3809))))

(assert (=> b!289339 (= lt!142751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142756 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289339 (= lt!142756 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289340 () Bool)

(assert (=> b!289340 (= e!183184 e!183185)))

(declare-fun res!150959 () Bool)

(assert (=> b!289340 (=> (not res!150959) (not e!183185))))

(declare-fun lt!142754 () Bool)

(assert (=> b!289340 (= res!150959 (and (or lt!142754 (not (undefined!2869 lt!142751))) (or lt!142754 (not (= (select (arr!6908 a!3312) (index!10400 lt!142751)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142754 (not (= (select (arr!6908 a!3312) (index!10400 lt!142751)) k!2524))) (not lt!142754)))))

(assert (=> b!289340 (= lt!142754 (not (is-Intermediate!2057 lt!142751)))))

(assert (= (and start!28248 res!150961) b!289337))

(assert (= (and b!289337 res!150957) b!289336))

(assert (= (and b!289336 res!150960) b!289338))

(assert (= (and b!289338 res!150956) b!289333))

(assert (= (and b!289333 res!150962) b!289334))

(assert (= (and b!289334 res!150958) b!289339))

(assert (= (and b!289339 res!150963) b!289340))

(assert (= (and b!289340 res!150959) b!289335))

(declare-fun m!303489 () Bool)

(assert (=> b!289339 m!303489))

(declare-fun m!303491 () Bool)

(assert (=> b!289339 m!303491))

(declare-fun m!303493 () Bool)

(assert (=> b!289339 m!303493))

(declare-fun m!303495 () Bool)

(assert (=> b!289339 m!303495))

(declare-fun m!303497 () Bool)

(assert (=> b!289335 m!303497))

(assert (=> b!289340 m!303497))

(declare-fun m!303499 () Bool)

(assert (=> b!289333 m!303499))

(declare-fun m!303501 () Bool)

(assert (=> start!28248 m!303501))

(declare-fun m!303503 () Bool)

(assert (=> start!28248 m!303503))

(declare-fun m!303505 () Bool)

(assert (=> b!289338 m!303505))

(declare-fun m!303507 () Bool)

(assert (=> b!289336 m!303507))

(declare-fun m!303509 () Bool)

(assert (=> b!289334 m!303509))

(push 1)

