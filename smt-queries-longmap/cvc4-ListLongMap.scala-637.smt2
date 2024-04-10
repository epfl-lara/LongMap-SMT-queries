; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16174 () Bool)

(assert start!16174)

(declare-fun b!161267 () Bool)

(declare-fun b_free!3635 () Bool)

(declare-fun b_next!3635 () Bool)

(assert (=> b!161267 (= b_free!3635 (not b_next!3635))))

(declare-fun tp!13474 () Bool)

(declare-fun b_and!10049 () Bool)

(assert (=> b!161267 (= tp!13474 b_and!10049)))

(declare-fun res!76468 () Bool)

(declare-fun e!105373 () Bool)

(assert (=> start!16174 (=> (not res!76468) (not e!105373))))

(declare-datatypes ((V!4229 0))(
  ( (V!4230 (val!1763 Int)) )
))
(declare-datatypes ((ValueCell!1375 0))(
  ( (ValueCellFull!1375 (v!3628 V!4229)) (EmptyCell!1375) )
))
(declare-datatypes ((array!5953 0))(
  ( (array!5954 (arr!2821 (Array (_ BitVec 32) (_ BitVec 64))) (size!3105 (_ BitVec 32))) )
))
(declare-datatypes ((array!5955 0))(
  ( (array!5956 (arr!2822 (Array (_ BitVec 32) ValueCell!1375)) (size!3106 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1658 0))(
  ( (LongMapFixedSize!1659 (defaultEntry!3271 Int) (mask!7857 (_ BitVec 32)) (extraKeys!3012 (_ BitVec 32)) (zeroValue!3114 V!4229) (minValue!3114 V!4229) (_size!878 (_ BitVec 32)) (_keys!5072 array!5953) (_values!3254 array!5955) (_vacant!878 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1658)

(declare-fun valid!761 (LongMapFixedSize!1658) Bool)

(assert (=> start!16174 (= res!76468 (valid!761 thiss!1248))))

(assert (=> start!16174 e!105373))

(declare-fun e!105374 () Bool)

(assert (=> start!16174 e!105374))

(assert (=> start!16174 true))

(declare-fun mapIsEmpty!5843 () Bool)

(declare-fun mapRes!5843 () Bool)

(assert (=> mapIsEmpty!5843 mapRes!5843))

(declare-fun b!161261 () Bool)

(declare-fun e!105369 () Bool)

(declare-fun tp_is_empty!3437 () Bool)

(assert (=> b!161261 (= e!105369 tp_is_empty!3437)))

(declare-fun b!161262 () Bool)

(declare-datatypes ((Unit!5001 0))(
  ( (Unit!5002) )
))
(declare-fun e!105375 () Unit!5001)

(declare-fun Unit!5003 () Unit!5001)

(assert (=> b!161262 (= e!105375 Unit!5003)))

(declare-fun lt!82174 () Unit!5001)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!73 (array!5953 array!5955 (_ BitVec 32) (_ BitVec 32) V!4229 V!4229 (_ BitVec 64) Int) Unit!5001)

(assert (=> b!161262 (= lt!82174 (lemmaInListMapThenSeekEntryOrOpenFindsIt!73 (_keys!5072 thiss!1248) (_values!3254 thiss!1248) (mask!7857 thiss!1248) (extraKeys!3012 thiss!1248) (zeroValue!3114 thiss!1248) (minValue!3114 thiss!1248) key!828 (defaultEntry!3271 thiss!1248)))))

(assert (=> b!161262 false))

(declare-fun mapNonEmpty!5843 () Bool)

(declare-fun tp!13475 () Bool)

(assert (=> mapNonEmpty!5843 (= mapRes!5843 (and tp!13475 e!105369))))

(declare-fun mapValue!5843 () ValueCell!1375)

(declare-fun mapKey!5843 () (_ BitVec 32))

(declare-fun mapRest!5843 () (Array (_ BitVec 32) ValueCell!1375))

(assert (=> mapNonEmpty!5843 (= (arr!2822 (_values!3254 thiss!1248)) (store mapRest!5843 mapKey!5843 mapValue!5843))))

(declare-fun b!161263 () Bool)

(declare-fun e!105370 () Bool)

(assert (=> b!161263 (= e!105370 tp_is_empty!3437)))

(declare-fun b!161264 () Bool)

(assert (=> b!161264 (= e!105373 false)))

(declare-fun lt!82173 () Unit!5001)

(assert (=> b!161264 (= lt!82173 e!105375)))

(declare-fun c!29941 () Bool)

(declare-datatypes ((tuple2!2954 0))(
  ( (tuple2!2955 (_1!1488 (_ BitVec 64)) (_2!1488 V!4229)) )
))
(declare-datatypes ((List!1973 0))(
  ( (Nil!1970) (Cons!1969 (h!2582 tuple2!2954) (t!6775 List!1973)) )
))
(declare-datatypes ((ListLongMap!1941 0))(
  ( (ListLongMap!1942 (toList!986 List!1973)) )
))
(declare-fun contains!1022 (ListLongMap!1941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!650 (array!5953 array!5955 (_ BitVec 32) (_ BitVec 32) V!4229 V!4229 (_ BitVec 32) Int) ListLongMap!1941)

(assert (=> b!161264 (= c!29941 (contains!1022 (getCurrentListMap!650 (_keys!5072 thiss!1248) (_values!3254 thiss!1248) (mask!7857 thiss!1248) (extraKeys!3012 thiss!1248) (zeroValue!3114 thiss!1248) (minValue!3114 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3271 thiss!1248)) key!828))))

(declare-fun b!161265 () Bool)

(declare-fun res!76469 () Bool)

(assert (=> b!161265 (=> (not res!76469) (not e!105373))))

(assert (=> b!161265 (= res!76469 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161266 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!74 (array!5953 array!5955 (_ BitVec 32) (_ BitVec 32) V!4229 V!4229 (_ BitVec 64) Int) Unit!5001)

(assert (=> b!161266 (= e!105375 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!74 (_keys!5072 thiss!1248) (_values!3254 thiss!1248) (mask!7857 thiss!1248) (extraKeys!3012 thiss!1248) (zeroValue!3114 thiss!1248) (minValue!3114 thiss!1248) key!828 (defaultEntry!3271 thiss!1248)))))

(declare-fun e!105371 () Bool)

(declare-fun array_inv!1803 (array!5953) Bool)

(declare-fun array_inv!1804 (array!5955) Bool)

(assert (=> b!161267 (= e!105374 (and tp!13474 tp_is_empty!3437 (array_inv!1803 (_keys!5072 thiss!1248)) (array_inv!1804 (_values!3254 thiss!1248)) e!105371))))

(declare-fun b!161268 () Bool)

(declare-fun res!76467 () Bool)

(assert (=> b!161268 (=> (not res!76467) (not e!105373))))

(declare-datatypes ((SeekEntryResult!350 0))(
  ( (MissingZero!350 (index!3568 (_ BitVec 32))) (Found!350 (index!3569 (_ BitVec 32))) (Intermediate!350 (undefined!1162 Bool) (index!3570 (_ BitVec 32)) (x!17790 (_ BitVec 32))) (Undefined!350) (MissingVacant!350 (index!3571 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5953 (_ BitVec 32)) SeekEntryResult!350)

(assert (=> b!161268 (= res!76467 (is-Undefined!350 (seekEntryOrOpen!0 key!828 (_keys!5072 thiss!1248) (mask!7857 thiss!1248))))))

(declare-fun b!161269 () Bool)

(assert (=> b!161269 (= e!105371 (and e!105370 mapRes!5843))))

(declare-fun condMapEmpty!5843 () Bool)

(declare-fun mapDefault!5843 () ValueCell!1375)

