; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45038 () Bool)

(assert start!45038)

(declare-fun b!494216 () Bool)

(declare-fun e!290097 () Bool)

(declare-fun e!290094 () Bool)

(assert (=> b!494216 (= e!290097 (not e!290094))))

(declare-fun res!296786 () Bool)

(assert (=> b!494216 (=> res!296786 e!290094)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223639 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3843 0))(
  ( (MissingZero!3843 (index!17551 (_ BitVec 32))) (Found!3843 (index!17552 (_ BitVec 32))) (Intermediate!3843 (undefined!4655 Bool) (index!17553 (_ BitVec 32)) (x!46625 (_ BitVec 32))) (Undefined!3843) (MissingVacant!3843 (index!17554 (_ BitVec 32))) )
))
(declare-fun lt!223640 () SeekEntryResult!3843)

(declare-datatypes ((array!31983 0))(
  ( (array!31984 (arr!15376 (Array (_ BitVec 32) (_ BitVec 64))) (size!15740 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31983)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31983 (_ BitVec 32)) SeekEntryResult!3843)

(assert (=> b!494216 (= res!296786 (= lt!223640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223639 (select (store (arr!15376 a!3235) i!1204 k0!2280) j!176) (array!31984 (store (arr!15376 a!3235) i!1204 k0!2280) (size!15740 a!3235)) mask!3524)))))

(declare-fun lt!223642 () (_ BitVec 32))

(assert (=> b!494216 (= lt!223640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223642 (select (arr!15376 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494216 (= lt!223639 (toIndex!0 (select (store (arr!15376 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494216 (= lt!223642 (toIndex!0 (select (arr!15376 a!3235) j!176) mask!3524))))

(declare-fun lt!223637 () SeekEntryResult!3843)

(assert (=> b!494216 (= lt!223637 (Found!3843 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31983 (_ BitVec 32)) SeekEntryResult!3843)

(assert (=> b!494216 (= lt!223637 (seekEntryOrOpen!0 (select (arr!15376 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31983 (_ BitVec 32)) Bool)

(assert (=> b!494216 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14632 0))(
  ( (Unit!14633) )
))
(declare-fun lt!223638 () Unit!14632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14632)

(assert (=> b!494216 (= lt!223638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494218 () Bool)

(declare-fun res!296789 () Bool)

(declare-fun e!290095 () Bool)

(assert (=> b!494218 (=> (not res!296789) (not e!290095))))

(assert (=> b!494218 (= res!296789 (and (= (size!15740 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15740 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15740 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494219 () Bool)

(declare-fun res!296792 () Bool)

(assert (=> b!494219 (=> (not res!296792) (not e!290097))))

(assert (=> b!494219 (= res!296792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494220 () Bool)

(declare-fun res!296790 () Bool)

(assert (=> b!494220 (=> (not res!296790) (not e!290097))))

(declare-datatypes ((List!9534 0))(
  ( (Nil!9531) (Cons!9530 (h!10398 (_ BitVec 64)) (t!15762 List!9534)) )
))
(declare-fun arrayNoDuplicates!0 (array!31983 (_ BitVec 32) List!9534) Bool)

(assert (=> b!494220 (= res!296790 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9531))))

(declare-fun b!494221 () Bool)

(assert (=> b!494221 (= e!290095 e!290097)))

(declare-fun res!296795 () Bool)

(assert (=> b!494221 (=> (not res!296795) (not e!290097))))

(declare-fun lt!223641 () SeekEntryResult!3843)

(assert (=> b!494221 (= res!296795 (or (= lt!223641 (MissingZero!3843 i!1204)) (= lt!223641 (MissingVacant!3843 i!1204))))))

(assert (=> b!494221 (= lt!223641 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494222 () Bool)

(declare-fun res!296793 () Bool)

(assert (=> b!494222 (=> (not res!296793) (not e!290095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494222 (= res!296793 (validKeyInArray!0 (select (arr!15376 a!3235) j!176)))))

(declare-fun b!494223 () Bool)

(declare-fun res!296794 () Bool)

(assert (=> b!494223 (=> res!296794 e!290094)))

(get-info :version)

(assert (=> b!494223 (= res!296794 (or (not ((_ is Intermediate!3843) lt!223640)) (not (undefined!4655 lt!223640))))))

(declare-fun res!296791 () Bool)

(assert (=> start!45038 (=> (not res!296791) (not e!290095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45038 (= res!296791 (validMask!0 mask!3524))))

(assert (=> start!45038 e!290095))

(assert (=> start!45038 true))

(declare-fun array_inv!11172 (array!31983) Bool)

(assert (=> start!45038 (array_inv!11172 a!3235)))

(declare-fun b!494217 () Bool)

(declare-fun res!296787 () Bool)

(assert (=> b!494217 (=> (not res!296787) (not e!290095))))

(declare-fun arrayContainsKey!0 (array!31983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494217 (= res!296787 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494224 () Bool)

(declare-fun res!296788 () Bool)

(assert (=> b!494224 (=> (not res!296788) (not e!290095))))

(assert (=> b!494224 (= res!296788 (validKeyInArray!0 k0!2280))))

(declare-fun b!494225 () Bool)

(assert (=> b!494225 (= e!290094 true)))

(assert (=> b!494225 (= lt!223637 Undefined!3843)))

(assert (= (and start!45038 res!296791) b!494218))

(assert (= (and b!494218 res!296789) b!494222))

(assert (= (and b!494222 res!296793) b!494224))

(assert (= (and b!494224 res!296788) b!494217))

(assert (= (and b!494217 res!296787) b!494221))

(assert (= (and b!494221 res!296795) b!494219))

(assert (= (and b!494219 res!296792) b!494220))

(assert (= (and b!494220 res!296790) b!494216))

(assert (= (and b!494216 (not res!296786)) b!494223))

(assert (= (and b!494223 (not res!296794)) b!494225))

(declare-fun m!475215 () Bool)

(assert (=> b!494221 m!475215))

(declare-fun m!475217 () Bool)

(assert (=> start!45038 m!475217))

(declare-fun m!475219 () Bool)

(assert (=> start!45038 m!475219))

(declare-fun m!475221 () Bool)

(assert (=> b!494220 m!475221))

(declare-fun m!475223 () Bool)

(assert (=> b!494216 m!475223))

(declare-fun m!475225 () Bool)

(assert (=> b!494216 m!475225))

(declare-fun m!475227 () Bool)

(assert (=> b!494216 m!475227))

(declare-fun m!475229 () Bool)

(assert (=> b!494216 m!475229))

(declare-fun m!475231 () Bool)

(assert (=> b!494216 m!475231))

(assert (=> b!494216 m!475229))

(declare-fun m!475233 () Bool)

(assert (=> b!494216 m!475233))

(assert (=> b!494216 m!475229))

(declare-fun m!475235 () Bool)

(assert (=> b!494216 m!475235))

(assert (=> b!494216 m!475229))

(declare-fun m!475237 () Bool)

(assert (=> b!494216 m!475237))

(assert (=> b!494216 m!475227))

(declare-fun m!475239 () Bool)

(assert (=> b!494216 m!475239))

(assert (=> b!494216 m!475227))

(declare-fun m!475241 () Bool)

(assert (=> b!494216 m!475241))

(declare-fun m!475243 () Bool)

(assert (=> b!494217 m!475243))

(assert (=> b!494222 m!475229))

(assert (=> b!494222 m!475229))

(declare-fun m!475245 () Bool)

(assert (=> b!494222 m!475245))

(declare-fun m!475247 () Bool)

(assert (=> b!494224 m!475247))

(declare-fun m!475249 () Bool)

(assert (=> b!494219 m!475249))

(check-sat (not b!494217) (not b!494219) (not b!494220) (not start!45038) (not b!494224) (not b!494221) (not b!494216) (not b!494222))
(check-sat)
