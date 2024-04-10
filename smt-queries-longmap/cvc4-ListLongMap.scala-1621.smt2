; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30456 () Bool)

(assert start!30456)

(declare-fun b!304971 () Bool)

(declare-fun res!162320 () Bool)

(declare-fun e!191572 () Bool)

(assert (=> b!304971 (=> (not res!162320) (not e!191572))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304971 (= res!162320 (validKeyInArray!0 k!2441))))

(declare-fun b!304972 () Bool)

(declare-fun res!162324 () Bool)

(assert (=> b!304972 (=> (not res!162324) (not e!191572))))

(declare-datatypes ((array!15511 0))(
  ( (array!15512 (arr!7342 (Array (_ BitVec 32) (_ BitVec 64))) (size!7694 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15511)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2482 0))(
  ( (MissingZero!2482 (index!12104 (_ BitVec 32))) (Found!2482 (index!12105 (_ BitVec 32))) (Intermediate!2482 (undefined!3294 Bool) (index!12106 (_ BitVec 32)) (x!30356 (_ BitVec 32))) (Undefined!2482) (MissingVacant!2482 (index!12107 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15511 (_ BitVec 32)) SeekEntryResult!2482)

(assert (=> b!304972 (= res!162324 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2482 i!1240)))))

(declare-fun b!304973 () Bool)

(declare-fun res!162317 () Bool)

(assert (=> b!304973 (=> (not res!162317) (not e!191572))))

(assert (=> b!304973 (= res!162317 (and (= (size!7694 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7694 a!3293))))))

(declare-fun b!304975 () Bool)

(declare-fun res!162321 () Bool)

(declare-fun e!191575 () Bool)

(assert (=> b!304975 (=> (not res!162321) (not e!191575))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304975 (= res!162321 (and (= (select (arr!7342 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7694 a!3293))))))

(declare-fun b!304976 () Bool)

(declare-fun res!162319 () Bool)

(assert (=> b!304976 (=> (not res!162319) (not e!191572))))

(declare-fun arrayContainsKey!0 (array!15511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304976 (= res!162319 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304977 () Bool)

(declare-fun e!191573 () Bool)

(assert (=> b!304977 (= e!191573 (not true))))

(declare-fun lt!150570 () SeekEntryResult!2482)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15511 (_ BitVec 32)) SeekEntryResult!2482)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304977 (= lt!150570 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304974 () Bool)

(assert (=> b!304974 (= e!191572 e!191575)))

(declare-fun res!162323 () Bool)

(assert (=> b!304974 (=> (not res!162323) (not e!191575))))

(declare-fun lt!150569 () SeekEntryResult!2482)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304974 (= res!162323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150569))))

(assert (=> b!304974 (= lt!150569 (Intermediate!2482 false resIndex!52 resX!52))))

(declare-fun res!162322 () Bool)

(assert (=> start!30456 (=> (not res!162322) (not e!191572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30456 (= res!162322 (validMask!0 mask!3709))))

(assert (=> start!30456 e!191572))

(declare-fun array_inv!5305 (array!15511) Bool)

(assert (=> start!30456 (array_inv!5305 a!3293)))

(assert (=> start!30456 true))

(declare-fun b!304978 () Bool)

(assert (=> b!304978 (= e!191575 e!191573)))

(declare-fun res!162318 () Bool)

(assert (=> b!304978 (=> (not res!162318) (not e!191573))))

(assert (=> b!304978 (= res!162318 (and (= lt!150570 lt!150569) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7342 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7342 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7342 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304978 (= lt!150570 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304979 () Bool)

(declare-fun res!162316 () Bool)

(assert (=> b!304979 (=> (not res!162316) (not e!191572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15511 (_ BitVec 32)) Bool)

(assert (=> b!304979 (= res!162316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30456 res!162322) b!304973))

(assert (= (and b!304973 res!162317) b!304971))

(assert (= (and b!304971 res!162320) b!304976))

(assert (= (and b!304976 res!162319) b!304972))

(assert (= (and b!304972 res!162324) b!304979))

(assert (= (and b!304979 res!162316) b!304974))

(assert (= (and b!304974 res!162323) b!304975))

(assert (= (and b!304975 res!162321) b!304978))

(assert (= (and b!304978 res!162318) b!304977))

(declare-fun m!316047 () Bool)

(assert (=> b!304976 m!316047))

(declare-fun m!316049 () Bool)

(assert (=> b!304971 m!316049))

(declare-fun m!316051 () Bool)

(assert (=> b!304979 m!316051))

(declare-fun m!316053 () Bool)

(assert (=> b!304978 m!316053))

(declare-fun m!316055 () Bool)

(assert (=> b!304978 m!316055))

(declare-fun m!316057 () Bool)

(assert (=> b!304972 m!316057))

(declare-fun m!316059 () Bool)

(assert (=> start!30456 m!316059))

(declare-fun m!316061 () Bool)

(assert (=> start!30456 m!316061))

(declare-fun m!316063 () Bool)

(assert (=> b!304975 m!316063))

(declare-fun m!316065 () Bool)

(assert (=> b!304977 m!316065))

(assert (=> b!304977 m!316065))

(declare-fun m!316067 () Bool)

(assert (=> b!304977 m!316067))

(declare-fun m!316069 () Bool)

(assert (=> b!304974 m!316069))

(assert (=> b!304974 m!316069))

(declare-fun m!316071 () Bool)

(assert (=> b!304974 m!316071))

(push 1)

(assert (not b!304976))

(assert (not b!304972))

(assert (not b!304979))

(assert (not b!304971))

(assert (not start!30456))

