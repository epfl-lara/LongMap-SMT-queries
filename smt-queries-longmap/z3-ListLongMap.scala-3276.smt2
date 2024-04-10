; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45602 () Bool)

(assert start!45602)

(declare-fun b!502279 () Bool)

(declare-fun e!294213 () Bool)

(assert (=> b!502279 (= e!294213 false)))

(declare-fun b!502280 () Bool)

(declare-fun res!303717 () Bool)

(declare-fun e!294208 () Bool)

(assert (=> b!502280 (=> (not res!303717) (not e!294208))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32358 0))(
  ( (array!32359 (arr!15559 (Array (_ BitVec 32) (_ BitVec 64))) (size!15923 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32358)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!502280 (= res!303717 (and (= (size!15923 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15923 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15923 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502281 () Bool)

(declare-datatypes ((Unit!15180 0))(
  ( (Unit!15181) )
))
(declare-fun e!294211 () Unit!15180)

(declare-fun Unit!15182 () Unit!15180)

(assert (=> b!502281 (= e!294211 Unit!15182)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!228278 () Unit!15180)

(declare-fun lt!228273 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4026 0))(
  ( (MissingZero!4026 (index!18292 (_ BitVec 32))) (Found!4026 (index!18293 (_ BitVec 32))) (Intermediate!4026 (undefined!4838 Bool) (index!18294 (_ BitVec 32)) (x!47323 (_ BitVec 32))) (Undefined!4026) (MissingVacant!4026 (index!18295 (_ BitVec 32))) )
))
(declare-fun lt!228280 () SeekEntryResult!4026)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32358 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15180)

(assert (=> b!502281 (= lt!228278 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228273 #b00000000000000000000000000000000 (index!18294 lt!228280) (x!47323 lt!228280) mask!3524))))

(declare-fun res!303725 () Bool)

(declare-fun lt!228279 () (_ BitVec 64))

(declare-fun lt!228282 () array!32358)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32358 (_ BitVec 32)) SeekEntryResult!4026)

(assert (=> b!502281 (= res!303725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228273 lt!228279 lt!228282 mask!3524) (Intermediate!4026 false (index!18294 lt!228280) (x!47323 lt!228280))))))

(assert (=> b!502281 (=> (not res!303725) (not e!294213))))

(assert (=> b!502281 e!294213))

(declare-fun b!502282 () Bool)

(declare-fun e!294209 () Bool)

(assert (=> b!502282 (= e!294209 true)))

(declare-fun lt!228276 () SeekEntryResult!4026)

(assert (=> b!502282 (= lt!228276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228273 lt!228279 lt!228282 mask!3524))))

(declare-fun b!502283 () Bool)

(declare-fun Unit!15183 () Unit!15180)

(assert (=> b!502283 (= e!294211 Unit!15183)))

(declare-fun b!502284 () Bool)

(declare-fun res!303716 () Bool)

(declare-fun e!294210 () Bool)

(assert (=> b!502284 (=> (not res!303716) (not e!294210))))

(declare-datatypes ((List!9717 0))(
  ( (Nil!9714) (Cons!9713 (h!10590 (_ BitVec 64)) (t!15945 List!9717)) )
))
(declare-fun arrayNoDuplicates!0 (array!32358 (_ BitVec 32) List!9717) Bool)

(assert (=> b!502284 (= res!303716 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9714))))

(declare-fun b!502285 () Bool)

(declare-fun res!303719 () Bool)

(assert (=> b!502285 (=> res!303719 e!294209)))

(declare-fun e!294215 () Bool)

(assert (=> b!502285 (= res!303719 e!294215)))

(declare-fun res!303722 () Bool)

(assert (=> b!502285 (=> (not res!303722) (not e!294215))))

(assert (=> b!502285 (= res!303722 (bvsgt #b00000000000000000000000000000000 (x!47323 lt!228280)))))

(declare-fun b!502286 () Bool)

(declare-fun res!303721 () Bool)

(declare-fun e!294214 () Bool)

(assert (=> b!502286 (=> res!303721 e!294214)))

(get-info :version)

(assert (=> b!502286 (= res!303721 (or (undefined!4838 lt!228280) (not ((_ is Intermediate!4026) lt!228280))))))

(declare-fun b!502288 () Bool)

(declare-fun res!303720 () Bool)

(assert (=> b!502288 (=> (not res!303720) (not e!294208))))

(declare-fun arrayContainsKey!0 (array!32358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502288 (= res!303720 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun e!294216 () Bool)

(declare-fun b!502289 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32358 (_ BitVec 32)) SeekEntryResult!4026)

(assert (=> b!502289 (= e!294216 (= (seekEntryOrOpen!0 (select (arr!15559 a!3235) j!176) a!3235 mask!3524) (Found!4026 j!176)))))

(declare-fun b!502290 () Bool)

(assert (=> b!502290 (= e!294214 e!294209)))

(declare-fun res!303715 () Bool)

(assert (=> b!502290 (=> res!303715 e!294209)))

(assert (=> b!502290 (= res!303715 (or (bvsgt (x!47323 lt!228280) #b01111111111111111111111111111110) (bvslt lt!228273 #b00000000000000000000000000000000) (bvsge lt!228273 (size!15923 a!3235)) (bvslt (index!18294 lt!228280) #b00000000000000000000000000000000) (bvsge (index!18294 lt!228280) (size!15923 a!3235)) (not (= lt!228280 (Intermediate!4026 false (index!18294 lt!228280) (x!47323 lt!228280))))))))

(assert (=> b!502290 (= (index!18294 lt!228280) i!1204)))

(declare-fun lt!228277 () Unit!15180)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32358 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15180)

(assert (=> b!502290 (= lt!228277 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228273 #b00000000000000000000000000000000 (index!18294 lt!228280) (x!47323 lt!228280) mask!3524))))

(assert (=> b!502290 (and (or (= (select (arr!15559 a!3235) (index!18294 lt!228280)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15559 a!3235) (index!18294 lt!228280)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15559 a!3235) (index!18294 lt!228280)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15559 a!3235) (index!18294 lt!228280)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228283 () Unit!15180)

(assert (=> b!502290 (= lt!228283 e!294211)))

(declare-fun c!59561 () Bool)

(assert (=> b!502290 (= c!59561 (= (select (arr!15559 a!3235) (index!18294 lt!228280)) (select (arr!15559 a!3235) j!176)))))

(assert (=> b!502290 (and (bvslt (x!47323 lt!228280) #b01111111111111111111111111111110) (or (= (select (arr!15559 a!3235) (index!18294 lt!228280)) (select (arr!15559 a!3235) j!176)) (= (select (arr!15559 a!3235) (index!18294 lt!228280)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15559 a!3235) (index!18294 lt!228280)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502291 () Bool)

(declare-fun res!303727 () Bool)

(assert (=> b!502291 (=> (not res!303727) (not e!294208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502291 (= res!303727 (validKeyInArray!0 k0!2280))))

(declare-fun b!502292 () Bool)

(assert (=> b!502292 (= e!294208 e!294210)))

(declare-fun res!303723 () Bool)

(assert (=> b!502292 (=> (not res!303723) (not e!294210))))

(declare-fun lt!228281 () SeekEntryResult!4026)

(assert (=> b!502292 (= res!303723 (or (= lt!228281 (MissingZero!4026 i!1204)) (= lt!228281 (MissingVacant!4026 i!1204))))))

(assert (=> b!502292 (= lt!228281 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502293 () Bool)

(assert (=> b!502293 (= e!294210 (not e!294214))))

(declare-fun res!303726 () Bool)

(assert (=> b!502293 (=> res!303726 e!294214)))

(declare-fun lt!228275 () (_ BitVec 32))

(assert (=> b!502293 (= res!303726 (= lt!228280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228275 lt!228279 lt!228282 mask!3524)))))

(assert (=> b!502293 (= lt!228280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228273 (select (arr!15559 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502293 (= lt!228275 (toIndex!0 lt!228279 mask!3524))))

(assert (=> b!502293 (= lt!228279 (select (store (arr!15559 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502293 (= lt!228273 (toIndex!0 (select (arr!15559 a!3235) j!176) mask!3524))))

(assert (=> b!502293 (= lt!228282 (array!32359 (store (arr!15559 a!3235) i!1204 k0!2280) (size!15923 a!3235)))))

(assert (=> b!502293 e!294216))

(declare-fun res!303724 () Bool)

(assert (=> b!502293 (=> (not res!303724) (not e!294216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32358 (_ BitVec 32)) Bool)

(assert (=> b!502293 (= res!303724 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228274 () Unit!15180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15180)

(assert (=> b!502293 (= lt!228274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502287 () Bool)

(declare-fun res!303728 () Bool)

(assert (=> b!502287 (=> (not res!303728) (not e!294210))))

(assert (=> b!502287 (= res!303728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!303718 () Bool)

(assert (=> start!45602 (=> (not res!303718) (not e!294208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45602 (= res!303718 (validMask!0 mask!3524))))

(assert (=> start!45602 e!294208))

(assert (=> start!45602 true))

(declare-fun array_inv!11355 (array!32358) Bool)

(assert (=> start!45602 (array_inv!11355 a!3235)))

(declare-fun b!502294 () Bool)

(declare-fun res!303714 () Bool)

(assert (=> b!502294 (=> (not res!303714) (not e!294208))))

(assert (=> b!502294 (= res!303714 (validKeyInArray!0 (select (arr!15559 a!3235) j!176)))))

(declare-fun b!502295 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32358 (_ BitVec 32)) SeekEntryResult!4026)

(assert (=> b!502295 (= e!294215 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228273 (index!18294 lt!228280) (select (arr!15559 a!3235) j!176) a!3235 mask!3524) (Found!4026 j!176))))))

(assert (= (and start!45602 res!303718) b!502280))

(assert (= (and b!502280 res!303717) b!502294))

(assert (= (and b!502294 res!303714) b!502291))

(assert (= (and b!502291 res!303727) b!502288))

(assert (= (and b!502288 res!303720) b!502292))

(assert (= (and b!502292 res!303723) b!502287))

(assert (= (and b!502287 res!303728) b!502284))

(assert (= (and b!502284 res!303716) b!502293))

(assert (= (and b!502293 res!303724) b!502289))

(assert (= (and b!502293 (not res!303726)) b!502286))

(assert (= (and b!502286 (not res!303721)) b!502290))

(assert (= (and b!502290 c!59561) b!502281))

(assert (= (and b!502290 (not c!59561)) b!502283))

(assert (= (and b!502281 res!303725) b!502279))

(assert (= (and b!502290 (not res!303715)) b!502285))

(assert (= (and b!502285 res!303722) b!502295))

(assert (= (and b!502285 (not res!303719)) b!502282))

(declare-fun m!483229 () Bool)

(assert (=> b!502287 m!483229))

(declare-fun m!483231 () Bool)

(assert (=> start!45602 m!483231))

(declare-fun m!483233 () Bool)

(assert (=> start!45602 m!483233))

(declare-fun m!483235 () Bool)

(assert (=> b!502282 m!483235))

(declare-fun m!483237 () Bool)

(assert (=> b!502289 m!483237))

(assert (=> b!502289 m!483237))

(declare-fun m!483239 () Bool)

(assert (=> b!502289 m!483239))

(declare-fun m!483241 () Bool)

(assert (=> b!502281 m!483241))

(assert (=> b!502281 m!483235))

(declare-fun m!483243 () Bool)

(assert (=> b!502292 m!483243))

(declare-fun m!483245 () Bool)

(assert (=> b!502284 m!483245))

(declare-fun m!483247 () Bool)

(assert (=> b!502290 m!483247))

(declare-fun m!483249 () Bool)

(assert (=> b!502290 m!483249))

(assert (=> b!502290 m!483237))

(declare-fun m!483251 () Bool)

(assert (=> b!502293 m!483251))

(declare-fun m!483253 () Bool)

(assert (=> b!502293 m!483253))

(declare-fun m!483255 () Bool)

(assert (=> b!502293 m!483255))

(assert (=> b!502293 m!483237))

(declare-fun m!483257 () Bool)

(assert (=> b!502293 m!483257))

(assert (=> b!502293 m!483237))

(declare-fun m!483259 () Bool)

(assert (=> b!502293 m!483259))

(assert (=> b!502293 m!483237))

(declare-fun m!483261 () Bool)

(assert (=> b!502293 m!483261))

(declare-fun m!483263 () Bool)

(assert (=> b!502293 m!483263))

(declare-fun m!483265 () Bool)

(assert (=> b!502293 m!483265))

(assert (=> b!502295 m!483237))

(assert (=> b!502295 m!483237))

(declare-fun m!483267 () Bool)

(assert (=> b!502295 m!483267))

(declare-fun m!483269 () Bool)

(assert (=> b!502291 m!483269))

(declare-fun m!483271 () Bool)

(assert (=> b!502288 m!483271))

(assert (=> b!502294 m!483237))

(assert (=> b!502294 m!483237))

(declare-fun m!483273 () Bool)

(assert (=> b!502294 m!483273))

(check-sat (not b!502291) (not b!502288) (not b!502290) (not b!502281) (not b!502289) (not b!502293) (not b!502295) (not b!502287) (not b!502294) (not b!502282) (not start!45602) (not b!502284) (not b!502292))
(check-sat)
