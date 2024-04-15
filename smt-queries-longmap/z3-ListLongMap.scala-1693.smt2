; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31032 () Bool)

(assert start!31032)

(declare-fun b!311953 () Bool)

(declare-fun res!168553 () Bool)

(declare-fun e!194538 () Bool)

(assert (=> b!311953 (=> (not res!168553) (not e!194538))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311953 (= res!168553 (validKeyInArray!0 k0!2441))))

(declare-fun b!311954 () Bool)

(declare-fun e!194539 () Bool)

(assert (=> b!311954 (= e!194538 e!194539)))

(declare-fun res!168561 () Bool)

(assert (=> b!311954 (=> (not res!168561) (not e!194539))))

(declare-datatypes ((SeekEntryResult!2690 0))(
  ( (MissingZero!2690 (index!12936 (_ BitVec 32))) (Found!2690 (index!12937 (_ BitVec 32))) (Intermediate!2690 (undefined!3502 Bool) (index!12938 (_ BitVec 32)) (x!31162 (_ BitVec 32))) (Undefined!2690) (MissingVacant!2690 (index!12939 (_ BitVec 32))) )
))
(declare-fun lt!152629 () SeekEntryResult!2690)

(declare-datatypes ((array!15938 0))(
  ( (array!15939 (arr!7551 (Array (_ BitVec 32) (_ BitVec 64))) (size!7904 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15938)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15938 (_ BitVec 32)) SeekEntryResult!2690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311954 (= res!168561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152629))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311954 (= lt!152629 (Intermediate!2690 false resIndex!52 resX!52))))

(declare-fun b!311955 () Bool)

(declare-fun res!168554 () Bool)

(assert (=> b!311955 (=> (not res!168554) (not e!194538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15938 (_ BitVec 32)) Bool)

(assert (=> b!311955 (= res!168554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311956 () Bool)

(declare-fun e!194540 () Bool)

(assert (=> b!311956 (= e!194539 e!194540)))

(declare-fun res!168559 () Bool)

(assert (=> b!311956 (=> (not res!168559) (not e!194540))))

(declare-fun lt!152623 () SeekEntryResult!2690)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311956 (= res!168559 (and (= lt!152623 lt!152629) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7551 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311956 (= lt!152623 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311957 () Bool)

(declare-fun res!168552 () Bool)

(assert (=> b!311957 (=> (not res!168552) (not e!194538))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311957 (= res!168552 (and (= (size!7904 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7904 a!3293))))))

(declare-fun b!311958 () Bool)

(declare-fun res!168558 () Bool)

(assert (=> b!311958 (=> (not res!168558) (not e!194538))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15938 (_ BitVec 32)) SeekEntryResult!2690)

(assert (=> b!311958 (= res!168558 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2690 i!1240)))))

(declare-fun b!311959 () Bool)

(declare-fun res!168560 () Bool)

(assert (=> b!311959 (=> (not res!168560) (not e!194539))))

(assert (=> b!311959 (= res!168560 (and (= (select (arr!7551 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7904 a!3293))))))

(declare-fun b!311952 () Bool)

(declare-fun res!168555 () Bool)

(assert (=> b!311952 (=> (not res!168555) (not e!194538))))

(declare-fun arrayContainsKey!0 (array!15938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311952 (= res!168555 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!168556 () Bool)

(assert (=> start!31032 (=> (not res!168556) (not e!194538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31032 (= res!168556 (validMask!0 mask!3709))))

(assert (=> start!31032 e!194538))

(declare-fun array_inv!5523 (array!15938) Bool)

(assert (=> start!31032 (array_inv!5523 a!3293)))

(assert (=> start!31032 true))

(declare-fun b!311960 () Bool)

(declare-fun e!194537 () Bool)

(assert (=> b!311960 (= e!194540 (not e!194537))))

(declare-fun res!168557 () Bool)

(assert (=> b!311960 (=> res!168557 e!194537)))

(declare-fun lt!152625 () (_ BitVec 32))

(declare-fun lt!152630 () SeekEntryResult!2690)

(assert (=> b!311960 (= res!168557 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152625 #b00000000000000000000000000000000) (bvsge lt!152625 (size!7904 a!3293)) (not (= lt!152630 lt!152629))))))

(declare-fun lt!152626 () SeekEntryResult!2690)

(declare-fun lt!152628 () SeekEntryResult!2690)

(assert (=> b!311960 (= lt!152626 lt!152628)))

(declare-fun lt!152624 () array!15938)

(assert (=> b!311960 (= lt!152628 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152625 k0!2441 lt!152624 mask!3709))))

(assert (=> b!311960 (= lt!152626 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152624 mask!3709))))

(assert (=> b!311960 (= lt!152624 (array!15939 (store (arr!7551 a!3293) i!1240 k0!2441) (size!7904 a!3293)))))

(assert (=> b!311960 (= lt!152623 lt!152630)))

(assert (=> b!311960 (= lt!152630 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152625 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311960 (= lt!152625 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311961 () Bool)

(assert (=> b!311961 (= e!194537 true)))

(assert (=> b!311961 (= lt!152628 lt!152630)))

(declare-datatypes ((Unit!9583 0))(
  ( (Unit!9584) )
))
(declare-fun lt!152627 () Unit!9583)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15938 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9583)

(assert (=> b!311961 (= lt!152627 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152625 resIndex!52 resX!52 mask!3709))))

(assert (= (and start!31032 res!168556) b!311957))

(assert (= (and b!311957 res!168552) b!311953))

(assert (= (and b!311953 res!168553) b!311952))

(assert (= (and b!311952 res!168555) b!311958))

(assert (= (and b!311958 res!168558) b!311955))

(assert (= (and b!311955 res!168554) b!311954))

(assert (= (and b!311954 res!168561) b!311959))

(assert (= (and b!311959 res!168560) b!311956))

(assert (= (and b!311956 res!168559) b!311960))

(assert (= (and b!311960 (not res!168557)) b!311961))

(declare-fun m!321553 () Bool)

(assert (=> b!311960 m!321553))

(declare-fun m!321555 () Bool)

(assert (=> b!311960 m!321555))

(declare-fun m!321557 () Bool)

(assert (=> b!311960 m!321557))

(declare-fun m!321559 () Bool)

(assert (=> b!311960 m!321559))

(declare-fun m!321561 () Bool)

(assert (=> b!311960 m!321561))

(declare-fun m!321563 () Bool)

(assert (=> b!311961 m!321563))

(declare-fun m!321565 () Bool)

(assert (=> b!311953 m!321565))

(declare-fun m!321567 () Bool)

(assert (=> start!31032 m!321567))

(declare-fun m!321569 () Bool)

(assert (=> start!31032 m!321569))

(declare-fun m!321571 () Bool)

(assert (=> b!311955 m!321571))

(declare-fun m!321573 () Bool)

(assert (=> b!311956 m!321573))

(declare-fun m!321575 () Bool)

(assert (=> b!311956 m!321575))

(declare-fun m!321577 () Bool)

(assert (=> b!311952 m!321577))

(declare-fun m!321579 () Bool)

(assert (=> b!311954 m!321579))

(assert (=> b!311954 m!321579))

(declare-fun m!321581 () Bool)

(assert (=> b!311954 m!321581))

(declare-fun m!321583 () Bool)

(assert (=> b!311958 m!321583))

(declare-fun m!321585 () Bool)

(assert (=> b!311959 m!321585))

(check-sat (not b!311954) (not b!311953) (not b!311956) (not b!311952) (not b!311961) (not b!311960) (not b!311958) (not start!31032) (not b!311955))
(check-sat)
