; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31062 () Bool)

(assert start!31062)

(declare-fun b!312624 () Bool)

(declare-fun res!169131 () Bool)

(declare-fun e!194905 () Bool)

(assert (=> b!312624 (=> (not res!169131) (not e!194905))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312624 (= res!169131 (validKeyInArray!0 k0!2441))))

(declare-fun b!312625 () Bool)

(declare-fun res!169133 () Bool)

(assert (=> b!312625 (=> (not res!169133) (not e!194905))))

(declare-datatypes ((array!15977 0))(
  ( (array!15978 (arr!7570 (Array (_ BitVec 32) (_ BitVec 64))) (size!7922 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15977)

(declare-fun arrayContainsKey!0 (array!15977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312625 (= res!169133 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312626 () Bool)

(declare-fun res!169137 () Bool)

(assert (=> b!312626 (=> (not res!169137) (not e!194905))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2675 0))(
  ( (MissingZero!2675 (index!12876 (_ BitVec 32))) (Found!2675 (index!12877 (_ BitVec 32))) (Intermediate!2675 (undefined!3487 Bool) (index!12878 (_ BitVec 32)) (x!31189 (_ BitVec 32))) (Undefined!2675) (MissingVacant!2675 (index!12879 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15977 (_ BitVec 32)) SeekEntryResult!2675)

(assert (=> b!312626 (= res!169137 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2675 i!1240)))))

(declare-fun b!312627 () Bool)

(declare-fun res!169128 () Bool)

(assert (=> b!312627 (=> (not res!169128) (not e!194905))))

(assert (=> b!312627 (= res!169128 (and (= (size!7922 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7922 a!3293))))))

(declare-fun b!312628 () Bool)

(declare-fun e!194903 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312628 (= e!194903 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(declare-fun lt!153243 () SeekEntryResult!2675)

(declare-fun lt!153239 () SeekEntryResult!2675)

(assert (=> b!312628 (= lt!153243 lt!153239)))

(declare-fun lt!153241 () (_ BitVec 32))

(declare-datatypes ((Unit!9611 0))(
  ( (Unit!9612) )
))
(declare-fun lt!153242 () Unit!9611)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9611)

(assert (=> b!312628 (= lt!153242 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153241 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312629 () Bool)

(declare-fun res!169135 () Bool)

(declare-fun e!194907 () Bool)

(assert (=> b!312629 (=> (not res!169135) (not e!194907))))

(assert (=> b!312629 (= res!169135 (and (= (select (arr!7570 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7922 a!3293))))))

(declare-fun res!169134 () Bool)

(assert (=> start!31062 (=> (not res!169134) (not e!194905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31062 (= res!169134 (validMask!0 mask!3709))))

(assert (=> start!31062 e!194905))

(declare-fun array_inv!5520 (array!15977) Bool)

(assert (=> start!31062 (array_inv!5520 a!3293)))

(assert (=> start!31062 true))

(declare-fun b!312630 () Bool)

(declare-fun res!169130 () Bool)

(assert (=> b!312630 (=> (not res!169130) (not e!194905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15977 (_ BitVec 32)) Bool)

(assert (=> b!312630 (= res!169130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312631 () Bool)

(assert (=> b!312631 (= e!194905 e!194907)))

(declare-fun res!169129 () Bool)

(assert (=> b!312631 (=> (not res!169129) (not e!194907))))

(declare-fun lt!153237 () SeekEntryResult!2675)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15977 (_ BitVec 32)) SeekEntryResult!2675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312631 (= res!169129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153237))))

(assert (=> b!312631 (= lt!153237 (Intermediate!2675 false resIndex!52 resX!52))))

(declare-fun b!312632 () Bool)

(declare-fun e!194904 () Bool)

(assert (=> b!312632 (= e!194907 e!194904)))

(declare-fun res!169136 () Bool)

(assert (=> b!312632 (=> (not res!169136) (not e!194904))))

(declare-fun lt!153240 () SeekEntryResult!2675)

(assert (=> b!312632 (= res!169136 (and (= lt!153240 lt!153237) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7570 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312632 (= lt!153240 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312633 () Bool)

(assert (=> b!312633 (= e!194904 (not e!194903))))

(declare-fun res!169132 () Bool)

(assert (=> b!312633 (=> res!169132 e!194903)))

(assert (=> b!312633 (= res!169132 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153241 #b00000000000000000000000000000000) (bvsge lt!153241 (size!7922 a!3293)) (not (= lt!153239 lt!153237))))))

(declare-fun lt!153236 () SeekEntryResult!2675)

(assert (=> b!312633 (= lt!153236 lt!153243)))

(declare-fun lt!153238 () array!15977)

(assert (=> b!312633 (= lt!153243 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153241 k0!2441 lt!153238 mask!3709))))

(assert (=> b!312633 (= lt!153236 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153238 mask!3709))))

(assert (=> b!312633 (= lt!153238 (array!15978 (store (arr!7570 a!3293) i!1240 k0!2441) (size!7922 a!3293)))))

(assert (=> b!312633 (= lt!153240 lt!153239)))

(assert (=> b!312633 (= lt!153239 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153241 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312633 (= lt!153241 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (= (and start!31062 res!169134) b!312627))

(assert (= (and b!312627 res!169128) b!312624))

(assert (= (and b!312624 res!169131) b!312625))

(assert (= (and b!312625 res!169133) b!312626))

(assert (= (and b!312626 res!169137) b!312630))

(assert (= (and b!312630 res!169130) b!312631))

(assert (= (and b!312631 res!169129) b!312629))

(assert (= (and b!312629 res!169135) b!312632))

(assert (= (and b!312632 res!169136) b!312633))

(assert (= (and b!312633 (not res!169132)) b!312628))

(declare-fun m!322927 () Bool)

(assert (=> b!312628 m!322927))

(declare-fun m!322929 () Bool)

(assert (=> b!312633 m!322929))

(declare-fun m!322931 () Bool)

(assert (=> b!312633 m!322931))

(declare-fun m!322933 () Bool)

(assert (=> b!312633 m!322933))

(declare-fun m!322935 () Bool)

(assert (=> b!312633 m!322935))

(declare-fun m!322937 () Bool)

(assert (=> b!312633 m!322937))

(declare-fun m!322939 () Bool)

(assert (=> b!312624 m!322939))

(declare-fun m!322941 () Bool)

(assert (=> b!312626 m!322941))

(declare-fun m!322943 () Bool)

(assert (=> b!312630 m!322943))

(declare-fun m!322945 () Bool)

(assert (=> b!312629 m!322945))

(declare-fun m!322947 () Bool)

(assert (=> b!312632 m!322947))

(declare-fun m!322949 () Bool)

(assert (=> b!312632 m!322949))

(declare-fun m!322951 () Bool)

(assert (=> b!312631 m!322951))

(assert (=> b!312631 m!322951))

(declare-fun m!322953 () Bool)

(assert (=> b!312631 m!322953))

(declare-fun m!322955 () Bool)

(assert (=> start!31062 m!322955))

(declare-fun m!322957 () Bool)

(assert (=> start!31062 m!322957))

(declare-fun m!322959 () Bool)

(assert (=> b!312625 m!322959))

(check-sat (not b!312632) (not b!312633) (not b!312624) (not b!312628) (not b!312626) (not start!31062) (not b!312630) (not b!312631) (not b!312625))
(check-sat)
