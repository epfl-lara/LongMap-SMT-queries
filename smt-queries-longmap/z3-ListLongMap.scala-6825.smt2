; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86074 () Bool)

(assert start!86074)

(declare-datatypes ((array!63033 0))(
  ( (array!63034 (arr!30346 (Array (_ BitVec 32) (_ BitVec 64))) (size!30849 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63033)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun b!996543 () Bool)

(declare-fun e!562416 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!996543 (= e!562416 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30849 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30849 a!3219)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun res!666268 () Bool)

(declare-fun e!562414 () Bool)

(assert (=> start!86074 (=> (not res!666268) (not e!562414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86074 (= res!666268 (validMask!0 mask!3464))))

(assert (=> start!86074 e!562414))

(declare-fun array_inv!23482 (array!63033) Bool)

(assert (=> start!86074 (array_inv!23482 a!3219)))

(assert (=> start!86074 true))

(declare-fun b!996544 () Bool)

(declare-fun res!666270 () Bool)

(assert (=> b!996544 (=> (not res!666270) (not e!562414))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996544 (= res!666270 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996545 () Bool)

(declare-fun res!666269 () Bool)

(assert (=> b!996545 (=> (not res!666269) (not e!562416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63033 (_ BitVec 32)) Bool)

(assert (=> b!996545 (= res!666269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996546 () Bool)

(declare-fun res!666271 () Bool)

(assert (=> b!996546 (=> (not res!666271) (not e!562414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996546 (= res!666271 (validKeyInArray!0 k0!2224))))

(declare-fun b!996547 () Bool)

(declare-fun res!666272 () Bool)

(assert (=> b!996547 (=> (not res!666272) (not e!562414))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996547 (= res!666272 (and (= (size!30849 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30849 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30849 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996548 () Bool)

(declare-fun res!666274 () Bool)

(assert (=> b!996548 (=> (not res!666274) (not e!562414))))

(assert (=> b!996548 (= res!666274 (validKeyInArray!0 (select (arr!30346 a!3219) j!170)))))

(declare-fun b!996549 () Bool)

(declare-fun res!666275 () Bool)

(assert (=> b!996549 (=> (not res!666275) (not e!562416))))

(declare-datatypes ((List!20993 0))(
  ( (Nil!20990) (Cons!20989 (h!22157 (_ BitVec 64)) (t!29986 List!20993)) )
))
(declare-fun arrayNoDuplicates!0 (array!63033 (_ BitVec 32) List!20993) Bool)

(assert (=> b!996549 (= res!666275 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!20990))))

(declare-fun b!996550 () Bool)

(assert (=> b!996550 (= e!562414 e!562416)))

(declare-fun res!666273 () Bool)

(assert (=> b!996550 (=> (not res!666273) (not e!562416))))

(declare-datatypes ((SeekEntryResult!9214 0))(
  ( (MissingZero!9214 (index!39227 (_ BitVec 32))) (Found!9214 (index!39228 (_ BitVec 32))) (Intermediate!9214 (undefined!10026 Bool) (index!39229 (_ BitVec 32)) (x!86821 (_ BitVec 32))) (Undefined!9214) (MissingVacant!9214 (index!39230 (_ BitVec 32))) )
))
(declare-fun lt!441365 () SeekEntryResult!9214)

(assert (=> b!996550 (= res!666273 (or (= lt!441365 (MissingVacant!9214 i!1194)) (= lt!441365 (MissingZero!9214 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63033 (_ BitVec 32)) SeekEntryResult!9214)

(assert (=> b!996550 (= lt!441365 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86074 res!666268) b!996547))

(assert (= (and b!996547 res!666272) b!996548))

(assert (= (and b!996548 res!666274) b!996546))

(assert (= (and b!996546 res!666271) b!996544))

(assert (= (and b!996544 res!666270) b!996550))

(assert (= (and b!996550 res!666273) b!996545))

(assert (= (and b!996545 res!666269) b!996549))

(assert (= (and b!996549 res!666275) b!996543))

(declare-fun m!924317 () Bool)

(assert (=> b!996545 m!924317))

(declare-fun m!924319 () Bool)

(assert (=> b!996548 m!924319))

(assert (=> b!996548 m!924319))

(declare-fun m!924321 () Bool)

(assert (=> b!996548 m!924321))

(declare-fun m!924323 () Bool)

(assert (=> b!996546 m!924323))

(declare-fun m!924325 () Bool)

(assert (=> b!996544 m!924325))

(declare-fun m!924327 () Bool)

(assert (=> b!996550 m!924327))

(declare-fun m!924329 () Bool)

(assert (=> b!996549 m!924329))

(declare-fun m!924331 () Bool)

(assert (=> start!86074 m!924331))

(declare-fun m!924333 () Bool)

(assert (=> start!86074 m!924333))

(check-sat (not b!996544) (not b!996549) (not start!86074) (not b!996545) (not b!996546) (not b!996548) (not b!996550))
(check-sat)
(get-model)

(declare-fun d!119251 () Bool)

(assert (=> d!119251 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86074 d!119251))

(declare-fun d!119253 () Bool)

(assert (=> d!119253 (= (array_inv!23482 a!3219) (bvsge (size!30849 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86074 d!119253))

(declare-fun d!119255 () Bool)

(declare-fun res!666328 () Bool)

(declare-fun e!562439 () Bool)

(assert (=> d!119255 (=> res!666328 e!562439)))

(assert (=> d!119255 (= res!666328 (= (select (arr!30346 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119255 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562439)))

(declare-fun b!996603 () Bool)

(declare-fun e!562440 () Bool)

(assert (=> b!996603 (= e!562439 e!562440)))

(declare-fun res!666329 () Bool)

(assert (=> b!996603 (=> (not res!666329) (not e!562440))))

(assert (=> b!996603 (= res!666329 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30849 a!3219)))))

(declare-fun b!996604 () Bool)

(assert (=> b!996604 (= e!562440 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119255 (not res!666328)) b!996603))

(assert (= (and b!996603 res!666329) b!996604))

(declare-fun m!924371 () Bool)

(assert (=> d!119255 m!924371))

(declare-fun m!924373 () Bool)

(assert (=> b!996604 m!924373))

(assert (=> b!996544 d!119255))

(declare-fun b!996625 () Bool)

(declare-fun e!562457 () Bool)

(declare-fun e!562459 () Bool)

(assert (=> b!996625 (= e!562457 e!562459)))

(declare-fun res!666344 () Bool)

(assert (=> b!996625 (=> (not res!666344) (not e!562459))))

(declare-fun e!562458 () Bool)

(assert (=> b!996625 (= res!666344 (not e!562458))))

(declare-fun res!666342 () Bool)

(assert (=> b!996625 (=> (not res!666342) (not e!562458))))

(assert (=> b!996625 (= res!666342 (validKeyInArray!0 (select (arr!30346 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42252 () Bool)

(declare-fun call!42255 () Bool)

(declare-fun c!101286 () Bool)

(assert (=> bm!42252 (= call!42255 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101286 (Cons!20989 (select (arr!30346 a!3219) #b00000000000000000000000000000000) Nil!20990) Nil!20990)))))

(declare-fun b!996626 () Bool)

(declare-fun contains!5883 (List!20993 (_ BitVec 64)) Bool)

(assert (=> b!996626 (= e!562458 (contains!5883 Nil!20990 (select (arr!30346 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996627 () Bool)

(declare-fun e!562460 () Bool)

(assert (=> b!996627 (= e!562459 e!562460)))

(assert (=> b!996627 (= c!101286 (validKeyInArray!0 (select (arr!30346 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119261 () Bool)

(declare-fun res!666343 () Bool)

(assert (=> d!119261 (=> res!666343 e!562457)))

(assert (=> d!119261 (= res!666343 (bvsge #b00000000000000000000000000000000 (size!30849 a!3219)))))

(assert (=> d!119261 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!20990) e!562457)))

(declare-fun b!996628 () Bool)

(assert (=> b!996628 (= e!562460 call!42255)))

(declare-fun b!996629 () Bool)

(assert (=> b!996629 (= e!562460 call!42255)))

(assert (= (and d!119261 (not res!666343)) b!996625))

(assert (= (and b!996625 res!666342) b!996626))

(assert (= (and b!996625 res!666344) b!996627))

(assert (= (and b!996627 c!101286) b!996628))

(assert (= (and b!996627 (not c!101286)) b!996629))

(assert (= (or b!996628 b!996629) bm!42252))

(assert (=> b!996625 m!924371))

(assert (=> b!996625 m!924371))

(declare-fun m!924375 () Bool)

(assert (=> b!996625 m!924375))

(assert (=> bm!42252 m!924371))

(declare-fun m!924377 () Bool)

(assert (=> bm!42252 m!924377))

(assert (=> b!996626 m!924371))

(assert (=> b!996626 m!924371))

(declare-fun m!924379 () Bool)

(assert (=> b!996626 m!924379))

(assert (=> b!996627 m!924371))

(assert (=> b!996627 m!924371))

(assert (=> b!996627 m!924375))

(assert (=> b!996549 d!119261))

(declare-fun d!119265 () Bool)

(declare-fun lt!441384 () SeekEntryResult!9214)

(get-info :version)

(assert (=> d!119265 (and (or ((_ is Undefined!9214) lt!441384) (not ((_ is Found!9214) lt!441384)) (and (bvsge (index!39228 lt!441384) #b00000000000000000000000000000000) (bvslt (index!39228 lt!441384) (size!30849 a!3219)))) (or ((_ is Undefined!9214) lt!441384) ((_ is Found!9214) lt!441384) (not ((_ is MissingZero!9214) lt!441384)) (and (bvsge (index!39227 lt!441384) #b00000000000000000000000000000000) (bvslt (index!39227 lt!441384) (size!30849 a!3219)))) (or ((_ is Undefined!9214) lt!441384) ((_ is Found!9214) lt!441384) ((_ is MissingZero!9214) lt!441384) (not ((_ is MissingVacant!9214) lt!441384)) (and (bvsge (index!39230 lt!441384) #b00000000000000000000000000000000) (bvslt (index!39230 lt!441384) (size!30849 a!3219)))) (or ((_ is Undefined!9214) lt!441384) (ite ((_ is Found!9214) lt!441384) (= (select (arr!30346 a!3219) (index!39228 lt!441384)) k0!2224) (ite ((_ is MissingZero!9214) lt!441384) (= (select (arr!30346 a!3219) (index!39227 lt!441384)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9214) lt!441384) (= (select (arr!30346 a!3219) (index!39230 lt!441384)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!562484 () SeekEntryResult!9214)

(assert (=> d!119265 (= lt!441384 e!562484)))

(declare-fun c!101298 () Bool)

(declare-fun lt!441386 () SeekEntryResult!9214)

(assert (=> d!119265 (= c!101298 (and ((_ is Intermediate!9214) lt!441386) (undefined!10026 lt!441386)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63033 (_ BitVec 32)) SeekEntryResult!9214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119265 (= lt!441386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119265 (validMask!0 mask!3464)))

(assert (=> d!119265 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441384)))

(declare-fun b!996661 () Bool)

(declare-fun e!562485 () SeekEntryResult!9214)

(assert (=> b!996661 (= e!562484 e!562485)))

(declare-fun lt!441385 () (_ BitVec 64))

(assert (=> b!996661 (= lt!441385 (select (arr!30346 a!3219) (index!39229 lt!441386)))))

(declare-fun c!101296 () Bool)

(assert (=> b!996661 (= c!101296 (= lt!441385 k0!2224))))

(declare-fun b!996662 () Bool)

(declare-fun e!562483 () SeekEntryResult!9214)

(assert (=> b!996662 (= e!562483 (MissingZero!9214 (index!39229 lt!441386)))))

(declare-fun b!996663 () Bool)

(assert (=> b!996663 (= e!562484 Undefined!9214)))

(declare-fun b!996664 () Bool)

(assert (=> b!996664 (= e!562485 (Found!9214 (index!39229 lt!441386)))))

(declare-fun b!996665 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63033 (_ BitVec 32)) SeekEntryResult!9214)

(assert (=> b!996665 (= e!562483 (seekKeyOrZeroReturnVacant!0 (x!86821 lt!441386) (index!39229 lt!441386) (index!39229 lt!441386) k0!2224 a!3219 mask!3464))))

(declare-fun b!996666 () Bool)

(declare-fun c!101297 () Bool)

(assert (=> b!996666 (= c!101297 (= lt!441385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!996666 (= e!562485 e!562483)))

(assert (= (and d!119265 c!101298) b!996663))

(assert (= (and d!119265 (not c!101298)) b!996661))

(assert (= (and b!996661 c!101296) b!996664))

(assert (= (and b!996661 (not c!101296)) b!996666))

(assert (= (and b!996666 c!101297) b!996662))

(assert (= (and b!996666 (not c!101297)) b!996665))

(declare-fun m!924393 () Bool)

(assert (=> d!119265 m!924393))

(declare-fun m!924395 () Bool)

(assert (=> d!119265 m!924395))

(declare-fun m!924397 () Bool)

(assert (=> d!119265 m!924397))

(assert (=> d!119265 m!924393))

(declare-fun m!924399 () Bool)

(assert (=> d!119265 m!924399))

(assert (=> d!119265 m!924331))

(declare-fun m!924401 () Bool)

(assert (=> d!119265 m!924401))

(declare-fun m!924403 () Bool)

(assert (=> b!996661 m!924403))

(declare-fun m!924405 () Bool)

(assert (=> b!996665 m!924405))

(assert (=> b!996550 d!119265))

(declare-fun b!996703 () Bool)

(declare-fun e!562512 () Bool)

(declare-fun call!42262 () Bool)

(assert (=> b!996703 (= e!562512 call!42262)))

(declare-fun d!119281 () Bool)

(declare-fun res!666372 () Bool)

(declare-fun e!562514 () Bool)

(assert (=> d!119281 (=> res!666372 e!562514)))

(assert (=> d!119281 (= res!666372 (bvsge #b00000000000000000000000000000000 (size!30849 a!3219)))))

(assert (=> d!119281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562514)))

(declare-fun bm!42259 () Bool)

(assert (=> bm!42259 (= call!42262 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!996704 () Bool)

(assert (=> b!996704 (= e!562514 e!562512)))

(declare-fun c!101311 () Bool)

(assert (=> b!996704 (= c!101311 (validKeyInArray!0 (select (arr!30346 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!996706 () Bool)

(declare-fun e!562513 () Bool)

(assert (=> b!996706 (= e!562512 e!562513)))

(declare-fun lt!441407 () (_ BitVec 64))

(assert (=> b!996706 (= lt!441407 (select (arr!30346 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32949 0))(
  ( (Unit!32950) )
))
(declare-fun lt!441406 () Unit!32949)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63033 (_ BitVec 64) (_ BitVec 32)) Unit!32949)

(assert (=> b!996706 (= lt!441406 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441407 #b00000000000000000000000000000000))))

(assert (=> b!996706 (arrayContainsKey!0 a!3219 lt!441407 #b00000000000000000000000000000000)))

(declare-fun lt!441405 () Unit!32949)

(assert (=> b!996706 (= lt!441405 lt!441406)))

(declare-fun res!666373 () Bool)

(assert (=> b!996706 (= res!666373 (= (seekEntryOrOpen!0 (select (arr!30346 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9214 #b00000000000000000000000000000000)))))

(assert (=> b!996706 (=> (not res!666373) (not e!562513))))

(declare-fun b!996708 () Bool)

(assert (=> b!996708 (= e!562513 call!42262)))

(assert (= (and d!119281 (not res!666372)) b!996704))

(assert (= (and b!996704 c!101311) b!996706))

(assert (= (and b!996704 (not c!101311)) b!996703))

(assert (= (and b!996706 res!666373) b!996708))

(assert (= (or b!996708 b!996703) bm!42259))

(declare-fun m!924431 () Bool)

(assert (=> bm!42259 m!924431))

(assert (=> b!996704 m!924371))

(assert (=> b!996704 m!924371))

(assert (=> b!996704 m!924375))

(assert (=> b!996706 m!924371))

(declare-fun m!924433 () Bool)

(assert (=> b!996706 m!924433))

(declare-fun m!924435 () Bool)

(assert (=> b!996706 m!924435))

(assert (=> b!996706 m!924371))

(declare-fun m!924437 () Bool)

(assert (=> b!996706 m!924437))

(assert (=> b!996545 d!119281))

(declare-fun d!119291 () Bool)

(assert (=> d!119291 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996546 d!119291))

(declare-fun d!119293 () Bool)

(assert (=> d!119293 (= (validKeyInArray!0 (select (arr!30346 a!3219) j!170)) (and (not (= (select (arr!30346 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30346 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!996548 d!119293))

(check-sat (not bm!42259) (not b!996625) (not d!119265) (not b!996627) (not bm!42252) (not b!996626) (not b!996665) (not b!996706) (not b!996704) (not b!996604))
(check-sat)
