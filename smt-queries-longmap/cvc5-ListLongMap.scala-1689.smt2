; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31022 () Bool)

(assert start!31022)

(declare-fun b!311867 () Bool)

(declare-fun e!194535 () Bool)

(declare-fun e!194534 () Bool)

(assert (=> b!311867 (= e!194535 e!194534)))

(declare-fun res!168323 () Bool)

(assert (=> b!311867 (=> (not res!168323) (not e!194534))))

(declare-datatypes ((array!15924 0))(
  ( (array!15925 (arr!7544 (Array (_ BitVec 32) (_ BitVec 64))) (size!7896 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15924)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2684 0))(
  ( (MissingZero!2684 (index!12912 (_ BitVec 32))) (Found!2684 (index!12913 (_ BitVec 32))) (Intermediate!2684 (undefined!3496 Bool) (index!12914 (_ BitVec 32)) (x!31129 (_ BitVec 32))) (Undefined!2684) (MissingVacant!2684 (index!12915 (_ BitVec 32))) )
))
(declare-fun lt!152574 () SeekEntryResult!2684)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15924 (_ BitVec 32)) SeekEntryResult!2684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311867 (= res!168323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152574))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311867 (= lt!152574 (Intermediate!2684 false resIndex!52 resX!52))))

(declare-fun b!311868 () Bool)

(declare-fun res!168328 () Bool)

(assert (=> b!311868 (=> (not res!168328) (not e!194534))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311868 (= res!168328 (and (= (select (arr!7544 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7896 a!3293))))))

(declare-fun b!311869 () Bool)

(declare-fun res!168330 () Bool)

(assert (=> b!311869 (=> (not res!168330) (not e!194535))))

(assert (=> b!311869 (= res!168330 (and (= (size!7896 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7896 a!3293))))))

(declare-fun res!168325 () Bool)

(assert (=> start!31022 (=> (not res!168325) (not e!194535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31022 (= res!168325 (validMask!0 mask!3709))))

(assert (=> start!31022 e!194535))

(declare-fun array_inv!5507 (array!15924) Bool)

(assert (=> start!31022 (array_inv!5507 a!3293)))

(assert (=> start!31022 true))

(declare-fun b!311870 () Bool)

(declare-fun e!194533 () Bool)

(assert (=> b!311870 (= e!194533 (bvsge mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!152576 () SeekEntryResult!2684)

(declare-fun lt!152570 () SeekEntryResult!2684)

(assert (=> b!311870 (= lt!152576 lt!152570)))

(declare-fun lt!152577 () (_ BitVec 32))

(declare-datatypes ((Unit!9599 0))(
  ( (Unit!9600) )
))
(declare-fun lt!152573 () Unit!9599)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15924 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9599)

(assert (=> b!311870 (= lt!152573 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152577 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311871 () Bool)

(declare-fun e!194536 () Bool)

(assert (=> b!311871 (= e!194534 e!194536)))

(declare-fun res!168322 () Bool)

(assert (=> b!311871 (=> (not res!168322) (not e!194536))))

(declare-fun lt!152572 () SeekEntryResult!2684)

(assert (=> b!311871 (= res!168322 (and (= lt!152572 lt!152574) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7544 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311871 (= lt!152572 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311872 () Bool)

(declare-fun res!168321 () Bool)

(assert (=> b!311872 (=> (not res!168321) (not e!194535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15924 (_ BitVec 32)) Bool)

(assert (=> b!311872 (= res!168321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311873 () Bool)

(declare-fun res!168329 () Bool)

(assert (=> b!311873 (=> (not res!168329) (not e!194535))))

(declare-fun arrayContainsKey!0 (array!15924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311873 (= res!168329 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311874 () Bool)

(assert (=> b!311874 (= e!194536 (not e!194533))))

(declare-fun res!168324 () Bool)

(assert (=> b!311874 (=> res!168324 e!194533)))

(assert (=> b!311874 (= res!168324 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152577 #b00000000000000000000000000000000) (bvsge lt!152577 (size!7896 a!3293)) (not (= lt!152570 lt!152574))))))

(declare-fun lt!152575 () SeekEntryResult!2684)

(assert (=> b!311874 (= lt!152575 lt!152576)))

(declare-fun lt!152571 () array!15924)

(assert (=> b!311874 (= lt!152576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152577 k!2441 lt!152571 mask!3709))))

(assert (=> b!311874 (= lt!152575 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152571 mask!3709))))

(assert (=> b!311874 (= lt!152571 (array!15925 (store (arr!7544 a!3293) i!1240 k!2441) (size!7896 a!3293)))))

(assert (=> b!311874 (= lt!152572 lt!152570)))

(assert (=> b!311874 (= lt!152570 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152577 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311874 (= lt!152577 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311875 () Bool)

(declare-fun res!168326 () Bool)

(assert (=> b!311875 (=> (not res!168326) (not e!194535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311875 (= res!168326 (validKeyInArray!0 k!2441))))

(declare-fun b!311876 () Bool)

(declare-fun res!168327 () Bool)

(assert (=> b!311876 (=> (not res!168327) (not e!194535))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15924 (_ BitVec 32)) SeekEntryResult!2684)

(assert (=> b!311876 (= res!168327 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2684 i!1240)))))

(assert (= (and start!31022 res!168325) b!311869))

(assert (= (and b!311869 res!168330) b!311875))

(assert (= (and b!311875 res!168326) b!311873))

(assert (= (and b!311873 res!168329) b!311876))

(assert (= (and b!311876 res!168327) b!311872))

(assert (= (and b!311872 res!168321) b!311867))

(assert (= (and b!311867 res!168323) b!311868))

(assert (= (and b!311868 res!168328) b!311871))

(assert (= (and b!311871 res!168322) b!311874))

(assert (= (and b!311874 (not res!168324)) b!311870))

(declare-fun m!321875 () Bool)

(assert (=> b!311871 m!321875))

(declare-fun m!321877 () Bool)

(assert (=> b!311871 m!321877))

(declare-fun m!321879 () Bool)

(assert (=> b!311874 m!321879))

(declare-fun m!321881 () Bool)

(assert (=> b!311874 m!321881))

(declare-fun m!321883 () Bool)

(assert (=> b!311874 m!321883))

(declare-fun m!321885 () Bool)

(assert (=> b!311874 m!321885))

(declare-fun m!321887 () Bool)

(assert (=> b!311874 m!321887))

(declare-fun m!321889 () Bool)

(assert (=> b!311876 m!321889))

(declare-fun m!321891 () Bool)

(assert (=> b!311872 m!321891))

(declare-fun m!321893 () Bool)

(assert (=> b!311873 m!321893))

(declare-fun m!321895 () Bool)

(assert (=> b!311868 m!321895))

(declare-fun m!321897 () Bool)

(assert (=> start!31022 m!321897))

(declare-fun m!321899 () Bool)

(assert (=> start!31022 m!321899))

(declare-fun m!321901 () Bool)

(assert (=> b!311875 m!321901))

(declare-fun m!321903 () Bool)

(assert (=> b!311870 m!321903))

(declare-fun m!321905 () Bool)

(assert (=> b!311867 m!321905))

(assert (=> b!311867 m!321905))

(declare-fun m!321907 () Bool)

(assert (=> b!311867 m!321907))

(push 1)

