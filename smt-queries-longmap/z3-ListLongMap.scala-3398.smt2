; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46982 () Bool)

(assert start!46982)

(declare-fun res!316993 () Bool)

(declare-fun e!302259 () Bool)

(assert (=> start!46982 (=> (not res!316993) (not e!302259))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46982 (= res!316993 (validMask!0 mask!3524))))

(assert (=> start!46982 e!302259))

(assert (=> start!46982 true))

(declare-datatypes ((array!33123 0))(
  ( (array!33124 (arr!15925 (Array (_ BitVec 32) (_ BitVec 64))) (size!16289 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33123)

(declare-fun array_inv!11721 (array!33123) Bool)

(assert (=> start!46982 (array_inv!11721 a!3235)))

(declare-fun b!517969 () Bool)

(declare-fun res!316986 () Bool)

(declare-fun e!302261 () Bool)

(assert (=> b!517969 (=> res!316986 e!302261)))

(declare-datatypes ((SeekEntryResult!4392 0))(
  ( (MissingZero!4392 (index!19756 (_ BitVec 32))) (Found!4392 (index!19757 (_ BitVec 32))) (Intermediate!4392 (undefined!5204 Bool) (index!19758 (_ BitVec 32)) (x!48725 (_ BitVec 32))) (Undefined!4392) (MissingVacant!4392 (index!19759 (_ BitVec 32))) )
))
(declare-fun lt!237102 () SeekEntryResult!4392)

(get-info :version)

(assert (=> b!517969 (= res!316986 (or (undefined!5204 lt!237102) (not ((_ is Intermediate!4392) lt!237102))))))

(declare-fun b!517970 () Bool)

(assert (=> b!517970 (= e!302261 true)))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517970 (and (bvslt (x!48725 lt!237102) #b01111111111111111111111111111110) (or (= (select (arr!15925 a!3235) (index!19758 lt!237102)) (select (arr!15925 a!3235) j!176)) (= (select (arr!15925 a!3235) (index!19758 lt!237102)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15925 a!3235) (index!19758 lt!237102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517971 () Bool)

(declare-fun e!302260 () Bool)

(assert (=> b!517971 (= e!302260 (not e!302261))))

(declare-fun res!316987 () Bool)

(assert (=> b!517971 (=> res!316987 e!302261)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!237106 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33123 (_ BitVec 32)) SeekEntryResult!4392)

(assert (=> b!517971 (= res!316987 (= lt!237102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237106 (select (store (arr!15925 a!3235) i!1204 k0!2280) j!176) (array!33124 (store (arr!15925 a!3235) i!1204 k0!2280) (size!16289 a!3235)) mask!3524)))))

(declare-fun lt!237103 () (_ BitVec 32))

(assert (=> b!517971 (= lt!237102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237103 (select (arr!15925 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517971 (= lt!237106 (toIndex!0 (select (store (arr!15925 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517971 (= lt!237103 (toIndex!0 (select (arr!15925 a!3235) j!176) mask!3524))))

(declare-fun e!302262 () Bool)

(assert (=> b!517971 e!302262))

(declare-fun res!316994 () Bool)

(assert (=> b!517971 (=> (not res!316994) (not e!302262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33123 (_ BitVec 32)) Bool)

(assert (=> b!517971 (= res!316994 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16042 0))(
  ( (Unit!16043) )
))
(declare-fun lt!237104 () Unit!16042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16042)

(assert (=> b!517971 (= lt!237104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517972 () Bool)

(declare-fun res!316985 () Bool)

(assert (=> b!517972 (=> (not res!316985) (not e!302260))))

(assert (=> b!517972 (= res!316985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517973 () Bool)

(declare-fun res!316991 () Bool)

(assert (=> b!517973 (=> (not res!316991) (not e!302259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517973 (= res!316991 (validKeyInArray!0 k0!2280))))

(declare-fun b!517974 () Bool)

(declare-fun res!316988 () Bool)

(assert (=> b!517974 (=> (not res!316988) (not e!302260))))

(declare-datatypes ((List!10083 0))(
  ( (Nil!10080) (Cons!10079 (h!10986 (_ BitVec 64)) (t!16311 List!10083)) )
))
(declare-fun arrayNoDuplicates!0 (array!33123 (_ BitVec 32) List!10083) Bool)

(assert (=> b!517974 (= res!316988 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10080))))

(declare-fun b!517975 () Bool)

(declare-fun res!316984 () Bool)

(assert (=> b!517975 (=> (not res!316984) (not e!302259))))

(assert (=> b!517975 (= res!316984 (validKeyInArray!0 (select (arr!15925 a!3235) j!176)))))

(declare-fun b!517976 () Bool)

(declare-fun res!316989 () Bool)

(assert (=> b!517976 (=> (not res!316989) (not e!302259))))

(assert (=> b!517976 (= res!316989 (and (= (size!16289 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16289 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16289 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517977 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33123 (_ BitVec 32)) SeekEntryResult!4392)

(assert (=> b!517977 (= e!302262 (= (seekEntryOrOpen!0 (select (arr!15925 a!3235) j!176) a!3235 mask!3524) (Found!4392 j!176)))))

(declare-fun b!517978 () Bool)

(assert (=> b!517978 (= e!302259 e!302260)))

(declare-fun res!316992 () Bool)

(assert (=> b!517978 (=> (not res!316992) (not e!302260))))

(declare-fun lt!237105 () SeekEntryResult!4392)

(assert (=> b!517978 (= res!316992 (or (= lt!237105 (MissingZero!4392 i!1204)) (= lt!237105 (MissingVacant!4392 i!1204))))))

(assert (=> b!517978 (= lt!237105 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517979 () Bool)

(declare-fun res!316990 () Bool)

(assert (=> b!517979 (=> (not res!316990) (not e!302259))))

(declare-fun arrayContainsKey!0 (array!33123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517979 (= res!316990 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46982 res!316993) b!517976))

(assert (= (and b!517976 res!316989) b!517975))

(assert (= (and b!517975 res!316984) b!517973))

(assert (= (and b!517973 res!316991) b!517979))

(assert (= (and b!517979 res!316990) b!517978))

(assert (= (and b!517978 res!316992) b!517972))

(assert (= (and b!517972 res!316985) b!517974))

(assert (= (and b!517974 res!316988) b!517971))

(assert (= (and b!517971 res!316994) b!517977))

(assert (= (and b!517971 (not res!316987)) b!517969))

(assert (= (and b!517969 (not res!316986)) b!517970))

(declare-fun m!499295 () Bool)

(assert (=> start!46982 m!499295))

(declare-fun m!499297 () Bool)

(assert (=> start!46982 m!499297))

(declare-fun m!499299 () Bool)

(assert (=> b!517970 m!499299))

(declare-fun m!499301 () Bool)

(assert (=> b!517970 m!499301))

(declare-fun m!499303 () Bool)

(assert (=> b!517974 m!499303))

(assert (=> b!517975 m!499301))

(assert (=> b!517975 m!499301))

(declare-fun m!499305 () Bool)

(assert (=> b!517975 m!499305))

(declare-fun m!499307 () Bool)

(assert (=> b!517979 m!499307))

(declare-fun m!499309 () Bool)

(assert (=> b!517972 m!499309))

(assert (=> b!517977 m!499301))

(assert (=> b!517977 m!499301))

(declare-fun m!499311 () Bool)

(assert (=> b!517977 m!499311))

(declare-fun m!499313 () Bool)

(assert (=> b!517978 m!499313))

(declare-fun m!499315 () Bool)

(assert (=> b!517971 m!499315))

(declare-fun m!499317 () Bool)

(assert (=> b!517971 m!499317))

(declare-fun m!499319 () Bool)

(assert (=> b!517971 m!499319))

(declare-fun m!499321 () Bool)

(assert (=> b!517971 m!499321))

(assert (=> b!517971 m!499315))

(assert (=> b!517971 m!499301))

(declare-fun m!499323 () Bool)

(assert (=> b!517971 m!499323))

(assert (=> b!517971 m!499301))

(assert (=> b!517971 m!499301))

(declare-fun m!499325 () Bool)

(assert (=> b!517971 m!499325))

(declare-fun m!499327 () Bool)

(assert (=> b!517971 m!499327))

(assert (=> b!517971 m!499315))

(declare-fun m!499329 () Bool)

(assert (=> b!517971 m!499329))

(declare-fun m!499331 () Bool)

(assert (=> b!517973 m!499331))

(check-sat (not b!517978) (not b!517974) (not b!517973) (not b!517979) (not start!46982) (not b!517971) (not b!517977) (not b!517975) (not b!517972))
(check-sat)
