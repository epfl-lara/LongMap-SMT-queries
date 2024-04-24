; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45002 () Bool)

(assert start!45002)

(declare-fun res!296393 () Bool)

(declare-fun e!289899 () Bool)

(assert (=> start!45002 (=> (not res!296393) (not e!289899))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45002 (= res!296393 (validMask!0 mask!3524))))

(assert (=> start!45002 e!289899))

(assert (=> start!45002 true))

(declare-datatypes ((array!31948 0))(
  ( (array!31949 (arr!15358 (Array (_ BitVec 32) (_ BitVec 64))) (size!15722 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31948)

(declare-fun array_inv!11217 (array!31948) Bool)

(assert (=> start!45002 (array_inv!11217 a!3235)))

(declare-fun b!493765 () Bool)

(declare-fun res!296391 () Bool)

(declare-fun e!289902 () Bool)

(assert (=> b!493765 (=> (not res!296391) (not e!289902))))

(declare-datatypes ((List!9423 0))(
  ( (Nil!9420) (Cons!9419 (h!10287 (_ BitVec 64)) (t!15643 List!9423)) )
))
(declare-fun arrayNoDuplicates!0 (array!31948 (_ BitVec 32) List!9423) Bool)

(assert (=> b!493765 (= res!296391 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9420))))

(declare-fun b!493766 () Bool)

(assert (=> b!493766 (= e!289899 e!289902)))

(declare-fun res!296398 () Bool)

(assert (=> b!493766 (=> (not res!296398) (not e!289902))))

(declare-datatypes ((SeekEntryResult!3781 0))(
  ( (MissingZero!3781 (index!17303 (_ BitVec 32))) (Found!3781 (index!17304 (_ BitVec 32))) (Intermediate!3781 (undefined!4593 Bool) (index!17305 (_ BitVec 32)) (x!46528 (_ BitVec 32))) (Undefined!3781) (MissingVacant!3781 (index!17306 (_ BitVec 32))) )
))
(declare-fun lt!223418 () SeekEntryResult!3781)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493766 (= res!296398 (or (= lt!223418 (MissingZero!3781 i!1204)) (= lt!223418 (MissingVacant!3781 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31948 (_ BitVec 32)) SeekEntryResult!3781)

(assert (=> b!493766 (= lt!223418 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493767 () Bool)

(declare-fun res!296395 () Bool)

(assert (=> b!493767 (=> (not res!296395) (not e!289899))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493767 (= res!296395 (validKeyInArray!0 (select (arr!15358 a!3235) j!176)))))

(declare-fun b!493768 () Bool)

(declare-fun e!289901 () Bool)

(assert (=> b!493768 (= e!289901 true)))

(declare-fun lt!223419 () SeekEntryResult!3781)

(assert (=> b!493768 (= lt!223419 Undefined!3781)))

(declare-fun b!493769 () Bool)

(declare-fun res!296397 () Bool)

(assert (=> b!493769 (=> (not res!296397) (not e!289899))))

(assert (=> b!493769 (= res!296397 (and (= (size!15722 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15722 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15722 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493770 () Bool)

(declare-fun res!296392 () Bool)

(assert (=> b!493770 (=> (not res!296392) (not e!289899))))

(assert (=> b!493770 (= res!296392 (validKeyInArray!0 k0!2280))))

(declare-fun b!493771 () Bool)

(declare-fun res!296396 () Bool)

(assert (=> b!493771 (=> (not res!296396) (not e!289902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31948 (_ BitVec 32)) Bool)

(assert (=> b!493771 (= res!296396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493772 () Bool)

(declare-fun res!296394 () Bool)

(assert (=> b!493772 (=> (not res!296394) (not e!289899))))

(declare-fun arrayContainsKey!0 (array!31948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493772 (= res!296394 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493773 () Bool)

(declare-fun res!296390 () Bool)

(assert (=> b!493773 (=> res!296390 e!289901)))

(declare-fun lt!223416 () SeekEntryResult!3781)

(get-info :version)

(assert (=> b!493773 (= res!296390 (or (not ((_ is Intermediate!3781) lt!223416)) (not (undefined!4593 lt!223416))))))

(declare-fun b!493774 () Bool)

(assert (=> b!493774 (= e!289902 (not e!289901))))

(declare-fun res!296389 () Bool)

(assert (=> b!493774 (=> res!296389 e!289901)))

(declare-fun lt!223420 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31948 (_ BitVec 32)) SeekEntryResult!3781)

(assert (=> b!493774 (= res!296389 (= lt!223416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223420 (select (store (arr!15358 a!3235) i!1204 k0!2280) j!176) (array!31949 (store (arr!15358 a!3235) i!1204 k0!2280) (size!15722 a!3235)) mask!3524)))))

(declare-fun lt!223415 () (_ BitVec 32))

(assert (=> b!493774 (= lt!223416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223415 (select (arr!15358 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493774 (= lt!223420 (toIndex!0 (select (store (arr!15358 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493774 (= lt!223415 (toIndex!0 (select (arr!15358 a!3235) j!176) mask!3524))))

(assert (=> b!493774 (= lt!223419 (Found!3781 j!176))))

(assert (=> b!493774 (= lt!223419 (seekEntryOrOpen!0 (select (arr!15358 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493774 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14569 0))(
  ( (Unit!14570) )
))
(declare-fun lt!223417 () Unit!14569)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14569)

(assert (=> b!493774 (= lt!223417 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45002 res!296393) b!493769))

(assert (= (and b!493769 res!296397) b!493767))

(assert (= (and b!493767 res!296395) b!493770))

(assert (= (and b!493770 res!296392) b!493772))

(assert (= (and b!493772 res!296394) b!493766))

(assert (= (and b!493766 res!296398) b!493771))

(assert (= (and b!493771 res!296396) b!493765))

(assert (= (and b!493765 res!296391) b!493774))

(assert (= (and b!493774 (not res!296389)) b!493773))

(assert (= (and b!493773 (not res!296390)) b!493768))

(declare-fun m!474931 () Bool)

(assert (=> b!493765 m!474931))

(declare-fun m!474933 () Bool)

(assert (=> b!493774 m!474933))

(declare-fun m!474935 () Bool)

(assert (=> b!493774 m!474935))

(declare-fun m!474937 () Bool)

(assert (=> b!493774 m!474937))

(declare-fun m!474939 () Bool)

(assert (=> b!493774 m!474939))

(assert (=> b!493774 m!474935))

(declare-fun m!474941 () Bool)

(assert (=> b!493774 m!474941))

(declare-fun m!474943 () Bool)

(assert (=> b!493774 m!474943))

(assert (=> b!493774 m!474941))

(declare-fun m!474945 () Bool)

(assert (=> b!493774 m!474945))

(assert (=> b!493774 m!474941))

(declare-fun m!474947 () Bool)

(assert (=> b!493774 m!474947))

(assert (=> b!493774 m!474941))

(declare-fun m!474949 () Bool)

(assert (=> b!493774 m!474949))

(assert (=> b!493774 m!474935))

(declare-fun m!474951 () Bool)

(assert (=> b!493774 m!474951))

(declare-fun m!474953 () Bool)

(assert (=> b!493771 m!474953))

(declare-fun m!474955 () Bool)

(assert (=> b!493770 m!474955))

(assert (=> b!493767 m!474941))

(assert (=> b!493767 m!474941))

(declare-fun m!474957 () Bool)

(assert (=> b!493767 m!474957))

(declare-fun m!474959 () Bool)

(assert (=> b!493766 m!474959))

(declare-fun m!474961 () Bool)

(assert (=> start!45002 m!474961))

(declare-fun m!474963 () Bool)

(assert (=> start!45002 m!474963))

(declare-fun m!474965 () Bool)

(assert (=> b!493772 m!474965))

(check-sat (not b!493772) (not b!493771) (not b!493770) (not b!493765) (not b!493774) (not b!493767) (not start!45002) (not b!493766))
(check-sat)
