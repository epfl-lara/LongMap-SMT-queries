; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45440 () Bool)

(assert start!45440)

(declare-fun b!500027 () Bool)

(declare-fun res!301962 () Bool)

(declare-fun e!292978 () Bool)

(assert (=> b!500027 (=> res!301962 e!292978)))

(declare-datatypes ((SeekEntryResult!3937 0))(
  ( (MissingZero!3937 (index!17930 (_ BitVec 32))) (Found!3937 (index!17931 (_ BitVec 32))) (Intermediate!3937 (undefined!4749 Bool) (index!17932 (_ BitVec 32)) (x!47115 (_ BitVec 32))) (Undefined!3937) (MissingVacant!3937 (index!17933 (_ BitVec 32))) )
))
(declare-fun lt!226891 () SeekEntryResult!3937)

(get-info :version)

(assert (=> b!500027 (= res!301962 (or (undefined!4749 lt!226891) (not ((_ is Intermediate!3937) lt!226891))))))

(declare-fun b!500028 () Bool)

(declare-fun res!301961 () Bool)

(declare-fun e!292981 () Bool)

(assert (=> b!500028 (=> (not res!301961) (not e!292981))))

(declare-datatypes ((array!32266 0))(
  ( (array!32267 (arr!15514 (Array (_ BitVec 32) (_ BitVec 64))) (size!15878 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32266)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32266 (_ BitVec 32)) Bool)

(assert (=> b!500028 (= res!301961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500029 () Bool)

(declare-fun e!292983 () Bool)

(assert (=> b!500029 (= e!292983 false)))

(declare-fun res!301968 () Bool)

(declare-fun e!292977 () Bool)

(assert (=> start!45440 (=> (not res!301968) (not e!292977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45440 (= res!301968 (validMask!0 mask!3524))))

(assert (=> start!45440 e!292977))

(assert (=> start!45440 true))

(declare-fun array_inv!11373 (array!32266) Bool)

(assert (=> start!45440 (array_inv!11373 a!3235)))

(declare-fun b!500030 () Bool)

(declare-fun res!301966 () Bool)

(assert (=> b!500030 (=> (not res!301966) (not e!292981))))

(declare-datatypes ((List!9579 0))(
  ( (Nil!9576) (Cons!9575 (h!10449 (_ BitVec 64)) (t!15799 List!9579)) )
))
(declare-fun arrayNoDuplicates!0 (array!32266 (_ BitVec 32) List!9579) Bool)

(assert (=> b!500030 (= res!301966 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9576))))

(declare-fun b!500031 () Bool)

(declare-fun res!301964 () Bool)

(assert (=> b!500031 (=> (not res!301964) (not e!292977))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500031 (= res!301964 (validKeyInArray!0 k0!2280))))

(declare-fun b!500032 () Bool)

(declare-datatypes ((Unit!14983 0))(
  ( (Unit!14984) )
))
(declare-fun e!292976 () Unit!14983)

(declare-fun Unit!14985 () Unit!14983)

(assert (=> b!500032 (= e!292976 Unit!14985)))

(declare-fun lt!226898 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!226893 () Unit!14983)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32266 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14983)

(assert (=> b!500032 (= lt!226893 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226898 #b00000000000000000000000000000000 (index!17932 lt!226891) (x!47115 lt!226891) mask!3524))))

(declare-fun res!301967 () Bool)

(declare-fun lt!226896 () array!32266)

(declare-fun lt!226900 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32266 (_ BitVec 32)) SeekEntryResult!3937)

(assert (=> b!500032 (= res!301967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226898 lt!226900 lt!226896 mask!3524) (Intermediate!3937 false (index!17932 lt!226891) (x!47115 lt!226891))))))

(assert (=> b!500032 (=> (not res!301967) (not e!292983))))

(assert (=> b!500032 e!292983))

(declare-fun b!500033 () Bool)

(declare-fun res!301963 () Bool)

(assert (=> b!500033 (=> (not res!301963) (not e!292977))))

(declare-fun arrayContainsKey!0 (array!32266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500033 (= res!301963 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500034 () Bool)

(declare-fun res!301965 () Bool)

(assert (=> b!500034 (=> (not res!301965) (not e!292977))))

(assert (=> b!500034 (= res!301965 (validKeyInArray!0 (select (arr!15514 a!3235) j!176)))))

(declare-fun b!500035 () Bool)

(declare-fun Unit!14986 () Unit!14983)

(assert (=> b!500035 (= e!292976 Unit!14986)))

(declare-fun b!500036 () Bool)

(declare-fun e!292979 () Bool)

(assert (=> b!500036 (= e!292978 e!292979)))

(declare-fun res!301959 () Bool)

(assert (=> b!500036 (=> res!301959 e!292979)))

(assert (=> b!500036 (= res!301959 (or (bvsgt #b00000000000000000000000000000000 (x!47115 lt!226891)) (bvsgt (x!47115 lt!226891) #b01111111111111111111111111111110) (bvslt lt!226898 #b00000000000000000000000000000000) (bvsge lt!226898 (size!15878 a!3235)) (bvslt (index!17932 lt!226891) #b00000000000000000000000000000000) (bvsge (index!17932 lt!226891) (size!15878 a!3235)) (not (= lt!226891 (Intermediate!3937 false (index!17932 lt!226891) (x!47115 lt!226891))))))))

(assert (=> b!500036 (and (or (= (select (arr!15514 a!3235) (index!17932 lt!226891)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15514 a!3235) (index!17932 lt!226891)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15514 a!3235) (index!17932 lt!226891)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15514 a!3235) (index!17932 lt!226891)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226899 () Unit!14983)

(assert (=> b!500036 (= lt!226899 e!292976)))

(declare-fun c!59312 () Bool)

(assert (=> b!500036 (= c!59312 (= (select (arr!15514 a!3235) (index!17932 lt!226891)) (select (arr!15514 a!3235) j!176)))))

(assert (=> b!500036 (and (bvslt (x!47115 lt!226891) #b01111111111111111111111111111110) (or (= (select (arr!15514 a!3235) (index!17932 lt!226891)) (select (arr!15514 a!3235) j!176)) (= (select (arr!15514 a!3235) (index!17932 lt!226891)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15514 a!3235) (index!17932 lt!226891)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500037 () Bool)

(assert (=> b!500037 (= e!292979 true)))

(declare-fun lt!226895 () SeekEntryResult!3937)

(assert (=> b!500037 (= lt!226895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226898 lt!226900 lt!226896 mask!3524))))

(declare-fun b!500038 () Bool)

(declare-fun e!292982 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32266 (_ BitVec 32)) SeekEntryResult!3937)

(assert (=> b!500038 (= e!292982 (= (seekEntryOrOpen!0 (select (arr!15514 a!3235) j!176) a!3235 mask!3524) (Found!3937 j!176)))))

(declare-fun b!500039 () Bool)

(assert (=> b!500039 (= e!292981 (not e!292978))))

(declare-fun res!301960 () Bool)

(assert (=> b!500039 (=> res!301960 e!292978)))

(declare-fun lt!226892 () (_ BitVec 32))

(assert (=> b!500039 (= res!301960 (= lt!226891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226892 lt!226900 lt!226896 mask!3524)))))

(assert (=> b!500039 (= lt!226891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226898 (select (arr!15514 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500039 (= lt!226892 (toIndex!0 lt!226900 mask!3524))))

(assert (=> b!500039 (= lt!226900 (select (store (arr!15514 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500039 (= lt!226898 (toIndex!0 (select (arr!15514 a!3235) j!176) mask!3524))))

(assert (=> b!500039 (= lt!226896 (array!32267 (store (arr!15514 a!3235) i!1204 k0!2280) (size!15878 a!3235)))))

(assert (=> b!500039 e!292982))

(declare-fun res!301958 () Bool)

(assert (=> b!500039 (=> (not res!301958) (not e!292982))))

(assert (=> b!500039 (= res!301958 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226897 () Unit!14983)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14983)

(assert (=> b!500039 (= lt!226897 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500040 () Bool)

(declare-fun res!301969 () Bool)

(assert (=> b!500040 (=> (not res!301969) (not e!292977))))

(assert (=> b!500040 (= res!301969 (and (= (size!15878 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15878 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15878 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500041 () Bool)

(assert (=> b!500041 (= e!292977 e!292981)))

(declare-fun res!301957 () Bool)

(assert (=> b!500041 (=> (not res!301957) (not e!292981))))

(declare-fun lt!226894 () SeekEntryResult!3937)

(assert (=> b!500041 (= res!301957 (or (= lt!226894 (MissingZero!3937 i!1204)) (= lt!226894 (MissingVacant!3937 i!1204))))))

(assert (=> b!500041 (= lt!226894 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45440 res!301968) b!500040))

(assert (= (and b!500040 res!301969) b!500034))

(assert (= (and b!500034 res!301965) b!500031))

(assert (= (and b!500031 res!301964) b!500033))

(assert (= (and b!500033 res!301963) b!500041))

(assert (= (and b!500041 res!301957) b!500028))

(assert (= (and b!500028 res!301961) b!500030))

(assert (= (and b!500030 res!301966) b!500039))

(assert (= (and b!500039 res!301958) b!500038))

(assert (= (and b!500039 (not res!301960)) b!500027))

(assert (= (and b!500027 (not res!301962)) b!500036))

(assert (= (and b!500036 c!59312) b!500032))

(assert (= (and b!500036 (not c!59312)) b!500035))

(assert (= (and b!500032 res!301967) b!500029))

(assert (= (and b!500036 (not res!301959)) b!500037))

(declare-fun m!481429 () Bool)

(assert (=> b!500033 m!481429))

(declare-fun m!481431 () Bool)

(assert (=> b!500028 m!481431))

(declare-fun m!481433 () Bool)

(assert (=> b!500034 m!481433))

(assert (=> b!500034 m!481433))

(declare-fun m!481435 () Bool)

(assert (=> b!500034 m!481435))

(declare-fun m!481437 () Bool)

(assert (=> start!45440 m!481437))

(declare-fun m!481439 () Bool)

(assert (=> start!45440 m!481439))

(declare-fun m!481441 () Bool)

(assert (=> b!500041 m!481441))

(declare-fun m!481443 () Bool)

(assert (=> b!500031 m!481443))

(declare-fun m!481445 () Bool)

(assert (=> b!500036 m!481445))

(assert (=> b!500036 m!481433))

(assert (=> b!500038 m!481433))

(assert (=> b!500038 m!481433))

(declare-fun m!481447 () Bool)

(assert (=> b!500038 m!481447))

(declare-fun m!481449 () Bool)

(assert (=> b!500030 m!481449))

(declare-fun m!481451 () Bool)

(assert (=> b!500039 m!481451))

(declare-fun m!481453 () Bool)

(assert (=> b!500039 m!481453))

(declare-fun m!481455 () Bool)

(assert (=> b!500039 m!481455))

(declare-fun m!481457 () Bool)

(assert (=> b!500039 m!481457))

(assert (=> b!500039 m!481433))

(declare-fun m!481459 () Bool)

(assert (=> b!500039 m!481459))

(assert (=> b!500039 m!481433))

(declare-fun m!481461 () Bool)

(assert (=> b!500039 m!481461))

(assert (=> b!500039 m!481433))

(declare-fun m!481463 () Bool)

(assert (=> b!500039 m!481463))

(declare-fun m!481465 () Bool)

(assert (=> b!500039 m!481465))

(declare-fun m!481467 () Bool)

(assert (=> b!500032 m!481467))

(declare-fun m!481469 () Bool)

(assert (=> b!500032 m!481469))

(assert (=> b!500037 m!481469))

(check-sat (not b!500037) (not b!500039) (not b!500028) (not b!500041) (not b!500031) (not b!500032) (not b!500038) (not start!45440) (not b!500030) (not b!500033) (not b!500034))
(check-sat)
