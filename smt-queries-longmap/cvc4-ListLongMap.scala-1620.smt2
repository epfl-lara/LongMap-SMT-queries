; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30450 () Bool)

(assert start!30450)

(declare-fun b!304890 () Bool)

(declare-fun res!162238 () Bool)

(declare-fun e!191539 () Bool)

(assert (=> b!304890 (=> (not res!162238) (not e!191539))))

(declare-datatypes ((array!15505 0))(
  ( (array!15506 (arr!7339 (Array (_ BitVec 32) (_ BitVec 64))) (size!7691 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15505)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2479 0))(
  ( (MissingZero!2479 (index!12092 (_ BitVec 32))) (Found!2479 (index!12093 (_ BitVec 32))) (Intermediate!2479 (undefined!3291 Bool) (index!12094 (_ BitVec 32)) (x!30345 (_ BitVec 32))) (Undefined!2479) (MissingVacant!2479 (index!12095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15505 (_ BitVec 32)) SeekEntryResult!2479)

(assert (=> b!304890 (= res!162238 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2479 i!1240)))))

(declare-fun b!304892 () Bool)

(declare-fun res!162241 () Bool)

(assert (=> b!304892 (=> (not res!162241) (not e!191539))))

(declare-fun arrayContainsKey!0 (array!15505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304892 (= res!162241 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304893 () Bool)

(declare-fun e!191538 () Bool)

(assert (=> b!304893 (= e!191539 e!191538)))

(declare-fun res!162240 () Bool)

(assert (=> b!304893 (=> (not res!162240) (not e!191538))))

(declare-fun lt!150552 () SeekEntryResult!2479)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15505 (_ BitVec 32)) SeekEntryResult!2479)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304893 (= res!162240 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150552))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304893 (= lt!150552 (Intermediate!2479 false resIndex!52 resX!52))))

(declare-fun b!304894 () Bool)

(declare-fun e!191536 () Bool)

(assert (=> b!304894 (= e!191536 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun lt!150551 () SeekEntryResult!2479)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304894 (= lt!150551 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304895 () Bool)

(declare-fun res!162239 () Bool)

(assert (=> b!304895 (=> (not res!162239) (not e!191539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304895 (= res!162239 (validKeyInArray!0 k!2441))))

(declare-fun b!304896 () Bool)

(assert (=> b!304896 (= e!191538 e!191536)))

(declare-fun res!162243 () Bool)

(assert (=> b!304896 (=> (not res!162243) (not e!191536))))

(assert (=> b!304896 (= res!162243 (and (= lt!150551 lt!150552) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7339 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7339 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7339 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304896 (= lt!150551 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304897 () Bool)

(declare-fun res!162236 () Bool)

(assert (=> b!304897 (=> (not res!162236) (not e!191539))))

(assert (=> b!304897 (= res!162236 (and (= (size!7691 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7691 a!3293))))))

(declare-fun b!304898 () Bool)

(declare-fun res!162242 () Bool)

(assert (=> b!304898 (=> (not res!162242) (not e!191538))))

(assert (=> b!304898 (= res!162242 (and (= (select (arr!7339 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7691 a!3293))))))

(declare-fun res!162235 () Bool)

(assert (=> start!30450 (=> (not res!162235) (not e!191539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30450 (= res!162235 (validMask!0 mask!3709))))

(assert (=> start!30450 e!191539))

(declare-fun array_inv!5302 (array!15505) Bool)

(assert (=> start!30450 (array_inv!5302 a!3293)))

(assert (=> start!30450 true))

(declare-fun b!304891 () Bool)

(declare-fun res!162237 () Bool)

(assert (=> b!304891 (=> (not res!162237) (not e!191539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15505 (_ BitVec 32)) Bool)

(assert (=> b!304891 (= res!162237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30450 res!162235) b!304897))

(assert (= (and b!304897 res!162236) b!304895))

(assert (= (and b!304895 res!162239) b!304892))

(assert (= (and b!304892 res!162241) b!304890))

(assert (= (and b!304890 res!162238) b!304891))

(assert (= (and b!304891 res!162237) b!304893))

(assert (= (and b!304893 res!162240) b!304898))

(assert (= (and b!304898 res!162242) b!304896))

(assert (= (and b!304896 res!162243) b!304894))

(declare-fun m!315969 () Bool)

(assert (=> b!304892 m!315969))

(declare-fun m!315971 () Bool)

(assert (=> start!30450 m!315971))

(declare-fun m!315973 () Bool)

(assert (=> start!30450 m!315973))

(declare-fun m!315975 () Bool)

(assert (=> b!304896 m!315975))

(declare-fun m!315977 () Bool)

(assert (=> b!304896 m!315977))

(declare-fun m!315979 () Bool)

(assert (=> b!304895 m!315979))

(declare-fun m!315981 () Bool)

(assert (=> b!304890 m!315981))

(declare-fun m!315983 () Bool)

(assert (=> b!304894 m!315983))

(assert (=> b!304894 m!315983))

(declare-fun m!315985 () Bool)

(assert (=> b!304894 m!315985))

(declare-fun m!315987 () Bool)

(assert (=> b!304893 m!315987))

(assert (=> b!304893 m!315987))

(declare-fun m!315989 () Bool)

(assert (=> b!304893 m!315989))

(declare-fun m!315991 () Bool)

(assert (=> b!304891 m!315991))

(declare-fun m!315993 () Bool)

(assert (=> b!304898 m!315993))

(push 1)

(assert (not b!304896))

(assert (not b!304890))

(assert (not b!304892))

(assert (not b!304893))

(assert (not b!304895))

(assert (not b!304894))

(assert (not b!304891))

(assert (not start!30450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

