; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47546 () Bool)

(assert start!47546)

(declare-fun b!523375 () Bool)

(declare-fun res!320752 () Bool)

(declare-fun e!305235 () Bool)

(assert (=> b!523375 (=> (not res!320752) (not e!305235))))

(declare-datatypes ((array!33309 0))(
  ( (array!33310 (arr!16009 (Array (_ BitVec 32) (_ BitVec 64))) (size!16373 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33309)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523375 (= res!320752 (validKeyInArray!0 (select (arr!16009 a!3235) j!176)))))

(declare-fun b!523376 () Bool)

(declare-fun e!305231 () Bool)

(assert (=> b!523376 (= e!305231 false)))

(declare-fun res!320745 () Bool)

(assert (=> start!47546 (=> (not res!320745) (not e!305235))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47546 (= res!320745 (validMask!0 mask!3524))))

(assert (=> start!47546 e!305235))

(assert (=> start!47546 true))

(declare-fun array_inv!11805 (array!33309) Bool)

(assert (=> start!47546 (array_inv!11805 a!3235)))

(declare-fun b!523377 () Bool)

(declare-fun res!320751 () Bool)

(declare-fun e!305230 () Bool)

(assert (=> b!523377 (=> (not res!320751) (not e!305230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33309 (_ BitVec 32)) Bool)

(assert (=> b!523377 (= res!320751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!305234 () Bool)

(declare-fun b!523378 () Bool)

(declare-datatypes ((SeekEntryResult!4476 0))(
  ( (MissingZero!4476 (index!20110 (_ BitVec 32))) (Found!4476 (index!20111 (_ BitVec 32))) (Intermediate!4476 (undefined!5288 Bool) (index!20112 (_ BitVec 32)) (x!49087 (_ BitVec 32))) (Undefined!4476) (MissingVacant!4476 (index!20113 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33309 (_ BitVec 32)) SeekEntryResult!4476)

(assert (=> b!523378 (= e!305234 (= (seekEntryOrOpen!0 (select (arr!16009 a!3235) j!176) a!3235 mask!3524) (Found!4476 j!176)))))

(declare-fun b!523379 () Bool)

(declare-fun res!320744 () Bool)

(assert (=> b!523379 (=> (not res!320744) (not e!305235))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523379 (= res!320744 (and (= (size!16373 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16373 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16373 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523380 () Bool)

(declare-datatypes ((Unit!16356 0))(
  ( (Unit!16357) )
))
(declare-fun e!305229 () Unit!16356)

(declare-fun Unit!16358 () Unit!16356)

(assert (=> b!523380 (= e!305229 Unit!16358)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!240138 () Unit!16356)

(declare-fun lt!240145 () (_ BitVec 32))

(declare-fun lt!240140 () SeekEntryResult!4476)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33309 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16356)

(assert (=> b!523380 (= lt!240138 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240145 #b00000000000000000000000000000000 (index!20112 lt!240140) (x!49087 lt!240140) mask!3524))))

(declare-fun lt!240141 () array!33309)

(declare-fun lt!240144 () (_ BitVec 64))

(declare-fun res!320749 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33309 (_ BitVec 32)) SeekEntryResult!4476)

(assert (=> b!523380 (= res!320749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240145 lt!240144 lt!240141 mask!3524) (Intermediate!4476 false (index!20112 lt!240140) (x!49087 lt!240140))))))

(assert (=> b!523380 (=> (not res!320749) (not e!305231))))

(assert (=> b!523380 e!305231))

(declare-fun b!523381 () Bool)

(declare-fun res!320743 () Bool)

(declare-fun e!305232 () Bool)

(assert (=> b!523381 (=> res!320743 e!305232)))

(get-info :version)

(assert (=> b!523381 (= res!320743 (or (undefined!5288 lt!240140) (not ((_ is Intermediate!4476) lt!240140))))))

(declare-fun b!523382 () Bool)

(declare-fun res!320742 () Bool)

(assert (=> b!523382 (=> (not res!320742) (not e!305235))))

(assert (=> b!523382 (= res!320742 (validKeyInArray!0 k0!2280))))

(declare-fun b!523383 () Bool)

(declare-fun res!320748 () Bool)

(assert (=> b!523383 (=> (not res!320748) (not e!305235))))

(declare-fun arrayContainsKey!0 (array!33309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523383 (= res!320748 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523384 () Bool)

(assert (=> b!523384 (= e!305232 (or (bvsgt #b00000000000000000000000000000000 (x!49087 lt!240140)) (bvsgt (x!49087 lt!240140) #b01111111111111111111111111111110) (and (bvsge lt!240145 #b00000000000000000000000000000000) (bvslt lt!240145 (size!16373 a!3235)))))))

(assert (=> b!523384 (and (or (= (select (arr!16009 a!3235) (index!20112 lt!240140)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16009 a!3235) (index!20112 lt!240140)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16009 a!3235) (index!20112 lt!240140)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16009 a!3235) (index!20112 lt!240140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240142 () Unit!16356)

(assert (=> b!523384 (= lt!240142 e!305229)))

(declare-fun c!61619 () Bool)

(assert (=> b!523384 (= c!61619 (= (select (arr!16009 a!3235) (index!20112 lt!240140)) (select (arr!16009 a!3235) j!176)))))

(assert (=> b!523384 (and (bvslt (x!49087 lt!240140) #b01111111111111111111111111111110) (or (= (select (arr!16009 a!3235) (index!20112 lt!240140)) (select (arr!16009 a!3235) j!176)) (= (select (arr!16009 a!3235) (index!20112 lt!240140)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16009 a!3235) (index!20112 lt!240140)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523385 () Bool)

(assert (=> b!523385 (= e!305235 e!305230)))

(declare-fun res!320753 () Bool)

(assert (=> b!523385 (=> (not res!320753) (not e!305230))))

(declare-fun lt!240139 () SeekEntryResult!4476)

(assert (=> b!523385 (= res!320753 (or (= lt!240139 (MissingZero!4476 i!1204)) (= lt!240139 (MissingVacant!4476 i!1204))))))

(assert (=> b!523385 (= lt!240139 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523386 () Bool)

(declare-fun res!320746 () Bool)

(assert (=> b!523386 (=> (not res!320746) (not e!305230))))

(declare-datatypes ((List!10167 0))(
  ( (Nil!10164) (Cons!10163 (h!11088 (_ BitVec 64)) (t!16395 List!10167)) )
))
(declare-fun arrayNoDuplicates!0 (array!33309 (_ BitVec 32) List!10167) Bool)

(assert (=> b!523386 (= res!320746 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10164))))

(declare-fun b!523387 () Bool)

(assert (=> b!523387 (= e!305230 (not e!305232))))

(declare-fun res!320750 () Bool)

(assert (=> b!523387 (=> res!320750 e!305232)))

(declare-fun lt!240143 () (_ BitVec 32))

(assert (=> b!523387 (= res!320750 (= lt!240140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240143 lt!240144 lt!240141 mask!3524)))))

(assert (=> b!523387 (= lt!240140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240145 (select (arr!16009 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523387 (= lt!240143 (toIndex!0 lt!240144 mask!3524))))

(assert (=> b!523387 (= lt!240144 (select (store (arr!16009 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523387 (= lt!240145 (toIndex!0 (select (arr!16009 a!3235) j!176) mask!3524))))

(assert (=> b!523387 (= lt!240141 (array!33310 (store (arr!16009 a!3235) i!1204 k0!2280) (size!16373 a!3235)))))

(assert (=> b!523387 e!305234))

(declare-fun res!320747 () Bool)

(assert (=> b!523387 (=> (not res!320747) (not e!305234))))

(assert (=> b!523387 (= res!320747 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240137 () Unit!16356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16356)

(assert (=> b!523387 (= lt!240137 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523388 () Bool)

(declare-fun Unit!16359 () Unit!16356)

(assert (=> b!523388 (= e!305229 Unit!16359)))

(assert (= (and start!47546 res!320745) b!523379))

(assert (= (and b!523379 res!320744) b!523375))

(assert (= (and b!523375 res!320752) b!523382))

(assert (= (and b!523382 res!320742) b!523383))

(assert (= (and b!523383 res!320748) b!523385))

(assert (= (and b!523385 res!320753) b!523377))

(assert (= (and b!523377 res!320751) b!523386))

(assert (= (and b!523386 res!320746) b!523387))

(assert (= (and b!523387 res!320747) b!523378))

(assert (= (and b!523387 (not res!320750)) b!523381))

(assert (= (and b!523381 (not res!320743)) b!523384))

(assert (= (and b!523384 c!61619) b!523380))

(assert (= (and b!523384 (not c!61619)) b!523388))

(assert (= (and b!523380 res!320749) b!523376))

(declare-fun m!504195 () Bool)

(assert (=> b!523385 m!504195))

(declare-fun m!504197 () Bool)

(assert (=> b!523377 m!504197))

(declare-fun m!504199 () Bool)

(assert (=> b!523383 m!504199))

(declare-fun m!504201 () Bool)

(assert (=> b!523378 m!504201))

(assert (=> b!523378 m!504201))

(declare-fun m!504203 () Bool)

(assert (=> b!523378 m!504203))

(declare-fun m!504205 () Bool)

(assert (=> b!523384 m!504205))

(assert (=> b!523384 m!504201))

(declare-fun m!504207 () Bool)

(assert (=> start!47546 m!504207))

(declare-fun m!504209 () Bool)

(assert (=> start!47546 m!504209))

(declare-fun m!504211 () Bool)

(assert (=> b!523382 m!504211))

(assert (=> b!523375 m!504201))

(assert (=> b!523375 m!504201))

(declare-fun m!504213 () Bool)

(assert (=> b!523375 m!504213))

(declare-fun m!504215 () Bool)

(assert (=> b!523380 m!504215))

(declare-fun m!504217 () Bool)

(assert (=> b!523380 m!504217))

(declare-fun m!504219 () Bool)

(assert (=> b!523386 m!504219))

(declare-fun m!504221 () Bool)

(assert (=> b!523387 m!504221))

(declare-fun m!504223 () Bool)

(assert (=> b!523387 m!504223))

(declare-fun m!504225 () Bool)

(assert (=> b!523387 m!504225))

(assert (=> b!523387 m!504201))

(declare-fun m!504227 () Bool)

(assert (=> b!523387 m!504227))

(assert (=> b!523387 m!504201))

(declare-fun m!504229 () Bool)

(assert (=> b!523387 m!504229))

(declare-fun m!504231 () Bool)

(assert (=> b!523387 m!504231))

(assert (=> b!523387 m!504201))

(declare-fun m!504233 () Bool)

(assert (=> b!523387 m!504233))

(declare-fun m!504235 () Bool)

(assert (=> b!523387 m!504235))

(check-sat (not b!523382) (not b!523387) (not b!523385) (not b!523383) (not b!523375) (not b!523386) (not b!523377) (not start!47546) (not b!523380) (not b!523378))
(check-sat)
(get-model)

(declare-fun e!305263 () SeekEntryResult!4476)

(declare-fun lt!240181 () SeekEntryResult!4476)

(declare-fun b!523443 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33309 (_ BitVec 32)) SeekEntryResult!4476)

(assert (=> b!523443 (= e!305263 (seekKeyOrZeroReturnVacant!0 (x!49087 lt!240181) (index!20112 lt!240181) (index!20112 lt!240181) k0!2280 a!3235 mask!3524))))

(declare-fun b!523444 () Bool)

(declare-fun e!305264 () SeekEntryResult!4476)

(assert (=> b!523444 (= e!305264 Undefined!4476)))

(declare-fun b!523445 () Bool)

(declare-fun e!305265 () SeekEntryResult!4476)

(assert (=> b!523445 (= e!305264 e!305265)))

(declare-fun lt!240180 () (_ BitVec 64))

(assert (=> b!523445 (= lt!240180 (select (arr!16009 a!3235) (index!20112 lt!240181)))))

(declare-fun c!61631 () Bool)

(assert (=> b!523445 (= c!61631 (= lt!240180 k0!2280))))

(declare-fun b!523446 () Bool)

(assert (=> b!523446 (= e!305263 (MissingZero!4476 (index!20112 lt!240181)))))

(declare-fun d!80521 () Bool)

(declare-fun lt!240179 () SeekEntryResult!4476)

(assert (=> d!80521 (and (or ((_ is Undefined!4476) lt!240179) (not ((_ is Found!4476) lt!240179)) (and (bvsge (index!20111 lt!240179) #b00000000000000000000000000000000) (bvslt (index!20111 lt!240179) (size!16373 a!3235)))) (or ((_ is Undefined!4476) lt!240179) ((_ is Found!4476) lt!240179) (not ((_ is MissingZero!4476) lt!240179)) (and (bvsge (index!20110 lt!240179) #b00000000000000000000000000000000) (bvslt (index!20110 lt!240179) (size!16373 a!3235)))) (or ((_ is Undefined!4476) lt!240179) ((_ is Found!4476) lt!240179) ((_ is MissingZero!4476) lt!240179) (not ((_ is MissingVacant!4476) lt!240179)) (and (bvsge (index!20113 lt!240179) #b00000000000000000000000000000000) (bvslt (index!20113 lt!240179) (size!16373 a!3235)))) (or ((_ is Undefined!4476) lt!240179) (ite ((_ is Found!4476) lt!240179) (= (select (arr!16009 a!3235) (index!20111 lt!240179)) k0!2280) (ite ((_ is MissingZero!4476) lt!240179) (= (select (arr!16009 a!3235) (index!20110 lt!240179)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4476) lt!240179) (= (select (arr!16009 a!3235) (index!20113 lt!240179)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80521 (= lt!240179 e!305264)))

(declare-fun c!61629 () Bool)

(assert (=> d!80521 (= c!61629 (and ((_ is Intermediate!4476) lt!240181) (undefined!5288 lt!240181)))))

(assert (=> d!80521 (= lt!240181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80521 (validMask!0 mask!3524)))

(assert (=> d!80521 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!240179)))

(declare-fun b!523447 () Bool)

(declare-fun c!61630 () Bool)

(assert (=> b!523447 (= c!61630 (= lt!240180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523447 (= e!305265 e!305263)))

(declare-fun b!523448 () Bool)

(assert (=> b!523448 (= e!305265 (Found!4476 (index!20112 lt!240181)))))

(assert (= (and d!80521 c!61629) b!523444))

(assert (= (and d!80521 (not c!61629)) b!523445))

(assert (= (and b!523445 c!61631) b!523448))

(assert (= (and b!523445 (not c!61631)) b!523447))

(assert (= (and b!523447 c!61630) b!523446))

(assert (= (and b!523447 (not c!61630)) b!523443))

(declare-fun m!504279 () Bool)

(assert (=> b!523443 m!504279))

(declare-fun m!504281 () Bool)

(assert (=> b!523445 m!504281))

(declare-fun m!504283 () Bool)

(assert (=> d!80521 m!504283))

(assert (=> d!80521 m!504207))

(declare-fun m!504285 () Bool)

(assert (=> d!80521 m!504285))

(declare-fun m!504287 () Bool)

(assert (=> d!80521 m!504287))

(assert (=> d!80521 m!504285))

(declare-fun m!504289 () Bool)

(assert (=> d!80521 m!504289))

(declare-fun m!504291 () Bool)

(assert (=> d!80521 m!504291))

(assert (=> b!523385 d!80521))

(declare-fun b!523459 () Bool)

(declare-fun e!305274 () Bool)

(declare-fun e!305276 () Bool)

(assert (=> b!523459 (= e!305274 e!305276)))

(declare-fun c!61634 () Bool)

(assert (=> b!523459 (= c!61634 (validKeyInArray!0 (select (arr!16009 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31829 () Bool)

(declare-fun call!31832 () Bool)

(assert (=> bm!31829 (= call!31832 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61634 (Cons!10163 (select (arr!16009 a!3235) #b00000000000000000000000000000000) Nil!10164) Nil!10164)))))

(declare-fun b!523460 () Bool)

(declare-fun e!305277 () Bool)

(assert (=> b!523460 (= e!305277 e!305274)))

(declare-fun res!320796 () Bool)

(assert (=> b!523460 (=> (not res!320796) (not e!305274))))

(declare-fun e!305275 () Bool)

(assert (=> b!523460 (= res!320796 (not e!305275))))

(declare-fun res!320798 () Bool)

(assert (=> b!523460 (=> (not res!320798) (not e!305275))))

(assert (=> b!523460 (= res!320798 (validKeyInArray!0 (select (arr!16009 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80525 () Bool)

(declare-fun res!320797 () Bool)

(assert (=> d!80525 (=> res!320797 e!305277)))

(assert (=> d!80525 (= res!320797 (bvsge #b00000000000000000000000000000000 (size!16373 a!3235)))))

(assert (=> d!80525 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10164) e!305277)))

(declare-fun b!523461 () Bool)

(assert (=> b!523461 (= e!305276 call!31832)))

(declare-fun b!523462 () Bool)

(declare-fun contains!2767 (List!10167 (_ BitVec 64)) Bool)

(assert (=> b!523462 (= e!305275 (contains!2767 Nil!10164 (select (arr!16009 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523463 () Bool)

(assert (=> b!523463 (= e!305276 call!31832)))

(assert (= (and d!80525 (not res!320797)) b!523460))

(assert (= (and b!523460 res!320798) b!523462))

(assert (= (and b!523460 res!320796) b!523459))

(assert (= (and b!523459 c!61634) b!523461))

(assert (= (and b!523459 (not c!61634)) b!523463))

(assert (= (or b!523461 b!523463) bm!31829))

(declare-fun m!504293 () Bool)

(assert (=> b!523459 m!504293))

(assert (=> b!523459 m!504293))

(declare-fun m!504295 () Bool)

(assert (=> b!523459 m!504295))

(assert (=> bm!31829 m!504293))

(declare-fun m!504297 () Bool)

(assert (=> bm!31829 m!504297))

(assert (=> b!523460 m!504293))

(assert (=> b!523460 m!504293))

(assert (=> b!523460 m!504295))

(assert (=> b!523462 m!504293))

(assert (=> b!523462 m!504293))

(declare-fun m!504299 () Bool)

(assert (=> b!523462 m!504299))

(assert (=> b!523386 d!80525))

(declare-fun d!80529 () Bool)

(assert (=> d!80529 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47546 d!80529))

(declare-fun d!80531 () Bool)

(assert (=> d!80531 (= (array_inv!11805 a!3235) (bvsge (size!16373 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47546 d!80531))

(declare-fun d!80533 () Bool)

(declare-fun e!305304 () Bool)

(assert (=> d!80533 e!305304))

(declare-fun res!320805 () Bool)

(assert (=> d!80533 (=> (not res!320805) (not e!305304))))

(assert (=> d!80533 (= res!320805 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16373 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16373 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16373 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16373 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16373 a!3235))))))

(declare-fun lt!240208 () Unit!16356)

(declare-fun choose!47 (array!33309 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16356)

(assert (=> d!80533 (= lt!240208 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!240145 #b00000000000000000000000000000000 (index!20112 lt!240140) (x!49087 lt!240140) mask!3524))))

(assert (=> d!80533 (validMask!0 mask!3524)))

(assert (=> d!80533 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240145 #b00000000000000000000000000000000 (index!20112 lt!240140) (x!49087 lt!240140) mask!3524) lt!240208)))

(declare-fun b!523510 () Bool)

(assert (=> b!523510 (= e!305304 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240145 (select (store (arr!16009 a!3235) i!1204 k0!2280) j!176) (array!33310 (store (arr!16009 a!3235) i!1204 k0!2280) (size!16373 a!3235)) mask!3524) (Intermediate!4476 false (index!20112 lt!240140) (x!49087 lt!240140))))))

(assert (= (and d!80533 res!320805) b!523510))

(declare-fun m!504327 () Bool)

(assert (=> d!80533 m!504327))

(assert (=> d!80533 m!504207))

(assert (=> b!523510 m!504221))

(assert (=> b!523510 m!504225))

(assert (=> b!523510 m!504225))

(declare-fun m!504329 () Bool)

(assert (=> b!523510 m!504329))

(assert (=> b!523380 d!80533))

(declare-fun b!523566 () Bool)

(declare-fun lt!240234 () SeekEntryResult!4476)

(assert (=> b!523566 (and (bvsge (index!20112 lt!240234) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240234) (size!16373 lt!240141)))))

(declare-fun res!320830 () Bool)

(assert (=> b!523566 (= res!320830 (= (select (arr!16009 lt!240141) (index!20112 lt!240234)) lt!240144))))

(declare-fun e!305345 () Bool)

(assert (=> b!523566 (=> res!320830 e!305345)))

(declare-fun e!305342 () Bool)

(assert (=> b!523566 (= e!305342 e!305345)))

(declare-fun e!305344 () SeekEntryResult!4476)

(declare-fun b!523567 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523567 (= e!305344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240145 #b00000000000000000000000000000000 mask!3524) lt!240144 lt!240141 mask!3524))))

(declare-fun b!523568 () Bool)

(declare-fun e!305343 () Bool)

(assert (=> b!523568 (= e!305343 (bvsge (x!49087 lt!240234) #b01111111111111111111111111111110))))

(declare-fun b!523569 () Bool)

(assert (=> b!523569 (and (bvsge (index!20112 lt!240234) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240234) (size!16373 lt!240141)))))

(declare-fun res!320831 () Bool)

(assert (=> b!523569 (= res!320831 (= (select (arr!16009 lt!240141) (index!20112 lt!240234)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523569 (=> res!320831 e!305345)))

(declare-fun b!523570 () Bool)

(assert (=> b!523570 (and (bvsge (index!20112 lt!240234) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240234) (size!16373 lt!240141)))))

(assert (=> b!523570 (= e!305345 (= (select (arr!16009 lt!240141) (index!20112 lt!240234)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523571 () Bool)

(assert (=> b!523571 (= e!305343 e!305342)))

(declare-fun res!320829 () Bool)

(assert (=> b!523571 (= res!320829 (and ((_ is Intermediate!4476) lt!240234) (not (undefined!5288 lt!240234)) (bvslt (x!49087 lt!240234) #b01111111111111111111111111111110) (bvsge (x!49087 lt!240234) #b00000000000000000000000000000000) (bvsge (x!49087 lt!240234) #b00000000000000000000000000000000)))))

(assert (=> b!523571 (=> (not res!320829) (not e!305342))))

(declare-fun d!80541 () Bool)

(assert (=> d!80541 e!305343))

(declare-fun c!61671 () Bool)

(assert (=> d!80541 (= c!61671 (and ((_ is Intermediate!4476) lt!240234) (undefined!5288 lt!240234)))))

(declare-fun e!305346 () SeekEntryResult!4476)

(assert (=> d!80541 (= lt!240234 e!305346)))

(declare-fun c!61672 () Bool)

(assert (=> d!80541 (= c!61672 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240235 () (_ BitVec 64))

(assert (=> d!80541 (= lt!240235 (select (arr!16009 lt!240141) lt!240145))))

(assert (=> d!80541 (validMask!0 mask!3524)))

(assert (=> d!80541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240145 lt!240144 lt!240141 mask!3524) lt!240234)))

(declare-fun b!523572 () Bool)

(assert (=> b!523572 (= e!305346 (Intermediate!4476 true lt!240145 #b00000000000000000000000000000000))))

(declare-fun b!523573 () Bool)

(assert (=> b!523573 (= e!305346 e!305344)))

(declare-fun c!61673 () Bool)

(assert (=> b!523573 (= c!61673 (or (= lt!240235 lt!240144) (= (bvadd lt!240235 lt!240235) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523574 () Bool)

(assert (=> b!523574 (= e!305344 (Intermediate!4476 false lt!240145 #b00000000000000000000000000000000))))

(assert (= (and d!80541 c!61672) b!523572))

(assert (= (and d!80541 (not c!61672)) b!523573))

(assert (= (and b!523573 c!61673) b!523574))

(assert (= (and b!523573 (not c!61673)) b!523567))

(assert (= (and d!80541 c!61671) b!523568))

(assert (= (and d!80541 (not c!61671)) b!523571))

(assert (= (and b!523571 res!320829) b!523566))

(assert (= (and b!523566 (not res!320830)) b!523569))

(assert (= (and b!523569 (not res!320831)) b!523570))

(declare-fun m!504387 () Bool)

(assert (=> b!523566 m!504387))

(assert (=> b!523570 m!504387))

(declare-fun m!504389 () Bool)

(assert (=> b!523567 m!504389))

(assert (=> b!523567 m!504389))

(declare-fun m!504391 () Bool)

(assert (=> b!523567 m!504391))

(assert (=> b!523569 m!504387))

(declare-fun m!504393 () Bool)

(assert (=> d!80541 m!504393))

(assert (=> d!80541 m!504207))

(assert (=> b!523380 d!80541))

(declare-fun d!80559 () Bool)

(assert (=> d!80559 (= (validKeyInArray!0 (select (arr!16009 a!3235) j!176)) (and (not (= (select (arr!16009 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16009 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523375 d!80559))

(declare-fun d!80561 () Bool)

(assert (=> d!80561 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523382 d!80561))

(declare-fun b!523604 () Bool)

(declare-fun e!305367 () Bool)

(declare-fun e!305366 () Bool)

(assert (=> b!523604 (= e!305367 e!305366)))

(declare-fun c!61682 () Bool)

(assert (=> b!523604 (= c!61682 (validKeyInArray!0 (select (arr!16009 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31838 () Bool)

(declare-fun call!31841 () Bool)

(assert (=> bm!31838 (= call!31841 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523605 () Bool)

(assert (=> b!523605 (= e!305366 call!31841)))

(declare-fun b!523606 () Bool)

(declare-fun e!305368 () Bool)

(assert (=> b!523606 (= e!305368 call!31841)))

(declare-fun b!523607 () Bool)

(assert (=> b!523607 (= e!305366 e!305368)))

(declare-fun lt!240249 () (_ BitVec 64))

(assert (=> b!523607 (= lt!240249 (select (arr!16009 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240251 () Unit!16356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33309 (_ BitVec 64) (_ BitVec 32)) Unit!16356)

(assert (=> b!523607 (= lt!240251 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240249 #b00000000000000000000000000000000))))

(assert (=> b!523607 (arrayContainsKey!0 a!3235 lt!240249 #b00000000000000000000000000000000)))

(declare-fun lt!240250 () Unit!16356)

(assert (=> b!523607 (= lt!240250 lt!240251)))

(declare-fun res!320845 () Bool)

(assert (=> b!523607 (= res!320845 (= (seekEntryOrOpen!0 (select (arr!16009 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4476 #b00000000000000000000000000000000)))))

(assert (=> b!523607 (=> (not res!320845) (not e!305368))))

(declare-fun d!80563 () Bool)

(declare-fun res!320846 () Bool)

(assert (=> d!80563 (=> res!320846 e!305367)))

(assert (=> d!80563 (= res!320846 (bvsge #b00000000000000000000000000000000 (size!16373 a!3235)))))

(assert (=> d!80563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305367)))

(assert (= (and d!80563 (not res!320846)) b!523604))

(assert (= (and b!523604 c!61682) b!523607))

(assert (= (and b!523604 (not c!61682)) b!523605))

(assert (= (and b!523607 res!320845) b!523606))

(assert (= (or b!523606 b!523605) bm!31838))

(assert (=> b!523604 m!504293))

(assert (=> b!523604 m!504293))

(assert (=> b!523604 m!504295))

(declare-fun m!504399 () Bool)

(assert (=> bm!31838 m!504399))

(assert (=> b!523607 m!504293))

(declare-fun m!504401 () Bool)

(assert (=> b!523607 m!504401))

(declare-fun m!504403 () Bool)

(assert (=> b!523607 m!504403))

(assert (=> b!523607 m!504293))

(declare-fun m!504405 () Bool)

(assert (=> b!523607 m!504405))

(assert (=> b!523377 d!80563))

(declare-fun b!523608 () Bool)

(declare-fun lt!240252 () SeekEntryResult!4476)

(assert (=> b!523608 (and (bvsge (index!20112 lt!240252) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240252) (size!16373 lt!240141)))))

(declare-fun res!320848 () Bool)

(assert (=> b!523608 (= res!320848 (= (select (arr!16009 lt!240141) (index!20112 lt!240252)) lt!240144))))

(declare-fun e!305372 () Bool)

(assert (=> b!523608 (=> res!320848 e!305372)))

(declare-fun e!305369 () Bool)

(assert (=> b!523608 (= e!305369 e!305372)))

(declare-fun e!305371 () SeekEntryResult!4476)

(declare-fun b!523609 () Bool)

(assert (=> b!523609 (= e!305371 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240143 #b00000000000000000000000000000000 mask!3524) lt!240144 lt!240141 mask!3524))))

(declare-fun b!523610 () Bool)

(declare-fun e!305370 () Bool)

(assert (=> b!523610 (= e!305370 (bvsge (x!49087 lt!240252) #b01111111111111111111111111111110))))

(declare-fun b!523611 () Bool)

(assert (=> b!523611 (and (bvsge (index!20112 lt!240252) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240252) (size!16373 lt!240141)))))

(declare-fun res!320849 () Bool)

(assert (=> b!523611 (= res!320849 (= (select (arr!16009 lt!240141) (index!20112 lt!240252)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523611 (=> res!320849 e!305372)))

(declare-fun b!523612 () Bool)

(assert (=> b!523612 (and (bvsge (index!20112 lt!240252) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240252) (size!16373 lt!240141)))))

(assert (=> b!523612 (= e!305372 (= (select (arr!16009 lt!240141) (index!20112 lt!240252)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523613 () Bool)

(assert (=> b!523613 (= e!305370 e!305369)))

(declare-fun res!320847 () Bool)

(assert (=> b!523613 (= res!320847 (and ((_ is Intermediate!4476) lt!240252) (not (undefined!5288 lt!240252)) (bvslt (x!49087 lt!240252) #b01111111111111111111111111111110) (bvsge (x!49087 lt!240252) #b00000000000000000000000000000000) (bvsge (x!49087 lt!240252) #b00000000000000000000000000000000)))))

(assert (=> b!523613 (=> (not res!320847) (not e!305369))))

(declare-fun d!80567 () Bool)

(assert (=> d!80567 e!305370))

(declare-fun c!61683 () Bool)

(assert (=> d!80567 (= c!61683 (and ((_ is Intermediate!4476) lt!240252) (undefined!5288 lt!240252)))))

(declare-fun e!305373 () SeekEntryResult!4476)

(assert (=> d!80567 (= lt!240252 e!305373)))

(declare-fun c!61684 () Bool)

(assert (=> d!80567 (= c!61684 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240253 () (_ BitVec 64))

(assert (=> d!80567 (= lt!240253 (select (arr!16009 lt!240141) lt!240143))))

(assert (=> d!80567 (validMask!0 mask!3524)))

(assert (=> d!80567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240143 lt!240144 lt!240141 mask!3524) lt!240252)))

(declare-fun b!523614 () Bool)

(assert (=> b!523614 (= e!305373 (Intermediate!4476 true lt!240143 #b00000000000000000000000000000000))))

(declare-fun b!523615 () Bool)

(assert (=> b!523615 (= e!305373 e!305371)))

(declare-fun c!61685 () Bool)

(assert (=> b!523615 (= c!61685 (or (= lt!240253 lt!240144) (= (bvadd lt!240253 lt!240253) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523616 () Bool)

(assert (=> b!523616 (= e!305371 (Intermediate!4476 false lt!240143 #b00000000000000000000000000000000))))

(assert (= (and d!80567 c!61684) b!523614))

(assert (= (and d!80567 (not c!61684)) b!523615))

(assert (= (and b!523615 c!61685) b!523616))

(assert (= (and b!523615 (not c!61685)) b!523609))

(assert (= (and d!80567 c!61683) b!523610))

(assert (= (and d!80567 (not c!61683)) b!523613))

(assert (= (and b!523613 res!320847) b!523608))

(assert (= (and b!523608 (not res!320848)) b!523611))

(assert (= (and b!523611 (not res!320849)) b!523612))

(declare-fun m!504407 () Bool)

(assert (=> b!523608 m!504407))

(assert (=> b!523612 m!504407))

(declare-fun m!504409 () Bool)

(assert (=> b!523609 m!504409))

(assert (=> b!523609 m!504409))

(declare-fun m!504411 () Bool)

(assert (=> b!523609 m!504411))

(assert (=> b!523611 m!504407))

(declare-fun m!504413 () Bool)

(assert (=> d!80567 m!504413))

(assert (=> d!80567 m!504207))

(assert (=> b!523387 d!80567))

(declare-fun d!80569 () Bool)

(declare-fun lt!240261 () (_ BitVec 32))

(declare-fun lt!240260 () (_ BitVec 32))

(assert (=> d!80569 (= lt!240261 (bvmul (bvxor lt!240260 (bvlshr lt!240260 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80569 (= lt!240260 ((_ extract 31 0) (bvand (bvxor (select (arr!16009 a!3235) j!176) (bvlshr (select (arr!16009 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80569 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320853 (let ((h!11090 ((_ extract 31 0) (bvand (bvxor (select (arr!16009 a!3235) j!176) (bvlshr (select (arr!16009 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49094 (bvmul (bvxor h!11090 (bvlshr h!11090 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49094 (bvlshr x!49094 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320853 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320853 #b00000000000000000000000000000000))))))

(assert (=> d!80569 (= (toIndex!0 (select (arr!16009 a!3235) j!176) mask!3524) (bvand (bvxor lt!240261 (bvlshr lt!240261 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523387 d!80569))

(declare-fun b!523632 () Bool)

(declare-fun e!305386 () Bool)

(declare-fun e!305385 () Bool)

(assert (=> b!523632 (= e!305386 e!305385)))

(declare-fun c!61689 () Bool)

(assert (=> b!523632 (= c!61689 (validKeyInArray!0 (select (arr!16009 a!3235) j!176)))))

(declare-fun call!31842 () Bool)

(declare-fun bm!31839 () Bool)

(assert (=> bm!31839 (= call!31842 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523633 () Bool)

(assert (=> b!523633 (= e!305385 call!31842)))

(declare-fun b!523634 () Bool)

(declare-fun e!305387 () Bool)

(assert (=> b!523634 (= e!305387 call!31842)))

(declare-fun b!523635 () Bool)

(assert (=> b!523635 (= e!305385 e!305387)))

(declare-fun lt!240262 () (_ BitVec 64))

(assert (=> b!523635 (= lt!240262 (select (arr!16009 a!3235) j!176))))

(declare-fun lt!240264 () Unit!16356)

(assert (=> b!523635 (= lt!240264 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240262 j!176))))

(assert (=> b!523635 (arrayContainsKey!0 a!3235 lt!240262 #b00000000000000000000000000000000)))

(declare-fun lt!240263 () Unit!16356)

(assert (=> b!523635 (= lt!240263 lt!240264)))

(declare-fun res!320861 () Bool)

(assert (=> b!523635 (= res!320861 (= (seekEntryOrOpen!0 (select (arr!16009 a!3235) j!176) a!3235 mask!3524) (Found!4476 j!176)))))

(assert (=> b!523635 (=> (not res!320861) (not e!305387))))

(declare-fun d!80577 () Bool)

(declare-fun res!320862 () Bool)

(assert (=> d!80577 (=> res!320862 e!305386)))

(assert (=> d!80577 (= res!320862 (bvsge j!176 (size!16373 a!3235)))))

(assert (=> d!80577 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305386)))

(assert (= (and d!80577 (not res!320862)) b!523632))

(assert (= (and b!523632 c!61689) b!523635))

(assert (= (and b!523632 (not c!61689)) b!523633))

(assert (= (and b!523635 res!320861) b!523634))

(assert (= (or b!523634 b!523633) bm!31839))

(assert (=> b!523632 m!504201))

(assert (=> b!523632 m!504201))

(assert (=> b!523632 m!504213))

(declare-fun m!504425 () Bool)

(assert (=> bm!31839 m!504425))

(assert (=> b!523635 m!504201))

(declare-fun m!504427 () Bool)

(assert (=> b!523635 m!504427))

(declare-fun m!504429 () Bool)

(assert (=> b!523635 m!504429))

(assert (=> b!523635 m!504201))

(assert (=> b!523635 m!504203))

(assert (=> b!523387 d!80577))

(declare-fun b!523636 () Bool)

(declare-fun lt!240265 () SeekEntryResult!4476)

(assert (=> b!523636 (and (bvsge (index!20112 lt!240265) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240265) (size!16373 a!3235)))))

(declare-fun res!320864 () Bool)

(assert (=> b!523636 (= res!320864 (= (select (arr!16009 a!3235) (index!20112 lt!240265)) (select (arr!16009 a!3235) j!176)))))

(declare-fun e!305391 () Bool)

(assert (=> b!523636 (=> res!320864 e!305391)))

(declare-fun e!305388 () Bool)

(assert (=> b!523636 (= e!305388 e!305391)))

(declare-fun e!305390 () SeekEntryResult!4476)

(declare-fun b!523637 () Bool)

(assert (=> b!523637 (= e!305390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240145 #b00000000000000000000000000000000 mask!3524) (select (arr!16009 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523638 () Bool)

(declare-fun e!305389 () Bool)

(assert (=> b!523638 (= e!305389 (bvsge (x!49087 lt!240265) #b01111111111111111111111111111110))))

(declare-fun b!523639 () Bool)

(assert (=> b!523639 (and (bvsge (index!20112 lt!240265) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240265) (size!16373 a!3235)))))

(declare-fun res!320865 () Bool)

(assert (=> b!523639 (= res!320865 (= (select (arr!16009 a!3235) (index!20112 lt!240265)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523639 (=> res!320865 e!305391)))

(declare-fun b!523640 () Bool)

(assert (=> b!523640 (and (bvsge (index!20112 lt!240265) #b00000000000000000000000000000000) (bvslt (index!20112 lt!240265) (size!16373 a!3235)))))

(assert (=> b!523640 (= e!305391 (= (select (arr!16009 a!3235) (index!20112 lt!240265)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523641 () Bool)

(assert (=> b!523641 (= e!305389 e!305388)))

(declare-fun res!320863 () Bool)

(assert (=> b!523641 (= res!320863 (and ((_ is Intermediate!4476) lt!240265) (not (undefined!5288 lt!240265)) (bvslt (x!49087 lt!240265) #b01111111111111111111111111111110) (bvsge (x!49087 lt!240265) #b00000000000000000000000000000000) (bvsge (x!49087 lt!240265) #b00000000000000000000000000000000)))))

(assert (=> b!523641 (=> (not res!320863) (not e!305388))))

(declare-fun d!80579 () Bool)

(assert (=> d!80579 e!305389))

(declare-fun c!61690 () Bool)

(assert (=> d!80579 (= c!61690 (and ((_ is Intermediate!4476) lt!240265) (undefined!5288 lt!240265)))))

(declare-fun e!305392 () SeekEntryResult!4476)

(assert (=> d!80579 (= lt!240265 e!305392)))

(declare-fun c!61691 () Bool)

(assert (=> d!80579 (= c!61691 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240266 () (_ BitVec 64))

(assert (=> d!80579 (= lt!240266 (select (arr!16009 a!3235) lt!240145))))

(assert (=> d!80579 (validMask!0 mask!3524)))

(assert (=> d!80579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240145 (select (arr!16009 a!3235) j!176) a!3235 mask!3524) lt!240265)))

(declare-fun b!523642 () Bool)

(assert (=> b!523642 (= e!305392 (Intermediate!4476 true lt!240145 #b00000000000000000000000000000000))))

(declare-fun b!523643 () Bool)

(assert (=> b!523643 (= e!305392 e!305390)))

(declare-fun c!61692 () Bool)

(assert (=> b!523643 (= c!61692 (or (= lt!240266 (select (arr!16009 a!3235) j!176)) (= (bvadd lt!240266 lt!240266) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523644 () Bool)

(assert (=> b!523644 (= e!305390 (Intermediate!4476 false lt!240145 #b00000000000000000000000000000000))))

(assert (= (and d!80579 c!61691) b!523642))

(assert (= (and d!80579 (not c!61691)) b!523643))

(assert (= (and b!523643 c!61692) b!523644))

(assert (= (and b!523643 (not c!61692)) b!523637))

(assert (= (and d!80579 c!61690) b!523638))

(assert (= (and d!80579 (not c!61690)) b!523641))

(assert (= (and b!523641 res!320863) b!523636))

(assert (= (and b!523636 (not res!320864)) b!523639))

(assert (= (and b!523639 (not res!320865)) b!523640))

(declare-fun m!504431 () Bool)

(assert (=> b!523636 m!504431))

(assert (=> b!523640 m!504431))

(assert (=> b!523637 m!504389))

(assert (=> b!523637 m!504389))

(assert (=> b!523637 m!504201))

(declare-fun m!504433 () Bool)

(assert (=> b!523637 m!504433))

(assert (=> b!523639 m!504431))

(declare-fun m!504435 () Bool)

(assert (=> d!80579 m!504435))

(assert (=> d!80579 m!504207))

(assert (=> b!523387 d!80579))

(declare-fun d!80581 () Bool)

(declare-fun lt!240268 () (_ BitVec 32))

(declare-fun lt!240267 () (_ BitVec 32))

(assert (=> d!80581 (= lt!240268 (bvmul (bvxor lt!240267 (bvlshr lt!240267 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80581 (= lt!240267 ((_ extract 31 0) (bvand (bvxor lt!240144 (bvlshr lt!240144 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80581 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320853 (let ((h!11090 ((_ extract 31 0) (bvand (bvxor lt!240144 (bvlshr lt!240144 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49094 (bvmul (bvxor h!11090 (bvlshr h!11090 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49094 (bvlshr x!49094 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320853 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320853 #b00000000000000000000000000000000))))))

(assert (=> d!80581 (= (toIndex!0 lt!240144 mask!3524) (bvand (bvxor lt!240268 (bvlshr lt!240268 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523387 d!80581))

(declare-fun d!80583 () Bool)

(assert (=> d!80583 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240282 () Unit!16356)

(declare-fun choose!38 (array!33309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16356)

(assert (=> d!80583 (= lt!240282 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80583 (validMask!0 mask!3524)))

(assert (=> d!80583 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240282)))

(declare-fun bs!16450 () Bool)

(assert (= bs!16450 d!80583))

(assert (=> bs!16450 m!504229))

(declare-fun m!504449 () Bool)

(assert (=> bs!16450 m!504449))

(assert (=> bs!16450 m!504207))

(assert (=> b!523387 d!80583))

(declare-fun b!523658 () Bool)

(declare-fun lt!240285 () SeekEntryResult!4476)

(declare-fun e!305401 () SeekEntryResult!4476)

(assert (=> b!523658 (= e!305401 (seekKeyOrZeroReturnVacant!0 (x!49087 lt!240285) (index!20112 lt!240285) (index!20112 lt!240285) (select (arr!16009 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523659 () Bool)

(declare-fun e!305402 () SeekEntryResult!4476)

(assert (=> b!523659 (= e!305402 Undefined!4476)))

(declare-fun b!523660 () Bool)

(declare-fun e!305403 () SeekEntryResult!4476)

(assert (=> b!523660 (= e!305402 e!305403)))

(declare-fun lt!240284 () (_ BitVec 64))

(assert (=> b!523660 (= lt!240284 (select (arr!16009 a!3235) (index!20112 lt!240285)))))

(declare-fun c!61699 () Bool)

(assert (=> b!523660 (= c!61699 (= lt!240284 (select (arr!16009 a!3235) j!176)))))

(declare-fun b!523661 () Bool)

(assert (=> b!523661 (= e!305401 (MissingZero!4476 (index!20112 lt!240285)))))

(declare-fun d!80591 () Bool)

(declare-fun lt!240283 () SeekEntryResult!4476)

(assert (=> d!80591 (and (or ((_ is Undefined!4476) lt!240283) (not ((_ is Found!4476) lt!240283)) (and (bvsge (index!20111 lt!240283) #b00000000000000000000000000000000) (bvslt (index!20111 lt!240283) (size!16373 a!3235)))) (or ((_ is Undefined!4476) lt!240283) ((_ is Found!4476) lt!240283) (not ((_ is MissingZero!4476) lt!240283)) (and (bvsge (index!20110 lt!240283) #b00000000000000000000000000000000) (bvslt (index!20110 lt!240283) (size!16373 a!3235)))) (or ((_ is Undefined!4476) lt!240283) ((_ is Found!4476) lt!240283) ((_ is MissingZero!4476) lt!240283) (not ((_ is MissingVacant!4476) lt!240283)) (and (bvsge (index!20113 lt!240283) #b00000000000000000000000000000000) (bvslt (index!20113 lt!240283) (size!16373 a!3235)))) (or ((_ is Undefined!4476) lt!240283) (ite ((_ is Found!4476) lt!240283) (= (select (arr!16009 a!3235) (index!20111 lt!240283)) (select (arr!16009 a!3235) j!176)) (ite ((_ is MissingZero!4476) lt!240283) (= (select (arr!16009 a!3235) (index!20110 lt!240283)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4476) lt!240283) (= (select (arr!16009 a!3235) (index!20113 lt!240283)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80591 (= lt!240283 e!305402)))

(declare-fun c!61697 () Bool)

(assert (=> d!80591 (= c!61697 (and ((_ is Intermediate!4476) lt!240285) (undefined!5288 lt!240285)))))

(assert (=> d!80591 (= lt!240285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16009 a!3235) j!176) mask!3524) (select (arr!16009 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80591 (validMask!0 mask!3524)))

(assert (=> d!80591 (= (seekEntryOrOpen!0 (select (arr!16009 a!3235) j!176) a!3235 mask!3524) lt!240283)))

(declare-fun b!523662 () Bool)

(declare-fun c!61698 () Bool)

(assert (=> b!523662 (= c!61698 (= lt!240284 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523662 (= e!305403 e!305401)))

(declare-fun b!523663 () Bool)

(assert (=> b!523663 (= e!305403 (Found!4476 (index!20112 lt!240285)))))

(assert (= (and d!80591 c!61697) b!523659))

(assert (= (and d!80591 (not c!61697)) b!523660))

(assert (= (and b!523660 c!61699) b!523663))

(assert (= (and b!523660 (not c!61699)) b!523662))

(assert (= (and b!523662 c!61698) b!523661))

(assert (= (and b!523662 (not c!61698)) b!523658))

(assert (=> b!523658 m!504201))

(declare-fun m!504451 () Bool)

(assert (=> b!523658 m!504451))

(declare-fun m!504453 () Bool)

(assert (=> b!523660 m!504453))

(declare-fun m!504455 () Bool)

(assert (=> d!80591 m!504455))

(assert (=> d!80591 m!504207))

(assert (=> d!80591 m!504233))

(assert (=> d!80591 m!504201))

(declare-fun m!504457 () Bool)

(assert (=> d!80591 m!504457))

(assert (=> d!80591 m!504201))

(assert (=> d!80591 m!504233))

(declare-fun m!504459 () Bool)

(assert (=> d!80591 m!504459))

(declare-fun m!504461 () Bool)

(assert (=> d!80591 m!504461))

(assert (=> b!523378 d!80591))

(declare-fun d!80593 () Bool)

(declare-fun res!320881 () Bool)

(declare-fun e!305418 () Bool)

(assert (=> d!80593 (=> res!320881 e!305418)))

(assert (=> d!80593 (= res!320881 (= (select (arr!16009 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80593 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!305418)))

(declare-fun b!523686 () Bool)

(declare-fun e!305419 () Bool)

(assert (=> b!523686 (= e!305418 e!305419)))

(declare-fun res!320882 () Bool)

(assert (=> b!523686 (=> (not res!320882) (not e!305419))))

(assert (=> b!523686 (= res!320882 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16373 a!3235)))))

(declare-fun b!523687 () Bool)

(assert (=> b!523687 (= e!305419 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80593 (not res!320881)) b!523686))

(assert (= (and b!523686 res!320882) b!523687))

(assert (=> d!80593 m!504293))

(declare-fun m!504463 () Bool)

(assert (=> b!523687 m!504463))

(assert (=> b!523383 d!80593))

(check-sat (not d!80579) (not bm!31838) (not b!523607) (not b!523460) (not b!523604) (not bm!31829) (not b!523567) (not b!523462) (not b!523459) (not b!523658) (not bm!31839) (not d!80567) (not b!523632) (not b!523609) (not d!80541) (not d!80533) (not d!80521) (not b!523635) (not d!80583) (not b!523510) (not b!523687) (not b!523443) (not d!80591) (not b!523637))
(check-sat)
