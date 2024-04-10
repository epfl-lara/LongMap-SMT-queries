; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31034 () Bool)

(assert start!31034)

(declare-fun b!312047 () Bool)

(declare-fun res!168508 () Bool)

(declare-fun e!194623 () Bool)

(assert (=> b!312047 (=> (not res!168508) (not e!194623))))

(declare-datatypes ((array!15936 0))(
  ( (array!15937 (arr!7550 (Array (_ BitVec 32) (_ BitVec 64))) (size!7902 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15936)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312047 (= res!168508 (and (= (select (arr!7550 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7902 a!3293))))))

(declare-fun res!168501 () Bool)

(declare-fun e!194626 () Bool)

(assert (=> start!31034 (=> (not res!168501) (not e!194626))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31034 (= res!168501 (validMask!0 mask!3709))))

(assert (=> start!31034 e!194626))

(declare-fun array_inv!5513 (array!15936) Bool)

(assert (=> start!31034 (array_inv!5513 a!3293)))

(assert (=> start!31034 true))

(declare-fun b!312048 () Bool)

(declare-fun res!168510 () Bool)

(assert (=> b!312048 (=> (not res!168510) (not e!194626))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2690 0))(
  ( (MissingZero!2690 (index!12936 (_ BitVec 32))) (Found!2690 (index!12937 (_ BitVec 32))) (Intermediate!2690 (undefined!3502 Bool) (index!12938 (_ BitVec 32)) (x!31151 (_ BitVec 32))) (Undefined!2690) (MissingVacant!2690 (index!12939 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15936 (_ BitVec 32)) SeekEntryResult!2690)

(assert (=> b!312048 (= res!168510 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2690 i!1240)))))

(declare-fun b!312049 () Bool)

(declare-fun res!168506 () Bool)

(assert (=> b!312049 (=> (not res!168506) (not e!194626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15936 (_ BitVec 32)) Bool)

(assert (=> b!312049 (= res!168506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312050 () Bool)

(declare-fun e!194622 () Bool)

(assert (=> b!312050 (= e!194623 e!194622)))

(declare-fun res!168504 () Bool)

(assert (=> b!312050 (=> (not res!168504) (not e!194622))))

(declare-fun lt!152717 () SeekEntryResult!2690)

(declare-fun lt!152716 () SeekEntryResult!2690)

(assert (=> b!312050 (= res!168504 (and (= lt!152717 lt!152716) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7550 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15936 (_ BitVec 32)) SeekEntryResult!2690)

(assert (=> b!312050 (= lt!152717 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312051 () Bool)

(declare-fun res!168505 () Bool)

(assert (=> b!312051 (=> (not res!168505) (not e!194626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312051 (= res!168505 (validKeyInArray!0 k!2441))))

(declare-fun b!312052 () Bool)

(declare-fun res!168502 () Bool)

(assert (=> b!312052 (=> (not res!168502) (not e!194626))))

(assert (=> b!312052 (= res!168502 (and (= (size!7902 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7902 a!3293))))))

(declare-fun b!312053 () Bool)

(declare-fun res!168503 () Bool)

(assert (=> b!312053 (=> (not res!168503) (not e!194626))))

(declare-fun arrayContainsKey!0 (array!15936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312053 (= res!168503 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312054 () Bool)

(assert (=> b!312054 (= e!194626 e!194623)))

(declare-fun res!168507 () Bool)

(assert (=> b!312054 (=> (not res!168507) (not e!194623))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312054 (= res!168507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152716))))

(assert (=> b!312054 (= lt!152716 (Intermediate!2690 false resIndex!52 resX!52))))

(declare-fun b!312055 () Bool)

(declare-fun e!194624 () Bool)

(assert (=> b!312055 (= e!194624 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun lt!152720 () SeekEntryResult!2690)

(declare-fun lt!152715 () SeekEntryResult!2690)

(assert (=> b!312055 (= lt!152720 lt!152715)))

(declare-fun lt!152714 () (_ BitVec 32))

(declare-datatypes ((Unit!9611 0))(
  ( (Unit!9612) )
))
(declare-fun lt!152718 () Unit!9611)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15936 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9611)

(assert (=> b!312055 (= lt!152718 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152714 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312056 () Bool)

(assert (=> b!312056 (= e!194622 (not e!194624))))

(declare-fun res!168509 () Bool)

(assert (=> b!312056 (=> res!168509 e!194624)))

(assert (=> b!312056 (= res!168509 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152714 #b00000000000000000000000000000000) (bvsge lt!152714 (size!7902 a!3293)) (not (= lt!152715 lt!152716))))))

(declare-fun lt!152719 () SeekEntryResult!2690)

(assert (=> b!312056 (= lt!152719 lt!152720)))

(declare-fun lt!152721 () array!15936)

(assert (=> b!312056 (= lt!152720 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152714 k!2441 lt!152721 mask!3709))))

(assert (=> b!312056 (= lt!152719 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152721 mask!3709))))

(assert (=> b!312056 (= lt!152721 (array!15937 (store (arr!7550 a!3293) i!1240 k!2441) (size!7902 a!3293)))))

(assert (=> b!312056 (= lt!152717 lt!152715)))

(assert (=> b!312056 (= lt!152715 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152714 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312056 (= lt!152714 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31034 res!168501) b!312052))

(assert (= (and b!312052 res!168502) b!312051))

(assert (= (and b!312051 res!168505) b!312053))

(assert (= (and b!312053 res!168503) b!312048))

(assert (= (and b!312048 res!168510) b!312049))

(assert (= (and b!312049 res!168506) b!312054))

(assert (= (and b!312054 res!168507) b!312047))

(assert (= (and b!312047 res!168508) b!312050))

(assert (= (and b!312050 res!168504) b!312056))

(assert (= (and b!312056 (not res!168509)) b!312055))

(declare-fun m!322079 () Bool)

(assert (=> b!312056 m!322079))

(declare-fun m!322081 () Bool)

(assert (=> b!312056 m!322081))

(declare-fun m!322083 () Bool)

(assert (=> b!312056 m!322083))

(declare-fun m!322085 () Bool)

(assert (=> b!312056 m!322085))

(declare-fun m!322087 () Bool)

(assert (=> b!312056 m!322087))

(declare-fun m!322089 () Bool)

(assert (=> b!312048 m!322089))

(declare-fun m!322091 () Bool)

(assert (=> b!312055 m!322091))

(declare-fun m!322093 () Bool)

(assert (=> b!312049 m!322093))

(declare-fun m!322095 () Bool)

(assert (=> b!312047 m!322095))

(declare-fun m!322097 () Bool)

(assert (=> b!312054 m!322097))

(assert (=> b!312054 m!322097))

(declare-fun m!322099 () Bool)

(assert (=> b!312054 m!322099))

(declare-fun m!322101 () Bool)

(assert (=> b!312051 m!322101))

(declare-fun m!322103 () Bool)

(assert (=> b!312050 m!322103))

(declare-fun m!322105 () Bool)

(assert (=> b!312050 m!322105))

(declare-fun m!322107 () Bool)

(assert (=> b!312053 m!322107))

(declare-fun m!322109 () Bool)

(assert (=> start!31034 m!322109))

(declare-fun m!322111 () Bool)

(assert (=> start!31034 m!322111))

(push 1)

(assert (not b!312048))

(assert (not b!312051))

(assert (not b!312049))

(assert (not start!31034))

(assert (not b!312056))

(assert (not b!312053))

(assert (not b!312055))

(assert (not b!312054))

(assert (not b!312050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

