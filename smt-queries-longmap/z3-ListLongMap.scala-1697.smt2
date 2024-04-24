; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31056 () Bool)

(assert start!31056)

(declare-fun b!312534 () Bool)

(declare-fun res!169046 () Bool)

(declare-fun e!194861 () Bool)

(assert (=> b!312534 (=> (not res!169046) (not e!194861))))

(declare-datatypes ((array!15971 0))(
  ( (array!15972 (arr!7567 (Array (_ BitVec 32) (_ BitVec 64))) (size!7919 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15971)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312534 (= res!169046 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312535 () Bool)

(declare-fun res!169038 () Bool)

(assert (=> b!312535 (=> (not res!169038) (not e!194861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312535 (= res!169038 (validKeyInArray!0 k0!2441))))

(declare-fun b!312536 () Bool)

(declare-fun res!169039 () Bool)

(assert (=> b!312536 (=> (not res!169039) (not e!194861))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312536 (= res!169039 (and (= (size!7919 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7919 a!3293))))))

(declare-fun b!312537 () Bool)

(declare-fun res!169041 () Bool)

(declare-fun e!194860 () Bool)

(assert (=> b!312537 (=> (not res!169041) (not e!194860))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312537 (= res!169041 (and (= (select (arr!7567 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7919 a!3293))))))

(declare-fun b!312538 () Bool)

(declare-fun res!169045 () Bool)

(assert (=> b!312538 (=> (not res!169045) (not e!194861))))

(declare-datatypes ((SeekEntryResult!2672 0))(
  ( (MissingZero!2672 (index!12864 (_ BitVec 32))) (Found!2672 (index!12865 (_ BitVec 32))) (Intermediate!2672 (undefined!3484 Bool) (index!12866 (_ BitVec 32)) (x!31178 (_ BitVec 32))) (Undefined!2672) (MissingVacant!2672 (index!12867 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15971 (_ BitVec 32)) SeekEntryResult!2672)

(assert (=> b!312538 (= res!169045 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2672 i!1240)))))

(declare-fun b!312539 () Bool)

(declare-fun e!194862 () Bool)

(assert (=> b!312539 (= e!194862 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun lt!153169 () SeekEntryResult!2672)

(declare-fun lt!153165 () SeekEntryResult!2672)

(assert (=> b!312539 (= lt!153169 lt!153165)))

(declare-fun lt!153166 () (_ BitVec 32))

(declare-datatypes ((Unit!9605 0))(
  ( (Unit!9606) )
))
(declare-fun lt!153164 () Unit!9605)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15971 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9605)

(assert (=> b!312539 (= lt!153164 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153166 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312540 () Bool)

(assert (=> b!312540 (= e!194861 e!194860)))

(declare-fun res!169040 () Bool)

(assert (=> b!312540 (=> (not res!169040) (not e!194860))))

(declare-fun lt!153168 () SeekEntryResult!2672)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15971 (_ BitVec 32)) SeekEntryResult!2672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312540 (= res!169040 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153168))))

(assert (=> b!312540 (= lt!153168 (Intermediate!2672 false resIndex!52 resX!52))))

(declare-fun b!312541 () Bool)

(declare-fun e!194858 () Bool)

(assert (=> b!312541 (= e!194858 (not e!194862))))

(declare-fun res!169044 () Bool)

(assert (=> b!312541 (=> res!169044 e!194862)))

(assert (=> b!312541 (= res!169044 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153166 #b00000000000000000000000000000000) (bvsge lt!153166 (size!7919 a!3293)) (not (= lt!153165 lt!153168))))))

(declare-fun lt!153171 () SeekEntryResult!2672)

(assert (=> b!312541 (= lt!153171 lt!153169)))

(declare-fun lt!153167 () array!15971)

(assert (=> b!312541 (= lt!153169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153166 k0!2441 lt!153167 mask!3709))))

(assert (=> b!312541 (= lt!153171 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153167 mask!3709))))

(assert (=> b!312541 (= lt!153167 (array!15972 (store (arr!7567 a!3293) i!1240 k0!2441) (size!7919 a!3293)))))

(declare-fun lt!153170 () SeekEntryResult!2672)

(assert (=> b!312541 (= lt!153170 lt!153165)))

(assert (=> b!312541 (= lt!153165 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153166 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312541 (= lt!153166 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!169047 () Bool)

(assert (=> start!31056 (=> (not res!169047) (not e!194861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31056 (= res!169047 (validMask!0 mask!3709))))

(assert (=> start!31056 e!194861))

(declare-fun array_inv!5517 (array!15971) Bool)

(assert (=> start!31056 (array_inv!5517 a!3293)))

(assert (=> start!31056 true))

(declare-fun b!312542 () Bool)

(declare-fun res!169042 () Bool)

(assert (=> b!312542 (=> (not res!169042) (not e!194861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15971 (_ BitVec 32)) Bool)

(assert (=> b!312542 (= res!169042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312543 () Bool)

(assert (=> b!312543 (= e!194860 e!194858)))

(declare-fun res!169043 () Bool)

(assert (=> b!312543 (=> (not res!169043) (not e!194858))))

(assert (=> b!312543 (= res!169043 (and (= lt!153170 lt!153168) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7567 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312543 (= lt!153170 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!31056 res!169047) b!312536))

(assert (= (and b!312536 res!169039) b!312535))

(assert (= (and b!312535 res!169038) b!312534))

(assert (= (and b!312534 res!169046) b!312538))

(assert (= (and b!312538 res!169045) b!312542))

(assert (= (and b!312542 res!169042) b!312540))

(assert (= (and b!312540 res!169040) b!312537))

(assert (= (and b!312537 res!169041) b!312543))

(assert (= (and b!312543 res!169043) b!312541))

(assert (= (and b!312541 (not res!169044)) b!312539))

(declare-fun m!322825 () Bool)

(assert (=> b!312541 m!322825))

(declare-fun m!322827 () Bool)

(assert (=> b!312541 m!322827))

(declare-fun m!322829 () Bool)

(assert (=> b!312541 m!322829))

(declare-fun m!322831 () Bool)

(assert (=> b!312541 m!322831))

(declare-fun m!322833 () Bool)

(assert (=> b!312541 m!322833))

(declare-fun m!322835 () Bool)

(assert (=> b!312537 m!322835))

(declare-fun m!322837 () Bool)

(assert (=> b!312542 m!322837))

(declare-fun m!322839 () Bool)

(assert (=> b!312534 m!322839))

(declare-fun m!322841 () Bool)

(assert (=> b!312538 m!322841))

(declare-fun m!322843 () Bool)

(assert (=> b!312543 m!322843))

(declare-fun m!322845 () Bool)

(assert (=> b!312543 m!322845))

(declare-fun m!322847 () Bool)

(assert (=> b!312539 m!322847))

(declare-fun m!322849 () Bool)

(assert (=> b!312535 m!322849))

(declare-fun m!322851 () Bool)

(assert (=> start!31056 m!322851))

(declare-fun m!322853 () Bool)

(assert (=> start!31056 m!322853))

(declare-fun m!322855 () Bool)

(assert (=> b!312540 m!322855))

(assert (=> b!312540 m!322855))

(declare-fun m!322857 () Bool)

(assert (=> b!312540 m!322857))

(check-sat (not b!312539) (not b!312542) (not b!312541) (not b!312534) (not b!312543) (not b!312540) (not b!312535) (not b!312538) (not start!31056))
(check-sat)
