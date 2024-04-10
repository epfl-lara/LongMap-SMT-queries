; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15758 () Bool)

(assert start!15758)

(declare-fun b!157261 () Bool)

(declare-fun b_free!3425 () Bool)

(declare-fun b_next!3425 () Bool)

(assert (=> b!157261 (= b_free!3425 (not b_next!3425))))

(declare-fun tp!12799 () Bool)

(declare-fun b_and!9839 () Bool)

(assert (=> b!157261 (= tp!12799 b_and!9839)))

(declare-fun mapNonEmpty!5483 () Bool)

(declare-fun mapRes!5483 () Bool)

(declare-fun tp!12800 () Bool)

(declare-fun e!102936 () Bool)

(assert (=> mapNonEmpty!5483 (= mapRes!5483 (and tp!12800 e!102936))))

(declare-fun mapKey!5483 () (_ BitVec 32))

(declare-datatypes ((V!3949 0))(
  ( (V!3950 (val!1658 Int)) )
))
(declare-datatypes ((ValueCell!1270 0))(
  ( (ValueCellFull!1270 (v!3523 V!3949)) (EmptyCell!1270) )
))
(declare-datatypes ((array!5507 0))(
  ( (array!5508 (arr!2611 (Array (_ BitVec 32) (_ BitVec 64))) (size!2889 (_ BitVec 32))) )
))
(declare-datatypes ((array!5509 0))(
  ( (array!5510 (arr!2612 (Array (_ BitVec 32) ValueCell!1270)) (size!2890 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1448 0))(
  ( (LongMapFixedSize!1449 (defaultEntry!3166 Int) (mask!7639 (_ BitVec 32)) (extraKeys!2907 (_ BitVec 32)) (zeroValue!3009 V!3949) (minValue!3009 V!3949) (_size!773 (_ BitVec 32)) (_keys!4941 array!5507) (_values!3149 array!5509) (_vacant!773 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1448)

(declare-fun mapValue!5483 () ValueCell!1270)

(declare-fun mapRest!5483 () (Array (_ BitVec 32) ValueCell!1270))

(assert (=> mapNonEmpty!5483 (= (arr!2612 (_values!3149 thiss!1248)) (store mapRest!5483 mapKey!5483 mapValue!5483))))

(declare-fun b!157257 () Bool)

(declare-fun e!102939 () Bool)

(assert (=> b!157257 (= e!102939 (not true))))

(declare-fun lt!81705 () Bool)

(declare-fun v!309 () V!3949)

(declare-fun valid!690 (LongMapFixedSize!1448) Bool)

(assert (=> b!157257 (= lt!81705 (valid!690 (LongMapFixedSize!1449 (defaultEntry!3166 thiss!1248) (mask!7639 thiss!1248) (bvor (extraKeys!2907 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3009 thiss!1248) v!309 (_size!773 thiss!1248) (_keys!4941 thiss!1248) (_values!3149 thiss!1248) (_vacant!773 thiss!1248))))))

(declare-datatypes ((tuple2!2876 0))(
  ( (tuple2!2877 (_1!1449 (_ BitVec 64)) (_2!1449 V!3949)) )
))
(declare-datatypes ((List!1880 0))(
  ( (Nil!1877) (Cons!1876 (h!2485 tuple2!2876) (t!6682 List!1880)) )
))
(declare-datatypes ((ListLongMap!1863 0))(
  ( (ListLongMap!1864 (toList!947 List!1880)) )
))
(declare-fun +!215 (ListLongMap!1863 tuple2!2876) ListLongMap!1863)

(declare-fun getCurrentListMap!611 (array!5507 array!5509 (_ BitVec 32) (_ BitVec 32) V!3949 V!3949 (_ BitVec 32) Int) ListLongMap!1863)

(assert (=> b!157257 (= (+!215 (getCurrentListMap!611 (_keys!4941 thiss!1248) (_values!3149 thiss!1248) (mask!7639 thiss!1248) (extraKeys!2907 thiss!1248) (zeroValue!3009 thiss!1248) (minValue!3009 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3166 thiss!1248)) (tuple2!2877 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!611 (_keys!4941 thiss!1248) (_values!3149 thiss!1248) (mask!7639 thiss!1248) (bvor (extraKeys!2907 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3009 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3166 thiss!1248)))))

(declare-datatypes ((Unit!4974 0))(
  ( (Unit!4975) )
))
(declare-fun lt!81706 () Unit!4974)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!83 (array!5507 array!5509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3949 V!3949 V!3949 Int) Unit!4974)

(assert (=> b!157257 (= lt!81706 (lemmaChangeLongMinValueKeyThenAddPairToListMap!83 (_keys!4941 thiss!1248) (_values!3149 thiss!1248) (mask!7639 thiss!1248) (extraKeys!2907 thiss!1248) (bvor (extraKeys!2907 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3009 thiss!1248) (minValue!3009 thiss!1248) v!309 (defaultEntry!3166 thiss!1248)))))

(declare-fun b!157258 () Bool)

(declare-fun tp_is_empty!3227 () Bool)

(assert (=> b!157258 (= e!102936 tp_is_empty!3227)))

(declare-fun b!157259 () Bool)

(declare-fun e!102938 () Bool)

(assert (=> b!157259 (= e!102938 tp_is_empty!3227)))

(declare-fun mapIsEmpty!5483 () Bool)

(assert (=> mapIsEmpty!5483 mapRes!5483))

(declare-fun b!157260 () Bool)

(declare-fun res!74332 () Bool)

(assert (=> b!157260 (=> (not res!74332) (not e!102939))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157260 (= res!74332 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!74331 () Bool)

(assert (=> start!15758 (=> (not res!74331) (not e!102939))))

(assert (=> start!15758 (= res!74331 (valid!690 thiss!1248))))

(assert (=> start!15758 e!102939))

(declare-fun e!102935 () Bool)

(assert (=> start!15758 e!102935))

(assert (=> start!15758 true))

(assert (=> start!15758 tp_is_empty!3227))

(declare-fun e!102934 () Bool)

(declare-fun array_inv!1655 (array!5507) Bool)

(declare-fun array_inv!1656 (array!5509) Bool)

(assert (=> b!157261 (= e!102935 (and tp!12799 tp_is_empty!3227 (array_inv!1655 (_keys!4941 thiss!1248)) (array_inv!1656 (_values!3149 thiss!1248)) e!102934))))

(declare-fun b!157262 () Bool)

(assert (=> b!157262 (= e!102934 (and e!102938 mapRes!5483))))

(declare-fun condMapEmpty!5483 () Bool)

(declare-fun mapDefault!5483 () ValueCell!1270)

