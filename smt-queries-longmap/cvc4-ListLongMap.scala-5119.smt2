; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69486 () Bool)

(assert start!69486)

(declare-fun b!810012 () Bool)

(declare-fun e!448356 () Bool)

(declare-fun e!448358 () Bool)

(assert (=> b!810012 (= e!448356 e!448358)))

(declare-fun res!553530 () Bool)

(assert (=> b!810012 (=> (not res!553530) (not e!448358))))

(declare-datatypes ((array!44033 0))(
  ( (array!44034 (arr!21089 (Array (_ BitVec 32) (_ BitVec 64))) (size!21510 (_ BitVec 32))) )
))
(declare-fun lt!363020 () array!44033)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8680 0))(
  ( (MissingZero!8680 (index!37088 (_ BitVec 32))) (Found!8680 (index!37089 (_ BitVec 32))) (Intermediate!8680 (undefined!9492 Bool) (index!37090 (_ BitVec 32)) (x!67894 (_ BitVec 32))) (Undefined!8680) (MissingVacant!8680 (index!37091 (_ BitVec 32))) )
))
(declare-fun lt!363023 () SeekEntryResult!8680)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!363025 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44033 (_ BitVec 32)) SeekEntryResult!8680)

(assert (=> b!810012 (= res!553530 (= lt!363023 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363025 lt!363020 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44033 (_ BitVec 32)) SeekEntryResult!8680)

(assert (=> b!810012 (= lt!363023 (seekEntryOrOpen!0 lt!363025 lt!363020 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!44033)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810012 (= lt!363025 (select (store (arr!21089 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!810012 (= lt!363020 (array!44034 (store (arr!21089 a!3170) i!1163 k!2044) (size!21510 a!3170)))))

(declare-fun b!810013 () Bool)

(declare-fun res!553527 () Bool)

(assert (=> b!810013 (=> (not res!553527) (not e!448356))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810013 (= res!553527 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21510 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21089 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21510 a!3170)) (= (select (arr!21089 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810014 () Bool)

(declare-fun e!448357 () Bool)

(declare-fun e!448359 () Bool)

(assert (=> b!810014 (= e!448357 e!448359)))

(declare-fun res!553534 () Bool)

(assert (=> b!810014 (=> (not res!553534) (not e!448359))))

(declare-fun lt!363026 () (_ BitVec 32))

(assert (=> b!810014 (= res!553534 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363026 #b00000000000000000000000000000000) (bvslt lt!363026 (size!21510 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810014 (= lt!363026 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810015 () Bool)

(declare-fun res!553526 () Bool)

(declare-fun e!448361 () Bool)

(assert (=> b!810015 (=> (not res!553526) (not e!448361))))

(declare-fun arrayContainsKey!0 (array!44033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810015 (= res!553526 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810017 () Bool)

(assert (=> b!810017 (= e!448361 e!448356)))

(declare-fun res!553524 () Bool)

(assert (=> b!810017 (=> (not res!553524) (not e!448356))))

(declare-fun lt!363024 () SeekEntryResult!8680)

(assert (=> b!810017 (= res!553524 (or (= lt!363024 (MissingZero!8680 i!1163)) (= lt!363024 (MissingVacant!8680 i!1163))))))

(assert (=> b!810017 (= lt!363024 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!810018 () Bool)

(declare-fun res!553535 () Bool)

(assert (=> b!810018 (=> (not res!553535) (not e!448361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810018 (= res!553535 (validKeyInArray!0 k!2044))))

(declare-fun b!810019 () Bool)

(declare-fun res!553523 () Bool)

(assert (=> b!810019 (=> (not res!553523) (not e!448361))))

(assert (=> b!810019 (= res!553523 (and (= (size!21510 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21510 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21510 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810020 () Bool)

(declare-fun res!553532 () Bool)

(assert (=> b!810020 (=> (not res!553532) (not e!448356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44033 (_ BitVec 32)) Bool)

(assert (=> b!810020 (= res!553532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun lt!363021 () SeekEntryResult!8680)

(declare-fun b!810021 () Bool)

(assert (=> b!810021 (= e!448359 (not (= lt!363021 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363026 vacantBefore!23 (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))))

(declare-fun b!810022 () Bool)

(declare-fun res!553529 () Bool)

(assert (=> b!810022 (=> (not res!553529) (not e!448361))))

(assert (=> b!810022 (= res!553529 (validKeyInArray!0 (select (arr!21089 a!3170) j!153)))))

(declare-fun b!810023 () Bool)

(declare-fun res!553525 () Bool)

(assert (=> b!810023 (=> (not res!553525) (not e!448359))))

(assert (=> b!810023 (= res!553525 (= lt!363023 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363026 vacantAfter!23 lt!363025 lt!363020 mask!3266)))))

(declare-fun b!810024 () Bool)

(assert (=> b!810024 (= e!448358 e!448357)))

(declare-fun res!553528 () Bool)

(assert (=> b!810024 (=> (not res!553528) (not e!448357))))

(declare-fun lt!363022 () SeekEntryResult!8680)

(assert (=> b!810024 (= res!553528 (and (= lt!363021 lt!363022) (= lt!363022 (Found!8680 j!153)) (not (= (select (arr!21089 a!3170) index!1236) (select (arr!21089 a!3170) j!153)))))))

(assert (=> b!810024 (= lt!363022 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810024 (= lt!363021 (seekEntryOrOpen!0 (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810016 () Bool)

(declare-fun res!553531 () Bool)

(assert (=> b!810016 (=> (not res!553531) (not e!448356))))

(declare-datatypes ((List!15052 0))(
  ( (Nil!15049) (Cons!15048 (h!16177 (_ BitVec 64)) (t!21367 List!15052)) )
))
(declare-fun arrayNoDuplicates!0 (array!44033 (_ BitVec 32) List!15052) Bool)

(assert (=> b!810016 (= res!553531 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15049))))

(declare-fun res!553533 () Bool)

(assert (=> start!69486 (=> (not res!553533) (not e!448361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69486 (= res!553533 (validMask!0 mask!3266))))

(assert (=> start!69486 e!448361))

(assert (=> start!69486 true))

(declare-fun array_inv!16885 (array!44033) Bool)

(assert (=> start!69486 (array_inv!16885 a!3170)))

(assert (= (and start!69486 res!553533) b!810019))

(assert (= (and b!810019 res!553523) b!810022))

(assert (= (and b!810022 res!553529) b!810018))

(assert (= (and b!810018 res!553535) b!810015))

(assert (= (and b!810015 res!553526) b!810017))

(assert (= (and b!810017 res!553524) b!810020))

(assert (= (and b!810020 res!553532) b!810016))

(assert (= (and b!810016 res!553531) b!810013))

(assert (= (and b!810013 res!553527) b!810012))

(assert (= (and b!810012 res!553530) b!810024))

(assert (= (and b!810024 res!553528) b!810014))

(assert (= (and b!810014 res!553534) b!810023))

(assert (= (and b!810023 res!553525) b!810021))

(declare-fun m!752213 () Bool)

(assert (=> b!810014 m!752213))

(declare-fun m!752215 () Bool)

(assert (=> b!810016 m!752215))

(declare-fun m!752217 () Bool)

(assert (=> b!810020 m!752217))

(declare-fun m!752219 () Bool)

(assert (=> b!810024 m!752219))

(declare-fun m!752221 () Bool)

(assert (=> b!810024 m!752221))

(assert (=> b!810024 m!752221))

(declare-fun m!752223 () Bool)

(assert (=> b!810024 m!752223))

(assert (=> b!810024 m!752221))

(declare-fun m!752225 () Bool)

(assert (=> b!810024 m!752225))

(declare-fun m!752227 () Bool)

(assert (=> b!810018 m!752227))

(declare-fun m!752229 () Bool)

(assert (=> b!810015 m!752229))

(declare-fun m!752231 () Bool)

(assert (=> b!810013 m!752231))

(declare-fun m!752233 () Bool)

(assert (=> b!810013 m!752233))

(declare-fun m!752235 () Bool)

(assert (=> b!810017 m!752235))

(declare-fun m!752237 () Bool)

(assert (=> b!810012 m!752237))

(declare-fun m!752239 () Bool)

(assert (=> b!810012 m!752239))

(declare-fun m!752241 () Bool)

(assert (=> b!810012 m!752241))

(declare-fun m!752243 () Bool)

(assert (=> b!810012 m!752243))

(assert (=> b!810022 m!752221))

(assert (=> b!810022 m!752221))

(declare-fun m!752245 () Bool)

(assert (=> b!810022 m!752245))

(assert (=> b!810021 m!752221))

(assert (=> b!810021 m!752221))

(declare-fun m!752247 () Bool)

(assert (=> b!810021 m!752247))

(declare-fun m!752249 () Bool)

(assert (=> b!810023 m!752249))

(declare-fun m!752251 () Bool)

(assert (=> start!69486 m!752251))

(declare-fun m!752253 () Bool)

(assert (=> start!69486 m!752253))

(push 1)

(assert (not b!810017))

(assert (not b!810022))

(assert (not b!810024))

(assert (not b!810016))

(assert (not b!810021))

(assert (not b!810014))

(assert (not b!810020))

(assert (not b!810023))

(assert (not start!69486))

(assert (not b!810012))

(assert (not b!810018))

(assert (not b!810015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!810087 () Bool)

(declare-fun e!448398 () Bool)

(declare-fun call!35439 () Bool)

(assert (=> b!810087 (= e!448398 call!35439)))

(declare-fun b!810088 () Bool)

(declare-fun e!448400 () Bool)

(assert (=> b!810088 (= e!448400 e!448398)))

(declare-fun c!88681 () Bool)

(assert (=> b!810088 (= c!88681 (validKeyInArray!0 (select (arr!21089 a!3170) #b00000000000000000000000000000000)))))

(declare-fun d!104007 () Bool)

(declare-fun res!553547 () Bool)

(assert (=> d!104007 (=> res!553547 e!448400)))

(assert (=> d!104007 (= res!553547 (bvsge #b00000000000000000000000000000000 (size!21510 a!3170)))))

(assert (=> d!104007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448400)))

(declare-fun b!810089 () Bool)

(declare-fun e!448399 () Bool)

(assert (=> b!810089 (= e!448398 e!448399)))

(declare-fun lt!363052 () (_ BitVec 64))

(assert (=> b!810089 (= lt!363052 (select (arr!21089 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27630 0))(
  ( (Unit!27631) )
))
(declare-fun lt!363054 () Unit!27630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44033 (_ BitVec 64) (_ BitVec 32)) Unit!27630)

(assert (=> b!810089 (= lt!363054 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363052 #b00000000000000000000000000000000))))

(assert (=> b!810089 (arrayContainsKey!0 a!3170 lt!363052 #b00000000000000000000000000000000)))

(declare-fun lt!363053 () Unit!27630)

(assert (=> b!810089 (= lt!363053 lt!363054)))

(declare-fun res!553546 () Bool)

(assert (=> b!810089 (= res!553546 (= (seekEntryOrOpen!0 (select (arr!21089 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8680 #b00000000000000000000000000000000)))))

(assert (=> b!810089 (=> (not res!553546) (not e!448399))))

(declare-fun b!810090 () Bool)

(assert (=> b!810090 (= e!448399 call!35439)))

(declare-fun bm!35436 () Bool)

(assert (=> bm!35436 (= call!35439 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(assert (= (and d!104007 (not res!553547)) b!810088))

(assert (= (and b!810088 c!88681) b!810089))

(assert (= (and b!810088 (not c!88681)) b!810087))

(assert (= (and b!810089 res!553546) b!810090))

(assert (= (or b!810090 b!810087) bm!35436))

(declare-fun m!752273 () Bool)

(assert (=> b!810088 m!752273))

(assert (=> b!810088 m!752273))

(declare-fun m!752279 () Bool)

(assert (=> b!810088 m!752279))

(assert (=> b!810089 m!752273))

(declare-fun m!752285 () Bool)

(assert (=> b!810089 m!752285))

(declare-fun m!752287 () Bool)

(assert (=> b!810089 m!752287))

(assert (=> b!810089 m!752273))

(declare-fun m!752289 () Bool)

(assert (=> b!810089 m!752289))

(declare-fun m!752291 () Bool)

(assert (=> bm!35436 m!752291))

(assert (=> b!810020 d!104007))

(declare-fun d!104011 () Bool)

(assert (=> d!104011 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810018 d!104011))

(declare-fun b!810166 () Bool)

(declare-fun e!448444 () SeekEntryResult!8680)

(declare-fun e!448443 () SeekEntryResult!8680)

(assert (=> b!810166 (= e!448444 e!448443)))

(declare-fun lt!363085 () (_ BitVec 64))

(declare-fun lt!363086 () SeekEntryResult!8680)

(assert (=> b!810166 (= lt!363085 (select (arr!21089 a!3170) (index!37090 lt!363086)))))

(declare-fun c!88716 () Bool)

(assert (=> b!810166 (= c!88716 (= lt!363085 k!2044))))

(declare-fun b!810167 () Bool)

(declare-fun e!448445 () SeekEntryResult!8680)

(assert (=> b!810167 (= e!448445 (seekKeyOrZeroReturnVacant!0 (x!67894 lt!363086) (index!37090 lt!363086) (index!37090 lt!363086) k!2044 a!3170 mask!3266))))

(declare-fun d!104017 () Bool)

(declare-fun lt!363084 () SeekEntryResult!8680)

(assert (=> d!104017 (and (or (is-Undefined!8680 lt!363084) (not (is-Found!8680 lt!363084)) (and (bvsge (index!37089 lt!363084) #b00000000000000000000000000000000) (bvslt (index!37089 lt!363084) (size!21510 a!3170)))) (or (is-Undefined!8680 lt!363084) (is-Found!8680 lt!363084) (not (is-MissingZero!8680 lt!363084)) (and (bvsge (index!37088 lt!363084) #b00000000000000000000000000000000) (bvslt (index!37088 lt!363084) (size!21510 a!3170)))) (or (is-Undefined!8680 lt!363084) (is-Found!8680 lt!363084) (is-MissingZero!8680 lt!363084) (not (is-MissingVacant!8680 lt!363084)) (and (bvsge (index!37091 lt!363084) #b00000000000000000000000000000000) (bvslt (index!37091 lt!363084) (size!21510 a!3170)))) (or (is-Undefined!8680 lt!363084) (ite (is-Found!8680 lt!363084) (= (select (arr!21089 a!3170) (index!37089 lt!363084)) k!2044) (ite (is-MissingZero!8680 lt!363084) (= (select (arr!21089 a!3170) (index!37088 lt!363084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8680 lt!363084) (= (select (arr!21089 a!3170) (index!37091 lt!363084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104017 (= lt!363084 e!448444)))

(declare-fun c!88717 () Bool)

(assert (=> d!104017 (= c!88717 (and (is-Intermediate!8680 lt!363086) (undefined!9492 lt!363086)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44033 (_ BitVec 32)) SeekEntryResult!8680)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104017 (= lt!363086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!104017 (validMask!0 mask!3266)))

(assert (=> d!104017 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!363084)))

(declare-fun b!810168 () Bool)

(assert (=> b!810168 (= e!448444 Undefined!8680)))

(declare-fun b!810169 () Bool)

(assert (=> b!810169 (= e!448445 (MissingZero!8680 (index!37090 lt!363086)))))

(declare-fun b!810170 () Bool)

(declare-fun c!88715 () Bool)

(assert (=> b!810170 (= c!88715 (= lt!363085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810170 (= e!448443 e!448445)))

(declare-fun b!810171 () Bool)

(assert (=> b!810171 (= e!448443 (Found!8680 (index!37090 lt!363086)))))

(assert (= (and d!104017 c!88717) b!810168))

(assert (= (and d!104017 (not c!88717)) b!810166))

(assert (= (and b!810166 c!88716) b!810171))

(assert (= (and b!810166 (not c!88716)) b!810170))

(assert (= (and b!810170 c!88715) b!810169))

(assert (= (and b!810170 (not c!88715)) b!810167))

(declare-fun m!752361 () Bool)

(assert (=> b!810166 m!752361))

(declare-fun m!752363 () Bool)

(assert (=> b!810167 m!752363))

(assert (=> d!104017 m!752251))

(declare-fun m!752367 () Bool)

(assert (=> d!104017 m!752367))

(declare-fun m!752371 () Bool)

(assert (=> d!104017 m!752371))

(assert (=> d!104017 m!752367))

(declare-fun m!752375 () Bool)

(assert (=> d!104017 m!752375))

(declare-fun m!752379 () Bool)

(assert (=> d!104017 m!752379))

(declare-fun m!752383 () Bool)

(assert (=> d!104017 m!752383))

(assert (=> b!810017 d!104017))

(declare-fun bm!35444 () Bool)

(declare-fun call!35449 () Bool)

(declare-fun c!88730 () Bool)

(assert (=> bm!35444 (= call!35449 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88730 (Cons!15048 (select (arr!21089 a!3170) #b00000000000000000000000000000000) Nil!15049) Nil!15049)))))

(declare-fun b!810212 () Bool)

(declare-fun e!448475 () Bool)

(declare-fun e!448476 () Bool)

(assert (=> b!810212 (= e!448475 e!448476)))

(declare-fun res!553575 () Bool)

(assert (=> b!810212 (=> (not res!553575) (not e!448476))))

(declare-fun e!448477 () Bool)

(assert (=> b!810212 (= res!553575 (not e!448477))))

(declare-fun res!553574 () Bool)

(assert (=> b!810212 (=> (not res!553574) (not e!448477))))

(assert (=> b!810212 (= res!553574 (validKeyInArray!0 (select (arr!21089 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810213 () Bool)

(declare-fun e!448474 () Bool)

(assert (=> b!810213 (= e!448476 e!448474)))

(assert (=> b!810213 (= c!88730 (validKeyInArray!0 (select (arr!21089 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810214 () Bool)

(declare-fun contains!4135 (List!15052 (_ BitVec 64)) Bool)

(assert (=> b!810214 (= e!448477 (contains!4135 Nil!15049 (select (arr!21089 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810216 () Bool)

(assert (=> b!810216 (= e!448474 call!35449)))

(declare-fun b!810215 () Bool)

(assert (=> b!810215 (= e!448474 call!35449)))

(declare-fun d!104037 () Bool)

(declare-fun res!553573 () Bool)

(assert (=> d!104037 (=> res!553573 e!448475)))

(assert (=> d!104037 (= res!553573 (bvsge #b00000000000000000000000000000000 (size!21510 a!3170)))))

(assert (=> d!104037 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15049) e!448475)))

(assert (= (and d!104037 (not res!553573)) b!810212))

(assert (= (and b!810212 res!553574) b!810214))

(assert (= (and b!810212 res!553575) b!810213))

(assert (= (and b!810213 c!88730) b!810216))

(assert (= (and b!810213 (not c!88730)) b!810215))

(assert (= (or b!810216 b!810215) bm!35444))

(assert (=> bm!35444 m!752273))

(declare-fun m!752399 () Bool)

(assert (=> bm!35444 m!752399))

(assert (=> b!810212 m!752273))

(assert (=> b!810212 m!752273))

(assert (=> b!810212 m!752279))

(assert (=> b!810213 m!752273))

(assert (=> b!810213 m!752273))

(assert (=> b!810213 m!752279))

(assert (=> b!810214 m!752273))

(assert (=> b!810214 m!752273))

(declare-fun m!752401 () Bool)

(assert (=> b!810214 m!752401))

(assert (=> b!810016 d!104037))

(declare-fun d!104045 () Bool)

(declare-fun res!553585 () Bool)

(declare-fun e!448489 () Bool)

(assert (=> d!104045 (=> res!553585 e!448489)))

(assert (=> d!104045 (= res!553585 (= (select (arr!21089 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!104045 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!448489)))

(declare-fun b!810230 () Bool)

(declare-fun e!448490 () Bool)

(assert (=> b!810230 (= e!448489 e!448490)))

(declare-fun res!553586 () Bool)

(assert (=> b!810230 (=> (not res!553586) (not e!448490))))

(assert (=> b!810230 (= res!553586 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21510 a!3170)))))

(declare-fun b!810231 () Bool)

(assert (=> b!810231 (= e!448490 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104045 (not res!553585)) b!810230))

(assert (= (and b!810230 res!553586) b!810231))

(assert (=> d!104045 m!752273))

(declare-fun m!752419 () Bool)

(assert (=> b!810231 m!752419))

(assert (=> b!810015 d!104045))

(declare-fun d!104055 () Bool)

(declare-fun lt!363108 () (_ BitVec 32))

(assert (=> d!104055 (and (bvsge lt!363108 #b00000000000000000000000000000000) (bvslt lt!363108 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104055 (= lt!363108 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!104055 (validMask!0 mask!3266)))

(assert (=> d!104055 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!363108)))

(declare-fun bs!22430 () Bool)

(assert (= bs!22430 d!104055))

(declare-fun m!752441 () Bool)

(assert (=> bs!22430 m!752441))

(assert (=> bs!22430 m!752251))

(assert (=> b!810014 d!104055))

(declare-fun d!104059 () Bool)

(assert (=> d!104059 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69486 d!104059))

(declare-fun d!104067 () Bool)

(assert (=> d!104067 (= (array_inv!16885 a!3170) (bvsge (size!21510 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69486 d!104067))

(declare-fun b!810286 () Bool)

(declare-fun e!448526 () SeekEntryResult!8680)

(assert (=> b!810286 (= e!448526 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810287 () Bool)

(assert (=> b!810287 (= e!448526 (MissingVacant!8680 vacantBefore!23))))

(declare-fun b!810288 () Bool)

(declare-fun e!448524 () SeekEntryResult!8680)

(assert (=> b!810288 (= e!448524 Undefined!8680)))

(declare-fun b!810289 () Bool)

(declare-fun e!448525 () SeekEntryResult!8680)

(assert (=> b!810289 (= e!448524 e!448525)))

(declare-fun lt!363131 () (_ BitVec 64))

(declare-fun c!88754 () Bool)

(assert (=> b!810289 (= c!88754 (= lt!363131 (select (arr!21089 a!3170) j!153)))))

(declare-fun b!810290 () Bool)

(assert (=> b!810290 (= e!448525 (Found!8680 index!1236))))

(declare-fun d!104069 () Bool)

(declare-fun lt!363130 () SeekEntryResult!8680)

(assert (=> d!104069 (and (or (is-Undefined!8680 lt!363130) (not (is-Found!8680 lt!363130)) (and (bvsge (index!37089 lt!363130) #b00000000000000000000000000000000) (bvslt (index!37089 lt!363130) (size!21510 a!3170)))) (or (is-Undefined!8680 lt!363130) (is-Found!8680 lt!363130) (not (is-MissingVacant!8680 lt!363130)) (not (= (index!37091 lt!363130) vacantBefore!23)) (and (bvsge (index!37091 lt!363130) #b00000000000000000000000000000000) (bvslt (index!37091 lt!363130) (size!21510 a!3170)))) (or (is-Undefined!8680 lt!363130) (ite (is-Found!8680 lt!363130) (= (select (arr!21089 a!3170) (index!37089 lt!363130)) (select (arr!21089 a!3170) j!153)) (and (is-MissingVacant!8680 lt!363130) (= (index!37091 lt!363130) vacantBefore!23) (= (select (arr!21089 a!3170) (index!37091 lt!363130)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104069 (= lt!363130 e!448524)))

(declare-fun c!88755 () Bool)

(assert (=> d!104069 (= c!88755 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104069 (= lt!363131 (select (arr!21089 a!3170) index!1236))))

(assert (=> d!104069 (validMask!0 mask!3266)))

(assert (=> d!104069 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21089 a!3170) j!153) a!3170 mask!3266) lt!363130)))

(declare-fun b!810291 () Bool)

(declare-fun c!88756 () Bool)

(assert (=> b!810291 (= c!88756 (= lt!363131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810291 (= e!448525 e!448526)))

(assert (= (and d!104069 c!88755) b!810288))

(assert (= (and d!104069 (not c!88755)) b!810289))

(assert (= (and b!810289 c!88754) b!810290))

(assert (= (and b!810289 (not c!88754)) b!810291))

(assert (= (and b!810291 c!88756) b!810287))

(assert (= (and b!810291 (not c!88756)) b!810286))

(assert (=> b!810286 m!752213))

(assert (=> b!810286 m!752213))

(assert (=> b!810286 m!752221))

(declare-fun m!752477 () Bool)

(assert (=> b!810286 m!752477))

(declare-fun m!752479 () Bool)

(assert (=> d!104069 m!752479))

(declare-fun m!752481 () Bool)

(assert (=> d!104069 m!752481))

(assert (=> d!104069 m!752219))

(assert (=> d!104069 m!752251))

(assert (=> b!810024 d!104069))

(declare-fun b!810292 () Bool)

(declare-fun e!448528 () SeekEntryResult!8680)

(declare-fun e!448527 () SeekEntryResult!8680)

(assert (=> b!810292 (= e!448528 e!448527)))

(declare-fun lt!363133 () (_ BitVec 64))

(declare-fun lt!363134 () SeekEntryResult!8680)

(assert (=> b!810292 (= lt!363133 (select (arr!21089 a!3170) (index!37090 lt!363134)))))

(declare-fun c!88758 () Bool)

(assert (=> b!810292 (= c!88758 (= lt!363133 (select (arr!21089 a!3170) j!153)))))

(declare-fun b!810293 () Bool)

(declare-fun e!448529 () SeekEntryResult!8680)

(assert (=> b!810293 (= e!448529 (seekKeyOrZeroReturnVacant!0 (x!67894 lt!363134) (index!37090 lt!363134) (index!37090 lt!363134) (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))

(declare-fun d!104077 () Bool)

(declare-fun lt!363132 () SeekEntryResult!8680)

(assert (=> d!104077 (and (or (is-Undefined!8680 lt!363132) (not (is-Found!8680 lt!363132)) (and (bvsge (index!37089 lt!363132) #b00000000000000000000000000000000) (bvslt (index!37089 lt!363132) (size!21510 a!3170)))) (or (is-Undefined!8680 lt!363132) (is-Found!8680 lt!363132) (not (is-MissingZero!8680 lt!363132)) (and (bvsge (index!37088 lt!363132) #b00000000000000000000000000000000) (bvslt (index!37088 lt!363132) (size!21510 a!3170)))) (or (is-Undefined!8680 lt!363132) (is-Found!8680 lt!363132) (is-MissingZero!8680 lt!363132) (not (is-MissingVacant!8680 lt!363132)) (and (bvsge (index!37091 lt!363132) #b00000000000000000000000000000000) (bvslt (index!37091 lt!363132) (size!21510 a!3170)))) (or (is-Undefined!8680 lt!363132) (ite (is-Found!8680 lt!363132) (= (select (arr!21089 a!3170) (index!37089 lt!363132)) (select (arr!21089 a!3170) j!153)) (ite (is-MissingZero!8680 lt!363132) (= (select (arr!21089 a!3170) (index!37088 lt!363132)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8680 lt!363132) (= (select (arr!21089 a!3170) (index!37091 lt!363132)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104077 (= lt!363132 e!448528)))

(declare-fun c!88759 () Bool)

(assert (=> d!104077 (= c!88759 (and (is-Intermediate!8680 lt!363134) (undefined!9492 lt!363134)))))

(assert (=> d!104077 (= lt!363134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21089 a!3170) j!153) mask!3266) (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104077 (validMask!0 mask!3266)))

(assert (=> d!104077 (= (seekEntryOrOpen!0 (select (arr!21089 a!3170) j!153) a!3170 mask!3266) lt!363132)))

(declare-fun b!810294 () Bool)

(assert (=> b!810294 (= e!448528 Undefined!8680)))

(declare-fun b!810295 () Bool)

(assert (=> b!810295 (= e!448529 (MissingZero!8680 (index!37090 lt!363134)))))

(declare-fun b!810296 () Bool)

(declare-fun c!88757 () Bool)

(assert (=> b!810296 (= c!88757 (= lt!363133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810296 (= e!448527 e!448529)))

(declare-fun b!810297 () Bool)

(assert (=> b!810297 (= e!448527 (Found!8680 (index!37090 lt!363134)))))

(assert (= (and d!104077 c!88759) b!810294))

(assert (= (and d!104077 (not c!88759)) b!810292))

(assert (= (and b!810292 c!88758) b!810297))

(assert (= (and b!810292 (not c!88758)) b!810296))

(assert (= (and b!810296 c!88757) b!810295))

(assert (= (and b!810296 (not c!88757)) b!810293))

(declare-fun m!752483 () Bool)

(assert (=> b!810292 m!752483))

(assert (=> b!810293 m!752221))

(declare-fun m!752485 () Bool)

(assert (=> b!810293 m!752485))

(assert (=> d!104077 m!752251))

(declare-fun m!752487 () Bool)

(assert (=> d!104077 m!752487))

(assert (=> d!104077 m!752221))

(declare-fun m!752489 () Bool)

(assert (=> d!104077 m!752489))

(assert (=> d!104077 m!752221))

(assert (=> d!104077 m!752487))

(declare-fun m!752491 () Bool)

(assert (=> d!104077 m!752491))

(declare-fun m!752493 () Bool)

(assert (=> d!104077 m!752493))

(declare-fun m!752495 () Bool)

(assert (=> d!104077 m!752495))

(assert (=> b!810024 d!104077))

(declare-fun b!810298 () Bool)

