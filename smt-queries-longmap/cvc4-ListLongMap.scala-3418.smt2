; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47434 () Bool)

(assert start!47434)

(declare-fun b!522082 () Bool)

(declare-fun res!319799 () Bool)

(declare-fun e!304542 () Bool)

(assert (=> b!522082 (=> (not res!319799) (not e!304542))))

(declare-datatypes ((array!33260 0))(
  ( (array!33261 (arr!15986 (Array (_ BitVec 32) (_ BitVec 64))) (size!16350 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33260)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33260 (_ BitVec 32)) Bool)

(assert (=> b!522082 (= res!319799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522083 () Bool)

(declare-fun res!319789 () Bool)

(declare-fun e!304540 () Bool)

(assert (=> b!522083 (=> (not res!319789) (not e!304540))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522083 (= res!319789 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522084 () Bool)

(assert (=> b!522084 (= e!304540 e!304542)))

(declare-fun res!319796 () Bool)

(assert (=> b!522084 (=> (not res!319796) (not e!304542))))

(declare-datatypes ((SeekEntryResult!4453 0))(
  ( (MissingZero!4453 (index!20015 (_ BitVec 32))) (Found!4453 (index!20016 (_ BitVec 32))) (Intermediate!4453 (undefined!5265 Bool) (index!20017 (_ BitVec 32)) (x!48991 (_ BitVec 32))) (Undefined!4453) (MissingVacant!4453 (index!20018 (_ BitVec 32))) )
))
(declare-fun lt!239379 () SeekEntryResult!4453)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522084 (= res!319796 (or (= lt!239379 (MissingZero!4453 i!1204)) (= lt!239379 (MissingVacant!4453 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33260 (_ BitVec 32)) SeekEntryResult!4453)

(assert (=> b!522084 (= lt!239379 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522085 () Bool)

(declare-fun e!304536 () Bool)

(assert (=> b!522085 (= e!304536 false)))

(declare-fun b!522086 () Bool)

(declare-fun e!304538 () Bool)

(assert (=> b!522086 (= e!304542 (not e!304538))))

(declare-fun res!319790 () Bool)

(assert (=> b!522086 (=> res!319790 e!304538)))

(declare-fun lt!239376 () array!33260)

(declare-fun lt!239374 () (_ BitVec 32))

(declare-fun lt!239375 () SeekEntryResult!4453)

(declare-fun lt!239373 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33260 (_ BitVec 32)) SeekEntryResult!4453)

(assert (=> b!522086 (= res!319790 (= lt!239375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239374 lt!239373 lt!239376 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239377 () (_ BitVec 32))

(assert (=> b!522086 (= lt!239375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239377 (select (arr!15986 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522086 (= lt!239374 (toIndex!0 lt!239373 mask!3524))))

(assert (=> b!522086 (= lt!239373 (select (store (arr!15986 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522086 (= lt!239377 (toIndex!0 (select (arr!15986 a!3235) j!176) mask!3524))))

(assert (=> b!522086 (= lt!239376 (array!33261 (store (arr!15986 a!3235) i!1204 k!2280) (size!16350 a!3235)))))

(declare-fun e!304537 () Bool)

(assert (=> b!522086 e!304537))

(declare-fun res!319791 () Bool)

(assert (=> b!522086 (=> (not res!319791) (not e!304537))))

(assert (=> b!522086 (= res!319791 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16264 0))(
  ( (Unit!16265) )
))
(declare-fun lt!239372 () Unit!16264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16264)

(assert (=> b!522086 (= lt!239372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522087 () Bool)

(declare-fun e!304541 () Unit!16264)

(declare-fun Unit!16266 () Unit!16264)

(assert (=> b!522087 (= e!304541 Unit!16266)))

(declare-fun res!319798 () Bool)

(assert (=> start!47434 (=> (not res!319798) (not e!304540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47434 (= res!319798 (validMask!0 mask!3524))))

(assert (=> start!47434 e!304540))

(assert (=> start!47434 true))

(declare-fun array_inv!11782 (array!33260) Bool)

(assert (=> start!47434 (array_inv!11782 a!3235)))

(declare-fun b!522088 () Bool)

(declare-fun res!319795 () Bool)

(assert (=> b!522088 (=> res!319795 e!304538)))

(assert (=> b!522088 (= res!319795 (or (undefined!5265 lt!239375) (not (is-Intermediate!4453 lt!239375))))))

(declare-fun b!522089 () Bool)

(assert (=> b!522089 (= e!304537 (= (seekEntryOrOpen!0 (select (arr!15986 a!3235) j!176) a!3235 mask!3524) (Found!4453 j!176)))))

(declare-fun b!522090 () Bool)

(assert (=> b!522090 (= e!304538 true)))

(assert (=> b!522090 (and (or (= (select (arr!15986 a!3235) (index!20017 lt!239375)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15986 a!3235) (index!20017 lt!239375)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15986 a!3235) (index!20017 lt!239375)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15986 a!3235) (index!20017 lt!239375)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239380 () Unit!16264)

(assert (=> b!522090 (= lt!239380 e!304541)))

(declare-fun c!61448 () Bool)

(assert (=> b!522090 (= c!61448 (= (select (arr!15986 a!3235) (index!20017 lt!239375)) (select (arr!15986 a!3235) j!176)))))

(assert (=> b!522090 (and (bvslt (x!48991 lt!239375) #b01111111111111111111111111111110) (or (= (select (arr!15986 a!3235) (index!20017 lt!239375)) (select (arr!15986 a!3235) j!176)) (= (select (arr!15986 a!3235) (index!20017 lt!239375)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15986 a!3235) (index!20017 lt!239375)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522091 () Bool)

(declare-fun res!319793 () Bool)

(assert (=> b!522091 (=> (not res!319793) (not e!304540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522091 (= res!319793 (validKeyInArray!0 k!2280))))

(declare-fun b!522092 () Bool)

(declare-fun res!319794 () Bool)

(assert (=> b!522092 (=> (not res!319794) (not e!304540))))

(assert (=> b!522092 (= res!319794 (and (= (size!16350 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16350 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16350 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522093 () Bool)

(declare-fun res!319797 () Bool)

(assert (=> b!522093 (=> (not res!319797) (not e!304540))))

(assert (=> b!522093 (= res!319797 (validKeyInArray!0 (select (arr!15986 a!3235) j!176)))))

(declare-fun b!522094 () Bool)

(declare-fun Unit!16267 () Unit!16264)

(assert (=> b!522094 (= e!304541 Unit!16267)))

(declare-fun lt!239378 () Unit!16264)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16264)

(assert (=> b!522094 (= lt!239378 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239377 #b00000000000000000000000000000000 (index!20017 lt!239375) (x!48991 lt!239375) mask!3524))))

(declare-fun res!319788 () Bool)

(assert (=> b!522094 (= res!319788 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239377 lt!239373 lt!239376 mask!3524) (Intermediate!4453 false (index!20017 lt!239375) (x!48991 lt!239375))))))

(assert (=> b!522094 (=> (not res!319788) (not e!304536))))

(assert (=> b!522094 e!304536))

(declare-fun b!522095 () Bool)

(declare-fun res!319792 () Bool)

(assert (=> b!522095 (=> (not res!319792) (not e!304542))))

(declare-datatypes ((List!10144 0))(
  ( (Nil!10141) (Cons!10140 (h!11062 (_ BitVec 64)) (t!16372 List!10144)) )
))
(declare-fun arrayNoDuplicates!0 (array!33260 (_ BitVec 32) List!10144) Bool)

(assert (=> b!522095 (= res!319792 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10141))))

(assert (= (and start!47434 res!319798) b!522092))

(assert (= (and b!522092 res!319794) b!522093))

(assert (= (and b!522093 res!319797) b!522091))

(assert (= (and b!522091 res!319793) b!522083))

(assert (= (and b!522083 res!319789) b!522084))

(assert (= (and b!522084 res!319796) b!522082))

(assert (= (and b!522082 res!319799) b!522095))

(assert (= (and b!522095 res!319792) b!522086))

(assert (= (and b!522086 res!319791) b!522089))

(assert (= (and b!522086 (not res!319790)) b!522088))

(assert (= (and b!522088 (not res!319795)) b!522090))

(assert (= (and b!522090 c!61448) b!522094))

(assert (= (and b!522090 (not c!61448)) b!522087))

(assert (= (and b!522094 res!319788) b!522085))

(declare-fun m!502995 () Bool)

(assert (=> b!522089 m!502995))

(assert (=> b!522089 m!502995))

(declare-fun m!502997 () Bool)

(assert (=> b!522089 m!502997))

(declare-fun m!502999 () Bool)

(assert (=> start!47434 m!502999))

(declare-fun m!503001 () Bool)

(assert (=> start!47434 m!503001))

(declare-fun m!503003 () Bool)

(assert (=> b!522084 m!503003))

(declare-fun m!503005 () Bool)

(assert (=> b!522082 m!503005))

(declare-fun m!503007 () Bool)

(assert (=> b!522095 m!503007))

(declare-fun m!503009 () Bool)

(assert (=> b!522094 m!503009))

(declare-fun m!503011 () Bool)

(assert (=> b!522094 m!503011))

(declare-fun m!503013 () Bool)

(assert (=> b!522090 m!503013))

(assert (=> b!522090 m!502995))

(assert (=> b!522093 m!502995))

(assert (=> b!522093 m!502995))

(declare-fun m!503015 () Bool)

(assert (=> b!522093 m!503015))

(declare-fun m!503017 () Bool)

(assert (=> b!522086 m!503017))

(declare-fun m!503019 () Bool)

(assert (=> b!522086 m!503019))

(declare-fun m!503021 () Bool)

(assert (=> b!522086 m!503021))

(declare-fun m!503023 () Bool)

(assert (=> b!522086 m!503023))

(assert (=> b!522086 m!502995))

(declare-fun m!503025 () Bool)

(assert (=> b!522086 m!503025))

(declare-fun m!503027 () Bool)

(assert (=> b!522086 m!503027))

(assert (=> b!522086 m!502995))

(declare-fun m!503029 () Bool)

(assert (=> b!522086 m!503029))

(assert (=> b!522086 m!502995))

(declare-fun m!503031 () Bool)

(assert (=> b!522086 m!503031))

(declare-fun m!503033 () Bool)

(assert (=> b!522083 m!503033))

(declare-fun m!503035 () Bool)

(assert (=> b!522091 m!503035))

(push 1)

