; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30252 () Bool)

(assert start!30252)

(declare-fun b!302721 () Bool)

(declare-fun res!160212 () Bool)

(declare-fun e!190750 () Bool)

(assert (=> b!302721 (=> (not res!160212) (not e!190750))))

(declare-datatypes ((array!15358 0))(
  ( (array!15359 (arr!7267 (Array (_ BitVec 32) (_ BitVec 64))) (size!7619 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15358)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2407 0))(
  ( (MissingZero!2407 (index!11804 (_ BitVec 32))) (Found!2407 (index!11805 (_ BitVec 32))) (Intermediate!2407 (undefined!3219 Bool) (index!11806 (_ BitVec 32)) (x!30072 (_ BitVec 32))) (Undefined!2407) (MissingVacant!2407 (index!11807 (_ BitVec 32))) )
))
(declare-fun lt!150123 () SeekEntryResult!2407)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15358 (_ BitVec 32)) SeekEntryResult!2407)

(assert (=> b!302721 (= res!160212 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150123))))

(declare-fun res!160214 () Bool)

(declare-fun e!190749 () Bool)

(assert (=> start!30252 (=> (not res!160214) (not e!190749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30252 (= res!160214 (validMask!0 mask!3709))))

(assert (=> start!30252 e!190749))

(declare-fun array_inv!5230 (array!15358) Bool)

(assert (=> start!30252 (array_inv!5230 a!3293)))

(assert (=> start!30252 true))

(declare-fun b!302722 () Bool)

(declare-fun res!160207 () Bool)

(assert (=> b!302722 (=> (not res!160207) (not e!190749))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302722 (= res!160207 (and (= (size!7619 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7619 a!3293))))))

(declare-fun b!302723 () Bool)

(declare-fun res!160215 () Bool)

(assert (=> b!302723 (=> (not res!160215) (not e!190750))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!302723 (= res!160215 (and (= (select (arr!7267 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7619 a!3293))))))

(declare-fun b!302724 () Bool)

(declare-fun res!160210 () Bool)

(assert (=> b!302724 (=> (not res!160210) (not e!190749))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15358 (_ BitVec 32)) SeekEntryResult!2407)

(assert (=> b!302724 (= res!160210 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2407 i!1240)))))

(declare-fun b!302725 () Bool)

(declare-fun res!160213 () Bool)

(assert (=> b!302725 (=> (not res!160213) (not e!190749))))

(declare-fun arrayContainsKey!0 (array!15358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302725 (= res!160213 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302726 () Bool)

(assert (=> b!302726 (= e!190750 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7267 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7267 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7267 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!302727 () Bool)

(declare-fun res!160211 () Bool)

(assert (=> b!302727 (=> (not res!160211) (not e!190749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302727 (= res!160211 (validKeyInArray!0 k!2441))))

(declare-fun b!302728 () Bool)

(assert (=> b!302728 (= e!190749 e!190750)))

(declare-fun res!160209 () Bool)

(assert (=> b!302728 (=> (not res!160209) (not e!190750))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302728 (= res!160209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150123))))

(assert (=> b!302728 (= lt!150123 (Intermediate!2407 false resIndex!52 resX!52))))

(declare-fun b!302729 () Bool)

(declare-fun res!160208 () Bool)

(assert (=> b!302729 (=> (not res!160208) (not e!190749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15358 (_ BitVec 32)) Bool)

(assert (=> b!302729 (= res!160208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30252 res!160214) b!302722))

(assert (= (and b!302722 res!160207) b!302727))

(assert (= (and b!302727 res!160211) b!302725))

(assert (= (and b!302725 res!160213) b!302724))

(assert (= (and b!302724 res!160210) b!302729))

(assert (= (and b!302729 res!160208) b!302728))

(assert (= (and b!302728 res!160209) b!302723))

(assert (= (and b!302723 res!160215) b!302721))

(assert (= (and b!302721 res!160212) b!302726))

(declare-fun m!314197 () Bool)

(assert (=> b!302721 m!314197))

(declare-fun m!314199 () Bool)

(assert (=> b!302729 m!314199))

(declare-fun m!314201 () Bool)

(assert (=> b!302723 m!314201))

(declare-fun m!314203 () Bool)

(assert (=> b!302727 m!314203))

(declare-fun m!314205 () Bool)

(assert (=> b!302724 m!314205))

(declare-fun m!314207 () Bool)

(assert (=> start!30252 m!314207))

(declare-fun m!314209 () Bool)

(assert (=> start!30252 m!314209))

(declare-fun m!314211 () Bool)

(assert (=> b!302728 m!314211))

(assert (=> b!302728 m!314211))

(declare-fun m!314213 () Bool)

(assert (=> b!302728 m!314213))

(declare-fun m!314215 () Bool)

(assert (=> b!302726 m!314215))

(declare-fun m!314217 () Bool)

(assert (=> b!302725 m!314217))

(push 1)

(assert (not b!302728))

(assert (not b!302724))

(assert (not b!302727))

(assert (not start!30252))

(assert (not b!302721))

(assert (not b!302729))

(assert (not b!302725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

