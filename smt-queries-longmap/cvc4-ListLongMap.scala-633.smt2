; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16150 () Bool)

(assert start!16150)

(declare-fun b!160887 () Bool)

(declare-fun b_free!3611 () Bool)

(declare-fun b_next!3611 () Bool)

(assert (=> b!160887 (= b_free!3611 (not b_next!3611))))

(declare-fun tp!13402 () Bool)

(declare-fun b_and!10025 () Bool)

(assert (=> b!160887 (= tp!13402 b_and!10025)))

(declare-fun mapNonEmpty!5807 () Bool)

(declare-fun mapRes!5807 () Bool)

(declare-fun tp!13403 () Bool)

(declare-fun e!105147 () Bool)

(assert (=> mapNonEmpty!5807 (= mapRes!5807 (and tp!13403 e!105147))))

(declare-datatypes ((V!4197 0))(
  ( (V!4198 (val!1751 Int)) )
))
(declare-datatypes ((ValueCell!1363 0))(
  ( (ValueCellFull!1363 (v!3616 V!4197)) (EmptyCell!1363) )
))
(declare-fun mapValue!5807 () ValueCell!1363)

(declare-datatypes ((array!5905 0))(
  ( (array!5906 (arr!2797 (Array (_ BitVec 32) (_ BitVec 64))) (size!3081 (_ BitVec 32))) )
))
(declare-datatypes ((array!5907 0))(
  ( (array!5908 (arr!2798 (Array (_ BitVec 32) ValueCell!1363)) (size!3082 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1634 0))(
  ( (LongMapFixedSize!1635 (defaultEntry!3259 Int) (mask!7837 (_ BitVec 32)) (extraKeys!3000 (_ BitVec 32)) (zeroValue!3102 V!4197) (minValue!3102 V!4197) (_size!866 (_ BitVec 32)) (_keys!5060 array!5905) (_values!3242 array!5907) (_vacant!866 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1634)

(declare-fun mapKey!5807 () (_ BitVec 32))

(declare-fun mapRest!5807 () (Array (_ BitVec 32) ValueCell!1363))

(assert (=> mapNonEmpty!5807 (= (arr!2798 (_values!3242 thiss!1248)) (store mapRest!5807 mapKey!5807 mapValue!5807))))

(declare-fun mapIsEmpty!5807 () Bool)

(assert (=> mapIsEmpty!5807 mapRes!5807))

(declare-fun b!160881 () Bool)

(declare-fun res!76252 () Bool)

(declare-fun e!105148 () Bool)

(assert (=> b!160881 (=> (not res!76252) (not e!105148))))

(assert (=> b!160881 (= res!76252 (and (= (size!3082 (_values!3242 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7837 thiss!1248))) (= (size!3081 (_keys!5060 thiss!1248)) (size!3082 (_values!3242 thiss!1248))) (bvsge (mask!7837 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3000 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3000 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160882 () Bool)

(declare-fun res!76247 () Bool)

(assert (=> b!160882 (=> (not res!76247) (not e!105148))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2940 0))(
  ( (tuple2!2941 (_1!1481 (_ BitVec 64)) (_2!1481 V!4197)) )
))
(declare-datatypes ((List!1961 0))(
  ( (Nil!1958) (Cons!1957 (h!2570 tuple2!2940) (t!6763 List!1961)) )
))
(declare-datatypes ((ListLongMap!1927 0))(
  ( (ListLongMap!1928 (toList!979 List!1961)) )
))
(declare-fun contains!1015 (ListLongMap!1927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!643 (array!5905 array!5907 (_ BitVec 32) (_ BitVec 32) V!4197 V!4197 (_ BitVec 32) Int) ListLongMap!1927)

(assert (=> b!160882 (= res!76247 (not (contains!1015 (getCurrentListMap!643 (_keys!5060 thiss!1248) (_values!3242 thiss!1248) (mask!7837 thiss!1248) (extraKeys!3000 thiss!1248) (zeroValue!3102 thiss!1248) (minValue!3102 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3259 thiss!1248)) key!828)))))

(declare-fun res!76248 () Bool)

(assert (=> start!16150 (=> (not res!76248) (not e!105148))))

(declare-fun valid!754 (LongMapFixedSize!1634) Bool)

(assert (=> start!16150 (= res!76248 (valid!754 thiss!1248))))

(assert (=> start!16150 e!105148))

(declare-fun e!105149 () Bool)

(assert (=> start!16150 e!105149))

(assert (=> start!16150 true))

(declare-fun b!160883 () Bool)

(assert (=> b!160883 (= e!105148 false)))

(declare-fun lt!82129 () Bool)

(declare-datatypes ((List!1962 0))(
  ( (Nil!1959) (Cons!1958 (h!2571 (_ BitVec 64)) (t!6764 List!1962)) )
))
(declare-fun arrayNoDuplicates!0 (array!5905 (_ BitVec 32) List!1962) Bool)

(assert (=> b!160883 (= lt!82129 (arrayNoDuplicates!0 (_keys!5060 thiss!1248) #b00000000000000000000000000000000 Nil!1959))))

(declare-fun b!160884 () Bool)

(declare-fun res!76251 () Bool)

(assert (=> b!160884 (=> (not res!76251) (not e!105148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5905 (_ BitVec 32)) Bool)

(assert (=> b!160884 (= res!76251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5060 thiss!1248) (mask!7837 thiss!1248)))))

(declare-fun b!160885 () Bool)

(declare-fun e!105145 () Bool)

(declare-fun tp_is_empty!3413 () Bool)

(assert (=> b!160885 (= e!105145 tp_is_empty!3413)))

(declare-fun b!160886 () Bool)

(declare-fun e!105150 () Bool)

(assert (=> b!160886 (= e!105150 (and e!105145 mapRes!5807))))

(declare-fun condMapEmpty!5807 () Bool)

(declare-fun mapDefault!5807 () ValueCell!1363)

