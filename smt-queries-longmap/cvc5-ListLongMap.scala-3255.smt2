; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45402 () Bool)

(assert start!45402)

(declare-fun b!499008 () Bool)

(declare-fun res!301037 () Bool)

(declare-fun e!292439 () Bool)

(assert (=> b!499008 (=> res!301037 e!292439)))

(declare-datatypes ((SeekEntryResult!3962 0))(
  ( (MissingZero!3962 (index!18030 (_ BitVec 32))) (Found!3962 (index!18031 (_ BitVec 32))) (Intermediate!3962 (undefined!4774 Bool) (index!18032 (_ BitVec 32)) (x!47079 (_ BitVec 32))) (Undefined!3962) (MissingVacant!3962 (index!18033 (_ BitVec 32))) )
))
(declare-fun lt!226159 () SeekEntryResult!3962)

(assert (=> b!499008 (= res!301037 (or (undefined!4774 lt!226159) (not (is-Intermediate!3962 lt!226159))))))

(declare-fun b!499009 () Bool)

(declare-fun res!301029 () Bool)

(declare-fun e!292440 () Bool)

(assert (=> b!499009 (=> (not res!301029) (not e!292440))))

(declare-datatypes ((array!32227 0))(
  ( (array!32228 (arr!15495 (Array (_ BitVec 32) (_ BitVec 64))) (size!15859 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32227)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499009 (= res!301029 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499010 () Bool)

(declare-datatypes ((Unit!14924 0))(
  ( (Unit!14925) )
))
(declare-fun e!292443 () Unit!14924)

(declare-fun Unit!14926 () Unit!14924)

(assert (=> b!499010 (= e!292443 Unit!14926)))

(declare-fun b!499011 () Bool)

(declare-fun e!292442 () Bool)

(assert (=> b!499011 (= e!292440 e!292442)))

(declare-fun res!301039 () Bool)

(assert (=> b!499011 (=> (not res!301039) (not e!292442))))

(declare-fun lt!226165 () SeekEntryResult!3962)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499011 (= res!301039 (or (= lt!226165 (MissingZero!3962 i!1204)) (= lt!226165 (MissingVacant!3962 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32227 (_ BitVec 32)) SeekEntryResult!3962)

(assert (=> b!499011 (= lt!226165 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!301028 () Bool)

(assert (=> start!45402 (=> (not res!301028) (not e!292440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45402 (= res!301028 (validMask!0 mask!3524))))

(assert (=> start!45402 e!292440))

(assert (=> start!45402 true))

(declare-fun array_inv!11291 (array!32227) Bool)

(assert (=> start!45402 (array_inv!11291 a!3235)))

(declare-fun b!499012 () Bool)

(declare-fun res!301040 () Bool)

(assert (=> b!499012 (=> (not res!301040) (not e!292442))))

(declare-datatypes ((List!9653 0))(
  ( (Nil!9650) (Cons!9649 (h!10523 (_ BitVec 64)) (t!15881 List!9653)) )
))
(declare-fun arrayNoDuplicates!0 (array!32227 (_ BitVec 32) List!9653) Bool)

(assert (=> b!499012 (= res!301040 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9650))))

(declare-fun b!499013 () Bool)

(assert (=> b!499013 (= e!292442 (not e!292439))))

(declare-fun res!301035 () Bool)

(assert (=> b!499013 (=> res!301035 e!292439)))

(declare-fun lt!226166 () array!32227)

(declare-fun lt!226162 () (_ BitVec 64))

(declare-fun lt!226163 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32227 (_ BitVec 32)) SeekEntryResult!3962)

(assert (=> b!499013 (= res!301035 (= lt!226159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226163 lt!226162 lt!226166 mask!3524)))))

(declare-fun lt!226161 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499013 (= lt!226159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226161 (select (arr!15495 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499013 (= lt!226163 (toIndex!0 lt!226162 mask!3524))))

(assert (=> b!499013 (= lt!226162 (select (store (arr!15495 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499013 (= lt!226161 (toIndex!0 (select (arr!15495 a!3235) j!176) mask!3524))))

(assert (=> b!499013 (= lt!226166 (array!32228 (store (arr!15495 a!3235) i!1204 k!2280) (size!15859 a!3235)))))

(declare-fun e!292441 () Bool)

(assert (=> b!499013 e!292441))

(declare-fun res!301034 () Bool)

(assert (=> b!499013 (=> (not res!301034) (not e!292441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32227 (_ BitVec 32)) Bool)

(assert (=> b!499013 (= res!301034 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226160 () Unit!14924)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14924)

(assert (=> b!499013 (= lt!226160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499014 () Bool)

(declare-fun res!301036 () Bool)

(assert (=> b!499014 (=> (not res!301036) (not e!292440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499014 (= res!301036 (validKeyInArray!0 k!2280))))

(declare-fun b!499015 () Bool)

(declare-fun res!301030 () Bool)

(assert (=> b!499015 (=> (not res!301030) (not e!292442))))

(assert (=> b!499015 (= res!301030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499016 () Bool)

(declare-fun e!292444 () Bool)

(assert (=> b!499016 (= e!292444 false)))

(declare-fun b!499017 () Bool)

(declare-fun res!301038 () Bool)

(assert (=> b!499017 (=> (not res!301038) (not e!292440))))

(assert (=> b!499017 (= res!301038 (and (= (size!15859 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15859 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15859 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499018 () Bool)

(declare-fun e!292445 () Bool)

(assert (=> b!499018 (= e!292439 e!292445)))

(declare-fun res!301033 () Bool)

(assert (=> b!499018 (=> res!301033 e!292445)))

(assert (=> b!499018 (= res!301033 (or (bvsgt #b00000000000000000000000000000000 (x!47079 lt!226159)) (bvsgt (x!47079 lt!226159) #b01111111111111111111111111111110) (bvslt lt!226161 #b00000000000000000000000000000000) (bvsge lt!226161 (size!15859 a!3235)) (bvslt (index!18032 lt!226159) #b00000000000000000000000000000000) (bvsge (index!18032 lt!226159) (size!15859 a!3235)) (not (= lt!226159 (Intermediate!3962 false (index!18032 lt!226159) (x!47079 lt!226159))))))))

(assert (=> b!499018 (and (or (= (select (arr!15495 a!3235) (index!18032 lt!226159)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15495 a!3235) (index!18032 lt!226159)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15495 a!3235) (index!18032 lt!226159)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15495 a!3235) (index!18032 lt!226159)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226167 () Unit!14924)

(assert (=> b!499018 (= lt!226167 e!292443)))

(declare-fun c!59267 () Bool)

(assert (=> b!499018 (= c!59267 (= (select (arr!15495 a!3235) (index!18032 lt!226159)) (select (arr!15495 a!3235) j!176)))))

(assert (=> b!499018 (and (bvslt (x!47079 lt!226159) #b01111111111111111111111111111110) (or (= (select (arr!15495 a!3235) (index!18032 lt!226159)) (select (arr!15495 a!3235) j!176)) (= (select (arr!15495 a!3235) (index!18032 lt!226159)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15495 a!3235) (index!18032 lt!226159)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499019 () Bool)

(assert (=> b!499019 (= e!292445 true)))

(declare-fun lt!226168 () SeekEntryResult!3962)

(assert (=> b!499019 (= lt!226168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226161 lt!226162 lt!226166 mask!3524))))

(declare-fun b!499020 () Bool)

(assert (=> b!499020 (= e!292441 (= (seekEntryOrOpen!0 (select (arr!15495 a!3235) j!176) a!3235 mask!3524) (Found!3962 j!176)))))

(declare-fun b!499021 () Bool)

(declare-fun res!301031 () Bool)

(assert (=> b!499021 (=> (not res!301031) (not e!292440))))

(assert (=> b!499021 (= res!301031 (validKeyInArray!0 (select (arr!15495 a!3235) j!176)))))

(declare-fun b!499022 () Bool)

(declare-fun Unit!14927 () Unit!14924)

(assert (=> b!499022 (= e!292443 Unit!14927)))

(declare-fun lt!226164 () Unit!14924)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32227 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14924)

(assert (=> b!499022 (= lt!226164 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226161 #b00000000000000000000000000000000 (index!18032 lt!226159) (x!47079 lt!226159) mask!3524))))

(declare-fun res!301032 () Bool)

(assert (=> b!499022 (= res!301032 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226161 lt!226162 lt!226166 mask!3524) (Intermediate!3962 false (index!18032 lt!226159) (x!47079 lt!226159))))))

(assert (=> b!499022 (=> (not res!301032) (not e!292444))))

(assert (=> b!499022 e!292444))

(assert (= (and start!45402 res!301028) b!499017))

(assert (= (and b!499017 res!301038) b!499021))

(assert (= (and b!499021 res!301031) b!499014))

(assert (= (and b!499014 res!301036) b!499009))

(assert (= (and b!499009 res!301029) b!499011))

(assert (= (and b!499011 res!301039) b!499015))

(assert (= (and b!499015 res!301030) b!499012))

(assert (= (and b!499012 res!301040) b!499013))

(assert (= (and b!499013 res!301034) b!499020))

(assert (= (and b!499013 (not res!301035)) b!499008))

(assert (= (and b!499008 (not res!301037)) b!499018))

(assert (= (and b!499018 c!59267) b!499022))

(assert (= (and b!499018 (not c!59267)) b!499010))

(assert (= (and b!499022 res!301032) b!499016))

(assert (= (and b!499018 (not res!301033)) b!499019))

(declare-fun m!480237 () Bool)

(assert (=> b!499014 m!480237))

(declare-fun m!480239 () Bool)

(assert (=> b!499022 m!480239))

(declare-fun m!480241 () Bool)

(assert (=> b!499022 m!480241))

(declare-fun m!480243 () Bool)

(assert (=> b!499011 m!480243))

(declare-fun m!480245 () Bool)

(assert (=> b!499013 m!480245))

(declare-fun m!480247 () Bool)

(assert (=> b!499013 m!480247))

(declare-fun m!480249 () Bool)

(assert (=> b!499013 m!480249))

(declare-fun m!480251 () Bool)

(assert (=> b!499013 m!480251))

(declare-fun m!480253 () Bool)

(assert (=> b!499013 m!480253))

(declare-fun m!480255 () Bool)

(assert (=> b!499013 m!480255))

(assert (=> b!499013 m!480253))

(declare-fun m!480257 () Bool)

(assert (=> b!499013 m!480257))

(declare-fun m!480259 () Bool)

(assert (=> b!499013 m!480259))

(assert (=> b!499013 m!480253))

(declare-fun m!480261 () Bool)

(assert (=> b!499013 m!480261))

(declare-fun m!480263 () Bool)

(assert (=> b!499009 m!480263))

(assert (=> b!499021 m!480253))

(assert (=> b!499021 m!480253))

(declare-fun m!480265 () Bool)

(assert (=> b!499021 m!480265))

(declare-fun m!480267 () Bool)

(assert (=> b!499015 m!480267))

(assert (=> b!499020 m!480253))

(assert (=> b!499020 m!480253))

(declare-fun m!480269 () Bool)

(assert (=> b!499020 m!480269))

(declare-fun m!480271 () Bool)

(assert (=> b!499012 m!480271))

(assert (=> b!499019 m!480241))

(declare-fun m!480273 () Bool)

(assert (=> b!499018 m!480273))

(assert (=> b!499018 m!480253))

(declare-fun m!480275 () Bool)

(assert (=> start!45402 m!480275))

(declare-fun m!480277 () Bool)

(assert (=> start!45402 m!480277))

(push 1)

