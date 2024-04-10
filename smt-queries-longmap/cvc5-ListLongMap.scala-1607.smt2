; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30314 () Bool)

(assert start!30314)

(declare-fun b!303514 () Bool)

(declare-fun e!190983 () Bool)

(declare-fun e!190984 () Bool)

(assert (=> b!303514 (= e!190983 e!190984)))

(declare-fun res!161005 () Bool)

(assert (=> b!303514 (=> (not res!161005) (not e!190984))))

(declare-datatypes ((array!15420 0))(
  ( (array!15421 (arr!7298 (Array (_ BitVec 32) (_ BitVec 64))) (size!7650 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15420)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2438 0))(
  ( (MissingZero!2438 (index!11928 (_ BitVec 32))) (Found!2438 (index!11929 (_ BitVec 32))) (Intermediate!2438 (undefined!3250 Bool) (index!11930 (_ BitVec 32)) (x!30191 (_ BitVec 32))) (Undefined!2438) (MissingVacant!2438 (index!11931 (_ BitVec 32))) )
))
(declare-fun lt!150216 () SeekEntryResult!2438)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15420 (_ BitVec 32)) SeekEntryResult!2438)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303514 (= res!161005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150216))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303514 (= lt!150216 (Intermediate!2438 false resIndex!52 resX!52))))

(declare-fun b!303515 () Bool)

(declare-fun res!161000 () Bool)

(assert (=> b!303515 (=> (not res!161000) (not e!190984))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303515 (= res!161000 (and (= (select (arr!7298 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7650 a!3293))))))

(declare-fun b!303516 () Bool)

(declare-fun res!161003 () Bool)

(assert (=> b!303516 (=> (not res!161003) (not e!190983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303516 (= res!161003 (validKeyInArray!0 k!2441))))

(declare-fun b!303517 () Bool)

(declare-fun res!161004 () Bool)

(assert (=> b!303517 (=> (not res!161004) (not e!190983))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15420 (_ BitVec 32)) SeekEntryResult!2438)

(assert (=> b!303517 (= res!161004 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2438 i!1240)))))

(declare-fun b!303513 () Bool)

(declare-fun res!161006 () Bool)

(assert (=> b!303513 (=> (not res!161006) (not e!190984))))

(assert (=> b!303513 (= res!161006 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150216))))

(declare-fun res!160999 () Bool)

(assert (=> start!30314 (=> (not res!160999) (not e!190983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30314 (= res!160999 (validMask!0 mask!3709))))

(assert (=> start!30314 e!190983))

(declare-fun array_inv!5261 (array!15420) Bool)

(assert (=> start!30314 (array_inv!5261 a!3293)))

(assert (=> start!30314 true))

(declare-fun b!303518 () Bool)

(declare-fun res!161001 () Bool)

(assert (=> b!303518 (=> (not res!161001) (not e!190983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15420 (_ BitVec 32)) Bool)

(assert (=> b!303518 (= res!161001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303519 () Bool)

(declare-fun res!161007 () Bool)

(assert (=> b!303519 (=> (not res!161007) (not e!190983))))

(assert (=> b!303519 (= res!161007 (and (= (size!7650 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7650 a!3293))))))

(declare-fun b!303520 () Bool)

(declare-fun res!161002 () Bool)

(assert (=> b!303520 (=> (not res!161002) (not e!190983))))

(declare-fun arrayContainsKey!0 (array!15420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303520 (= res!161002 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303521 () Bool)

(assert (=> b!303521 (= e!190984 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7298 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7298 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7298 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(assert (= (and start!30314 res!160999) b!303519))

(assert (= (and b!303519 res!161007) b!303516))

(assert (= (and b!303516 res!161003) b!303520))

(assert (= (and b!303520 res!161002) b!303517))

(assert (= (and b!303517 res!161004) b!303518))

(assert (= (and b!303518 res!161001) b!303514))

(assert (= (and b!303514 res!161005) b!303515))

(assert (= (and b!303515 res!161000) b!303513))

(assert (= (and b!303513 res!161006) b!303521))

(declare-fun m!314849 () Bool)

(assert (=> b!303521 m!314849))

(declare-fun m!314851 () Bool)

(assert (=> start!30314 m!314851))

(declare-fun m!314853 () Bool)

(assert (=> start!30314 m!314853))

(declare-fun m!314855 () Bool)

(assert (=> b!303520 m!314855))

(declare-fun m!314857 () Bool)

(assert (=> b!303514 m!314857))

(assert (=> b!303514 m!314857))

(declare-fun m!314859 () Bool)

(assert (=> b!303514 m!314859))

(declare-fun m!314861 () Bool)

(assert (=> b!303516 m!314861))

(declare-fun m!314863 () Bool)

(assert (=> b!303517 m!314863))

(declare-fun m!314865 () Bool)

(assert (=> b!303513 m!314865))

(declare-fun m!314867 () Bool)

(assert (=> b!303518 m!314867))

(declare-fun m!314869 () Bool)

(assert (=> b!303515 m!314869))

(push 1)

(assert (not b!303520))

(assert (not b!303516))

(assert (not b!303513))

(assert (not start!30314))

(assert (not b!303514))

(assert (not b!303518))

(assert (not b!303517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

