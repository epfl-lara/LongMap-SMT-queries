; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28430 () Bool)

(assert start!28430)

(declare-fun b!291121 () Bool)

(declare-fun e!184213 () Bool)

(declare-fun e!184216 () Bool)

(assert (=> b!291121 (= e!184213 e!184216)))

(declare-fun res!152465 () Bool)

(assert (=> b!291121 (=> (not res!152465) (not e!184216))))

(declare-fun lt!143957 () Bool)

(declare-datatypes ((SeekEntryResult!2124 0))(
  ( (MissingZero!2124 (index!10666 (_ BitVec 32))) (Found!2124 (index!10667 (_ BitVec 32))) (Intermediate!2124 (undefined!2936 Bool) (index!10668 (_ BitVec 32)) (x!28855 (_ BitVec 32))) (Undefined!2124) (MissingVacant!2124 (index!10669 (_ BitVec 32))) )
))
(declare-fun lt!143958 () SeekEntryResult!2124)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291121 (= res!152465 (and (not lt!143957) (= lt!143958 (MissingVacant!2124 i!1256))))))

(declare-fun lt!143959 () (_ BitVec 32))

(declare-fun lt!143955 () SeekEntryResult!2124)

(declare-datatypes ((array!14699 0))(
  ( (array!14700 (arr!6975 (Array (_ BitVec 32) (_ BitVec 64))) (size!7327 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14699)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14699 (_ BitVec 32)) SeekEntryResult!2124)

(assert (=> b!291121 (= lt!143955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143959 k0!2524 (array!14700 (store (arr!6975 a!3312) i!1256 k0!2524) (size!7327 a!3312)) mask!3809))))

(declare-fun lt!143954 () SeekEntryResult!2124)

(assert (=> b!291121 (= lt!143954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143959 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291121 (= lt!143959 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291123 () Bool)

(declare-fun e!184215 () Bool)

(assert (=> b!291123 (= e!184215 (not true))))

(assert (=> b!291123 (= (index!10668 lt!143954) i!1256)))

(declare-fun b!291124 () Bool)

(declare-fun res!152466 () Bool)

(declare-fun e!184214 () Bool)

(assert (=> b!291124 (=> (not res!152466) (not e!184214))))

(assert (=> b!291124 (= res!152466 (and (= (size!7327 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7327 a!3312))))))

(declare-fun b!291125 () Bool)

(declare-fun res!152464 () Bool)

(assert (=> b!291125 (=> (not res!152464) (not e!184214))))

(declare-fun arrayContainsKey!0 (array!14699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291125 (= res!152464 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291126 () Bool)

(assert (=> b!291126 (= e!184214 e!184213)))

(declare-fun res!152460 () Bool)

(assert (=> b!291126 (=> (not res!152460) (not e!184213))))

(assert (=> b!291126 (= res!152460 (or lt!143957 (= lt!143958 (MissingVacant!2124 i!1256))))))

(assert (=> b!291126 (= lt!143957 (= lt!143958 (MissingZero!2124 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14699 (_ BitVec 32)) SeekEntryResult!2124)

(assert (=> b!291126 (= lt!143958 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291127 () Bool)

(assert (=> b!291127 (= e!184216 e!184215)))

(declare-fun res!152459 () Bool)

(assert (=> b!291127 (=> (not res!152459) (not e!184215))))

(declare-fun lt!143956 () Bool)

(assert (=> b!291127 (= res!152459 (and (or lt!143956 (not (undefined!2936 lt!143954))) (not lt!143956) (= (select (arr!6975 a!3312) (index!10668 lt!143954)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291127 (= lt!143956 (not ((_ is Intermediate!2124) lt!143954)))))

(declare-fun b!291128 () Bool)

(declare-fun res!152463 () Bool)

(assert (=> b!291128 (=> (not res!152463) (not e!184214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291128 (= res!152463 (validKeyInArray!0 k0!2524))))

(declare-fun b!291122 () Bool)

(declare-fun res!152462 () Bool)

(assert (=> b!291122 (=> (not res!152462) (not e!184213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14699 (_ BitVec 32)) Bool)

(assert (=> b!291122 (= res!152462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152461 () Bool)

(assert (=> start!28430 (=> (not res!152461) (not e!184214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28430 (= res!152461 (validMask!0 mask!3809))))

(assert (=> start!28430 e!184214))

(assert (=> start!28430 true))

(declare-fun array_inv!4938 (array!14699) Bool)

(assert (=> start!28430 (array_inv!4938 a!3312)))

(assert (= (and start!28430 res!152461) b!291124))

(assert (= (and b!291124 res!152466) b!291128))

(assert (= (and b!291128 res!152463) b!291125))

(assert (= (and b!291125 res!152464) b!291126))

(assert (= (and b!291126 res!152460) b!291122))

(assert (= (and b!291122 res!152462) b!291121))

(assert (= (and b!291121 res!152465) b!291127))

(assert (= (and b!291127 res!152459) b!291123))

(declare-fun m!305083 () Bool)

(assert (=> b!291121 m!305083))

(declare-fun m!305085 () Bool)

(assert (=> b!291121 m!305085))

(declare-fun m!305087 () Bool)

(assert (=> b!291121 m!305087))

(declare-fun m!305089 () Bool)

(assert (=> b!291121 m!305089))

(declare-fun m!305091 () Bool)

(assert (=> start!28430 m!305091))

(declare-fun m!305093 () Bool)

(assert (=> start!28430 m!305093))

(declare-fun m!305095 () Bool)

(assert (=> b!291122 m!305095))

(declare-fun m!305097 () Bool)

(assert (=> b!291125 m!305097))

(declare-fun m!305099 () Bool)

(assert (=> b!291128 m!305099))

(declare-fun m!305101 () Bool)

(assert (=> b!291127 m!305101))

(declare-fun m!305103 () Bool)

(assert (=> b!291126 m!305103))

(check-sat (not b!291125) (not b!291121) (not b!291128) (not start!28430) (not b!291122) (not b!291126))
(check-sat)
