; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16358 () Bool)

(assert start!16358)

(declare-fun b!163097 () Bool)

(declare-fun b_free!3785 () Bool)

(declare-fun b_next!3785 () Bool)

(assert (=> b!163097 (= b_free!3785 (not b_next!3785))))

(declare-fun tp!13932 () Bool)

(declare-fun b_and!10199 () Bool)

(assert (=> b!163097 (= tp!13932 b_and!10199)))

(declare-fun b!163095 () Bool)

(declare-fun e!107000 () Bool)

(declare-fun tp_is_empty!3587 () Bool)

(assert (=> b!163095 (= e!107000 tp_is_empty!3587)))

(declare-fun b!163096 () Bool)

(declare-fun res!77215 () Bool)

(declare-fun e!107004 () Bool)

(assert (=> b!163096 (=> (not res!77215) (not e!107004))))

(declare-datatypes ((V!4429 0))(
  ( (V!4430 (val!1838 Int)) )
))
(declare-datatypes ((ValueCell!1450 0))(
  ( (ValueCellFull!1450 (v!3703 V!4429)) (EmptyCell!1450) )
))
(declare-datatypes ((array!6257 0))(
  ( (array!6258 (arr!2971 (Array (_ BitVec 32) (_ BitVec 64))) (size!3256 (_ BitVec 32))) )
))
(declare-datatypes ((array!6259 0))(
  ( (array!6260 (arr!2972 (Array (_ BitVec 32) ValueCell!1450)) (size!3257 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1808 0))(
  ( (LongMapFixedSize!1809 (defaultEntry!3346 Int) (mask!7990 (_ BitVec 32)) (extraKeys!3087 (_ BitVec 32)) (zeroValue!3189 V!4429) (minValue!3189 V!4429) (_size!953 (_ BitVec 32)) (_keys!5152 array!6257) (_values!3329 array!6259) (_vacant!953 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1808)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163096 (= res!77215 (validMask!0 (mask!7990 thiss!1248)))))

(declare-fun e!107006 () Bool)

(declare-fun e!107005 () Bool)

(declare-fun array_inv!1899 (array!6257) Bool)

(declare-fun array_inv!1900 (array!6259) Bool)

(assert (=> b!163097 (= e!107006 (and tp!13932 tp_is_empty!3587 (array_inv!1899 (_keys!5152 thiss!1248)) (array_inv!1900 (_values!3329 thiss!1248)) e!107005))))

(declare-fun mapIsEmpty!6075 () Bool)

(declare-fun mapRes!6075 () Bool)

(assert (=> mapIsEmpty!6075 mapRes!6075))

(declare-fun mapNonEmpty!6075 () Bool)

(declare-fun tp!13931 () Bool)

(assert (=> mapNonEmpty!6075 (= mapRes!6075 (and tp!13931 e!107000))))

(declare-fun mapRest!6075 () (Array (_ BitVec 32) ValueCell!1450))

(declare-fun mapValue!6075 () ValueCell!1450)

(declare-fun mapKey!6075 () (_ BitVec 32))

(assert (=> mapNonEmpty!6075 (= (arr!2972 (_values!3329 thiss!1248)) (store mapRest!6075 mapKey!6075 mapValue!6075))))

(declare-fun b!163098 () Bool)

(declare-fun e!107002 () Bool)

(assert (=> b!163098 (= e!107005 (and e!107002 mapRes!6075))))

(declare-fun condMapEmpty!6075 () Bool)

(declare-fun mapDefault!6075 () ValueCell!1450)

