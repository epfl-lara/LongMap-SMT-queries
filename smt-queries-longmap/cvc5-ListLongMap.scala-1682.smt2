; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30980 () Bool)

(assert start!30980)

(declare-fun b!311238 () Bool)

(declare-fun res!167696 () Bool)

(declare-fun e!194217 () Bool)

(assert (=> b!311238 (=> (not res!167696) (not e!194217))))

(declare-datatypes ((array!15882 0))(
  ( (array!15883 (arr!7523 (Array (_ BitVec 32) (_ BitVec 64))) (size!7875 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15882)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311238 (= res!167696 (and (= (select (arr!7523 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7875 a!3293))))))

(declare-fun b!311239 () Bool)

(declare-fun res!167693 () Bool)

(declare-fun e!194219 () Bool)

(assert (=> b!311239 (=> (not res!167693) (not e!194219))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2663 0))(
  ( (MissingZero!2663 (index!12828 (_ BitVec 32))) (Found!2663 (index!12829 (_ BitVec 32))) (Intermediate!2663 (undefined!3475 Bool) (index!12830 (_ BitVec 32)) (x!31052 (_ BitVec 32))) (Undefined!2663) (MissingVacant!2663 (index!12831 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15882 (_ BitVec 32)) SeekEntryResult!2663)

(assert (=> b!311239 (= res!167693 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2663 i!1240)))))

(declare-fun b!311240 () Bool)

(declare-fun res!167699 () Bool)

(assert (=> b!311240 (=> (not res!167699) (not e!194219))))

(declare-fun arrayContainsKey!0 (array!15882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311240 (= res!167699 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311241 () Bool)

(declare-fun res!167691 () Bool)

(assert (=> b!311241 (=> (not res!167691) (not e!194219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15882 (_ BitVec 32)) Bool)

(assert (=> b!311241 (= res!167691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311242 () Bool)

(declare-fun res!167700 () Bool)

(assert (=> b!311242 (=> (not res!167700) (not e!194219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311242 (= res!167700 (validKeyInArray!0 k!2441))))

(declare-fun b!311243 () Bool)

(assert (=> b!311243 (= e!194219 e!194217)))

(declare-fun res!167695 () Bool)

(assert (=> b!311243 (=> (not res!167695) (not e!194217))))

(declare-fun lt!152275 () SeekEntryResult!2663)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15882 (_ BitVec 32)) SeekEntryResult!2663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311243 (= res!167695 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152275))))

(assert (=> b!311243 (= lt!152275 (Intermediate!2663 false resIndex!52 resX!52))))

(declare-fun e!194218 () Bool)

(declare-fun lt!152277 () (_ BitVec 32))

(declare-fun b!311244 () Bool)

(declare-fun lt!152276 () array!15882)

(assert (=> b!311244 (= e!194218 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152276 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152277 k!2441 lt!152276 mask!3709)))))

(assert (=> b!311244 (= lt!152276 (array!15883 (store (arr!7523 a!3293) i!1240 k!2441) (size!7875 a!3293)))))

(declare-fun b!311237 () Bool)

(declare-fun e!194221 () Bool)

(assert (=> b!311237 (= e!194221 (not true))))

(assert (=> b!311237 e!194218))

(declare-fun res!167692 () Bool)

(assert (=> b!311237 (=> (not res!167692) (not e!194218))))

(declare-fun lt!152274 () SeekEntryResult!2663)

(assert (=> b!311237 (= res!167692 (= lt!152274 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152277 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311237 (= lt!152277 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!167694 () Bool)

(assert (=> start!30980 (=> (not res!167694) (not e!194219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30980 (= res!167694 (validMask!0 mask!3709))))

(assert (=> start!30980 e!194219))

(declare-fun array_inv!5486 (array!15882) Bool)

(assert (=> start!30980 (array_inv!5486 a!3293)))

(assert (=> start!30980 true))

(declare-fun b!311245 () Bool)

(assert (=> b!311245 (= e!194217 e!194221)))

(declare-fun res!167698 () Bool)

(assert (=> b!311245 (=> (not res!167698) (not e!194221))))

(assert (=> b!311245 (= res!167698 (and (= lt!152274 lt!152275) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7523 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311245 (= lt!152274 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311246 () Bool)

(declare-fun res!167697 () Bool)

(assert (=> b!311246 (=> (not res!167697) (not e!194219))))

(assert (=> b!311246 (= res!167697 (and (= (size!7875 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7875 a!3293))))))

(assert (= (and start!30980 res!167694) b!311246))

(assert (= (and b!311246 res!167697) b!311242))

(assert (= (and b!311242 res!167700) b!311240))

(assert (= (and b!311240 res!167699) b!311239))

(assert (= (and b!311239 res!167693) b!311241))

(assert (= (and b!311241 res!167691) b!311243))

(assert (= (and b!311243 res!167695) b!311238))

(assert (= (and b!311238 res!167696) b!311245))

(assert (= (and b!311245 res!167698) b!311237))

(assert (= (and b!311237 res!167692) b!311244))

(declare-fun m!321197 () Bool)

(assert (=> b!311240 m!321197))

(declare-fun m!321199 () Bool)

(assert (=> b!311238 m!321199))

(declare-fun m!321201 () Bool)

(assert (=> b!311239 m!321201))

(declare-fun m!321203 () Bool)

(assert (=> b!311242 m!321203))

(declare-fun m!321205 () Bool)

(assert (=> b!311237 m!321205))

(declare-fun m!321207 () Bool)

(assert (=> b!311237 m!321207))

(declare-fun m!321209 () Bool)

(assert (=> b!311245 m!321209))

(declare-fun m!321211 () Bool)

(assert (=> b!311245 m!321211))

(declare-fun m!321213 () Bool)

(assert (=> b!311241 m!321213))

(declare-fun m!321215 () Bool)

(assert (=> start!30980 m!321215))

(declare-fun m!321217 () Bool)

(assert (=> start!30980 m!321217))

(declare-fun m!321219 () Bool)

(assert (=> b!311243 m!321219))

(assert (=> b!311243 m!321219))

(declare-fun m!321221 () Bool)

(assert (=> b!311243 m!321221))

(declare-fun m!321223 () Bool)

(assert (=> b!311244 m!321223))

(declare-fun m!321225 () Bool)

(assert (=> b!311244 m!321225))

(declare-fun m!321227 () Bool)

(assert (=> b!311244 m!321227))

(push 1)

