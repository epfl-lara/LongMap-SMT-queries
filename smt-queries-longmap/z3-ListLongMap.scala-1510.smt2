; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28586 () Bool)

(assert start!28586)

(declare-fun b!292174 () Bool)

(declare-fun res!153282 () Bool)

(declare-fun e!184857 () Bool)

(assert (=> b!292174 (=> (not res!153282) (not e!184857))))

(declare-datatypes ((array!14758 0))(
  ( (array!14759 (arr!7002 (Array (_ BitVec 32) (_ BitVec 64))) (size!7355 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14758)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292174 (= res!153282 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153283 () Bool)

(assert (=> start!28586 (=> (not res!153283) (not e!184857))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28586 (= res!153283 (validMask!0 mask!3809))))

(assert (=> start!28586 e!184857))

(assert (=> start!28586 true))

(declare-fun array_inv!4974 (array!14758) Bool)

(assert (=> start!28586 (array_inv!4974 a!3312)))

(declare-fun b!292175 () Bool)

(declare-fun res!153288 () Bool)

(assert (=> b!292175 (=> (not res!153288) (not e!184857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292175 (= res!153288 (validKeyInArray!0 k0!2524))))

(declare-fun b!292176 () Bool)

(declare-fun e!184856 () Bool)

(declare-fun e!184860 () Bool)

(assert (=> b!292176 (= e!184856 e!184860)))

(declare-fun res!153287 () Bool)

(assert (=> b!292176 (=> (not res!153287) (not e!184860))))

(declare-datatypes ((SeekEntryResult!2150 0))(
  ( (MissingZero!2150 (index!10770 (_ BitVec 32))) (Found!2150 (index!10771 (_ BitVec 32))) (Intermediate!2150 (undefined!2962 Bool) (index!10772 (_ BitVec 32)) (x!28980 (_ BitVec 32))) (Undefined!2150) (MissingVacant!2150 (index!10773 (_ BitVec 32))) )
))
(declare-fun lt!144572 () SeekEntryResult!2150)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144571 () Bool)

(assert (=> b!292176 (= res!153287 (and (not lt!144571) (= lt!144572 (MissingVacant!2150 i!1256))))))

(declare-fun lt!144573 () (_ BitVec 32))

(declare-fun lt!144575 () SeekEntryResult!2150)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14758 (_ BitVec 32)) SeekEntryResult!2150)

(assert (=> b!292176 (= lt!144575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144573 k0!2524 (array!14759 (store (arr!7002 a!3312) i!1256 k0!2524) (size!7355 a!3312)) mask!3809))))

(declare-fun lt!144570 () SeekEntryResult!2150)

(assert (=> b!292176 (= lt!144570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144573 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292176 (= lt!144573 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292177 () Bool)

(declare-fun e!184858 () Bool)

(assert (=> b!292177 (= e!184858 (not true))))

(declare-datatypes ((Unit!9124 0))(
  ( (Unit!9125) )
))
(declare-fun lt!144576 () Unit!9124)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14758 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9124)

(assert (=> b!292177 (= lt!144576 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144573 (index!10772 lt!144570) (x!28980 lt!144570) mask!3809))))

(assert (=> b!292177 (= (index!10772 lt!144570) i!1256)))

(declare-fun b!292178 () Bool)

(declare-fun res!153289 () Bool)

(assert (=> b!292178 (=> (not res!153289) (not e!184856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14758 (_ BitVec 32)) Bool)

(assert (=> b!292178 (= res!153289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292179 () Bool)

(assert (=> b!292179 (= e!184857 e!184856)))

(declare-fun res!153284 () Bool)

(assert (=> b!292179 (=> (not res!153284) (not e!184856))))

(assert (=> b!292179 (= res!153284 (or lt!144571 (= lt!144572 (MissingVacant!2150 i!1256))))))

(assert (=> b!292179 (= lt!144571 (= lt!144572 (MissingZero!2150 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14758 (_ BitVec 32)) SeekEntryResult!2150)

(assert (=> b!292179 (= lt!144572 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292180 () Bool)

(assert (=> b!292180 (= e!184860 e!184858)))

(declare-fun res!153286 () Bool)

(assert (=> b!292180 (=> (not res!153286) (not e!184858))))

(declare-fun lt!144574 () Bool)

(assert (=> b!292180 (= res!153286 (and (or lt!144574 (not (undefined!2962 lt!144570))) (not lt!144574) (= (select (arr!7002 a!3312) (index!10772 lt!144570)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292180 (= lt!144574 (not ((_ is Intermediate!2150) lt!144570)))))

(declare-fun b!292181 () Bool)

(declare-fun res!153285 () Bool)

(assert (=> b!292181 (=> (not res!153285) (not e!184857))))

(assert (=> b!292181 (= res!153285 (and (= (size!7355 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7355 a!3312))))))

(assert (= (and start!28586 res!153283) b!292181))

(assert (= (and b!292181 res!153285) b!292175))

(assert (= (and b!292175 res!153288) b!292174))

(assert (= (and b!292174 res!153282) b!292179))

(assert (= (and b!292179 res!153284) b!292178))

(assert (= (and b!292178 res!153289) b!292176))

(assert (= (and b!292176 res!153287) b!292180))

(assert (= (and b!292180 res!153286) b!292177))

(declare-fun m!305453 () Bool)

(assert (=> b!292175 m!305453))

(declare-fun m!305455 () Bool)

(assert (=> b!292174 m!305455))

(declare-fun m!305457 () Bool)

(assert (=> b!292176 m!305457))

(declare-fun m!305459 () Bool)

(assert (=> b!292176 m!305459))

(declare-fun m!305461 () Bool)

(assert (=> b!292176 m!305461))

(declare-fun m!305463 () Bool)

(assert (=> b!292176 m!305463))

(declare-fun m!305465 () Bool)

(assert (=> b!292179 m!305465))

(declare-fun m!305467 () Bool)

(assert (=> b!292177 m!305467))

(declare-fun m!305469 () Bool)

(assert (=> start!28586 m!305469))

(declare-fun m!305471 () Bool)

(assert (=> start!28586 m!305471))

(declare-fun m!305473 () Bool)

(assert (=> b!292180 m!305473))

(declare-fun m!305475 () Bool)

(assert (=> b!292178 m!305475))

(check-sat (not b!292175) (not b!292176) (not b!292178) (not b!292177) (not b!292174) (not b!292179) (not start!28586))
(check-sat)
