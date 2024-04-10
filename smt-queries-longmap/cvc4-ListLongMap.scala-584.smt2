; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15650 () Bool)

(assert start!15650)

(declare-fun b!155948 () Bool)

(declare-fun b_free!3317 () Bool)

(declare-fun b_next!3317 () Bool)

(assert (=> b!155948 (= b_free!3317 (not b_next!3317))))

(declare-fun tp!12476 () Bool)

(declare-fun b_and!9731 () Bool)

(assert (=> b!155948 (= tp!12476 b_and!9731)))

(declare-fun b!155942 () Bool)

(declare-fun e!101948 () Bool)

(declare-fun tp_is_empty!3119 () Bool)

(assert (=> b!155942 (= e!101948 tp_is_empty!3119)))

(declare-fun b!155943 () Bool)

(declare-fun e!101949 () Bool)

(declare-fun e!101944 () Bool)

(assert (=> b!155943 (= e!101949 (not e!101944))))

(declare-fun res!73666 () Bool)

(assert (=> b!155943 (=> res!73666 e!101944)))

(declare-datatypes ((V!3805 0))(
  ( (V!3806 (val!1604 Int)) )
))
(declare-datatypes ((ValueCell!1216 0))(
  ( (ValueCellFull!1216 (v!3469 V!3805)) (EmptyCell!1216) )
))
(declare-datatypes ((array!5291 0))(
  ( (array!5292 (arr!2503 (Array (_ BitVec 32) (_ BitVec 64))) (size!2781 (_ BitVec 32))) )
))
(declare-datatypes ((array!5293 0))(
  ( (array!5294 (arr!2504 (Array (_ BitVec 32) ValueCell!1216)) (size!2782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1340 0))(
  ( (LongMapFixedSize!1341 (defaultEntry!3112 Int) (mask!7549 (_ BitVec 32)) (extraKeys!2853 (_ BitVec 32)) (zeroValue!2955 V!3805) (minValue!2955 V!3805) (_size!719 (_ BitVec 32)) (_keys!4887 array!5291) (_values!3095 array!5293) (_vacant!719 (_ BitVec 32))) )
))
(declare-fun lt!81470 () LongMapFixedSize!1340)

(declare-fun valid!652 (LongMapFixedSize!1340) Bool)

(assert (=> b!155943 (= res!73666 (not (valid!652 lt!81470)))))

(declare-fun thiss!1248 () LongMapFixedSize!1340)

(declare-fun v!309 () V!3805)

(assert (=> b!155943 (= lt!81470 (LongMapFixedSize!1341 (defaultEntry!3112 thiss!1248) (mask!7549 thiss!1248) (bvor (extraKeys!2853 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2955 thiss!1248) (_size!719 thiss!1248) (_keys!4887 thiss!1248) (_values!3095 thiss!1248) (_vacant!719 thiss!1248)))))

(declare-datatypes ((tuple2!2842 0))(
  ( (tuple2!2843 (_1!1432 (_ BitVec 64)) (_2!1432 V!3805)) )
))
(declare-datatypes ((List!1839 0))(
  ( (Nil!1836) (Cons!1835 (h!2444 tuple2!2842) (t!6641 List!1839)) )
))
(declare-datatypes ((ListLongMap!1829 0))(
  ( (ListLongMap!1830 (toList!930 List!1839)) )
))
(declare-fun +!198 (ListLongMap!1829 tuple2!2842) ListLongMap!1829)

(declare-fun getCurrentListMap!594 (array!5291 array!5293 (_ BitVec 32) (_ BitVec 32) V!3805 V!3805 (_ BitVec 32) Int) ListLongMap!1829)

(assert (=> b!155943 (= (+!198 (getCurrentListMap!594 (_keys!4887 thiss!1248) (_values!3095 thiss!1248) (mask!7549 thiss!1248) (extraKeys!2853 thiss!1248) (zeroValue!2955 thiss!1248) (minValue!2955 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3112 thiss!1248)) (tuple2!2843 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!594 (_keys!4887 thiss!1248) (_values!3095 thiss!1248) (mask!7549 thiss!1248) (bvor (extraKeys!2853 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2955 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3112 thiss!1248)))))

(declare-datatypes ((Unit!4940 0))(
  ( (Unit!4941) )
))
(declare-fun lt!81471 () Unit!4940)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!77 (array!5291 array!5293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3805 V!3805 V!3805 Int) Unit!4940)

(assert (=> b!155943 (= lt!81471 (lemmaChangeZeroKeyThenAddPairToListMap!77 (_keys!4887 thiss!1248) (_values!3095 thiss!1248) (mask!7549 thiss!1248) (extraKeys!2853 thiss!1248) (bvor (extraKeys!2853 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2955 thiss!1248) v!309 (minValue!2955 thiss!1248) (defaultEntry!3112 thiss!1248)))))

(declare-fun mapIsEmpty!5321 () Bool)

(declare-fun mapRes!5321 () Bool)

(assert (=> mapIsEmpty!5321 mapRes!5321))

(declare-fun b!155944 () Bool)

(assert (=> b!155944 (= e!101944 true)))

(declare-fun lt!81472 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!974 (ListLongMap!1829 (_ BitVec 64)) Bool)

(declare-fun map!1537 (LongMapFixedSize!1340) ListLongMap!1829)

(assert (=> b!155944 (= lt!81472 (contains!974 (map!1537 lt!81470) key!828))))

(declare-fun b!155945 () Bool)

(declare-fun e!101945 () Bool)

(assert (=> b!155945 (= e!101945 (and e!101948 mapRes!5321))))

(declare-fun condMapEmpty!5321 () Bool)

(declare-fun mapDefault!5321 () ValueCell!1216)

