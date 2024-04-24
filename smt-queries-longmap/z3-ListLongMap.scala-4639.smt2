; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64662 () Bool)

(assert start!64662)

(declare-fun b!727448 () Bool)

(declare-fun res!487974 () Bool)

(declare-fun e!407333 () Bool)

(assert (=> b!727448 (=> (not res!487974) (not e!407333))))

(declare-datatypes ((array!41050 0))(
  ( (array!41051 (arr!19642 (Array (_ BitVec 32) (_ BitVec 64))) (size!20062 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41050)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727448 (= res!487974 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727449 () Bool)

(declare-fun res!487964 () Bool)

(declare-fun e!407336 () Bool)

(assert (=> b!727449 (=> (not res!487964) (not e!407336))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727449 (= res!487964 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19642 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727450 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!407331 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7198 0))(
  ( (MissingZero!7198 (index!31160 (_ BitVec 32))) (Found!7198 (index!31161 (_ BitVec 32))) (Intermediate!7198 (undefined!8010 Bool) (index!31162 (_ BitVec 32)) (x!62308 (_ BitVec 32))) (Undefined!7198) (MissingVacant!7198 (index!31163 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41050 (_ BitVec 32)) SeekEntryResult!7198)

(assert (=> b!727450 (= e!407331 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19642 a!3186) j!159) a!3186 mask!3328) (Found!7198 j!159)))))

(declare-fun b!727451 () Bool)

(declare-fun e!407334 () Bool)

(assert (=> b!727451 (= e!407334 true)))

(declare-fun lt!322148 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727451 (= lt!322148 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!727452 () Bool)

(declare-fun res!487969 () Bool)

(assert (=> b!727452 (=> (not res!487969) (not e!407333))))

(assert (=> b!727452 (= res!487969 (and (= (size!20062 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20062 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20062 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727453 () Bool)

(declare-fun res!487968 () Bool)

(assert (=> b!727453 (=> (not res!487968) (not e!407333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727453 (= res!487968 (validKeyInArray!0 k0!2102))))

(declare-fun res!487970 () Bool)

(assert (=> start!64662 (=> (not res!487970) (not e!407333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64662 (= res!487970 (validMask!0 mask!3328))))

(assert (=> start!64662 e!407333))

(assert (=> start!64662 true))

(declare-fun array_inv!15501 (array!41050) Bool)

(assert (=> start!64662 (array_inv!15501 a!3186)))

(declare-fun b!727454 () Bool)

(declare-fun e!407329 () Bool)

(declare-fun e!407335 () Bool)

(assert (=> b!727454 (= e!407329 e!407335)))

(declare-fun res!487971 () Bool)

(assert (=> b!727454 (=> (not res!487971) (not e!407335))))

(declare-fun lt!322141 () SeekEntryResult!7198)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41050 (_ BitVec 32)) SeekEntryResult!7198)

(assert (=> b!727454 (= res!487971 (= (seekEntryOrOpen!0 (select (arr!19642 a!3186) j!159) a!3186 mask!3328) lt!322141))))

(assert (=> b!727454 (= lt!322141 (Found!7198 j!159))))

(declare-fun b!727455 () Bool)

(declare-fun e!407337 () Bool)

(assert (=> b!727455 (= e!407336 e!407337)))

(declare-fun res!487961 () Bool)

(assert (=> b!727455 (=> (not res!487961) (not e!407337))))

(declare-fun lt!322146 () SeekEntryResult!7198)

(declare-fun lt!322143 () SeekEntryResult!7198)

(assert (=> b!727455 (= res!487961 (= lt!322146 lt!322143))))

(declare-fun lt!322149 () (_ BitVec 64))

(declare-fun lt!322144 () array!41050)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41050 (_ BitVec 32)) SeekEntryResult!7198)

(assert (=> b!727455 (= lt!322143 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322149 lt!322144 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727455 (= lt!322146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322149 mask!3328) lt!322149 lt!322144 mask!3328))))

(assert (=> b!727455 (= lt!322149 (select (store (arr!19642 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727455 (= lt!322144 (array!41051 (store (arr!19642 a!3186) i!1173 k0!2102) (size!20062 a!3186)))))

(declare-fun b!727456 () Bool)

(declare-fun res!487960 () Bool)

(declare-fun e!407330 () Bool)

(assert (=> b!727456 (=> (not res!487960) (not e!407330))))

(declare-datatypes ((List!13551 0))(
  ( (Nil!13548) (Cons!13547 (h!14610 (_ BitVec 64)) (t!19858 List!13551)) )
))
(declare-fun arrayNoDuplicates!0 (array!41050 (_ BitVec 32) List!13551) Bool)

(assert (=> b!727456 (= res!487960 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13548))))

(declare-fun b!727457 () Bool)

(declare-fun lt!322147 () SeekEntryResult!7198)

(assert (=> b!727457 (= e!407331 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19642 a!3186) j!159) a!3186 mask!3328) lt!322147))))

(declare-fun b!727458 () Bool)

(declare-fun res!487963 () Bool)

(assert (=> b!727458 (=> (not res!487963) (not e!407333))))

(assert (=> b!727458 (= res!487963 (validKeyInArray!0 (select (arr!19642 a!3186) j!159)))))

(declare-fun b!727459 () Bool)

(declare-fun res!487967 () Bool)

(assert (=> b!727459 (=> (not res!487967) (not e!407336))))

(assert (=> b!727459 (= res!487967 e!407331)))

(declare-fun c!80120 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727459 (= c!80120 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727460 () Bool)

(declare-fun res!487973 () Bool)

(assert (=> b!727460 (=> (not res!487973) (not e!407330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41050 (_ BitVec 32)) Bool)

(assert (=> b!727460 (= res!487973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727461 () Bool)

(assert (=> b!727461 (= e!407333 e!407330)))

(declare-fun res!487966 () Bool)

(assert (=> b!727461 (=> (not res!487966) (not e!407330))))

(declare-fun lt!322145 () SeekEntryResult!7198)

(assert (=> b!727461 (= res!487966 (or (= lt!322145 (MissingZero!7198 i!1173)) (= lt!322145 (MissingVacant!7198 i!1173))))))

(assert (=> b!727461 (= lt!322145 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727462 () Bool)

(assert (=> b!727462 (= e!407335 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19642 a!3186) j!159) a!3186 mask!3328) lt!322141))))

(declare-fun b!727463 () Bool)

(assert (=> b!727463 (= e!407330 e!407336)))

(declare-fun res!487975 () Bool)

(assert (=> b!727463 (=> (not res!487975) (not e!407336))))

(assert (=> b!727463 (= res!487975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19642 a!3186) j!159) mask!3328) (select (arr!19642 a!3186) j!159) a!3186 mask!3328) lt!322147))))

(assert (=> b!727463 (= lt!322147 (Intermediate!7198 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727464 () Bool)

(declare-fun res!487962 () Bool)

(assert (=> b!727464 (=> (not res!487962) (not e!407330))))

(assert (=> b!727464 (= res!487962 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20062 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20062 a!3186))))))

(declare-fun b!727465 () Bool)

(assert (=> b!727465 (= e!407337 (not e!407334))))

(declare-fun res!487965 () Bool)

(assert (=> b!727465 (=> res!487965 e!407334)))

(get-info :version)

(assert (=> b!727465 (= res!487965 (or (not ((_ is Intermediate!7198) lt!322143)) (bvsge x!1131 (x!62308 lt!322143))))))

(assert (=> b!727465 e!407329))

(declare-fun res!487972 () Bool)

(assert (=> b!727465 (=> (not res!487972) (not e!407329))))

(assert (=> b!727465 (= res!487972 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24793 0))(
  ( (Unit!24794) )
))
(declare-fun lt!322142 () Unit!24793)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24793)

(assert (=> b!727465 (= lt!322142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64662 res!487970) b!727452))

(assert (= (and b!727452 res!487969) b!727458))

(assert (= (and b!727458 res!487963) b!727453))

(assert (= (and b!727453 res!487968) b!727448))

(assert (= (and b!727448 res!487974) b!727461))

(assert (= (and b!727461 res!487966) b!727460))

(assert (= (and b!727460 res!487973) b!727456))

(assert (= (and b!727456 res!487960) b!727464))

(assert (= (and b!727464 res!487962) b!727463))

(assert (= (and b!727463 res!487975) b!727449))

(assert (= (and b!727449 res!487964) b!727459))

(assert (= (and b!727459 c!80120) b!727457))

(assert (= (and b!727459 (not c!80120)) b!727450))

(assert (= (and b!727459 res!487967) b!727455))

(assert (= (and b!727455 res!487961) b!727465))

(assert (= (and b!727465 res!487972) b!727454))

(assert (= (and b!727454 res!487971) b!727462))

(assert (= (and b!727465 (not res!487965)) b!727451))

(declare-fun m!681867 () Bool)

(assert (=> b!727461 m!681867))

(declare-fun m!681869 () Bool)

(assert (=> b!727454 m!681869))

(assert (=> b!727454 m!681869))

(declare-fun m!681871 () Bool)

(assert (=> b!727454 m!681871))

(declare-fun m!681873 () Bool)

(assert (=> b!727460 m!681873))

(declare-fun m!681875 () Bool)

(assert (=> start!64662 m!681875))

(declare-fun m!681877 () Bool)

(assert (=> start!64662 m!681877))

(assert (=> b!727457 m!681869))

(assert (=> b!727457 m!681869))

(declare-fun m!681879 () Bool)

(assert (=> b!727457 m!681879))

(declare-fun m!681881 () Bool)

(assert (=> b!727451 m!681881))

(declare-fun m!681883 () Bool)

(assert (=> b!727453 m!681883))

(assert (=> b!727458 m!681869))

(assert (=> b!727458 m!681869))

(declare-fun m!681885 () Bool)

(assert (=> b!727458 m!681885))

(declare-fun m!681887 () Bool)

(assert (=> b!727465 m!681887))

(declare-fun m!681889 () Bool)

(assert (=> b!727465 m!681889))

(assert (=> b!727463 m!681869))

(assert (=> b!727463 m!681869))

(declare-fun m!681891 () Bool)

(assert (=> b!727463 m!681891))

(assert (=> b!727463 m!681891))

(assert (=> b!727463 m!681869))

(declare-fun m!681893 () Bool)

(assert (=> b!727463 m!681893))

(declare-fun m!681895 () Bool)

(assert (=> b!727449 m!681895))

(assert (=> b!727462 m!681869))

(assert (=> b!727462 m!681869))

(declare-fun m!681897 () Bool)

(assert (=> b!727462 m!681897))

(declare-fun m!681899 () Bool)

(assert (=> b!727456 m!681899))

(declare-fun m!681901 () Bool)

(assert (=> b!727448 m!681901))

(assert (=> b!727450 m!681869))

(assert (=> b!727450 m!681869))

(declare-fun m!681903 () Bool)

(assert (=> b!727450 m!681903))

(declare-fun m!681905 () Bool)

(assert (=> b!727455 m!681905))

(declare-fun m!681907 () Bool)

(assert (=> b!727455 m!681907))

(declare-fun m!681909 () Bool)

(assert (=> b!727455 m!681909))

(declare-fun m!681911 () Bool)

(assert (=> b!727455 m!681911))

(declare-fun m!681913 () Bool)

(assert (=> b!727455 m!681913))

(assert (=> b!727455 m!681911))

(check-sat (not b!727453) (not b!727456) (not start!64662) (not b!727454) (not b!727457) (not b!727455) (not b!727448) (not b!727465) (not b!727451) (not b!727458) (not b!727462) (not b!727460) (not b!727450) (not b!727463) (not b!727461))
(check-sat)
