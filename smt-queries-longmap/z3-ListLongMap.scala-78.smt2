; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1044 () Bool)

(assert start!1044)

(declare-fun b_free!373 () Bool)

(declare-fun b_next!373 () Bool)

(assert (=> start!1044 (= b_free!373 (not b_next!373))))

(declare-fun tp!1357 () Bool)

(declare-fun b_and!525 () Bool)

(assert (=> start!1044 (= tp!1357 b_and!525)))

(declare-fun res!8402 () Bool)

(declare-fun e!5271 () Bool)

(assert (=> start!1044 (=> (not res!8402) (not e!5271))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1044 (= res!8402 (validMask!0 mask!2250))))

(assert (=> start!1044 e!5271))

(assert (=> start!1044 tp!1357))

(assert (=> start!1044 true))

(declare-datatypes ((V!779 0))(
  ( (V!780 (val!231 Int)) )
))
(declare-datatypes ((ValueCell!209 0))(
  ( (ValueCellFull!209 (v!1325 V!779)) (EmptyCell!209) )
))
(declare-datatypes ((array!817 0))(
  ( (array!818 (arr!394 (Array (_ BitVec 32) ValueCell!209)) (size!456 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!817)

(declare-fun e!5273 () Bool)

(declare-fun array_inv!293 (array!817) Bool)

(assert (=> start!1044 (and (array_inv!293 _values!1492) e!5273)))

(declare-fun tp_is_empty!451 () Bool)

(assert (=> start!1044 tp_is_empty!451))

(declare-datatypes ((array!819 0))(
  ( (array!820 (arr!395 (Array (_ BitVec 32) (_ BitVec 64))) (size!457 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!819)

(declare-fun array_inv!294 (array!819) Bool)

(assert (=> start!1044 (array_inv!294 _keys!1806)))

(declare-fun b!9233 () Bool)

(declare-fun res!8407 () Bool)

(assert (=> b!9233 (=> (not res!8407) (not e!5271))))

(declare-datatypes ((List!277 0))(
  ( (Nil!274) (Cons!273 (h!839 (_ BitVec 64)) (t!2418 List!277)) )
))
(declare-fun arrayNoDuplicates!0 (array!819 (_ BitVec 32) List!277) Bool)

(assert (=> b!9233 (= res!8407 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!274))))

(declare-fun b!9234 () Bool)

(declare-fun res!8404 () Bool)

(assert (=> b!9234 (=> (not res!8404) (not e!5271))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9234 (= res!8404 (validKeyInArray!0 k0!1278))))

(declare-fun b!9235 () Bool)

(declare-fun e!5269 () Bool)

(assert (=> b!9235 (= e!5271 (not e!5269))))

(declare-fun res!8406 () Bool)

(assert (=> b!9235 (=> res!8406 e!5269)))

(declare-fun arrayContainsKey!0 (array!819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9235 (= res!8406 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!5270 () Bool)

(assert (=> b!9235 e!5270))

(declare-fun c!707 () Bool)

(assert (=> b!9235 (= c!707 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((Unit!199 0))(
  ( (Unit!200) )
))
(declare-fun lt!2007 () Unit!199)

(declare-fun minValue!1434 () V!779)

(declare-fun zeroValue!1434 () V!779)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun lemmaKeyInListMapIsInArray!77 (array!819 array!817 (_ BitVec 32) (_ BitVec 32) V!779 V!779 (_ BitVec 64) Int) Unit!199)

(assert (=> b!9235 (= lt!2007 (lemmaKeyInListMapIsInArray!77 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!9236 () Bool)

(declare-fun res!8401 () Bool)

(assert (=> b!9236 (=> (not res!8401) (not e!5271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!819 (_ BitVec 32)) Bool)

(assert (=> b!9236 (= res!8401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9237 () Bool)

(declare-fun e!5275 () Bool)

(assert (=> b!9237 (= e!5269 e!5275)))

(declare-fun res!8403 () Bool)

(assert (=> b!9237 (=> res!8403 e!5275)))

(assert (=> b!9237 (= res!8403 (not (= (size!457 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!2005 () (_ BitVec 32))

(assert (=> b!9237 (arrayForallSeekEntryOrOpenFound!0 lt!2005 _keys!1806 mask!2250)))

(declare-fun lt!2006 () Unit!199)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!199)

(assert (=> b!9237 (= lt!2006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2005))))

(declare-fun arrayScanForKey!0 (array!819 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9237 (= lt!2005 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9238 () Bool)

(declare-fun res!8405 () Bool)

(assert (=> b!9238 (=> (not res!8405) (not e!5271))))

(assert (=> b!9238 (= res!8405 (and (= (size!456 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!457 _keys!1806) (size!456 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9239 () Bool)

(declare-fun e!5274 () Bool)

(assert (=> b!9239 (= e!5274 tp_is_empty!451)))

(declare-fun b!9240 () Bool)

(declare-fun e!5272 () Bool)

(assert (=> b!9240 (= e!5272 tp_is_empty!451)))

(declare-fun b!9241 () Bool)

(declare-fun res!8400 () Bool)

(assert (=> b!9241 (=> (not res!8400) (not e!5271))))

(declare-datatypes ((tuple2!264 0))(
  ( (tuple2!265 (_1!132 (_ BitVec 64)) (_2!132 V!779)) )
))
(declare-datatypes ((List!278 0))(
  ( (Nil!275) (Cons!274 (h!840 tuple2!264) (t!2419 List!278)) )
))
(declare-datatypes ((ListLongMap!269 0))(
  ( (ListLongMap!270 (toList!150 List!278)) )
))
(declare-fun contains!127 (ListLongMap!269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!109 (array!819 array!817 (_ BitVec 32) (_ BitVec 32) V!779 V!779 (_ BitVec 32) Int) ListLongMap!269)

(assert (=> b!9241 (= res!8400 (contains!127 (getCurrentListMap!109 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapNonEmpty!656 () Bool)

(declare-fun mapRes!656 () Bool)

(declare-fun tp!1358 () Bool)

(assert (=> mapNonEmpty!656 (= mapRes!656 (and tp!1358 e!5272))))

(declare-fun mapValue!656 () ValueCell!209)

(declare-fun mapRest!656 () (Array (_ BitVec 32) ValueCell!209))

(declare-fun mapKey!656 () (_ BitVec 32))

(assert (=> mapNonEmpty!656 (= (arr!394 _values!1492) (store mapRest!656 mapKey!656 mapValue!656))))

(declare-fun b!9242 () Bool)

(assert (=> b!9242 (= e!5273 (and e!5274 mapRes!656))))

(declare-fun condMapEmpty!656 () Bool)

(declare-fun mapDefault!656 () ValueCell!209)

(assert (=> b!9242 (= condMapEmpty!656 (= (arr!394 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!209)) mapDefault!656)))))

(declare-fun mapIsEmpty!656 () Bool)

(assert (=> mapIsEmpty!656 mapRes!656))

(declare-fun b!9243 () Bool)

(assert (=> b!9243 (= e!5270 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9244 () Bool)

(assert (=> b!9244 (= e!5270 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9245 () Bool)

(declare-datatypes ((SeekEntryResult!35 0))(
  ( (MissingZero!35 (index!2259 (_ BitVec 32))) (Found!35 (index!2260 (_ BitVec 32))) (Intermediate!35 (undefined!847 Bool) (index!2261 (_ BitVec 32)) (x!2779 (_ BitVec 32))) (Undefined!35) (MissingVacant!35 (index!2262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!819 (_ BitVec 32)) SeekEntryResult!35)

(assert (=> b!9245 (= e!5275 (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!35 lt!2005)))))

(assert (= (and start!1044 res!8402) b!9238))

(assert (= (and b!9238 res!8405) b!9236))

(assert (= (and b!9236 res!8401) b!9233))

(assert (= (and b!9233 res!8407) b!9241))

(assert (= (and b!9241 res!8400) b!9234))

(assert (= (and b!9234 res!8404) b!9235))

(assert (= (and b!9235 c!707) b!9244))

(assert (= (and b!9235 (not c!707)) b!9243))

(assert (= (and b!9235 (not res!8406)) b!9237))

(assert (= (and b!9237 (not res!8403)) b!9245))

(assert (= (and b!9242 condMapEmpty!656) mapIsEmpty!656))

(assert (= (and b!9242 (not condMapEmpty!656)) mapNonEmpty!656))

(get-info :version)

(assert (= (and mapNonEmpty!656 ((_ is ValueCellFull!209) mapValue!656)) b!9240))

(assert (= (and b!9242 ((_ is ValueCellFull!209) mapDefault!656)) b!9239))

(assert (= start!1044 b!9242))

(declare-fun m!5773 () Bool)

(assert (=> b!9234 m!5773))

(declare-fun m!5775 () Bool)

(assert (=> b!9241 m!5775))

(assert (=> b!9241 m!5775))

(declare-fun m!5777 () Bool)

(assert (=> b!9241 m!5777))

(declare-fun m!5779 () Bool)

(assert (=> b!9233 m!5779))

(declare-fun m!5781 () Bool)

(assert (=> b!9237 m!5781))

(declare-fun m!5783 () Bool)

(assert (=> b!9237 m!5783))

(declare-fun m!5785 () Bool)

(assert (=> b!9237 m!5785))

(declare-fun m!5787 () Bool)

(assert (=> b!9235 m!5787))

(declare-fun m!5789 () Bool)

(assert (=> b!9235 m!5789))

(declare-fun m!5791 () Bool)

(assert (=> mapNonEmpty!656 m!5791))

(declare-fun m!5793 () Bool)

(assert (=> b!9245 m!5793))

(assert (=> b!9244 m!5787))

(declare-fun m!5795 () Bool)

(assert (=> b!9236 m!5795))

(declare-fun m!5797 () Bool)

(assert (=> start!1044 m!5797))

(declare-fun m!5799 () Bool)

(assert (=> start!1044 m!5799))

(declare-fun m!5801 () Bool)

(assert (=> start!1044 m!5801))

(check-sat (not b!9237) (not b!9244) (not b!9245) b_and!525 (not b!9236) (not start!1044) (not b!9235) (not mapNonEmpty!656) (not b!9234) (not b_next!373) tp_is_empty!451 (not b!9233) (not b!9241))
(check-sat b_and!525 (not b_next!373))
(get-model)

(declare-fun d!895 () Bool)

(assert (=> d!895 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9234 d!895))

(declare-fun d!897 () Bool)

(declare-fun res!8460 () Bool)

(declare-fun e!5329 () Bool)

(assert (=> d!897 (=> res!8460 e!5329)))

(assert (=> d!897 (= res!8460 (= (select (arr!395 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!897 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!5329)))

(declare-fun b!9328 () Bool)

(declare-fun e!5330 () Bool)

(assert (=> b!9328 (= e!5329 e!5330)))

(declare-fun res!8461 () Bool)

(assert (=> b!9328 (=> (not res!8461) (not e!5330))))

(assert (=> b!9328 (= res!8461 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!457 _keys!1806)))))

(declare-fun b!9329 () Bool)

(assert (=> b!9329 (= e!5330 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!897 (not res!8460)) b!9328))

(assert (= (and b!9328 res!8461) b!9329))

(declare-fun m!5863 () Bool)

(assert (=> d!897 m!5863))

(declare-fun m!5865 () Bool)

(assert (=> b!9329 m!5865))

(assert (=> b!9235 d!897))

(declare-fun d!899 () Bool)

(declare-fun e!5333 () Bool)

(assert (=> d!899 e!5333))

(declare-fun c!716 () Bool)

(assert (=> d!899 (= c!716 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2028 () Unit!199)

(declare-fun choose!142 (array!819 array!817 (_ BitVec 32) (_ BitVec 32) V!779 V!779 (_ BitVec 64) Int) Unit!199)

(assert (=> d!899 (= lt!2028 (choose!142 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!899 (validMask!0 mask!2250)))

(assert (=> d!899 (= (lemmaKeyInListMapIsInArray!77 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!2028)))

(declare-fun b!9334 () Bool)

(assert (=> b!9334 (= e!5333 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9335 () Bool)

(assert (=> b!9335 (= e!5333 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!899 c!716) b!9334))

(assert (= (and d!899 (not c!716)) b!9335))

(declare-fun m!5867 () Bool)

(assert (=> d!899 m!5867))

(assert (=> d!899 m!5797))

(assert (=> b!9334 m!5787))

(assert (=> b!9235 d!899))

(declare-fun d!901 () Bool)

(declare-fun res!8468 () Bool)

(declare-fun e!5342 () Bool)

(assert (=> d!901 (=> res!8468 e!5342)))

(assert (=> d!901 (= res!8468 (bvsge #b00000000000000000000000000000000 (size!457 _keys!1806)))))

(assert (=> d!901 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!274) e!5342)))

(declare-fun bm!236 () Bool)

(declare-fun call!239 () Bool)

(declare-fun c!719 () Bool)

(assert (=> bm!236 (= call!239 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!719 (Cons!273 (select (arr!395 _keys!1806) #b00000000000000000000000000000000) Nil!274) Nil!274)))))

(declare-fun b!9346 () Bool)

(declare-fun e!5345 () Bool)

(declare-fun e!5343 () Bool)

(assert (=> b!9346 (= e!5345 e!5343)))

(assert (=> b!9346 (= c!719 (validKeyInArray!0 (select (arr!395 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9347 () Bool)

(assert (=> b!9347 (= e!5343 call!239)))

(declare-fun b!9348 () Bool)

(assert (=> b!9348 (= e!5342 e!5345)))

(declare-fun res!8470 () Bool)

(assert (=> b!9348 (=> (not res!8470) (not e!5345))))

(declare-fun e!5344 () Bool)

(assert (=> b!9348 (= res!8470 (not e!5344))))

(declare-fun res!8469 () Bool)

(assert (=> b!9348 (=> (not res!8469) (not e!5344))))

(assert (=> b!9348 (= res!8469 (validKeyInArray!0 (select (arr!395 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9349 () Bool)

(assert (=> b!9349 (= e!5343 call!239)))

(declare-fun b!9350 () Bool)

(declare-fun contains!129 (List!277 (_ BitVec 64)) Bool)

(assert (=> b!9350 (= e!5344 (contains!129 Nil!274 (select (arr!395 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!901 (not res!8468)) b!9348))

(assert (= (and b!9348 res!8469) b!9350))

(assert (= (and b!9348 res!8470) b!9346))

(assert (= (and b!9346 c!719) b!9347))

(assert (= (and b!9346 (not c!719)) b!9349))

(assert (= (or b!9347 b!9349) bm!236))

(assert (=> bm!236 m!5863))

(declare-fun m!5869 () Bool)

(assert (=> bm!236 m!5869))

(assert (=> b!9346 m!5863))

(assert (=> b!9346 m!5863))

(declare-fun m!5871 () Bool)

(assert (=> b!9346 m!5871))

(assert (=> b!9348 m!5863))

(assert (=> b!9348 m!5863))

(assert (=> b!9348 m!5871))

(assert (=> b!9350 m!5863))

(assert (=> b!9350 m!5863))

(declare-fun m!5873 () Bool)

(assert (=> b!9350 m!5873))

(assert (=> b!9233 d!901))

(declare-fun d!903 () Bool)

(assert (=> d!903 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!1044 d!903))

(declare-fun d!905 () Bool)

(assert (=> d!905 (= (array_inv!293 _values!1492) (bvsge (size!456 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!1044 d!905))

(declare-fun d!907 () Bool)

(assert (=> d!907 (= (array_inv!294 _keys!1806) (bvsge (size!457 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!1044 d!907))

(declare-fun b!9359 () Bool)

(declare-fun e!5353 () Bool)

(declare-fun call!242 () Bool)

(assert (=> b!9359 (= e!5353 call!242)))

(declare-fun bm!239 () Bool)

(assert (=> bm!239 (= call!242 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!2005 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!9360 () Bool)

(declare-fun e!5354 () Bool)

(declare-fun e!5352 () Bool)

(assert (=> b!9360 (= e!5354 e!5352)))

(declare-fun c!722 () Bool)

(assert (=> b!9360 (= c!722 (validKeyInArray!0 (select (arr!395 _keys!1806) lt!2005)))))

(declare-fun b!9361 () Bool)

(assert (=> b!9361 (= e!5352 e!5353)))

(declare-fun lt!2036 () (_ BitVec 64))

(assert (=> b!9361 (= lt!2036 (select (arr!395 _keys!1806) lt!2005))))

(declare-fun lt!2035 () Unit!199)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!819 (_ BitVec 64) (_ BitVec 32)) Unit!199)

(assert (=> b!9361 (= lt!2035 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2036 lt!2005))))

(assert (=> b!9361 (arrayContainsKey!0 _keys!1806 lt!2036 #b00000000000000000000000000000000)))

(declare-fun lt!2037 () Unit!199)

(assert (=> b!9361 (= lt!2037 lt!2035)))

(declare-fun res!8475 () Bool)

(assert (=> b!9361 (= res!8475 (= (seekEntryOrOpen!0 (select (arr!395 _keys!1806) lt!2005) _keys!1806 mask!2250) (Found!35 lt!2005)))))

(assert (=> b!9361 (=> (not res!8475) (not e!5353))))

(declare-fun b!9362 () Bool)

(assert (=> b!9362 (= e!5352 call!242)))

(declare-fun d!909 () Bool)

(declare-fun res!8476 () Bool)

(assert (=> d!909 (=> res!8476 e!5354)))

(assert (=> d!909 (= res!8476 (bvsge lt!2005 (size!457 _keys!1806)))))

(assert (=> d!909 (= (arrayForallSeekEntryOrOpenFound!0 lt!2005 _keys!1806 mask!2250) e!5354)))

(assert (= (and d!909 (not res!8476)) b!9360))

(assert (= (and b!9360 c!722) b!9361))

(assert (= (and b!9360 (not c!722)) b!9362))

(assert (= (and b!9361 res!8475) b!9359))

(assert (= (or b!9359 b!9362) bm!239))

(declare-fun m!5875 () Bool)

(assert (=> bm!239 m!5875))

(declare-fun m!5877 () Bool)

(assert (=> b!9360 m!5877))

(assert (=> b!9360 m!5877))

(declare-fun m!5879 () Bool)

(assert (=> b!9360 m!5879))

(assert (=> b!9361 m!5877))

(declare-fun m!5881 () Bool)

(assert (=> b!9361 m!5881))

(declare-fun m!5883 () Bool)

(assert (=> b!9361 m!5883))

(assert (=> b!9361 m!5877))

(declare-fun m!5885 () Bool)

(assert (=> b!9361 m!5885))

(assert (=> b!9237 d!909))

(declare-fun d!911 () Bool)

(assert (=> d!911 (arrayForallSeekEntryOrOpenFound!0 lt!2005 _keys!1806 mask!2250)))

(declare-fun lt!2040 () Unit!199)

(declare-fun choose!38 (array!819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!199)

(assert (=> d!911 (= lt!2040 (choose!38 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2005))))

(assert (=> d!911 (validMask!0 mask!2250)))

(assert (=> d!911 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2005) lt!2040)))

(declare-fun bs!328 () Bool)

(assert (= bs!328 d!911))

(assert (=> bs!328 m!5781))

(declare-fun m!5887 () Bool)

(assert (=> bs!328 m!5887))

(assert (=> bs!328 m!5797))

(assert (=> b!9237 d!911))

(declare-fun d!913 () Bool)

(declare-fun lt!2043 () (_ BitVec 32))

(assert (=> d!913 (and (or (bvslt lt!2043 #b00000000000000000000000000000000) (bvsge lt!2043 (size!457 _keys!1806)) (and (bvsge lt!2043 #b00000000000000000000000000000000) (bvslt lt!2043 (size!457 _keys!1806)))) (bvsge lt!2043 #b00000000000000000000000000000000) (bvslt lt!2043 (size!457 _keys!1806)) (= (select (arr!395 _keys!1806) lt!2043) k0!1278))))

(declare-fun e!5357 () (_ BitVec 32))

(assert (=> d!913 (= lt!2043 e!5357)))

(declare-fun c!725 () Bool)

(assert (=> d!913 (= c!725 (= (select (arr!395 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!457 _keys!1806)) (bvslt (size!457 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!913 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!2043)))

(declare-fun b!9367 () Bool)

(assert (=> b!9367 (= e!5357 #b00000000000000000000000000000000)))

(declare-fun b!9368 () Bool)

(assert (=> b!9368 (= e!5357 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!913 c!725) b!9367))

(assert (= (and d!913 (not c!725)) b!9368))

(declare-fun m!5889 () Bool)

(assert (=> d!913 m!5889))

(assert (=> d!913 m!5863))

(declare-fun m!5891 () Bool)

(assert (=> b!9368 m!5891))

(assert (=> b!9237 d!913))

(declare-fun d!915 () Bool)

(declare-fun e!5363 () Bool)

(assert (=> d!915 e!5363))

(declare-fun res!8479 () Bool)

(assert (=> d!915 (=> res!8479 e!5363)))

(declare-fun lt!2052 () Bool)

(assert (=> d!915 (= res!8479 (not lt!2052))))

(declare-fun lt!2055 () Bool)

(assert (=> d!915 (= lt!2052 lt!2055)))

(declare-fun lt!2053 () Unit!199)

(declare-fun e!5362 () Unit!199)

(assert (=> d!915 (= lt!2053 e!5362)))

(declare-fun c!728 () Bool)

(assert (=> d!915 (= c!728 lt!2055)))

(declare-fun containsKey!8 (List!278 (_ BitVec 64)) Bool)

(assert (=> d!915 (= lt!2055 (containsKey!8 (toList!150 (getCurrentListMap!109 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!915 (= (contains!127 (getCurrentListMap!109 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!2052)))

(declare-fun b!9375 () Bool)

(declare-fun lt!2054 () Unit!199)

(assert (=> b!9375 (= e!5362 lt!2054)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!8 (List!278 (_ BitVec 64)) Unit!199)

(assert (=> b!9375 (= lt!2054 (lemmaContainsKeyImpliesGetValueByKeyDefined!8 (toList!150 (getCurrentListMap!109 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!20 0))(
  ( (Some!19 (v!1328 V!779)) (None!18) )
))
(declare-fun isDefined!9 (Option!20) Bool)

(declare-fun getValueByKey!14 (List!278 (_ BitVec 64)) Option!20)

(assert (=> b!9375 (isDefined!9 (getValueByKey!14 (toList!150 (getCurrentListMap!109 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!9376 () Bool)

(declare-fun Unit!203 () Unit!199)

(assert (=> b!9376 (= e!5362 Unit!203)))

(declare-fun b!9377 () Bool)

(assert (=> b!9377 (= e!5363 (isDefined!9 (getValueByKey!14 (toList!150 (getCurrentListMap!109 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!915 c!728) b!9375))

(assert (= (and d!915 (not c!728)) b!9376))

(assert (= (and d!915 (not res!8479)) b!9377))

(declare-fun m!5893 () Bool)

(assert (=> d!915 m!5893))

(declare-fun m!5895 () Bool)

(assert (=> b!9375 m!5895))

(declare-fun m!5897 () Bool)

(assert (=> b!9375 m!5897))

(assert (=> b!9375 m!5897))

(declare-fun m!5899 () Bool)

(assert (=> b!9375 m!5899))

(assert (=> b!9377 m!5897))

(assert (=> b!9377 m!5897))

(assert (=> b!9377 m!5899))

(assert (=> b!9241 d!915))

(declare-fun b!9420 () Bool)

(declare-fun e!5393 () Unit!199)

(declare-fun lt!2109 () Unit!199)

(assert (=> b!9420 (= e!5393 lt!2109)))

(declare-fun lt!2120 () ListLongMap!269)

(declare-fun getCurrentListMapNoExtraKeys!8 (array!819 array!817 (_ BitVec 32) (_ BitVec 32) V!779 V!779 (_ BitVec 32) Int) ListLongMap!269)

(assert (=> b!9420 (= lt!2120 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2112 () (_ BitVec 64))

(assert (=> b!9420 (= lt!2112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2107 () (_ BitVec 64))

(assert (=> b!9420 (= lt!2107 (select (arr!395 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2117 () Unit!199)

(declare-fun addStillContains!9 (ListLongMap!269 (_ BitVec 64) V!779 (_ BitVec 64)) Unit!199)

(assert (=> b!9420 (= lt!2117 (addStillContains!9 lt!2120 lt!2112 zeroValue!1434 lt!2107))))

(declare-fun +!11 (ListLongMap!269 tuple2!264) ListLongMap!269)

(assert (=> b!9420 (contains!127 (+!11 lt!2120 (tuple2!265 lt!2112 zeroValue!1434)) lt!2107)))

(declare-fun lt!2115 () Unit!199)

(assert (=> b!9420 (= lt!2115 lt!2117)))

(declare-fun lt!2119 () ListLongMap!269)

(assert (=> b!9420 (= lt!2119 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2102 () (_ BitVec 64))

(assert (=> b!9420 (= lt!2102 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2121 () (_ BitVec 64))

(assert (=> b!9420 (= lt!2121 (select (arr!395 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2105 () Unit!199)

(declare-fun addApplyDifferent!9 (ListLongMap!269 (_ BitVec 64) V!779 (_ BitVec 64)) Unit!199)

(assert (=> b!9420 (= lt!2105 (addApplyDifferent!9 lt!2119 lt!2102 minValue!1434 lt!2121))))

(declare-fun apply!24 (ListLongMap!269 (_ BitVec 64)) V!779)

(assert (=> b!9420 (= (apply!24 (+!11 lt!2119 (tuple2!265 lt!2102 minValue!1434)) lt!2121) (apply!24 lt!2119 lt!2121))))

(declare-fun lt!2118 () Unit!199)

(assert (=> b!9420 (= lt!2118 lt!2105)))

(declare-fun lt!2110 () ListLongMap!269)

(assert (=> b!9420 (= lt!2110 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2104 () (_ BitVec 64))

(assert (=> b!9420 (= lt!2104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2111 () (_ BitVec 64))

(assert (=> b!9420 (= lt!2111 (select (arr!395 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2116 () Unit!199)

(assert (=> b!9420 (= lt!2116 (addApplyDifferent!9 lt!2110 lt!2104 zeroValue!1434 lt!2111))))

(assert (=> b!9420 (= (apply!24 (+!11 lt!2110 (tuple2!265 lt!2104 zeroValue!1434)) lt!2111) (apply!24 lt!2110 lt!2111))))

(declare-fun lt!2114 () Unit!199)

(assert (=> b!9420 (= lt!2114 lt!2116)))

(declare-fun lt!2100 () ListLongMap!269)

(assert (=> b!9420 (= lt!2100 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2108 () (_ BitVec 64))

(assert (=> b!9420 (= lt!2108 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2106 () (_ BitVec 64))

(assert (=> b!9420 (= lt!2106 (select (arr!395 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!9420 (= lt!2109 (addApplyDifferent!9 lt!2100 lt!2108 minValue!1434 lt!2106))))

(assert (=> b!9420 (= (apply!24 (+!11 lt!2100 (tuple2!265 lt!2108 minValue!1434)) lt!2106) (apply!24 lt!2100 lt!2106))))

(declare-fun b!9421 () Bool)

(declare-fun e!5396 () Bool)

(declare-fun lt!2113 () ListLongMap!269)

(declare-fun get!176 (ValueCell!209 V!779) V!779)

(declare-fun dynLambda!46 (Int (_ BitVec 64)) V!779)

(assert (=> b!9421 (= e!5396 (= (apply!24 lt!2113 (select (arr!395 _keys!1806) #b00000000000000000000000000000000)) (get!176 (select (arr!394 _values!1492) #b00000000000000000000000000000000) (dynLambda!46 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!456 _values!1492)))))

(assert (=> b!9421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!457 _keys!1806)))))

(declare-fun b!9422 () Bool)

(declare-fun e!5395 () Bool)

(assert (=> b!9422 (= e!5395 (validKeyInArray!0 (select (arr!395 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9423 () Bool)

(declare-fun res!8506 () Bool)

(declare-fun e!5400 () Bool)

(assert (=> b!9423 (=> (not res!8506) (not e!5400))))

(declare-fun e!5391 () Bool)

(assert (=> b!9423 (= res!8506 e!5391)))

(declare-fun c!744 () Bool)

(assert (=> b!9423 (= c!744 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!9424 () Bool)

(declare-fun c!745 () Bool)

(assert (=> b!9424 (= c!745 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!5398 () ListLongMap!269)

(declare-fun e!5401 () ListLongMap!269)

(assert (=> b!9424 (= e!5398 e!5401)))

(declare-fun b!9425 () Bool)

(declare-fun Unit!204 () Unit!199)

(assert (=> b!9425 (= e!5393 Unit!204)))

(declare-fun b!9426 () Bool)

(declare-fun res!8498 () Bool)

(assert (=> b!9426 (=> (not res!8498) (not e!5400))))

(declare-fun e!5392 () Bool)

(assert (=> b!9426 (= res!8498 e!5392)))

(declare-fun res!8499 () Bool)

(assert (=> b!9426 (=> res!8499 e!5392)))

(assert (=> b!9426 (= res!8499 (not e!5395))))

(declare-fun res!8503 () Bool)

(assert (=> b!9426 (=> (not res!8503) (not e!5395))))

(assert (=> b!9426 (= res!8503 (bvslt #b00000000000000000000000000000000 (size!457 _keys!1806)))))

(declare-fun b!9427 () Bool)

(declare-fun e!5394 () Bool)

(declare-fun e!5402 () Bool)

(assert (=> b!9427 (= e!5394 e!5402)))

(declare-fun res!8500 () Bool)

(declare-fun call!263 () Bool)

(assert (=> b!9427 (= res!8500 call!263)))

(assert (=> b!9427 (=> (not res!8500) (not e!5402))))

(declare-fun d!917 () Bool)

(assert (=> d!917 e!5400))

(declare-fun res!8501 () Bool)

(assert (=> d!917 (=> (not res!8501) (not e!5400))))

(assert (=> d!917 (= res!8501 (or (bvsge #b00000000000000000000000000000000 (size!457 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!457 _keys!1806)))))))

(declare-fun lt!2101 () ListLongMap!269)

(assert (=> d!917 (= lt!2113 lt!2101)))

(declare-fun lt!2103 () Unit!199)

(assert (=> d!917 (= lt!2103 e!5393)))

(declare-fun c!743 () Bool)

(declare-fun e!5397 () Bool)

(assert (=> d!917 (= c!743 e!5397)))

(declare-fun res!8502 () Bool)

(assert (=> d!917 (=> (not res!8502) (not e!5397))))

(assert (=> d!917 (= res!8502 (bvslt #b00000000000000000000000000000000 (size!457 _keys!1806)))))

(declare-fun e!5399 () ListLongMap!269)

(assert (=> d!917 (= lt!2101 e!5399)))

(declare-fun c!742 () Bool)

(assert (=> d!917 (= c!742 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!917 (validMask!0 mask!2250)))

(assert (=> d!917 (= (getCurrentListMap!109 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!2113)))

(declare-fun bm!254 () Bool)

(declare-fun call!260 () ListLongMap!269)

(declare-fun call!262 () ListLongMap!269)

(assert (=> bm!254 (= call!260 call!262)))

(declare-fun b!9428 () Bool)

(declare-fun e!5390 () Bool)

(assert (=> b!9428 (= e!5391 e!5390)))

(declare-fun res!8505 () Bool)

(declare-fun call!257 () Bool)

(assert (=> b!9428 (= res!8505 call!257)))

(assert (=> b!9428 (=> (not res!8505) (not e!5390))))

(declare-fun b!9429 () Bool)

(assert (=> b!9429 (= e!5399 (+!11 call!262 (tuple2!265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!9430 () Bool)

(assert (=> b!9430 (= e!5399 e!5398)))

(declare-fun c!746 () Bool)

(assert (=> b!9430 (= c!746 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!9431 () Bool)

(assert (=> b!9431 (= e!5391 (not call!257))))

(declare-fun b!9432 () Bool)

(assert (=> b!9432 (= e!5400 e!5394)))

(declare-fun c!741 () Bool)

(assert (=> b!9432 (= c!741 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!9433 () Bool)

(assert (=> b!9433 (= e!5401 call!260)))

(declare-fun b!9434 () Bool)

(assert (=> b!9434 (= e!5402 (= (apply!24 lt!2113 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun bm!255 () Bool)

(declare-fun call!258 () ListLongMap!269)

(declare-fun call!259 () ListLongMap!269)

(assert (=> bm!255 (= call!258 call!259)))

(declare-fun b!9435 () Bool)

(assert (=> b!9435 (= e!5390 (= (apply!24 lt!2113 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun bm!256 () Bool)

(assert (=> bm!256 (= call!257 (contains!127 lt!2113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!257 () Bool)

(declare-fun call!261 () ListLongMap!269)

(assert (=> bm!257 (= call!259 call!261)))

(declare-fun b!9436 () Bool)

(assert (=> b!9436 (= e!5397 (validKeyInArray!0 (select (arr!395 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9437 () Bool)

(assert (=> b!9437 (= e!5392 e!5396)))

(declare-fun res!8504 () Bool)

(assert (=> b!9437 (=> (not res!8504) (not e!5396))))

(assert (=> b!9437 (= res!8504 (contains!127 lt!2113 (select (arr!395 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!9437 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!457 _keys!1806)))))

(declare-fun bm!258 () Bool)

(assert (=> bm!258 (= call!263 (contains!127 lt!2113 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!259 () Bool)

(assert (=> bm!259 (= call!262 (+!11 (ite c!742 call!261 (ite c!746 call!259 call!258)) (ite (or c!742 c!746) (tuple2!265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!265 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!9438 () Bool)

(assert (=> b!9438 (= e!5394 (not call!263))))

(declare-fun b!9439 () Bool)

(assert (=> b!9439 (= e!5398 call!260)))

(declare-fun bm!260 () Bool)

(assert (=> bm!260 (= call!261 (getCurrentListMapNoExtraKeys!8 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!9440 () Bool)

(assert (=> b!9440 (= e!5401 call!258)))

(assert (= (and d!917 c!742) b!9429))

(assert (= (and d!917 (not c!742)) b!9430))

(assert (= (and b!9430 c!746) b!9439))

(assert (= (and b!9430 (not c!746)) b!9424))

(assert (= (and b!9424 c!745) b!9433))

(assert (= (and b!9424 (not c!745)) b!9440))

(assert (= (or b!9433 b!9440) bm!255))

(assert (= (or b!9439 bm!255) bm!257))

(assert (= (or b!9439 b!9433) bm!254))

(assert (= (or b!9429 bm!257) bm!260))

(assert (= (or b!9429 bm!254) bm!259))

(assert (= (and d!917 res!8502) b!9436))

(assert (= (and d!917 c!743) b!9420))

(assert (= (and d!917 (not c!743)) b!9425))

(assert (= (and d!917 res!8501) b!9426))

(assert (= (and b!9426 res!8503) b!9422))

(assert (= (and b!9426 (not res!8499)) b!9437))

(assert (= (and b!9437 res!8504) b!9421))

(assert (= (and b!9426 res!8498) b!9423))

(assert (= (and b!9423 c!744) b!9428))

(assert (= (and b!9423 (not c!744)) b!9431))

(assert (= (and b!9428 res!8505) b!9435))

(assert (= (or b!9428 b!9431) bm!256))

(assert (= (and b!9423 res!8506) b!9432))

(assert (= (and b!9432 c!741) b!9427))

(assert (= (and b!9432 (not c!741)) b!9438))

(assert (= (and b!9427 res!8500) b!9434))

(assert (= (or b!9427 b!9438) bm!258))

(declare-fun b_lambda!347 () Bool)

(assert (=> (not b_lambda!347) (not b!9421)))

(declare-fun t!2423 () Bool)

(declare-fun tb!141 () Bool)

(assert (=> (and start!1044 (= defaultEntry!1495 defaultEntry!1495) t!2423) tb!141))

(declare-fun result!225 () Bool)

(assert (=> tb!141 (= result!225 tp_is_empty!451)))

(assert (=> b!9421 t!2423))

(declare-fun b_and!531 () Bool)

(assert (= b_and!525 (and (=> t!2423 result!225) b_and!531)))

(declare-fun m!5901 () Bool)

(assert (=> b!9429 m!5901))

(declare-fun m!5903 () Bool)

(assert (=> bm!258 m!5903))

(declare-fun m!5905 () Bool)

(assert (=> b!9435 m!5905))

(assert (=> b!9421 m!5863))

(declare-fun m!5907 () Bool)

(assert (=> b!9421 m!5907))

(declare-fun m!5909 () Bool)

(assert (=> b!9421 m!5909))

(assert (=> b!9421 m!5863))

(declare-fun m!5911 () Bool)

(assert (=> b!9421 m!5911))

(assert (=> b!9421 m!5909))

(declare-fun m!5913 () Bool)

(assert (=> b!9421 m!5913))

(assert (=> b!9421 m!5911))

(assert (=> d!917 m!5797))

(assert (=> b!9437 m!5863))

(assert (=> b!9437 m!5863))

(declare-fun m!5915 () Bool)

(assert (=> b!9437 m!5915))

(assert (=> b!9436 m!5863))

(assert (=> b!9436 m!5863))

(assert (=> b!9436 m!5871))

(declare-fun m!5917 () Bool)

(assert (=> bm!256 m!5917))

(declare-fun m!5919 () Bool)

(assert (=> bm!260 m!5919))

(declare-fun m!5921 () Bool)

(assert (=> b!9434 m!5921))

(declare-fun m!5923 () Bool)

(assert (=> b!9420 m!5923))

(declare-fun m!5925 () Bool)

(assert (=> b!9420 m!5925))

(assert (=> b!9420 m!5925))

(declare-fun m!5927 () Bool)

(assert (=> b!9420 m!5927))

(declare-fun m!5929 () Bool)

(assert (=> b!9420 m!5929))

(declare-fun m!5931 () Bool)

(assert (=> b!9420 m!5931))

(assert (=> b!9420 m!5929))

(declare-fun m!5933 () Bool)

(assert (=> b!9420 m!5933))

(assert (=> b!9420 m!5863))

(declare-fun m!5935 () Bool)

(assert (=> b!9420 m!5935))

(declare-fun m!5937 () Bool)

(assert (=> b!9420 m!5937))

(declare-fun m!5939 () Bool)

(assert (=> b!9420 m!5939))

(declare-fun m!5941 () Bool)

(assert (=> b!9420 m!5941))

(declare-fun m!5943 () Bool)

(assert (=> b!9420 m!5943))

(assert (=> b!9420 m!5937))

(declare-fun m!5945 () Bool)

(assert (=> b!9420 m!5945))

(declare-fun m!5947 () Bool)

(assert (=> b!9420 m!5947))

(declare-fun m!5949 () Bool)

(assert (=> b!9420 m!5949))

(assert (=> b!9420 m!5919))

(assert (=> b!9420 m!5941))

(declare-fun m!5951 () Bool)

(assert (=> b!9420 m!5951))

(assert (=> b!9422 m!5863))

(assert (=> b!9422 m!5863))

(assert (=> b!9422 m!5871))

(declare-fun m!5953 () Bool)

(assert (=> bm!259 m!5953))

(assert (=> b!9241 d!917))

(assert (=> b!9244 d!897))

(declare-fun d!919 () Bool)

(declare-fun lt!2128 () SeekEntryResult!35)

(assert (=> d!919 (and (or ((_ is Undefined!35) lt!2128) (not ((_ is Found!35) lt!2128)) (and (bvsge (index!2260 lt!2128) #b00000000000000000000000000000000) (bvslt (index!2260 lt!2128) (size!457 _keys!1806)))) (or ((_ is Undefined!35) lt!2128) ((_ is Found!35) lt!2128) (not ((_ is MissingZero!35) lt!2128)) (and (bvsge (index!2259 lt!2128) #b00000000000000000000000000000000) (bvslt (index!2259 lt!2128) (size!457 _keys!1806)))) (or ((_ is Undefined!35) lt!2128) ((_ is Found!35) lt!2128) ((_ is MissingZero!35) lt!2128) (not ((_ is MissingVacant!35) lt!2128)) (and (bvsge (index!2262 lt!2128) #b00000000000000000000000000000000) (bvslt (index!2262 lt!2128) (size!457 _keys!1806)))) (or ((_ is Undefined!35) lt!2128) (ite ((_ is Found!35) lt!2128) (= (select (arr!395 _keys!1806) (index!2260 lt!2128)) k0!1278) (ite ((_ is MissingZero!35) lt!2128) (= (select (arr!395 _keys!1806) (index!2259 lt!2128)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!35) lt!2128) (= (select (arr!395 _keys!1806) (index!2262 lt!2128)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!5410 () SeekEntryResult!35)

(assert (=> d!919 (= lt!2128 e!5410)))

(declare-fun c!755 () Bool)

(declare-fun lt!2130 () SeekEntryResult!35)

(assert (=> d!919 (= c!755 (and ((_ is Intermediate!35) lt!2130) (undefined!847 lt!2130)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!819 (_ BitVec 32)) SeekEntryResult!35)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!919 (= lt!2130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!919 (validMask!0 mask!2250)))

(assert (=> d!919 (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) lt!2128)))

(declare-fun b!9455 () Bool)

(assert (=> b!9455 (= e!5410 Undefined!35)))

(declare-fun b!9456 () Bool)

(declare-fun e!5411 () SeekEntryResult!35)

(assert (=> b!9456 (= e!5411 (Found!35 (index!2261 lt!2130)))))

(declare-fun b!9457 () Bool)

(assert (=> b!9457 (= e!5410 e!5411)))

(declare-fun lt!2129 () (_ BitVec 64))

(assert (=> b!9457 (= lt!2129 (select (arr!395 _keys!1806) (index!2261 lt!2130)))))

(declare-fun c!753 () Bool)

(assert (=> b!9457 (= c!753 (= lt!2129 k0!1278))))

(declare-fun b!9458 () Bool)

(declare-fun e!5409 () SeekEntryResult!35)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!819 (_ BitVec 32)) SeekEntryResult!35)

(assert (=> b!9458 (= e!5409 (seekKeyOrZeroReturnVacant!0 (x!2779 lt!2130) (index!2261 lt!2130) (index!2261 lt!2130) k0!1278 _keys!1806 mask!2250))))

(declare-fun b!9459 () Bool)

(declare-fun c!754 () Bool)

(assert (=> b!9459 (= c!754 (= lt!2129 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!9459 (= e!5411 e!5409)))

(declare-fun b!9460 () Bool)

(assert (=> b!9460 (= e!5409 (MissingZero!35 (index!2261 lt!2130)))))

(assert (= (and d!919 c!755) b!9455))

(assert (= (and d!919 (not c!755)) b!9457))

(assert (= (and b!9457 c!753) b!9456))

(assert (= (and b!9457 (not c!753)) b!9459))

(assert (= (and b!9459 c!754) b!9460))

(assert (= (and b!9459 (not c!754)) b!9458))

(assert (=> d!919 m!5797))

(declare-fun m!5955 () Bool)

(assert (=> d!919 m!5955))

(declare-fun m!5957 () Bool)

(assert (=> d!919 m!5957))

(declare-fun m!5959 () Bool)

(assert (=> d!919 m!5959))

(declare-fun m!5961 () Bool)

(assert (=> d!919 m!5961))

(assert (=> d!919 m!5955))

(declare-fun m!5963 () Bool)

(assert (=> d!919 m!5963))

(declare-fun m!5965 () Bool)

(assert (=> b!9457 m!5965))

(declare-fun m!5967 () Bool)

(assert (=> b!9458 m!5967))

(assert (=> b!9245 d!919))

(declare-fun b!9461 () Bool)

(declare-fun e!5413 () Bool)

(declare-fun call!264 () Bool)

(assert (=> b!9461 (= e!5413 call!264)))

(declare-fun bm!261 () Bool)

(assert (=> bm!261 (= call!264 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!9462 () Bool)

(declare-fun e!5414 () Bool)

(declare-fun e!5412 () Bool)

(assert (=> b!9462 (= e!5414 e!5412)))

(declare-fun c!756 () Bool)

(assert (=> b!9462 (= c!756 (validKeyInArray!0 (select (arr!395 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9463 () Bool)

(assert (=> b!9463 (= e!5412 e!5413)))

(declare-fun lt!2132 () (_ BitVec 64))

(assert (=> b!9463 (= lt!2132 (select (arr!395 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2131 () Unit!199)

(assert (=> b!9463 (= lt!2131 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2132 #b00000000000000000000000000000000))))

(assert (=> b!9463 (arrayContainsKey!0 _keys!1806 lt!2132 #b00000000000000000000000000000000)))

(declare-fun lt!2133 () Unit!199)

(assert (=> b!9463 (= lt!2133 lt!2131)))

(declare-fun res!8507 () Bool)

(assert (=> b!9463 (= res!8507 (= (seekEntryOrOpen!0 (select (arr!395 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!35 #b00000000000000000000000000000000)))))

(assert (=> b!9463 (=> (not res!8507) (not e!5413))))

(declare-fun b!9464 () Bool)

(assert (=> b!9464 (= e!5412 call!264)))

(declare-fun d!921 () Bool)

(declare-fun res!8508 () Bool)

(assert (=> d!921 (=> res!8508 e!5414)))

(assert (=> d!921 (= res!8508 (bvsge #b00000000000000000000000000000000 (size!457 _keys!1806)))))

(assert (=> d!921 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!5414)))

(assert (= (and d!921 (not res!8508)) b!9462))

(assert (= (and b!9462 c!756) b!9463))

(assert (= (and b!9462 (not c!756)) b!9464))

(assert (= (and b!9463 res!8507) b!9461))

(assert (= (or b!9461 b!9464) bm!261))

(declare-fun m!5969 () Bool)

(assert (=> bm!261 m!5969))

(assert (=> b!9462 m!5863))

(assert (=> b!9462 m!5863))

(assert (=> b!9462 m!5871))

(assert (=> b!9463 m!5863))

(declare-fun m!5971 () Bool)

(assert (=> b!9463 m!5971))

(declare-fun m!5973 () Bool)

(assert (=> b!9463 m!5973))

(assert (=> b!9463 m!5863))

(declare-fun m!5975 () Bool)

(assert (=> b!9463 m!5975))

(assert (=> b!9236 d!921))

(declare-fun mapIsEmpty!665 () Bool)

(declare-fun mapRes!665 () Bool)

(assert (=> mapIsEmpty!665 mapRes!665))

(declare-fun condMapEmpty!665 () Bool)

(declare-fun mapDefault!665 () ValueCell!209)

(assert (=> mapNonEmpty!656 (= condMapEmpty!665 (= mapRest!656 ((as const (Array (_ BitVec 32) ValueCell!209)) mapDefault!665)))))

(declare-fun e!5419 () Bool)

(assert (=> mapNonEmpty!656 (= tp!1358 (and e!5419 mapRes!665))))

(declare-fun mapNonEmpty!665 () Bool)

(declare-fun tp!1373 () Bool)

(declare-fun e!5420 () Bool)

(assert (=> mapNonEmpty!665 (= mapRes!665 (and tp!1373 e!5420))))

(declare-fun mapKey!665 () (_ BitVec 32))

(declare-fun mapValue!665 () ValueCell!209)

(declare-fun mapRest!665 () (Array (_ BitVec 32) ValueCell!209))

(assert (=> mapNonEmpty!665 (= mapRest!656 (store mapRest!665 mapKey!665 mapValue!665))))

(declare-fun b!9471 () Bool)

(assert (=> b!9471 (= e!5420 tp_is_empty!451)))

(declare-fun b!9472 () Bool)

(assert (=> b!9472 (= e!5419 tp_is_empty!451)))

(assert (= (and mapNonEmpty!656 condMapEmpty!665) mapIsEmpty!665))

(assert (= (and mapNonEmpty!656 (not condMapEmpty!665)) mapNonEmpty!665))

(assert (= (and mapNonEmpty!665 ((_ is ValueCellFull!209) mapValue!665)) b!9471))

(assert (= (and mapNonEmpty!656 ((_ is ValueCellFull!209) mapDefault!665)) b!9472))

(declare-fun m!5977 () Bool)

(assert (=> mapNonEmpty!665 m!5977))

(declare-fun b_lambda!349 () Bool)

(assert (= b_lambda!347 (or (and start!1044 b_free!373) b_lambda!349)))

(check-sat b_and!531 (not mapNonEmpty!665) (not b!9429) (not bm!236) (not bm!256) (not b_lambda!349) (not bm!260) (not b!9329) (not bm!261) (not bm!258) (not d!919) (not d!911) (not b!9436) (not d!915) (not b!9437) (not b!9458) (not bm!239) (not b!9435) (not b!9350) (not b!9462) (not b_next!373) tp_is_empty!451 (not b!9334) (not b!9348) (not b!9422) (not b!9361) (not b!9346) (not b!9420) (not d!917) (not b!9463) (not b!9434) (not b!9421) (not bm!259) (not b!9375) (not b!9368) (not b!9360) (not b!9377) (not d!899))
(check-sat b_and!531 (not b_next!373))
