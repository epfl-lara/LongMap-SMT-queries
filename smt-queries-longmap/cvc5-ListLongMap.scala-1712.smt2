; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31508 () Bool)

(assert start!31508)

(declare-fun b!315312 () Bool)

(declare-fun res!170769 () Bool)

(declare-fun e!196291 () Bool)

(assert (=> b!315312 (=> (not res!170769) (not e!196291))))

(declare-datatypes ((array!16083 0))(
  ( (array!16084 (arr!7613 (Array (_ BitVec 32) (_ BitVec 64))) (size!7965 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16083)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315312 (= res!170769 (and (= (select (arr!7613 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7965 a!3293))))))

(declare-fun b!315313 () Bool)

(declare-fun res!170762 () Bool)

(declare-fun e!196289 () Bool)

(assert (=> b!315313 (=> (not res!170762) (not e!196289))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315313 (= res!170762 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315314 () Bool)

(declare-fun res!170767 () Bool)

(assert (=> b!315314 (=> (not res!170767) (not e!196289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315314 (= res!170767 (validKeyInArray!0 k!2441))))

(declare-fun b!315315 () Bool)

(declare-fun res!170765 () Bool)

(assert (=> b!315315 (=> (not res!170765) (not e!196289))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!315315 (= res!170765 (and (= (size!7965 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7965 a!3293))))))

(declare-fun b!315316 () Bool)

(declare-fun e!196288 () Bool)

(assert (=> b!315316 (= e!196291 e!196288)))

(declare-fun res!170761 () Bool)

(assert (=> b!315316 (=> (not res!170761) (not e!196288))))

(declare-datatypes ((SeekEntryResult!2753 0))(
  ( (MissingZero!2753 (index!13188 (_ BitVec 32))) (Found!2753 (index!13189 (_ BitVec 32))) (Intermediate!2753 (undefined!3565 Bool) (index!13190 (_ BitVec 32)) (x!31430 (_ BitVec 32))) (Undefined!2753) (MissingVacant!2753 (index!13191 (_ BitVec 32))) )
))
(declare-fun lt!154212 () SeekEntryResult!2753)

(declare-fun lt!154211 () SeekEntryResult!2753)

(assert (=> b!315316 (= res!170761 (and (= lt!154211 lt!154212) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7613 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7613 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7613 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16083 (_ BitVec 32)) SeekEntryResult!2753)

(assert (=> b!315316 (= lt!154211 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!170764 () Bool)

(assert (=> start!31508 (=> (not res!170764) (not e!196289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31508 (= res!170764 (validMask!0 mask!3709))))

(assert (=> start!31508 e!196289))

(declare-fun array_inv!5576 (array!16083) Bool)

(assert (=> start!31508 (array_inv!5576 a!3293)))

(assert (=> start!31508 true))

(declare-fun b!315317 () Bool)

(declare-fun res!170768 () Bool)

(assert (=> b!315317 (=> (not res!170768) (not e!196289))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16083 (_ BitVec 32)) SeekEntryResult!2753)

(assert (=> b!315317 (= res!170768 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2753 i!1240)))))

(declare-fun b!315318 () Bool)

(assert (=> b!315318 (= e!196288 (not false))))

(declare-fun lt!154210 () SeekEntryResult!2753)

(assert (=> b!315318 (and (= lt!154211 lt!154210) (is-Intermediate!2753 lt!154210))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315318 (= lt!154210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!315319 () Bool)

(declare-fun res!170766 () Bool)

(assert (=> b!315319 (=> (not res!170766) (not e!196289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16083 (_ BitVec 32)) Bool)

(assert (=> b!315319 (= res!170766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315320 () Bool)

(assert (=> b!315320 (= e!196289 e!196291)))

(declare-fun res!170763 () Bool)

(assert (=> b!315320 (=> (not res!170763) (not e!196291))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315320 (= res!170763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154212))))

(assert (=> b!315320 (= lt!154212 (Intermediate!2753 false resIndex!52 resX!52))))

(assert (= (and start!31508 res!170764) b!315315))

(assert (= (and b!315315 res!170765) b!315314))

(assert (= (and b!315314 res!170767) b!315313))

(assert (= (and b!315313 res!170762) b!315317))

(assert (= (and b!315317 res!170768) b!315319))

(assert (= (and b!315319 res!170766) b!315320))

(assert (= (and b!315320 res!170763) b!315312))

(assert (= (and b!315312 res!170769) b!315316))

(assert (= (and b!315316 res!170761) b!315318))

(declare-fun m!324617 () Bool)

(assert (=> b!315318 m!324617))

(assert (=> b!315318 m!324617))

(declare-fun m!324619 () Bool)

(assert (=> b!315318 m!324619))

(declare-fun m!324621 () Bool)

(assert (=> b!315319 m!324621))

(declare-fun m!324623 () Bool)

(assert (=> b!315313 m!324623))

(declare-fun m!324625 () Bool)

(assert (=> b!315320 m!324625))

(assert (=> b!315320 m!324625))

(declare-fun m!324627 () Bool)

(assert (=> b!315320 m!324627))

(declare-fun m!324629 () Bool)

(assert (=> start!31508 m!324629))

(declare-fun m!324631 () Bool)

(assert (=> start!31508 m!324631))

(declare-fun m!324633 () Bool)

(assert (=> b!315316 m!324633))

(declare-fun m!324635 () Bool)

(assert (=> b!315316 m!324635))

(declare-fun m!324637 () Bool)

(assert (=> b!315314 m!324637))

(declare-fun m!324639 () Bool)

(assert (=> b!315317 m!324639))

(declare-fun m!324641 () Bool)

(assert (=> b!315312 m!324641))

(push 1)

(assert (not b!315318))

(assert (not b!315317))

(assert (not start!31508))

(assert (not b!315314))

(assert (not b!315313))

(assert (not b!315320))

(assert (not b!315319))

(assert (not b!315316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68901 () Bool)

(assert (=> d!68901 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31508 d!68901))

(declare-fun d!68903 () Bool)

(assert (=> d!68903 (= (array_inv!5576 a!3293) (bvsge (size!7965 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31508 d!68903))

(declare-fun d!68907 () Bool)

(declare-fun res!170838 () Bool)

(declare-fun e!196335 () Bool)

(assert (=> d!68907 (=> res!170838 e!196335)))

(assert (=> d!68907 (= res!170838 (= (select (arr!7613 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68907 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!196335)))

(declare-fun b!315406 () Bool)

(declare-fun e!196336 () Bool)

(assert (=> b!315406 (= e!196335 e!196336)))

(declare-fun res!170839 () Bool)

(assert (=> b!315406 (=> (not res!170839) (not e!196336))))

(assert (=> b!315406 (= res!170839 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7965 a!3293)))))

(declare-fun b!315407 () Bool)

(assert (=> b!315407 (= e!196336 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68907 (not res!170838)) b!315406))

(assert (= (and b!315406 res!170839) b!315407))

(declare-fun m!324703 () Bool)

(assert (=> d!68907 m!324703))

(declare-fun m!324705 () Bool)

(assert (=> b!315407 m!324705))

(assert (=> b!315313 d!68907))

(declare-fun d!68911 () Bool)

(assert (=> d!68911 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!315314 d!68911))

(declare-fun b!315428 () Bool)

(declare-fun e!196356 () Bool)

(declare-fun e!196357 () Bool)

(assert (=> b!315428 (= e!196356 e!196357)))

(declare-fun lt!154249 () (_ BitVec 64))

(assert (=> b!315428 (= lt!154249 (select (arr!7613 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9703 0))(
  ( (Unit!9704) )
))
(declare-fun lt!154250 () Unit!9703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16083 (_ BitVec 64) (_ BitVec 32)) Unit!9703)

(assert (=> b!315428 (= lt!154250 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154249 #b00000000000000000000000000000000))))

(assert (=> b!315428 (arrayContainsKey!0 a!3293 lt!154249 #b00000000000000000000000000000000)))

(declare-fun lt!154251 () Unit!9703)

(assert (=> b!315428 (= lt!154251 lt!154250)))

(declare-fun res!170857 () Bool)

(assert (=> b!315428 (= res!170857 (= (seekEntryOrOpen!0 (select (arr!7613 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2753 #b00000000000000000000000000000000)))))

(assert (=> b!315428 (=> (not res!170857) (not e!196357))))

(declare-fun b!315429 () Bool)

(declare-fun call!25993 () Bool)

(assert (=> b!315429 (= e!196357 call!25993)))

(declare-fun b!315430 () Bool)

(declare-fun e!196355 () Bool)

(assert (=> b!315430 (= e!196355 e!196356)))

(declare-fun c!49902 () Bool)

(assert (=> b!315430 (= c!49902 (validKeyInArray!0 (select (arr!7613 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!315431 () Bool)

(assert (=> b!315431 (= e!196356 call!25993)))

(declare-fun bm!25990 () Bool)

(assert (=> bm!25990 (= call!25993 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68913 () Bool)

(declare-fun res!170856 () Bool)

(assert (=> d!68913 (=> res!170856 e!196355)))

(assert (=> d!68913 (= res!170856 (bvsge #b00000000000000000000000000000000 (size!7965 a!3293)))))

(assert (=> d!68913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196355)))

(assert (= (and d!68913 (not res!170856)) b!315430))

(assert (= (and b!315430 c!49902) b!315428))

(assert (= (and b!315430 (not c!49902)) b!315431))

(assert (= (and b!315428 res!170857) b!315429))

(assert (= (or b!315429 b!315431) bm!25990))

(assert (=> b!315428 m!324703))

(declare-fun m!324715 () Bool)

(assert (=> b!315428 m!324715))

(declare-fun m!324717 () Bool)

(assert (=> b!315428 m!324717))

(assert (=> b!315428 m!324703))

(declare-fun m!324719 () Bool)

(assert (=> b!315428 m!324719))

(assert (=> b!315430 m!324703))

(assert (=> b!315430 m!324703))

(declare-fun m!324721 () Bool)

(assert (=> b!315430 m!324721))

(declare-fun m!324723 () Bool)

(assert (=> bm!25990 m!324723))

(assert (=> b!315319 d!68913))

(declare-fun b!315504 () Bool)

(declare-fun e!196397 () Bool)

(declare-fun e!196401 () Bool)

(assert (=> b!315504 (= e!196397 e!196401)))

(declare-fun res!170876 () Bool)

(declare-fun lt!154276 () SeekEntryResult!2753)

(assert (=> b!315504 (= res!170876 (and (is-Intermediate!2753 lt!154276) (not (undefined!3565 lt!154276)) (bvslt (x!31430 lt!154276) #b01111111111111111111111111111110) (bvsge (x!31430 lt!154276) #b00000000000000000000000000000000) (bvsge (x!31430 lt!154276) #b00000000000000000000000000000000)))))

(assert (=> b!315504 (=> (not res!170876) (not e!196401))))

(declare-fun b!315505 () Bool)

(assert (=> b!315505 (and (bvsge (index!13190 lt!154276) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154276) (size!7965 a!3293)))))

(declare-fun e!196400 () Bool)

(assert (=> b!315505 (= e!196400 (= (select (arr!7613 a!3293) (index!13190 lt!154276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68921 () Bool)

(assert (=> d!68921 e!196397))

(declare-fun c!49932 () Bool)

(assert (=> d!68921 (= c!49932 (and (is-Intermediate!2753 lt!154276) (undefined!3565 lt!154276)))))

(declare-fun e!196399 () SeekEntryResult!2753)

(assert (=> d!68921 (= lt!154276 e!196399)))

(declare-fun c!49931 () Bool)

(assert (=> d!68921 (= c!49931 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154277 () (_ BitVec 64))

(assert (=> d!68921 (= lt!154277 (select (arr!7613 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68921 (validMask!0 mask!3709)))

(assert (=> d!68921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154276)))

(declare-fun b!315506 () Bool)

(declare-fun e!196398 () SeekEntryResult!2753)

(assert (=> b!315506 (= e!196398 (Intermediate!2753 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315507 () Bool)

(assert (=> b!315507 (and (bvsge (index!13190 lt!154276) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154276) (size!7965 a!3293)))))

(declare-fun res!170877 () Bool)

(assert (=> b!315507 (= res!170877 (= (select (arr!7613 a!3293) (index!13190 lt!154276)) k!2441))))

(assert (=> b!315507 (=> res!170877 e!196400)))

(assert (=> b!315507 (= e!196401 e!196400)))

(declare-fun b!315508 () Bool)

(assert (=> b!315508 (= e!196399 (Intermediate!2753 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!315509 () Bool)

(assert (=> b!315509 (= e!196399 e!196398)))

(declare-fun c!49930 () Bool)

(assert (=> b!315509 (= c!49930 (or (= lt!154277 k!2441) (= (bvadd lt!154277 lt!154277) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315510 () Bool)

(assert (=> b!315510 (= e!196397 (bvsge (x!31430 lt!154276) #b01111111111111111111111111111110))))

(declare-fun b!315511 () Bool)

(assert (=> b!315511 (and (bvsge (index!13190 lt!154276) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154276) (size!7965 a!3293)))))

(declare-fun res!170878 () Bool)

(assert (=> b!315511 (= res!170878 (= (select (arr!7613 a!3293) (index!13190 lt!154276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315511 (=> res!170878 e!196400)))

(declare-fun b!315512 () Bool)

(assert (=> b!315512 (= e!196398 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!68921 c!49931) b!315508))

(assert (= (and d!68921 (not c!49931)) b!315509))

(assert (= (and b!315509 c!49930) b!315506))

(assert (= (and b!315509 (not c!49930)) b!315512))

(assert (= (and d!68921 c!49932) b!315510))

(assert (= (and d!68921 (not c!49932)) b!315504))

(assert (= (and b!315504 res!170876) b!315507))

(assert (= (and b!315507 (not res!170877)) b!315511))

(assert (= (and b!315511 (not res!170878)) b!315505))

(assert (=> b!315512 m!324625))

(declare-fun m!324747 () Bool)

(assert (=> b!315512 m!324747))

(assert (=> b!315512 m!324747))

(declare-fun m!324751 () Bool)

(assert (=> b!315512 m!324751))

(declare-fun m!324753 () Bool)

(assert (=> b!315505 m!324753))

(assert (=> d!68921 m!324625))

(declare-fun m!324755 () Bool)

(assert (=> d!68921 m!324755))

(assert (=> d!68921 m!324629))

(assert (=> b!315507 m!324753))

(assert (=> b!315511 m!324753))

(assert (=> b!315320 d!68921))

(declare-fun d!68933 () Bool)

(declare-fun lt!154285 () (_ BitVec 32))

(declare-fun lt!154284 () (_ BitVec 32))

(assert (=> d!68933 (= lt!154285 (bvmul (bvxor lt!154284 (bvlshr lt!154284 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68933 (= lt!154284 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68933 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170879 (let ((h!5368 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31438 (bvmul (bvxor h!5368 (bvlshr h!5368 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31438 (bvlshr x!31438 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170879 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170879 #b00000000000000000000000000000000))))))

(assert (=> d!68933 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!154285 (bvlshr lt!154285 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!315320 d!68933))

(declare-fun b!315522 () Bool)

(declare-fun e!196407 () Bool)

(declare-fun e!196411 () Bool)

(assert (=> b!315522 (= e!196407 e!196411)))

(declare-fun res!170883 () Bool)

(declare-fun lt!154286 () SeekEntryResult!2753)

(assert (=> b!315522 (= res!170883 (and (is-Intermediate!2753 lt!154286) (not (undefined!3565 lt!154286)) (bvslt (x!31430 lt!154286) #b01111111111111111111111111111110) (bvsge (x!31430 lt!154286) #b00000000000000000000000000000000) (bvsge (x!31430 lt!154286) x!1427)))))

(assert (=> b!315522 (=> (not res!170883) (not e!196411))))

(declare-fun b!315523 () Bool)

(assert (=> b!315523 (and (bvsge (index!13190 lt!154286) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154286) (size!7965 a!3293)))))

(declare-fun e!196410 () Bool)

(assert (=> b!315523 (= e!196410 (= (select (arr!7613 a!3293) (index!13190 lt!154286)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68937 () Bool)

(assert (=> d!68937 e!196407))

(declare-fun c!49938 () Bool)

(assert (=> d!68937 (= c!49938 (and (is-Intermediate!2753 lt!154286) (undefined!3565 lt!154286)))))

(declare-fun e!196409 () SeekEntryResult!2753)

(assert (=> d!68937 (= lt!154286 e!196409)))

(declare-fun c!49937 () Bool)

(assert (=> d!68937 (= c!49937 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154287 () (_ BitVec 64))

(assert (=> d!68937 (= lt!154287 (select (arr!7613 a!3293) index!1781))))

(assert (=> d!68937 (validMask!0 mask!3709)))

(assert (=> d!68937 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154286)))

(declare-fun b!315524 () Bool)

(declare-fun e!196408 () SeekEntryResult!2753)

(assert (=> b!315524 (= e!196408 (Intermediate!2753 false index!1781 x!1427))))

(declare-fun b!315525 () Bool)

(assert (=> b!315525 (and (bvsge (index!13190 lt!154286) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154286) (size!7965 a!3293)))))

(declare-fun res!170884 () Bool)

(assert (=> b!315525 (= res!170884 (= (select (arr!7613 a!3293) (index!13190 lt!154286)) k!2441))))

(assert (=> b!315525 (=> res!170884 e!196410)))

(assert (=> b!315525 (= e!196411 e!196410)))

(declare-fun b!315526 () Bool)

(assert (=> b!315526 (= e!196409 (Intermediate!2753 true index!1781 x!1427))))

(declare-fun b!315527 () Bool)

(assert (=> b!315527 (= e!196409 e!196408)))

(declare-fun c!49936 () Bool)

(assert (=> b!315527 (= c!49936 (or (= lt!154287 k!2441) (= (bvadd lt!154287 lt!154287) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315528 () Bool)

(assert (=> b!315528 (= e!196407 (bvsge (x!31430 lt!154286) #b01111111111111111111111111111110))))

(declare-fun b!315529 () Bool)

(assert (=> b!315529 (and (bvsge (index!13190 lt!154286) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154286) (size!7965 a!3293)))))

(declare-fun res!170885 () Bool)

(assert (=> b!315529 (= res!170885 (= (select (arr!7613 a!3293) (index!13190 lt!154286)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315529 (=> res!170885 e!196410)))

(declare-fun b!315530 () Bool)

(assert (=> b!315530 (= e!196408 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!68937 c!49937) b!315526))

(assert (= (and d!68937 (not c!49937)) b!315527))

(assert (= (and b!315527 c!49936) b!315524))

(assert (= (and b!315527 (not c!49936)) b!315530))

(assert (= (and d!68937 c!49938) b!315528))

(assert (= (and d!68937 (not c!49938)) b!315522))

(assert (= (and b!315522 res!170883) b!315525))

(assert (= (and b!315525 (not res!170884)) b!315529))

(assert (= (and b!315529 (not res!170885)) b!315523))

(assert (=> b!315530 m!324617))

(assert (=> b!315530 m!324617))

(declare-fun m!324765 () Bool)

(assert (=> b!315530 m!324765))

(declare-fun m!324767 () Bool)

(assert (=> b!315523 m!324767))

(assert (=> d!68937 m!324633))

(assert (=> d!68937 m!324629))

(assert (=> b!315525 m!324767))

(assert (=> b!315529 m!324767))

(assert (=> b!315316 d!68937))

(declare-fun b!315581 () Bool)

(declare-fun e!196445 () SeekEntryResult!2753)

(declare-fun lt!154323 () SeekEntryResult!2753)

(assert (=> b!315581 (= e!196445 (Found!2753 (index!13190 lt!154323)))))

(declare-fun b!315582 () Bool)

(declare-fun e!196443 () SeekEntryResult!2753)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16083 (_ BitVec 32)) SeekEntryResult!2753)

(assert (=> b!315582 (= e!196443 (seekKeyOrZeroReturnVacant!0 (x!31430 lt!154323) (index!13190 lt!154323) (index!13190 lt!154323) k!2441 a!3293 mask!3709))))

(declare-fun d!68939 () Bool)

(declare-fun lt!154322 () SeekEntryResult!2753)

(assert (=> d!68939 (and (or (is-Undefined!2753 lt!154322) (not (is-Found!2753 lt!154322)) (and (bvsge (index!13189 lt!154322) #b00000000000000000000000000000000) (bvslt (index!13189 lt!154322) (size!7965 a!3293)))) (or (is-Undefined!2753 lt!154322) (is-Found!2753 lt!154322) (not (is-MissingZero!2753 lt!154322)) (and (bvsge (index!13188 lt!154322) #b00000000000000000000000000000000) (bvslt (index!13188 lt!154322) (size!7965 a!3293)))) (or (is-Undefined!2753 lt!154322) (is-Found!2753 lt!154322) (is-MissingZero!2753 lt!154322) (not (is-MissingVacant!2753 lt!154322)) (and (bvsge (index!13191 lt!154322) #b00000000000000000000000000000000) (bvslt (index!13191 lt!154322) (size!7965 a!3293)))) (or (is-Undefined!2753 lt!154322) (ite (is-Found!2753 lt!154322) (= (select (arr!7613 a!3293) (index!13189 lt!154322)) k!2441) (ite (is-MissingZero!2753 lt!154322) (= (select (arr!7613 a!3293) (index!13188 lt!154322)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2753 lt!154322) (= (select (arr!7613 a!3293) (index!13191 lt!154322)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!196444 () SeekEntryResult!2753)

(assert (=> d!68939 (= lt!154322 e!196444)))

(declare-fun c!49958 () Bool)

(assert (=> d!68939 (= c!49958 (and (is-Intermediate!2753 lt!154323) (undefined!3565 lt!154323)))))

(assert (=> d!68939 (= lt!154323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68939 (validMask!0 mask!3709)))

(assert (=> d!68939 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!154322)))

(declare-fun b!315583 () Bool)

(assert (=> b!315583 (= e!196444 e!196445)))

(declare-fun lt!154324 () (_ BitVec 64))

(assert (=> b!315583 (= lt!154324 (select (arr!7613 a!3293) (index!13190 lt!154323)))))

(declare-fun c!49957 () Bool)

(assert (=> b!315583 (= c!49957 (= lt!154324 k!2441))))

(declare-fun b!315584 () Bool)

(declare-fun c!49956 () Bool)

(assert (=> b!315584 (= c!49956 (= lt!154324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315584 (= e!196445 e!196443)))

(declare-fun b!315585 () Bool)

(assert (=> b!315585 (= e!196443 (MissingZero!2753 (index!13190 lt!154323)))))

(declare-fun b!315586 () Bool)

(assert (=> b!315586 (= e!196444 Undefined!2753)))

(assert (= (and d!68939 c!49958) b!315586))

(assert (= (and d!68939 (not c!49958)) b!315583))

(assert (= (and b!315583 c!49957) b!315581))

(assert (= (and b!315583 (not c!49957)) b!315584))

(assert (= (and b!315584 c!49956) b!315585))

(assert (= (and b!315584 (not c!49956)) b!315582))

(declare-fun m!324795 () Bool)

(assert (=> b!315582 m!324795))

(declare-fun m!324799 () Bool)

(assert (=> d!68939 m!324799))

(declare-fun m!324801 () Bool)

(assert (=> d!68939 m!324801))

(assert (=> d!68939 m!324625))

(assert (=> d!68939 m!324627))

(declare-fun m!324807 () Bool)

(assert (=> d!68939 m!324807))

(assert (=> d!68939 m!324625))

(assert (=> d!68939 m!324629))

(declare-fun m!324811 () Bool)

(assert (=> b!315583 m!324811))

(assert (=> b!315317 d!68939))

(declare-fun b!315591 () Bool)

(declare-fun e!196449 () Bool)

(declare-fun e!196453 () Bool)

(assert (=> b!315591 (= e!196449 e!196453)))

(declare-fun res!170905 () Bool)

(declare-fun lt!154328 () SeekEntryResult!2753)

(assert (=> b!315591 (= res!170905 (and (is-Intermediate!2753 lt!154328) (not (undefined!3565 lt!154328)) (bvslt (x!31430 lt!154328) #b01111111111111111111111111111110) (bvsge (x!31430 lt!154328) #b00000000000000000000000000000000) (bvsge (x!31430 lt!154328) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!315591 (=> (not res!170905) (not e!196453))))

(declare-fun b!315592 () Bool)

(assert (=> b!315592 (and (bvsge (index!13190 lt!154328) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154328) (size!7965 a!3293)))))

(declare-fun e!196452 () Bool)

(assert (=> b!315592 (= e!196452 (= (select (arr!7613 a!3293) (index!13190 lt!154328)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68955 () Bool)

(assert (=> d!68955 e!196449))

(declare-fun c!49962 () Bool)

(assert (=> d!68955 (= c!49962 (and (is-Intermediate!2753 lt!154328) (undefined!3565 lt!154328)))))

(declare-fun e!196451 () SeekEntryResult!2753)

(assert (=> d!68955 (= lt!154328 e!196451)))

(declare-fun c!49961 () Bool)

(assert (=> d!68955 (= c!49961 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154329 () (_ BitVec 64))

(assert (=> d!68955 (= lt!154329 (select (arr!7613 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68955 (validMask!0 mask!3709)))

(assert (=> d!68955 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709) lt!154328)))

(declare-fun b!315593 () Bool)

(declare-fun e!196450 () SeekEntryResult!2753)

(assert (=> b!315593 (= e!196450 (Intermediate!2753 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315594 () Bool)

(assert (=> b!315594 (and (bvsge (index!13190 lt!154328) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154328) (size!7965 a!3293)))))

(declare-fun res!170906 () Bool)

(assert (=> b!315594 (= res!170906 (= (select (arr!7613 a!3293) (index!13190 lt!154328)) k!2441))))

(assert (=> b!315594 (=> res!170906 e!196452)))

(assert (=> b!315594 (= e!196453 e!196452)))

(declare-fun b!315595 () Bool)

(assert (=> b!315595 (= e!196451 (Intermediate!2753 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!315596 () Bool)

(assert (=> b!315596 (= e!196451 e!196450)))

(declare-fun c!49960 () Bool)

(assert (=> b!315596 (= c!49960 (or (= lt!154329 k!2441) (= (bvadd lt!154329 lt!154329) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315597 () Bool)

(assert (=> b!315597 (= e!196449 (bvsge (x!31430 lt!154328) #b01111111111111111111111111111110))))

(declare-fun b!315598 () Bool)

(assert (=> b!315598 (and (bvsge (index!13190 lt!154328) #b00000000000000000000000000000000) (bvslt (index!13190 lt!154328) (size!7965 a!3293)))))

(declare-fun res!170907 () Bool)

(assert (=> b!315598 (= res!170907 (= (select (arr!7613 a!3293) (index!13190 lt!154328)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!315598 (=> res!170907 e!196452)))

(declare-fun b!315599 () Bool)

(assert (=> b!315599 (= e!196450 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!68955 c!49961) b!315595))

(assert (= (and d!68955 (not c!49961)) b!315596))

(assert (= (and b!315596 c!49960) b!315593))

(assert (= (and b!315596 (not c!49960)) b!315599))

(assert (= (and d!68955 c!49962) b!315597))

(assert (= (and d!68955 (not c!49962)) b!315591))

(assert (= (and b!315591 res!170905) b!315594))

(assert (= (and b!315594 (not res!170906)) b!315598))

(assert (= (and b!315598 (not res!170907)) b!315592))

(assert (=> b!315599 m!324617))

(declare-fun m!324813 () Bool)

(assert (=> b!315599 m!324813))

(assert (=> b!315599 m!324813))

(declare-fun m!324815 () Bool)

(assert (=> b!315599 m!324815))

(declare-fun m!324817 () Bool)

(assert (=> b!315592 m!324817))

(assert (=> d!68955 m!324617))

(declare-fun m!324819 () Bool)

(assert (=> d!68955 m!324819))

(assert (=> d!68955 m!324629))

(assert (=> b!315594 m!324817))

(assert (=> b!315598 m!324817))

(assert (=> b!315318 d!68955))

(declare-fun d!68957 () Bool)

(declare-fun lt!154332 () (_ BitVec 32))

(assert (=> d!68957 (and (bvsge lt!154332 #b00000000000000000000000000000000) (bvslt lt!154332 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68957 (= lt!154332 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68957 (validMask!0 mask!3709)))

(assert (=> d!68957 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154332)))

(declare-fun bs!11029 () Bool)

(assert (= bs!11029 d!68957))

(declare-fun m!324821 () Bool)

(assert (=> bs!11029 m!324821))

(assert (=> bs!11029 m!324629))

(assert (=> b!315318 d!68957))

(push 1)

(assert (not bm!25990))

(assert (not b!315428))

(assert (not b!315512))

(assert (not d!68937))

(assert (not d!68957))

(assert (not d!68939))

(assert (not b!315582))

(assert (not b!315599))

(assert (not d!68955))

(assert (not d!68921))

(assert (not b!315407))

(assert (not b!315530))

(assert (not b!315430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

