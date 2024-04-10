; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31570 () Bool)

(assert start!31570)

(declare-fun b!315688 () Bool)

(declare-fun res!170966 () Bool)

(declare-fun e!196489 () Bool)

(assert (=> b!315688 (=> (not res!170966) (not e!196489))))

(declare-datatypes ((array!16094 0))(
  ( (array!16095 (arr!7617 (Array (_ BitVec 32) (_ BitVec 64))) (size!7969 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16094)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16094 (_ BitVec 32)) Bool)

(assert (=> b!315688 (= res!170966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!170964 () Bool)

(assert (=> start!31570 (=> (not res!170964) (not e!196489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31570 (= res!170964 (validMask!0 mask!3709))))

(assert (=> start!31570 e!196489))

(declare-fun array_inv!5580 (array!16094) Bool)

(assert (=> start!31570 (array_inv!5580 a!3293)))

(assert (=> start!31570 true))

(declare-fun b!315689 () Bool)

(declare-fun res!170962 () Bool)

(assert (=> b!315689 (=> (not res!170962) (not e!196489))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!315689 (= res!170962 (and (= (size!7969 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7969 a!3293))))))

(declare-fun b!315690 () Bool)

(declare-fun res!170965 () Bool)

(declare-fun e!196488 () Bool)

(assert (=> b!315690 (=> (not res!170965) (not e!196488))))

(declare-datatypes ((SeekEntryResult!2757 0))(
  ( (MissingZero!2757 (index!13204 (_ BitVec 32))) (Found!2757 (index!13205 (_ BitVec 32))) (Intermediate!2757 (undefined!3569 Bool) (index!13206 (_ BitVec 32)) (x!31451 (_ BitVec 32))) (Undefined!2757) (MissingVacant!2757 (index!13207 (_ BitVec 32))) )
))
(declare-fun lt!154358 () SeekEntryResult!2757)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16094 (_ BitVec 32)) SeekEntryResult!2757)

(assert (=> b!315690 (= res!170965 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154358))))

(declare-fun b!315691 () Bool)

(assert (=> b!315691 false))

(declare-fun lt!154359 () SeekEntryResult!2757)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315691 (= lt!154359 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9712 0))(
  ( (Unit!9713) )
))
(declare-fun e!196490 () Unit!9712)

(declare-fun Unit!9714 () Unit!9712)

(assert (=> b!315691 (= e!196490 Unit!9714)))

(declare-fun b!315692 () Bool)

(assert (=> b!315692 (= e!196489 e!196488)))

(declare-fun res!170959 () Bool)

(assert (=> b!315692 (=> (not res!170959) (not e!196488))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315692 (= res!170959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154358))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315692 (= lt!154358 (Intermediate!2757 false resIndex!52 resX!52))))

(declare-fun b!315693 () Bool)

(assert (=> b!315693 false))

(declare-fun Unit!9715 () Unit!9712)

(assert (=> b!315693 (= e!196490 Unit!9715)))

(declare-fun b!315694 () Bool)

(declare-fun res!170961 () Bool)

(assert (=> b!315694 (=> (not res!170961) (not e!196489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315694 (= res!170961 (validKeyInArray!0 k0!2441))))

(declare-fun b!315695 () Bool)

(declare-fun res!170958 () Bool)

(assert (=> b!315695 (=> (not res!170958) (not e!196488))))

(assert (=> b!315695 (= res!170958 (and (= (select (arr!7617 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7969 a!3293))))))

(declare-fun b!315696 () Bool)

(assert (=> b!315696 (= e!196488 (not (= index!1781 resIndex!52)))))

(declare-fun lt!154357 () Unit!9712)

(declare-fun e!196492 () Unit!9712)

(assert (=> b!315696 (= lt!154357 e!196492)))

(declare-fun c!49982 () Bool)

(assert (=> b!315696 (= c!49982 (not (= resIndex!52 index!1781)))))

(declare-fun b!315697 () Bool)

(declare-fun Unit!9716 () Unit!9712)

(assert (=> b!315697 (= e!196492 Unit!9716)))

(declare-fun b!315698 () Bool)

(declare-fun res!170967 () Bool)

(assert (=> b!315698 (=> (not res!170967) (not e!196489))))

(declare-fun arrayContainsKey!0 (array!16094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315698 (= res!170967 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315699 () Bool)

(declare-fun res!170960 () Bool)

(assert (=> b!315699 (=> (not res!170960) (not e!196488))))

(assert (=> b!315699 (= res!170960 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7617 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315700 () Bool)

(declare-fun res!170963 () Bool)

(assert (=> b!315700 (=> (not res!170963) (not e!196489))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16094 (_ BitVec 32)) SeekEntryResult!2757)

(assert (=> b!315700 (= res!170963 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2757 i!1240)))))

(declare-fun b!315701 () Bool)

(assert (=> b!315701 (= e!196492 e!196490)))

(declare-fun c!49983 () Bool)

(assert (=> b!315701 (= c!49983 (or (= (select (arr!7617 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7617 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!31570 res!170964) b!315689))

(assert (= (and b!315689 res!170962) b!315694))

(assert (= (and b!315694 res!170961) b!315698))

(assert (= (and b!315698 res!170967) b!315700))

(assert (= (and b!315700 res!170963) b!315688))

(assert (= (and b!315688 res!170966) b!315692))

(assert (= (and b!315692 res!170959) b!315695))

(assert (= (and b!315695 res!170958) b!315690))

(assert (= (and b!315690 res!170965) b!315699))

(assert (= (and b!315699 res!170960) b!315696))

(assert (= (and b!315696 c!49982) b!315701))

(assert (= (and b!315696 (not c!49982)) b!315697))

(assert (= (and b!315701 c!49983) b!315693))

(assert (= (and b!315701 (not c!49983)) b!315691))

(declare-fun m!324859 () Bool)

(assert (=> b!315688 m!324859))

(declare-fun m!324861 () Bool)

(assert (=> b!315692 m!324861))

(assert (=> b!315692 m!324861))

(declare-fun m!324863 () Bool)

(assert (=> b!315692 m!324863))

(declare-fun m!324865 () Bool)

(assert (=> start!31570 m!324865))

(declare-fun m!324867 () Bool)

(assert (=> start!31570 m!324867))

(declare-fun m!324869 () Bool)

(assert (=> b!315690 m!324869))

(declare-fun m!324871 () Bool)

(assert (=> b!315700 m!324871))

(declare-fun m!324873 () Bool)

(assert (=> b!315698 m!324873))

(declare-fun m!324875 () Bool)

(assert (=> b!315701 m!324875))

(declare-fun m!324877 () Bool)

(assert (=> b!315694 m!324877))

(declare-fun m!324879 () Bool)

(assert (=> b!315691 m!324879))

(assert (=> b!315691 m!324879))

(declare-fun m!324881 () Bool)

(assert (=> b!315691 m!324881))

(assert (=> b!315699 m!324875))

(declare-fun m!324883 () Bool)

(assert (=> b!315695 m!324883))

(check-sat (not b!315700) (not b!315694) (not b!315688) (not b!315691) (not start!31570) (not b!315698) (not b!315690) (not b!315692))
(check-sat)
