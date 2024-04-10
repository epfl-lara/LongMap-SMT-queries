; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31928 () Bool)

(assert start!31928)

(declare-fun b!319049 () Bool)

(declare-fun res!173433 () Bool)

(declare-fun e!198199 () Bool)

(assert (=> b!319049 (=> (not res!173433) (not e!198199))))

(declare-datatypes ((array!16248 0))(
  ( (array!16249 (arr!7688 (Array (_ BitVec 32) (_ BitVec 64))) (size!8040 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16248)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!319049 (= res!173433 (and (= (size!8040 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8040 a!3293))))))

(declare-fun b!319050 () Bool)

(declare-fun e!198200 () Bool)

(declare-fun e!198202 () Bool)

(assert (=> b!319050 (= e!198200 e!198202)))

(declare-fun res!173440 () Bool)

(assert (=> b!319050 (=> (not res!173440) (not e!198202))))

(declare-datatypes ((SeekEntryResult!2828 0))(
  ( (MissingZero!2828 (index!13488 (_ BitVec 32))) (Found!2828 (index!13489 (_ BitVec 32))) (Intermediate!2828 (undefined!3640 Bool) (index!13490 (_ BitVec 32)) (x!31750 (_ BitVec 32))) (Undefined!2828) (MissingVacant!2828 (index!13491 (_ BitVec 32))) )
))
(declare-fun lt!155611 () SeekEntryResult!2828)

(declare-fun lt!155610 () SeekEntryResult!2828)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319050 (= res!173440 (and (= lt!155611 lt!155610) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7688 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16248 (_ BitVec 32)) SeekEntryResult!2828)

(assert (=> b!319050 (= lt!155611 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!319051 () Bool)

(declare-fun res!173439 () Bool)

(assert (=> b!319051 (=> (not res!173439) (not e!198199))))

(declare-fun arrayContainsKey!0 (array!16248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319051 (= res!173439 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun e!198201 () Bool)

(declare-fun b!319052 () Bool)

(declare-fun lt!155613 () array!16248)

(declare-fun lt!155609 () (_ BitVec 32))

(assert (=> b!319052 (= e!198201 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155613 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155609 k!2441 lt!155613 mask!3709)))))

(assert (=> b!319052 (= lt!155613 (array!16249 (store (arr!7688 a!3293) i!1240 k!2441) (size!8040 a!3293)))))

(declare-fun b!319053 () Bool)

(declare-fun res!173435 () Bool)

(assert (=> b!319053 (=> (not res!173435) (not e!198199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319053 (= res!173435 (validKeyInArray!0 k!2441))))

(declare-fun b!319054 () Bool)

(declare-fun res!173442 () Bool)

(assert (=> b!319054 (=> (not res!173442) (not e!198199))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16248 (_ BitVec 32)) SeekEntryResult!2828)

(assert (=> b!319054 (= res!173442 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2828 i!1240)))))

(declare-fun b!319055 () Bool)

(assert (=> b!319055 (= e!198199 e!198200)))

(declare-fun res!173441 () Bool)

(assert (=> b!319055 (=> (not res!173441) (not e!198200))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319055 (= res!173441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155610))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!319055 (= lt!155610 (Intermediate!2828 false resIndex!52 resX!52))))

(declare-fun b!319056 () Bool)

(declare-fun res!173434 () Bool)

(assert (=> b!319056 (=> (not res!173434) (not e!198199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16248 (_ BitVec 32)) Bool)

(assert (=> b!319056 (= res!173434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319057 () Bool)

(declare-fun res!173438 () Bool)

(assert (=> b!319057 (=> (not res!173438) (not e!198200))))

(assert (=> b!319057 (= res!173438 (and (= (select (arr!7688 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8040 a!3293))))))

(declare-fun b!319058 () Bool)

(declare-fun lt!155612 () SeekEntryResult!2828)

(assert (=> b!319058 (= e!198202 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155609 #b00000000000000000000000000000000) (bvsge lt!155609 (size!8040 a!3293)) (not (= lt!155612 lt!155610)) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1427)) (bvsub #b01111111111111111111111111111110 x!1427)))))))

(assert (=> b!319058 e!198201))

(declare-fun res!173436 () Bool)

(assert (=> b!319058 (=> (not res!173436) (not e!198201))))

(assert (=> b!319058 (= res!173436 (= lt!155611 lt!155612))))

(assert (=> b!319058 (= lt!155612 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155609 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319058 (= lt!155609 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!173437 () Bool)

(assert (=> start!31928 (=> (not res!173437) (not e!198199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31928 (= res!173437 (validMask!0 mask!3709))))

(assert (=> start!31928 e!198199))

(declare-fun array_inv!5651 (array!16248) Bool)

(assert (=> start!31928 (array_inv!5651 a!3293)))

(assert (=> start!31928 true))

(assert (= (and start!31928 res!173437) b!319049))

(assert (= (and b!319049 res!173433) b!319053))

(assert (= (and b!319053 res!173435) b!319051))

(assert (= (and b!319051 res!173439) b!319054))

(assert (= (and b!319054 res!173442) b!319056))

(assert (= (and b!319056 res!173434) b!319055))

(assert (= (and b!319055 res!173441) b!319057))

(assert (= (and b!319057 res!173438) b!319050))

(assert (= (and b!319050 res!173440) b!319058))

(assert (= (and b!319058 res!173436) b!319052))

(declare-fun m!327647 () Bool)

(assert (=> b!319053 m!327647))

(declare-fun m!327649 () Bool)

(assert (=> b!319051 m!327649))

(declare-fun m!327651 () Bool)

(assert (=> b!319055 m!327651))

(assert (=> b!319055 m!327651))

(declare-fun m!327653 () Bool)

(assert (=> b!319055 m!327653))

(declare-fun m!327655 () Bool)

(assert (=> b!319052 m!327655))

(declare-fun m!327657 () Bool)

(assert (=> b!319052 m!327657))

(declare-fun m!327659 () Bool)

(assert (=> b!319052 m!327659))

(declare-fun m!327661 () Bool)

(assert (=> b!319054 m!327661))

(declare-fun m!327663 () Bool)

(assert (=> b!319058 m!327663))

(declare-fun m!327665 () Bool)

(assert (=> b!319058 m!327665))

(declare-fun m!327667 () Bool)

(assert (=> b!319056 m!327667))

(declare-fun m!327669 () Bool)

(assert (=> b!319057 m!327669))

(declare-fun m!327671 () Bool)

(assert (=> start!31928 m!327671))

(declare-fun m!327673 () Bool)

(assert (=> start!31928 m!327673))

(declare-fun m!327675 () Bool)

(assert (=> b!319050 m!327675))

(declare-fun m!327677 () Bool)

(assert (=> b!319050 m!327677))

(push 1)

(assert (not b!319050))

(assert (not b!319052))

(assert (not b!319051))

(assert (not b!319055))

(assert (not b!319054))

(assert (not b!319056))

(assert (not start!31928))

(assert (not b!319058))

(assert (not b!319053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

