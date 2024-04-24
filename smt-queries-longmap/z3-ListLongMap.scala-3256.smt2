; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45398 () Bool)

(assert start!45398)

(declare-fun b!499083 () Bool)

(declare-datatypes ((Unit!14899 0))(
  ( (Unit!14900) )
))
(declare-fun e!292479 () Unit!14899)

(declare-fun Unit!14901 () Unit!14899)

(assert (=> b!499083 (= e!292479 Unit!14901)))

(declare-fun e!292475 () Bool)

(declare-datatypes ((array!32224 0))(
  ( (array!32225 (arr!15493 (Array (_ BitVec 32) (_ BitVec 64))) (size!15857 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32224)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!499084 () Bool)

(declare-datatypes ((SeekEntryResult!3916 0))(
  ( (MissingZero!3916 (index!17846 (_ BitVec 32))) (Found!3916 (index!17847 (_ BitVec 32))) (Intermediate!3916 (undefined!4728 Bool) (index!17848 (_ BitVec 32)) (x!47038 (_ BitVec 32))) (Undefined!3916) (MissingVacant!3916 (index!17849 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32224 (_ BitVec 32)) SeekEntryResult!3916)

(assert (=> b!499084 (= e!292475 (= (seekEntryOrOpen!0 (select (arr!15493 a!3235) j!176) a!3235 mask!3524) (Found!3916 j!176)))))

(declare-fun b!499085 () Bool)

(declare-fun res!301148 () Bool)

(declare-fun e!292478 () Bool)

(assert (=> b!499085 (=> (not res!301148) (not e!292478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499085 (= res!301148 (validKeyInArray!0 (select (arr!15493 a!3235) j!176)))))

(declare-fun b!499086 () Bool)

(declare-fun res!301139 () Bool)

(declare-fun e!292476 () Bool)

(assert (=> b!499086 (=> (not res!301139) (not e!292476))))

(declare-datatypes ((List!9558 0))(
  ( (Nil!9555) (Cons!9554 (h!10428 (_ BitVec 64)) (t!15778 List!9558)) )
))
(declare-fun arrayNoDuplicates!0 (array!32224 (_ BitVec 32) List!9558) Bool)

(assert (=> b!499086 (= res!301139 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9555))))

(declare-fun b!499087 () Bool)

(declare-fun Unit!14902 () Unit!14899)

(assert (=> b!499087 (= e!292479 Unit!14902)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!226263 () Unit!14899)

(declare-fun lt!226267 () (_ BitVec 32))

(declare-fun lt!226268 () SeekEntryResult!3916)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14899)

(assert (=> b!499087 (= lt!226263 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226267 #b00000000000000000000000000000000 (index!17848 lt!226268) (x!47038 lt!226268) mask!3524))))

(declare-fun lt!226261 () array!32224)

(declare-fun lt!226264 () (_ BitVec 64))

(declare-fun res!301141 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32224 (_ BitVec 32)) SeekEntryResult!3916)

(assert (=> b!499087 (= res!301141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226267 lt!226264 lt!226261 mask!3524) (Intermediate!3916 false (index!17848 lt!226268) (x!47038 lt!226268))))))

(declare-fun e!292474 () Bool)

(assert (=> b!499087 (=> (not res!301141) (not e!292474))))

(assert (=> b!499087 e!292474))

(declare-fun b!499088 () Bool)

(declare-fun e!292477 () Bool)

(assert (=> b!499088 (= e!292476 (not e!292477))))

(declare-fun res!301145 () Bool)

(assert (=> b!499088 (=> res!301145 e!292477)))

(declare-fun lt!226266 () (_ BitVec 32))

(assert (=> b!499088 (= res!301145 (= lt!226268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226266 lt!226264 lt!226261 mask!3524)))))

(assert (=> b!499088 (= lt!226268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226267 (select (arr!15493 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499088 (= lt!226266 (toIndex!0 lt!226264 mask!3524))))

(assert (=> b!499088 (= lt!226264 (select (store (arr!15493 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499088 (= lt!226267 (toIndex!0 (select (arr!15493 a!3235) j!176) mask!3524))))

(assert (=> b!499088 (= lt!226261 (array!32225 (store (arr!15493 a!3235) i!1204 k0!2280) (size!15857 a!3235)))))

(assert (=> b!499088 e!292475))

(declare-fun res!301149 () Bool)

(assert (=> b!499088 (=> (not res!301149) (not e!292475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32224 (_ BitVec 32)) Bool)

(assert (=> b!499088 (= res!301149 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226269 () Unit!14899)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14899)

(assert (=> b!499088 (= lt!226269 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499089 () Bool)

(declare-fun res!301138 () Bool)

(assert (=> b!499089 (=> (not res!301138) (not e!292478))))

(declare-fun arrayContainsKey!0 (array!32224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499089 (= res!301138 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499090 () Bool)

(assert (=> b!499090 (= e!292478 e!292476)))

(declare-fun res!301147 () Bool)

(assert (=> b!499090 (=> (not res!301147) (not e!292476))))

(declare-fun lt!226270 () SeekEntryResult!3916)

(assert (=> b!499090 (= res!301147 (or (= lt!226270 (MissingZero!3916 i!1204)) (= lt!226270 (MissingVacant!3916 i!1204))))))

(assert (=> b!499090 (= lt!226270 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499082 () Bool)

(declare-fun res!301144 () Bool)

(assert (=> b!499082 (=> (not res!301144) (not e!292476))))

(assert (=> b!499082 (= res!301144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!301150 () Bool)

(assert (=> start!45398 (=> (not res!301150) (not e!292478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45398 (= res!301150 (validMask!0 mask!3524))))

(assert (=> start!45398 e!292478))

(assert (=> start!45398 true))

(declare-fun array_inv!11352 (array!32224) Bool)

(assert (=> start!45398 (array_inv!11352 a!3235)))

(declare-fun b!499091 () Bool)

(declare-fun res!301142 () Bool)

(assert (=> b!499091 (=> res!301142 e!292477)))

(get-info :version)

(assert (=> b!499091 (= res!301142 (or (undefined!4728 lt!226268) (not ((_ is Intermediate!3916) lt!226268))))))

(declare-fun b!499092 () Bool)

(declare-fun res!301140 () Bool)

(assert (=> b!499092 (=> (not res!301140) (not e!292478))))

(assert (=> b!499092 (= res!301140 (and (= (size!15857 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15857 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15857 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499093 () Bool)

(declare-fun res!301146 () Bool)

(assert (=> b!499093 (=> (not res!301146) (not e!292478))))

(assert (=> b!499093 (= res!301146 (validKeyInArray!0 k0!2280))))

(declare-fun b!499094 () Bool)

(declare-fun e!292473 () Bool)

(assert (=> b!499094 (= e!292473 true)))

(declare-fun lt!226265 () SeekEntryResult!3916)

(assert (=> b!499094 (= lt!226265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226267 lt!226264 lt!226261 mask!3524))))

(declare-fun b!499095 () Bool)

(assert (=> b!499095 (= e!292477 e!292473)))

(declare-fun res!301143 () Bool)

(assert (=> b!499095 (=> res!301143 e!292473)))

(assert (=> b!499095 (= res!301143 (or (bvsgt #b00000000000000000000000000000000 (x!47038 lt!226268)) (bvsgt (x!47038 lt!226268) #b01111111111111111111111111111110) (bvslt lt!226267 #b00000000000000000000000000000000) (bvsge lt!226267 (size!15857 a!3235)) (bvslt (index!17848 lt!226268) #b00000000000000000000000000000000) (bvsge (index!17848 lt!226268) (size!15857 a!3235)) (not (= lt!226268 (Intermediate!3916 false (index!17848 lt!226268) (x!47038 lt!226268))))))))

(assert (=> b!499095 (and (or (= (select (arr!15493 a!3235) (index!17848 lt!226268)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15493 a!3235) (index!17848 lt!226268)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15493 a!3235) (index!17848 lt!226268)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15493 a!3235) (index!17848 lt!226268)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226262 () Unit!14899)

(assert (=> b!499095 (= lt!226262 e!292479)))

(declare-fun c!59249 () Bool)

(assert (=> b!499095 (= c!59249 (= (select (arr!15493 a!3235) (index!17848 lt!226268)) (select (arr!15493 a!3235) j!176)))))

(assert (=> b!499095 (and (bvslt (x!47038 lt!226268) #b01111111111111111111111111111110) (or (= (select (arr!15493 a!3235) (index!17848 lt!226268)) (select (arr!15493 a!3235) j!176)) (= (select (arr!15493 a!3235) (index!17848 lt!226268)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15493 a!3235) (index!17848 lt!226268)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499096 () Bool)

(assert (=> b!499096 (= e!292474 false)))

(assert (= (and start!45398 res!301150) b!499092))

(assert (= (and b!499092 res!301140) b!499085))

(assert (= (and b!499085 res!301148) b!499093))

(assert (= (and b!499093 res!301146) b!499089))

(assert (= (and b!499089 res!301138) b!499090))

(assert (= (and b!499090 res!301147) b!499082))

(assert (= (and b!499082 res!301144) b!499086))

(assert (= (and b!499086 res!301139) b!499088))

(assert (= (and b!499088 res!301149) b!499084))

(assert (= (and b!499088 (not res!301145)) b!499091))

(assert (= (and b!499091 (not res!301142)) b!499095))

(assert (= (and b!499095 c!59249) b!499087))

(assert (= (and b!499095 (not c!59249)) b!499083))

(assert (= (and b!499087 res!301141) b!499096))

(assert (= (and b!499095 (not res!301143)) b!499094))

(declare-fun m!480547 () Bool)

(assert (=> start!45398 m!480547))

(declare-fun m!480549 () Bool)

(assert (=> start!45398 m!480549))

(declare-fun m!480551 () Bool)

(assert (=> b!499090 m!480551))

(declare-fun m!480553 () Bool)

(assert (=> b!499089 m!480553))

(declare-fun m!480555 () Bool)

(assert (=> b!499094 m!480555))

(declare-fun m!480557 () Bool)

(assert (=> b!499082 m!480557))

(declare-fun m!480559 () Bool)

(assert (=> b!499086 m!480559))

(declare-fun m!480561 () Bool)

(assert (=> b!499087 m!480561))

(assert (=> b!499087 m!480555))

(declare-fun m!480563 () Bool)

(assert (=> b!499095 m!480563))

(declare-fun m!480565 () Bool)

(assert (=> b!499095 m!480565))

(declare-fun m!480567 () Bool)

(assert (=> b!499088 m!480567))

(declare-fun m!480569 () Bool)

(assert (=> b!499088 m!480569))

(declare-fun m!480571 () Bool)

(assert (=> b!499088 m!480571))

(declare-fun m!480573 () Bool)

(assert (=> b!499088 m!480573))

(declare-fun m!480575 () Bool)

(assert (=> b!499088 m!480575))

(assert (=> b!499088 m!480565))

(declare-fun m!480577 () Bool)

(assert (=> b!499088 m!480577))

(assert (=> b!499088 m!480565))

(declare-fun m!480579 () Bool)

(assert (=> b!499088 m!480579))

(assert (=> b!499088 m!480565))

(declare-fun m!480581 () Bool)

(assert (=> b!499088 m!480581))

(assert (=> b!499085 m!480565))

(assert (=> b!499085 m!480565))

(declare-fun m!480583 () Bool)

(assert (=> b!499085 m!480583))

(assert (=> b!499084 m!480565))

(assert (=> b!499084 m!480565))

(declare-fun m!480585 () Bool)

(assert (=> b!499084 m!480585))

(declare-fun m!480587 () Bool)

(assert (=> b!499093 m!480587))

(check-sat (not b!499094) (not b!499082) (not b!499086) (not b!499084) (not b!499088) (not b!499087) (not b!499093) (not start!45398) (not b!499089) (not b!499090) (not b!499085))
(check-sat)
