; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28572 () Bool)

(assert start!28572)

(declare-fun b!292105 () Bool)

(declare-fun res!153166 () Bool)

(declare-fun e!184826 () Bool)

(assert (=> b!292105 (=> (not res!153166) (not e!184826))))

(declare-datatypes ((array!14751 0))(
  ( (array!14752 (arr!6998 (Array (_ BitVec 32) (_ BitVec 64))) (size!7350 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14751)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292105 (= res!153166 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292106 () Bool)

(declare-fun e!184825 () Bool)

(assert (=> b!292106 (= e!184825 (not true))))

(declare-datatypes ((Unit!9156 0))(
  ( (Unit!9157) )
))
(declare-fun lt!144568 () Unit!9156)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144563 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2147 0))(
  ( (MissingZero!2147 (index!10758 (_ BitVec 32))) (Found!2147 (index!10759 (_ BitVec 32))) (Intermediate!2147 (undefined!2959 Bool) (index!10760 (_ BitVec 32)) (x!28954 (_ BitVec 32))) (Undefined!2147) (MissingVacant!2147 (index!10761 (_ BitVec 32))) )
))
(declare-fun lt!144565 () SeekEntryResult!2147)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14751 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9156)

(assert (=> b!292106 (= lt!144568 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!144563 (index!10760 lt!144565) (x!28954 lt!144565) mask!3809))))

(assert (=> b!292106 (= (index!10760 lt!144565) i!1256)))

(declare-fun b!292107 () Bool)

(declare-fun e!184823 () Bool)

(assert (=> b!292107 (= e!184823 e!184825)))

(declare-fun res!153163 () Bool)

(assert (=> b!292107 (=> (not res!153163) (not e!184825))))

(declare-fun lt!144567 () Bool)

(assert (=> b!292107 (= res!153163 (and (or lt!144567 (not (undefined!2959 lt!144565))) (not lt!144567) (= (select (arr!6998 a!3312) (index!10760 lt!144565)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292107 (= lt!144567 (not (is-Intermediate!2147 lt!144565)))))

(declare-fun b!292108 () Bool)

(declare-fun res!153167 () Bool)

(declare-fun e!184822 () Bool)

(assert (=> b!292108 (=> (not res!153167) (not e!184822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14751 (_ BitVec 32)) Bool)

(assert (=> b!292108 (= res!153167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292109 () Bool)

(declare-fun res!153164 () Bool)

(assert (=> b!292109 (=> (not res!153164) (not e!184826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292109 (= res!153164 (validKeyInArray!0 k!2524))))

(declare-fun b!292110 () Bool)

(assert (=> b!292110 (= e!184826 e!184822)))

(declare-fun res!153168 () Bool)

(assert (=> b!292110 (=> (not res!153168) (not e!184822))))

(declare-fun lt!144566 () SeekEntryResult!2147)

(declare-fun lt!144564 () Bool)

(assert (=> b!292110 (= res!153168 (or lt!144564 (= lt!144566 (MissingVacant!2147 i!1256))))))

(assert (=> b!292110 (= lt!144564 (= lt!144566 (MissingZero!2147 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14751 (_ BitVec 32)) SeekEntryResult!2147)

(assert (=> b!292110 (= lt!144566 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292111 () Bool)

(declare-fun res!153161 () Bool)

(assert (=> b!292111 (=> (not res!153161) (not e!184826))))

(assert (=> b!292111 (= res!153161 (and (= (size!7350 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7350 a!3312))))))

(declare-fun b!292112 () Bool)

(assert (=> b!292112 (= e!184822 e!184823)))

(declare-fun res!153165 () Bool)

(assert (=> b!292112 (=> (not res!153165) (not e!184823))))

(assert (=> b!292112 (= res!153165 (and (not lt!144564) (= lt!144566 (MissingVacant!2147 i!1256))))))

(declare-fun lt!144562 () SeekEntryResult!2147)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14751 (_ BitVec 32)) SeekEntryResult!2147)

(assert (=> b!292112 (= lt!144562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144563 k!2524 (array!14752 (store (arr!6998 a!3312) i!1256 k!2524) (size!7350 a!3312)) mask!3809))))

(assert (=> b!292112 (= lt!144565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144563 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292112 (= lt!144563 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!153162 () Bool)

(assert (=> start!28572 (=> (not res!153162) (not e!184826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28572 (= res!153162 (validMask!0 mask!3809))))

(assert (=> start!28572 e!184826))

(assert (=> start!28572 true))

(declare-fun array_inv!4961 (array!14751) Bool)

(assert (=> start!28572 (array_inv!4961 a!3312)))

(assert (= (and start!28572 res!153162) b!292111))

(assert (= (and b!292111 res!153161) b!292109))

(assert (= (and b!292109 res!153164) b!292105))

(assert (= (and b!292105 res!153166) b!292110))

(assert (= (and b!292110 res!153168) b!292108))

(assert (= (and b!292108 res!153167) b!292112))

(assert (= (and b!292112 res!153165) b!292107))

(assert (= (and b!292107 res!153163) b!292106))

(declare-fun m!305829 () Bool)

(assert (=> b!292112 m!305829))

(declare-fun m!305831 () Bool)

(assert (=> b!292112 m!305831))

(declare-fun m!305833 () Bool)

(assert (=> b!292112 m!305833))

(declare-fun m!305835 () Bool)

(assert (=> b!292112 m!305835))

(declare-fun m!305837 () Bool)

(assert (=> b!292105 m!305837))

(declare-fun m!305839 () Bool)

(assert (=> start!28572 m!305839))

(declare-fun m!305841 () Bool)

(assert (=> start!28572 m!305841))

(declare-fun m!305843 () Bool)

(assert (=> b!292108 m!305843))

(declare-fun m!305845 () Bool)

(assert (=> b!292110 m!305845))

(declare-fun m!305847 () Bool)

(assert (=> b!292107 m!305847))

(declare-fun m!305849 () Bool)

(assert (=> b!292106 m!305849))

(declare-fun m!305851 () Bool)

(assert (=> b!292109 m!305851))

(push 1)

