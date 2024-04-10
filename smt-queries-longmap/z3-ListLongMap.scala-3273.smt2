; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45584 () Bool)

(assert start!45584)

(declare-fun b!501820 () Bool)

(declare-fun res!303316 () Bool)

(declare-fun e!293967 () Bool)

(assert (=> b!501820 (=> (not res!303316) (not e!293967))))

(declare-datatypes ((array!32340 0))(
  ( (array!32341 (arr!15550 (Array (_ BitVec 32) (_ BitVec 64))) (size!15914 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32340)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32340 (_ BitVec 32)) Bool)

(assert (=> b!501820 (= res!303316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501821 () Bool)

(declare-fun res!303320 () Bool)

(declare-fun e!293966 () Bool)

(assert (=> b!501821 (=> res!303320 e!293966)))

(declare-datatypes ((SeekEntryResult!4017 0))(
  ( (MissingZero!4017 (index!18256 (_ BitVec 32))) (Found!4017 (index!18257 (_ BitVec 32))) (Intermediate!4017 (undefined!4829 Bool) (index!18258 (_ BitVec 32)) (x!47290 (_ BitVec 32))) (Undefined!4017) (MissingVacant!4017 (index!18259 (_ BitVec 32))) )
))
(declare-fun lt!227982 () SeekEntryResult!4017)

(get-info :version)

(assert (=> b!501821 (= res!303320 (or (undefined!4829 lt!227982) (not ((_ is Intermediate!4017) lt!227982))))))

(declare-fun b!501822 () Bool)

(declare-fun res!303314 () Bool)

(declare-fun e!293970 () Bool)

(assert (=> b!501822 (=> (not res!303314) (not e!293970))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501822 (= res!303314 (validKeyInArray!0 k0!2280))))

(declare-fun b!501823 () Bool)

(assert (=> b!501823 (= e!293970 e!293967)))

(declare-fun res!303312 () Bool)

(assert (=> b!501823 (=> (not res!303312) (not e!293967))))

(declare-fun lt!227986 () SeekEntryResult!4017)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501823 (= res!303312 (or (= lt!227986 (MissingZero!4017 i!1204)) (= lt!227986 (MissingVacant!4017 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32340 (_ BitVec 32)) SeekEntryResult!4017)

(assert (=> b!501823 (= lt!227986 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501824 () Bool)

(declare-fun e!293973 () Bool)

(assert (=> b!501824 (= e!293973 false)))

(declare-fun b!501825 () Bool)

(declare-fun res!303318 () Bool)

(assert (=> b!501825 (=> (not res!303318) (not e!293970))))

(declare-fun arrayContainsKey!0 (array!32340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501825 (= res!303318 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501827 () Bool)

(declare-fun res!303323 () Bool)

(assert (=> b!501827 (=> (not res!303323) (not e!293967))))

(declare-datatypes ((List!9708 0))(
  ( (Nil!9705) (Cons!9704 (h!10581 (_ BitVec 64)) (t!15936 List!9708)) )
))
(declare-fun arrayNoDuplicates!0 (array!32340 (_ BitVec 32) List!9708) Bool)

(assert (=> b!501827 (= res!303323 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9705))))

(declare-fun b!501828 () Bool)

(assert (=> b!501828 (= e!293967 (not e!293966))))

(declare-fun res!303310 () Bool)

(assert (=> b!501828 (=> res!303310 e!293966)))

(declare-fun lt!227985 () array!32340)

(declare-fun lt!227976 () (_ BitVec 32))

(declare-fun lt!227977 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32340 (_ BitVec 32)) SeekEntryResult!4017)

(assert (=> b!501828 (= res!303310 (= lt!227982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227976 lt!227977 lt!227985 mask!3524)))))

(declare-fun lt!227984 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501828 (= lt!227982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227984 (select (arr!15550 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501828 (= lt!227976 (toIndex!0 lt!227977 mask!3524))))

(assert (=> b!501828 (= lt!227977 (select (store (arr!15550 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501828 (= lt!227984 (toIndex!0 (select (arr!15550 a!3235) j!176) mask!3524))))

(assert (=> b!501828 (= lt!227985 (array!32341 (store (arr!15550 a!3235) i!1204 k0!2280) (size!15914 a!3235)))))

(declare-fun e!293971 () Bool)

(assert (=> b!501828 e!293971))

(declare-fun res!303321 () Bool)

(assert (=> b!501828 (=> (not res!303321) (not e!293971))))

(assert (=> b!501828 (= res!303321 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15144 0))(
  ( (Unit!15145) )
))
(declare-fun lt!227981 () Unit!15144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15144)

(assert (=> b!501828 (= lt!227981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501829 () Bool)

(declare-fun e!293968 () Unit!15144)

(declare-fun Unit!15146 () Unit!15144)

(assert (=> b!501829 (= e!293968 Unit!15146)))

(declare-fun lt!227978 () Unit!15144)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32340 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15144)

(assert (=> b!501829 (= lt!227978 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227984 #b00000000000000000000000000000000 (index!18258 lt!227982) (x!47290 lt!227982) mask!3524))))

(declare-fun res!303313 () Bool)

(assert (=> b!501829 (= res!303313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227984 lt!227977 lt!227985 mask!3524) (Intermediate!4017 false (index!18258 lt!227982) (x!47290 lt!227982))))))

(assert (=> b!501829 (=> (not res!303313) (not e!293973))))

(assert (=> b!501829 e!293973))

(declare-fun b!501830 () Bool)

(assert (=> b!501830 (= e!293971 (= (seekEntryOrOpen!0 (select (arr!15550 a!3235) j!176) a!3235 mask!3524) (Found!4017 j!176)))))

(declare-fun b!501831 () Bool)

(declare-fun res!303311 () Bool)

(assert (=> b!501831 (=> (not res!303311) (not e!293970))))

(assert (=> b!501831 (= res!303311 (and (= (size!15914 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15914 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15914 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501832 () Bool)

(declare-fun e!293972 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32340 (_ BitVec 32)) SeekEntryResult!4017)

(assert (=> b!501832 (= e!293972 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227984 (index!18258 lt!227982) (select (arr!15550 a!3235) j!176) a!3235 mask!3524) (Found!4017 j!176))))))

(declare-fun b!501833 () Bool)

(declare-fun res!303322 () Bool)

(declare-fun e!293969 () Bool)

(assert (=> b!501833 (=> res!303322 e!293969)))

(assert (=> b!501833 (= res!303322 e!293972)))

(declare-fun res!303309 () Bool)

(assert (=> b!501833 (=> (not res!303309) (not e!293972))))

(assert (=> b!501833 (= res!303309 (bvsgt #b00000000000000000000000000000000 (x!47290 lt!227982)))))

(declare-fun b!501834 () Bool)

(assert (=> b!501834 (= e!293966 e!293969)))

(declare-fun res!303315 () Bool)

(assert (=> b!501834 (=> res!303315 e!293969)))

(assert (=> b!501834 (= res!303315 (or (bvsgt (x!47290 lt!227982) #b01111111111111111111111111111110) (bvslt lt!227984 #b00000000000000000000000000000000) (bvsge lt!227984 (size!15914 a!3235)) (bvslt (index!18258 lt!227982) #b00000000000000000000000000000000) (bvsge (index!18258 lt!227982) (size!15914 a!3235)) (not (= lt!227982 (Intermediate!4017 false (index!18258 lt!227982) (x!47290 lt!227982))))))))

(assert (=> b!501834 (= (index!18258 lt!227982) i!1204)))

(declare-fun lt!227979 () Unit!15144)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32340 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15144)

(assert (=> b!501834 (= lt!227979 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227984 #b00000000000000000000000000000000 (index!18258 lt!227982) (x!47290 lt!227982) mask!3524))))

(assert (=> b!501834 (and (or (= (select (arr!15550 a!3235) (index!18258 lt!227982)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15550 a!3235) (index!18258 lt!227982)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15550 a!3235) (index!18258 lt!227982)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15550 a!3235) (index!18258 lt!227982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227980 () Unit!15144)

(assert (=> b!501834 (= lt!227980 e!293968)))

(declare-fun c!59534 () Bool)

(assert (=> b!501834 (= c!59534 (= (select (arr!15550 a!3235) (index!18258 lt!227982)) (select (arr!15550 a!3235) j!176)))))

(assert (=> b!501834 (and (bvslt (x!47290 lt!227982) #b01111111111111111111111111111110) (or (= (select (arr!15550 a!3235) (index!18258 lt!227982)) (select (arr!15550 a!3235) j!176)) (= (select (arr!15550 a!3235) (index!18258 lt!227982)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15550 a!3235) (index!18258 lt!227982)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!303319 () Bool)

(assert (=> start!45584 (=> (not res!303319) (not e!293970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45584 (= res!303319 (validMask!0 mask!3524))))

(assert (=> start!45584 e!293970))

(assert (=> start!45584 true))

(declare-fun array_inv!11346 (array!32340) Bool)

(assert (=> start!45584 (array_inv!11346 a!3235)))

(declare-fun b!501826 () Bool)

(assert (=> b!501826 (= e!293969 true)))

(declare-fun lt!227983 () SeekEntryResult!4017)

(assert (=> b!501826 (= lt!227983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227984 lt!227977 lt!227985 mask!3524))))

(declare-fun b!501835 () Bool)

(declare-fun res!303317 () Bool)

(assert (=> b!501835 (=> (not res!303317) (not e!293970))))

(assert (=> b!501835 (= res!303317 (validKeyInArray!0 (select (arr!15550 a!3235) j!176)))))

(declare-fun b!501836 () Bool)

(declare-fun Unit!15147 () Unit!15144)

(assert (=> b!501836 (= e!293968 Unit!15147)))

(assert (= (and start!45584 res!303319) b!501831))

(assert (= (and b!501831 res!303311) b!501835))

(assert (= (and b!501835 res!303317) b!501822))

(assert (= (and b!501822 res!303314) b!501825))

(assert (= (and b!501825 res!303318) b!501823))

(assert (= (and b!501823 res!303312) b!501820))

(assert (= (and b!501820 res!303316) b!501827))

(assert (= (and b!501827 res!303323) b!501828))

(assert (= (and b!501828 res!303321) b!501830))

(assert (= (and b!501828 (not res!303310)) b!501821))

(assert (= (and b!501821 (not res!303320)) b!501834))

(assert (= (and b!501834 c!59534) b!501829))

(assert (= (and b!501834 (not c!59534)) b!501836))

(assert (= (and b!501829 res!303313) b!501824))

(assert (= (and b!501834 (not res!303315)) b!501833))

(assert (= (and b!501833 res!303309) b!501832))

(assert (= (and b!501833 (not res!303322)) b!501826))

(declare-fun m!482815 () Bool)

(assert (=> b!501827 m!482815))

(declare-fun m!482817 () Bool)

(assert (=> b!501830 m!482817))

(assert (=> b!501830 m!482817))

(declare-fun m!482819 () Bool)

(assert (=> b!501830 m!482819))

(declare-fun m!482821 () Bool)

(assert (=> b!501822 m!482821))

(assert (=> b!501835 m!482817))

(assert (=> b!501835 m!482817))

(declare-fun m!482823 () Bool)

(assert (=> b!501835 m!482823))

(declare-fun m!482825 () Bool)

(assert (=> b!501834 m!482825))

(declare-fun m!482827 () Bool)

(assert (=> b!501834 m!482827))

(assert (=> b!501834 m!482817))

(declare-fun m!482829 () Bool)

(assert (=> b!501823 m!482829))

(declare-fun m!482831 () Bool)

(assert (=> b!501826 m!482831))

(declare-fun m!482833 () Bool)

(assert (=> start!45584 m!482833))

(declare-fun m!482835 () Bool)

(assert (=> start!45584 m!482835))

(declare-fun m!482837 () Bool)

(assert (=> b!501829 m!482837))

(assert (=> b!501829 m!482831))

(assert (=> b!501832 m!482817))

(assert (=> b!501832 m!482817))

(declare-fun m!482839 () Bool)

(assert (=> b!501832 m!482839))

(declare-fun m!482841 () Bool)

(assert (=> b!501825 m!482841))

(declare-fun m!482843 () Bool)

(assert (=> b!501828 m!482843))

(declare-fun m!482845 () Bool)

(assert (=> b!501828 m!482845))

(declare-fun m!482847 () Bool)

(assert (=> b!501828 m!482847))

(assert (=> b!501828 m!482817))

(declare-fun m!482849 () Bool)

(assert (=> b!501828 m!482849))

(declare-fun m!482851 () Bool)

(assert (=> b!501828 m!482851))

(assert (=> b!501828 m!482817))

(declare-fun m!482853 () Bool)

(assert (=> b!501828 m!482853))

(declare-fun m!482855 () Bool)

(assert (=> b!501828 m!482855))

(declare-fun m!482857 () Bool)

(assert (=> b!501828 m!482857))

(assert (=> b!501828 m!482817))

(declare-fun m!482859 () Bool)

(assert (=> b!501820 m!482859))

(check-sat (not b!501826) (not b!501835) (not b!501820) (not b!501834) (not b!501830) (not b!501822) (not b!501823) (not b!501825) (not b!501828) (not b!501827) (not start!45584) (not b!501829) (not b!501832))
(check-sat)
