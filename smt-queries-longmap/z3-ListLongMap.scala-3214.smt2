; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45032 () Bool)

(assert start!45032)

(declare-fun b!494126 () Bool)

(declare-fun e!290058 () Bool)

(declare-fun e!290060 () Bool)

(assert (=> b!494126 (= e!290058 e!290060)))

(declare-fun res!296696 () Bool)

(assert (=> b!494126 (=> (not res!296696) (not e!290060))))

(declare-datatypes ((SeekEntryResult!3840 0))(
  ( (MissingZero!3840 (index!17539 (_ BitVec 32))) (Found!3840 (index!17540 (_ BitVec 32))) (Intermediate!3840 (undefined!4652 Bool) (index!17541 (_ BitVec 32)) (x!46614 (_ BitVec 32))) (Undefined!3840) (MissingVacant!3840 (index!17542 (_ BitVec 32))) )
))
(declare-fun lt!223587 () SeekEntryResult!3840)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494126 (= res!296696 (or (= lt!223587 (MissingZero!3840 i!1204)) (= lt!223587 (MissingVacant!3840 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((array!31977 0))(
  ( (array!31978 (arr!15373 (Array (_ BitVec 32) (_ BitVec 64))) (size!15737 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31977)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31977 (_ BitVec 32)) SeekEntryResult!3840)

(assert (=> b!494126 (= lt!223587 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494127 () Bool)

(declare-fun res!296698 () Bool)

(assert (=> b!494127 (=> (not res!296698) (not e!290060))))

(declare-datatypes ((List!9531 0))(
  ( (Nil!9528) (Cons!9527 (h!10395 (_ BitVec 64)) (t!15759 List!9531)) )
))
(declare-fun arrayNoDuplicates!0 (array!31977 (_ BitVec 32) List!9531) Bool)

(assert (=> b!494127 (= res!296698 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9528))))

(declare-fun b!494128 () Bool)

(declare-fun res!296699 () Bool)

(assert (=> b!494128 (=> (not res!296699) (not e!290060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31977 (_ BitVec 32)) Bool)

(assert (=> b!494128 (= res!296699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494129 () Bool)

(declare-fun res!296701 () Bool)

(assert (=> b!494129 (=> (not res!296701) (not e!290058))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494129 (= res!296701 (and (= (size!15737 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15737 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15737 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494130 () Bool)

(declare-fun res!296697 () Bool)

(assert (=> b!494130 (=> (not res!296697) (not e!290058))))

(declare-fun arrayContainsKey!0 (array!31977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494130 (= res!296697 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494131 () Bool)

(declare-fun e!290059 () Bool)

(assert (=> b!494131 (= e!290060 (not e!290059))))

(declare-fun res!296704 () Bool)

(assert (=> b!494131 (=> res!296704 e!290059)))

(declare-fun lt!223585 () (_ BitVec 32))

(declare-fun lt!223583 () SeekEntryResult!3840)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31977 (_ BitVec 32)) SeekEntryResult!3840)

(assert (=> b!494131 (= res!296704 (= lt!223583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223585 (select (store (arr!15373 a!3235) i!1204 k0!2280) j!176) (array!31978 (store (arr!15373 a!3235) i!1204 k0!2280) (size!15737 a!3235)) mask!3524)))))

(declare-fun lt!223588 () (_ BitVec 32))

(assert (=> b!494131 (= lt!223583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223588 (select (arr!15373 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494131 (= lt!223585 (toIndex!0 (select (store (arr!15373 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494131 (= lt!223588 (toIndex!0 (select (arr!15373 a!3235) j!176) mask!3524))))

(declare-fun lt!223584 () SeekEntryResult!3840)

(assert (=> b!494131 (= lt!223584 (Found!3840 j!176))))

(assert (=> b!494131 (= lt!223584 (seekEntryOrOpen!0 (select (arr!15373 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494131 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14626 0))(
  ( (Unit!14627) )
))
(declare-fun lt!223586 () Unit!14626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14626)

(assert (=> b!494131 (= lt!223586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494133 () Bool)

(declare-fun res!296703 () Bool)

(assert (=> b!494133 (=> res!296703 e!290059)))

(get-info :version)

(assert (=> b!494133 (= res!296703 (or (not ((_ is Intermediate!3840) lt!223583)) (not (undefined!4652 lt!223583))))))

(declare-fun b!494134 () Bool)

(assert (=> b!494134 (= e!290059 true)))

(assert (=> b!494134 (= lt!223584 Undefined!3840)))

(declare-fun b!494135 () Bool)

(declare-fun res!296700 () Bool)

(assert (=> b!494135 (=> (not res!296700) (not e!290058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494135 (= res!296700 (validKeyInArray!0 k0!2280))))

(declare-fun res!296702 () Bool)

(assert (=> start!45032 (=> (not res!296702) (not e!290058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45032 (= res!296702 (validMask!0 mask!3524))))

(assert (=> start!45032 e!290058))

(assert (=> start!45032 true))

(declare-fun array_inv!11169 (array!31977) Bool)

(assert (=> start!45032 (array_inv!11169 a!3235)))

(declare-fun b!494132 () Bool)

(declare-fun res!296705 () Bool)

(assert (=> b!494132 (=> (not res!296705) (not e!290058))))

(assert (=> b!494132 (= res!296705 (validKeyInArray!0 (select (arr!15373 a!3235) j!176)))))

(assert (= (and start!45032 res!296702) b!494129))

(assert (= (and b!494129 res!296701) b!494132))

(assert (= (and b!494132 res!296705) b!494135))

(assert (= (and b!494135 res!296700) b!494130))

(assert (= (and b!494130 res!296697) b!494126))

(assert (= (and b!494126 res!296696) b!494128))

(assert (= (and b!494128 res!296699) b!494127))

(assert (= (and b!494127 res!296698) b!494131))

(assert (= (and b!494131 (not res!296704)) b!494133))

(assert (= (and b!494133 (not res!296703)) b!494134))

(declare-fun m!475107 () Bool)

(assert (=> b!494135 m!475107))

(declare-fun m!475109 () Bool)

(assert (=> b!494126 m!475109))

(declare-fun m!475111 () Bool)

(assert (=> b!494128 m!475111))

(declare-fun m!475113 () Bool)

(assert (=> b!494127 m!475113))

(declare-fun m!475115 () Bool)

(assert (=> start!45032 m!475115))

(declare-fun m!475117 () Bool)

(assert (=> start!45032 m!475117))

(declare-fun m!475119 () Bool)

(assert (=> b!494132 m!475119))

(assert (=> b!494132 m!475119))

(declare-fun m!475121 () Bool)

(assert (=> b!494132 m!475121))

(declare-fun m!475123 () Bool)

(assert (=> b!494131 m!475123))

(declare-fun m!475125 () Bool)

(assert (=> b!494131 m!475125))

(assert (=> b!494131 m!475119))

(declare-fun m!475127 () Bool)

(assert (=> b!494131 m!475127))

(assert (=> b!494131 m!475119))

(assert (=> b!494131 m!475119))

(declare-fun m!475129 () Bool)

(assert (=> b!494131 m!475129))

(assert (=> b!494131 m!475125))

(declare-fun m!475131 () Bool)

(assert (=> b!494131 m!475131))

(declare-fun m!475133 () Bool)

(assert (=> b!494131 m!475133))

(assert (=> b!494131 m!475125))

(declare-fun m!475135 () Bool)

(assert (=> b!494131 m!475135))

(declare-fun m!475137 () Bool)

(assert (=> b!494131 m!475137))

(assert (=> b!494131 m!475119))

(declare-fun m!475139 () Bool)

(assert (=> b!494131 m!475139))

(declare-fun m!475141 () Bool)

(assert (=> b!494130 m!475141))

(check-sat (not b!494128) (not b!494127) (not b!494131) (not start!45032) (not b!494130) (not b!494135) (not b!494126) (not b!494132))
(check-sat)
