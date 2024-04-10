; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65778 () Bool)

(assert start!65778)

(declare-fun b!756254 () Bool)

(declare-fun res!511306 () Bool)

(declare-fun e!421703 () Bool)

(assert (=> b!756254 (=> (not res!511306) (not e!421703))))

(declare-fun e!421709 () Bool)

(assert (=> b!756254 (= res!511306 e!421709)))

(declare-fun c!82864 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756254 (= c!82864 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756255 () Bool)

(declare-fun e!421701 () Bool)

(declare-fun e!421699 () Bool)

(assert (=> b!756255 (= e!421701 (not e!421699))))

(declare-fun res!511301 () Bool)

(assert (=> b!756255 (=> res!511301 e!421699)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7689 0))(
  ( (MissingZero!7689 (index!33124 (_ BitVec 32))) (Found!7689 (index!33125 (_ BitVec 32))) (Intermediate!7689 (undefined!8501 Bool) (index!33126 (_ BitVec 32)) (x!64023 (_ BitVec 32))) (Undefined!7689) (MissingVacant!7689 (index!33127 (_ BitVec 32))) )
))
(declare-fun lt!336695 () SeekEntryResult!7689)

(get-info :version)

(assert (=> b!756255 (= res!511301 (or (not ((_ is Intermediate!7689) lt!336695)) (bvslt x!1131 (x!64023 lt!336695)) (not (= x!1131 (x!64023 lt!336695))) (not (= index!1321 (index!33126 lt!336695)))))))

(declare-fun e!421707 () Bool)

(assert (=> b!756255 e!421707))

(declare-fun res!511290 () Bool)

(assert (=> b!756255 (=> (not res!511290) (not e!421707))))

(declare-fun lt!336697 () SeekEntryResult!7689)

(declare-fun lt!336691 () SeekEntryResult!7689)

(assert (=> b!756255 (= res!511290 (= lt!336697 lt!336691))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!756255 (= lt!336691 (Found!7689 j!159))))

(declare-datatypes ((array!41951 0))(
  ( (array!41952 (arr!20089 (Array (_ BitVec 32) (_ BitVec 64))) (size!20510 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41951)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41951 (_ BitVec 32)) SeekEntryResult!7689)

(assert (=> b!756255 (= lt!336697 (seekEntryOrOpen!0 (select (arr!20089 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41951 (_ BitVec 32)) Bool)

(assert (=> b!756255 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26136 0))(
  ( (Unit!26137) )
))
(declare-fun lt!336694 () Unit!26136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26136)

(assert (=> b!756255 (= lt!336694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756256 () Bool)

(declare-fun e!421700 () Bool)

(declare-fun lt!336693 () SeekEntryResult!7689)

(assert (=> b!756256 (= e!421700 (= lt!336697 lt!336693))))

(declare-fun b!756257 () Bool)

(declare-fun res!511296 () Bool)

(assert (=> b!756257 (=> (not res!511296) (not e!421700))))

(declare-fun lt!336698 () (_ BitVec 64))

(declare-fun lt!336690 () array!41951)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41951 (_ BitVec 32)) SeekEntryResult!7689)

(assert (=> b!756257 (= res!511296 (= (seekEntryOrOpen!0 lt!336698 lt!336690 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336698 lt!336690 mask!3328)))))

(declare-fun b!756258 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!756258 (= e!421707 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20089 a!3186) j!159) a!3186 mask!3328) lt!336691))))

(declare-fun b!756259 () Bool)

(assert (=> b!756259 (= e!421703 e!421701)))

(declare-fun res!511297 () Bool)

(assert (=> b!756259 (=> (not res!511297) (not e!421701))))

(declare-fun lt!336692 () SeekEntryResult!7689)

(assert (=> b!756259 (= res!511297 (= lt!336692 lt!336695))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41951 (_ BitVec 32)) SeekEntryResult!7689)

(assert (=> b!756259 (= lt!336695 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336698 lt!336690 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756259 (= lt!336692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336698 mask!3328) lt!336698 lt!336690 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756259 (= lt!336698 (select (store (arr!20089 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756259 (= lt!336690 (array!41952 (store (arr!20089 a!3186) i!1173 k0!2102) (size!20510 a!3186)))))

(declare-fun b!756261 () Bool)

(declare-fun res!511299 () Bool)

(declare-fun e!421708 () Bool)

(assert (=> b!756261 (=> (not res!511299) (not e!421708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756261 (= res!511299 (validKeyInArray!0 k0!2102))))

(declare-fun b!756262 () Bool)

(declare-fun e!421706 () Unit!26136)

(declare-fun Unit!26138 () Unit!26136)

(assert (=> b!756262 (= e!421706 Unit!26138)))

(assert (=> b!756262 false))

(declare-fun b!756263 () Bool)

(declare-fun e!421704 () Bool)

(assert (=> b!756263 (= e!421708 e!421704)))

(declare-fun res!511302 () Bool)

(assert (=> b!756263 (=> (not res!511302) (not e!421704))))

(declare-fun lt!336701 () SeekEntryResult!7689)

(assert (=> b!756263 (= res!511302 (or (= lt!336701 (MissingZero!7689 i!1173)) (= lt!336701 (MissingVacant!7689 i!1173))))))

(assert (=> b!756263 (= lt!336701 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756264 () Bool)

(declare-fun res!511295 () Bool)

(assert (=> b!756264 (=> (not res!511295) (not e!421704))))

(assert (=> b!756264 (= res!511295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756265 () Bool)

(declare-fun e!421698 () Bool)

(assert (=> b!756265 (= e!421699 e!421698)))

(declare-fun res!511307 () Bool)

(assert (=> b!756265 (=> res!511307 e!421698)))

(assert (=> b!756265 (= res!511307 (not (= lt!336693 lt!336691)))))

(assert (=> b!756265 (= lt!336693 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20089 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756266 () Bool)

(declare-fun res!511304 () Bool)

(assert (=> b!756266 (=> (not res!511304) (not e!421708))))

(assert (=> b!756266 (= res!511304 (and (= (size!20510 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20510 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20510 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756267 () Bool)

(declare-fun res!511298 () Bool)

(assert (=> b!756267 (=> (not res!511298) (not e!421703))))

(assert (=> b!756267 (= res!511298 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20089 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756268 () Bool)

(declare-fun res!511292 () Bool)

(assert (=> b!756268 (=> (not res!511292) (not e!421708))))

(declare-fun arrayContainsKey!0 (array!41951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756268 (= res!511292 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756269 () Bool)

(declare-fun res!511293 () Bool)

(assert (=> b!756269 (=> (not res!511293) (not e!421708))))

(assert (=> b!756269 (= res!511293 (validKeyInArray!0 (select (arr!20089 a!3186) j!159)))))

(declare-fun b!756270 () Bool)

(declare-fun lt!336699 () SeekEntryResult!7689)

(assert (=> b!756270 (= e!421709 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20089 a!3186) j!159) a!3186 mask!3328) lt!336699))))

(declare-fun b!756260 () Bool)

(declare-fun res!511294 () Bool)

(assert (=> b!756260 (=> (not res!511294) (not e!421704))))

(declare-datatypes ((List!14091 0))(
  ( (Nil!14088) (Cons!14087 (h!15159 (_ BitVec 64)) (t!20406 List!14091)) )
))
(declare-fun arrayNoDuplicates!0 (array!41951 (_ BitVec 32) List!14091) Bool)

(assert (=> b!756260 (= res!511294 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14088))))

(declare-fun res!511300 () Bool)

(assert (=> start!65778 (=> (not res!511300) (not e!421708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65778 (= res!511300 (validMask!0 mask!3328))))

(assert (=> start!65778 e!421708))

(assert (=> start!65778 true))

(declare-fun array_inv!15885 (array!41951) Bool)

(assert (=> start!65778 (array_inv!15885 a!3186)))

(declare-fun b!756271 () Bool)

(declare-fun res!511289 () Bool)

(assert (=> b!756271 (=> (not res!511289) (not e!421704))))

(assert (=> b!756271 (= res!511289 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20510 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20510 a!3186))))))

(declare-fun b!756272 () Bool)

(declare-fun e!421702 () Bool)

(assert (=> b!756272 (= e!421698 e!421702)))

(declare-fun res!511305 () Bool)

(assert (=> b!756272 (=> res!511305 e!421702)))

(declare-fun lt!336696 () (_ BitVec 64))

(assert (=> b!756272 (= res!511305 (= lt!336696 lt!336698))))

(assert (=> b!756272 (= lt!336696 (select (store (arr!20089 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756273 () Bool)

(assert (=> b!756273 (= e!421704 e!421703)))

(declare-fun res!511291 () Bool)

(assert (=> b!756273 (=> (not res!511291) (not e!421703))))

(assert (=> b!756273 (= res!511291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20089 a!3186) j!159) mask!3328) (select (arr!20089 a!3186) j!159) a!3186 mask!3328) lt!336699))))

(assert (=> b!756273 (= lt!336699 (Intermediate!7689 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756274 () Bool)

(declare-fun Unit!26139 () Unit!26136)

(assert (=> b!756274 (= e!421706 Unit!26139)))

(declare-fun b!756275 () Bool)

(assert (=> b!756275 (= e!421702 true)))

(assert (=> b!756275 e!421700))

(declare-fun res!511303 () Bool)

(assert (=> b!756275 (=> (not res!511303) (not e!421700))))

(assert (=> b!756275 (= res!511303 (= lt!336696 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336700 () Unit!26136)

(assert (=> b!756275 (= lt!336700 e!421706)))

(declare-fun c!82863 () Bool)

(assert (=> b!756275 (= c!82863 (= lt!336696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756276 () Bool)

(assert (=> b!756276 (= e!421709 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20089 a!3186) j!159) a!3186 mask!3328) (Found!7689 j!159)))))

(assert (= (and start!65778 res!511300) b!756266))

(assert (= (and b!756266 res!511304) b!756269))

(assert (= (and b!756269 res!511293) b!756261))

(assert (= (and b!756261 res!511299) b!756268))

(assert (= (and b!756268 res!511292) b!756263))

(assert (= (and b!756263 res!511302) b!756264))

(assert (= (and b!756264 res!511295) b!756260))

(assert (= (and b!756260 res!511294) b!756271))

(assert (= (and b!756271 res!511289) b!756273))

(assert (= (and b!756273 res!511291) b!756267))

(assert (= (and b!756267 res!511298) b!756254))

(assert (= (and b!756254 c!82864) b!756270))

(assert (= (and b!756254 (not c!82864)) b!756276))

(assert (= (and b!756254 res!511306) b!756259))

(assert (= (and b!756259 res!511297) b!756255))

(assert (= (and b!756255 res!511290) b!756258))

(assert (= (and b!756255 (not res!511301)) b!756265))

(assert (= (and b!756265 (not res!511307)) b!756272))

(assert (= (and b!756272 (not res!511305)) b!756275))

(assert (= (and b!756275 c!82863) b!756262))

(assert (= (and b!756275 (not c!82863)) b!756274))

(assert (= (and b!756275 res!511303) b!756257))

(assert (= (and b!756257 res!511296) b!756256))

(declare-fun m!704255 () Bool)

(assert (=> b!756270 m!704255))

(assert (=> b!756270 m!704255))

(declare-fun m!704257 () Bool)

(assert (=> b!756270 m!704257))

(declare-fun m!704259 () Bool)

(assert (=> b!756268 m!704259))

(declare-fun m!704261 () Bool)

(assert (=> start!65778 m!704261))

(declare-fun m!704263 () Bool)

(assert (=> start!65778 m!704263))

(declare-fun m!704265 () Bool)

(assert (=> b!756267 m!704265))

(declare-fun m!704267 () Bool)

(assert (=> b!756261 m!704267))

(declare-fun m!704269 () Bool)

(assert (=> b!756257 m!704269))

(declare-fun m!704271 () Bool)

(assert (=> b!756257 m!704271))

(declare-fun m!704273 () Bool)

(assert (=> b!756259 m!704273))

(declare-fun m!704275 () Bool)

(assert (=> b!756259 m!704275))

(declare-fun m!704277 () Bool)

(assert (=> b!756259 m!704277))

(assert (=> b!756259 m!704273))

(declare-fun m!704279 () Bool)

(assert (=> b!756259 m!704279))

(declare-fun m!704281 () Bool)

(assert (=> b!756259 m!704281))

(assert (=> b!756276 m!704255))

(assert (=> b!756276 m!704255))

(declare-fun m!704283 () Bool)

(assert (=> b!756276 m!704283))

(assert (=> b!756269 m!704255))

(assert (=> b!756269 m!704255))

(declare-fun m!704285 () Bool)

(assert (=> b!756269 m!704285))

(assert (=> b!756265 m!704255))

(assert (=> b!756265 m!704255))

(assert (=> b!756265 m!704283))

(assert (=> b!756272 m!704279))

(declare-fun m!704287 () Bool)

(assert (=> b!756272 m!704287))

(assert (=> b!756255 m!704255))

(assert (=> b!756255 m!704255))

(declare-fun m!704289 () Bool)

(assert (=> b!756255 m!704289))

(declare-fun m!704291 () Bool)

(assert (=> b!756255 m!704291))

(declare-fun m!704293 () Bool)

(assert (=> b!756255 m!704293))

(assert (=> b!756258 m!704255))

(assert (=> b!756258 m!704255))

(declare-fun m!704295 () Bool)

(assert (=> b!756258 m!704295))

(assert (=> b!756273 m!704255))

(assert (=> b!756273 m!704255))

(declare-fun m!704297 () Bool)

(assert (=> b!756273 m!704297))

(assert (=> b!756273 m!704297))

(assert (=> b!756273 m!704255))

(declare-fun m!704299 () Bool)

(assert (=> b!756273 m!704299))

(declare-fun m!704301 () Bool)

(assert (=> b!756264 m!704301))

(declare-fun m!704303 () Bool)

(assert (=> b!756260 m!704303))

(declare-fun m!704305 () Bool)

(assert (=> b!756263 m!704305))

(check-sat (not b!756273) (not b!756258) (not b!756261) (not b!756265) (not b!756269) (not b!756255) (not b!756257) (not b!756263) (not b!756270) (not b!756259) (not b!756268) (not start!65778) (not b!756264) (not b!756276) (not b!756260))
(check-sat)
