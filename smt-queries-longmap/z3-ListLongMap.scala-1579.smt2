; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30026 () Bool)

(assert start!30026)

(declare-fun b!301266 () Bool)

(declare-fun res!159017 () Bool)

(declare-fun e!190158 () Bool)

(assert (=> b!301266 (=> (not res!159017) (not e!190158))))

(declare-datatypes ((array!15246 0))(
  ( (array!15247 (arr!7215 (Array (_ BitVec 32) (_ BitVec 64))) (size!7567 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15246)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2355 0))(
  ( (MissingZero!2355 (index!11596 (_ BitVec 32))) (Found!2355 (index!11597 (_ BitVec 32))) (Intermediate!2355 (undefined!3167 Bool) (index!11598 (_ BitVec 32)) (x!29875 (_ BitVec 32))) (Undefined!2355) (MissingVacant!2355 (index!11599 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15246 (_ BitVec 32)) SeekEntryResult!2355)

(assert (=> b!301266 (= res!159017 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2355 i!1240)))))

(declare-fun b!301267 () Bool)

(declare-fun res!159021 () Bool)

(assert (=> b!301267 (=> (not res!159021) (not e!190158))))

(assert (=> b!301267 (= res!159021 (and (= (size!7567 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7567 a!3293))))))

(declare-fun b!301268 () Bool)

(declare-fun res!159018 () Bool)

(assert (=> b!301268 (=> (not res!159018) (not e!190158))))

(declare-fun arrayContainsKey!0 (array!15246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301268 (= res!159018 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301269 () Bool)

(assert (=> b!301269 (= e!190158 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun b!301270 () Bool)

(declare-fun res!159020 () Bool)

(assert (=> b!301270 (=> (not res!159020) (not e!190158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301270 (= res!159020 (validKeyInArray!0 k0!2441))))

(declare-fun res!159016 () Bool)

(assert (=> start!30026 (=> (not res!159016) (not e!190158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30026 (= res!159016 (validMask!0 mask!3709))))

(assert (=> start!30026 e!190158))

(assert (=> start!30026 true))

(declare-fun array_inv!5178 (array!15246) Bool)

(assert (=> start!30026 (array_inv!5178 a!3293)))

(declare-fun b!301271 () Bool)

(declare-fun res!159019 () Bool)

(assert (=> b!301271 (=> (not res!159019) (not e!190158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15246 (_ BitVec 32)) Bool)

(assert (=> b!301271 (= res!159019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30026 res!159016) b!301267))

(assert (= (and b!301267 res!159021) b!301270))

(assert (= (and b!301270 res!159020) b!301268))

(assert (= (and b!301268 res!159018) b!301266))

(assert (= (and b!301266 res!159017) b!301271))

(assert (= (and b!301271 res!159019) b!301269))

(declare-fun m!313101 () Bool)

(assert (=> b!301268 m!313101))

(declare-fun m!313103 () Bool)

(assert (=> b!301270 m!313103))

(declare-fun m!313105 () Bool)

(assert (=> b!301271 m!313105))

(declare-fun m!313107 () Bool)

(assert (=> start!30026 m!313107))

(declare-fun m!313109 () Bool)

(assert (=> start!30026 m!313109))

(declare-fun m!313111 () Bool)

(assert (=> b!301266 m!313111))

(check-sat (not b!301271) (not start!30026) (not b!301266) (not b!301270) (not b!301268))
(check-sat)
