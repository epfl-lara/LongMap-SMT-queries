; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28414 () Bool)

(assert start!28414)

(declare-fun b!291072 () Bool)

(declare-fun res!152386 () Bool)

(declare-fun e!184179 () Bool)

(assert (=> b!291072 (=> (not res!152386) (not e!184179))))

(declare-datatypes ((array!14688 0))(
  ( (array!14689 (arr!6970 (Array (_ BitVec 32) (_ BitVec 64))) (size!7322 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14688)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291072 (= res!152386 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291073 () Bool)

(declare-fun res!152387 () Bool)

(assert (=> b!291073 (=> (not res!152387) (not e!184179))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291073 (= res!152387 (and (= (size!7322 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7322 a!3312))))))

(declare-fun b!291074 () Bool)

(declare-fun e!184181 () Bool)

(declare-fun e!184177 () Bool)

(assert (=> b!291074 (= e!184181 e!184177)))

(declare-fun res!152385 () Bool)

(assert (=> b!291074 (=> (not res!152385) (not e!184177))))

(declare-fun lt!143945 () Bool)

(declare-datatypes ((SeekEntryResult!2084 0))(
  ( (MissingZero!2084 (index!10506 (_ BitVec 32))) (Found!2084 (index!10507 (_ BitVec 32))) (Intermediate!2084 (undefined!2896 Bool) (index!10508 (_ BitVec 32)) (x!28807 (_ BitVec 32))) (Undefined!2084) (MissingVacant!2084 (index!10509 (_ BitVec 32))) )
))
(declare-fun lt!143943 () SeekEntryResult!2084)

(assert (=> b!291074 (= res!152385 (and (not lt!143945) (= lt!143943 (MissingVacant!2084 i!1256))))))

(declare-fun lt!143942 () (_ BitVec 32))

(declare-fun lt!143941 () SeekEntryResult!2084)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14688 (_ BitVec 32)) SeekEntryResult!2084)

(assert (=> b!291074 (= lt!143941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143942 k0!2524 (array!14689 (store (arr!6970 a!3312) i!1256 k0!2524) (size!7322 a!3312)) mask!3809))))

(declare-fun lt!143944 () SeekEntryResult!2084)

(assert (=> b!291074 (= lt!143944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143942 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291074 (= lt!143942 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291075 () Bool)

(declare-fun res!152389 () Bool)

(assert (=> b!291075 (=> (not res!152389) (not e!184181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14688 (_ BitVec 32)) Bool)

(assert (=> b!291075 (= res!152389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291076 () Bool)

(assert (=> b!291076 (= e!184179 e!184181)))

(declare-fun res!152390 () Bool)

(assert (=> b!291076 (=> (not res!152390) (not e!184181))))

(assert (=> b!291076 (= res!152390 (or lt!143945 (= lt!143943 (MissingVacant!2084 i!1256))))))

(assert (=> b!291076 (= lt!143945 (= lt!143943 (MissingZero!2084 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14688 (_ BitVec 32)) SeekEntryResult!2084)

(assert (=> b!291076 (= lt!143943 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291077 () Bool)

(declare-fun e!184180 () Bool)

(assert (=> b!291077 (= e!184180 (not true))))

(assert (=> b!291077 (= (index!10508 lt!143944) i!1256)))

(declare-fun res!152388 () Bool)

(assert (=> start!28414 (=> (not res!152388) (not e!184179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28414 (= res!152388 (validMask!0 mask!3809))))

(assert (=> start!28414 e!184179))

(assert (=> start!28414 true))

(declare-fun array_inv!4920 (array!14688) Bool)

(assert (=> start!28414 (array_inv!4920 a!3312)))

(declare-fun b!291078 () Bool)

(declare-fun res!152384 () Bool)

(assert (=> b!291078 (=> (not res!152384) (not e!184179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291078 (= res!152384 (validKeyInArray!0 k0!2524))))

(declare-fun b!291079 () Bool)

(assert (=> b!291079 (= e!184177 e!184180)))

(declare-fun res!152391 () Bool)

(assert (=> b!291079 (=> (not res!152391) (not e!184180))))

(declare-fun lt!143946 () Bool)

(assert (=> b!291079 (= res!152391 (and (or lt!143946 (not (undefined!2896 lt!143944))) (not lt!143946) (= (select (arr!6970 a!3312) (index!10508 lt!143944)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291079 (= lt!143946 (not ((_ is Intermediate!2084) lt!143944)))))

(assert (= (and start!28414 res!152388) b!291073))

(assert (= (and b!291073 res!152387) b!291078))

(assert (= (and b!291078 res!152384) b!291072))

(assert (= (and b!291072 res!152386) b!291076))

(assert (= (and b!291076 res!152390) b!291075))

(assert (= (and b!291075 res!152389) b!291074))

(assert (= (and b!291074 res!152385) b!291079))

(assert (= (and b!291079 res!152391) b!291077))

(declare-fun m!305201 () Bool)

(assert (=> b!291079 m!305201))

(declare-fun m!305203 () Bool)

(assert (=> b!291074 m!305203))

(declare-fun m!305205 () Bool)

(assert (=> b!291074 m!305205))

(declare-fun m!305207 () Bool)

(assert (=> b!291074 m!305207))

(declare-fun m!305209 () Bool)

(assert (=> b!291074 m!305209))

(declare-fun m!305211 () Bool)

(assert (=> b!291072 m!305211))

(declare-fun m!305213 () Bool)

(assert (=> b!291075 m!305213))

(declare-fun m!305215 () Bool)

(assert (=> start!28414 m!305215))

(declare-fun m!305217 () Bool)

(assert (=> start!28414 m!305217))

(declare-fun m!305219 () Bool)

(assert (=> b!291076 m!305219))

(declare-fun m!305221 () Bool)

(assert (=> b!291078 m!305221))

(check-sat (not start!28414) (not b!291074) (not b!291072) (not b!291078) (not b!291075) (not b!291076))
(check-sat)
