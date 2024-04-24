; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45662 () Bool)

(assert start!45662)

(declare-fun b!504003 () Bool)

(declare-fun res!305285 () Bool)

(declare-fun e!295116 () Bool)

(assert (=> b!504003 (=> (not res!305285) (not e!295116))))

(declare-datatypes ((array!32419 0))(
  ( (array!32420 (arr!15589 (Array (_ BitVec 32) (_ BitVec 64))) (size!15953 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32419)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504003 (= res!305285 (validKeyInArray!0 (select (arr!15589 a!3235) j!176)))))

(declare-fun b!504004 () Bool)

(declare-fun e!295114 () Bool)

(assert (=> b!504004 (= e!295116 e!295114)))

(declare-fun res!305296 () Bool)

(assert (=> b!504004 (=> (not res!305296) (not e!295114))))

(declare-datatypes ((SeekEntryResult!4012 0))(
  ( (MissingZero!4012 (index!18236 (_ BitVec 32))) (Found!4012 (index!18237 (_ BitVec 32))) (Intermediate!4012 (undefined!4824 Bool) (index!18238 (_ BitVec 32)) (x!47402 (_ BitVec 32))) (Undefined!4012) (MissingVacant!4012 (index!18239 (_ BitVec 32))) )
))
(declare-fun lt!229446 () SeekEntryResult!4012)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504004 (= res!305296 (or (= lt!229446 (MissingZero!4012 i!1204)) (= lt!229446 (MissingVacant!4012 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32419 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!504004 (= lt!229446 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504005 () Bool)

(declare-datatypes ((Unit!15283 0))(
  ( (Unit!15284) )
))
(declare-fun e!295118 () Unit!15283)

(declare-fun Unit!15285 () Unit!15283)

(assert (=> b!504005 (= e!295118 Unit!15285)))

(declare-fun e!295117 () Bool)

(declare-fun b!504006 () Bool)

(assert (=> b!504006 (= e!295117 (= (seekEntryOrOpen!0 (select (arr!15589 a!3235) j!176) a!3235 mask!3524) (Found!4012 j!176)))))

(declare-fun b!504007 () Bool)

(declare-fun e!295119 () Bool)

(assert (=> b!504007 (= e!295119 true)))

(declare-fun lt!229447 () (_ BitVec 64))

(declare-fun lt!229441 () array!32419)

(declare-fun lt!229440 () (_ BitVec 32))

(declare-fun lt!229444 () SeekEntryResult!4012)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32419 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!504007 (= lt!229444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229440 lt!229447 lt!229441 mask!3524))))

(declare-fun b!504008 () Bool)

(declare-fun res!305287 () Bool)

(assert (=> b!504008 (=> (not res!305287) (not e!295114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32419 (_ BitVec 32)) Bool)

(assert (=> b!504008 (= res!305287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!305291 () Bool)

(assert (=> start!45662 (=> (not res!305291) (not e!295116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45662 (= res!305291 (validMask!0 mask!3524))))

(assert (=> start!45662 e!295116))

(assert (=> start!45662 true))

(declare-fun array_inv!11448 (array!32419) Bool)

(assert (=> start!45662 (array_inv!11448 a!3235)))

(declare-fun b!504009 () Bool)

(declare-fun e!295121 () Bool)

(assert (=> b!504009 (= e!295121 false)))

(declare-fun b!504010 () Bool)

(declare-fun res!305295 () Bool)

(declare-fun e!295122 () Bool)

(assert (=> b!504010 (=> res!305295 e!295122)))

(declare-fun lt!229450 () SeekEntryResult!4012)

(get-info :version)

(assert (=> b!504010 (= res!305295 (or (undefined!4824 lt!229450) (not ((_ is Intermediate!4012) lt!229450))))))

(declare-fun b!504011 () Bool)

(declare-fun res!305290 () Bool)

(assert (=> b!504011 (=> (not res!305290) (not e!295114))))

(declare-datatypes ((List!9654 0))(
  ( (Nil!9651) (Cons!9650 (h!10527 (_ BitVec 64)) (t!15874 List!9654)) )
))
(declare-fun arrayNoDuplicates!0 (array!32419 (_ BitVec 32) List!9654) Bool)

(assert (=> b!504011 (= res!305290 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9651))))

(declare-fun b!504012 () Bool)

(declare-fun res!305292 () Bool)

(assert (=> b!504012 (=> res!305292 e!295119)))

(declare-fun e!295120 () Bool)

(assert (=> b!504012 (= res!305292 e!295120)))

(declare-fun res!305294 () Bool)

(assert (=> b!504012 (=> (not res!305294) (not e!295120))))

(assert (=> b!504012 (= res!305294 (bvsgt #b00000000000000000000000000000000 (x!47402 lt!229450)))))

(declare-fun b!504013 () Bool)

(assert (=> b!504013 (= e!295122 e!295119)))

(declare-fun res!305288 () Bool)

(assert (=> b!504013 (=> res!305288 e!295119)))

(assert (=> b!504013 (= res!305288 (or (bvsgt (x!47402 lt!229450) #b01111111111111111111111111111110) (bvslt lt!229440 #b00000000000000000000000000000000) (bvsge lt!229440 (size!15953 a!3235)) (bvslt (index!18238 lt!229450) #b00000000000000000000000000000000) (bvsge (index!18238 lt!229450) (size!15953 a!3235)) (not (= lt!229450 (Intermediate!4012 false (index!18238 lt!229450) (x!47402 lt!229450))))))))

(assert (=> b!504013 (= (index!18238 lt!229450) i!1204)))

(declare-fun lt!229445 () Unit!15283)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15283)

(assert (=> b!504013 (= lt!229445 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229440 #b00000000000000000000000000000000 (index!18238 lt!229450) (x!47402 lt!229450) mask!3524))))

(assert (=> b!504013 (and (or (= (select (arr!15589 a!3235) (index!18238 lt!229450)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15589 a!3235) (index!18238 lt!229450)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15589 a!3235) (index!18238 lt!229450)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15589 a!3235) (index!18238 lt!229450)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229443 () Unit!15283)

(assert (=> b!504013 (= lt!229443 e!295118)))

(declare-fun c!59639 () Bool)

(assert (=> b!504013 (= c!59639 (= (select (arr!15589 a!3235) (index!18238 lt!229450)) (select (arr!15589 a!3235) j!176)))))

(assert (=> b!504013 (and (bvslt (x!47402 lt!229450) #b01111111111111111111111111111110) (or (= (select (arr!15589 a!3235) (index!18238 lt!229450)) (select (arr!15589 a!3235) j!176)) (= (select (arr!15589 a!3235) (index!18238 lt!229450)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15589 a!3235) (index!18238 lt!229450)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504014 () Bool)

(declare-fun res!305282 () Bool)

(assert (=> b!504014 (=> (not res!305282) (not e!295116))))

(assert (=> b!504014 (= res!305282 (and (= (size!15953 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15953 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15953 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504015 () Bool)

(assert (=> b!504015 (= e!295114 (not e!295122))))

(declare-fun res!305293 () Bool)

(assert (=> b!504015 (=> res!305293 e!295122)))

(declare-fun lt!229448 () (_ BitVec 32))

(assert (=> b!504015 (= res!305293 (= lt!229450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229448 lt!229447 lt!229441 mask!3524)))))

(assert (=> b!504015 (= lt!229450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229440 (select (arr!15589 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504015 (= lt!229448 (toIndex!0 lt!229447 mask!3524))))

(assert (=> b!504015 (= lt!229447 (select (store (arr!15589 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504015 (= lt!229440 (toIndex!0 (select (arr!15589 a!3235) j!176) mask!3524))))

(assert (=> b!504015 (= lt!229441 (array!32420 (store (arr!15589 a!3235) i!1204 k0!2280) (size!15953 a!3235)))))

(assert (=> b!504015 e!295117))

(declare-fun res!305286 () Bool)

(assert (=> b!504015 (=> (not res!305286) (not e!295117))))

(assert (=> b!504015 (= res!305286 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229442 () Unit!15283)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15283)

(assert (=> b!504015 (= lt!229442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504016 () Bool)

(declare-fun res!305289 () Bool)

(assert (=> b!504016 (=> (not res!305289) (not e!295116))))

(assert (=> b!504016 (= res!305289 (validKeyInArray!0 k0!2280))))

(declare-fun b!504017 () Bool)

(declare-fun res!305284 () Bool)

(assert (=> b!504017 (=> (not res!305284) (not e!295116))))

(declare-fun arrayContainsKey!0 (array!32419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504017 (= res!305284 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504018 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32419 (_ BitVec 32)) SeekEntryResult!4012)

(assert (=> b!504018 (= e!295120 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229440 (index!18238 lt!229450) (select (arr!15589 a!3235) j!176) a!3235 mask!3524) (Found!4012 j!176))))))

(declare-fun b!504019 () Bool)

(declare-fun Unit!15286 () Unit!15283)

(assert (=> b!504019 (= e!295118 Unit!15286)))

(declare-fun lt!229449 () Unit!15283)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15283)

(assert (=> b!504019 (= lt!229449 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229440 #b00000000000000000000000000000000 (index!18238 lt!229450) (x!47402 lt!229450) mask!3524))))

(declare-fun res!305283 () Bool)

(assert (=> b!504019 (= res!305283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229440 lt!229447 lt!229441 mask!3524) (Intermediate!4012 false (index!18238 lt!229450) (x!47402 lt!229450))))))

(assert (=> b!504019 (=> (not res!305283) (not e!295121))))

(assert (=> b!504019 e!295121))

(assert (= (and start!45662 res!305291) b!504014))

(assert (= (and b!504014 res!305282) b!504003))

(assert (= (and b!504003 res!305285) b!504016))

(assert (= (and b!504016 res!305289) b!504017))

(assert (= (and b!504017 res!305284) b!504004))

(assert (= (and b!504004 res!305296) b!504008))

(assert (= (and b!504008 res!305287) b!504011))

(assert (= (and b!504011 res!305290) b!504015))

(assert (= (and b!504015 res!305286) b!504006))

(assert (= (and b!504015 (not res!305293)) b!504010))

(assert (= (and b!504010 (not res!305295)) b!504013))

(assert (= (and b!504013 c!59639) b!504019))

(assert (= (and b!504013 (not c!59639)) b!504005))

(assert (= (and b!504019 res!305283) b!504009))

(assert (= (and b!504013 (not res!305288)) b!504012))

(assert (= (and b!504012 res!305294) b!504018))

(assert (= (and b!504012 (not res!305292)) b!504007))

(declare-fun m!485023 () Bool)

(assert (=> b!504016 m!485023))

(declare-fun m!485025 () Bool)

(assert (=> b!504013 m!485025))

(declare-fun m!485027 () Bool)

(assert (=> b!504013 m!485027))

(declare-fun m!485029 () Bool)

(assert (=> b!504013 m!485029))

(declare-fun m!485031 () Bool)

(assert (=> b!504019 m!485031))

(declare-fun m!485033 () Bool)

(assert (=> b!504019 m!485033))

(assert (=> b!504018 m!485029))

(assert (=> b!504018 m!485029))

(declare-fun m!485035 () Bool)

(assert (=> b!504018 m!485035))

(assert (=> b!504003 m!485029))

(assert (=> b!504003 m!485029))

(declare-fun m!485037 () Bool)

(assert (=> b!504003 m!485037))

(declare-fun m!485039 () Bool)

(assert (=> b!504004 m!485039))

(declare-fun m!485041 () Bool)

(assert (=> b!504017 m!485041))

(declare-fun m!485043 () Bool)

(assert (=> b!504008 m!485043))

(declare-fun m!485045 () Bool)

(assert (=> b!504015 m!485045))

(declare-fun m!485047 () Bool)

(assert (=> b!504015 m!485047))

(declare-fun m!485049 () Bool)

(assert (=> b!504015 m!485049))

(assert (=> b!504015 m!485029))

(declare-fun m!485051 () Bool)

(assert (=> b!504015 m!485051))

(assert (=> b!504015 m!485029))

(declare-fun m!485053 () Bool)

(assert (=> b!504015 m!485053))

(declare-fun m!485055 () Bool)

(assert (=> b!504015 m!485055))

(assert (=> b!504015 m!485029))

(declare-fun m!485057 () Bool)

(assert (=> b!504015 m!485057))

(declare-fun m!485059 () Bool)

(assert (=> b!504015 m!485059))

(assert (=> b!504007 m!485033))

(assert (=> b!504006 m!485029))

(assert (=> b!504006 m!485029))

(declare-fun m!485061 () Bool)

(assert (=> b!504006 m!485061))

(declare-fun m!485063 () Bool)

(assert (=> start!45662 m!485063))

(declare-fun m!485065 () Bool)

(assert (=> start!45662 m!485065))

(declare-fun m!485067 () Bool)

(assert (=> b!504011 m!485067))

(check-sat (not b!504013) (not b!504004) (not start!45662) (not b!504019) (not b!504007) (not b!504018) (not b!504011) (not b!504008) (not b!504015) (not b!504017) (not b!504003) (not b!504006) (not b!504016))
(check-sat)
