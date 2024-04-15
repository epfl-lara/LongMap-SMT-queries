; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31074 () Bool)

(assert start!31074)

(declare-fun b!312580 () Bool)

(declare-fun res!169188 () Bool)

(declare-fun e!194849 () Bool)

(assert (=> b!312580 (=> (not res!169188) (not e!194849))))

(declare-datatypes ((array!15980 0))(
  ( (array!15981 (arr!7572 (Array (_ BitVec 32) (_ BitVec 64))) (size!7925 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15980)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2711 0))(
  ( (MissingZero!2711 (index!13020 (_ BitVec 32))) (Found!2711 (index!13021 (_ BitVec 32))) (Intermediate!2711 (undefined!3523 Bool) (index!13022 (_ BitVec 32)) (x!31239 (_ BitVec 32))) (Undefined!2711) (MissingVacant!2711 (index!13023 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15980 (_ BitVec 32)) SeekEntryResult!2711)

(assert (=> b!312580 (= res!169188 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2711 i!1240)))))

(declare-fun b!312581 () Bool)

(declare-fun res!169184 () Bool)

(assert (=> b!312581 (=> (not res!169184) (not e!194849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312581 (= res!169184 (validKeyInArray!0 k0!2441))))

(declare-fun b!312582 () Bool)

(declare-fun e!194847 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!312582 (= e!194847 (bvsge resX!52 #b01111111111111111111111111111110))))

(declare-fun res!169186 () Bool)

(assert (=> start!31074 (=> (not res!169186) (not e!194849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31074 (= res!169186 (validMask!0 mask!3709))))

(assert (=> start!31074 e!194849))

(declare-fun array_inv!5544 (array!15980) Bool)

(assert (=> start!31074 (array_inv!5544 a!3293)))

(assert (=> start!31074 true))

(declare-fun b!312583 () Bool)

(assert (=> b!312583 (= e!194849 e!194847)))

(declare-fun res!169182 () Bool)

(assert (=> b!312583 (=> (not res!169182) (not e!194847))))

(declare-fun lt!153113 () SeekEntryResult!2711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15980 (_ BitVec 32)) SeekEntryResult!2711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312583 (= res!169182 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153113))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312583 (= lt!153113 (Intermediate!2711 false resIndex!52 resX!52))))

(declare-fun b!312584 () Bool)

(declare-fun res!169183 () Bool)

(assert (=> b!312584 (=> (not res!169183) (not e!194847))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312584 (= res!169183 (and (= (select (arr!7572 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7925 a!3293))))))

(declare-fun b!312585 () Bool)

(declare-fun res!169181 () Bool)

(assert (=> b!312585 (=> (not res!169181) (not e!194849))))

(assert (=> b!312585 (= res!169181 (and (= (size!7925 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7925 a!3293))))))

(declare-fun b!312586 () Bool)

(declare-fun res!169187 () Bool)

(assert (=> b!312586 (=> (not res!169187) (not e!194847))))

(assert (=> b!312586 (= res!169187 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153113))))

(declare-fun b!312587 () Bool)

(declare-fun res!169180 () Bool)

(assert (=> b!312587 (=> (not res!169180) (not e!194849))))

(declare-fun arrayContainsKey!0 (array!15980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312587 (= res!169180 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312588 () Bool)

(declare-fun res!169185 () Bool)

(assert (=> b!312588 (=> (not res!169185) (not e!194849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15980 (_ BitVec 32)) Bool)

(assert (=> b!312588 (= res!169185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31074 res!169186) b!312585))

(assert (= (and b!312585 res!169181) b!312581))

(assert (= (and b!312581 res!169184) b!312587))

(assert (= (and b!312587 res!169180) b!312580))

(assert (= (and b!312580 res!169188) b!312588))

(assert (= (and b!312588 res!169185) b!312583))

(assert (= (and b!312583 res!169182) b!312584))

(assert (= (and b!312584 res!169183) b!312586))

(assert (= (and b!312586 res!169187) b!312582))

(declare-fun m!322267 () Bool)

(assert (=> b!312583 m!322267))

(assert (=> b!312583 m!322267))

(declare-fun m!322269 () Bool)

(assert (=> b!312583 m!322269))

(declare-fun m!322271 () Bool)

(assert (=> b!312580 m!322271))

(declare-fun m!322273 () Bool)

(assert (=> b!312588 m!322273))

(declare-fun m!322275 () Bool)

(assert (=> b!312581 m!322275))

(declare-fun m!322277 () Bool)

(assert (=> b!312584 m!322277))

(declare-fun m!322279 () Bool)

(assert (=> b!312586 m!322279))

(declare-fun m!322281 () Bool)

(assert (=> start!31074 m!322281))

(declare-fun m!322283 () Bool)

(assert (=> start!31074 m!322283))

(declare-fun m!322285 () Bool)

(assert (=> b!312587 m!322285))

(check-sat (not b!312588) (not b!312583) (not b!312580) (not start!31074) (not b!312587) (not b!312586) (not b!312581))
(check-sat)
(get-model)

(declare-fun d!68273 () Bool)

(declare-fun res!169247 () Bool)

(declare-fun e!194872 () Bool)

(assert (=> d!68273 (=> res!169247 e!194872)))

(assert (=> d!68273 (= res!169247 (= (select (arr!7572 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68273 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!194872)))

(declare-fun b!312647 () Bool)

(declare-fun e!194873 () Bool)

(assert (=> b!312647 (= e!194872 e!194873)))

(declare-fun res!169248 () Bool)

(assert (=> b!312647 (=> (not res!169248) (not e!194873))))

(assert (=> b!312647 (= res!169248 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7925 a!3293)))))

(declare-fun b!312648 () Bool)

(assert (=> b!312648 (= e!194873 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68273 (not res!169247)) b!312647))

(assert (= (and b!312647 res!169248) b!312648))

(declare-fun m!322327 () Bool)

(assert (=> d!68273 m!322327))

(declare-fun m!322329 () Bool)

(assert (=> b!312648 m!322329))

(assert (=> b!312587 d!68273))

(declare-fun d!68275 () Bool)

(assert (=> d!68275 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!312581 d!68275))

(declare-fun d!68277 () Bool)

(assert (=> d!68277 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31074 d!68277))

(declare-fun d!68283 () Bool)

(assert (=> d!68283 (= (array_inv!5544 a!3293) (bvsge (size!7925 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31074 d!68283))

(declare-fun b!312703 () Bool)

(declare-fun lt!153142 () SeekEntryResult!2711)

(assert (=> b!312703 (and (bvsge (index!13022 lt!153142) #b00000000000000000000000000000000) (bvslt (index!13022 lt!153142) (size!7925 a!3293)))))

(declare-fun e!194904 () Bool)

(assert (=> b!312703 (= e!194904 (= (select (arr!7572 a!3293) (index!13022 lt!153142)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!312704 () Bool)

(declare-fun e!194905 () SeekEntryResult!2711)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312704 (= e!194905 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!312705 () Bool)

(assert (=> b!312705 (= e!194905 (Intermediate!2711 false index!1781 x!1427))))

(declare-fun b!312706 () Bool)

(declare-fun e!194906 () SeekEntryResult!2711)

(assert (=> b!312706 (= e!194906 (Intermediate!2711 true index!1781 x!1427))))

(declare-fun b!312707 () Bool)

(assert (=> b!312707 (and (bvsge (index!13022 lt!153142) #b00000000000000000000000000000000) (bvslt (index!13022 lt!153142) (size!7925 a!3293)))))

(declare-fun res!169257 () Bool)

(assert (=> b!312707 (= res!169257 (= (select (arr!7572 a!3293) (index!13022 lt!153142)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312707 (=> res!169257 e!194904)))

(declare-fun b!312708 () Bool)

(assert (=> b!312708 (= e!194906 e!194905)))

(declare-fun c!49329 () Bool)

(declare-fun lt!153143 () (_ BitVec 64))

(assert (=> b!312708 (= c!49329 (or (= lt!153143 k0!2441) (= (bvadd lt!153143 lt!153143) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!312710 () Bool)

(declare-fun e!194903 () Bool)

(assert (=> b!312710 (= e!194903 (bvsge (x!31239 lt!153142) #b01111111111111111111111111111110))))

(declare-fun b!312711 () Bool)

(assert (=> b!312711 (and (bvsge (index!13022 lt!153142) #b00000000000000000000000000000000) (bvslt (index!13022 lt!153142) (size!7925 a!3293)))))

(declare-fun res!169256 () Bool)

(assert (=> b!312711 (= res!169256 (= (select (arr!7572 a!3293) (index!13022 lt!153142)) k0!2441))))

(assert (=> b!312711 (=> res!169256 e!194904)))

(declare-fun e!194902 () Bool)

(assert (=> b!312711 (= e!194902 e!194904)))

(declare-fun d!68285 () Bool)

(assert (=> d!68285 e!194903))

(declare-fun c!49330 () Bool)

(get-info :version)

(assert (=> d!68285 (= c!49330 (and ((_ is Intermediate!2711) lt!153142) (undefined!3523 lt!153142)))))

(assert (=> d!68285 (= lt!153142 e!194906)))

(declare-fun c!49331 () Bool)

(assert (=> d!68285 (= c!49331 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68285 (= lt!153143 (select (arr!7572 a!3293) index!1781))))

(assert (=> d!68285 (validMask!0 mask!3709)))

(assert (=> d!68285 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153142)))

(declare-fun b!312709 () Bool)

(assert (=> b!312709 (= e!194903 e!194902)))

(declare-fun res!169255 () Bool)

(assert (=> b!312709 (= res!169255 (and ((_ is Intermediate!2711) lt!153142) (not (undefined!3523 lt!153142)) (bvslt (x!31239 lt!153142) #b01111111111111111111111111111110) (bvsge (x!31239 lt!153142) #b00000000000000000000000000000000) (bvsge (x!31239 lt!153142) x!1427)))))

(assert (=> b!312709 (=> (not res!169255) (not e!194902))))

(assert (= (and d!68285 c!49331) b!312706))

(assert (= (and d!68285 (not c!49331)) b!312708))

(assert (= (and b!312708 c!49329) b!312705))

(assert (= (and b!312708 (not c!49329)) b!312704))

(assert (= (and d!68285 c!49330) b!312710))

(assert (= (and d!68285 (not c!49330)) b!312709))

(assert (= (and b!312709 res!169255) b!312711))

(assert (= (and b!312711 (not res!169256)) b!312707))

(assert (= (and b!312707 (not res!169257)) b!312703))

(declare-fun m!322351 () Bool)

(assert (=> b!312707 m!322351))

(assert (=> b!312703 m!322351))

(assert (=> b!312711 m!322351))

(declare-fun m!322353 () Bool)

(assert (=> b!312704 m!322353))

(assert (=> b!312704 m!322353))

(declare-fun m!322355 () Bool)

(assert (=> b!312704 m!322355))

(declare-fun m!322357 () Bool)

(assert (=> d!68285 m!322357))

(assert (=> d!68285 m!322281))

(assert (=> b!312586 d!68285))

(declare-fun b!312778 () Bool)

(declare-fun e!194944 () SeekEntryResult!2711)

(declare-fun lt!153164 () SeekEntryResult!2711)

(assert (=> b!312778 (= e!194944 (MissingZero!2711 (index!13022 lt!153164)))))

(declare-fun b!312779 () Bool)

(declare-fun c!49357 () Bool)

(declare-fun lt!153162 () (_ BitVec 64))

(assert (=> b!312779 (= c!49357 (= lt!153162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!194943 () SeekEntryResult!2711)

(assert (=> b!312779 (= e!194943 e!194944)))

(declare-fun b!312780 () Bool)

(declare-fun e!194945 () SeekEntryResult!2711)

(assert (=> b!312780 (= e!194945 Undefined!2711)))

(declare-fun b!312782 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15980 (_ BitVec 32)) SeekEntryResult!2711)

(assert (=> b!312782 (= e!194944 (seekKeyOrZeroReturnVacant!0 (x!31239 lt!153164) (index!13022 lt!153164) (index!13022 lt!153164) k0!2441 a!3293 mask!3709))))

(declare-fun b!312783 () Bool)

(assert (=> b!312783 (= e!194943 (Found!2711 (index!13022 lt!153164)))))

(declare-fun b!312781 () Bool)

(assert (=> b!312781 (= e!194945 e!194943)))

(assert (=> b!312781 (= lt!153162 (select (arr!7572 a!3293) (index!13022 lt!153164)))))

(declare-fun c!49358 () Bool)

(assert (=> b!312781 (= c!49358 (= lt!153162 k0!2441))))

(declare-fun d!68293 () Bool)

(declare-fun lt!153163 () SeekEntryResult!2711)

(assert (=> d!68293 (and (or ((_ is Undefined!2711) lt!153163) (not ((_ is Found!2711) lt!153163)) (and (bvsge (index!13021 lt!153163) #b00000000000000000000000000000000) (bvslt (index!13021 lt!153163) (size!7925 a!3293)))) (or ((_ is Undefined!2711) lt!153163) ((_ is Found!2711) lt!153163) (not ((_ is MissingZero!2711) lt!153163)) (and (bvsge (index!13020 lt!153163) #b00000000000000000000000000000000) (bvslt (index!13020 lt!153163) (size!7925 a!3293)))) (or ((_ is Undefined!2711) lt!153163) ((_ is Found!2711) lt!153163) ((_ is MissingZero!2711) lt!153163) (not ((_ is MissingVacant!2711) lt!153163)) (and (bvsge (index!13023 lt!153163) #b00000000000000000000000000000000) (bvslt (index!13023 lt!153163) (size!7925 a!3293)))) (or ((_ is Undefined!2711) lt!153163) (ite ((_ is Found!2711) lt!153163) (= (select (arr!7572 a!3293) (index!13021 lt!153163)) k0!2441) (ite ((_ is MissingZero!2711) lt!153163) (= (select (arr!7572 a!3293) (index!13020 lt!153163)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2711) lt!153163) (= (select (arr!7572 a!3293) (index!13023 lt!153163)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68293 (= lt!153163 e!194945)))

(declare-fun c!49356 () Bool)

(assert (=> d!68293 (= c!49356 (and ((_ is Intermediate!2711) lt!153164) (undefined!3523 lt!153164)))))

(assert (=> d!68293 (= lt!153164 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68293 (validMask!0 mask!3709)))

(assert (=> d!68293 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153163)))

(assert (= (and d!68293 c!49356) b!312780))

(assert (= (and d!68293 (not c!49356)) b!312781))

(assert (= (and b!312781 c!49358) b!312783))

(assert (= (and b!312781 (not c!49358)) b!312779))

(assert (= (and b!312779 c!49357) b!312778))

(assert (= (and b!312779 (not c!49357)) b!312782))

(declare-fun m!322375 () Bool)

(assert (=> b!312782 m!322375))

(declare-fun m!322377 () Bool)

(assert (=> b!312781 m!322377))

(assert (=> d!68293 m!322281))

(declare-fun m!322379 () Bool)

(assert (=> d!68293 m!322379))

(assert (=> d!68293 m!322267))

(assert (=> d!68293 m!322267))

(assert (=> d!68293 m!322269))

(declare-fun m!322381 () Bool)

(assert (=> d!68293 m!322381))

(declare-fun m!322383 () Bool)

(assert (=> d!68293 m!322383))

(assert (=> b!312580 d!68293))

(declare-fun b!312784 () Bool)

(declare-fun lt!153165 () SeekEntryResult!2711)

(assert (=> b!312784 (and (bvsge (index!13022 lt!153165) #b00000000000000000000000000000000) (bvslt (index!13022 lt!153165) (size!7925 a!3293)))))

(declare-fun e!194948 () Bool)

(assert (=> b!312784 (= e!194948 (= (select (arr!7572 a!3293) (index!13022 lt!153165)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!194949 () SeekEntryResult!2711)

(declare-fun b!312785 () Bool)

(assert (=> b!312785 (= e!194949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!312786 () Bool)

(assert (=> b!312786 (= e!194949 (Intermediate!2711 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!312787 () Bool)

(declare-fun e!194950 () SeekEntryResult!2711)

(assert (=> b!312787 (= e!194950 (Intermediate!2711 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!312788 () Bool)

(assert (=> b!312788 (and (bvsge (index!13022 lt!153165) #b00000000000000000000000000000000) (bvslt (index!13022 lt!153165) (size!7925 a!3293)))))

(declare-fun res!169279 () Bool)

(assert (=> b!312788 (= res!169279 (= (select (arr!7572 a!3293) (index!13022 lt!153165)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!312788 (=> res!169279 e!194948)))

(declare-fun b!312789 () Bool)

(assert (=> b!312789 (= e!194950 e!194949)))

(declare-fun c!49359 () Bool)

(declare-fun lt!153166 () (_ BitVec 64))

(assert (=> b!312789 (= c!49359 (or (= lt!153166 k0!2441) (= (bvadd lt!153166 lt!153166) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!312791 () Bool)

(declare-fun e!194947 () Bool)

(assert (=> b!312791 (= e!194947 (bvsge (x!31239 lt!153165) #b01111111111111111111111111111110))))

(declare-fun b!312792 () Bool)

(assert (=> b!312792 (and (bvsge (index!13022 lt!153165) #b00000000000000000000000000000000) (bvslt (index!13022 lt!153165) (size!7925 a!3293)))))

(declare-fun res!169278 () Bool)

(assert (=> b!312792 (= res!169278 (= (select (arr!7572 a!3293) (index!13022 lt!153165)) k0!2441))))

(assert (=> b!312792 (=> res!169278 e!194948)))

(declare-fun e!194946 () Bool)

(assert (=> b!312792 (= e!194946 e!194948)))

(declare-fun d!68301 () Bool)

(assert (=> d!68301 e!194947))

(declare-fun c!49360 () Bool)

(assert (=> d!68301 (= c!49360 (and ((_ is Intermediate!2711) lt!153165) (undefined!3523 lt!153165)))))

(assert (=> d!68301 (= lt!153165 e!194950)))

(declare-fun c!49361 () Bool)

(assert (=> d!68301 (= c!49361 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68301 (= lt!153166 (select (arr!7572 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68301 (validMask!0 mask!3709)))

(assert (=> d!68301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153165)))

(declare-fun b!312790 () Bool)

(assert (=> b!312790 (= e!194947 e!194946)))

(declare-fun res!169277 () Bool)

(assert (=> b!312790 (= res!169277 (and ((_ is Intermediate!2711) lt!153165) (not (undefined!3523 lt!153165)) (bvslt (x!31239 lt!153165) #b01111111111111111111111111111110) (bvsge (x!31239 lt!153165) #b00000000000000000000000000000000) (bvsge (x!31239 lt!153165) #b00000000000000000000000000000000)))))

(assert (=> b!312790 (=> (not res!169277) (not e!194946))))

(assert (= (and d!68301 c!49361) b!312787))

(assert (= (and d!68301 (not c!49361)) b!312789))

(assert (= (and b!312789 c!49359) b!312786))

(assert (= (and b!312789 (not c!49359)) b!312785))

(assert (= (and d!68301 c!49360) b!312791))

(assert (= (and d!68301 (not c!49360)) b!312790))

(assert (= (and b!312790 res!169277) b!312792))

(assert (= (and b!312792 (not res!169278)) b!312788))

(assert (= (and b!312788 (not res!169279)) b!312784))

(declare-fun m!322385 () Bool)

(assert (=> b!312788 m!322385))

(assert (=> b!312784 m!322385))

(assert (=> b!312792 m!322385))

(assert (=> b!312785 m!322267))

(declare-fun m!322387 () Bool)

(assert (=> b!312785 m!322387))

(assert (=> b!312785 m!322387))

(declare-fun m!322389 () Bool)

(assert (=> b!312785 m!322389))

(assert (=> d!68301 m!322267))

(declare-fun m!322391 () Bool)

(assert (=> d!68301 m!322391))

(assert (=> d!68301 m!322281))

(assert (=> b!312583 d!68301))

(declare-fun d!68303 () Bool)

(declare-fun lt!153187 () (_ BitVec 32))

(declare-fun lt!153186 () (_ BitVec 32))

(assert (=> d!68303 (= lt!153187 (bvmul (bvxor lt!153186 (bvlshr lt!153186 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68303 (= lt!153186 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68303 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169280 (let ((h!5315 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31246 (bvmul (bvxor h!5315 (bvlshr h!5315 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31246 (bvlshr x!31246 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169280 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169280 #b00000000000000000000000000000000))))))

(assert (=> d!68303 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153187 (bvlshr lt!153187 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!312583 d!68303))

(declare-fun b!312822 () Bool)

(declare-fun e!194973 () Bool)

(declare-fun call!25907 () Bool)

(assert (=> b!312822 (= e!194973 call!25907)))

(declare-fun b!312823 () Bool)

(declare-fun e!194971 () Bool)

(assert (=> b!312823 (= e!194971 call!25907)))

(declare-fun bm!25904 () Bool)

(assert (=> bm!25904 (= call!25907 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68309 () Bool)

(declare-fun res!169296 () Bool)

(declare-fun e!194972 () Bool)

(assert (=> d!68309 (=> res!169296 e!194972)))

(assert (=> d!68309 (= res!169296 (bvsge #b00000000000000000000000000000000 (size!7925 a!3293)))))

(assert (=> d!68309 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!194972)))

(declare-fun b!312824 () Bool)

(assert (=> b!312824 (= e!194973 e!194971)))

(declare-fun lt!153204 () (_ BitVec 64))

(assert (=> b!312824 (= lt!153204 (select (arr!7572 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9627 0))(
  ( (Unit!9628) )
))
(declare-fun lt!153202 () Unit!9627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15980 (_ BitVec 64) (_ BitVec 32)) Unit!9627)

(assert (=> b!312824 (= lt!153202 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153204 #b00000000000000000000000000000000))))

(assert (=> b!312824 (arrayContainsKey!0 a!3293 lt!153204 #b00000000000000000000000000000000)))

(declare-fun lt!153203 () Unit!9627)

(assert (=> b!312824 (= lt!153203 lt!153202)))

(declare-fun res!169295 () Bool)

(assert (=> b!312824 (= res!169295 (= (seekEntryOrOpen!0 (select (arr!7572 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2711 #b00000000000000000000000000000000)))))

(assert (=> b!312824 (=> (not res!169295) (not e!194971))))

(declare-fun b!312825 () Bool)

(assert (=> b!312825 (= e!194972 e!194973)))

(declare-fun c!49370 () Bool)

(assert (=> b!312825 (= c!49370 (validKeyInArray!0 (select (arr!7572 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68309 (not res!169296)) b!312825))

(assert (= (and b!312825 c!49370) b!312824))

(assert (= (and b!312825 (not c!49370)) b!312822))

(assert (= (and b!312824 res!169295) b!312823))

(assert (= (or b!312823 b!312822) bm!25904))

(declare-fun m!322413 () Bool)

(assert (=> bm!25904 m!322413))

(assert (=> b!312824 m!322327))

(declare-fun m!322415 () Bool)

(assert (=> b!312824 m!322415))

(declare-fun m!322417 () Bool)

(assert (=> b!312824 m!322417))

(assert (=> b!312824 m!322327))

(declare-fun m!322419 () Bool)

(assert (=> b!312824 m!322419))

(assert (=> b!312825 m!322327))

(assert (=> b!312825 m!322327))

(declare-fun m!322421 () Bool)

(assert (=> b!312825 m!322421))

(assert (=> b!312588 d!68309))

(check-sat (not d!68301) (not b!312825) (not b!312785) (not b!312782) (not d!68293) (not b!312824) (not b!312704) (not bm!25904) (not d!68285) (not b!312648))
(check-sat)
