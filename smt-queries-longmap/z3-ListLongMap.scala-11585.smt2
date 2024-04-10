; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135034 () Bool)

(assert start!135034)

(declare-fun res!1074423 () Bool)

(declare-fun e!876850 () Bool)

(assert (=> start!135034 (=> (not res!1074423) (not e!876850))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135034 (= res!1074423 (validMask!0 mask!889))))

(assert (=> start!135034 e!876850))

(assert (=> start!135034 true))

(declare-datatypes ((array!105023 0))(
  ( (array!105024 (arr!50675 (Array (_ BitVec 32) (_ BitVec 64))) (size!51225 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105023)

(declare-fun array_inv!39402 (array!105023) Bool)

(assert (=> start!135034 (array_inv!39402 _keys!600)))

(declare-fun b!1572508 () Bool)

(declare-fun res!1074421 () Bool)

(assert (=> b!1572508 (=> (not res!1074421) (not e!876850))))

(assert (=> b!1572508 (= res!1074421 (= (size!51225 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572509 () Bool)

(declare-fun res!1074422 () Bool)

(assert (=> b!1572509 (=> (not res!1074422) (not e!876850))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572509 (= res!1074422 (validKeyInArray!0 k0!754))))

(declare-datatypes ((SeekEntryResult!13588 0))(
  ( (MissingZero!13588 (index!56750 (_ BitVec 32))) (Found!13588 (index!56751 (_ BitVec 32))) (Intermediate!13588 (undefined!14400 Bool) (index!56752 (_ BitVec 32)) (x!141528 (_ BitVec 32))) (Undefined!13588) (MissingVacant!13588 (index!56753 (_ BitVec 32))) )
))
(declare-fun lt!674017 () SeekEntryResult!13588)

(declare-fun b!1572510 () Bool)

(get-info :version)

(assert (=> b!1572510 (= e!876850 (and ((_ is Intermediate!13588) lt!674017) (not (undefined!14400 lt!674017)) (= (select (arr!50675 _keys!600) (index!56752 lt!674017)) k0!754) (or (bvslt (index!56752 lt!674017) #b00000000000000000000000000000000) (bvsge (index!56752 lt!674017) (size!51225 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105023 (_ BitVec 32)) SeekEntryResult!13588)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572510 (= lt!674017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135034 res!1074423) b!1572508))

(assert (= (and b!1572508 res!1074421) b!1572509))

(assert (= (and b!1572509 res!1074422) b!1572510))

(declare-fun m!1446223 () Bool)

(assert (=> start!135034 m!1446223))

(declare-fun m!1446225 () Bool)

(assert (=> start!135034 m!1446225))

(declare-fun m!1446227 () Bool)

(assert (=> b!1572509 m!1446227))

(declare-fun m!1446229 () Bool)

(assert (=> b!1572510 m!1446229))

(declare-fun m!1446231 () Bool)

(assert (=> b!1572510 m!1446231))

(assert (=> b!1572510 m!1446231))

(declare-fun m!1446233 () Bool)

(assert (=> b!1572510 m!1446233))

(check-sat (not b!1572509) (not b!1572510) (not start!135034))
(check-sat)
(get-model)

(declare-fun d!164813 () Bool)

(assert (=> d!164813 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572509 d!164813))

(declare-fun b!1572552 () Bool)

(declare-fun e!876881 () SeekEntryResult!13588)

(assert (=> b!1572552 (= e!876881 (Intermediate!13588 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572553 () Bool)

(declare-fun lt!674029 () SeekEntryResult!13588)

(assert (=> b!1572553 (and (bvsge (index!56752 lt!674029) #b00000000000000000000000000000000) (bvslt (index!56752 lt!674029) (size!51225 _keys!600)))))

(declare-fun res!1074443 () Bool)

(assert (=> b!1572553 (= res!1074443 (= (select (arr!50675 _keys!600) (index!56752 lt!674029)) k0!754))))

(declare-fun e!876880 () Bool)

(assert (=> b!1572553 (=> res!1074443 e!876880)))

(declare-fun e!876879 () Bool)

(assert (=> b!1572553 (= e!876879 e!876880)))

(declare-fun b!1572554 () Bool)

(declare-fun e!876878 () SeekEntryResult!13588)

(assert (=> b!1572554 (= e!876878 (Intermediate!13588 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164815 () Bool)

(declare-fun e!876882 () Bool)

(assert (=> d!164815 e!876882))

(declare-fun c!145302 () Bool)

(assert (=> d!164815 (= c!145302 (and ((_ is Intermediate!13588) lt!674029) (undefined!14400 lt!674029)))))

(assert (=> d!164815 (= lt!674029 e!876881)))

(declare-fun c!145301 () Bool)

(assert (=> d!164815 (= c!145301 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674030 () (_ BitVec 64))

(assert (=> d!164815 (= lt!674030 (select (arr!50675 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164815 (validMask!0 mask!889)))

(assert (=> d!164815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674029)))

(declare-fun b!1572555 () Bool)

(assert (=> b!1572555 (= e!876882 (bvsge (x!141528 lt!674029) #b01111111111111111111111111111110))))

(declare-fun b!1572556 () Bool)

(assert (=> b!1572556 (= e!876881 e!876878)))

(declare-fun c!145300 () Bool)

(assert (=> b!1572556 (= c!145300 (or (= lt!674030 k0!754) (= (bvadd lt!674030 lt!674030) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572557 () Bool)

(assert (=> b!1572557 (and (bvsge (index!56752 lt!674029) #b00000000000000000000000000000000) (bvslt (index!56752 lt!674029) (size!51225 _keys!600)))))

(assert (=> b!1572557 (= e!876880 (= (select (arr!50675 _keys!600) (index!56752 lt!674029)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572558 () Bool)

(assert (=> b!1572558 (= e!876882 e!876879)))

(declare-fun res!1074445 () Bool)

(assert (=> b!1572558 (= res!1074445 (and ((_ is Intermediate!13588) lt!674029) (not (undefined!14400 lt!674029)) (bvslt (x!141528 lt!674029) #b01111111111111111111111111111110) (bvsge (x!141528 lt!674029) #b00000000000000000000000000000000) (bvsge (x!141528 lt!674029) #b00000000000000000000000000000000)))))

(assert (=> b!1572558 (=> (not res!1074445) (not e!876879))))

(declare-fun b!1572559 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572559 (= e!876878 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572560 () Bool)

(assert (=> b!1572560 (and (bvsge (index!56752 lt!674029) #b00000000000000000000000000000000) (bvslt (index!56752 lt!674029) (size!51225 _keys!600)))))

(declare-fun res!1074444 () Bool)

(assert (=> b!1572560 (= res!1074444 (= (select (arr!50675 _keys!600) (index!56752 lt!674029)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572560 (=> res!1074444 e!876880)))

(assert (= (and d!164815 c!145301) b!1572552))

(assert (= (and d!164815 (not c!145301)) b!1572556))

(assert (= (and b!1572556 c!145300) b!1572554))

(assert (= (and b!1572556 (not c!145300)) b!1572559))

(assert (= (and d!164815 c!145302) b!1572555))

(assert (= (and d!164815 (not c!145302)) b!1572558))

(assert (= (and b!1572558 res!1074445) b!1572553))

(assert (= (and b!1572553 (not res!1074443)) b!1572560))

(assert (= (and b!1572560 (not res!1074444)) b!1572557))

(declare-fun m!1446247 () Bool)

(assert (=> b!1572557 m!1446247))

(assert (=> b!1572559 m!1446231))

(declare-fun m!1446249 () Bool)

(assert (=> b!1572559 m!1446249))

(assert (=> b!1572559 m!1446249))

(declare-fun m!1446251 () Bool)

(assert (=> b!1572559 m!1446251))

(assert (=> b!1572560 m!1446247))

(assert (=> d!164815 m!1446231))

(declare-fun m!1446253 () Bool)

(assert (=> d!164815 m!1446253))

(assert (=> d!164815 m!1446223))

(assert (=> b!1572553 m!1446247))

(assert (=> b!1572510 d!164815))

(declare-fun d!164823 () Bool)

(declare-fun lt!674042 () (_ BitVec 32))

(declare-fun lt!674041 () (_ BitVec 32))

(assert (=> d!164823 (= lt!674042 (bvmul (bvxor lt!674041 (bvlshr lt!674041 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164823 (= lt!674041 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164823 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074448 (let ((h!38222 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141532 (bvmul (bvxor h!38222 (bvlshr h!38222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141532 (bvlshr x!141532 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074448 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074448 #b00000000000000000000000000000000))))))

(assert (=> d!164823 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674042 (bvlshr lt!674042 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572510 d!164823))

(declare-fun d!164827 () Bool)

(assert (=> d!164827 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135034 d!164827))

(declare-fun d!164835 () Bool)

(assert (=> d!164835 (= (array_inv!39402 _keys!600) (bvsge (size!51225 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135034 d!164835))

(check-sat (not d!164815) (not b!1572559))
(check-sat)
