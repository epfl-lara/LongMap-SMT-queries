; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30256 () Bool)

(assert start!30256)

(declare-fun b!302894 () Bool)

(declare-fun e!190779 () Bool)

(assert (=> b!302894 (= e!190779 false)))

(declare-datatypes ((array!15375 0))(
  ( (array!15376 (arr!7275 (Array (_ BitVec 32) (_ BitVec 64))) (size!7627 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15375)

(declare-datatypes ((SeekEntryResult!2380 0))(
  ( (MissingZero!2380 (index!11696 (_ BitVec 32))) (Found!2380 (index!11697 (_ BitVec 32))) (Intermediate!2380 (undefined!3192 Bool) (index!11698 (_ BitVec 32)) (x!30066 (_ BitVec 32))) (Undefined!2380) (MissingVacant!2380 (index!11699 (_ BitVec 32))) )
))
(declare-fun lt!150168 () SeekEntryResult!2380)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15375 (_ BitVec 32)) SeekEntryResult!2380)

(assert (=> b!302894 (= lt!150168 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!160431 () Bool)

(assert (=> start!30256 (=> (not res!160431) (not e!190779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30256 (= res!160431 (validMask!0 mask!3709))))

(assert (=> start!30256 e!190779))

(declare-fun array_inv!5225 (array!15375) Bool)

(assert (=> start!30256 (array_inv!5225 a!3293)))

(assert (=> start!30256 true))

(declare-fun b!302895 () Bool)

(declare-fun res!160430 () Bool)

(assert (=> b!302895 (=> (not res!160430) (not e!190779))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302895 (= res!160430 (and (= (select (arr!7275 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7627 a!3293))))))

(declare-fun b!302896 () Bool)

(declare-fun res!160437 () Bool)

(assert (=> b!302896 (=> (not res!160437) (not e!190779))))

(declare-fun arrayContainsKey!0 (array!15375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302896 (= res!160437 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302897 () Bool)

(declare-fun res!160436 () Bool)

(assert (=> b!302897 (=> (not res!160436) (not e!190779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302897 (= res!160436 (validKeyInArray!0 k!2441))))

(declare-fun b!302898 () Bool)

(declare-fun res!160434 () Bool)

(assert (=> b!302898 (=> (not res!160434) (not e!190779))))

(assert (=> b!302898 (= res!160434 (and (= (size!7627 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7627 a!3293))))))

(declare-fun b!302899 () Bool)

(declare-fun res!160435 () Bool)

(assert (=> b!302899 (=> (not res!160435) (not e!190779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15375 (_ BitVec 32)) Bool)

(assert (=> b!302899 (= res!160435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302900 () Bool)

(declare-fun res!160433 () Bool)

(assert (=> b!302900 (=> (not res!160433) (not e!190779))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302900 (= res!160433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2380 false resIndex!52 resX!52)))))

(declare-fun b!302901 () Bool)

(declare-fun res!160432 () Bool)

(assert (=> b!302901 (=> (not res!160432) (not e!190779))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15375 (_ BitVec 32)) SeekEntryResult!2380)

(assert (=> b!302901 (= res!160432 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2380 i!1240)))))

(assert (= (and start!30256 res!160431) b!302898))

(assert (= (and b!302898 res!160434) b!302897))

(assert (= (and b!302897 res!160436) b!302896))

(assert (= (and b!302896 res!160437) b!302901))

(assert (= (and b!302901 res!160432) b!302899))

(assert (= (and b!302899 res!160435) b!302900))

(assert (= (and b!302900 res!160433) b!302895))

(assert (= (and b!302895 res!160430) b!302894))

(declare-fun m!314495 () Bool)

(assert (=> b!302894 m!314495))

(declare-fun m!314497 () Bool)

(assert (=> b!302900 m!314497))

(assert (=> b!302900 m!314497))

(declare-fun m!314499 () Bool)

(assert (=> b!302900 m!314499))

(declare-fun m!314501 () Bool)

(assert (=> start!30256 m!314501))

(declare-fun m!314503 () Bool)

(assert (=> start!30256 m!314503))

(declare-fun m!314505 () Bool)

(assert (=> b!302896 m!314505))

(declare-fun m!314507 () Bool)

(assert (=> b!302895 m!314507))

(declare-fun m!314509 () Bool)

(assert (=> b!302899 m!314509))

(declare-fun m!314511 () Bool)

(assert (=> b!302897 m!314511))

(declare-fun m!314513 () Bool)

(assert (=> b!302901 m!314513))

(push 1)

(assert (not start!30256))

(assert (not b!302901))

(assert (not b!302900))

(assert (not b!302897))

(assert (not b!302894))

(assert (not b!302899))

(assert (not b!302896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

