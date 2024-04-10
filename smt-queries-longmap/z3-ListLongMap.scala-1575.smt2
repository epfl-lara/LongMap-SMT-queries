; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30002 () Bool)

(assert start!30002)

(declare-fun b!301106 () Bool)

(declare-fun e!190086 () Bool)

(assert (=> b!301106 (= e!190086 false)))

(declare-datatypes ((SeekEntryResult!2343 0))(
  ( (MissingZero!2343 (index!11548 (_ BitVec 32))) (Found!2343 (index!11549 (_ BitVec 32))) (Intermediate!2343 (undefined!3155 Bool) (index!11550 (_ BitVec 32)) (x!29831 (_ BitVec 32))) (Undefined!2343) (MissingVacant!2343 (index!11551 (_ BitVec 32))) )
))
(declare-fun lt!149769 () SeekEntryResult!2343)

(declare-datatypes ((array!15222 0))(
  ( (array!15223 (arr!7203 (Array (_ BitVec 32) (_ BitVec 64))) (size!7555 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15222)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15222 (_ BitVec 32)) SeekEntryResult!2343)

(assert (=> b!301106 (= lt!149769 (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709))))

(declare-fun res!158853 () Bool)

(assert (=> start!30002 (=> (not res!158853) (not e!190086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30002 (= res!158853 (validMask!0 mask!3709))))

(assert (=> start!30002 e!190086))

(assert (=> start!30002 true))

(declare-fun array_inv!5166 (array!15222) Bool)

(assert (=> start!30002 (array_inv!5166 a!3293)))

(declare-fun b!301103 () Bool)

(declare-fun res!158854 () Bool)

(assert (=> b!301103 (=> (not res!158854) (not e!190086))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301103 (= res!158854 (and (= (size!7555 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7555 a!3293))))))

(declare-fun b!301104 () Bool)

(declare-fun res!158855 () Bool)

(assert (=> b!301104 (=> (not res!158855) (not e!190086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301104 (= res!158855 (validKeyInArray!0 k0!2441))))

(declare-fun b!301105 () Bool)

(declare-fun res!158856 () Bool)

(assert (=> b!301105 (=> (not res!158856) (not e!190086))))

(declare-fun arrayContainsKey!0 (array!15222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301105 (= res!158856 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30002 res!158853) b!301103))

(assert (= (and b!301103 res!158854) b!301104))

(assert (= (and b!301104 res!158855) b!301105))

(assert (= (and b!301105 res!158856) b!301106))

(declare-fun m!312979 () Bool)

(assert (=> b!301106 m!312979))

(declare-fun m!312981 () Bool)

(assert (=> start!30002 m!312981))

(declare-fun m!312983 () Bool)

(assert (=> start!30002 m!312983))

(declare-fun m!312985 () Bool)

(assert (=> b!301104 m!312985))

(declare-fun m!312987 () Bool)

(assert (=> b!301105 m!312987))

(check-sat (not b!301106) (not b!301104) (not b!301105) (not start!30002))
