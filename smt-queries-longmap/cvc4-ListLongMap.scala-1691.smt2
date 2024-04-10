; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31038 () Bool)

(assert start!31038)

(declare-fun b!312107 () Bool)

(declare-fun res!168566 () Bool)

(declare-fun e!194656 () Bool)

(assert (=> b!312107 (=> (not res!168566) (not e!194656))))

(declare-datatypes ((array!15940 0))(
  ( (array!15941 (arr!7552 (Array (_ BitVec 32) (_ BitVec 64))) (size!7904 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15940)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312107 (= res!168566 (and (= (size!7904 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7904 a!3293))))))

(declare-fun b!312108 () Bool)

(declare-fun e!194654 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312108 (= e!194654 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-datatypes ((SeekEntryResult!2692 0))(
  ( (MissingZero!2692 (index!12944 (_ BitVec 32))) (Found!2692 (index!12945 (_ BitVec 32))) (Intermediate!2692 (undefined!3504 Bool) (index!12946 (_ BitVec 32)) (x!31153 (_ BitVec 32))) (Undefined!2692) (MissingVacant!2692 (index!12947 (_ BitVec 32))) )
))
(declare-fun lt!152765 () SeekEntryResult!2692)

(declare-fun lt!152769 () SeekEntryResult!2692)

(assert (=> b!312108 (= lt!152765 lt!152769)))

(declare-datatypes ((Unit!9615 0))(
  ( (Unit!9616) )
))
(declare-fun lt!152767 () Unit!9615)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152762 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15940 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9615)

(assert (=> b!312108 (= lt!152767 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152762 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312109 () Bool)

(declare-fun e!194652 () Bool)

(assert (=> b!312109 (= e!194656 e!194652)))

(declare-fun res!168570 () Bool)

(assert (=> b!312109 (=> (not res!168570) (not e!194652))))

(declare-fun lt!152768 () SeekEntryResult!2692)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15940 (_ BitVec 32)) SeekEntryResult!2692)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312109 (= res!168570 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152768))))

(assert (=> b!312109 (= lt!152768 (Intermediate!2692 false resIndex!52 resX!52))))

(declare-fun b!312110 () Bool)

(declare-fun e!194655 () Bool)

(assert (=> b!312110 (= e!194652 e!194655)))

(declare-fun res!168565 () Bool)

(assert (=> b!312110 (=> (not res!168565) (not e!194655))))

(declare-fun lt!152764 () SeekEntryResult!2692)

(assert (=> b!312110 (= res!168565 (and (= lt!152764 lt!152768) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7552 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312110 (= lt!152764 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312111 () Bool)

(declare-fun res!168561 () Bool)

(assert (=> b!312111 (=> (not res!168561) (not e!194656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312111 (= res!168561 (validKeyInArray!0 k!2441))))

(declare-fun b!312112 () Bool)

(declare-fun res!168568 () Bool)

(assert (=> b!312112 (=> (not res!168568) (not e!194656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15940 (_ BitVec 32)) Bool)

(assert (=> b!312112 (= res!168568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312113 () Bool)

(declare-fun res!168562 () Bool)

(assert (=> b!312113 (=> (not res!168562) (not e!194656))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15940 (_ BitVec 32)) SeekEntryResult!2692)

(assert (=> b!312113 (= res!168562 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2692 i!1240)))))

(declare-fun b!312114 () Bool)

(assert (=> b!312114 (= e!194655 (not e!194654))))

(declare-fun res!168564 () Bool)

(assert (=> b!312114 (=> res!168564 e!194654)))

(assert (=> b!312114 (= res!168564 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152762 #b00000000000000000000000000000000) (bvsge lt!152762 (size!7904 a!3293)) (not (= lt!152769 lt!152768))))))

(declare-fun lt!152766 () SeekEntryResult!2692)

(assert (=> b!312114 (= lt!152766 lt!152765)))

(declare-fun lt!152763 () array!15940)

(assert (=> b!312114 (= lt!152765 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152762 k!2441 lt!152763 mask!3709))))

(assert (=> b!312114 (= lt!152766 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152763 mask!3709))))

(assert (=> b!312114 (= lt!152763 (array!15941 (store (arr!7552 a!3293) i!1240 k!2441) (size!7904 a!3293)))))

(assert (=> b!312114 (= lt!152764 lt!152769)))

(assert (=> b!312114 (= lt!152769 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152762 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312114 (= lt!152762 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312115 () Bool)

(declare-fun res!168567 () Bool)

(assert (=> b!312115 (=> (not res!168567) (not e!194656))))

(declare-fun arrayContainsKey!0 (array!15940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312115 (= res!168567 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!168569 () Bool)

(assert (=> start!31038 (=> (not res!168569) (not e!194656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31038 (= res!168569 (validMask!0 mask!3709))))

(assert (=> start!31038 e!194656))

(declare-fun array_inv!5515 (array!15940) Bool)

(assert (=> start!31038 (array_inv!5515 a!3293)))

(assert (=> start!31038 true))

(declare-fun b!312116 () Bool)

(declare-fun res!168563 () Bool)

(assert (=> b!312116 (=> (not res!168563) (not e!194652))))

(assert (=> b!312116 (= res!168563 (and (= (select (arr!7552 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7904 a!3293))))))

(assert (= (and start!31038 res!168569) b!312107))

(assert (= (and b!312107 res!168566) b!312111))

(assert (= (and b!312111 res!168561) b!312115))

(assert (= (and b!312115 res!168567) b!312113))

(assert (= (and b!312113 res!168562) b!312112))

(assert (= (and b!312112 res!168568) b!312109))

(assert (= (and b!312109 res!168570) b!312116))

(assert (= (and b!312116 res!168563) b!312110))

(assert (= (and b!312110 res!168565) b!312114))

(assert (= (and b!312114 (not res!168564)) b!312108))

(declare-fun m!322147 () Bool)

(assert (=> b!312116 m!322147))

(declare-fun m!322149 () Bool)

(assert (=> start!31038 m!322149))

(declare-fun m!322151 () Bool)

(assert (=> start!31038 m!322151))

(declare-fun m!322153 () Bool)

(assert (=> b!312111 m!322153))

(declare-fun m!322155 () Bool)

(assert (=> b!312109 m!322155))

(assert (=> b!312109 m!322155))

(declare-fun m!322157 () Bool)

(assert (=> b!312109 m!322157))

(declare-fun m!322159 () Bool)

(assert (=> b!312115 m!322159))

(declare-fun m!322161 () Bool)

(assert (=> b!312113 m!322161))

(declare-fun m!322163 () Bool)

(assert (=> b!312108 m!322163))

(declare-fun m!322165 () Bool)

(assert (=> b!312110 m!322165))

(declare-fun m!322167 () Bool)

(assert (=> b!312110 m!322167))

(declare-fun m!322169 () Bool)

(assert (=> b!312112 m!322169))

(declare-fun m!322171 () Bool)

(assert (=> b!312114 m!322171))

(declare-fun m!322173 () Bool)

(assert (=> b!312114 m!322173))

(declare-fun m!322175 () Bool)

(assert (=> b!312114 m!322175))

(declare-fun m!322177 () Bool)

(assert (=> b!312114 m!322177))

(declare-fun m!322179 () Bool)

(assert (=> b!312114 m!322179))

(push 1)

(assert (not b!312110))

(assert (not b!312111))

(assert (not b!312114))

(assert (not b!312113))

(assert (not b!312115))

(assert (not start!31038))

(assert (not b!312112))

(assert (not b!312108))

(assert (not b!312109))

(check-sat)

(pop 1)

(push 1)

(check-sat)

