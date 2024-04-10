; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30444 () Bool)

(assert start!30444)

(declare-fun b!304809 () Bool)

(declare-fun res!162158 () Bool)

(declare-fun e!191503 () Bool)

(assert (=> b!304809 (=> (not res!162158) (not e!191503))))

(declare-datatypes ((array!15499 0))(
  ( (array!15500 (arr!7336 (Array (_ BitVec 32) (_ BitVec 64))) (size!7688 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15499)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304809 (= res!162158 (and (= (select (arr!7336 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7688 a!3293))))))

(declare-fun b!304810 () Bool)

(declare-fun res!162155 () Bool)

(declare-fun e!191501 () Bool)

(assert (=> b!304810 (=> (not res!162155) (not e!191501))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2476 0))(
  ( (MissingZero!2476 (index!12080 (_ BitVec 32))) (Found!2476 (index!12081 (_ BitVec 32))) (Intermediate!2476 (undefined!3288 Bool) (index!12082 (_ BitVec 32)) (x!30334 (_ BitVec 32))) (Undefined!2476) (MissingVacant!2476 (index!12083 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15499 (_ BitVec 32)) SeekEntryResult!2476)

(assert (=> b!304810 (= res!162155 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2476 i!1240)))))

(declare-fun b!304811 () Bool)

(declare-fun res!162156 () Bool)

(assert (=> b!304811 (=> (not res!162156) (not e!191501))))

(declare-fun arrayContainsKey!0 (array!15499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304811 (= res!162156 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304812 () Bool)

(declare-fun e!191502 () Bool)

(assert (=> b!304812 (= e!191503 e!191502)))

(declare-fun res!162160 () Bool)

(assert (=> b!304812 (=> (not res!162160) (not e!191502))))

(declare-fun lt!150534 () SeekEntryResult!2476)

(declare-fun lt!150533 () SeekEntryResult!2476)

(assert (=> b!304812 (= res!162160 (and (= lt!150534 lt!150533) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7336 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7336 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7336 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15499 (_ BitVec 32)) SeekEntryResult!2476)

(assert (=> b!304812 (= lt!150534 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!162154 () Bool)

(assert (=> start!30444 (=> (not res!162154) (not e!191501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30444 (= res!162154 (validMask!0 mask!3709))))

(assert (=> start!30444 e!191501))

(declare-fun array_inv!5299 (array!15499) Bool)

(assert (=> start!30444 (array_inv!5299 a!3293)))

(assert (=> start!30444 true))

(declare-fun b!304813 () Bool)

(assert (=> b!304813 (= e!191501 e!191503)))

(declare-fun res!162161 () Bool)

(assert (=> b!304813 (=> (not res!162161) (not e!191503))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304813 (= res!162161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150533))))

(assert (=> b!304813 (= lt!150533 (Intermediate!2476 false resIndex!52 resX!52))))

(declare-fun b!304814 () Bool)

(assert (=> b!304814 (= e!191502 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304814 (= lt!150534 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304815 () Bool)

(declare-fun res!162162 () Bool)

(assert (=> b!304815 (=> (not res!162162) (not e!191501))))

(assert (=> b!304815 (= res!162162 (and (= (size!7688 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7688 a!3293))))))

(declare-fun b!304816 () Bool)

(declare-fun res!162157 () Bool)

(assert (=> b!304816 (=> (not res!162157) (not e!191501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15499 (_ BitVec 32)) Bool)

(assert (=> b!304816 (= res!162157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304817 () Bool)

(declare-fun res!162159 () Bool)

(assert (=> b!304817 (=> (not res!162159) (not e!191501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304817 (= res!162159 (validKeyInArray!0 k!2441))))

(assert (= (and start!30444 res!162154) b!304815))

(assert (= (and b!304815 res!162162) b!304817))

(assert (= (and b!304817 res!162159) b!304811))

(assert (= (and b!304811 res!162156) b!304810))

(assert (= (and b!304810 res!162155) b!304816))

(assert (= (and b!304816 res!162157) b!304813))

(assert (= (and b!304813 res!162161) b!304809))

(assert (= (and b!304809 res!162158) b!304812))

(assert (= (and b!304812 res!162160) b!304814))

(declare-fun m!315891 () Bool)

(assert (=> b!304810 m!315891))

(declare-fun m!315893 () Bool)

(assert (=> b!304817 m!315893))

(declare-fun m!315895 () Bool)

(assert (=> b!304814 m!315895))

(assert (=> b!304814 m!315895))

(declare-fun m!315897 () Bool)

(assert (=> b!304814 m!315897))

(declare-fun m!315899 () Bool)

(assert (=> b!304816 m!315899))

(declare-fun m!315901 () Bool)

(assert (=> b!304811 m!315901))

(declare-fun m!315903 () Bool)

(assert (=> start!30444 m!315903))

(declare-fun m!315905 () Bool)

(assert (=> start!30444 m!315905))

(declare-fun m!315907 () Bool)

(assert (=> b!304809 m!315907))

(declare-fun m!315909 () Bool)

(assert (=> b!304813 m!315909))

(assert (=> b!304813 m!315909))

(declare-fun m!315911 () Bool)

(assert (=> b!304813 m!315911))

(declare-fun m!315913 () Bool)

(assert (=> b!304812 m!315913))

(declare-fun m!315915 () Bool)

(assert (=> b!304812 m!315915))

(push 1)

(assert (not b!304816))

(assert (not b!304811))

(assert (not b!304814))

(assert (not b!304810))

(assert (not b!304817))

