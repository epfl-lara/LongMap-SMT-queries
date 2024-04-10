; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15754 () Bool)

(assert start!15754)

(declare-fun b!157225 () Bool)

(declare-fun b_free!3421 () Bool)

(declare-fun b_next!3421 () Bool)

(assert (=> b!157225 (= b_free!3421 (not b_next!3421))))

(declare-fun tp!12787 () Bool)

(declare-fun b_and!9835 () Bool)

(assert (=> b!157225 (= tp!12787 b_and!9835)))

(declare-fun b!157221 () Bool)

(declare-fun e!102899 () Bool)

(assert (=> b!157221 (= e!102899 (not true))))

(declare-fun lt!81693 () Bool)

(declare-datatypes ((V!3945 0))(
  ( (V!3946 (val!1656 Int)) )
))
(declare-datatypes ((ValueCell!1268 0))(
  ( (ValueCellFull!1268 (v!3521 V!3945)) (EmptyCell!1268) )
))
(declare-datatypes ((array!5499 0))(
  ( (array!5500 (arr!2607 (Array (_ BitVec 32) (_ BitVec 64))) (size!2885 (_ BitVec 32))) )
))
(declare-datatypes ((array!5501 0))(
  ( (array!5502 (arr!2608 (Array (_ BitVec 32) ValueCell!1268)) (size!2886 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1444 0))(
  ( (LongMapFixedSize!1445 (defaultEntry!3164 Int) (mask!7637 (_ BitVec 32)) (extraKeys!2905 (_ BitVec 32)) (zeroValue!3007 V!3945) (minValue!3007 V!3945) (_size!771 (_ BitVec 32)) (_keys!4939 array!5499) (_values!3147 array!5501) (_vacant!771 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1444)

(declare-fun v!309 () V!3945)

(declare-fun valid!688 (LongMapFixedSize!1444) Bool)

(assert (=> b!157221 (= lt!81693 (valid!688 (LongMapFixedSize!1445 (defaultEntry!3164 thiss!1248) (mask!7637 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) v!309 (_size!771 thiss!1248) (_keys!4939 thiss!1248) (_values!3147 thiss!1248) (_vacant!771 thiss!1248))))))

(declare-datatypes ((tuple2!2872 0))(
  ( (tuple2!2873 (_1!1447 (_ BitVec 64)) (_2!1447 V!3945)) )
))
(declare-datatypes ((List!1878 0))(
  ( (Nil!1875) (Cons!1874 (h!2483 tuple2!2872) (t!6680 List!1878)) )
))
(declare-datatypes ((ListLongMap!1859 0))(
  ( (ListLongMap!1860 (toList!945 List!1878)) )
))
(declare-fun +!213 (ListLongMap!1859 tuple2!2872) ListLongMap!1859)

(declare-fun getCurrentListMap!609 (array!5499 array!5501 (_ BitVec 32) (_ BitVec 32) V!3945 V!3945 (_ BitVec 32) Int) ListLongMap!1859)

(assert (=> b!157221 (= (+!213 (getCurrentListMap!609 (_keys!4939 thiss!1248) (_values!3147 thiss!1248) (mask!7637 thiss!1248) (extraKeys!2905 thiss!1248) (zeroValue!3007 thiss!1248) (minValue!3007 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3164 thiss!1248)) (tuple2!2873 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!609 (_keys!4939 thiss!1248) (_values!3147 thiss!1248) (mask!7637 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3164 thiss!1248)))))

(declare-datatypes ((Unit!4970 0))(
  ( (Unit!4971) )
))
(declare-fun lt!81694 () Unit!4970)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!81 (array!5499 array!5501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3945 V!3945 V!3945 Int) Unit!4970)

(assert (=> b!157221 (= lt!81694 (lemmaChangeLongMinValueKeyThenAddPairToListMap!81 (_keys!4939 thiss!1248) (_values!3147 thiss!1248) (mask!7637 thiss!1248) (extraKeys!2905 thiss!1248) (bvor (extraKeys!2905 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3007 thiss!1248) (minValue!3007 thiss!1248) v!309 (defaultEntry!3164 thiss!1248)))))

(declare-fun mapNonEmpty!5477 () Bool)

(declare-fun mapRes!5477 () Bool)

(declare-fun tp!12788 () Bool)

(declare-fun e!102903 () Bool)

(assert (=> mapNonEmpty!5477 (= mapRes!5477 (and tp!12788 e!102903))))

(declare-fun mapRest!5477 () (Array (_ BitVec 32) ValueCell!1268))

(declare-fun mapKey!5477 () (_ BitVec 32))

(declare-fun mapValue!5477 () ValueCell!1268)

(assert (=> mapNonEmpty!5477 (= (arr!2608 (_values!3147 thiss!1248)) (store mapRest!5477 mapKey!5477 mapValue!5477))))

(declare-fun b!157222 () Bool)

(declare-fun tp_is_empty!3223 () Bool)

(assert (=> b!157222 (= e!102903 tp_is_empty!3223)))

(declare-fun res!74319 () Bool)

(assert (=> start!15754 (=> (not res!74319) (not e!102899))))

(assert (=> start!15754 (= res!74319 (valid!688 thiss!1248))))

(assert (=> start!15754 e!102899))

(declare-fun e!102902 () Bool)

(assert (=> start!15754 e!102902))

(assert (=> start!15754 true))

(assert (=> start!15754 tp_is_empty!3223))

(declare-fun mapIsEmpty!5477 () Bool)

(assert (=> mapIsEmpty!5477 mapRes!5477))

(declare-fun b!157223 () Bool)

(declare-fun e!102898 () Bool)

(declare-fun e!102901 () Bool)

(assert (=> b!157223 (= e!102898 (and e!102901 mapRes!5477))))

(declare-fun condMapEmpty!5477 () Bool)

(declare-fun mapDefault!5477 () ValueCell!1268)

