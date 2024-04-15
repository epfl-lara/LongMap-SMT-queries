; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28256 () Bool)

(assert start!28256)

(declare-fun b!289363 () Bool)

(declare-fun e!183189 () Bool)

(declare-fun e!183186 () Bool)

(assert (=> b!289363 (= e!183189 e!183186)))

(declare-fun res!150999 () Bool)

(assert (=> b!289363 (=> (not res!150999) (not e!183186))))

(declare-datatypes ((SeekEntryResult!2057 0))(
  ( (MissingZero!2057 (index!10398 (_ BitVec 32))) (Found!2057 (index!10399 (_ BitVec 32))) (Intermediate!2057 (undefined!2869 Bool) (index!10400 (_ BitVec 32)) (x!28621 (_ BitVec 32))) (Undefined!2057) (MissingVacant!2057 (index!10401 (_ BitVec 32))) )
))
(declare-fun lt!142691 () SeekEntryResult!2057)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142693 () Bool)

(assert (=> b!289363 (= res!150999 (or lt!142693 (= lt!142691 (MissingVacant!2057 i!1256))))))

(assert (=> b!289363 (= lt!142693 (= lt!142691 (MissingZero!2057 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14563 0))(
  ( (array!14564 (arr!6909 (Array (_ BitVec 32) (_ BitVec 64))) (size!7262 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14563)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14563 (_ BitVec 32)) SeekEntryResult!2057)

(assert (=> b!289363 (= lt!142691 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289364 () Bool)

(declare-datatypes ((Unit!9045 0))(
  ( (Unit!9046) )
))
(declare-fun e!183184 () Unit!9045)

(declare-fun e!183185 () Unit!9045)

(assert (=> b!289364 (= e!183184 e!183185)))

(declare-fun c!46746 () Bool)

(declare-fun lt!142694 () SeekEntryResult!2057)

(get-info :version)

(assert (=> b!289364 (= c!46746 ((_ is Intermediate!2057) lt!142694))))

(declare-fun b!289365 () Bool)

(declare-fun res!150997 () Bool)

(assert (=> b!289365 (=> (not res!150997) (not e!183189))))

(declare-fun arrayContainsKey!0 (array!14563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289365 (= res!150997 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289366 () Bool)

(declare-fun e!183187 () Bool)

(assert (=> b!289366 (= e!183186 e!183187)))

(declare-fun res!151000 () Bool)

(assert (=> b!289366 (=> (not res!151000) (not e!183187))))

(assert (=> b!289366 (= res!151000 lt!142693)))

(declare-fun lt!142695 () (_ BitVec 32))

(declare-fun lt!142692 () SeekEntryResult!2057)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14563 (_ BitVec 32)) SeekEntryResult!2057)

(assert (=> b!289366 (= lt!142692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142695 k0!2524 (array!14564 (store (arr!6909 a!3312) i!1256 k0!2524) (size!7262 a!3312)) mask!3809))))

(assert (=> b!289366 (= lt!142694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142695 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289366 (= lt!142695 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289367 () Bool)

(declare-fun res!150996 () Bool)

(assert (=> b!289367 (=> (not res!150996) (not e!183186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14563 (_ BitVec 32)) Bool)

(assert (=> b!289367 (= res!150996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150994 () Bool)

(assert (=> start!28256 (=> (not res!150994) (not e!183189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28256 (= res!150994 (validMask!0 mask!3809))))

(assert (=> start!28256 e!183189))

(assert (=> start!28256 true))

(declare-fun array_inv!4881 (array!14563) Bool)

(assert (=> start!28256 (array_inv!4881 a!3312)))

(declare-fun b!289368 () Bool)

(assert (=> b!289368 false))

(declare-fun Unit!9047 () Unit!9045)

(assert (=> b!289368 (= e!183185 Unit!9047)))

(declare-fun b!289369 () Bool)

(assert (=> b!289369 (= e!183187 (and (= lt!142692 lt!142694) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun lt!142689 () Unit!9045)

(assert (=> b!289369 (= lt!142689 e!183184)))

(declare-fun c!46747 () Bool)

(assert (=> b!289369 (= c!46747 (or (and ((_ is Intermediate!2057) lt!142694) (undefined!2869 lt!142694)) (and ((_ is Intermediate!2057) lt!142694) (= (select (arr!6909 a!3312) (index!10400 lt!142694)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2057) lt!142694) (= (select (arr!6909 a!3312) (index!10400 lt!142694)) k0!2524))))))

(declare-fun b!289370 () Bool)

(assert (=> b!289370 (and (= lt!142692 lt!142694) (= (select (store (arr!6909 a!3312) i!1256 k0!2524) (index!10400 lt!142694)) k0!2524))))

(declare-fun lt!142690 () Unit!9045)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14563 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9045)

(assert (=> b!289370 (= lt!142690 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142695 (index!10400 lt!142694) (x!28621 lt!142694) mask!3809))))

(assert (=> b!289370 (and (= (select (arr!6909 a!3312) (index!10400 lt!142694)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10400 lt!142694) i!1256))))

(declare-fun Unit!9048 () Unit!9045)

(assert (=> b!289370 (= e!183185 Unit!9048)))

(declare-fun b!289371 () Bool)

(declare-fun res!150998 () Bool)

(assert (=> b!289371 (=> (not res!150998) (not e!183189))))

(assert (=> b!289371 (= res!150998 (and (= (size!7262 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7262 a!3312))))))

(declare-fun b!289372 () Bool)

(declare-fun Unit!9049 () Unit!9045)

(assert (=> b!289372 (= e!183184 Unit!9049)))

(assert (=> b!289372 false))

(declare-fun b!289373 () Bool)

(declare-fun res!150995 () Bool)

(assert (=> b!289373 (=> (not res!150995) (not e!183189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289373 (= res!150995 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28256 res!150994) b!289371))

(assert (= (and b!289371 res!150998) b!289373))

(assert (= (and b!289373 res!150995) b!289365))

(assert (= (and b!289365 res!150997) b!289363))

(assert (= (and b!289363 res!150999) b!289367))

(assert (= (and b!289367 res!150996) b!289366))

(assert (= (and b!289366 res!151000) b!289369))

(assert (= (and b!289369 c!46747) b!289372))

(assert (= (and b!289369 (not c!46747)) b!289364))

(assert (= (and b!289364 c!46746) b!289370))

(assert (= (and b!289364 (not c!46746)) b!289368))

(declare-fun m!303041 () Bool)

(assert (=> start!28256 m!303041))

(declare-fun m!303043 () Bool)

(assert (=> start!28256 m!303043))

(declare-fun m!303045 () Bool)

(assert (=> b!289365 m!303045))

(declare-fun m!303047 () Bool)

(assert (=> b!289367 m!303047))

(declare-fun m!303049 () Bool)

(assert (=> b!289369 m!303049))

(declare-fun m!303051 () Bool)

(assert (=> b!289363 m!303051))

(declare-fun m!303053 () Bool)

(assert (=> b!289370 m!303053))

(declare-fun m!303055 () Bool)

(assert (=> b!289370 m!303055))

(declare-fun m!303057 () Bool)

(assert (=> b!289370 m!303057))

(assert (=> b!289370 m!303049))

(declare-fun m!303059 () Bool)

(assert (=> b!289373 m!303059))

(assert (=> b!289366 m!303053))

(declare-fun m!303061 () Bool)

(assert (=> b!289366 m!303061))

(declare-fun m!303063 () Bool)

(assert (=> b!289366 m!303063))

(declare-fun m!303065 () Bool)

(assert (=> b!289366 m!303065))

(check-sat (not b!289373) (not b!289367) (not b!289363) (not b!289370) (not start!28256) (not b!289365) (not b!289366))
(check-sat)
