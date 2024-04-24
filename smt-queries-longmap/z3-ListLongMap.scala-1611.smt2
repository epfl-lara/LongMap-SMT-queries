; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30324 () Bool)

(assert start!30324)

(declare-fun b!303804 () Bool)

(declare-fun res!161349 () Bool)

(declare-fun e!191058 () Bool)

(assert (=> b!303804 (=> (not res!161349) (not e!191058))))

(declare-datatypes ((array!15443 0))(
  ( (array!15444 (arr!7309 (Array (_ BitVec 32) (_ BitVec 64))) (size!7661 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15443)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303804 (= res!161349 (and (= (size!7661 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7661 a!3293))))))

(declare-fun b!303805 () Bool)

(declare-fun res!161347 () Bool)

(declare-fun e!191056 () Bool)

(assert (=> b!303805 (=> (not res!161347) (not e!191056))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303805 (= res!161347 (and (= (select (arr!7309 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7661 a!3293))))))

(declare-fun b!303806 () Bool)

(declare-fun res!161344 () Bool)

(assert (=> b!303806 (=> (not res!161344) (not e!191058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15443 (_ BitVec 32)) Bool)

(assert (=> b!303806 (= res!161344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303808 () Bool)

(assert (=> b!303808 (= e!191056 false)))

(declare-fun lt!150290 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303808 (= lt!150290 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!303809 () Bool)

(declare-fun res!161348 () Bool)

(assert (=> b!303809 (=> (not res!161348) (not e!191058))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303809 (= res!161348 (validKeyInArray!0 k0!2441))))

(declare-fun b!303810 () Bool)

(declare-fun res!161340 () Bool)

(assert (=> b!303810 (=> (not res!161340) (not e!191058))))

(declare-fun arrayContainsKey!0 (array!15443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303810 (= res!161340 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303811 () Bool)

(declare-fun res!161346 () Bool)

(assert (=> b!303811 (=> (not res!161346) (not e!191056))))

(declare-datatypes ((SeekEntryResult!2414 0))(
  ( (MissingZero!2414 (index!11832 (_ BitVec 32))) (Found!2414 (index!11833 (_ BitVec 32))) (Intermediate!2414 (undefined!3226 Bool) (index!11834 (_ BitVec 32)) (x!30196 (_ BitVec 32))) (Undefined!2414) (MissingVacant!2414 (index!11835 (_ BitVec 32))) )
))
(declare-fun lt!150291 () SeekEntryResult!2414)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15443 (_ BitVec 32)) SeekEntryResult!2414)

(assert (=> b!303811 (= res!161346 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150291))))

(declare-fun b!303812 () Bool)

(declare-fun res!161345 () Bool)

(assert (=> b!303812 (=> (not res!161345) (not e!191056))))

(assert (=> b!303812 (= res!161345 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7309 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7309 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7309 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303813 () Bool)

(declare-fun res!161341 () Bool)

(assert (=> b!303813 (=> (not res!161341) (not e!191058))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15443 (_ BitVec 32)) SeekEntryResult!2414)

(assert (=> b!303813 (= res!161341 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2414 i!1240)))))

(declare-fun res!161342 () Bool)

(assert (=> start!30324 (=> (not res!161342) (not e!191058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30324 (= res!161342 (validMask!0 mask!3709))))

(assert (=> start!30324 e!191058))

(declare-fun array_inv!5259 (array!15443) Bool)

(assert (=> start!30324 (array_inv!5259 a!3293)))

(assert (=> start!30324 true))

(declare-fun b!303807 () Bool)

(assert (=> b!303807 (= e!191058 e!191056)))

(declare-fun res!161343 () Bool)

(assert (=> b!303807 (=> (not res!161343) (not e!191056))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303807 (= res!161343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150291))))

(assert (=> b!303807 (= lt!150291 (Intermediate!2414 false resIndex!52 resX!52))))

(assert (= (and start!30324 res!161342) b!303804))

(assert (= (and b!303804 res!161349) b!303809))

(assert (= (and b!303809 res!161348) b!303810))

(assert (= (and b!303810 res!161340) b!303813))

(assert (= (and b!303813 res!161341) b!303806))

(assert (= (and b!303806 res!161344) b!303807))

(assert (= (and b!303807 res!161343) b!303805))

(assert (= (and b!303805 res!161347) b!303811))

(assert (= (and b!303811 res!161346) b!303812))

(assert (= (and b!303812 res!161345) b!303808))

(declare-fun m!315235 () Bool)

(assert (=> b!303808 m!315235))

(declare-fun m!315237 () Bool)

(assert (=> b!303812 m!315237))

(declare-fun m!315239 () Bool)

(assert (=> b!303806 m!315239))

(declare-fun m!315241 () Bool)

(assert (=> b!303810 m!315241))

(declare-fun m!315243 () Bool)

(assert (=> b!303809 m!315243))

(declare-fun m!315245 () Bool)

(assert (=> b!303807 m!315245))

(assert (=> b!303807 m!315245))

(declare-fun m!315247 () Bool)

(assert (=> b!303807 m!315247))

(declare-fun m!315249 () Bool)

(assert (=> start!30324 m!315249))

(declare-fun m!315251 () Bool)

(assert (=> start!30324 m!315251))

(declare-fun m!315253 () Bool)

(assert (=> b!303805 m!315253))

(declare-fun m!315255 () Bool)

(assert (=> b!303811 m!315255))

(declare-fun m!315257 () Bool)

(assert (=> b!303813 m!315257))

(check-sat (not b!303813) (not b!303809) (not b!303808) (not start!30324) (not b!303810) (not b!303811) (not b!303807) (not b!303806))
(check-sat)
