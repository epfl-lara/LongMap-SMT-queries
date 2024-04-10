; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45704 () Bool)

(assert start!45704)

(declare-fun b!504880 () Bool)

(declare-fun res!306014 () Bool)

(declare-fun e!295593 () Bool)

(assert (=> b!504880 (=> (not res!306014) (not e!295593))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504880 (= res!306014 (validKeyInArray!0 k0!2280))))

(declare-fun b!504881 () Bool)

(declare-fun res!306019 () Bool)

(declare-fun e!295592 () Bool)

(assert (=> b!504881 (=> (not res!306019) (not e!295592))))

(declare-datatypes ((array!32460 0))(
  ( (array!32461 (arr!15610 (Array (_ BitVec 32) (_ BitVec 64))) (size!15974 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32460)

(declare-datatypes ((List!9768 0))(
  ( (Nil!9765) (Cons!9764 (h!10641 (_ BitVec 64)) (t!15996 List!9768)) )
))
(declare-fun arrayNoDuplicates!0 (array!32460 (_ BitVec 32) List!9768) Bool)

(assert (=> b!504881 (= res!306019 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9765))))

(declare-fun lt!229965 () (_ BitVec 32))

(declare-fun b!504882 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4077 0))(
  ( (MissingZero!4077 (index!18496 (_ BitVec 32))) (Found!4077 (index!18497 (_ BitVec 32))) (Intermediate!4077 (undefined!4889 Bool) (index!18498 (_ BitVec 32)) (x!47510 (_ BitVec 32))) (Undefined!4077) (MissingVacant!4077 (index!18499 (_ BitVec 32))) )
))
(declare-fun lt!229964 () SeekEntryResult!4077)

(declare-fun e!295586 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32460 (_ BitVec 32)) SeekEntryResult!4077)

(assert (=> b!504882 (= e!295586 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229965 (index!18498 lt!229964) (select (arr!15610 a!3235) j!176) a!3235 mask!3524) (Found!4077 j!176))))))

(declare-fun b!504883 () Bool)

(declare-fun res!306017 () Bool)

(declare-fun e!295589 () Bool)

(assert (=> b!504883 (=> res!306017 e!295589)))

(assert (=> b!504883 (= res!306017 e!295586)))

(declare-fun res!306018 () Bool)

(assert (=> b!504883 (=> (not res!306018) (not e!295586))))

(assert (=> b!504883 (= res!306018 (bvsgt #b00000000000000000000000000000000 (x!47510 lt!229964)))))

(declare-fun b!504884 () Bool)

(declare-fun e!295590 () Bool)

(assert (=> b!504884 (= e!295590 e!295589)))

(declare-fun res!306010 () Bool)

(assert (=> b!504884 (=> res!306010 e!295589)))

(assert (=> b!504884 (= res!306010 (or (bvsgt (x!47510 lt!229964) #b01111111111111111111111111111110) (bvslt lt!229965 #b00000000000000000000000000000000) (bvsge lt!229965 (size!15974 a!3235)) (bvslt (index!18498 lt!229964) #b00000000000000000000000000000000) (bvsge (index!18498 lt!229964) (size!15974 a!3235)) (not (= lt!229964 (Intermediate!4077 false (index!18498 lt!229964) (x!47510 lt!229964))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504884 (= (index!18498 lt!229964) i!1204)))

(declare-datatypes ((Unit!15384 0))(
  ( (Unit!15385) )
))
(declare-fun lt!229961 () Unit!15384)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15384)

(assert (=> b!504884 (= lt!229961 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229965 #b00000000000000000000000000000000 (index!18498 lt!229964) (x!47510 lt!229964) mask!3524))))

(assert (=> b!504884 (and (or (= (select (arr!15610 a!3235) (index!18498 lt!229964)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15610 a!3235) (index!18498 lt!229964)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15610 a!3235) (index!18498 lt!229964)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15610 a!3235) (index!18498 lt!229964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229962 () Unit!15384)

(declare-fun e!295588 () Unit!15384)

(assert (=> b!504884 (= lt!229962 e!295588)))

(declare-fun c!59714 () Bool)

(assert (=> b!504884 (= c!59714 (= (select (arr!15610 a!3235) (index!18498 lt!229964)) (select (arr!15610 a!3235) j!176)))))

(assert (=> b!504884 (and (bvslt (x!47510 lt!229964) #b01111111111111111111111111111110) (or (= (select (arr!15610 a!3235) (index!18498 lt!229964)) (select (arr!15610 a!3235) j!176)) (= (select (arr!15610 a!3235) (index!18498 lt!229964)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15610 a!3235) (index!18498 lt!229964)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504885 () Bool)

(declare-fun res!306023 () Bool)

(assert (=> b!504885 (=> (not res!306023) (not e!295592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32460 (_ BitVec 32)) Bool)

(assert (=> b!504885 (= res!306023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!306011 () Bool)

(assert (=> start!45704 (=> (not res!306011) (not e!295593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45704 (= res!306011 (validMask!0 mask!3524))))

(assert (=> start!45704 e!295593))

(assert (=> start!45704 true))

(declare-fun array_inv!11406 (array!32460) Bool)

(assert (=> start!45704 (array_inv!11406 a!3235)))

(declare-fun b!504886 () Bool)

(declare-fun res!306015 () Bool)

(assert (=> b!504886 (=> res!306015 e!295590)))

(get-info :version)

(assert (=> b!504886 (= res!306015 (or (undefined!4889 lt!229964) (not ((_ is Intermediate!4077) lt!229964))))))

(declare-fun b!504887 () Bool)

(assert (=> b!504887 (= e!295593 e!295592)))

(declare-fun res!306021 () Bool)

(assert (=> b!504887 (=> (not res!306021) (not e!295592))))

(declare-fun lt!229959 () SeekEntryResult!4077)

(assert (=> b!504887 (= res!306021 (or (= lt!229959 (MissingZero!4077 i!1204)) (= lt!229959 (MissingVacant!4077 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32460 (_ BitVec 32)) SeekEntryResult!4077)

(assert (=> b!504887 (= lt!229959 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504888 () Bool)

(assert (=> b!504888 (= e!295589 true)))

(declare-fun lt!229958 () (_ BitVec 64))

(declare-fun lt!229966 () SeekEntryResult!4077)

(declare-fun lt!229956 () array!32460)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32460 (_ BitVec 32)) SeekEntryResult!4077)

(assert (=> b!504888 (= lt!229966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229965 lt!229958 lt!229956 mask!3524))))

(declare-fun b!504889 () Bool)

(declare-fun res!306013 () Bool)

(assert (=> b!504889 (=> (not res!306013) (not e!295593))))

(assert (=> b!504889 (= res!306013 (validKeyInArray!0 (select (arr!15610 a!3235) j!176)))))

(declare-fun b!504890 () Bool)

(declare-fun Unit!15386 () Unit!15384)

(assert (=> b!504890 (= e!295588 Unit!15386)))

(declare-fun lt!229957 () Unit!15384)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15384)

(assert (=> b!504890 (= lt!229957 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229965 #b00000000000000000000000000000000 (index!18498 lt!229964) (x!47510 lt!229964) mask!3524))))

(declare-fun res!306009 () Bool)

(assert (=> b!504890 (= res!306009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229965 lt!229958 lt!229956 mask!3524) (Intermediate!4077 false (index!18498 lt!229964) (x!47510 lt!229964))))))

(declare-fun e!295587 () Bool)

(assert (=> b!504890 (=> (not res!306009) (not e!295587))))

(assert (=> b!504890 e!295587))

(declare-fun b!504891 () Bool)

(assert (=> b!504891 (= e!295587 false)))

(declare-fun b!504892 () Bool)

(declare-fun Unit!15387 () Unit!15384)

(assert (=> b!504892 (= e!295588 Unit!15387)))

(declare-fun b!504893 () Bool)

(declare-fun e!295591 () Bool)

(assert (=> b!504893 (= e!295591 (= (seekEntryOrOpen!0 (select (arr!15610 a!3235) j!176) a!3235 mask!3524) (Found!4077 j!176)))))

(declare-fun b!504894 () Bool)

(declare-fun res!306016 () Bool)

(assert (=> b!504894 (=> (not res!306016) (not e!295593))))

(declare-fun arrayContainsKey!0 (array!32460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504894 (= res!306016 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504895 () Bool)

(assert (=> b!504895 (= e!295592 (not e!295590))))

(declare-fun res!306012 () Bool)

(assert (=> b!504895 (=> res!306012 e!295590)))

(declare-fun lt!229963 () (_ BitVec 32))

(assert (=> b!504895 (= res!306012 (= lt!229964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229963 lt!229958 lt!229956 mask!3524)))))

(assert (=> b!504895 (= lt!229964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229965 (select (arr!15610 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504895 (= lt!229963 (toIndex!0 lt!229958 mask!3524))))

(assert (=> b!504895 (= lt!229958 (select (store (arr!15610 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504895 (= lt!229965 (toIndex!0 (select (arr!15610 a!3235) j!176) mask!3524))))

(assert (=> b!504895 (= lt!229956 (array!32461 (store (arr!15610 a!3235) i!1204 k0!2280) (size!15974 a!3235)))))

(assert (=> b!504895 e!295591))

(declare-fun res!306022 () Bool)

(assert (=> b!504895 (=> (not res!306022) (not e!295591))))

(assert (=> b!504895 (= res!306022 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229960 () Unit!15384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15384)

(assert (=> b!504895 (= lt!229960 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504896 () Bool)

(declare-fun res!306020 () Bool)

(assert (=> b!504896 (=> (not res!306020) (not e!295593))))

(assert (=> b!504896 (= res!306020 (and (= (size!15974 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15974 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15974 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45704 res!306011) b!504896))

(assert (= (and b!504896 res!306020) b!504889))

(assert (= (and b!504889 res!306013) b!504880))

(assert (= (and b!504880 res!306014) b!504894))

(assert (= (and b!504894 res!306016) b!504887))

(assert (= (and b!504887 res!306021) b!504885))

(assert (= (and b!504885 res!306023) b!504881))

(assert (= (and b!504881 res!306019) b!504895))

(assert (= (and b!504895 res!306022) b!504893))

(assert (= (and b!504895 (not res!306012)) b!504886))

(assert (= (and b!504886 (not res!306015)) b!504884))

(assert (= (and b!504884 c!59714) b!504890))

(assert (= (and b!504884 (not c!59714)) b!504892))

(assert (= (and b!504890 res!306009) b!504891))

(assert (= (and b!504884 (not res!306010)) b!504883))

(assert (= (and b!504883 res!306018) b!504882))

(assert (= (and b!504883 (not res!306017)) b!504888))

(declare-fun m!485575 () Bool)

(assert (=> b!504887 m!485575))

(declare-fun m!485577 () Bool)

(assert (=> b!504884 m!485577))

(declare-fun m!485579 () Bool)

(assert (=> b!504884 m!485579))

(declare-fun m!485581 () Bool)

(assert (=> b!504884 m!485581))

(declare-fun m!485583 () Bool)

(assert (=> b!504890 m!485583))

(declare-fun m!485585 () Bool)

(assert (=> b!504890 m!485585))

(declare-fun m!485587 () Bool)

(assert (=> b!504885 m!485587))

(declare-fun m!485589 () Bool)

(assert (=> b!504894 m!485589))

(assert (=> b!504889 m!485581))

(assert (=> b!504889 m!485581))

(declare-fun m!485591 () Bool)

(assert (=> b!504889 m!485591))

(assert (=> b!504893 m!485581))

(assert (=> b!504893 m!485581))

(declare-fun m!485593 () Bool)

(assert (=> b!504893 m!485593))

(declare-fun m!485595 () Bool)

(assert (=> b!504895 m!485595))

(assert (=> b!504895 m!485581))

(declare-fun m!485597 () Bool)

(assert (=> b!504895 m!485597))

(declare-fun m!485599 () Bool)

(assert (=> b!504895 m!485599))

(declare-fun m!485601 () Bool)

(assert (=> b!504895 m!485601))

(declare-fun m!485603 () Bool)

(assert (=> b!504895 m!485603))

(assert (=> b!504895 m!485581))

(declare-fun m!485605 () Bool)

(assert (=> b!504895 m!485605))

(declare-fun m!485607 () Bool)

(assert (=> b!504895 m!485607))

(declare-fun m!485609 () Bool)

(assert (=> b!504895 m!485609))

(assert (=> b!504895 m!485581))

(assert (=> b!504888 m!485585))

(declare-fun m!485611 () Bool)

(assert (=> b!504880 m!485611))

(assert (=> b!504882 m!485581))

(assert (=> b!504882 m!485581))

(declare-fun m!485613 () Bool)

(assert (=> b!504882 m!485613))

(declare-fun m!485615 () Bool)

(assert (=> start!45704 m!485615))

(declare-fun m!485617 () Bool)

(assert (=> start!45704 m!485617))

(declare-fun m!485619 () Bool)

(assert (=> b!504881 m!485619))

(check-sat (not b!504882) (not b!504881) (not start!45704) (not b!504890) (not b!504885) (not b!504895) (not b!504889) (not b!504888) (not b!504894) (not b!504884) (not b!504893) (not b!504880) (not b!504887))
(check-sat)
