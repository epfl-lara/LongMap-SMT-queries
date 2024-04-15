; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35274 () Bool)

(assert start!35274)

(declare-fun b!353312 () Bool)

(declare-fun e!216390 () Bool)

(declare-datatypes ((array!19137 0))(
  ( (array!19138 (arr!9066 (Array (_ BitVec 32) (_ BitVec 64))) (size!9419 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19137)

(assert (=> b!353312 (= e!216390 (and (bvsle #b00000000000000000000000000000000 (size!9419 _keys!1456)) (bvsge (size!9419 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353313 () Bool)

(declare-fun e!216391 () Bool)

(declare-fun e!216392 () Bool)

(declare-fun mapRes!13170 () Bool)

(assert (=> b!353313 (= e!216391 (and e!216392 mapRes!13170))))

(declare-fun condMapEmpty!13170 () Bool)

(declare-datatypes ((V!11355 0))(
  ( (V!11356 (val!3936 Int)) )
))
(declare-datatypes ((ValueCell!3548 0))(
  ( (ValueCellFull!3548 (v!6123 V!11355)) (EmptyCell!3548) )
))
(declare-datatypes ((array!19139 0))(
  ( (array!19140 (arr!9067 (Array (_ BitVec 32) ValueCell!3548)) (size!9420 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19139)

(declare-fun mapDefault!13170 () ValueCell!3548)

(assert (=> b!353313 (= condMapEmpty!13170 (= (arr!9067 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3548)) mapDefault!13170)))))

(declare-fun b!353314 () Bool)

(declare-fun tp_is_empty!7783 () Bool)

(assert (=> b!353314 (= e!216392 tp_is_empty!7783)))

(declare-fun res!195900 () Bool)

(assert (=> start!35274 (=> (not res!195900) (not e!216390))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35274 (= res!195900 (validMask!0 mask!1842))))

(assert (=> start!35274 e!216390))

(assert (=> start!35274 true))

(declare-fun array_inv!6708 (array!19139) Bool)

(assert (=> start!35274 (and (array_inv!6708 _values!1208) e!216391)))

(declare-fun array_inv!6709 (array!19137) Bool)

(assert (=> start!35274 (array_inv!6709 _keys!1456)))

(declare-fun mapIsEmpty!13170 () Bool)

(assert (=> mapIsEmpty!13170 mapRes!13170))

(declare-fun b!353315 () Bool)

(declare-fun e!216393 () Bool)

(assert (=> b!353315 (= e!216393 tp_is_empty!7783)))

(declare-fun b!353316 () Bool)

(declare-fun res!195902 () Bool)

(assert (=> b!353316 (=> (not res!195902) (not e!216390))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353316 (= res!195902 (and (= (size!9420 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9419 _keys!1456) (size!9420 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353317 () Bool)

(declare-fun res!195901 () Bool)

(assert (=> b!353317 (=> (not res!195901) (not e!216390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19137 (_ BitVec 32)) Bool)

(assert (=> b!353317 (= res!195901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13170 () Bool)

(declare-fun tp!27066 () Bool)

(assert (=> mapNonEmpty!13170 (= mapRes!13170 (and tp!27066 e!216393))))

(declare-fun mapKey!13170 () (_ BitVec 32))

(declare-fun mapValue!13170 () ValueCell!3548)

(declare-fun mapRest!13170 () (Array (_ BitVec 32) ValueCell!3548))

(assert (=> mapNonEmpty!13170 (= (arr!9067 _values!1208) (store mapRest!13170 mapKey!13170 mapValue!13170))))

(assert (= (and start!35274 res!195900) b!353316))

(assert (= (and b!353316 res!195902) b!353317))

(assert (= (and b!353317 res!195901) b!353312))

(assert (= (and b!353313 condMapEmpty!13170) mapIsEmpty!13170))

(assert (= (and b!353313 (not condMapEmpty!13170)) mapNonEmpty!13170))

(get-info :version)

(assert (= (and mapNonEmpty!13170 ((_ is ValueCellFull!3548) mapValue!13170)) b!353315))

(assert (= (and b!353313 ((_ is ValueCellFull!3548) mapDefault!13170)) b!353314))

(assert (= start!35274 b!353313))

(declare-fun m!352179 () Bool)

(assert (=> start!35274 m!352179))

(declare-fun m!352181 () Bool)

(assert (=> start!35274 m!352181))

(declare-fun m!352183 () Bool)

(assert (=> start!35274 m!352183))

(declare-fun m!352185 () Bool)

(assert (=> b!353317 m!352185))

(declare-fun m!352187 () Bool)

(assert (=> mapNonEmpty!13170 m!352187))

(check-sat (not start!35274) (not b!353317) (not mapNonEmpty!13170) tp_is_empty!7783)
(check-sat)
(get-model)

(declare-fun d!71425 () Bool)

(assert (=> d!71425 (= (validMask!0 mask!1842) (and (or (= mask!1842 #b00000000000000000000000000000111) (= mask!1842 #b00000000000000000000000000001111) (= mask!1842 #b00000000000000000000000000011111) (= mask!1842 #b00000000000000000000000000111111) (= mask!1842 #b00000000000000000000000001111111) (= mask!1842 #b00000000000000000000000011111111) (= mask!1842 #b00000000000000000000000111111111) (= mask!1842 #b00000000000000000000001111111111) (= mask!1842 #b00000000000000000000011111111111) (= mask!1842 #b00000000000000000000111111111111) (= mask!1842 #b00000000000000000001111111111111) (= mask!1842 #b00000000000000000011111111111111) (= mask!1842 #b00000000000000000111111111111111) (= mask!1842 #b00000000000000001111111111111111) (= mask!1842 #b00000000000000011111111111111111) (= mask!1842 #b00000000000000111111111111111111) (= mask!1842 #b00000000000001111111111111111111) (= mask!1842 #b00000000000011111111111111111111) (= mask!1842 #b00000000000111111111111111111111) (= mask!1842 #b00000000001111111111111111111111) (= mask!1842 #b00000000011111111111111111111111) (= mask!1842 #b00000000111111111111111111111111) (= mask!1842 #b00000001111111111111111111111111) (= mask!1842 #b00000011111111111111111111111111) (= mask!1842 #b00000111111111111111111111111111) (= mask!1842 #b00001111111111111111111111111111) (= mask!1842 #b00011111111111111111111111111111) (= mask!1842 #b00111111111111111111111111111111)) (bvsle mask!1842 #b00111111111111111111111111111111)))))

(assert (=> start!35274 d!71425))

(declare-fun d!71427 () Bool)

(assert (=> d!71427 (= (array_inv!6708 _values!1208) (bvsge (size!9420 _values!1208) #b00000000000000000000000000000000))))

(assert (=> start!35274 d!71427))

(declare-fun d!71429 () Bool)

(assert (=> d!71429 (= (array_inv!6709 _keys!1456) (bvsge (size!9419 _keys!1456) #b00000000000000000000000000000000))))

(assert (=> start!35274 d!71429))

(declare-fun b!353362 () Bool)

(declare-fun e!216432 () Bool)

(declare-fun e!216433 () Bool)

(assert (=> b!353362 (= e!216432 e!216433)))

(declare-fun c!53624 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353362 (= c!53624 (validKeyInArray!0 (select (arr!9066 _keys!1456) #b00000000000000000000000000000000)))))

(declare-fun b!353363 () Bool)

(declare-fun call!27122 () Bool)

(assert (=> b!353363 (= e!216433 call!27122)))

(declare-fun bm!27119 () Bool)

(assert (=> bm!27119 (= call!27122 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1456 mask!1842))))

(declare-fun b!353364 () Bool)

(declare-fun e!216431 () Bool)

(assert (=> b!353364 (= e!216433 e!216431)))

(declare-fun lt!165356 () (_ BitVec 64))

(assert (=> b!353364 (= lt!165356 (select (arr!9066 _keys!1456) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10906 0))(
  ( (Unit!10907) )
))
(declare-fun lt!165357 () Unit!10906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19137 (_ BitVec 64) (_ BitVec 32)) Unit!10906)

(assert (=> b!353364 (= lt!165357 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1456 lt!165356 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353364 (arrayContainsKey!0 _keys!1456 lt!165356 #b00000000000000000000000000000000)))

(declare-fun lt!165355 () Unit!10906)

(assert (=> b!353364 (= lt!165355 lt!165357)))

(declare-fun res!195925 () Bool)

(declare-datatypes ((SeekEntryResult!3482 0))(
  ( (MissingZero!3482 (index!16107 (_ BitVec 32))) (Found!3482 (index!16108 (_ BitVec 32))) (Intermediate!3482 (undefined!4294 Bool) (index!16109 (_ BitVec 32)) (x!35191 (_ BitVec 32))) (Undefined!3482) (MissingVacant!3482 (index!16110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19137 (_ BitVec 32)) SeekEntryResult!3482)

(assert (=> b!353364 (= res!195925 (= (seekEntryOrOpen!0 (select (arr!9066 _keys!1456) #b00000000000000000000000000000000) _keys!1456 mask!1842) (Found!3482 #b00000000000000000000000000000000)))))

(assert (=> b!353364 (=> (not res!195925) (not e!216431))))

(declare-fun d!71431 () Bool)

(declare-fun res!195926 () Bool)

(assert (=> d!71431 (=> res!195926 e!216432)))

(assert (=> d!71431 (= res!195926 (bvsge #b00000000000000000000000000000000 (size!9419 _keys!1456)))))

(assert (=> d!71431 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842) e!216432)))

(declare-fun b!353365 () Bool)

(assert (=> b!353365 (= e!216431 call!27122)))

(assert (= (and d!71431 (not res!195926)) b!353362))

(assert (= (and b!353362 c!53624) b!353364))

(assert (= (and b!353362 (not c!53624)) b!353363))

(assert (= (and b!353364 res!195925) b!353365))

(assert (= (or b!353365 b!353363) bm!27119))

(declare-fun m!352209 () Bool)

(assert (=> b!353362 m!352209))

(assert (=> b!353362 m!352209))

(declare-fun m!352211 () Bool)

(assert (=> b!353362 m!352211))

(declare-fun m!352213 () Bool)

(assert (=> bm!27119 m!352213))

(assert (=> b!353364 m!352209))

(declare-fun m!352215 () Bool)

(assert (=> b!353364 m!352215))

(declare-fun m!352217 () Bool)

(assert (=> b!353364 m!352217))

(assert (=> b!353364 m!352209))

(declare-fun m!352219 () Bool)

(assert (=> b!353364 m!352219))

(assert (=> b!353317 d!71431))

(declare-fun mapNonEmpty!13179 () Bool)

(declare-fun mapRes!13179 () Bool)

(declare-fun tp!27075 () Bool)

(declare-fun e!216439 () Bool)

(assert (=> mapNonEmpty!13179 (= mapRes!13179 (and tp!27075 e!216439))))

(declare-fun mapRest!13179 () (Array (_ BitVec 32) ValueCell!3548))

(declare-fun mapValue!13179 () ValueCell!3548)

(declare-fun mapKey!13179 () (_ BitVec 32))

(assert (=> mapNonEmpty!13179 (= mapRest!13170 (store mapRest!13179 mapKey!13179 mapValue!13179))))

(declare-fun condMapEmpty!13179 () Bool)

(declare-fun mapDefault!13179 () ValueCell!3548)

(assert (=> mapNonEmpty!13170 (= condMapEmpty!13179 (= mapRest!13170 ((as const (Array (_ BitVec 32) ValueCell!3548)) mapDefault!13179)))))

(declare-fun e!216438 () Bool)

(assert (=> mapNonEmpty!13170 (= tp!27066 (and e!216438 mapRes!13179))))

(declare-fun b!353372 () Bool)

(assert (=> b!353372 (= e!216439 tp_is_empty!7783)))

(declare-fun b!353373 () Bool)

(assert (=> b!353373 (= e!216438 tp_is_empty!7783)))

(declare-fun mapIsEmpty!13179 () Bool)

(assert (=> mapIsEmpty!13179 mapRes!13179))

(assert (= (and mapNonEmpty!13170 condMapEmpty!13179) mapIsEmpty!13179))

(assert (= (and mapNonEmpty!13170 (not condMapEmpty!13179)) mapNonEmpty!13179))

(assert (= (and mapNonEmpty!13179 ((_ is ValueCellFull!3548) mapValue!13179)) b!353372))

(assert (= (and mapNonEmpty!13170 ((_ is ValueCellFull!3548) mapDefault!13179)) b!353373))

(declare-fun m!352221 () Bool)

(assert (=> mapNonEmpty!13179 m!352221))

(check-sat (not bm!27119) tp_is_empty!7783 (not b!353362) (not mapNonEmpty!13179) (not b!353364))
(check-sat)
