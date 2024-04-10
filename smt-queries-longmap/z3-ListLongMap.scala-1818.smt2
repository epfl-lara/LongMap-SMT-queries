; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32718 () Bool)

(assert start!32718)

(declare-fun b!327071 () Bool)

(declare-fun res!180102 () Bool)

(declare-fun e!201217 () Bool)

(assert (=> b!327071 (=> (not res!180102) (not e!201217))))

(declare-datatypes ((array!16755 0))(
  ( (array!16756 (arr!7932 (Array (_ BitVec 32) (_ BitVec 64))) (size!8284 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16755)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!327071 (= res!180102 (and (= (size!8284 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8284 a!3305))))))

(declare-fun b!327072 () Bool)

(declare-fun res!180107 () Bool)

(assert (=> b!327072 (=> (not res!180107) (not e!201217))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3063 0))(
  ( (MissingZero!3063 (index!14428 (_ BitVec 32))) (Found!3063 (index!14429 (_ BitVec 32))) (Intermediate!3063 (undefined!3875 Bool) (index!14430 (_ BitVec 32)) (x!32669 (_ BitVec 32))) (Undefined!3063) (MissingVacant!3063 (index!14431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16755 (_ BitVec 32)) SeekEntryResult!3063)

(assert (=> b!327072 (= res!180107 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3063 i!1250)))))

(declare-fun b!327073 () Bool)

(declare-fun res!180106 () Bool)

(assert (=> b!327073 (=> (not res!180106) (not e!201217))))

(declare-fun arrayContainsKey!0 (array!16755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327073 (= res!180106 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327074 () Bool)

(declare-fun res!180108 () Bool)

(declare-fun e!201216 () Bool)

(assert (=> b!327074 (=> (not res!180108) (not e!201216))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!327074 (= res!180108 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7932 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!327075 () Bool)

(declare-fun res!180109 () Bool)

(assert (=> b!327075 (=> (not res!180109) (not e!201216))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!327075 (= res!180109 (and (= (select (arr!7932 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8284 a!3305))))))

(declare-fun res!180103 () Bool)

(assert (=> start!32718 (=> (not res!180103) (not e!201217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32718 (= res!180103 (validMask!0 mask!3777))))

(assert (=> start!32718 e!201217))

(declare-fun array_inv!5895 (array!16755) Bool)

(assert (=> start!32718 (array_inv!5895 a!3305)))

(assert (=> start!32718 true))

(declare-fun b!327076 () Bool)

(declare-fun res!180110 () Bool)

(assert (=> b!327076 (=> (not res!180110) (not e!201216))))

(declare-fun lt!157452 () SeekEntryResult!3063)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16755 (_ BitVec 32)) SeekEntryResult!3063)

(assert (=> b!327076 (= res!180110 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157452))))

(declare-fun b!327077 () Bool)

(declare-fun res!180111 () Bool)

(assert (=> b!327077 (=> (not res!180111) (not e!201217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327077 (= res!180111 (validKeyInArray!0 k0!2497))))

(declare-fun b!327078 () Bool)

(declare-fun res!180104 () Bool)

(assert (=> b!327078 (=> (not res!180104) (not e!201217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16755 (_ BitVec 32)) Bool)

(assert (=> b!327078 (= res!180104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327079 () Bool)

(assert (=> b!327079 (= e!201216 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10160 0))(
  ( (Unit!10161) )
))
(declare-fun lt!157451 () Unit!10160)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16755 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10160)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327079 (= lt!157451 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!327080 () Bool)

(assert (=> b!327080 (= e!201217 e!201216)))

(declare-fun res!180105 () Bool)

(assert (=> b!327080 (=> (not res!180105) (not e!201216))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327080 (= res!180105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157452))))

(assert (=> b!327080 (= lt!157452 (Intermediate!3063 false resIndex!58 resX!58))))

(assert (= (and start!32718 res!180103) b!327071))

(assert (= (and b!327071 res!180102) b!327077))

(assert (= (and b!327077 res!180111) b!327073))

(assert (= (and b!327073 res!180106) b!327072))

(assert (= (and b!327072 res!180107) b!327078))

(assert (= (and b!327078 res!180104) b!327080))

(assert (= (and b!327080 res!180105) b!327075))

(assert (= (and b!327075 res!180109) b!327076))

(assert (= (and b!327076 res!180110) b!327074))

(assert (= (and b!327074 res!180108) b!327079))

(declare-fun m!333535 () Bool)

(assert (=> b!327076 m!333535))

(declare-fun m!333537 () Bool)

(assert (=> start!32718 m!333537))

(declare-fun m!333539 () Bool)

(assert (=> start!32718 m!333539))

(declare-fun m!333541 () Bool)

(assert (=> b!327077 m!333541))

(declare-fun m!333543 () Bool)

(assert (=> b!327074 m!333543))

(declare-fun m!333545 () Bool)

(assert (=> b!327079 m!333545))

(assert (=> b!327079 m!333545))

(declare-fun m!333547 () Bool)

(assert (=> b!327079 m!333547))

(declare-fun m!333549 () Bool)

(assert (=> b!327080 m!333549))

(assert (=> b!327080 m!333549))

(declare-fun m!333551 () Bool)

(assert (=> b!327080 m!333551))

(declare-fun m!333553 () Bool)

(assert (=> b!327073 m!333553))

(declare-fun m!333555 () Bool)

(assert (=> b!327078 m!333555))

(declare-fun m!333557 () Bool)

(assert (=> b!327075 m!333557))

(declare-fun m!333559 () Bool)

(assert (=> b!327072 m!333559))

(check-sat (not b!327078) (not b!327080) (not b!327079) (not b!327072) (not b!327073) (not b!327077) (not start!32718) (not b!327076))
(check-sat)
