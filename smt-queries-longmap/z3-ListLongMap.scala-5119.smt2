; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69462 () Bool)

(assert start!69462)

(declare-fun b!809684 () Bool)

(declare-fun res!553337 () Bool)

(declare-fun e!448167 () Bool)

(assert (=> b!809684 (=> (not res!553337) (not e!448167))))

(declare-datatypes ((array!44026 0))(
  ( (array!44027 (arr!21086 (Array (_ BitVec 32) (_ BitVec 64))) (size!21507 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44026)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809684 (= res!553337 (validKeyInArray!0 (select (arr!21086 a!3170) j!153)))))

(declare-fun b!809685 () Bool)

(declare-fun res!553340 () Bool)

(declare-fun e!448169 () Bool)

(assert (=> b!809685 (=> (not res!553340) (not e!448169))))

(declare-datatypes ((List!15088 0))(
  ( (Nil!15085) (Cons!15084 (h!16213 (_ BitVec 64)) (t!21394 List!15088)) )
))
(declare-fun arrayNoDuplicates!0 (array!44026 (_ BitVec 32) List!15088) Bool)

(assert (=> b!809685 (= res!553340 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15085))))

(declare-fun b!809686 () Bool)

(declare-fun res!553339 () Bool)

(assert (=> b!809686 (=> (not res!553339) (not e!448169))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809686 (= res!553339 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21507 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21086 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21507 a!3170)) (= (select (arr!21086 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809687 () Bool)

(declare-fun res!553344 () Bool)

(assert (=> b!809687 (=> (not res!553344) (not e!448167))))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!809687 (= res!553344 (and (= (size!21507 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21507 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21507 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809688 () Bool)

(declare-fun res!553343 () Bool)

(assert (=> b!809688 (=> (not res!553343) (not e!448169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44026 (_ BitVec 32)) Bool)

(assert (=> b!809688 (= res!553343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809689 () Bool)

(declare-fun res!553335 () Bool)

(assert (=> b!809689 (=> (not res!553335) (not e!448167))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!809689 (= res!553335 (validKeyInArray!0 k0!2044))))

(declare-fun b!809690 () Bool)

(declare-fun e!448170 () Bool)

(declare-fun e!448171 () Bool)

(assert (=> b!809690 (= e!448170 e!448171)))

(declare-fun res!553338 () Bool)

(assert (=> b!809690 (=> (not res!553338) (not e!448171))))

(declare-datatypes ((SeekEntryResult!8674 0))(
  ( (MissingZero!8674 (index!37064 (_ BitVec 32))) (Found!8674 (index!37065 (_ BitVec 32))) (Intermediate!8674 (undefined!9486 Bool) (index!37066 (_ BitVec 32)) (x!67883 (_ BitVec 32))) (Undefined!8674) (MissingVacant!8674 (index!37067 (_ BitVec 32))) )
))
(declare-fun lt!362740 () SeekEntryResult!8674)

(declare-fun lt!362742 () SeekEntryResult!8674)

(assert (=> b!809690 (= res!553338 (and (= lt!362740 lt!362742) (= lt!362742 (Found!8674 j!153)) (not (= (select (arr!21086 a!3170) index!1236) (select (arr!21086 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44026 (_ BitVec 32)) SeekEntryResult!8674)

(assert (=> b!809690 (= lt!362742 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44026 (_ BitVec 32)) SeekEntryResult!8674)

(assert (=> b!809690 (= lt!362740 (seekEntryOrOpen!0 (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809691 () Bool)

(declare-fun e!448168 () Bool)

(assert (=> b!809691 (= e!448171 e!448168)))

(declare-fun res!553345 () Bool)

(assert (=> b!809691 (=> (not res!553345) (not e!448168))))

(declare-fun lt!362744 () (_ BitVec 32))

(assert (=> b!809691 (= res!553345 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!362744 #b00000000000000000000000000000000) (bvslt lt!362744 (size!21507 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809691 (= lt!362744 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809692 () Bool)

(declare-fun res!553341 () Bool)

(assert (=> b!809692 (=> (not res!553341) (not e!448167))))

(declare-fun arrayContainsKey!0 (array!44026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809692 (= res!553341 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!553342 () Bool)

(assert (=> start!69462 (=> (not res!553342) (not e!448167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69462 (= res!553342 (validMask!0 mask!3266))))

(assert (=> start!69462 e!448167))

(assert (=> start!69462 true))

(declare-fun array_inv!16969 (array!44026) Bool)

(assert (=> start!69462 (array_inv!16969 a!3170)))

(declare-fun b!809693 () Bool)

(assert (=> b!809693 (= e!448168 (not (= lt!362740 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362744 vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))))

(declare-fun b!809694 () Bool)

(declare-fun res!553347 () Bool)

(assert (=> b!809694 (=> (not res!553347) (not e!448168))))

(declare-fun lt!362738 () array!44026)

(declare-fun lt!362741 () (_ BitVec 64))

(declare-fun lt!362739 () SeekEntryResult!8674)

(assert (=> b!809694 (= res!553347 (= lt!362739 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362744 vacantAfter!23 lt!362741 lt!362738 mask!3266)))))

(declare-fun b!809695 () Bool)

(assert (=> b!809695 (= e!448167 e!448169)))

(declare-fun res!553336 () Bool)

(assert (=> b!809695 (=> (not res!553336) (not e!448169))))

(declare-fun lt!362743 () SeekEntryResult!8674)

(assert (=> b!809695 (= res!553336 (or (= lt!362743 (MissingZero!8674 i!1163)) (= lt!362743 (MissingVacant!8674 i!1163))))))

(assert (=> b!809695 (= lt!362743 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809696 () Bool)

(assert (=> b!809696 (= e!448169 e!448170)))

(declare-fun res!553346 () Bool)

(assert (=> b!809696 (=> (not res!553346) (not e!448170))))

(assert (=> b!809696 (= res!553346 (= lt!362739 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362741 lt!362738 mask!3266)))))

(assert (=> b!809696 (= lt!362739 (seekEntryOrOpen!0 lt!362741 lt!362738 mask!3266))))

(assert (=> b!809696 (= lt!362741 (select (store (arr!21086 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809696 (= lt!362738 (array!44027 (store (arr!21086 a!3170) i!1163 k0!2044) (size!21507 a!3170)))))

(assert (= (and start!69462 res!553342) b!809687))

(assert (= (and b!809687 res!553344) b!809684))

(assert (= (and b!809684 res!553337) b!809689))

(assert (= (and b!809689 res!553335) b!809692))

(assert (= (and b!809692 res!553341) b!809695))

(assert (= (and b!809695 res!553336) b!809688))

(assert (= (and b!809688 res!553343) b!809685))

(assert (= (and b!809685 res!553340) b!809686))

(assert (= (and b!809686 res!553339) b!809696))

(assert (= (and b!809696 res!553346) b!809690))

(assert (= (and b!809690 res!553338) b!809691))

(assert (= (and b!809691 res!553345) b!809694))

(assert (= (and b!809694 res!553347) b!809693))

(declare-fun m!751387 () Bool)

(assert (=> b!809685 m!751387))

(declare-fun m!751389 () Bool)

(assert (=> start!69462 m!751389))

(declare-fun m!751391 () Bool)

(assert (=> start!69462 m!751391))

(declare-fun m!751393 () Bool)

(assert (=> b!809686 m!751393))

(declare-fun m!751395 () Bool)

(assert (=> b!809686 m!751395))

(declare-fun m!751397 () Bool)

(assert (=> b!809688 m!751397))

(declare-fun m!751399 () Bool)

(assert (=> b!809694 m!751399))

(declare-fun m!751401 () Bool)

(assert (=> b!809693 m!751401))

(assert (=> b!809693 m!751401))

(declare-fun m!751403 () Bool)

(assert (=> b!809693 m!751403))

(declare-fun m!751405 () Bool)

(assert (=> b!809692 m!751405))

(declare-fun m!751407 () Bool)

(assert (=> b!809695 m!751407))

(declare-fun m!751409 () Bool)

(assert (=> b!809690 m!751409))

(assert (=> b!809690 m!751401))

(assert (=> b!809690 m!751401))

(declare-fun m!751411 () Bool)

(assert (=> b!809690 m!751411))

(assert (=> b!809690 m!751401))

(declare-fun m!751413 () Bool)

(assert (=> b!809690 m!751413))

(declare-fun m!751415 () Bool)

(assert (=> b!809689 m!751415))

(assert (=> b!809684 m!751401))

(assert (=> b!809684 m!751401))

(declare-fun m!751417 () Bool)

(assert (=> b!809684 m!751417))

(declare-fun m!751419 () Bool)

(assert (=> b!809691 m!751419))

(declare-fun m!751421 () Bool)

(assert (=> b!809696 m!751421))

(declare-fun m!751423 () Bool)

(assert (=> b!809696 m!751423))

(declare-fun m!751425 () Bool)

(assert (=> b!809696 m!751425))

(declare-fun m!751427 () Bool)

(assert (=> b!809696 m!751427))

(check-sat (not b!809688) (not start!69462) (not b!809691) (not b!809685) (not b!809694) (not b!809689) (not b!809693) (not b!809684) (not b!809690) (not b!809696) (not b!809692) (not b!809695))
(check-sat)
(get-model)

(declare-fun d!103805 () Bool)

(assert (=> d!103805 (= (validKeyInArray!0 (select (arr!21086 a!3170) j!153)) (and (not (= (select (arr!21086 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21086 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809684 d!103805))

(declare-fun b!809787 () Bool)

(declare-fun e!448214 () SeekEntryResult!8674)

(declare-fun e!448215 () SeekEntryResult!8674)

(assert (=> b!809787 (= e!448214 e!448215)))

(declare-fun lt!362793 () (_ BitVec 64))

(declare-fun lt!362794 () SeekEntryResult!8674)

(assert (=> b!809787 (= lt!362793 (select (arr!21086 a!3170) (index!37066 lt!362794)))))

(declare-fun c!88591 () Bool)

(assert (=> b!809787 (= c!88591 (= lt!362793 k0!2044))))

(declare-fun b!809788 () Bool)

(declare-fun c!88593 () Bool)

(assert (=> b!809788 (= c!88593 (= lt!362793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448216 () SeekEntryResult!8674)

(assert (=> b!809788 (= e!448215 e!448216)))

(declare-fun b!809789 () Bool)

(assert (=> b!809789 (= e!448216 (MissingZero!8674 (index!37066 lt!362794)))))

(declare-fun d!103807 () Bool)

(declare-fun lt!362795 () SeekEntryResult!8674)

(get-info :version)

(assert (=> d!103807 (and (or ((_ is Undefined!8674) lt!362795) (not ((_ is Found!8674) lt!362795)) (and (bvsge (index!37065 lt!362795) #b00000000000000000000000000000000) (bvslt (index!37065 lt!362795) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362795) ((_ is Found!8674) lt!362795) (not ((_ is MissingZero!8674) lt!362795)) (and (bvsge (index!37064 lt!362795) #b00000000000000000000000000000000) (bvslt (index!37064 lt!362795) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362795) ((_ is Found!8674) lt!362795) ((_ is MissingZero!8674) lt!362795) (not ((_ is MissingVacant!8674) lt!362795)) (and (bvsge (index!37067 lt!362795) #b00000000000000000000000000000000) (bvslt (index!37067 lt!362795) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362795) (ite ((_ is Found!8674) lt!362795) (= (select (arr!21086 a!3170) (index!37065 lt!362795)) k0!2044) (ite ((_ is MissingZero!8674) lt!362795) (= (select (arr!21086 a!3170) (index!37064 lt!362795)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8674) lt!362795) (= (select (arr!21086 a!3170) (index!37067 lt!362795)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103807 (= lt!362795 e!448214)))

(declare-fun c!88592 () Bool)

(assert (=> d!103807 (= c!88592 (and ((_ is Intermediate!8674) lt!362794) (undefined!9486 lt!362794)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44026 (_ BitVec 32)) SeekEntryResult!8674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103807 (= lt!362794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103807 (validMask!0 mask!3266)))

(assert (=> d!103807 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!362795)))

(declare-fun b!809790 () Bool)

(assert (=> b!809790 (= e!448215 (Found!8674 (index!37066 lt!362794)))))

(declare-fun b!809791 () Bool)

(assert (=> b!809791 (= e!448214 Undefined!8674)))

(declare-fun b!809792 () Bool)

(assert (=> b!809792 (= e!448216 (seekKeyOrZeroReturnVacant!0 (x!67883 lt!362794) (index!37066 lt!362794) (index!37066 lt!362794) k0!2044 a!3170 mask!3266))))

(assert (= (and d!103807 c!88592) b!809791))

(assert (= (and d!103807 (not c!88592)) b!809787))

(assert (= (and b!809787 c!88591) b!809790))

(assert (= (and b!809787 (not c!88591)) b!809788))

(assert (= (and b!809788 c!88593) b!809789))

(assert (= (and b!809788 (not c!88593)) b!809792))

(declare-fun m!751513 () Bool)

(assert (=> b!809787 m!751513))

(declare-fun m!751515 () Bool)

(assert (=> d!103807 m!751515))

(declare-fun m!751517 () Bool)

(assert (=> d!103807 m!751517))

(declare-fun m!751519 () Bool)

(assert (=> d!103807 m!751519))

(assert (=> d!103807 m!751389))

(assert (=> d!103807 m!751517))

(declare-fun m!751521 () Bool)

(assert (=> d!103807 m!751521))

(declare-fun m!751523 () Bool)

(assert (=> d!103807 m!751523))

(declare-fun m!751525 () Bool)

(assert (=> b!809792 m!751525))

(assert (=> b!809695 d!103807))

(declare-fun b!809803 () Bool)

(declare-fun e!448227 () Bool)

(declare-fun e!448226 () Bool)

(assert (=> b!809803 (= e!448227 e!448226)))

(declare-fun res!553434 () Bool)

(assert (=> b!809803 (=> (not res!553434) (not e!448226))))

(declare-fun e!448228 () Bool)

(assert (=> b!809803 (= res!553434 (not e!448228))))

(declare-fun res!553433 () Bool)

(assert (=> b!809803 (=> (not res!553433) (not e!448228))))

(assert (=> b!809803 (= res!553433 (validKeyInArray!0 (select (arr!21086 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809804 () Bool)

(declare-fun e!448225 () Bool)

(declare-fun call!35413 () Bool)

(assert (=> b!809804 (= e!448225 call!35413)))

(declare-fun d!103809 () Bool)

(declare-fun res!553432 () Bool)

(assert (=> d!103809 (=> res!553432 e!448227)))

(assert (=> d!103809 (= res!553432 (bvsge #b00000000000000000000000000000000 (size!21507 a!3170)))))

(assert (=> d!103809 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15085) e!448227)))

(declare-fun b!809805 () Bool)

(declare-fun contains!4111 (List!15088 (_ BitVec 64)) Bool)

(assert (=> b!809805 (= e!448228 (contains!4111 Nil!15085 (select (arr!21086 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35410 () Bool)

(declare-fun c!88596 () Bool)

(assert (=> bm!35410 (= call!35413 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88596 (Cons!15084 (select (arr!21086 a!3170) #b00000000000000000000000000000000) Nil!15085) Nil!15085)))))

(declare-fun b!809806 () Bool)

(assert (=> b!809806 (= e!448226 e!448225)))

(assert (=> b!809806 (= c!88596 (validKeyInArray!0 (select (arr!21086 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809807 () Bool)

(assert (=> b!809807 (= e!448225 call!35413)))

(assert (= (and d!103809 (not res!553432)) b!809803))

(assert (= (and b!809803 res!553433) b!809805))

(assert (= (and b!809803 res!553434) b!809806))

(assert (= (and b!809806 c!88596) b!809804))

(assert (= (and b!809806 (not c!88596)) b!809807))

(assert (= (or b!809804 b!809807) bm!35410))

(declare-fun m!751527 () Bool)

(assert (=> b!809803 m!751527))

(assert (=> b!809803 m!751527))

(declare-fun m!751529 () Bool)

(assert (=> b!809803 m!751529))

(assert (=> b!809805 m!751527))

(assert (=> b!809805 m!751527))

(declare-fun m!751531 () Bool)

(assert (=> b!809805 m!751531))

(assert (=> bm!35410 m!751527))

(declare-fun m!751533 () Bool)

(assert (=> bm!35410 m!751533))

(assert (=> b!809806 m!751527))

(assert (=> b!809806 m!751527))

(assert (=> b!809806 m!751529))

(assert (=> b!809685 d!103809))

(declare-fun b!809820 () Bool)

(declare-fun c!88604 () Bool)

(declare-fun lt!362803 () (_ BitVec 64))

(assert (=> b!809820 (= c!88604 (= lt!362803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448235 () SeekEntryResult!8674)

(declare-fun e!448236 () SeekEntryResult!8674)

(assert (=> b!809820 (= e!448235 e!448236)))

(declare-fun b!809822 () Bool)

(assert (=> b!809822 (= e!448236 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362741 lt!362738 mask!3266))))

(declare-fun b!809823 () Bool)

(declare-fun e!448237 () SeekEntryResult!8674)

(assert (=> b!809823 (= e!448237 e!448235)))

(declare-fun c!88603 () Bool)

(assert (=> b!809823 (= c!88603 (= lt!362803 lt!362741))))

(declare-fun d!103811 () Bool)

(declare-fun lt!362804 () SeekEntryResult!8674)

(assert (=> d!103811 (and (or ((_ is Undefined!8674) lt!362804) (not ((_ is Found!8674) lt!362804)) (and (bvsge (index!37065 lt!362804) #b00000000000000000000000000000000) (bvslt (index!37065 lt!362804) (size!21507 lt!362738)))) (or ((_ is Undefined!8674) lt!362804) ((_ is Found!8674) lt!362804) (not ((_ is MissingVacant!8674) lt!362804)) (not (= (index!37067 lt!362804) vacantAfter!23)) (and (bvsge (index!37067 lt!362804) #b00000000000000000000000000000000) (bvslt (index!37067 lt!362804) (size!21507 lt!362738)))) (or ((_ is Undefined!8674) lt!362804) (ite ((_ is Found!8674) lt!362804) (= (select (arr!21086 lt!362738) (index!37065 lt!362804)) lt!362741) (and ((_ is MissingVacant!8674) lt!362804) (= (index!37067 lt!362804) vacantAfter!23) (= (select (arr!21086 lt!362738) (index!37067 lt!362804)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103811 (= lt!362804 e!448237)))

(declare-fun c!88605 () Bool)

(assert (=> d!103811 (= c!88605 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103811 (= lt!362803 (select (arr!21086 lt!362738) index!1236))))

(assert (=> d!103811 (validMask!0 mask!3266)))

(assert (=> d!103811 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362741 lt!362738 mask!3266) lt!362804)))

(declare-fun b!809821 () Bool)

(assert (=> b!809821 (= e!448235 (Found!8674 index!1236))))

(declare-fun b!809824 () Bool)

(assert (=> b!809824 (= e!448237 Undefined!8674)))

(declare-fun b!809825 () Bool)

(assert (=> b!809825 (= e!448236 (MissingVacant!8674 vacantAfter!23))))

(assert (= (and d!103811 c!88605) b!809824))

(assert (= (and d!103811 (not c!88605)) b!809823))

(assert (= (and b!809823 c!88603) b!809821))

(assert (= (and b!809823 (not c!88603)) b!809820))

(assert (= (and b!809820 c!88604) b!809825))

(assert (= (and b!809820 (not c!88604)) b!809822))

(assert (=> b!809822 m!751419))

(assert (=> b!809822 m!751419))

(declare-fun m!751537 () Bool)

(assert (=> b!809822 m!751537))

(declare-fun m!751539 () Bool)

(assert (=> d!103811 m!751539))

(declare-fun m!751541 () Bool)

(assert (=> d!103811 m!751541))

(declare-fun m!751543 () Bool)

(assert (=> d!103811 m!751543))

(assert (=> d!103811 m!751389))

(assert (=> b!809696 d!103811))

(declare-fun b!809826 () Bool)

(declare-fun e!448238 () SeekEntryResult!8674)

(declare-fun e!448239 () SeekEntryResult!8674)

(assert (=> b!809826 (= e!448238 e!448239)))

(declare-fun lt!362805 () (_ BitVec 64))

(declare-fun lt!362806 () SeekEntryResult!8674)

(assert (=> b!809826 (= lt!362805 (select (arr!21086 lt!362738) (index!37066 lt!362806)))))

(declare-fun c!88606 () Bool)

(assert (=> b!809826 (= c!88606 (= lt!362805 lt!362741))))

(declare-fun b!809827 () Bool)

(declare-fun c!88608 () Bool)

(assert (=> b!809827 (= c!88608 (= lt!362805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448240 () SeekEntryResult!8674)

(assert (=> b!809827 (= e!448239 e!448240)))

(declare-fun b!809828 () Bool)

(assert (=> b!809828 (= e!448240 (MissingZero!8674 (index!37066 lt!362806)))))

(declare-fun d!103823 () Bool)

(declare-fun lt!362807 () SeekEntryResult!8674)

(assert (=> d!103823 (and (or ((_ is Undefined!8674) lt!362807) (not ((_ is Found!8674) lt!362807)) (and (bvsge (index!37065 lt!362807) #b00000000000000000000000000000000) (bvslt (index!37065 lt!362807) (size!21507 lt!362738)))) (or ((_ is Undefined!8674) lt!362807) ((_ is Found!8674) lt!362807) (not ((_ is MissingZero!8674) lt!362807)) (and (bvsge (index!37064 lt!362807) #b00000000000000000000000000000000) (bvslt (index!37064 lt!362807) (size!21507 lt!362738)))) (or ((_ is Undefined!8674) lt!362807) ((_ is Found!8674) lt!362807) ((_ is MissingZero!8674) lt!362807) (not ((_ is MissingVacant!8674) lt!362807)) (and (bvsge (index!37067 lt!362807) #b00000000000000000000000000000000) (bvslt (index!37067 lt!362807) (size!21507 lt!362738)))) (or ((_ is Undefined!8674) lt!362807) (ite ((_ is Found!8674) lt!362807) (= (select (arr!21086 lt!362738) (index!37065 lt!362807)) lt!362741) (ite ((_ is MissingZero!8674) lt!362807) (= (select (arr!21086 lt!362738) (index!37064 lt!362807)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8674) lt!362807) (= (select (arr!21086 lt!362738) (index!37067 lt!362807)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103823 (= lt!362807 e!448238)))

(declare-fun c!88607 () Bool)

(assert (=> d!103823 (= c!88607 (and ((_ is Intermediate!8674) lt!362806) (undefined!9486 lt!362806)))))

(assert (=> d!103823 (= lt!362806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362741 mask!3266) lt!362741 lt!362738 mask!3266))))

(assert (=> d!103823 (validMask!0 mask!3266)))

(assert (=> d!103823 (= (seekEntryOrOpen!0 lt!362741 lt!362738 mask!3266) lt!362807)))

(declare-fun b!809829 () Bool)

(assert (=> b!809829 (= e!448239 (Found!8674 (index!37066 lt!362806)))))

(declare-fun b!809830 () Bool)

(assert (=> b!809830 (= e!448238 Undefined!8674)))

(declare-fun b!809831 () Bool)

(assert (=> b!809831 (= e!448240 (seekKeyOrZeroReturnVacant!0 (x!67883 lt!362806) (index!37066 lt!362806) (index!37066 lt!362806) lt!362741 lt!362738 mask!3266))))

(assert (= (and d!103823 c!88607) b!809830))

(assert (= (and d!103823 (not c!88607)) b!809826))

(assert (= (and b!809826 c!88606) b!809829))

(assert (= (and b!809826 (not c!88606)) b!809827))

(assert (= (and b!809827 c!88608) b!809828))

(assert (= (and b!809827 (not c!88608)) b!809831))

(declare-fun m!751545 () Bool)

(assert (=> b!809826 m!751545))

(declare-fun m!751547 () Bool)

(assert (=> d!103823 m!751547))

(declare-fun m!751549 () Bool)

(assert (=> d!103823 m!751549))

(declare-fun m!751551 () Bool)

(assert (=> d!103823 m!751551))

(assert (=> d!103823 m!751389))

(assert (=> d!103823 m!751549))

(declare-fun m!751553 () Bool)

(assert (=> d!103823 m!751553))

(declare-fun m!751555 () Bool)

(assert (=> d!103823 m!751555))

(declare-fun m!751559 () Bool)

(assert (=> b!809831 m!751559))

(assert (=> b!809696 d!103823))

(declare-fun d!103825 () Bool)

(assert (=> d!103825 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69462 d!103825))

(declare-fun d!103829 () Bool)

(assert (=> d!103829 (= (array_inv!16969 a!3170) (bvsge (size!21507 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69462 d!103829))

(declare-fun bm!35413 () Bool)

(declare-fun call!35416 () Bool)

(assert (=> bm!35413 (= call!35416 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!809876 () Bool)

(declare-fun e!448267 () Bool)

(declare-fun e!448265 () Bool)

(assert (=> b!809876 (= e!448267 e!448265)))

(declare-fun c!88629 () Bool)

(assert (=> b!809876 (= c!88629 (validKeyInArray!0 (select (arr!21086 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!809877 () Bool)

(declare-fun e!448266 () Bool)

(assert (=> b!809877 (= e!448266 call!35416)))

(declare-fun d!103831 () Bool)

(declare-fun res!553440 () Bool)

(assert (=> d!103831 (=> res!553440 e!448267)))

(assert (=> d!103831 (= res!553440 (bvsge #b00000000000000000000000000000000 (size!21507 a!3170)))))

(assert (=> d!103831 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448267)))

(declare-fun b!809878 () Bool)

(assert (=> b!809878 (= e!448265 e!448266)))

(declare-fun lt!362831 () (_ BitVec 64))

(assert (=> b!809878 (= lt!362831 (select (arr!21086 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27590 0))(
  ( (Unit!27591) )
))
(declare-fun lt!362830 () Unit!27590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44026 (_ BitVec 64) (_ BitVec 32)) Unit!27590)

(assert (=> b!809878 (= lt!362830 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!362831 #b00000000000000000000000000000000))))

(assert (=> b!809878 (arrayContainsKey!0 a!3170 lt!362831 #b00000000000000000000000000000000)))

(declare-fun lt!362829 () Unit!27590)

(assert (=> b!809878 (= lt!362829 lt!362830)))

(declare-fun res!553439 () Bool)

(assert (=> b!809878 (= res!553439 (= (seekEntryOrOpen!0 (select (arr!21086 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8674 #b00000000000000000000000000000000)))))

(assert (=> b!809878 (=> (not res!553439) (not e!448266))))

(declare-fun b!809879 () Bool)

(assert (=> b!809879 (= e!448265 call!35416)))

(assert (= (and d!103831 (not res!553440)) b!809876))

(assert (= (and b!809876 c!88629) b!809878))

(assert (= (and b!809876 (not c!88629)) b!809879))

(assert (= (and b!809878 res!553439) b!809877))

(assert (= (or b!809877 b!809879) bm!35413))

(declare-fun m!751581 () Bool)

(assert (=> bm!35413 m!751581))

(assert (=> b!809876 m!751527))

(assert (=> b!809876 m!751527))

(assert (=> b!809876 m!751529))

(assert (=> b!809878 m!751527))

(declare-fun m!751583 () Bool)

(assert (=> b!809878 m!751583))

(declare-fun m!751585 () Bool)

(assert (=> b!809878 m!751585))

(assert (=> b!809878 m!751527))

(declare-fun m!751587 () Bool)

(assert (=> b!809878 m!751587))

(assert (=> b!809688 d!103831))

(declare-fun d!103837 () Bool)

(assert (=> d!103837 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809689 d!103837))

(declare-fun b!809880 () Bool)

(declare-fun c!88631 () Bool)

(declare-fun lt!362832 () (_ BitVec 64))

(assert (=> b!809880 (= c!88631 (= lt!362832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448268 () SeekEntryResult!8674)

(declare-fun e!448269 () SeekEntryResult!8674)

(assert (=> b!809880 (= e!448268 e!448269)))

(declare-fun b!809882 () Bool)

(assert (=> b!809882 (= e!448269 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809883 () Bool)

(declare-fun e!448270 () SeekEntryResult!8674)

(assert (=> b!809883 (= e!448270 e!448268)))

(declare-fun c!88630 () Bool)

(assert (=> b!809883 (= c!88630 (= lt!362832 (select (arr!21086 a!3170) j!153)))))

(declare-fun lt!362833 () SeekEntryResult!8674)

(declare-fun d!103839 () Bool)

(assert (=> d!103839 (and (or ((_ is Undefined!8674) lt!362833) (not ((_ is Found!8674) lt!362833)) (and (bvsge (index!37065 lt!362833) #b00000000000000000000000000000000) (bvslt (index!37065 lt!362833) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362833) ((_ is Found!8674) lt!362833) (not ((_ is MissingVacant!8674) lt!362833)) (not (= (index!37067 lt!362833) vacantBefore!23)) (and (bvsge (index!37067 lt!362833) #b00000000000000000000000000000000) (bvslt (index!37067 lt!362833) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362833) (ite ((_ is Found!8674) lt!362833) (= (select (arr!21086 a!3170) (index!37065 lt!362833)) (select (arr!21086 a!3170) j!153)) (and ((_ is MissingVacant!8674) lt!362833) (= (index!37067 lt!362833) vacantBefore!23) (= (select (arr!21086 a!3170) (index!37067 lt!362833)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103839 (= lt!362833 e!448270)))

(declare-fun c!88632 () Bool)

(assert (=> d!103839 (= c!88632 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!103839 (= lt!362832 (select (arr!21086 a!3170) index!1236))))

(assert (=> d!103839 (validMask!0 mask!3266)))

(assert (=> d!103839 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266) lt!362833)))

(declare-fun b!809881 () Bool)

(assert (=> b!809881 (= e!448268 (Found!8674 index!1236))))

(declare-fun b!809884 () Bool)

(assert (=> b!809884 (= e!448270 Undefined!8674)))

(declare-fun b!809885 () Bool)

(assert (=> b!809885 (= e!448269 (MissingVacant!8674 vacantBefore!23))))

(assert (= (and d!103839 c!88632) b!809884))

(assert (= (and d!103839 (not c!88632)) b!809883))

(assert (= (and b!809883 c!88630) b!809881))

(assert (= (and b!809883 (not c!88630)) b!809880))

(assert (= (and b!809880 c!88631) b!809885))

(assert (= (and b!809880 (not c!88631)) b!809882))

(assert (=> b!809882 m!751419))

(assert (=> b!809882 m!751419))

(assert (=> b!809882 m!751401))

(declare-fun m!751589 () Bool)

(assert (=> b!809882 m!751589))

(declare-fun m!751591 () Bool)

(assert (=> d!103839 m!751591))

(declare-fun m!751593 () Bool)

(assert (=> d!103839 m!751593))

(assert (=> d!103839 m!751409))

(assert (=> d!103839 m!751389))

(assert (=> b!809690 d!103839))

(declare-fun b!809886 () Bool)

(declare-fun e!448271 () SeekEntryResult!8674)

(declare-fun e!448272 () SeekEntryResult!8674)

(assert (=> b!809886 (= e!448271 e!448272)))

(declare-fun lt!362834 () (_ BitVec 64))

(declare-fun lt!362835 () SeekEntryResult!8674)

(assert (=> b!809886 (= lt!362834 (select (arr!21086 a!3170) (index!37066 lt!362835)))))

(declare-fun c!88633 () Bool)

(assert (=> b!809886 (= c!88633 (= lt!362834 (select (arr!21086 a!3170) j!153)))))

(declare-fun b!809887 () Bool)

(declare-fun c!88635 () Bool)

(assert (=> b!809887 (= c!88635 (= lt!362834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448273 () SeekEntryResult!8674)

(assert (=> b!809887 (= e!448272 e!448273)))

(declare-fun b!809888 () Bool)

(assert (=> b!809888 (= e!448273 (MissingZero!8674 (index!37066 lt!362835)))))

(declare-fun d!103841 () Bool)

(declare-fun lt!362836 () SeekEntryResult!8674)

(assert (=> d!103841 (and (or ((_ is Undefined!8674) lt!362836) (not ((_ is Found!8674) lt!362836)) (and (bvsge (index!37065 lt!362836) #b00000000000000000000000000000000) (bvslt (index!37065 lt!362836) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362836) ((_ is Found!8674) lt!362836) (not ((_ is MissingZero!8674) lt!362836)) (and (bvsge (index!37064 lt!362836) #b00000000000000000000000000000000) (bvslt (index!37064 lt!362836) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362836) ((_ is Found!8674) lt!362836) ((_ is MissingZero!8674) lt!362836) (not ((_ is MissingVacant!8674) lt!362836)) (and (bvsge (index!37067 lt!362836) #b00000000000000000000000000000000) (bvslt (index!37067 lt!362836) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362836) (ite ((_ is Found!8674) lt!362836) (= (select (arr!21086 a!3170) (index!37065 lt!362836)) (select (arr!21086 a!3170) j!153)) (ite ((_ is MissingZero!8674) lt!362836) (= (select (arr!21086 a!3170) (index!37064 lt!362836)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8674) lt!362836) (= (select (arr!21086 a!3170) (index!37067 lt!362836)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103841 (= lt!362836 e!448271)))

(declare-fun c!88634 () Bool)

(assert (=> d!103841 (= c!88634 (and ((_ is Intermediate!8674) lt!362835) (undefined!9486 lt!362835)))))

(assert (=> d!103841 (= lt!362835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21086 a!3170) j!153) mask!3266) (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!103841 (validMask!0 mask!3266)))

(assert (=> d!103841 (= (seekEntryOrOpen!0 (select (arr!21086 a!3170) j!153) a!3170 mask!3266) lt!362836)))

(declare-fun b!809889 () Bool)

(assert (=> b!809889 (= e!448272 (Found!8674 (index!37066 lt!362835)))))

(declare-fun b!809890 () Bool)

(assert (=> b!809890 (= e!448271 Undefined!8674)))

(declare-fun b!809891 () Bool)

(assert (=> b!809891 (= e!448273 (seekKeyOrZeroReturnVacant!0 (x!67883 lt!362835) (index!37066 lt!362835) (index!37066 lt!362835) (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and d!103841 c!88634) b!809890))

(assert (= (and d!103841 (not c!88634)) b!809886))

(assert (= (and b!809886 c!88633) b!809889))

(assert (= (and b!809886 (not c!88633)) b!809887))

(assert (= (and b!809887 c!88635) b!809888))

(assert (= (and b!809887 (not c!88635)) b!809891))

(declare-fun m!751595 () Bool)

(assert (=> b!809886 m!751595))

(declare-fun m!751597 () Bool)

(assert (=> d!103841 m!751597))

(declare-fun m!751599 () Bool)

(assert (=> d!103841 m!751599))

(assert (=> d!103841 m!751401))

(declare-fun m!751601 () Bool)

(assert (=> d!103841 m!751601))

(assert (=> d!103841 m!751389))

(assert (=> d!103841 m!751401))

(assert (=> d!103841 m!751599))

(declare-fun m!751603 () Bool)

(assert (=> d!103841 m!751603))

(declare-fun m!751605 () Bool)

(assert (=> d!103841 m!751605))

(assert (=> b!809891 m!751401))

(declare-fun m!751607 () Bool)

(assert (=> b!809891 m!751607))

(assert (=> b!809690 d!103841))

(declare-fun d!103843 () Bool)

(declare-fun lt!362839 () (_ BitVec 32))

(assert (=> d!103843 (and (bvsge lt!362839 #b00000000000000000000000000000000) (bvslt lt!362839 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103843 (= lt!362839 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!103843 (validMask!0 mask!3266)))

(assert (=> d!103843 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!362839)))

(declare-fun bs!22400 () Bool)

(assert (= bs!22400 d!103843))

(declare-fun m!751609 () Bool)

(assert (=> bs!22400 m!751609))

(assert (=> bs!22400 m!751389))

(assert (=> b!809691 d!103843))

(declare-fun d!103845 () Bool)

(declare-fun res!553454 () Bool)

(declare-fun e!448290 () Bool)

(assert (=> d!103845 (=> res!553454 e!448290)))

(assert (=> d!103845 (= res!553454 (= (select (arr!21086 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103845 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448290)))

(declare-fun b!809911 () Bool)

(declare-fun e!448291 () Bool)

(assert (=> b!809911 (= e!448290 e!448291)))

(declare-fun res!553455 () Bool)

(assert (=> b!809911 (=> (not res!553455) (not e!448291))))

(assert (=> b!809911 (= res!553455 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21507 a!3170)))))

(declare-fun b!809912 () Bool)

(assert (=> b!809912 (= e!448291 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103845 (not res!553454)) b!809911))

(assert (= (and b!809911 res!553455) b!809912))

(assert (=> d!103845 m!751527))

(declare-fun m!751619 () Bool)

(assert (=> b!809912 m!751619))

(assert (=> b!809692 d!103845))

(declare-fun b!809913 () Bool)

(declare-fun c!88640 () Bool)

(declare-fun lt!362840 () (_ BitVec 64))

(assert (=> b!809913 (= c!88640 (= lt!362840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448292 () SeekEntryResult!8674)

(declare-fun e!448293 () SeekEntryResult!8674)

(assert (=> b!809913 (= e!448292 e!448293)))

(declare-fun b!809915 () Bool)

(assert (=> b!809915 (= e!448293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!362744 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809916 () Bool)

(declare-fun e!448294 () SeekEntryResult!8674)

(assert (=> b!809916 (= e!448294 e!448292)))

(declare-fun c!88639 () Bool)

(assert (=> b!809916 (= c!88639 (= lt!362840 (select (arr!21086 a!3170) j!153)))))

(declare-fun d!103849 () Bool)

(declare-fun lt!362841 () SeekEntryResult!8674)

(assert (=> d!103849 (and (or ((_ is Undefined!8674) lt!362841) (not ((_ is Found!8674) lt!362841)) (and (bvsge (index!37065 lt!362841) #b00000000000000000000000000000000) (bvslt (index!37065 lt!362841) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362841) ((_ is Found!8674) lt!362841) (not ((_ is MissingVacant!8674) lt!362841)) (not (= (index!37067 lt!362841) vacantBefore!23)) (and (bvsge (index!37067 lt!362841) #b00000000000000000000000000000000) (bvslt (index!37067 lt!362841) (size!21507 a!3170)))) (or ((_ is Undefined!8674) lt!362841) (ite ((_ is Found!8674) lt!362841) (= (select (arr!21086 a!3170) (index!37065 lt!362841)) (select (arr!21086 a!3170) j!153)) (and ((_ is MissingVacant!8674) lt!362841) (= (index!37067 lt!362841) vacantBefore!23) (= (select (arr!21086 a!3170) (index!37067 lt!362841)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103849 (= lt!362841 e!448294)))

(declare-fun c!88641 () Bool)

(assert (=> d!103849 (= c!88641 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!103849 (= lt!362840 (select (arr!21086 a!3170) lt!362744))))

(assert (=> d!103849 (validMask!0 mask!3266)))

(assert (=> d!103849 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362744 vacantBefore!23 (select (arr!21086 a!3170) j!153) a!3170 mask!3266) lt!362841)))

(declare-fun b!809914 () Bool)

(assert (=> b!809914 (= e!448292 (Found!8674 lt!362744))))

(declare-fun b!809917 () Bool)

(assert (=> b!809917 (= e!448294 Undefined!8674)))

(declare-fun b!809918 () Bool)

(assert (=> b!809918 (= e!448293 (MissingVacant!8674 vacantBefore!23))))

(assert (= (and d!103849 c!88641) b!809917))

(assert (= (and d!103849 (not c!88641)) b!809916))

(assert (= (and b!809916 c!88639) b!809914))

(assert (= (and b!809916 (not c!88639)) b!809913))

(assert (= (and b!809913 c!88640) b!809918))

(assert (= (and b!809913 (not c!88640)) b!809915))

(declare-fun m!751621 () Bool)

(assert (=> b!809915 m!751621))

(assert (=> b!809915 m!751621))

(assert (=> b!809915 m!751401))

(declare-fun m!751623 () Bool)

(assert (=> b!809915 m!751623))

(declare-fun m!751625 () Bool)

(assert (=> d!103849 m!751625))

(declare-fun m!751627 () Bool)

(assert (=> d!103849 m!751627))

(declare-fun m!751629 () Bool)

(assert (=> d!103849 m!751629))

(assert (=> d!103849 m!751389))

(assert (=> b!809693 d!103849))

(declare-fun b!809919 () Bool)

(declare-fun c!88643 () Bool)

(declare-fun lt!362842 () (_ BitVec 64))

(assert (=> b!809919 (= c!88643 (= lt!362842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448295 () SeekEntryResult!8674)

(declare-fun e!448296 () SeekEntryResult!8674)

(assert (=> b!809919 (= e!448295 e!448296)))

(declare-fun b!809921 () Bool)

(assert (=> b!809921 (= e!448296 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!362744 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!362741 lt!362738 mask!3266))))

(declare-fun b!809922 () Bool)

(declare-fun e!448297 () SeekEntryResult!8674)

(assert (=> b!809922 (= e!448297 e!448295)))

(declare-fun c!88642 () Bool)

(assert (=> b!809922 (= c!88642 (= lt!362842 lt!362741))))

(declare-fun d!103851 () Bool)

(declare-fun lt!362843 () SeekEntryResult!8674)

(assert (=> d!103851 (and (or ((_ is Undefined!8674) lt!362843) (not ((_ is Found!8674) lt!362843)) (and (bvsge (index!37065 lt!362843) #b00000000000000000000000000000000) (bvslt (index!37065 lt!362843) (size!21507 lt!362738)))) (or ((_ is Undefined!8674) lt!362843) ((_ is Found!8674) lt!362843) (not ((_ is MissingVacant!8674) lt!362843)) (not (= (index!37067 lt!362843) vacantAfter!23)) (and (bvsge (index!37067 lt!362843) #b00000000000000000000000000000000) (bvslt (index!37067 lt!362843) (size!21507 lt!362738)))) (or ((_ is Undefined!8674) lt!362843) (ite ((_ is Found!8674) lt!362843) (= (select (arr!21086 lt!362738) (index!37065 lt!362843)) lt!362741) (and ((_ is MissingVacant!8674) lt!362843) (= (index!37067 lt!362843) vacantAfter!23) (= (select (arr!21086 lt!362738) (index!37067 lt!362843)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!103851 (= lt!362843 e!448297)))

(declare-fun c!88644 () Bool)

(assert (=> d!103851 (= c!88644 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!103851 (= lt!362842 (select (arr!21086 lt!362738) lt!362744))))

(assert (=> d!103851 (validMask!0 mask!3266)))

(assert (=> d!103851 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362744 vacantAfter!23 lt!362741 lt!362738 mask!3266) lt!362843)))

(declare-fun b!809920 () Bool)

(assert (=> b!809920 (= e!448295 (Found!8674 lt!362744))))

(declare-fun b!809923 () Bool)

(assert (=> b!809923 (= e!448297 Undefined!8674)))

(declare-fun b!809924 () Bool)

(assert (=> b!809924 (= e!448296 (MissingVacant!8674 vacantAfter!23))))

(assert (= (and d!103851 c!88644) b!809923))

(assert (= (and d!103851 (not c!88644)) b!809922))

(assert (= (and b!809922 c!88642) b!809920))

(assert (= (and b!809922 (not c!88642)) b!809919))

(assert (= (and b!809919 c!88643) b!809924))

(assert (= (and b!809919 (not c!88643)) b!809921))

(assert (=> b!809921 m!751621))

(assert (=> b!809921 m!751621))

(declare-fun m!751631 () Bool)

(assert (=> b!809921 m!751631))

(declare-fun m!751633 () Bool)

(assert (=> d!103851 m!751633))

(declare-fun m!751635 () Bool)

(assert (=> d!103851 m!751635))

(declare-fun m!751637 () Bool)

(assert (=> d!103851 m!751637))

(assert (=> d!103851 m!751389))

(assert (=> b!809694 d!103851))

(check-sat (not d!103849) (not b!809803) (not b!809805) (not b!809876) (not b!809822) (not d!103843) (not b!809912) (not bm!35410) (not d!103851) (not d!103811) (not b!809831) (not bm!35413) (not d!103807) (not b!809921) (not b!809878) (not b!809792) (not b!809915) (not b!809891) (not d!103841) (not b!809882) (not b!809806) (not d!103823) (not d!103839))
(check-sat)
