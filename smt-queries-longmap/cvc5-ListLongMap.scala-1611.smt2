; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30338 () Bool)

(assert start!30338)

(declare-fun b!303857 () Bool)

(declare-fun res!161346 () Bool)

(declare-fun e!191091 () Bool)

(assert (=> b!303857 (=> (not res!161346) (not e!191091))))

(declare-datatypes ((array!15444 0))(
  ( (array!15445 (arr!7310 (Array (_ BitVec 32) (_ BitVec 64))) (size!7662 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15444)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303857 (= res!161346 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303858 () Bool)

(declare-fun res!161349 () Bool)

(assert (=> b!303858 (=> (not res!161349) (not e!191091))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303858 (= res!161349 (and (= (size!7662 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7662 a!3293))))))

(declare-fun b!303859 () Bool)

(declare-fun e!191092 () Bool)

(assert (=> b!303859 (= e!191092 false)))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!150273 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303859 (= lt!150273 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303860 () Bool)

(declare-fun res!161351 () Bool)

(assert (=> b!303860 (=> (not res!161351) (not e!191091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15444 (_ BitVec 32)) Bool)

(assert (=> b!303860 (= res!161351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303861 () Bool)

(declare-fun res!161345 () Bool)

(assert (=> b!303861 (=> (not res!161345) (not e!191091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303861 (= res!161345 (validKeyInArray!0 k!2441))))

(declare-fun res!161350 () Bool)

(assert (=> start!30338 (=> (not res!161350) (not e!191091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30338 (= res!161350 (validMask!0 mask!3709))))

(assert (=> start!30338 e!191091))

(declare-fun array_inv!5273 (array!15444) Bool)

(assert (=> start!30338 (array_inv!5273 a!3293)))

(assert (=> start!30338 true))

(declare-fun b!303862 () Bool)

(declare-fun res!161344 () Bool)

(assert (=> b!303862 (=> (not res!161344) (not e!191092))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303862 (= res!161344 (and (= (select (arr!7310 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7662 a!3293))))))

(declare-fun b!303863 () Bool)

(assert (=> b!303863 (= e!191091 e!191092)))

(declare-fun res!161347 () Bool)

(assert (=> b!303863 (=> (not res!161347) (not e!191092))))

(declare-datatypes ((SeekEntryResult!2450 0))(
  ( (MissingZero!2450 (index!11976 (_ BitVec 32))) (Found!2450 (index!11977 (_ BitVec 32))) (Intermediate!2450 (undefined!3262 Bool) (index!11978 (_ BitVec 32)) (x!30235 (_ BitVec 32))) (Undefined!2450) (MissingVacant!2450 (index!11979 (_ BitVec 32))) )
))
(declare-fun lt!150272 () SeekEntryResult!2450)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15444 (_ BitVec 32)) SeekEntryResult!2450)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303863 (= res!161347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150272))))

(assert (=> b!303863 (= lt!150272 (Intermediate!2450 false resIndex!52 resX!52))))

(declare-fun b!303864 () Bool)

(declare-fun res!161343 () Bool)

(assert (=> b!303864 (=> (not res!161343) (not e!191091))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15444 (_ BitVec 32)) SeekEntryResult!2450)

(assert (=> b!303864 (= res!161343 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2450 i!1240)))))

(declare-fun b!303865 () Bool)

(declare-fun res!161352 () Bool)

(assert (=> b!303865 (=> (not res!161352) (not e!191092))))

(assert (=> b!303865 (= res!161352 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150272))))

(declare-fun b!303866 () Bool)

(declare-fun res!161348 () Bool)

(assert (=> b!303866 (=> (not res!161348) (not e!191092))))

(assert (=> b!303866 (= res!161348 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7310 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7310 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7310 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!30338 res!161350) b!303858))

(assert (= (and b!303858 res!161349) b!303861))

(assert (= (and b!303861 res!161345) b!303857))

(assert (= (and b!303857 res!161346) b!303864))

(assert (= (and b!303864 res!161343) b!303860))

(assert (= (and b!303860 res!161351) b!303863))

(assert (= (and b!303863 res!161347) b!303862))

(assert (= (and b!303862 res!161344) b!303865))

(assert (= (and b!303865 res!161352) b!303866))

(assert (= (and b!303866 res!161348) b!303859))

(declare-fun m!315125 () Bool)

(assert (=> start!30338 m!315125))

(declare-fun m!315127 () Bool)

(assert (=> start!30338 m!315127))

(declare-fun m!315129 () Bool)

(assert (=> b!303860 m!315129))

(declare-fun m!315131 () Bool)

(assert (=> b!303859 m!315131))

(declare-fun m!315133 () Bool)

(assert (=> b!303863 m!315133))

(assert (=> b!303863 m!315133))

(declare-fun m!315135 () Bool)

(assert (=> b!303863 m!315135))

(declare-fun m!315137 () Bool)

(assert (=> b!303865 m!315137))

(declare-fun m!315139 () Bool)

(assert (=> b!303866 m!315139))

(declare-fun m!315141 () Bool)

(assert (=> b!303861 m!315141))

(declare-fun m!315143 () Bool)

(assert (=> b!303857 m!315143))

(declare-fun m!315145 () Bool)

(assert (=> b!303864 m!315145))

(declare-fun m!315147 () Bool)

(assert (=> b!303862 m!315147))

(push 1)

