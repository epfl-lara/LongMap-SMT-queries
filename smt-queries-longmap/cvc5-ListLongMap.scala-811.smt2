; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19726 () Bool)

(assert start!19726)

(declare-fun b!193304 () Bool)

(declare-fun b_free!4705 () Bool)

(declare-fun b_next!4705 () Bool)

(assert (=> b!193304 (= b_free!4705 (not b_next!4705))))

(declare-fun tp!16979 () Bool)

(declare-fun b_and!11411 () Bool)

(assert (=> b!193304 (= tp!16979 b_and!11411)))

(declare-fun b!193297 () Bool)

(declare-fun res!91340 () Bool)

(declare-fun e!127185 () Bool)

(assert (=> b!193297 (=> res!91340 e!127185)))

(declare-datatypes ((V!5617 0))(
  ( (V!5618 (val!2283 Int)) )
))
(declare-datatypes ((ValueCell!1895 0))(
  ( (ValueCellFull!1895 (v!4239 V!5617)) (EmptyCell!1895) )
))
(declare-datatypes ((array!8201 0))(
  ( (array!8202 (arr!3861 (Array (_ BitVec 32) (_ BitVec 64))) (size!4185 (_ BitVec 32))) )
))
(declare-datatypes ((array!8203 0))(
  ( (array!8204 (arr!3862 (Array (_ BitVec 32) ValueCell!1895)) (size!4186 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2698 0))(
  ( (LongMapFixedSize!2699 (defaultEntry!3945 Int) (mask!9196 (_ BitVec 32)) (extraKeys!3682 (_ BitVec 32)) (zeroValue!3786 V!5617) (minValue!3786 V!5617) (_size!1398 (_ BitVec 32)) (_keys!5935 array!8201) (_values!3928 array!8203) (_vacant!1398 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2698)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8201 (_ BitVec 32)) Bool)

(assert (=> b!193297 (= res!91340 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5935 thiss!1248) (mask!9196 thiss!1248))))))

(declare-fun b!193298 () Bool)

(declare-fun e!127189 () Bool)

(declare-fun tp_is_empty!4477 () Bool)

(assert (=> b!193298 (= e!127189 tp_is_empty!4477)))

(declare-fun b!193299 () Bool)

(declare-fun res!91338 () Bool)

(declare-fun e!127182 () Bool)

(assert (=> b!193299 (=> (not res!91338) (not e!127182))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!193299 (= res!91338 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193300 () Bool)

(declare-fun res!91337 () Bool)

(assert (=> b!193300 (=> res!91337 e!127185)))

(assert (=> b!193300 (= res!91337 (or (not (= (size!4186 (_values!3928 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9196 thiss!1248)))) (not (= (size!4185 (_keys!5935 thiss!1248)) (size!4186 (_values!3928 thiss!1248)))) (bvslt (mask!9196 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3682 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3682 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!193301 () Bool)

(declare-datatypes ((Unit!5853 0))(
  ( (Unit!5854) )
))
(declare-fun e!127190 () Unit!5853)

(declare-fun lt!96222 () Unit!5853)

(assert (=> b!193301 (= e!127190 lt!96222)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!181 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5853)

(assert (=> b!193301 (= lt!96222 (lemmaInListMapThenSeekEntryOrOpenFindsIt!181 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(declare-fun res!91335 () Bool)

(declare-datatypes ((SeekEntryResult!687 0))(
  ( (MissingZero!687 (index!4918 (_ BitVec 32))) (Found!687 (index!4919 (_ BitVec 32))) (Intermediate!687 (undefined!1499 Bool) (index!4920 (_ BitVec 32)) (x!20647 (_ BitVec 32))) (Undefined!687) (MissingVacant!687 (index!4921 (_ BitVec 32))) )
))
(declare-fun lt!96218 () SeekEntryResult!687)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193301 (= res!91335 (inRange!0 (index!4919 lt!96218) (mask!9196 thiss!1248)))))

(declare-fun e!127181 () Bool)

(assert (=> b!193301 (=> (not res!91335) (not e!127181))))

(assert (=> b!193301 e!127181))

(declare-fun b!193302 () Bool)

(declare-fun e!127188 () Bool)

(assert (=> b!193302 (= e!127182 e!127188)))

(declare-fun res!91341 () Bool)

(assert (=> b!193302 (=> (not res!91341) (not e!127188))))

(assert (=> b!193302 (= res!91341 (and (not (is-Undefined!687 lt!96218)) (not (is-MissingVacant!687 lt!96218)) (not (is-MissingZero!687 lt!96218)) (is-Found!687 lt!96218)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8201 (_ BitVec 32)) SeekEntryResult!687)

(assert (=> b!193302 (= lt!96218 (seekEntryOrOpen!0 key!828 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)))))

(declare-fun b!193303 () Bool)

(declare-fun e!127186 () Bool)

(assert (=> b!193303 (= e!127186 tp_is_empty!4477)))

(declare-fun e!127183 () Bool)

(declare-fun e!127187 () Bool)

(declare-fun array_inv!2505 (array!8201) Bool)

(declare-fun array_inv!2506 (array!8203) Bool)

(assert (=> b!193304 (= e!127183 (and tp!16979 tp_is_empty!4477 (array_inv!2505 (_keys!5935 thiss!1248)) (array_inv!2506 (_values!3928 thiss!1248)) e!127187))))

(declare-fun mapIsEmpty!7742 () Bool)

(declare-fun mapRes!7742 () Bool)

(assert (=> mapIsEmpty!7742 mapRes!7742))

(declare-fun b!193305 () Bool)

(declare-fun Unit!5855 () Unit!5853)

(assert (=> b!193305 (= e!127190 Unit!5855)))

(declare-fun lt!96219 () Unit!5853)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!191 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5853)

(assert (=> b!193305 (= lt!96219 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!191 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(assert (=> b!193305 false))

(declare-fun res!91342 () Bool)

(assert (=> start!19726 (=> (not res!91342) (not e!127182))))

(declare-fun valid!1107 (LongMapFixedSize!2698) Bool)

(assert (=> start!19726 (= res!91342 (valid!1107 thiss!1248))))

(assert (=> start!19726 e!127182))

(assert (=> start!19726 e!127183))

(assert (=> start!19726 true))

(assert (=> start!19726 tp_is_empty!4477))

(declare-fun mapNonEmpty!7742 () Bool)

(declare-fun tp!16978 () Bool)

(assert (=> mapNonEmpty!7742 (= mapRes!7742 (and tp!16978 e!127189))))

(declare-fun mapRest!7742 () (Array (_ BitVec 32) ValueCell!1895))

(declare-fun mapValue!7742 () ValueCell!1895)

(declare-fun mapKey!7742 () (_ BitVec 32))

(assert (=> mapNonEmpty!7742 (= (arr!3862 (_values!3928 thiss!1248)) (store mapRest!7742 mapKey!7742 mapValue!7742))))

(declare-fun b!193306 () Bool)

(declare-fun res!91339 () Bool)

(assert (=> b!193306 (=> res!91339 e!127185)))

(declare-datatypes ((List!2437 0))(
  ( (Nil!2434) (Cons!2433 (h!3074 (_ BitVec 64)) (t!7359 List!2437)) )
))
(declare-fun arrayNoDuplicates!0 (array!8201 (_ BitVec 32) List!2437) Bool)

(assert (=> b!193306 (= res!91339 (not (arrayNoDuplicates!0 (_keys!5935 thiss!1248) #b00000000000000000000000000000000 Nil!2434)))))

(declare-fun b!193307 () Bool)

(assert (=> b!193307 (= e!127185 (and (bvsge (index!4919 lt!96218) #b00000000000000000000000000000000) (bvslt (index!4919 lt!96218) (size!4185 (_keys!5935 thiss!1248)))))))

(declare-fun b!193308 () Bool)

(assert (=> b!193308 (= e!127188 (not e!127185))))

(declare-fun res!91336 () Bool)

(assert (=> b!193308 (=> res!91336 e!127185)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193308 (= res!91336 (not (validMask!0 (mask!9196 thiss!1248))))))

(declare-fun v!309 () V!5617)

(declare-datatypes ((tuple2!3546 0))(
  ( (tuple2!3547 (_1!1784 (_ BitVec 64)) (_2!1784 V!5617)) )
))
(declare-datatypes ((List!2438 0))(
  ( (Nil!2435) (Cons!2434 (h!3075 tuple2!3546) (t!7360 List!2438)) )
))
(declare-datatypes ((ListLongMap!2463 0))(
  ( (ListLongMap!2464 (toList!1247 List!2438)) )
))
(declare-fun lt!96220 () ListLongMap!2463)

(declare-fun +!315 (ListLongMap!2463 tuple2!3546) ListLongMap!2463)

(declare-fun getCurrentListMap!895 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) Int) ListLongMap!2463)

(assert (=> b!193308 (= (+!315 lt!96220 (tuple2!3547 key!828 v!309)) (getCurrentListMap!895 (_keys!5935 thiss!1248) (array!8204 (store (arr!3862 (_values!3928 thiss!1248)) (index!4919 lt!96218) (ValueCellFull!1895 v!309)) (size!4186 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96223 () Unit!5853)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!116 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) (_ BitVec 64) V!5617 Int) Unit!5853)

(assert (=> b!193308 (= lt!96223 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!116 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) (index!4919 lt!96218) key!828 v!309 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96221 () Unit!5853)

(assert (=> b!193308 (= lt!96221 e!127190)))

(declare-fun c!34865 () Bool)

(declare-fun contains!1368 (ListLongMap!2463 (_ BitVec 64)) Bool)

(assert (=> b!193308 (= c!34865 (contains!1368 lt!96220 key!828))))

(assert (=> b!193308 (= lt!96220 (getCurrentListMap!895 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun b!193309 () Bool)

(assert (=> b!193309 (= e!127181 (= (select (arr!3861 (_keys!5935 thiss!1248)) (index!4919 lt!96218)) key!828))))

(declare-fun b!193310 () Bool)

(assert (=> b!193310 (= e!127187 (and e!127186 mapRes!7742))))

(declare-fun condMapEmpty!7742 () Bool)

(declare-fun mapDefault!7742 () ValueCell!1895)

