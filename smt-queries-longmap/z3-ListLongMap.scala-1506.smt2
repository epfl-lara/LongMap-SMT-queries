; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28568 () Bool)

(assert start!28568)

(declare-fun b!292057 () Bool)

(declare-fun e!184792 () Bool)

(declare-fun e!184796 () Bool)

(assert (=> b!292057 (= e!184792 e!184796)))

(declare-fun res!153119 () Bool)

(assert (=> b!292057 (=> (not res!153119) (not e!184796))))

(declare-fun lt!144526 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2145 0))(
  ( (MissingZero!2145 (index!10750 (_ BitVec 32))) (Found!2145 (index!10751 (_ BitVec 32))) (Intermediate!2145 (undefined!2957 Bool) (index!10752 (_ BitVec 32)) (x!28944 (_ BitVec 32))) (Undefined!2145) (MissingVacant!2145 (index!10753 (_ BitVec 32))) )
))
(declare-fun lt!144529 () SeekEntryResult!2145)

(assert (=> b!292057 (= res!153119 (and (not lt!144526) (= lt!144529 (MissingVacant!2145 i!1256))))))

(declare-fun lt!144524 () SeekEntryResult!2145)

(declare-datatypes ((array!14747 0))(
  ( (array!14748 (arr!6996 (Array (_ BitVec 32) (_ BitVec 64))) (size!7348 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14747)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!144525 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14747 (_ BitVec 32)) SeekEntryResult!2145)

(assert (=> b!292057 (= lt!144524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144525 k0!2524 (array!14748 (store (arr!6996 a!3312) i!1256 k0!2524) (size!7348 a!3312)) mask!3809))))

(declare-fun lt!144527 () SeekEntryResult!2145)

(assert (=> b!292057 (= lt!144527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144525 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292057 (= lt!144525 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292058 () Bool)

(declare-fun res!153115 () Bool)

(declare-fun e!184794 () Bool)

(assert (=> b!292058 (=> (not res!153115) (not e!184794))))

(assert (=> b!292058 (= res!153115 (and (= (size!7348 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7348 a!3312))))))

(declare-fun b!292059 () Bool)

(declare-fun res!153114 () Bool)

(assert (=> b!292059 (=> (not res!153114) (not e!184794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292059 (= res!153114 (validKeyInArray!0 k0!2524))))

(declare-fun res!153113 () Bool)

(assert (=> start!28568 (=> (not res!153113) (not e!184794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28568 (= res!153113 (validMask!0 mask!3809))))

(assert (=> start!28568 e!184794))

(assert (=> start!28568 true))

(declare-fun array_inv!4959 (array!14747) Bool)

(assert (=> start!28568 (array_inv!4959 a!3312)))

(declare-fun b!292060 () Bool)

(declare-fun e!184795 () Bool)

(assert (=> b!292060 (= e!184795 (not true))))

(assert (=> b!292060 (= (index!10752 lt!144527) i!1256)))

(declare-fun b!292061 () Bool)

(assert (=> b!292061 (= e!184796 e!184795)))

(declare-fun res!153116 () Bool)

(assert (=> b!292061 (=> (not res!153116) (not e!184795))))

(declare-fun lt!144528 () Bool)

(assert (=> b!292061 (= res!153116 (and (or lt!144528 (not (undefined!2957 lt!144527))) (not lt!144528) (= (select (arr!6996 a!3312) (index!10752 lt!144527)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292061 (= lt!144528 (not ((_ is Intermediate!2145) lt!144527)))))

(declare-fun b!292062 () Bool)

(assert (=> b!292062 (= e!184794 e!184792)))

(declare-fun res!153120 () Bool)

(assert (=> b!292062 (=> (not res!153120) (not e!184792))))

(assert (=> b!292062 (= res!153120 (or lt!144526 (= lt!144529 (MissingVacant!2145 i!1256))))))

(assert (=> b!292062 (= lt!144526 (= lt!144529 (MissingZero!2145 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14747 (_ BitVec 32)) SeekEntryResult!2145)

(assert (=> b!292062 (= lt!144529 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292063 () Bool)

(declare-fun res!153118 () Bool)

(assert (=> b!292063 (=> (not res!153118) (not e!184792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14747 (_ BitVec 32)) Bool)

(assert (=> b!292063 (= res!153118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292064 () Bool)

(declare-fun res!153117 () Bool)

(assert (=> b!292064 (=> (not res!153117) (not e!184794))))

(declare-fun arrayContainsKey!0 (array!14747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292064 (= res!153117 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28568 res!153113) b!292058))

(assert (= (and b!292058 res!153115) b!292059))

(assert (= (and b!292059 res!153114) b!292064))

(assert (= (and b!292064 res!153117) b!292062))

(assert (= (and b!292062 res!153120) b!292063))

(assert (= (and b!292063 res!153118) b!292057))

(assert (= (and b!292057 res!153119) b!292061))

(assert (= (and b!292061 res!153116) b!292060))

(declare-fun m!305785 () Bool)

(assert (=> b!292061 m!305785))

(declare-fun m!305787 () Bool)

(assert (=> b!292062 m!305787))

(declare-fun m!305789 () Bool)

(assert (=> b!292063 m!305789))

(declare-fun m!305791 () Bool)

(assert (=> b!292059 m!305791))

(declare-fun m!305793 () Bool)

(assert (=> start!28568 m!305793))

(declare-fun m!305795 () Bool)

(assert (=> start!28568 m!305795))

(declare-fun m!305797 () Bool)

(assert (=> b!292057 m!305797))

(declare-fun m!305799 () Bool)

(assert (=> b!292057 m!305799))

(declare-fun m!305801 () Bool)

(assert (=> b!292057 m!305801))

(declare-fun m!305803 () Bool)

(assert (=> b!292057 m!305803))

(declare-fun m!305805 () Bool)

(assert (=> b!292064 m!305805))

(check-sat (not b!292063) (not b!292064) (not b!292059) (not start!28568) (not b!292057) (not b!292062))
(check-sat)
