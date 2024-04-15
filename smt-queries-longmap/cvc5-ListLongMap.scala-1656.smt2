; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30760 () Bool)

(assert start!30760)

(declare-fun b!308548 () Bool)

(declare-fun e!192866 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308548 (= e!192866 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2581 0))(
  ( (MissingZero!2581 (index!12500 (_ BitVec 32))) (Found!2581 (index!12501 (_ BitVec 32))) (Intermediate!2581 (undefined!3393 Bool) (index!12502 (_ BitVec 32)) (x!30748 (_ BitVec 32))) (Undefined!2581) (MissingVacant!2581 (index!12503 (_ BitVec 32))) )
))
(declare-fun lt!151217 () SeekEntryResult!2581)

(declare-datatypes ((array!15717 0))(
  ( (array!15718 (arr!7442 (Array (_ BitVec 32) (_ BitVec 64))) (size!7795 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15717 (_ BitVec 32)) SeekEntryResult!2581)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308548 (= lt!151217 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308549 () Bool)

(declare-fun e!192865 () Bool)

(declare-fun e!192864 () Bool)

(assert (=> b!308549 (= e!192865 e!192864)))

(declare-fun res!165311 () Bool)

(assert (=> b!308549 (=> (not res!165311) (not e!192864))))

(declare-fun lt!151216 () SeekEntryResult!2581)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308549 (= res!165311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151216))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308549 (= lt!151216 (Intermediate!2581 false resIndex!52 resX!52))))

(declare-fun b!308550 () Bool)

(declare-fun res!165308 () Bool)

(assert (=> b!308550 (=> (not res!165308) (not e!192865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308550 (= res!165308 (validKeyInArray!0 k!2441))))

(declare-fun b!308551 () Bool)

(declare-fun res!165314 () Bool)

(assert (=> b!308551 (=> (not res!165314) (not e!192864))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308551 (= res!165314 (and (= (select (arr!7442 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7795 a!3293))))))

(declare-fun b!308553 () Bool)

(declare-fun res!165307 () Bool)

(assert (=> b!308553 (=> (not res!165307) (not e!192865))))

(assert (=> b!308553 (= res!165307 (and (= (size!7795 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7795 a!3293))))))

(declare-fun b!308554 () Bool)

(declare-fun res!165315 () Bool)

(assert (=> b!308554 (=> (not res!165315) (not e!192865))))

(declare-fun arrayContainsKey!0 (array!15717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308554 (= res!165315 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308555 () Bool)

(declare-fun res!165310 () Bool)

(assert (=> b!308555 (=> (not res!165310) (not e!192865))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15717 (_ BitVec 32)) SeekEntryResult!2581)

(assert (=> b!308555 (= res!165310 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2581 i!1240)))))

(declare-fun b!308556 () Bool)

(assert (=> b!308556 (= e!192864 e!192866)))

(declare-fun res!165309 () Bool)

(assert (=> b!308556 (=> (not res!165309) (not e!192866))))

(assert (=> b!308556 (= res!165309 (and (= lt!151217 lt!151216) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7442 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308556 (= lt!151217 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!165312 () Bool)

(assert (=> start!30760 (=> (not res!165312) (not e!192865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30760 (= res!165312 (validMask!0 mask!3709))))

(assert (=> start!30760 e!192865))

(declare-fun array_inv!5414 (array!15717) Bool)

(assert (=> start!30760 (array_inv!5414 a!3293)))

(assert (=> start!30760 true))

(declare-fun b!308552 () Bool)

(declare-fun res!165313 () Bool)

(assert (=> b!308552 (=> (not res!165313) (not e!192865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15717 (_ BitVec 32)) Bool)

(assert (=> b!308552 (= res!165313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30760 res!165312) b!308553))

(assert (= (and b!308553 res!165307) b!308550))

(assert (= (and b!308550 res!165308) b!308554))

(assert (= (and b!308554 res!165315) b!308555))

(assert (= (and b!308555 res!165310) b!308552))

(assert (= (and b!308552 res!165313) b!308549))

(assert (= (and b!308549 res!165311) b!308551))

(assert (= (and b!308551 res!165314) b!308556))

(assert (= (and b!308556 res!165309) b!308548))

(declare-fun m!318119 () Bool)

(assert (=> b!308555 m!318119))

(declare-fun m!318121 () Bool)

(assert (=> b!308556 m!318121))

(declare-fun m!318123 () Bool)

(assert (=> b!308556 m!318123))

(declare-fun m!318125 () Bool)

(assert (=> b!308549 m!318125))

(assert (=> b!308549 m!318125))

(declare-fun m!318127 () Bool)

(assert (=> b!308549 m!318127))

(declare-fun m!318129 () Bool)

(assert (=> b!308554 m!318129))

(declare-fun m!318131 () Bool)

(assert (=> start!30760 m!318131))

(declare-fun m!318133 () Bool)

(assert (=> start!30760 m!318133))

(declare-fun m!318135 () Bool)

(assert (=> b!308551 m!318135))

(declare-fun m!318137 () Bool)

(assert (=> b!308552 m!318137))

(declare-fun m!318139 () Bool)

(assert (=> b!308550 m!318139))

(declare-fun m!318141 () Bool)

(assert (=> b!308548 m!318141))

(assert (=> b!308548 m!318141))

(declare-fun m!318143 () Bool)

(assert (=> b!308548 m!318143))

(push 1)

(assert (not b!308554))

(assert (not b!308550))

(assert (not b!308555))

(assert (not b!308556))

(assert (not start!30760))

(assert (not b!308548))

(assert (not b!308552))

(assert (not b!308549))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

