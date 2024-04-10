; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32350 () Bool)

(assert start!32350)

(declare-fun b!322100 () Bool)

(declare-fun res!176081 () Bool)

(declare-fun e!199442 () Bool)

(assert (=> b!322100 (=> (not res!176081) (not e!199442))))

(declare-datatypes ((array!16489 0))(
  ( (array!16490 (arr!7802 (Array (_ BitVec 32) (_ BitVec 64))) (size!8154 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16489)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322100 (= res!176081 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322101 () Bool)

(declare-fun res!176088 () Bool)

(declare-fun e!199443 () Bool)

(assert (=> b!322101 (=> (not res!176088) (not e!199443))))

(declare-datatypes ((SeekEntryResult!2933 0))(
  ( (MissingZero!2933 (index!13908 (_ BitVec 32))) (Found!2933 (index!13909 (_ BitVec 32))) (Intermediate!2933 (undefined!3745 Bool) (index!13910 (_ BitVec 32)) (x!32177 (_ BitVec 32))) (Undefined!2933) (MissingVacant!2933 (index!13911 (_ BitVec 32))) )
))
(declare-fun lt!156383 () SeekEntryResult!2933)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16489 (_ BitVec 32)) SeekEntryResult!2933)

(assert (=> b!322101 (= res!176088 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156383))))

(declare-fun b!322102 () Bool)

(declare-fun res!176085 () Bool)

(assert (=> b!322102 (=> (not res!176085) (not e!199442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16489 (_ BitVec 32)) Bool)

(assert (=> b!322102 (= res!176085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!176079 () Bool)

(assert (=> start!32350 (=> (not res!176079) (not e!199442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32350 (= res!176079 (validMask!0 mask!3777))))

(assert (=> start!32350 e!199442))

(declare-fun array_inv!5765 (array!16489) Bool)

(assert (=> start!32350 (array_inv!5765 a!3305)))

(assert (=> start!32350 true))

(declare-fun b!322103 () Bool)

(declare-fun res!176082 () Bool)

(assert (=> b!322103 (=> (not res!176082) (not e!199443))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322103 (= res!176082 (and (= (select (arr!7802 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8154 a!3305))))))

(declare-fun b!322104 () Bool)

(declare-fun res!176084 () Bool)

(assert (=> b!322104 (=> (not res!176084) (not e!199442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322104 (= res!176084 (validKeyInArray!0 k!2497))))

(declare-fun b!322105 () Bool)

(declare-fun res!176086 () Bool)

(assert (=> b!322105 (=> (not res!176086) (not e!199442))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16489 (_ BitVec 32)) SeekEntryResult!2933)

(assert (=> b!322105 (= res!176086 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2933 i!1250)))))

(declare-fun b!322106 () Bool)

(declare-fun res!176080 () Bool)

(assert (=> b!322106 (=> (not res!176080) (not e!199443))))

(assert (=> b!322106 (= res!176080 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7802 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7802 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7802 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!322107 () Bool)

(declare-fun res!176087 () Bool)

(assert (=> b!322107 (=> (not res!176087) (not e!199442))))

(assert (=> b!322107 (= res!176087 (and (= (size!8154 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8154 a!3305))))))

(declare-fun b!322108 () Bool)

(declare-fun lt!156384 () (_ BitVec 32))

(assert (=> b!322108 (= e!199443 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge lt!156384 #b00000000000000000000000000000000) (bvslt lt!156384 (bvadd #b00000000000000000000000000000001 mask!3777)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322108 (= lt!156384 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!322109 () Bool)

(assert (=> b!322109 (= e!199442 e!199443)))

(declare-fun res!176083 () Bool)

(assert (=> b!322109 (=> (not res!176083) (not e!199443))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322109 (= res!176083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156383))))

(assert (=> b!322109 (= lt!156383 (Intermediate!2933 false resIndex!58 resX!58))))

(assert (= (and start!32350 res!176079) b!322107))

(assert (= (and b!322107 res!176087) b!322104))

(assert (= (and b!322104 res!176084) b!322100))

(assert (= (and b!322100 res!176081) b!322105))

(assert (= (and b!322105 res!176086) b!322102))

(assert (= (and b!322102 res!176085) b!322109))

(assert (= (and b!322109 res!176083) b!322103))

(assert (= (and b!322103 res!176082) b!322101))

(assert (= (and b!322101 res!176088) b!322106))

(assert (= (and b!322106 res!176080) b!322108))

(declare-fun m!330053 () Bool)

(assert (=> start!32350 m!330053))

(declare-fun m!330055 () Bool)

(assert (=> start!32350 m!330055))

(declare-fun m!330057 () Bool)

(assert (=> b!322100 m!330057))

(declare-fun m!330059 () Bool)

(assert (=> b!322101 m!330059))

(declare-fun m!330061 () Bool)

(assert (=> b!322105 m!330061))

(declare-fun m!330063 () Bool)

(assert (=> b!322109 m!330063))

(assert (=> b!322109 m!330063))

(declare-fun m!330065 () Bool)

(assert (=> b!322109 m!330065))

(declare-fun m!330067 () Bool)

(assert (=> b!322103 m!330067))

(declare-fun m!330069 () Bool)

(assert (=> b!322108 m!330069))

(declare-fun m!330071 () Bool)

(assert (=> b!322106 m!330071))

(declare-fun m!330073 () Bool)

(assert (=> b!322104 m!330073))

(declare-fun m!330075 () Bool)

(assert (=> b!322102 m!330075))

(push 1)

(assert (not b!322101))

(assert (not b!322105))

(assert (not b!322104))

(assert (not b!322100))

(assert (not b!322109))

(assert (not b!322102))

(assert (not b!322108))

(assert (not start!32350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

