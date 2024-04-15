; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69552 () Bool)

(assert start!69552)

(declare-fun b!810646 () Bool)

(declare-fun res!554067 () Bool)

(declare-fun e!448666 () Bool)

(assert (=> b!810646 (=> (not res!554067) (not e!448666))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44065 0))(
  ( (array!44066 (arr!21104 (Array (_ BitVec 32) (_ BitVec 64))) (size!21525 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44065)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!810646 (= res!554067 (and (= (size!21525 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21525 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21525 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810647 () Bool)

(declare-fun res!554066 () Bool)

(declare-fun e!448661 () Bool)

(assert (=> b!810647 (=> (not res!554066) (not e!448661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44065 (_ BitVec 32)) Bool)

(assert (=> b!810647 (= res!554066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810648 () Bool)

(declare-fun e!448665 () Bool)

(declare-fun e!448664 () Bool)

(assert (=> b!810648 (= e!448665 e!448664)))

(declare-fun res!554071 () Bool)

(assert (=> b!810648 (=> (not res!554071) (not e!448664))))

(declare-datatypes ((SeekEntryResult!8692 0))(
  ( (MissingZero!8692 (index!37136 (_ BitVec 32))) (Found!8692 (index!37137 (_ BitVec 32))) (Intermediate!8692 (undefined!9504 Bool) (index!37138 (_ BitVec 32)) (x!67955 (_ BitVec 32))) (Undefined!8692) (MissingVacant!8692 (index!37139 (_ BitVec 32))) )
))
(declare-fun lt!363276 () SeekEntryResult!8692)

(declare-fun lt!363279 () SeekEntryResult!8692)

(assert (=> b!810648 (= res!554071 (= lt!363276 lt!363279))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44065 (_ BitVec 32)) SeekEntryResult!8692)

(assert (=> b!810648 (= lt!363279 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44065 (_ BitVec 32)) SeekEntryResult!8692)

(assert (=> b!810648 (= lt!363276 (seekEntryOrOpen!0 (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!554062 () Bool)

(assert (=> start!69552 (=> (not res!554062) (not e!448666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69552 (= res!554062 (validMask!0 mask!3266))))

(assert (=> start!69552 e!448666))

(assert (=> start!69552 true))

(declare-fun array_inv!16987 (array!44065) Bool)

(assert (=> start!69552 (array_inv!16987 a!3170)))

(declare-fun b!810645 () Bool)

(assert (=> b!810645 (= e!448666 e!448661)))

(declare-fun res!554070 () Bool)

(assert (=> b!810645 (=> (not res!554070) (not e!448661))))

(declare-fun lt!363284 () SeekEntryResult!8692)

(assert (=> b!810645 (= res!554070 (or (= lt!363284 (MissingZero!8692 i!1163)) (= lt!363284 (MissingVacant!8692 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!810645 (= lt!363284 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810649 () Bool)

(declare-fun e!448663 () Bool)

(declare-fun lt!363275 () SeekEntryResult!8692)

(declare-fun lt!363278 () SeekEntryResult!8692)

(assert (=> b!810649 (= e!448663 (not (= lt!363275 lt!363278)))))

(declare-fun lt!363282 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!363283 () array!44065)

(declare-fun lt!363281 () (_ BitVec 64))

(assert (=> b!810649 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363282 vacantAfter!23 lt!363281 lt!363283 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363282 vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27612 0))(
  ( (Unit!27613) )
))
(declare-fun lt!363280 () Unit!27612)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27612)

(assert (=> b!810649 (= lt!363280 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363282 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810649 (= lt!363282 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810650 () Bool)

(assert (=> b!810650 (= e!448664 e!448663)))

(declare-fun res!554072 () Bool)

(assert (=> b!810650 (=> (not res!554072) (not e!448663))))

(assert (=> b!810650 (= res!554072 (and (= lt!363279 lt!363278) (not (= (select (arr!21104 a!3170) index!1236) (select (arr!21104 a!3170) j!153)))))))

(assert (=> b!810650 (= lt!363278 (Found!8692 j!153))))

(declare-fun b!810651 () Bool)

(assert (=> b!810651 (= e!448661 e!448665)))

(declare-fun res!554068 () Bool)

(assert (=> b!810651 (=> (not res!554068) (not e!448665))))

(declare-fun lt!363277 () SeekEntryResult!8692)

(assert (=> b!810651 (= res!554068 (= lt!363277 lt!363275))))

(assert (=> b!810651 (= lt!363275 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363281 lt!363283 mask!3266))))

(assert (=> b!810651 (= lt!363277 (seekEntryOrOpen!0 lt!363281 lt!363283 mask!3266))))

(assert (=> b!810651 (= lt!363281 (select (store (arr!21104 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810651 (= lt!363283 (array!44066 (store (arr!21104 a!3170) i!1163 k0!2044) (size!21525 a!3170)))))

(declare-fun b!810652 () Bool)

(declare-fun res!554065 () Bool)

(assert (=> b!810652 (=> (not res!554065) (not e!448666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810652 (= res!554065 (validKeyInArray!0 k0!2044))))

(declare-fun b!810653 () Bool)

(declare-fun res!554073 () Bool)

(assert (=> b!810653 (=> (not res!554073) (not e!448661))))

(declare-datatypes ((List!15106 0))(
  ( (Nil!15103) (Cons!15102 (h!16231 (_ BitVec 64)) (t!21412 List!15106)) )
))
(declare-fun arrayNoDuplicates!0 (array!44065 (_ BitVec 32) List!15106) Bool)

(assert (=> b!810653 (= res!554073 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15103))))

(declare-fun b!810654 () Bool)

(declare-fun res!554063 () Bool)

(assert (=> b!810654 (=> (not res!554063) (not e!448666))))

(assert (=> b!810654 (= res!554063 (validKeyInArray!0 (select (arr!21104 a!3170) j!153)))))

(declare-fun b!810655 () Bool)

(declare-fun res!554064 () Bool)

(assert (=> b!810655 (=> (not res!554064) (not e!448666))))

(declare-fun arrayContainsKey!0 (array!44065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810655 (= res!554064 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810656 () Bool)

(declare-fun res!554069 () Bool)

(assert (=> b!810656 (=> (not res!554069) (not e!448661))))

(assert (=> b!810656 (= res!554069 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21525 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21104 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21525 a!3170)) (= (select (arr!21104 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69552 res!554062) b!810646))

(assert (= (and b!810646 res!554067) b!810654))

(assert (= (and b!810654 res!554063) b!810652))

(assert (= (and b!810652 res!554065) b!810655))

(assert (= (and b!810655 res!554064) b!810645))

(assert (= (and b!810645 res!554070) b!810647))

(assert (= (and b!810647 res!554066) b!810653))

(assert (= (and b!810653 res!554073) b!810656))

(assert (= (and b!810656 res!554069) b!810651))

(assert (= (and b!810651 res!554068) b!810648))

(assert (= (and b!810648 res!554071) b!810650))

(assert (= (and b!810650 res!554072) b!810649))

(declare-fun m!752443 () Bool)

(assert (=> b!810650 m!752443))

(declare-fun m!752445 () Bool)

(assert (=> b!810650 m!752445))

(declare-fun m!752447 () Bool)

(assert (=> b!810655 m!752447))

(assert (=> b!810649 m!752445))

(declare-fun m!752449 () Bool)

(assert (=> b!810649 m!752449))

(declare-fun m!752451 () Bool)

(assert (=> b!810649 m!752451))

(assert (=> b!810649 m!752445))

(declare-fun m!752453 () Bool)

(assert (=> b!810649 m!752453))

(declare-fun m!752455 () Bool)

(assert (=> b!810649 m!752455))

(declare-fun m!752457 () Bool)

(assert (=> b!810647 m!752457))

(declare-fun m!752459 () Bool)

(assert (=> b!810652 m!752459))

(declare-fun m!752461 () Bool)

(assert (=> b!810656 m!752461))

(declare-fun m!752463 () Bool)

(assert (=> b!810656 m!752463))

(assert (=> b!810648 m!752445))

(assert (=> b!810648 m!752445))

(declare-fun m!752465 () Bool)

(assert (=> b!810648 m!752465))

(assert (=> b!810648 m!752445))

(declare-fun m!752467 () Bool)

(assert (=> b!810648 m!752467))

(declare-fun m!752469 () Bool)

(assert (=> b!810653 m!752469))

(assert (=> b!810654 m!752445))

(assert (=> b!810654 m!752445))

(declare-fun m!752471 () Bool)

(assert (=> b!810654 m!752471))

(declare-fun m!752473 () Bool)

(assert (=> b!810651 m!752473))

(declare-fun m!752475 () Bool)

(assert (=> b!810651 m!752475))

(declare-fun m!752477 () Bool)

(assert (=> b!810651 m!752477))

(declare-fun m!752479 () Bool)

(assert (=> b!810651 m!752479))

(declare-fun m!752481 () Bool)

(assert (=> start!69552 m!752481))

(declare-fun m!752483 () Bool)

(assert (=> start!69552 m!752483))

(declare-fun m!752485 () Bool)

(assert (=> b!810645 m!752485))

(check-sat (not b!810653) (not b!810655) (not b!810647) (not b!810652) (not start!69552) (not b!810654) (not b!810651) (not b!810648) (not b!810649) (not b!810645))
(check-sat)
(get-model)

(declare-fun b!810741 () Bool)

(declare-fun e!448710 () SeekEntryResult!8692)

(assert (=> b!810741 (= e!448710 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810742 () Bool)

(declare-fun e!448709 () SeekEntryResult!8692)

(assert (=> b!810742 (= e!448709 Undefined!8692)))

(declare-fun b!810743 () Bool)

(assert (=> b!810743 (= e!448710 (MissingVacant!8692 vacantBefore!23))))

(declare-fun d!103907 () Bool)

(declare-fun lt!363350 () SeekEntryResult!8692)

(get-info :version)

(assert (=> d!103907 (and (or ((_ is Undefined!8692) lt!363350) (not ((_ is Found!8692) lt!363350)) (and (bvsge (index!37137 lt!363350) #b00000000000000000000000000000000) (bvslt (index!37137 lt!363350) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363350) ((_ is Found!8692) lt!363350) (not ((_ is MissingVacant!8692) lt!363350)) (not (= (index!37139 lt!363350) vacantBefore!23)) (and (bvsge (index!37139 lt!363350) #b00000000000000000000000000000000) (bvslt (index!37139 lt!363350) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363350) (ite ((_ is Found!8692) lt!363350) (= (select (arr!21104 a!3170) (index!37137 lt!363350)) (select (arr!21104 a!3170) j!153)) (and ((_ is MissingVacant!8692) lt!363350) (= (index!37139 lt!363350) vacantBefore!23) (= (select (arr!21104 a!3170) (index!37139 lt!363350)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103907 (= lt!363350 e!448709)))

(declare-fun c!88708 () Bool)

(assert (=> d!103907 (= c!88708 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!363349 () (_ BitVec 64))

(assert (=> d!103907 (= lt!363349 (select (arr!21104 a!3170) index!1236))))

(assert (=> d!103907 (validMask!0 mask!3266)))

(assert (=> d!103907 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266) lt!363350)))

(declare-fun b!810744 () Bool)

(declare-fun e!448711 () SeekEntryResult!8692)

(assert (=> b!810744 (= e!448709 e!448711)))

(declare-fun c!88709 () Bool)

(assert (=> b!810744 (= c!88709 (= lt!363349 (select (arr!21104 a!3170) j!153)))))

(declare-fun b!810745 () Bool)

(assert (=> b!810745 (= e!448711 (Found!8692 index!1236))))

(declare-fun b!810746 () Bool)

(declare-fun c!88710 () Bool)

(assert (=> b!810746 (= c!88710 (= lt!363349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810746 (= e!448711 e!448710)))

(assert (= (and d!103907 c!88708) b!810742))

(assert (= (and d!103907 (not c!88708)) b!810744))

(assert (= (and b!810744 c!88709) b!810745))

(assert (= (and b!810744 (not c!88709)) b!810746))

(assert (= (and b!810746 c!88710) b!810743))

(assert (= (and b!810746 (not c!88710)) b!810741))

(assert (=> b!810741 m!752453))

(assert (=> b!810741 m!752453))

(assert (=> b!810741 m!752445))

(declare-fun m!752575 () Bool)

(assert (=> b!810741 m!752575))

(declare-fun m!752577 () Bool)

(assert (=> d!103907 m!752577))

(declare-fun m!752579 () Bool)

(assert (=> d!103907 m!752579))

(assert (=> d!103907 m!752443))

(assert (=> d!103907 m!752481))

(assert (=> b!810648 d!103907))

(declare-fun b!810777 () Bool)

(declare-fun c!88728 () Bool)

(declare-fun lt!363365 () (_ BitVec 64))

(assert (=> b!810777 (= c!88728 (= lt!363365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448728 () SeekEntryResult!8692)

(declare-fun e!448727 () SeekEntryResult!8692)

(assert (=> b!810777 (= e!448728 e!448727)))

(declare-fun lt!363364 () SeekEntryResult!8692)

(declare-fun b!810778 () Bool)

(assert (=> b!810778 (= e!448727 (seekKeyOrZeroReturnVacant!0 (x!67955 lt!363364) (index!37138 lt!363364) (index!37138 lt!363364) (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810779 () Bool)

(declare-fun e!448729 () SeekEntryResult!8692)

(assert (=> b!810779 (= e!448729 Undefined!8692)))

(declare-fun b!810781 () Bool)

(assert (=> b!810781 (= e!448729 e!448728)))

(assert (=> b!810781 (= lt!363365 (select (arr!21104 a!3170) (index!37138 lt!363364)))))

(declare-fun c!88727 () Bool)

(assert (=> b!810781 (= c!88727 (= lt!363365 (select (arr!21104 a!3170) j!153)))))

(declare-fun b!810782 () Bool)

(assert (=> b!810782 (= e!448728 (Found!8692 (index!37138 lt!363364)))))

(declare-fun d!103909 () Bool)

(declare-fun lt!363363 () SeekEntryResult!8692)

(assert (=> d!103909 (and (or ((_ is Undefined!8692) lt!363363) (not ((_ is Found!8692) lt!363363)) (and (bvsge (index!37137 lt!363363) #b00000000000000000000000000000000) (bvslt (index!37137 lt!363363) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363363) ((_ is Found!8692) lt!363363) (not ((_ is MissingZero!8692) lt!363363)) (and (bvsge (index!37136 lt!363363) #b00000000000000000000000000000000) (bvslt (index!37136 lt!363363) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363363) ((_ is Found!8692) lt!363363) ((_ is MissingZero!8692) lt!363363) (not ((_ is MissingVacant!8692) lt!363363)) (and (bvsge (index!37139 lt!363363) #b00000000000000000000000000000000) (bvslt (index!37139 lt!363363) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363363) (ite ((_ is Found!8692) lt!363363) (= (select (arr!21104 a!3170) (index!37137 lt!363363)) (select (arr!21104 a!3170) j!153)) (ite ((_ is MissingZero!8692) lt!363363) (= (select (arr!21104 a!3170) (index!37136 lt!363363)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8692) lt!363363) (= (select (arr!21104 a!3170) (index!37139 lt!363363)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103909 (= lt!363363 e!448729)))

(declare-fun c!88726 () Bool)

(assert (=> d!103909 (= c!88726 (and ((_ is Intermediate!8692) lt!363364) (undefined!9504 lt!363364)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44065 (_ BitVec 32)) SeekEntryResult!8692)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103909 (= lt!363364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21104 a!3170) j!153) mask!3266) (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103909 (validMask!0 mask!3266)))

(assert (=> d!103909 (= (seekEntryOrOpen!0 (select (arr!21104 a!3170) j!153) a!3170 mask!3266) lt!363363)))

(declare-fun b!810780 () Bool)

(assert (=> b!810780 (= e!448727 (MissingZero!8692 (index!37138 lt!363364)))))

(assert (= (and d!103909 c!88726) b!810779))

(assert (= (and d!103909 (not c!88726)) b!810781))

(assert (= (and b!810781 c!88727) b!810782))

(assert (= (and b!810781 (not c!88727)) b!810777))

(assert (= (and b!810777 c!88728) b!810780))

(assert (= (and b!810777 (not c!88728)) b!810778))

(assert (=> b!810778 m!752445))

(declare-fun m!752587 () Bool)

(assert (=> b!810778 m!752587))

(declare-fun m!752589 () Bool)

(assert (=> b!810781 m!752589))

(declare-fun m!752591 () Bool)

(assert (=> d!103909 m!752591))

(assert (=> d!103909 m!752481))

(assert (=> d!103909 m!752445))

(declare-fun m!752593 () Bool)

(assert (=> d!103909 m!752593))

(declare-fun m!752595 () Bool)

(assert (=> d!103909 m!752595))

(assert (=> d!103909 m!752593))

(assert (=> d!103909 m!752445))

(declare-fun m!752597 () Bool)

(assert (=> d!103909 m!752597))

(declare-fun m!752599 () Bool)

(assert (=> d!103909 m!752599))

(assert (=> b!810648 d!103909))

(declare-fun d!103915 () Bool)

(assert (=> d!103915 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69552 d!103915))

(declare-fun d!103921 () Bool)

(assert (=> d!103921 (= (array_inv!16987 a!3170) (bvsge (size!21525 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69552 d!103921))

(declare-fun b!810841 () Bool)

(declare-fun e!448768 () Bool)

(declare-fun call!35431 () Bool)

(assert (=> b!810841 (= e!448768 call!35431)))

(declare-fun d!103923 () Bool)

(declare-fun res!554158 () Bool)

(declare-fun e!448767 () Bool)

(assert (=> d!103923 (=> res!554158 e!448767)))

(assert (=> d!103923 (= res!554158 (bvsge #b00000000000000000000000000000000 (size!21525 a!3170)))))

(assert (=> d!103923 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15103) e!448767)))

(declare-fun b!810842 () Bool)

(declare-fun e!448766 () Bool)

(declare-fun contains!4114 (List!15106 (_ BitVec 64)) Bool)

(assert (=> b!810842 (= e!448766 (contains!4114 Nil!15103 (select (arr!21104 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810843 () Bool)

(declare-fun e!448765 () Bool)

(assert (=> b!810843 (= e!448767 e!448765)))

(declare-fun res!554160 () Bool)

(assert (=> b!810843 (=> (not res!554160) (not e!448765))))

(assert (=> b!810843 (= res!554160 (not e!448766))))

(declare-fun res!554159 () Bool)

(assert (=> b!810843 (=> (not res!554159) (not e!448766))))

(assert (=> b!810843 (= res!554159 (validKeyInArray!0 (select (arr!21104 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810844 () Bool)

(assert (=> b!810844 (= e!448768 call!35431)))

(declare-fun b!810845 () Bool)

(assert (=> b!810845 (= e!448765 e!448768)))

(declare-fun c!88752 () Bool)

(assert (=> b!810845 (= c!88752 (validKeyInArray!0 (select (arr!21104 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35428 () Bool)

(assert (=> bm!35428 (= call!35431 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88752 (Cons!15102 (select (arr!21104 a!3170) #b00000000000000000000000000000000) Nil!15103) Nil!15103)))))

(assert (= (and d!103923 (not res!554158)) b!810843))

(assert (= (and b!810843 res!554159) b!810842))

(assert (= (and b!810843 res!554160) b!810845))

(assert (= (and b!810845 c!88752) b!810844))

(assert (= (and b!810845 (not c!88752)) b!810841))

(assert (= (or b!810844 b!810841) bm!35428))

(declare-fun m!752657 () Bool)

(assert (=> b!810842 m!752657))

(assert (=> b!810842 m!752657))

(declare-fun m!752661 () Bool)

(assert (=> b!810842 m!752661))

(assert (=> b!810843 m!752657))

(assert (=> b!810843 m!752657))

(declare-fun m!752663 () Bool)

(assert (=> b!810843 m!752663))

(assert (=> b!810845 m!752657))

(assert (=> b!810845 m!752657))

(assert (=> b!810845 m!752663))

(assert (=> bm!35428 m!752657))

(declare-fun m!752665 () Bool)

(assert (=> bm!35428 m!752665))

(assert (=> b!810653 d!103923))

(declare-fun d!103935 () Bool)

(declare-fun res!554165 () Bool)

(declare-fun e!448779 () Bool)

(assert (=> d!103935 (=> res!554165 e!448779)))

(assert (=> d!103935 (= res!554165 (= (select (arr!21104 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103935 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448779)))

(declare-fun b!810862 () Bool)

(declare-fun e!448780 () Bool)

(assert (=> b!810862 (= e!448779 e!448780)))

(declare-fun res!554166 () Bool)

(assert (=> b!810862 (=> (not res!554166) (not e!448780))))

(assert (=> b!810862 (= res!554166 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21525 a!3170)))))

(declare-fun b!810863 () Bool)

(assert (=> b!810863 (= e!448780 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103935 (not res!554165)) b!810862))

(assert (= (and b!810862 res!554166) b!810863))

(assert (=> d!103935 m!752657))

(declare-fun m!752667 () Bool)

(assert (=> b!810863 m!752667))

(assert (=> b!810655 d!103935))

(declare-fun e!448782 () SeekEntryResult!8692)

(declare-fun b!810864 () Bool)

(assert (=> b!810864 (= e!448782 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363282 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!363281 lt!363283 mask!3266))))

(declare-fun b!810865 () Bool)

(declare-fun e!448781 () SeekEntryResult!8692)

(assert (=> b!810865 (= e!448781 Undefined!8692)))

(declare-fun b!810866 () Bool)

(assert (=> b!810866 (= e!448782 (MissingVacant!8692 vacantAfter!23))))

(declare-fun d!103937 () Bool)

(declare-fun lt!363389 () SeekEntryResult!8692)

(assert (=> d!103937 (and (or ((_ is Undefined!8692) lt!363389) (not ((_ is Found!8692) lt!363389)) (and (bvsge (index!37137 lt!363389) #b00000000000000000000000000000000) (bvslt (index!37137 lt!363389) (size!21525 lt!363283)))) (or ((_ is Undefined!8692) lt!363389) ((_ is Found!8692) lt!363389) (not ((_ is MissingVacant!8692) lt!363389)) (not (= (index!37139 lt!363389) vacantAfter!23)) (and (bvsge (index!37139 lt!363389) #b00000000000000000000000000000000) (bvslt (index!37139 lt!363389) (size!21525 lt!363283)))) (or ((_ is Undefined!8692) lt!363389) (ite ((_ is Found!8692) lt!363389) (= (select (arr!21104 lt!363283) (index!37137 lt!363389)) lt!363281) (and ((_ is MissingVacant!8692) lt!363389) (= (index!37139 lt!363389) vacantAfter!23) (= (select (arr!21104 lt!363283) (index!37139 lt!363389)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103937 (= lt!363389 e!448781)))

(declare-fun c!88759 () Bool)

(assert (=> d!103937 (= c!88759 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!363388 () (_ BitVec 64))

(assert (=> d!103937 (= lt!363388 (select (arr!21104 lt!363283) lt!363282))))

(assert (=> d!103937 (validMask!0 mask!3266)))

(assert (=> d!103937 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363282 vacantAfter!23 lt!363281 lt!363283 mask!3266) lt!363389)))

(declare-fun b!810867 () Bool)

(declare-fun e!448783 () SeekEntryResult!8692)

(assert (=> b!810867 (= e!448781 e!448783)))

(declare-fun c!88760 () Bool)

(assert (=> b!810867 (= c!88760 (= lt!363388 lt!363281))))

(declare-fun b!810868 () Bool)

(assert (=> b!810868 (= e!448783 (Found!8692 lt!363282))))

(declare-fun b!810869 () Bool)

(declare-fun c!88761 () Bool)

(assert (=> b!810869 (= c!88761 (= lt!363388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810869 (= e!448783 e!448782)))

(assert (= (and d!103937 c!88759) b!810865))

(assert (= (and d!103937 (not c!88759)) b!810867))

(assert (= (and b!810867 c!88760) b!810868))

(assert (= (and b!810867 (not c!88760)) b!810869))

(assert (= (and b!810869 c!88761) b!810866))

(assert (= (and b!810869 (not c!88761)) b!810864))

(declare-fun m!752669 () Bool)

(assert (=> b!810864 m!752669))

(assert (=> b!810864 m!752669))

(declare-fun m!752671 () Bool)

(assert (=> b!810864 m!752671))

(declare-fun m!752673 () Bool)

(assert (=> d!103937 m!752673))

(declare-fun m!752675 () Bool)

(assert (=> d!103937 m!752675))

(declare-fun m!752677 () Bool)

(assert (=> d!103937 m!752677))

(assert (=> d!103937 m!752481))

(assert (=> b!810649 d!103937))

(declare-fun e!448788 () SeekEntryResult!8692)

(declare-fun b!810876 () Bool)

(assert (=> b!810876 (= e!448788 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363282 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810877 () Bool)

(declare-fun e!448787 () SeekEntryResult!8692)

(assert (=> b!810877 (= e!448787 Undefined!8692)))

(declare-fun b!810878 () Bool)

(assert (=> b!810878 (= e!448788 (MissingVacant!8692 vacantBefore!23))))

(declare-fun d!103939 () Bool)

(declare-fun lt!363393 () SeekEntryResult!8692)

(assert (=> d!103939 (and (or ((_ is Undefined!8692) lt!363393) (not ((_ is Found!8692) lt!363393)) (and (bvsge (index!37137 lt!363393) #b00000000000000000000000000000000) (bvslt (index!37137 lt!363393) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363393) ((_ is Found!8692) lt!363393) (not ((_ is MissingVacant!8692) lt!363393)) (not (= (index!37139 lt!363393) vacantBefore!23)) (and (bvsge (index!37139 lt!363393) #b00000000000000000000000000000000) (bvslt (index!37139 lt!363393) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363393) (ite ((_ is Found!8692) lt!363393) (= (select (arr!21104 a!3170) (index!37137 lt!363393)) (select (arr!21104 a!3170) j!153)) (and ((_ is MissingVacant!8692) lt!363393) (= (index!37139 lt!363393) vacantBefore!23) (= (select (arr!21104 a!3170) (index!37139 lt!363393)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103939 (= lt!363393 e!448787)))

(declare-fun c!88765 () Bool)

(assert (=> d!103939 (= c!88765 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!363392 () (_ BitVec 64))

(assert (=> d!103939 (= lt!363392 (select (arr!21104 a!3170) lt!363282))))

(assert (=> d!103939 (validMask!0 mask!3266)))

(assert (=> d!103939 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363282 vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266) lt!363393)))

(declare-fun b!810879 () Bool)

(declare-fun e!448789 () SeekEntryResult!8692)

(assert (=> b!810879 (= e!448787 e!448789)))

(declare-fun c!88766 () Bool)

(assert (=> b!810879 (= c!88766 (= lt!363392 (select (arr!21104 a!3170) j!153)))))

(declare-fun b!810880 () Bool)

(assert (=> b!810880 (= e!448789 (Found!8692 lt!363282))))

(declare-fun b!810881 () Bool)

(declare-fun c!88767 () Bool)

(assert (=> b!810881 (= c!88767 (= lt!363392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810881 (= e!448789 e!448788)))

(assert (= (and d!103939 c!88765) b!810877))

(assert (= (and d!103939 (not c!88765)) b!810879))

(assert (= (and b!810879 c!88766) b!810880))

(assert (= (and b!810879 (not c!88766)) b!810881))

(assert (= (and b!810881 c!88767) b!810878))

(assert (= (and b!810881 (not c!88767)) b!810876))

(assert (=> b!810876 m!752669))

(assert (=> b!810876 m!752669))

(assert (=> b!810876 m!752445))

(declare-fun m!752687 () Bool)

(assert (=> b!810876 m!752687))

(declare-fun m!752689 () Bool)

(assert (=> d!103939 m!752689))

(declare-fun m!752691 () Bool)

(assert (=> d!103939 m!752691))

(declare-fun m!752693 () Bool)

(assert (=> d!103939 m!752693))

(assert (=> d!103939 m!752481))

(assert (=> b!810649 d!103939))

(declare-fun d!103943 () Bool)

(declare-fun e!448795 () Bool)

(assert (=> d!103943 e!448795))

(declare-fun res!554172 () Bool)

(assert (=> d!103943 (=> (not res!554172) (not e!448795))))

(assert (=> d!103943 (= res!554172 (and (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21525 a!3170)) (and (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21525 a!3170)))) (or (bvslt i!1163 #b00000000000000000000000000000000) (bvsge i!1163 (size!21525 a!3170)) (and (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21525 a!3170)))) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21525 a!3170))))))

(declare-fun lt!363402 () Unit!27612)

(declare-fun choose!112 (array!44065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27612)

(assert (=> d!103943 (= lt!363402 (choose!112 a!3170 i!1163 k0!2044 j!153 lt!363282 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(assert (=> d!103943 (validMask!0 mask!3266)))

(assert (=> d!103943 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363282 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266) lt!363402)))

(declare-fun b!810887 () Bool)

(assert (=> b!810887 (= e!448795 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363282 vacantAfter!23 (select (store (arr!21104 a!3170) i!1163 k0!2044) j!153) (array!44066 (store (arr!21104 a!3170) i!1163 k0!2044) (size!21525 a!3170)) mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363282 vacantBefore!23 (select (arr!21104 a!3170) j!153) a!3170 mask!3266)))))

(assert (= (and d!103943 res!554172) b!810887))

(declare-fun m!752701 () Bool)

(assert (=> d!103943 m!752701))

(assert (=> d!103943 m!752481))

(assert (=> b!810887 m!752445))

(assert (=> b!810887 m!752477))

(assert (=> b!810887 m!752445))

(assert (=> b!810887 m!752449))

(assert (=> b!810887 m!752479))

(declare-fun m!752703 () Bool)

(assert (=> b!810887 m!752703))

(assert (=> b!810887 m!752479))

(assert (=> b!810649 d!103943))

(declare-fun d!103951 () Bool)

(declare-fun lt!363411 () (_ BitVec 32))

(assert (=> d!103951 (and (bvsge lt!363411 #b00000000000000000000000000000000) (bvslt lt!363411 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103951 (= lt!363411 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103951 (validMask!0 mask!3266)))

(assert (=> d!103951 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!363411)))

(declare-fun bs!22420 () Bool)

(assert (= bs!22420 d!103951))

(declare-fun m!752709 () Bool)

(assert (=> bs!22420 m!752709))

(assert (=> bs!22420 m!752481))

(assert (=> b!810649 d!103951))

(declare-fun d!103955 () Bool)

(assert (=> d!103955 (= (validKeyInArray!0 (select (arr!21104 a!3170) j!153)) (and (not (= (select (arr!21104 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21104 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810654 d!103955))

(declare-fun e!448809 () SeekEntryResult!8692)

(declare-fun b!810906 () Bool)

(assert (=> b!810906 (= e!448809 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!363281 lt!363283 mask!3266))))

(declare-fun b!810907 () Bool)

(declare-fun e!448808 () SeekEntryResult!8692)

(assert (=> b!810907 (= e!448808 Undefined!8692)))

(declare-fun b!810908 () Bool)

(assert (=> b!810908 (= e!448809 (MissingVacant!8692 vacantAfter!23))))

(declare-fun lt!363413 () SeekEntryResult!8692)

(declare-fun d!103957 () Bool)

(assert (=> d!103957 (and (or ((_ is Undefined!8692) lt!363413) (not ((_ is Found!8692) lt!363413)) (and (bvsge (index!37137 lt!363413) #b00000000000000000000000000000000) (bvslt (index!37137 lt!363413) (size!21525 lt!363283)))) (or ((_ is Undefined!8692) lt!363413) ((_ is Found!8692) lt!363413) (not ((_ is MissingVacant!8692) lt!363413)) (not (= (index!37139 lt!363413) vacantAfter!23)) (and (bvsge (index!37139 lt!363413) #b00000000000000000000000000000000) (bvslt (index!37139 lt!363413) (size!21525 lt!363283)))) (or ((_ is Undefined!8692) lt!363413) (ite ((_ is Found!8692) lt!363413) (= (select (arr!21104 lt!363283) (index!37137 lt!363413)) lt!363281) (and ((_ is MissingVacant!8692) lt!363413) (= (index!37139 lt!363413) vacantAfter!23) (= (select (arr!21104 lt!363283) (index!37139 lt!363413)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103957 (= lt!363413 e!448808)))

(declare-fun c!88774 () Bool)

(assert (=> d!103957 (= c!88774 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!363412 () (_ BitVec 64))

(assert (=> d!103957 (= lt!363412 (select (arr!21104 lt!363283) index!1236))))

(assert (=> d!103957 (validMask!0 mask!3266)))

(assert (=> d!103957 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363281 lt!363283 mask!3266) lt!363413)))

(declare-fun b!810909 () Bool)

(declare-fun e!448810 () SeekEntryResult!8692)

(assert (=> b!810909 (= e!448808 e!448810)))

(declare-fun c!88775 () Bool)

(assert (=> b!810909 (= c!88775 (= lt!363412 lt!363281))))

(declare-fun b!810910 () Bool)

(assert (=> b!810910 (= e!448810 (Found!8692 index!1236))))

(declare-fun b!810911 () Bool)

(declare-fun c!88776 () Bool)

(assert (=> b!810911 (= c!88776 (= lt!363412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810911 (= e!448810 e!448809)))

(assert (= (and d!103957 c!88774) b!810907))

(assert (= (and d!103957 (not c!88774)) b!810909))

(assert (= (and b!810909 c!88775) b!810910))

(assert (= (and b!810909 (not c!88775)) b!810911))

(assert (= (and b!810911 c!88776) b!810908))

(assert (= (and b!810911 (not c!88776)) b!810906))

(assert (=> b!810906 m!752453))

(assert (=> b!810906 m!752453))

(declare-fun m!752711 () Bool)

(assert (=> b!810906 m!752711))

(declare-fun m!752713 () Bool)

(assert (=> d!103957 m!752713))

(declare-fun m!752715 () Bool)

(assert (=> d!103957 m!752715))

(declare-fun m!752717 () Bool)

(assert (=> d!103957 m!752717))

(assert (=> d!103957 m!752481))

(assert (=> b!810651 d!103957))

(declare-fun b!810912 () Bool)

(declare-fun c!88779 () Bool)

(declare-fun lt!363416 () (_ BitVec 64))

(assert (=> b!810912 (= c!88779 (= lt!363416 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448812 () SeekEntryResult!8692)

(declare-fun e!448811 () SeekEntryResult!8692)

(assert (=> b!810912 (= e!448812 e!448811)))

(declare-fun lt!363415 () SeekEntryResult!8692)

(declare-fun b!810913 () Bool)

(assert (=> b!810913 (= e!448811 (seekKeyOrZeroReturnVacant!0 (x!67955 lt!363415) (index!37138 lt!363415) (index!37138 lt!363415) lt!363281 lt!363283 mask!3266))))

(declare-fun b!810914 () Bool)

(declare-fun e!448813 () SeekEntryResult!8692)

(assert (=> b!810914 (= e!448813 Undefined!8692)))

(declare-fun b!810916 () Bool)

(assert (=> b!810916 (= e!448813 e!448812)))

(assert (=> b!810916 (= lt!363416 (select (arr!21104 lt!363283) (index!37138 lt!363415)))))

(declare-fun c!88778 () Bool)

(assert (=> b!810916 (= c!88778 (= lt!363416 lt!363281))))

(declare-fun b!810917 () Bool)

(assert (=> b!810917 (= e!448812 (Found!8692 (index!37138 lt!363415)))))

(declare-fun d!103959 () Bool)

(declare-fun lt!363414 () SeekEntryResult!8692)

(assert (=> d!103959 (and (or ((_ is Undefined!8692) lt!363414) (not ((_ is Found!8692) lt!363414)) (and (bvsge (index!37137 lt!363414) #b00000000000000000000000000000000) (bvslt (index!37137 lt!363414) (size!21525 lt!363283)))) (or ((_ is Undefined!8692) lt!363414) ((_ is Found!8692) lt!363414) (not ((_ is MissingZero!8692) lt!363414)) (and (bvsge (index!37136 lt!363414) #b00000000000000000000000000000000) (bvslt (index!37136 lt!363414) (size!21525 lt!363283)))) (or ((_ is Undefined!8692) lt!363414) ((_ is Found!8692) lt!363414) ((_ is MissingZero!8692) lt!363414) (not ((_ is MissingVacant!8692) lt!363414)) (and (bvsge (index!37139 lt!363414) #b00000000000000000000000000000000) (bvslt (index!37139 lt!363414) (size!21525 lt!363283)))) (or ((_ is Undefined!8692) lt!363414) (ite ((_ is Found!8692) lt!363414) (= (select (arr!21104 lt!363283) (index!37137 lt!363414)) lt!363281) (ite ((_ is MissingZero!8692) lt!363414) (= (select (arr!21104 lt!363283) (index!37136 lt!363414)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8692) lt!363414) (= (select (arr!21104 lt!363283) (index!37139 lt!363414)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103959 (= lt!363414 e!448813)))

(declare-fun c!88777 () Bool)

(assert (=> d!103959 (= c!88777 (and ((_ is Intermediate!8692) lt!363415) (undefined!9504 lt!363415)))))

(assert (=> d!103959 (= lt!363415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!363281 mask!3266) lt!363281 lt!363283 mask!3266))))

(assert (=> d!103959 (validMask!0 mask!3266)))

(assert (=> d!103959 (= (seekEntryOrOpen!0 lt!363281 lt!363283 mask!3266) lt!363414)))

(declare-fun b!810915 () Bool)

(assert (=> b!810915 (= e!448811 (MissingZero!8692 (index!37138 lt!363415)))))

(assert (= (and d!103959 c!88777) b!810914))

(assert (= (and d!103959 (not c!88777)) b!810916))

(assert (= (and b!810916 c!88778) b!810917))

(assert (= (and b!810916 (not c!88778)) b!810912))

(assert (= (and b!810912 c!88779) b!810915))

(assert (= (and b!810912 (not c!88779)) b!810913))

(declare-fun m!752719 () Bool)

(assert (=> b!810913 m!752719))

(declare-fun m!752721 () Bool)

(assert (=> b!810916 m!752721))

(declare-fun m!752723 () Bool)

(assert (=> d!103959 m!752723))

(assert (=> d!103959 m!752481))

(declare-fun m!752725 () Bool)

(assert (=> d!103959 m!752725))

(declare-fun m!752727 () Bool)

(assert (=> d!103959 m!752727))

(assert (=> d!103959 m!752725))

(declare-fun m!752729 () Bool)

(assert (=> d!103959 m!752729))

(declare-fun m!752731 () Bool)

(assert (=> d!103959 m!752731))

(assert (=> b!810651 d!103959))

(declare-fun b!810918 () Bool)

(declare-fun c!88782 () Bool)

(declare-fun lt!363419 () (_ BitVec 64))

(assert (=> b!810918 (= c!88782 (= lt!363419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448815 () SeekEntryResult!8692)

(declare-fun e!448814 () SeekEntryResult!8692)

(assert (=> b!810918 (= e!448815 e!448814)))

(declare-fun b!810919 () Bool)

(declare-fun lt!363418 () SeekEntryResult!8692)

(assert (=> b!810919 (= e!448814 (seekKeyOrZeroReturnVacant!0 (x!67955 lt!363418) (index!37138 lt!363418) (index!37138 lt!363418) k0!2044 a!3170 mask!3266))))

(declare-fun b!810920 () Bool)

(declare-fun e!448816 () SeekEntryResult!8692)

(assert (=> b!810920 (= e!448816 Undefined!8692)))

(declare-fun b!810922 () Bool)

(assert (=> b!810922 (= e!448816 e!448815)))

(assert (=> b!810922 (= lt!363419 (select (arr!21104 a!3170) (index!37138 lt!363418)))))

(declare-fun c!88781 () Bool)

(assert (=> b!810922 (= c!88781 (= lt!363419 k0!2044))))

(declare-fun b!810923 () Bool)

(assert (=> b!810923 (= e!448815 (Found!8692 (index!37138 lt!363418)))))

(declare-fun d!103961 () Bool)

(declare-fun lt!363417 () SeekEntryResult!8692)

(assert (=> d!103961 (and (or ((_ is Undefined!8692) lt!363417) (not ((_ is Found!8692) lt!363417)) (and (bvsge (index!37137 lt!363417) #b00000000000000000000000000000000) (bvslt (index!37137 lt!363417) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363417) ((_ is Found!8692) lt!363417) (not ((_ is MissingZero!8692) lt!363417)) (and (bvsge (index!37136 lt!363417) #b00000000000000000000000000000000) (bvslt (index!37136 lt!363417) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363417) ((_ is Found!8692) lt!363417) ((_ is MissingZero!8692) lt!363417) (not ((_ is MissingVacant!8692) lt!363417)) (and (bvsge (index!37139 lt!363417) #b00000000000000000000000000000000) (bvslt (index!37139 lt!363417) (size!21525 a!3170)))) (or ((_ is Undefined!8692) lt!363417) (ite ((_ is Found!8692) lt!363417) (= (select (arr!21104 a!3170) (index!37137 lt!363417)) k0!2044) (ite ((_ is MissingZero!8692) lt!363417) (= (select (arr!21104 a!3170) (index!37136 lt!363417)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8692) lt!363417) (= (select (arr!21104 a!3170) (index!37139 lt!363417)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103961 (= lt!363417 e!448816)))

(declare-fun c!88780 () Bool)

(assert (=> d!103961 (= c!88780 (and ((_ is Intermediate!8692) lt!363418) (undefined!9504 lt!363418)))))

(assert (=> d!103961 (= lt!363418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103961 (validMask!0 mask!3266)))

(assert (=> d!103961 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!363417)))

(declare-fun b!810921 () Bool)

(assert (=> b!810921 (= e!448814 (MissingZero!8692 (index!37138 lt!363418)))))

(assert (= (and d!103961 c!88780) b!810920))

(assert (= (and d!103961 (not c!88780)) b!810922))

(assert (= (and b!810922 c!88781) b!810923))

(assert (= (and b!810922 (not c!88781)) b!810918))

(assert (= (and b!810918 c!88782) b!810921))

(assert (= (and b!810918 (not c!88782)) b!810919))

(declare-fun m!752733 () Bool)

(assert (=> b!810919 m!752733))

(declare-fun m!752735 () Bool)

(assert (=> b!810922 m!752735))

(declare-fun m!752737 () Bool)

(assert (=> d!103961 m!752737))

(assert (=> d!103961 m!752481))

(declare-fun m!752739 () Bool)

(assert (=> d!103961 m!752739))

(declare-fun m!752741 () Bool)

(assert (=> d!103961 m!752741))

(assert (=> d!103961 m!752739))

(declare-fun m!752743 () Bool)

(assert (=> d!103961 m!752743))

(declare-fun m!752745 () Bool)

(assert (=> d!103961 m!752745))

(assert (=> b!810645 d!103961))

(declare-fun b!810972 () Bool)

(declare-fun e!448849 () Bool)

(declare-fun e!448850 () Bool)

(assert (=> b!810972 (= e!448849 e!448850)))

(declare-fun lt!363444 () (_ BitVec 64))

(assert (=> b!810972 (= lt!363444 (select (arr!21104 a!3170) #b00000000000000000000000000000000))))

(declare-fun lt!363445 () Unit!27612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44065 (_ BitVec 64) (_ BitVec 32)) Unit!27612)

(assert (=> b!810972 (= lt!363445 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363444 #b00000000000000000000000000000000))))

(assert (=> b!810972 (arrayContainsKey!0 a!3170 lt!363444 #b00000000000000000000000000000000)))

(declare-fun lt!363443 () Unit!27612)

(assert (=> b!810972 (= lt!363443 lt!363445)))

(declare-fun res!554195 () Bool)

(assert (=> b!810972 (= res!554195 (= (seekEntryOrOpen!0 (select (arr!21104 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8692 #b00000000000000000000000000000000)))))

(assert (=> b!810972 (=> (not res!554195) (not e!448850))))

(declare-fun b!810973 () Bool)

(declare-fun call!35439 () Bool)

(assert (=> b!810973 (= e!448850 call!35439)))

(declare-fun b!810974 () Bool)

(declare-fun e!448851 () Bool)

(assert (=> b!810974 (= e!448851 e!448849)))

(declare-fun c!88799 () Bool)

(assert (=> b!810974 (= c!88799 (validKeyInArray!0 (select (arr!21104 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810975 () Bool)

(assert (=> b!810975 (= e!448849 call!35439)))

(declare-fun d!103963 () Bool)

(declare-fun res!554196 () Bool)

(assert (=> d!103963 (=> res!554196 e!448851)))

(assert (=> d!103963 (= res!554196 (bvsge #b00000000000000000000000000000000 (size!21525 a!3170)))))

(assert (=> d!103963 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448851)))

(declare-fun bm!35434 () Bool)

(assert (=> bm!35434 (= call!35439 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(assert (= (and d!103963 (not res!554196)) b!810974))

(assert (= (and b!810974 c!88799) b!810972))

(assert (= (and b!810974 (not c!88799)) b!810975))

(assert (= (and b!810972 res!554195) b!810973))

(assert (= (or b!810973 b!810975) bm!35434))

(assert (=> b!810972 m!752657))

(declare-fun m!752791 () Bool)

(assert (=> b!810972 m!752791))

(declare-fun m!752793 () Bool)

(assert (=> b!810972 m!752793))

(assert (=> b!810972 m!752657))

(declare-fun m!752795 () Bool)

(assert (=> b!810972 m!752795))

(assert (=> b!810974 m!752657))

(assert (=> b!810974 m!752657))

(assert (=> b!810974 m!752663))

(declare-fun m!752797 () Bool)

(assert (=> bm!35434 m!752797))

(assert (=> b!810647 d!103963))

(declare-fun d!103975 () Bool)

(assert (=> d!103975 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810652 d!103975))

(check-sat (not d!103939) (not d!103961) (not bm!35434) (not d!103959) (not d!103951) (not b!810972) (not b!810842) (not b!810864) (not b!810845) (not b!810974) (not b!810843) (not d!103943) (not d!103957) (not b!810876) (not b!810863) (not b!810778) (not b!810887) (not b!810906) (not b!810741) (not d!103909) (not b!810919) (not d!103937) (not d!103907) (not b!810913) (not bm!35428))
(check-sat)
