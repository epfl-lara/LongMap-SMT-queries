; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30678 () Bool)

(assert start!30678)

(declare-fun b!308012 () Bool)

(declare-fun res!164770 () Bool)

(declare-fun e!192683 () Bool)

(assert (=> b!308012 (=> (not res!164770) (not e!192683))))

(declare-datatypes ((array!15682 0))(
  ( (array!15683 (arr!7426 (Array (_ BitVec 32) (_ BitVec 64))) (size!7778 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15682)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15682 (_ BitVec 32)) Bool)

(assert (=> b!308012 (= res!164770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308013 () Bool)

(declare-fun res!164773 () Bool)

(declare-fun e!192684 () Bool)

(assert (=> b!308013 (=> (not res!164773) (not e!192684))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308013 (= res!164773 (and (= (select (arr!7426 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7778 a!3293))))))

(declare-fun res!164767 () Bool)

(assert (=> start!30678 (=> (not res!164767) (not e!192683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30678 (= res!164767 (validMask!0 mask!3709))))

(assert (=> start!30678 e!192683))

(declare-fun array_inv!5389 (array!15682) Bool)

(assert (=> start!30678 (array_inv!5389 a!3293)))

(assert (=> start!30678 true))

(declare-fun b!308014 () Bool)

(declare-fun res!164775 () Bool)

(assert (=> b!308014 (=> (not res!164775) (not e!192683))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2566 0))(
  ( (MissingZero!2566 (index!12440 (_ BitVec 32))) (Found!2566 (index!12441 (_ BitVec 32))) (Intermediate!2566 (undefined!3378 Bool) (index!12442 (_ BitVec 32)) (x!30673 (_ BitVec 32))) (Undefined!2566) (MissingVacant!2566 (index!12443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15682 (_ BitVec 32)) SeekEntryResult!2566)

(assert (=> b!308014 (= res!164775 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2566 i!1240)))))

(declare-fun b!308015 () Bool)

(assert (=> b!308015 (= e!192684 false)))

(declare-fun lt!151220 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308015 (= lt!151220 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308016 () Bool)

(declare-fun res!164769 () Bool)

(assert (=> b!308016 (=> (not res!164769) (not e!192683))))

(declare-fun arrayContainsKey!0 (array!15682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308016 (= res!164769 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308017 () Bool)

(declare-fun res!164771 () Bool)

(assert (=> b!308017 (=> (not res!164771) (not e!192683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308017 (= res!164771 (validKeyInArray!0 k!2441))))

(declare-fun b!308018 () Bool)

(declare-fun res!164768 () Bool)

(assert (=> b!308018 (=> (not res!164768) (not e!192684))))

(declare-fun lt!151221 () SeekEntryResult!2566)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15682 (_ BitVec 32)) SeekEntryResult!2566)

(assert (=> b!308018 (= res!164768 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151221))))

(declare-fun b!308019 () Bool)

(declare-fun res!164772 () Bool)

(assert (=> b!308019 (=> (not res!164772) (not e!192684))))

(assert (=> b!308019 (= res!164772 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7426 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308020 () Bool)

(declare-fun res!164774 () Bool)

(assert (=> b!308020 (=> (not res!164774) (not e!192683))))

(assert (=> b!308020 (= res!164774 (and (= (size!7778 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7778 a!3293))))))

(declare-fun b!308021 () Bool)

(assert (=> b!308021 (= e!192683 e!192684)))

(declare-fun res!164766 () Bool)

(assert (=> b!308021 (=> (not res!164766) (not e!192684))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308021 (= res!164766 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151221))))

(assert (=> b!308021 (= lt!151221 (Intermediate!2566 false resIndex!52 resX!52))))

(assert (= (and start!30678 res!164767) b!308020))

(assert (= (and b!308020 res!164774) b!308017))

(assert (= (and b!308017 res!164771) b!308016))

(assert (= (and b!308016 res!164769) b!308014))

(assert (= (and b!308014 res!164775) b!308012))

(assert (= (and b!308012 res!164770) b!308021))

(assert (= (and b!308021 res!164766) b!308013))

(assert (= (and b!308013 res!164773) b!308018))

(assert (= (and b!308018 res!164768) b!308019))

(assert (= (and b!308019 res!164772) b!308015))

(declare-fun m!318209 () Bool)

(assert (=> b!308014 m!318209))

(declare-fun m!318211 () Bool)

(assert (=> b!308021 m!318211))

(assert (=> b!308021 m!318211))

(declare-fun m!318213 () Bool)

(assert (=> b!308021 m!318213))

(declare-fun m!318215 () Bool)

(assert (=> b!308019 m!318215))

(declare-fun m!318217 () Bool)

(assert (=> b!308016 m!318217))

(declare-fun m!318219 () Bool)

(assert (=> b!308015 m!318219))

(declare-fun m!318221 () Bool)

(assert (=> b!308013 m!318221))

(declare-fun m!318223 () Bool)

(assert (=> b!308017 m!318223))

(declare-fun m!318225 () Bool)

(assert (=> start!30678 m!318225))

(declare-fun m!318227 () Bool)

(assert (=> start!30678 m!318227))

(declare-fun m!318229 () Bool)

(assert (=> b!308012 m!318229))

(declare-fun m!318231 () Bool)

(assert (=> b!308018 m!318231))

(push 1)

(assert (not b!308018))

(assert (not b!308015))

(assert (not b!308016))

(assert (not start!30678))

(assert (not b!308012))

(assert (not b!308021))

