; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34566 () Bool)

(assert start!34566)

(declare-fun b_free!7465 () Bool)

(declare-fun b_next!7465 () Bool)

(assert (=> start!34566 (= b_free!7465 (not b_next!7465))))

(declare-fun tp!25947 () Bool)

(declare-fun b_and!14651 () Bool)

(assert (=> start!34566 (= tp!25947 b_and!14651)))

(declare-fun b!345319 () Bool)

(declare-fun res!191054 () Bool)

(declare-fun e!211643 () Bool)

(assert (=> b!345319 (=> (not res!191054) (not e!211643))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345319 (= res!191054 (validKeyInArray!0 k0!1348))))

(declare-fun b!345320 () Bool)

(declare-fun res!191055 () Bool)

(assert (=> b!345320 (=> (not res!191055) (not e!211643))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10867 0))(
  ( (V!10868 (val!3753 Int)) )
))
(declare-datatypes ((ValueCell!3365 0))(
  ( (ValueCellFull!3365 (v!5925 V!10867)) (EmptyCell!3365) )
))
(declare-datatypes ((array!18407 0))(
  ( (array!18408 (arr!8718 (Array (_ BitVec 32) ValueCell!3365)) (size!9071 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18407)

(declare-datatypes ((array!18409 0))(
  ( (array!18410 (arr!8719 (Array (_ BitVec 32) (_ BitVec 64))) (size!9072 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18409)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!345320 (= res!191055 (and (= (size!9071 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9072 _keys!1895) (size!9071 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345321 () Bool)

(declare-fun res!191056 () Bool)

(assert (=> b!345321 (=> (not res!191056) (not e!211643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18409 (_ BitVec 32)) Bool)

(assert (=> b!345321 (= res!191056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345322 () Bool)

(declare-fun res!191057 () Bool)

(assert (=> b!345322 (=> (not res!191057) (not e!211643))))

(declare-fun zeroValue!1467 () V!10867)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10867)

(declare-datatypes ((tuple2!5390 0))(
  ( (tuple2!5391 (_1!2706 (_ BitVec 64)) (_2!2706 V!10867)) )
))
(declare-datatypes ((List!5007 0))(
  ( (Nil!5004) (Cons!5003 (h!5859 tuple2!5390) (t!10118 List!5007)) )
))
(declare-datatypes ((ListLongMap!4293 0))(
  ( (ListLongMap!4294 (toList!2162 List!5007)) )
))
(declare-fun contains!2233 (ListLongMap!4293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1668 (array!18409 array!18407 (_ BitVec 32) (_ BitVec 32) V!10867 V!10867 (_ BitVec 32) Int) ListLongMap!4293)

(assert (=> b!345322 (= res!191057 (not (contains!2233 (getCurrentListMap!1668 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!345323 () Bool)

(declare-fun res!191052 () Bool)

(assert (=> b!345323 (=> (not res!191052) (not e!211643))))

(declare-datatypes ((List!5008 0))(
  ( (Nil!5005) (Cons!5004 (h!5860 (_ BitVec 64)) (t!10119 List!5008)) )
))
(declare-fun arrayNoDuplicates!0 (array!18409 (_ BitVec 32) List!5008) Bool)

(assert (=> b!345323 (= res!191052 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5005))))

(declare-fun mapNonEmpty!12570 () Bool)

(declare-fun mapRes!12570 () Bool)

(declare-fun tp!25946 () Bool)

(declare-fun e!211645 () Bool)

(assert (=> mapNonEmpty!12570 (= mapRes!12570 (and tp!25946 e!211645))))

(declare-fun mapRest!12570 () (Array (_ BitVec 32) ValueCell!3365))

(declare-fun mapKey!12570 () (_ BitVec 32))

(declare-fun mapValue!12570 () ValueCell!3365)

(assert (=> mapNonEmpty!12570 (= (arr!8718 _values!1525) (store mapRest!12570 mapKey!12570 mapValue!12570))))

(declare-fun b!345324 () Bool)

(declare-fun tp_is_empty!7417 () Bool)

(assert (=> b!345324 (= e!211645 tp_is_empty!7417)))

(declare-fun b!345325 () Bool)

(declare-datatypes ((SeekEntryResult!3357 0))(
  ( (MissingZero!3357 (index!15607 (_ BitVec 32))) (Found!3357 (index!15608 (_ BitVec 32))) (Intermediate!3357 (undefined!4169 Bool) (index!15609 (_ BitVec 32)) (x!34422 (_ BitVec 32))) (Undefined!3357) (MissingVacant!3357 (index!15610 (_ BitVec 32))) )
))
(declare-fun lt!162729 () SeekEntryResult!3357)

(get-info :version)

(assert (=> b!345325 (= e!211643 (and ((_ is Found!3357) lt!162729) (or (bvslt (index!15608 lt!162729) #b00000000000000000000000000000000) (bvsge (index!15608 lt!162729) (size!9072 _keys!1895)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18409 (_ BitVec 32)) SeekEntryResult!3357)

(assert (=> b!345325 (= lt!162729 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!191053 () Bool)

(assert (=> start!34566 (=> (not res!191053) (not e!211643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34566 (= res!191053 (validMask!0 mask!2385))))

(assert (=> start!34566 e!211643))

(assert (=> start!34566 true))

(assert (=> start!34566 tp_is_empty!7417))

(assert (=> start!34566 tp!25947))

(declare-fun e!211642 () Bool)

(declare-fun array_inv!6480 (array!18407) Bool)

(assert (=> start!34566 (and (array_inv!6480 _values!1525) e!211642)))

(declare-fun array_inv!6481 (array!18409) Bool)

(assert (=> start!34566 (array_inv!6481 _keys!1895)))

(declare-fun mapIsEmpty!12570 () Bool)

(assert (=> mapIsEmpty!12570 mapRes!12570))

(declare-fun b!345326 () Bool)

(declare-fun e!211644 () Bool)

(assert (=> b!345326 (= e!211644 tp_is_empty!7417)))

(declare-fun b!345327 () Bool)

(assert (=> b!345327 (= e!211642 (and e!211644 mapRes!12570))))

(declare-fun condMapEmpty!12570 () Bool)

(declare-fun mapDefault!12570 () ValueCell!3365)

(assert (=> b!345327 (= condMapEmpty!12570 (= (arr!8718 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3365)) mapDefault!12570)))))

(assert (= (and start!34566 res!191053) b!345320))

(assert (= (and b!345320 res!191055) b!345321))

(assert (= (and b!345321 res!191056) b!345323))

(assert (= (and b!345323 res!191052) b!345319))

(assert (= (and b!345319 res!191054) b!345322))

(assert (= (and b!345322 res!191057) b!345325))

(assert (= (and b!345327 condMapEmpty!12570) mapIsEmpty!12570))

(assert (= (and b!345327 (not condMapEmpty!12570)) mapNonEmpty!12570))

(assert (= (and mapNonEmpty!12570 ((_ is ValueCellFull!3365) mapValue!12570)) b!345324))

(assert (= (and b!345327 ((_ is ValueCellFull!3365) mapDefault!12570)) b!345326))

(assert (= start!34566 b!345327))

(declare-fun m!346195 () Bool)

(assert (=> b!345323 m!346195))

(declare-fun m!346197 () Bool)

(assert (=> b!345321 m!346197))

(declare-fun m!346199 () Bool)

(assert (=> b!345322 m!346199))

(assert (=> b!345322 m!346199))

(declare-fun m!346201 () Bool)

(assert (=> b!345322 m!346201))

(declare-fun m!346203 () Bool)

(assert (=> mapNonEmpty!12570 m!346203))

(declare-fun m!346205 () Bool)

(assert (=> b!345319 m!346205))

(declare-fun m!346207 () Bool)

(assert (=> b!345325 m!346207))

(declare-fun m!346209 () Bool)

(assert (=> start!34566 m!346209))

(declare-fun m!346211 () Bool)

(assert (=> start!34566 m!346211))

(declare-fun m!346213 () Bool)

(assert (=> start!34566 m!346213))

(check-sat (not b!345319) (not b!345321) (not start!34566) (not b!345322) (not mapNonEmpty!12570) b_and!14651 (not b!345323) (not b!345325) (not b_next!7465) tp_is_empty!7417)
(check-sat b_and!14651 (not b_next!7465))
(get-model)

(declare-fun b!345392 () Bool)

(declare-fun e!211685 () Bool)

(declare-fun e!211684 () Bool)

(assert (=> b!345392 (= e!211685 e!211684)))

(declare-fun res!191102 () Bool)

(assert (=> b!345392 (=> (not res!191102) (not e!211684))))

(declare-fun e!211686 () Bool)

(assert (=> b!345392 (= res!191102 (not e!211686))))

(declare-fun res!191101 () Bool)

(assert (=> b!345392 (=> (not res!191101) (not e!211686))))

(assert (=> b!345392 (= res!191101 (validKeyInArray!0 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345393 () Bool)

(declare-fun contains!2235 (List!5008 (_ BitVec 64)) Bool)

(assert (=> b!345393 (= e!211686 (contains!2235 Nil!5005 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70955 () Bool)

(declare-fun res!191100 () Bool)

(assert (=> d!70955 (=> res!191100 e!211685)))

(assert (=> d!70955 (= res!191100 (bvsge #b00000000000000000000000000000000 (size!9072 _keys!1895)))))

(assert (=> d!70955 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5005) e!211685)))

(declare-fun b!345394 () Bool)

(declare-fun e!211687 () Bool)

(declare-fun call!26705 () Bool)

(assert (=> b!345394 (= e!211687 call!26705)))

(declare-fun b!345395 () Bool)

(assert (=> b!345395 (= e!211684 e!211687)))

(declare-fun c!52958 () Bool)

(assert (=> b!345395 (= c!52958 (validKeyInArray!0 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26702 () Bool)

(assert (=> bm!26702 (= call!26705 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52958 (Cons!5004 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000) Nil!5005) Nil!5005)))))

(declare-fun b!345396 () Bool)

(assert (=> b!345396 (= e!211687 call!26705)))

(assert (= (and d!70955 (not res!191100)) b!345392))

(assert (= (and b!345392 res!191101) b!345393))

(assert (= (and b!345392 res!191102) b!345395))

(assert (= (and b!345395 c!52958) b!345396))

(assert (= (and b!345395 (not c!52958)) b!345394))

(assert (= (or b!345396 b!345394) bm!26702))

(declare-fun m!346255 () Bool)

(assert (=> b!345392 m!346255))

(assert (=> b!345392 m!346255))

(declare-fun m!346257 () Bool)

(assert (=> b!345392 m!346257))

(assert (=> b!345393 m!346255))

(assert (=> b!345393 m!346255))

(declare-fun m!346259 () Bool)

(assert (=> b!345393 m!346259))

(assert (=> b!345395 m!346255))

(assert (=> b!345395 m!346255))

(assert (=> b!345395 m!346257))

(assert (=> bm!26702 m!346255))

(declare-fun m!346261 () Bool)

(assert (=> bm!26702 m!346261))

(assert (=> b!345323 d!70955))

(declare-fun d!70957 () Bool)

(assert (=> d!70957 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34566 d!70957))

(declare-fun d!70959 () Bool)

(assert (=> d!70959 (= (array_inv!6480 _values!1525) (bvsge (size!9071 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34566 d!70959))

(declare-fun d!70961 () Bool)

(assert (=> d!70961 (= (array_inv!6481 _keys!1895) (bvsge (size!9072 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34566 d!70961))

(declare-fun d!70963 () Bool)

(assert (=> d!70963 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345319 d!70963))

(declare-fun bm!26705 () Bool)

(declare-fun call!26708 () Bool)

(assert (=> bm!26705 (= call!26708 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70965 () Bool)

(declare-fun res!191108 () Bool)

(declare-fun e!211696 () Bool)

(assert (=> d!70965 (=> res!191108 e!211696)))

(assert (=> d!70965 (= res!191108 (bvsge #b00000000000000000000000000000000 (size!9072 _keys!1895)))))

(assert (=> d!70965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!211696)))

(declare-fun b!345405 () Bool)

(declare-fun e!211695 () Bool)

(declare-fun e!211694 () Bool)

(assert (=> b!345405 (= e!211695 e!211694)))

(declare-fun lt!162743 () (_ BitVec 64))

(assert (=> b!345405 (= lt!162743 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10714 0))(
  ( (Unit!10715) )
))
(declare-fun lt!162742 () Unit!10714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18409 (_ BitVec 64) (_ BitVec 32)) Unit!10714)

(assert (=> b!345405 (= lt!162742 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162743 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!18409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!345405 (arrayContainsKey!0 _keys!1895 lt!162743 #b00000000000000000000000000000000)))

(declare-fun lt!162744 () Unit!10714)

(assert (=> b!345405 (= lt!162744 lt!162742)))

(declare-fun res!191107 () Bool)

(assert (=> b!345405 (= res!191107 (= (seekEntryOrOpen!0 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3357 #b00000000000000000000000000000000)))))

(assert (=> b!345405 (=> (not res!191107) (not e!211694))))

(declare-fun b!345406 () Bool)

(assert (=> b!345406 (= e!211696 e!211695)))

(declare-fun c!52961 () Bool)

(assert (=> b!345406 (= c!52961 (validKeyInArray!0 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345407 () Bool)

(assert (=> b!345407 (= e!211695 call!26708)))

(declare-fun b!345408 () Bool)

(assert (=> b!345408 (= e!211694 call!26708)))

(assert (= (and d!70965 (not res!191108)) b!345406))

(assert (= (and b!345406 c!52961) b!345405))

(assert (= (and b!345406 (not c!52961)) b!345407))

(assert (= (and b!345405 res!191107) b!345408))

(assert (= (or b!345408 b!345407) bm!26705))

(declare-fun m!346263 () Bool)

(assert (=> bm!26705 m!346263))

(assert (=> b!345405 m!346255))

(declare-fun m!346265 () Bool)

(assert (=> b!345405 m!346265))

(declare-fun m!346267 () Bool)

(assert (=> b!345405 m!346267))

(assert (=> b!345405 m!346255))

(declare-fun m!346269 () Bool)

(assert (=> b!345405 m!346269))

(assert (=> b!345406 m!346255))

(assert (=> b!345406 m!346255))

(assert (=> b!345406 m!346257))

(assert (=> b!345321 d!70965))

(declare-fun d!70967 () Bool)

(declare-fun e!211701 () Bool)

(assert (=> d!70967 e!211701))

(declare-fun res!191111 () Bool)

(assert (=> d!70967 (=> res!191111 e!211701)))

(declare-fun lt!162754 () Bool)

(assert (=> d!70967 (= res!191111 (not lt!162754))))

(declare-fun lt!162753 () Bool)

(assert (=> d!70967 (= lt!162754 lt!162753)))

(declare-fun lt!162756 () Unit!10714)

(declare-fun e!211702 () Unit!10714)

(assert (=> d!70967 (= lt!162756 e!211702)))

(declare-fun c!52964 () Bool)

(assert (=> d!70967 (= c!52964 lt!162753)))

(declare-fun containsKey!330 (List!5007 (_ BitVec 64)) Bool)

(assert (=> d!70967 (= lt!162753 (containsKey!330 (toList!2162 (getCurrentListMap!1668 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70967 (= (contains!2233 (getCurrentListMap!1668 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162754)))

(declare-fun b!345415 () Bool)

(declare-fun lt!162755 () Unit!10714)

(assert (=> b!345415 (= e!211702 lt!162755)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!279 (List!5007 (_ BitVec 64)) Unit!10714)

(assert (=> b!345415 (= lt!162755 (lemmaContainsKeyImpliesGetValueByKeyDefined!279 (toList!2162 (getCurrentListMap!1668 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!344 0))(
  ( (Some!343 (v!5928 V!10867)) (None!342) )
))
(declare-fun isDefined!280 (Option!344) Bool)

(declare-fun getValueByKey!338 (List!5007 (_ BitVec 64)) Option!344)

(assert (=> b!345415 (isDefined!280 (getValueByKey!338 (toList!2162 (getCurrentListMap!1668 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!345416 () Bool)

(declare-fun Unit!10716 () Unit!10714)

(assert (=> b!345416 (= e!211702 Unit!10716)))

(declare-fun b!345417 () Bool)

(assert (=> b!345417 (= e!211701 (isDefined!280 (getValueByKey!338 (toList!2162 (getCurrentListMap!1668 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70967 c!52964) b!345415))

(assert (= (and d!70967 (not c!52964)) b!345416))

(assert (= (and d!70967 (not res!191111)) b!345417))

(declare-fun m!346271 () Bool)

(assert (=> d!70967 m!346271))

(declare-fun m!346273 () Bool)

(assert (=> b!345415 m!346273))

(declare-fun m!346275 () Bool)

(assert (=> b!345415 m!346275))

(assert (=> b!345415 m!346275))

(declare-fun m!346277 () Bool)

(assert (=> b!345415 m!346277))

(assert (=> b!345417 m!346275))

(assert (=> b!345417 m!346275))

(assert (=> b!345417 m!346277))

(assert (=> b!345322 d!70967))

(declare-fun b!345460 () Bool)

(declare-fun c!52980 () Bool)

(assert (=> b!345460 (= c!52980 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!211738 () ListLongMap!4293)

(declare-fun e!211729 () ListLongMap!4293)

(assert (=> b!345460 (= e!211738 e!211729)))

(declare-fun b!345461 () Bool)

(declare-fun e!211740 () Bool)

(declare-fun call!26728 () Bool)

(assert (=> b!345461 (= e!211740 (not call!26728))))

(declare-fun b!345462 () Bool)

(declare-fun res!191136 () Bool)

(declare-fun e!211733 () Bool)

(assert (=> b!345462 (=> (not res!191136) (not e!211733))))

(declare-fun e!211734 () Bool)

(assert (=> b!345462 (= res!191136 e!211734)))

(declare-fun c!52981 () Bool)

(assert (=> b!345462 (= c!52981 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!345463 () Bool)

(declare-fun e!211730 () Unit!10714)

(declare-fun lt!162821 () Unit!10714)

(assert (=> b!345463 (= e!211730 lt!162821)))

(declare-fun lt!162805 () ListLongMap!4293)

(declare-fun getCurrentListMapNoExtraKeys!598 (array!18409 array!18407 (_ BitVec 32) (_ BitVec 32) V!10867 V!10867 (_ BitVec 32) Int) ListLongMap!4293)

(assert (=> b!345463 (= lt!162805 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162801 () (_ BitVec 64))

(assert (=> b!345463 (= lt!162801 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162818 () (_ BitVec 64))

(assert (=> b!345463 (= lt!162818 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162809 () Unit!10714)

(declare-fun addStillContains!258 (ListLongMap!4293 (_ BitVec 64) V!10867 (_ BitVec 64)) Unit!10714)

(assert (=> b!345463 (= lt!162809 (addStillContains!258 lt!162805 lt!162801 zeroValue!1467 lt!162818))))

(declare-fun +!735 (ListLongMap!4293 tuple2!5390) ListLongMap!4293)

(assert (=> b!345463 (contains!2233 (+!735 lt!162805 (tuple2!5391 lt!162801 zeroValue!1467)) lt!162818)))

(declare-fun lt!162812 () Unit!10714)

(assert (=> b!345463 (= lt!162812 lt!162809)))

(declare-fun lt!162822 () ListLongMap!4293)

(assert (=> b!345463 (= lt!162822 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162810 () (_ BitVec 64))

(assert (=> b!345463 (= lt!162810 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162811 () (_ BitVec 64))

(assert (=> b!345463 (= lt!162811 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162802 () Unit!10714)

(declare-fun addApplyDifferent!258 (ListLongMap!4293 (_ BitVec 64) V!10867 (_ BitVec 64)) Unit!10714)

(assert (=> b!345463 (= lt!162802 (addApplyDifferent!258 lt!162822 lt!162810 minValue!1467 lt!162811))))

(declare-fun apply!282 (ListLongMap!4293 (_ BitVec 64)) V!10867)

(assert (=> b!345463 (= (apply!282 (+!735 lt!162822 (tuple2!5391 lt!162810 minValue!1467)) lt!162811) (apply!282 lt!162822 lt!162811))))

(declare-fun lt!162820 () Unit!10714)

(assert (=> b!345463 (= lt!162820 lt!162802)))

(declare-fun lt!162803 () ListLongMap!4293)

(assert (=> b!345463 (= lt!162803 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162804 () (_ BitVec 64))

(assert (=> b!345463 (= lt!162804 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162819 () (_ BitVec 64))

(assert (=> b!345463 (= lt!162819 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162814 () Unit!10714)

(assert (=> b!345463 (= lt!162814 (addApplyDifferent!258 lt!162803 lt!162804 zeroValue!1467 lt!162819))))

(assert (=> b!345463 (= (apply!282 (+!735 lt!162803 (tuple2!5391 lt!162804 zeroValue!1467)) lt!162819) (apply!282 lt!162803 lt!162819))))

(declare-fun lt!162807 () Unit!10714)

(assert (=> b!345463 (= lt!162807 lt!162814)))

(declare-fun lt!162813 () ListLongMap!4293)

(assert (=> b!345463 (= lt!162813 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162808 () (_ BitVec 64))

(assert (=> b!345463 (= lt!162808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162817 () (_ BitVec 64))

(assert (=> b!345463 (= lt!162817 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!345463 (= lt!162821 (addApplyDifferent!258 lt!162813 lt!162808 minValue!1467 lt!162817))))

(assert (=> b!345463 (= (apply!282 (+!735 lt!162813 (tuple2!5391 lt!162808 minValue!1467)) lt!162817) (apply!282 lt!162813 lt!162817))))

(declare-fun d!70969 () Bool)

(assert (=> d!70969 e!211733))

(declare-fun res!191137 () Bool)

(assert (=> d!70969 (=> (not res!191137) (not e!211733))))

(assert (=> d!70969 (= res!191137 (or (bvsge #b00000000000000000000000000000000 (size!9072 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9072 _keys!1895)))))))

(declare-fun lt!162816 () ListLongMap!4293)

(declare-fun lt!162815 () ListLongMap!4293)

(assert (=> d!70969 (= lt!162816 lt!162815)))

(declare-fun lt!162806 () Unit!10714)

(assert (=> d!70969 (= lt!162806 e!211730)))

(declare-fun c!52977 () Bool)

(declare-fun e!211732 () Bool)

(assert (=> d!70969 (= c!52977 e!211732)))

(declare-fun res!191132 () Bool)

(assert (=> d!70969 (=> (not res!191132) (not e!211732))))

(assert (=> d!70969 (= res!191132 (bvslt #b00000000000000000000000000000000 (size!9072 _keys!1895)))))

(declare-fun e!211731 () ListLongMap!4293)

(assert (=> d!70969 (= lt!162815 e!211731)))

(declare-fun c!52982 () Bool)

(assert (=> d!70969 (= c!52982 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70969 (validMask!0 mask!2385)))

(assert (=> d!70969 (= (getCurrentListMap!1668 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162816)))

(declare-fun bm!26720 () Bool)

(declare-fun call!26725 () ListLongMap!4293)

(declare-fun call!26723 () ListLongMap!4293)

(declare-fun call!26724 () ListLongMap!4293)

(declare-fun call!26727 () ListLongMap!4293)

(declare-fun c!52978 () Bool)

(assert (=> bm!26720 (= call!26725 (+!735 (ite c!52982 call!26723 (ite c!52978 call!26724 call!26727)) (ite (or c!52982 c!52978) (tuple2!5391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5391 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26721 () Bool)

(assert (=> bm!26721 (= call!26728 (contains!2233 lt!162816 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345464 () Bool)

(declare-fun e!211739 () Bool)

(assert (=> b!345464 (= e!211739 (= (apply!282 lt!162816 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!345465 () Bool)

(assert (=> b!345465 (= e!211729 call!26727)))

(declare-fun b!345466 () Bool)

(declare-fun e!211737 () Bool)

(assert (=> b!345466 (= e!211734 e!211737)))

(declare-fun res!191130 () Bool)

(declare-fun call!26726 () Bool)

(assert (=> b!345466 (= res!191130 call!26726)))

(assert (=> b!345466 (=> (not res!191130) (not e!211737))))

(declare-fun b!345467 () Bool)

(declare-fun res!191135 () Bool)

(assert (=> b!345467 (=> (not res!191135) (not e!211733))))

(declare-fun e!211741 () Bool)

(assert (=> b!345467 (= res!191135 e!211741)))

(declare-fun res!191138 () Bool)

(assert (=> b!345467 (=> res!191138 e!211741)))

(declare-fun e!211736 () Bool)

(assert (=> b!345467 (= res!191138 (not e!211736))))

(declare-fun res!191133 () Bool)

(assert (=> b!345467 (=> (not res!191133) (not e!211736))))

(assert (=> b!345467 (= res!191133 (bvslt #b00000000000000000000000000000000 (size!9072 _keys!1895)))))

(declare-fun b!345468 () Bool)

(declare-fun e!211735 () Bool)

(declare-fun get!4694 (ValueCell!3365 V!10867) V!10867)

(declare-fun dynLambda!616 (Int (_ BitVec 64)) V!10867)

(assert (=> b!345468 (= e!211735 (= (apply!282 lt!162816 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000)) (get!4694 (select (arr!8718 _values!1525) #b00000000000000000000000000000000) (dynLambda!616 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!345468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9071 _values!1525)))))

(assert (=> b!345468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9072 _keys!1895)))))

(declare-fun bm!26722 () Bool)

(assert (=> bm!26722 (= call!26724 call!26723)))

(declare-fun b!345469 () Bool)

(assert (=> b!345469 (= e!211741 e!211735)))

(declare-fun res!191131 () Bool)

(assert (=> b!345469 (=> (not res!191131) (not e!211735))))

(assert (=> b!345469 (= res!191131 (contains!2233 lt!162816 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!345469 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9072 _keys!1895)))))

(declare-fun b!345470 () Bool)

(assert (=> b!345470 (= e!211731 (+!735 call!26725 (tuple2!5391 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!345471 () Bool)

(assert (=> b!345471 (= e!211732 (validKeyInArray!0 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!345472 () Bool)

(assert (=> b!345472 (= e!211734 (not call!26726))))

(declare-fun b!345473 () Bool)

(assert (=> b!345473 (= e!211733 e!211740)))

(declare-fun c!52979 () Bool)

(assert (=> b!345473 (= c!52979 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!345474 () Bool)

(assert (=> b!345474 (= e!211737 (= (apply!282 lt!162816 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26723 () Bool)

(assert (=> bm!26723 (= call!26727 call!26724)))

(declare-fun b!345475 () Bool)

(assert (=> b!345475 (= e!211736 (validKeyInArray!0 (select (arr!8719 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26724 () Bool)

(assert (=> bm!26724 (= call!26723 (getCurrentListMapNoExtraKeys!598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!345476 () Bool)

(declare-fun Unit!10717 () Unit!10714)

(assert (=> b!345476 (= e!211730 Unit!10717)))

(declare-fun bm!26725 () Bool)

(declare-fun call!26729 () ListLongMap!4293)

(assert (=> bm!26725 (= call!26729 call!26725)))

(declare-fun b!345477 () Bool)

(assert (=> b!345477 (= e!211729 call!26729)))

(declare-fun b!345478 () Bool)

(assert (=> b!345478 (= e!211731 e!211738)))

(assert (=> b!345478 (= c!52978 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26726 () Bool)

(assert (=> bm!26726 (= call!26726 (contains!2233 lt!162816 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!345479 () Bool)

(assert (=> b!345479 (= e!211738 call!26729)))

(declare-fun b!345480 () Bool)

(assert (=> b!345480 (= e!211740 e!211739)))

(declare-fun res!191134 () Bool)

(assert (=> b!345480 (= res!191134 call!26728)))

(assert (=> b!345480 (=> (not res!191134) (not e!211739))))

(assert (= (and d!70969 c!52982) b!345470))

(assert (= (and d!70969 (not c!52982)) b!345478))

(assert (= (and b!345478 c!52978) b!345479))

(assert (= (and b!345478 (not c!52978)) b!345460))

(assert (= (and b!345460 c!52980) b!345477))

(assert (= (and b!345460 (not c!52980)) b!345465))

(assert (= (or b!345477 b!345465) bm!26723))

(assert (= (or b!345479 bm!26723) bm!26722))

(assert (= (or b!345479 b!345477) bm!26725))

(assert (= (or b!345470 bm!26722) bm!26724))

(assert (= (or b!345470 bm!26725) bm!26720))

(assert (= (and d!70969 res!191132) b!345471))

(assert (= (and d!70969 c!52977) b!345463))

(assert (= (and d!70969 (not c!52977)) b!345476))

(assert (= (and d!70969 res!191137) b!345467))

(assert (= (and b!345467 res!191133) b!345475))

(assert (= (and b!345467 (not res!191138)) b!345469))

(assert (= (and b!345469 res!191131) b!345468))

(assert (= (and b!345467 res!191135) b!345462))

(assert (= (and b!345462 c!52981) b!345466))

(assert (= (and b!345462 (not c!52981)) b!345472))

(assert (= (and b!345466 res!191130) b!345474))

(assert (= (or b!345466 b!345472) bm!26726))

(assert (= (and b!345462 res!191136) b!345473))

(assert (= (and b!345473 c!52979) b!345480))

(assert (= (and b!345473 (not c!52979)) b!345461))

(assert (= (and b!345480 res!191134) b!345464))

(assert (= (or b!345480 b!345461) bm!26721))

(declare-fun b_lambda!8449 () Bool)

(assert (=> (not b_lambda!8449) (not b!345468)))

(declare-fun t!10123 () Bool)

(declare-fun tb!3071 () Bool)

(assert (=> (and start!34566 (= defaultEntry!1528 defaultEntry!1528) t!10123) tb!3071))

(declare-fun result!5559 () Bool)

(assert (=> tb!3071 (= result!5559 tp_is_empty!7417)))

(assert (=> b!345468 t!10123))

(declare-fun b_and!14657 () Bool)

(assert (= b_and!14651 (and (=> t!10123 result!5559) b_and!14657)))

(declare-fun m!346279 () Bool)

(assert (=> b!345464 m!346279))

(assert (=> b!345475 m!346255))

(assert (=> b!345475 m!346255))

(assert (=> b!345475 m!346257))

(assert (=> d!70969 m!346209))

(assert (=> b!345469 m!346255))

(assert (=> b!345469 m!346255))

(declare-fun m!346281 () Bool)

(assert (=> b!345469 m!346281))

(assert (=> b!345471 m!346255))

(assert (=> b!345471 m!346255))

(assert (=> b!345471 m!346257))

(declare-fun m!346283 () Bool)

(assert (=> b!345463 m!346283))

(declare-fun m!346285 () Bool)

(assert (=> b!345463 m!346285))

(declare-fun m!346287 () Bool)

(assert (=> b!345463 m!346287))

(declare-fun m!346289 () Bool)

(assert (=> b!345463 m!346289))

(declare-fun m!346291 () Bool)

(assert (=> b!345463 m!346291))

(declare-fun m!346293 () Bool)

(assert (=> b!345463 m!346293))

(assert (=> b!345463 m!346255))

(declare-fun m!346295 () Bool)

(assert (=> b!345463 m!346295))

(declare-fun m!346297 () Bool)

(assert (=> b!345463 m!346297))

(declare-fun m!346299 () Bool)

(assert (=> b!345463 m!346299))

(declare-fun m!346301 () Bool)

(assert (=> b!345463 m!346301))

(declare-fun m!346303 () Bool)

(assert (=> b!345463 m!346303))

(declare-fun m!346305 () Bool)

(assert (=> b!345463 m!346305))

(declare-fun m!346307 () Bool)

(assert (=> b!345463 m!346307))

(declare-fun m!346309 () Bool)

(assert (=> b!345463 m!346309))

(declare-fun m!346311 () Bool)

(assert (=> b!345463 m!346311))

(assert (=> b!345463 m!346291))

(assert (=> b!345463 m!346295))

(assert (=> b!345463 m!346307))

(assert (=> b!345463 m!346301))

(declare-fun m!346313 () Bool)

(assert (=> b!345463 m!346313))

(assert (=> bm!26724 m!346287))

(declare-fun m!346315 () Bool)

(assert (=> b!345474 m!346315))

(declare-fun m!346317 () Bool)

(assert (=> bm!26726 m!346317))

(declare-fun m!346319 () Bool)

(assert (=> bm!26720 m!346319))

(declare-fun m!346321 () Bool)

(assert (=> b!345470 m!346321))

(declare-fun m!346323 () Bool)

(assert (=> bm!26721 m!346323))

(declare-fun m!346325 () Bool)

(assert (=> b!345468 m!346325))

(assert (=> b!345468 m!346255))

(declare-fun m!346327 () Bool)

(assert (=> b!345468 m!346327))

(assert (=> b!345468 m!346325))

(assert (=> b!345468 m!346327))

(declare-fun m!346329 () Bool)

(assert (=> b!345468 m!346329))

(assert (=> b!345468 m!346255))

(declare-fun m!346331 () Bool)

(assert (=> b!345468 m!346331))

(assert (=> b!345322 d!70969))

(declare-fun b!345495 () Bool)

(declare-fun e!211749 () SeekEntryResult!3357)

(declare-fun lt!162831 () SeekEntryResult!3357)

(assert (=> b!345495 (= e!211749 (Found!3357 (index!15609 lt!162831)))))

(declare-fun b!345496 () Bool)

(declare-fun e!211750 () SeekEntryResult!3357)

(assert (=> b!345496 (= e!211750 e!211749)))

(declare-fun lt!162829 () (_ BitVec 64))

(assert (=> b!345496 (= lt!162829 (select (arr!8719 _keys!1895) (index!15609 lt!162831)))))

(declare-fun c!52991 () Bool)

(assert (=> b!345496 (= c!52991 (= lt!162829 k0!1348))))

(declare-fun d!70971 () Bool)

(declare-fun lt!162830 () SeekEntryResult!3357)

(assert (=> d!70971 (and (or ((_ is Undefined!3357) lt!162830) (not ((_ is Found!3357) lt!162830)) (and (bvsge (index!15608 lt!162830) #b00000000000000000000000000000000) (bvslt (index!15608 lt!162830) (size!9072 _keys!1895)))) (or ((_ is Undefined!3357) lt!162830) ((_ is Found!3357) lt!162830) (not ((_ is MissingZero!3357) lt!162830)) (and (bvsge (index!15607 lt!162830) #b00000000000000000000000000000000) (bvslt (index!15607 lt!162830) (size!9072 _keys!1895)))) (or ((_ is Undefined!3357) lt!162830) ((_ is Found!3357) lt!162830) ((_ is MissingZero!3357) lt!162830) (not ((_ is MissingVacant!3357) lt!162830)) (and (bvsge (index!15610 lt!162830) #b00000000000000000000000000000000) (bvslt (index!15610 lt!162830) (size!9072 _keys!1895)))) (or ((_ is Undefined!3357) lt!162830) (ite ((_ is Found!3357) lt!162830) (= (select (arr!8719 _keys!1895) (index!15608 lt!162830)) k0!1348) (ite ((_ is MissingZero!3357) lt!162830) (= (select (arr!8719 _keys!1895) (index!15607 lt!162830)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3357) lt!162830) (= (select (arr!8719 _keys!1895) (index!15610 lt!162830)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70971 (= lt!162830 e!211750)))

(declare-fun c!52990 () Bool)

(assert (=> d!70971 (= c!52990 (and ((_ is Intermediate!3357) lt!162831) (undefined!4169 lt!162831)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18409 (_ BitVec 32)) SeekEntryResult!3357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70971 (= lt!162831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70971 (validMask!0 mask!2385)))

(assert (=> d!70971 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162830)))

(declare-fun b!345497 () Bool)

(declare-fun c!52989 () Bool)

(assert (=> b!345497 (= c!52989 (= lt!162829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!211748 () SeekEntryResult!3357)

(assert (=> b!345497 (= e!211749 e!211748)))

(declare-fun b!345498 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18409 (_ BitVec 32)) SeekEntryResult!3357)

(assert (=> b!345498 (= e!211748 (seekKeyOrZeroReturnVacant!0 (x!34422 lt!162831) (index!15609 lt!162831) (index!15609 lt!162831) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!345499 () Bool)

(assert (=> b!345499 (= e!211748 (MissingZero!3357 (index!15609 lt!162831)))))

(declare-fun b!345500 () Bool)

(assert (=> b!345500 (= e!211750 Undefined!3357)))

(assert (= (and d!70971 c!52990) b!345500))

(assert (= (and d!70971 (not c!52990)) b!345496))

(assert (= (and b!345496 c!52991) b!345495))

(assert (= (and b!345496 (not c!52991)) b!345497))

(assert (= (and b!345497 c!52989) b!345499))

(assert (= (and b!345497 (not c!52989)) b!345498))

(declare-fun m!346333 () Bool)

(assert (=> b!345496 m!346333))

(declare-fun m!346335 () Bool)

(assert (=> d!70971 m!346335))

(declare-fun m!346337 () Bool)

(assert (=> d!70971 m!346337))

(assert (=> d!70971 m!346209))

(assert (=> d!70971 m!346335))

(declare-fun m!346339 () Bool)

(assert (=> d!70971 m!346339))

(declare-fun m!346341 () Bool)

(assert (=> d!70971 m!346341))

(declare-fun m!346343 () Bool)

(assert (=> d!70971 m!346343))

(declare-fun m!346345 () Bool)

(assert (=> b!345498 m!346345))

(assert (=> b!345325 d!70971))

(declare-fun mapNonEmpty!12579 () Bool)

(declare-fun mapRes!12579 () Bool)

(declare-fun tp!25962 () Bool)

(declare-fun e!211755 () Bool)

(assert (=> mapNonEmpty!12579 (= mapRes!12579 (and tp!25962 e!211755))))

(declare-fun mapValue!12579 () ValueCell!3365)

(declare-fun mapRest!12579 () (Array (_ BitVec 32) ValueCell!3365))

(declare-fun mapKey!12579 () (_ BitVec 32))

(assert (=> mapNonEmpty!12579 (= mapRest!12570 (store mapRest!12579 mapKey!12579 mapValue!12579))))

(declare-fun b!345507 () Bool)

(assert (=> b!345507 (= e!211755 tp_is_empty!7417)))

(declare-fun condMapEmpty!12579 () Bool)

(declare-fun mapDefault!12579 () ValueCell!3365)

(assert (=> mapNonEmpty!12570 (= condMapEmpty!12579 (= mapRest!12570 ((as const (Array (_ BitVec 32) ValueCell!3365)) mapDefault!12579)))))

(declare-fun e!211756 () Bool)

(assert (=> mapNonEmpty!12570 (= tp!25946 (and e!211756 mapRes!12579))))

(declare-fun mapIsEmpty!12579 () Bool)

(assert (=> mapIsEmpty!12579 mapRes!12579))

(declare-fun b!345508 () Bool)

(assert (=> b!345508 (= e!211756 tp_is_empty!7417)))

(assert (= (and mapNonEmpty!12570 condMapEmpty!12579) mapIsEmpty!12579))

(assert (= (and mapNonEmpty!12570 (not condMapEmpty!12579)) mapNonEmpty!12579))

(assert (= (and mapNonEmpty!12579 ((_ is ValueCellFull!3365) mapValue!12579)) b!345507))

(assert (= (and mapNonEmpty!12570 ((_ is ValueCellFull!3365) mapDefault!12579)) b!345508))

(declare-fun m!346347 () Bool)

(assert (=> mapNonEmpty!12579 m!346347))

(declare-fun b_lambda!8451 () Bool)

(assert (= b_lambda!8449 (or (and start!34566 b_free!7465) b_lambda!8451)))

(check-sat (not d!70967) (not b!345405) (not d!70971) (not b!345464) (not b!345406) (not b!345469) (not b!345468) (not bm!26705) (not b!345463) (not b!345471) b_and!14657 (not bm!26720) (not bm!26724) (not b!345417) (not bm!26721) (not b!345395) (not b!345498) (not mapNonEmpty!12579) (not b!345475) (not bm!26726) (not b_lambda!8451) (not b!345392) (not b!345415) (not b!345393) (not bm!26702) (not b!345474) (not b!345470) (not d!70969) (not b_next!7465) tp_is_empty!7417)
(check-sat b_and!14657 (not b_next!7465))
