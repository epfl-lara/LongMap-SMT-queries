; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136708 () Bool)

(assert start!136708)

(declare-fun res!1078436 () Bool)

(declare-fun e!880408 () Bool)

(assert (=> start!136708 (=> (not res!1078436) (not e!880408))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136708 (= res!1078436 (validMask!0 mask!918))))

(assert (=> start!136708 e!880408))

(assert (=> start!136708 true))

(declare-datatypes ((array!105743 0))(
  ( (array!105744 (arr!50983 (Array (_ BitVec 32) (_ BitVec 64))) (size!51533 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105743)

(declare-fun array_inv!39710 (array!105743) Bool)

(assert (=> start!136708 (array_inv!39710 _keys!614)))

(declare-fun b!1578442 () Bool)

(declare-fun res!1078437 () Bool)

(assert (=> b!1578442 (=> (not res!1078437) (not e!880408))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578442 (= res!1078437 (validKeyInArray!0 k!772))))

(declare-fun b!1578443 () Bool)

(declare-fun res!1078434 () Bool)

(assert (=> b!1578443 (=> (not res!1078434) (not e!880408))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578443 (= res!1078434 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50983 _keys!614) ee!18) k!772)) (not (= (select (arr!50983 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun b!1578444 () Bool)

(declare-datatypes ((SeekEntryResult!13770 0))(
  ( (MissingZero!13770 (index!57478 (_ BitVec 32))) (Found!13770 (index!57479 (_ BitVec 32))) (Intermediate!13770 (undefined!14582 Bool) (index!57480 (_ BitVec 32)) (x!142744 (_ BitVec 32))) (Undefined!13770) (MissingVacant!13770 (index!57481 (_ BitVec 32))) )
))
(declare-fun lt!676264 () SeekEntryResult!13770)

(assert (=> b!1578444 (= e!880408 (and (not (is-Undefined!13770 lt!676264)) (ite (is-Found!13770 lt!676264) (not (= (select (arr!50983 _keys!614) (index!57479 lt!676264)) k!772)) (or (not (is-MissingVacant!13770 lt!676264)) (not (= (index!57481 lt!676264) vacantSpotIndex!10)) (not (= (select (arr!50983 _keys!614) (index!57481 lt!676264)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105743 (_ BitVec 32)) SeekEntryResult!13770)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578444 (= lt!676264 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun b!1578441 () Bool)

(declare-fun res!1078435 () Bool)

(assert (=> b!1578441 (=> (not res!1078435) (not e!880408))))

(assert (=> b!1578441 (= res!1078435 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51533 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50983 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136708 res!1078436) b!1578441))

(assert (= (and b!1578441 res!1078435) b!1578442))

(assert (= (and b!1578442 res!1078437) b!1578443))

(assert (= (and b!1578443 res!1078434) b!1578444))

(declare-fun m!1450537 () Bool)

(assert (=> start!136708 m!1450537))

(declare-fun m!1450539 () Bool)

(assert (=> start!136708 m!1450539))

(declare-fun m!1450541 () Bool)

(assert (=> b!1578441 m!1450541))

(declare-fun m!1450543 () Bool)

(assert (=> b!1578444 m!1450543))

(declare-fun m!1450545 () Bool)

(assert (=> b!1578444 m!1450545))

(declare-fun m!1450547 () Bool)

(assert (=> b!1578444 m!1450547))

(assert (=> b!1578444 m!1450547))

(declare-fun m!1450549 () Bool)

(assert (=> b!1578444 m!1450549))

(declare-fun m!1450551 () Bool)

(assert (=> b!1578442 m!1450551))

(declare-fun m!1450553 () Bool)

(assert (=> b!1578443 m!1450553))

(push 1)

(assert (not start!136708))

(assert (not b!1578444))

(assert (not b!1578442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166079 () Bool)

(assert (=> d!166079 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136708 d!166079))

(declare-fun d!166085 () Bool)

(assert (=> d!166085 (= (array_inv!39710 _keys!614) (bvsge (size!51533 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136708 d!166085))

(declare-fun d!166087 () Bool)

(declare-fun lt!676284 () SeekEntryResult!13770)

(assert (=> d!166087 (and (or (is-Undefined!13770 lt!676284) (not (is-Found!13770 lt!676284)) (and (bvsge (index!57479 lt!676284) #b00000000000000000000000000000000) (bvslt (index!57479 lt!676284) (size!51533 _keys!614)))) (or (is-Undefined!13770 lt!676284) (is-Found!13770 lt!676284) (not (is-MissingVacant!13770 lt!676284)) (not (= (index!57481 lt!676284) vacantSpotIndex!10)) (and (bvsge (index!57481 lt!676284) #b00000000000000000000000000000000) (bvslt (index!57481 lt!676284) (size!51533 _keys!614)))) (or (is-Undefined!13770 lt!676284) (ite (is-Found!13770 lt!676284) (= (select (arr!50983 _keys!614) (index!57479 lt!676284)) k!772) (and (is-MissingVacant!13770 lt!676284) (= (index!57481 lt!676284) vacantSpotIndex!10) (= (select (arr!50983 _keys!614) (index!57481 lt!676284)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!880437 () SeekEntryResult!13770)

(assert (=> d!166087 (= lt!676284 e!880437)))

(declare-fun c!146303 () Bool)

(assert (=> d!166087 (= c!146303 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(declare-fun lt!676285 () (_ BitVec 64))

(assert (=> d!166087 (= lt!676285 (select (arr!50983 _keys!614) (nextIndex!0 ee!18 x!466 mask!918)))))

(assert (=> d!166087 (validMask!0 mask!918)))

(assert (=> d!166087 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918) lt!676284)))

(declare-fun b!1578499 () Bool)

(declare-fun c!146302 () Bool)

