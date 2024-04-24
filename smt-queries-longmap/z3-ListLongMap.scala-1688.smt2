; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31002 () Bool)

(assert start!31002)

(declare-fun b!311724 () Bool)

(declare-fun e!194455 () Bool)

(declare-fun e!194454 () Bool)

(assert (=> b!311724 (= e!194455 e!194454)))

(declare-fun res!168234 () Bool)

(assert (=> b!311724 (=> (not res!168234) (not e!194454))))

(declare-datatypes ((array!15917 0))(
  ( (array!15918 (arr!7540 (Array (_ BitVec 32) (_ BitVec 64))) (size!7892 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15917)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2645 0))(
  ( (MissingZero!2645 (index!12756 (_ BitVec 32))) (Found!2645 (index!12757 (_ BitVec 32))) (Intermediate!2645 (undefined!3457 Bool) (index!12758 (_ BitVec 32)) (x!31079 (_ BitVec 32))) (Undefined!2645) (MissingVacant!2645 (index!12759 (_ BitVec 32))) )
))
(declare-fun lt!152521 () SeekEntryResult!2645)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!152517 () SeekEntryResult!2645)

(assert (=> b!311724 (= res!168234 (and (= lt!152521 lt!152517) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7540 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15917 (_ BitVec 32)) SeekEntryResult!2645)

(assert (=> b!311724 (= lt!152521 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311725 () Bool)

(declare-fun res!168228 () Bool)

(declare-fun e!194453 () Bool)

(assert (=> b!311725 (=> (not res!168228) (not e!194453))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311725 (= res!168228 (and (= (size!7892 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7892 a!3293))))))

(declare-fun b!311726 () Bool)

(assert (=> b!311726 (= e!194453 e!194455)))

(declare-fun res!168235 () Bool)

(assert (=> b!311726 (=> (not res!168235) (not e!194455))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311726 (= res!168235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152517))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311726 (= lt!152517 (Intermediate!2645 false resIndex!52 resX!52))))

(declare-fun b!311727 () Bool)

(declare-fun e!194457 () Bool)

(assert (=> b!311727 (= e!194457 true)))

(declare-fun lt!152523 () SeekEntryResult!2645)

(declare-fun lt!152518 () SeekEntryResult!2645)

(assert (=> b!311727 (= lt!152523 lt!152518)))

(declare-datatypes ((Unit!9551 0))(
  ( (Unit!9552) )
))
(declare-fun lt!152522 () Unit!9551)

(declare-fun lt!152519 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15917 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9551)

(assert (=> b!311727 (= lt!152522 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152519 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311728 () Bool)

(declare-fun res!168230 () Bool)

(assert (=> b!311728 (=> (not res!168230) (not e!194453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311728 (= res!168230 (validKeyInArray!0 k0!2441))))

(declare-fun b!311729 () Bool)

(declare-fun res!168232 () Bool)

(assert (=> b!311729 (=> (not res!168232) (not e!194453))))

(declare-fun arrayContainsKey!0 (array!15917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311729 (= res!168232 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311730 () Bool)

(declare-fun res!168237 () Bool)

(assert (=> b!311730 (=> (not res!168237) (not e!194453))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15917 (_ BitVec 32)) SeekEntryResult!2645)

(assert (=> b!311730 (= res!168237 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2645 i!1240)))))

(declare-fun res!168231 () Bool)

(assert (=> start!31002 (=> (not res!168231) (not e!194453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31002 (= res!168231 (validMask!0 mask!3709))))

(assert (=> start!31002 e!194453))

(declare-fun array_inv!5490 (array!15917) Bool)

(assert (=> start!31002 (array_inv!5490 a!3293)))

(assert (=> start!31002 true))

(declare-fun b!311731 () Bool)

(assert (=> b!311731 (= e!194454 (not e!194457))))

(declare-fun res!168236 () Bool)

(assert (=> b!311731 (=> res!168236 e!194457)))

(assert (=> b!311731 (= res!168236 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152519 #b00000000000000000000000000000000) (bvsge lt!152519 (size!7892 a!3293)) (not (= lt!152518 lt!152517))))))

(declare-fun lt!152516 () SeekEntryResult!2645)

(assert (=> b!311731 (= lt!152516 lt!152523)))

(declare-fun lt!152520 () array!15917)

(assert (=> b!311731 (= lt!152523 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152519 k0!2441 lt!152520 mask!3709))))

(assert (=> b!311731 (= lt!152516 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152520 mask!3709))))

(assert (=> b!311731 (= lt!152520 (array!15918 (store (arr!7540 a!3293) i!1240 k0!2441) (size!7892 a!3293)))))

(assert (=> b!311731 (= lt!152521 lt!152518)))

(assert (=> b!311731 (= lt!152518 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152519 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311731 (= lt!152519 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311732 () Bool)

(declare-fun res!168229 () Bool)

(assert (=> b!311732 (=> (not res!168229) (not e!194453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15917 (_ BitVec 32)) Bool)

(assert (=> b!311732 (= res!168229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311733 () Bool)

(declare-fun res!168233 () Bool)

(assert (=> b!311733 (=> (not res!168233) (not e!194455))))

(assert (=> b!311733 (= res!168233 (and (= (select (arr!7540 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7892 a!3293))))))

(assert (= (and start!31002 res!168231) b!311725))

(assert (= (and b!311725 res!168228) b!311728))

(assert (= (and b!311728 res!168230) b!311729))

(assert (= (and b!311729 res!168232) b!311730))

(assert (= (and b!311730 res!168237) b!311732))

(assert (= (and b!311732 res!168229) b!311726))

(assert (= (and b!311726 res!168235) b!311733))

(assert (= (and b!311733 res!168233) b!311724))

(assert (= (and b!311724 res!168234) b!311731))

(assert (= (and b!311731 (not res!168236)) b!311727))

(declare-fun m!321907 () Bool)

(assert (=> b!311727 m!321907))

(declare-fun m!321909 () Bool)

(assert (=> b!311731 m!321909))

(declare-fun m!321911 () Bool)

(assert (=> b!311731 m!321911))

(declare-fun m!321913 () Bool)

(assert (=> b!311731 m!321913))

(declare-fun m!321915 () Bool)

(assert (=> b!311731 m!321915))

(declare-fun m!321917 () Bool)

(assert (=> b!311731 m!321917))

(declare-fun m!321919 () Bool)

(assert (=> b!311726 m!321919))

(assert (=> b!311726 m!321919))

(declare-fun m!321921 () Bool)

(assert (=> b!311726 m!321921))

(declare-fun m!321923 () Bool)

(assert (=> b!311724 m!321923))

(declare-fun m!321925 () Bool)

(assert (=> b!311724 m!321925))

(declare-fun m!321927 () Bool)

(assert (=> start!31002 m!321927))

(declare-fun m!321929 () Bool)

(assert (=> start!31002 m!321929))

(declare-fun m!321931 () Bool)

(assert (=> b!311733 m!321931))

(declare-fun m!321933 () Bool)

(assert (=> b!311730 m!321933))

(declare-fun m!321935 () Bool)

(assert (=> b!311732 m!321935))

(declare-fun m!321937 () Bool)

(assert (=> b!311729 m!321937))

(declare-fun m!321939 () Bool)

(assert (=> b!311728 m!321939))

(check-sat (not b!311732) (not b!311724) (not start!31002) (not b!311729) (not b!311730) (not b!311728) (not b!311727) (not b!311731) (not b!311726))
(check-sat)
