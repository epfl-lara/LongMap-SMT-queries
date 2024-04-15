; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27998 () Bool)

(assert start!27998)

(declare-fun b!287139 () Bool)

(declare-fun res!149079 () Bool)

(declare-fun e!181869 () Bool)

(assert (=> b!287139 (=> (not res!149079) (not e!181869))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287139 (= res!149079 (validKeyInArray!0 k0!2524))))

(declare-fun b!287140 () Bool)

(declare-fun e!181868 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287140 (= e!181868 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!1976 0))(
  ( (MissingZero!1976 (index!10074 (_ BitVec 32))) (Found!1976 (index!10075 (_ BitVec 32))) (Intermediate!1976 (undefined!2788 Bool) (index!10076 (_ BitVec 32)) (x!28312 (_ BitVec 32))) (Undefined!1976) (MissingVacant!1976 (index!10077 (_ BitVec 32))) )
))
(declare-fun lt!141269 () SeekEntryResult!1976)

(declare-datatypes ((array!14395 0))(
  ( (array!14396 (arr!6828 (Array (_ BitVec 32) (_ BitVec 64))) (size!7181 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14395)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14395 (_ BitVec 32)) SeekEntryResult!1976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287140 (= lt!141269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!287141 () Bool)

(declare-fun res!149078 () Bool)

(assert (=> b!287141 (=> (not res!149078) (not e!181869))))

(declare-fun arrayContainsKey!0 (array!14395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287141 (= res!149078 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149082 () Bool)

(assert (=> start!27998 (=> (not res!149082) (not e!181869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27998 (= res!149082 (validMask!0 mask!3809))))

(assert (=> start!27998 e!181869))

(assert (=> start!27998 true))

(declare-fun array_inv!4800 (array!14395) Bool)

(assert (=> start!27998 (array_inv!4800 a!3312)))

(declare-fun b!287142 () Bool)

(declare-fun res!149083 () Bool)

(assert (=> b!287142 (=> (not res!149083) (not e!181869))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287142 (= res!149083 (and (= (size!7181 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7181 a!3312))))))

(declare-fun b!287143 () Bool)

(declare-fun res!149081 () Bool)

(assert (=> b!287143 (=> (not res!149081) (not e!181868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14395 (_ BitVec 32)) Bool)

(assert (=> b!287143 (= res!149081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287144 () Bool)

(assert (=> b!287144 (= e!181869 e!181868)))

(declare-fun res!149080 () Bool)

(assert (=> b!287144 (=> (not res!149080) (not e!181868))))

(declare-fun lt!141270 () SeekEntryResult!1976)

(assert (=> b!287144 (= res!149080 (or (= lt!141270 (MissingZero!1976 i!1256)) (= lt!141270 (MissingVacant!1976 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14395 (_ BitVec 32)) SeekEntryResult!1976)

(assert (=> b!287144 (= lt!141270 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!27998 res!149082) b!287142))

(assert (= (and b!287142 res!149083) b!287139))

(assert (= (and b!287139 res!149079) b!287141))

(assert (= (and b!287141 res!149078) b!287144))

(assert (= (and b!287144 res!149080) b!287143))

(assert (= (and b!287143 res!149081) b!287140))

(declare-fun m!301139 () Bool)

(assert (=> b!287139 m!301139))

(declare-fun m!301141 () Bool)

(assert (=> b!287144 m!301141))

(declare-fun m!301143 () Bool)

(assert (=> b!287140 m!301143))

(assert (=> b!287140 m!301143))

(declare-fun m!301145 () Bool)

(assert (=> b!287140 m!301145))

(declare-fun m!301147 () Bool)

(assert (=> b!287141 m!301147))

(declare-fun m!301149 () Bool)

(assert (=> b!287143 m!301149))

(declare-fun m!301151 () Bool)

(assert (=> start!27998 m!301151))

(declare-fun m!301153 () Bool)

(assert (=> start!27998 m!301153))

(check-sat (not b!287144) (not b!287139) (not b!287143) (not b!287140) (not start!27998) (not b!287141))
(check-sat)
