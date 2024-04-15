; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27992 () Bool)

(assert start!27992)

(declare-fun b!287085 () Bool)

(declare-fun e!181841 () Bool)

(declare-fun e!181840 () Bool)

(assert (=> b!287085 (= e!181841 e!181840)))

(declare-fun res!149028 () Bool)

(assert (=> b!287085 (=> (not res!149028) (not e!181840))))

(declare-datatypes ((SeekEntryResult!1973 0))(
  ( (MissingZero!1973 (index!10062 (_ BitVec 32))) (Found!1973 (index!10063 (_ BitVec 32))) (Intermediate!1973 (undefined!2785 Bool) (index!10064 (_ BitVec 32)) (x!28301 (_ BitVec 32))) (Undefined!1973) (MissingVacant!1973 (index!10065 (_ BitVec 32))) )
))
(declare-fun lt!141252 () SeekEntryResult!1973)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287085 (= res!149028 (or (= lt!141252 (MissingZero!1973 i!1256)) (= lt!141252 (MissingVacant!1973 i!1256))))))

(declare-datatypes ((array!14389 0))(
  ( (array!14390 (arr!6825 (Array (_ BitVec 32) (_ BitVec 64))) (size!7178 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14389)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14389 (_ BitVec 32)) SeekEntryResult!1973)

(assert (=> b!287085 (= lt!141252 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287086 () Bool)

(declare-fun res!149027 () Bool)

(assert (=> b!287086 (=> (not res!149027) (not e!181841))))

(declare-fun arrayContainsKey!0 (array!14389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287086 (= res!149027 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287087 () Bool)

(declare-fun res!149025 () Bool)

(assert (=> b!287087 (=> (not res!149025) (not e!181841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287087 (= res!149025 (validKeyInArray!0 k0!2524))))

(declare-fun b!287088 () Bool)

(declare-fun res!149029 () Bool)

(assert (=> b!287088 (=> (not res!149029) (not e!181841))))

(assert (=> b!287088 (= res!149029 (and (= (size!7178 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7178 a!3312))))))

(declare-fun b!287089 () Bool)

(assert (=> b!287089 (= e!181840 false)))

(declare-fun lt!141251 () SeekEntryResult!1973)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14389 (_ BitVec 32)) SeekEntryResult!1973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287089 (= lt!141251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun res!149026 () Bool)

(assert (=> start!27992 (=> (not res!149026) (not e!181841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27992 (= res!149026 (validMask!0 mask!3809))))

(assert (=> start!27992 e!181841))

(assert (=> start!27992 true))

(declare-fun array_inv!4797 (array!14389) Bool)

(assert (=> start!27992 (array_inv!4797 a!3312)))

(declare-fun b!287090 () Bool)

(declare-fun res!149024 () Bool)

(assert (=> b!287090 (=> (not res!149024) (not e!181840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14389 (_ BitVec 32)) Bool)

(assert (=> b!287090 (= res!149024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!27992 res!149026) b!287088))

(assert (= (and b!287088 res!149029) b!287087))

(assert (= (and b!287087 res!149025) b!287086))

(assert (= (and b!287086 res!149027) b!287085))

(assert (= (and b!287085 res!149028) b!287090))

(assert (= (and b!287090 res!149024) b!287089))

(declare-fun m!301091 () Bool)

(assert (=> b!287086 m!301091))

(declare-fun m!301093 () Bool)

(assert (=> b!287085 m!301093))

(declare-fun m!301095 () Bool)

(assert (=> b!287087 m!301095))

(declare-fun m!301097 () Bool)

(assert (=> b!287090 m!301097))

(declare-fun m!301099 () Bool)

(assert (=> b!287089 m!301099))

(assert (=> b!287089 m!301099))

(declare-fun m!301101 () Bool)

(assert (=> b!287089 m!301101))

(declare-fun m!301103 () Bool)

(assert (=> start!27992 m!301103))

(declare-fun m!301105 () Bool)

(assert (=> start!27992 m!301105))

(check-sat (not b!287086) (not start!27992) (not b!287085) (not b!287089) (not b!287087) (not b!287090))
(check-sat)
