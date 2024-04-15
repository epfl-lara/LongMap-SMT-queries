; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52376 () Bool)

(assert start!52376)

(declare-fun b!571258 () Bool)

(declare-fun res!360919 () Bool)

(declare-fun e!328547 () Bool)

(assert (=> b!571258 (=> (not res!360919) (not e!328547))))

(declare-datatypes ((array!35782 0))(
  ( (array!35783 (arr!17180 (Array (_ BitVec 32) (_ BitVec 64))) (size!17545 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35782)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571258 (= res!360919 (validKeyInArray!0 (select (arr!17180 a!3118) j!142)))))

(declare-fun b!571259 () Bool)

(declare-fun e!328543 () Bool)

(declare-fun e!328544 () Bool)

(assert (=> b!571259 (= e!328543 e!328544)))

(declare-fun res!360914 () Bool)

(assert (=> b!571259 (=> res!360914 e!328544)))

(declare-datatypes ((SeekEntryResult!5626 0))(
  ( (MissingZero!5626 (index!24731 (_ BitVec 32))) (Found!5626 (index!24732 (_ BitVec 32))) (Intermediate!5626 (undefined!6438 Bool) (index!24733 (_ BitVec 32)) (x!53618 (_ BitVec 32))) (Undefined!5626) (MissingVacant!5626 (index!24734 (_ BitVec 32))) )
))
(declare-fun lt!260377 () SeekEntryResult!5626)

(get-info :version)

(assert (=> b!571259 (= res!360914 (or (undefined!6438 lt!260377) (not ((_ is Intermediate!5626) lt!260377))))))

(declare-fun b!571260 () Bool)

(declare-fun res!360917 () Bool)

(assert (=> b!571260 (=> (not res!360917) (not e!328547))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571260 (= res!360917 (and (= (size!17545 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17545 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17545 a!3118)) (not (= i!1132 j!142))))))

(declare-fun lt!260376 () array!35782)

(declare-fun b!571261 () Bool)

(declare-fun lt!260379 () (_ BitVec 64))

(declare-fun e!328546 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35782 (_ BitVec 32)) SeekEntryResult!5626)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35782 (_ BitVec 32)) SeekEntryResult!5626)

(assert (=> b!571261 (= e!328546 (= (seekEntryOrOpen!0 lt!260379 lt!260376 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53618 lt!260377) (index!24733 lt!260377) (index!24733 lt!260377) lt!260379 lt!260376 mask!3119)))))

(declare-fun b!571262 () Bool)

(declare-fun res!360920 () Bool)

(declare-fun e!328542 () Bool)

(assert (=> b!571262 (=> (not res!360920) (not e!328542))))

(declare-datatypes ((List!11299 0))(
  ( (Nil!11296) (Cons!11295 (h!12322 (_ BitVec 64)) (t!17518 List!11299)) )
))
(declare-fun arrayNoDuplicates!0 (array!35782 (_ BitVec 32) List!11299) Bool)

(assert (=> b!571262 (= res!360920 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11296))))

(declare-fun res!360912 () Bool)

(assert (=> start!52376 (=> (not res!360912) (not e!328547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52376 (= res!360912 (validMask!0 mask!3119))))

(assert (=> start!52376 e!328547))

(assert (=> start!52376 true))

(declare-fun array_inv!13063 (array!35782) Bool)

(assert (=> start!52376 (array_inv!13063 a!3118)))

(declare-fun b!571263 () Bool)

(declare-fun e!328548 () Bool)

(assert (=> b!571263 (= e!328542 e!328548)))

(declare-fun res!360918 () Bool)

(assert (=> b!571263 (=> (not res!360918) (not e!328548))))

(declare-fun lt!260372 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35782 (_ BitVec 32)) SeekEntryResult!5626)

(assert (=> b!571263 (= res!360918 (= lt!260377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260372 lt!260379 lt!260376 mask!3119)))))

(declare-fun lt!260374 () (_ BitVec 32))

(assert (=> b!571263 (= lt!260377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260374 (select (arr!17180 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571263 (= lt!260372 (toIndex!0 lt!260379 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!571263 (= lt!260379 (select (store (arr!17180 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571263 (= lt!260374 (toIndex!0 (select (arr!17180 a!3118) j!142) mask!3119))))

(assert (=> b!571263 (= lt!260376 (array!35783 (store (arr!17180 a!3118) i!1132 k0!1914) (size!17545 a!3118)))))

(declare-fun b!571264 () Bool)

(declare-fun e!328545 () Bool)

(assert (=> b!571264 (= e!328545 e!328546)))

(declare-fun res!360916 () Bool)

(assert (=> b!571264 (=> (not res!360916) (not e!328546))))

(declare-fun lt!260378 () SeekEntryResult!5626)

(assert (=> b!571264 (= res!360916 (= lt!260378 (seekKeyOrZeroReturnVacant!0 (x!53618 lt!260377) (index!24733 lt!260377) (index!24733 lt!260377) (select (arr!17180 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571265 () Bool)

(declare-fun res!360913 () Bool)

(assert (=> b!571265 (=> (not res!360913) (not e!328542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35782 (_ BitVec 32)) Bool)

(assert (=> b!571265 (= res!360913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571266 () Bool)

(assert (=> b!571266 (= e!328548 (not true))))

(assert (=> b!571266 e!328543))

(declare-fun res!360910 () Bool)

(assert (=> b!571266 (=> (not res!360910) (not e!328543))))

(assert (=> b!571266 (= res!360910 (= lt!260378 (Found!5626 j!142)))))

(assert (=> b!571266 (= lt!260378 (seekEntryOrOpen!0 (select (arr!17180 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571266 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17940 0))(
  ( (Unit!17941) )
))
(declare-fun lt!260373 () Unit!17940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17940)

(assert (=> b!571266 (= lt!260373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571267 () Bool)

(declare-fun res!360911 () Bool)

(assert (=> b!571267 (=> (not res!360911) (not e!328547))))

(assert (=> b!571267 (= res!360911 (validKeyInArray!0 k0!1914))))

(declare-fun b!571268 () Bool)

(assert (=> b!571268 (= e!328544 e!328545)))

(declare-fun res!360908 () Bool)

(assert (=> b!571268 (=> res!360908 e!328545)))

(declare-fun lt!260375 () (_ BitVec 64))

(assert (=> b!571268 (= res!360908 (or (= lt!260375 (select (arr!17180 a!3118) j!142)) (= lt!260375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571268 (= lt!260375 (select (arr!17180 a!3118) (index!24733 lt!260377)))))

(declare-fun b!571269 () Bool)

(declare-fun res!360909 () Bool)

(assert (=> b!571269 (=> (not res!360909) (not e!328547))))

(declare-fun arrayContainsKey!0 (array!35782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571269 (= res!360909 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571270 () Bool)

(assert (=> b!571270 (= e!328547 e!328542)))

(declare-fun res!360915 () Bool)

(assert (=> b!571270 (=> (not res!360915) (not e!328542))))

(declare-fun lt!260380 () SeekEntryResult!5626)

(assert (=> b!571270 (= res!360915 (or (= lt!260380 (MissingZero!5626 i!1132)) (= lt!260380 (MissingVacant!5626 i!1132))))))

(assert (=> b!571270 (= lt!260380 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52376 res!360912) b!571260))

(assert (= (and b!571260 res!360917) b!571258))

(assert (= (and b!571258 res!360919) b!571267))

(assert (= (and b!571267 res!360911) b!571269))

(assert (= (and b!571269 res!360909) b!571270))

(assert (= (and b!571270 res!360915) b!571265))

(assert (= (and b!571265 res!360913) b!571262))

(assert (= (and b!571262 res!360920) b!571263))

(assert (= (and b!571263 res!360918) b!571266))

(assert (= (and b!571266 res!360910) b!571259))

(assert (= (and b!571259 (not res!360914)) b!571268))

(assert (= (and b!571268 (not res!360908)) b!571264))

(assert (= (and b!571264 res!360916) b!571261))

(declare-fun m!549617 () Bool)

(assert (=> b!571263 m!549617))

(declare-fun m!549619 () Bool)

(assert (=> b!571263 m!549619))

(declare-fun m!549621 () Bool)

(assert (=> b!571263 m!549621))

(assert (=> b!571263 m!549617))

(declare-fun m!549623 () Bool)

(assert (=> b!571263 m!549623))

(declare-fun m!549625 () Bool)

(assert (=> b!571263 m!549625))

(declare-fun m!549627 () Bool)

(assert (=> b!571263 m!549627))

(assert (=> b!571263 m!549617))

(declare-fun m!549629 () Bool)

(assert (=> b!571263 m!549629))

(assert (=> b!571268 m!549617))

(declare-fun m!549631 () Bool)

(assert (=> b!571268 m!549631))

(assert (=> b!571264 m!549617))

(assert (=> b!571264 m!549617))

(declare-fun m!549633 () Bool)

(assert (=> b!571264 m!549633))

(declare-fun m!549635 () Bool)

(assert (=> b!571270 m!549635))

(declare-fun m!549637 () Bool)

(assert (=> b!571265 m!549637))

(declare-fun m!549639 () Bool)

(assert (=> b!571269 m!549639))

(declare-fun m!549641 () Bool)

(assert (=> start!52376 m!549641))

(declare-fun m!549643 () Bool)

(assert (=> start!52376 m!549643))

(assert (=> b!571266 m!549617))

(assert (=> b!571266 m!549617))

(declare-fun m!549645 () Bool)

(assert (=> b!571266 m!549645))

(declare-fun m!549647 () Bool)

(assert (=> b!571266 m!549647))

(declare-fun m!549649 () Bool)

(assert (=> b!571266 m!549649))

(declare-fun m!549651 () Bool)

(assert (=> b!571267 m!549651))

(assert (=> b!571258 m!549617))

(assert (=> b!571258 m!549617))

(declare-fun m!549653 () Bool)

(assert (=> b!571258 m!549653))

(declare-fun m!549655 () Bool)

(assert (=> b!571261 m!549655))

(declare-fun m!549657 () Bool)

(assert (=> b!571261 m!549657))

(declare-fun m!549659 () Bool)

(assert (=> b!571262 m!549659))

(check-sat (not b!571267) (not b!571258) (not start!52376) (not b!571269) (not b!571265) (not b!571266) (not b!571263) (not b!571261) (not b!571270) (not b!571264) (not b!571262))
(check-sat)
