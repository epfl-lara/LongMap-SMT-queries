; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15662 () Bool)

(assert start!15662)

(declare-fun b!155873 () Bool)

(declare-fun b_free!3325 () Bool)

(declare-fun b_next!3325 () Bool)

(assert (=> b!155873 (= b_free!3325 (not b_next!3325))))

(declare-fun tp!12499 () Bool)

(declare-fun b_and!9713 () Bool)

(assert (=> b!155873 (= tp!12499 b_and!9713)))

(declare-fun b!155868 () Bool)

(declare-fun e!101920 () Bool)

(declare-fun tp_is_empty!3127 () Bool)

(assert (=> b!155868 (= e!101920 tp_is_empty!3127)))

(declare-fun res!73595 () Bool)

(declare-fun e!101918 () Bool)

(assert (=> start!15662 (=> (not res!73595) (not e!101918))))

(declare-datatypes ((V!3817 0))(
  ( (V!3818 (val!1608 Int)) )
))
(declare-datatypes ((ValueCell!1220 0))(
  ( (ValueCellFull!1220 (v!3467 V!3817)) (EmptyCell!1220) )
))
(declare-datatypes ((array!5287 0))(
  ( (array!5288 (arr!2500 (Array (_ BitVec 32) (_ BitVec 64))) (size!2779 (_ BitVec 32))) )
))
(declare-datatypes ((array!5289 0))(
  ( (array!5290 (arr!2501 (Array (_ BitVec 32) ValueCell!1220)) (size!2780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1348 0))(
  ( (LongMapFixedSize!1349 (defaultEntry!3116 Int) (mask!7556 (_ BitVec 32)) (extraKeys!2857 (_ BitVec 32)) (zeroValue!2959 V!3817) (minValue!2959 V!3817) (_size!723 (_ BitVec 32)) (_keys!4890 array!5287) (_values!3099 array!5289) (_vacant!723 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1348)

(declare-fun valid!659 (LongMapFixedSize!1348) Bool)

(assert (=> start!15662 (= res!73595 (valid!659 thiss!1248))))

(assert (=> start!15662 e!101918))

(declare-fun e!101919 () Bool)

(assert (=> start!15662 e!101919))

(assert (=> start!15662 true))

(assert (=> start!15662 tp_is_empty!3127))

(declare-fun b!155869 () Bool)

(assert (=> b!155869 (= e!101918 (not true))))

(declare-fun lt!81315 () Bool)

(declare-fun v!309 () V!3817)

(assert (=> b!155869 (= lt!81315 (valid!659 (LongMapFixedSize!1349 (defaultEntry!3116 thiss!1248) (mask!7556 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2959 thiss!1248) (_size!723 thiss!1248) (_keys!4890 thiss!1248) (_values!3099 thiss!1248) (_vacant!723 thiss!1248))))))

(declare-datatypes ((tuple2!2822 0))(
  ( (tuple2!2823 (_1!1422 (_ BitVec 64)) (_2!1422 V!3817)) )
))
(declare-datatypes ((List!1842 0))(
  ( (Nil!1839) (Cons!1838 (h!2447 tuple2!2822) (t!6635 List!1842)) )
))
(declare-datatypes ((ListLongMap!1809 0))(
  ( (ListLongMap!1810 (toList!920 List!1842)) )
))
(declare-fun +!189 (ListLongMap!1809 tuple2!2822) ListLongMap!1809)

(declare-fun getCurrentListMap!570 (array!5287 array!5289 (_ BitVec 32) (_ BitVec 32) V!3817 V!3817 (_ BitVec 32) Int) ListLongMap!1809)

(assert (=> b!155869 (= (+!189 (getCurrentListMap!570 (_keys!4890 thiss!1248) (_values!3099 thiss!1248) (mask!7556 thiss!1248) (extraKeys!2857 thiss!1248) (zeroValue!2959 thiss!1248) (minValue!2959 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3116 thiss!1248)) (tuple2!2823 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!570 (_keys!4890 thiss!1248) (_values!3099 thiss!1248) (mask!7556 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2959 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3116 thiss!1248)))))

(declare-datatypes ((Unit!4932 0))(
  ( (Unit!4933) )
))
(declare-fun lt!81314 () Unit!4932)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!79 (array!5287 array!5289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3817 V!3817 V!3817 Int) Unit!4932)

(assert (=> b!155869 (= lt!81314 (lemmaChangeZeroKeyThenAddPairToListMap!79 (_keys!4890 thiss!1248) (_values!3099 thiss!1248) (mask!7556 thiss!1248) (extraKeys!2857 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2959 thiss!1248) v!309 (minValue!2959 thiss!1248) (defaultEntry!3116 thiss!1248)))))

(declare-fun b!155870 () Bool)

(declare-fun e!101916 () Bool)

(declare-fun mapRes!5333 () Bool)

(assert (=> b!155870 (= e!101916 (and e!101920 mapRes!5333))))

(declare-fun condMapEmpty!5333 () Bool)

(declare-fun mapDefault!5333 () ValueCell!1220)

(assert (=> b!155870 (= condMapEmpty!5333 (= (arr!2501 (_values!3099 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1220)) mapDefault!5333)))))

(declare-fun mapIsEmpty!5333 () Bool)

(assert (=> mapIsEmpty!5333 mapRes!5333))

(declare-fun b!155871 () Bool)

(declare-fun e!101917 () Bool)

(assert (=> b!155871 (= e!101917 tp_is_empty!3127)))

(declare-fun mapNonEmpty!5333 () Bool)

(declare-fun tp!12500 () Bool)

(assert (=> mapNonEmpty!5333 (= mapRes!5333 (and tp!12500 e!101917))))

(declare-fun mapRest!5333 () (Array (_ BitVec 32) ValueCell!1220))

(declare-fun mapKey!5333 () (_ BitVec 32))

(declare-fun mapValue!5333 () ValueCell!1220)

(assert (=> mapNonEmpty!5333 (= (arr!2501 (_values!3099 thiss!1248)) (store mapRest!5333 mapKey!5333 mapValue!5333))))

(declare-fun b!155872 () Bool)

(declare-fun res!73594 () Bool)

(assert (=> b!155872 (=> (not res!73594) (not e!101918))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155872 (= res!73594 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!1609 (array!5287) Bool)

(declare-fun array_inv!1610 (array!5289) Bool)

(assert (=> b!155873 (= e!101919 (and tp!12499 tp_is_empty!3127 (array_inv!1609 (_keys!4890 thiss!1248)) (array_inv!1610 (_values!3099 thiss!1248)) e!101916))))

(assert (= (and start!15662 res!73595) b!155872))

(assert (= (and b!155872 res!73594) b!155869))

(assert (= (and b!155870 condMapEmpty!5333) mapIsEmpty!5333))

(assert (= (and b!155870 (not condMapEmpty!5333)) mapNonEmpty!5333))

(get-info :version)

(assert (= (and mapNonEmpty!5333 ((_ is ValueCellFull!1220) mapValue!5333)) b!155871))

(assert (= (and b!155870 ((_ is ValueCellFull!1220) mapDefault!5333)) b!155868))

(assert (= b!155873 b!155870))

(assert (= start!15662 b!155873))

(declare-fun m!189139 () Bool)

(assert (=> start!15662 m!189139))

(declare-fun m!189141 () Bool)

(assert (=> b!155869 m!189141))

(declare-fun m!189143 () Bool)

(assert (=> b!155869 m!189143))

(assert (=> b!155869 m!189141))

(declare-fun m!189145 () Bool)

(assert (=> b!155869 m!189145))

(declare-fun m!189147 () Bool)

(assert (=> b!155869 m!189147))

(declare-fun m!189149 () Bool)

(assert (=> b!155869 m!189149))

(declare-fun m!189151 () Bool)

(assert (=> mapNonEmpty!5333 m!189151))

(declare-fun m!189153 () Bool)

(assert (=> b!155873 m!189153))

(declare-fun m!189155 () Bool)

(assert (=> b!155873 m!189155))

(check-sat (not b_next!3325) (not b!155869) b_and!9713 tp_is_empty!3127 (not b!155873) (not start!15662) (not mapNonEmpty!5333))
(check-sat b_and!9713 (not b_next!3325))
