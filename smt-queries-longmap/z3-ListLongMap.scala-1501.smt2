; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28442 () Bool)

(assert start!28442)

(declare-fun b!291265 () Bool)

(declare-fun res!152603 () Bool)

(declare-fun e!184306 () Bool)

(assert (=> b!291265 (=> (not res!152603) (not e!184306))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14711 0))(
  ( (array!14712 (arr!6981 (Array (_ BitVec 32) (_ BitVec 64))) (size!7333 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14711)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291265 (= res!152603 (and (= (size!7333 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7333 a!3312))))))

(declare-fun b!291266 () Bool)

(declare-fun res!152609 () Bool)

(declare-fun e!184307 () Bool)

(assert (=> b!291266 (=> (not res!152609) (not e!184307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14711 (_ BitVec 32)) Bool)

(assert (=> b!291266 (= res!152609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152604 () Bool)

(assert (=> start!28442 (=> (not res!152604) (not e!184306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28442 (= res!152604 (validMask!0 mask!3809))))

(assert (=> start!28442 e!184306))

(assert (=> start!28442 true))

(declare-fun array_inv!4944 (array!14711) Bool)

(assert (=> start!28442 (array_inv!4944 a!3312)))

(declare-fun b!291267 () Bool)

(declare-fun res!152605 () Bool)

(assert (=> b!291267 (=> (not res!152605) (not e!184306))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291267 (= res!152605 (validKeyInArray!0 k0!2524))))

(declare-fun b!291268 () Bool)

(declare-fun e!184305 () Bool)

(declare-fun e!184304 () Bool)

(assert (=> b!291268 (= e!184305 e!184304)))

(declare-fun res!152606 () Bool)

(assert (=> b!291268 (=> (not res!152606) (not e!184304))))

(declare-datatypes ((SeekEntryResult!2130 0))(
  ( (MissingZero!2130 (index!10690 (_ BitVec 32))) (Found!2130 (index!10691 (_ BitVec 32))) (Intermediate!2130 (undefined!2942 Bool) (index!10692 (_ BitVec 32)) (x!28877 (_ BitVec 32))) (Undefined!2130) (MissingVacant!2130 (index!10693 (_ BitVec 32))) )
))
(declare-fun lt!144067 () SeekEntryResult!2130)

(declare-fun lt!144066 () Bool)

(assert (=> b!291268 (= res!152606 (and (or lt!144066 (not (undefined!2942 lt!144067))) (not lt!144066) (= (select (arr!6981 a!3312) (index!10692 lt!144067)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291268 (= lt!144066 (not ((_ is Intermediate!2130) lt!144067)))))

(declare-fun b!291269 () Bool)

(declare-fun res!152607 () Bool)

(assert (=> b!291269 (=> (not res!152607) (not e!184306))))

(declare-fun arrayContainsKey!0 (array!14711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291269 (= res!152607 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291270 () Bool)

(assert (=> b!291270 (= e!184306 e!184307)))

(declare-fun res!152610 () Bool)

(assert (=> b!291270 (=> (not res!152610) (not e!184307))))

(declare-fun lt!144063 () SeekEntryResult!2130)

(declare-fun lt!144062 () Bool)

(assert (=> b!291270 (= res!152610 (or lt!144062 (= lt!144063 (MissingVacant!2130 i!1256))))))

(assert (=> b!291270 (= lt!144062 (= lt!144063 (MissingZero!2130 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14711 (_ BitVec 32)) SeekEntryResult!2130)

(assert (=> b!291270 (= lt!144063 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291271 () Bool)

(assert (=> b!291271 (= e!184307 e!184305)))

(declare-fun res!152608 () Bool)

(assert (=> b!291271 (=> (not res!152608) (not e!184305))))

(assert (=> b!291271 (= res!152608 (and (not lt!144062) (= lt!144063 (MissingVacant!2130 i!1256))))))

(declare-fun lt!144064 () (_ BitVec 32))

(declare-fun lt!144065 () SeekEntryResult!2130)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14711 (_ BitVec 32)) SeekEntryResult!2130)

(assert (=> b!291271 (= lt!144065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144064 k0!2524 (array!14712 (store (arr!6981 a!3312) i!1256 k0!2524) (size!7333 a!3312)) mask!3809))))

(assert (=> b!291271 (= lt!144067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144064 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291271 (= lt!144064 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291272 () Bool)

(assert (=> b!291272 (= e!184304 (not true))))

(assert (=> b!291272 (= (index!10692 lt!144067) i!1256)))

(assert (= (and start!28442 res!152604) b!291265))

(assert (= (and b!291265 res!152603) b!291267))

(assert (= (and b!291267 res!152605) b!291269))

(assert (= (and b!291269 res!152607) b!291270))

(assert (= (and b!291270 res!152610) b!291266))

(assert (= (and b!291266 res!152609) b!291271))

(assert (= (and b!291271 res!152608) b!291268))

(assert (= (and b!291268 res!152606) b!291272))

(declare-fun m!305215 () Bool)

(assert (=> b!291266 m!305215))

(declare-fun m!305217 () Bool)

(assert (=> b!291270 m!305217))

(declare-fun m!305219 () Bool)

(assert (=> b!291269 m!305219))

(declare-fun m!305221 () Bool)

(assert (=> b!291267 m!305221))

(declare-fun m!305223 () Bool)

(assert (=> start!28442 m!305223))

(declare-fun m!305225 () Bool)

(assert (=> start!28442 m!305225))

(declare-fun m!305227 () Bool)

(assert (=> b!291271 m!305227))

(declare-fun m!305229 () Bool)

(assert (=> b!291271 m!305229))

(declare-fun m!305231 () Bool)

(assert (=> b!291271 m!305231))

(declare-fun m!305233 () Bool)

(assert (=> b!291271 m!305233))

(declare-fun m!305235 () Bool)

(assert (=> b!291268 m!305235))

(check-sat (not b!291271) (not start!28442) (not b!291270) (not b!291267) (not b!291269) (not b!291266))
(check-sat)
