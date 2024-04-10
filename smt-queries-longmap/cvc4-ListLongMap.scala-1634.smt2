; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30588 () Bool)

(assert start!30588)

(declare-fun b!306712 () Bool)

(declare-fun res!163547 () Bool)

(declare-fun e!192279 () Bool)

(assert (=> b!306712 (=> (not res!163547) (not e!192279))))

(declare-datatypes ((SeekEntryResult!2521 0))(
  ( (MissingZero!2521 (index!12260 (_ BitVec 32))) (Found!2521 (index!12261 (_ BitVec 32))) (Intermediate!2521 (undefined!3333 Bool) (index!12262 (_ BitVec 32)) (x!30508 (_ BitVec 32))) (Undefined!2521) (MissingVacant!2521 (index!12263 (_ BitVec 32))) )
))
(declare-fun lt!151021 () SeekEntryResult!2521)

(declare-datatypes ((array!15592 0))(
  ( (array!15593 (arr!7381 (Array (_ BitVec 32) (_ BitVec 64))) (size!7733 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15592)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15592 (_ BitVec 32)) SeekEntryResult!2521)

(assert (=> b!306712 (= res!163547 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151021))))

(declare-fun b!306713 () Bool)

(declare-fun res!163542 () Bool)

(declare-fun e!192276 () Bool)

(assert (=> b!306713 (=> (not res!163542) (not e!192276))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15592 (_ BitVec 32)) SeekEntryResult!2521)

(assert (=> b!306713 (= res!163542 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2521 i!1240)))))

(declare-fun b!306714 () Bool)

(declare-fun res!163543 () Bool)

(assert (=> b!306714 (=> (not res!163543) (not e!192279))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306714 (= res!163543 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7381 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306715 () Bool)

(assert (=> b!306715 false))

(declare-fun lt!151022 () SeekEntryResult!2521)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306715 (= lt!151022 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9546 0))(
  ( (Unit!9547) )
))
(declare-fun e!192277 () Unit!9546)

(declare-fun Unit!9548 () Unit!9546)

(assert (=> b!306715 (= e!192277 Unit!9548)))

(declare-fun b!306716 () Bool)

(declare-fun e!192278 () Unit!9546)

(declare-fun Unit!9549 () Unit!9546)

(assert (=> b!306716 (= e!192278 Unit!9549)))

(declare-fun b!306717 () Bool)

(declare-fun res!163546 () Bool)

(assert (=> b!306717 (=> (not res!163546) (not e!192276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15592 (_ BitVec 32)) Bool)

(assert (=> b!306717 (= res!163546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306718 () Bool)

(declare-fun res!163544 () Bool)

(assert (=> b!306718 (=> (not res!163544) (not e!192276))))

(declare-fun arrayContainsKey!0 (array!15592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306718 (= res!163544 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!163549 () Bool)

(assert (=> start!30588 (=> (not res!163549) (not e!192276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30588 (= res!163549 (validMask!0 mask!3709))))

(assert (=> start!30588 e!192276))

(declare-fun array_inv!5344 (array!15592) Bool)

(assert (=> start!30588 (array_inv!5344 a!3293)))

(assert (=> start!30588 true))

(declare-fun b!306719 () Bool)

(assert (=> b!306719 (= e!192278 e!192277)))

(declare-fun c!49188 () Bool)

(assert (=> b!306719 (= c!49188 (or (= (select (arr!7381 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7381 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306720 () Bool)

(assert (=> b!306720 (= e!192276 e!192279)))

(declare-fun res!163545 () Bool)

(assert (=> b!306720 (=> (not res!163545) (not e!192279))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306720 (= res!163545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151021))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306720 (= lt!151021 (Intermediate!2521 false resIndex!52 resX!52))))

(declare-fun b!306721 () Bool)

(declare-fun res!163550 () Bool)

(assert (=> b!306721 (=> (not res!163550) (not e!192279))))

(assert (=> b!306721 (= res!163550 (and (= (select (arr!7381 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7733 a!3293))))))

(declare-fun b!306722 () Bool)

(assert (=> b!306722 (= e!192279 (not (or (not (= (select (arr!7381 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!306722 (= index!1781 resIndex!52)))

(declare-fun lt!151023 () Unit!9546)

(assert (=> b!306722 (= lt!151023 e!192278)))

(declare-fun c!49187 () Bool)

(assert (=> b!306722 (= c!49187 (not (= resIndex!52 index!1781)))))

(declare-fun b!306723 () Bool)

(declare-fun res!163548 () Bool)

(assert (=> b!306723 (=> (not res!163548) (not e!192276))))

(assert (=> b!306723 (= res!163548 (and (= (size!7733 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7733 a!3293))))))

(declare-fun b!306724 () Bool)

(assert (=> b!306724 false))

(declare-fun Unit!9550 () Unit!9546)

(assert (=> b!306724 (= e!192277 Unit!9550)))

(declare-fun b!306725 () Bool)

(declare-fun res!163551 () Bool)

(assert (=> b!306725 (=> (not res!163551) (not e!192276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306725 (= res!163551 (validKeyInArray!0 k!2441))))

(assert (= (and start!30588 res!163549) b!306723))

(assert (= (and b!306723 res!163548) b!306725))

(assert (= (and b!306725 res!163551) b!306718))

(assert (= (and b!306718 res!163544) b!306713))

(assert (= (and b!306713 res!163542) b!306717))

(assert (= (and b!306717 res!163546) b!306720))

(assert (= (and b!306720 res!163545) b!306721))

(assert (= (and b!306721 res!163550) b!306712))

(assert (= (and b!306712 res!163547) b!306714))

(assert (= (and b!306714 res!163543) b!306722))

(assert (= (and b!306722 c!49187) b!306719))

(assert (= (and b!306722 (not c!49187)) b!306716))

(assert (= (and b!306719 c!49188) b!306724))

(assert (= (and b!306719 (not c!49188)) b!306715))

(declare-fun m!317199 () Bool)

(assert (=> b!306721 m!317199))

(declare-fun m!317201 () Bool)

(assert (=> b!306717 m!317201))

(declare-fun m!317203 () Bool)

(assert (=> b!306715 m!317203))

(assert (=> b!306715 m!317203))

(declare-fun m!317205 () Bool)

(assert (=> b!306715 m!317205))

(declare-fun m!317207 () Bool)

(assert (=> b!306725 m!317207))

(declare-fun m!317209 () Bool)

(assert (=> b!306720 m!317209))

(assert (=> b!306720 m!317209))

(declare-fun m!317211 () Bool)

(assert (=> b!306720 m!317211))

(declare-fun m!317213 () Bool)

(assert (=> b!306718 m!317213))

(declare-fun m!317215 () Bool)

(assert (=> b!306712 m!317215))

(declare-fun m!317217 () Bool)

(assert (=> b!306714 m!317217))

(declare-fun m!317219 () Bool)

(assert (=> b!306713 m!317219))

(assert (=> b!306719 m!317217))

(assert (=> b!306722 m!317217))

(declare-fun m!317221 () Bool)

(assert (=> start!30588 m!317221))

(declare-fun m!317223 () Bool)

(assert (=> start!30588 m!317223))

(push 1)

(assert (not b!306720))

(assert (not b!306717))

(assert (not b!306715))

(assert (not b!306725))

(assert (not b!306713))

(assert (not start!30588))

(assert (not b!306718))

(assert (not b!306712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

