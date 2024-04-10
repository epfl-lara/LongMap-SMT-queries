; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31862 () Bool)

(assert start!31862)

(declare-fun b!318572 () Bool)

(declare-fun e!197935 () Bool)

(declare-fun e!197932 () Bool)

(assert (=> b!318572 (= e!197935 e!197932)))

(declare-fun res!173153 () Bool)

(assert (=> b!318572 (=> (not res!173153) (not e!197932))))

(declare-datatypes ((array!16233 0))(
  ( (array!16234 (arr!7682 (Array (_ BitVec 32) (_ BitVec 64))) (size!8034 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16233)

(declare-datatypes ((SeekEntryResult!2822 0))(
  ( (MissingZero!2822 (index!13464 (_ BitVec 32))) (Found!2822 (index!13465 (_ BitVec 32))) (Intermediate!2822 (undefined!3634 Bool) (index!13466 (_ BitVec 32)) (x!31719 (_ BitVec 32))) (Undefined!2822) (MissingVacant!2822 (index!13467 (_ BitVec 32))) )
))
(declare-fun lt!155406 () SeekEntryResult!2822)

(declare-fun lt!155404 () SeekEntryResult!2822)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318572 (= res!173153 (and (= lt!155404 lt!155406) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7682 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16233 (_ BitVec 32)) SeekEntryResult!2822)

(assert (=> b!318572 (= lt!155404 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun lt!155405 () (_ BitVec 32))

(declare-fun b!318573 () Bool)

(assert (=> b!318573 (= e!197932 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (and (bvsge lt!155405 #b00000000000000000000000000000000) (bvslt lt!155405 (size!8034 a!3293))))))))

(declare-fun e!197933 () Bool)

(assert (=> b!318573 e!197933))

(declare-fun res!173158 () Bool)

(assert (=> b!318573 (=> (not res!173158) (not e!197933))))

(assert (=> b!318573 (= res!173158 (= lt!155404 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155405 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318573 (= lt!155405 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318574 () Bool)

(declare-fun res!173156 () Bool)

(declare-fun e!197934 () Bool)

(assert (=> b!318574 (=> (not res!173156) (not e!197934))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318574 (= res!173156 (and (= (size!8034 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8034 a!3293))))))

(declare-fun b!318575 () Bool)

(assert (=> b!318575 (= e!197934 e!197935)))

(declare-fun res!173155 () Bool)

(assert (=> b!318575 (=> (not res!173155) (not e!197935))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318575 (= res!173155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155406))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318575 (= lt!155406 (Intermediate!2822 false resIndex!52 resX!52))))

(declare-fun b!318576 () Bool)

(declare-fun res!173151 () Bool)

(assert (=> b!318576 (=> (not res!173151) (not e!197934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16233 (_ BitVec 32)) Bool)

(assert (=> b!318576 (= res!173151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318577 () Bool)

(declare-fun res!173154 () Bool)

(assert (=> b!318577 (=> (not res!173154) (not e!197934))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16233 (_ BitVec 32)) SeekEntryResult!2822)

(assert (=> b!318577 (= res!173154 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2822 i!1240)))))

(declare-fun b!318578 () Bool)

(declare-fun res!173152 () Bool)

(assert (=> b!318578 (=> (not res!173152) (not e!197934))))

(declare-fun arrayContainsKey!0 (array!16233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318578 (= res!173152 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!173159 () Bool)

(assert (=> start!31862 (=> (not res!173159) (not e!197934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31862 (= res!173159 (validMask!0 mask!3709))))

(assert (=> start!31862 e!197934))

(declare-fun array_inv!5645 (array!16233) Bool)

(assert (=> start!31862 (array_inv!5645 a!3293)))

(assert (=> start!31862 true))

(declare-fun b!318579 () Bool)

(declare-fun res!173160 () Bool)

(assert (=> b!318579 (=> (not res!173160) (not e!197935))))

(assert (=> b!318579 (= res!173160 (and (= (select (arr!7682 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8034 a!3293))))))

(declare-fun b!318580 () Bool)

(declare-fun res!173157 () Bool)

(assert (=> b!318580 (=> (not res!173157) (not e!197934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318580 (= res!173157 (validKeyInArray!0 k!2441))))

(declare-fun lt!155403 () array!16233)

(declare-fun b!318581 () Bool)

(assert (=> b!318581 (= e!197933 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155403 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155405 k!2441 lt!155403 mask!3709)))))

(assert (=> b!318581 (= lt!155403 (array!16234 (store (arr!7682 a!3293) i!1240 k!2441) (size!8034 a!3293)))))

(assert (= (and start!31862 res!173159) b!318574))

(assert (= (and b!318574 res!173156) b!318580))

(assert (= (and b!318580 res!173157) b!318578))

(assert (= (and b!318578 res!173152) b!318577))

(assert (= (and b!318577 res!173154) b!318576))

(assert (= (and b!318576 res!173151) b!318575))

(assert (= (and b!318575 res!173155) b!318579))

(assert (= (and b!318579 res!173160) b!318572))

(assert (= (and b!318572 res!173153) b!318573))

(assert (= (and b!318573 res!173158) b!318581))

(declare-fun m!327281 () Bool)

(assert (=> b!318581 m!327281))

(declare-fun m!327283 () Bool)

(assert (=> b!318581 m!327283))

(declare-fun m!327285 () Bool)

(assert (=> b!318581 m!327285))

(declare-fun m!327287 () Bool)

(assert (=> b!318575 m!327287))

(assert (=> b!318575 m!327287))

(declare-fun m!327289 () Bool)

(assert (=> b!318575 m!327289))

(declare-fun m!327291 () Bool)

(assert (=> b!318577 m!327291))

(declare-fun m!327293 () Bool)

(assert (=> b!318578 m!327293))

(declare-fun m!327295 () Bool)

(assert (=> b!318572 m!327295))

(declare-fun m!327297 () Bool)

(assert (=> b!318572 m!327297))

(declare-fun m!327299 () Bool)

(assert (=> b!318573 m!327299))

(declare-fun m!327301 () Bool)

(assert (=> b!318573 m!327301))

(declare-fun m!327303 () Bool)

(assert (=> b!318580 m!327303))

(declare-fun m!327305 () Bool)

(assert (=> start!31862 m!327305))

(declare-fun m!327307 () Bool)

(assert (=> start!31862 m!327307))

(declare-fun m!327309 () Bool)

(assert (=> b!318579 m!327309))

(declare-fun m!327311 () Bool)

(assert (=> b!318576 m!327311))

(push 1)

(assert (not b!318575))

(assert (not b!318577))

(assert (not b!318572))

(assert (not b!318576))

(assert (not b!318580))

(assert (not start!31862))

(assert (not b!318578))

(assert (not b!318573))

(assert (not b!318581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69233 () Bool)

(declare-fun res!173231 () Bool)

(declare-fun e!197976 () Bool)

(assert (=> d!69233 (=> res!173231 e!197976)))

(assert (=> d!69233 (= res!173231 (= (select (arr!7682 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!69233 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!197976)))

(declare-fun b!318652 () Bool)

(declare-fun e!197977 () Bool)

(assert (=> b!318652 (= e!197976 e!197977)))

(declare-fun res!173232 () Bool)

(assert (=> b!318652 (=> (not res!173232) (not e!197977))))

(assert (=> b!318652 (= res!173232 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8034 a!3293)))))

(declare-fun b!318653 () Bool)

(assert (=> b!318653 (= e!197977 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69233 (not res!173231)) b!318652))

(assert (= (and b!318652 res!173232) b!318653))

(declare-fun m!327381 () Bool)

(assert (=> d!69233 m!327381))

(declare-fun m!327383 () Bool)

(assert (=> b!318653 m!327383))

(assert (=> b!318578 d!69233))

(declare-fun e!198013 () SeekEntryResult!2822)

(declare-fun b!318711 () Bool)

(assert (=> b!318711 (= e!198013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!155405 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!318712 () Bool)

(declare-fun e!198011 () Bool)

(declare-fun e!198012 () Bool)

(assert (=> b!318712 (= e!198011 e!198012)))

(declare-fun res!173250 () Bool)

(declare-fun lt!155446 () SeekEntryResult!2822)

(assert (=> b!318712 (= res!173250 (and (is-Intermediate!2822 lt!155446) (not (undefined!3634 lt!155446)) (bvslt (x!31719 lt!155446) #b01111111111111111111111111111110) (bvsge (x!31719 lt!155446) #b00000000000000000000000000000000) (bvsge (x!31719 lt!155446) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!318712 (=> (not res!173250) (not e!198012))))

(declare-fun b!318713 () Bool)

(declare-fun e!198015 () SeekEntryResult!2822)

(assert (=> b!318713 (= e!198015 (Intermediate!2822 true lt!155405 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318714 () Bool)

(assert (=> b!318714 (= e!198015 e!198013)))

(declare-fun c!50355 () Bool)

(declare-fun lt!155445 () (_ BitVec 64))

(assert (=> b!318714 (= c!50355 (or (= lt!155445 k!2441) (= (bvadd lt!155445 lt!155445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318715 () Bool)

(assert (=> b!318715 (and (bvsge (index!13466 lt!155446) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155446) (size!8034 a!3293)))))

(declare-fun res!173252 () Bool)

(assert (=> b!318715 (= res!173252 (= (select (arr!7682 a!3293) (index!13466 lt!155446)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198014 () Bool)

(assert (=> b!318715 (=> res!173252 e!198014)))

(declare-fun b!318716 () Bool)

(assert (=> b!318716 (and (bvsge (index!13466 lt!155446) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155446) (size!8034 a!3293)))))

(assert (=> b!318716 (= e!198014 (= (select (arr!7682 a!3293) (index!13466 lt!155446)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69237 () Bool)

(assert (=> d!69237 e!198011))

(declare-fun c!50354 () Bool)

(assert (=> d!69237 (= c!50354 (and (is-Intermediate!2822 lt!155446) (undefined!3634 lt!155446)))))

(assert (=> d!69237 (= lt!155446 e!198015)))

(declare-fun c!50353 () Bool)

(assert (=> d!69237 (= c!50353 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!69237 (= lt!155445 (select (arr!7682 a!3293) lt!155405))))

(assert (=> d!69237 (validMask!0 mask!3709)))

(assert (=> d!69237 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155405 k!2441 a!3293 mask!3709) lt!155446)))

(declare-fun b!318717 () Bool)

(assert (=> b!318717 (= e!198013 (Intermediate!2822 false lt!155405 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318718 () Bool)

(assert (=> b!318718 (and (bvsge (index!13466 lt!155446) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155446) (size!8034 a!3293)))))

(declare-fun res!173251 () Bool)

(assert (=> b!318718 (= res!173251 (= (select (arr!7682 a!3293) (index!13466 lt!155446)) k!2441))))

(assert (=> b!318718 (=> res!173251 e!198014)))

(assert (=> b!318718 (= e!198012 e!198014)))

(declare-fun b!318719 () Bool)

(assert (=> b!318719 (= e!198011 (bvsge (x!31719 lt!155446) #b01111111111111111111111111111110))))

(assert (= (and d!69237 c!50353) b!318713))

(assert (= (and d!69237 (not c!50353)) b!318714))

(assert (= (and b!318714 c!50355) b!318717))

(assert (= (and b!318714 (not c!50355)) b!318711))

(assert (= (and d!69237 c!50354) b!318719))

(assert (= (and d!69237 (not c!50354)) b!318712))

(assert (= (and b!318712 res!173250) b!318718))

(assert (= (and b!318718 (not res!173251)) b!318715))

(assert (= (and b!318715 (not res!173252)) b!318716))

(declare-fun m!327393 () Bool)

(assert (=> d!69237 m!327393))

(assert (=> d!69237 m!327305))

(declare-fun m!327395 () Bool)

(assert (=> b!318715 m!327395))

(assert (=> b!318716 m!327395))

(assert (=> b!318718 m!327395))

(declare-fun m!327397 () Bool)

(assert (=> b!318711 m!327397))

(assert (=> b!318711 m!327397))

(declare-fun m!327399 () Bool)

(assert (=> b!318711 m!327399))

(assert (=> b!318573 d!69237))

(declare-fun d!69245 () Bool)

(declare-fun lt!155452 () (_ BitVec 32))

(assert (=> d!69245 (and (bvsge lt!155452 #b00000000000000000000000000000000) (bvslt lt!155452 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69245 (= lt!155452 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69245 (validMask!0 mask!3709)))

(assert (=> d!69245 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!155452)))

(declare-fun bs!11109 () Bool)

(assert (= bs!11109 d!69245))

(declare-fun m!327403 () Bool)

(assert (=> bs!11109 m!327403))

(assert (=> bs!11109 m!327305))

(assert (=> b!318573 d!69245))

(declare-fun d!69249 () Bool)

(assert (=> d!69249 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31862 d!69249))

(declare-fun d!69259 () Bool)

(assert (=> d!69259 (= (array_inv!5645 a!3293) (bvsge (size!8034 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31862 d!69259))

(declare-fun d!69261 () Bool)

(assert (=> d!69261 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!318580 d!69261))

(declare-fun e!198045 () SeekEntryResult!2822)

(declare-fun b!318762 () Bool)

(assert (=> b!318762 (= e!198045 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!318763 () Bool)

(declare-fun e!198043 () Bool)

(declare-fun e!198044 () Bool)

(assert (=> b!318763 (= e!198043 e!198044)))

(declare-fun res!173275 () Bool)

(declare-fun lt!155470 () SeekEntryResult!2822)

(assert (=> b!318763 (= res!173275 (and (is-Intermediate!2822 lt!155470) (not (undefined!3634 lt!155470)) (bvslt (x!31719 lt!155470) #b01111111111111111111111111111110) (bvsge (x!31719 lt!155470) #b00000000000000000000000000000000) (bvsge (x!31719 lt!155470) #b00000000000000000000000000000000)))))

(assert (=> b!318763 (=> (not res!173275) (not e!198044))))

(declare-fun b!318764 () Bool)

(declare-fun e!198047 () SeekEntryResult!2822)

(assert (=> b!318764 (= e!198047 (Intermediate!2822 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!318765 () Bool)

(assert (=> b!318765 (= e!198047 e!198045)))

(declare-fun c!50367 () Bool)

(declare-fun lt!155469 () (_ BitVec 64))

(assert (=> b!318765 (= c!50367 (or (= lt!155469 k!2441) (= (bvadd lt!155469 lt!155469) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318766 () Bool)

(assert (=> b!318766 (and (bvsge (index!13466 lt!155470) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155470) (size!8034 a!3293)))))

(declare-fun res!173277 () Bool)

(assert (=> b!318766 (= res!173277 (= (select (arr!7682 a!3293) (index!13466 lt!155470)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198046 () Bool)

(assert (=> b!318766 (=> res!173277 e!198046)))

(declare-fun b!318767 () Bool)

(assert (=> b!318767 (and (bvsge (index!13466 lt!155470) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155470) (size!8034 a!3293)))))

(assert (=> b!318767 (= e!198046 (= (select (arr!7682 a!3293) (index!13466 lt!155470)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69263 () Bool)

(assert (=> d!69263 e!198043))

(declare-fun c!50366 () Bool)

(assert (=> d!69263 (= c!50366 (and (is-Intermediate!2822 lt!155470) (undefined!3634 lt!155470)))))

(assert (=> d!69263 (= lt!155470 e!198047)))

(declare-fun c!50365 () Bool)

(assert (=> d!69263 (= c!50365 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69263 (= lt!155469 (select (arr!7682 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!69263 (validMask!0 mask!3709)))

(assert (=> d!69263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155470)))

(declare-fun b!318768 () Bool)

(assert (=> b!318768 (= e!198045 (Intermediate!2822 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!318769 () Bool)

(assert (=> b!318769 (and (bvsge (index!13466 lt!155470) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155470) (size!8034 a!3293)))))

(declare-fun res!173276 () Bool)

(assert (=> b!318769 (= res!173276 (= (select (arr!7682 a!3293) (index!13466 lt!155470)) k!2441))))

(assert (=> b!318769 (=> res!173276 e!198046)))

(assert (=> b!318769 (= e!198044 e!198046)))

(declare-fun b!318770 () Bool)

(assert (=> b!318770 (= e!198043 (bvsge (x!31719 lt!155470) #b01111111111111111111111111111110))))

(assert (= (and d!69263 c!50365) b!318764))

(assert (= (and d!69263 (not c!50365)) b!318765))

(assert (= (and b!318765 c!50367) b!318768))

(assert (= (and b!318765 (not c!50367)) b!318762))

(assert (= (and d!69263 c!50366) b!318770))

(assert (= (and d!69263 (not c!50366)) b!318763))

(assert (= (and b!318763 res!173275) b!318769))

(assert (= (and b!318769 (not res!173276)) b!318766))

(assert (= (and b!318766 (not res!173277)) b!318767))

(assert (=> d!69263 m!327287))

(declare-fun m!327433 () Bool)

(assert (=> d!69263 m!327433))

(assert (=> d!69263 m!327305))

(declare-fun m!327435 () Bool)

(assert (=> b!318766 m!327435))

(assert (=> b!318767 m!327435))

(assert (=> b!318769 m!327435))

(assert (=> b!318762 m!327287))

(declare-fun m!327437 () Bool)

(assert (=> b!318762 m!327437))

(assert (=> b!318762 m!327437))

(declare-fun m!327439 () Bool)

(assert (=> b!318762 m!327439))

(assert (=> b!318575 d!69263))

(declare-fun d!69267 () Bool)

(declare-fun lt!155482 () (_ BitVec 32))

(declare-fun lt!155481 () (_ BitVec 32))

(assert (=> d!69267 (= lt!155482 (bvmul (bvxor lt!155481 (bvlshr lt!155481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69267 (= lt!155481 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69267 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!173278 (let ((h!5379 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31728 (bvmul (bvxor h!5379 (bvlshr h!5379 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31728 (bvlshr x!31728 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!173278 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!173278 #b00000000000000000000000000000000))))))

(assert (=> d!69267 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!155482 (bvlshr lt!155482 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!318575 d!69267))

(declare-fun b!318809 () Bool)

(declare-fun e!198074 () Bool)

(declare-fun e!198075 () Bool)

(assert (=> b!318809 (= e!198074 e!198075)))

(declare-fun lt!155497 () (_ BitVec 64))

(assert (=> b!318809 (= lt!155497 (select (arr!7682 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9796 0))(
  ( (Unit!9797) )
))
(declare-fun lt!155496 () Unit!9796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16233 (_ BitVec 64) (_ BitVec 32)) Unit!9796)

(assert (=> b!318809 (= lt!155496 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!155497 #b00000000000000000000000000000000))))

(assert (=> b!318809 (arrayContainsKey!0 a!3293 lt!155497 #b00000000000000000000000000000000)))

(declare-fun lt!155498 () Unit!9796)

(assert (=> b!318809 (= lt!155498 lt!155496)))

(declare-fun res!173295 () Bool)

(assert (=> b!318809 (= res!173295 (= (seekEntryOrOpen!0 (select (arr!7682 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2822 #b00000000000000000000000000000000)))))

(assert (=> b!318809 (=> (not res!173295) (not e!198075))))

(declare-fun b!318810 () Bool)

(declare-fun e!198073 () Bool)

(assert (=> b!318810 (= e!198073 e!198074)))

(declare-fun c!50379 () Bool)

(assert (=> b!318810 (= c!50379 (validKeyInArray!0 (select (arr!7682 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!318811 () Bool)

(declare-fun call!26035 () Bool)

(assert (=> b!318811 (= e!198075 call!26035)))

(declare-fun b!318812 () Bool)

(assert (=> b!318812 (= e!198074 call!26035)))

(declare-fun bm!26032 () Bool)

(assert (=> bm!26032 (= call!26035 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!69269 () Bool)

(declare-fun res!173296 () Bool)

(assert (=> d!69269 (=> res!173296 e!198073)))

(assert (=> d!69269 (= res!173296 (bvsge #b00000000000000000000000000000000 (size!8034 a!3293)))))

(assert (=> d!69269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!198073)))

(assert (= (and d!69269 (not res!173296)) b!318810))

(assert (= (and b!318810 c!50379) b!318809))

(assert (= (and b!318810 (not c!50379)) b!318812))

(assert (= (and b!318809 res!173295) b!318811))

(assert (= (or b!318811 b!318812) bm!26032))

(assert (=> b!318809 m!327381))

(declare-fun m!327463 () Bool)

(assert (=> b!318809 m!327463))

(declare-fun m!327465 () Bool)

(assert (=> b!318809 m!327465))

(assert (=> b!318809 m!327381))

(declare-fun m!327467 () Bool)

(assert (=> b!318809 m!327467))

(assert (=> b!318810 m!327381))

(assert (=> b!318810 m!327381))

(declare-fun m!327469 () Bool)

(assert (=> b!318810 m!327469))

(declare-fun m!327471 () Bool)

(assert (=> bm!26032 m!327471))

(assert (=> b!318576 d!69269))

(declare-fun b!318813 () Bool)

(declare-fun e!198078 () SeekEntryResult!2822)

(assert (=> b!318813 (= e!198078 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 lt!155403 mask!3709))))

(declare-fun b!318814 () Bool)

(declare-fun e!198076 () Bool)

(declare-fun e!198077 () Bool)

(assert (=> b!318814 (= e!198076 e!198077)))

(declare-fun res!173297 () Bool)

(declare-fun lt!155500 () SeekEntryResult!2822)

(assert (=> b!318814 (= res!173297 (and (is-Intermediate!2822 lt!155500) (not (undefined!3634 lt!155500)) (bvslt (x!31719 lt!155500) #b01111111111111111111111111111110) (bvsge (x!31719 lt!155500) #b00000000000000000000000000000000) (bvsge (x!31719 lt!155500) x!1427)))))

(assert (=> b!318814 (=> (not res!173297) (not e!198077))))

(declare-fun b!318815 () Bool)

(declare-fun e!198080 () SeekEntryResult!2822)

(assert (=> b!318815 (= e!198080 (Intermediate!2822 true index!1781 x!1427))))

(declare-fun b!318816 () Bool)

(assert (=> b!318816 (= e!198080 e!198078)))

(declare-fun c!50382 () Bool)

(declare-fun lt!155499 () (_ BitVec 64))

(assert (=> b!318816 (= c!50382 (or (= lt!155499 k!2441) (= (bvadd lt!155499 lt!155499) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318817 () Bool)

(assert (=> b!318817 (and (bvsge (index!13466 lt!155500) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155500) (size!8034 lt!155403)))))

(declare-fun res!173299 () Bool)

(assert (=> b!318817 (= res!173299 (= (select (arr!7682 lt!155403) (index!13466 lt!155500)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198079 () Bool)

(assert (=> b!318817 (=> res!173299 e!198079)))

(declare-fun b!318818 () Bool)

(assert (=> b!318818 (and (bvsge (index!13466 lt!155500) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155500) (size!8034 lt!155403)))))

(assert (=> b!318818 (= e!198079 (= (select (arr!7682 lt!155403) (index!13466 lt!155500)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69283 () Bool)

(assert (=> d!69283 e!198076))

(declare-fun c!50381 () Bool)

(assert (=> d!69283 (= c!50381 (and (is-Intermediate!2822 lt!155500) (undefined!3634 lt!155500)))))

(assert (=> d!69283 (= lt!155500 e!198080)))

(declare-fun c!50380 () Bool)

(assert (=> d!69283 (= c!50380 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!69283 (= lt!155499 (select (arr!7682 lt!155403) index!1781))))

(assert (=> d!69283 (validMask!0 mask!3709)))

(assert (=> d!69283 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155403 mask!3709) lt!155500)))

(declare-fun b!318819 () Bool)

(assert (=> b!318819 (= e!198078 (Intermediate!2822 false index!1781 x!1427))))

(declare-fun b!318820 () Bool)

(assert (=> b!318820 (and (bvsge (index!13466 lt!155500) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155500) (size!8034 lt!155403)))))

(declare-fun res!173298 () Bool)

(assert (=> b!318820 (= res!173298 (= (select (arr!7682 lt!155403) (index!13466 lt!155500)) k!2441))))

(assert (=> b!318820 (=> res!173298 e!198079)))

(assert (=> b!318820 (= e!198077 e!198079)))

(declare-fun b!318821 () Bool)

(assert (=> b!318821 (= e!198076 (bvsge (x!31719 lt!155500) #b01111111111111111111111111111110))))

(assert (= (and d!69283 c!50380) b!318815))

(assert (= (and d!69283 (not c!50380)) b!318816))

(assert (= (and b!318816 c!50382) b!318819))

(assert (= (and b!318816 (not c!50382)) b!318813))

(assert (= (and d!69283 c!50381) b!318821))

(assert (= (and d!69283 (not c!50381)) b!318814))

(assert (= (and b!318814 res!173297) b!318820))

(assert (= (and b!318820 (not res!173298)) b!318817))

(assert (= (and b!318817 (not res!173299)) b!318818))

(declare-fun m!327473 () Bool)

(assert (=> d!69283 m!327473))

(assert (=> d!69283 m!327305))

(declare-fun m!327475 () Bool)

(assert (=> b!318817 m!327475))

(assert (=> b!318818 m!327475))

(assert (=> b!318820 m!327475))

(assert (=> b!318813 m!327301))

(assert (=> b!318813 m!327301))

(declare-fun m!327477 () Bool)

(assert (=> b!318813 m!327477))

(assert (=> b!318581 d!69283))

(declare-fun b!318822 () Bool)

(declare-fun e!198083 () SeekEntryResult!2822)

(assert (=> b!318822 (= e!198083 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!155405 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 lt!155403 mask!3709))))

(declare-fun b!318823 () Bool)

(declare-fun e!198081 () Bool)

(declare-fun e!198082 () Bool)

(assert (=> b!318823 (= e!198081 e!198082)))

(declare-fun res!173300 () Bool)

(declare-fun lt!155502 () SeekEntryResult!2822)

(assert (=> b!318823 (= res!173300 (and (is-Intermediate!2822 lt!155502) (not (undefined!3634 lt!155502)) (bvslt (x!31719 lt!155502) #b01111111111111111111111111111110) (bvsge (x!31719 lt!155502) #b00000000000000000000000000000000) (bvsge (x!31719 lt!155502) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!318823 (=> (not res!173300) (not e!198082))))

(declare-fun b!318824 () Bool)

(declare-fun e!198085 () SeekEntryResult!2822)

(assert (=> b!318824 (= e!198085 (Intermediate!2822 true lt!155405 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318825 () Bool)

(assert (=> b!318825 (= e!198085 e!198083)))

(declare-fun c!50385 () Bool)

(declare-fun lt!155501 () (_ BitVec 64))

(assert (=> b!318825 (= c!50385 (or (= lt!155501 k!2441) (= (bvadd lt!155501 lt!155501) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318826 () Bool)

(assert (=> b!318826 (and (bvsge (index!13466 lt!155502) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155502) (size!8034 lt!155403)))))

(declare-fun res!173302 () Bool)

(assert (=> b!318826 (= res!173302 (= (select (arr!7682 lt!155403) (index!13466 lt!155502)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198084 () Bool)

(assert (=> b!318826 (=> res!173302 e!198084)))

(declare-fun b!318827 () Bool)

(assert (=> b!318827 (and (bvsge (index!13466 lt!155502) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155502) (size!8034 lt!155403)))))

(assert (=> b!318827 (= e!198084 (= (select (arr!7682 lt!155403) (index!13466 lt!155502)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69285 () Bool)

(assert (=> d!69285 e!198081))

(declare-fun c!50384 () Bool)

(assert (=> d!69285 (= c!50384 (and (is-Intermediate!2822 lt!155502) (undefined!3634 lt!155502)))))

(assert (=> d!69285 (= lt!155502 e!198085)))

(declare-fun c!50383 () Bool)

(assert (=> d!69285 (= c!50383 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!69285 (= lt!155501 (select (arr!7682 lt!155403) lt!155405))))

(assert (=> d!69285 (validMask!0 mask!3709)))

(assert (=> d!69285 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155405 k!2441 lt!155403 mask!3709) lt!155502)))

(declare-fun b!318828 () Bool)

(assert (=> b!318828 (= e!198083 (Intermediate!2822 false lt!155405 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!318829 () Bool)

(assert (=> b!318829 (and (bvsge (index!13466 lt!155502) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155502) (size!8034 lt!155403)))))

(declare-fun res!173301 () Bool)

(assert (=> b!318829 (= res!173301 (= (select (arr!7682 lt!155403) (index!13466 lt!155502)) k!2441))))

(assert (=> b!318829 (=> res!173301 e!198084)))

(assert (=> b!318829 (= e!198082 e!198084)))

(declare-fun b!318830 () Bool)

(assert (=> b!318830 (= e!198081 (bvsge (x!31719 lt!155502) #b01111111111111111111111111111110))))

(assert (= (and d!69285 c!50383) b!318824))

(assert (= (and d!69285 (not c!50383)) b!318825))

(assert (= (and b!318825 c!50385) b!318828))

(assert (= (and b!318825 (not c!50385)) b!318822))

(assert (= (and d!69285 c!50384) b!318830))

(assert (= (and d!69285 (not c!50384)) b!318823))

(assert (= (and b!318823 res!173300) b!318829))

(assert (= (and b!318829 (not res!173301)) b!318826))

(assert (= (and b!318826 (not res!173302)) b!318827))

(declare-fun m!327479 () Bool)

(assert (=> d!69285 m!327479))

(assert (=> d!69285 m!327305))

(declare-fun m!327481 () Bool)

(assert (=> b!318826 m!327481))

(assert (=> b!318827 m!327481))

(assert (=> b!318829 m!327481))

(assert (=> b!318822 m!327397))

(assert (=> b!318822 m!327397))

(declare-fun m!327483 () Bool)

(assert (=> b!318822 m!327483))

(assert (=> b!318581 d!69285))

(declare-fun e!198088 () SeekEntryResult!2822)

(declare-fun b!318831 () Bool)

(assert (=> b!318831 (= e!198088 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!318832 () Bool)

(declare-fun e!198086 () Bool)

(declare-fun e!198087 () Bool)

(assert (=> b!318832 (= e!198086 e!198087)))

(declare-fun res!173303 () Bool)

(declare-fun lt!155504 () SeekEntryResult!2822)

(assert (=> b!318832 (= res!173303 (and (is-Intermediate!2822 lt!155504) (not (undefined!3634 lt!155504)) (bvslt (x!31719 lt!155504) #b01111111111111111111111111111110) (bvsge (x!31719 lt!155504) #b00000000000000000000000000000000) (bvsge (x!31719 lt!155504) x!1427)))))

(assert (=> b!318832 (=> (not res!173303) (not e!198087))))

(declare-fun b!318833 () Bool)

(declare-fun e!198090 () SeekEntryResult!2822)

(assert (=> b!318833 (= e!198090 (Intermediate!2822 true index!1781 x!1427))))

(declare-fun b!318834 () Bool)

(assert (=> b!318834 (= e!198090 e!198088)))

(declare-fun c!50388 () Bool)

(declare-fun lt!155503 () (_ BitVec 64))

(assert (=> b!318834 (= c!50388 (or (= lt!155503 k!2441) (= (bvadd lt!155503 lt!155503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!318835 () Bool)

(assert (=> b!318835 (and (bvsge (index!13466 lt!155504) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155504) (size!8034 a!3293)))))

(declare-fun res!173305 () Bool)

(assert (=> b!318835 (= res!173305 (= (select (arr!7682 a!3293) (index!13466 lt!155504)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198089 () Bool)

(assert (=> b!318835 (=> res!173305 e!198089)))

(declare-fun b!318836 () Bool)

(assert (=> b!318836 (and (bvsge (index!13466 lt!155504) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155504) (size!8034 a!3293)))))

(assert (=> b!318836 (= e!198089 (= (select (arr!7682 a!3293) (index!13466 lt!155504)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69287 () Bool)

(assert (=> d!69287 e!198086))

(declare-fun c!50387 () Bool)

(assert (=> d!69287 (= c!50387 (and (is-Intermediate!2822 lt!155504) (undefined!3634 lt!155504)))))

(assert (=> d!69287 (= lt!155504 e!198090)))

(declare-fun c!50386 () Bool)

(assert (=> d!69287 (= c!50386 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!69287 (= lt!155503 (select (arr!7682 a!3293) index!1781))))

(assert (=> d!69287 (validMask!0 mask!3709)))

(assert (=> d!69287 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!155504)))

(declare-fun b!318837 () Bool)

(assert (=> b!318837 (= e!198088 (Intermediate!2822 false index!1781 x!1427))))

(declare-fun b!318838 () Bool)

(assert (=> b!318838 (and (bvsge (index!13466 lt!155504) #b00000000000000000000000000000000) (bvslt (index!13466 lt!155504) (size!8034 a!3293)))))

(declare-fun res!173304 () Bool)

(assert (=> b!318838 (= res!173304 (= (select (arr!7682 a!3293) (index!13466 lt!155504)) k!2441))))

(assert (=> b!318838 (=> res!173304 e!198089)))

(assert (=> b!318838 (= e!198087 e!198089)))

(declare-fun b!318839 () Bool)

(assert (=> b!318839 (= e!198086 (bvsge (x!31719 lt!155504) #b01111111111111111111111111111110))))

(assert (= (and d!69287 c!50386) b!318833))

(assert (= (and d!69287 (not c!50386)) b!318834))

(assert (= (and b!318834 c!50388) b!318837))

(assert (= (and b!318834 (not c!50388)) b!318831))

(assert (= (and d!69287 c!50387) b!318839))

(assert (= (and d!69287 (not c!50387)) b!318832))

(assert (= (and b!318832 res!173303) b!318838))

(assert (= (and b!318838 (not res!173304)) b!318835))

(assert (= (and b!318835 (not res!173305)) b!318836))

(assert (=> d!69287 m!327295))

(assert (=> d!69287 m!327305))

(declare-fun m!327485 () Bool)

(assert (=> b!318835 m!327485))

(assert (=> b!318836 m!327485))

(assert (=> b!318838 m!327485))

(assert (=> b!318831 m!327301))

(assert (=> b!318831 m!327301))

(declare-fun m!327487 () Bool)

(assert (=> b!318831 m!327487))

(assert (=> b!318572 d!69287))

(declare-fun b!318906 () Bool)

(declare-fun e!198126 () SeekEntryResult!2822)

(declare-fun e!198125 () SeekEntryResult!2822)

(assert (=> b!318906 (= e!198126 e!198125)))

(declare-fun lt!155537 () (_ BitVec 64))

(declare-fun lt!155539 () SeekEntryResult!2822)

(assert (=> b!318906 (= lt!155537 (select (arr!7682 a!3293) (index!13466 lt!155539)))))

(declare-fun c!50420 () Bool)

(assert (=> b!318906 (= c!50420 (= lt!155537 k!2441))))

(declare-fun b!318907 () Bool)

(assert (=> b!318907 (= e!198125 (Found!2822 (index!13466 lt!155539)))))

(declare-fun b!318908 () Bool)

(declare-fun e!198127 () SeekEntryResult!2822)

(assert (=> b!318908 (= e!198127 (MissingZero!2822 (index!13466 lt!155539)))))

(declare-fun d!69289 () Bool)

(declare-fun lt!155538 () SeekEntryResult!2822)

(assert (=> d!69289 (and (or (is-Undefined!2822 lt!155538) (not (is-Found!2822 lt!155538)) (and (bvsge (index!13465 lt!155538) #b00000000000000000000000000000000) (bvslt (index!13465 lt!155538) (size!8034 a!3293)))) (or (is-Undefined!2822 lt!155538) (is-Found!2822 lt!155538) (not (is-MissingZero!2822 lt!155538)) (and (bvsge (index!13464 lt!155538) #b00000000000000000000000000000000) (bvslt (index!13464 lt!155538) (size!8034 a!3293)))) (or (is-Undefined!2822 lt!155538) (is-Found!2822 lt!155538) (is-MissingZero!2822 lt!155538) (not (is-MissingVacant!2822 lt!155538)) (and (bvsge (index!13467 lt!155538) #b00000000000000000000000000000000) (bvslt (index!13467 lt!155538) (size!8034 a!3293)))) (or (is-Undefined!2822 lt!155538) (ite (is-Found!2822 lt!155538) (= (select (arr!7682 a!3293) (index!13465 lt!155538)) k!2441) (ite (is-MissingZero!2822 lt!155538) (= (select (arr!7682 a!3293) (index!13464 lt!155538)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2822 lt!155538) (= (select (arr!7682 a!3293) (index!13467 lt!155538)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69289 (= lt!155538 e!198126)))

(declare-fun c!50419 () Bool)

(assert (=> d!69289 (= c!50419 (and (is-Intermediate!2822 lt!155539) (undefined!3634 lt!155539)))))

(assert (=> d!69289 (= lt!155539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!69289 (validMask!0 mask!3709)))

(assert (=> d!69289 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!155538)))

(declare-fun b!318909 () Bool)

(assert (=> b!318909 (= e!198126 Undefined!2822)))

(declare-fun b!318910 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16233 (_ BitVec 32)) SeekEntryResult!2822)

(assert (=> b!318910 (= e!198127 (seekKeyOrZeroReturnVacant!0 (x!31719 lt!155539) (index!13466 lt!155539) (index!13466 lt!155539) k!2441 a!3293 mask!3709))))

(declare-fun b!318911 () Bool)

(declare-fun c!50421 () Bool)

(assert (=> b!318911 (= c!50421 (= lt!155537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!318911 (= e!198125 e!198127)))

(assert (= (and d!69289 c!50419) b!318909))

(assert (= (and d!69289 (not c!50419)) b!318906))

(assert (= (and b!318906 c!50420) b!318907))

(assert (= (and b!318906 (not c!50420)) b!318911))

(assert (= (and b!318911 c!50421) b!318908))

(assert (= (and b!318911 (not c!50421)) b!318910))

(declare-fun m!327525 () Bool)

(assert (=> b!318906 m!327525))

(assert (=> d!69289 m!327287))

(assert (=> d!69289 m!327289))

(declare-fun m!327527 () Bool)

(assert (=> d!69289 m!327527))

(assert (=> d!69289 m!327287))

(declare-fun m!327529 () Bool)

(assert (=> d!69289 m!327529))

(assert (=> d!69289 m!327305))

(declare-fun m!327531 () Bool)

(assert (=> d!69289 m!327531))

(declare-fun m!327533 () Bool)

(assert (=> b!318910 m!327533))

(assert (=> b!318577 d!69289))

(push 1)

(assert (not d!69289))

(assert (not b!318831))

(assert (not d!69263))

(assert (not b!318809))

(assert (not d!69285))

(assert (not b!318813))

(assert (not b!318810))

(assert (not b!318711))

(assert (not bm!26032))

(assert (not d!69237))

(assert (not b!318822))

(assert (not d!69287))

(assert (not b!318910))

(assert (not b!318653))

(assert (not b!318762))

(assert (not d!69283))

(assert (not d!69245))

(check-sat)

(pop 1)

(push 1)

(check-sat)

