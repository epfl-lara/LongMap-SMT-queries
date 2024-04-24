; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45038 () Bool)

(assert start!45038)

(declare-fun b!494305 () Bool)

(declare-fun e!290117 () Bool)

(assert (=> b!494305 (= e!290117 true)))

(declare-datatypes ((SeekEntryResult!3799 0))(
  ( (MissingZero!3799 (index!17375 (_ BitVec 32))) (Found!3799 (index!17376 (_ BitVec 32))) (Intermediate!3799 (undefined!4611 Bool) (index!17377 (_ BitVec 32)) (x!46594 (_ BitVec 32))) (Undefined!3799) (MissingVacant!3799 (index!17378 (_ BitVec 32))) )
))
(declare-fun lt!223742 () SeekEntryResult!3799)

(assert (=> b!494305 (= lt!223742 Undefined!3799)))

(declare-fun b!494306 () Bool)

(declare-fun res!296931 () Bool)

(declare-fun e!290115 () Bool)

(assert (=> b!494306 (=> (not res!296931) (not e!290115))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494306 (= res!296931 (validKeyInArray!0 k0!2280))))

(declare-fun b!494307 () Bool)

(declare-fun res!296929 () Bool)

(assert (=> b!494307 (=> res!296929 e!290117)))

(declare-fun lt!223743 () SeekEntryResult!3799)

(get-info :version)

(assert (=> b!494307 (= res!296929 (or (not ((_ is Intermediate!3799) lt!223743)) (not (undefined!4611 lt!223743))))))

(declare-fun b!494308 () Bool)

(declare-fun e!290118 () Bool)

(assert (=> b!494308 (= e!290115 e!290118)))

(declare-fun res!296933 () Bool)

(assert (=> b!494308 (=> (not res!296933) (not e!290118))))

(declare-fun lt!223739 () SeekEntryResult!3799)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494308 (= res!296933 (or (= lt!223739 (MissingZero!3799 i!1204)) (= lt!223739 (MissingVacant!3799 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31984 0))(
  ( (array!31985 (arr!15376 (Array (_ BitVec 32) (_ BitVec 64))) (size!15740 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31984)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31984 (_ BitVec 32)) SeekEntryResult!3799)

(assert (=> b!494308 (= lt!223739 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494309 () Bool)

(assert (=> b!494309 (= e!290118 (not e!290117))))

(declare-fun res!296936 () Bool)

(assert (=> b!494309 (=> res!296936 e!290117)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223740 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31984 (_ BitVec 32)) SeekEntryResult!3799)

(assert (=> b!494309 (= res!296936 (= lt!223743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223740 (select (store (arr!15376 a!3235) i!1204 k0!2280) j!176) (array!31985 (store (arr!15376 a!3235) i!1204 k0!2280) (size!15740 a!3235)) mask!3524)))))

(declare-fun lt!223741 () (_ BitVec 32))

(assert (=> b!494309 (= lt!223743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223741 (select (arr!15376 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494309 (= lt!223740 (toIndex!0 (select (store (arr!15376 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494309 (= lt!223741 (toIndex!0 (select (arr!15376 a!3235) j!176) mask!3524))))

(assert (=> b!494309 (= lt!223742 (Found!3799 j!176))))

(assert (=> b!494309 (= lt!223742 (seekEntryOrOpen!0 (select (arr!15376 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31984 (_ BitVec 32)) Bool)

(assert (=> b!494309 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14605 0))(
  ( (Unit!14606) )
))
(declare-fun lt!223744 () Unit!14605)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14605)

(assert (=> b!494309 (= lt!223744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!296932 () Bool)

(assert (=> start!45038 (=> (not res!296932) (not e!290115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45038 (= res!296932 (validMask!0 mask!3524))))

(assert (=> start!45038 e!290115))

(assert (=> start!45038 true))

(declare-fun array_inv!11235 (array!31984) Bool)

(assert (=> start!45038 (array_inv!11235 a!3235)))

(declare-fun b!494310 () Bool)

(declare-fun res!296930 () Bool)

(assert (=> b!494310 (=> (not res!296930) (not e!290115))))

(declare-fun arrayContainsKey!0 (array!31984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494310 (= res!296930 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494311 () Bool)

(declare-fun res!296934 () Bool)

(assert (=> b!494311 (=> (not res!296934) (not e!290115))))

(assert (=> b!494311 (= res!296934 (and (= (size!15740 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15740 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15740 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494312 () Bool)

(declare-fun res!296935 () Bool)

(assert (=> b!494312 (=> (not res!296935) (not e!290118))))

(declare-datatypes ((List!9441 0))(
  ( (Nil!9438) (Cons!9437 (h!10305 (_ BitVec 64)) (t!15661 List!9441)) )
))
(declare-fun arrayNoDuplicates!0 (array!31984 (_ BitVec 32) List!9441) Bool)

(assert (=> b!494312 (= res!296935 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9438))))

(declare-fun b!494313 () Bool)

(declare-fun res!296937 () Bool)

(assert (=> b!494313 (=> (not res!296937) (not e!290118))))

(assert (=> b!494313 (= res!296937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494314 () Bool)

(declare-fun res!296938 () Bool)

(assert (=> b!494314 (=> (not res!296938) (not e!290115))))

(assert (=> b!494314 (= res!296938 (validKeyInArray!0 (select (arr!15376 a!3235) j!176)))))

(assert (= (and start!45038 res!296932) b!494311))

(assert (= (and b!494311 res!296934) b!494314))

(assert (= (and b!494314 res!296938) b!494306))

(assert (= (and b!494306 res!296931) b!494310))

(assert (= (and b!494310 res!296930) b!494308))

(assert (= (and b!494308 res!296933) b!494313))

(assert (= (and b!494313 res!296937) b!494312))

(assert (= (and b!494312 res!296935) b!494309))

(assert (= (and b!494309 (not res!296936)) b!494307))

(assert (= (and b!494307 (not res!296929)) b!494305))

(declare-fun m!475579 () Bool)

(assert (=> b!494313 m!475579))

(declare-fun m!475581 () Bool)

(assert (=> b!494309 m!475581))

(declare-fun m!475583 () Bool)

(assert (=> b!494309 m!475583))

(declare-fun m!475585 () Bool)

(assert (=> b!494309 m!475585))

(declare-fun m!475587 () Bool)

(assert (=> b!494309 m!475587))

(declare-fun m!475589 () Bool)

(assert (=> b!494309 m!475589))

(declare-fun m!475591 () Bool)

(assert (=> b!494309 m!475591))

(assert (=> b!494309 m!475589))

(declare-fun m!475593 () Bool)

(assert (=> b!494309 m!475593))

(assert (=> b!494309 m!475589))

(declare-fun m!475595 () Bool)

(assert (=> b!494309 m!475595))

(assert (=> b!494309 m!475585))

(declare-fun m!475597 () Bool)

(assert (=> b!494309 m!475597))

(assert (=> b!494309 m!475589))

(declare-fun m!475599 () Bool)

(assert (=> b!494309 m!475599))

(assert (=> b!494309 m!475585))

(assert (=> b!494314 m!475589))

(assert (=> b!494314 m!475589))

(declare-fun m!475601 () Bool)

(assert (=> b!494314 m!475601))

(declare-fun m!475603 () Bool)

(assert (=> b!494312 m!475603))

(declare-fun m!475605 () Bool)

(assert (=> b!494306 m!475605))

(declare-fun m!475607 () Bool)

(assert (=> start!45038 m!475607))

(declare-fun m!475609 () Bool)

(assert (=> start!45038 m!475609))

(declare-fun m!475611 () Bool)

(assert (=> b!494308 m!475611))

(declare-fun m!475613 () Bool)

(assert (=> b!494310 m!475613))

(check-sat (not b!494312) (not start!45038) (not b!494308) (not b!494314) (not b!494306) (not b!494310) (not b!494313) (not b!494309))
(check-sat)
