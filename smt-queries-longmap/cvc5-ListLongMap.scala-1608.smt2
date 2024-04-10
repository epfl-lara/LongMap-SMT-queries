; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30320 () Bool)

(assert start!30320)

(declare-fun b!303594 () Bool)

(declare-fun res!161082 () Bool)

(declare-fun e!191009 () Bool)

(assert (=> b!303594 (=> (not res!161082) (not e!191009))))

(declare-datatypes ((array!15426 0))(
  ( (array!15427 (arr!7301 (Array (_ BitVec 32) (_ BitVec 64))) (size!7653 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15426)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303594 (= res!161082 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303595 () Bool)

(declare-fun e!191010 () Bool)

(assert (=> b!303595 (= e!191009 e!191010)))

(declare-fun res!161086 () Bool)

(assert (=> b!303595 (=> (not res!161086) (not e!191010))))

(declare-datatypes ((SeekEntryResult!2441 0))(
  ( (MissingZero!2441 (index!11940 (_ BitVec 32))) (Found!2441 (index!11941 (_ BitVec 32))) (Intermediate!2441 (undefined!3253 Bool) (index!11942 (_ BitVec 32)) (x!30202 (_ BitVec 32))) (Undefined!2441) (MissingVacant!2441 (index!11943 (_ BitVec 32))) )
))
(declare-fun lt!150225 () SeekEntryResult!2441)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15426 (_ BitVec 32)) SeekEntryResult!2441)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303595 (= res!161086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150225))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303595 (= lt!150225 (Intermediate!2441 false resIndex!52 resX!52))))

(declare-fun res!161087 () Bool)

(assert (=> start!30320 (=> (not res!161087) (not e!191009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30320 (= res!161087 (validMask!0 mask!3709))))

(assert (=> start!30320 e!191009))

(declare-fun array_inv!5264 (array!15426) Bool)

(assert (=> start!30320 (array_inv!5264 a!3293)))

(assert (=> start!30320 true))

(declare-fun b!303596 () Bool)

(declare-fun res!161084 () Bool)

(assert (=> b!303596 (=> (not res!161084) (not e!191009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15426 (_ BitVec 32)) Bool)

(assert (=> b!303596 (= res!161084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303597 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303597 (= e!191010 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7301 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7301 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7301 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!303598 () Bool)

(declare-fun res!161080 () Bool)

(assert (=> b!303598 (=> (not res!161080) (not e!191010))))

(assert (=> b!303598 (= res!161080 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150225))))

(declare-fun b!303599 () Bool)

(declare-fun res!161085 () Bool)

(assert (=> b!303599 (=> (not res!161085) (not e!191009))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303599 (= res!161085 (and (= (size!7653 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7653 a!3293))))))

(declare-fun b!303600 () Bool)

(declare-fun res!161088 () Bool)

(assert (=> b!303600 (=> (not res!161088) (not e!191009))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15426 (_ BitVec 32)) SeekEntryResult!2441)

(assert (=> b!303600 (= res!161088 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2441 i!1240)))))

(declare-fun b!303601 () Bool)

(declare-fun res!161083 () Bool)

(assert (=> b!303601 (=> (not res!161083) (not e!191010))))

(assert (=> b!303601 (= res!161083 (and (= (select (arr!7301 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7653 a!3293))))))

(declare-fun b!303602 () Bool)

(declare-fun res!161081 () Bool)

(assert (=> b!303602 (=> (not res!161081) (not e!191009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303602 (= res!161081 (validKeyInArray!0 k!2441))))

(assert (= (and start!30320 res!161087) b!303599))

(assert (= (and b!303599 res!161085) b!303602))

(assert (= (and b!303602 res!161081) b!303594))

(assert (= (and b!303594 res!161082) b!303600))

(assert (= (and b!303600 res!161088) b!303596))

(assert (= (and b!303596 res!161084) b!303595))

(assert (= (and b!303595 res!161086) b!303601))

(assert (= (and b!303601 res!161083) b!303598))

(assert (= (and b!303598 res!161080) b!303597))

(declare-fun m!314915 () Bool)

(assert (=> start!30320 m!314915))

(declare-fun m!314917 () Bool)

(assert (=> start!30320 m!314917))

(declare-fun m!314919 () Bool)

(assert (=> b!303602 m!314919))

(declare-fun m!314921 () Bool)

(assert (=> b!303596 m!314921))

(declare-fun m!314923 () Bool)

(assert (=> b!303600 m!314923))

(declare-fun m!314925 () Bool)

(assert (=> b!303594 m!314925))

(declare-fun m!314927 () Bool)

(assert (=> b!303597 m!314927))

(declare-fun m!314929 () Bool)

(assert (=> b!303601 m!314929))

(declare-fun m!314931 () Bool)

(assert (=> b!303598 m!314931))

(declare-fun m!314933 () Bool)

(assert (=> b!303595 m!314933))

(assert (=> b!303595 m!314933))

(declare-fun m!314935 () Bool)

(assert (=> b!303595 m!314935))

(push 1)

