; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31016 () Bool)

(assert start!31016)

(declare-fun b!311777 () Bool)

(declare-fun e!194489 () Bool)

(declare-fun e!194490 () Bool)

(assert (=> b!311777 (= e!194489 e!194490)))

(declare-fun res!168231 () Bool)

(assert (=> b!311777 (=> (not res!168231) (not e!194490))))

(declare-datatypes ((array!15918 0))(
  ( (array!15919 (arr!7541 (Array (_ BitVec 32) (_ BitVec 64))) (size!7893 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15918)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2681 0))(
  ( (MissingZero!2681 (index!12900 (_ BitVec 32))) (Found!2681 (index!12901 (_ BitVec 32))) (Intermediate!2681 (undefined!3493 Bool) (index!12902 (_ BitVec 32)) (x!31118 (_ BitVec 32))) (Undefined!2681) (MissingVacant!2681 (index!12903 (_ BitVec 32))) )
))
(declare-fun lt!152500 () SeekEntryResult!2681)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15918 (_ BitVec 32)) SeekEntryResult!2681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311777 (= res!168231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152500))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311777 (= lt!152500 (Intermediate!2681 false resIndex!52 resX!52))))

(declare-fun b!311778 () Bool)

(declare-fun res!168232 () Bool)

(assert (=> b!311778 (=> (not res!168232) (not e!194489))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15918 (_ BitVec 32)) SeekEntryResult!2681)

(assert (=> b!311778 (= res!168232 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2681 i!1240)))))

(declare-fun b!311779 () Bool)

(declare-fun e!194487 () Bool)

(assert (=> b!311779 (= e!194487 true)))

(declare-fun lt!152498 () SeekEntryResult!2681)

(declare-fun lt!152505 () SeekEntryResult!2681)

(assert (=> b!311779 (= lt!152498 lt!152505)))

(declare-datatypes ((Unit!9593 0))(
  ( (Unit!9594) )
))
(declare-fun lt!152502 () Unit!9593)

(declare-fun lt!152504 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15918 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9593)

(assert (=> b!311779 (= lt!152502 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152504 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311780 () Bool)

(declare-fun res!168234 () Bool)

(assert (=> b!311780 (=> (not res!168234) (not e!194489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311780 (= res!168234 (validKeyInArray!0 k!2441))))

(declare-fun b!311781 () Bool)

(declare-fun e!194488 () Bool)

(assert (=> b!311781 (= e!194488 (not e!194487))))

(declare-fun res!168239 () Bool)

(assert (=> b!311781 (=> res!168239 e!194487)))

(assert (=> b!311781 (= res!168239 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152504 #b00000000000000000000000000000000) (bvsge lt!152504 (size!7893 a!3293)) (not (= lt!152505 lt!152500))))))

(declare-fun lt!152501 () SeekEntryResult!2681)

(assert (=> b!311781 (= lt!152501 lt!152498)))

(declare-fun lt!152499 () array!15918)

(assert (=> b!311781 (= lt!152498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152504 k!2441 lt!152499 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311781 (= lt!152501 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152499 mask!3709))))

(assert (=> b!311781 (= lt!152499 (array!15919 (store (arr!7541 a!3293) i!1240 k!2441) (size!7893 a!3293)))))

(declare-fun lt!152503 () SeekEntryResult!2681)

(assert (=> b!311781 (= lt!152503 lt!152505)))

(assert (=> b!311781 (= lt!152505 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152504 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311781 (= lt!152504 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!168235 () Bool)

(assert (=> start!31016 (=> (not res!168235) (not e!194489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31016 (= res!168235 (validMask!0 mask!3709))))

(assert (=> start!31016 e!194489))

(declare-fun array_inv!5504 (array!15918) Bool)

(assert (=> start!31016 (array_inv!5504 a!3293)))

(assert (=> start!31016 true))

(declare-fun b!311782 () Bool)

(declare-fun res!168236 () Bool)

(assert (=> b!311782 (=> (not res!168236) (not e!194489))))

(assert (=> b!311782 (= res!168236 (and (= (size!7893 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7893 a!3293))))))

(declare-fun b!311783 () Bool)

(declare-fun res!168238 () Bool)

(assert (=> b!311783 (=> (not res!168238) (not e!194489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15918 (_ BitVec 32)) Bool)

(assert (=> b!311783 (= res!168238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311784 () Bool)

(declare-fun res!168240 () Bool)

(assert (=> b!311784 (=> (not res!168240) (not e!194490))))

(assert (=> b!311784 (= res!168240 (and (= (select (arr!7541 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7893 a!3293))))))

(declare-fun b!311785 () Bool)

(declare-fun res!168237 () Bool)

(assert (=> b!311785 (=> (not res!168237) (not e!194489))))

(declare-fun arrayContainsKey!0 (array!15918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311785 (= res!168237 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311786 () Bool)

(assert (=> b!311786 (= e!194490 e!194488)))

(declare-fun res!168233 () Bool)

(assert (=> b!311786 (=> (not res!168233) (not e!194488))))

(assert (=> b!311786 (= res!168233 (and (= lt!152503 lt!152500) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7541 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311786 (= lt!152503 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31016 res!168235) b!311782))

(assert (= (and b!311782 res!168236) b!311780))

(assert (= (and b!311780 res!168234) b!311785))

(assert (= (and b!311785 res!168237) b!311778))

(assert (= (and b!311778 res!168232) b!311783))

(assert (= (and b!311783 res!168238) b!311777))

(assert (= (and b!311777 res!168231) b!311784))

(assert (= (and b!311784 res!168240) b!311786))

(assert (= (and b!311786 res!168233) b!311781))

(assert (= (and b!311781 (not res!168239)) b!311779))

(declare-fun m!321773 () Bool)

(assert (=> b!311778 m!321773))

(declare-fun m!321775 () Bool)

(assert (=> b!311785 m!321775))

(declare-fun m!321777 () Bool)

(assert (=> b!311779 m!321777))

(declare-fun m!321779 () Bool)

(assert (=> b!311780 m!321779))

(declare-fun m!321781 () Bool)

(assert (=> b!311783 m!321781))

(declare-fun m!321783 () Bool)

(assert (=> b!311784 m!321783))

(declare-fun m!321785 () Bool)

(assert (=> b!311781 m!321785))

(declare-fun m!321787 () Bool)

(assert (=> b!311781 m!321787))

(declare-fun m!321789 () Bool)

(assert (=> b!311781 m!321789))

(declare-fun m!321791 () Bool)

(assert (=> b!311781 m!321791))

(declare-fun m!321793 () Bool)

(assert (=> b!311781 m!321793))

(declare-fun m!321795 () Bool)

(assert (=> start!31016 m!321795))

(declare-fun m!321797 () Bool)

(assert (=> start!31016 m!321797))

(declare-fun m!321799 () Bool)

(assert (=> b!311777 m!321799))

(assert (=> b!311777 m!321799))

(declare-fun m!321801 () Bool)

(assert (=> b!311777 m!321801))

(declare-fun m!321803 () Bool)

(assert (=> b!311786 m!321803))

(declare-fun m!321805 () Bool)

(assert (=> b!311786 m!321805))

(push 1)

