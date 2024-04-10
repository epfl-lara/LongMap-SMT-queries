; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47396 () Bool)

(assert start!47396)

(declare-fun b!521284 () Bool)

(declare-fun res!319113 () Bool)

(declare-fun e!304140 () Bool)

(assert (=> b!521284 (=> (not res!319113) (not e!304140))))

(declare-datatypes ((array!33222 0))(
  ( (array!33223 (arr!15967 (Array (_ BitVec 32) (_ BitVec 64))) (size!16331 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33222)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33222 (_ BitVec 32)) Bool)

(assert (=> b!521284 (= res!319113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521285 () Bool)

(declare-fun e!304141 () Bool)

(assert (=> b!521285 (= e!304141 false)))

(declare-fun b!521286 () Bool)

(declare-fun res!319111 () Bool)

(declare-fun e!304143 () Bool)

(assert (=> b!521286 (=> (not res!319111) (not e!304143))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521286 (= res!319111 (and (= (size!16331 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16331 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16331 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521287 () Bool)

(declare-fun e!304138 () Bool)

(declare-datatypes ((SeekEntryResult!4434 0))(
  ( (MissingZero!4434 (index!19939 (_ BitVec 32))) (Found!4434 (index!19940 (_ BitVec 32))) (Intermediate!4434 (undefined!5246 Bool) (index!19941 (_ BitVec 32)) (x!48924 (_ BitVec 32))) (Undefined!4434) (MissingVacant!4434 (index!19942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33222 (_ BitVec 32)) SeekEntryResult!4434)

(assert (=> b!521287 (= e!304138 (= (seekEntryOrOpen!0 (select (arr!15967 a!3235) j!176) a!3235 mask!3524) (Found!4434 j!176)))))

(declare-fun b!521288 () Bool)

(declare-fun res!319115 () Bool)

(assert (=> b!521288 (=> (not res!319115) (not e!304143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521288 (= res!319115 (validKeyInArray!0 (select (arr!15967 a!3235) j!176)))))

(declare-fun res!319108 () Bool)

(assert (=> start!47396 (=> (not res!319108) (not e!304143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47396 (= res!319108 (validMask!0 mask!3524))))

(assert (=> start!47396 e!304143))

(assert (=> start!47396 true))

(declare-fun array_inv!11763 (array!33222) Bool)

(assert (=> start!47396 (array_inv!11763 a!3235)))

(declare-fun b!521289 () Bool)

(declare-fun res!319107 () Bool)

(assert (=> b!521289 (=> (not res!319107) (not e!304140))))

(declare-datatypes ((List!10125 0))(
  ( (Nil!10122) (Cons!10121 (h!11043 (_ BitVec 64)) (t!16353 List!10125)) )
))
(declare-fun arrayNoDuplicates!0 (array!33222 (_ BitVec 32) List!10125) Bool)

(assert (=> b!521289 (= res!319107 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10122))))

(declare-fun b!521290 () Bool)

(declare-datatypes ((Unit!16188 0))(
  ( (Unit!16189) )
))
(declare-fun e!304139 () Unit!16188)

(declare-fun Unit!16190 () Unit!16188)

(assert (=> b!521290 (= e!304139 Unit!16190)))

(declare-fun b!521291 () Bool)

(declare-fun e!304137 () Bool)

(assert (=> b!521291 (= e!304140 (not e!304137))))

(declare-fun res!319104 () Bool)

(assert (=> b!521291 (=> res!319104 e!304137)))

(declare-fun lt!238859 () (_ BitVec 32))

(declare-fun lt!238864 () (_ BitVec 64))

(declare-fun lt!238867 () array!33222)

(declare-fun lt!238861 () SeekEntryResult!4434)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33222 (_ BitVec 32)) SeekEntryResult!4434)

(assert (=> b!521291 (= res!319104 (= lt!238861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238859 lt!238864 lt!238867 mask!3524)))))

(declare-fun lt!238866 () (_ BitVec 32))

(assert (=> b!521291 (= lt!238861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238866 (select (arr!15967 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521291 (= lt!238859 (toIndex!0 lt!238864 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!521291 (= lt!238864 (select (store (arr!15967 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521291 (= lt!238866 (toIndex!0 (select (arr!15967 a!3235) j!176) mask!3524))))

(assert (=> b!521291 (= lt!238867 (array!33223 (store (arr!15967 a!3235) i!1204 k0!2280) (size!16331 a!3235)))))

(assert (=> b!521291 e!304138))

(declare-fun res!319109 () Bool)

(assert (=> b!521291 (=> (not res!319109) (not e!304138))))

(assert (=> b!521291 (= res!319109 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238863 () Unit!16188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16188)

(assert (=> b!521291 (= lt!238863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521292 () Bool)

(declare-fun Unit!16191 () Unit!16188)

(assert (=> b!521292 (= e!304139 Unit!16191)))

(declare-fun lt!238862 () Unit!16188)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33222 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16188)

(assert (=> b!521292 (= lt!238862 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238866 #b00000000000000000000000000000000 (index!19941 lt!238861) (x!48924 lt!238861) mask!3524))))

(declare-fun res!319114 () Bool)

(assert (=> b!521292 (= res!319114 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238866 lt!238864 lt!238867 mask!3524) (Intermediate!4434 false (index!19941 lt!238861) (x!48924 lt!238861))))))

(assert (=> b!521292 (=> (not res!319114) (not e!304141))))

(assert (=> b!521292 e!304141))

(declare-fun b!521293 () Bool)

(declare-fun res!319105 () Bool)

(assert (=> b!521293 (=> res!319105 e!304137)))

(get-info :version)

(assert (=> b!521293 (= res!319105 (or (undefined!5246 lt!238861) (not ((_ is Intermediate!4434) lt!238861))))))

(declare-fun b!521294 () Bool)

(declare-fun res!319106 () Bool)

(assert (=> b!521294 (=> (not res!319106) (not e!304143))))

(declare-fun arrayContainsKey!0 (array!33222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521294 (= res!319106 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521295 () Bool)

(declare-fun res!319110 () Bool)

(assert (=> b!521295 (=> (not res!319110) (not e!304143))))

(assert (=> b!521295 (= res!319110 (validKeyInArray!0 k0!2280))))

(declare-fun b!521296 () Bool)

(assert (=> b!521296 (= e!304137 true)))

(assert (=> b!521296 (and (or (= (select (arr!15967 a!3235) (index!19941 lt!238861)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15967 a!3235) (index!19941 lt!238861)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15967 a!3235) (index!19941 lt!238861)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15967 a!3235) (index!19941 lt!238861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238865 () Unit!16188)

(assert (=> b!521296 (= lt!238865 e!304139)))

(declare-fun c!61391 () Bool)

(assert (=> b!521296 (= c!61391 (= (select (arr!15967 a!3235) (index!19941 lt!238861)) (select (arr!15967 a!3235) j!176)))))

(assert (=> b!521296 (and (bvslt (x!48924 lt!238861) #b01111111111111111111111111111110) (or (= (select (arr!15967 a!3235) (index!19941 lt!238861)) (select (arr!15967 a!3235) j!176)) (= (select (arr!15967 a!3235) (index!19941 lt!238861)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15967 a!3235) (index!19941 lt!238861)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521297 () Bool)

(assert (=> b!521297 (= e!304143 e!304140)))

(declare-fun res!319112 () Bool)

(assert (=> b!521297 (=> (not res!319112) (not e!304140))))

(declare-fun lt!238860 () SeekEntryResult!4434)

(assert (=> b!521297 (= res!319112 (or (= lt!238860 (MissingZero!4434 i!1204)) (= lt!238860 (MissingVacant!4434 i!1204))))))

(assert (=> b!521297 (= lt!238860 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47396 res!319108) b!521286))

(assert (= (and b!521286 res!319111) b!521288))

(assert (= (and b!521288 res!319115) b!521295))

(assert (= (and b!521295 res!319110) b!521294))

(assert (= (and b!521294 res!319106) b!521297))

(assert (= (and b!521297 res!319112) b!521284))

(assert (= (and b!521284 res!319113) b!521289))

(assert (= (and b!521289 res!319107) b!521291))

(assert (= (and b!521291 res!319109) b!521287))

(assert (= (and b!521291 (not res!319104)) b!521293))

(assert (= (and b!521293 (not res!319105)) b!521296))

(assert (= (and b!521296 c!61391) b!521292))

(assert (= (and b!521296 (not c!61391)) b!521290))

(assert (= (and b!521292 res!319114) b!521285))

(declare-fun m!502197 () Bool)

(assert (=> b!521288 m!502197))

(assert (=> b!521288 m!502197))

(declare-fun m!502199 () Bool)

(assert (=> b!521288 m!502199))

(declare-fun m!502201 () Bool)

(assert (=> b!521294 m!502201))

(assert (=> b!521287 m!502197))

(assert (=> b!521287 m!502197))

(declare-fun m!502203 () Bool)

(assert (=> b!521287 m!502203))

(declare-fun m!502205 () Bool)

(assert (=> b!521297 m!502205))

(declare-fun m!502207 () Bool)

(assert (=> b!521296 m!502207))

(assert (=> b!521296 m!502197))

(declare-fun m!502209 () Bool)

(assert (=> start!47396 m!502209))

(declare-fun m!502211 () Bool)

(assert (=> start!47396 m!502211))

(declare-fun m!502213 () Bool)

(assert (=> b!521289 m!502213))

(declare-fun m!502215 () Bool)

(assert (=> b!521284 m!502215))

(declare-fun m!502217 () Bool)

(assert (=> b!521295 m!502217))

(assert (=> b!521291 m!502197))

(declare-fun m!502219 () Bool)

(assert (=> b!521291 m!502219))

(declare-fun m!502221 () Bool)

(assert (=> b!521291 m!502221))

(declare-fun m!502223 () Bool)

(assert (=> b!521291 m!502223))

(declare-fun m!502225 () Bool)

(assert (=> b!521291 m!502225))

(declare-fun m!502227 () Bool)

(assert (=> b!521291 m!502227))

(assert (=> b!521291 m!502197))

(declare-fun m!502229 () Bool)

(assert (=> b!521291 m!502229))

(declare-fun m!502231 () Bool)

(assert (=> b!521291 m!502231))

(assert (=> b!521291 m!502197))

(declare-fun m!502233 () Bool)

(assert (=> b!521291 m!502233))

(declare-fun m!502235 () Bool)

(assert (=> b!521292 m!502235))

(declare-fun m!502237 () Bool)

(assert (=> b!521292 m!502237))

(check-sat (not b!521294) (not start!47396) (not b!521292) (not b!521288) (not b!521284) (not b!521295) (not b!521289) (not b!521297) (not b!521287) (not b!521291))
(check-sat)
