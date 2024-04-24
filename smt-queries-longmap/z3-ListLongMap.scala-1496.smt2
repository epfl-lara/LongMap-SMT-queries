; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28402 () Bool)

(assert start!28402)

(declare-fun b!290928 () Bool)

(declare-fun e!184091 () Bool)

(declare-fun e!184087 () Bool)

(assert (=> b!290928 (= e!184091 e!184087)))

(declare-fun res!152240 () Bool)

(assert (=> b!290928 (=> (not res!152240) (not e!184087))))

(declare-datatypes ((SeekEntryResult!2078 0))(
  ( (MissingZero!2078 (index!10482 (_ BitVec 32))) (Found!2078 (index!10483 (_ BitVec 32))) (Intermediate!2078 (undefined!2890 Bool) (index!10484 (_ BitVec 32)) (x!28785 (_ BitVec 32))) (Undefined!2078) (MissingVacant!2078 (index!10485 (_ BitVec 32))) )
))
(declare-fun lt!143835 () SeekEntryResult!2078)

(declare-datatypes ((array!14676 0))(
  ( (array!14677 (arr!6964 (Array (_ BitVec 32) (_ BitVec 64))) (size!7316 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14676)

(declare-fun lt!143834 () Bool)

(assert (=> b!290928 (= res!152240 (and (or lt!143834 (not (undefined!2890 lt!143835))) (not lt!143834) (= (select (arr!6964 a!3312) (index!10484 lt!143835)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290928 (= lt!143834 (not ((_ is Intermediate!2078) lt!143835)))))

(declare-fun b!290929 () Bool)

(declare-fun e!184088 () Bool)

(assert (=> b!290929 (= e!184088 e!184091)))

(declare-fun res!152241 () Bool)

(assert (=> b!290929 (=> (not res!152241) (not e!184091))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143836 () Bool)

(declare-fun lt!143838 () SeekEntryResult!2078)

(assert (=> b!290929 (= res!152241 (and (not lt!143836) (= lt!143838 (MissingVacant!2078 i!1256))))))

(declare-fun lt!143833 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!143837 () SeekEntryResult!2078)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14676 (_ BitVec 32)) SeekEntryResult!2078)

(assert (=> b!290929 (= lt!143837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143833 k0!2524 (array!14677 (store (arr!6964 a!3312) i!1256 k0!2524) (size!7316 a!3312)) mask!3809))))

(assert (=> b!290929 (= lt!143835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143833 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290929 (= lt!143833 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290930 () Bool)

(declare-fun res!152246 () Bool)

(declare-fun e!184089 () Bool)

(assert (=> b!290930 (=> (not res!152246) (not e!184089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290930 (= res!152246 (validKeyInArray!0 k0!2524))))

(declare-fun b!290932 () Bool)

(declare-fun res!152247 () Bool)

(assert (=> b!290932 (=> (not res!152247) (not e!184089))))

(assert (=> b!290932 (= res!152247 (and (= (size!7316 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7316 a!3312))))))

(declare-fun b!290933 () Bool)

(declare-fun res!152243 () Bool)

(assert (=> b!290933 (=> (not res!152243) (not e!184088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14676 (_ BitVec 32)) Bool)

(assert (=> b!290933 (= res!152243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152245 () Bool)

(assert (=> start!28402 (=> (not res!152245) (not e!184089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28402 (= res!152245 (validMask!0 mask!3809))))

(assert (=> start!28402 e!184089))

(assert (=> start!28402 true))

(declare-fun array_inv!4914 (array!14676) Bool)

(assert (=> start!28402 (array_inv!4914 a!3312)))

(declare-fun b!290931 () Bool)

(declare-fun res!152244 () Bool)

(assert (=> b!290931 (=> (not res!152244) (not e!184089))))

(declare-fun arrayContainsKey!0 (array!14676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290931 (= res!152244 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290934 () Bool)

(assert (=> b!290934 (= e!184087 (not true))))

(assert (=> b!290934 (= (index!10484 lt!143835) i!1256)))

(declare-fun b!290935 () Bool)

(assert (=> b!290935 (= e!184089 e!184088)))

(declare-fun res!152242 () Bool)

(assert (=> b!290935 (=> (not res!152242) (not e!184088))))

(assert (=> b!290935 (= res!152242 (or lt!143836 (= lt!143838 (MissingVacant!2078 i!1256))))))

(assert (=> b!290935 (= lt!143836 (= lt!143838 (MissingZero!2078 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14676 (_ BitVec 32)) SeekEntryResult!2078)

(assert (=> b!290935 (= lt!143838 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28402 res!152245) b!290932))

(assert (= (and b!290932 res!152247) b!290930))

(assert (= (and b!290930 res!152246) b!290931))

(assert (= (and b!290931 res!152244) b!290935))

(assert (= (and b!290935 res!152242) b!290933))

(assert (= (and b!290933 res!152243) b!290929))

(assert (= (and b!290929 res!152241) b!290928))

(assert (= (and b!290928 res!152240) b!290934))

(declare-fun m!305069 () Bool)

(assert (=> start!28402 m!305069))

(declare-fun m!305071 () Bool)

(assert (=> start!28402 m!305071))

(declare-fun m!305073 () Bool)

(assert (=> b!290935 m!305073))

(declare-fun m!305075 () Bool)

(assert (=> b!290930 m!305075))

(declare-fun m!305077 () Bool)

(assert (=> b!290928 m!305077))

(declare-fun m!305079 () Bool)

(assert (=> b!290931 m!305079))

(declare-fun m!305081 () Bool)

(assert (=> b!290929 m!305081))

(declare-fun m!305083 () Bool)

(assert (=> b!290929 m!305083))

(declare-fun m!305085 () Bool)

(assert (=> b!290929 m!305085))

(declare-fun m!305087 () Bool)

(assert (=> b!290929 m!305087))

(declare-fun m!305089 () Bool)

(assert (=> b!290933 m!305089))

(check-sat (not start!28402) (not b!290929) (not b!290933) (not b!290931) (not b!290935) (not b!290930))
(check-sat)
