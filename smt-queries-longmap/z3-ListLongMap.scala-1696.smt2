; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31050 () Bool)

(assert start!31050)

(declare-fun b!312222 () Bool)

(declare-fun e!194672 () Bool)

(assert (=> b!312222 (= e!194672 true)))

(declare-datatypes ((SeekEntryResult!2699 0))(
  ( (MissingZero!2699 (index!12972 (_ BitVec 32))) (Found!2699 (index!12973 (_ BitVec 32))) (Intermediate!2699 (undefined!3511 Bool) (index!12974 (_ BitVec 32)) (x!31195 (_ BitVec 32))) (Undefined!2699) (MissingVacant!2699 (index!12975 (_ BitVec 32))) )
))
(declare-fun lt!152843 () SeekEntryResult!2699)

(declare-fun lt!152844 () SeekEntryResult!2699)

(assert (=> b!312222 (= lt!152843 lt!152844)))

(declare-datatypes ((array!15956 0))(
  ( (array!15957 (arr!7560 (Array (_ BitVec 32) (_ BitVec 64))) (size!7913 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15956)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((Unit!9601 0))(
  ( (Unit!9602) )
))
(declare-fun lt!152839 () Unit!9601)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152841 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15956 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9601)

(assert (=> b!312222 (= lt!152839 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152841 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312223 () Bool)

(declare-fun e!194673 () Bool)

(assert (=> b!312223 (= e!194673 (not e!194672))))

(declare-fun res!168829 () Bool)

(assert (=> b!312223 (=> res!168829 e!194672)))

(declare-fun lt!152842 () SeekEntryResult!2699)

(assert (=> b!312223 (= res!168829 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152841 #b00000000000000000000000000000000) (bvsge lt!152841 (size!7913 a!3293)) (not (= lt!152844 lt!152842))))))

(declare-fun lt!152840 () SeekEntryResult!2699)

(assert (=> b!312223 (= lt!152840 lt!152843)))

(declare-fun lt!152845 () array!15956)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15956 (_ BitVec 32)) SeekEntryResult!2699)

(assert (=> b!312223 (= lt!152843 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152841 k0!2441 lt!152845 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312223 (= lt!152840 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152845 mask!3709))))

(assert (=> b!312223 (= lt!152845 (array!15957 (store (arr!7560 a!3293) i!1240 k0!2441) (size!7913 a!3293)))))

(declare-fun lt!152846 () SeekEntryResult!2699)

(assert (=> b!312223 (= lt!152846 lt!152844)))

(assert (=> b!312223 (= lt!152844 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152841 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312223 (= lt!152841 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312224 () Bool)

(declare-fun e!194671 () Bool)

(declare-fun e!194675 () Bool)

(assert (=> b!312224 (= e!194671 e!194675)))

(declare-fun res!168831 () Bool)

(assert (=> b!312224 (=> (not res!168831) (not e!194675))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312224 (= res!168831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152842))))

(assert (=> b!312224 (= lt!152842 (Intermediate!2699 false resIndex!52 resX!52))))

(declare-fun b!312225 () Bool)

(declare-fun res!168823 () Bool)

(assert (=> b!312225 (=> (not res!168823) (not e!194671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15956 (_ BitVec 32)) Bool)

(assert (=> b!312225 (= res!168823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!168830 () Bool)

(assert (=> start!31050 (=> (not res!168830) (not e!194671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31050 (= res!168830 (validMask!0 mask!3709))))

(assert (=> start!31050 e!194671))

(declare-fun array_inv!5532 (array!15956) Bool)

(assert (=> start!31050 (array_inv!5532 a!3293)))

(assert (=> start!31050 true))

(declare-fun b!312226 () Bool)

(declare-fun res!168822 () Bool)

(assert (=> b!312226 (=> (not res!168822) (not e!194671))))

(assert (=> b!312226 (= res!168822 (and (= (size!7913 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7913 a!3293))))))

(declare-fun b!312227 () Bool)

(declare-fun res!168828 () Bool)

(assert (=> b!312227 (=> (not res!168828) (not e!194671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312227 (= res!168828 (validKeyInArray!0 k0!2441))))

(declare-fun b!312228 () Bool)

(declare-fun res!168824 () Bool)

(assert (=> b!312228 (=> (not res!168824) (not e!194675))))

(assert (=> b!312228 (= res!168824 (and (= (select (arr!7560 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7913 a!3293))))))

(declare-fun b!312229 () Bool)

(assert (=> b!312229 (= e!194675 e!194673)))

(declare-fun res!168827 () Bool)

(assert (=> b!312229 (=> (not res!168827) (not e!194673))))

(assert (=> b!312229 (= res!168827 (and (= lt!152846 lt!152842) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7560 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312229 (= lt!152846 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312230 () Bool)

(declare-fun res!168825 () Bool)

(assert (=> b!312230 (=> (not res!168825) (not e!194671))))

(declare-fun arrayContainsKey!0 (array!15956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312230 (= res!168825 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312231 () Bool)

(declare-fun res!168826 () Bool)

(assert (=> b!312231 (=> (not res!168826) (not e!194671))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15956 (_ BitVec 32)) SeekEntryResult!2699)

(assert (=> b!312231 (= res!168826 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2699 i!1240)))))

(assert (= (and start!31050 res!168830) b!312226))

(assert (= (and b!312226 res!168822) b!312227))

(assert (= (and b!312227 res!168828) b!312230))

(assert (= (and b!312230 res!168825) b!312231))

(assert (= (and b!312231 res!168826) b!312225))

(assert (= (and b!312225 res!168823) b!312224))

(assert (= (and b!312224 res!168831) b!312228))

(assert (= (and b!312228 res!168824) b!312229))

(assert (= (and b!312229 res!168827) b!312223))

(assert (= (and b!312223 (not res!168829)) b!312222))

(declare-fun m!321859 () Bool)

(assert (=> b!312231 m!321859))

(declare-fun m!321861 () Bool)

(assert (=> b!312224 m!321861))

(assert (=> b!312224 m!321861))

(declare-fun m!321863 () Bool)

(assert (=> b!312224 m!321863))

(declare-fun m!321865 () Bool)

(assert (=> b!312225 m!321865))

(declare-fun m!321867 () Bool)

(assert (=> b!312222 m!321867))

(declare-fun m!321869 () Bool)

(assert (=> b!312229 m!321869))

(declare-fun m!321871 () Bool)

(assert (=> b!312229 m!321871))

(declare-fun m!321873 () Bool)

(assert (=> b!312227 m!321873))

(declare-fun m!321875 () Bool)

(assert (=> b!312228 m!321875))

(declare-fun m!321877 () Bool)

(assert (=> b!312230 m!321877))

(declare-fun m!321879 () Bool)

(assert (=> b!312223 m!321879))

(declare-fun m!321881 () Bool)

(assert (=> b!312223 m!321881))

(declare-fun m!321883 () Bool)

(assert (=> b!312223 m!321883))

(declare-fun m!321885 () Bool)

(assert (=> b!312223 m!321885))

(declare-fun m!321887 () Bool)

(assert (=> b!312223 m!321887))

(declare-fun m!321889 () Bool)

(assert (=> start!31050 m!321889))

(declare-fun m!321891 () Bool)

(assert (=> start!31050 m!321891))

(check-sat (not b!312231) (not b!312229) (not b!312227) (not start!31050) (not b!312224) (not b!312225) (not b!312223) (not b!312222) (not b!312230))
(check-sat)
