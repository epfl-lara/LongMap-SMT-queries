; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30292 () Bool)

(assert start!30292)

(declare-fun b!303353 () Bool)

(declare-fun res!160891 () Bool)

(declare-fun e!190913 () Bool)

(assert (=> b!303353 (=> (not res!160891) (not e!190913))))

(declare-datatypes ((array!15411 0))(
  ( (array!15412 (arr!7293 (Array (_ BitVec 32) (_ BitVec 64))) (size!7645 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15411)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15411 (_ BitVec 32)) Bool)

(assert (=> b!303353 (= res!160891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303354 () Bool)

(declare-fun res!160889 () Bool)

(assert (=> b!303354 (=> (not res!160889) (not e!190913))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303354 (= res!160889 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160893 () Bool)

(assert (=> start!30292 (=> (not res!160893) (not e!190913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30292 (= res!160893 (validMask!0 mask!3709))))

(assert (=> start!30292 e!190913))

(declare-fun array_inv!5243 (array!15411) Bool)

(assert (=> start!30292 (array_inv!5243 a!3293)))

(assert (=> start!30292 true))

(declare-fun b!303355 () Bool)

(assert (=> b!303355 (= e!190913 false)))

(declare-datatypes ((SeekEntryResult!2398 0))(
  ( (MissingZero!2398 (index!11768 (_ BitVec 32))) (Found!2398 (index!11769 (_ BitVec 32))) (Intermediate!2398 (undefined!3210 Bool) (index!11770 (_ BitVec 32)) (x!30132 (_ BitVec 32))) (Undefined!2398) (MissingVacant!2398 (index!11771 (_ BitVec 32))) )
))
(declare-fun lt!150222 () SeekEntryResult!2398)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15411 (_ BitVec 32)) SeekEntryResult!2398)

(assert (=> b!303355 (= lt!150222 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!303356 () Bool)

(declare-fun res!160895 () Bool)

(assert (=> b!303356 (=> (not res!160895) (not e!190913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303356 (= res!160895 (validKeyInArray!0 k!2441))))

(declare-fun b!303357 () Bool)

(declare-fun res!160896 () Bool)

(assert (=> b!303357 (=> (not res!160896) (not e!190913))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15411 (_ BitVec 32)) SeekEntryResult!2398)

(assert (=> b!303357 (= res!160896 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2398 i!1240)))))

(declare-fun b!303358 () Bool)

(declare-fun res!160892 () Bool)

(assert (=> b!303358 (=> (not res!160892) (not e!190913))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303358 (= res!160892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2398 false resIndex!52 resX!52)))))

(declare-fun b!303359 () Bool)

(declare-fun res!160894 () Bool)

(assert (=> b!303359 (=> (not res!160894) (not e!190913))))

(assert (=> b!303359 (= res!160894 (and (= (size!7645 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7645 a!3293))))))

(declare-fun b!303360 () Bool)

(declare-fun res!160890 () Bool)

(assert (=> b!303360 (=> (not res!160890) (not e!190913))))

(assert (=> b!303360 (= res!160890 (and (= (select (arr!7293 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7645 a!3293))))))

(assert (= (and start!30292 res!160893) b!303359))

(assert (= (and b!303359 res!160894) b!303356))

(assert (= (and b!303356 res!160895) b!303354))

(assert (= (and b!303354 res!160889) b!303357))

(assert (= (and b!303357 res!160896) b!303353))

(assert (= (and b!303353 res!160891) b!303358))

(assert (= (and b!303358 res!160892) b!303360))

(assert (= (and b!303360 res!160890) b!303355))

(declare-fun m!314873 () Bool)

(assert (=> b!303358 m!314873))

(assert (=> b!303358 m!314873))

(declare-fun m!314875 () Bool)

(assert (=> b!303358 m!314875))

(declare-fun m!314877 () Bool)

(assert (=> b!303354 m!314877))

(declare-fun m!314879 () Bool)

(assert (=> b!303360 m!314879))

(declare-fun m!314881 () Bool)

(assert (=> b!303356 m!314881))

(declare-fun m!314883 () Bool)

(assert (=> b!303357 m!314883))

(declare-fun m!314885 () Bool)

(assert (=> b!303355 m!314885))

(declare-fun m!314887 () Bool)

(assert (=> start!30292 m!314887))

(declare-fun m!314889 () Bool)

(assert (=> start!30292 m!314889))

(declare-fun m!314891 () Bool)

(assert (=> b!303353 m!314891))

(push 1)

(assert (not b!303354))

(assert (not b!303358))

(assert (not b!303353))

(assert (not b!303355))

(assert (not b!303357))

(assert (not start!30292))

(assert (not b!303356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

