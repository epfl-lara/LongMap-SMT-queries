; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135238 () Bool)

(assert start!135238)

(declare-fun b!1573316 () Bool)

(declare-fun e!877352 () Bool)

(declare-fun e!877350 () Bool)

(assert (=> b!1573316 (= e!877352 e!877350)))

(declare-fun res!1074917 () Bool)

(assert (=> b!1573316 (=> (not res!1074917) (not e!877350))))

(declare-datatypes ((SeekEntryResult!13624 0))(
  ( (MissingZero!13624 (index!56894 (_ BitVec 32))) (Found!13624 (index!56895 (_ BitVec 32))) (Intermediate!13624 (undefined!14436 Bool) (index!56896 (_ BitVec 32)) (x!141690 (_ BitVec 32))) (Undefined!13624) (MissingVacant!13624 (index!56897 (_ BitVec 32))) )
))
(declare-fun lt!674356 () SeekEntryResult!13624)

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105107 0))(
  ( (array!105108 (arr!50711 (Array (_ BitVec 32) (_ BitVec 64))) (size!51261 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105107)

(get-info :version)

(assert (=> b!1573316 (= res!1074917 (and (not (undefined!14436 lt!674356)) ((_ is Intermediate!13624) lt!674356) (not (= (select (arr!50711 _keys!600) (index!56896 lt!674356)) k0!754)) (not (= (select (arr!50711 _keys!600) (index!56896 lt!674356)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50711 _keys!600) (index!56896 lt!674356)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56896 lt!674356) #b00000000000000000000000000000000) (bvslt (index!56896 lt!674356) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105107 (_ BitVec 32)) SeekEntryResult!13624)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573316 (= lt!674356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573314 () Bool)

(declare-fun res!1074918 () Bool)

(assert (=> b!1573314 (=> (not res!1074918) (not e!877352))))

(assert (=> b!1573314 (= res!1074918 (= (size!51261 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573315 () Bool)

(declare-fun res!1074916 () Bool)

(assert (=> b!1573315 (=> (not res!1074916) (not e!877352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573315 (= res!1074916 (validKeyInArray!0 k0!754))))

(declare-fun res!1074915 () Bool)

(assert (=> start!135238 (=> (not res!1074915) (not e!877352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135238 (= res!1074915 (validMask!0 mask!889))))

(assert (=> start!135238 e!877352))

(assert (=> start!135238 true))

(declare-fun array_inv!39438 (array!105107) Bool)

(assert (=> start!135238 (array_inv!39438 _keys!600)))

(declare-fun b!1573317 () Bool)

(declare-fun lt!674355 () SeekEntryResult!13624)

(assert (=> b!1573317 (= e!877350 (and (not ((_ is MissingVacant!13624) lt!674355)) ((_ is Found!13624) lt!674355) (not (= (select (arr!50711 _keys!600) (index!56895 lt!674355)) k0!754))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105107 (_ BitVec 32)) SeekEntryResult!13624)

(assert (=> b!1573317 (= lt!674355 (seekKeyOrZeroReturnVacant!0 (x!141690 lt!674356) (index!56896 lt!674356) (index!56896 lt!674356) k0!754 _keys!600 mask!889))))

(assert (= (and start!135238 res!1074915) b!1573314))

(assert (= (and b!1573314 res!1074918) b!1573315))

(assert (= (and b!1573315 res!1074916) b!1573316))

(assert (= (and b!1573316 res!1074917) b!1573317))

(declare-fun m!1446803 () Bool)

(assert (=> b!1573316 m!1446803))

(declare-fun m!1446805 () Bool)

(assert (=> b!1573316 m!1446805))

(assert (=> b!1573316 m!1446805))

(declare-fun m!1446807 () Bool)

(assert (=> b!1573316 m!1446807))

(declare-fun m!1446809 () Bool)

(assert (=> b!1573315 m!1446809))

(declare-fun m!1446811 () Bool)

(assert (=> start!135238 m!1446811))

(declare-fun m!1446813 () Bool)

(assert (=> start!135238 m!1446813))

(declare-fun m!1446815 () Bool)

(assert (=> b!1573317 m!1446815))

(declare-fun m!1446817 () Bool)

(assert (=> b!1573317 m!1446817))

(check-sat (not b!1573317) (not b!1573316) (not start!135238) (not b!1573315))
(check-sat)
(get-model)

(declare-fun b!1573354 () Bool)

(declare-fun c!145464 () Bool)

(declare-fun lt!674371 () (_ BitVec 64))

(assert (=> b!1573354 (= c!145464 (= lt!674371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877374 () SeekEntryResult!13624)

(declare-fun e!877375 () SeekEntryResult!13624)

(assert (=> b!1573354 (= e!877374 e!877375)))

(declare-fun d!164969 () Bool)

(declare-fun lt!674372 () SeekEntryResult!13624)

(assert (=> d!164969 (and (or ((_ is Undefined!13624) lt!674372) (not ((_ is Found!13624) lt!674372)) (and (bvsge (index!56895 lt!674372) #b00000000000000000000000000000000) (bvslt (index!56895 lt!674372) (size!51261 _keys!600)))) (or ((_ is Undefined!13624) lt!674372) ((_ is Found!13624) lt!674372) (not ((_ is MissingVacant!13624) lt!674372)) (not (= (index!56897 lt!674372) (index!56896 lt!674356))) (and (bvsge (index!56897 lt!674372) #b00000000000000000000000000000000) (bvslt (index!56897 lt!674372) (size!51261 _keys!600)))) (or ((_ is Undefined!13624) lt!674372) (ite ((_ is Found!13624) lt!674372) (= (select (arr!50711 _keys!600) (index!56895 lt!674372)) k0!754) (and ((_ is MissingVacant!13624) lt!674372) (= (index!56897 lt!674372) (index!56896 lt!674356)) (= (select (arr!50711 _keys!600) (index!56897 lt!674372)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!877376 () SeekEntryResult!13624)

(assert (=> d!164969 (= lt!674372 e!877376)))

(declare-fun c!145462 () Bool)

(assert (=> d!164969 (= c!145462 (bvsge (x!141690 lt!674356) #b01111111111111111111111111111110))))

(assert (=> d!164969 (= lt!674371 (select (arr!50711 _keys!600) (index!56896 lt!674356)))))

(assert (=> d!164969 (validMask!0 mask!889)))

(assert (=> d!164969 (= (seekKeyOrZeroReturnVacant!0 (x!141690 lt!674356) (index!56896 lt!674356) (index!56896 lt!674356) k0!754 _keys!600 mask!889) lt!674372)))

(declare-fun b!1573355 () Bool)

(assert (=> b!1573355 (= e!877375 (MissingVacant!13624 (index!56896 lt!674356)))))

(declare-fun b!1573356 () Bool)

(assert (=> b!1573356 (= e!877374 (Found!13624 (index!56896 lt!674356)))))

(declare-fun b!1573357 () Bool)

(assert (=> b!1573357 (= e!877376 e!877374)))

(declare-fun c!145463 () Bool)

(assert (=> b!1573357 (= c!145463 (= lt!674371 k0!754))))

(declare-fun b!1573358 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573358 (= e!877375 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141690 lt!674356) #b00000000000000000000000000000001) (nextIndex!0 (index!56896 lt!674356) (x!141690 lt!674356) mask!889) (index!56896 lt!674356) k0!754 _keys!600 mask!889))))

(declare-fun b!1573359 () Bool)

(assert (=> b!1573359 (= e!877376 Undefined!13624)))

(assert (= (and d!164969 c!145462) b!1573359))

(assert (= (and d!164969 (not c!145462)) b!1573357))

(assert (= (and b!1573357 c!145463) b!1573356))

(assert (= (and b!1573357 (not c!145463)) b!1573354))

(assert (= (and b!1573354 c!145464) b!1573355))

(assert (= (and b!1573354 (not c!145464)) b!1573358))

(declare-fun m!1446835 () Bool)

(assert (=> d!164969 m!1446835))

(declare-fun m!1446837 () Bool)

(assert (=> d!164969 m!1446837))

(assert (=> d!164969 m!1446803))

(assert (=> d!164969 m!1446811))

(declare-fun m!1446839 () Bool)

(assert (=> b!1573358 m!1446839))

(assert (=> b!1573358 m!1446839))

(declare-fun m!1446841 () Bool)

(assert (=> b!1573358 m!1446841))

(assert (=> b!1573317 d!164969))

(declare-fun b!1573429 () Bool)

(declare-fun lt!674398 () SeekEntryResult!13624)

(assert (=> b!1573429 (and (bvsge (index!56896 lt!674398) #b00000000000000000000000000000000) (bvslt (index!56896 lt!674398) (size!51261 _keys!600)))))

(declare-fun res!1074949 () Bool)

(assert (=> b!1573429 (= res!1074949 (= (select (arr!50711 _keys!600) (index!56896 lt!674398)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877416 () Bool)

(assert (=> b!1573429 (=> res!1074949 e!877416)))

(declare-fun b!1573430 () Bool)

(declare-fun e!877417 () SeekEntryResult!13624)

(assert (=> b!1573430 (= e!877417 (Intermediate!13624 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573431 () Bool)

(assert (=> b!1573431 (and (bvsge (index!56896 lt!674398) #b00000000000000000000000000000000) (bvslt (index!56896 lt!674398) (size!51261 _keys!600)))))

(assert (=> b!1573431 (= e!877416 (= (select (arr!50711 _keys!600) (index!56896 lt!674398)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573432 () Bool)

(declare-fun e!877415 () Bool)

(declare-fun e!877418 () Bool)

(assert (=> b!1573432 (= e!877415 e!877418)))

(declare-fun res!1074948 () Bool)

(assert (=> b!1573432 (= res!1074948 (and ((_ is Intermediate!13624) lt!674398) (not (undefined!14436 lt!674398)) (bvslt (x!141690 lt!674398) #b01111111111111111111111111111110) (bvsge (x!141690 lt!674398) #b00000000000000000000000000000000) (bvsge (x!141690 lt!674398) #b00000000000000000000000000000000)))))

(assert (=> b!1573432 (=> (not res!1074948) (not e!877418))))

(declare-fun b!1573433 () Bool)

(declare-fun e!877414 () SeekEntryResult!13624)

(assert (=> b!1573433 (= e!877414 e!877417)))

(declare-fun c!145494 () Bool)

(declare-fun lt!674397 () (_ BitVec 64))

(assert (=> b!1573433 (= c!145494 (or (= lt!674397 k0!754) (= (bvadd lt!674397 lt!674397) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!164975 () Bool)

(assert (=> d!164975 e!877415))

(declare-fun c!145493 () Bool)

(assert (=> d!164975 (= c!145493 (and ((_ is Intermediate!13624) lt!674398) (undefined!14436 lt!674398)))))

(assert (=> d!164975 (= lt!674398 e!877414)))

(declare-fun c!145492 () Bool)

(assert (=> d!164975 (= c!145492 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164975 (= lt!674397 (select (arr!50711 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164975 (validMask!0 mask!889)))

(assert (=> d!164975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674398)))

(declare-fun b!1573434 () Bool)

(assert (=> b!1573434 (= e!877415 (bvsge (x!141690 lt!674398) #b01111111111111111111111111111110))))

(declare-fun b!1573435 () Bool)

(assert (=> b!1573435 (= e!877417 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

