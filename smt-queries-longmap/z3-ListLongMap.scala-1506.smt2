; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28558 () Bool)

(assert start!28558)

(declare-fun b!292080 () Bool)

(declare-fun e!184805 () Bool)

(declare-fun e!184801 () Bool)

(assert (=> b!292080 (= e!184805 e!184801)))

(declare-fun res!153116 () Bool)

(assert (=> b!292080 (=> (not res!153116) (not e!184801))))

(declare-datatypes ((SeekEntryResult!2108 0))(
  ( (MissingZero!2108 (index!10602 (_ BitVec 32))) (Found!2108 (index!10603 (_ BitVec 32))) (Intermediate!2108 (undefined!2920 Bool) (index!10604 (_ BitVec 32)) (x!28907 (_ BitVec 32))) (Undefined!2108) (MissingVacant!2108 (index!10605 (_ BitVec 32))) )
))
(declare-fun lt!144568 () SeekEntryResult!2108)

(declare-fun lt!144565 () Bool)

(declare-datatypes ((array!14742 0))(
  ( (array!14743 (arr!6994 (Array (_ BitVec 32) (_ BitVec 64))) (size!7346 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14742)

(assert (=> b!292080 (= res!153116 (and (or lt!144565 (not (undefined!2920 lt!144568))) (not lt!144565) (= (select (arr!6994 a!3312) (index!10604 lt!144568)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292080 (= lt!144565 (not ((_ is Intermediate!2108) lt!144568)))))

(declare-fun b!292081 () Bool)

(declare-fun e!184804 () Bool)

(assert (=> b!292081 (= e!184804 e!184805)))

(declare-fun res!153112 () Bool)

(assert (=> b!292081 (=> (not res!153112) (not e!184805))))

(declare-fun lt!144569 () Bool)

(declare-fun lt!144570 () SeekEntryResult!2108)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292081 (= res!153112 (and (not lt!144569) (= lt!144570 (MissingVacant!2108 i!1256))))))

(declare-fun lt!144566 () SeekEntryResult!2108)

(declare-fun lt!144567 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14742 (_ BitVec 32)) SeekEntryResult!2108)

(assert (=> b!292081 (= lt!144566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144567 k0!2524 (array!14743 (store (arr!6994 a!3312) i!1256 k0!2524) (size!7346 a!3312)) mask!3809))))

(assert (=> b!292081 (= lt!144568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144567 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292081 (= lt!144567 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292082 () Bool)

(declare-fun res!153113 () Bool)

(declare-fun e!184802 () Bool)

(assert (=> b!292082 (=> (not res!153113) (not e!184802))))

(assert (=> b!292082 (= res!153113 (and (= (size!7346 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7346 a!3312))))))

(declare-fun b!292083 () Bool)

(assert (=> b!292083 (= e!184801 (not true))))

(assert (=> b!292083 (= (index!10604 lt!144568) i!1256)))

(declare-fun b!292084 () Bool)

(assert (=> b!292084 (= e!184802 e!184804)))

(declare-fun res!153110 () Bool)

(assert (=> b!292084 (=> (not res!153110) (not e!184804))))

(assert (=> b!292084 (= res!153110 (or lt!144569 (= lt!144570 (MissingVacant!2108 i!1256))))))

(assert (=> b!292084 (= lt!144569 (= lt!144570 (MissingZero!2108 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14742 (_ BitVec 32)) SeekEntryResult!2108)

(assert (=> b!292084 (= lt!144570 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!153117 () Bool)

(assert (=> start!28558 (=> (not res!153117) (not e!184802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28558 (= res!153117 (validMask!0 mask!3809))))

(assert (=> start!28558 e!184802))

(assert (=> start!28558 true))

(declare-fun array_inv!4944 (array!14742) Bool)

(assert (=> start!28558 (array_inv!4944 a!3312)))

(declare-fun b!292085 () Bool)

(declare-fun res!153111 () Bool)

(assert (=> b!292085 (=> (not res!153111) (not e!184802))))

(declare-fun arrayContainsKey!0 (array!14742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292085 (= res!153111 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292086 () Bool)

(declare-fun res!153115 () Bool)

(assert (=> b!292086 (=> (not res!153115) (not e!184802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292086 (= res!153115 (validKeyInArray!0 k0!2524))))

(declare-fun b!292087 () Bool)

(declare-fun res!153114 () Bool)

(assert (=> b!292087 (=> (not res!153114) (not e!184804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14742 (_ BitVec 32)) Bool)

(assert (=> b!292087 (= res!153114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28558 res!153117) b!292082))

(assert (= (and b!292082 res!153113) b!292086))

(assert (= (and b!292086 res!153115) b!292085))

(assert (= (and b!292085 res!153111) b!292084))

(assert (= (and b!292084 res!153110) b!292087))

(assert (= (and b!292087 res!153114) b!292081))

(assert (= (and b!292081 res!153112) b!292080))

(assert (= (and b!292080 res!153116) b!292083))

(declare-fun m!305969 () Bool)

(assert (=> b!292084 m!305969))

(declare-fun m!305971 () Bool)

(assert (=> b!292080 m!305971))

(declare-fun m!305973 () Bool)

(assert (=> b!292086 m!305973))

(declare-fun m!305975 () Bool)

(assert (=> b!292081 m!305975))

(declare-fun m!305977 () Bool)

(assert (=> b!292081 m!305977))

(declare-fun m!305979 () Bool)

(assert (=> b!292081 m!305979))

(declare-fun m!305981 () Bool)

(assert (=> b!292081 m!305981))

(declare-fun m!305983 () Bool)

(assert (=> b!292087 m!305983))

(declare-fun m!305985 () Bool)

(assert (=> b!292085 m!305985))

(declare-fun m!305987 () Bool)

(assert (=> start!28558 m!305987))

(declare-fun m!305989 () Bool)

(assert (=> start!28558 m!305989))

(check-sat (not start!28558) (not b!292081) (not b!292085) (not b!292084) (not b!292086) (not b!292087))
(check-sat)
