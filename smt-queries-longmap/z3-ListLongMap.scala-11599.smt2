; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135314 () Bool)

(assert start!135314)

(declare-fun b!1573594 () Bool)

(declare-fun res!1075039 () Bool)

(declare-fun e!877513 () Bool)

(assert (=> b!1573594 (=> (not res!1075039) (not e!877513))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573594 (= res!1075039 (validKeyInArray!0 k0!754))))

(declare-fun res!1075040 () Bool)

(assert (=> start!135314 (=> (not res!1075040) (not e!877513))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135314 (= res!1075040 (validMask!0 mask!889))))

(assert (=> start!135314 e!877513))

(assert (=> start!135314 true))

(declare-datatypes ((array!105125 0))(
  ( (array!105126 (arr!50717 (Array (_ BitVec 32) (_ BitVec 64))) (size!51267 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105125)

(declare-fun array_inv!39444 (array!105125) Bool)

(assert (=> start!135314 (array_inv!39444 _keys!600)))

(declare-fun b!1573593 () Bool)

(declare-fun res!1075038 () Bool)

(assert (=> b!1573593 (=> (not res!1075038) (not e!877513))))

(assert (=> b!1573593 (= res!1075038 (= (size!51267 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573595 () Bool)

(declare-fun e!877514 () Bool)

(assert (=> b!1573595 (= e!877513 e!877514)))

(declare-fun res!1075041 () Bool)

(assert (=> b!1573595 (=> (not res!1075041) (not e!877514))))

(declare-fun lt!674487 () Bool)

(declare-datatypes ((SeekEntryResult!13630 0))(
  ( (MissingZero!13630 (index!56918 (_ BitVec 32))) (Found!13630 (index!56919 (_ BitVec 32))) (Intermediate!13630 (undefined!14442 Bool) (index!56920 (_ BitVec 32)) (x!141727 (_ BitVec 32))) (Undefined!13630) (MissingVacant!13630 (index!56921 (_ BitVec 32))) )
))
(declare-fun lt!674486 () SeekEntryResult!13630)

(assert (=> b!1573595 (= res!1075041 (and (or lt!674487 (not (undefined!14442 lt!674486))) (or lt!674487 (undefined!14442 lt!674486))))))

(get-info :version)

(assert (=> b!1573595 (= lt!674487 (not ((_ is Intermediate!13630) lt!674486)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105125 (_ BitVec 32)) SeekEntryResult!13630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573595 (= lt!674486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573596 () Bool)

(declare-fun lt!674488 () SeekEntryResult!13630)

(assert (=> b!1573596 (= e!877514 (and (not ((_ is MissingVacant!13630) lt!674488)) ((_ is Found!13630) lt!674488) (or (bvslt (index!56919 lt!674488) #b00000000000000000000000000000000) (bvsge (index!56919 lt!674488) (size!51267 _keys!600)))))))

(declare-fun err!142 () SeekEntryResult!13630)

(assert (=> b!1573596 (= lt!674488 err!142)))

(assert (=> b!1573596 true))

(assert (= (and start!135314 res!1075040) b!1573593))

(assert (= (and b!1573593 res!1075038) b!1573594))

(assert (= (and b!1573594 res!1075039) b!1573595))

(assert (= (and b!1573595 res!1075041) b!1573596))

(declare-fun m!1446947 () Bool)

(assert (=> b!1573594 m!1446947))

(declare-fun m!1446949 () Bool)

(assert (=> start!135314 m!1446949))

(declare-fun m!1446951 () Bool)

(assert (=> start!135314 m!1446951))

(declare-fun m!1446953 () Bool)

(assert (=> b!1573595 m!1446953))

(assert (=> b!1573595 m!1446953))

(declare-fun m!1446955 () Bool)

(assert (=> b!1573595 m!1446955))

(check-sat (not b!1573595) (not b!1573594) (not start!135314))
(check-sat)
(get-model)

(declare-fun d!165037 () Bool)

(declare-fun e!877551 () Bool)

(assert (=> d!165037 e!877551))

(declare-fun c!145546 () Bool)

(declare-fun lt!674511 () SeekEntryResult!13630)

(assert (=> d!165037 (= c!145546 (and ((_ is Intermediate!13630) lt!674511) (undefined!14442 lt!674511)))))

(declare-fun e!877549 () SeekEntryResult!13630)

(assert (=> d!165037 (= lt!674511 e!877549)))

(declare-fun c!145548 () Bool)

(assert (=> d!165037 (= c!145548 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674510 () (_ BitVec 64))

(assert (=> d!165037 (= lt!674510 (select (arr!50717 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165037 (validMask!0 mask!889)))

(assert (=> d!165037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674511)))

(declare-fun b!1573654 () Bool)

(assert (=> b!1573654 (and (bvsge (index!56920 lt!674511) #b00000000000000000000000000000000) (bvslt (index!56920 lt!674511) (size!51267 _keys!600)))))

(declare-fun e!877550 () Bool)

(assert (=> b!1573654 (= e!877550 (= (select (arr!50717 _keys!600) (index!56920 lt!674511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573655 () Bool)

(assert (=> b!1573655 (and (bvsge (index!56920 lt!674511) #b00000000000000000000000000000000) (bvslt (index!56920 lt!674511) (size!51267 _keys!600)))))

(declare-fun res!1075071 () Bool)

(assert (=> b!1573655 (= res!1075071 (= (select (arr!50717 _keys!600) (index!56920 lt!674511)) k0!754))))

(assert (=> b!1573655 (=> res!1075071 e!877550)))

(declare-fun e!877553 () Bool)

(assert (=> b!1573655 (= e!877553 e!877550)))

(declare-fun b!1573656 () Bool)

(assert (=> b!1573656 (= e!877551 (bvsge (x!141727 lt!674511) #b01111111111111111111111111111110))))

(declare-fun b!1573657 () Bool)

(assert (=> b!1573657 (= e!877549 (Intermediate!13630 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573658 () Bool)

(declare-fun e!877552 () SeekEntryResult!13630)

(assert (=> b!1573658 (= e!877549 e!877552)))

(declare-fun c!145547 () Bool)

(assert (=> b!1573658 (= c!145547 (or (= lt!674510 k0!754) (= (bvadd lt!674510 lt!674510) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573659 () Bool)

(assert (=> b!1573659 (= e!877551 e!877553)))

(declare-fun res!1075070 () Bool)

(assert (=> b!1573659 (= res!1075070 (and ((_ is Intermediate!13630) lt!674511) (not (undefined!14442 lt!674511)) (bvslt (x!141727 lt!674511) #b01111111111111111111111111111110) (bvsge (x!141727 lt!674511) #b00000000000000000000000000000000) (bvsge (x!141727 lt!674511) #b00000000000000000000000000000000)))))

(assert (=> b!1573659 (=> (not res!1075070) (not e!877553))))

(declare-fun b!1573660 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573660 (= e!877552 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573661 () Bool)

(assert (=> b!1573661 (and (bvsge (index!56920 lt!674511) #b00000000000000000000000000000000) (bvslt (index!56920 lt!674511) (size!51267 _keys!600)))))

(declare-fun res!1075072 () Bool)

(assert (=> b!1573661 (= res!1075072 (= (select (arr!50717 _keys!600) (index!56920 lt!674511)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573661 (=> res!1075072 e!877550)))

(declare-fun b!1573662 () Bool)

(assert (=> b!1573662 (= e!877552 (Intermediate!13630 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!165037 c!145548) b!1573657))

(assert (= (and d!165037 (not c!145548)) b!1573658))

(assert (= (and b!1573658 c!145547) b!1573662))

(assert (= (and b!1573658 (not c!145547)) b!1573660))

(assert (= (and d!165037 c!145546) b!1573656))

