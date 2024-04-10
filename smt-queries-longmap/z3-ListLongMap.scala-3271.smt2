; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45500 () Bool)

(assert start!45500)

(declare-fun res!302926 () Bool)

(declare-fun e!293602 () Bool)

(assert (=> start!45500 (=> (not res!302926) (not e!293602))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45500 (= res!302926 (validMask!0 mask!3524))))

(assert (=> start!45500 e!293602))

(assert (=> start!45500 true))

(declare-datatypes ((array!32325 0))(
  ( (array!32326 (arr!15544 (Array (_ BitVec 32) (_ BitVec 64))) (size!15908 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32325)

(declare-fun array_inv!11340 (array!32325) Bool)

(assert (=> start!45500 (array_inv!11340 a!3235)))

(declare-fun b!501199 () Bool)

(declare-fun res!302930 () Bool)

(assert (=> b!501199 (=> (not res!302930) (not e!293602))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501199 (= res!302930 (and (= (size!15908 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15908 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15908 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501200 () Bool)

(declare-fun res!302931 () Bool)

(declare-fun e!293606 () Bool)

(assert (=> b!501200 (=> res!302931 e!293606)))

(declare-datatypes ((SeekEntryResult!4011 0))(
  ( (MissingZero!4011 (index!18226 (_ BitVec 32))) (Found!4011 (index!18227 (_ BitVec 32))) (Intermediate!4011 (undefined!4823 Bool) (index!18228 (_ BitVec 32)) (x!47256 (_ BitVec 32))) (Undefined!4011) (MissingVacant!4011 (index!18229 (_ BitVec 32))) )
))
(declare-fun lt!227630 () SeekEntryResult!4011)

(get-info :version)

(assert (=> b!501200 (= res!302931 (or (undefined!4823 lt!227630) (not ((_ is Intermediate!4011) lt!227630))))))

(declare-fun b!501201 () Bool)

(declare-fun e!293603 () Bool)

(assert (=> b!501201 (= e!293603 false)))

(declare-fun b!501202 () Bool)

(declare-datatypes ((Unit!15120 0))(
  ( (Unit!15121) )
))
(declare-fun e!293607 () Unit!15120)

(declare-fun Unit!15122 () Unit!15120)

(assert (=> b!501202 (= e!293607 Unit!15122)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!227629 () Unit!15120)

(declare-fun lt!227631 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15120)

(assert (=> b!501202 (= lt!227629 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227631 #b00000000000000000000000000000000 (index!18228 lt!227630) (x!47256 lt!227630) mask!3524))))

(declare-fun lt!227638 () array!32325)

(declare-fun res!302936 () Bool)

(declare-fun lt!227634 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32325 (_ BitVec 32)) SeekEntryResult!4011)

(assert (=> b!501202 (= res!302936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227631 lt!227634 lt!227638 mask!3524) (Intermediate!4011 false (index!18228 lt!227630) (x!47256 lt!227630))))))

(assert (=> b!501202 (=> (not res!302936) (not e!293603))))

(assert (=> b!501202 e!293603))

(declare-fun b!501203 () Bool)

(declare-fun e!293605 () Bool)

(assert (=> b!501203 (= e!293605 (not e!293606))))

(declare-fun res!302927 () Bool)

(assert (=> b!501203 (=> res!302927 e!293606)))

(declare-fun lt!227636 () (_ BitVec 32))

(assert (=> b!501203 (= res!302927 (= lt!227630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227636 lt!227634 lt!227638 mask!3524)))))

(assert (=> b!501203 (= lt!227630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227631 (select (arr!15544 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501203 (= lt!227636 (toIndex!0 lt!227634 mask!3524))))

(assert (=> b!501203 (= lt!227634 (select (store (arr!15544 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!501203 (= lt!227631 (toIndex!0 (select (arr!15544 a!3235) j!176) mask!3524))))

(assert (=> b!501203 (= lt!227638 (array!32326 (store (arr!15544 a!3235) i!1204 k0!2280) (size!15908 a!3235)))))

(declare-fun e!293604 () Bool)

(assert (=> b!501203 e!293604))

(declare-fun res!302933 () Bool)

(assert (=> b!501203 (=> (not res!302933) (not e!293604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32325 (_ BitVec 32)) Bool)

(assert (=> b!501203 (= res!302933 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227635 () Unit!15120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15120)

(assert (=> b!501203 (= lt!227635 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501204 () Bool)

(declare-fun res!302934 () Bool)

(assert (=> b!501204 (=> (not res!302934) (not e!293602))))

(declare-fun arrayContainsKey!0 (array!32325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501204 (= res!302934 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!501205 () Bool)

(declare-fun res!302928 () Bool)

(assert (=> b!501205 (=> (not res!302928) (not e!293605))))

(declare-datatypes ((List!9702 0))(
  ( (Nil!9699) (Cons!9698 (h!10572 (_ BitVec 64)) (t!15930 List!9702)) )
))
(declare-fun arrayNoDuplicates!0 (array!32325 (_ BitVec 32) List!9702) Bool)

(assert (=> b!501205 (= res!302928 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9699))))

(declare-fun b!501206 () Bool)

(declare-fun res!302932 () Bool)

(assert (=> b!501206 (=> (not res!302932) (not e!293605))))

(assert (=> b!501206 (= res!302932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501207 () Bool)

(assert (=> b!501207 (= e!293606 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!501207 (= (index!18228 lt!227630) i!1204)))

(declare-fun lt!227633 () Unit!15120)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15120)

(assert (=> b!501207 (= lt!227633 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227631 #b00000000000000000000000000000000 (index!18228 lt!227630) (x!47256 lt!227630) mask!3524))))

(assert (=> b!501207 (and (or (= (select (arr!15544 a!3235) (index!18228 lt!227630)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15544 a!3235) (index!18228 lt!227630)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15544 a!3235) (index!18228 lt!227630)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15544 a!3235) (index!18228 lt!227630)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227637 () Unit!15120)

(assert (=> b!501207 (= lt!227637 e!293607)))

(declare-fun c!59414 () Bool)

(assert (=> b!501207 (= c!59414 (= (select (arr!15544 a!3235) (index!18228 lt!227630)) (select (arr!15544 a!3235) j!176)))))

(assert (=> b!501207 (and (bvslt (x!47256 lt!227630) #b01111111111111111111111111111110) (or (= (select (arr!15544 a!3235) (index!18228 lt!227630)) (select (arr!15544 a!3235) j!176)) (= (select (arr!15544 a!3235) (index!18228 lt!227630)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15544 a!3235) (index!18228 lt!227630)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501208 () Bool)

(assert (=> b!501208 (= e!293602 e!293605)))

(declare-fun res!302929 () Bool)

(assert (=> b!501208 (=> (not res!302929) (not e!293605))))

(declare-fun lt!227632 () SeekEntryResult!4011)

(assert (=> b!501208 (= res!302929 (or (= lt!227632 (MissingZero!4011 i!1204)) (= lt!227632 (MissingVacant!4011 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32325 (_ BitVec 32)) SeekEntryResult!4011)

(assert (=> b!501208 (= lt!227632 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!501209 () Bool)

(declare-fun res!302925 () Bool)

(assert (=> b!501209 (=> (not res!302925) (not e!293602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501209 (= res!302925 (validKeyInArray!0 k0!2280))))

(declare-fun b!501210 () Bool)

(assert (=> b!501210 (= e!293604 (= (seekEntryOrOpen!0 (select (arr!15544 a!3235) j!176) a!3235 mask!3524) (Found!4011 j!176)))))

(declare-fun b!501211 () Bool)

(declare-fun Unit!15123 () Unit!15120)

(assert (=> b!501211 (= e!293607 Unit!15123)))

(declare-fun b!501212 () Bool)

(declare-fun res!302935 () Bool)

(assert (=> b!501212 (=> (not res!302935) (not e!293602))))

(assert (=> b!501212 (= res!302935 (validKeyInArray!0 (select (arr!15544 a!3235) j!176)))))

(assert (= (and start!45500 res!302926) b!501199))

(assert (= (and b!501199 res!302930) b!501212))

(assert (= (and b!501212 res!302935) b!501209))

(assert (= (and b!501209 res!302925) b!501204))

(assert (= (and b!501204 res!302934) b!501208))

(assert (= (and b!501208 res!302929) b!501206))

(assert (= (and b!501206 res!302932) b!501205))

(assert (= (and b!501205 res!302928) b!501203))

(assert (= (and b!501203 res!302933) b!501210))

(assert (= (and b!501203 (not res!302927)) b!501200))

(assert (= (and b!501200 (not res!302931)) b!501207))

(assert (= (and b!501207 c!59414) b!501202))

(assert (= (and b!501207 (not c!59414)) b!501211))

(assert (= (and b!501202 res!302936) b!501201))

(declare-fun m!482303 () Bool)

(assert (=> b!501205 m!482303))

(declare-fun m!482305 () Bool)

(assert (=> b!501202 m!482305))

(declare-fun m!482307 () Bool)

(assert (=> b!501202 m!482307))

(declare-fun m!482309 () Bool)

(assert (=> b!501210 m!482309))

(assert (=> b!501210 m!482309))

(declare-fun m!482311 () Bool)

(assert (=> b!501210 m!482311))

(declare-fun m!482313 () Bool)

(assert (=> b!501207 m!482313))

(declare-fun m!482315 () Bool)

(assert (=> b!501207 m!482315))

(assert (=> b!501207 m!482309))

(declare-fun m!482317 () Bool)

(assert (=> b!501203 m!482317))

(declare-fun m!482319 () Bool)

(assert (=> b!501203 m!482319))

(declare-fun m!482321 () Bool)

(assert (=> b!501203 m!482321))

(declare-fun m!482323 () Bool)

(assert (=> b!501203 m!482323))

(declare-fun m!482325 () Bool)

(assert (=> b!501203 m!482325))

(assert (=> b!501203 m!482309))

(declare-fun m!482327 () Bool)

(assert (=> b!501203 m!482327))

(assert (=> b!501203 m!482309))

(declare-fun m!482329 () Bool)

(assert (=> b!501203 m!482329))

(assert (=> b!501203 m!482309))

(declare-fun m!482331 () Bool)

(assert (=> b!501203 m!482331))

(declare-fun m!482333 () Bool)

(assert (=> b!501209 m!482333))

(declare-fun m!482335 () Bool)

(assert (=> b!501204 m!482335))

(declare-fun m!482337 () Bool)

(assert (=> b!501206 m!482337))

(declare-fun m!482339 () Bool)

(assert (=> b!501208 m!482339))

(assert (=> b!501212 m!482309))

(assert (=> b!501212 m!482309))

(declare-fun m!482341 () Bool)

(assert (=> b!501212 m!482341))

(declare-fun m!482343 () Bool)

(assert (=> start!45500 m!482343))

(declare-fun m!482345 () Bool)

(assert (=> start!45500 m!482345))

(check-sat (not b!501205) (not b!501208) (not b!501210) (not b!501203) (not b!501212) (not b!501209) (not start!45500) (not b!501204) (not b!501207) (not b!501206) (not b!501202))
(check-sat)
(get-model)

(declare-fun b!501265 () Bool)

(declare-fun e!293640 () Bool)

(declare-fun contains!2717 (List!9702 (_ BitVec 64)) Bool)

(assert (=> b!501265 (= e!293640 (contains!2717 Nil!9699 (select (arr!15544 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501266 () Bool)

(declare-fun e!293639 () Bool)

(declare-fun e!293638 () Bool)

(assert (=> b!501266 (= e!293639 e!293638)))

(declare-fun c!59420 () Bool)

(assert (=> b!501266 (= c!59420 (validKeyInArray!0 (select (arr!15544 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!501267 () Bool)

(declare-fun call!31454 () Bool)

(assert (=> b!501267 (= e!293638 call!31454)))

(declare-fun b!501268 () Bool)

(declare-fun e!293637 () Bool)

(assert (=> b!501268 (= e!293637 e!293639)))

(declare-fun res!302980 () Bool)

(assert (=> b!501268 (=> (not res!302980) (not e!293639))))

(assert (=> b!501268 (= res!302980 (not e!293640))))

(declare-fun res!302981 () Bool)

(assert (=> b!501268 (=> (not res!302981) (not e!293640))))

(assert (=> b!501268 (= res!302981 (validKeyInArray!0 (select (arr!15544 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31451 () Bool)

(assert (=> bm!31451 (= call!31454 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59420 (Cons!9698 (select (arr!15544 a!3235) #b00000000000000000000000000000000) Nil!9699) Nil!9699)))))

(declare-fun b!501269 () Bool)

(assert (=> b!501269 (= e!293638 call!31454)))

(declare-fun d!78525 () Bool)

(declare-fun res!302979 () Bool)

(assert (=> d!78525 (=> res!302979 e!293637)))

(assert (=> d!78525 (= res!302979 (bvsge #b00000000000000000000000000000000 (size!15908 a!3235)))))

(assert (=> d!78525 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9699) e!293637)))

(assert (= (and d!78525 (not res!302979)) b!501268))

(assert (= (and b!501268 res!302981) b!501265))

(assert (= (and b!501268 res!302980) b!501266))

(assert (= (and b!501266 c!59420) b!501267))

(assert (= (and b!501266 (not c!59420)) b!501269))

(assert (= (or b!501267 b!501269) bm!31451))

(declare-fun m!482391 () Bool)

(assert (=> b!501265 m!482391))

(assert (=> b!501265 m!482391))

(declare-fun m!482393 () Bool)

(assert (=> b!501265 m!482393))

(assert (=> b!501266 m!482391))

(assert (=> b!501266 m!482391))

(declare-fun m!482395 () Bool)

(assert (=> b!501266 m!482395))

(assert (=> b!501268 m!482391))

(assert (=> b!501268 m!482391))

(assert (=> b!501268 m!482395))

(assert (=> bm!31451 m!482391))

(declare-fun m!482397 () Bool)

(assert (=> bm!31451 m!482397))

(assert (=> b!501205 d!78525))

(declare-fun b!501282 () Bool)

(declare-fun e!293648 () SeekEntryResult!4011)

(declare-fun e!293647 () SeekEntryResult!4011)

(assert (=> b!501282 (= e!293648 e!293647)))

(declare-fun lt!227676 () (_ BitVec 64))

(declare-fun lt!227675 () SeekEntryResult!4011)

(assert (=> b!501282 (= lt!227676 (select (arr!15544 a!3235) (index!18228 lt!227675)))))

(declare-fun c!59428 () Bool)

(assert (=> b!501282 (= c!59428 (= lt!227676 (select (arr!15544 a!3235) j!176)))))

(declare-fun b!501283 () Bool)

(declare-fun e!293649 () SeekEntryResult!4011)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32325 (_ BitVec 32)) SeekEntryResult!4011)

(assert (=> b!501283 (= e!293649 (seekKeyOrZeroReturnVacant!0 (x!47256 lt!227675) (index!18228 lt!227675) (index!18228 lt!227675) (select (arr!15544 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78527 () Bool)

(declare-fun lt!227677 () SeekEntryResult!4011)

(assert (=> d!78527 (and (or ((_ is Undefined!4011) lt!227677) (not ((_ is Found!4011) lt!227677)) (and (bvsge (index!18227 lt!227677) #b00000000000000000000000000000000) (bvslt (index!18227 lt!227677) (size!15908 a!3235)))) (or ((_ is Undefined!4011) lt!227677) ((_ is Found!4011) lt!227677) (not ((_ is MissingZero!4011) lt!227677)) (and (bvsge (index!18226 lt!227677) #b00000000000000000000000000000000) (bvslt (index!18226 lt!227677) (size!15908 a!3235)))) (or ((_ is Undefined!4011) lt!227677) ((_ is Found!4011) lt!227677) ((_ is MissingZero!4011) lt!227677) (not ((_ is MissingVacant!4011) lt!227677)) (and (bvsge (index!18229 lt!227677) #b00000000000000000000000000000000) (bvslt (index!18229 lt!227677) (size!15908 a!3235)))) (or ((_ is Undefined!4011) lt!227677) (ite ((_ is Found!4011) lt!227677) (= (select (arr!15544 a!3235) (index!18227 lt!227677)) (select (arr!15544 a!3235) j!176)) (ite ((_ is MissingZero!4011) lt!227677) (= (select (arr!15544 a!3235) (index!18226 lt!227677)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4011) lt!227677) (= (select (arr!15544 a!3235) (index!18229 lt!227677)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78527 (= lt!227677 e!293648)))

(declare-fun c!59427 () Bool)

(assert (=> d!78527 (= c!59427 (and ((_ is Intermediate!4011) lt!227675) (undefined!4823 lt!227675)))))

(assert (=> d!78527 (= lt!227675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15544 a!3235) j!176) mask!3524) (select (arr!15544 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78527 (validMask!0 mask!3524)))

(assert (=> d!78527 (= (seekEntryOrOpen!0 (select (arr!15544 a!3235) j!176) a!3235 mask!3524) lt!227677)))

(declare-fun b!501284 () Bool)

(assert (=> b!501284 (= e!293648 Undefined!4011)))

(declare-fun b!501285 () Bool)

(declare-fun c!59429 () Bool)

(assert (=> b!501285 (= c!59429 (= lt!227676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501285 (= e!293647 e!293649)))

(declare-fun b!501286 () Bool)

(assert (=> b!501286 (= e!293647 (Found!4011 (index!18228 lt!227675)))))

(declare-fun b!501287 () Bool)

(assert (=> b!501287 (= e!293649 (MissingZero!4011 (index!18228 lt!227675)))))

(assert (= (and d!78527 c!59427) b!501284))

(assert (= (and d!78527 (not c!59427)) b!501282))

(assert (= (and b!501282 c!59428) b!501286))

(assert (= (and b!501282 (not c!59428)) b!501285))

(assert (= (and b!501285 c!59429) b!501287))

(assert (= (and b!501285 (not c!59429)) b!501283))

(declare-fun m!482399 () Bool)

(assert (=> b!501282 m!482399))

(assert (=> b!501283 m!482309))

(declare-fun m!482401 () Bool)

(assert (=> b!501283 m!482401))

(assert (=> d!78527 m!482309))

(assert (=> d!78527 m!482327))

(declare-fun m!482403 () Bool)

(assert (=> d!78527 m!482403))

(declare-fun m!482405 () Bool)

(assert (=> d!78527 m!482405))

(assert (=> d!78527 m!482327))

(assert (=> d!78527 m!482309))

(declare-fun m!482407 () Bool)

(assert (=> d!78527 m!482407))

(declare-fun m!482409 () Bool)

(assert (=> d!78527 m!482409))

(assert (=> d!78527 m!482343))

(assert (=> b!501210 d!78527))

(declare-fun d!78531 () Bool)

(assert (=> d!78531 (= (validKeyInArray!0 (select (arr!15544 a!3235) j!176)) (and (not (= (select (arr!15544 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15544 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!501212 d!78531))

(declare-fun b!501296 () Bool)

(declare-fun e!293658 () Bool)

(declare-fun e!293657 () Bool)

(assert (=> b!501296 (= e!293658 e!293657)))

(declare-fun c!59432 () Bool)

(assert (=> b!501296 (= c!59432 (validKeyInArray!0 (select (arr!15544 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31454 () Bool)

(declare-fun call!31457 () Bool)

(assert (=> bm!31454 (= call!31457 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78533 () Bool)

(declare-fun res!302986 () Bool)

(assert (=> d!78533 (=> res!302986 e!293658)))

(assert (=> d!78533 (= res!302986 (bvsge #b00000000000000000000000000000000 (size!15908 a!3235)))))

(assert (=> d!78533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!293658)))

(declare-fun b!501297 () Bool)

(assert (=> b!501297 (= e!293657 call!31457)))

(declare-fun b!501298 () Bool)

(declare-fun e!293656 () Bool)

(assert (=> b!501298 (= e!293656 call!31457)))

(declare-fun b!501299 () Bool)

(assert (=> b!501299 (= e!293657 e!293656)))

(declare-fun lt!227685 () (_ BitVec 64))

(assert (=> b!501299 (= lt!227685 (select (arr!15544 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!227684 () Unit!15120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32325 (_ BitVec 64) (_ BitVec 32)) Unit!15120)

(assert (=> b!501299 (= lt!227684 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227685 #b00000000000000000000000000000000))))

(assert (=> b!501299 (arrayContainsKey!0 a!3235 lt!227685 #b00000000000000000000000000000000)))

(declare-fun lt!227686 () Unit!15120)

(assert (=> b!501299 (= lt!227686 lt!227684)))

(declare-fun res!302987 () Bool)

(assert (=> b!501299 (= res!302987 (= (seekEntryOrOpen!0 (select (arr!15544 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4011 #b00000000000000000000000000000000)))))

(assert (=> b!501299 (=> (not res!302987) (not e!293656))))

(assert (= (and d!78533 (not res!302986)) b!501296))

(assert (= (and b!501296 c!59432) b!501299))

(assert (= (and b!501296 (not c!59432)) b!501297))

(assert (= (and b!501299 res!302987) b!501298))

(assert (= (or b!501298 b!501297) bm!31454))

(assert (=> b!501296 m!482391))

(assert (=> b!501296 m!482391))

(assert (=> b!501296 m!482395))

(declare-fun m!482411 () Bool)

(assert (=> bm!31454 m!482411))

(assert (=> b!501299 m!482391))

(declare-fun m!482413 () Bool)

(assert (=> b!501299 m!482413))

(declare-fun m!482415 () Bool)

(assert (=> b!501299 m!482415))

(assert (=> b!501299 m!482391))

(declare-fun m!482417 () Bool)

(assert (=> b!501299 m!482417))

(assert (=> b!501206 d!78533))

(declare-fun b!501300 () Bool)

(declare-fun e!293660 () SeekEntryResult!4011)

(declare-fun e!293659 () SeekEntryResult!4011)

(assert (=> b!501300 (= e!293660 e!293659)))

(declare-fun lt!227688 () (_ BitVec 64))

(declare-fun lt!227687 () SeekEntryResult!4011)

(assert (=> b!501300 (= lt!227688 (select (arr!15544 a!3235) (index!18228 lt!227687)))))

(declare-fun c!59434 () Bool)

(assert (=> b!501300 (= c!59434 (= lt!227688 k0!2280))))

(declare-fun e!293661 () SeekEntryResult!4011)

(declare-fun b!501301 () Bool)

(assert (=> b!501301 (= e!293661 (seekKeyOrZeroReturnVacant!0 (x!47256 lt!227687) (index!18228 lt!227687) (index!18228 lt!227687) k0!2280 a!3235 mask!3524))))

(declare-fun d!78537 () Bool)

(declare-fun lt!227689 () SeekEntryResult!4011)

(assert (=> d!78537 (and (or ((_ is Undefined!4011) lt!227689) (not ((_ is Found!4011) lt!227689)) (and (bvsge (index!18227 lt!227689) #b00000000000000000000000000000000) (bvslt (index!18227 lt!227689) (size!15908 a!3235)))) (or ((_ is Undefined!4011) lt!227689) ((_ is Found!4011) lt!227689) (not ((_ is MissingZero!4011) lt!227689)) (and (bvsge (index!18226 lt!227689) #b00000000000000000000000000000000) (bvslt (index!18226 lt!227689) (size!15908 a!3235)))) (or ((_ is Undefined!4011) lt!227689) ((_ is Found!4011) lt!227689) ((_ is MissingZero!4011) lt!227689) (not ((_ is MissingVacant!4011) lt!227689)) (and (bvsge (index!18229 lt!227689) #b00000000000000000000000000000000) (bvslt (index!18229 lt!227689) (size!15908 a!3235)))) (or ((_ is Undefined!4011) lt!227689) (ite ((_ is Found!4011) lt!227689) (= (select (arr!15544 a!3235) (index!18227 lt!227689)) k0!2280) (ite ((_ is MissingZero!4011) lt!227689) (= (select (arr!15544 a!3235) (index!18226 lt!227689)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4011) lt!227689) (= (select (arr!15544 a!3235) (index!18229 lt!227689)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78537 (= lt!227689 e!293660)))

(declare-fun c!59433 () Bool)

(assert (=> d!78537 (= c!59433 (and ((_ is Intermediate!4011) lt!227687) (undefined!4823 lt!227687)))))

(assert (=> d!78537 (= lt!227687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78537 (validMask!0 mask!3524)))

(assert (=> d!78537 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!227689)))

(declare-fun b!501302 () Bool)

(assert (=> b!501302 (= e!293660 Undefined!4011)))

(declare-fun b!501303 () Bool)

(declare-fun c!59435 () Bool)

(assert (=> b!501303 (= c!59435 (= lt!227688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!501303 (= e!293659 e!293661)))

(declare-fun b!501304 () Bool)

(assert (=> b!501304 (= e!293659 (Found!4011 (index!18228 lt!227687)))))

(declare-fun b!501305 () Bool)

(assert (=> b!501305 (= e!293661 (MissingZero!4011 (index!18228 lt!227687)))))

(assert (= (and d!78537 c!59433) b!501302))

(assert (= (and d!78537 (not c!59433)) b!501300))

(assert (= (and b!501300 c!59434) b!501304))

(assert (= (and b!501300 (not c!59434)) b!501303))

(assert (= (and b!501303 c!59435) b!501305))

(assert (= (and b!501303 (not c!59435)) b!501301))

(declare-fun m!482419 () Bool)

(assert (=> b!501300 m!482419))

(declare-fun m!482421 () Bool)

(assert (=> b!501301 m!482421))

(declare-fun m!482423 () Bool)

(assert (=> d!78537 m!482423))

(declare-fun m!482425 () Bool)

(assert (=> d!78537 m!482425))

(declare-fun m!482427 () Bool)

(assert (=> d!78537 m!482427))

(assert (=> d!78537 m!482423))

(declare-fun m!482429 () Bool)

(assert (=> d!78537 m!482429))

(declare-fun m!482431 () Bool)

(assert (=> d!78537 m!482431))

(assert (=> d!78537 m!482343))

(assert (=> b!501208 d!78537))

(declare-fun d!78539 () Bool)

(declare-fun e!293685 () Bool)

(assert (=> d!78539 e!293685))

(declare-fun res!303000 () Bool)

(assert (=> d!78539 (=> (not res!303000) (not e!293685))))

(assert (=> d!78539 (= res!303000 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15908 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15908 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15908 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15908 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15908 a!3235))))))

(declare-fun lt!227708 () Unit!15120)

(declare-fun choose!47 (array!32325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15120)

(assert (=> d!78539 (= lt!227708 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!227631 #b00000000000000000000000000000000 (index!18228 lt!227630) (x!47256 lt!227630) mask!3524))))

(assert (=> d!78539 (validMask!0 mask!3524)))

(assert (=> d!78539 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227631 #b00000000000000000000000000000000 (index!18228 lt!227630) (x!47256 lt!227630) mask!3524) lt!227708)))

(declare-fun b!501347 () Bool)

(assert (=> b!501347 (= e!293685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227631 (select (store (arr!15544 a!3235) i!1204 k0!2280) j!176) (array!32326 (store (arr!15544 a!3235) i!1204 k0!2280) (size!15908 a!3235)) mask!3524) (Intermediate!4011 false (index!18228 lt!227630) (x!47256 lt!227630))))))

(assert (= (and d!78539 res!303000) b!501347))

(declare-fun m!482441 () Bool)

(assert (=> d!78539 m!482441))

(assert (=> d!78539 m!482343))

(assert (=> b!501347 m!482319))

(assert (=> b!501347 m!482323))

(assert (=> b!501347 m!482323))

(declare-fun m!482443 () Bool)

(assert (=> b!501347 m!482443))

(assert (=> b!501202 d!78539))

(declare-fun b!501405 () Bool)

(declare-fun e!293724 () Bool)

(declare-fun e!293722 () Bool)

(assert (=> b!501405 (= e!293724 e!293722)))

(declare-fun res!303022 () Bool)

(declare-fun lt!227744 () SeekEntryResult!4011)

(assert (=> b!501405 (= res!303022 (and ((_ is Intermediate!4011) lt!227744) (not (undefined!4823 lt!227744)) (bvslt (x!47256 lt!227744) #b01111111111111111111111111111110) (bvsge (x!47256 lt!227744) #b00000000000000000000000000000000) (bvsge (x!47256 lt!227744) #b00000000000000000000000000000000)))))

(assert (=> b!501405 (=> (not res!303022) (not e!293722))))

(declare-fun b!501406 () Bool)

(declare-fun e!293725 () SeekEntryResult!4011)

(assert (=> b!501406 (= e!293725 (Intermediate!4011 false lt!227631 #b00000000000000000000000000000000))))

(declare-fun b!501407 () Bool)

(assert (=> b!501407 (= e!293724 (bvsge (x!47256 lt!227744) #b01111111111111111111111111111110))))

(declare-fun b!501408 () Bool)

(declare-fun e!293726 () SeekEntryResult!4011)

(assert (=> b!501408 (= e!293726 (Intermediate!4011 true lt!227631 #b00000000000000000000000000000000))))

(declare-fun b!501409 () Bool)

(assert (=> b!501409 (and (bvsge (index!18228 lt!227744) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227744) (size!15908 lt!227638)))))

(declare-fun res!303024 () Bool)

(assert (=> b!501409 (= res!303024 (= (select (arr!15544 lt!227638) (index!18228 lt!227744)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293723 () Bool)

(assert (=> b!501409 (=> res!303024 e!293723)))

(declare-fun b!501410 () Bool)

(assert (=> b!501410 (and (bvsge (index!18228 lt!227744) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227744) (size!15908 lt!227638)))))

(assert (=> b!501410 (= e!293723 (= (select (arr!15544 lt!227638) (index!18228 lt!227744)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501411 () Bool)

(assert (=> b!501411 (= e!293726 e!293725)))

(declare-fun c!59470 () Bool)

(declare-fun lt!227743 () (_ BitVec 64))

(assert (=> b!501411 (= c!59470 (or (= lt!227743 lt!227634) (= (bvadd lt!227743 lt!227743) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501412 () Bool)

(assert (=> b!501412 (and (bvsge (index!18228 lt!227744) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227744) (size!15908 lt!227638)))))

(declare-fun res!303023 () Bool)

(assert (=> b!501412 (= res!303023 (= (select (arr!15544 lt!227638) (index!18228 lt!227744)) lt!227634))))

(assert (=> b!501412 (=> res!303023 e!293723)))

(assert (=> b!501412 (= e!293722 e!293723)))

(declare-fun b!501413 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501413 (= e!293725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227631 #b00000000000000000000000000000000 mask!3524) lt!227634 lt!227638 mask!3524))))

(declare-fun d!78543 () Bool)

(assert (=> d!78543 e!293724))

(declare-fun c!59471 () Bool)

(assert (=> d!78543 (= c!59471 (and ((_ is Intermediate!4011) lt!227744) (undefined!4823 lt!227744)))))

(assert (=> d!78543 (= lt!227744 e!293726)))

(declare-fun c!59469 () Bool)

(assert (=> d!78543 (= c!59469 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78543 (= lt!227743 (select (arr!15544 lt!227638) lt!227631))))

(assert (=> d!78543 (validMask!0 mask!3524)))

(assert (=> d!78543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227631 lt!227634 lt!227638 mask!3524) lt!227744)))

(assert (= (and d!78543 c!59469) b!501408))

(assert (= (and d!78543 (not c!59469)) b!501411))

(assert (= (and b!501411 c!59470) b!501406))

(assert (= (and b!501411 (not c!59470)) b!501413))

(assert (= (and d!78543 c!59471) b!501407))

(assert (= (and d!78543 (not c!59471)) b!501405))

(assert (= (and b!501405 res!303022) b!501412))

(assert (= (and b!501412 (not res!303023)) b!501409))

(assert (= (and b!501409 (not res!303024)) b!501410))

(declare-fun m!482479 () Bool)

(assert (=> d!78543 m!482479))

(assert (=> d!78543 m!482343))

(declare-fun m!482481 () Bool)

(assert (=> b!501412 m!482481))

(declare-fun m!482483 () Bool)

(assert (=> b!501413 m!482483))

(assert (=> b!501413 m!482483))

(declare-fun m!482485 () Bool)

(assert (=> b!501413 m!482485))

(assert (=> b!501410 m!482481))

(assert (=> b!501409 m!482481))

(assert (=> b!501202 d!78543))

(declare-fun d!78559 () Bool)

(assert (=> d!78559 (= (index!18228 lt!227630) i!1204)))

(declare-fun lt!227747 () Unit!15120)

(declare-fun choose!104 (array!32325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15120)

(assert (=> d!78559 (= lt!227747 (choose!104 a!3235 i!1204 k0!2280 j!176 lt!227631 #b00000000000000000000000000000000 (index!18228 lt!227630) (x!47256 lt!227630) mask!3524))))

(assert (=> d!78559 (validMask!0 mask!3524)))

(assert (=> d!78559 (= (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!227631 #b00000000000000000000000000000000 (index!18228 lt!227630) (x!47256 lt!227630) mask!3524) lt!227747)))

(declare-fun bs!15929 () Bool)

(assert (= bs!15929 d!78559))

(declare-fun m!482487 () Bool)

(assert (=> bs!15929 m!482487))

(assert (=> bs!15929 m!482343))

(assert (=> b!501207 d!78559))

(declare-fun d!78561 () Bool)

(assert (=> d!78561 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45500 d!78561))

(declare-fun d!78567 () Bool)

(assert (=> d!78567 (= (array_inv!11340 a!3235) (bvsge (size!15908 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45500 d!78567))

(declare-fun d!78571 () Bool)

(declare-fun res!303038 () Bool)

(declare-fun e!293746 () Bool)

(assert (=> d!78571 (=> res!303038 e!293746)))

(assert (=> d!78571 (= res!303038 (= (select (arr!15544 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78571 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!293746)))

(declare-fun b!501445 () Bool)

(declare-fun e!293747 () Bool)

(assert (=> b!501445 (= e!293746 e!293747)))

(declare-fun res!303039 () Bool)

(assert (=> b!501445 (=> (not res!303039) (not e!293747))))

(assert (=> b!501445 (= res!303039 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15908 a!3235)))))

(declare-fun b!501446 () Bool)

(assert (=> b!501446 (= e!293747 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78571 (not res!303038)) b!501445))

(assert (= (and b!501445 res!303039) b!501446))

(assert (=> d!78571 m!482391))

(declare-fun m!482497 () Bool)

(assert (=> b!501446 m!482497))

(assert (=> b!501204 d!78571))

(declare-fun d!78573 () Bool)

(assert (=> d!78573 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!501209 d!78573))

(declare-fun d!78575 () Bool)

(declare-fun lt!227770 () (_ BitVec 32))

(declare-fun lt!227769 () (_ BitVec 32))

(assert (=> d!78575 (= lt!227770 (bvmul (bvxor lt!227769 (bvlshr lt!227769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78575 (= lt!227769 ((_ extract 31 0) (bvand (bvxor (select (arr!15544 a!3235) j!176) (bvlshr (select (arr!15544 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78575 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!303040 (let ((h!10575 ((_ extract 31 0) (bvand (bvxor (select (arr!15544 a!3235) j!176) (bvlshr (select (arr!15544 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47264 (bvmul (bvxor h!10575 (bvlshr h!10575 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47264 (bvlshr x!47264 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!303040 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!303040 #b00000000000000000000000000000000))))))

(assert (=> d!78575 (= (toIndex!0 (select (arr!15544 a!3235) j!176) mask!3524) (bvand (bvxor lt!227770 (bvlshr lt!227770 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!501203 d!78575))

(declare-fun b!501468 () Bool)

(declare-fun e!293761 () Bool)

(declare-fun e!293760 () Bool)

(assert (=> b!501468 (= e!293761 e!293760)))

(declare-fun c!59490 () Bool)

(assert (=> b!501468 (= c!59490 (validKeyInArray!0 (select (arr!15544 a!3235) j!176)))))

(declare-fun bm!31461 () Bool)

(declare-fun call!31464 () Bool)

(assert (=> bm!31461 (= call!31464 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78581 () Bool)

(declare-fun res!303045 () Bool)

(assert (=> d!78581 (=> res!303045 e!293761)))

(assert (=> d!78581 (= res!303045 (bvsge j!176 (size!15908 a!3235)))))

(assert (=> d!78581 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!293761)))

(declare-fun b!501469 () Bool)

(assert (=> b!501469 (= e!293760 call!31464)))

(declare-fun b!501470 () Bool)

(declare-fun e!293759 () Bool)

(assert (=> b!501470 (= e!293759 call!31464)))

(declare-fun b!501471 () Bool)

(assert (=> b!501471 (= e!293760 e!293759)))

(declare-fun lt!227772 () (_ BitVec 64))

(assert (=> b!501471 (= lt!227772 (select (arr!15544 a!3235) j!176))))

(declare-fun lt!227771 () Unit!15120)

(assert (=> b!501471 (= lt!227771 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!227772 j!176))))

(assert (=> b!501471 (arrayContainsKey!0 a!3235 lt!227772 #b00000000000000000000000000000000)))

(declare-fun lt!227773 () Unit!15120)

(assert (=> b!501471 (= lt!227773 lt!227771)))

(declare-fun res!303046 () Bool)

(assert (=> b!501471 (= res!303046 (= (seekEntryOrOpen!0 (select (arr!15544 a!3235) j!176) a!3235 mask!3524) (Found!4011 j!176)))))

(assert (=> b!501471 (=> (not res!303046) (not e!293759))))

(assert (= (and d!78581 (not res!303045)) b!501468))

(assert (= (and b!501468 c!59490) b!501471))

(assert (= (and b!501468 (not c!59490)) b!501469))

(assert (= (and b!501471 res!303046) b!501470))

(assert (= (or b!501470 b!501469) bm!31461))

(assert (=> b!501468 m!482309))

(assert (=> b!501468 m!482309))

(assert (=> b!501468 m!482341))

(declare-fun m!482509 () Bool)

(assert (=> bm!31461 m!482509))

(assert (=> b!501471 m!482309))

(declare-fun m!482511 () Bool)

(assert (=> b!501471 m!482511))

(declare-fun m!482513 () Bool)

(assert (=> b!501471 m!482513))

(assert (=> b!501471 m!482309))

(assert (=> b!501471 m!482311))

(assert (=> b!501203 d!78581))

(declare-fun b!501472 () Bool)

(declare-fun e!293764 () Bool)

(declare-fun e!293762 () Bool)

(assert (=> b!501472 (= e!293764 e!293762)))

(declare-fun res!303047 () Bool)

(declare-fun lt!227775 () SeekEntryResult!4011)

(assert (=> b!501472 (= res!303047 (and ((_ is Intermediate!4011) lt!227775) (not (undefined!4823 lt!227775)) (bvslt (x!47256 lt!227775) #b01111111111111111111111111111110) (bvsge (x!47256 lt!227775) #b00000000000000000000000000000000) (bvsge (x!47256 lt!227775) #b00000000000000000000000000000000)))))

(assert (=> b!501472 (=> (not res!303047) (not e!293762))))

(declare-fun b!501473 () Bool)

(declare-fun e!293765 () SeekEntryResult!4011)

(assert (=> b!501473 (= e!293765 (Intermediate!4011 false lt!227636 #b00000000000000000000000000000000))))

(declare-fun b!501474 () Bool)

(assert (=> b!501474 (= e!293764 (bvsge (x!47256 lt!227775) #b01111111111111111111111111111110))))

(declare-fun b!501475 () Bool)

(declare-fun e!293766 () SeekEntryResult!4011)

(assert (=> b!501475 (= e!293766 (Intermediate!4011 true lt!227636 #b00000000000000000000000000000000))))

(declare-fun b!501476 () Bool)

(assert (=> b!501476 (and (bvsge (index!18228 lt!227775) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227775) (size!15908 lt!227638)))))

(declare-fun res!303049 () Bool)

(assert (=> b!501476 (= res!303049 (= (select (arr!15544 lt!227638) (index!18228 lt!227775)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293763 () Bool)

(assert (=> b!501476 (=> res!303049 e!293763)))

(declare-fun b!501477 () Bool)

(assert (=> b!501477 (and (bvsge (index!18228 lt!227775) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227775) (size!15908 lt!227638)))))

(assert (=> b!501477 (= e!293763 (= (select (arr!15544 lt!227638) (index!18228 lt!227775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501478 () Bool)

(assert (=> b!501478 (= e!293766 e!293765)))

(declare-fun c!59492 () Bool)

(declare-fun lt!227774 () (_ BitVec 64))

(assert (=> b!501478 (= c!59492 (or (= lt!227774 lt!227634) (= (bvadd lt!227774 lt!227774) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501479 () Bool)

(assert (=> b!501479 (and (bvsge (index!18228 lt!227775) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227775) (size!15908 lt!227638)))))

(declare-fun res!303048 () Bool)

(assert (=> b!501479 (= res!303048 (= (select (arr!15544 lt!227638) (index!18228 lt!227775)) lt!227634))))

(assert (=> b!501479 (=> res!303048 e!293763)))

(assert (=> b!501479 (= e!293762 e!293763)))

(declare-fun b!501480 () Bool)

(assert (=> b!501480 (= e!293765 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227636 #b00000000000000000000000000000000 mask!3524) lt!227634 lt!227638 mask!3524))))

(declare-fun d!78583 () Bool)

(assert (=> d!78583 e!293764))

(declare-fun c!59493 () Bool)

(assert (=> d!78583 (= c!59493 (and ((_ is Intermediate!4011) lt!227775) (undefined!4823 lt!227775)))))

(assert (=> d!78583 (= lt!227775 e!293766)))

(declare-fun c!59491 () Bool)

(assert (=> d!78583 (= c!59491 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78583 (= lt!227774 (select (arr!15544 lt!227638) lt!227636))))

(assert (=> d!78583 (validMask!0 mask!3524)))

(assert (=> d!78583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227636 lt!227634 lt!227638 mask!3524) lt!227775)))

(assert (= (and d!78583 c!59491) b!501475))

(assert (= (and d!78583 (not c!59491)) b!501478))

(assert (= (and b!501478 c!59492) b!501473))

(assert (= (and b!501478 (not c!59492)) b!501480))

(assert (= (and d!78583 c!59493) b!501474))

(assert (= (and d!78583 (not c!59493)) b!501472))

(assert (= (and b!501472 res!303047) b!501479))

(assert (= (and b!501479 (not res!303048)) b!501476))

(assert (= (and b!501476 (not res!303049)) b!501477))

(declare-fun m!482515 () Bool)

(assert (=> d!78583 m!482515))

(assert (=> d!78583 m!482343))

(declare-fun m!482517 () Bool)

(assert (=> b!501479 m!482517))

(declare-fun m!482519 () Bool)

(assert (=> b!501480 m!482519))

(assert (=> b!501480 m!482519))

(declare-fun m!482521 () Bool)

(assert (=> b!501480 m!482521))

(assert (=> b!501477 m!482517))

(assert (=> b!501476 m!482517))

(assert (=> b!501203 d!78583))

(declare-fun d!78585 () Bool)

(declare-fun lt!227781 () (_ BitVec 32))

(declare-fun lt!227780 () (_ BitVec 32))

(assert (=> d!78585 (= lt!227781 (bvmul (bvxor lt!227780 (bvlshr lt!227780 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78585 (= lt!227780 ((_ extract 31 0) (bvand (bvxor lt!227634 (bvlshr lt!227634 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78585 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!303040 (let ((h!10575 ((_ extract 31 0) (bvand (bvxor lt!227634 (bvlshr lt!227634 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!47264 (bvmul (bvxor h!10575 (bvlshr h!10575 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!47264 (bvlshr x!47264 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!303040 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!303040 #b00000000000000000000000000000000))))))

(assert (=> d!78585 (= (toIndex!0 lt!227634 mask!3524) (bvand (bvxor lt!227781 (bvlshr lt!227781 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!501203 d!78585))

(declare-fun d!78587 () Bool)

(assert (=> d!78587 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!227797 () Unit!15120)

(declare-fun choose!38 (array!32325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15120)

(assert (=> d!78587 (= lt!227797 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78587 (validMask!0 mask!3524)))

(assert (=> d!78587 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!227797)))

(declare-fun bs!15931 () Bool)

(assert (= bs!15931 d!78587))

(assert (=> bs!15931 m!482329))

(declare-fun m!482563 () Bool)

(assert (=> bs!15931 m!482563))

(assert (=> bs!15931 m!482343))

(assert (=> b!501203 d!78587))

(declare-fun b!501499 () Bool)

(declare-fun e!293778 () Bool)

(declare-fun e!293776 () Bool)

(assert (=> b!501499 (= e!293778 e!293776)))

(declare-fun res!303050 () Bool)

(declare-fun lt!227801 () SeekEntryResult!4011)

(assert (=> b!501499 (= res!303050 (and ((_ is Intermediate!4011) lt!227801) (not (undefined!4823 lt!227801)) (bvslt (x!47256 lt!227801) #b01111111111111111111111111111110) (bvsge (x!47256 lt!227801) #b00000000000000000000000000000000) (bvsge (x!47256 lt!227801) #b00000000000000000000000000000000)))))

(assert (=> b!501499 (=> (not res!303050) (not e!293776))))

(declare-fun b!501500 () Bool)

(declare-fun e!293779 () SeekEntryResult!4011)

(assert (=> b!501500 (= e!293779 (Intermediate!4011 false lt!227631 #b00000000000000000000000000000000))))

(declare-fun b!501501 () Bool)

(assert (=> b!501501 (= e!293778 (bvsge (x!47256 lt!227801) #b01111111111111111111111111111110))))

(declare-fun b!501502 () Bool)

(declare-fun e!293780 () SeekEntryResult!4011)

(assert (=> b!501502 (= e!293780 (Intermediate!4011 true lt!227631 #b00000000000000000000000000000000))))

(declare-fun b!501503 () Bool)

(assert (=> b!501503 (and (bvsge (index!18228 lt!227801) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227801) (size!15908 a!3235)))))

(declare-fun res!303052 () Bool)

(assert (=> b!501503 (= res!303052 (= (select (arr!15544 a!3235) (index!18228 lt!227801)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!293777 () Bool)

(assert (=> b!501503 (=> res!303052 e!293777)))

(declare-fun b!501504 () Bool)

(assert (=> b!501504 (and (bvsge (index!18228 lt!227801) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227801) (size!15908 a!3235)))))

(assert (=> b!501504 (= e!293777 (= (select (arr!15544 a!3235) (index!18228 lt!227801)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!501505 () Bool)

(assert (=> b!501505 (= e!293780 e!293779)))

(declare-fun lt!227800 () (_ BitVec 64))

(declare-fun c!59504 () Bool)

(assert (=> b!501505 (= c!59504 (or (= lt!227800 (select (arr!15544 a!3235) j!176)) (= (bvadd lt!227800 lt!227800) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501506 () Bool)

(assert (=> b!501506 (and (bvsge (index!18228 lt!227801) #b00000000000000000000000000000000) (bvslt (index!18228 lt!227801) (size!15908 a!3235)))))

(declare-fun res!303051 () Bool)

(assert (=> b!501506 (= res!303051 (= (select (arr!15544 a!3235) (index!18228 lt!227801)) (select (arr!15544 a!3235) j!176)))))

(assert (=> b!501506 (=> res!303051 e!293777)))

(assert (=> b!501506 (= e!293776 e!293777)))

(declare-fun b!501507 () Bool)

(assert (=> b!501507 (= e!293779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!227631 #b00000000000000000000000000000000 mask!3524) (select (arr!15544 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78603 () Bool)

(assert (=> d!78603 e!293778))

(declare-fun c!59505 () Bool)

(assert (=> d!78603 (= c!59505 (and ((_ is Intermediate!4011) lt!227801) (undefined!4823 lt!227801)))))

(assert (=> d!78603 (= lt!227801 e!293780)))

(declare-fun c!59503 () Bool)

(assert (=> d!78603 (= c!59503 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78603 (= lt!227800 (select (arr!15544 a!3235) lt!227631))))

(assert (=> d!78603 (validMask!0 mask!3524)))

(assert (=> d!78603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227631 (select (arr!15544 a!3235) j!176) a!3235 mask!3524) lt!227801)))

(assert (= (and d!78603 c!59503) b!501502))

(assert (= (and d!78603 (not c!59503)) b!501505))

(assert (= (and b!501505 c!59504) b!501500))

(assert (= (and b!501505 (not c!59504)) b!501507))

(assert (= (and d!78603 c!59505) b!501501))

(assert (= (and d!78603 (not c!59505)) b!501499))

(assert (= (and b!501499 res!303050) b!501506))

(assert (= (and b!501506 (not res!303051)) b!501503))

(assert (= (and b!501503 (not res!303052)) b!501504))

(declare-fun m!482567 () Bool)

(assert (=> d!78603 m!482567))

(assert (=> d!78603 m!482343))

(declare-fun m!482569 () Bool)

(assert (=> b!501506 m!482569))

(assert (=> b!501507 m!482483))

(assert (=> b!501507 m!482483))

(assert (=> b!501507 m!482309))

(declare-fun m!482571 () Bool)

(assert (=> b!501507 m!482571))

(assert (=> b!501504 m!482569))

(assert (=> b!501503 m!482569))

(assert (=> b!501203 d!78603))

(check-sat (not b!501266) (not b!501268) (not d!78543) (not d!78559) (not bm!31461) (not b!501480) (not d!78603) (not b!501301) (not b!501471) (not bm!31451) (not d!78527) (not d!78583) (not b!501347) (not b!501296) (not b!501507) (not b!501265) (not d!78537) (not d!78587) (not b!501283) (not b!501299) (not d!78539) (not b!501413) (not bm!31454) (not b!501468) (not b!501446))
(check-sat)
