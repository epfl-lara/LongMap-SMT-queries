; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28452 () Bool)

(assert start!28452)

(declare-fun b!291385 () Bool)

(declare-fun res!152726 () Bool)

(declare-fun e!184382 () Bool)

(assert (=> b!291385 (=> (not res!152726) (not e!184382))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291385 (= res!152726 (validKeyInArray!0 k!2524))))

(declare-fun b!291386 () Bool)

(declare-fun res!152723 () Bool)

(assert (=> b!291386 (=> (not res!152723) (not e!184382))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14721 0))(
  ( (array!14722 (arr!6986 (Array (_ BitVec 32) (_ BitVec 64))) (size!7338 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14721)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291386 (= res!152723 (and (= (size!7338 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7338 a!3312))))))

(declare-fun b!291387 () Bool)

(declare-fun e!184379 () Bool)

(declare-fun e!184381 () Bool)

(assert (=> b!291387 (= e!184379 e!184381)))

(declare-fun res!152725 () Bool)

(assert (=> b!291387 (=> (not res!152725) (not e!184381))))

(declare-datatypes ((SeekEntryResult!2135 0))(
  ( (MissingZero!2135 (index!10710 (_ BitVec 32))) (Found!2135 (index!10711 (_ BitVec 32))) (Intermediate!2135 (undefined!2947 Bool) (index!10712 (_ BitVec 32)) (x!28898 (_ BitVec 32))) (Undefined!2135) (MissingVacant!2135 (index!10713 (_ BitVec 32))) )
))
(declare-fun lt!144153 () SeekEntryResult!2135)

(declare-fun lt!144152 () Bool)

(assert (=> b!291387 (= res!152725 (and (not lt!144152) (= lt!144153 (MissingVacant!2135 i!1256))))))

(declare-fun lt!144154 () (_ BitVec 32))

(declare-fun lt!144155 () SeekEntryResult!2135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14721 (_ BitVec 32)) SeekEntryResult!2135)

(assert (=> b!291387 (= lt!144155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144154 k!2524 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312)) mask!3809))))

(declare-fun lt!144157 () SeekEntryResult!2135)

(assert (=> b!291387 (= lt!144157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144154 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291387 (= lt!144154 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291388 () Bool)

(declare-fun e!184380 () Bool)

(assert (=> b!291388 (= e!184381 e!184380)))

(declare-fun res!152729 () Bool)

(assert (=> b!291388 (=> (not res!152729) (not e!184380))))

(declare-fun lt!144156 () Bool)

(assert (=> b!291388 (= res!152729 (and (or lt!144156 (not (undefined!2947 lt!144157))) (not lt!144156) (= (select (arr!6986 a!3312) (index!10712 lt!144157)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291388 (= lt!144156 (not (is-Intermediate!2135 lt!144157)))))

(declare-fun b!291389 () Bool)

(assert (=> b!291389 (= e!184380 (not (or (not (= lt!144157 (Intermediate!2135 false (index!10712 lt!144157) (x!28898 lt!144157)))) (bvsle #b00000000000000000000000000000000 (x!28898 lt!144157)))))))

(assert (=> b!291389 (= (index!10712 lt!144157) i!1256)))

(declare-fun b!291390 () Bool)

(declare-fun res!152730 () Bool)

(assert (=> b!291390 (=> (not res!152730) (not e!184382))))

(declare-fun arrayContainsKey!0 (array!14721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291390 (= res!152730 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291391 () Bool)

(assert (=> b!291391 (= e!184382 e!184379)))

(declare-fun res!152727 () Bool)

(assert (=> b!291391 (=> (not res!152727) (not e!184379))))

(assert (=> b!291391 (= res!152727 (or lt!144152 (= lt!144153 (MissingVacant!2135 i!1256))))))

(assert (=> b!291391 (= lt!144152 (= lt!144153 (MissingZero!2135 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14721 (_ BitVec 32)) SeekEntryResult!2135)

(assert (=> b!291391 (= lt!144153 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291392 () Bool)

(declare-fun res!152728 () Bool)

(assert (=> b!291392 (=> (not res!152728) (not e!184379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14721 (_ BitVec 32)) Bool)

(assert (=> b!291392 (= res!152728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152724 () Bool)

(assert (=> start!28452 (=> (not res!152724) (not e!184382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28452 (= res!152724 (validMask!0 mask!3809))))

(assert (=> start!28452 e!184382))

(assert (=> start!28452 true))

(declare-fun array_inv!4949 (array!14721) Bool)

(assert (=> start!28452 (array_inv!4949 a!3312)))

(assert (= (and start!28452 res!152724) b!291386))

(assert (= (and b!291386 res!152723) b!291385))

(assert (= (and b!291385 res!152726) b!291390))

(assert (= (and b!291390 res!152730) b!291391))

(assert (= (and b!291391 res!152727) b!291392))

(assert (= (and b!291392 res!152728) b!291387))

(assert (= (and b!291387 res!152725) b!291388))

(assert (= (and b!291388 res!152729) b!291389))

(declare-fun m!305325 () Bool)

(assert (=> start!28452 m!305325))

(declare-fun m!305327 () Bool)

(assert (=> start!28452 m!305327))

(declare-fun m!305329 () Bool)

(assert (=> b!291391 m!305329))

(declare-fun m!305331 () Bool)

(assert (=> b!291388 m!305331))

(declare-fun m!305333 () Bool)

(assert (=> b!291387 m!305333))

(declare-fun m!305335 () Bool)

(assert (=> b!291387 m!305335))

(declare-fun m!305337 () Bool)

(assert (=> b!291387 m!305337))

(declare-fun m!305339 () Bool)

(assert (=> b!291387 m!305339))

(declare-fun m!305341 () Bool)

(assert (=> b!291392 m!305341))

(declare-fun m!305343 () Bool)

(assert (=> b!291385 m!305343))

(declare-fun m!305345 () Bool)

(assert (=> b!291390 m!305345))

(push 1)

(assert (not start!28452))

(assert (not b!291387))

(assert (not b!291391))

(assert (not b!291385))

(assert (not b!291392))

(assert (not b!291390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66363 () Bool)

(declare-fun res!152789 () Bool)

(declare-fun e!184426 () Bool)

(assert (=> d!66363 (=> res!152789 e!184426)))

(assert (=> d!66363 (= res!152789 (= (select (arr!6986 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66363 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!184426)))

(declare-fun b!291457 () Bool)

(declare-fun e!184427 () Bool)

(assert (=> b!291457 (= e!184426 e!184427)))

(declare-fun res!152790 () Bool)

(assert (=> b!291457 (=> (not res!152790) (not e!184427))))

(assert (=> b!291457 (= res!152790 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7338 a!3312)))))

(declare-fun b!291458 () Bool)

(assert (=> b!291458 (= e!184427 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66363 (not res!152789)) b!291457))

(assert (= (and b!291457 res!152790) b!291458))

(declare-fun m!305403 () Bool)

(assert (=> d!66363 m!305403))

(declare-fun m!305405 () Bool)

(assert (=> b!291458 m!305405))

(assert (=> b!291390 d!66363))

(declare-fun d!66367 () Bool)

(assert (=> d!66367 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291385 d!66367))

(declare-fun d!66369 () Bool)

(assert (=> d!66369 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28452 d!66369))

(declare-fun d!66373 () Bool)

(assert (=> d!66373 (= (array_inv!4949 a!3312) (bvsge (size!7338 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28452 d!66373))

(declare-fun b!291519 () Bool)

(declare-fun e!184466 () SeekEntryResult!2135)

(declare-fun lt!144227 () SeekEntryResult!2135)

(assert (=> b!291519 (= e!184466 (Found!2135 (index!10712 lt!144227)))))

(declare-fun b!291520 () Bool)

(declare-fun e!184464 () SeekEntryResult!2135)

(assert (=> b!291520 (= e!184464 (MissingZero!2135 (index!10712 lt!144227)))))

(declare-fun d!66377 () Bool)

(declare-fun lt!144229 () SeekEntryResult!2135)

(assert (=> d!66377 (and (or (is-Undefined!2135 lt!144229) (not (is-Found!2135 lt!144229)) (and (bvsge (index!10711 lt!144229) #b00000000000000000000000000000000) (bvslt (index!10711 lt!144229) (size!7338 a!3312)))) (or (is-Undefined!2135 lt!144229) (is-Found!2135 lt!144229) (not (is-MissingZero!2135 lt!144229)) (and (bvsge (index!10710 lt!144229) #b00000000000000000000000000000000) (bvslt (index!10710 lt!144229) (size!7338 a!3312)))) (or (is-Undefined!2135 lt!144229) (is-Found!2135 lt!144229) (is-MissingZero!2135 lt!144229) (not (is-MissingVacant!2135 lt!144229)) (and (bvsge (index!10713 lt!144229) #b00000000000000000000000000000000) (bvslt (index!10713 lt!144229) (size!7338 a!3312)))) (or (is-Undefined!2135 lt!144229) (ite (is-Found!2135 lt!144229) (= (select (arr!6986 a!3312) (index!10711 lt!144229)) k!2524) (ite (is-MissingZero!2135 lt!144229) (= (select (arr!6986 a!3312) (index!10710 lt!144229)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2135 lt!144229) (= (select (arr!6986 a!3312) (index!10713 lt!144229)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!184465 () SeekEntryResult!2135)

(assert (=> d!66377 (= lt!144229 e!184465)))

(declare-fun c!46921 () Bool)

(assert (=> d!66377 (= c!46921 (and (is-Intermediate!2135 lt!144227) (undefined!2947 lt!144227)))))

(assert (=> d!66377 (= lt!144227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66377 (validMask!0 mask!3809)))

(assert (=> d!66377 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!144229)))

(declare-fun b!291521 () Bool)

(assert (=> b!291521 (= e!184465 Undefined!2135)))

(declare-fun b!291522 () Bool)

(declare-fun c!46922 () Bool)

(declare-fun lt!144228 () (_ BitVec 64))

(assert (=> b!291522 (= c!46922 (= lt!144228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291522 (= e!184466 e!184464)))

(declare-fun b!291523 () Bool)

(assert (=> b!291523 (= e!184465 e!184466)))

(assert (=> b!291523 (= lt!144228 (select (arr!6986 a!3312) (index!10712 lt!144227)))))

(declare-fun c!46923 () Bool)

(assert (=> b!291523 (= c!46923 (= lt!144228 k!2524))))

(declare-fun b!291524 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14721 (_ BitVec 32)) SeekEntryResult!2135)

(assert (=> b!291524 (= e!184464 (seekKeyOrZeroReturnVacant!0 (x!28898 lt!144227) (index!10712 lt!144227) (index!10712 lt!144227) k!2524 a!3312 mask!3809))))

(assert (= (and d!66377 c!46921) b!291521))

(assert (= (and d!66377 (not c!46921)) b!291523))

(assert (= (and b!291523 c!46923) b!291519))

(assert (= (and b!291523 (not c!46923)) b!291522))

(assert (= (and b!291522 c!46922) b!291520))

(assert (= (and b!291522 (not c!46922)) b!291524))

(assert (=> d!66377 m!305339))

(declare-fun m!305437 () Bool)

(assert (=> d!66377 m!305437))

(assert (=> d!66377 m!305325))

(declare-fun m!305439 () Bool)

(assert (=> d!66377 m!305439))

(declare-fun m!305441 () Bool)

(assert (=> d!66377 m!305441))

(assert (=> d!66377 m!305339))

(declare-fun m!305443 () Bool)

(assert (=> d!66377 m!305443))

(declare-fun m!305445 () Bool)

(assert (=> b!291523 m!305445))

(declare-fun m!305447 () Bool)

(assert (=> b!291524 m!305447))

(assert (=> b!291391 d!66377))

(declare-fun bm!25645 () Bool)

(declare-fun call!25648 () Bool)

(assert (=> bm!25645 (= call!25648 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!291534 () Bool)

(declare-fun e!184473 () Bool)

(declare-fun e!184474 () Bool)

(assert (=> b!291534 (= e!184473 e!184474)))

(declare-fun lt!144236 () (_ BitVec 64))

(assert (=> b!291534 (= lt!144236 (select (arr!6986 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9146 0))(
  ( (Unit!9147) )
))
(declare-fun lt!144237 () Unit!9146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14721 (_ BitVec 64) (_ BitVec 32)) Unit!9146)

(assert (=> b!291534 (= lt!144237 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144236 #b00000000000000000000000000000000))))

(assert (=> b!291534 (arrayContainsKey!0 a!3312 lt!144236 #b00000000000000000000000000000000)))

(declare-fun lt!144238 () Unit!9146)

(assert (=> b!291534 (= lt!144238 lt!144237)))

(declare-fun res!152807 () Bool)

(assert (=> b!291534 (= res!152807 (= (seekEntryOrOpen!0 (select (arr!6986 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2135 #b00000000000000000000000000000000)))))

(assert (=> b!291534 (=> (not res!152807) (not e!184474))))

(declare-fun b!291535 () Bool)

(assert (=> b!291535 (= e!184474 call!25648)))

(declare-fun b!291536 () Bool)

(assert (=> b!291536 (= e!184473 call!25648)))

(declare-fun d!66389 () Bool)

(declare-fun res!152808 () Bool)

(declare-fun e!184475 () Bool)

(assert (=> d!66389 (=> res!152808 e!184475)))

(assert (=> d!66389 (= res!152808 (bvsge #b00000000000000000000000000000000 (size!7338 a!3312)))))

(assert (=> d!66389 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184475)))

(declare-fun b!291533 () Bool)

(assert (=> b!291533 (= e!184475 e!184473)))

(declare-fun c!46926 () Bool)

(assert (=> b!291533 (= c!46926 (validKeyInArray!0 (select (arr!6986 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66389 (not res!152808)) b!291533))

(assert (= (and b!291533 c!46926) b!291534))

(assert (= (and b!291533 (not c!46926)) b!291536))

(assert (= (and b!291534 res!152807) b!291535))

(assert (= (or b!291535 b!291536) bm!25645))

(declare-fun m!305449 () Bool)

(assert (=> bm!25645 m!305449))

(assert (=> b!291534 m!305403))

(declare-fun m!305451 () Bool)

(assert (=> b!291534 m!305451))

(declare-fun m!305453 () Bool)

(assert (=> b!291534 m!305453))

(assert (=> b!291534 m!305403))

(declare-fun m!305455 () Bool)

(assert (=> b!291534 m!305455))

(assert (=> b!291533 m!305403))

(assert (=> b!291533 m!305403))

(declare-fun m!305457 () Bool)

(assert (=> b!291533 m!305457))

(assert (=> b!291392 d!66389))

(declare-fun b!291603 () Bool)

(declare-fun e!184518 () SeekEntryResult!2135)

(assert (=> b!291603 (= e!184518 (Intermediate!2135 true lt!144154 #b00000000000000000000000000000000))))

(declare-fun b!291604 () Bool)

(declare-fun e!184519 () Bool)

(declare-fun e!184517 () Bool)

(assert (=> b!291604 (= e!184519 e!184517)))

(declare-fun res!152834 () Bool)

(declare-fun lt!144267 () SeekEntryResult!2135)

(assert (=> b!291604 (= res!152834 (and (is-Intermediate!2135 lt!144267) (not (undefined!2947 lt!144267)) (bvslt (x!28898 lt!144267) #b01111111111111111111111111111110) (bvsge (x!28898 lt!144267) #b00000000000000000000000000000000) (bvsge (x!28898 lt!144267) #b00000000000000000000000000000000)))))

(assert (=> b!291604 (=> (not res!152834) (not e!184517))))

(declare-fun b!291605 () Bool)

(assert (=> b!291605 (= e!184519 (bvsge (x!28898 lt!144267) #b01111111111111111111111111111110))))

(declare-fun b!291606 () Bool)

(assert (=> b!291606 (and (bvsge (index!10712 lt!144267) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144267) (size!7338 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312)))))))

(declare-fun e!184515 () Bool)

(assert (=> b!291606 (= e!184515 (= (select (arr!6986 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312))) (index!10712 lt!144267)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291607 () Bool)

(declare-fun e!184516 () SeekEntryResult!2135)

(assert (=> b!291607 (= e!184516 (Intermediate!2135 false lt!144154 #b00000000000000000000000000000000))))

(declare-fun d!66393 () Bool)

(assert (=> d!66393 e!184519))

(declare-fun c!46950 () Bool)

(assert (=> d!66393 (= c!46950 (and (is-Intermediate!2135 lt!144267) (undefined!2947 lt!144267)))))

(assert (=> d!66393 (= lt!144267 e!184518)))

(declare-fun c!46948 () Bool)

(assert (=> d!66393 (= c!46948 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144266 () (_ BitVec 64))

(assert (=> d!66393 (= lt!144266 (select (arr!6986 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312))) lt!144154))))

(assert (=> d!66393 (validMask!0 mask!3809)))

(assert (=> d!66393 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144154 k!2524 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312)) mask!3809) lt!144267)))

(declare-fun b!291608 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291608 (= e!184516 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144154 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312)) mask!3809))))

(declare-fun b!291609 () Bool)

(assert (=> b!291609 (and (bvsge (index!10712 lt!144267) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144267) (size!7338 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312)))))))

(declare-fun res!152836 () Bool)

(assert (=> b!291609 (= res!152836 (= (select (arr!6986 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312))) (index!10712 lt!144267)) k!2524))))

(assert (=> b!291609 (=> res!152836 e!184515)))

(assert (=> b!291609 (= e!184517 e!184515)))

(declare-fun b!291610 () Bool)

(assert (=> b!291610 (= e!184518 e!184516)))

(declare-fun c!46949 () Bool)

(assert (=> b!291610 (= c!46949 (or (= lt!144266 k!2524) (= (bvadd lt!144266 lt!144266) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291611 () Bool)

(assert (=> b!291611 (and (bvsge (index!10712 lt!144267) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144267) (size!7338 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312)))))))

(declare-fun res!152835 () Bool)

(assert (=> b!291611 (= res!152835 (= (select (arr!6986 (array!14722 (store (arr!6986 a!3312) i!1256 k!2524) (size!7338 a!3312))) (index!10712 lt!144267)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291611 (=> res!152835 e!184515)))

(assert (= (and d!66393 c!46948) b!291603))

(assert (= (and d!66393 (not c!46948)) b!291610))

(assert (= (and b!291610 c!46949) b!291607))

(assert (= (and b!291610 (not c!46949)) b!291608))

(assert (= (and d!66393 c!46950) b!291605))

(assert (= (and d!66393 (not c!46950)) b!291604))

(assert (= (and b!291604 res!152834) b!291609))

(assert (= (and b!291609 (not res!152836)) b!291611))

(assert (= (and b!291611 (not res!152835)) b!291606))

(declare-fun m!305483 () Bool)

(assert (=> b!291608 m!305483))

(assert (=> b!291608 m!305483))

(declare-fun m!305485 () Bool)

(assert (=> b!291608 m!305485))

(declare-fun m!305487 () Bool)

(assert (=> b!291609 m!305487))

(declare-fun m!305489 () Bool)

(assert (=> d!66393 m!305489))

(assert (=> d!66393 m!305325))

(assert (=> b!291611 m!305487))

(assert (=> b!291606 m!305487))

(assert (=> b!291387 d!66393))

(declare-fun b!291612 () Bool)

(declare-fun e!184523 () SeekEntryResult!2135)

(assert (=> b!291612 (= e!184523 (Intermediate!2135 true lt!144154 #b00000000000000000000000000000000))))

(declare-fun b!291613 () Bool)

(declare-fun e!184524 () Bool)

(declare-fun e!184522 () Bool)

(assert (=> b!291613 (= e!184524 e!184522)))

(declare-fun res!152837 () Bool)

(declare-fun lt!144269 () SeekEntryResult!2135)

(assert (=> b!291613 (= res!152837 (and (is-Intermediate!2135 lt!144269) (not (undefined!2947 lt!144269)) (bvslt (x!28898 lt!144269) #b01111111111111111111111111111110) (bvsge (x!28898 lt!144269) #b00000000000000000000000000000000) (bvsge (x!28898 lt!144269) #b00000000000000000000000000000000)))))

(assert (=> b!291613 (=> (not res!152837) (not e!184522))))

(declare-fun b!291614 () Bool)

(assert (=> b!291614 (= e!184524 (bvsge (x!28898 lt!144269) #b01111111111111111111111111111110))))

(declare-fun b!291615 () Bool)

(assert (=> b!291615 (and (bvsge (index!10712 lt!144269) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144269) (size!7338 a!3312)))))

(declare-fun e!184520 () Bool)

(assert (=> b!291615 (= e!184520 (= (select (arr!6986 a!3312) (index!10712 lt!144269)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291616 () Bool)

(declare-fun e!184521 () SeekEntryResult!2135)

(assert (=> b!291616 (= e!184521 (Intermediate!2135 false lt!144154 #b00000000000000000000000000000000))))

(declare-fun d!66405 () Bool)

(assert (=> d!66405 e!184524))

(declare-fun c!46953 () Bool)

(assert (=> d!66405 (= c!46953 (and (is-Intermediate!2135 lt!144269) (undefined!2947 lt!144269)))))

(assert (=> d!66405 (= lt!144269 e!184523)))

(declare-fun c!46951 () Bool)

(assert (=> d!66405 (= c!46951 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144268 () (_ BitVec 64))

(assert (=> d!66405 (= lt!144268 (select (arr!6986 a!3312) lt!144154))))

(assert (=> d!66405 (validMask!0 mask!3809)))

(assert (=> d!66405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144154 k!2524 a!3312 mask!3809) lt!144269)))

(declare-fun b!291617 () Bool)

(assert (=> b!291617 (= e!184521 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144154 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!291618 () Bool)

(assert (=> b!291618 (and (bvsge (index!10712 lt!144269) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144269) (size!7338 a!3312)))))

(declare-fun res!152839 () Bool)

(assert (=> b!291618 (= res!152839 (= (select (arr!6986 a!3312) (index!10712 lt!144269)) k!2524))))

(assert (=> b!291618 (=> res!152839 e!184520)))

(assert (=> b!291618 (= e!184522 e!184520)))

(declare-fun b!291619 () Bool)

(assert (=> b!291619 (= e!184523 e!184521)))

(declare-fun c!46952 () Bool)

(assert (=> b!291619 (= c!46952 (or (= lt!144268 k!2524) (= (bvadd lt!144268 lt!144268) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291620 () Bool)

(assert (=> b!291620 (and (bvsge (index!10712 lt!144269) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144269) (size!7338 a!3312)))))

(declare-fun res!152838 () Bool)

(assert (=> b!291620 (= res!152838 (= (select (arr!6986 a!3312) (index!10712 lt!144269)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291620 (=> res!152838 e!184520)))

(assert (= (and d!66405 c!46951) b!291612))

(assert (= (and d!66405 (not c!46951)) b!291619))

(assert (= (and b!291619 c!46952) b!291616))

(assert (= (and b!291619 (not c!46952)) b!291617))

(assert (= (and d!66405 c!46953) b!291614))

(assert (= (and d!66405 (not c!46953)) b!291613))

(assert (= (and b!291613 res!152837) b!291618))

(assert (= (and b!291618 (not res!152839)) b!291620))

(assert (= (and b!291620 (not res!152838)) b!291615))

(assert (=> b!291617 m!305483))

(assert (=> b!291617 m!305483))

(declare-fun m!305491 () Bool)

(assert (=> b!291617 m!305491))

(declare-fun m!305493 () Bool)

(assert (=> b!291618 m!305493))

(declare-fun m!305495 () Bool)

(assert (=> d!66405 m!305495))

(assert (=> d!66405 m!305325))

(assert (=> b!291620 m!305493))

(assert (=> b!291615 m!305493))

(assert (=> b!291387 d!66405))

(declare-fun d!66407 () Bool)

(declare-fun lt!144279 () (_ BitVec 32))

(declare-fun lt!144278 () (_ BitVec 32))

(assert (=> d!66407 (= lt!144279 (bvmul (bvxor lt!144278 (bvlshr lt!144278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66407 (= lt!144278 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66407 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!152840 (let ((h!5263 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28904 (bvmul (bvxor h!5263 (bvlshr h!5263 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28904 (bvlshr x!28904 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!152840 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!152840 #b00000000000000000000000000000000))))))

(assert (=> d!66407 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!144279 (bvlshr lt!144279 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291387 d!66407))

(push 1)

