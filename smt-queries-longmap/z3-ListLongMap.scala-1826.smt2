; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33012 () Bool)

(assert start!33012)

(declare-fun b!328789 () Bool)

(declare-fun res!181117 () Bool)

(declare-fun e!202069 () Bool)

(assert (=> b!328789 (=> (not res!181117) (not e!202069))))

(declare-datatypes ((array!16818 0))(
  ( (array!16819 (arr!7956 (Array (_ BitVec 32) (_ BitVec 64))) (size!8308 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16818)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3087 0))(
  ( (MissingZero!3087 (index!14524 (_ BitVec 32))) (Found!3087 (index!14525 (_ BitVec 32))) (Intermediate!3087 (undefined!3899 Bool) (index!14526 (_ BitVec 32)) (x!32790 (_ BitVec 32))) (Undefined!3087) (MissingVacant!3087 (index!14527 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16818 (_ BitVec 32)) SeekEntryResult!3087)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328789 (= res!181117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!3087 false resIndex!58 resX!58)))))

(declare-fun b!328790 () Bool)

(declare-fun res!181115 () Bool)

(assert (=> b!328790 (=> (not res!181115) (not e!202069))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16818 (_ BitVec 32)) SeekEntryResult!3087)

(assert (=> b!328790 (= res!181115 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3087 i!1250)))))

(declare-fun b!328791 () Bool)

(assert (=> b!328791 (= e!202069 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun lt!158025 () SeekEntryResult!3087)

(assert (=> b!328791 (= lt!158025 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun b!328793 () Bool)

(declare-fun res!181116 () Bool)

(assert (=> b!328793 (=> (not res!181116) (not e!202069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328793 (= res!181116 (validKeyInArray!0 k0!2497))))

(declare-fun b!328794 () Bool)

(declare-fun res!181120 () Bool)

(assert (=> b!328794 (=> (not res!181120) (not e!202069))))

(assert (=> b!328794 (= res!181120 (and (= (select (arr!7956 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8308 a!3305))))))

(declare-fun res!181122 () Bool)

(assert (=> start!33012 (=> (not res!181122) (not e!202069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33012 (= res!181122 (validMask!0 mask!3777))))

(assert (=> start!33012 e!202069))

(declare-fun array_inv!5919 (array!16818) Bool)

(assert (=> start!33012 (array_inv!5919 a!3305)))

(assert (=> start!33012 true))

(declare-fun b!328792 () Bool)

(declare-fun res!181121 () Bool)

(assert (=> b!328792 (=> (not res!181121) (not e!202069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16818 (_ BitVec 32)) Bool)

(assert (=> b!328792 (= res!181121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328795 () Bool)

(declare-fun res!181119 () Bool)

(assert (=> b!328795 (=> (not res!181119) (not e!202069))))

(assert (=> b!328795 (= res!181119 (and (= (size!8308 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8308 a!3305))))))

(declare-fun b!328796 () Bool)

(declare-fun res!181118 () Bool)

(assert (=> b!328796 (=> (not res!181118) (not e!202069))))

(declare-fun arrayContainsKey!0 (array!16818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328796 (= res!181118 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!33012 res!181122) b!328795))

(assert (= (and b!328795 res!181119) b!328793))

(assert (= (and b!328793 res!181116) b!328796))

(assert (= (and b!328796 res!181118) b!328790))

(assert (= (and b!328790 res!181115) b!328792))

(assert (= (and b!328792 res!181121) b!328789))

(assert (= (and b!328789 res!181117) b!328794))

(assert (= (and b!328794 res!181120) b!328791))

(declare-fun m!334645 () Bool)

(assert (=> b!328789 m!334645))

(assert (=> b!328789 m!334645))

(declare-fun m!334647 () Bool)

(assert (=> b!328789 m!334647))

(declare-fun m!334649 () Bool)

(assert (=> b!328790 m!334649))

(declare-fun m!334651 () Bool)

(assert (=> b!328792 m!334651))

(declare-fun m!334653 () Bool)

(assert (=> b!328791 m!334653))

(declare-fun m!334655 () Bool)

(assert (=> b!328796 m!334655))

(declare-fun m!334657 () Bool)

(assert (=> b!328793 m!334657))

(declare-fun m!334659 () Bool)

(assert (=> start!33012 m!334659))

(declare-fun m!334661 () Bool)

(assert (=> start!33012 m!334661))

(declare-fun m!334663 () Bool)

(assert (=> b!328794 m!334663))

(check-sat (not b!328792) (not b!328790) (not b!328791) (not start!33012) (not b!328789) (not b!328793) (not b!328796))
