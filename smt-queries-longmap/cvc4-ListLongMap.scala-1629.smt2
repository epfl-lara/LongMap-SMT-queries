; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30558 () Bool)

(assert start!30558)

(declare-fun b!306082 () Bool)

(declare-fun res!163096 () Bool)

(declare-fun e!192051 () Bool)

(assert (=> b!306082 (=> (not res!163096) (not e!192051))))

(declare-datatypes ((array!15562 0))(
  ( (array!15563 (arr!7366 (Array (_ BitVec 32) (_ BitVec 64))) (size!7718 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15562)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2506 0))(
  ( (MissingZero!2506 (index!12200 (_ BitVec 32))) (Found!2506 (index!12201 (_ BitVec 32))) (Intermediate!2506 (undefined!3318 Bool) (index!12202 (_ BitVec 32)) (x!30453 (_ BitVec 32))) (Undefined!2506) (MissingVacant!2506 (index!12203 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15562 (_ BitVec 32)) SeekEntryResult!2506)

(assert (=> b!306082 (= res!163096 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2506 i!1240)))))

(declare-fun b!306083 () Bool)

(declare-fun e!192054 () Bool)

(assert (=> b!306083 (= e!192051 e!192054)))

(declare-fun res!163098 () Bool)

(assert (=> b!306083 (=> (not res!163098) (not e!192054))))

(declare-fun lt!150887 () SeekEntryResult!2506)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15562 (_ BitVec 32)) SeekEntryResult!2506)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306083 (= res!163098 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150887))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306083 (= lt!150887 (Intermediate!2506 false resIndex!52 resX!52))))

(declare-fun b!306084 () Bool)

(declare-datatypes ((Unit!9471 0))(
  ( (Unit!9472) )
))
(declare-fun e!192052 () Unit!9471)

(declare-fun e!192053 () Unit!9471)

(assert (=> b!306084 (= e!192052 e!192053)))

(declare-fun c!49098 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306084 (= c!49098 (or (= (select (arr!7366 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7366 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!163101 () Bool)

(assert (=> start!30558 (=> (not res!163101) (not e!192051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30558 (= res!163101 (validMask!0 mask!3709))))

(assert (=> start!30558 e!192051))

(declare-fun array_inv!5329 (array!15562) Bool)

(assert (=> start!30558 (array_inv!5329 a!3293)))

(assert (=> start!30558 true))

(declare-fun b!306085 () Bool)

(declare-fun res!163095 () Bool)

(assert (=> b!306085 (=> (not res!163095) (not e!192051))))

(assert (=> b!306085 (= res!163095 (and (= (size!7718 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7718 a!3293))))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun b!306086 () Bool)

(assert (=> b!306086 (= e!192054 (not (or (not (= (select (arr!7366 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(assert (=> b!306086 (= index!1781 resIndex!52)))

(declare-fun lt!150888 () Unit!9471)

(assert (=> b!306086 (= lt!150888 e!192052)))

(declare-fun c!49097 () Bool)

(assert (=> b!306086 (= c!49097 (not (= resIndex!52 index!1781)))))

(declare-fun b!306087 () Bool)

(declare-fun Unit!9473 () Unit!9471)

(assert (=> b!306087 (= e!192052 Unit!9473)))

(declare-fun b!306088 () Bool)

(declare-fun res!163092 () Bool)

(assert (=> b!306088 (=> (not res!163092) (not e!192051))))

(declare-fun arrayContainsKey!0 (array!15562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306088 (= res!163092 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306089 () Bool)

(declare-fun res!163094 () Bool)

(assert (=> b!306089 (=> (not res!163094) (not e!192051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306089 (= res!163094 (validKeyInArray!0 k!2441))))

(declare-fun b!306090 () Bool)

(assert (=> b!306090 false))

(declare-fun Unit!9474 () Unit!9471)

(assert (=> b!306090 (= e!192053 Unit!9474)))

(declare-fun b!306091 () Bool)

(assert (=> b!306091 false))

(declare-fun lt!150886 () SeekEntryResult!2506)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306091 (= lt!150886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9475 () Unit!9471)

(assert (=> b!306091 (= e!192053 Unit!9475)))

(declare-fun b!306092 () Bool)

(declare-fun res!163099 () Bool)

(assert (=> b!306092 (=> (not res!163099) (not e!192054))))

(assert (=> b!306092 (= res!163099 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7366 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306093 () Bool)

(declare-fun res!163097 () Bool)

(assert (=> b!306093 (=> (not res!163097) (not e!192051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15562 (_ BitVec 32)) Bool)

(assert (=> b!306093 (= res!163097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306094 () Bool)

(declare-fun res!163100 () Bool)

(assert (=> b!306094 (=> (not res!163100) (not e!192054))))

(assert (=> b!306094 (= res!163100 (and (= (select (arr!7366 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7718 a!3293))))))

(declare-fun b!306095 () Bool)

(declare-fun res!163093 () Bool)

(assert (=> b!306095 (=> (not res!163093) (not e!192054))))

(assert (=> b!306095 (= res!163093 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150887))))

(assert (= (and start!30558 res!163101) b!306085))

(assert (= (and b!306085 res!163095) b!306089))

(assert (= (and b!306089 res!163094) b!306088))

(assert (= (and b!306088 res!163092) b!306082))

(assert (= (and b!306082 res!163096) b!306093))

(assert (= (and b!306093 res!163097) b!306083))

(assert (= (and b!306083 res!163098) b!306094))

(assert (= (and b!306094 res!163100) b!306095))

(assert (= (and b!306095 res!163093) b!306092))

(assert (= (and b!306092 res!163099) b!306086))

(assert (= (and b!306086 c!49097) b!306084))

(assert (= (and b!306086 (not c!49097)) b!306087))

(assert (= (and b!306084 c!49098) b!306090))

(assert (= (and b!306084 (not c!49098)) b!306091))

(declare-fun m!316809 () Bool)

(assert (=> b!306094 m!316809))

(declare-fun m!316811 () Bool)

(assert (=> start!30558 m!316811))

(declare-fun m!316813 () Bool)

(assert (=> start!30558 m!316813))

(declare-fun m!316815 () Bool)

(assert (=> b!306086 m!316815))

(declare-fun m!316817 () Bool)

(assert (=> b!306082 m!316817))

(declare-fun m!316819 () Bool)

(assert (=> b!306093 m!316819))

(declare-fun m!316821 () Bool)

(assert (=> b!306091 m!316821))

(assert (=> b!306091 m!316821))

(declare-fun m!316823 () Bool)

(assert (=> b!306091 m!316823))

(declare-fun m!316825 () Bool)

(assert (=> b!306083 m!316825))

(assert (=> b!306083 m!316825))

(declare-fun m!316827 () Bool)

(assert (=> b!306083 m!316827))

(assert (=> b!306084 m!316815))

(declare-fun m!316829 () Bool)

(assert (=> b!306088 m!316829))

(declare-fun m!316831 () Bool)

(assert (=> b!306089 m!316831))

(declare-fun m!316833 () Bool)

(assert (=> b!306095 m!316833))

(assert (=> b!306092 m!316815))

(push 1)

(assert (not start!30558))

(assert (not b!306089))

(assert (not b!306091))

(assert (not b!306082))

(assert (not b!306095))

