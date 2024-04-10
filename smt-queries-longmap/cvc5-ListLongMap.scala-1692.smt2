; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31040 () Bool)

(assert start!31040)

(declare-fun b!312137 () Bool)

(declare-fun e!194671 () Bool)

(declare-fun e!194670 () Bool)

(assert (=> b!312137 (= e!194671 e!194670)))

(declare-fun res!168592 () Bool)

(assert (=> b!312137 (=> (not res!168592) (not e!194670))))

(declare-datatypes ((array!15942 0))(
  ( (array!15943 (arr!7553 (Array (_ BitVec 32) (_ BitVec 64))) (size!7905 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15942)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2693 0))(
  ( (MissingZero!2693 (index!12948 (_ BitVec 32))) (Found!2693 (index!12949 (_ BitVec 32))) (Intermediate!2693 (undefined!3505 Bool) (index!12950 (_ BitVec 32)) (x!31162 (_ BitVec 32))) (Undefined!2693) (MissingVacant!2693 (index!12951 (_ BitVec 32))) )
))
(declare-fun lt!152788 () SeekEntryResult!2693)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152793 () SeekEntryResult!2693)

(assert (=> b!312137 (= res!168592 (and (= lt!152788 lt!152793) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7553 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15942 (_ BitVec 32)) SeekEntryResult!2693)

(assert (=> b!312137 (= lt!152788 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312138 () Bool)

(declare-fun res!168598 () Bool)

(assert (=> b!312138 (=> (not res!168598) (not e!194671))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312138 (= res!168598 (and (= (select (arr!7553 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7905 a!3293))))))

(declare-fun b!312139 () Bool)

(declare-fun e!194669 () Bool)

(assert (=> b!312139 (= e!194670 (not e!194669))))

(declare-fun res!168593 () Bool)

(assert (=> b!312139 (=> res!168593 e!194669)))

(declare-fun lt!152790 () (_ BitVec 32))

(declare-fun lt!152792 () SeekEntryResult!2693)

(assert (=> b!312139 (= res!168593 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152790 #b00000000000000000000000000000000) (bvsge lt!152790 (size!7905 a!3293)) (not (= lt!152792 lt!152793))))))

(declare-fun lt!152791 () SeekEntryResult!2693)

(declare-fun lt!152789 () SeekEntryResult!2693)

(assert (=> b!312139 (= lt!152791 lt!152789)))

(declare-fun lt!152787 () array!15942)

(assert (=> b!312139 (= lt!152789 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152790 k!2441 lt!152787 mask!3709))))

(assert (=> b!312139 (= lt!152791 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152787 mask!3709))))

(assert (=> b!312139 (= lt!152787 (array!15943 (store (arr!7553 a!3293) i!1240 k!2441) (size!7905 a!3293)))))

(assert (=> b!312139 (= lt!152788 lt!152792)))

(assert (=> b!312139 (= lt!152792 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152790 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312139 (= lt!152790 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!168594 () Bool)

(declare-fun e!194667 () Bool)

(assert (=> start!31040 (=> (not res!168594) (not e!194667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31040 (= res!168594 (validMask!0 mask!3709))))

(assert (=> start!31040 e!194667))

(declare-fun array_inv!5516 (array!15942) Bool)

(assert (=> start!31040 (array_inv!5516 a!3293)))

(assert (=> start!31040 true))

(declare-fun b!312140 () Bool)

(assert (=> b!312140 (= e!194667 e!194671)))

(declare-fun res!168591 () Bool)

(assert (=> b!312140 (=> (not res!168591) (not e!194671))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312140 (= res!168591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152793))))

(assert (=> b!312140 (= lt!152793 (Intermediate!2693 false resIndex!52 resX!52))))

(declare-fun b!312141 () Bool)

(declare-fun res!168599 () Bool)

(assert (=> b!312141 (=> (not res!168599) (not e!194667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15942 (_ BitVec 32)) Bool)

(assert (=> b!312141 (= res!168599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312142 () Bool)

(declare-fun res!168595 () Bool)

(assert (=> b!312142 (=> (not res!168595) (not e!194667))))

(declare-fun arrayContainsKey!0 (array!15942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312142 (= res!168595 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312143 () Bool)

(assert (=> b!312143 (= e!194669 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(assert (=> b!312143 (= lt!152789 lt!152792)))

(declare-datatypes ((Unit!9617 0))(
  ( (Unit!9618) )
))
(declare-fun lt!152786 () Unit!9617)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15942 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9617)

(assert (=> b!312143 (= lt!152786 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152790 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312144 () Bool)

(declare-fun res!168596 () Bool)

(assert (=> b!312144 (=> (not res!168596) (not e!194667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312144 (= res!168596 (validKeyInArray!0 k!2441))))

(declare-fun b!312145 () Bool)

(declare-fun res!168600 () Bool)

(assert (=> b!312145 (=> (not res!168600) (not e!194667))))

(assert (=> b!312145 (= res!168600 (and (= (size!7905 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7905 a!3293))))))

(declare-fun b!312146 () Bool)

(declare-fun res!168597 () Bool)

(assert (=> b!312146 (=> (not res!168597) (not e!194667))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15942 (_ BitVec 32)) SeekEntryResult!2693)

(assert (=> b!312146 (= res!168597 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2693 i!1240)))))

(assert (= (and start!31040 res!168594) b!312145))

(assert (= (and b!312145 res!168600) b!312144))

(assert (= (and b!312144 res!168596) b!312142))

(assert (= (and b!312142 res!168595) b!312146))

(assert (= (and b!312146 res!168597) b!312141))

(assert (= (and b!312141 res!168599) b!312140))

(assert (= (and b!312140 res!168591) b!312138))

(assert (= (and b!312138 res!168598) b!312137))

(assert (= (and b!312137 res!168592) b!312139))

(assert (= (and b!312139 (not res!168593)) b!312143))

(declare-fun m!322181 () Bool)

(assert (=> b!312138 m!322181))

(declare-fun m!322183 () Bool)

(assert (=> b!312139 m!322183))

(declare-fun m!322185 () Bool)

(assert (=> b!312139 m!322185))

(declare-fun m!322187 () Bool)

(assert (=> b!312139 m!322187))

(declare-fun m!322189 () Bool)

(assert (=> b!312139 m!322189))

(declare-fun m!322191 () Bool)

(assert (=> b!312139 m!322191))

(declare-fun m!322193 () Bool)

(assert (=> b!312142 m!322193))

(declare-fun m!322195 () Bool)

(assert (=> b!312143 m!322195))

(declare-fun m!322197 () Bool)

(assert (=> b!312140 m!322197))

(assert (=> b!312140 m!322197))

(declare-fun m!322199 () Bool)

(assert (=> b!312140 m!322199))

(declare-fun m!322201 () Bool)

(assert (=> b!312137 m!322201))

(declare-fun m!322203 () Bool)

(assert (=> b!312137 m!322203))

(declare-fun m!322205 () Bool)

(assert (=> b!312146 m!322205))

(declare-fun m!322207 () Bool)

(assert (=> b!312144 m!322207))

(declare-fun m!322209 () Bool)

(assert (=> start!31040 m!322209))

(declare-fun m!322211 () Bool)

(assert (=> start!31040 m!322211))

(declare-fun m!322213 () Bool)

(assert (=> b!312141 m!322213))

(push 1)

