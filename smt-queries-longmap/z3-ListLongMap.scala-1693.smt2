; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31032 () Bool)

(assert start!31032)

(declare-fun b!312174 () Bool)

(declare-fun e!194680 () Bool)

(declare-fun e!194681 () Bool)

(assert (=> b!312174 (= e!194680 e!194681)))

(declare-fun res!168679 () Bool)

(assert (=> b!312174 (=> (not res!168679) (not e!194681))))

(declare-datatypes ((array!15947 0))(
  ( (array!15948 (arr!7555 (Array (_ BitVec 32) (_ BitVec 64))) (size!7907 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15947)

(declare-datatypes ((SeekEntryResult!2660 0))(
  ( (MissingZero!2660 (index!12816 (_ BitVec 32))) (Found!2660 (index!12817 (_ BitVec 32))) (Intermediate!2660 (undefined!3472 Bool) (index!12818 (_ BitVec 32)) (x!31134 (_ BitVec 32))) (Undefined!2660) (MissingVacant!2660 (index!12819 (_ BitVec 32))) )
))
(declare-fun lt!152879 () SeekEntryResult!2660)

(declare-fun lt!152883 () SeekEntryResult!2660)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312174 (= res!168679 (and (= lt!152879 lt!152883) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7555 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15947 (_ BitVec 32)) SeekEntryResult!2660)

(assert (=> b!312174 (= lt!152879 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312175 () Bool)

(declare-fun e!194678 () Bool)

(assert (=> b!312175 (= e!194678 true)))

(declare-fun lt!152880 () SeekEntryResult!2660)

(declare-fun lt!152876 () SeekEntryResult!2660)

(assert (=> b!312175 (= lt!152880 lt!152876)))

(declare-fun lt!152882 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((Unit!9581 0))(
  ( (Unit!9582) )
))
(declare-fun lt!152878 () Unit!9581)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9581)

(assert (=> b!312175 (= lt!152878 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152882 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312176 () Bool)

(assert (=> b!312176 (= e!194681 (not e!194678))))

(declare-fun res!168680 () Bool)

(assert (=> b!312176 (=> res!168680 e!194678)))

(assert (=> b!312176 (= res!168680 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152882 #b00000000000000000000000000000000) (bvsge lt!152882 (size!7907 a!3293)) (not (= lt!152876 lt!152883))))))

(declare-fun lt!152881 () SeekEntryResult!2660)

(assert (=> b!312176 (= lt!152881 lt!152880)))

(declare-fun lt!152877 () array!15947)

(assert (=> b!312176 (= lt!152880 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152882 k0!2441 lt!152877 mask!3709))))

(assert (=> b!312176 (= lt!152881 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152877 mask!3709))))

(assert (=> b!312176 (= lt!152877 (array!15948 (store (arr!7555 a!3293) i!1240 k0!2441) (size!7907 a!3293)))))

(assert (=> b!312176 (= lt!152879 lt!152876)))

(assert (=> b!312176 (= lt!152876 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152882 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312176 (= lt!152882 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!312177 () Bool)

(declare-fun res!168687 () Bool)

(assert (=> b!312177 (=> (not res!168687) (not e!194680))))

(assert (=> b!312177 (= res!168687 (and (= (select (arr!7555 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7907 a!3293))))))

(declare-fun b!312178 () Bool)

(declare-fun res!168684 () Bool)

(declare-fun e!194679 () Bool)

(assert (=> b!312178 (=> (not res!168684) (not e!194679))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15947 (_ BitVec 32)) SeekEntryResult!2660)

(assert (=> b!312178 (= res!168684 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2660 i!1240)))))

(declare-fun b!312179 () Bool)

(declare-fun res!168685 () Bool)

(assert (=> b!312179 (=> (not res!168685) (not e!194679))))

(declare-fun arrayContainsKey!0 (array!15947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312179 (= res!168685 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312180 () Bool)

(declare-fun res!168681 () Bool)

(assert (=> b!312180 (=> (not res!168681) (not e!194679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312180 (= res!168681 (validKeyInArray!0 k0!2441))))

(declare-fun b!312181 () Bool)

(declare-fun res!168686 () Bool)

(assert (=> b!312181 (=> (not res!168686) (not e!194679))))

(assert (=> b!312181 (= res!168686 (and (= (size!7907 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7907 a!3293))))))

(declare-fun b!312182 () Bool)

(declare-fun res!168678 () Bool)

(assert (=> b!312182 (=> (not res!168678) (not e!194679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15947 (_ BitVec 32)) Bool)

(assert (=> b!312182 (= res!168678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312183 () Bool)

(assert (=> b!312183 (= e!194679 e!194680)))

(declare-fun res!168683 () Bool)

(assert (=> b!312183 (=> (not res!168683) (not e!194680))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312183 (= res!168683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152883))))

(assert (=> b!312183 (= lt!152883 (Intermediate!2660 false resIndex!52 resX!52))))

(declare-fun res!168682 () Bool)

(assert (=> start!31032 (=> (not res!168682) (not e!194679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31032 (= res!168682 (validMask!0 mask!3709))))

(assert (=> start!31032 e!194679))

(declare-fun array_inv!5505 (array!15947) Bool)

(assert (=> start!31032 (array_inv!5505 a!3293)))

(assert (=> start!31032 true))

(assert (= (and start!31032 res!168682) b!312181))

(assert (= (and b!312181 res!168686) b!312180))

(assert (= (and b!312180 res!168681) b!312179))

(assert (= (and b!312179 res!168685) b!312178))

(assert (= (and b!312178 res!168684) b!312182))

(assert (= (and b!312182 res!168678) b!312183))

(assert (= (and b!312183 res!168683) b!312177))

(assert (= (and b!312177 res!168687) b!312174))

(assert (= (and b!312174 res!168679) b!312176))

(assert (= (and b!312176 (not res!168680)) b!312175))

(declare-fun m!322417 () Bool)

(assert (=> b!312178 m!322417))

(declare-fun m!322419 () Bool)

(assert (=> b!312180 m!322419))

(declare-fun m!322421 () Bool)

(assert (=> b!312174 m!322421))

(declare-fun m!322423 () Bool)

(assert (=> b!312174 m!322423))

(declare-fun m!322425 () Bool)

(assert (=> b!312177 m!322425))

(declare-fun m!322427 () Bool)

(assert (=> b!312183 m!322427))

(assert (=> b!312183 m!322427))

(declare-fun m!322429 () Bool)

(assert (=> b!312183 m!322429))

(declare-fun m!322431 () Bool)

(assert (=> b!312182 m!322431))

(declare-fun m!322433 () Bool)

(assert (=> start!31032 m!322433))

(declare-fun m!322435 () Bool)

(assert (=> start!31032 m!322435))

(declare-fun m!322437 () Bool)

(assert (=> b!312179 m!322437))

(declare-fun m!322439 () Bool)

(assert (=> b!312176 m!322439))

(declare-fun m!322441 () Bool)

(assert (=> b!312176 m!322441))

(declare-fun m!322443 () Bool)

(assert (=> b!312176 m!322443))

(declare-fun m!322445 () Bool)

(assert (=> b!312176 m!322445))

(declare-fun m!322447 () Bool)

(assert (=> b!312176 m!322447))

(declare-fun m!322449 () Bool)

(assert (=> b!312175 m!322449))

(check-sat (not b!312175) (not b!312179) (not start!31032) (not b!312176) (not b!312178) (not b!312180) (not b!312183) (not b!312174) (not b!312182))
(check-sat)
