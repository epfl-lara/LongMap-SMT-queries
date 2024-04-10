; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31020 () Bool)

(assert start!31020)

(declare-fun b!311837 () Bool)

(declare-fun res!168298 () Bool)

(declare-fun e!194517 () Bool)

(assert (=> b!311837 (=> (not res!168298) (not e!194517))))

(declare-datatypes ((array!15922 0))(
  ( (array!15923 (arr!7543 (Array (_ BitVec 32) (_ BitVec 64))) (size!7895 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15922)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15922 (_ BitVec 32)) Bool)

(assert (=> b!311837 (= res!168298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!168300 () Bool)

(assert (=> start!31020 (=> (not res!168300) (not e!194517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31020 (= res!168300 (validMask!0 mask!3709))))

(assert (=> start!31020 e!194517))

(declare-fun array_inv!5506 (array!15922) Bool)

(assert (=> start!31020 (array_inv!5506 a!3293)))

(assert (=> start!31020 true))

(declare-fun b!311838 () Bool)

(declare-fun e!194520 () Bool)

(assert (=> b!311838 (= e!194520 true)))

(declare-datatypes ((SeekEntryResult!2683 0))(
  ( (MissingZero!2683 (index!12908 (_ BitVec 32))) (Found!2683 (index!12909 (_ BitVec 32))) (Intermediate!2683 (undefined!3495 Bool) (index!12910 (_ BitVec 32)) (x!31120 (_ BitVec 32))) (Undefined!2683) (MissingVacant!2683 (index!12911 (_ BitVec 32))) )
))
(declare-fun lt!152549 () SeekEntryResult!2683)

(declare-fun lt!152548 () SeekEntryResult!2683)

(assert (=> b!311838 (= lt!152549 lt!152548)))

(declare-fun lt!152546 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((Unit!9597 0))(
  ( (Unit!9598) )
))
(declare-fun lt!152552 () Unit!9597)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15922 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9597)

(assert (=> b!311838 (= lt!152552 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152546 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311839 () Bool)

(declare-fun res!168293 () Bool)

(assert (=> b!311839 (=> (not res!168293) (not e!194517))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15922 (_ BitVec 32)) SeekEntryResult!2683)

(assert (=> b!311839 (= res!168293 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2683 i!1240)))))

(declare-fun b!311840 () Bool)

(declare-fun e!194521 () Bool)

(assert (=> b!311840 (= e!194521 (not e!194520))))

(declare-fun res!168292 () Bool)

(assert (=> b!311840 (=> res!168292 e!194520)))

(declare-fun lt!152551 () SeekEntryResult!2683)

(assert (=> b!311840 (= res!168292 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152546 #b00000000000000000000000000000000) (bvsge lt!152546 (size!7895 a!3293)) (not (= lt!152548 lt!152551))))))

(declare-fun lt!152553 () SeekEntryResult!2683)

(assert (=> b!311840 (= lt!152553 lt!152549)))

(declare-fun lt!152550 () array!15922)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15922 (_ BitVec 32)) SeekEntryResult!2683)

(assert (=> b!311840 (= lt!152549 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152546 k!2441 lt!152550 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311840 (= lt!152553 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152550 mask!3709))))

(assert (=> b!311840 (= lt!152550 (array!15923 (store (arr!7543 a!3293) i!1240 k!2441) (size!7895 a!3293)))))

(declare-fun lt!152547 () SeekEntryResult!2683)

(assert (=> b!311840 (= lt!152547 lt!152548)))

(assert (=> b!311840 (= lt!152548 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152546 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311840 (= lt!152546 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311841 () Bool)

(declare-fun res!168294 () Bool)

(declare-fun e!194518 () Bool)

(assert (=> b!311841 (=> (not res!168294) (not e!194518))))

(assert (=> b!311841 (= res!168294 (and (= (select (arr!7543 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7895 a!3293))))))

(declare-fun b!311842 () Bool)

(assert (=> b!311842 (= e!194517 e!194518)))

(declare-fun res!168291 () Bool)

(assert (=> b!311842 (=> (not res!168291) (not e!194518))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311842 (= res!168291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152551))))

(assert (=> b!311842 (= lt!152551 (Intermediate!2683 false resIndex!52 resX!52))))

(declare-fun b!311843 () Bool)

(declare-fun res!168299 () Bool)

(assert (=> b!311843 (=> (not res!168299) (not e!194517))))

(assert (=> b!311843 (= res!168299 (and (= (size!7895 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7895 a!3293))))))

(declare-fun b!311844 () Bool)

(assert (=> b!311844 (= e!194518 e!194521)))

(declare-fun res!168295 () Bool)

(assert (=> b!311844 (=> (not res!168295) (not e!194521))))

(assert (=> b!311844 (= res!168295 (and (= lt!152547 lt!152551) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7543 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311844 (= lt!152547 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311845 () Bool)

(declare-fun res!168297 () Bool)

(assert (=> b!311845 (=> (not res!168297) (not e!194517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311845 (= res!168297 (validKeyInArray!0 k!2441))))

(declare-fun b!311846 () Bool)

(declare-fun res!168296 () Bool)

(assert (=> b!311846 (=> (not res!168296) (not e!194517))))

(declare-fun arrayContainsKey!0 (array!15922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311846 (= res!168296 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31020 res!168300) b!311843))

(assert (= (and b!311843 res!168299) b!311845))

(assert (= (and b!311845 res!168297) b!311846))

(assert (= (and b!311846 res!168296) b!311839))

(assert (= (and b!311839 res!168293) b!311837))

(assert (= (and b!311837 res!168298) b!311842))

(assert (= (and b!311842 res!168291) b!311841))

(assert (= (and b!311841 res!168294) b!311844))

(assert (= (and b!311844 res!168295) b!311840))

(assert (= (and b!311840 (not res!168292)) b!311838))

(declare-fun m!321841 () Bool)

(assert (=> b!311842 m!321841))

(assert (=> b!311842 m!321841))

(declare-fun m!321843 () Bool)

(assert (=> b!311842 m!321843))

(declare-fun m!321845 () Bool)

(assert (=> b!311844 m!321845))

(declare-fun m!321847 () Bool)

(assert (=> b!311844 m!321847))

(declare-fun m!321849 () Bool)

(assert (=> b!311837 m!321849))

(declare-fun m!321851 () Bool)

(assert (=> start!31020 m!321851))

(declare-fun m!321853 () Bool)

(assert (=> start!31020 m!321853))

(declare-fun m!321855 () Bool)

(assert (=> b!311846 m!321855))

(declare-fun m!321857 () Bool)

(assert (=> b!311845 m!321857))

(declare-fun m!321859 () Bool)

(assert (=> b!311839 m!321859))

(declare-fun m!321861 () Bool)

(assert (=> b!311840 m!321861))

(declare-fun m!321863 () Bool)

(assert (=> b!311840 m!321863))

(declare-fun m!321865 () Bool)

(assert (=> b!311840 m!321865))

(declare-fun m!321867 () Bool)

(assert (=> b!311840 m!321867))

(declare-fun m!321869 () Bool)

(assert (=> b!311840 m!321869))

(declare-fun m!321871 () Bool)

(assert (=> b!311841 m!321871))

(declare-fun m!321873 () Bool)

(assert (=> b!311838 m!321873))

(push 1)

