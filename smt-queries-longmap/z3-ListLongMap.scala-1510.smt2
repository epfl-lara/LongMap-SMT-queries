; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28582 () Bool)

(assert start!28582)

(declare-fun b!292368 () Bool)

(declare-fun res!153404 () Bool)

(declare-fun e!184981 () Bool)

(assert (=> b!292368 (=> (not res!153404) (not e!184981))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14766 0))(
  ( (array!14767 (arr!7006 (Array (_ BitVec 32) (_ BitVec 64))) (size!7358 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14766)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292368 (= res!153404 (and (= (size!7358 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7358 a!3312))))))

(declare-fun b!292369 () Bool)

(declare-fun e!184984 () Bool)

(declare-fun e!184985 () Bool)

(assert (=> b!292369 (= e!184984 e!184985)))

(declare-fun res!153401 () Bool)

(assert (=> b!292369 (=> (not res!153401) (not e!184985))))

(declare-datatypes ((SeekEntryResult!2120 0))(
  ( (MissingZero!2120 (index!10650 (_ BitVec 32))) (Found!2120 (index!10651 (_ BitVec 32))) (Intermediate!2120 (undefined!2932 Bool) (index!10652 (_ BitVec 32)) (x!28951 (_ BitVec 32))) (Undefined!2120) (MissingVacant!2120 (index!10653 (_ BitVec 32))) )
))
(declare-fun lt!144814 () SeekEntryResult!2120)

(declare-fun lt!144810 () Bool)

(assert (=> b!292369 (= res!153401 (and (or lt!144810 (not (undefined!2932 lt!144814))) (not lt!144810) (= (select (arr!7006 a!3312) (index!10652 lt!144814)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292369 (= lt!144810 (not ((_ is Intermediate!2120) lt!144814)))))

(declare-fun b!292370 () Bool)

(declare-fun res!153398 () Bool)

(assert (=> b!292370 (=> (not res!153398) (not e!184981))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292370 (= res!153398 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292371 () Bool)

(declare-fun e!184982 () Bool)

(assert (=> b!292371 (= e!184982 e!184984)))

(declare-fun res!153400 () Bool)

(assert (=> b!292371 (=> (not res!153400) (not e!184984))))

(declare-fun lt!144813 () SeekEntryResult!2120)

(declare-fun lt!144815 () Bool)

(assert (=> b!292371 (= res!153400 (and (not lt!144815) (= lt!144813 (MissingVacant!2120 i!1256))))))

(declare-fun lt!144811 () SeekEntryResult!2120)

(declare-fun lt!144812 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14766 (_ BitVec 32)) SeekEntryResult!2120)

(assert (=> b!292371 (= lt!144811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144812 k0!2524 (array!14767 (store (arr!7006 a!3312) i!1256 k0!2524) (size!7358 a!3312)) mask!3809))))

(assert (=> b!292371 (= lt!144814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144812 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292371 (= lt!144812 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!153399 () Bool)

(assert (=> start!28582 (=> (not res!153399) (not e!184981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28582 (= res!153399 (validMask!0 mask!3809))))

(assert (=> start!28582 e!184981))

(assert (=> start!28582 true))

(declare-fun array_inv!4956 (array!14766) Bool)

(assert (=> start!28582 (array_inv!4956 a!3312)))

(declare-fun b!292372 () Bool)

(declare-fun res!153402 () Bool)

(assert (=> b!292372 (=> (not res!153402) (not e!184981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292372 (= res!153402 (validKeyInArray!0 k0!2524))))

(declare-fun b!292373 () Bool)

(declare-fun res!153403 () Bool)

(assert (=> b!292373 (=> (not res!153403) (not e!184982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14766 (_ BitVec 32)) Bool)

(assert (=> b!292373 (= res!153403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292374 () Bool)

(assert (=> b!292374 (= e!184985 (not true))))

(declare-datatypes ((Unit!9142 0))(
  ( (Unit!9143) )
))
(declare-fun lt!144816 () Unit!9142)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14766 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9142)

(assert (=> b!292374 (= lt!144816 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144812 (index!10652 lt!144814) (x!28951 lt!144814) mask!3809))))

(assert (=> b!292374 (= (index!10652 lt!144814) i!1256)))

(declare-fun b!292375 () Bool)

(assert (=> b!292375 (= e!184981 e!184982)))

(declare-fun res!153405 () Bool)

(assert (=> b!292375 (=> (not res!153405) (not e!184982))))

(assert (=> b!292375 (= res!153405 (or lt!144815 (= lt!144813 (MissingVacant!2120 i!1256))))))

(assert (=> b!292375 (= lt!144815 (= lt!144813 (MissingZero!2120 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14766 (_ BitVec 32)) SeekEntryResult!2120)

(assert (=> b!292375 (= lt!144813 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28582 res!153399) b!292368))

(assert (= (and b!292368 res!153404) b!292372))

(assert (= (and b!292372 res!153402) b!292370))

(assert (= (and b!292370 res!153398) b!292375))

(assert (= (and b!292375 res!153405) b!292373))

(assert (= (and b!292373 res!153403) b!292371))

(assert (= (and b!292371 res!153400) b!292369))

(assert (= (and b!292369 res!153401) b!292374))

(declare-fun m!306251 () Bool)

(assert (=> start!28582 m!306251))

(declare-fun m!306253 () Bool)

(assert (=> start!28582 m!306253))

(declare-fun m!306255 () Bool)

(assert (=> b!292370 m!306255))

(declare-fun m!306257 () Bool)

(assert (=> b!292371 m!306257))

(declare-fun m!306259 () Bool)

(assert (=> b!292371 m!306259))

(declare-fun m!306261 () Bool)

(assert (=> b!292371 m!306261))

(declare-fun m!306263 () Bool)

(assert (=> b!292371 m!306263))

(declare-fun m!306265 () Bool)

(assert (=> b!292374 m!306265))

(declare-fun m!306267 () Bool)

(assert (=> b!292372 m!306267))

(declare-fun m!306269 () Bool)

(assert (=> b!292375 m!306269))

(declare-fun m!306271 () Bool)

(assert (=> b!292373 m!306271))

(declare-fun m!306273 () Bool)

(assert (=> b!292369 m!306273))

(check-sat (not start!28582) (not b!292372) (not b!292375) (not b!292374) (not b!292373) (not b!292370) (not b!292371))
(check-sat)
