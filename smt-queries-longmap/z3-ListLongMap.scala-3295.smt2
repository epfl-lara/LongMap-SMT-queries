; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45704 () Bool)

(assert start!45704)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!505074 () Bool)

(declare-datatypes ((array!32461 0))(
  ( (array!32462 (arr!15610 (Array (_ BitVec 32) (_ BitVec 64))) (size!15974 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32461)

(declare-fun e!295689 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4033 0))(
  ( (MissingZero!4033 (index!18320 (_ BitVec 32))) (Found!4033 (index!18321 (_ BitVec 32))) (Intermediate!4033 (undefined!4845 Bool) (index!18322 (_ BitVec 32)) (x!47479 (_ BitVec 32))) (Undefined!4033) (MissingVacant!4033 (index!18323 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32461 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!505074 (= e!295689 (= (seekEntryOrOpen!0 (select (arr!15610 a!3235) j!176) a!3235 mask!3524) (Found!4033 j!176)))))

(declare-fun b!505075 () Bool)

(declare-fun e!295685 () Bool)

(declare-fun e!295688 () Bool)

(assert (=> b!505075 (= e!295685 e!295688)))

(declare-fun res!306236 () Bool)

(assert (=> b!505075 (=> (not res!306236) (not e!295688))))

(declare-fun lt!230142 () SeekEntryResult!4033)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505075 (= res!306236 (or (= lt!230142 (MissingZero!4033 i!1204)) (= lt!230142 (MissingVacant!4033 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!505075 (= lt!230142 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505076 () Bool)

(declare-fun res!306233 () Bool)

(assert (=> b!505076 (=> (not res!306233) (not e!295685))))

(declare-fun arrayContainsKey!0 (array!32461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505076 (= res!306233 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505077 () Bool)

(declare-fun res!306239 () Bool)

(declare-fun e!295684 () Bool)

(assert (=> b!505077 (=> res!306239 e!295684)))

(declare-fun lt!230147 () (_ BitVec 64))

(declare-fun lt!230145 () SeekEntryResult!4033)

(declare-fun lt!230137 () (_ BitVec 32))

(declare-fun lt!230140 () array!32461)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32461 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!505077 (= res!306239 (not (= lt!230145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230137 lt!230147 lt!230140 mask!3524))))))

(declare-fun b!505078 () Bool)

(declare-datatypes ((Unit!15367 0))(
  ( (Unit!15368) )
))
(declare-fun e!295681 () Unit!15367)

(declare-fun Unit!15369 () Unit!15367)

(assert (=> b!505078 (= e!295681 Unit!15369)))

(declare-fun b!505079 () Bool)

(declare-fun res!306235 () Bool)

(assert (=> b!505079 (=> (not res!306235) (not e!295685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505079 (= res!306235 (validKeyInArray!0 (select (arr!15610 a!3235) j!176)))))

(declare-fun b!505080 () Bool)

(declare-fun res!306241 () Bool)

(assert (=> b!505080 (=> (not res!306241) (not e!295685))))

(assert (=> b!505080 (= res!306241 (validKeyInArray!0 k0!2280))))

(declare-fun b!505081 () Bool)

(declare-fun res!306229 () Bool)

(assert (=> b!505081 (=> (not res!306229) (not e!295688))))

(declare-datatypes ((List!9675 0))(
  ( (Nil!9672) (Cons!9671 (h!10548 (_ BitVec 64)) (t!15895 List!9675)) )
))
(declare-fun arrayNoDuplicates!0 (array!32461 (_ BitVec 32) List!9675) Bool)

(assert (=> b!505081 (= res!306229 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9672))))

(declare-fun b!505082 () Bool)

(declare-fun e!295687 () Bool)

(assert (=> b!505082 (= e!295688 (not e!295687))))

(declare-fun res!306240 () Bool)

(assert (=> b!505082 (=> res!306240 e!295687)))

(declare-fun lt!230149 () SeekEntryResult!4033)

(get-info :version)

(assert (=> b!505082 (= res!306240 (or (= lt!230149 lt!230145) (undefined!4845 lt!230149) (not ((_ is Intermediate!4033) lt!230149))))))

(declare-fun lt!230141 () (_ BitVec 32))

(assert (=> b!505082 (= lt!230145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230141 lt!230147 lt!230140 mask!3524))))

(assert (=> b!505082 (= lt!230149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230137 (select (arr!15610 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505082 (= lt!230141 (toIndex!0 lt!230147 mask!3524))))

(assert (=> b!505082 (= lt!230147 (select (store (arr!15610 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505082 (= lt!230137 (toIndex!0 (select (arr!15610 a!3235) j!176) mask!3524))))

(assert (=> b!505082 (= lt!230140 (array!32462 (store (arr!15610 a!3235) i!1204 k0!2280) (size!15974 a!3235)))))

(declare-fun lt!230146 () SeekEntryResult!4033)

(assert (=> b!505082 (= lt!230146 (Found!4033 j!176))))

(assert (=> b!505082 e!295689))

(declare-fun res!306227 () Bool)

(assert (=> b!505082 (=> (not res!306227) (not e!295689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32461 (_ BitVec 32)) Bool)

(assert (=> b!505082 (= res!306227 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230148 () Unit!15367)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15367)

(assert (=> b!505082 (= lt!230148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505084 () Bool)

(assert (=> b!505084 (= e!295687 e!295684)))

(declare-fun res!306232 () Bool)

(assert (=> b!505084 (=> res!306232 e!295684)))

(assert (=> b!505084 (= res!306232 (or (bvsgt (x!47479 lt!230149) #b01111111111111111111111111111110) (bvslt lt!230137 #b00000000000000000000000000000000) (bvsge lt!230137 (size!15974 a!3235)) (bvslt (index!18322 lt!230149) #b00000000000000000000000000000000) (bvsge (index!18322 lt!230149) (size!15974 a!3235)) (not (= lt!230149 (Intermediate!4033 false (index!18322 lt!230149) (x!47479 lt!230149))))))))

(assert (=> b!505084 (= (index!18322 lt!230149) i!1204)))

(declare-fun lt!230144 () Unit!15367)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32461 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15367)

(assert (=> b!505084 (= lt!230144 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230137 #b00000000000000000000000000000000 (index!18322 lt!230149) (x!47479 lt!230149) mask!3524))))

(assert (=> b!505084 (and (or (= (select (arr!15610 a!3235) (index!18322 lt!230149)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15610 a!3235) (index!18322 lt!230149)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15610 a!3235) (index!18322 lt!230149)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15610 a!3235) (index!18322 lt!230149)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230138 () Unit!15367)

(assert (=> b!505084 (= lt!230138 e!295681)))

(declare-fun c!59702 () Bool)

(assert (=> b!505084 (= c!59702 (= (select (arr!15610 a!3235) (index!18322 lt!230149)) (select (arr!15610 a!3235) j!176)))))

(assert (=> b!505084 (and (bvslt (x!47479 lt!230149) #b01111111111111111111111111111110) (or (= (select (arr!15610 a!3235) (index!18322 lt!230149)) (select (arr!15610 a!3235) j!176)) (= (select (arr!15610 a!3235) (index!18322 lt!230149)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15610 a!3235) (index!18322 lt!230149)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505085 () Bool)

(declare-fun res!306237 () Bool)

(assert (=> b!505085 (=> (not res!306237) (not e!295685))))

(assert (=> b!505085 (= res!306237 (and (= (size!15974 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15974 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15974 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505086 () Bool)

(assert (=> b!505086 (= e!295684 true)))

(assert (=> b!505086 (= (seekEntryOrOpen!0 lt!230147 lt!230140 mask!3524) lt!230146)))

(declare-fun lt!230143 () Unit!15367)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32461 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15367)

(assert (=> b!505086 (= lt!230143 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230137 #b00000000000000000000000000000000 (index!18322 lt!230149) (x!47479 lt!230149) mask!3524))))

(declare-fun b!505087 () Bool)

(declare-fun e!295686 () Bool)

(assert (=> b!505087 (= e!295686 false)))

(declare-fun b!505088 () Bool)

(declare-fun Unit!15370 () Unit!15367)

(assert (=> b!505088 (= e!295681 Unit!15370)))

(declare-fun lt!230139 () Unit!15367)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32461 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15367)

(assert (=> b!505088 (= lt!230139 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230137 #b00000000000000000000000000000000 (index!18322 lt!230149) (x!47479 lt!230149) mask!3524))))

(declare-fun res!306230 () Bool)

(assert (=> b!505088 (= res!306230 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230137 lt!230147 lt!230140 mask!3524) (Intermediate!4033 false (index!18322 lt!230149) (x!47479 lt!230149))))))

(assert (=> b!505088 (=> (not res!306230) (not e!295686))))

(assert (=> b!505088 e!295686))

(declare-fun res!306228 () Bool)

(assert (=> start!45704 (=> (not res!306228) (not e!295685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45704 (= res!306228 (validMask!0 mask!3524))))

(assert (=> start!45704 e!295685))

(assert (=> start!45704 true))

(declare-fun array_inv!11469 (array!32461) Bool)

(assert (=> start!45704 (array_inv!11469 a!3235)))

(declare-fun b!505083 () Bool)

(declare-fun res!306238 () Bool)

(assert (=> b!505083 (=> (not res!306238) (not e!295688))))

(assert (=> b!505083 (= res!306238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!295682 () Bool)

(declare-fun b!505089 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32461 (_ BitVec 32)) SeekEntryResult!4033)

(assert (=> b!505089 (= e!295682 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230137 (index!18322 lt!230149) (select (arr!15610 a!3235) j!176) a!3235 mask!3524) lt!230146)))))

(declare-fun b!505090 () Bool)

(declare-fun res!306234 () Bool)

(assert (=> b!505090 (=> res!306234 e!295684)))

(assert (=> b!505090 (= res!306234 e!295682)))

(declare-fun res!306231 () Bool)

(assert (=> b!505090 (=> (not res!306231) (not e!295682))))

(assert (=> b!505090 (= res!306231 (bvsgt #b00000000000000000000000000000000 (x!47479 lt!230149)))))

(assert (= (and start!45704 res!306228) b!505085))

(assert (= (and b!505085 res!306237) b!505079))

(assert (= (and b!505079 res!306235) b!505080))

(assert (= (and b!505080 res!306241) b!505076))

(assert (= (and b!505076 res!306233) b!505075))

(assert (= (and b!505075 res!306236) b!505083))

(assert (= (and b!505083 res!306238) b!505081))

(assert (= (and b!505081 res!306229) b!505082))

(assert (= (and b!505082 res!306227) b!505074))

(assert (= (and b!505082 (not res!306240)) b!505084))

(assert (= (and b!505084 c!59702) b!505088))

(assert (= (and b!505084 (not c!59702)) b!505078))

(assert (= (and b!505088 res!306230) b!505087))

(assert (= (and b!505084 (not res!306232)) b!505090))

(assert (= (and b!505090 res!306231) b!505089))

(assert (= (and b!505090 (not res!306234)) b!505077))

(assert (= (and b!505077 (not res!306239)) b!505086))

(declare-fun m!485989 () Bool)

(assert (=> b!505089 m!485989))

(assert (=> b!505089 m!485989))

(declare-fun m!485991 () Bool)

(assert (=> b!505089 m!485991))

(declare-fun m!485993 () Bool)

(assert (=> b!505084 m!485993))

(declare-fun m!485995 () Bool)

(assert (=> b!505084 m!485995))

(assert (=> b!505084 m!485989))

(declare-fun m!485997 () Bool)

(assert (=> start!45704 m!485997))

(declare-fun m!485999 () Bool)

(assert (=> start!45704 m!485999))

(declare-fun m!486001 () Bool)

(assert (=> b!505080 m!486001))

(declare-fun m!486003 () Bool)

(assert (=> b!505077 m!486003))

(declare-fun m!486005 () Bool)

(assert (=> b!505086 m!486005))

(declare-fun m!486007 () Bool)

(assert (=> b!505086 m!486007))

(declare-fun m!486009 () Bool)

(assert (=> b!505083 m!486009))

(declare-fun m!486011 () Bool)

(assert (=> b!505081 m!486011))

(assert (=> b!505079 m!485989))

(assert (=> b!505079 m!485989))

(declare-fun m!486013 () Bool)

(assert (=> b!505079 m!486013))

(declare-fun m!486015 () Bool)

(assert (=> b!505076 m!486015))

(declare-fun m!486017 () Bool)

(assert (=> b!505075 m!486017))

(assert (=> b!505074 m!485989))

(assert (=> b!505074 m!485989))

(declare-fun m!486019 () Bool)

(assert (=> b!505074 m!486019))

(declare-fun m!486021 () Bool)

(assert (=> b!505082 m!486021))

(declare-fun m!486023 () Bool)

(assert (=> b!505082 m!486023))

(declare-fun m!486025 () Bool)

(assert (=> b!505082 m!486025))

(declare-fun m!486027 () Bool)

(assert (=> b!505082 m!486027))

(assert (=> b!505082 m!485989))

(declare-fun m!486029 () Bool)

(assert (=> b!505082 m!486029))

(assert (=> b!505082 m!485989))

(assert (=> b!505082 m!485989))

(declare-fun m!486031 () Bool)

(assert (=> b!505082 m!486031))

(declare-fun m!486033 () Bool)

(assert (=> b!505082 m!486033))

(declare-fun m!486035 () Bool)

(assert (=> b!505082 m!486035))

(declare-fun m!486037 () Bool)

(assert (=> b!505088 m!486037))

(assert (=> b!505088 m!486003))

(check-sat (not b!505083) (not b!505081) (not b!505089) (not b!505076) (not b!505077) (not b!505074) (not b!505088) (not start!45704) (not b!505080) (not b!505075) (not b!505084) (not b!505079) (not b!505086) (not b!505082))
(check-sat)
