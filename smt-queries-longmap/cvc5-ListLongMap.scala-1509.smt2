; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28584 () Bool)

(assert start!28584)

(declare-fun b!292249 () Bool)

(declare-fun res!153306 () Bool)

(declare-fun e!184913 () Bool)

(assert (=> b!292249 (=> (not res!153306) (not e!184913))))

(declare-datatypes ((array!14763 0))(
  ( (array!14764 (arr!7004 (Array (_ BitVec 32) (_ BitVec 64))) (size!7356 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14763)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292249 (= res!153306 (and (= (size!7356 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7356 a!3312))))))

(declare-fun b!292250 () Bool)

(declare-fun e!184916 () Bool)

(assert (=> b!292250 (= e!184916 (not true))))

(declare-fun lt!144688 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2153 0))(
  ( (MissingZero!2153 (index!10782 (_ BitVec 32))) (Found!2153 (index!10783 (_ BitVec 32))) (Intermediate!2153 (undefined!2965 Bool) (index!10784 (_ BitVec 32)) (x!28976 (_ BitVec 32))) (Undefined!2153) (MissingVacant!2153 (index!10785 (_ BitVec 32))) )
))
(declare-fun lt!144689 () SeekEntryResult!2153)

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((Unit!9168 0))(
  ( (Unit!9169) )
))
(declare-fun lt!144693 () Unit!9168)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9168)

(assert (=> b!292250 (= lt!144693 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!144688 (index!10784 lt!144689) (x!28976 lt!144689) mask!3809))))

(assert (=> b!292250 (= (index!10784 lt!144689) i!1256)))

(declare-fun res!153307 () Bool)

(assert (=> start!28584 (=> (not res!153307) (not e!184913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28584 (= res!153307 (validMask!0 mask!3809))))

(assert (=> start!28584 e!184913))

(assert (=> start!28584 true))

(declare-fun array_inv!4967 (array!14763) Bool)

(assert (=> start!28584 (array_inv!4967 a!3312)))

(declare-fun b!292251 () Bool)

(declare-fun e!184914 () Bool)

(declare-fun e!184912 () Bool)

(assert (=> b!292251 (= e!184914 e!184912)))

(declare-fun res!153308 () Bool)

(assert (=> b!292251 (=> (not res!153308) (not e!184912))))

(declare-fun lt!144691 () Bool)

(declare-fun lt!144692 () SeekEntryResult!2153)

(assert (=> b!292251 (= res!153308 (and (not lt!144691) (= lt!144692 (MissingVacant!2153 i!1256))))))

(declare-fun lt!144690 () SeekEntryResult!2153)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14763 (_ BitVec 32)) SeekEntryResult!2153)

(assert (=> b!292251 (= lt!144690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144688 k!2524 (array!14764 (store (arr!7004 a!3312) i!1256 k!2524) (size!7356 a!3312)) mask!3809))))

(assert (=> b!292251 (= lt!144689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144688 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292251 (= lt!144688 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292252 () Bool)

(declare-fun res!153305 () Bool)

(assert (=> b!292252 (=> (not res!153305) (not e!184913))))

(declare-fun arrayContainsKey!0 (array!14763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292252 (= res!153305 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292253 () Bool)

(declare-fun res!153309 () Bool)

(assert (=> b!292253 (=> (not res!153309) (not e!184914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14763 (_ BitVec 32)) Bool)

(assert (=> b!292253 (= res!153309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292254 () Bool)

(assert (=> b!292254 (= e!184912 e!184916)))

(declare-fun res!153312 () Bool)

(assert (=> b!292254 (=> (not res!153312) (not e!184916))))

(declare-fun lt!144694 () Bool)

(assert (=> b!292254 (= res!153312 (and (or lt!144694 (not (undefined!2965 lt!144689))) (not lt!144694) (= (select (arr!7004 a!3312) (index!10784 lt!144689)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292254 (= lt!144694 (not (is-Intermediate!2153 lt!144689)))))

(declare-fun b!292255 () Bool)

(declare-fun res!153310 () Bool)

(assert (=> b!292255 (=> (not res!153310) (not e!184913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292255 (= res!153310 (validKeyInArray!0 k!2524))))

(declare-fun b!292256 () Bool)

(assert (=> b!292256 (= e!184913 e!184914)))

(declare-fun res!153311 () Bool)

(assert (=> b!292256 (=> (not res!153311) (not e!184914))))

(assert (=> b!292256 (= res!153311 (or lt!144691 (= lt!144692 (MissingVacant!2153 i!1256))))))

(assert (=> b!292256 (= lt!144691 (= lt!144692 (MissingZero!2153 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14763 (_ BitVec 32)) SeekEntryResult!2153)

(assert (=> b!292256 (= lt!144692 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28584 res!153307) b!292249))

(assert (= (and b!292249 res!153306) b!292255))

(assert (= (and b!292255 res!153310) b!292252))

(assert (= (and b!292252 res!153305) b!292256))

(assert (= (and b!292256 res!153311) b!292253))

(assert (= (and b!292253 res!153309) b!292251))

(assert (= (and b!292251 res!153308) b!292254))

(assert (= (and b!292254 res!153312) b!292250))

(declare-fun m!305973 () Bool)

(assert (=> b!292253 m!305973))

(declare-fun m!305975 () Bool)

(assert (=> b!292251 m!305975))

(declare-fun m!305977 () Bool)

(assert (=> b!292251 m!305977))

(declare-fun m!305979 () Bool)

(assert (=> b!292251 m!305979))

(declare-fun m!305981 () Bool)

(assert (=> b!292251 m!305981))

(declare-fun m!305983 () Bool)

(assert (=> b!292256 m!305983))

(declare-fun m!305985 () Bool)

(assert (=> b!292250 m!305985))

(declare-fun m!305987 () Bool)

(assert (=> b!292252 m!305987))

(declare-fun m!305989 () Bool)

(assert (=> b!292254 m!305989))

(declare-fun m!305991 () Bool)

(assert (=> start!28584 m!305991))

(declare-fun m!305993 () Bool)

(assert (=> start!28584 m!305993))

(declare-fun m!305995 () Bool)

(assert (=> b!292255 m!305995))

(push 1)

