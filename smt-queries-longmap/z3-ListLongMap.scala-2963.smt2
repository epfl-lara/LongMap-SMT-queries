; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42000 () Bool)

(assert start!42000)

(declare-fun b_free!11587 () Bool)

(declare-fun b_next!11587 () Bool)

(assert (=> start!42000 (= b_free!11587 (not b_next!11587))))

(declare-fun tp!40777 () Bool)

(declare-fun b_and!19995 () Bool)

(assert (=> start!42000 (= tp!40777 b_and!19995)))

(declare-fun b!469037 () Bool)

(declare-fun e!274606 () Bool)

(declare-fun tp_is_empty!13015 () Bool)

(assert (=> b!469037 (= e!274606 tp_is_empty!13015)))

(declare-fun res!280339 () Bool)

(declare-fun e!274605 () Bool)

(assert (=> start!42000 (=> (not res!280339) (not e!274605))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42000 (= res!280339 (validMask!0 mask!1365))))

(assert (=> start!42000 e!274605))

(assert (=> start!42000 tp_is_empty!13015))

(assert (=> start!42000 tp!40777))

(assert (=> start!42000 true))

(declare-datatypes ((array!29788 0))(
  ( (array!29789 (arr!14319 (Array (_ BitVec 32) (_ BitVec 64))) (size!14671 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29788)

(declare-fun array_inv!10430 (array!29788) Bool)

(assert (=> start!42000 (array_inv!10430 _keys!1025)))

(declare-datatypes ((V!18459 0))(
  ( (V!18460 (val!6552 Int)) )
))
(declare-datatypes ((ValueCell!6164 0))(
  ( (ValueCellFull!6164 (v!8842 V!18459)) (EmptyCell!6164) )
))
(declare-datatypes ((array!29790 0))(
  ( (array!29791 (arr!14320 (Array (_ BitVec 32) ValueCell!6164)) (size!14672 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29790)

(declare-fun e!274608 () Bool)

(declare-fun array_inv!10431 (array!29790) Bool)

(assert (=> start!42000 (and (array_inv!10431 _values!833) e!274608)))

(declare-fun b!469038 () Bool)

(declare-fun res!280340 () Bool)

(assert (=> b!469038 (=> (not res!280340) (not e!274605))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!469038 (= res!280340 (and (= (size!14672 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14671 _keys!1025) (size!14672 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469039 () Bool)

(declare-fun e!274610 () Bool)

(assert (=> b!469039 (= e!274610 (bvsle #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-datatypes ((tuple2!8540 0))(
  ( (tuple2!8541 (_1!4281 (_ BitVec 64)) (_2!4281 V!18459)) )
))
(declare-datatypes ((List!8616 0))(
  ( (Nil!8613) (Cons!8612 (h!9468 tuple2!8540) (t!14566 List!8616)) )
))
(declare-datatypes ((ListLongMap!7455 0))(
  ( (ListLongMap!7456 (toList!3743 List!8616)) )
))
(declare-fun lt!212431 () ListLongMap!7455)

(declare-fun lt!212428 () tuple2!8540)

(declare-fun minValueBefore!38 () V!18459)

(declare-fun +!1702 (ListLongMap!7455 tuple2!8540) ListLongMap!7455)

(assert (=> b!469039 (= (+!1702 lt!212431 lt!212428) (+!1702 (+!1702 lt!212431 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212428))))

(declare-fun minValueAfter!38 () V!18459)

(assert (=> b!469039 (= lt!212428 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13695 0))(
  ( (Unit!13696) )
))
(declare-fun lt!212429 () Unit!13695)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!108 (ListLongMap!7455 (_ BitVec 64) V!18459 V!18459) Unit!13695)

(assert (=> b!469039 (= lt!212429 (addSameAsAddTwiceSameKeyDiffValues!108 lt!212431 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18459)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212430 () ListLongMap!7455)

(declare-fun getCurrentListMap!2168 (array!29788 array!29790 (_ BitVec 32) (_ BitVec 32) V!18459 V!18459 (_ BitVec 32) Int) ListLongMap!7455)

(assert (=> b!469039 (= lt!212430 (getCurrentListMap!2168 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212433 () ListLongMap!7455)

(assert (=> b!469039 (= lt!212433 (getCurrentListMap!2168 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21217 () Bool)

(declare-fun mapRes!21217 () Bool)

(assert (=> mapIsEmpty!21217 mapRes!21217))

(declare-fun b!469040 () Bool)

(declare-fun res!280341 () Bool)

(assert (=> b!469040 (=> (not res!280341) (not e!274605))))

(declare-datatypes ((List!8617 0))(
  ( (Nil!8614) (Cons!8613 (h!9469 (_ BitVec 64)) (t!14567 List!8617)) )
))
(declare-fun arrayNoDuplicates!0 (array!29788 (_ BitVec 32) List!8617) Bool)

(assert (=> b!469040 (= res!280341 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8614))))

(declare-fun b!469041 () Bool)

(declare-fun e!274609 () Bool)

(assert (=> b!469041 (= e!274608 (and e!274609 mapRes!21217))))

(declare-fun condMapEmpty!21217 () Bool)

(declare-fun mapDefault!21217 () ValueCell!6164)

(assert (=> b!469041 (= condMapEmpty!21217 (= (arr!14320 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6164)) mapDefault!21217)))))

(declare-fun mapNonEmpty!21217 () Bool)

(declare-fun tp!40776 () Bool)

(assert (=> mapNonEmpty!21217 (= mapRes!21217 (and tp!40776 e!274606))))

(declare-fun mapValue!21217 () ValueCell!6164)

(declare-fun mapKey!21217 () (_ BitVec 32))

(declare-fun mapRest!21217 () (Array (_ BitVec 32) ValueCell!6164))

(assert (=> mapNonEmpty!21217 (= (arr!14320 _values!833) (store mapRest!21217 mapKey!21217 mapValue!21217))))

(declare-fun b!469042 () Bool)

(assert (=> b!469042 (= e!274605 (not e!274610))))

(declare-fun res!280338 () Bool)

(assert (=> b!469042 (=> res!280338 e!274610)))

(assert (=> b!469042 (= res!280338 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212432 () ListLongMap!7455)

(assert (=> b!469042 (= lt!212431 lt!212432)))

(declare-fun lt!212434 () Unit!13695)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!122 (array!29788 array!29790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18459 V!18459 V!18459 V!18459 (_ BitVec 32) Int) Unit!13695)

(assert (=> b!469042 (= lt!212434 (lemmaNoChangeToArrayThenSameMapNoExtras!122 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1962 (array!29788 array!29790 (_ BitVec 32) (_ BitVec 32) V!18459 V!18459 (_ BitVec 32) Int) ListLongMap!7455)

(assert (=> b!469042 (= lt!212432 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469042 (= lt!212431 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469043 () Bool)

(assert (=> b!469043 (= e!274609 tp_is_empty!13015)))

(declare-fun b!469044 () Bool)

(declare-fun res!280342 () Bool)

(assert (=> b!469044 (=> (not res!280342) (not e!274605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29788 (_ BitVec 32)) Bool)

(assert (=> b!469044 (= res!280342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42000 res!280339) b!469038))

(assert (= (and b!469038 res!280340) b!469044))

(assert (= (and b!469044 res!280342) b!469040))

(assert (= (and b!469040 res!280341) b!469042))

(assert (= (and b!469042 (not res!280338)) b!469039))

(assert (= (and b!469041 condMapEmpty!21217) mapIsEmpty!21217))

(assert (= (and b!469041 (not condMapEmpty!21217)) mapNonEmpty!21217))

(get-info :version)

(assert (= (and mapNonEmpty!21217 ((_ is ValueCellFull!6164) mapValue!21217)) b!469037))

(assert (= (and b!469041 ((_ is ValueCellFull!6164) mapDefault!21217)) b!469043))

(assert (= start!42000 b!469041))

(declare-fun m!451383 () Bool)

(assert (=> mapNonEmpty!21217 m!451383))

(declare-fun m!451385 () Bool)

(assert (=> b!469039 m!451385))

(declare-fun m!451387 () Bool)

(assert (=> b!469039 m!451387))

(declare-fun m!451389 () Bool)

(assert (=> b!469039 m!451389))

(declare-fun m!451391 () Bool)

(assert (=> b!469039 m!451391))

(assert (=> b!469039 m!451385))

(declare-fun m!451393 () Bool)

(assert (=> b!469039 m!451393))

(declare-fun m!451395 () Bool)

(assert (=> b!469039 m!451395))

(declare-fun m!451397 () Bool)

(assert (=> b!469040 m!451397))

(declare-fun m!451399 () Bool)

(assert (=> b!469044 m!451399))

(declare-fun m!451401 () Bool)

(assert (=> start!42000 m!451401))

(declare-fun m!451403 () Bool)

(assert (=> start!42000 m!451403))

(declare-fun m!451405 () Bool)

(assert (=> start!42000 m!451405))

(declare-fun m!451407 () Bool)

(assert (=> b!469042 m!451407))

(declare-fun m!451409 () Bool)

(assert (=> b!469042 m!451409))

(declare-fun m!451411 () Bool)

(assert (=> b!469042 m!451411))

(check-sat (not mapNonEmpty!21217) (not start!42000) b_and!19995 tp_is_empty!13015 (not b!469039) (not b!469040) (not b!469044) (not b_next!11587) (not b!469042))
(check-sat b_and!19995 (not b_next!11587))
(get-model)

(declare-fun d!75301 () Bool)

(declare-fun res!280378 () Bool)

(declare-fun e!274653 () Bool)

(assert (=> d!75301 (=> res!280378 e!274653)))

(assert (=> d!75301 (= res!280378 (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!274653)))

(declare-fun b!469101 () Bool)

(declare-fun e!274655 () Bool)

(assert (=> b!469101 (= e!274653 e!274655)))

(declare-fun c!56826 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!469101 (= c!56826 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30341 () Bool)

(declare-fun call!30344 () Bool)

(assert (=> bm!30341 (= call!30344 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!469102 () Bool)

(assert (=> b!469102 (= e!274655 call!30344)))

(declare-fun b!469103 () Bool)

(declare-fun e!274654 () Bool)

(assert (=> b!469103 (= e!274655 e!274654)))

(declare-fun lt!212484 () (_ BitVec 64))

(assert (=> b!469103 (= lt!212484 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212483 () Unit!13695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29788 (_ BitVec 64) (_ BitVec 32)) Unit!13695)

(assert (=> b!469103 (= lt!212483 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!212484 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!469103 (arrayContainsKey!0 _keys!1025 lt!212484 #b00000000000000000000000000000000)))

(declare-fun lt!212485 () Unit!13695)

(assert (=> b!469103 (= lt!212485 lt!212483)))

(declare-fun res!280377 () Bool)

(declare-datatypes ((SeekEntryResult!3499 0))(
  ( (MissingZero!3499 (index!16175 (_ BitVec 32))) (Found!3499 (index!16176 (_ BitVec 32))) (Intermediate!3499 (undefined!4311 Bool) (index!16177 (_ BitVec 32)) (x!43866 (_ BitVec 32))) (Undefined!3499) (MissingVacant!3499 (index!16178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29788 (_ BitVec 32)) SeekEntryResult!3499)

(assert (=> b!469103 (= res!280377 (= (seekEntryOrOpen!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3499 #b00000000000000000000000000000000)))))

(assert (=> b!469103 (=> (not res!280377) (not e!274654))))

(declare-fun b!469104 () Bool)

(assert (=> b!469104 (= e!274654 call!30344)))

(assert (= (and d!75301 (not res!280378)) b!469101))

(assert (= (and b!469101 c!56826) b!469103))

(assert (= (and b!469101 (not c!56826)) b!469102))

(assert (= (and b!469103 res!280377) b!469104))

(assert (= (or b!469104 b!469102) bm!30341))

(declare-fun m!451473 () Bool)

(assert (=> b!469101 m!451473))

(assert (=> b!469101 m!451473))

(declare-fun m!451475 () Bool)

(assert (=> b!469101 m!451475))

(declare-fun m!451477 () Bool)

(assert (=> bm!30341 m!451477))

(assert (=> b!469103 m!451473))

(declare-fun m!451479 () Bool)

(assert (=> b!469103 m!451479))

(declare-fun m!451481 () Bool)

(assert (=> b!469103 m!451481))

(assert (=> b!469103 m!451473))

(declare-fun m!451483 () Bool)

(assert (=> b!469103 m!451483))

(assert (=> b!469044 d!75301))

(declare-fun b!469115 () Bool)

(declare-fun e!274665 () Bool)

(declare-fun contains!2515 (List!8617 (_ BitVec 64)) Bool)

(assert (=> b!469115 (= e!274665 (contains!2515 Nil!8614 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75303 () Bool)

(declare-fun res!280387 () Bool)

(declare-fun e!274664 () Bool)

(assert (=> d!75303 (=> res!280387 e!274664)))

(assert (=> d!75303 (= res!280387 (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75303 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8614) e!274664)))

(declare-fun b!469116 () Bool)

(declare-fun e!274667 () Bool)

(declare-fun call!30347 () Bool)

(assert (=> b!469116 (= e!274667 call!30347)))

(declare-fun b!469117 () Bool)

(declare-fun e!274666 () Bool)

(assert (=> b!469117 (= e!274664 e!274666)))

(declare-fun res!280385 () Bool)

(assert (=> b!469117 (=> (not res!280385) (not e!274666))))

(assert (=> b!469117 (= res!280385 (not e!274665))))

(declare-fun res!280386 () Bool)

(assert (=> b!469117 (=> (not res!280386) (not e!274665))))

(assert (=> b!469117 (= res!280386 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30344 () Bool)

(declare-fun c!56829 () Bool)

(assert (=> bm!30344 (= call!30347 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56829 (Cons!8613 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000) Nil!8614) Nil!8614)))))

(declare-fun b!469118 () Bool)

(assert (=> b!469118 (= e!274667 call!30347)))

(declare-fun b!469119 () Bool)

(assert (=> b!469119 (= e!274666 e!274667)))

(assert (=> b!469119 (= c!56829 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75303 (not res!280387)) b!469117))

(assert (= (and b!469117 res!280386) b!469115))

(assert (= (and b!469117 res!280385) b!469119))

(assert (= (and b!469119 c!56829) b!469118))

(assert (= (and b!469119 (not c!56829)) b!469116))

(assert (= (or b!469118 b!469116) bm!30344))

(assert (=> b!469115 m!451473))

(assert (=> b!469115 m!451473))

(declare-fun m!451485 () Bool)

(assert (=> b!469115 m!451485))

(assert (=> b!469117 m!451473))

(assert (=> b!469117 m!451473))

(assert (=> b!469117 m!451475))

(assert (=> bm!30344 m!451473))

(declare-fun m!451487 () Bool)

(assert (=> bm!30344 m!451487))

(assert (=> b!469119 m!451473))

(assert (=> b!469119 m!451473))

(assert (=> b!469119 m!451475))

(assert (=> b!469040 d!75303))

(declare-fun d!75305 () Bool)

(assert (=> d!75305 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42000 d!75305))

(declare-fun d!75307 () Bool)

(assert (=> d!75307 (= (array_inv!10430 _keys!1025) (bvsge (size!14671 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42000 d!75307))

(declare-fun d!75309 () Bool)

(assert (=> d!75309 (= (array_inv!10431 _values!833) (bvsge (size!14672 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42000 d!75309))

(declare-fun b!469162 () Bool)

(declare-fun e!274694 () Unit!13695)

(declare-fun Unit!13701 () Unit!13695)

(assert (=> b!469162 (= e!274694 Unit!13701)))

(declare-fun b!469163 () Bool)

(declare-fun e!274695 () Bool)

(declare-fun e!274699 () Bool)

(assert (=> b!469163 (= e!274695 e!274699)))

(declare-fun c!56843 () Bool)

(assert (=> b!469163 (= c!56843 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30359 () Bool)

(declare-fun call!30367 () Bool)

(declare-fun lt!212541 () ListLongMap!7455)

(declare-fun contains!2516 (ListLongMap!7455 (_ BitVec 64)) Bool)

(assert (=> bm!30359 (= call!30367 (contains!2516 lt!212541 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!274696 () Bool)

(declare-fun b!469164 () Bool)

(declare-fun apply!326 (ListLongMap!7455 (_ BitVec 64)) V!18459)

(declare-fun get!7004 (ValueCell!6164 V!18459) V!18459)

(declare-fun dynLambda!916 (Int (_ BitVec 64)) V!18459)

(assert (=> b!469164 (= e!274696 (= (apply!326 lt!212541 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)) (get!7004 (select (arr!14320 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!469164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14672 _values!833)))))

(assert (=> b!469164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun d!75311 () Bool)

(assert (=> d!75311 e!274695))

(declare-fun res!280412 () Bool)

(assert (=> d!75311 (=> (not res!280412) (not e!274695))))

(assert (=> d!75311 (= res!280412 (or (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))))

(declare-fun lt!212540 () ListLongMap!7455)

(assert (=> d!75311 (= lt!212541 lt!212540)))

(declare-fun lt!212533 () Unit!13695)

(assert (=> d!75311 (= lt!212533 e!274694)))

(declare-fun c!56845 () Bool)

(declare-fun e!274698 () Bool)

(assert (=> d!75311 (= c!56845 e!274698)))

(declare-fun res!280406 () Bool)

(assert (=> d!75311 (=> (not res!280406) (not e!274698))))

(assert (=> d!75311 (= res!280406 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun e!274705 () ListLongMap!7455)

(assert (=> d!75311 (= lt!212540 e!274705)))

(declare-fun c!56847 () Bool)

(assert (=> d!75311 (= c!56847 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75311 (validMask!0 mask!1365)))

(assert (=> d!75311 (= (getCurrentListMap!2168 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212541)))

(declare-fun bm!30360 () Bool)

(declare-fun call!30364 () Bool)

(assert (=> bm!30360 (= call!30364 (contains!2516 lt!212541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469165 () Bool)

(declare-fun lt!212530 () Unit!13695)

(assert (=> b!469165 (= e!274694 lt!212530)))

(declare-fun lt!212535 () ListLongMap!7455)

(assert (=> b!469165 (= lt!212535 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212536 () (_ BitVec 64))

(assert (=> b!469165 (= lt!212536 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212548 () (_ BitVec 64))

(assert (=> b!469165 (= lt!212548 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212531 () Unit!13695)

(declare-fun addStillContains!288 (ListLongMap!7455 (_ BitVec 64) V!18459 (_ BitVec 64)) Unit!13695)

(assert (=> b!469165 (= lt!212531 (addStillContains!288 lt!212535 lt!212536 zeroValue!794 lt!212548))))

(assert (=> b!469165 (contains!2516 (+!1702 lt!212535 (tuple2!8541 lt!212536 zeroValue!794)) lt!212548)))

(declare-fun lt!212550 () Unit!13695)

(assert (=> b!469165 (= lt!212550 lt!212531)))

(declare-fun lt!212542 () ListLongMap!7455)

(assert (=> b!469165 (= lt!212542 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212544 () (_ BitVec 64))

(assert (=> b!469165 (= lt!212544 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212549 () (_ BitVec 64))

(assert (=> b!469165 (= lt!212549 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212551 () Unit!13695)

(declare-fun addApplyDifferent!288 (ListLongMap!7455 (_ BitVec 64) V!18459 (_ BitVec 64)) Unit!13695)

(assert (=> b!469165 (= lt!212551 (addApplyDifferent!288 lt!212542 lt!212544 minValueAfter!38 lt!212549))))

(assert (=> b!469165 (= (apply!326 (+!1702 lt!212542 (tuple2!8541 lt!212544 minValueAfter!38)) lt!212549) (apply!326 lt!212542 lt!212549))))

(declare-fun lt!212537 () Unit!13695)

(assert (=> b!469165 (= lt!212537 lt!212551)))

(declare-fun lt!212532 () ListLongMap!7455)

(assert (=> b!469165 (= lt!212532 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212539 () (_ BitVec 64))

(assert (=> b!469165 (= lt!212539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212534 () (_ BitVec 64))

(assert (=> b!469165 (= lt!212534 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212538 () Unit!13695)

(assert (=> b!469165 (= lt!212538 (addApplyDifferent!288 lt!212532 lt!212539 zeroValue!794 lt!212534))))

(assert (=> b!469165 (= (apply!326 (+!1702 lt!212532 (tuple2!8541 lt!212539 zeroValue!794)) lt!212534) (apply!326 lt!212532 lt!212534))))

(declare-fun lt!212546 () Unit!13695)

(assert (=> b!469165 (= lt!212546 lt!212538)))

(declare-fun lt!212547 () ListLongMap!7455)

(assert (=> b!469165 (= lt!212547 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212545 () (_ BitVec 64))

(assert (=> b!469165 (= lt!212545 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212543 () (_ BitVec 64))

(assert (=> b!469165 (= lt!212543 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469165 (= lt!212530 (addApplyDifferent!288 lt!212547 lt!212545 minValueAfter!38 lt!212543))))

(assert (=> b!469165 (= (apply!326 (+!1702 lt!212547 (tuple2!8541 lt!212545 minValueAfter!38)) lt!212543) (apply!326 lt!212547 lt!212543))))

(declare-fun b!469166 () Bool)

(declare-fun call!30366 () ListLongMap!7455)

(assert (=> b!469166 (= e!274705 (+!1702 call!30366 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun bm!30361 () Bool)

(declare-fun call!30362 () ListLongMap!7455)

(assert (=> bm!30361 (= call!30362 call!30366)))

(declare-fun b!469167 () Bool)

(declare-fun e!274704 () Bool)

(declare-fun e!274706 () Bool)

(assert (=> b!469167 (= e!274704 e!274706)))

(declare-fun res!280407 () Bool)

(assert (=> b!469167 (= res!280407 call!30364)))

(assert (=> b!469167 (=> (not res!280407) (not e!274706))))

(declare-fun bm!30362 () Bool)

(declare-fun call!30368 () ListLongMap!7455)

(declare-fun call!30363 () ListLongMap!7455)

(assert (=> bm!30362 (= call!30368 call!30363)))

(declare-fun b!469168 () Bool)

(assert (=> b!469168 (= e!274699 (not call!30367))))

(declare-fun b!469169 () Bool)

(declare-fun c!56846 () Bool)

(assert (=> b!469169 (= c!56846 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!274703 () ListLongMap!7455)

(declare-fun e!274697 () ListLongMap!7455)

(assert (=> b!469169 (= e!274703 e!274697)))

(declare-fun bm!30363 () Bool)

(declare-fun call!30365 () ListLongMap!7455)

(assert (=> bm!30363 (= call!30363 call!30365)))

(declare-fun b!469170 () Bool)

(declare-fun e!274701 () Bool)

(assert (=> b!469170 (= e!274699 e!274701)))

(declare-fun res!280408 () Bool)

(assert (=> b!469170 (= res!280408 call!30367)))

(assert (=> b!469170 (=> (not res!280408) (not e!274701))))

(declare-fun b!469171 () Bool)

(assert (=> b!469171 (= e!274697 call!30362)))

(declare-fun b!469172 () Bool)

(assert (=> b!469172 (= e!274706 (= (apply!326 lt!212541 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!469173 () Bool)

(assert (=> b!469173 (= e!274705 e!274703)))

(declare-fun c!56842 () Bool)

(assert (=> b!469173 (= c!56842 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469174 () Bool)

(assert (=> b!469174 (= e!274704 (not call!30364))))

(declare-fun b!469175 () Bool)

(declare-fun e!274702 () Bool)

(assert (=> b!469175 (= e!274702 e!274696)))

(declare-fun res!280410 () Bool)

(assert (=> b!469175 (=> (not res!280410) (not e!274696))))

(assert (=> b!469175 (= res!280410 (contains!2516 lt!212541 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469175 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun bm!30364 () Bool)

(assert (=> bm!30364 (= call!30365 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469176 () Bool)

(declare-fun e!274700 () Bool)

(assert (=> b!469176 (= e!274700 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469177 () Bool)

(declare-fun res!280409 () Bool)

(assert (=> b!469177 (=> (not res!280409) (not e!274695))))

(assert (=> b!469177 (= res!280409 e!274702)))

(declare-fun res!280414 () Bool)

(assert (=> b!469177 (=> res!280414 e!274702)))

(assert (=> b!469177 (= res!280414 (not e!274700))))

(declare-fun res!280411 () Bool)

(assert (=> b!469177 (=> (not res!280411) (not e!274700))))

(assert (=> b!469177 (= res!280411 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun bm!30365 () Bool)

(assert (=> bm!30365 (= call!30366 (+!1702 (ite c!56847 call!30365 (ite c!56842 call!30363 call!30368)) (ite (or c!56847 c!56842) (tuple2!8541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!469178 () Bool)

(declare-fun res!280413 () Bool)

(assert (=> b!469178 (=> (not res!280413) (not e!274695))))

(assert (=> b!469178 (= res!280413 e!274704)))

(declare-fun c!56844 () Bool)

(assert (=> b!469178 (= c!56844 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!469179 () Bool)

(assert (=> b!469179 (= e!274698 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469180 () Bool)

(assert (=> b!469180 (= e!274703 call!30362)))

(declare-fun b!469181 () Bool)

(assert (=> b!469181 (= e!274697 call!30368)))

(declare-fun b!469182 () Bool)

(assert (=> b!469182 (= e!274701 (= (apply!326 lt!212541 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(assert (= (and d!75311 c!56847) b!469166))

(assert (= (and d!75311 (not c!56847)) b!469173))

(assert (= (and b!469173 c!56842) b!469180))

(assert (= (and b!469173 (not c!56842)) b!469169))

(assert (= (and b!469169 c!56846) b!469171))

(assert (= (and b!469169 (not c!56846)) b!469181))

(assert (= (or b!469171 b!469181) bm!30362))

(assert (= (or b!469180 bm!30362) bm!30363))

(assert (= (or b!469180 b!469171) bm!30361))

(assert (= (or b!469166 bm!30363) bm!30364))

(assert (= (or b!469166 bm!30361) bm!30365))

(assert (= (and d!75311 res!280406) b!469179))

(assert (= (and d!75311 c!56845) b!469165))

(assert (= (and d!75311 (not c!56845)) b!469162))

(assert (= (and d!75311 res!280412) b!469177))

(assert (= (and b!469177 res!280411) b!469176))

(assert (= (and b!469177 (not res!280414)) b!469175))

(assert (= (and b!469175 res!280410) b!469164))

(assert (= (and b!469177 res!280409) b!469178))

(assert (= (and b!469178 c!56844) b!469167))

(assert (= (and b!469178 (not c!56844)) b!469174))

(assert (= (and b!469167 res!280407) b!469172))

(assert (= (or b!469167 b!469174) bm!30360))

(assert (= (and b!469178 res!280413) b!469163))

(assert (= (and b!469163 c!56843) b!469170))

(assert (= (and b!469163 (not c!56843)) b!469168))

(assert (= (and b!469170 res!280408) b!469182))

(assert (= (or b!469170 b!469168) bm!30359))

(declare-fun b_lambda!10103 () Bool)

(assert (=> (not b_lambda!10103) (not b!469164)))

(declare-fun t!14573 () Bool)

(declare-fun tb!3909 () Bool)

(assert (=> (and start!42000 (= defaultEntry!841 defaultEntry!841) t!14573) tb!3909))

(declare-fun result!7401 () Bool)

(assert (=> tb!3909 (= result!7401 tp_is_empty!13015)))

(assert (=> b!469164 t!14573))

(declare-fun b_and!20001 () Bool)

(assert (= b_and!19995 (and (=> t!14573 result!7401) b_and!20001)))

(assert (=> d!75311 m!451401))

(assert (=> b!469176 m!451473))

(assert (=> b!469176 m!451473))

(assert (=> b!469176 m!451475))

(declare-fun m!451489 () Bool)

(assert (=> b!469166 m!451489))

(declare-fun m!451491 () Bool)

(assert (=> b!469172 m!451491))

(declare-fun m!451493 () Bool)

(assert (=> b!469165 m!451493))

(declare-fun m!451495 () Bool)

(assert (=> b!469165 m!451495))

(declare-fun m!451497 () Bool)

(assert (=> b!469165 m!451497))

(declare-fun m!451499 () Bool)

(assert (=> b!469165 m!451499))

(assert (=> b!469165 m!451495))

(declare-fun m!451501 () Bool)

(assert (=> b!469165 m!451501))

(declare-fun m!451503 () Bool)

(assert (=> b!469165 m!451503))

(declare-fun m!451505 () Bool)

(assert (=> b!469165 m!451505))

(declare-fun m!451507 () Bool)

(assert (=> b!469165 m!451507))

(declare-fun m!451509 () Bool)

(assert (=> b!469165 m!451509))

(declare-fun m!451511 () Bool)

(assert (=> b!469165 m!451511))

(declare-fun m!451513 () Bool)

(assert (=> b!469165 m!451513))

(declare-fun m!451515 () Bool)

(assert (=> b!469165 m!451515))

(assert (=> b!469165 m!451409))

(assert (=> b!469165 m!451473))

(assert (=> b!469165 m!451501))

(declare-fun m!451517 () Bool)

(assert (=> b!469165 m!451517))

(declare-fun m!451519 () Bool)

(assert (=> b!469165 m!451519))

(assert (=> b!469165 m!451517))

(declare-fun m!451521 () Bool)

(assert (=> b!469165 m!451521))

(assert (=> b!469165 m!451507))

(declare-fun m!451523 () Bool)

(assert (=> bm!30359 m!451523))

(assert (=> b!469179 m!451473))

(assert (=> b!469179 m!451473))

(assert (=> b!469179 m!451475))

(assert (=> b!469175 m!451473))

(assert (=> b!469175 m!451473))

(declare-fun m!451525 () Bool)

(assert (=> b!469175 m!451525))

(assert (=> bm!30364 m!451409))

(assert (=> b!469164 m!451473))

(declare-fun m!451527 () Bool)

(assert (=> b!469164 m!451527))

(assert (=> b!469164 m!451473))

(declare-fun m!451529 () Bool)

(assert (=> b!469164 m!451529))

(declare-fun m!451531 () Bool)

(assert (=> b!469164 m!451531))

(assert (=> b!469164 m!451529))

(declare-fun m!451533 () Bool)

(assert (=> b!469164 m!451533))

(assert (=> b!469164 m!451531))

(declare-fun m!451535 () Bool)

(assert (=> bm!30365 m!451535))

(declare-fun m!451537 () Bool)

(assert (=> bm!30360 m!451537))

(declare-fun m!451539 () Bool)

(assert (=> b!469182 m!451539))

(assert (=> b!469039 d!75311))

(declare-fun d!75313 () Bool)

(assert (=> d!75313 (= (+!1702 lt!212431 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1702 (+!1702 lt!212431 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!212554 () Unit!13695)

(declare-fun choose!1350 (ListLongMap!7455 (_ BitVec 64) V!18459 V!18459) Unit!13695)

(assert (=> d!75313 (= lt!212554 (choose!1350 lt!212431 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75313 (= (addSameAsAddTwiceSameKeyDiffValues!108 lt!212431 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!212554)))

(declare-fun bs!14878 () Bool)

(assert (= bs!14878 d!75313))

(declare-fun m!451541 () Bool)

(assert (=> bs!14878 m!451541))

(assert (=> bs!14878 m!451385))

(assert (=> bs!14878 m!451385))

(declare-fun m!451543 () Bool)

(assert (=> bs!14878 m!451543))

(declare-fun m!451545 () Bool)

(assert (=> bs!14878 m!451545))

(assert (=> b!469039 d!75313))

(declare-fun d!75315 () Bool)

(declare-fun e!274709 () Bool)

(assert (=> d!75315 e!274709))

(declare-fun res!280419 () Bool)

(assert (=> d!75315 (=> (not res!280419) (not e!274709))))

(declare-fun lt!212563 () ListLongMap!7455)

(assert (=> d!75315 (= res!280419 (contains!2516 lt!212563 (_1!4281 lt!212428)))))

(declare-fun lt!212564 () List!8616)

(assert (=> d!75315 (= lt!212563 (ListLongMap!7456 lt!212564))))

(declare-fun lt!212566 () Unit!13695)

(declare-fun lt!212565 () Unit!13695)

(assert (=> d!75315 (= lt!212566 lt!212565)))

(declare-datatypes ((Option!385 0))(
  ( (Some!384 (v!8845 V!18459)) (None!383) )
))
(declare-fun getValueByKey!379 (List!8616 (_ BitVec 64)) Option!385)

(assert (=> d!75315 (= (getValueByKey!379 lt!212564 (_1!4281 lt!212428)) (Some!384 (_2!4281 lt!212428)))))

(declare-fun lemmaContainsTupThenGetReturnValue!201 (List!8616 (_ BitVec 64) V!18459) Unit!13695)

(assert (=> d!75315 (= lt!212565 (lemmaContainsTupThenGetReturnValue!201 lt!212564 (_1!4281 lt!212428) (_2!4281 lt!212428)))))

(declare-fun insertStrictlySorted!204 (List!8616 (_ BitVec 64) V!18459) List!8616)

(assert (=> d!75315 (= lt!212564 (insertStrictlySorted!204 (toList!3743 (+!1702 lt!212431 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4281 lt!212428) (_2!4281 lt!212428)))))

(assert (=> d!75315 (= (+!1702 (+!1702 lt!212431 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212428) lt!212563)))

(declare-fun b!469189 () Bool)

(declare-fun res!280420 () Bool)

(assert (=> b!469189 (=> (not res!280420) (not e!274709))))

(assert (=> b!469189 (= res!280420 (= (getValueByKey!379 (toList!3743 lt!212563) (_1!4281 lt!212428)) (Some!384 (_2!4281 lt!212428))))))

(declare-fun b!469190 () Bool)

(declare-fun contains!2517 (List!8616 tuple2!8540) Bool)

(assert (=> b!469190 (= e!274709 (contains!2517 (toList!3743 lt!212563) lt!212428))))

(assert (= (and d!75315 res!280419) b!469189))

(assert (= (and b!469189 res!280420) b!469190))

(declare-fun m!451547 () Bool)

(assert (=> d!75315 m!451547))

(declare-fun m!451549 () Bool)

(assert (=> d!75315 m!451549))

(declare-fun m!451551 () Bool)

(assert (=> d!75315 m!451551))

(declare-fun m!451553 () Bool)

(assert (=> d!75315 m!451553))

(declare-fun m!451555 () Bool)

(assert (=> b!469189 m!451555))

(declare-fun m!451557 () Bool)

(assert (=> b!469190 m!451557))

(assert (=> b!469039 d!75315))

(declare-fun d!75317 () Bool)

(declare-fun e!274710 () Bool)

(assert (=> d!75317 e!274710))

(declare-fun res!280421 () Bool)

(assert (=> d!75317 (=> (not res!280421) (not e!274710))))

(declare-fun lt!212567 () ListLongMap!7455)

(assert (=> d!75317 (= res!280421 (contains!2516 lt!212567 (_1!4281 lt!212428)))))

(declare-fun lt!212568 () List!8616)

(assert (=> d!75317 (= lt!212567 (ListLongMap!7456 lt!212568))))

(declare-fun lt!212570 () Unit!13695)

(declare-fun lt!212569 () Unit!13695)

(assert (=> d!75317 (= lt!212570 lt!212569)))

(assert (=> d!75317 (= (getValueByKey!379 lt!212568 (_1!4281 lt!212428)) (Some!384 (_2!4281 lt!212428)))))

(assert (=> d!75317 (= lt!212569 (lemmaContainsTupThenGetReturnValue!201 lt!212568 (_1!4281 lt!212428) (_2!4281 lt!212428)))))

(assert (=> d!75317 (= lt!212568 (insertStrictlySorted!204 (toList!3743 lt!212431) (_1!4281 lt!212428) (_2!4281 lt!212428)))))

(assert (=> d!75317 (= (+!1702 lt!212431 lt!212428) lt!212567)))

(declare-fun b!469191 () Bool)

(declare-fun res!280422 () Bool)

(assert (=> b!469191 (=> (not res!280422) (not e!274710))))

(assert (=> b!469191 (= res!280422 (= (getValueByKey!379 (toList!3743 lt!212567) (_1!4281 lt!212428)) (Some!384 (_2!4281 lt!212428))))))

(declare-fun b!469192 () Bool)

(assert (=> b!469192 (= e!274710 (contains!2517 (toList!3743 lt!212567) lt!212428))))

(assert (= (and d!75317 res!280421) b!469191))

(assert (= (and b!469191 res!280422) b!469192))

(declare-fun m!451559 () Bool)

(assert (=> d!75317 m!451559))

(declare-fun m!451561 () Bool)

(assert (=> d!75317 m!451561))

(declare-fun m!451563 () Bool)

(assert (=> d!75317 m!451563))

(declare-fun m!451565 () Bool)

(assert (=> d!75317 m!451565))

(declare-fun m!451567 () Bool)

(assert (=> b!469191 m!451567))

(declare-fun m!451569 () Bool)

(assert (=> b!469192 m!451569))

(assert (=> b!469039 d!75317))

(declare-fun b!469193 () Bool)

(declare-fun e!274711 () Unit!13695)

(declare-fun Unit!13702 () Unit!13695)

(assert (=> b!469193 (= e!274711 Unit!13702)))

(declare-fun b!469194 () Bool)

(declare-fun e!274712 () Bool)

(declare-fun e!274716 () Bool)

(assert (=> b!469194 (= e!274712 e!274716)))

(declare-fun c!56849 () Bool)

(assert (=> b!469194 (= c!56849 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30366 () Bool)

(declare-fun call!30374 () Bool)

(declare-fun lt!212582 () ListLongMap!7455)

(assert (=> bm!30366 (= call!30374 (contains!2516 lt!212582 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!274713 () Bool)

(declare-fun b!469195 () Bool)

(assert (=> b!469195 (= e!274713 (= (apply!326 lt!212582 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)) (get!7004 (select (arr!14320 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!469195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14672 _values!833)))))

(assert (=> b!469195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun d!75319 () Bool)

(assert (=> d!75319 e!274712))

(declare-fun res!280429 () Bool)

(assert (=> d!75319 (=> (not res!280429) (not e!274712))))

(assert (=> d!75319 (= res!280429 (or (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))))

(declare-fun lt!212581 () ListLongMap!7455)

(assert (=> d!75319 (= lt!212582 lt!212581)))

(declare-fun lt!212574 () Unit!13695)

(assert (=> d!75319 (= lt!212574 e!274711)))

(declare-fun c!56851 () Bool)

(declare-fun e!274715 () Bool)

(assert (=> d!75319 (= c!56851 e!274715)))

(declare-fun res!280423 () Bool)

(assert (=> d!75319 (=> (not res!280423) (not e!274715))))

(assert (=> d!75319 (= res!280423 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun e!274722 () ListLongMap!7455)

(assert (=> d!75319 (= lt!212581 e!274722)))

(declare-fun c!56853 () Bool)

(assert (=> d!75319 (= c!56853 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75319 (validMask!0 mask!1365)))

(assert (=> d!75319 (= (getCurrentListMap!2168 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212582)))

(declare-fun bm!30367 () Bool)

(declare-fun call!30371 () Bool)

(assert (=> bm!30367 (= call!30371 (contains!2516 lt!212582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!469196 () Bool)

(declare-fun lt!212571 () Unit!13695)

(assert (=> b!469196 (= e!274711 lt!212571)))

(declare-fun lt!212576 () ListLongMap!7455)

(assert (=> b!469196 (= lt!212576 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212577 () (_ BitVec 64))

(assert (=> b!469196 (= lt!212577 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212589 () (_ BitVec 64))

(assert (=> b!469196 (= lt!212589 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212572 () Unit!13695)

(assert (=> b!469196 (= lt!212572 (addStillContains!288 lt!212576 lt!212577 zeroValue!794 lt!212589))))

(assert (=> b!469196 (contains!2516 (+!1702 lt!212576 (tuple2!8541 lt!212577 zeroValue!794)) lt!212589)))

(declare-fun lt!212591 () Unit!13695)

(assert (=> b!469196 (= lt!212591 lt!212572)))

(declare-fun lt!212583 () ListLongMap!7455)

(assert (=> b!469196 (= lt!212583 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212585 () (_ BitVec 64))

(assert (=> b!469196 (= lt!212585 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212590 () (_ BitVec 64))

(assert (=> b!469196 (= lt!212590 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212592 () Unit!13695)

(assert (=> b!469196 (= lt!212592 (addApplyDifferent!288 lt!212583 lt!212585 minValueBefore!38 lt!212590))))

(assert (=> b!469196 (= (apply!326 (+!1702 lt!212583 (tuple2!8541 lt!212585 minValueBefore!38)) lt!212590) (apply!326 lt!212583 lt!212590))))

(declare-fun lt!212578 () Unit!13695)

(assert (=> b!469196 (= lt!212578 lt!212592)))

(declare-fun lt!212573 () ListLongMap!7455)

(assert (=> b!469196 (= lt!212573 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212580 () (_ BitVec 64))

(assert (=> b!469196 (= lt!212580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212575 () (_ BitVec 64))

(assert (=> b!469196 (= lt!212575 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!212579 () Unit!13695)

(assert (=> b!469196 (= lt!212579 (addApplyDifferent!288 lt!212573 lt!212580 zeroValue!794 lt!212575))))

(assert (=> b!469196 (= (apply!326 (+!1702 lt!212573 (tuple2!8541 lt!212580 zeroValue!794)) lt!212575) (apply!326 lt!212573 lt!212575))))

(declare-fun lt!212587 () Unit!13695)

(assert (=> b!469196 (= lt!212587 lt!212579)))

(declare-fun lt!212588 () ListLongMap!7455)

(assert (=> b!469196 (= lt!212588 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212586 () (_ BitVec 64))

(assert (=> b!469196 (= lt!212586 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!212584 () (_ BitVec 64))

(assert (=> b!469196 (= lt!212584 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469196 (= lt!212571 (addApplyDifferent!288 lt!212588 lt!212586 minValueBefore!38 lt!212584))))

(assert (=> b!469196 (= (apply!326 (+!1702 lt!212588 (tuple2!8541 lt!212586 minValueBefore!38)) lt!212584) (apply!326 lt!212588 lt!212584))))

(declare-fun b!469197 () Bool)

(declare-fun call!30373 () ListLongMap!7455)

(assert (=> b!469197 (= e!274722 (+!1702 call!30373 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun bm!30368 () Bool)

(declare-fun call!30369 () ListLongMap!7455)

(assert (=> bm!30368 (= call!30369 call!30373)))

(declare-fun b!469198 () Bool)

(declare-fun e!274721 () Bool)

(declare-fun e!274723 () Bool)

(assert (=> b!469198 (= e!274721 e!274723)))

(declare-fun res!280424 () Bool)

(assert (=> b!469198 (= res!280424 call!30371)))

(assert (=> b!469198 (=> (not res!280424) (not e!274723))))

(declare-fun bm!30369 () Bool)

(declare-fun call!30375 () ListLongMap!7455)

(declare-fun call!30370 () ListLongMap!7455)

(assert (=> bm!30369 (= call!30375 call!30370)))

(declare-fun b!469199 () Bool)

(assert (=> b!469199 (= e!274716 (not call!30374))))

(declare-fun b!469200 () Bool)

(declare-fun c!56852 () Bool)

(assert (=> b!469200 (= c!56852 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!274720 () ListLongMap!7455)

(declare-fun e!274714 () ListLongMap!7455)

(assert (=> b!469200 (= e!274720 e!274714)))

(declare-fun bm!30370 () Bool)

(declare-fun call!30372 () ListLongMap!7455)

(assert (=> bm!30370 (= call!30370 call!30372)))

(declare-fun b!469201 () Bool)

(declare-fun e!274718 () Bool)

(assert (=> b!469201 (= e!274716 e!274718)))

(declare-fun res!280425 () Bool)

(assert (=> b!469201 (= res!280425 call!30374)))

(assert (=> b!469201 (=> (not res!280425) (not e!274718))))

(declare-fun b!469202 () Bool)

(assert (=> b!469202 (= e!274714 call!30369)))

(declare-fun b!469203 () Bool)

(assert (=> b!469203 (= e!274723 (= (apply!326 lt!212582 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!469204 () Bool)

(assert (=> b!469204 (= e!274722 e!274720)))

(declare-fun c!56848 () Bool)

(assert (=> b!469204 (= c!56848 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!469205 () Bool)

(assert (=> b!469205 (= e!274721 (not call!30371))))

(declare-fun b!469206 () Bool)

(declare-fun e!274719 () Bool)

(assert (=> b!469206 (= e!274719 e!274713)))

(declare-fun res!280427 () Bool)

(assert (=> b!469206 (=> (not res!280427) (not e!274713))))

(assert (=> b!469206 (= res!280427 (contains!2516 lt!212582 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun bm!30371 () Bool)

(assert (=> bm!30371 (= call!30372 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469207 () Bool)

(declare-fun e!274717 () Bool)

(assert (=> b!469207 (= e!274717 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469208 () Bool)

(declare-fun res!280426 () Bool)

(assert (=> b!469208 (=> (not res!280426) (not e!274712))))

(assert (=> b!469208 (= res!280426 e!274719)))

(declare-fun res!280431 () Bool)

(assert (=> b!469208 (=> res!280431 e!274719)))

(assert (=> b!469208 (= res!280431 (not e!274717))))

(declare-fun res!280428 () Bool)

(assert (=> b!469208 (=> (not res!280428) (not e!274717))))

(assert (=> b!469208 (= res!280428 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun bm!30372 () Bool)

(assert (=> bm!30372 (= call!30373 (+!1702 (ite c!56853 call!30372 (ite c!56848 call!30370 call!30375)) (ite (or c!56853 c!56848) (tuple2!8541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!469209 () Bool)

(declare-fun res!280430 () Bool)

(assert (=> b!469209 (=> (not res!280430) (not e!274712))))

(assert (=> b!469209 (= res!280430 e!274721)))

(declare-fun c!56850 () Bool)

(assert (=> b!469209 (= c!56850 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!469210 () Bool)

(assert (=> b!469210 (= e!274715 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469211 () Bool)

(assert (=> b!469211 (= e!274720 call!30369)))

(declare-fun b!469212 () Bool)

(assert (=> b!469212 (= e!274714 call!30375)))

(declare-fun b!469213 () Bool)

(assert (=> b!469213 (= e!274718 (= (apply!326 lt!212582 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(assert (= (and d!75319 c!56853) b!469197))

(assert (= (and d!75319 (not c!56853)) b!469204))

(assert (= (and b!469204 c!56848) b!469211))

(assert (= (and b!469204 (not c!56848)) b!469200))

(assert (= (and b!469200 c!56852) b!469202))

(assert (= (and b!469200 (not c!56852)) b!469212))

(assert (= (or b!469202 b!469212) bm!30369))

(assert (= (or b!469211 bm!30369) bm!30370))

(assert (= (or b!469211 b!469202) bm!30368))

(assert (= (or b!469197 bm!30370) bm!30371))

(assert (= (or b!469197 bm!30368) bm!30372))

(assert (= (and d!75319 res!280423) b!469210))

(assert (= (and d!75319 c!56851) b!469196))

(assert (= (and d!75319 (not c!56851)) b!469193))

(assert (= (and d!75319 res!280429) b!469208))

(assert (= (and b!469208 res!280428) b!469207))

(assert (= (and b!469208 (not res!280431)) b!469206))

(assert (= (and b!469206 res!280427) b!469195))

(assert (= (and b!469208 res!280426) b!469209))

(assert (= (and b!469209 c!56850) b!469198))

(assert (= (and b!469209 (not c!56850)) b!469205))

(assert (= (and b!469198 res!280424) b!469203))

(assert (= (or b!469198 b!469205) bm!30367))

(assert (= (and b!469209 res!280430) b!469194))

(assert (= (and b!469194 c!56849) b!469201))

(assert (= (and b!469194 (not c!56849)) b!469199))

(assert (= (and b!469201 res!280425) b!469213))

(assert (= (or b!469201 b!469199) bm!30366))

(declare-fun b_lambda!10105 () Bool)

(assert (=> (not b_lambda!10105) (not b!469195)))

(assert (=> b!469195 t!14573))

(declare-fun b_and!20003 () Bool)

(assert (= b_and!20001 (and (=> t!14573 result!7401) b_and!20003)))

(assert (=> d!75319 m!451401))

(assert (=> b!469207 m!451473))

(assert (=> b!469207 m!451473))

(assert (=> b!469207 m!451475))

(declare-fun m!451571 () Bool)

(assert (=> b!469197 m!451571))

(declare-fun m!451573 () Bool)

(assert (=> b!469203 m!451573))

(declare-fun m!451575 () Bool)

(assert (=> b!469196 m!451575))

(declare-fun m!451577 () Bool)

(assert (=> b!469196 m!451577))

(declare-fun m!451579 () Bool)

(assert (=> b!469196 m!451579))

(declare-fun m!451581 () Bool)

(assert (=> b!469196 m!451581))

(assert (=> b!469196 m!451577))

(declare-fun m!451583 () Bool)

(assert (=> b!469196 m!451583))

(declare-fun m!451585 () Bool)

(assert (=> b!469196 m!451585))

(declare-fun m!451587 () Bool)

(assert (=> b!469196 m!451587))

(declare-fun m!451589 () Bool)

(assert (=> b!469196 m!451589))

(declare-fun m!451591 () Bool)

(assert (=> b!469196 m!451591))

(declare-fun m!451593 () Bool)

(assert (=> b!469196 m!451593))

(declare-fun m!451595 () Bool)

(assert (=> b!469196 m!451595))

(declare-fun m!451597 () Bool)

(assert (=> b!469196 m!451597))

(assert (=> b!469196 m!451411))

(assert (=> b!469196 m!451473))

(assert (=> b!469196 m!451583))

(declare-fun m!451599 () Bool)

(assert (=> b!469196 m!451599))

(declare-fun m!451601 () Bool)

(assert (=> b!469196 m!451601))

(assert (=> b!469196 m!451599))

(declare-fun m!451603 () Bool)

(assert (=> b!469196 m!451603))

(assert (=> b!469196 m!451589))

(declare-fun m!451605 () Bool)

(assert (=> bm!30366 m!451605))

(assert (=> b!469210 m!451473))

(assert (=> b!469210 m!451473))

(assert (=> b!469210 m!451475))

(assert (=> b!469206 m!451473))

(assert (=> b!469206 m!451473))

(declare-fun m!451607 () Bool)

(assert (=> b!469206 m!451607))

(assert (=> bm!30371 m!451411))

(assert (=> b!469195 m!451473))

(declare-fun m!451609 () Bool)

(assert (=> b!469195 m!451609))

(assert (=> b!469195 m!451473))

(assert (=> b!469195 m!451529))

(assert (=> b!469195 m!451531))

(assert (=> b!469195 m!451529))

(assert (=> b!469195 m!451533))

(assert (=> b!469195 m!451531))

(declare-fun m!451611 () Bool)

(assert (=> bm!30372 m!451611))

(declare-fun m!451613 () Bool)

(assert (=> bm!30367 m!451613))

(declare-fun m!451615 () Bool)

(assert (=> b!469213 m!451615))

(assert (=> b!469039 d!75319))

(declare-fun d!75321 () Bool)

(declare-fun e!274724 () Bool)

(assert (=> d!75321 e!274724))

(declare-fun res!280432 () Bool)

(assert (=> d!75321 (=> (not res!280432) (not e!274724))))

(declare-fun lt!212593 () ListLongMap!7455)

(assert (=> d!75321 (= res!280432 (contains!2516 lt!212593 (_1!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!212594 () List!8616)

(assert (=> d!75321 (= lt!212593 (ListLongMap!7456 lt!212594))))

(declare-fun lt!212596 () Unit!13695)

(declare-fun lt!212595 () Unit!13695)

(assert (=> d!75321 (= lt!212596 lt!212595)))

(assert (=> d!75321 (= (getValueByKey!379 lt!212594 (_1!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!384 (_2!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75321 (= lt!212595 (lemmaContainsTupThenGetReturnValue!201 lt!212594 (_1!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75321 (= lt!212594 (insertStrictlySorted!204 (toList!3743 lt!212431) (_1!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75321 (= (+!1702 lt!212431 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212593)))

(declare-fun b!469214 () Bool)

(declare-fun res!280433 () Bool)

(assert (=> b!469214 (=> (not res!280433) (not e!274724))))

(assert (=> b!469214 (= res!280433 (= (getValueByKey!379 (toList!3743 lt!212593) (_1!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!384 (_2!4281 (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!469215 () Bool)

(assert (=> b!469215 (= e!274724 (contains!2517 (toList!3743 lt!212593) (tuple2!8541 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75321 res!280432) b!469214))

(assert (= (and b!469214 res!280433) b!469215))

(declare-fun m!451617 () Bool)

(assert (=> d!75321 m!451617))

(declare-fun m!451619 () Bool)

(assert (=> d!75321 m!451619))

(declare-fun m!451621 () Bool)

(assert (=> d!75321 m!451621))

(declare-fun m!451623 () Bool)

(assert (=> d!75321 m!451623))

(declare-fun m!451625 () Bool)

(assert (=> b!469214 m!451625))

(declare-fun m!451627 () Bool)

(assert (=> b!469215 m!451627))

(assert (=> b!469039 d!75321))

(declare-fun d!75323 () Bool)

(assert (=> d!75323 (= (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212599 () Unit!13695)

(declare-fun choose!1351 (array!29788 array!29790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18459 V!18459 V!18459 V!18459 (_ BitVec 32) Int) Unit!13695)

(assert (=> d!75323 (= lt!212599 (choose!1351 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75323 (validMask!0 mask!1365)))

(assert (=> d!75323 (= (lemmaNoChangeToArrayThenSameMapNoExtras!122 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212599)))

(declare-fun bs!14879 () Bool)

(assert (= bs!14879 d!75323))

(assert (=> bs!14879 m!451411))

(assert (=> bs!14879 m!451409))

(declare-fun m!451629 () Bool)

(assert (=> bs!14879 m!451629))

(assert (=> bs!14879 m!451401))

(assert (=> b!469042 d!75323))

(declare-fun call!30378 () ListLongMap!7455)

(declare-fun bm!30375 () Bool)

(assert (=> bm!30375 (= call!30378 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!469241 () Bool)

(declare-fun e!274739 () ListLongMap!7455)

(assert (=> b!469241 (= e!274739 call!30378)))

(declare-fun b!469242 () Bool)

(assert (=> b!469242 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> b!469242 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14672 _values!833)))))

(declare-fun lt!212616 () ListLongMap!7455)

(declare-fun e!274740 () Bool)

(assert (=> b!469242 (= e!274740 (= (apply!326 lt!212616 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)) (get!7004 (select (arr!14320 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!469243 () Bool)

(declare-fun e!274742 () Bool)

(declare-fun isEmpty!579 (ListLongMap!7455) Bool)

(assert (=> b!469243 (= e!274742 (isEmpty!579 lt!212616))))

(declare-fun b!469244 () Bool)

(declare-fun e!274745 () Bool)

(assert (=> b!469244 (= e!274745 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469244 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!469245 () Bool)

(assert (=> b!469245 (= e!274742 (= lt!212616 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!469246 () Bool)

(declare-fun res!280444 () Bool)

(declare-fun e!274743 () Bool)

(assert (=> b!469246 (=> (not res!280444) (not e!274743))))

(assert (=> b!469246 (= res!280444 (not (contains!2516 lt!212616 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!469247 () Bool)

(declare-fun e!274741 () Bool)

(assert (=> b!469247 (= e!274743 e!274741)))

(declare-fun c!56863 () Bool)

(assert (=> b!469247 (= c!56863 e!274745)))

(declare-fun res!280442 () Bool)

(assert (=> b!469247 (=> (not res!280442) (not e!274745))))

(assert (=> b!469247 (= res!280442 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!469240 () Bool)

(assert (=> b!469240 (= e!274741 e!274740)))

(assert (=> b!469240 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun res!280445 () Bool)

(assert (=> b!469240 (= res!280445 (contains!2516 lt!212616 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469240 (=> (not res!280445) (not e!274740))))

(declare-fun d!75325 () Bool)

(assert (=> d!75325 e!274743))

(declare-fun res!280443 () Bool)

(assert (=> d!75325 (=> (not res!280443) (not e!274743))))

(assert (=> d!75325 (= res!280443 (not (contains!2516 lt!212616 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!274744 () ListLongMap!7455)

(assert (=> d!75325 (= lt!212616 e!274744)))

(declare-fun c!56862 () Bool)

(assert (=> d!75325 (= c!56862 (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75325 (validMask!0 mask!1365)))

(assert (=> d!75325 (= (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212616)))

(declare-fun b!469248 () Bool)

(declare-fun lt!212619 () Unit!13695)

(declare-fun lt!212617 () Unit!13695)

(assert (=> b!469248 (= lt!212619 lt!212617)))

(declare-fun lt!212615 () V!18459)

(declare-fun lt!212618 () ListLongMap!7455)

(declare-fun lt!212614 () (_ BitVec 64))

(declare-fun lt!212620 () (_ BitVec 64))

(assert (=> b!469248 (not (contains!2516 (+!1702 lt!212618 (tuple2!8541 lt!212614 lt!212615)) lt!212620))))

(declare-fun addStillNotContains!161 (ListLongMap!7455 (_ BitVec 64) V!18459 (_ BitVec 64)) Unit!13695)

(assert (=> b!469248 (= lt!212617 (addStillNotContains!161 lt!212618 lt!212614 lt!212615 lt!212620))))

(assert (=> b!469248 (= lt!212620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!469248 (= lt!212615 (get!7004 (select (arr!14320 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!469248 (= lt!212614 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469248 (= lt!212618 call!30378)))

(assert (=> b!469248 (= e!274739 (+!1702 call!30378 (tuple2!8541 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000) (get!7004 (select (arr!14320 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!469249 () Bool)

(assert (=> b!469249 (= e!274744 (ListLongMap!7456 Nil!8613))))

(declare-fun b!469250 () Bool)

(assert (=> b!469250 (= e!274741 e!274742)))

(declare-fun c!56865 () Bool)

(assert (=> b!469250 (= c!56865 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!469251 () Bool)

(assert (=> b!469251 (= e!274744 e!274739)))

(declare-fun c!56864 () Bool)

(assert (=> b!469251 (= c!56864 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75325 c!56862) b!469249))

(assert (= (and d!75325 (not c!56862)) b!469251))

(assert (= (and b!469251 c!56864) b!469248))

(assert (= (and b!469251 (not c!56864)) b!469241))

(assert (= (or b!469248 b!469241) bm!30375))

(assert (= (and d!75325 res!280443) b!469246))

(assert (= (and b!469246 res!280444) b!469247))

(assert (= (and b!469247 res!280442) b!469244))

(assert (= (and b!469247 c!56863) b!469240))

(assert (= (and b!469247 (not c!56863)) b!469250))

(assert (= (and b!469240 res!280445) b!469242))

(assert (= (and b!469250 c!56865) b!469245))

(assert (= (and b!469250 (not c!56865)) b!469243))

(declare-fun b_lambda!10107 () Bool)

(assert (=> (not b_lambda!10107) (not b!469242)))

(assert (=> b!469242 t!14573))

(declare-fun b_and!20005 () Bool)

(assert (= b_and!20003 (and (=> t!14573 result!7401) b_and!20005)))

(declare-fun b_lambda!10109 () Bool)

(assert (=> (not b_lambda!10109) (not b!469248)))

(assert (=> b!469248 t!14573))

(declare-fun b_and!20007 () Bool)

(assert (= b_and!20005 (and (=> t!14573 result!7401) b_and!20007)))

(assert (=> b!469251 m!451473))

(assert (=> b!469251 m!451473))

(assert (=> b!469251 m!451475))

(declare-fun m!451631 () Bool)

(assert (=> b!469243 m!451631))

(declare-fun m!451633 () Bool)

(assert (=> b!469245 m!451633))

(declare-fun m!451635 () Bool)

(assert (=> b!469246 m!451635))

(declare-fun m!451637 () Bool)

(assert (=> d!75325 m!451637))

(assert (=> d!75325 m!451401))

(assert (=> b!469244 m!451473))

(assert (=> b!469244 m!451473))

(assert (=> b!469244 m!451475))

(assert (=> bm!30375 m!451633))

(assert (=> b!469248 m!451529))

(declare-fun m!451639 () Bool)

(assert (=> b!469248 m!451639))

(declare-fun m!451641 () Bool)

(assert (=> b!469248 m!451641))

(assert (=> b!469248 m!451531))

(assert (=> b!469248 m!451529))

(assert (=> b!469248 m!451533))

(declare-fun m!451643 () Bool)

(assert (=> b!469248 m!451643))

(assert (=> b!469248 m!451639))

(declare-fun m!451645 () Bool)

(assert (=> b!469248 m!451645))

(assert (=> b!469248 m!451531))

(assert (=> b!469248 m!451473))

(assert (=> b!469240 m!451473))

(assert (=> b!469240 m!451473))

(declare-fun m!451647 () Bool)

(assert (=> b!469240 m!451647))

(assert (=> b!469242 m!451529))

(assert (=> b!469242 m!451531))

(assert (=> b!469242 m!451529))

(assert (=> b!469242 m!451533))

(assert (=> b!469242 m!451473))

(declare-fun m!451649 () Bool)

(assert (=> b!469242 m!451649))

(assert (=> b!469242 m!451531))

(assert (=> b!469242 m!451473))

(assert (=> b!469042 d!75325))

(declare-fun bm!30376 () Bool)

(declare-fun call!30379 () ListLongMap!7455)

(assert (=> bm!30376 (= call!30379 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!469253 () Bool)

(declare-fun e!274746 () ListLongMap!7455)

(assert (=> b!469253 (= e!274746 call!30379)))

(declare-fun b!469254 () Bool)

(assert (=> b!469254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> b!469254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14672 _values!833)))))

(declare-fun lt!212623 () ListLongMap!7455)

(declare-fun e!274747 () Bool)

(assert (=> b!469254 (= e!274747 (= (apply!326 lt!212623 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)) (get!7004 (select (arr!14320 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!469255 () Bool)

(declare-fun e!274749 () Bool)

(assert (=> b!469255 (= e!274749 (isEmpty!579 lt!212623))))

(declare-fun b!469256 () Bool)

(declare-fun e!274752 () Bool)

(assert (=> b!469256 (= e!274752 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469256 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!469257 () Bool)

(assert (=> b!469257 (= e!274749 (= lt!212623 (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!469258 () Bool)

(declare-fun res!280448 () Bool)

(declare-fun e!274750 () Bool)

(assert (=> b!469258 (=> (not res!280448) (not e!274750))))

(assert (=> b!469258 (= res!280448 (not (contains!2516 lt!212623 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!469259 () Bool)

(declare-fun e!274748 () Bool)

(assert (=> b!469259 (= e!274750 e!274748)))

(declare-fun c!56867 () Bool)

(assert (=> b!469259 (= c!56867 e!274752)))

(declare-fun res!280446 () Bool)

(assert (=> b!469259 (=> (not res!280446) (not e!274752))))

(assert (=> b!469259 (= res!280446 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!469252 () Bool)

(assert (=> b!469252 (= e!274748 e!274747)))

(assert (=> b!469252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun res!280449 () Bool)

(assert (=> b!469252 (= res!280449 (contains!2516 lt!212623 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!469252 (=> (not res!280449) (not e!274747))))

(declare-fun d!75327 () Bool)

(assert (=> d!75327 e!274750))

(declare-fun res!280447 () Bool)

(assert (=> d!75327 (=> (not res!280447) (not e!274750))))

(assert (=> d!75327 (= res!280447 (not (contains!2516 lt!212623 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!274751 () ListLongMap!7455)

(assert (=> d!75327 (= lt!212623 e!274751)))

(declare-fun c!56866 () Bool)

(assert (=> d!75327 (= c!56866 (bvsge #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(assert (=> d!75327 (validMask!0 mask!1365)))

(assert (=> d!75327 (= (getCurrentListMapNoExtraKeys!1962 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!212623)))

(declare-fun b!469260 () Bool)

(declare-fun lt!212626 () Unit!13695)

(declare-fun lt!212624 () Unit!13695)

(assert (=> b!469260 (= lt!212626 lt!212624)))

(declare-fun lt!212625 () ListLongMap!7455)

(declare-fun lt!212622 () V!18459)

(declare-fun lt!212621 () (_ BitVec 64))

(declare-fun lt!212627 () (_ BitVec 64))

(assert (=> b!469260 (not (contains!2516 (+!1702 lt!212625 (tuple2!8541 lt!212621 lt!212622)) lt!212627))))

(assert (=> b!469260 (= lt!212624 (addStillNotContains!161 lt!212625 lt!212621 lt!212622 lt!212627))))

(assert (=> b!469260 (= lt!212627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!469260 (= lt!212622 (get!7004 (select (arr!14320 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!469260 (= lt!212621 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!469260 (= lt!212625 call!30379)))

(assert (=> b!469260 (= e!274746 (+!1702 call!30379 (tuple2!8541 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000) (get!7004 (select (arr!14320 _values!833) #b00000000000000000000000000000000) (dynLambda!916 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!469261 () Bool)

(assert (=> b!469261 (= e!274751 (ListLongMap!7456 Nil!8613))))

(declare-fun b!469262 () Bool)

(assert (=> b!469262 (= e!274748 e!274749)))

(declare-fun c!56869 () Bool)

(assert (=> b!469262 (= c!56869 (bvslt #b00000000000000000000000000000000 (size!14671 _keys!1025)))))

(declare-fun b!469263 () Bool)

(assert (=> b!469263 (= e!274751 e!274746)))

(declare-fun c!56868 () Bool)

(assert (=> b!469263 (= c!56868 (validKeyInArray!0 (select (arr!14319 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75327 c!56866) b!469261))

(assert (= (and d!75327 (not c!56866)) b!469263))

(assert (= (and b!469263 c!56868) b!469260))

(assert (= (and b!469263 (not c!56868)) b!469253))

(assert (= (or b!469260 b!469253) bm!30376))

(assert (= (and d!75327 res!280447) b!469258))

(assert (= (and b!469258 res!280448) b!469259))

(assert (= (and b!469259 res!280446) b!469256))

(assert (= (and b!469259 c!56867) b!469252))

(assert (= (and b!469259 (not c!56867)) b!469262))

(assert (= (and b!469252 res!280449) b!469254))

(assert (= (and b!469262 c!56869) b!469257))

(assert (= (and b!469262 (not c!56869)) b!469255))

(declare-fun b_lambda!10111 () Bool)

(assert (=> (not b_lambda!10111) (not b!469254)))

(assert (=> b!469254 t!14573))

(declare-fun b_and!20009 () Bool)

(assert (= b_and!20007 (and (=> t!14573 result!7401) b_and!20009)))

(declare-fun b_lambda!10113 () Bool)

(assert (=> (not b_lambda!10113) (not b!469260)))

(assert (=> b!469260 t!14573))

(declare-fun b_and!20011 () Bool)

(assert (= b_and!20009 (and (=> t!14573 result!7401) b_and!20011)))

(assert (=> b!469263 m!451473))

(assert (=> b!469263 m!451473))

(assert (=> b!469263 m!451475))

(declare-fun m!451651 () Bool)

(assert (=> b!469255 m!451651))

(declare-fun m!451653 () Bool)

(assert (=> b!469257 m!451653))

(declare-fun m!451655 () Bool)

(assert (=> b!469258 m!451655))

(declare-fun m!451657 () Bool)

(assert (=> d!75327 m!451657))

(assert (=> d!75327 m!451401))

(assert (=> b!469256 m!451473))

(assert (=> b!469256 m!451473))

(assert (=> b!469256 m!451475))

(assert (=> bm!30376 m!451653))

(assert (=> b!469260 m!451529))

(declare-fun m!451659 () Bool)

(assert (=> b!469260 m!451659))

(declare-fun m!451661 () Bool)

(assert (=> b!469260 m!451661))

(assert (=> b!469260 m!451531))

(assert (=> b!469260 m!451529))

(assert (=> b!469260 m!451533))

(declare-fun m!451663 () Bool)

(assert (=> b!469260 m!451663))

(assert (=> b!469260 m!451659))

(declare-fun m!451665 () Bool)

(assert (=> b!469260 m!451665))

(assert (=> b!469260 m!451531))

(assert (=> b!469260 m!451473))

(assert (=> b!469252 m!451473))

(assert (=> b!469252 m!451473))

(declare-fun m!451667 () Bool)

(assert (=> b!469252 m!451667))

(assert (=> b!469254 m!451529))

(assert (=> b!469254 m!451531))

(assert (=> b!469254 m!451529))

(assert (=> b!469254 m!451533))

(assert (=> b!469254 m!451473))

(declare-fun m!451669 () Bool)

(assert (=> b!469254 m!451669))

(assert (=> b!469254 m!451531))

(assert (=> b!469254 m!451473))

(assert (=> b!469042 d!75327))

(declare-fun mapIsEmpty!21226 () Bool)

(declare-fun mapRes!21226 () Bool)

(assert (=> mapIsEmpty!21226 mapRes!21226))

(declare-fun b!469270 () Bool)

(declare-fun e!274758 () Bool)

(assert (=> b!469270 (= e!274758 tp_is_empty!13015)))

(declare-fun condMapEmpty!21226 () Bool)

(declare-fun mapDefault!21226 () ValueCell!6164)

(assert (=> mapNonEmpty!21217 (= condMapEmpty!21226 (= mapRest!21217 ((as const (Array (_ BitVec 32) ValueCell!6164)) mapDefault!21226)))))

(declare-fun e!274757 () Bool)

(assert (=> mapNonEmpty!21217 (= tp!40776 (and e!274757 mapRes!21226))))

(declare-fun b!469271 () Bool)

(assert (=> b!469271 (= e!274757 tp_is_empty!13015)))

(declare-fun mapNonEmpty!21226 () Bool)

(declare-fun tp!40792 () Bool)

(assert (=> mapNonEmpty!21226 (= mapRes!21226 (and tp!40792 e!274758))))

(declare-fun mapKey!21226 () (_ BitVec 32))

(declare-fun mapValue!21226 () ValueCell!6164)

(declare-fun mapRest!21226 () (Array (_ BitVec 32) ValueCell!6164))

(assert (=> mapNonEmpty!21226 (= mapRest!21217 (store mapRest!21226 mapKey!21226 mapValue!21226))))

(assert (= (and mapNonEmpty!21217 condMapEmpty!21226) mapIsEmpty!21226))

(assert (= (and mapNonEmpty!21217 (not condMapEmpty!21226)) mapNonEmpty!21226))

(assert (= (and mapNonEmpty!21226 ((_ is ValueCellFull!6164) mapValue!21226)) b!469270))

(assert (= (and mapNonEmpty!21217 ((_ is ValueCellFull!6164) mapDefault!21226)) b!469271))

(declare-fun m!451671 () Bool)

(assert (=> mapNonEmpty!21226 m!451671))

(declare-fun b_lambda!10115 () Bool)

(assert (= b_lambda!10111 (or (and start!42000 b_free!11587) b_lambda!10115)))

(declare-fun b_lambda!10117 () Bool)

(assert (= b_lambda!10113 (or (and start!42000 b_free!11587) b_lambda!10117)))

(declare-fun b_lambda!10119 () Bool)

(assert (= b_lambda!10103 (or (and start!42000 b_free!11587) b_lambda!10119)))

(declare-fun b_lambda!10121 () Bool)

(assert (= b_lambda!10107 (or (and start!42000 b_free!11587) b_lambda!10121)))

(declare-fun b_lambda!10123 () Bool)

(assert (= b_lambda!10109 (or (and start!42000 b_free!11587) b_lambda!10123)))

(declare-fun b_lambda!10125 () Bool)

(assert (= b_lambda!10105 (or (and start!42000 b_free!11587) b_lambda!10125)))

(check-sat (not b!469117) (not bm!30365) (not b!469203) (not b!469252) (not bm!30344) (not d!75321) (not bm!30341) (not b!469176) (not b!469214) (not b!469182) (not b!469246) (not d!75313) (not b!469189) (not b!469101) b_and!20011 (not b!469240) (not b!469242) (not b!469245) (not b_lambda!10123) (not b!469119) (not b_lambda!10119) (not b!469248) (not d!75327) (not b_lambda!10125) tp_is_empty!13015 (not bm!30366) (not bm!30360) (not bm!30364) (not bm!30375) (not d!75311) (not bm!30359) (not b_lambda!10117) (not b!469197) (not d!75315) (not b!469195) (not b!469164) (not b!469115) (not d!75323) (not bm!30371) (not bm!30367) (not b!469206) (not b!469191) (not b!469190) (not d!75319) (not b!469260) (not b!469213) (not b!469243) (not b!469103) (not b!469255) (not mapNonEmpty!21226) (not b!469215) (not b!469179) (not b_next!11587) (not b!469172) (not bm!30376) (not b!469244) (not b!469175) (not b!469263) (not bm!30372) (not b!469256) (not b!469258) (not b!469196) (not d!75325) (not d!75317) (not b!469192) (not b!469254) (not b!469210) (not b_lambda!10121) (not b!469207) (not b!469166) (not b!469165) (not b_lambda!10115) (not b!469257) (not b!469251))
(check-sat b_and!20011 (not b_next!11587))
