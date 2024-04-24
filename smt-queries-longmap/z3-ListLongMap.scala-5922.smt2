; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77146 () Bool)

(assert start!77146)

(declare-fun b!900346 () Bool)

(declare-fun b_free!16033 () Bool)

(declare-fun b_next!16033 () Bool)

(assert (=> b!900346 (= b_free!16033 (not b_next!16033))))

(declare-fun tp!56180 () Bool)

(declare-fun b_and!26351 () Bool)

(assert (=> b!900346 (= tp!56180 b_and!26351)))

(declare-fun b!900343 () Bool)

(declare-fun e!503858 () Bool)

(declare-fun tp_is_empty!18361 () Bool)

(assert (=> b!900343 (= e!503858 tp_is_empty!18361)))

(declare-fun mapNonEmpty!29207 () Bool)

(declare-fun mapRes!29207 () Bool)

(declare-fun tp!56179 () Bool)

(declare-fun e!503865 () Bool)

(assert (=> mapNonEmpty!29207 (= mapRes!29207 (and tp!56179 e!503865))))

(declare-datatypes ((V!29447 0))(
  ( (V!29448 (val!9231 Int)) )
))
(declare-datatypes ((ValueCell!8699 0))(
  ( (ValueCellFull!8699 (v!11722 V!29447)) (EmptyCell!8699) )
))
(declare-fun mapRest!29207 () (Array (_ BitVec 32) ValueCell!8699))

(declare-fun mapValue!29207 () ValueCell!8699)

(declare-fun mapKey!29207 () (_ BitVec 32))

(declare-datatypes ((array!52805 0))(
  ( (array!52806 (arr!25372 (Array (_ BitVec 32) (_ BitVec 64))) (size!25830 (_ BitVec 32))) )
))
(declare-datatypes ((array!52807 0))(
  ( (array!52808 (arr!25373 (Array (_ BitVec 32) ValueCell!8699)) (size!25831 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4414 0))(
  ( (LongMapFixedSize!4415 (defaultEntry!5431 Int) (mask!26232 (_ BitVec 32)) (extraKeys!5152 (_ BitVec 32)) (zeroValue!5256 V!29447) (minValue!5256 V!29447) (_size!2262 (_ BitVec 32)) (_keys!10248 array!52805) (_values!5443 array!52807) (_vacant!2262 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4414)

(assert (=> mapNonEmpty!29207 (= (arr!25373 (_values!5443 thiss!1181)) (store mapRest!29207 mapKey!29207 mapValue!29207))))

(declare-fun mapIsEmpty!29207 () Bool)

(assert (=> mapIsEmpty!29207 mapRes!29207))

(declare-fun b!900344 () Bool)

(declare-fun res!607956 () Bool)

(declare-fun e!503860 () Bool)

(assert (=> b!900344 (=> (not res!607956) (not e!503860))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!900344 (= res!607956 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900345 () Bool)

(declare-fun e!503863 () Bool)

(assert (=> b!900345 (= e!503863 (and e!503858 mapRes!29207))))

(declare-fun condMapEmpty!29207 () Bool)

(declare-fun mapDefault!29207 () ValueCell!8699)

(assert (=> b!900345 (= condMapEmpty!29207 (= (arr!25373 (_values!5443 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8699)) mapDefault!29207)))))

(declare-fun e!503859 () Bool)

(declare-fun array_inv!19960 (array!52805) Bool)

(declare-fun array_inv!19961 (array!52807) Bool)

(assert (=> b!900346 (= e!503859 (and tp!56180 tp_is_empty!18361 (array_inv!19960 (_keys!10248 thiss!1181)) (array_inv!19961 (_values!5443 thiss!1181)) e!503863))))

(declare-fun b!900347 () Bool)

(declare-fun e!503864 () Bool)

(declare-datatypes ((SeekEntryResult!8886 0))(
  ( (MissingZero!8886 (index!37915 (_ BitVec 32))) (Found!8886 (index!37916 (_ BitVec 32))) (Intermediate!8886 (undefined!9698 Bool) (index!37917 (_ BitVec 32)) (x!76617 (_ BitVec 32))) (Undefined!8886) (MissingVacant!8886 (index!37918 (_ BitVec 32))) )
))
(declare-fun lt!406593 () SeekEntryResult!8886)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900347 (= e!503864 (inRange!0 (index!37916 lt!406593) (mask!26232 thiss!1181)))))

(declare-fun res!607960 () Bool)

(assert (=> start!77146 (=> (not res!607960) (not e!503860))))

(declare-fun valid!1708 (LongMapFixedSize!4414) Bool)

(assert (=> start!77146 (= res!607960 (valid!1708 thiss!1181))))

(assert (=> start!77146 e!503860))

(assert (=> start!77146 e!503859))

(assert (=> start!77146 true))

(declare-fun b!900348 () Bool)

(declare-fun e!503862 () Bool)

(assert (=> b!900348 (= e!503860 (not e!503862))))

(declare-fun res!607957 () Bool)

(assert (=> b!900348 (=> res!607957 e!503862)))

(get-info :version)

(assert (=> b!900348 (= res!607957 (not ((_ is Found!8886) lt!406593)))))

(assert (=> b!900348 e!503864))

(declare-fun res!607958 () Bool)

(assert (=> b!900348 (=> res!607958 e!503864)))

(assert (=> b!900348 (= res!607958 (not ((_ is Found!8886) lt!406593)))))

(declare-datatypes ((Unit!30556 0))(
  ( (Unit!30557) )
))
(declare-fun lt!406596 () Unit!30556)

(declare-fun lemmaSeekEntryGivesInRangeIndex!106 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 64)) Unit!30556)

(assert (=> b!900348 (= lt!406596 (lemmaSeekEntryGivesInRangeIndex!106 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52805 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!900348 (= lt!406593 (seekEntry!0 key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(declare-fun b!900349 () Bool)

(declare-fun e!503866 () Bool)

(assert (=> b!900349 (= e!503862 e!503866)))

(declare-fun res!607959 () Bool)

(assert (=> b!900349 (=> res!607959 e!503866)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900349 (= res!607959 (not (validMask!0 (mask!26232 thiss!1181))))))

(declare-datatypes ((tuple2!11962 0))(
  ( (tuple2!11963 (_1!5992 (_ BitVec 64)) (_2!5992 V!29447)) )
))
(declare-datatypes ((List!17799 0))(
  ( (Nil!17796) (Cons!17795 (h!18945 tuple2!11962) (t!25138 List!17799)) )
))
(declare-datatypes ((ListLongMap!10661 0))(
  ( (ListLongMap!10662 (toList!5346 List!17799)) )
))
(declare-fun contains!4391 (ListLongMap!10661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2618 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 32) Int) ListLongMap!10661)

(assert (=> b!900349 (contains!4391 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593)))))

(declare-fun lt!406594 () Unit!30556)

(declare-fun lemmaValidKeyInArrayIsInListMap!248 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 32) Int) Unit!30556)

(assert (=> b!900349 (= lt!406594 (lemmaValidKeyInArrayIsInListMap!248 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (index!37916 lt!406593) (defaultEntry!5431 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900349 (arrayContainsKey!0 (_keys!10248 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406595 () Unit!30556)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52805 (_ BitVec 64) (_ BitVec 32)) Unit!30556)

(assert (=> b!900349 (= lt!406595 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10248 thiss!1181) key!785 (index!37916 lt!406593)))))

(declare-fun b!900350 () Bool)

(assert (=> b!900350 (= e!503865 tp_is_empty!18361)))

(declare-fun b!900351 () Bool)

(assert (=> b!900351 (= e!503866 (or (not (= (size!25831 (_values!5443 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26232 thiss!1181)))) (not (= (size!25830 (_keys!10248 thiss!1181)) (size!25831 (_values!5443 thiss!1181)))) (bvslt (mask!26232 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5152 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and start!77146 res!607960) b!900344))

(assert (= (and b!900344 res!607956) b!900348))

(assert (= (and b!900348 (not res!607958)) b!900347))

(assert (= (and b!900348 (not res!607957)) b!900349))

(assert (= (and b!900349 (not res!607959)) b!900351))

(assert (= (and b!900345 condMapEmpty!29207) mapIsEmpty!29207))

(assert (= (and b!900345 (not condMapEmpty!29207)) mapNonEmpty!29207))

(assert (= (and mapNonEmpty!29207 ((_ is ValueCellFull!8699) mapValue!29207)) b!900350))

(assert (= (and b!900345 ((_ is ValueCellFull!8699) mapDefault!29207)) b!900343))

(assert (= b!900346 b!900345))

(assert (= start!77146 b!900346))

(declare-fun m!837211 () Bool)

(assert (=> b!900348 m!837211))

(declare-fun m!837213 () Bool)

(assert (=> b!900348 m!837213))

(declare-fun m!837215 () Bool)

(assert (=> b!900347 m!837215))

(declare-fun m!837217 () Bool)

(assert (=> b!900346 m!837217))

(declare-fun m!837219 () Bool)

(assert (=> b!900346 m!837219))

(declare-fun m!837221 () Bool)

(assert (=> mapNonEmpty!29207 m!837221))

(declare-fun m!837223 () Bool)

(assert (=> start!77146 m!837223))

(declare-fun m!837225 () Bool)

(assert (=> b!900349 m!837225))

(declare-fun m!837227 () Bool)

(assert (=> b!900349 m!837227))

(declare-fun m!837229 () Bool)

(assert (=> b!900349 m!837229))

(declare-fun m!837231 () Bool)

(assert (=> b!900349 m!837231))

(declare-fun m!837233 () Bool)

(assert (=> b!900349 m!837233))

(declare-fun m!837235 () Bool)

(assert (=> b!900349 m!837235))

(declare-fun m!837237 () Bool)

(assert (=> b!900349 m!837237))

(assert (=> b!900349 m!837233))

(assert (=> b!900349 m!837231))

(check-sat (not start!77146) (not b!900348) (not b!900347) (not b!900349) (not b_next!16033) tp_is_empty!18361 (not mapNonEmpty!29207) b_and!26351 (not b!900346))
(check-sat b_and!26351 (not b_next!16033))
(get-model)

(declare-fun d!111807 () Bool)

(declare-fun e!503923 () Bool)

(assert (=> d!111807 e!503923))

(declare-fun res!607993 () Bool)

(assert (=> d!111807 (=> res!607993 e!503923)))

(declare-fun lt!406626 () SeekEntryResult!8886)

(assert (=> d!111807 (= res!607993 (not ((_ is Found!8886) lt!406626)))))

(assert (=> d!111807 (= lt!406626 (seekEntry!0 key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(declare-fun lt!406625 () Unit!30556)

(declare-fun choose!1508 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 64)) Unit!30556)

(assert (=> d!111807 (= lt!406625 (choose!1508 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785))))

(assert (=> d!111807 (validMask!0 (mask!26232 thiss!1181))))

(assert (=> d!111807 (= (lemmaSeekEntryGivesInRangeIndex!106 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785) lt!406625)))

(declare-fun b!900408 () Bool)

(assert (=> b!900408 (= e!503923 (inRange!0 (index!37916 lt!406626) (mask!26232 thiss!1181)))))

(assert (= (and d!111807 (not res!607993)) b!900408))

(assert (=> d!111807 m!837213))

(declare-fun m!837295 () Bool)

(assert (=> d!111807 m!837295))

(assert (=> d!111807 m!837237))

(declare-fun m!837297 () Bool)

(assert (=> b!900408 m!837297))

(assert (=> b!900348 d!111807))

(declare-fun b!900421 () Bool)

(declare-fun e!503931 () SeekEntryResult!8886)

(declare-fun lt!406636 () SeekEntryResult!8886)

(assert (=> b!900421 (= e!503931 (MissingZero!8886 (index!37917 lt!406636)))))

(declare-fun b!900422 () Bool)

(declare-fun lt!406635 () SeekEntryResult!8886)

(assert (=> b!900422 (= e!503931 (ite ((_ is MissingVacant!8886) lt!406635) (MissingZero!8886 (index!37918 lt!406635)) lt!406635))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52805 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!900422 (= lt!406635 (seekKeyOrZeroReturnVacant!0 (x!76617 lt!406636) (index!37917 lt!406636) (index!37917 lt!406636) key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(declare-fun b!900423 () Bool)

(declare-fun c!95433 () Bool)

(declare-fun lt!406637 () (_ BitVec 64))

(assert (=> b!900423 (= c!95433 (= lt!406637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503932 () SeekEntryResult!8886)

(assert (=> b!900423 (= e!503932 e!503931)))

(declare-fun b!900424 () Bool)

(assert (=> b!900424 (= e!503932 (Found!8886 (index!37917 lt!406636)))))

(declare-fun b!900425 () Bool)

(declare-fun e!503930 () SeekEntryResult!8886)

(assert (=> b!900425 (= e!503930 Undefined!8886)))

(declare-fun d!111809 () Bool)

(declare-fun lt!406638 () SeekEntryResult!8886)

(assert (=> d!111809 (and (or ((_ is MissingVacant!8886) lt!406638) (not ((_ is Found!8886) lt!406638)) (and (bvsge (index!37916 lt!406638) #b00000000000000000000000000000000) (bvslt (index!37916 lt!406638) (size!25830 (_keys!10248 thiss!1181))))) (not ((_ is MissingVacant!8886) lt!406638)) (or (not ((_ is Found!8886) lt!406638)) (= (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406638)) key!785)))))

(assert (=> d!111809 (= lt!406638 e!503930)))

(declare-fun c!95432 () Bool)

(assert (=> d!111809 (= c!95432 (and ((_ is Intermediate!8886) lt!406636) (undefined!9698 lt!406636)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52805 (_ BitVec 32)) SeekEntryResult!8886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111809 (= lt!406636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26232 thiss!1181)) key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(assert (=> d!111809 (validMask!0 (mask!26232 thiss!1181))))

(assert (=> d!111809 (= (seekEntry!0 key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)) lt!406638)))

(declare-fun b!900426 () Bool)

(assert (=> b!900426 (= e!503930 e!503932)))

(assert (=> b!900426 (= lt!406637 (select (arr!25372 (_keys!10248 thiss!1181)) (index!37917 lt!406636)))))

(declare-fun c!95434 () Bool)

(assert (=> b!900426 (= c!95434 (= lt!406637 key!785))))

(assert (= (and d!111809 c!95432) b!900425))

(assert (= (and d!111809 (not c!95432)) b!900426))

(assert (= (and b!900426 c!95434) b!900424))

(assert (= (and b!900426 (not c!95434)) b!900423))

(assert (= (and b!900423 c!95433) b!900421))

(assert (= (and b!900423 (not c!95433)) b!900422))

(declare-fun m!837299 () Bool)

(assert (=> b!900422 m!837299))

(declare-fun m!837301 () Bool)

(assert (=> d!111809 m!837301))

(declare-fun m!837303 () Bool)

(assert (=> d!111809 m!837303))

(assert (=> d!111809 m!837303))

(declare-fun m!837305 () Bool)

(assert (=> d!111809 m!837305))

(assert (=> d!111809 m!837237))

(declare-fun m!837307 () Bool)

(assert (=> b!900426 m!837307))

(assert (=> b!900348 d!111809))

(declare-fun d!111811 () Bool)

(assert (=> d!111811 (= (validMask!0 (mask!26232 thiss!1181)) (and (or (= (mask!26232 thiss!1181) #b00000000000000000000000000000111) (= (mask!26232 thiss!1181) #b00000000000000000000000000001111) (= (mask!26232 thiss!1181) #b00000000000000000000000000011111) (= (mask!26232 thiss!1181) #b00000000000000000000000000111111) (= (mask!26232 thiss!1181) #b00000000000000000000000001111111) (= (mask!26232 thiss!1181) #b00000000000000000000000011111111) (= (mask!26232 thiss!1181) #b00000000000000000000000111111111) (= (mask!26232 thiss!1181) #b00000000000000000000001111111111) (= (mask!26232 thiss!1181) #b00000000000000000000011111111111) (= (mask!26232 thiss!1181) #b00000000000000000000111111111111) (= (mask!26232 thiss!1181) #b00000000000000000001111111111111) (= (mask!26232 thiss!1181) #b00000000000000000011111111111111) (= (mask!26232 thiss!1181) #b00000000000000000111111111111111) (= (mask!26232 thiss!1181) #b00000000000000001111111111111111) (= (mask!26232 thiss!1181) #b00000000000000011111111111111111) (= (mask!26232 thiss!1181) #b00000000000000111111111111111111) (= (mask!26232 thiss!1181) #b00000000000001111111111111111111) (= (mask!26232 thiss!1181) #b00000000000011111111111111111111) (= (mask!26232 thiss!1181) #b00000000000111111111111111111111) (= (mask!26232 thiss!1181) #b00000000001111111111111111111111) (= (mask!26232 thiss!1181) #b00000000011111111111111111111111) (= (mask!26232 thiss!1181) #b00000000111111111111111111111111) (= (mask!26232 thiss!1181) #b00000001111111111111111111111111) (= (mask!26232 thiss!1181) #b00000011111111111111111111111111) (= (mask!26232 thiss!1181) #b00000111111111111111111111111111) (= (mask!26232 thiss!1181) #b00001111111111111111111111111111) (= (mask!26232 thiss!1181) #b00011111111111111111111111111111) (= (mask!26232 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26232 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900349 d!111811))

(declare-fun d!111813 () Bool)

(declare-fun res!607998 () Bool)

(declare-fun e!503937 () Bool)

(assert (=> d!111813 (=> res!607998 e!503937)))

(assert (=> d!111813 (= res!607998 (= (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111813 (= (arrayContainsKey!0 (_keys!10248 thiss!1181) key!785 #b00000000000000000000000000000000) e!503937)))

(declare-fun b!900431 () Bool)

(declare-fun e!503938 () Bool)

(assert (=> b!900431 (= e!503937 e!503938)))

(declare-fun res!607999 () Bool)

(assert (=> b!900431 (=> (not res!607999) (not e!503938))))

(assert (=> b!900431 (= res!607999 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun b!900432 () Bool)

(assert (=> b!900432 (= e!503938 (arrayContainsKey!0 (_keys!10248 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111813 (not res!607998)) b!900431))

(assert (= (and b!900431 res!607999) b!900432))

(declare-fun m!837309 () Bool)

(assert (=> d!111813 m!837309))

(declare-fun m!837311 () Bool)

(assert (=> b!900432 m!837311))

(assert (=> b!900349 d!111813))

(declare-fun d!111815 () Bool)

(assert (=> d!111815 (arrayContainsKey!0 (_keys!10248 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406641 () Unit!30556)

(declare-fun choose!13 (array!52805 (_ BitVec 64) (_ BitVec 32)) Unit!30556)

(assert (=> d!111815 (= lt!406641 (choose!13 (_keys!10248 thiss!1181) key!785 (index!37916 lt!406593)))))

(assert (=> d!111815 (bvsge (index!37916 lt!406593) #b00000000000000000000000000000000)))

(assert (=> d!111815 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10248 thiss!1181) key!785 (index!37916 lt!406593)) lt!406641)))

(declare-fun bs!25265 () Bool)

(assert (= bs!25265 d!111815))

(assert (=> bs!25265 m!837227))

(declare-fun m!837313 () Bool)

(assert (=> bs!25265 m!837313))

(assert (=> b!900349 d!111815))

(declare-fun d!111817 () Bool)

(declare-fun e!503941 () Bool)

(assert (=> d!111817 e!503941))

(declare-fun res!608002 () Bool)

(assert (=> d!111817 (=> (not res!608002) (not e!503941))))

(assert (=> d!111817 (= res!608002 (and (bvsge (index!37916 lt!406593) #b00000000000000000000000000000000) (bvslt (index!37916 lt!406593) (size!25830 (_keys!10248 thiss!1181)))))))

(declare-fun lt!406644 () Unit!30556)

(declare-fun choose!1509 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 32) Int) Unit!30556)

(assert (=> d!111817 (= lt!406644 (choose!1509 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (index!37916 lt!406593) (defaultEntry!5431 thiss!1181)))))

(assert (=> d!111817 (validMask!0 (mask!26232 thiss!1181))))

(assert (=> d!111817 (= (lemmaValidKeyInArrayIsInListMap!248 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (index!37916 lt!406593) (defaultEntry!5431 thiss!1181)) lt!406644)))

(declare-fun b!900435 () Bool)

(assert (=> b!900435 (= e!503941 (contains!4391 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(assert (= (and d!111817 res!608002) b!900435))

(declare-fun m!837315 () Bool)

(assert (=> d!111817 m!837315))

(assert (=> d!111817 m!837237))

(assert (=> b!900435 m!837231))

(assert (=> b!900435 m!837233))

(assert (=> b!900435 m!837231))

(assert (=> b!900435 m!837233))

(assert (=> b!900435 m!837235))

(assert (=> b!900349 d!111817))

(declare-fun b!900478 () Bool)

(declare-fun e!503980 () Bool)

(declare-fun lt!406697 () ListLongMap!10661)

(declare-fun apply!409 (ListLongMap!10661 (_ BitVec 64)) V!29447)

(declare-fun get!13358 (ValueCell!8699 V!29447) V!29447)

(declare-fun dynLambda!1324 (Int (_ BitVec 64)) V!29447)

(assert (=> b!900478 (= e!503980 (= (apply!409 lt!406697 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)) (get!13358 (select (arr!25373 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1324 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900478 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25831 (_values!5443 thiss!1181))))))

(assert (=> b!900478 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun b!900479 () Bool)

(declare-fun e!503975 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900479 (= e!503975 (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900480 () Bool)

(declare-fun e!503970 () Bool)

(declare-fun call!40007 () Bool)

(assert (=> b!900480 (= e!503970 (not call!40007))))

(declare-fun bm!40000 () Bool)

(declare-fun call!40005 () ListLongMap!10661)

(declare-fun call!40004 () ListLongMap!10661)

(assert (=> bm!40000 (= call!40005 call!40004)))

(declare-fun b!900481 () Bool)

(declare-fun c!95452 () Bool)

(assert (=> b!900481 (= c!95452 (and (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!503973 () ListLongMap!10661)

(declare-fun e!503977 () ListLongMap!10661)

(assert (=> b!900481 (= e!503973 e!503977)))

(declare-fun b!900482 () Bool)

(declare-fun e!503971 () Bool)

(assert (=> b!900482 (= e!503971 (= (apply!409 lt!406697 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5256 thiss!1181)))))

(declare-fun d!111819 () Bool)

(declare-fun e!503968 () Bool)

(assert (=> d!111819 e!503968))

(declare-fun res!608025 () Bool)

(assert (=> d!111819 (=> (not res!608025) (not e!503968))))

(assert (=> d!111819 (= res!608025 (or (bvsge #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))))

(declare-fun lt!406706 () ListLongMap!10661)

(assert (=> d!111819 (= lt!406697 lt!406706)))

(declare-fun lt!406696 () Unit!30556)

(declare-fun e!503974 () Unit!30556)

(assert (=> d!111819 (= lt!406696 e!503974)))

(declare-fun c!95448 () Bool)

(declare-fun e!503969 () Bool)

(assert (=> d!111819 (= c!95448 e!503969)))

(declare-fun res!608028 () Bool)

(assert (=> d!111819 (=> (not res!608028) (not e!503969))))

(assert (=> d!111819 (= res!608028 (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun e!503976 () ListLongMap!10661)

(assert (=> d!111819 (= lt!406706 e!503976)))

(declare-fun c!95449 () Bool)

(assert (=> d!111819 (= c!95449 (and (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111819 (validMask!0 (mask!26232 thiss!1181))))

(assert (=> d!111819 (= (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) lt!406697)))

(declare-fun bm!40001 () Bool)

(declare-fun call!40006 () ListLongMap!10661)

(declare-fun call!40008 () ListLongMap!10661)

(declare-fun c!95451 () Bool)

(declare-fun +!2604 (ListLongMap!10661 tuple2!11962) ListLongMap!10661)

(assert (=> bm!40001 (= call!40008 (+!2604 (ite c!95449 call!40006 (ite c!95451 call!40004 call!40005)) (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(declare-fun b!900483 () Bool)

(declare-fun e!503979 () Bool)

(assert (=> b!900483 (= e!503970 e!503979)))

(declare-fun res!608027 () Bool)

(assert (=> b!900483 (= res!608027 call!40007)))

(assert (=> b!900483 (=> (not res!608027) (not e!503979))))

(declare-fun b!900484 () Bool)

(declare-fun call!40003 () ListLongMap!10661)

(assert (=> b!900484 (= e!503973 call!40003)))

(declare-fun bm!40002 () Bool)

(assert (=> bm!40002 (= call!40004 call!40006)))

(declare-fun bm!40003 () Bool)

(assert (=> bm!40003 (= call!40003 call!40008)))

(declare-fun b!900485 () Bool)

(declare-fun res!608029 () Bool)

(assert (=> b!900485 (=> (not res!608029) (not e!503968))))

(declare-fun e!503972 () Bool)

(assert (=> b!900485 (= res!608029 e!503972)))

(declare-fun c!95450 () Bool)

(assert (=> b!900485 (= c!95450 (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!900486 () Bool)

(assert (=> b!900486 (= e!503969 (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900487 () Bool)

(declare-fun call!40009 () Bool)

(assert (=> b!900487 (= e!503972 (not call!40009))))

(declare-fun bm!40004 () Bool)

(assert (=> bm!40004 (= call!40009 (contains!4391 lt!406697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900488 () Bool)

(assert (=> b!900488 (= e!503972 e!503971)))

(declare-fun res!608023 () Bool)

(assert (=> b!900488 (= res!608023 call!40009)))

(assert (=> b!900488 (=> (not res!608023) (not e!503971))))

(declare-fun b!900489 () Bool)

(assert (=> b!900489 (= e!503979 (= (apply!409 lt!406697 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5256 thiss!1181)))))

(declare-fun b!900490 () Bool)

(declare-fun Unit!30562 () Unit!30556)

(assert (=> b!900490 (= e!503974 Unit!30562)))

(declare-fun b!900491 () Bool)

(assert (=> b!900491 (= e!503976 e!503973)))

(assert (=> b!900491 (= c!95451 (and (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900492 () Bool)

(assert (=> b!900492 (= e!503976 (+!2604 call!40008 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))

(declare-fun b!900493 () Bool)

(assert (=> b!900493 (= e!503977 call!40003)))

(declare-fun bm!40005 () Bool)

(assert (=> bm!40005 (= call!40007 (contains!4391 lt!406697 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40006 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3325 (array!52805 array!52807 (_ BitVec 32) (_ BitVec 32) V!29447 V!29447 (_ BitVec 32) Int) ListLongMap!10661)

(assert (=> bm!40006 (= call!40006 (getCurrentListMapNoExtraKeys!3325 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun b!900494 () Bool)

(declare-fun e!503978 () Bool)

(assert (=> b!900494 (= e!503978 e!503980)))

(declare-fun res!608024 () Bool)

(assert (=> b!900494 (=> (not res!608024) (not e!503980))))

(assert (=> b!900494 (= res!608024 (contains!4391 lt!406697 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900494 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun b!900495 () Bool)

(declare-fun res!608021 () Bool)

(assert (=> b!900495 (=> (not res!608021) (not e!503968))))

(assert (=> b!900495 (= res!608021 e!503978)))

(declare-fun res!608022 () Bool)

(assert (=> b!900495 (=> res!608022 e!503978)))

(assert (=> b!900495 (= res!608022 (not e!503975))))

(declare-fun res!608026 () Bool)

(assert (=> b!900495 (=> (not res!608026) (not e!503975))))

(assert (=> b!900495 (= res!608026 (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun b!900496 () Bool)

(declare-fun lt!406692 () Unit!30556)

(assert (=> b!900496 (= e!503974 lt!406692)))

(declare-fun lt!406698 () ListLongMap!10661)

(assert (=> b!900496 (= lt!406698 (getCurrentListMapNoExtraKeys!3325 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun lt!406691 () (_ BitVec 64))

(assert (=> b!900496 (= lt!406691 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406689 () (_ BitVec 64))

(assert (=> b!900496 (= lt!406689 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406694 () Unit!30556)

(declare-fun addStillContains!335 (ListLongMap!10661 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30556)

(assert (=> b!900496 (= lt!406694 (addStillContains!335 lt!406698 lt!406691 (zeroValue!5256 thiss!1181) lt!406689))))

(assert (=> b!900496 (contains!4391 (+!2604 lt!406698 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181))) lt!406689)))

(declare-fun lt!406703 () Unit!30556)

(assert (=> b!900496 (= lt!406703 lt!406694)))

(declare-fun lt!406693 () ListLongMap!10661)

(assert (=> b!900496 (= lt!406693 (getCurrentListMapNoExtraKeys!3325 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun lt!406710 () (_ BitVec 64))

(assert (=> b!900496 (= lt!406710 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406708 () (_ BitVec 64))

(assert (=> b!900496 (= lt!406708 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406701 () Unit!30556)

(declare-fun addApplyDifferent!335 (ListLongMap!10661 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30556)

(assert (=> b!900496 (= lt!406701 (addApplyDifferent!335 lt!406693 lt!406710 (minValue!5256 thiss!1181) lt!406708))))

(assert (=> b!900496 (= (apply!409 (+!2604 lt!406693 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181))) lt!406708) (apply!409 lt!406693 lt!406708))))

(declare-fun lt!406690 () Unit!30556)

(assert (=> b!900496 (= lt!406690 lt!406701)))

(declare-fun lt!406699 () ListLongMap!10661)

(assert (=> b!900496 (= lt!406699 (getCurrentListMapNoExtraKeys!3325 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun lt!406705 () (_ BitVec 64))

(assert (=> b!900496 (= lt!406705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406704 () (_ BitVec 64))

(assert (=> b!900496 (= lt!406704 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406707 () Unit!30556)

(assert (=> b!900496 (= lt!406707 (addApplyDifferent!335 lt!406699 lt!406705 (zeroValue!5256 thiss!1181) lt!406704))))

(assert (=> b!900496 (= (apply!409 (+!2604 lt!406699 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181))) lt!406704) (apply!409 lt!406699 lt!406704))))

(declare-fun lt!406702 () Unit!30556)

(assert (=> b!900496 (= lt!406702 lt!406707)))

(declare-fun lt!406709 () ListLongMap!10661)

(assert (=> b!900496 (= lt!406709 (getCurrentListMapNoExtraKeys!3325 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))

(declare-fun lt!406700 () (_ BitVec 64))

(assert (=> b!900496 (= lt!406700 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406695 () (_ BitVec 64))

(assert (=> b!900496 (= lt!406695 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900496 (= lt!406692 (addApplyDifferent!335 lt!406709 lt!406700 (minValue!5256 thiss!1181) lt!406695))))

(assert (=> b!900496 (= (apply!409 (+!2604 lt!406709 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181))) lt!406695) (apply!409 lt!406709 lt!406695))))

(declare-fun b!900497 () Bool)

(assert (=> b!900497 (= e!503977 call!40005)))

(declare-fun b!900498 () Bool)

(assert (=> b!900498 (= e!503968 e!503970)))

(declare-fun c!95447 () Bool)

(assert (=> b!900498 (= c!95447 (not (= (bvand (extraKeys!5152 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!111819 c!95449) b!900492))

(assert (= (and d!111819 (not c!95449)) b!900491))

(assert (= (and b!900491 c!95451) b!900484))

(assert (= (and b!900491 (not c!95451)) b!900481))

(assert (= (and b!900481 c!95452) b!900493))

(assert (= (and b!900481 (not c!95452)) b!900497))

(assert (= (or b!900493 b!900497) bm!40000))

(assert (= (or b!900484 bm!40000) bm!40002))

(assert (= (or b!900484 b!900493) bm!40003))

(assert (= (or b!900492 bm!40002) bm!40006))

(assert (= (or b!900492 bm!40003) bm!40001))

(assert (= (and d!111819 res!608028) b!900486))

(assert (= (and d!111819 c!95448) b!900496))

(assert (= (and d!111819 (not c!95448)) b!900490))

(assert (= (and d!111819 res!608025) b!900495))

(assert (= (and b!900495 res!608026) b!900479))

(assert (= (and b!900495 (not res!608022)) b!900494))

(assert (= (and b!900494 res!608024) b!900478))

(assert (= (and b!900495 res!608021) b!900485))

(assert (= (and b!900485 c!95450) b!900488))

(assert (= (and b!900485 (not c!95450)) b!900487))

(assert (= (and b!900488 res!608023) b!900482))

(assert (= (or b!900488 b!900487) bm!40004))

(assert (= (and b!900485 res!608029) b!900498))

(assert (= (and b!900498 c!95447) b!900483))

(assert (= (and b!900498 (not c!95447)) b!900480))

(assert (= (and b!900483 res!608027) b!900489))

(assert (= (or b!900483 b!900480) bm!40005))

(declare-fun b_lambda!13005 () Bool)

(assert (=> (not b_lambda!13005) (not b!900478)))

(declare-fun t!25142 () Bool)

(declare-fun tb!5191 () Bool)

(assert (=> (and b!900346 (= (defaultEntry!5431 thiss!1181) (defaultEntry!5431 thiss!1181)) t!25142) tb!5191))

(declare-fun result!10161 () Bool)

(assert (=> tb!5191 (= result!10161 tp_is_empty!18361)))

(assert (=> b!900478 t!25142))

(declare-fun b_and!26357 () Bool)

(assert (= b_and!26351 (and (=> t!25142 result!10161) b_and!26357)))

(assert (=> d!111819 m!837237))

(declare-fun m!837317 () Bool)

(assert (=> b!900489 m!837317))

(declare-fun m!837319 () Bool)

(assert (=> bm!40006 m!837319))

(declare-fun m!837321 () Bool)

(assert (=> b!900482 m!837321))

(assert (=> b!900478 m!837309))

(declare-fun m!837323 () Bool)

(assert (=> b!900478 m!837323))

(assert (=> b!900478 m!837309))

(declare-fun m!837325 () Bool)

(assert (=> b!900478 m!837325))

(declare-fun m!837327 () Bool)

(assert (=> b!900478 m!837327))

(assert (=> b!900478 m!837325))

(declare-fun m!837329 () Bool)

(assert (=> b!900478 m!837329))

(assert (=> b!900478 m!837327))

(declare-fun m!837331 () Bool)

(assert (=> bm!40004 m!837331))

(assert (=> b!900479 m!837309))

(assert (=> b!900479 m!837309))

(declare-fun m!837333 () Bool)

(assert (=> b!900479 m!837333))

(assert (=> b!900494 m!837309))

(assert (=> b!900494 m!837309))

(declare-fun m!837335 () Bool)

(assert (=> b!900494 m!837335))

(declare-fun m!837337 () Bool)

(assert (=> b!900492 m!837337))

(declare-fun m!837339 () Bool)

(assert (=> bm!40001 m!837339))

(declare-fun m!837341 () Bool)

(assert (=> bm!40005 m!837341))

(assert (=> b!900486 m!837309))

(assert (=> b!900486 m!837309))

(assert (=> b!900486 m!837333))

(declare-fun m!837343 () Bool)

(assert (=> b!900496 m!837343))

(declare-fun m!837345 () Bool)

(assert (=> b!900496 m!837345))

(declare-fun m!837347 () Bool)

(assert (=> b!900496 m!837347))

(assert (=> b!900496 m!837309))

(declare-fun m!837349 () Bool)

(assert (=> b!900496 m!837349))

(declare-fun m!837351 () Bool)

(assert (=> b!900496 m!837351))

(declare-fun m!837353 () Bool)

(assert (=> b!900496 m!837353))

(declare-fun m!837355 () Bool)

(assert (=> b!900496 m!837355))

(declare-fun m!837357 () Bool)

(assert (=> b!900496 m!837357))

(declare-fun m!837359 () Bool)

(assert (=> b!900496 m!837359))

(declare-fun m!837361 () Bool)

(assert (=> b!900496 m!837361))

(assert (=> b!900496 m!837319))

(assert (=> b!900496 m!837343))

(assert (=> b!900496 m!837355))

(declare-fun m!837363 () Bool)

(assert (=> b!900496 m!837363))

(declare-fun m!837365 () Bool)

(assert (=> b!900496 m!837365))

(declare-fun m!837367 () Bool)

(assert (=> b!900496 m!837367))

(assert (=> b!900496 m!837349))

(declare-fun m!837369 () Bool)

(assert (=> b!900496 m!837369))

(declare-fun m!837371 () Bool)

(assert (=> b!900496 m!837371))

(assert (=> b!900496 m!837359))

(assert (=> b!900349 d!111819))

(declare-fun d!111821 () Bool)

(declare-fun e!503986 () Bool)

(assert (=> d!111821 e!503986))

(declare-fun res!608032 () Bool)

(assert (=> d!111821 (=> res!608032 e!503986)))

(declare-fun lt!406720 () Bool)

(assert (=> d!111821 (= res!608032 (not lt!406720))))

(declare-fun lt!406721 () Bool)

(assert (=> d!111821 (= lt!406720 lt!406721)))

(declare-fun lt!406719 () Unit!30556)

(declare-fun e!503985 () Unit!30556)

(assert (=> d!111821 (= lt!406719 e!503985)))

(declare-fun c!95455 () Bool)

(assert (=> d!111821 (= c!95455 lt!406721)))

(declare-fun containsKey!430 (List!17799 (_ BitVec 64)) Bool)

(assert (=> d!111821 (= lt!406721 (containsKey!430 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(assert (=> d!111821 (= (contains!4391 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))) lt!406720)))

(declare-fun b!900507 () Bool)

(declare-fun lt!406722 () Unit!30556)

(assert (=> b!900507 (= e!503985 lt!406722)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!324 (List!17799 (_ BitVec 64)) Unit!30556)

(assert (=> b!900507 (= lt!406722 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(declare-datatypes ((Option!463 0))(
  ( (Some!462 (v!11725 V!29447)) (None!461) )
))
(declare-fun isDefined!332 (Option!463) Bool)

(declare-fun getValueByKey!457 (List!17799 (_ BitVec 64)) Option!463)

(assert (=> b!900507 (isDefined!332 (getValueByKey!457 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(declare-fun b!900508 () Bool)

(declare-fun Unit!30563 () Unit!30556)

(assert (=> b!900508 (= e!503985 Unit!30563)))

(declare-fun b!900509 () Bool)

(assert (=> b!900509 (= e!503986 (isDefined!332 (getValueByKey!457 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593)))))))

(assert (= (and d!111821 c!95455) b!900507))

(assert (= (and d!111821 (not c!95455)) b!900508))

(assert (= (and d!111821 (not res!608032)) b!900509))

(assert (=> d!111821 m!837233))

(declare-fun m!837373 () Bool)

(assert (=> d!111821 m!837373))

(assert (=> b!900507 m!837233))

(declare-fun m!837375 () Bool)

(assert (=> b!900507 m!837375))

(assert (=> b!900507 m!837233))

(declare-fun m!837377 () Bool)

(assert (=> b!900507 m!837377))

(assert (=> b!900507 m!837377))

(declare-fun m!837379 () Bool)

(assert (=> b!900507 m!837379))

(assert (=> b!900509 m!837233))

(assert (=> b!900509 m!837377))

(assert (=> b!900509 m!837377))

(assert (=> b!900509 m!837379))

(assert (=> b!900349 d!111821))

(declare-fun d!111823 () Bool)

(declare-fun res!608039 () Bool)

(declare-fun e!503989 () Bool)

(assert (=> d!111823 (=> (not res!608039) (not e!503989))))

(declare-fun simpleValid!327 (LongMapFixedSize!4414) Bool)

(assert (=> d!111823 (= res!608039 (simpleValid!327 thiss!1181))))

(assert (=> d!111823 (= (valid!1708 thiss!1181) e!503989)))

(declare-fun b!900516 () Bool)

(declare-fun res!608040 () Bool)

(assert (=> b!900516 (=> (not res!608040) (not e!503989))))

(declare-fun arrayCountValidKeys!0 (array!52805 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900516 (= res!608040 (= (arrayCountValidKeys!0 (_keys!10248 thiss!1181) #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))) (_size!2262 thiss!1181)))))

(declare-fun b!900517 () Bool)

(declare-fun res!608041 () Bool)

(assert (=> b!900517 (=> (not res!608041) (not e!503989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52805 (_ BitVec 32)) Bool)

(assert (=> b!900517 (= res!608041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(declare-fun b!900518 () Bool)

(declare-datatypes ((List!17802 0))(
  ( (Nil!17799) (Cons!17798 (h!18948 (_ BitVec 64)) (t!25143 List!17802)) )
))
(declare-fun arrayNoDuplicates!0 (array!52805 (_ BitVec 32) List!17802) Bool)

(assert (=> b!900518 (= e!503989 (arrayNoDuplicates!0 (_keys!10248 thiss!1181) #b00000000000000000000000000000000 Nil!17799))))

(assert (= (and d!111823 res!608039) b!900516))

(assert (= (and b!900516 res!608040) b!900517))

(assert (= (and b!900517 res!608041) b!900518))

(declare-fun m!837381 () Bool)

(assert (=> d!111823 m!837381))

(declare-fun m!837383 () Bool)

(assert (=> b!900516 m!837383))

(declare-fun m!837385 () Bool)

(assert (=> b!900517 m!837385))

(declare-fun m!837387 () Bool)

(assert (=> b!900518 m!837387))

(assert (=> start!77146 d!111823))

(declare-fun d!111825 () Bool)

(assert (=> d!111825 (= (array_inv!19960 (_keys!10248 thiss!1181)) (bvsge (size!25830 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900346 d!111825))

(declare-fun d!111827 () Bool)

(assert (=> d!111827 (= (array_inv!19961 (_values!5443 thiss!1181)) (bvsge (size!25831 (_values!5443 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900346 d!111827))

(declare-fun d!111829 () Bool)

(assert (=> d!111829 (= (inRange!0 (index!37916 lt!406593) (mask!26232 thiss!1181)) (and (bvsge (index!37916 lt!406593) #b00000000000000000000000000000000) (bvslt (index!37916 lt!406593) (bvadd (mask!26232 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900347 d!111829))

(declare-fun mapIsEmpty!29216 () Bool)

(declare-fun mapRes!29216 () Bool)

(assert (=> mapIsEmpty!29216 mapRes!29216))

(declare-fun mapNonEmpty!29216 () Bool)

(declare-fun tp!56195 () Bool)

(declare-fun e!503994 () Bool)

(assert (=> mapNonEmpty!29216 (= mapRes!29216 (and tp!56195 e!503994))))

(declare-fun mapRest!29216 () (Array (_ BitVec 32) ValueCell!8699))

(declare-fun mapKey!29216 () (_ BitVec 32))

(declare-fun mapValue!29216 () ValueCell!8699)

(assert (=> mapNonEmpty!29216 (= mapRest!29207 (store mapRest!29216 mapKey!29216 mapValue!29216))))

(declare-fun condMapEmpty!29216 () Bool)

(declare-fun mapDefault!29216 () ValueCell!8699)

(assert (=> mapNonEmpty!29207 (= condMapEmpty!29216 (= mapRest!29207 ((as const (Array (_ BitVec 32) ValueCell!8699)) mapDefault!29216)))))

(declare-fun e!503995 () Bool)

(assert (=> mapNonEmpty!29207 (= tp!56179 (and e!503995 mapRes!29216))))

(declare-fun b!900525 () Bool)

(assert (=> b!900525 (= e!503994 tp_is_empty!18361)))

(declare-fun b!900526 () Bool)

(assert (=> b!900526 (= e!503995 tp_is_empty!18361)))

(assert (= (and mapNonEmpty!29207 condMapEmpty!29216) mapIsEmpty!29216))

(assert (= (and mapNonEmpty!29207 (not condMapEmpty!29216)) mapNonEmpty!29216))

(assert (= (and mapNonEmpty!29216 ((_ is ValueCellFull!8699) mapValue!29216)) b!900525))

(assert (= (and mapNonEmpty!29207 ((_ is ValueCellFull!8699) mapDefault!29216)) b!900526))

(declare-fun m!837389 () Bool)

(assert (=> mapNonEmpty!29216 m!837389))

(declare-fun b_lambda!13007 () Bool)

(assert (= b_lambda!13005 (or (and b!900346 b_free!16033) b_lambda!13007)))

(check-sat (not b!900516) (not b!900492) (not b!900486) (not b!900496) (not b!900509) (not b!900422) (not bm!40006) (not b_lambda!13007) (not bm!40001) b_and!26357 (not b!900435) (not mapNonEmpty!29216) (not d!111807) tp_is_empty!18361 (not bm!40005) (not d!111823) (not b!900482) (not d!111819) (not b!900408) (not b!900489) (not b_next!16033) (not b!900478) (not b!900518) (not d!111809) (not d!111817) (not b!900479) (not d!111821) (not b!900507) (not bm!40004) (not b!900494) (not b!900517) (not d!111815) (not b!900432))
(check-sat b_and!26357 (not b_next!16033))
(get-model)

(assert (=> b!900435 d!111821))

(assert (=> b!900435 d!111819))

(declare-fun d!111831 () Bool)

(declare-fun lt!406727 () SeekEntryResult!8886)

(assert (=> d!111831 (and (or ((_ is Undefined!8886) lt!406727) (not ((_ is Found!8886) lt!406727)) (and (bvsge (index!37916 lt!406727) #b00000000000000000000000000000000) (bvslt (index!37916 lt!406727) (size!25830 (_keys!10248 thiss!1181))))) (or ((_ is Undefined!8886) lt!406727) ((_ is Found!8886) lt!406727) (not ((_ is MissingVacant!8886) lt!406727)) (not (= (index!37918 lt!406727) (index!37917 lt!406636))) (and (bvsge (index!37918 lt!406727) #b00000000000000000000000000000000) (bvslt (index!37918 lt!406727) (size!25830 (_keys!10248 thiss!1181))))) (or ((_ is Undefined!8886) lt!406727) (ite ((_ is Found!8886) lt!406727) (= (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406727)) key!785) (and ((_ is MissingVacant!8886) lt!406727) (= (index!37918 lt!406727) (index!37917 lt!406636)) (= (select (arr!25372 (_keys!10248 thiss!1181)) (index!37918 lt!406727)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!504002 () SeekEntryResult!8886)

(assert (=> d!111831 (= lt!406727 e!504002)))

(declare-fun c!95463 () Bool)

(assert (=> d!111831 (= c!95463 (bvsge (x!76617 lt!406636) #b01111111111111111111111111111110))))

(declare-fun lt!406728 () (_ BitVec 64))

(assert (=> d!111831 (= lt!406728 (select (arr!25372 (_keys!10248 thiss!1181)) (index!37917 lt!406636)))))

(assert (=> d!111831 (validMask!0 (mask!26232 thiss!1181))))

(assert (=> d!111831 (= (seekKeyOrZeroReturnVacant!0 (x!76617 lt!406636) (index!37917 lt!406636) (index!37917 lt!406636) key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)) lt!406727)))

(declare-fun b!900539 () Bool)

(declare-fun e!504003 () SeekEntryResult!8886)

(assert (=> b!900539 (= e!504002 e!504003)))

(declare-fun c!95464 () Bool)

(assert (=> b!900539 (= c!95464 (= lt!406728 key!785))))

(declare-fun b!900540 () Bool)

(assert (=> b!900540 (= e!504003 (Found!8886 (index!37917 lt!406636)))))

(declare-fun b!900541 () Bool)

(declare-fun e!504004 () SeekEntryResult!8886)

(assert (=> b!900541 (= e!504004 (MissingVacant!8886 (index!37917 lt!406636)))))

(declare-fun b!900542 () Bool)

(assert (=> b!900542 (= e!504002 Undefined!8886)))

(declare-fun b!900543 () Bool)

(declare-fun c!95462 () Bool)

(assert (=> b!900543 (= c!95462 (= lt!406728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900543 (= e!504003 e!504004)))

(declare-fun b!900544 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900544 (= e!504004 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76617 lt!406636) #b00000000000000000000000000000001) (nextIndex!0 (index!37917 lt!406636) (bvadd (x!76617 lt!406636) #b00000000000000000000000000000001) (mask!26232 thiss!1181)) (index!37917 lt!406636) key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(assert (= (and d!111831 c!95463) b!900542))

(assert (= (and d!111831 (not c!95463)) b!900539))

(assert (= (and b!900539 c!95464) b!900540))

(assert (= (and b!900539 (not c!95464)) b!900543))

(assert (= (and b!900543 c!95462) b!900541))

(assert (= (and b!900543 (not c!95462)) b!900544))

(declare-fun m!837391 () Bool)

(assert (=> d!111831 m!837391))

(declare-fun m!837393 () Bool)

(assert (=> d!111831 m!837393))

(assert (=> d!111831 m!837307))

(assert (=> d!111831 m!837237))

(declare-fun m!837395 () Bool)

(assert (=> b!900544 m!837395))

(assert (=> b!900544 m!837395))

(declare-fun m!837397 () Bool)

(assert (=> b!900544 m!837397))

(assert (=> b!900422 d!111831))

(declare-fun d!111833 () Bool)

(declare-fun res!608042 () Bool)

(declare-fun e!504005 () Bool)

(assert (=> d!111833 (=> res!608042 e!504005)))

(assert (=> d!111833 (= res!608042 (= (select (arr!25372 (_keys!10248 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111833 (= (arrayContainsKey!0 (_keys!10248 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!504005)))

(declare-fun b!900545 () Bool)

(declare-fun e!504006 () Bool)

(assert (=> b!900545 (= e!504005 e!504006)))

(declare-fun res!608043 () Bool)

(assert (=> b!900545 (=> (not res!608043) (not e!504006))))

(assert (=> b!900545 (= res!608043 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun b!900546 () Bool)

(assert (=> b!900546 (= e!504006 (arrayContainsKey!0 (_keys!10248 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111833 (not res!608042)) b!900545))

(assert (= (and b!900545 res!608043) b!900546))

(declare-fun m!837399 () Bool)

(assert (=> d!111833 m!837399))

(declare-fun m!837401 () Bool)

(assert (=> b!900546 m!837401))

(assert (=> b!900432 d!111833))

(declare-fun d!111835 () Bool)

(assert (=> d!111835 (= (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900486 d!111835))

(declare-fun d!111837 () Bool)

(declare-fun get!13359 (Option!463) V!29447)

(assert (=> d!111837 (= (apply!409 lt!406697 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13359 (getValueByKey!457 (toList!5346 lt!406697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25266 () Bool)

(assert (= bs!25266 d!111837))

(declare-fun m!837403 () Bool)

(assert (=> bs!25266 m!837403))

(assert (=> bs!25266 m!837403))

(declare-fun m!837405 () Bool)

(assert (=> bs!25266 m!837405))

(assert (=> b!900489 d!111837))

(declare-fun d!111839 () Bool)

(declare-fun res!608048 () Bool)

(declare-fun e!504011 () Bool)

(assert (=> d!111839 (=> res!608048 e!504011)))

(assert (=> d!111839 (= res!608048 (and ((_ is Cons!17795) (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (= (_1!5992 (h!18945 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593)))))))

(assert (=> d!111839 (= (containsKey!430 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))) e!504011)))

(declare-fun b!900551 () Bool)

(declare-fun e!504012 () Bool)

(assert (=> b!900551 (= e!504011 e!504012)))

(declare-fun res!608049 () Bool)

(assert (=> b!900551 (=> (not res!608049) (not e!504012))))

(assert (=> b!900551 (= res!608049 (and (or (not ((_ is Cons!17795) (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (bvsle (_1!5992 (h!18945 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593)))) ((_ is Cons!17795) (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (bvslt (_1!5992 (h!18945 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593)))))))

(declare-fun b!900552 () Bool)

(assert (=> b!900552 (= e!504012 (containsKey!430 (t!25138 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(assert (= (and d!111839 (not res!608048)) b!900551))

(assert (= (and b!900551 res!608049) b!900552))

(assert (=> b!900552 m!837233))

(declare-fun m!837407 () Bool)

(assert (=> b!900552 m!837407))

(assert (=> d!111821 d!111839))

(declare-fun d!111841 () Bool)

(assert (=> d!111841 (contains!4391 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593)))))

(assert (=> d!111841 true))

(declare-fun _$16!184 () Unit!30556)

(assert (=> d!111841 (= (choose!1509 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (index!37916 lt!406593) (defaultEntry!5431 thiss!1181)) _$16!184)))

(declare-fun bs!25267 () Bool)

(assert (= bs!25267 d!111841))

(assert (=> bs!25267 m!837231))

(assert (=> bs!25267 m!837233))

(assert (=> bs!25267 m!837231))

(assert (=> bs!25267 m!837233))

(assert (=> bs!25267 m!837235))

(assert (=> d!111817 d!111841))

(assert (=> d!111817 d!111811))

(declare-fun d!111843 () Bool)

(declare-fun e!504014 () Bool)

(assert (=> d!111843 e!504014))

(declare-fun res!608050 () Bool)

(assert (=> d!111843 (=> res!608050 e!504014)))

(declare-fun lt!406730 () Bool)

(assert (=> d!111843 (= res!608050 (not lt!406730))))

(declare-fun lt!406731 () Bool)

(assert (=> d!111843 (= lt!406730 lt!406731)))

(declare-fun lt!406729 () Unit!30556)

(declare-fun e!504013 () Unit!30556)

(assert (=> d!111843 (= lt!406729 e!504013)))

(declare-fun c!95465 () Bool)

(assert (=> d!111843 (= c!95465 lt!406731)))

(assert (=> d!111843 (= lt!406731 (containsKey!430 (toList!5346 lt!406697) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111843 (= (contains!4391 lt!406697 #b0000000000000000000000000000000000000000000000000000000000000000) lt!406730)))

(declare-fun b!900553 () Bool)

(declare-fun lt!406732 () Unit!30556)

(assert (=> b!900553 (= e!504013 lt!406732)))

(assert (=> b!900553 (= lt!406732 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5346 lt!406697) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900553 (isDefined!332 (getValueByKey!457 (toList!5346 lt!406697) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900554 () Bool)

(declare-fun Unit!30564 () Unit!30556)

(assert (=> b!900554 (= e!504013 Unit!30564)))

(declare-fun b!900555 () Bool)

(assert (=> b!900555 (= e!504014 (isDefined!332 (getValueByKey!457 (toList!5346 lt!406697) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111843 c!95465) b!900553))

(assert (= (and d!111843 (not c!95465)) b!900554))

(assert (= (and d!111843 (not res!608050)) b!900555))

(declare-fun m!837409 () Bool)

(assert (=> d!111843 m!837409))

(declare-fun m!837411 () Bool)

(assert (=> b!900553 m!837411))

(declare-fun m!837413 () Bool)

(assert (=> b!900553 m!837413))

(assert (=> b!900553 m!837413))

(declare-fun m!837415 () Bool)

(assert (=> b!900553 m!837415))

(assert (=> b!900555 m!837413))

(assert (=> b!900555 m!837413))

(assert (=> b!900555 m!837415))

(assert (=> bm!40004 d!111843))

(declare-fun d!111845 () Bool)

(assert (=> d!111845 (isDefined!332 (getValueByKey!457 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(declare-fun lt!406735 () Unit!30556)

(declare-fun choose!1510 (List!17799 (_ BitVec 64)) Unit!30556)

(assert (=> d!111845 (= lt!406735 (choose!1510 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(declare-fun e!504017 () Bool)

(assert (=> d!111845 e!504017))

(declare-fun res!608053 () Bool)

(assert (=> d!111845 (=> (not res!608053) (not e!504017))))

(declare-fun isStrictlySorted!487 (List!17799) Bool)

(assert (=> d!111845 (= res!608053 (isStrictlySorted!487 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))))

(assert (=> d!111845 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))) lt!406735)))

(declare-fun b!900558 () Bool)

(assert (=> b!900558 (= e!504017 (containsKey!430 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(assert (= (and d!111845 res!608053) b!900558))

(assert (=> d!111845 m!837233))

(assert (=> d!111845 m!837377))

(assert (=> d!111845 m!837377))

(assert (=> d!111845 m!837379))

(assert (=> d!111845 m!837233))

(declare-fun m!837417 () Bool)

(assert (=> d!111845 m!837417))

(declare-fun m!837419 () Bool)

(assert (=> d!111845 m!837419))

(assert (=> b!900558 m!837233))

(assert (=> b!900558 m!837373))

(assert (=> b!900507 d!111845))

(declare-fun d!111847 () Bool)

(declare-fun isEmpty!694 (Option!463) Bool)

(assert (=> d!111847 (= (isDefined!332 (getValueByKey!457 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593)))) (not (isEmpty!694 (getValueByKey!457 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))))

(declare-fun bs!25268 () Bool)

(assert (= bs!25268 d!111847))

(assert (=> bs!25268 m!837377))

(declare-fun m!837421 () Bool)

(assert (=> bs!25268 m!837421))

(assert (=> b!900507 d!111847))

(declare-fun b!900570 () Bool)

(declare-fun e!504023 () Option!463)

(assert (=> b!900570 (= e!504023 None!461)))

(declare-fun d!111849 () Bool)

(declare-fun c!95470 () Bool)

(assert (=> d!111849 (= c!95470 (and ((_ is Cons!17795) (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (= (_1!5992 (h!18945 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593)))))))

(declare-fun e!504022 () Option!463)

(assert (=> d!111849 (= (getValueByKey!457 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))) e!504022)))

(declare-fun b!900568 () Bool)

(assert (=> b!900568 (= e!504022 e!504023)))

(declare-fun c!95471 () Bool)

(assert (=> b!900568 (= c!95471 (and ((_ is Cons!17795) (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (not (= (_1!5992 (h!18945 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181))))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))))

(declare-fun b!900567 () Bool)

(assert (=> b!900567 (= e!504022 (Some!462 (_2!5992 (h!18945 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))))))))

(declare-fun b!900569 () Bool)

(assert (=> b!900569 (= e!504023 (getValueByKey!457 (t!25138 (toList!5346 (getCurrentListMap!2618 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)))) (select (arr!25372 (_keys!10248 thiss!1181)) (index!37916 lt!406593))))))

(assert (= (and d!111849 c!95470) b!900567))

(assert (= (and d!111849 (not c!95470)) b!900568))

(assert (= (and b!900568 c!95471) b!900569))

(assert (= (and b!900568 (not c!95471)) b!900570))

(assert (=> b!900569 m!837233))

(declare-fun m!837423 () Bool)

(assert (=> b!900569 m!837423))

(assert (=> b!900507 d!111849))

(declare-fun d!111851 () Bool)

(declare-fun e!504026 () Bool)

(assert (=> d!111851 e!504026))

(declare-fun res!608058 () Bool)

(assert (=> d!111851 (=> (not res!608058) (not e!504026))))

(declare-fun lt!406745 () ListLongMap!10661)

(assert (=> d!111851 (= res!608058 (contains!4391 lt!406745 (_1!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(declare-fun lt!406746 () List!17799)

(assert (=> d!111851 (= lt!406745 (ListLongMap!10662 lt!406746))))

(declare-fun lt!406744 () Unit!30556)

(declare-fun lt!406747 () Unit!30556)

(assert (=> d!111851 (= lt!406744 lt!406747)))

(assert (=> d!111851 (= (getValueByKey!457 lt!406746 (_1!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))) (Some!462 (_2!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!251 (List!17799 (_ BitVec 64) V!29447) Unit!30556)

(assert (=> d!111851 (= lt!406747 (lemmaContainsTupThenGetReturnValue!251 lt!406746 (_1!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) (_2!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(declare-fun insertStrictlySorted!308 (List!17799 (_ BitVec 64) V!29447) List!17799)

(assert (=> d!111851 (= lt!406746 (insertStrictlySorted!308 (toList!5346 (ite c!95449 call!40006 (ite c!95451 call!40004 call!40005))) (_1!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) (_2!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(assert (=> d!111851 (= (+!2604 (ite c!95449 call!40006 (ite c!95451 call!40004 call!40005)) (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) lt!406745)))

(declare-fun b!900575 () Bool)

(declare-fun res!608059 () Bool)

(assert (=> b!900575 (=> (not res!608059) (not e!504026))))

(assert (=> b!900575 (= res!608059 (= (getValueByKey!457 (toList!5346 lt!406745) (_1!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))) (Some!462 (_2!5992 (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))))

(declare-fun b!900576 () Bool)

(declare-fun contains!4394 (List!17799 tuple2!11962) Bool)

(assert (=> b!900576 (= e!504026 (contains!4394 (toList!5346 lt!406745) (ite (or c!95449 c!95451) (tuple2!11963 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5256 thiss!1181)) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(assert (= (and d!111851 res!608058) b!900575))

(assert (= (and b!900575 res!608059) b!900576))

(declare-fun m!837425 () Bool)

(assert (=> d!111851 m!837425))

(declare-fun m!837427 () Bool)

(assert (=> d!111851 m!837427))

(declare-fun m!837429 () Bool)

(assert (=> d!111851 m!837429))

(declare-fun m!837431 () Bool)

(assert (=> d!111851 m!837431))

(declare-fun m!837433 () Bool)

(assert (=> b!900575 m!837433))

(declare-fun m!837435 () Bool)

(assert (=> b!900576 m!837435))

(assert (=> bm!40001 d!111851))

(declare-fun d!111853 () Bool)

(declare-fun e!504040 () Bool)

(assert (=> d!111853 e!504040))

(declare-fun c!95478 () Bool)

(declare-fun lt!406752 () SeekEntryResult!8886)

(assert (=> d!111853 (= c!95478 (and ((_ is Intermediate!8886) lt!406752) (undefined!9698 lt!406752)))))

(declare-fun e!504038 () SeekEntryResult!8886)

(assert (=> d!111853 (= lt!406752 e!504038)))

(declare-fun c!95479 () Bool)

(assert (=> d!111853 (= c!95479 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!406753 () (_ BitVec 64))

(assert (=> d!111853 (= lt!406753 (select (arr!25372 (_keys!10248 thiss!1181)) (toIndex!0 key!785 (mask!26232 thiss!1181))))))

(assert (=> d!111853 (validMask!0 (mask!26232 thiss!1181))))

(assert (=> d!111853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26232 thiss!1181)) key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)) lt!406752)))

(declare-fun b!900595 () Bool)

(assert (=> b!900595 (and (bvsge (index!37917 lt!406752) #b00000000000000000000000000000000) (bvslt (index!37917 lt!406752) (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun res!608066 () Bool)

(assert (=> b!900595 (= res!608066 (= (select (arr!25372 (_keys!10248 thiss!1181)) (index!37917 lt!406752)) key!785))))

(declare-fun e!504041 () Bool)

(assert (=> b!900595 (=> res!608066 e!504041)))

(declare-fun e!504037 () Bool)

(assert (=> b!900595 (= e!504037 e!504041)))

(declare-fun b!900596 () Bool)

(assert (=> b!900596 (and (bvsge (index!37917 lt!406752) #b00000000000000000000000000000000) (bvslt (index!37917 lt!406752) (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun res!608068 () Bool)

(assert (=> b!900596 (= res!608068 (= (select (arr!25372 (_keys!10248 thiss!1181)) (index!37917 lt!406752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900596 (=> res!608068 e!504041)))

(declare-fun b!900597 () Bool)

(declare-fun e!504039 () SeekEntryResult!8886)

(assert (=> b!900597 (= e!504038 e!504039)))

(declare-fun c!95480 () Bool)

(assert (=> b!900597 (= c!95480 (or (= lt!406753 key!785) (= (bvadd lt!406753 lt!406753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!900598 () Bool)

(assert (=> b!900598 (= e!504039 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26232 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26232 thiss!1181)) key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(declare-fun b!900599 () Bool)

(assert (=> b!900599 (= e!504040 e!504037)))

(declare-fun res!608067 () Bool)

(assert (=> b!900599 (= res!608067 (and ((_ is Intermediate!8886) lt!406752) (not (undefined!9698 lt!406752)) (bvslt (x!76617 lt!406752) #b01111111111111111111111111111110) (bvsge (x!76617 lt!406752) #b00000000000000000000000000000000) (bvsge (x!76617 lt!406752) #b00000000000000000000000000000000)))))

(assert (=> b!900599 (=> (not res!608067) (not e!504037))))

(declare-fun b!900600 () Bool)

(assert (=> b!900600 (= e!504040 (bvsge (x!76617 lt!406752) #b01111111111111111111111111111110))))

(declare-fun b!900601 () Bool)

(assert (=> b!900601 (= e!504038 (Intermediate!8886 true (toIndex!0 key!785 (mask!26232 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!900602 () Bool)

(assert (=> b!900602 (= e!504039 (Intermediate!8886 false (toIndex!0 key!785 (mask!26232 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!900603 () Bool)

(assert (=> b!900603 (and (bvsge (index!37917 lt!406752) #b00000000000000000000000000000000) (bvslt (index!37917 lt!406752) (size!25830 (_keys!10248 thiss!1181))))))

(assert (=> b!900603 (= e!504041 (= (select (arr!25372 (_keys!10248 thiss!1181)) (index!37917 lt!406752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111853 c!95479) b!900601))

(assert (= (and d!111853 (not c!95479)) b!900597))

(assert (= (and b!900597 c!95480) b!900602))

(assert (= (and b!900597 (not c!95480)) b!900598))

(assert (= (and d!111853 c!95478) b!900600))

(assert (= (and d!111853 (not c!95478)) b!900599))

(assert (= (and b!900599 res!608067) b!900595))

(assert (= (and b!900595 (not res!608066)) b!900596))

(assert (= (and b!900596 (not res!608068)) b!900603))

(assert (=> b!900598 m!837303))

(declare-fun m!837437 () Bool)

(assert (=> b!900598 m!837437))

(assert (=> b!900598 m!837437))

(declare-fun m!837439 () Bool)

(assert (=> b!900598 m!837439))

(assert (=> d!111853 m!837303))

(declare-fun m!837441 () Bool)

(assert (=> d!111853 m!837441))

(assert (=> d!111853 m!837237))

(declare-fun m!837443 () Bool)

(assert (=> b!900595 m!837443))

(assert (=> b!900596 m!837443))

(assert (=> b!900603 m!837443))

(assert (=> d!111809 d!111853))

(declare-fun d!111855 () Bool)

(declare-fun lt!406759 () (_ BitVec 32))

(declare-fun lt!406758 () (_ BitVec 32))

(assert (=> d!111855 (= lt!406759 (bvmul (bvxor lt!406758 (bvlshr lt!406758 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111855 (= lt!406758 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111855 (and (bvsge (mask!26232 thiss!1181) #b00000000000000000000000000000000) (let ((res!608069 (let ((h!18949 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76636 (bvmul (bvxor h!18949 (bvlshr h!18949 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76636 (bvlshr x!76636 #b00000000000000000000000000001101)) (mask!26232 thiss!1181)))))) (and (bvslt res!608069 (bvadd (mask!26232 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!608069 #b00000000000000000000000000000000))))))

(assert (=> d!111855 (= (toIndex!0 key!785 (mask!26232 thiss!1181)) (bvand (bvxor lt!406759 (bvlshr lt!406759 #b00000000000000000000000000001101)) (mask!26232 thiss!1181)))))

(assert (=> d!111809 d!111855))

(assert (=> d!111809 d!111811))

(assert (=> b!900509 d!111847))

(assert (=> b!900509 d!111849))

(declare-fun d!111857 () Bool)

(declare-fun e!504043 () Bool)

(assert (=> d!111857 e!504043))

(declare-fun res!608070 () Bool)

(assert (=> d!111857 (=> res!608070 e!504043)))

(declare-fun lt!406761 () Bool)

(assert (=> d!111857 (= res!608070 (not lt!406761))))

(declare-fun lt!406762 () Bool)

(assert (=> d!111857 (= lt!406761 lt!406762)))

(declare-fun lt!406760 () Unit!30556)

(declare-fun e!504042 () Unit!30556)

(assert (=> d!111857 (= lt!406760 e!504042)))

(declare-fun c!95481 () Bool)

(assert (=> d!111857 (= c!95481 lt!406762)))

(assert (=> d!111857 (= lt!406762 (containsKey!430 (toList!5346 lt!406697) (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111857 (= (contains!4391 lt!406697 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)) lt!406761)))

(declare-fun b!900604 () Bool)

(declare-fun lt!406763 () Unit!30556)

(assert (=> b!900604 (= e!504042 lt!406763)))

(assert (=> b!900604 (= lt!406763 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5346 lt!406697) (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900604 (isDefined!332 (getValueByKey!457 (toList!5346 lt!406697) (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900605 () Bool)

(declare-fun Unit!30565 () Unit!30556)

(assert (=> b!900605 (= e!504042 Unit!30565)))

(declare-fun b!900606 () Bool)

(assert (=> b!900606 (= e!504043 (isDefined!332 (getValueByKey!457 (toList!5346 lt!406697) (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!111857 c!95481) b!900604))

(assert (= (and d!111857 (not c!95481)) b!900605))

(assert (= (and d!111857 (not res!608070)) b!900606))

(assert (=> d!111857 m!837309))

(declare-fun m!837445 () Bool)

(assert (=> d!111857 m!837445))

(assert (=> b!900604 m!837309))

(declare-fun m!837447 () Bool)

(assert (=> b!900604 m!837447))

(assert (=> b!900604 m!837309))

(declare-fun m!837449 () Bool)

(assert (=> b!900604 m!837449))

(assert (=> b!900604 m!837449))

(declare-fun m!837451 () Bool)

(assert (=> b!900604 m!837451))

(assert (=> b!900606 m!837309))

(assert (=> b!900606 m!837449))

(assert (=> b!900606 m!837449))

(assert (=> b!900606 m!837451))

(assert (=> b!900494 d!111857))

(declare-fun b!900617 () Bool)

(declare-fun e!504054 () Bool)

(declare-fun e!504052 () Bool)

(assert (=> b!900617 (= e!504054 e!504052)))

(declare-fun res!608077 () Bool)

(assert (=> b!900617 (=> (not res!608077) (not e!504052))))

(declare-fun e!504055 () Bool)

(assert (=> b!900617 (= res!608077 (not e!504055))))

(declare-fun res!608078 () Bool)

(assert (=> b!900617 (=> (not res!608078) (not e!504055))))

(assert (=> b!900617 (= res!608078 (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900618 () Bool)

(declare-fun e!504053 () Bool)

(declare-fun call!40012 () Bool)

(assert (=> b!900618 (= e!504053 call!40012)))

(declare-fun b!900619 () Bool)

(assert (=> b!900619 (= e!504053 call!40012)))

(declare-fun d!111859 () Bool)

(declare-fun res!608079 () Bool)

(assert (=> d!111859 (=> res!608079 e!504054)))

(assert (=> d!111859 (= res!608079 (bvsge #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(assert (=> d!111859 (= (arrayNoDuplicates!0 (_keys!10248 thiss!1181) #b00000000000000000000000000000000 Nil!17799) e!504054)))

(declare-fun bm!40009 () Bool)

(declare-fun c!95484 () Bool)

(assert (=> bm!40009 (= call!40012 (arrayNoDuplicates!0 (_keys!10248 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95484 (Cons!17798 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000) Nil!17799) Nil!17799)))))

(declare-fun b!900620 () Bool)

(assert (=> b!900620 (= e!504052 e!504053)))

(assert (=> b!900620 (= c!95484 (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900621 () Bool)

(declare-fun contains!4395 (List!17802 (_ BitVec 64)) Bool)

(assert (=> b!900621 (= e!504055 (contains!4395 Nil!17799 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111859 (not res!608079)) b!900617))

(assert (= (and b!900617 res!608078) b!900621))

(assert (= (and b!900617 res!608077) b!900620))

(assert (= (and b!900620 c!95484) b!900619))

(assert (= (and b!900620 (not c!95484)) b!900618))

(assert (= (or b!900619 b!900618) bm!40009))

(assert (=> b!900617 m!837309))

(assert (=> b!900617 m!837309))

(assert (=> b!900617 m!837333))

(assert (=> bm!40009 m!837309))

(declare-fun m!837453 () Bool)

(assert (=> bm!40009 m!837453))

(assert (=> b!900620 m!837309))

(assert (=> b!900620 m!837309))

(assert (=> b!900620 m!837333))

(assert (=> b!900621 m!837309))

(assert (=> b!900621 m!837309))

(declare-fun m!837455 () Bool)

(assert (=> b!900621 m!837455))

(assert (=> b!900518 d!111859))

(assert (=> b!900479 d!111835))

(declare-fun b!900646 () Bool)

(declare-fun e!504075 () ListLongMap!10661)

(declare-fun call!40015 () ListLongMap!10661)

(assert (=> b!900646 (= e!504075 call!40015)))

(declare-fun b!900647 () Bool)

(declare-fun e!504072 () ListLongMap!10661)

(assert (=> b!900647 (= e!504072 (ListLongMap!10662 Nil!17796))))

(declare-fun bm!40012 () Bool)

(assert (=> bm!40012 (= call!40015 (getCurrentListMapNoExtraKeys!3325 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5431 thiss!1181)))))

(declare-fun b!900648 () Bool)

(declare-fun e!504074 () Bool)

(declare-fun lt!406784 () ListLongMap!10661)

(assert (=> b!900648 (= e!504074 (= lt!406784 (getCurrentListMapNoExtraKeys!3325 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5431 thiss!1181))))))

(declare-fun b!900649 () Bool)

(assert (=> b!900649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(assert (=> b!900649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25831 (_values!5443 thiss!1181))))))

(declare-fun e!504073 () Bool)

(assert (=> b!900649 (= e!504073 (= (apply!409 lt!406784 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)) (get!13358 (select (arr!25373 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1324 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!900650 () Bool)

(declare-fun e!504071 () Bool)

(assert (=> b!900650 (= e!504071 (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900650 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!900651 () Bool)

(declare-fun e!504070 () Bool)

(assert (=> b!900651 (= e!504070 e!504073)))

(assert (=> b!900651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun res!608091 () Bool)

(assert (=> b!900651 (= res!608091 (contains!4391 lt!406784 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900651 (=> (not res!608091) (not e!504073))))

(declare-fun b!900652 () Bool)

(declare-fun isEmpty!695 (ListLongMap!10661) Bool)

(assert (=> b!900652 (= e!504074 (isEmpty!695 lt!406784))))

(declare-fun d!111861 () Bool)

(declare-fun e!504076 () Bool)

(assert (=> d!111861 e!504076))

(declare-fun res!608090 () Bool)

(assert (=> d!111861 (=> (not res!608090) (not e!504076))))

(assert (=> d!111861 (= res!608090 (not (contains!4391 lt!406784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111861 (= lt!406784 e!504072)))

(declare-fun c!95493 () Bool)

(assert (=> d!111861 (= c!95493 (bvsge #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(assert (=> d!111861 (validMask!0 (mask!26232 thiss!1181))))

(assert (=> d!111861 (= (getCurrentListMapNoExtraKeys!3325 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5431 thiss!1181)) lt!406784)))

(declare-fun b!900653 () Bool)

(assert (=> b!900653 (= e!504072 e!504075)))

(declare-fun c!95494 () Bool)

(assert (=> b!900653 (= c!95494 (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900654 () Bool)

(declare-fun res!608089 () Bool)

(assert (=> b!900654 (=> (not res!608089) (not e!504076))))

(assert (=> b!900654 (= res!608089 (not (contains!4391 lt!406784 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!900655 () Bool)

(assert (=> b!900655 (= e!504076 e!504070)))

(declare-fun c!95496 () Bool)

(assert (=> b!900655 (= c!95496 e!504071)))

(declare-fun res!608088 () Bool)

(assert (=> b!900655 (=> (not res!608088) (not e!504071))))

(assert (=> b!900655 (= res!608088 (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun b!900656 () Bool)

(declare-fun lt!406780 () Unit!30556)

(declare-fun lt!406782 () Unit!30556)

(assert (=> b!900656 (= lt!406780 lt!406782)))

(declare-fun lt!406781 () (_ BitVec 64))

(declare-fun lt!406778 () V!29447)

(declare-fun lt!406783 () (_ BitVec 64))

(declare-fun lt!406779 () ListLongMap!10661)

(assert (=> b!900656 (not (contains!4391 (+!2604 lt!406779 (tuple2!11963 lt!406781 lt!406778)) lt!406783))))

(declare-fun addStillNotContains!218 (ListLongMap!10661 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30556)

(assert (=> b!900656 (= lt!406782 (addStillNotContains!218 lt!406779 lt!406781 lt!406778 lt!406783))))

(assert (=> b!900656 (= lt!406783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!900656 (= lt!406778 (get!13358 (select (arr!25373 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1324 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!900656 (= lt!406781 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900656 (= lt!406779 call!40015)))

(assert (=> b!900656 (= e!504075 (+!2604 call!40015 (tuple2!11963 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000) (get!13358 (select (arr!25373 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1324 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!900657 () Bool)

(assert (=> b!900657 (= e!504070 e!504074)))

(declare-fun c!95495 () Bool)

(assert (=> b!900657 (= c!95495 (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(assert (= (and d!111861 c!95493) b!900647))

(assert (= (and d!111861 (not c!95493)) b!900653))

(assert (= (and b!900653 c!95494) b!900656))

(assert (= (and b!900653 (not c!95494)) b!900646))

(assert (= (or b!900656 b!900646) bm!40012))

(assert (= (and d!111861 res!608090) b!900654))

(assert (= (and b!900654 res!608089) b!900655))

(assert (= (and b!900655 res!608088) b!900650))

(assert (= (and b!900655 c!95496) b!900651))

(assert (= (and b!900655 (not c!95496)) b!900657))

(assert (= (and b!900651 res!608091) b!900649))

(assert (= (and b!900657 c!95495) b!900648))

(assert (= (and b!900657 (not c!95495)) b!900652))

(declare-fun b_lambda!13009 () Bool)

(assert (=> (not b_lambda!13009) (not b!900649)))

(assert (=> b!900649 t!25142))

(declare-fun b_and!26359 () Bool)

(assert (= b_and!26357 (and (=> t!25142 result!10161) b_and!26359)))

(declare-fun b_lambda!13011 () Bool)

(assert (=> (not b_lambda!13011) (not b!900656)))

(assert (=> b!900656 t!25142))

(declare-fun b_and!26361 () Bool)

(assert (= b_and!26359 (and (=> t!25142 result!10161) b_and!26361)))

(declare-fun m!837457 () Bool)

(assert (=> b!900654 m!837457))

(declare-fun m!837459 () Bool)

(assert (=> b!900656 m!837459))

(assert (=> b!900656 m!837325))

(assert (=> b!900656 m!837327))

(assert (=> b!900656 m!837325))

(assert (=> b!900656 m!837329))

(declare-fun m!837461 () Bool)

(assert (=> b!900656 m!837461))

(declare-fun m!837463 () Bool)

(assert (=> b!900656 m!837463))

(assert (=> b!900656 m!837309))

(declare-fun m!837465 () Bool)

(assert (=> b!900656 m!837465))

(assert (=> b!900656 m!837327))

(assert (=> b!900656 m!837461))

(assert (=> b!900651 m!837309))

(assert (=> b!900651 m!837309))

(declare-fun m!837467 () Bool)

(assert (=> b!900651 m!837467))

(assert (=> b!900653 m!837309))

(assert (=> b!900653 m!837309))

(assert (=> b!900653 m!837333))

(assert (=> b!900650 m!837309))

(assert (=> b!900650 m!837309))

(assert (=> b!900650 m!837333))

(declare-fun m!837469 () Bool)

(assert (=> b!900648 m!837469))

(declare-fun m!837471 () Bool)

(assert (=> d!111861 m!837471))

(assert (=> d!111861 m!837237))

(assert (=> b!900649 m!837325))

(assert (=> b!900649 m!837327))

(assert (=> b!900649 m!837325))

(assert (=> b!900649 m!837329))

(assert (=> b!900649 m!837327))

(assert (=> b!900649 m!837309))

(declare-fun m!837473 () Bool)

(assert (=> b!900649 m!837473))

(assert (=> b!900649 m!837309))

(declare-fun m!837475 () Bool)

(assert (=> b!900652 m!837475))

(assert (=> bm!40012 m!837469))

(assert (=> bm!40006 d!111861))

(declare-fun d!111863 () Bool)

(assert (=> d!111863 (= (inRange!0 (index!37916 lt!406626) (mask!26232 thiss!1181)) (and (bvsge (index!37916 lt!406626) #b00000000000000000000000000000000) (bvslt (index!37916 lt!406626) (bvadd (mask!26232 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900408 d!111863))

(declare-fun d!111865 () Bool)

(assert (=> d!111865 (= (apply!409 lt!406697 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13359 (getValueByKey!457 (toList!5346 lt!406697) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25269 () Bool)

(assert (= bs!25269 d!111865))

(assert (=> bs!25269 m!837413))

(assert (=> bs!25269 m!837413))

(declare-fun m!837477 () Bool)

(assert (=> bs!25269 m!837477))

(assert (=> b!900482 d!111865))

(declare-fun d!111867 () Bool)

(declare-fun e!504077 () Bool)

(assert (=> d!111867 e!504077))

(declare-fun res!608092 () Bool)

(assert (=> d!111867 (=> (not res!608092) (not e!504077))))

(declare-fun lt!406786 () ListLongMap!10661)

(assert (=> d!111867 (= res!608092 (contains!4391 lt!406786 (_1!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181)))))))

(declare-fun lt!406787 () List!17799)

(assert (=> d!111867 (= lt!406786 (ListLongMap!10662 lt!406787))))

(declare-fun lt!406785 () Unit!30556)

(declare-fun lt!406788 () Unit!30556)

(assert (=> d!111867 (= lt!406785 lt!406788)))

(assert (=> d!111867 (= (getValueByKey!457 lt!406787 (_1!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181)))))))

(assert (=> d!111867 (= lt!406788 (lemmaContainsTupThenGetReturnValue!251 lt!406787 (_1!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181)))))))

(assert (=> d!111867 (= lt!406787 (insertStrictlySorted!308 (toList!5346 lt!406709) (_1!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181)))))))

(assert (=> d!111867 (= (+!2604 lt!406709 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181))) lt!406786)))

(declare-fun b!900658 () Bool)

(declare-fun res!608093 () Bool)

(assert (=> b!900658 (=> (not res!608093) (not e!504077))))

(assert (=> b!900658 (= res!608093 (= (getValueByKey!457 (toList!5346 lt!406786) (_1!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181))))))))

(declare-fun b!900659 () Bool)

(assert (=> b!900659 (= e!504077 (contains!4394 (toList!5346 lt!406786) (tuple2!11963 lt!406700 (minValue!5256 thiss!1181))))))

(assert (= (and d!111867 res!608092) b!900658))

(assert (= (and b!900658 res!608093) b!900659))

(declare-fun m!837479 () Bool)

(assert (=> d!111867 m!837479))

(declare-fun m!837481 () Bool)

(assert (=> d!111867 m!837481))

(declare-fun m!837483 () Bool)

(assert (=> d!111867 m!837483))

(declare-fun m!837485 () Bool)

(assert (=> d!111867 m!837485))

(declare-fun m!837487 () Bool)

(assert (=> b!900658 m!837487))

(declare-fun m!837489 () Bool)

(assert (=> b!900659 m!837489))

(assert (=> b!900496 d!111867))

(declare-fun d!111869 () Bool)

(assert (=> d!111869 (= (apply!409 lt!406699 lt!406704) (get!13359 (getValueByKey!457 (toList!5346 lt!406699) lt!406704)))))

(declare-fun bs!25270 () Bool)

(assert (= bs!25270 d!111869))

(declare-fun m!837491 () Bool)

(assert (=> bs!25270 m!837491))

(assert (=> bs!25270 m!837491))

(declare-fun m!837493 () Bool)

(assert (=> bs!25270 m!837493))

(assert (=> b!900496 d!111869))

(declare-fun d!111871 () Bool)

(assert (=> d!111871 (= (apply!409 (+!2604 lt!406709 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181))) lt!406695) (get!13359 (getValueByKey!457 (toList!5346 (+!2604 lt!406709 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181)))) lt!406695)))))

(declare-fun bs!25271 () Bool)

(assert (= bs!25271 d!111871))

(declare-fun m!837495 () Bool)

(assert (=> bs!25271 m!837495))

(assert (=> bs!25271 m!837495))

(declare-fun m!837497 () Bool)

(assert (=> bs!25271 m!837497))

(assert (=> b!900496 d!111871))

(declare-fun d!111873 () Bool)

(declare-fun e!504078 () Bool)

(assert (=> d!111873 e!504078))

(declare-fun res!608094 () Bool)

(assert (=> d!111873 (=> (not res!608094) (not e!504078))))

(declare-fun lt!406790 () ListLongMap!10661)

(assert (=> d!111873 (= res!608094 (contains!4391 lt!406790 (_1!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181)))))))

(declare-fun lt!406791 () List!17799)

(assert (=> d!111873 (= lt!406790 (ListLongMap!10662 lt!406791))))

(declare-fun lt!406789 () Unit!30556)

(declare-fun lt!406792 () Unit!30556)

(assert (=> d!111873 (= lt!406789 lt!406792)))

(assert (=> d!111873 (= (getValueByKey!457 lt!406791 (_1!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181)))))))

(assert (=> d!111873 (= lt!406792 (lemmaContainsTupThenGetReturnValue!251 lt!406791 (_1!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181)))))))

(assert (=> d!111873 (= lt!406791 (insertStrictlySorted!308 (toList!5346 lt!406693) (_1!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181)))))))

(assert (=> d!111873 (= (+!2604 lt!406693 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181))) lt!406790)))

(declare-fun b!900660 () Bool)

(declare-fun res!608095 () Bool)

(assert (=> b!900660 (=> (not res!608095) (not e!504078))))

(assert (=> b!900660 (= res!608095 (= (getValueByKey!457 (toList!5346 lt!406790) (_1!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181))))))))

(declare-fun b!900661 () Bool)

(assert (=> b!900661 (= e!504078 (contains!4394 (toList!5346 lt!406790) (tuple2!11963 lt!406710 (minValue!5256 thiss!1181))))))

(assert (= (and d!111873 res!608094) b!900660))

(assert (= (and b!900660 res!608095) b!900661))

(declare-fun m!837499 () Bool)

(assert (=> d!111873 m!837499))

(declare-fun m!837501 () Bool)

(assert (=> d!111873 m!837501))

(declare-fun m!837503 () Bool)

(assert (=> d!111873 m!837503))

(declare-fun m!837505 () Bool)

(assert (=> d!111873 m!837505))

(declare-fun m!837507 () Bool)

(assert (=> b!900660 m!837507))

(declare-fun m!837509 () Bool)

(assert (=> b!900661 m!837509))

(assert (=> b!900496 d!111873))

(declare-fun d!111875 () Bool)

(assert (=> d!111875 (= (apply!409 (+!2604 lt!406699 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181))) lt!406704) (get!13359 (getValueByKey!457 (toList!5346 (+!2604 lt!406699 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181)))) lt!406704)))))

(declare-fun bs!25272 () Bool)

(assert (= bs!25272 d!111875))

(declare-fun m!837511 () Bool)

(assert (=> bs!25272 m!837511))

(assert (=> bs!25272 m!837511))

(declare-fun m!837513 () Bool)

(assert (=> bs!25272 m!837513))

(assert (=> b!900496 d!111875))

(declare-fun d!111877 () Bool)

(assert (=> d!111877 (= (apply!409 lt!406709 lt!406695) (get!13359 (getValueByKey!457 (toList!5346 lt!406709) lt!406695)))))

(declare-fun bs!25273 () Bool)

(assert (= bs!25273 d!111877))

(declare-fun m!837515 () Bool)

(assert (=> bs!25273 m!837515))

(assert (=> bs!25273 m!837515))

(declare-fun m!837517 () Bool)

(assert (=> bs!25273 m!837517))

(assert (=> b!900496 d!111877))

(declare-fun d!111879 () Bool)

(declare-fun e!504080 () Bool)

(assert (=> d!111879 e!504080))

(declare-fun res!608096 () Bool)

(assert (=> d!111879 (=> res!608096 e!504080)))

(declare-fun lt!406794 () Bool)

(assert (=> d!111879 (= res!608096 (not lt!406794))))

(declare-fun lt!406795 () Bool)

(assert (=> d!111879 (= lt!406794 lt!406795)))

(declare-fun lt!406793 () Unit!30556)

(declare-fun e!504079 () Unit!30556)

(assert (=> d!111879 (= lt!406793 e!504079)))

(declare-fun c!95497 () Bool)

(assert (=> d!111879 (= c!95497 lt!406795)))

(assert (=> d!111879 (= lt!406795 (containsKey!430 (toList!5346 (+!2604 lt!406698 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))) lt!406689))))

(assert (=> d!111879 (= (contains!4391 (+!2604 lt!406698 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181))) lt!406689) lt!406794)))

(declare-fun b!900662 () Bool)

(declare-fun lt!406796 () Unit!30556)

(assert (=> b!900662 (= e!504079 lt!406796)))

(assert (=> b!900662 (= lt!406796 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5346 (+!2604 lt!406698 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))) lt!406689))))

(assert (=> b!900662 (isDefined!332 (getValueByKey!457 (toList!5346 (+!2604 lt!406698 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))) lt!406689))))

(declare-fun b!900663 () Bool)

(declare-fun Unit!30566 () Unit!30556)

(assert (=> b!900663 (= e!504079 Unit!30566)))

(declare-fun b!900664 () Bool)

(assert (=> b!900664 (= e!504080 (isDefined!332 (getValueByKey!457 (toList!5346 (+!2604 lt!406698 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))) lt!406689)))))

(assert (= (and d!111879 c!95497) b!900662))

(assert (= (and d!111879 (not c!95497)) b!900663))

(assert (= (and d!111879 (not res!608096)) b!900664))

(declare-fun m!837519 () Bool)

(assert (=> d!111879 m!837519))

(declare-fun m!837521 () Bool)

(assert (=> b!900662 m!837521))

(declare-fun m!837523 () Bool)

(assert (=> b!900662 m!837523))

(assert (=> b!900662 m!837523))

(declare-fun m!837525 () Bool)

(assert (=> b!900662 m!837525))

(assert (=> b!900664 m!837523))

(assert (=> b!900664 m!837523))

(assert (=> b!900664 m!837525))

(assert (=> b!900496 d!111879))

(declare-fun d!111881 () Bool)

(declare-fun e!504081 () Bool)

(assert (=> d!111881 e!504081))

(declare-fun res!608097 () Bool)

(assert (=> d!111881 (=> (not res!608097) (not e!504081))))

(declare-fun lt!406798 () ListLongMap!10661)

(assert (=> d!111881 (= res!608097 (contains!4391 lt!406798 (_1!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181)))))))

(declare-fun lt!406799 () List!17799)

(assert (=> d!111881 (= lt!406798 (ListLongMap!10662 lt!406799))))

(declare-fun lt!406797 () Unit!30556)

(declare-fun lt!406800 () Unit!30556)

(assert (=> d!111881 (= lt!406797 lt!406800)))

(assert (=> d!111881 (= (getValueByKey!457 lt!406799 (_1!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111881 (= lt!406800 (lemmaContainsTupThenGetReturnValue!251 lt!406799 (_1!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111881 (= lt!406799 (insertStrictlySorted!308 (toList!5346 lt!406699) (_1!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111881 (= (+!2604 lt!406699 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181))) lt!406798)))

(declare-fun b!900665 () Bool)

(declare-fun res!608098 () Bool)

(assert (=> b!900665 (=> (not res!608098) (not e!504081))))

(assert (=> b!900665 (= res!608098 (= (getValueByKey!457 (toList!5346 lt!406798) (_1!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181))))))))

(declare-fun b!900666 () Bool)

(assert (=> b!900666 (= e!504081 (contains!4394 (toList!5346 lt!406798) (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181))))))

(assert (= (and d!111881 res!608097) b!900665))

(assert (= (and b!900665 res!608098) b!900666))

(declare-fun m!837527 () Bool)

(assert (=> d!111881 m!837527))

(declare-fun m!837529 () Bool)

(assert (=> d!111881 m!837529))

(declare-fun m!837531 () Bool)

(assert (=> d!111881 m!837531))

(declare-fun m!837533 () Bool)

(assert (=> d!111881 m!837533))

(declare-fun m!837535 () Bool)

(assert (=> b!900665 m!837535))

(declare-fun m!837537 () Bool)

(assert (=> b!900666 m!837537))

(assert (=> b!900496 d!111881))

(declare-fun d!111883 () Bool)

(assert (=> d!111883 (contains!4391 (+!2604 lt!406698 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181))) lt!406689)))

(declare-fun lt!406803 () Unit!30556)

(declare-fun choose!1511 (ListLongMap!10661 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30556)

(assert (=> d!111883 (= lt!406803 (choose!1511 lt!406698 lt!406691 (zeroValue!5256 thiss!1181) lt!406689))))

(assert (=> d!111883 (contains!4391 lt!406698 lt!406689)))

(assert (=> d!111883 (= (addStillContains!335 lt!406698 lt!406691 (zeroValue!5256 thiss!1181) lt!406689) lt!406803)))

(declare-fun bs!25274 () Bool)

(assert (= bs!25274 d!111883))

(assert (=> bs!25274 m!837343))

(assert (=> bs!25274 m!837343))

(assert (=> bs!25274 m!837345))

(declare-fun m!837539 () Bool)

(assert (=> bs!25274 m!837539))

(declare-fun m!837541 () Bool)

(assert (=> bs!25274 m!837541))

(assert (=> b!900496 d!111883))

(declare-fun d!111885 () Bool)

(assert (=> d!111885 (= (apply!409 (+!2604 lt!406693 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181))) lt!406708) (get!13359 (getValueByKey!457 (toList!5346 (+!2604 lt!406693 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181)))) lt!406708)))))

(declare-fun bs!25275 () Bool)

(assert (= bs!25275 d!111885))

(declare-fun m!837543 () Bool)

(assert (=> bs!25275 m!837543))

(assert (=> bs!25275 m!837543))

(declare-fun m!837545 () Bool)

(assert (=> bs!25275 m!837545))

(assert (=> b!900496 d!111885))

(declare-fun d!111887 () Bool)

(declare-fun e!504082 () Bool)

(assert (=> d!111887 e!504082))

(declare-fun res!608099 () Bool)

(assert (=> d!111887 (=> (not res!608099) (not e!504082))))

(declare-fun lt!406805 () ListLongMap!10661)

(assert (=> d!111887 (= res!608099 (contains!4391 lt!406805 (_1!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))))))

(declare-fun lt!406806 () List!17799)

(assert (=> d!111887 (= lt!406805 (ListLongMap!10662 lt!406806))))

(declare-fun lt!406804 () Unit!30556)

(declare-fun lt!406807 () Unit!30556)

(assert (=> d!111887 (= lt!406804 lt!406807)))

(assert (=> d!111887 (= (getValueByKey!457 lt!406806 (_1!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111887 (= lt!406807 (lemmaContainsTupThenGetReturnValue!251 lt!406806 (_1!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111887 (= lt!406806 (insertStrictlySorted!308 (toList!5346 lt!406698) (_1!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))))))

(assert (=> d!111887 (= (+!2604 lt!406698 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181))) lt!406805)))

(declare-fun b!900668 () Bool)

(declare-fun res!608100 () Bool)

(assert (=> b!900668 (=> (not res!608100) (not e!504082))))

(assert (=> b!900668 (= res!608100 (= (getValueByKey!457 (toList!5346 lt!406805) (_1!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181))))))))

(declare-fun b!900669 () Bool)

(assert (=> b!900669 (= e!504082 (contains!4394 (toList!5346 lt!406805) (tuple2!11963 lt!406691 (zeroValue!5256 thiss!1181))))))

(assert (= (and d!111887 res!608099) b!900668))

(assert (= (and b!900668 res!608100) b!900669))

(declare-fun m!837547 () Bool)

(assert (=> d!111887 m!837547))

(declare-fun m!837549 () Bool)

(assert (=> d!111887 m!837549))

(declare-fun m!837551 () Bool)

(assert (=> d!111887 m!837551))

(declare-fun m!837553 () Bool)

(assert (=> d!111887 m!837553))

(declare-fun m!837555 () Bool)

(assert (=> b!900668 m!837555))

(declare-fun m!837557 () Bool)

(assert (=> b!900669 m!837557))

(assert (=> b!900496 d!111887))

(declare-fun d!111889 () Bool)

(assert (=> d!111889 (= (apply!409 (+!2604 lt!406693 (tuple2!11963 lt!406710 (minValue!5256 thiss!1181))) lt!406708) (apply!409 lt!406693 lt!406708))))

(declare-fun lt!406810 () Unit!30556)

(declare-fun choose!1512 (ListLongMap!10661 (_ BitVec 64) V!29447 (_ BitVec 64)) Unit!30556)

(assert (=> d!111889 (= lt!406810 (choose!1512 lt!406693 lt!406710 (minValue!5256 thiss!1181) lt!406708))))

(declare-fun e!504085 () Bool)

(assert (=> d!111889 e!504085))

(declare-fun res!608103 () Bool)

(assert (=> d!111889 (=> (not res!608103) (not e!504085))))

(assert (=> d!111889 (= res!608103 (contains!4391 lt!406693 lt!406708))))

(assert (=> d!111889 (= (addApplyDifferent!335 lt!406693 lt!406710 (minValue!5256 thiss!1181) lt!406708) lt!406810)))

(declare-fun b!900673 () Bool)

(assert (=> b!900673 (= e!504085 (not (= lt!406708 lt!406710)))))

(assert (= (and d!111889 res!608103) b!900673))

(declare-fun m!837559 () Bool)

(assert (=> d!111889 m!837559))

(assert (=> d!111889 m!837357))

(assert (=> d!111889 m!837349))

(declare-fun m!837561 () Bool)

(assert (=> d!111889 m!837561))

(assert (=> d!111889 m!837349))

(assert (=> d!111889 m!837351))

(assert (=> b!900496 d!111889))

(declare-fun d!111891 () Bool)

(assert (=> d!111891 (= (apply!409 (+!2604 lt!406699 (tuple2!11963 lt!406705 (zeroValue!5256 thiss!1181))) lt!406704) (apply!409 lt!406699 lt!406704))))

(declare-fun lt!406811 () Unit!30556)

(assert (=> d!111891 (= lt!406811 (choose!1512 lt!406699 lt!406705 (zeroValue!5256 thiss!1181) lt!406704))))

(declare-fun e!504086 () Bool)

(assert (=> d!111891 e!504086))

(declare-fun res!608104 () Bool)

(assert (=> d!111891 (=> (not res!608104) (not e!504086))))

(assert (=> d!111891 (= res!608104 (contains!4391 lt!406699 lt!406704))))

(assert (=> d!111891 (= (addApplyDifferent!335 lt!406699 lt!406705 (zeroValue!5256 thiss!1181) lt!406704) lt!406811)))

(declare-fun b!900674 () Bool)

(assert (=> b!900674 (= e!504086 (not (= lt!406704 lt!406705)))))

(assert (= (and d!111891 res!608104) b!900674))

(declare-fun m!837563 () Bool)

(assert (=> d!111891 m!837563))

(assert (=> d!111891 m!837367))

(assert (=> d!111891 m!837355))

(declare-fun m!837565 () Bool)

(assert (=> d!111891 m!837565))

(assert (=> d!111891 m!837355))

(assert (=> d!111891 m!837363))

(assert (=> b!900496 d!111891))

(declare-fun d!111893 () Bool)

(assert (=> d!111893 (= (apply!409 lt!406693 lt!406708) (get!13359 (getValueByKey!457 (toList!5346 lt!406693) lt!406708)))))

(declare-fun bs!25276 () Bool)

(assert (= bs!25276 d!111893))

(declare-fun m!837567 () Bool)

(assert (=> bs!25276 m!837567))

(assert (=> bs!25276 m!837567))

(declare-fun m!837569 () Bool)

(assert (=> bs!25276 m!837569))

(assert (=> b!900496 d!111893))

(assert (=> b!900496 d!111861))

(declare-fun d!111895 () Bool)

(assert (=> d!111895 (= (apply!409 (+!2604 lt!406709 (tuple2!11963 lt!406700 (minValue!5256 thiss!1181))) lt!406695) (apply!409 lt!406709 lt!406695))))

(declare-fun lt!406812 () Unit!30556)

(assert (=> d!111895 (= lt!406812 (choose!1512 lt!406709 lt!406700 (minValue!5256 thiss!1181) lt!406695))))

(declare-fun e!504087 () Bool)

(assert (=> d!111895 e!504087))

(declare-fun res!608105 () Bool)

(assert (=> d!111895 (=> (not res!608105) (not e!504087))))

(assert (=> d!111895 (= res!608105 (contains!4391 lt!406709 lt!406695))))

(assert (=> d!111895 (= (addApplyDifferent!335 lt!406709 lt!406700 (minValue!5256 thiss!1181) lt!406695) lt!406812)))

(declare-fun b!900675 () Bool)

(assert (=> b!900675 (= e!504087 (not (= lt!406695 lt!406700)))))

(assert (= (and d!111895 res!608105) b!900675))

(declare-fun m!837571 () Bool)

(assert (=> d!111895 m!837571))

(assert (=> d!111895 m!837353))

(assert (=> d!111895 m!837359))

(declare-fun m!837573 () Bool)

(assert (=> d!111895 m!837573))

(assert (=> d!111895 m!837359))

(assert (=> d!111895 m!837361))

(assert (=> b!900496 d!111895))

(declare-fun d!111897 () Bool)

(declare-fun e!504088 () Bool)

(assert (=> d!111897 e!504088))

(declare-fun res!608106 () Bool)

(assert (=> d!111897 (=> (not res!608106) (not e!504088))))

(declare-fun lt!406814 () ListLongMap!10661)

(assert (=> d!111897 (= res!608106 (contains!4391 lt!406814 (_1!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(declare-fun lt!406815 () List!17799)

(assert (=> d!111897 (= lt!406814 (ListLongMap!10662 lt!406815))))

(declare-fun lt!406813 () Unit!30556)

(declare-fun lt!406816 () Unit!30556)

(assert (=> d!111897 (= lt!406813 lt!406816)))

(assert (=> d!111897 (= (getValueByKey!457 lt!406815 (_1!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(assert (=> d!111897 (= lt!406816 (lemmaContainsTupThenGetReturnValue!251 lt!406815 (_1!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(assert (=> d!111897 (= lt!406815 (insertStrictlySorted!308 (toList!5346 call!40008) (_1!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))) (_2!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))))))

(assert (=> d!111897 (= (+!2604 call!40008 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))) lt!406814)))

(declare-fun b!900676 () Bool)

(declare-fun res!608107 () Bool)

(assert (=> b!900676 (=> (not res!608107) (not e!504088))))

(assert (=> b!900676 (= res!608107 (= (getValueByKey!457 (toList!5346 lt!406814) (_1!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181)))) (Some!462 (_2!5992 (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))))

(declare-fun b!900677 () Bool)

(assert (=> b!900677 (= e!504088 (contains!4394 (toList!5346 lt!406814) (tuple2!11963 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5256 thiss!1181))))))

(assert (= (and d!111897 res!608106) b!900676))

(assert (= (and b!900676 res!608107) b!900677))

(declare-fun m!837575 () Bool)

(assert (=> d!111897 m!837575))

(declare-fun m!837577 () Bool)

(assert (=> d!111897 m!837577))

(declare-fun m!837579 () Bool)

(assert (=> d!111897 m!837579))

(declare-fun m!837581 () Bool)

(assert (=> d!111897 m!837581))

(declare-fun m!837583 () Bool)

(assert (=> b!900676 m!837583))

(declare-fun m!837585 () Bool)

(assert (=> b!900677 m!837585))

(assert (=> b!900492 d!111897))

(assert (=> d!111807 d!111809))

(declare-fun d!111899 () Bool)

(declare-fun e!504091 () Bool)

(assert (=> d!111899 e!504091))

(declare-fun res!608110 () Bool)

(assert (=> d!111899 (=> res!608110 e!504091)))

(declare-fun lt!406819 () SeekEntryResult!8886)

(assert (=> d!111899 (= res!608110 (not ((_ is Found!8886) lt!406819)))))

(assert (=> d!111899 (= lt!406819 (seekEntry!0 key!785 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(assert (=> d!111899 true))

(declare-fun _$36!372 () Unit!30556)

(assert (=> d!111899 (= (choose!1508 (_keys!10248 thiss!1181) (_values!5443 thiss!1181) (mask!26232 thiss!1181) (extraKeys!5152 thiss!1181) (zeroValue!5256 thiss!1181) (minValue!5256 thiss!1181) key!785) _$36!372)))

(declare-fun b!900680 () Bool)

(assert (=> b!900680 (= e!504091 (inRange!0 (index!37916 lt!406819) (mask!26232 thiss!1181)))))

(assert (= (and d!111899 (not res!608110)) b!900680))

(assert (=> d!111899 m!837213))

(declare-fun m!837587 () Bool)

(assert (=> b!900680 m!837587))

(assert (=> d!111807 d!111899))

(assert (=> d!111807 d!111811))

(assert (=> d!111815 d!111813))

(declare-fun d!111901 () Bool)

(assert (=> d!111901 (arrayContainsKey!0 (_keys!10248 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111901 true))

(declare-fun _$60!424 () Unit!30556)

(assert (=> d!111901 (= (choose!13 (_keys!10248 thiss!1181) key!785 (index!37916 lt!406593)) _$60!424)))

(declare-fun bs!25277 () Bool)

(assert (= bs!25277 d!111901))

(assert (=> bs!25277 m!837227))

(assert (=> d!111815 d!111901))

(declare-fun b!900689 () Bool)

(declare-fun e!504100 () Bool)

(declare-fun e!504098 () Bool)

(assert (=> b!900689 (= e!504100 e!504098)))

(declare-fun lt!406828 () (_ BitVec 64))

(assert (=> b!900689 (= lt!406828 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406827 () Unit!30556)

(assert (=> b!900689 (= lt!406827 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10248 thiss!1181) lt!406828 #b00000000000000000000000000000000))))

(assert (=> b!900689 (arrayContainsKey!0 (_keys!10248 thiss!1181) lt!406828 #b00000000000000000000000000000000)))

(declare-fun lt!406826 () Unit!30556)

(assert (=> b!900689 (= lt!406826 lt!406827)))

(declare-fun res!608115 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52805 (_ BitVec 32)) SeekEntryResult!8886)

(assert (=> b!900689 (= res!608115 (= (seekEntryOrOpen!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000) (_keys!10248 thiss!1181) (mask!26232 thiss!1181)) (Found!8886 #b00000000000000000000000000000000)))))

(assert (=> b!900689 (=> (not res!608115) (not e!504098))))

(declare-fun bm!40015 () Bool)

(declare-fun call!40018 () Bool)

(assert (=> bm!40015 (= call!40018 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10248 thiss!1181) (mask!26232 thiss!1181)))))

(declare-fun b!900691 () Bool)

(declare-fun e!504099 () Bool)

(assert (=> b!900691 (= e!504099 e!504100)))

(declare-fun c!95500 () Bool)

(assert (=> b!900691 (= c!95500 (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900692 () Bool)

(assert (=> b!900692 (= e!504100 call!40018)))

(declare-fun b!900690 () Bool)

(assert (=> b!900690 (= e!504098 call!40018)))

(declare-fun d!111903 () Bool)

(declare-fun res!608116 () Bool)

(assert (=> d!111903 (=> res!608116 e!504099)))

(assert (=> d!111903 (= res!608116 (bvsge #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(assert (=> d!111903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10248 thiss!1181) (mask!26232 thiss!1181)) e!504099)))

(assert (= (and d!111903 (not res!608116)) b!900691))

(assert (= (and b!900691 c!95500) b!900689))

(assert (= (and b!900691 (not c!95500)) b!900692))

(assert (= (and b!900689 res!608115) b!900690))

(assert (= (or b!900690 b!900692) bm!40015))

(assert (=> b!900689 m!837309))

(declare-fun m!837589 () Bool)

(assert (=> b!900689 m!837589))

(declare-fun m!837591 () Bool)

(assert (=> b!900689 m!837591))

(assert (=> b!900689 m!837309))

(declare-fun m!837593 () Bool)

(assert (=> b!900689 m!837593))

(declare-fun m!837595 () Bool)

(assert (=> bm!40015 m!837595))

(assert (=> b!900691 m!837309))

(assert (=> b!900691 m!837309))

(assert (=> b!900691 m!837333))

(assert (=> b!900517 d!111903))

(declare-fun d!111905 () Bool)

(assert (=> d!111905 (= (apply!409 lt!406697 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)) (get!13359 (getValueByKey!457 (toList!5346 lt!406697) (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25278 () Bool)

(assert (= bs!25278 d!111905))

(assert (=> bs!25278 m!837309))

(assert (=> bs!25278 m!837449))

(assert (=> bs!25278 m!837449))

(declare-fun m!837597 () Bool)

(assert (=> bs!25278 m!837597))

(assert (=> b!900478 d!111905))

(declare-fun d!111907 () Bool)

(declare-fun c!95503 () Bool)

(assert (=> d!111907 (= c!95503 ((_ is ValueCellFull!8699) (select (arr!25373 (_values!5443 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!504103 () V!29447)

(assert (=> d!111907 (= (get!13358 (select (arr!25373 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1324 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!504103)))

(declare-fun b!900697 () Bool)

(declare-fun get!13360 (ValueCell!8699 V!29447) V!29447)

(assert (=> b!900697 (= e!504103 (get!13360 (select (arr!25373 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1324 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!900698 () Bool)

(declare-fun get!13361 (ValueCell!8699 V!29447) V!29447)

(assert (=> b!900698 (= e!504103 (get!13361 (select (arr!25373 (_values!5443 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1324 (defaultEntry!5431 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111907 c!95503) b!900697))

(assert (= (and d!111907 (not c!95503)) b!900698))

(assert (=> b!900697 m!837327))

(assert (=> b!900697 m!837325))

(declare-fun m!837599 () Bool)

(assert (=> b!900697 m!837599))

(assert (=> b!900698 m!837327))

(assert (=> b!900698 m!837325))

(declare-fun m!837601 () Bool)

(assert (=> b!900698 m!837601))

(assert (=> b!900478 d!111907))

(declare-fun d!111909 () Bool)

(declare-fun e!504105 () Bool)

(assert (=> d!111909 e!504105))

(declare-fun res!608117 () Bool)

(assert (=> d!111909 (=> res!608117 e!504105)))

(declare-fun lt!406830 () Bool)

(assert (=> d!111909 (= res!608117 (not lt!406830))))

(declare-fun lt!406831 () Bool)

(assert (=> d!111909 (= lt!406830 lt!406831)))

(declare-fun lt!406829 () Unit!30556)

(declare-fun e!504104 () Unit!30556)

(assert (=> d!111909 (= lt!406829 e!504104)))

(declare-fun c!95504 () Bool)

(assert (=> d!111909 (= c!95504 lt!406831)))

(assert (=> d!111909 (= lt!406831 (containsKey!430 (toList!5346 lt!406697) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111909 (= (contains!4391 lt!406697 #b1000000000000000000000000000000000000000000000000000000000000000) lt!406830)))

(declare-fun b!900699 () Bool)

(declare-fun lt!406832 () Unit!30556)

(assert (=> b!900699 (= e!504104 lt!406832)))

(assert (=> b!900699 (= lt!406832 (lemmaContainsKeyImpliesGetValueByKeyDefined!324 (toList!5346 lt!406697) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900699 (isDefined!332 (getValueByKey!457 (toList!5346 lt!406697) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900700 () Bool)

(declare-fun Unit!30567 () Unit!30556)

(assert (=> b!900700 (= e!504104 Unit!30567)))

(declare-fun b!900701 () Bool)

(assert (=> b!900701 (= e!504105 (isDefined!332 (getValueByKey!457 (toList!5346 lt!406697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111909 c!95504) b!900699))

(assert (= (and d!111909 (not c!95504)) b!900700))

(assert (= (and d!111909 (not res!608117)) b!900701))

(declare-fun m!837603 () Bool)

(assert (=> d!111909 m!837603))

(declare-fun m!837605 () Bool)

(assert (=> b!900699 m!837605))

(assert (=> b!900699 m!837403))

(assert (=> b!900699 m!837403))

(declare-fun m!837607 () Bool)

(assert (=> b!900699 m!837607))

(assert (=> b!900701 m!837403))

(assert (=> b!900701 m!837403))

(assert (=> b!900701 m!837607))

(assert (=> bm!40005 d!111909))

(declare-fun b!900710 () Bool)

(declare-fun e!504110 () (_ BitVec 32))

(declare-fun call!40021 () (_ BitVec 32))

(assert (=> b!900710 (= e!504110 (bvadd #b00000000000000000000000000000001 call!40021))))

(declare-fun b!900711 () Bool)

(declare-fun e!504111 () (_ BitVec 32))

(assert (=> b!900711 (= e!504111 #b00000000000000000000000000000000)))

(declare-fun d!111911 () Bool)

(declare-fun lt!406835 () (_ BitVec 32))

(assert (=> d!111911 (and (bvsge lt!406835 #b00000000000000000000000000000000) (bvsle lt!406835 (bvsub (size!25830 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111911 (= lt!406835 e!504111)))

(declare-fun c!95509 () Bool)

(assert (=> d!111911 (= c!95509 (bvsge #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))))))

(assert (=> d!111911 (and (bvsle #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25830 (_keys!10248 thiss!1181)) (size!25830 (_keys!10248 thiss!1181))))))

(assert (=> d!111911 (= (arrayCountValidKeys!0 (_keys!10248 thiss!1181) #b00000000000000000000000000000000 (size!25830 (_keys!10248 thiss!1181))) lt!406835)))

(declare-fun b!900712 () Bool)

(assert (=> b!900712 (= e!504110 call!40021)))

(declare-fun bm!40018 () Bool)

(assert (=> bm!40018 (= call!40021 (arrayCountValidKeys!0 (_keys!10248 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25830 (_keys!10248 thiss!1181))))))

(declare-fun b!900713 () Bool)

(assert (=> b!900713 (= e!504111 e!504110)))

(declare-fun c!95510 () Bool)

(assert (=> b!900713 (= c!95510 (validKeyInArray!0 (select (arr!25372 (_keys!10248 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111911 c!95509) b!900711))

(assert (= (and d!111911 (not c!95509)) b!900713))

(assert (= (and b!900713 c!95510) b!900710))

(assert (= (and b!900713 (not c!95510)) b!900712))

(assert (= (or b!900710 b!900712) bm!40018))

(declare-fun m!837609 () Bool)

(assert (=> bm!40018 m!837609))

(assert (=> b!900713 m!837309))

(assert (=> b!900713 m!837309))

(assert (=> b!900713 m!837333))

(assert (=> b!900516 d!111911))

(assert (=> d!111819 d!111811))

(declare-fun b!900725 () Bool)

(declare-fun e!504114 () Bool)

(assert (=> b!900725 (= e!504114 (and (bvsge (extraKeys!5152 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5152 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2262 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!111913 () Bool)

(declare-fun res!608128 () Bool)

(assert (=> d!111913 (=> (not res!608128) (not e!504114))))

(assert (=> d!111913 (= res!608128 (validMask!0 (mask!26232 thiss!1181)))))

(assert (=> d!111913 (= (simpleValid!327 thiss!1181) e!504114)))

(declare-fun b!900723 () Bool)

(declare-fun res!608129 () Bool)

(assert (=> b!900723 (=> (not res!608129) (not e!504114))))

(declare-fun size!25836 (LongMapFixedSize!4414) (_ BitVec 32))

(assert (=> b!900723 (= res!608129 (bvsge (size!25836 thiss!1181) (_size!2262 thiss!1181)))))

(declare-fun b!900722 () Bool)

(declare-fun res!608127 () Bool)

(assert (=> b!900722 (=> (not res!608127) (not e!504114))))

(assert (=> b!900722 (= res!608127 (and (= (size!25831 (_values!5443 thiss!1181)) (bvadd (mask!26232 thiss!1181) #b00000000000000000000000000000001)) (= (size!25830 (_keys!10248 thiss!1181)) (size!25831 (_values!5443 thiss!1181))) (bvsge (_size!2262 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2262 thiss!1181) (bvadd (mask!26232 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!900724 () Bool)

(declare-fun res!608126 () Bool)

(assert (=> b!900724 (=> (not res!608126) (not e!504114))))

(assert (=> b!900724 (= res!608126 (= (size!25836 thiss!1181) (bvadd (_size!2262 thiss!1181) (bvsdiv (bvadd (extraKeys!5152 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!111913 res!608128) b!900722))

(assert (= (and b!900722 res!608127) b!900723))

(assert (= (and b!900723 res!608129) b!900724))

(assert (= (and b!900724 res!608126) b!900725))

(assert (=> d!111913 m!837237))

(declare-fun m!837611 () Bool)

(assert (=> b!900723 m!837611))

(assert (=> b!900724 m!837611))

(assert (=> d!111823 d!111913))

(declare-fun mapIsEmpty!29217 () Bool)

(declare-fun mapRes!29217 () Bool)

(assert (=> mapIsEmpty!29217 mapRes!29217))

(declare-fun mapNonEmpty!29217 () Bool)

(declare-fun tp!56196 () Bool)

(declare-fun e!504115 () Bool)

(assert (=> mapNonEmpty!29217 (= mapRes!29217 (and tp!56196 e!504115))))

(declare-fun mapKey!29217 () (_ BitVec 32))

(declare-fun mapRest!29217 () (Array (_ BitVec 32) ValueCell!8699))

(declare-fun mapValue!29217 () ValueCell!8699)

(assert (=> mapNonEmpty!29217 (= mapRest!29216 (store mapRest!29217 mapKey!29217 mapValue!29217))))

(declare-fun condMapEmpty!29217 () Bool)

(declare-fun mapDefault!29217 () ValueCell!8699)

(assert (=> mapNonEmpty!29216 (= condMapEmpty!29217 (= mapRest!29216 ((as const (Array (_ BitVec 32) ValueCell!8699)) mapDefault!29217)))))

(declare-fun e!504116 () Bool)

(assert (=> mapNonEmpty!29216 (= tp!56195 (and e!504116 mapRes!29217))))

(declare-fun b!900726 () Bool)

(assert (=> b!900726 (= e!504115 tp_is_empty!18361)))

(declare-fun b!900727 () Bool)

(assert (=> b!900727 (= e!504116 tp_is_empty!18361)))

(assert (= (and mapNonEmpty!29216 condMapEmpty!29217) mapIsEmpty!29217))

(assert (= (and mapNonEmpty!29216 (not condMapEmpty!29217)) mapNonEmpty!29217))

(assert (= (and mapNonEmpty!29217 ((_ is ValueCellFull!8699) mapValue!29217)) b!900726))

(assert (= (and mapNonEmpty!29216 ((_ is ValueCellFull!8699) mapDefault!29217)) b!900727))

(declare-fun m!837613 () Bool)

(assert (=> mapNonEmpty!29217 m!837613))

(declare-fun b_lambda!13013 () Bool)

(assert (= b_lambda!13009 (or (and b!900346 b_free!16033) b_lambda!13013)))

(declare-fun b_lambda!13015 () Bool)

(assert (= b_lambda!13011 (or (and b!900346 b_free!16033) b_lambda!13015)))

(check-sat (not mapNonEmpty!29217) (not b!900553) (not d!111847) (not d!111865) (not d!111871) (not d!111875) (not b!900546) (not b!900552) (not d!111899) (not b!900650) (not b!900662) (not d!111893) (not b!900652) (not d!111881) (not b!900658) (not d!111869) (not d!111891) (not b!900654) (not b!900697) (not b!900651) (not d!111879) (not d!111845) (not b_lambda!13015) (not d!111897) (not bm!40015) (not b!900660) (not b!900668) (not bm!40018) (not b!900617) (not b!900723) (not b_next!16033) (not b!900576) (not bm!40012) (not b!900598) (not b!900656) (not bm!40009) (not d!111889) (not b!900620) (not d!111895) (not b!900544) (not b!900713) (not d!111901) (not b_lambda!13007) (not b_lambda!13013) (not d!111831) (not b!900701) (not b!900724) (not d!111841) (not b!900648) (not d!111851) (not b!900606) (not d!111885) (not b!900575) (not d!111905) b_and!26361 (not d!111843) (not b!900665) (not d!111883) (not b!900621) (not d!111861) (not d!111853) (not b!900669) (not b!900677) tp_is_empty!18361 (not b!900604) (not b!900664) (not d!111867) (not b!900691) (not b!900649) (not b!900661) (not b!900680) (not d!111873) (not d!111877) (not d!111887) (not d!111837) (not d!111909) (not d!111913) (not b!900676) (not b!900659) (not b!900569) (not b!900558) (not b!900555) (not b!900653) (not b!900689) (not b!900699) (not b!900666) (not d!111857) (not b!900698))
(check-sat b_and!26361 (not b_next!16033))
