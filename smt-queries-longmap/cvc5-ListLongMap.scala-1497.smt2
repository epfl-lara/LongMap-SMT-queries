; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28416 () Bool)

(assert start!28416)

(declare-fun b!290953 () Bool)

(declare-fun res!152296 () Bool)

(declare-fun e!184108 () Bool)

(assert (=> b!290953 (=> (not res!152296) (not e!184108))))

(declare-datatypes ((array!14685 0))(
  ( (array!14686 (arr!6968 (Array (_ BitVec 32) (_ BitVec 64))) (size!7320 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14685)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290953 (= res!152296 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152292 () Bool)

(assert (=> start!28416 (=> (not res!152292) (not e!184108))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28416 (= res!152292 (validMask!0 mask!3809))))

(assert (=> start!28416 e!184108))

(assert (=> start!28416 true))

(declare-fun array_inv!4931 (array!14685) Bool)

(assert (=> start!28416 (array_inv!4931 a!3312)))

(declare-fun b!290954 () Bool)

(declare-fun res!152295 () Bool)

(assert (=> b!290954 (=> (not res!152295) (not e!184108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290954 (= res!152295 (validKeyInArray!0 k!2524))))

(declare-fun b!290955 () Bool)

(declare-fun e!184111 () Bool)

(declare-fun e!184112 () Bool)

(assert (=> b!290955 (= e!184111 e!184112)))

(declare-fun res!152293 () Bool)

(assert (=> b!290955 (=> (not res!152293) (not e!184112))))

(declare-datatypes ((SeekEntryResult!2117 0))(
  ( (MissingZero!2117 (index!10638 (_ BitVec 32))) (Found!2117 (index!10639 (_ BitVec 32))) (Intermediate!2117 (undefined!2929 Bool) (index!10640 (_ BitVec 32)) (x!28832 (_ BitVec 32))) (Undefined!2117) (MissingVacant!2117 (index!10641 (_ BitVec 32))) )
))
(declare-fun lt!143833 () SeekEntryResult!2117)

(declare-fun lt!143829 () Bool)

(assert (=> b!290955 (= res!152293 (and (or lt!143829 (not (undefined!2929 lt!143833))) (not lt!143829) (= (select (arr!6968 a!3312) (index!10640 lt!143833)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290955 (= lt!143829 (not (is-Intermediate!2117 lt!143833)))))

(declare-fun b!290956 () Bool)

(declare-fun e!184110 () Bool)

(assert (=> b!290956 (= e!184108 e!184110)))

(declare-fun res!152298 () Bool)

(assert (=> b!290956 (=> (not res!152298) (not e!184110))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143828 () Bool)

(declare-fun lt!143830 () SeekEntryResult!2117)

(assert (=> b!290956 (= res!152298 (or lt!143828 (= lt!143830 (MissingVacant!2117 i!1256))))))

(assert (=> b!290956 (= lt!143828 (= lt!143830 (MissingZero!2117 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14685 (_ BitVec 32)) SeekEntryResult!2117)

(assert (=> b!290956 (= lt!143830 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290957 () Bool)

(assert (=> b!290957 (= e!184110 e!184111)))

(declare-fun res!152297 () Bool)

(assert (=> b!290957 (=> (not res!152297) (not e!184111))))

(assert (=> b!290957 (= res!152297 (and (not lt!143828) (= lt!143830 (MissingVacant!2117 i!1256))))))

(declare-fun lt!143831 () SeekEntryResult!2117)

(declare-fun lt!143832 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14685 (_ BitVec 32)) SeekEntryResult!2117)

(assert (=> b!290957 (= lt!143831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143832 k!2524 (array!14686 (store (arr!6968 a!3312) i!1256 k!2524) (size!7320 a!3312)) mask!3809))))

(assert (=> b!290957 (= lt!143833 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143832 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290957 (= lt!143832 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290958 () Bool)

(declare-fun res!152294 () Bool)

(assert (=> b!290958 (=> (not res!152294) (not e!184108))))

(assert (=> b!290958 (= res!152294 (and (= (size!7320 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7320 a!3312))))))

(declare-fun b!290959 () Bool)

(assert (=> b!290959 (= e!184112 (not true))))

(assert (=> b!290959 (= (index!10640 lt!143833) i!1256)))

(declare-fun b!290960 () Bool)

(declare-fun res!152291 () Bool)

(assert (=> b!290960 (=> (not res!152291) (not e!184110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14685 (_ BitVec 32)) Bool)

(assert (=> b!290960 (= res!152291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28416 res!152292) b!290958))

(assert (= (and b!290958 res!152294) b!290954))

(assert (= (and b!290954 res!152295) b!290953))

(assert (= (and b!290953 res!152296) b!290956))

(assert (= (and b!290956 res!152298) b!290960))

(assert (= (and b!290960 res!152291) b!290957))

(assert (= (and b!290957 res!152297) b!290955))

(assert (= (and b!290955 res!152293) b!290959))

(declare-fun m!304929 () Bool)

(assert (=> b!290957 m!304929))

(declare-fun m!304931 () Bool)

(assert (=> b!290957 m!304931))

(declare-fun m!304933 () Bool)

(assert (=> b!290957 m!304933))

(declare-fun m!304935 () Bool)

(assert (=> b!290957 m!304935))

(declare-fun m!304937 () Bool)

(assert (=> b!290953 m!304937))

(declare-fun m!304939 () Bool)

(assert (=> b!290960 m!304939))

(declare-fun m!304941 () Bool)

(assert (=> start!28416 m!304941))

(declare-fun m!304943 () Bool)

(assert (=> start!28416 m!304943))

(declare-fun m!304945 () Bool)

(assert (=> b!290955 m!304945))

(declare-fun m!304947 () Bool)

(assert (=> b!290956 m!304947))

(declare-fun m!304949 () Bool)

(assert (=> b!290954 m!304949))

(push 1)

