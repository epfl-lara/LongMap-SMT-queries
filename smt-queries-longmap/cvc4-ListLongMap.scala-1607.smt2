; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30318 () Bool)

(assert start!30318)

(declare-fun b!303567 () Bool)

(declare-fun res!161061 () Bool)

(declare-fun e!191001 () Bool)

(assert (=> b!303567 (=> (not res!161061) (not e!191001))))

(declare-datatypes ((array!15424 0))(
  ( (array!15425 (arr!7300 (Array (_ BitVec 32) (_ BitVec 64))) (size!7652 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15424)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303567 (= res!161061 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303568 () Bool)

(declare-fun res!161057 () Bool)

(declare-fun e!191000 () Bool)

(assert (=> b!303568 (=> (not res!161057) (not e!191000))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303568 (= res!161057 (and (= (select (arr!7300 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7652 a!3293))))))

(declare-fun b!303569 () Bool)

(declare-fun res!161058 () Bool)

(assert (=> b!303569 (=> (not res!161058) (not e!191000))))

(declare-datatypes ((SeekEntryResult!2440 0))(
  ( (MissingZero!2440 (index!11936 (_ BitVec 32))) (Found!2440 (index!11937 (_ BitVec 32))) (Intermediate!2440 (undefined!3252 Bool) (index!11938 (_ BitVec 32)) (x!30193 (_ BitVec 32))) (Undefined!2440) (MissingVacant!2440 (index!11939 (_ BitVec 32))) )
))
(declare-fun lt!150222 () SeekEntryResult!2440)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15424 (_ BitVec 32)) SeekEntryResult!2440)

(assert (=> b!303569 (= res!161058 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150222))))

(declare-fun b!303570 () Bool)

(assert (=> b!303570 (= e!191000 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7300 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7300 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7300 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!303572 () Bool)

(declare-fun res!161055 () Bool)

(assert (=> b!303572 (=> (not res!161055) (not e!191001))))

(assert (=> b!303572 (= res!161055 (and (= (size!7652 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7652 a!3293))))))

(declare-fun b!303573 () Bool)

(declare-fun res!161056 () Bool)

(assert (=> b!303573 (=> (not res!161056) (not e!191001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15424 (_ BitVec 32)) Bool)

(assert (=> b!303573 (= res!161056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!161060 () Bool)

(assert (=> start!30318 (=> (not res!161060) (not e!191001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30318 (= res!161060 (validMask!0 mask!3709))))

(assert (=> start!30318 e!191001))

(declare-fun array_inv!5263 (array!15424) Bool)

(assert (=> start!30318 (array_inv!5263 a!3293)))

(assert (=> start!30318 true))

(declare-fun b!303571 () Bool)

(declare-fun res!161053 () Bool)

(assert (=> b!303571 (=> (not res!161053) (not e!191001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303571 (= res!161053 (validKeyInArray!0 k!2441))))

(declare-fun b!303574 () Bool)

(declare-fun res!161054 () Bool)

(assert (=> b!303574 (=> (not res!161054) (not e!191001))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15424 (_ BitVec 32)) SeekEntryResult!2440)

(assert (=> b!303574 (= res!161054 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2440 i!1240)))))

(declare-fun b!303575 () Bool)

(assert (=> b!303575 (= e!191001 e!191000)))

(declare-fun res!161059 () Bool)

(assert (=> b!303575 (=> (not res!161059) (not e!191000))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303575 (= res!161059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150222))))

(assert (=> b!303575 (= lt!150222 (Intermediate!2440 false resIndex!52 resX!52))))

(assert (= (and start!30318 res!161060) b!303572))

(assert (= (and b!303572 res!161055) b!303571))

(assert (= (and b!303571 res!161053) b!303567))

(assert (= (and b!303567 res!161061) b!303574))

(assert (= (and b!303574 res!161054) b!303573))

(assert (= (and b!303573 res!161056) b!303575))

(assert (= (and b!303575 res!161059) b!303568))

(assert (= (and b!303568 res!161057) b!303569))

(assert (= (and b!303569 res!161058) b!303570))

(declare-fun m!314893 () Bool)

(assert (=> b!303574 m!314893))

(declare-fun m!314895 () Bool)

(assert (=> b!303573 m!314895))

(declare-fun m!314897 () Bool)

(assert (=> b!303568 m!314897))

(declare-fun m!314899 () Bool)

(assert (=> b!303567 m!314899))

(declare-fun m!314901 () Bool)

(assert (=> b!303575 m!314901))

(assert (=> b!303575 m!314901))

(declare-fun m!314903 () Bool)

(assert (=> b!303575 m!314903))

(declare-fun m!314905 () Bool)

(assert (=> b!303570 m!314905))

(declare-fun m!314907 () Bool)

(assert (=> start!30318 m!314907))

(declare-fun m!314909 () Bool)

(assert (=> start!30318 m!314909))

(declare-fun m!314911 () Bool)

(assert (=> b!303569 m!314911))

(declare-fun m!314913 () Bool)

(assert (=> b!303571 m!314913))

(push 1)

(assert (not start!30318))

(assert (not b!303571))

(assert (not b!303574))

(assert (not b!303575))

(assert (not b!303569))

(assert (not b!303573))

(assert (not b!303567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

