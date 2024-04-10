; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28256 () Bool)

(assert start!28256)

(declare-fun b!289444 () Bool)

(declare-datatypes ((Unit!9085 0))(
  ( (Unit!9086) )
))
(declare-fun e!183250 () Unit!9085)

(declare-fun e!183253 () Unit!9085)

(assert (=> b!289444 (= e!183250 e!183253)))

(declare-fun c!46761 () Bool)

(declare-datatypes ((SeekEntryResult!2061 0))(
  ( (MissingZero!2061 (index!10414 (_ BitVec 32))) (Found!2061 (index!10415 (_ BitVec 32))) (Intermediate!2061 (undefined!2873 Bool) (index!10416 (_ BitVec 32)) (x!28618 (_ BitVec 32))) (Undefined!2061) (MissingVacant!2061 (index!10417 (_ BitVec 32))) )
))
(declare-fun lt!142830 () SeekEntryResult!2061)

(get-info :version)

(assert (=> b!289444 (= c!46761 ((_ is Intermediate!2061) lt!142830))))

(declare-fun b!289445 () Bool)

(declare-fun Unit!9087 () Unit!9085)

(assert (=> b!289445 (= e!183250 Unit!9087)))

(assert (=> b!289445 false))

(declare-fun b!289446 () Bool)

(declare-fun e!183252 () Bool)

(declare-fun e!183254 () Bool)

(assert (=> b!289446 (= e!183252 e!183254)))

(declare-fun res!151047 () Bool)

(assert (=> b!289446 (=> (not res!151047) (not e!183254))))

(declare-fun lt!142832 () SeekEntryResult!2061)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142829 () Bool)

(assert (=> b!289446 (= res!151047 (or lt!142829 (= lt!142832 (MissingVacant!2061 i!1256))))))

(assert (=> b!289446 (= lt!142829 (= lt!142832 (MissingZero!2061 i!1256)))))

(declare-datatypes ((array!14570 0))(
  ( (array!14571 (arr!6912 (Array (_ BitVec 32) (_ BitVec 64))) (size!7264 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14570)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14570 (_ BitVec 32)) SeekEntryResult!2061)

(assert (=> b!289446 (= lt!142832 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289447 () Bool)

(declare-fun res!151051 () Bool)

(assert (=> b!289447 (=> (not res!151051) (not e!183254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14570 (_ BitVec 32)) Bool)

(assert (=> b!289447 (= res!151051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289448 () Bool)

(declare-fun e!183249 () Bool)

(assert (=> b!289448 (= e!183249 false)))

(declare-fun lt!142831 () Unit!9085)

(assert (=> b!289448 (= lt!142831 e!183250)))

(declare-fun c!46760 () Bool)

(assert (=> b!289448 (= c!46760 (or (and ((_ is Intermediate!2061) lt!142830) (undefined!2873 lt!142830)) (and ((_ is Intermediate!2061) lt!142830) (= (select (arr!6912 a!3312) (index!10416 lt!142830)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2061) lt!142830) (= (select (arr!6912 a!3312) (index!10416 lt!142830)) k0!2524))))))

(declare-fun b!289449 () Bool)

(declare-fun res!151053 () Bool)

(assert (=> b!289449 (=> (not res!151053) (not e!183252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289449 (= res!151053 (validKeyInArray!0 k0!2524))))

(declare-fun b!289450 () Bool)

(declare-fun res!151049 () Bool)

(assert (=> b!289450 (=> (not res!151049) (not e!183252))))

(assert (=> b!289450 (= res!151049 (and (= (size!7264 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7264 a!3312))))))

(declare-fun res!151048 () Bool)

(assert (=> start!28256 (=> (not res!151048) (not e!183252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28256 (= res!151048 (validMask!0 mask!3809))))

(assert (=> start!28256 e!183252))

(assert (=> start!28256 true))

(declare-fun array_inv!4875 (array!14570) Bool)

(assert (=> start!28256 (array_inv!4875 a!3312)))

(declare-fun b!289451 () Bool)

(assert (=> b!289451 false))

(declare-fun Unit!9088 () Unit!9085)

(assert (=> b!289451 (= e!183253 Unit!9088)))

(declare-fun b!289452 () Bool)

(assert (=> b!289452 (= e!183254 e!183249)))

(declare-fun res!151052 () Bool)

(assert (=> b!289452 (=> (not res!151052) (not e!183249))))

(assert (=> b!289452 (= res!151052 lt!142829)))

(declare-fun lt!142833 () SeekEntryResult!2061)

(declare-fun lt!142834 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14570 (_ BitVec 32)) SeekEntryResult!2061)

(assert (=> b!289452 (= lt!142833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142834 k0!2524 (array!14571 (store (arr!6912 a!3312) i!1256 k0!2524) (size!7264 a!3312)) mask!3809))))

(assert (=> b!289452 (= lt!142830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142834 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289452 (= lt!142834 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289453 () Bool)

(assert (=> b!289453 (and (= lt!142833 lt!142830) (= (select (store (arr!6912 a!3312) i!1256 k0!2524) (index!10416 lt!142830)) k0!2524))))

(declare-fun lt!142828 () Unit!9085)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14570 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9085)

(assert (=> b!289453 (= lt!142828 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142834 (index!10416 lt!142830) (x!28618 lt!142830) mask!3809))))

(assert (=> b!289453 (and (= (select (arr!6912 a!3312) (index!10416 lt!142830)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10416 lt!142830) i!1256))))

(declare-fun Unit!9089 () Unit!9085)

(assert (=> b!289453 (= e!183253 Unit!9089)))

(declare-fun b!289454 () Bool)

(declare-fun res!151050 () Bool)

(assert (=> b!289454 (=> (not res!151050) (not e!183252))))

(declare-fun arrayContainsKey!0 (array!14570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289454 (= res!151050 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28256 res!151048) b!289450))

(assert (= (and b!289450 res!151049) b!289449))

(assert (= (and b!289449 res!151053) b!289454))

(assert (= (and b!289454 res!151050) b!289446))

(assert (= (and b!289446 res!151047) b!289447))

(assert (= (and b!289447 res!151051) b!289452))

(assert (= (and b!289452 res!151052) b!289448))

(assert (= (and b!289448 c!46760) b!289445))

(assert (= (and b!289448 (not c!46760)) b!289444))

(assert (= (and b!289444 c!46761) b!289453))

(assert (= (and b!289444 (not c!46761)) b!289451))

(declare-fun m!303581 () Bool)

(assert (=> b!289448 m!303581))

(declare-fun m!303583 () Bool)

(assert (=> b!289449 m!303583))

(declare-fun m!303585 () Bool)

(assert (=> b!289454 m!303585))

(declare-fun m!303587 () Bool)

(assert (=> b!289447 m!303587))

(declare-fun m!303589 () Bool)

(assert (=> b!289452 m!303589))

(declare-fun m!303591 () Bool)

(assert (=> b!289452 m!303591))

(declare-fun m!303593 () Bool)

(assert (=> b!289452 m!303593))

(declare-fun m!303595 () Bool)

(assert (=> b!289452 m!303595))

(assert (=> b!289453 m!303589))

(declare-fun m!303597 () Bool)

(assert (=> b!289453 m!303597))

(declare-fun m!303599 () Bool)

(assert (=> b!289453 m!303599))

(assert (=> b!289453 m!303581))

(declare-fun m!303601 () Bool)

(assert (=> start!28256 m!303601))

(declare-fun m!303603 () Bool)

(assert (=> start!28256 m!303603))

(declare-fun m!303605 () Bool)

(assert (=> b!289446 m!303605))

(check-sat (not b!289454) (not b!289452) (not b!289446) (not start!28256) (not b!289449) (not b!289453) (not b!289447))
(check-sat)
