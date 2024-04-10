; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30578 () Bool)

(assert start!30578)

(declare-fun b!306502 () Bool)

(declare-fun res!163401 () Bool)

(declare-fun e!192203 () Bool)

(assert (=> b!306502 (=> (not res!163401) (not e!192203))))

(declare-datatypes ((array!15582 0))(
  ( (array!15583 (arr!7376 (Array (_ BitVec 32) (_ BitVec 64))) (size!7728 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15582)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306502 (= res!163401 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306503 () Bool)

(assert (=> b!306503 false))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2516 0))(
  ( (MissingZero!2516 (index!12240 (_ BitVec 32))) (Found!2516 (index!12241 (_ BitVec 32))) (Intermediate!2516 (undefined!3328 Bool) (index!12242 (_ BitVec 32)) (x!30495 (_ BitVec 32))) (Undefined!2516) (MissingVacant!2516 (index!12243 (_ BitVec 32))) )
))
(declare-fun lt!150976 () SeekEntryResult!2516)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15582 (_ BitVec 32)) SeekEntryResult!2516)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306503 (= lt!150976 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9521 0))(
  ( (Unit!9522) )
))
(declare-fun e!192205 () Unit!9521)

(declare-fun Unit!9523 () Unit!9521)

(assert (=> b!306503 (= e!192205 Unit!9523)))

(declare-fun b!306504 () Bool)

(declare-fun res!163396 () Bool)

(declare-fun e!192204 () Bool)

(assert (=> b!306504 (=> (not res!163396) (not e!192204))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306504 (= res!163396 (and (= (select (arr!7376 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7728 a!3293))))))

(declare-fun res!163397 () Bool)

(assert (=> start!30578 (=> (not res!163397) (not e!192203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30578 (= res!163397 (validMask!0 mask!3709))))

(assert (=> start!30578 e!192203))

(declare-fun array_inv!5339 (array!15582) Bool)

(assert (=> start!30578 (array_inv!5339 a!3293)))

(assert (=> start!30578 true))

(declare-fun b!306505 () Bool)

(declare-fun e!192202 () Unit!9521)

(assert (=> b!306505 (= e!192202 e!192205)))

(declare-fun c!49157 () Bool)

(assert (=> b!306505 (= c!49157 (or (= (select (arr!7376 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7376 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306506 () Bool)

(declare-fun Unit!9524 () Unit!9521)

(assert (=> b!306506 (= e!192202 Unit!9524)))

(declare-fun b!306507 () Bool)

(declare-fun res!163398 () Bool)

(assert (=> b!306507 (=> (not res!163398) (not e!192203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15582 (_ BitVec 32)) Bool)

(assert (=> b!306507 (= res!163398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306508 () Bool)

(assert (=> b!306508 (= e!192204 (not true))))

(assert (=> b!306508 (= index!1781 resIndex!52)))

(declare-fun lt!150978 () Unit!9521)

(assert (=> b!306508 (= lt!150978 e!192202)))

(declare-fun c!49158 () Bool)

(assert (=> b!306508 (= c!49158 (not (= resIndex!52 index!1781)))))

(declare-fun b!306509 () Bool)

(declare-fun res!163399 () Bool)

(assert (=> b!306509 (=> (not res!163399) (not e!192203))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15582 (_ BitVec 32)) SeekEntryResult!2516)

(assert (=> b!306509 (= res!163399 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2516 i!1240)))))

(declare-fun b!306510 () Bool)

(declare-fun res!163393 () Bool)

(assert (=> b!306510 (=> (not res!163393) (not e!192203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306510 (= res!163393 (validKeyInArray!0 k!2441))))

(declare-fun b!306511 () Bool)

(declare-fun res!163400 () Bool)

(assert (=> b!306511 (=> (not res!163400) (not e!192203))))

(assert (=> b!306511 (= res!163400 (and (= (size!7728 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7728 a!3293))))))

(declare-fun b!306512 () Bool)

(declare-fun res!163395 () Bool)

(assert (=> b!306512 (=> (not res!163395) (not e!192204))))

(assert (=> b!306512 (= res!163395 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7376 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306513 () Bool)

(assert (=> b!306513 (= e!192203 e!192204)))

(declare-fun res!163392 () Bool)

(assert (=> b!306513 (=> (not res!163392) (not e!192204))))

(declare-fun lt!150977 () SeekEntryResult!2516)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306513 (= res!163392 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150977))))

(assert (=> b!306513 (= lt!150977 (Intermediate!2516 false resIndex!52 resX!52))))

(declare-fun b!306514 () Bool)

(assert (=> b!306514 false))

(declare-fun Unit!9525 () Unit!9521)

(assert (=> b!306514 (= e!192205 Unit!9525)))

(declare-fun b!306515 () Bool)

(declare-fun res!163394 () Bool)

(assert (=> b!306515 (=> (not res!163394) (not e!192204))))

(assert (=> b!306515 (= res!163394 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150977))))

(assert (= (and start!30578 res!163397) b!306511))

(assert (= (and b!306511 res!163400) b!306510))

(assert (= (and b!306510 res!163393) b!306502))

(assert (= (and b!306502 res!163401) b!306509))

(assert (= (and b!306509 res!163399) b!306507))

(assert (= (and b!306507 res!163398) b!306513))

(assert (= (and b!306513 res!163392) b!306504))

(assert (= (and b!306504 res!163396) b!306515))

(assert (= (and b!306515 res!163394) b!306512))

(assert (= (and b!306512 res!163395) b!306508))

(assert (= (and b!306508 c!49158) b!306505))

(assert (= (and b!306508 (not c!49158)) b!306506))

(assert (= (and b!306505 c!49157) b!306514))

(assert (= (and b!306505 (not c!49157)) b!306503))

(declare-fun m!317069 () Bool)

(assert (=> b!306502 m!317069))

(declare-fun m!317071 () Bool)

(assert (=> b!306505 m!317071))

(declare-fun m!317073 () Bool)

(assert (=> b!306513 m!317073))

(assert (=> b!306513 m!317073))

(declare-fun m!317075 () Bool)

(assert (=> b!306513 m!317075))

(declare-fun m!317077 () Bool)

(assert (=> b!306507 m!317077))

(declare-fun m!317079 () Bool)

(assert (=> b!306510 m!317079))

(declare-fun m!317081 () Bool)

(assert (=> b!306503 m!317081))

(assert (=> b!306503 m!317081))

(declare-fun m!317083 () Bool)

(assert (=> b!306503 m!317083))

(declare-fun m!317085 () Bool)

(assert (=> b!306515 m!317085))

(declare-fun m!317087 () Bool)

(assert (=> b!306504 m!317087))

(declare-fun m!317089 () Bool)

(assert (=> b!306509 m!317089))

(assert (=> b!306512 m!317071))

(declare-fun m!317091 () Bool)

(assert (=> start!30578 m!317091))

(declare-fun m!317093 () Bool)

(assert (=> start!30578 m!317093))

(push 1)

