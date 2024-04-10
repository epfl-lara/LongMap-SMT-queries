; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75942 () Bool)

(assert start!75942)

(declare-fun b!893386 () Bool)

(declare-fun b_free!15857 () Bool)

(declare-fun b_next!15857 () Bool)

(assert (=> b!893386 (= b_free!15857 (not b_next!15857))))

(declare-fun tp!55546 () Bool)

(declare-fun b_and!26123 () Bool)

(assert (=> b!893386 (= tp!55546 b_and!26123)))

(declare-fun b!893380 () Bool)

(declare-fun e!498924 () Bool)

(declare-datatypes ((array!52354 0))(
  ( (array!52355 (arr!25181 (Array (_ BitVec 32) (_ BitVec 64))) (size!25625 (_ BitVec 32))) )
))
(declare-datatypes ((V!29211 0))(
  ( (V!29212 (val!9143 Int)) )
))
(declare-datatypes ((ValueCell!8611 0))(
  ( (ValueCellFull!8611 (v!11625 V!29211)) (EmptyCell!8611) )
))
(declare-datatypes ((array!52356 0))(
  ( (array!52357 (arr!25182 (Array (_ BitVec 32) ValueCell!8611)) (size!25626 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4238 0))(
  ( (LongMapFixedSize!4239 (defaultEntry!5319 Int) (mask!25850 (_ BitVec 32)) (extraKeys!5015 (_ BitVec 32)) (zeroValue!5119 V!29211) (minValue!5119 V!29211) (_size!2174 (_ BitVec 32)) (_keys!10006 array!52354) (_values!5306 array!52356) (_vacant!2174 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4238)

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((Option!455 0))(
  ( (Some!454 (v!11626 V!29211)) (None!453) )
))
(declare-fun get!13255 (Option!455) V!29211)

(declare-datatypes ((tuple2!12018 0))(
  ( (tuple2!12019 (_1!6020 (_ BitVec 64)) (_2!6020 V!29211)) )
))
(declare-datatypes ((List!17798 0))(
  ( (Nil!17795) (Cons!17794 (h!18925 tuple2!12018) (t!25121 List!17798)) )
))
(declare-fun getValueByKey!449 (List!17798 (_ BitVec 64)) Option!455)

(declare-datatypes ((ListLongMap!10715 0))(
  ( (ListLongMap!10716 (toList!5373 List!17798)) )
))
(declare-fun map!12216 (LongMapFixedSize!4238) ListLongMap!10715)

(assert (=> b!893380 (= e!498924 (not (= (zeroValue!5119 thiss!1181) (get!13255 (getValueByKey!449 (toList!5373 (map!12216 thiss!1181)) key!785)))))))

(declare-fun b!893381 () Bool)

(declare-fun e!498925 () Bool)

(assert (=> b!893381 (= e!498925 e!498924)))

(declare-fun c!94098 () Bool)

(declare-fun contains!4382 (LongMapFixedSize!4238 (_ BitVec 64)) Bool)

(assert (=> b!893381 (= c!94098 (contains!4382 thiss!1181 key!785))))

(declare-fun mapNonEmpty!28838 () Bool)

(declare-fun mapRes!28838 () Bool)

(declare-fun tp!55545 () Bool)

(declare-fun e!498921 () Bool)

(assert (=> mapNonEmpty!28838 (= mapRes!28838 (and tp!55545 e!498921))))

(declare-fun mapRest!28838 () (Array (_ BitVec 32) ValueCell!8611))

(declare-fun mapValue!28838 () ValueCell!8611)

(declare-fun mapKey!28838 () (_ BitVec 32))

(assert (=> mapNonEmpty!28838 (= (arr!25182 (_values!5306 thiss!1181)) (store mapRest!28838 mapKey!28838 mapValue!28838))))

(declare-fun b!893382 () Bool)

(declare-fun tp_is_empty!18185 () Bool)

(assert (=> b!893382 (= e!498921 tp_is_empty!18185)))

(declare-fun b!893383 () Bool)

(declare-fun res!604987 () Bool)

(assert (=> b!893383 (=> (not res!604987) (not e!498925))))

(assert (=> b!893383 (= res!604987 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5015 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!893384 () Bool)

(declare-fun e!498923 () Bool)

(declare-fun e!498927 () Bool)

(assert (=> b!893384 (= e!498923 (and e!498927 mapRes!28838))))

(declare-fun condMapEmpty!28838 () Bool)

(declare-fun mapDefault!28838 () ValueCell!8611)

