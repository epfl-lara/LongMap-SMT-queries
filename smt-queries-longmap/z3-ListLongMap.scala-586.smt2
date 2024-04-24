; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15662 () Bool)

(assert start!15662)

(declare-fun b!156063 () Bool)

(declare-fun b_free!3325 () Bool)

(declare-fun b_next!3325 () Bool)

(assert (=> b!156063 (= b_free!3325 (not b_next!3325))))

(declare-fun tp!12499 () Bool)

(declare-fun b_and!9753 () Bool)

(assert (=> b!156063 (= tp!12499 b_and!9753)))

(declare-fun b!156062 () Bool)

(declare-fun e!102042 () Bool)

(declare-fun tp_is_empty!3127 () Bool)

(assert (=> b!156062 (= e!102042 tp_is_empty!3127)))

(declare-fun e!102040 () Bool)

(declare-datatypes ((V!3817 0))(
  ( (V!3818 (val!1608 Int)) )
))
(declare-datatypes ((ValueCell!1220 0))(
  ( (ValueCellFull!1220 (v!3474 V!3817)) (EmptyCell!1220) )
))
(declare-datatypes ((array!5293 0))(
  ( (array!5294 (arr!2504 (Array (_ BitVec 32) (_ BitVec 64))) (size!2782 (_ BitVec 32))) )
))
(declare-datatypes ((array!5295 0))(
  ( (array!5296 (arr!2505 (Array (_ BitVec 32) ValueCell!1220)) (size!2783 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1348 0))(
  ( (LongMapFixedSize!1349 (defaultEntry!3116 Int) (mask!7557 (_ BitVec 32)) (extraKeys!2857 (_ BitVec 32)) (zeroValue!2959 V!3817) (minValue!2959 V!3817) (_size!723 (_ BitVec 32)) (_keys!4891 array!5293) (_values!3099 array!5295) (_vacant!723 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1348)

(declare-fun e!102045 () Bool)

(declare-fun array_inv!1581 (array!5293) Bool)

(declare-fun array_inv!1582 (array!5295) Bool)

(assert (=> b!156063 (= e!102040 (and tp!12499 tp_is_empty!3127 (array_inv!1581 (_keys!4891 thiss!1248)) (array_inv!1582 (_values!3099 thiss!1248)) e!102045))))

(declare-fun b!156064 () Bool)

(declare-fun e!102043 () Bool)

(declare-fun mapRes!5333 () Bool)

(assert (=> b!156064 (= e!102045 (and e!102043 mapRes!5333))))

(declare-fun condMapEmpty!5333 () Bool)

(declare-fun mapDefault!5333 () ValueCell!1220)

(assert (=> b!156064 (= condMapEmpty!5333 (= (arr!2505 (_values!3099 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1220)) mapDefault!5333)))))

(declare-fun mapIsEmpty!5333 () Bool)

(assert (=> mapIsEmpty!5333 mapRes!5333))

(declare-fun mapNonEmpty!5333 () Bool)

(declare-fun tp!12500 () Bool)

(assert (=> mapNonEmpty!5333 (= mapRes!5333 (and tp!12500 e!102042))))

(declare-fun mapValue!5333 () ValueCell!1220)

(declare-fun mapRest!5333 () (Array (_ BitVec 32) ValueCell!1220))

(declare-fun mapKey!5333 () (_ BitVec 32))

(assert (=> mapNonEmpty!5333 (= (arr!2505 (_values!3099 thiss!1248)) (store mapRest!5333 mapKey!5333 mapValue!5333))))

(declare-fun res!73710 () Bool)

(declare-fun e!102041 () Bool)

(assert (=> start!15662 (=> (not res!73710) (not e!102041))))

(declare-fun valid!671 (LongMapFixedSize!1348) Bool)

(assert (=> start!15662 (= res!73710 (valid!671 thiss!1248))))

(assert (=> start!15662 e!102041))

(assert (=> start!15662 e!102040))

(assert (=> start!15662 true))

(assert (=> start!15662 tp_is_empty!3127))

(declare-fun b!156065 () Bool)

(assert (=> b!156065 (= e!102043 tp_is_empty!3127)))

(declare-fun b!156066 () Bool)

(declare-fun res!73711 () Bool)

(assert (=> b!156066 (=> (not res!73711) (not e!102041))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156066 (= res!73711 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!156067 () Bool)

(assert (=> b!156067 (= e!102041 (not true))))

(declare-fun lt!81554 () Bool)

(declare-fun v!309 () V!3817)

(assert (=> b!156067 (= lt!81554 (valid!671 (LongMapFixedSize!1349 (defaultEntry!3116 thiss!1248) (mask!7557 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2959 thiss!1248) (_size!723 thiss!1248) (_keys!4891 thiss!1248) (_values!3099 thiss!1248) (_vacant!723 thiss!1248))))))

(declare-datatypes ((tuple2!2788 0))(
  ( (tuple2!2789 (_1!1405 (_ BitVec 64)) (_2!1405 V!3817)) )
))
(declare-datatypes ((List!1829 0))(
  ( (Nil!1826) (Cons!1825 (h!2434 tuple2!2788) (t!6623 List!1829)) )
))
(declare-datatypes ((ListLongMap!1787 0))(
  ( (ListLongMap!1788 (toList!909 List!1829)) )
))
(declare-fun +!201 (ListLongMap!1787 tuple2!2788) ListLongMap!1787)

(declare-fun getCurrentListMap!576 (array!5293 array!5295 (_ BitVec 32) (_ BitVec 32) V!3817 V!3817 (_ BitVec 32) Int) ListLongMap!1787)

(assert (=> b!156067 (= (+!201 (getCurrentListMap!576 (_keys!4891 thiss!1248) (_values!3099 thiss!1248) (mask!7557 thiss!1248) (extraKeys!2857 thiss!1248) (zeroValue!2959 thiss!1248) (minValue!2959 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3116 thiss!1248)) (tuple2!2789 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!576 (_keys!4891 thiss!1248) (_values!3099 thiss!1248) (mask!7557 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2959 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3116 thiss!1248)))))

(declare-datatypes ((Unit!4957 0))(
  ( (Unit!4958) )
))
(declare-fun lt!81555 () Unit!4957)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!83 (array!5293 array!5295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3817 V!3817 V!3817 Int) Unit!4957)

(assert (=> b!156067 (= lt!81555 (lemmaChangeZeroKeyThenAddPairToListMap!83 (_keys!4891 thiss!1248) (_values!3099 thiss!1248) (mask!7557 thiss!1248) (extraKeys!2857 thiss!1248) (bvor (extraKeys!2857 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2959 thiss!1248) v!309 (minValue!2959 thiss!1248) (defaultEntry!3116 thiss!1248)))))

(assert (= (and start!15662 res!73710) b!156066))

(assert (= (and b!156066 res!73711) b!156067))

(assert (= (and b!156064 condMapEmpty!5333) mapIsEmpty!5333))

(assert (= (and b!156064 (not condMapEmpty!5333)) mapNonEmpty!5333))

(get-info :version)

(assert (= (and mapNonEmpty!5333 ((_ is ValueCellFull!1220) mapValue!5333)) b!156062))

(assert (= (and b!156064 ((_ is ValueCellFull!1220) mapDefault!5333)) b!156065))

(assert (= b!156063 b!156064))

(assert (= start!15662 b!156063))

(declare-fun m!189941 () Bool)

(assert (=> b!156063 m!189941))

(declare-fun m!189943 () Bool)

(assert (=> b!156063 m!189943))

(declare-fun m!189945 () Bool)

(assert (=> mapNonEmpty!5333 m!189945))

(declare-fun m!189947 () Bool)

(assert (=> start!15662 m!189947))

(declare-fun m!189949 () Bool)

(assert (=> b!156067 m!189949))

(declare-fun m!189951 () Bool)

(assert (=> b!156067 m!189951))

(assert (=> b!156067 m!189949))

(declare-fun m!189953 () Bool)

(assert (=> b!156067 m!189953))

(declare-fun m!189955 () Bool)

(assert (=> b!156067 m!189955))

(declare-fun m!189957 () Bool)

(assert (=> b!156067 m!189957))

(check-sat (not b!156063) tp_is_empty!3127 (not b!156067) b_and!9753 (not b_next!3325) (not mapNonEmpty!5333) (not start!15662))
(check-sat b_and!9753 (not b_next!3325))
