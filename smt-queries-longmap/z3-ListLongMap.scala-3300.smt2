; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45746 () Bool)

(assert start!45746)

(declare-datatypes ((SeekEntryResult!4098 0))(
  ( (MissingZero!4098 (index!18580 (_ BitVec 32))) (Found!4098 (index!18581 (_ BitVec 32))) (Intermediate!4098 (undefined!4910 Bool) (index!18582 (_ BitVec 32)) (x!47587 (_ BitVec 32))) (Undefined!4098) (MissingVacant!4098 (index!18583 (_ BitVec 32))) )
))
(declare-fun lt!230761 () SeekEntryResult!4098)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32502 0))(
  ( (array!32503 (arr!15631 (Array (_ BitVec 32) (_ BitVec 64))) (size!15995 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32502)

(declare-fun lt!230758 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!296159 () Bool)

(declare-fun lt!230757 () SeekEntryResult!4098)

(declare-fun b!505951 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32502 (_ BitVec 32)) SeekEntryResult!4098)

(assert (=> b!505951 (= e!296159 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230758 (index!18582 lt!230757) (select (arr!15631 a!3235) j!176) a!3235 mask!3524) lt!230761)))))

(declare-fun res!306964 () Bool)

(declare-fun e!296155 () Bool)

(assert (=> start!45746 (=> (not res!306964) (not e!296155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45746 (= res!306964 (validMask!0 mask!3524))))

(assert (=> start!45746 e!296155))

(assert (=> start!45746 true))

(declare-fun array_inv!11427 (array!32502) Bool)

(assert (=> start!45746 (array_inv!11427 a!3235)))

(declare-fun b!505952 () Bool)

(declare-fun res!306963 () Bool)

(assert (=> b!505952 (=> (not res!306963) (not e!296155))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505952 (= res!306963 (validKeyInArray!0 k0!2280))))

(declare-fun b!505953 () Bool)

(declare-datatypes ((Unit!15468 0))(
  ( (Unit!15469) )
))
(declare-fun e!296160 () Unit!15468)

(declare-fun Unit!15470 () Unit!15468)

(assert (=> b!505953 (= e!296160 Unit!15470)))

(declare-fun b!505954 () Bool)

(declare-fun e!296157 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32502 (_ BitVec 32)) SeekEntryResult!4098)

(assert (=> b!505954 (= e!296157 (= (seekEntryOrOpen!0 (select (arr!15631 a!3235) j!176) a!3235 mask!3524) (Found!4098 j!176)))))

(declare-fun b!505955 () Bool)

(declare-fun res!306955 () Bool)

(declare-fun e!296152 () Bool)

(assert (=> b!505955 (=> (not res!306955) (not e!296152))))

(declare-datatypes ((List!9789 0))(
  ( (Nil!9786) (Cons!9785 (h!10662 (_ BitVec 64)) (t!16017 List!9789)) )
))
(declare-fun arrayNoDuplicates!0 (array!32502 (_ BitVec 32) List!9789) Bool)

(assert (=> b!505955 (= res!306955 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9786))))

(declare-fun b!505956 () Bool)

(declare-fun res!306956 () Bool)

(assert (=> b!505956 (=> (not res!306956) (not e!296155))))

(assert (=> b!505956 (= res!306956 (validKeyInArray!0 (select (arr!15631 a!3235) j!176)))))

(declare-fun b!505957 () Bool)

(assert (=> b!505957 (= e!296155 e!296152)))

(declare-fun res!306967 () Bool)

(assert (=> b!505957 (=> (not res!306967) (not e!296152))))

(declare-fun lt!230760 () SeekEntryResult!4098)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505957 (= res!306967 (or (= lt!230760 (MissingZero!4098 i!1204)) (= lt!230760 (MissingVacant!4098 i!1204))))))

(assert (=> b!505957 (= lt!230760 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505958 () Bool)

(declare-fun e!296154 () Bool)

(assert (=> b!505958 (= e!296154 false)))

(declare-fun b!505959 () Bool)

(declare-fun res!306960 () Bool)

(assert (=> b!505959 (=> (not res!306960) (not e!296155))))

(declare-fun arrayContainsKey!0 (array!32502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505959 (= res!306960 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505960 () Bool)

(declare-fun Unit!15471 () Unit!15468)

(assert (=> b!505960 (= e!296160 Unit!15471)))

(declare-fun lt!230756 () Unit!15468)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15468)

(assert (=> b!505960 (= lt!230756 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230758 #b00000000000000000000000000000000 (index!18582 lt!230757) (x!47587 lt!230757) mask!3524))))

(declare-fun lt!230752 () array!32502)

(declare-fun res!306962 () Bool)

(declare-fun lt!230750 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32502 (_ BitVec 32)) SeekEntryResult!4098)

(assert (=> b!505960 (= res!306962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230758 lt!230750 lt!230752 mask!3524) (Intermediate!4098 false (index!18582 lt!230757) (x!47587 lt!230757))))))

(assert (=> b!505960 (=> (not res!306962) (not e!296154))))

(assert (=> b!505960 e!296154))

(declare-fun b!505961 () Bool)

(declare-fun res!306961 () Bool)

(declare-fun e!296156 () Bool)

(assert (=> b!505961 (=> res!306961 e!296156)))

(declare-fun lt!230754 () SeekEntryResult!4098)

(assert (=> b!505961 (= res!306961 (not (= lt!230754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230758 lt!230750 lt!230752 mask!3524))))))

(declare-fun b!505962 () Bool)

(assert (=> b!505962 (= e!296156 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!505962 (= (seekEntryOrOpen!0 lt!230750 lt!230752 mask!3524) lt!230761)))

(declare-fun lt!230755 () Unit!15468)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15468)

(assert (=> b!505962 (= lt!230755 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230758 #b00000000000000000000000000000000 (index!18582 lt!230757) (x!47587 lt!230757) mask!3524))))

(declare-fun b!505963 () Bool)

(declare-fun e!296158 () Bool)

(assert (=> b!505963 (= e!296152 (not e!296158))))

(declare-fun res!306965 () Bool)

(assert (=> b!505963 (=> res!306965 e!296158)))

(get-info :version)

(assert (=> b!505963 (= res!306965 (or (= lt!230757 lt!230754) (undefined!4910 lt!230757) (not ((_ is Intermediate!4098) lt!230757))))))

(declare-fun lt!230759 () (_ BitVec 32))

(assert (=> b!505963 (= lt!230754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230759 lt!230750 lt!230752 mask!3524))))

(assert (=> b!505963 (= lt!230757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230758 (select (arr!15631 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505963 (= lt!230759 (toIndex!0 lt!230750 mask!3524))))

(assert (=> b!505963 (= lt!230750 (select (store (arr!15631 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505963 (= lt!230758 (toIndex!0 (select (arr!15631 a!3235) j!176) mask!3524))))

(assert (=> b!505963 (= lt!230752 (array!32503 (store (arr!15631 a!3235) i!1204 k0!2280) (size!15995 a!3235)))))

(assert (=> b!505963 (= lt!230761 (Found!4098 j!176))))

(assert (=> b!505963 e!296157))

(declare-fun res!306958 () Bool)

(assert (=> b!505963 (=> (not res!306958) (not e!296157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32502 (_ BitVec 32)) Bool)

(assert (=> b!505963 (= res!306958 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230749 () Unit!15468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15468)

(assert (=> b!505963 (= lt!230749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505964 () Bool)

(declare-fun res!306966 () Bool)

(assert (=> b!505964 (=> (not res!306966) (not e!296152))))

(assert (=> b!505964 (= res!306966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505965 () Bool)

(declare-fun res!306959 () Bool)

(assert (=> b!505965 (=> (not res!306959) (not e!296155))))

(assert (=> b!505965 (= res!306959 (and (= (size!15995 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15995 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15995 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505966 () Bool)

(assert (=> b!505966 (= e!296158 e!296156)))

(declare-fun res!306954 () Bool)

(assert (=> b!505966 (=> res!306954 e!296156)))

(assert (=> b!505966 (= res!306954 (or (bvsgt (x!47587 lt!230757) #b01111111111111111111111111111110) (bvslt lt!230758 #b00000000000000000000000000000000) (bvsge lt!230758 (size!15995 a!3235)) (bvslt (index!18582 lt!230757) #b00000000000000000000000000000000) (bvsge (index!18582 lt!230757) (size!15995 a!3235)) (not (= lt!230757 (Intermediate!4098 false (index!18582 lt!230757) (x!47587 lt!230757))))))))

(assert (=> b!505966 (= (index!18582 lt!230757) i!1204)))

(declare-fun lt!230751 () Unit!15468)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15468)

(assert (=> b!505966 (= lt!230751 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230758 #b00000000000000000000000000000000 (index!18582 lt!230757) (x!47587 lt!230757) mask!3524))))

(assert (=> b!505966 (and (or (= (select (arr!15631 a!3235) (index!18582 lt!230757)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15631 a!3235) (index!18582 lt!230757)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15631 a!3235) (index!18582 lt!230757)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15631 a!3235) (index!18582 lt!230757)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230753 () Unit!15468)

(assert (=> b!505966 (= lt!230753 e!296160)))

(declare-fun c!59777 () Bool)

(assert (=> b!505966 (= c!59777 (= (select (arr!15631 a!3235) (index!18582 lt!230757)) (select (arr!15631 a!3235) j!176)))))

(assert (=> b!505966 (and (bvslt (x!47587 lt!230757) #b01111111111111111111111111111110) (or (= (select (arr!15631 a!3235) (index!18582 lt!230757)) (select (arr!15631 a!3235) j!176)) (= (select (arr!15631 a!3235) (index!18582 lt!230757)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15631 a!3235) (index!18582 lt!230757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505967 () Bool)

(declare-fun res!306968 () Bool)

(assert (=> b!505967 (=> res!306968 e!296156)))

(assert (=> b!505967 (= res!306968 e!296159)))

(declare-fun res!306957 () Bool)

(assert (=> b!505967 (=> (not res!306957) (not e!296159))))

(assert (=> b!505967 (= res!306957 (bvsgt #b00000000000000000000000000000000 (x!47587 lt!230757)))))

(assert (= (and start!45746 res!306964) b!505965))

(assert (= (and b!505965 res!306959) b!505956))

(assert (= (and b!505956 res!306956) b!505952))

(assert (= (and b!505952 res!306963) b!505959))

(assert (= (and b!505959 res!306960) b!505957))

(assert (= (and b!505957 res!306967) b!505964))

(assert (= (and b!505964 res!306966) b!505955))

(assert (= (and b!505955 res!306955) b!505963))

(assert (= (and b!505963 res!306958) b!505954))

(assert (= (and b!505963 (not res!306965)) b!505966))

(assert (= (and b!505966 c!59777) b!505960))

(assert (= (and b!505966 (not c!59777)) b!505953))

(assert (= (and b!505960 res!306962) b!505958))

(assert (= (and b!505966 (not res!306954)) b!505967))

(assert (= (and b!505967 res!306957) b!505951))

(assert (= (and b!505967 (not res!306968)) b!505961))

(assert (= (and b!505961 (not res!306961)) b!505962))

(declare-fun m!486605 () Bool)

(assert (=> b!505956 m!486605))

(assert (=> b!505956 m!486605))

(declare-fun m!486607 () Bool)

(assert (=> b!505956 m!486607))

(declare-fun m!486609 () Bool)

(assert (=> b!505959 m!486609))

(declare-fun m!486611 () Bool)

(assert (=> start!45746 m!486611))

(declare-fun m!486613 () Bool)

(assert (=> start!45746 m!486613))

(declare-fun m!486615 () Bool)

(assert (=> b!505964 m!486615))

(declare-fun m!486617 () Bool)

(assert (=> b!505955 m!486617))

(declare-fun m!486619 () Bool)

(assert (=> b!505961 m!486619))

(declare-fun m!486621 () Bool)

(assert (=> b!505957 m!486621))

(declare-fun m!486623 () Bool)

(assert (=> b!505952 m!486623))

(assert (=> b!505963 m!486605))

(declare-fun m!486625 () Bool)

(assert (=> b!505963 m!486625))

(declare-fun m!486627 () Bool)

(assert (=> b!505963 m!486627))

(declare-fun m!486629 () Bool)

(assert (=> b!505963 m!486629))

(assert (=> b!505963 m!486605))

(declare-fun m!486631 () Bool)

(assert (=> b!505963 m!486631))

(assert (=> b!505963 m!486605))

(declare-fun m!486633 () Bool)

(assert (=> b!505963 m!486633))

(declare-fun m!486635 () Bool)

(assert (=> b!505963 m!486635))

(declare-fun m!486637 () Bool)

(assert (=> b!505963 m!486637))

(declare-fun m!486639 () Bool)

(assert (=> b!505963 m!486639))

(declare-fun m!486641 () Bool)

(assert (=> b!505966 m!486641))

(declare-fun m!486643 () Bool)

(assert (=> b!505966 m!486643))

(assert (=> b!505966 m!486605))

(declare-fun m!486645 () Bool)

(assert (=> b!505962 m!486645))

(declare-fun m!486647 () Bool)

(assert (=> b!505962 m!486647))

(assert (=> b!505951 m!486605))

(assert (=> b!505951 m!486605))

(declare-fun m!486649 () Bool)

(assert (=> b!505951 m!486649))

(declare-fun m!486651 () Bool)

(assert (=> b!505960 m!486651))

(assert (=> b!505960 m!486619))

(assert (=> b!505954 m!486605))

(assert (=> b!505954 m!486605))

(declare-fun m!486653 () Bool)

(assert (=> b!505954 m!486653))

(check-sat (not b!505954) (not b!505961) (not b!505962) (not start!45746) (not b!505960) (not b!505966) (not b!505955) (not b!505964) (not b!505957) (not b!505963) (not b!505956) (not b!505952) (not b!505959) (not b!505951))
(check-sat)
