; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31050 () Bool)

(assert start!31050)

(declare-fun b!312444 () Bool)

(declare-fun e!194813 () Bool)

(declare-fun e!194814 () Bool)

(assert (=> b!312444 (= e!194813 (not e!194814))))

(declare-fun res!168954 () Bool)

(assert (=> b!312444 (=> res!168954 e!194814)))

(declare-datatypes ((array!15965 0))(
  ( (array!15966 (arr!7564 (Array (_ BitVec 32) (_ BitVec 64))) (size!7916 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15965)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!153092 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2669 0))(
  ( (MissingZero!2669 (index!12852 (_ BitVec 32))) (Found!2669 (index!12853 (_ BitVec 32))) (Intermediate!2669 (undefined!3481 Bool) (index!12854 (_ BitVec 32)) (x!31167 (_ BitVec 32))) (Undefined!2669) (MissingVacant!2669 (index!12855 (_ BitVec 32))) )
))
(declare-fun lt!153098 () SeekEntryResult!2669)

(declare-fun lt!153094 () SeekEntryResult!2669)

(assert (=> b!312444 (= res!168954 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153092 #b00000000000000000000000000000000) (bvsge lt!153092 (size!7916 a!3293)) (not (= lt!153094 lt!153098))))))

(declare-fun lt!153095 () SeekEntryResult!2669)

(declare-fun lt!153097 () SeekEntryResult!2669)

(assert (=> b!312444 (= lt!153095 lt!153097)))

(declare-fun lt!153099 () array!15965)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15965 (_ BitVec 32)) SeekEntryResult!2669)

(assert (=> b!312444 (= lt!153097 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153092 k0!2441 lt!153099 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312444 (= lt!153095 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153099 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312444 (= lt!153099 (array!15966 (store (arr!7564 a!3293) i!1240 k0!2441) (size!7916 a!3293)))))

(declare-fun lt!153096 () SeekEntryResult!2669)

(assert (=> b!312444 (= lt!153096 lt!153094)))

(assert (=> b!312444 (= lt!153094 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153092 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312444 (= lt!153092 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!168949 () Bool)

(declare-fun e!194815 () Bool)

(assert (=> start!31050 (=> (not res!168949) (not e!194815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31050 (= res!168949 (validMask!0 mask!3709))))

(assert (=> start!31050 e!194815))

(declare-fun array_inv!5514 (array!15965) Bool)

(assert (=> start!31050 (array_inv!5514 a!3293)))

(assert (=> start!31050 true))

(declare-fun b!312445 () Bool)

(declare-fun res!168948 () Bool)

(assert (=> b!312445 (=> (not res!168948) (not e!194815))))

(assert (=> b!312445 (= res!168948 (and (= (size!7916 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7916 a!3293))))))

(declare-fun b!312446 () Bool)

(declare-fun e!194817 () Bool)

(assert (=> b!312446 (= e!194817 e!194813)))

(declare-fun res!168956 () Bool)

(assert (=> b!312446 (=> (not res!168956) (not e!194813))))

(assert (=> b!312446 (= res!168956 (and (= lt!153096 lt!153098) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7564 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312446 (= lt!153096 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312447 () Bool)

(declare-fun res!168955 () Bool)

(assert (=> b!312447 (=> (not res!168955) (not e!194815))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15965 (_ BitVec 32)) SeekEntryResult!2669)

(assert (=> b!312447 (= res!168955 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2669 i!1240)))))

(declare-fun b!312448 () Bool)

(declare-fun res!168952 () Bool)

(assert (=> b!312448 (=> (not res!168952) (not e!194815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15965 (_ BitVec 32)) Bool)

(assert (=> b!312448 (= res!168952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312449 () Bool)

(declare-fun res!168953 () Bool)

(assert (=> b!312449 (=> (not res!168953) (not e!194817))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312449 (= res!168953 (and (= (select (arr!7564 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7916 a!3293))))))

(declare-fun b!312450 () Bool)

(declare-fun res!168951 () Bool)

(assert (=> b!312450 (=> (not res!168951) (not e!194815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312450 (= res!168951 (validKeyInArray!0 k0!2441))))

(declare-fun b!312451 () Bool)

(assert (=> b!312451 (= e!194814 true)))

(assert (=> b!312451 (= lt!153097 lt!153094)))

(declare-datatypes ((Unit!9599 0))(
  ( (Unit!9600) )
))
(declare-fun lt!153093 () Unit!9599)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15965 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9599)

(assert (=> b!312451 (= lt!153093 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153092 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312452 () Bool)

(declare-fun res!168950 () Bool)

(assert (=> b!312452 (=> (not res!168950) (not e!194815))))

(declare-fun arrayContainsKey!0 (array!15965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312452 (= res!168950 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312453 () Bool)

(assert (=> b!312453 (= e!194815 e!194817)))

(declare-fun res!168957 () Bool)

(assert (=> b!312453 (=> (not res!168957) (not e!194817))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312453 (= res!168957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153098))))

(assert (=> b!312453 (= lt!153098 (Intermediate!2669 false resIndex!52 resX!52))))

(assert (= (and start!31050 res!168949) b!312445))

(assert (= (and b!312445 res!168948) b!312450))

(assert (= (and b!312450 res!168951) b!312452))

(assert (= (and b!312452 res!168950) b!312447))

(assert (= (and b!312447 res!168955) b!312448))

(assert (= (and b!312448 res!168952) b!312453))

(assert (= (and b!312453 res!168957) b!312449))

(assert (= (and b!312449 res!168953) b!312446))

(assert (= (and b!312446 res!168956) b!312444))

(assert (= (and b!312444 (not res!168954)) b!312451))

(declare-fun m!322723 () Bool)

(assert (=> b!312446 m!322723))

(declare-fun m!322725 () Bool)

(assert (=> b!312446 m!322725))

(declare-fun m!322727 () Bool)

(assert (=> b!312450 m!322727))

(declare-fun m!322729 () Bool)

(assert (=> b!312444 m!322729))

(declare-fun m!322731 () Bool)

(assert (=> b!312444 m!322731))

(declare-fun m!322733 () Bool)

(assert (=> b!312444 m!322733))

(declare-fun m!322735 () Bool)

(assert (=> b!312444 m!322735))

(declare-fun m!322737 () Bool)

(assert (=> b!312444 m!322737))

(declare-fun m!322739 () Bool)

(assert (=> b!312449 m!322739))

(declare-fun m!322741 () Bool)

(assert (=> start!31050 m!322741))

(declare-fun m!322743 () Bool)

(assert (=> start!31050 m!322743))

(declare-fun m!322745 () Bool)

(assert (=> b!312452 m!322745))

(declare-fun m!322747 () Bool)

(assert (=> b!312451 m!322747))

(declare-fun m!322749 () Bool)

(assert (=> b!312447 m!322749))

(declare-fun m!322751 () Bool)

(assert (=> b!312448 m!322751))

(declare-fun m!322753 () Bool)

(assert (=> b!312453 m!322753))

(assert (=> b!312453 m!322753))

(declare-fun m!322755 () Bool)

(assert (=> b!312453 m!322755))

(check-sat (not b!312450) (not b!312452) (not b!312453) (not b!312448) (not b!312446) (not start!31050) (not b!312444) (not b!312451) (not b!312447))
(check-sat)
