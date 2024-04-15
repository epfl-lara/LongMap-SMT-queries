; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135336 () Bool)

(assert start!135336)

(declare-fun b!1573502 () Bool)

(declare-fun res!1075031 () Bool)

(declare-fun e!877449 () Bool)

(assert (=> b!1573502 (=> (not res!1075031) (not e!877449))))

(declare-datatypes ((array!105069 0))(
  ( (array!105070 (arr!50687 (Array (_ BitVec 32) (_ BitVec 64))) (size!51239 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105069)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1573502 (= res!1075031 (= (size!51239 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573503 () Bool)

(declare-fun res!1075030 () Bool)

(assert (=> b!1573503 (=> (not res!1075030) (not e!877449))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573503 (= res!1075030 (validKeyInArray!0 k0!754))))

(declare-fun e!877451 () Bool)

(declare-datatypes ((SeekEntryResult!13635 0))(
  ( (MissingZero!13635 (index!56938 (_ BitVec 32))) (Found!13635 (index!56939 (_ BitVec 32))) (Intermediate!13635 (undefined!14447 Bool) (index!56940 (_ BitVec 32)) (x!141755 (_ BitVec 32))) (Undefined!13635) (MissingVacant!13635 (index!56941 (_ BitVec 32))) )
))
(declare-fun lt!674319 () SeekEntryResult!13635)

(declare-fun b!1573505 () Bool)

(get-info :version)

(assert (=> b!1573505 (= e!877451 (or ((_ is MissingVacant!13635) lt!674319) (and ((_ is Found!13635) lt!674319) (not (= (select (arr!50687 _keys!600) (index!56939 lt!674319)) k0!754)))))))

(declare-fun err!162 () SeekEntryResult!13635)

(assert (=> b!1573505 (= lt!674319 err!162)))

(assert (=> b!1573505 true))

(declare-fun b!1573504 () Bool)

(assert (=> b!1573504 (= e!877449 e!877451)))

(declare-fun res!1075032 () Bool)

(assert (=> b!1573504 (=> (not res!1075032) (not e!877451))))

(declare-fun lt!674317 () Bool)

(declare-fun lt!674318 () SeekEntryResult!13635)

(assert (=> b!1573504 (= res!1075032 (and (or lt!674317 (not (undefined!14447 lt!674318))) (or lt!674317 (undefined!14447 lt!674318))))))

(assert (=> b!1573504 (= lt!674317 (not ((_ is Intermediate!13635) lt!674318)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105069 (_ BitVec 32)) SeekEntryResult!13635)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573504 (= lt!674318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun res!1075029 () Bool)

(assert (=> start!135336 (=> (not res!1075029) (not e!877449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135336 (= res!1075029 (validMask!0 mask!889))))

(assert (=> start!135336 e!877449))

(assert (=> start!135336 true))

(declare-fun array_inv!39623 (array!105069) Bool)

(assert (=> start!135336 (array_inv!39623 _keys!600)))

(assert (= (and start!135336 res!1075029) b!1573502))

(assert (= (and b!1573502 res!1075031) b!1573503))

(assert (= (and b!1573503 res!1075030) b!1573504))

(assert (= (and b!1573504 res!1075032) b!1573505))

(declare-fun m!1446153 () Bool)

(assert (=> b!1573503 m!1446153))

(declare-fun m!1446155 () Bool)

(assert (=> b!1573505 m!1446155))

(declare-fun m!1446157 () Bool)

(assert (=> b!1573504 m!1446157))

(assert (=> b!1573504 m!1446157))

(declare-fun m!1446159 () Bool)

(assert (=> b!1573504 m!1446159))

(declare-fun m!1446161 () Bool)

(assert (=> start!135336 m!1446161))

(declare-fun m!1446163 () Bool)

(assert (=> start!135336 m!1446163))

(check-sat (not b!1573503) (not start!135336) (not b!1573504))
(check-sat)
(get-model)

(declare-fun d!164849 () Bool)

(assert (=> d!164849 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573503 d!164849))

(declare-fun d!164851 () Bool)

(assert (=> d!164851 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135336 d!164851))

(declare-fun d!164855 () Bool)

(assert (=> d!164855 (= (array_inv!39623 _keys!600) (bvsge (size!51239 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135336 d!164855))

(declare-fun b!1573593 () Bool)

(declare-fun lt!674352 () SeekEntryResult!13635)

(assert (=> b!1573593 (and (bvsge (index!56940 lt!674352) #b00000000000000000000000000000000) (bvslt (index!56940 lt!674352) (size!51239 _keys!600)))))

(declare-fun e!877506 () Bool)

(assert (=> b!1573593 (= e!877506 (= (select (arr!50687 _keys!600) (index!56940 lt!674352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573594 () Bool)

(declare-fun e!877505 () Bool)

(assert (=> b!1573594 (= e!877505 (bvsge (x!141755 lt!674352) #b01111111111111111111111111111110))))

(declare-fun b!1573595 () Bool)

(declare-fun e!877507 () Bool)

(assert (=> b!1573595 (= e!877505 e!877507)))

(declare-fun res!1075081 () Bool)

(assert (=> b!1573595 (= res!1075081 (and ((_ is Intermediate!13635) lt!674352) (not (undefined!14447 lt!674352)) (bvslt (x!141755 lt!674352) #b01111111111111111111111111111110) (bvsge (x!141755 lt!674352) #b00000000000000000000000000000000) (bvsge (x!141755 lt!674352) #b00000000000000000000000000000000)))))

(assert (=> b!1573595 (=> (not res!1075081) (not e!877507))))

(declare-fun e!877508 () SeekEntryResult!13635)

(declare-fun b!1573596 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573596 (= e!877508 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573597 () Bool)

(assert (=> b!1573597 (and (bvsge (index!56940 lt!674352) #b00000000000000000000000000000000) (bvslt (index!56940 lt!674352) (size!51239 _keys!600)))))

(declare-fun res!1075079 () Bool)

(assert (=> b!1573597 (= res!1075079 (= (select (arr!50687 _keys!600) (index!56940 lt!674352)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1573597 (=> res!1075079 e!877506)))

(declare-fun b!1573598 () Bool)

(declare-fun e!877509 () SeekEntryResult!13635)

(assert (=> b!1573598 (= e!877509 e!877508)))

(declare-fun c!145518 () Bool)

(declare-fun lt!674353 () (_ BitVec 64))

(assert (=> b!1573598 (= c!145518 (or (= lt!674353 k0!754) (= (bvadd lt!674353 lt!674353) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1573599 () Bool)

(assert (=> b!1573599 (and (bvsge (index!56940 lt!674352) #b00000000000000000000000000000000) (bvslt (index!56940 lt!674352) (size!51239 _keys!600)))))

(declare-fun res!1075080 () Bool)

(assert (=> b!1573599 (= res!1075080 (= (select (arr!50687 _keys!600) (index!56940 lt!674352)) k0!754))))

(assert (=> b!1573599 (=> res!1075080 e!877506)))

(assert (=> b!1573599 (= e!877507 e!877506)))

(declare-fun b!1573600 () Bool)

(assert (=> b!1573600 (= e!877509 (Intermediate!13635 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!164857 () Bool)

(assert (=> d!164857 e!877505))

(declare-fun c!145517 () Bool)

(assert (=> d!164857 (= c!145517 (and ((_ is Intermediate!13635) lt!674352) (undefined!14447 lt!674352)))))

(assert (=> d!164857 (= lt!674352 e!877509)))

(declare-fun c!145519 () Bool)

(assert (=> d!164857 (= c!145519 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164857 (= lt!674353 (select (arr!50687 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164857 (validMask!0 mask!889)))

(assert (=> d!164857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674352)))

(declare-fun b!1573601 () Bool)

(assert (=> b!1573601 (= e!877508 (Intermediate!13635 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!164857 c!145519) b!1573600))

(assert (= (and d!164857 (not c!145519)) b!1573598))

(assert (= (and b!1573598 c!145518) b!1573601))

(assert (= (and b!1573598 (not c!145518)) b!1573596))

(assert (= (and d!164857 c!145517) b!1573594))

(assert (= (and d!164857 (not c!145517)) b!1573595))

(assert (= (and b!1573595 res!1075081) b!1573599))

(assert (= (and b!1573599 (not res!1075080)) b!1573597))

(assert (= (and b!1573597 (not res!1075079)) b!1573593))

(assert (=> d!164857 m!1446157))

(declare-fun m!1446197 () Bool)

(assert (=> d!164857 m!1446197))

(assert (=> d!164857 m!1446161))

(declare-fun m!1446199 () Bool)

(assert (=> b!1573599 m!1446199))

(assert (=> b!1573596 m!1446157))

(declare-fun m!1446201 () Bool)

(assert (=> b!1573596 m!1446201))

(assert (=> b!1573596 m!1446201))

(declare-fun m!1446203 () Bool)

(assert (=> b!1573596 m!1446203))

(assert (=> b!1573593 m!1446199))

(assert (=> b!1573597 m!1446199))

(assert (=> b!1573504 d!164857))

(declare-fun d!164863 () Bool)

(declare-fun lt!674367 () (_ BitVec 32))

(declare-fun lt!674366 () (_ BitVec 32))

(assert (=> d!164863 (= lt!674367 (bvmul (bvxor lt!674366 (bvlshr lt!674366 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164863 (= lt!674366 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164863 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075082 (let ((h!38289 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141762 (bvmul (bvxor h!38289 (bvlshr h!38289 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141762 (bvlshr x!141762 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075082 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075082 #b00000000000000000000000000000000))))))

(assert (=> d!164863 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674367 (bvlshr lt!674367 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1573504 d!164863))

(check-sat (not d!164857) (not b!1573596))
(check-sat)
