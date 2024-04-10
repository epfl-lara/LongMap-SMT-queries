; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31066 () Bool)

(assert start!31066)

(declare-fun b!312527 () Bool)

(declare-fun res!168990 () Bool)

(declare-fun e!194862 () Bool)

(assert (=> b!312527 (=> (not res!168990) (not e!194862))))

(declare-datatypes ((array!15968 0))(
  ( (array!15969 (arr!7566 (Array (_ BitVec 32) (_ BitVec 64))) (size!7918 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15968)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312527 (= res!168990 (and (= (size!7918 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7918 a!3293))))))

(declare-fun b!312528 () Bool)

(declare-fun res!168983 () Bool)

(declare-fun e!194866 () Bool)

(assert (=> b!312528 (=> (not res!168983) (not e!194866))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!312528 (= res!168983 (and (= (select (arr!7566 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7918 a!3293))))))

(declare-fun b!312529 () Bool)

(declare-fun e!194864 () Bool)

(assert (=> b!312529 (= e!194866 e!194864)))

(declare-fun res!168987 () Bool)

(assert (=> b!312529 (=> (not res!168987) (not e!194864))))

(declare-datatypes ((SeekEntryResult!2706 0))(
  ( (MissingZero!2706 (index!13000 (_ BitVec 32))) (Found!2706 (index!13001 (_ BitVec 32))) (Intermediate!2706 (undefined!3518 Bool) (index!13002 (_ BitVec 32)) (x!31207 (_ BitVec 32))) (Undefined!2706) (MissingVacant!2706 (index!13003 (_ BitVec 32))) )
))
(declare-fun lt!153103 () SeekEntryResult!2706)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun lt!153101 () SeekEntryResult!2706)

(assert (=> b!312529 (= res!168987 (and (= lt!153103 lt!153101) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7566 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15968 (_ BitVec 32)) SeekEntryResult!2706)

(assert (=> b!312529 (= lt!153103 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312530 () Bool)

(declare-fun res!168981 () Bool)

(assert (=> b!312530 (=> (not res!168981) (not e!194862))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15968 (_ BitVec 32)) SeekEntryResult!2706)

(assert (=> b!312530 (= res!168981 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2706 i!1240)))))

(declare-fun res!168985 () Bool)

(assert (=> start!31066 (=> (not res!168985) (not e!194862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31066 (= res!168985 (validMask!0 mask!3709))))

(assert (=> start!31066 e!194862))

(declare-fun array_inv!5529 (array!15968) Bool)

(assert (=> start!31066 (array_inv!5529 a!3293)))

(assert (=> start!31066 true))

(declare-fun b!312531 () Bool)

(declare-fun res!168988 () Bool)

(assert (=> b!312531 (=> (not res!168988) (not e!194862))))

(declare-fun arrayContainsKey!0 (array!15968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312531 (= res!168988 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312532 () Bool)

(declare-fun res!168982 () Bool)

(assert (=> b!312532 (=> (not res!168982) (not e!194862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15968 (_ BitVec 32)) Bool)

(assert (=> b!312532 (= res!168982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312533 () Bool)

(assert (=> b!312533 (= e!194862 e!194866)))

(declare-fun res!168989 () Bool)

(assert (=> b!312533 (=> (not res!168989) (not e!194866))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312533 (= res!168989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153101))))

(assert (=> b!312533 (= lt!153101 (Intermediate!2706 false resIndex!52 resX!52))))

(declare-fun b!312534 () Bool)

(declare-fun e!194865 () Bool)

(assert (=> b!312534 (= e!194864 (not e!194865))))

(declare-fun res!168986 () Bool)

(assert (=> b!312534 (=> res!168986 e!194865)))

(declare-fun lt!153102 () SeekEntryResult!2706)

(declare-fun lt!153099 () (_ BitVec 32))

(assert (=> b!312534 (= res!168986 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153099 #b00000000000000000000000000000000) (bvsge lt!153099 (size!7918 a!3293)) (not (= lt!153102 lt!153101))))))

(declare-fun lt!153105 () SeekEntryResult!2706)

(declare-fun lt!153098 () SeekEntryResult!2706)

(assert (=> b!312534 (= lt!153105 lt!153098)))

(declare-fun lt!153100 () array!15968)

(assert (=> b!312534 (= lt!153098 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153099 k0!2441 lt!153100 mask!3709))))

(assert (=> b!312534 (= lt!153105 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153100 mask!3709))))

(assert (=> b!312534 (= lt!153100 (array!15969 (store (arr!7566 a!3293) i!1240 k0!2441) (size!7918 a!3293)))))

(assert (=> b!312534 (= lt!153103 lt!153102)))

(assert (=> b!312534 (= lt!153102 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153099 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312534 (= lt!153099 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312535 () Bool)

(declare-fun res!168984 () Bool)

(assert (=> b!312535 (=> (not res!168984) (not e!194862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312535 (= res!168984 (validKeyInArray!0 k0!2441))))

(declare-fun b!312536 () Bool)

(assert (=> b!312536 (= e!194865 true)))

(assert (=> b!312536 (= lt!153098 lt!153102)))

(declare-datatypes ((Unit!9643 0))(
  ( (Unit!9644) )
))
(declare-fun lt!153104 () Unit!9643)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15968 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9643)

(assert (=> b!312536 (= lt!153104 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153099 resIndex!52 resX!52 mask!3709))))

(assert (= (and start!31066 res!168985) b!312527))

(assert (= (and b!312527 res!168990) b!312535))

(assert (= (and b!312535 res!168984) b!312531))

(assert (= (and b!312531 res!168988) b!312530))

(assert (= (and b!312530 res!168981) b!312532))

(assert (= (and b!312532 res!168982) b!312533))

(assert (= (and b!312533 res!168989) b!312528))

(assert (= (and b!312528 res!168983) b!312529))

(assert (= (and b!312529 res!168987) b!312534))

(assert (= (and b!312534 (not res!168986)) b!312536))

(declare-fun m!322623 () Bool)

(assert (=> b!312535 m!322623))

(declare-fun m!322625 () Bool)

(assert (=> b!312528 m!322625))

(declare-fun m!322627 () Bool)

(assert (=> b!312530 m!322627))

(declare-fun m!322629 () Bool)

(assert (=> start!31066 m!322629))

(declare-fun m!322631 () Bool)

(assert (=> start!31066 m!322631))

(declare-fun m!322633 () Bool)

(assert (=> b!312531 m!322633))

(declare-fun m!322635 () Bool)

(assert (=> b!312533 m!322635))

(assert (=> b!312533 m!322635))

(declare-fun m!322637 () Bool)

(assert (=> b!312533 m!322637))

(declare-fun m!322639 () Bool)

(assert (=> b!312534 m!322639))

(declare-fun m!322641 () Bool)

(assert (=> b!312534 m!322641))

(declare-fun m!322643 () Bool)

(assert (=> b!312534 m!322643))

(declare-fun m!322645 () Bool)

(assert (=> b!312534 m!322645))

(declare-fun m!322647 () Bool)

(assert (=> b!312534 m!322647))

(declare-fun m!322649 () Bool)

(assert (=> b!312529 m!322649))

(declare-fun m!322651 () Bool)

(assert (=> b!312529 m!322651))

(declare-fun m!322653 () Bool)

(assert (=> b!312532 m!322653))

(declare-fun m!322655 () Bool)

(assert (=> b!312536 m!322655))

(check-sat (not b!312530) (not b!312532) (not b!312534) (not b!312535) (not b!312533) (not b!312536) (not start!31066) (not b!312531) (not b!312529))
(check-sat)
