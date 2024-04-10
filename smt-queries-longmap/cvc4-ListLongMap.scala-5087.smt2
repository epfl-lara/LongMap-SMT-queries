; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69036 () Bool)

(assert start!69036)

(declare-fun res!550003 () Bool)

(declare-fun e!446065 () Bool)

(assert (=> start!69036 (=> (not res!550003) (not e!446065))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69036 (= res!550003 (validMask!0 mask!3266))))

(assert (=> start!69036 e!446065))

(assert (=> start!69036 true))

(declare-datatypes ((array!43826 0))(
  ( (array!43827 (arr!20993 (Array (_ BitVec 32) (_ BitVec 64))) (size!21414 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43826)

(declare-fun array_inv!16789 (array!43826) Bool)

(assert (=> start!69036 (array_inv!16789 a!3170)))

(declare-fun b!805479 () Bool)

(declare-fun res!550005 () Bool)

(declare-fun e!446066 () Bool)

(assert (=> b!805479 (=> (not res!550005) (not e!446066))))

(declare-datatypes ((List!14956 0))(
  ( (Nil!14953) (Cons!14952 (h!16081 (_ BitVec 64)) (t!21271 List!14956)) )
))
(declare-fun arrayNoDuplicates!0 (array!43826 (_ BitVec 32) List!14956) Bool)

(assert (=> b!805479 (= res!550005 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14953))))

(declare-fun b!805480 () Bool)

(declare-fun res!549999 () Bool)

(assert (=> b!805480 (=> (not res!549999) (not e!446065))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805480 (= res!549999 (validKeyInArray!0 (select (arr!20993 a!3170) j!153)))))

(declare-fun b!805481 () Bool)

(declare-fun res!550004 () Bool)

(assert (=> b!805481 (=> (not res!550004) (not e!446066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43826 (_ BitVec 32)) Bool)

(assert (=> b!805481 (= res!550004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-datatypes ((SeekEntryResult!8584 0))(
  ( (MissingZero!8584 (index!36704 (_ BitVec 32))) (Found!8584 (index!36705 (_ BitVec 32))) (Intermediate!8584 (undefined!9396 Bool) (index!36706 (_ BitVec 32)) (x!67518 (_ BitVec 32))) (Undefined!8584) (MissingVacant!8584 (index!36707 (_ BitVec 32))) )
))
(declare-fun lt!360662 () SeekEntryResult!8584)

(declare-fun lt!360666 () SeekEntryResult!8584)

(declare-fun e!446063 () Bool)

(declare-fun lt!360667 () SeekEntryResult!8584)

(declare-fun b!805482 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805482 (= e!446063 (and (= lt!360662 lt!360666) (= lt!360666 (Found!8584 j!153)) (= (select (arr!20993 a!3170) index!1236) (select (arr!20993 a!3170) j!153)) (not (= lt!360667 (Found!8584 index!1236)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43826 (_ BitVec 32)) SeekEntryResult!8584)

(assert (=> b!805482 (= lt!360666 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20993 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43826 (_ BitVec 32)) SeekEntryResult!8584)

(assert (=> b!805482 (= lt!360662 (seekEntryOrOpen!0 (select (arr!20993 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805483 () Bool)

(declare-fun res!550000 () Bool)

(assert (=> b!805483 (=> (not res!550000) (not e!446065))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805483 (= res!550000 (and (= (size!21414 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21414 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21414 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805484 () Bool)

(declare-fun res!550002 () Bool)

(assert (=> b!805484 (=> (not res!550002) (not e!446066))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!805484 (= res!550002 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21414 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20993 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21414 a!3170)) (= (select (arr!20993 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805485 () Bool)

(assert (=> b!805485 (= e!446065 e!446066)))

(declare-fun res!549998 () Bool)

(assert (=> b!805485 (=> (not res!549998) (not e!446066))))

(declare-fun lt!360663 () SeekEntryResult!8584)

(assert (=> b!805485 (= res!549998 (or (= lt!360663 (MissingZero!8584 i!1163)) (= lt!360663 (MissingVacant!8584 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!805485 (= lt!360663 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805486 () Bool)

(assert (=> b!805486 (= e!446066 e!446063)))

(declare-fun res!550001 () Bool)

(assert (=> b!805486 (=> (not res!550001) (not e!446063))))

(declare-fun lt!360668 () SeekEntryResult!8584)

(assert (=> b!805486 (= res!550001 (= lt!360668 lt!360667))))

(declare-fun lt!360665 () (_ BitVec 64))

(declare-fun lt!360664 () array!43826)

(assert (=> b!805486 (= lt!360667 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360665 lt!360664 mask!3266))))

(assert (=> b!805486 (= lt!360668 (seekEntryOrOpen!0 lt!360665 lt!360664 mask!3266))))

(assert (=> b!805486 (= lt!360665 (select (store (arr!20993 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805486 (= lt!360664 (array!43827 (store (arr!20993 a!3170) i!1163 k!2044) (size!21414 a!3170)))))

(declare-fun b!805487 () Bool)

(declare-fun res!550006 () Bool)

(assert (=> b!805487 (=> (not res!550006) (not e!446065))))

(declare-fun arrayContainsKey!0 (array!43826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805487 (= res!550006 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805488 () Bool)

(declare-fun res!550007 () Bool)

(assert (=> b!805488 (=> (not res!550007) (not e!446065))))

(assert (=> b!805488 (= res!550007 (validKeyInArray!0 k!2044))))

(assert (= (and start!69036 res!550003) b!805483))

(assert (= (and b!805483 res!550000) b!805480))

(assert (= (and b!805480 res!549999) b!805488))

(assert (= (and b!805488 res!550007) b!805487))

(assert (= (and b!805487 res!550006) b!805485))

(assert (= (and b!805485 res!549998) b!805481))

(assert (= (and b!805481 res!550004) b!805479))

(assert (= (and b!805479 res!550005) b!805484))

(assert (= (and b!805484 res!550002) b!805486))

(assert (= (and b!805486 res!550001) b!805482))

(declare-fun m!747437 () Bool)

(assert (=> b!805486 m!747437))

(declare-fun m!747439 () Bool)

(assert (=> b!805486 m!747439))

(declare-fun m!747441 () Bool)

(assert (=> b!805486 m!747441))

(declare-fun m!747443 () Bool)

(assert (=> b!805486 m!747443))

(declare-fun m!747445 () Bool)

(assert (=> b!805487 m!747445))

(declare-fun m!747447 () Bool)

(assert (=> b!805485 m!747447))

(declare-fun m!747449 () Bool)

(assert (=> b!805479 m!747449))

(declare-fun m!747451 () Bool)

(assert (=> b!805482 m!747451))

(declare-fun m!747453 () Bool)

(assert (=> b!805482 m!747453))

(assert (=> b!805482 m!747453))

(declare-fun m!747455 () Bool)

(assert (=> b!805482 m!747455))

(assert (=> b!805482 m!747453))

(declare-fun m!747457 () Bool)

(assert (=> b!805482 m!747457))

(declare-fun m!747459 () Bool)

(assert (=> b!805481 m!747459))

(assert (=> b!805480 m!747453))

(assert (=> b!805480 m!747453))

(declare-fun m!747461 () Bool)

(assert (=> b!805480 m!747461))

(declare-fun m!747463 () Bool)

(assert (=> b!805488 m!747463))

(declare-fun m!747465 () Bool)

(assert (=> start!69036 m!747465))

(declare-fun m!747467 () Bool)

(assert (=> start!69036 m!747467))

(declare-fun m!747469 () Bool)

(assert (=> b!805484 m!747469))

(declare-fun m!747471 () Bool)

(assert (=> b!805484 m!747471))

(push 1)

(assert (not b!805480))

(assert (not b!805487))

(assert (not b!805482))

(assert (not b!805479))

(assert (not b!805485))

(assert (not start!69036))

(assert (not b!805481))

(assert (not b!805488))

(assert (not b!805486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103567 () Bool)

(assert (=> d!103567 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805488 d!103567))

(declare-fun b!805558 () Bool)

(declare-fun e!446112 () SeekEntryResult!8584)

(declare-fun e!446114 () SeekEntryResult!8584)

(assert (=> b!805558 (= e!446112 e!446114)))

(declare-fun lt!360686 () (_ BitVec 64))

(declare-fun c!88177 () Bool)

(assert (=> b!805558 (= c!88177 (= lt!360686 (select (arr!20993 a!3170) j!153)))))

(declare-fun b!805559 () Bool)

(assert (=> b!805559 (= e!446112 Undefined!8584)))

(declare-fun b!805560 () Bool)

(declare-fun e!446113 () SeekEntryResult!8584)

(assert (=> b!805560 (= e!446113 (MissingVacant!8584 vacantBefore!23))))

(declare-fun b!805561 () Bool)

(declare-fun c!88175 () Bool)

(assert (=> b!805561 (= c!88175 (= lt!360686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805561 (= e!446114 e!446113)))

(declare-fun b!805563 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!805563 (= e!446113 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!20993 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805562 () Bool)

(assert (=> b!805562 (= e!446114 (Found!8584 index!1236))))

(declare-fun d!103569 () Bool)

(declare-fun lt!360685 () SeekEntryResult!8584)

(assert (=> d!103569 (and (or (is-Undefined!8584 lt!360685) (not (is-Found!8584 lt!360685)) (and (bvsge (index!36705 lt!360685) #b00000000000000000000000000000000) (bvslt (index!36705 lt!360685) (size!21414 a!3170)))) (or (is-Undefined!8584 lt!360685) (is-Found!8584 lt!360685) (not (is-MissingVacant!8584 lt!360685)) (not (= (index!36707 lt!360685) vacantBefore!23)) (and (bvsge (index!36707 lt!360685) #b00000000000000000000000000000000) (bvslt (index!36707 lt!360685) (size!21414 a!3170)))) (or (is-Undefined!8584 lt!360685) (ite (is-Found!8584 lt!360685) (= (select (arr!20993 a!3170) (index!36705 lt!360685)) (select (arr!20993 a!3170) j!153)) (and (is-MissingVacant!8584 lt!360685) (= (index!36707 lt!360685) vacantBefore!23) (= (select (arr!20993 a!3170) (index!36707 lt!360685)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103569 (= lt!360685 e!446112)))

(declare-fun c!88176 () Bool)

(assert (=> d!103569 (= c!88176 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103569 (= lt!360686 (select (arr!20993 a!3170) index!1236))))

(assert (=> d!103569 (validMask!0 mask!3266)))

(assert (=> d!103569 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20993 a!3170) j!153) a!3170 mask!3266) lt!360685)))

(assert (= (and d!103569 c!88176) b!805559))

(assert (= (and d!103569 (not c!88176)) b!805558))

(assert (= (and b!805558 c!88177) b!805562))

(assert (= (and b!805558 (not c!88177)) b!805561))

(assert (= (and b!805561 c!88175) b!805560))

(assert (= (and b!805561 (not c!88175)) b!805563))

(declare-fun m!747495 () Bool)

(assert (=> b!805563 m!747495))

(assert (=> b!805563 m!747495))

(assert (=> b!805563 m!747453))

(declare-fun m!747497 () Bool)

(assert (=> b!805563 m!747497))

(declare-fun m!747499 () Bool)

(assert (=> d!103569 m!747499))

(declare-fun m!747501 () Bool)

(assert (=> d!103569 m!747501))

(assert (=> d!103569 m!747451))

(assert (=> d!103569 m!747465))

(assert (=> b!805482 d!103569))

(declare-fun b!805624 () Bool)

(declare-fun e!446147 () SeekEntryResult!8584)

(assert (=> b!805624 (= e!446147 Undefined!8584)))

(declare-fun b!805625 () Bool)

(declare-fun e!446148 () SeekEntryResult!8584)

(assert (=> b!805625 (= e!446147 e!446148)))

(declare-fun lt!360712 () (_ BitVec 64))

(declare-fun lt!360713 () SeekEntryResult!8584)

(assert (=> b!805625 (= lt!360712 (select (arr!20993 a!3170) (index!36706 lt!360713)))))

(declare-fun c!88209 () Bool)

(assert (=> b!805625 (= c!88209 (= lt!360712 (select (arr!20993 a!3170) j!153)))))

(declare-fun d!103573 () Bool)

(declare-fun lt!360711 () SeekEntryResult!8584)

(assert (=> d!103573 (and (or (is-Undefined!8584 lt!360711) (not (is-Found!8584 lt!360711)) (and (bvsge (index!36705 lt!360711) #b00000000000000000000000000000000) (bvslt (index!36705 lt!360711) (size!21414 a!3170)))) (or (is-Undefined!8584 lt!360711) (is-Found!8584 lt!360711) (not (is-MissingZero!8584 lt!360711)) (and (bvsge (index!36704 lt!360711) #b00000000000000000000000000000000) (bvslt (index!36704 lt!360711) (size!21414 a!3170)))) (or (is-Undefined!8584 lt!360711) (is-Found!8584 lt!360711) (is-MissingZero!8584 lt!360711) (not (is-MissingVacant!8584 lt!360711)) (and (bvsge (index!36707 lt!360711) #b00000000000000000000000000000000) (bvslt (index!36707 lt!360711) (size!21414 a!3170)))) (or (is-Undefined!8584 lt!360711) (ite (is-Found!8584 lt!360711) (= (select (arr!20993 a!3170) (index!36705 lt!360711)) (select (arr!20993 a!3170) j!153)) (ite (is-MissingZero!8584 lt!360711) (= (select (arr!20993 a!3170) (index!36704 lt!360711)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8584 lt!360711) (= (select (arr!20993 a!3170) (index!36707 lt!360711)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103573 (= lt!360711 e!446147)))

(declare-fun c!88207 () Bool)

(assert (=> d!103573 (= c!88207 (and (is-Intermediate!8584 lt!360713) (undefined!9396 lt!360713)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43826 (_ BitVec 32)) SeekEntryResult!8584)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103573 (= lt!360713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20993 a!3170) j!153) mask!3266) (select (arr!20993 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103573 (validMask!0 mask!3266)))

(assert (=> d!103573 (= (seekEntryOrOpen!0 (select (arr!20993 a!3170) j!153) a!3170 mask!3266) lt!360711)))

(declare-fun e!446146 () SeekEntryResult!8584)

(declare-fun b!805626 () Bool)

(assert (=> b!805626 (= e!446146 (seekKeyOrZeroReturnVacant!0 (x!67518 lt!360713) (index!36706 lt!360713) (index!36706 lt!360713) (select (arr!20993 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805627 () Bool)

(declare-fun c!88208 () Bool)

(assert (=> b!805627 (= c!88208 (= lt!360712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805627 (= e!446148 e!446146)))

(declare-fun b!805628 () Bool)

(assert (=> b!805628 (= e!446146 (MissingZero!8584 (index!36706 lt!360713)))))

(declare-fun b!805629 () Bool)

(assert (=> b!805629 (= e!446148 (Found!8584 (index!36706 lt!360713)))))

(assert (= (and d!103573 c!88207) b!805624))

(assert (= (and d!103573 (not c!88207)) b!805625))

(assert (= (and b!805625 c!88209) b!805629))

(assert (= (and b!805625 (not c!88209)) b!805627))

(assert (= (and b!805627 c!88208) b!805628))

(assert (= (and b!805627 (not c!88208)) b!805626))

(declare-fun m!747541 () Bool)

(assert (=> b!805625 m!747541))

(assert (=> d!103573 m!747453))

(declare-fun m!747543 () Bool)

(assert (=> d!103573 m!747543))

(assert (=> d!103573 m!747543))

(assert (=> d!103573 m!747453))

(declare-fun m!747545 () Bool)

(assert (=> d!103573 m!747545))

(assert (=> d!103573 m!747465))

(declare-fun m!747549 () Bool)

(assert (=> d!103573 m!747549))

(declare-fun m!747552 () Bool)

(assert (=> d!103573 m!747552))

(declare-fun m!747555 () Bool)

(assert (=> d!103573 m!747555))

(assert (=> b!805626 m!747453))

(declare-fun m!747563 () Bool)

(assert (=> b!805626 m!747563))

(assert (=> b!805482 d!103573))

(declare-fun d!103583 () Bool)

(declare-fun res!550039 () Bool)

(declare-fun e!446161 () Bool)

(assert (=> d!103583 (=> res!550039 e!446161)))

(assert (=> d!103583 (= res!550039 (= (select (arr!20993 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103583 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!446161)))

(declare-fun b!805646 () Bool)

(declare-fun e!446162 () Bool)

(assert (=> b!805646 (= e!446161 e!446162)))

(declare-fun res!550040 () Bool)

(assert (=> b!805646 (=> (not res!550040) (not e!446162))))

(assert (=> b!805646 (= res!550040 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21414 a!3170)))))

(declare-fun b!805647 () Bool)

(assert (=> b!805647 (= e!446162 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103583 (not res!550039)) b!805646))

(assert (= (and b!805646 res!550040) b!805647))

(declare-fun m!747577 () Bool)

(assert (=> d!103583 m!747577))

(declare-fun m!747579 () Bool)

(assert (=> b!805647 m!747579))

(assert (=> b!805487 d!103583))

(declare-fun b!805686 () Bool)

(declare-fun e!446188 () Bool)

(declare-fun call!35358 () Bool)

(assert (=> b!805686 (= e!446188 call!35358)))

(declare-fun b!805687 () Bool)

(declare-fun e!446189 () Bool)

(assert (=> b!805687 (= e!446189 call!35358)))

(declare-fun b!805688 () Bool)

(assert (=> b!805688 (= e!446189 e!446188)))

(declare-fun lt!360750 () (_ BitVec 64))

(assert (=> b!805688 (= lt!360750 (select (arr!20993 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27606 0))(
  ( (Unit!27607) )
))
(declare-fun lt!360749 () Unit!27606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43826 (_ BitVec 64) (_ BitVec 32)) Unit!27606)

(assert (=> b!805688 (= lt!360749 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!360750 #b00000000000000000000000000000000))))

(assert (=> b!805688 (arrayContainsKey!0 a!3170 lt!360750 #b00000000000000000000000000000000)))

(declare-fun lt!360751 () Unit!27606)

(assert (=> b!805688 (= lt!360751 lt!360749)))

(declare-fun res!550052 () Bool)

(assert (=> b!805688 (= res!550052 (= (seekEntryOrOpen!0 (select (arr!20993 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8584 #b00000000000000000000000000000000)))))

(assert (=> b!805688 (=> (not res!550052) (not e!446188))))

(declare-fun b!805689 () Bool)

(declare-fun e!446187 () Bool)

(assert (=> b!805689 (= e!446187 e!446189)))

(declare-fun c!88228 () Bool)

(assert (=> b!805689 (= c!88228 (validKeyInArray!0 (select (arr!20993 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35355 () Bool)

(assert (=> bm!35355 (= call!35358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun d!103591 () Bool)

(declare-fun res!550051 () Bool)

(assert (=> d!103591 (=> res!550051 e!446187)))

(assert (=> d!103591 (= res!550051 (bvsge #b00000000000000000000000000000000 (size!21414 a!3170)))))

(assert (=> d!103591 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!446187)))

(assert (= (and d!103591 (not res!550051)) b!805689))

(assert (= (and b!805689 c!88228) b!805688))

(assert (= (and b!805689 (not c!88228)) b!805687))

(assert (= (and b!805688 res!550052) b!805686))

(assert (= (or b!805686 b!805687) bm!35355))

(assert (=> b!805688 m!747577))

(declare-fun m!747627 () Bool)

(assert (=> b!805688 m!747627))

(declare-fun m!747629 () Bool)

(assert (=> b!805688 m!747629))

(assert (=> b!805688 m!747577))

(declare-fun m!747631 () Bool)

(assert (=> b!805688 m!747631))

(assert (=> b!805689 m!747577))

(assert (=> b!805689 m!747577))

(declare-fun m!747633 () Bool)

(assert (=> b!805689 m!747633))

(declare-fun m!747635 () Bool)

(assert (=> bm!35355 m!747635))

(assert (=> b!805481 d!103591))

(declare-fun b!805690 () Bool)

(declare-fun e!446190 () SeekEntryResult!8584)

(declare-fun e!446192 () SeekEntryResult!8584)

(assert (=> b!805690 (= e!446190 e!446192)))

(declare-fun c!88231 () Bool)

(declare-fun lt!360753 () (_ BitVec 64))

(assert (=> b!805690 (= c!88231 (= lt!360753 lt!360665))))

(declare-fun b!805691 () Bool)

(assert (=> b!805691 (= e!446190 Undefined!8584)))

(declare-fun b!805692 () Bool)

(declare-fun e!446191 () SeekEntryResult!8584)

(assert (=> b!805692 (= e!446191 (MissingVacant!8584 vacantAfter!23))))

(declare-fun b!805693 () Bool)

(declare-fun c!88229 () Bool)

(assert (=> b!805693 (= c!88229 (= lt!360753 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805693 (= e!446192 e!446191)))

(declare-fun b!805695 () Bool)

(assert (=> b!805695 (= e!446191 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!360665 lt!360664 mask!3266))))

(declare-fun b!805694 () Bool)

(assert (=> b!805694 (= e!446192 (Found!8584 index!1236))))

(declare-fun d!103601 () Bool)

(declare-fun lt!360752 () SeekEntryResult!8584)

(assert (=> d!103601 (and (or (is-Undefined!8584 lt!360752) (not (is-Found!8584 lt!360752)) (and (bvsge (index!36705 lt!360752) #b00000000000000000000000000000000) (bvslt (index!36705 lt!360752) (size!21414 lt!360664)))) (or (is-Undefined!8584 lt!360752) (is-Found!8584 lt!360752) (not (is-MissingVacant!8584 lt!360752)) (not (= (index!36707 lt!360752) vacantAfter!23)) (and (bvsge (index!36707 lt!360752) #b00000000000000000000000000000000) (bvslt (index!36707 lt!360752) (size!21414 lt!360664)))) (or (is-Undefined!8584 lt!360752) (ite (is-Found!8584 lt!360752) (= (select (arr!20993 lt!360664) (index!36705 lt!360752)) lt!360665) (and (is-MissingVacant!8584 lt!360752) (= (index!36707 lt!360752) vacantAfter!23) (= (select (arr!20993 lt!360664) (index!36707 lt!360752)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103601 (= lt!360752 e!446190)))

(declare-fun c!88230 () Bool)

(assert (=> d!103601 (= c!88230 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103601 (= lt!360753 (select (arr!20993 lt!360664) index!1236))))

(assert (=> d!103601 (validMask!0 mask!3266)))

(assert (=> d!103601 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360665 lt!360664 mask!3266) lt!360752)))

(assert (= (and d!103601 c!88230) b!805691))

(assert (= (and d!103601 (not c!88230)) b!805690))

(assert (= (and b!805690 c!88231) b!805694))

(assert (= (and b!805690 (not c!88231)) b!805693))

(assert (= (and b!805693 c!88229) b!805692))

(assert (= (and b!805693 (not c!88229)) b!805695))

(assert (=> b!805695 m!747495))

(assert (=> b!805695 m!747495))

(declare-fun m!747637 () Bool)

(assert (=> b!805695 m!747637))

(declare-fun m!747639 () Bool)

(assert (=> d!103601 m!747639))

(declare-fun m!747641 () Bool)

(assert (=> d!103601 m!747641))

(declare-fun m!747643 () Bool)

(assert (=> d!103601 m!747643))

(assert (=> d!103601 m!747465))

(assert (=> b!805486 d!103601))

(declare-fun b!805706 () Bool)

(declare-fun e!446202 () SeekEntryResult!8584)

(assert (=> b!805706 (= e!446202 Undefined!8584)))

(declare-fun b!805707 () Bool)

(declare-fun e!446203 () SeekEntryResult!8584)

(assert (=> b!805707 (= e!446202 e!446203)))

(declare-fun lt!360755 () (_ BitVec 64))

(declare-fun lt!360756 () SeekEntryResult!8584)

(assert (=> b!805707 (= lt!360755 (select (arr!20993 lt!360664) (index!36706 lt!360756)))))

(declare-fun c!88236 () Bool)

(assert (=> b!805707 (= c!88236 (= lt!360755 lt!360665))))

(declare-fun d!103603 () Bool)

(declare-fun lt!360754 () SeekEntryResult!8584)

(assert (=> d!103603 (and (or (is-Undefined!8584 lt!360754) (not (is-Found!8584 lt!360754)) (and (bvsge (index!36705 lt!360754) #b00000000000000000000000000000000) (bvslt (index!36705 lt!360754) (size!21414 lt!360664)))) (or (is-Undefined!8584 lt!360754) (is-Found!8584 lt!360754) (not (is-MissingZero!8584 lt!360754)) (and (bvsge (index!36704 lt!360754) #b00000000000000000000000000000000) (bvslt (index!36704 lt!360754) (size!21414 lt!360664)))) (or (is-Undefined!8584 lt!360754) (is-Found!8584 lt!360754) (is-MissingZero!8584 lt!360754) (not (is-MissingVacant!8584 lt!360754)) (and (bvsge (index!36707 lt!360754) #b00000000000000000000000000000000) (bvslt (index!36707 lt!360754) (size!21414 lt!360664)))) (or (is-Undefined!8584 lt!360754) (ite (is-Found!8584 lt!360754) (= (select (arr!20993 lt!360664) (index!36705 lt!360754)) lt!360665) (ite (is-MissingZero!8584 lt!360754) (= (select (arr!20993 lt!360664) (index!36704 lt!360754)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8584 lt!360754) (= (select (arr!20993 lt!360664) (index!36707 lt!360754)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103603 (= lt!360754 e!446202)))

(declare-fun c!88234 () Bool)

(assert (=> d!103603 (= c!88234 (and (is-Intermediate!8584 lt!360756) (undefined!9396 lt!360756)))))

(assert (=> d!103603 (= lt!360756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!360665 mask!3266) lt!360665 lt!360664 mask!3266))))

(assert (=> d!103603 (validMask!0 mask!3266)))

(assert (=> d!103603 (= (seekEntryOrOpen!0 lt!360665 lt!360664 mask!3266) lt!360754)))

(declare-fun b!805708 () Bool)

(declare-fun e!446201 () SeekEntryResult!8584)

(assert (=> b!805708 (= e!446201 (seekKeyOrZeroReturnVacant!0 (x!67518 lt!360756) (index!36706 lt!360756) (index!36706 lt!360756) lt!360665 lt!360664 mask!3266))))

(declare-fun b!805709 () Bool)

(declare-fun c!88235 () Bool)

(assert (=> b!805709 (= c!88235 (= lt!360755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!805709 (= e!446203 e!446201)))

(declare-fun b!805710 () Bool)

(assert (=> b!805710 (= e!446201 (MissingZero!8584 (index!36706 lt!360756)))))

(declare-fun b!805711 () Bool)

(assert (=> b!805711 (= e!446203 (Found!8584 (index!36706 lt!360756)))))

(assert (= (and d!103603 c!88234) b!805706))

(assert (= (and d!103603 (not c!88234)) b!805707))

(assert (= (and b!805707 c!88236) b!805711))

(assert (= (and b!805707 (not c!88236)) b!805709))

(assert (= (and b!805709 c!88235) b!805710))

(assert (= (and b!805709 (not c!88235)) b!805708))

(declare-fun m!747645 () Bool)

(assert (=> b!805707 m!747645))

(declare-fun m!747647 () Bool)

(assert (=> d!103603 m!747647))

(assert (=> d!103603 m!747647))

(declare-fun m!747649 () Bool)

(assert (=> d!103603 m!747649))

(assert (=> d!103603 m!747465))

(declare-fun m!747651 () Bool)

(assert (=> d!103603 m!747651))

(declare-fun m!747653 () Bool)

(assert (=> d!103603 m!747653))

(declare-fun m!747655 () Bool)

(assert (=> d!103603 m!747655))

(declare-fun m!747657 () Bool)

(assert (=> b!805708 m!747657))

(assert (=> b!805486 d!103603))

(declare-fun d!103605 () Bool)

(assert (=> d!103605 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69036 d!103605))

(declare-fun d!103613 () Bool)

(assert (=> d!103613 (= (array_inv!16789 a!3170) (bvsge (size!21414 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69036 d!103613))

(declare-fun d!103615 () Bool)

(assert (=> d!103615 (= (validKeyInArray!0 (select (arr!20993 a!3170) j!153)) (and (not (= (select (arr!20993 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20993 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!805480 d!103615))

(declare-fun b!805729 () Bool)

(declare-fun e!446215 () SeekEntryResult!8584)

(assert (=> b!805729 (= e!446215 Undefined!8584)))

(declare-fun b!805730 () Bool)

(declare-fun e!446216 () SeekEntryResult!8584)

(assert (=> b!805730 (= e!446215 e!446216)))

(declare-fun lt!360763 () (_ BitVec 64))

(declare-fun lt!360764 () SeekEntryResult!8584)

(assert (=> b!805730 (= lt!360763 (select (arr!20993 a!3170) (index!36706 lt!360764)))))

(declare-fun c!88246 () Bool)

(assert (=> b!805730 (= c!88246 (= lt!360763 k!2044))))

(declare-fun d!103617 () Bool)

(declare-fun lt!360762 () SeekEntryResult!8584)

(assert (=> d!103617 (and (or (is-Undefined!8584 lt!360762) (not (is-Found!8584 lt!360762)) (and (bvsge (index!36705 lt!360762) #b00000000000000000000000000000000) (bvslt (index!36705 lt!360762) (size!21414 a!3170)))) (or (is-Undefined!8584 lt!360762) (is-Found!8584 lt!360762) (not (is-MissingZero!8584 lt!360762)) (and (bvsge (index!36704 lt!360762) #b00000000000000000000000000000000) (bvslt (index!36704 lt!360762) (size!21414 a!3170)))) (or (is-Undefined!8584 lt!360762) (is-Found!8584 lt!360762) (is-MissingZero!8584 lt!360762) (not (is-MissingVacant!8584 lt!360762)) (and (bvsge (index!36707 lt!360762) #b00000000000000000000000000000000) (bvslt (index!36707 lt!360762) (size!21414 a!3170)))) (or (is-Undefined!8584 lt!360762) (ite (is-Found!8584 lt!360762) (= (select (arr!20993 a!3170) (index!36705 lt!360762)) k!2044) (ite (is-MissingZero!8584 lt!360762) (= (select (arr!20993 a!3170) (index!36704 lt!360762)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8584 lt!360762) (= (select (arr!20993 a!3170) (index!36707 lt!360762)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

