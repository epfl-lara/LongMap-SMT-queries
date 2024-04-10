; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28570 () Bool)

(assert start!28570)

(declare-fun b!292081 () Bool)

(declare-fun e!184808 () Bool)

(declare-fun e!184809 () Bool)

(assert (=> b!292081 (= e!184808 e!184809)))

(declare-fun res!153139 () Bool)

(assert (=> b!292081 (=> (not res!153139) (not e!184809))))

(declare-datatypes ((SeekEntryResult!2146 0))(
  ( (MissingZero!2146 (index!10754 (_ BitVec 32))) (Found!2146 (index!10755 (_ BitVec 32))) (Intermediate!2146 (undefined!2958 Bool) (index!10756 (_ BitVec 32)) (x!28945 (_ BitVec 32))) (Undefined!2146) (MissingVacant!2146 (index!10757 (_ BitVec 32))) )
))
(declare-fun lt!144547 () SeekEntryResult!2146)

(declare-fun lt!144542 () Bool)

(declare-datatypes ((array!14749 0))(
  ( (array!14750 (arr!6997 (Array (_ BitVec 32) (_ BitVec 64))) (size!7349 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14749)

(assert (=> b!292081 (= res!153139 (and (or lt!144542 (not (undefined!2958 lt!144547))) (not lt!144542) (= (select (arr!6997 a!3312) (index!10756 lt!144547)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292081 (= lt!144542 (not (is-Intermediate!2146 lt!144547)))))

(declare-fun res!153142 () Bool)

(declare-fun e!184810 () Bool)

(assert (=> start!28570 (=> (not res!153142) (not e!184810))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28570 (= res!153142 (validMask!0 mask!3809))))

(assert (=> start!28570 e!184810))

(assert (=> start!28570 true))

(declare-fun array_inv!4960 (array!14749) Bool)

(assert (=> start!28570 (array_inv!4960 a!3312)))

(declare-fun b!292082 () Bool)

(declare-fun res!153138 () Bool)

(assert (=> b!292082 (=> (not res!153138) (not e!184810))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292082 (= res!153138 (and (= (size!7349 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7349 a!3312))))))

(declare-fun b!292083 () Bool)

(declare-fun res!153141 () Bool)

(assert (=> b!292083 (=> (not res!153141) (not e!184810))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292083 (= res!153141 (validKeyInArray!0 k!2524))))

(declare-fun b!292084 () Bool)

(declare-fun e!184807 () Bool)

(assert (=> b!292084 (= e!184810 e!184807)))

(declare-fun res!153143 () Bool)

(assert (=> b!292084 (=> (not res!153143) (not e!184807))))

(declare-fun lt!144545 () Bool)

(declare-fun lt!144546 () SeekEntryResult!2146)

(assert (=> b!292084 (= res!153143 (or lt!144545 (= lt!144546 (MissingVacant!2146 i!1256))))))

(assert (=> b!292084 (= lt!144545 (= lt!144546 (MissingZero!2146 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14749 (_ BitVec 32)) SeekEntryResult!2146)

(assert (=> b!292084 (= lt!144546 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292085 () Bool)

(assert (=> b!292085 (= e!184809 (not true))))

(assert (=> b!292085 (= (index!10756 lt!144547) i!1256)))

(declare-fun b!292086 () Bool)

(declare-fun res!153140 () Bool)

(assert (=> b!292086 (=> (not res!153140) (not e!184810))))

(declare-fun arrayContainsKey!0 (array!14749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292086 (= res!153140 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292087 () Bool)

(assert (=> b!292087 (= e!184807 e!184808)))

(declare-fun res!153144 () Bool)

(assert (=> b!292087 (=> (not res!153144) (not e!184808))))

(assert (=> b!292087 (= res!153144 (and (not lt!144545) (= lt!144546 (MissingVacant!2146 i!1256))))))

(declare-fun lt!144543 () (_ BitVec 32))

(declare-fun lt!144544 () SeekEntryResult!2146)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14749 (_ BitVec 32)) SeekEntryResult!2146)

(assert (=> b!292087 (= lt!144544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144543 k!2524 (array!14750 (store (arr!6997 a!3312) i!1256 k!2524) (size!7349 a!3312)) mask!3809))))

(assert (=> b!292087 (= lt!144547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144543 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292087 (= lt!144543 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292088 () Bool)

(declare-fun res!153137 () Bool)

(assert (=> b!292088 (=> (not res!153137) (not e!184807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14749 (_ BitVec 32)) Bool)

(assert (=> b!292088 (= res!153137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28570 res!153142) b!292082))

(assert (= (and b!292082 res!153138) b!292083))

(assert (= (and b!292083 res!153141) b!292086))

(assert (= (and b!292086 res!153140) b!292084))

(assert (= (and b!292084 res!153143) b!292088))

(assert (= (and b!292088 res!153137) b!292087))

(assert (= (and b!292087 res!153144) b!292081))

(assert (= (and b!292081 res!153139) b!292085))

(declare-fun m!305807 () Bool)

(assert (=> b!292086 m!305807))

(declare-fun m!305809 () Bool)

(assert (=> b!292087 m!305809))

(declare-fun m!305811 () Bool)

(assert (=> b!292087 m!305811))

(declare-fun m!305813 () Bool)

(assert (=> b!292087 m!305813))

(declare-fun m!305815 () Bool)

(assert (=> b!292087 m!305815))

(declare-fun m!305817 () Bool)

(assert (=> start!28570 m!305817))

(declare-fun m!305819 () Bool)

(assert (=> start!28570 m!305819))

(declare-fun m!305821 () Bool)

(assert (=> b!292084 m!305821))

(declare-fun m!305823 () Bool)

(assert (=> b!292088 m!305823))

(declare-fun m!305825 () Bool)

(assert (=> b!292083 m!305825))

(declare-fun m!305827 () Bool)

(assert (=> b!292081 m!305827))

(push 1)

