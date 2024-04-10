; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46742 () Bool)

(assert start!46742)

(declare-fun b!516106 () Bool)

(declare-fun res!315675 () Bool)

(declare-fun e!301254 () Bool)

(assert (=> b!516106 (=> (not res!315675) (not e!301254))))

(declare-datatypes ((array!33054 0))(
  ( (array!33055 (arr!15895 (Array (_ BitVec 32) (_ BitVec 64))) (size!16259 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33054)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516106 (= res!315675 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516107 () Bool)

(declare-fun e!301251 () Bool)

(assert (=> b!516107 (= e!301251 true)))

(declare-datatypes ((SeekEntryResult!4362 0))(
  ( (MissingZero!4362 (index!19636 (_ BitVec 32))) (Found!4362 (index!19637 (_ BitVec 32))) (Intermediate!4362 (undefined!5174 Bool) (index!19638 (_ BitVec 32)) (x!48597 (_ BitVec 32))) (Undefined!4362) (MissingVacant!4362 (index!19639 (_ BitVec 32))) )
))
(declare-fun lt!236267 () SeekEntryResult!4362)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516107 (and (bvslt (x!48597 lt!236267) #b01111111111111111111111111111110) (or (= (select (arr!15895 a!3235) (index!19638 lt!236267)) (select (arr!15895 a!3235) j!176)) (= (select (arr!15895 a!3235) (index!19638 lt!236267)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15895 a!3235) (index!19638 lt!236267)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516108 () Bool)

(declare-fun e!301252 () Bool)

(assert (=> b!516108 (= e!301254 e!301252)))

(declare-fun res!315678 () Bool)

(assert (=> b!516108 (=> (not res!315678) (not e!301252))))

(declare-fun lt!236269 () SeekEntryResult!4362)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516108 (= res!315678 (or (= lt!236269 (MissingZero!4362 i!1204)) (= lt!236269 (MissingVacant!4362 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33054 (_ BitVec 32)) SeekEntryResult!4362)

(assert (=> b!516108 (= lt!236269 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516109 () Bool)

(declare-fun e!301253 () Bool)

(assert (=> b!516109 (= e!301253 (= (seekEntryOrOpen!0 (select (arr!15895 a!3235) j!176) a!3235 mask!3524) (Found!4362 j!176)))))

(declare-fun b!516110 () Bool)

(assert (=> b!516110 (= e!301252 (not e!301251))))

(declare-fun res!315670 () Bool)

(assert (=> b!516110 (=> res!315670 e!301251)))

(declare-fun lt!236266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33054 (_ BitVec 32)) SeekEntryResult!4362)

(assert (=> b!516110 (= res!315670 (= lt!236267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236266 (select (store (arr!15895 a!3235) i!1204 k0!2280) j!176) (array!33055 (store (arr!15895 a!3235) i!1204 k0!2280) (size!16259 a!3235)) mask!3524)))))

(declare-fun lt!236265 () (_ BitVec 32))

(assert (=> b!516110 (= lt!236267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236265 (select (arr!15895 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516110 (= lt!236266 (toIndex!0 (select (store (arr!15895 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516110 (= lt!236265 (toIndex!0 (select (arr!15895 a!3235) j!176) mask!3524))))

(assert (=> b!516110 e!301253))

(declare-fun res!315673 () Bool)

(assert (=> b!516110 (=> (not res!315673) (not e!301253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33054 (_ BitVec 32)) Bool)

(assert (=> b!516110 (= res!315673 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15982 0))(
  ( (Unit!15983) )
))
(declare-fun lt!236268 () Unit!15982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15982)

(assert (=> b!516110 (= lt!236268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516111 () Bool)

(declare-fun res!315677 () Bool)

(assert (=> b!516111 (=> (not res!315677) (not e!301252))))

(assert (=> b!516111 (= res!315677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!315674 () Bool)

(assert (=> start!46742 (=> (not res!315674) (not e!301254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46742 (= res!315674 (validMask!0 mask!3524))))

(assert (=> start!46742 e!301254))

(assert (=> start!46742 true))

(declare-fun array_inv!11691 (array!33054) Bool)

(assert (=> start!46742 (array_inv!11691 a!3235)))

(declare-fun b!516112 () Bool)

(declare-fun res!315671 () Bool)

(assert (=> b!516112 (=> (not res!315671) (not e!301254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516112 (= res!315671 (validKeyInArray!0 k0!2280))))

(declare-fun b!516113 () Bool)

(declare-fun res!315680 () Bool)

(assert (=> b!516113 (=> (not res!315680) (not e!301252))))

(declare-datatypes ((List!10053 0))(
  ( (Nil!10050) (Cons!10049 (h!10947 (_ BitVec 64)) (t!16281 List!10053)) )
))
(declare-fun arrayNoDuplicates!0 (array!33054 (_ BitVec 32) List!10053) Bool)

(assert (=> b!516113 (= res!315680 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10050))))

(declare-fun b!516114 () Bool)

(declare-fun res!315676 () Bool)

(assert (=> b!516114 (=> res!315676 e!301251)))

(get-info :version)

(assert (=> b!516114 (= res!315676 (or (undefined!5174 lt!236267) (not ((_ is Intermediate!4362) lt!236267))))))

(declare-fun b!516115 () Bool)

(declare-fun res!315672 () Bool)

(assert (=> b!516115 (=> (not res!315672) (not e!301254))))

(assert (=> b!516115 (= res!315672 (validKeyInArray!0 (select (arr!15895 a!3235) j!176)))))

(declare-fun b!516116 () Bool)

(declare-fun res!315679 () Bool)

(assert (=> b!516116 (=> (not res!315679) (not e!301254))))

(assert (=> b!516116 (= res!315679 (and (= (size!16259 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16259 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16259 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46742 res!315674) b!516116))

(assert (= (and b!516116 res!315679) b!516115))

(assert (= (and b!516115 res!315672) b!516112))

(assert (= (and b!516112 res!315671) b!516106))

(assert (= (and b!516106 res!315675) b!516108))

(assert (= (and b!516108 res!315678) b!516111))

(assert (= (and b!516111 res!315677) b!516113))

(assert (= (and b!516113 res!315680) b!516110))

(assert (= (and b!516110 res!315673) b!516109))

(assert (= (and b!516110 (not res!315670)) b!516114))

(assert (= (and b!516114 (not res!315676)) b!516107))

(declare-fun m!497543 () Bool)

(assert (=> b!516112 m!497543))

(declare-fun m!497545 () Bool)

(assert (=> b!516106 m!497545))

(declare-fun m!497547 () Bool)

(assert (=> b!516108 m!497547))

(declare-fun m!497549 () Bool)

(assert (=> b!516109 m!497549))

(assert (=> b!516109 m!497549))

(declare-fun m!497551 () Bool)

(assert (=> b!516109 m!497551))

(declare-fun m!497553 () Bool)

(assert (=> b!516113 m!497553))

(assert (=> b!516115 m!497549))

(assert (=> b!516115 m!497549))

(declare-fun m!497555 () Bool)

(assert (=> b!516115 m!497555))

(declare-fun m!497557 () Bool)

(assert (=> b!516111 m!497557))

(declare-fun m!497559 () Bool)

(assert (=> b!516110 m!497559))

(declare-fun m!497561 () Bool)

(assert (=> b!516110 m!497561))

(assert (=> b!516110 m!497549))

(declare-fun m!497563 () Bool)

(assert (=> b!516110 m!497563))

(assert (=> b!516110 m!497549))

(assert (=> b!516110 m!497561))

(declare-fun m!497565 () Bool)

(assert (=> b!516110 m!497565))

(assert (=> b!516110 m!497549))

(declare-fun m!497567 () Bool)

(assert (=> b!516110 m!497567))

(declare-fun m!497569 () Bool)

(assert (=> b!516110 m!497569))

(assert (=> b!516110 m!497561))

(declare-fun m!497571 () Bool)

(assert (=> b!516110 m!497571))

(declare-fun m!497573 () Bool)

(assert (=> b!516110 m!497573))

(declare-fun m!497575 () Bool)

(assert (=> b!516107 m!497575))

(assert (=> b!516107 m!497549))

(declare-fun m!497577 () Bool)

(assert (=> start!46742 m!497577))

(declare-fun m!497579 () Bool)

(assert (=> start!46742 m!497579))

(check-sat (not b!516112) (not b!516115) (not b!516109) (not b!516111) (not b!516110) (not b!516113) (not b!516106) (not b!516108) (not start!46742))
(check-sat)
