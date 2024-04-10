; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15658 () Bool)

(assert start!15658)

(declare-fun b!156017 () Bool)

(declare-fun b_free!3325 () Bool)

(declare-fun b_next!3325 () Bool)

(assert (=> b!156017 (= b_free!3325 (not b_next!3325))))

(declare-fun tp!12499 () Bool)

(declare-fun b_and!9739 () Bool)

(assert (=> b!156017 (= tp!12499 b_and!9739)))

(declare-fun mapNonEmpty!5333 () Bool)

(declare-fun mapRes!5333 () Bool)

(declare-fun tp!12500 () Bool)

(declare-fun e!102018 () Bool)

(assert (=> mapNonEmpty!5333 (= mapRes!5333 (and tp!12500 e!102018))))

(declare-datatypes ((V!3817 0))(
  ( (V!3818 (val!1608 Int)) )
))
(declare-datatypes ((ValueCell!1220 0))(
  ( (ValueCellFull!1220 (v!3473 V!3817)) (EmptyCell!1220) )
))
(declare-fun mapRest!5333 () (Array (_ BitVec 32) ValueCell!1220))

(declare-fun mapKey!5333 () (_ BitVec 32))

(declare-datatypes ((array!5307 0))(
  ( (array!5308 (arr!2511 (Array (_ BitVec 32) (_ BitVec 64))) (size!2789 (_ BitVec 32))) )
))
(declare-datatypes ((array!5309 0))(
  ( (array!5310 (arr!2512 (Array (_ BitVec 32) ValueCell!1220)) (size!2790 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1348 0))(
  ( (LongMapFixedSize!1349 (defaultEntry!3116 Int) (mask!7557 (_ BitVec 32)) (extraKeys!2857 (_ BitVec 32)) (zeroValue!2959 V!3817) (minValue!2959 V!3817) (_size!723 (_ BitVec 32)) (_keys!4891 array!5307) (_values!3099 array!5309) (_vacant!723 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1348)

(declare-fun mapValue!5333 () ValueCell!1220)

(assert (=> mapNonEmpty!5333 (= (arr!2512 (_values!3099 thiss!1248)) (store mapRest!5333 mapKey!5333 mapValue!5333))))

(declare-fun b!156015 () Bool)

(declare-fun e!102020 () Bool)

(assert (=> b!156015 (= e!102020 (not true))))

(declare-fun lt!81495 () Bool)

(declare-fun v!309 () V!3817)

(declare-fun valid!656 (LongMapFixedSize!1348) Bool)

(assert (=> b!156015 (= lt!81495 (valid!656 (LongMapFixedSize!1349 (defaultEntry!3116 thiss!1248) (mask!7557 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2959 thiss!1248) (_size!723 thiss!1248) (_keys!4891 thiss!1248) (_values!3099 thiss!1248) (_vacant!723 thiss!1248))))))

(declare-datatypes ((tuple2!2850 0))(
  ( (tuple2!2851 (_1!1436 (_ BitVec 64)) (_2!1436 V!3817)) )
))
(declare-datatypes ((List!1843 0))(
  ( (Nil!1840) (Cons!1839 (h!2448 tuple2!2850) (t!6645 List!1843)) )
))
(declare-datatypes ((ListLongMap!1837 0))(
  ( (ListLongMap!1838 (toList!934 List!1843)) )
))
(declare-fun +!202 (ListLongMap!1837 tuple2!2850) ListLongMap!1837)

(declare-fun getCurrentListMap!598 (array!5307 array!5309 (_ BitVec 32) (_ BitVec 32) V!3817 V!3817 (_ BitVec 32) Int) ListLongMap!1837)

(assert (=> b!156015 (= (+!202 (getCurrentListMap!598 (_keys!4891 thiss!1248) (_values!3099 thiss!1248) (mask!7557 thiss!1248) (extraKeys!2857 thiss!1248) (zeroValue!2959 thiss!1248) (minValue!2959 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3116 thiss!1248)) (tuple2!2851 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!598 (_keys!4891 thiss!1248) (_values!3099 thiss!1248) (mask!7557 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2959 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3116 thiss!1248)))))

(declare-datatypes ((Unit!4948 0))(
  ( (Unit!4949) )
))
(declare-fun lt!81496 () Unit!4948)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!81 (array!5307 array!5309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3817 V!3817 V!3817 Int) Unit!4948)

(assert (=> b!156015 (= lt!81496 (lemmaChangeZeroKeyThenAddPairToListMap!81 (_keys!4891 thiss!1248) (_values!3099 thiss!1248) (mask!7557 thiss!1248) (extraKeys!2857 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2959 thiss!1248) v!309 (minValue!2959 thiss!1248) (defaultEntry!3116 thiss!1248)))))

(declare-fun res!73689 () Bool)

(assert (=> start!15658 (=> (not res!73689) (not e!102020))))

(assert (=> start!15658 (= res!73689 (valid!656 thiss!1248))))

(assert (=> start!15658 e!102020))

(declare-fun e!102019 () Bool)

(assert (=> start!15658 e!102019))

(assert (=> start!15658 true))

(declare-fun tp_is_empty!3127 () Bool)

(assert (=> start!15658 tp_is_empty!3127))

(declare-fun b!156016 () Bool)

(declare-fun e!102021 () Bool)

(assert (=> b!156016 (= e!102021 tp_is_empty!3127)))

(declare-fun e!102016 () Bool)

(declare-fun array_inv!1585 (array!5307) Bool)

(declare-fun array_inv!1586 (array!5309) Bool)

(assert (=> b!156017 (= e!102019 (and tp!12499 tp_is_empty!3127 (array_inv!1585 (_keys!4891 thiss!1248)) (array_inv!1586 (_values!3099 thiss!1248)) e!102016))))

(declare-fun b!156018 () Bool)

(declare-fun res!73690 () Bool)

(assert (=> b!156018 (=> (not res!73690) (not e!102020))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156018 (= res!73690 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!156019 () Bool)

(assert (=> b!156019 (= e!102018 tp_is_empty!3127)))

(declare-fun b!156020 () Bool)

(assert (=> b!156020 (= e!102016 (and e!102021 mapRes!5333))))

(declare-fun condMapEmpty!5333 () Bool)

(declare-fun mapDefault!5333 () ValueCell!1220)

