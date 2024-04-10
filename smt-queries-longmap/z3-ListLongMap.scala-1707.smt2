; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31378 () Bool)

(assert start!31378)

(declare-fun b!314488 () Bool)

(declare-fun res!170242 () Bool)

(declare-fun e!195859 () Bool)

(assert (=> b!314488 (=> (not res!170242) (not e!195859))))

(declare-datatypes ((array!16049 0))(
  ( (array!16050 (arr!7599 (Array (_ BitVec 32) (_ BitVec 64))) (size!7951 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16049)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314488 (= res!170242 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314489 () Bool)

(assert (=> b!314489 (= e!195859 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2739 0))(
  ( (MissingZero!2739 (index!13132 (_ BitVec 32))) (Found!2739 (index!13133 (_ BitVec 32))) (Intermediate!2739 (undefined!3551 Bool) (index!13134 (_ BitVec 32)) (x!31361 (_ BitVec 32))) (Undefined!2739) (MissingVacant!2739 (index!13135 (_ BitVec 32))) )
))
(declare-fun lt!153912 () SeekEntryResult!2739)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16049 (_ BitVec 32)) SeekEntryResult!2739)

(assert (=> b!314489 (= lt!153912 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314490 () Bool)

(declare-fun res!170244 () Bool)

(assert (=> b!314490 (=> (not res!170244) (not e!195859))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314490 (= res!170244 (and (= (select (arr!7599 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7951 a!3293))))))

(declare-fun b!314491 () Bool)

(declare-fun res!170239 () Bool)

(assert (=> b!314491 (=> (not res!170239) (not e!195859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16049 (_ BitVec 32)) Bool)

(assert (=> b!314491 (= res!170239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314492 () Bool)

(declare-fun res!170240 () Bool)

(assert (=> b!314492 (=> (not res!170240) (not e!195859))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314492 (= res!170240 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2739 false resIndex!52 resX!52)))))

(declare-fun res!170241 () Bool)

(assert (=> start!31378 (=> (not res!170241) (not e!195859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31378 (= res!170241 (validMask!0 mask!3709))))

(assert (=> start!31378 e!195859))

(declare-fun array_inv!5562 (array!16049) Bool)

(assert (=> start!31378 (array_inv!5562 a!3293)))

(assert (=> start!31378 true))

(declare-fun b!314493 () Bool)

(declare-fun res!170237 () Bool)

(assert (=> b!314493 (=> (not res!170237) (not e!195859))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16049 (_ BitVec 32)) SeekEntryResult!2739)

(assert (=> b!314493 (= res!170237 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2739 i!1240)))))

(declare-fun b!314494 () Bool)

(declare-fun res!170243 () Bool)

(assert (=> b!314494 (=> (not res!170243) (not e!195859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314494 (= res!170243 (validKeyInArray!0 k0!2441))))

(declare-fun b!314495 () Bool)

(declare-fun res!170238 () Bool)

(assert (=> b!314495 (=> (not res!170238) (not e!195859))))

(assert (=> b!314495 (= res!170238 (and (= (size!7951 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7951 a!3293))))))

(assert (= (and start!31378 res!170241) b!314495))

(assert (= (and b!314495 res!170238) b!314494))

(assert (= (and b!314494 res!170243) b!314488))

(assert (= (and b!314488 res!170242) b!314493))

(assert (= (and b!314493 res!170237) b!314491))

(assert (= (and b!314491 res!170239) b!314492))

(assert (= (and b!314492 res!170240) b!314490))

(assert (= (and b!314490 res!170244) b!314489))

(declare-fun m!324037 () Bool)

(assert (=> b!314489 m!324037))

(declare-fun m!324039 () Bool)

(assert (=> start!31378 m!324039))

(declare-fun m!324041 () Bool)

(assert (=> start!31378 m!324041))

(declare-fun m!324043 () Bool)

(assert (=> b!314493 m!324043))

(declare-fun m!324045 () Bool)

(assert (=> b!314494 m!324045))

(declare-fun m!324047 () Bool)

(assert (=> b!314491 m!324047))

(declare-fun m!324049 () Bool)

(assert (=> b!314488 m!324049))

(declare-fun m!324051 () Bool)

(assert (=> b!314492 m!324051))

(assert (=> b!314492 m!324051))

(declare-fun m!324053 () Bool)

(assert (=> b!314492 m!324053))

(declare-fun m!324055 () Bool)

(assert (=> b!314490 m!324055))

(check-sat (not b!314492) (not b!314493) (not b!314489) (not b!314491) (not b!314488) (not b!314494) (not start!31378))
