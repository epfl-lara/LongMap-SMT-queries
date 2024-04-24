; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135408 () Bool)

(assert start!135408)

(declare-fun res!1075215 () Bool)

(declare-fun e!878291 () Bool)

(assert (=> start!135408 (=> (not res!1075215) (not e!878291))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135408 (= res!1075215 (validMask!0 mask!889))))

(assert (=> start!135408 e!878291))

(assert (=> start!135408 true))

(declare-datatypes ((array!105134 0))(
  ( (array!105135 (arr!50725 (Array (_ BitVec 32) (_ BitVec 64))) (size!51276 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105134)

(declare-fun array_inv!39680 (array!105134) Bool)

(assert (=> start!135408 (array_inv!39680 _keys!600)))

(declare-fun b!1574827 () Bool)

(declare-fun res!1075216 () Bool)

(assert (=> b!1574827 (=> (not res!1075216) (not e!878291))))

(assert (=> b!1574827 (= res!1075216 (= (size!51276 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574828 () Bool)

(declare-fun res!1075217 () Bool)

(assert (=> b!1574828 (=> (not res!1075217) (not e!878291))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574828 (= res!1075217 (validKeyInArray!0 k0!754))))

(declare-fun b!1574829 () Bool)

(declare-datatypes ((SeekEntryResult!13532 0))(
  ( (MissingZero!13532 (index!56526 (_ BitVec 32))) (Found!13532 (index!56527 (_ BitVec 32))) (Intermediate!13532 (undefined!14344 Bool) (index!56528 (_ BitVec 32)) (x!141509 (_ BitVec 32))) (Undefined!13532) (MissingVacant!13532 (index!56529 (_ BitVec 32))) )
))
(declare-fun lt!674877 () SeekEntryResult!13532)

(get-info :version)

(assert (=> b!1574829 (= e!878291 (and ((_ is Intermediate!13532) lt!674877) (not (undefined!14344 lt!674877)) (or (bvslt (index!56528 lt!674877) #b00000000000000000000000000000000) (bvsge (index!56528 lt!674877) (size!51276 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105134 (_ BitVec 32)) SeekEntryResult!13532)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574829 (= lt!674877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135408 res!1075215) b!1574827))

(assert (= (and b!1574827 res!1075216) b!1574828))

(assert (= (and b!1574828 res!1075217) b!1574829))

(declare-fun m!1448415 () Bool)

(assert (=> start!135408 m!1448415))

(declare-fun m!1448417 () Bool)

(assert (=> start!135408 m!1448417))

(declare-fun m!1448419 () Bool)

(assert (=> b!1574828 m!1448419))

(declare-fun m!1448421 () Bool)

(assert (=> b!1574829 m!1448421))

(assert (=> b!1574829 m!1448421))

(declare-fun m!1448423 () Bool)

(assert (=> b!1574829 m!1448423))

(check-sat (not b!1574828) (not b!1574829) (not start!135408))
(check-sat)
(get-model)

(declare-fun d!165483 () Bool)

(assert (=> d!165483 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574828 d!165483))

(declare-fun b!1574884 () Bool)

(declare-fun e!878325 () SeekEntryResult!13532)

(assert (=> b!1574884 (= e!878325 (Intermediate!13532 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1574885 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574885 (= e!878325 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1574886 () Bool)

(declare-fun lt!674892 () SeekEntryResult!13532)

(assert (=> b!1574886 (and (bvsge (index!56528 lt!674892) #b00000000000000000000000000000000) (bvslt (index!56528 lt!674892) (size!51276 _keys!600)))))

(declare-fun e!878328 () Bool)

(assert (=> b!1574886 (= e!878328 (= (select (arr!50725 _keys!600) (index!56528 lt!674892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574887 () Bool)

(declare-fun e!878327 () Bool)

(assert (=> b!1574887 (= e!878327 (bvsge (x!141509 lt!674892) #b01111111111111111111111111111110))))

(declare-fun b!1574888 () Bool)

(declare-fun e!878324 () SeekEntryResult!13532)

(assert (=> b!1574888 (= e!878324 (Intermediate!13532 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1574889 () Bool)

(declare-fun e!878326 () Bool)

(assert (=> b!1574889 (= e!878327 e!878326)))

(declare-fun res!1075249 () Bool)

(assert (=> b!1574889 (= res!1075249 (and ((_ is Intermediate!13532) lt!674892) (not (undefined!14344 lt!674892)) (bvslt (x!141509 lt!674892) #b01111111111111111111111111111110) (bvsge (x!141509 lt!674892) #b00000000000000000000000000000000) (bvsge (x!141509 lt!674892) #b00000000000000000000000000000000)))))

(assert (=> b!1574889 (=> (not res!1075249) (not e!878326))))

(declare-fun d!165485 () Bool)

(assert (=> d!165485 e!878327))

(declare-fun c!146075 () Bool)

(assert (=> d!165485 (= c!146075 (and ((_ is Intermediate!13532) lt!674892) (undefined!14344 lt!674892)))))

(assert (=> d!165485 (= lt!674892 e!878324)))

(declare-fun c!146074 () Bool)

(assert (=> d!165485 (= c!146074 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674893 () (_ BitVec 64))

(assert (=> d!165485 (= lt!674893 (select (arr!50725 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165485 (validMask!0 mask!889)))

(assert (=> d!165485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674892)))

(declare-fun b!1574890 () Bool)

(assert (=> b!1574890 (= e!878324 e!878325)))

(declare-fun c!146073 () Bool)

(assert (=> b!1574890 (= c!146073 (or (= lt!674893 k0!754) (= (bvadd lt!674893 lt!674893) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574891 () Bool)

(assert (=> b!1574891 (and (bvsge (index!56528 lt!674892) #b00000000000000000000000000000000) (bvslt (index!56528 lt!674892) (size!51276 _keys!600)))))

(declare-fun res!1075250 () Bool)

(assert (=> b!1574891 (= res!1075250 (= (select (arr!50725 _keys!600) (index!56528 lt!674892)) k0!754))))

(assert (=> b!1574891 (=> res!1075250 e!878328)))

(assert (=> b!1574891 (= e!878326 e!878328)))

(declare-fun b!1574892 () Bool)

(assert (=> b!1574892 (and (bvsge (index!56528 lt!674892) #b00000000000000000000000000000000) (bvslt (index!56528 lt!674892) (size!51276 _keys!600)))))

(declare-fun res!1075248 () Bool)

(assert (=> b!1574892 (= res!1075248 (= (select (arr!50725 _keys!600) (index!56528 lt!674892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574892 (=> res!1075248 e!878328)))

(assert (= (and d!165485 c!146074) b!1574888))

(assert (= (and d!165485 (not c!146074)) b!1574890))

(assert (= (and b!1574890 c!146073) b!1574884))

(assert (= (and b!1574890 (not c!146073)) b!1574885))

(assert (= (and d!165485 c!146075) b!1574887))

(assert (= (and d!165485 (not c!146075)) b!1574889))

(assert (= (and b!1574889 res!1075249) b!1574891))

(assert (= (and b!1574891 (not res!1075250)) b!1574892))

(assert (= (and b!1574892 (not res!1075248)) b!1574886))

(declare-fun m!1448445 () Bool)

(assert (=> b!1574886 m!1448445))

(assert (=> b!1574885 m!1448421))

(declare-fun m!1448447 () Bool)

(assert (=> b!1574885 m!1448447))

(assert (=> b!1574885 m!1448447))

(declare-fun m!1448449 () Bool)

(assert (=> b!1574885 m!1448449))

(assert (=> b!1574892 m!1448445))

(assert (=> b!1574891 m!1448445))

(assert (=> d!165485 m!1448421))

(declare-fun m!1448451 () Bool)

(assert (=> d!165485 m!1448451))

(assert (=> d!165485 m!1448415))

(assert (=> b!1574829 d!165485))

(declare-fun d!165493 () Bool)

(declare-fun lt!674907 () (_ BitVec 32))

(declare-fun lt!674906 () (_ BitVec 32))

(assert (=> d!165493 (= lt!674907 (bvmul (bvxor lt!674906 (bvlshr lt!674906 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165493 (= lt!674906 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165493 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075251 (let ((h!38269 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141515 (bvmul (bvxor h!38269 (bvlshr h!38269 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141515 (bvlshr x!141515 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075251 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075251 #b00000000000000000000000000000000))))))

(assert (=> d!165493 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674907 (bvlshr lt!674907 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1574829 d!165493))

(declare-fun d!165497 () Bool)

(assert (=> d!165497 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135408 d!165497))

(declare-fun d!165505 () Bool)

(assert (=> d!165505 (= (array_inv!39680 _keys!600) (bvsge (size!51276 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135408 d!165505))

(check-sat (not b!1574885) (not d!165485))
(check-sat)
