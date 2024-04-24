; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28438 () Bool)

(assert start!28438)

(declare-fun b!291360 () Bool)

(declare-fun res!152672 () Bool)

(declare-fun e!184357 () Bool)

(assert (=> b!291360 (=> (not res!152672) (not e!184357))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14712 0))(
  ( (array!14713 (arr!6982 (Array (_ BitVec 32) (_ BitVec 64))) (size!7334 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14712)

(assert (=> b!291360 (= res!152672 (and (= (size!7334 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7334 a!3312))))))

(declare-fun b!291361 () Bool)

(declare-fun res!152676 () Bool)

(assert (=> b!291361 (=> (not res!152676) (not e!184357))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291361 (= res!152676 (validKeyInArray!0 k0!2524))))

(declare-fun b!291362 () Bool)

(declare-fun e!184361 () Bool)

(declare-fun e!184360 () Bool)

(assert (=> b!291362 (= e!184361 e!184360)))

(declare-fun res!152677 () Bool)

(assert (=> b!291362 (=> (not res!152677) (not e!184360))))

(declare-fun lt!144160 () Bool)

(declare-datatypes ((SeekEntryResult!2096 0))(
  ( (MissingZero!2096 (index!10554 (_ BitVec 32))) (Found!2096 (index!10555 (_ BitVec 32))) (Intermediate!2096 (undefined!2908 Bool) (index!10556 (_ BitVec 32)) (x!28851 (_ BitVec 32))) (Undefined!2096) (MissingVacant!2096 (index!10557 (_ BitVec 32))) )
))
(declare-fun lt!144157 () SeekEntryResult!2096)

(assert (=> b!291362 (= res!152677 (and (not lt!144160) (= lt!144157 (MissingVacant!2096 i!1256))))))

(declare-fun lt!144158 () (_ BitVec 32))

(declare-fun lt!144161 () SeekEntryResult!2096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14712 (_ BitVec 32)) SeekEntryResult!2096)

(assert (=> b!291362 (= lt!144161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144158 k0!2524 (array!14713 (store (arr!6982 a!3312) i!1256 k0!2524) (size!7334 a!3312)) mask!3809))))

(declare-fun lt!144159 () SeekEntryResult!2096)

(assert (=> b!291362 (= lt!144159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144158 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291362 (= lt!144158 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291363 () Bool)

(declare-fun res!152675 () Bool)

(assert (=> b!291363 (=> (not res!152675) (not e!184357))))

(declare-fun arrayContainsKey!0 (array!14712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291363 (= res!152675 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291364 () Bool)

(declare-fun e!184358 () Bool)

(assert (=> b!291364 (= e!184360 e!184358)))

(declare-fun res!152674 () Bool)

(assert (=> b!291364 (=> (not res!152674) (not e!184358))))

(declare-fun lt!144162 () Bool)

(assert (=> b!291364 (= res!152674 (and (or lt!144162 (not (undefined!2908 lt!144159))) (not lt!144162) (= (select (arr!6982 a!3312) (index!10556 lt!144159)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291364 (= lt!144162 (not ((_ is Intermediate!2096) lt!144159)))))

(declare-fun b!291365 () Bool)

(assert (=> b!291365 (= e!184357 e!184361)))

(declare-fun res!152678 () Bool)

(assert (=> b!291365 (=> (not res!152678) (not e!184361))))

(assert (=> b!291365 (= res!152678 (or lt!144160 (= lt!144157 (MissingVacant!2096 i!1256))))))

(assert (=> b!291365 (= lt!144160 (= lt!144157 (MissingZero!2096 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14712 (_ BitVec 32)) SeekEntryResult!2096)

(assert (=> b!291365 (= lt!144157 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!152679 () Bool)

(assert (=> start!28438 (=> (not res!152679) (not e!184357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28438 (= res!152679 (validMask!0 mask!3809))))

(assert (=> start!28438 e!184357))

(assert (=> start!28438 true))

(declare-fun array_inv!4932 (array!14712) Bool)

(assert (=> start!28438 (array_inv!4932 a!3312)))

(declare-fun b!291366 () Bool)

(declare-fun res!152673 () Bool)

(assert (=> b!291366 (=> (not res!152673) (not e!184361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14712 (_ BitVec 32)) Bool)

(assert (=> b!291366 (= res!152673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291367 () Bool)

(assert (=> b!291367 (= e!184358 (not true))))

(assert (=> b!291367 (= (index!10556 lt!144159) i!1256)))

(assert (= (and start!28438 res!152679) b!291360))

(assert (= (and b!291360 res!152672) b!291361))

(assert (= (and b!291361 res!152676) b!291363))

(assert (= (and b!291363 res!152675) b!291365))

(assert (= (and b!291365 res!152678) b!291366))

(assert (= (and b!291366 res!152673) b!291362))

(assert (= (and b!291362 res!152677) b!291364))

(assert (= (and b!291364 res!152674) b!291367))

(declare-fun m!305465 () Bool)

(assert (=> b!291364 m!305465))

(declare-fun m!305467 () Bool)

(assert (=> b!291366 m!305467))

(declare-fun m!305469 () Bool)

(assert (=> b!291362 m!305469))

(declare-fun m!305471 () Bool)

(assert (=> b!291362 m!305471))

(declare-fun m!305473 () Bool)

(assert (=> b!291362 m!305473))

(declare-fun m!305475 () Bool)

(assert (=> b!291362 m!305475))

(declare-fun m!305477 () Bool)

(assert (=> b!291365 m!305477))

(declare-fun m!305479 () Bool)

(assert (=> b!291363 m!305479))

(declare-fun m!305481 () Bool)

(assert (=> b!291361 m!305481))

(declare-fun m!305483 () Bool)

(assert (=> start!28438 m!305483))

(declare-fun m!305485 () Bool)

(assert (=> start!28438 m!305485))

(check-sat (not b!291365) (not b!291361) (not b!291362) (not b!291363) (not start!28438) (not b!291366))
(check-sat)
