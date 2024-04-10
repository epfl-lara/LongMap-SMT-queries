; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30582 () Bool)

(assert start!30582)

(declare-fun b!306586 () Bool)

(declare-fun res!163454 () Bool)

(declare-fun e!192235 () Bool)

(assert (=> b!306586 (=> (not res!163454) (not e!192235))))

(declare-datatypes ((array!15586 0))(
  ( (array!15587 (arr!7378 (Array (_ BitVec 32) (_ BitVec 64))) (size!7730 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15586)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306586 (= res!163454 (and (= (select (arr!7378 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7730 a!3293))))))

(declare-fun b!306587 () Bool)

(declare-fun e!192232 () Bool)

(assert (=> b!306587 (= e!192232 e!192235)))

(declare-fun res!163452 () Bool)

(assert (=> b!306587 (=> (not res!163452) (not e!192235))))

(declare-datatypes ((SeekEntryResult!2518 0))(
  ( (MissingZero!2518 (index!12248 (_ BitVec 32))) (Found!2518 (index!12249 (_ BitVec 32))) (Intermediate!2518 (undefined!3330 Bool) (index!12250 (_ BitVec 32)) (x!30497 (_ BitVec 32))) (Undefined!2518) (MissingVacant!2518 (index!12251 (_ BitVec 32))) )
))
(declare-fun lt!150996 () SeekEntryResult!2518)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15586 (_ BitVec 32)) SeekEntryResult!2518)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306587 (= res!163452 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150996))))

(assert (=> b!306587 (= lt!150996 (Intermediate!2518 false resIndex!52 resX!52))))

(declare-fun b!306588 () Bool)

(declare-datatypes ((Unit!9531 0))(
  ( (Unit!9532) )
))
(declare-fun e!192231 () Unit!9531)

(declare-fun e!192234 () Unit!9531)

(assert (=> b!306588 (= e!192231 e!192234)))

(declare-fun c!49170 () Bool)

(assert (=> b!306588 (= c!49170 (or (= (select (arr!7378 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7378 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306589 () Bool)

(declare-fun res!163455 () Bool)

(assert (=> b!306589 (=> (not res!163455) (not e!192232))))

(declare-fun arrayContainsKey!0 (array!15586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306589 (= res!163455 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306591 () Bool)

(assert (=> b!306591 (= e!192235 (not true))))

(assert (=> b!306591 (= index!1781 resIndex!52)))

(declare-fun lt!150994 () Unit!9531)

(assert (=> b!306591 (= lt!150994 e!192231)))

(declare-fun c!49169 () Bool)

(assert (=> b!306591 (= c!49169 (not (= resIndex!52 index!1781)))))

(declare-fun b!306592 () Bool)

(declare-fun Unit!9533 () Unit!9531)

(assert (=> b!306592 (= e!192231 Unit!9533)))

(declare-fun b!306593 () Bool)

(declare-fun res!163459 () Bool)

(assert (=> b!306593 (=> (not res!163459) (not e!192232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306593 (= res!163459 (validKeyInArray!0 k!2441))))

(declare-fun b!306594 () Bool)

(assert (=> b!306594 false))

(declare-fun lt!150995 () SeekEntryResult!2518)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306594 (= lt!150995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9534 () Unit!9531)

(assert (=> b!306594 (= e!192234 Unit!9534)))

(declare-fun b!306595 () Bool)

(declare-fun res!163457 () Bool)

(assert (=> b!306595 (=> (not res!163457) (not e!192235))))

(assert (=> b!306595 (= res!163457 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150996))))

(declare-fun b!306596 () Bool)

(declare-fun res!163461 () Bool)

(assert (=> b!306596 (=> (not res!163461) (not e!192235))))

(assert (=> b!306596 (= res!163461 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7378 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306597 () Bool)

(declare-fun res!163456 () Bool)

(assert (=> b!306597 (=> (not res!163456) (not e!192232))))

(assert (=> b!306597 (= res!163456 (and (= (size!7730 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7730 a!3293))))))

(declare-fun b!306598 () Bool)

(assert (=> b!306598 false))

(declare-fun Unit!9535 () Unit!9531)

(assert (=> b!306598 (= e!192234 Unit!9535)))

(declare-fun b!306599 () Bool)

(declare-fun res!163458 () Bool)

(assert (=> b!306599 (=> (not res!163458) (not e!192232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15586 (_ BitVec 32)) Bool)

(assert (=> b!306599 (= res!163458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306590 () Bool)

(declare-fun res!163460 () Bool)

(assert (=> b!306590 (=> (not res!163460) (not e!192232))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15586 (_ BitVec 32)) SeekEntryResult!2518)

(assert (=> b!306590 (= res!163460 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2518 i!1240)))))

(declare-fun res!163453 () Bool)

(assert (=> start!30582 (=> (not res!163453) (not e!192232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30582 (= res!163453 (validMask!0 mask!3709))))

(assert (=> start!30582 e!192232))

(declare-fun array_inv!5341 (array!15586) Bool)

(assert (=> start!30582 (array_inv!5341 a!3293)))

(assert (=> start!30582 true))

(assert (= (and start!30582 res!163453) b!306597))

(assert (= (and b!306597 res!163456) b!306593))

(assert (= (and b!306593 res!163459) b!306589))

(assert (= (and b!306589 res!163455) b!306590))

(assert (= (and b!306590 res!163460) b!306599))

(assert (= (and b!306599 res!163458) b!306587))

(assert (= (and b!306587 res!163452) b!306586))

(assert (= (and b!306586 res!163454) b!306595))

(assert (= (and b!306595 res!163457) b!306596))

(assert (= (and b!306596 res!163461) b!306591))

(assert (= (and b!306591 c!49169) b!306588))

(assert (= (and b!306591 (not c!49169)) b!306592))

(assert (= (and b!306588 c!49170) b!306598))

(assert (= (and b!306588 (not c!49170)) b!306594))

(declare-fun m!317121 () Bool)

(assert (=> b!306587 m!317121))

(assert (=> b!306587 m!317121))

(declare-fun m!317123 () Bool)

(assert (=> b!306587 m!317123))

(declare-fun m!317125 () Bool)

(assert (=> b!306588 m!317125))

(assert (=> b!306596 m!317125))

(declare-fun m!317127 () Bool)

(assert (=> b!306590 m!317127))

(declare-fun m!317129 () Bool)

(assert (=> b!306593 m!317129))

(declare-fun m!317131 () Bool)

(assert (=> b!306586 m!317131))

(declare-fun m!317133 () Bool)

(assert (=> b!306589 m!317133))

(declare-fun m!317135 () Bool)

(assert (=> b!306599 m!317135))

(declare-fun m!317137 () Bool)

(assert (=> start!30582 m!317137))

(declare-fun m!317139 () Bool)

(assert (=> start!30582 m!317139))

(declare-fun m!317141 () Bool)

(assert (=> b!306595 m!317141))

(declare-fun m!317143 () Bool)

(assert (=> b!306594 m!317143))

(assert (=> b!306594 m!317143))

(declare-fun m!317145 () Bool)

(assert (=> b!306594 m!317145))

(push 1)

(assert (not b!306599))

(assert (not b!306590))

