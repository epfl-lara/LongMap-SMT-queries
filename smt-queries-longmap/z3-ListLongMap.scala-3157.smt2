; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44468 () Bool)

(assert start!44468)

(declare-fun b!488412 () Bool)

(declare-fun res!291581 () Bool)

(declare-fun e!287311 () Bool)

(assert (=> b!488412 (=> (not res!291581) (not e!287311))))

(declare-datatypes ((array!31623 0))(
  ( (array!31624 (arr!15202 (Array (_ BitVec 32) (_ BitVec 64))) (size!15566 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31623)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488412 (= res!291581 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488414 () Bool)

(declare-fun res!291574 () Bool)

(assert (=> b!488414 (=> (not res!291574) (not e!287311))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488414 (= res!291574 (validKeyInArray!0 (select (arr!15202 a!3235) j!176)))))

(declare-fun b!488415 () Bool)

(declare-fun res!291573 () Bool)

(declare-fun e!287313 () Bool)

(assert (=> b!488415 (=> (not res!291573) (not e!287313))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31623 (_ BitVec 32)) Bool)

(assert (=> b!488415 (= res!291573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488416 () Bool)

(declare-fun res!291577 () Bool)

(assert (=> b!488416 (=> (not res!291577) (not e!287313))))

(declare-datatypes ((List!9360 0))(
  ( (Nil!9357) (Cons!9356 (h!10215 (_ BitVec 64)) (t!15588 List!9360)) )
))
(declare-fun arrayNoDuplicates!0 (array!31623 (_ BitVec 32) List!9360) Bool)

(assert (=> b!488416 (= res!291577 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9357))))

(declare-fun e!287312 () Bool)

(declare-fun b!488417 () Bool)

(declare-datatypes ((SeekEntryResult!3669 0))(
  ( (MissingZero!3669 (index!16855 (_ BitVec 32))) (Found!3669 (index!16856 (_ BitVec 32))) (Intermediate!3669 (undefined!4481 Bool) (index!16857 (_ BitVec 32)) (x!45972 (_ BitVec 32))) (Undefined!3669) (MissingVacant!3669 (index!16858 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31623 (_ BitVec 32)) SeekEntryResult!3669)

(assert (=> b!488417 (= e!287312 (= (seekEntryOrOpen!0 (select (arr!15202 a!3235) j!176) a!3235 mask!3524) (Found!3669 j!176)))))

(declare-fun b!488418 () Bool)

(declare-fun res!291578 () Bool)

(assert (=> b!488418 (=> (not res!291578) (not e!287311))))

(assert (=> b!488418 (= res!291578 (validKeyInArray!0 k0!2280))))

(declare-fun b!488419 () Bool)

(assert (=> b!488419 (= e!287313 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(assert (=> b!488419 e!287312))

(declare-fun res!291575 () Bool)

(assert (=> b!488419 (=> (not res!291575) (not e!287312))))

(assert (=> b!488419 (= res!291575 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14284 0))(
  ( (Unit!14285) )
))
(declare-fun lt!220390 () Unit!14284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14284)

(assert (=> b!488419 (= lt!220390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488420 () Bool)

(declare-fun res!291580 () Bool)

(assert (=> b!488420 (=> (not res!291580) (not e!287311))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488420 (= res!291580 (and (= (size!15566 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15566 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15566 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!291579 () Bool)

(assert (=> start!44468 (=> (not res!291579) (not e!287311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44468 (= res!291579 (validMask!0 mask!3524))))

(assert (=> start!44468 e!287311))

(assert (=> start!44468 true))

(declare-fun array_inv!10998 (array!31623) Bool)

(assert (=> start!44468 (array_inv!10998 a!3235)))

(declare-fun b!488413 () Bool)

(assert (=> b!488413 (= e!287311 e!287313)))

(declare-fun res!291576 () Bool)

(assert (=> b!488413 (=> (not res!291576) (not e!287313))))

(declare-fun lt!220389 () SeekEntryResult!3669)

(assert (=> b!488413 (= res!291576 (or (= lt!220389 (MissingZero!3669 i!1204)) (= lt!220389 (MissingVacant!3669 i!1204))))))

(assert (=> b!488413 (= lt!220389 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44468 res!291579) b!488420))

(assert (= (and b!488420 res!291580) b!488414))

(assert (= (and b!488414 res!291574) b!488418))

(assert (= (and b!488418 res!291578) b!488412))

(assert (= (and b!488412 res!291581) b!488413))

(assert (= (and b!488413 res!291576) b!488415))

(assert (= (and b!488415 res!291573) b!488416))

(assert (= (and b!488416 res!291577) b!488419))

(assert (= (and b!488419 res!291575) b!488417))

(declare-fun m!468147 () Bool)

(assert (=> start!44468 m!468147))

(declare-fun m!468149 () Bool)

(assert (=> start!44468 m!468149))

(declare-fun m!468151 () Bool)

(assert (=> b!488414 m!468151))

(assert (=> b!488414 m!468151))

(declare-fun m!468153 () Bool)

(assert (=> b!488414 m!468153))

(declare-fun m!468155 () Bool)

(assert (=> b!488416 m!468155))

(declare-fun m!468157 () Bool)

(assert (=> b!488412 m!468157))

(declare-fun m!468159 () Bool)

(assert (=> b!488413 m!468159))

(declare-fun m!468161 () Bool)

(assert (=> b!488415 m!468161))

(declare-fun m!468163 () Bool)

(assert (=> b!488418 m!468163))

(assert (=> b!488417 m!468151))

(assert (=> b!488417 m!468151))

(declare-fun m!468165 () Bool)

(assert (=> b!488417 m!468165))

(declare-fun m!468167 () Bool)

(assert (=> b!488419 m!468167))

(declare-fun m!468169 () Bool)

(assert (=> b!488419 m!468169))

(check-sat (not start!44468) (not b!488416) (not b!488412) (not b!488414) (not b!488413) (not b!488419) (not b!488417) (not b!488418) (not b!488415))
(check-sat)
(get-model)

(declare-fun b!488458 () Bool)

(declare-fun e!287334 () Bool)

(declare-fun e!287337 () Bool)

(assert (=> b!488458 (= e!287334 e!287337)))

(declare-fun res!291615 () Bool)

(assert (=> b!488458 (=> (not res!291615) (not e!287337))))

(declare-fun e!287336 () Bool)

(assert (=> b!488458 (= res!291615 (not e!287336))))

(declare-fun res!291616 () Bool)

(assert (=> b!488458 (=> (not res!291616) (not e!287336))))

(assert (=> b!488458 (= res!291616 (validKeyInArray!0 (select (arr!15202 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77787 () Bool)

(declare-fun res!291617 () Bool)

(assert (=> d!77787 (=> res!291617 e!287334)))

(assert (=> d!77787 (= res!291617 (bvsge #b00000000000000000000000000000000 (size!15566 a!3235)))))

(assert (=> d!77787 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9357) e!287334)))

(declare-fun bm!31325 () Bool)

(declare-fun call!31328 () Bool)

(declare-fun c!58691 () Bool)

(assert (=> bm!31325 (= call!31328 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58691 (Cons!9356 (select (arr!15202 a!3235) #b00000000000000000000000000000000) Nil!9357) Nil!9357)))))

(declare-fun b!488459 () Bool)

(declare-fun e!287335 () Bool)

(assert (=> b!488459 (= e!287337 e!287335)))

(assert (=> b!488459 (= c!58691 (validKeyInArray!0 (select (arr!15202 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488460 () Bool)

(assert (=> b!488460 (= e!287335 call!31328)))

(declare-fun b!488461 () Bool)

(declare-fun contains!2704 (List!9360 (_ BitVec 64)) Bool)

(assert (=> b!488461 (= e!287336 (contains!2704 Nil!9357 (select (arr!15202 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488462 () Bool)

(assert (=> b!488462 (= e!287335 call!31328)))

(assert (= (and d!77787 (not res!291617)) b!488458))

(assert (= (and b!488458 res!291616) b!488461))

(assert (= (and b!488458 res!291615) b!488459))

(assert (= (and b!488459 c!58691) b!488462))

(assert (= (and b!488459 (not c!58691)) b!488460))

(assert (= (or b!488462 b!488460) bm!31325))

(declare-fun m!468195 () Bool)

(assert (=> b!488458 m!468195))

(assert (=> b!488458 m!468195))

(declare-fun m!468197 () Bool)

(assert (=> b!488458 m!468197))

(assert (=> bm!31325 m!468195))

(declare-fun m!468199 () Bool)

(assert (=> bm!31325 m!468199))

(assert (=> b!488459 m!468195))

(assert (=> b!488459 m!468195))

(assert (=> b!488459 m!468197))

(assert (=> b!488461 m!468195))

(assert (=> b!488461 m!468195))

(declare-fun m!468201 () Bool)

(assert (=> b!488461 m!468201))

(assert (=> b!488416 d!77787))

(declare-fun d!77789 () Bool)

(declare-fun res!291628 () Bool)

(declare-fun e!287352 () Bool)

(assert (=> d!77789 (=> res!291628 e!287352)))

(assert (=> d!77789 (= res!291628 (bvsge #b00000000000000000000000000000000 (size!15566 a!3235)))))

(assert (=> d!77789 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287352)))

(declare-fun b!488481 () Bool)

(declare-fun e!287354 () Bool)

(assert (=> b!488481 (= e!287352 e!287354)))

(declare-fun c!58696 () Bool)

(assert (=> b!488481 (= c!58696 (validKeyInArray!0 (select (arr!15202 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488482 () Bool)

(declare-fun e!287353 () Bool)

(declare-fun call!31331 () Bool)

(assert (=> b!488482 (= e!287353 call!31331)))

(declare-fun bm!31328 () Bool)

(assert (=> bm!31328 (= call!31331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488483 () Bool)

(assert (=> b!488483 (= e!287354 call!31331)))

(declare-fun b!488484 () Bool)

(assert (=> b!488484 (= e!287354 e!287353)))

(declare-fun lt!220404 () (_ BitVec 64))

(assert (=> b!488484 (= lt!220404 (select (arr!15202 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220403 () Unit!14284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31623 (_ BitVec 64) (_ BitVec 32)) Unit!14284)

(assert (=> b!488484 (= lt!220403 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220404 #b00000000000000000000000000000000))))

(assert (=> b!488484 (arrayContainsKey!0 a!3235 lt!220404 #b00000000000000000000000000000000)))

(declare-fun lt!220405 () Unit!14284)

(assert (=> b!488484 (= lt!220405 lt!220403)))

(declare-fun res!291629 () Bool)

(assert (=> b!488484 (= res!291629 (= (seekEntryOrOpen!0 (select (arr!15202 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3669 #b00000000000000000000000000000000)))))

(assert (=> b!488484 (=> (not res!291629) (not e!287353))))

(assert (= (and d!77789 (not res!291628)) b!488481))

(assert (= (and b!488481 c!58696) b!488484))

(assert (= (and b!488481 (not c!58696)) b!488483))

(assert (= (and b!488484 res!291629) b!488482))

(assert (= (or b!488482 b!488483) bm!31328))

(assert (=> b!488481 m!468195))

(assert (=> b!488481 m!468195))

(assert (=> b!488481 m!468197))

(declare-fun m!468203 () Bool)

(assert (=> bm!31328 m!468203))

(assert (=> b!488484 m!468195))

(declare-fun m!468205 () Bool)

(assert (=> b!488484 m!468205))

(declare-fun m!468207 () Bool)

(assert (=> b!488484 m!468207))

(assert (=> b!488484 m!468195))

(declare-fun m!468209 () Bool)

(assert (=> b!488484 m!468209))

(assert (=> b!488415 d!77789))

(declare-fun b!488525 () Bool)

(declare-fun e!287385 () SeekEntryResult!3669)

(declare-fun e!287383 () SeekEntryResult!3669)

(assert (=> b!488525 (= e!287385 e!287383)))

(declare-fun lt!220429 () (_ BitVec 64))

(declare-fun lt!220428 () SeekEntryResult!3669)

(assert (=> b!488525 (= lt!220429 (select (arr!15202 a!3235) (index!16857 lt!220428)))))

(declare-fun c!58710 () Bool)

(assert (=> b!488525 (= c!58710 (= lt!220429 k0!2280))))

(declare-fun b!488526 () Bool)

(assert (=> b!488526 (= e!287383 (Found!3669 (index!16857 lt!220428)))))

(declare-fun b!488527 () Bool)

(declare-fun c!58709 () Bool)

(assert (=> b!488527 (= c!58709 (= lt!220429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287384 () SeekEntryResult!3669)

(assert (=> b!488527 (= e!287383 e!287384)))

(declare-fun d!77799 () Bool)

(declare-fun lt!220427 () SeekEntryResult!3669)

(get-info :version)

(assert (=> d!77799 (and (or ((_ is Undefined!3669) lt!220427) (not ((_ is Found!3669) lt!220427)) (and (bvsge (index!16856 lt!220427) #b00000000000000000000000000000000) (bvslt (index!16856 lt!220427) (size!15566 a!3235)))) (or ((_ is Undefined!3669) lt!220427) ((_ is Found!3669) lt!220427) (not ((_ is MissingZero!3669) lt!220427)) (and (bvsge (index!16855 lt!220427) #b00000000000000000000000000000000) (bvslt (index!16855 lt!220427) (size!15566 a!3235)))) (or ((_ is Undefined!3669) lt!220427) ((_ is Found!3669) lt!220427) ((_ is MissingZero!3669) lt!220427) (not ((_ is MissingVacant!3669) lt!220427)) (and (bvsge (index!16858 lt!220427) #b00000000000000000000000000000000) (bvslt (index!16858 lt!220427) (size!15566 a!3235)))) (or ((_ is Undefined!3669) lt!220427) (ite ((_ is Found!3669) lt!220427) (= (select (arr!15202 a!3235) (index!16856 lt!220427)) k0!2280) (ite ((_ is MissingZero!3669) lt!220427) (= (select (arr!15202 a!3235) (index!16855 lt!220427)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3669) lt!220427) (= (select (arr!15202 a!3235) (index!16858 lt!220427)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77799 (= lt!220427 e!287385)))

(declare-fun c!58708 () Bool)

(assert (=> d!77799 (= c!58708 (and ((_ is Intermediate!3669) lt!220428) (undefined!4481 lt!220428)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31623 (_ BitVec 32)) SeekEntryResult!3669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77799 (= lt!220428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77799 (validMask!0 mask!3524)))

(assert (=> d!77799 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220427)))

(declare-fun b!488524 () Bool)

(assert (=> b!488524 (= e!287385 Undefined!3669)))

(declare-fun b!488528 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31623 (_ BitVec 32)) SeekEntryResult!3669)

(assert (=> b!488528 (= e!287384 (seekKeyOrZeroReturnVacant!0 (x!45972 lt!220428) (index!16857 lt!220428) (index!16857 lt!220428) k0!2280 a!3235 mask!3524))))

(declare-fun b!488529 () Bool)

(assert (=> b!488529 (= e!287384 (MissingZero!3669 (index!16857 lt!220428)))))

(assert (= (and d!77799 c!58708) b!488524))

(assert (= (and d!77799 (not c!58708)) b!488525))

(assert (= (and b!488525 c!58710) b!488526))

(assert (= (and b!488525 (not c!58710)) b!488527))

(assert (= (and b!488527 c!58709) b!488529))

(assert (= (and b!488527 (not c!58709)) b!488528))

(declare-fun m!468241 () Bool)

(assert (=> b!488525 m!468241))

(declare-fun m!468243 () Bool)

(assert (=> d!77799 m!468243))

(declare-fun m!468245 () Bool)

(assert (=> d!77799 m!468245))

(declare-fun m!468247 () Bool)

(assert (=> d!77799 m!468247))

(assert (=> d!77799 m!468147))

(assert (=> d!77799 m!468243))

(declare-fun m!468249 () Bool)

(assert (=> d!77799 m!468249))

(declare-fun m!468251 () Bool)

(assert (=> d!77799 m!468251))

(declare-fun m!468253 () Bool)

(assert (=> b!488528 m!468253))

(assert (=> b!488413 d!77799))

(declare-fun d!77817 () Bool)

(assert (=> d!77817 (= (validKeyInArray!0 (select (arr!15202 a!3235) j!176)) (and (not (= (select (arr!15202 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15202 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488414 d!77817))

(declare-fun d!77819 () Bool)

(declare-fun res!291647 () Bool)

(declare-fun e!287386 () Bool)

(assert (=> d!77819 (=> res!291647 e!287386)))

(assert (=> d!77819 (= res!291647 (bvsge j!176 (size!15566 a!3235)))))

(assert (=> d!77819 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287386)))

(declare-fun b!488530 () Bool)

(declare-fun e!287388 () Bool)

(assert (=> b!488530 (= e!287386 e!287388)))

(declare-fun c!58711 () Bool)

(assert (=> b!488530 (= c!58711 (validKeyInArray!0 (select (arr!15202 a!3235) j!176)))))

(declare-fun b!488531 () Bool)

(declare-fun e!287387 () Bool)

(declare-fun call!31339 () Bool)

(assert (=> b!488531 (= e!287387 call!31339)))

(declare-fun bm!31336 () Bool)

(assert (=> bm!31336 (= call!31339 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488532 () Bool)

(assert (=> b!488532 (= e!287388 call!31339)))

(declare-fun b!488533 () Bool)

(assert (=> b!488533 (= e!287388 e!287387)))

(declare-fun lt!220431 () (_ BitVec 64))

(assert (=> b!488533 (= lt!220431 (select (arr!15202 a!3235) j!176))))

(declare-fun lt!220430 () Unit!14284)

(assert (=> b!488533 (= lt!220430 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220431 j!176))))

(assert (=> b!488533 (arrayContainsKey!0 a!3235 lt!220431 #b00000000000000000000000000000000)))

(declare-fun lt!220432 () Unit!14284)

(assert (=> b!488533 (= lt!220432 lt!220430)))

(declare-fun res!291648 () Bool)

(assert (=> b!488533 (= res!291648 (= (seekEntryOrOpen!0 (select (arr!15202 a!3235) j!176) a!3235 mask!3524) (Found!3669 j!176)))))

(assert (=> b!488533 (=> (not res!291648) (not e!287387))))

(assert (= (and d!77819 (not res!291647)) b!488530))

(assert (= (and b!488530 c!58711) b!488533))

(assert (= (and b!488530 (not c!58711)) b!488532))

(assert (= (and b!488533 res!291648) b!488531))

(assert (= (or b!488531 b!488532) bm!31336))

(assert (=> b!488530 m!468151))

(assert (=> b!488530 m!468151))

(assert (=> b!488530 m!468153))

(declare-fun m!468255 () Bool)

(assert (=> bm!31336 m!468255))

(assert (=> b!488533 m!468151))

(declare-fun m!468257 () Bool)

(assert (=> b!488533 m!468257))

(declare-fun m!468259 () Bool)

(assert (=> b!488533 m!468259))

(assert (=> b!488533 m!468151))

(assert (=> b!488533 m!468165))

(assert (=> b!488419 d!77819))

(declare-fun d!77821 () Bool)

(assert (=> d!77821 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220435 () Unit!14284)

(declare-fun choose!38 (array!31623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14284)

(assert (=> d!77821 (= lt!220435 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77821 (validMask!0 mask!3524)))

(assert (=> d!77821 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220435)))

(declare-fun bs!15569 () Bool)

(assert (= bs!15569 d!77821))

(assert (=> bs!15569 m!468167))

(declare-fun m!468261 () Bool)

(assert (=> bs!15569 m!468261))

(assert (=> bs!15569 m!468147))

(assert (=> b!488419 d!77821))

(declare-fun d!77823 () Bool)

(declare-fun res!291653 () Bool)

(declare-fun e!287399 () Bool)

(assert (=> d!77823 (=> res!291653 e!287399)))

(assert (=> d!77823 (= res!291653 (= (select (arr!15202 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77823 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!287399)))

(declare-fun b!488553 () Bool)

(declare-fun e!287400 () Bool)

(assert (=> b!488553 (= e!287399 e!287400)))

(declare-fun res!291654 () Bool)

(assert (=> b!488553 (=> (not res!291654) (not e!287400))))

(assert (=> b!488553 (= res!291654 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15566 a!3235)))))

(declare-fun b!488555 () Bool)

(assert (=> b!488555 (= e!287400 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77823 (not res!291653)) b!488553))

(assert (= (and b!488553 res!291654) b!488555))

(assert (=> d!77823 m!468195))

(declare-fun m!468263 () Bool)

(assert (=> b!488555 m!468263))

(assert (=> b!488412 d!77823))

(declare-fun d!77825 () Bool)

(assert (=> d!77825 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44468 d!77825))

(declare-fun d!77833 () Bool)

(assert (=> d!77833 (= (array_inv!10998 a!3235) (bvsge (size!15566 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44468 d!77833))

(declare-fun b!488583 () Bool)

(declare-fun e!287418 () SeekEntryResult!3669)

(declare-fun e!287416 () SeekEntryResult!3669)

(assert (=> b!488583 (= e!287418 e!287416)))

(declare-fun lt!220459 () (_ BitVec 64))

(declare-fun lt!220458 () SeekEntryResult!3669)

(assert (=> b!488583 (= lt!220459 (select (arr!15202 a!3235) (index!16857 lt!220458)))))

(declare-fun c!58735 () Bool)

(assert (=> b!488583 (= c!58735 (= lt!220459 (select (arr!15202 a!3235) j!176)))))

(declare-fun b!488584 () Bool)

(assert (=> b!488584 (= e!287416 (Found!3669 (index!16857 lt!220458)))))

(declare-fun b!488585 () Bool)

(declare-fun c!58734 () Bool)

(assert (=> b!488585 (= c!58734 (= lt!220459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287417 () SeekEntryResult!3669)

(assert (=> b!488585 (= e!287416 e!287417)))

(declare-fun d!77835 () Bool)

(declare-fun lt!220457 () SeekEntryResult!3669)

(assert (=> d!77835 (and (or ((_ is Undefined!3669) lt!220457) (not ((_ is Found!3669) lt!220457)) (and (bvsge (index!16856 lt!220457) #b00000000000000000000000000000000) (bvslt (index!16856 lt!220457) (size!15566 a!3235)))) (or ((_ is Undefined!3669) lt!220457) ((_ is Found!3669) lt!220457) (not ((_ is MissingZero!3669) lt!220457)) (and (bvsge (index!16855 lt!220457) #b00000000000000000000000000000000) (bvslt (index!16855 lt!220457) (size!15566 a!3235)))) (or ((_ is Undefined!3669) lt!220457) ((_ is Found!3669) lt!220457) ((_ is MissingZero!3669) lt!220457) (not ((_ is MissingVacant!3669) lt!220457)) (and (bvsge (index!16858 lt!220457) #b00000000000000000000000000000000) (bvslt (index!16858 lt!220457) (size!15566 a!3235)))) (or ((_ is Undefined!3669) lt!220457) (ite ((_ is Found!3669) lt!220457) (= (select (arr!15202 a!3235) (index!16856 lt!220457)) (select (arr!15202 a!3235) j!176)) (ite ((_ is MissingZero!3669) lt!220457) (= (select (arr!15202 a!3235) (index!16855 lt!220457)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3669) lt!220457) (= (select (arr!15202 a!3235) (index!16858 lt!220457)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77835 (= lt!220457 e!287418)))

(declare-fun c!58733 () Bool)

(assert (=> d!77835 (= c!58733 (and ((_ is Intermediate!3669) lt!220458) (undefined!4481 lt!220458)))))

(assert (=> d!77835 (= lt!220458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15202 a!3235) j!176) mask!3524) (select (arr!15202 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77835 (validMask!0 mask!3524)))

(assert (=> d!77835 (= (seekEntryOrOpen!0 (select (arr!15202 a!3235) j!176) a!3235 mask!3524) lt!220457)))

(declare-fun b!488582 () Bool)

(assert (=> b!488582 (= e!287418 Undefined!3669)))

(declare-fun b!488586 () Bool)

(assert (=> b!488586 (= e!287417 (seekKeyOrZeroReturnVacant!0 (x!45972 lt!220458) (index!16857 lt!220458) (index!16857 lt!220458) (select (arr!15202 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!488587 () Bool)

(assert (=> b!488587 (= e!287417 (MissingZero!3669 (index!16857 lt!220458)))))

(assert (= (and d!77835 c!58733) b!488582))

(assert (= (and d!77835 (not c!58733)) b!488583))

(assert (= (and b!488583 c!58735) b!488584))

(assert (= (and b!488583 (not c!58735)) b!488585))

(assert (= (and b!488585 c!58734) b!488587))

(assert (= (and b!488585 (not c!58734)) b!488586))

(declare-fun m!468307 () Bool)

(assert (=> b!488583 m!468307))

(declare-fun m!468309 () Bool)

(assert (=> d!77835 m!468309))

(assert (=> d!77835 m!468151))

(declare-fun m!468311 () Bool)

(assert (=> d!77835 m!468311))

(declare-fun m!468313 () Bool)

(assert (=> d!77835 m!468313))

(assert (=> d!77835 m!468147))

(assert (=> d!77835 m!468151))

(assert (=> d!77835 m!468309))

(declare-fun m!468315 () Bool)

(assert (=> d!77835 m!468315))

(declare-fun m!468317 () Bool)

(assert (=> d!77835 m!468317))

(assert (=> b!488586 m!468151))

(declare-fun m!468319 () Bool)

(assert (=> b!488586 m!468319))

(assert (=> b!488417 d!77835))

(declare-fun d!77837 () Bool)

(assert (=> d!77837 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488418 d!77837))

(check-sat (not d!77799) (not b!488586) (not b!488530) (not d!77821) (not d!77835) (not bm!31325) (not b!488459) (not b!488555) (not b!488461) (not b!488458) (not bm!31328) (not bm!31336) (not b!488484) (not b!488481) (not b!488533) (not b!488528))
(check-sat)
