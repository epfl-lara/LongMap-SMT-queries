; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15740 () Bool)

(assert start!15740)

(declare-fun b!156895 () Bool)

(declare-fun b_free!3403 () Bool)

(declare-fun b_next!3403 () Bool)

(assert (=> b!156895 (= b_free!3403 (not b_next!3403))))

(declare-fun tp!12733 () Bool)

(declare-fun b_and!9791 () Bool)

(assert (=> b!156895 (= tp!12733 b_and!9791)))

(declare-fun b!156894 () Bool)

(declare-fun e!102617 () Bool)

(declare-fun tp_is_empty!3205 () Bool)

(assert (=> b!156894 (= e!102617 tp_is_empty!3205)))

(declare-fun e!102618 () Bool)

(declare-fun e!102620 () Bool)

(declare-datatypes ((V!3921 0))(
  ( (V!3922 (val!1647 Int)) )
))
(declare-datatypes ((ValueCell!1259 0))(
  ( (ValueCellFull!1259 (v!3506 V!3921)) (EmptyCell!1259) )
))
(declare-datatypes ((array!5443 0))(
  ( (array!5444 (arr!2578 (Array (_ BitVec 32) (_ BitVec 64))) (size!2857 (_ BitVec 32))) )
))
(declare-datatypes ((array!5445 0))(
  ( (array!5446 (arr!2579 (Array (_ BitVec 32) ValueCell!1259)) (size!2858 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1426 0))(
  ( (LongMapFixedSize!1427 (defaultEntry!3155 Int) (mask!7621 (_ BitVec 32)) (extraKeys!2896 (_ BitVec 32)) (zeroValue!2998 V!3921) (minValue!2998 V!3921) (_size!762 (_ BitVec 32)) (_keys!4929 array!5443) (_values!3138 array!5445) (_vacant!762 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1426)

(declare-fun array_inv!1663 (array!5443) Bool)

(declare-fun array_inv!1664 (array!5445) Bool)

(assert (=> b!156895 (= e!102618 (and tp!12733 tp_is_empty!3205 (array_inv!1663 (_keys!4929 thiss!1248)) (array_inv!1664 (_values!3138 thiss!1248)) e!102620))))

(declare-fun b!156896 () Bool)

(declare-fun e!102621 () Bool)

(assert (=> b!156896 (= e!102621 tp_is_empty!3205)))

(declare-fun b!156897 () Bool)

(declare-fun e!102622 () Bool)

(assert (=> b!156897 (= e!102622 (not true))))

(declare-fun lt!81441 () Bool)

(declare-fun v!309 () V!3921)

(declare-fun valid!687 (LongMapFixedSize!1426) Bool)

(assert (=> b!156897 (= lt!81441 (valid!687 (LongMapFixedSize!1427 (defaultEntry!3155 thiss!1248) (mask!7621 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) v!309 (_size!762 thiss!1248) (_keys!4929 thiss!1248) (_values!3138 thiss!1248) (_vacant!762 thiss!1248))))))

(declare-datatypes ((tuple2!2826 0))(
  ( (tuple2!2827 (_1!1424 (_ BitVec 64)) (_2!1424 V!3921)) )
))
(declare-datatypes ((List!1870 0))(
  ( (Nil!1867) (Cons!1866 (h!2475 tuple2!2826) (t!6663 List!1870)) )
))
(declare-datatypes ((ListLongMap!1813 0))(
  ( (ListLongMap!1814 (toList!922 List!1870)) )
))
(declare-fun +!191 (ListLongMap!1813 tuple2!2826) ListLongMap!1813)

(declare-fun getCurrentListMap!572 (array!5443 array!5445 (_ BitVec 32) (_ BitVec 32) V!3921 V!3921 (_ BitVec 32) Int) ListLongMap!1813)

(assert (=> b!156897 (= (+!191 (getCurrentListMap!572 (_keys!4929 thiss!1248) (_values!3138 thiss!1248) (mask!7621 thiss!1248) (extraKeys!2896 thiss!1248) (zeroValue!2998 thiss!1248) (minValue!2998 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3155 thiss!1248)) (tuple2!2827 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!572 (_keys!4929 thiss!1248) (_values!3138 thiss!1248) (mask!7621 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3155 thiss!1248)))))

(declare-datatypes ((Unit!4936 0))(
  ( (Unit!4937) )
))
(declare-fun lt!81440 () Unit!4936)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!72 (array!5443 array!5445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3921 V!3921 V!3921 Int) Unit!4936)

(assert (=> b!156897 (= lt!81440 (lemmaChangeLongMinValueKeyThenAddPairToListMap!72 (_keys!4929 thiss!1248) (_values!3138 thiss!1248) (mask!7621 thiss!1248) (extraKeys!2896 thiss!1248) (bvor (extraKeys!2896 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2998 thiss!1248) (minValue!2998 thiss!1248) v!309 (defaultEntry!3155 thiss!1248)))))

(declare-fun b!156898 () Bool)

(declare-fun res!74153 () Bool)

(assert (=> b!156898 (=> (not res!74153) (not e!102622))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156898 (= res!74153 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5450 () Bool)

(declare-fun mapRes!5450 () Bool)

(declare-fun tp!12734 () Bool)

(assert (=> mapNonEmpty!5450 (= mapRes!5450 (and tp!12734 e!102621))))

(declare-fun mapRest!5450 () (Array (_ BitVec 32) ValueCell!1259))

(declare-fun mapKey!5450 () (_ BitVec 32))

(declare-fun mapValue!5450 () ValueCell!1259)

(assert (=> mapNonEmpty!5450 (= (arr!2579 (_values!3138 thiss!1248)) (store mapRest!5450 mapKey!5450 mapValue!5450))))

(declare-fun res!74152 () Bool)

(assert (=> start!15740 (=> (not res!74152) (not e!102622))))

(assert (=> start!15740 (= res!74152 (valid!687 thiss!1248))))

(assert (=> start!15740 e!102622))

(assert (=> start!15740 e!102618))

(assert (=> start!15740 true))

(assert (=> start!15740 tp_is_empty!3205))

(declare-fun mapIsEmpty!5450 () Bool)

(assert (=> mapIsEmpty!5450 mapRes!5450))

(declare-fun b!156899 () Bool)

(assert (=> b!156899 (= e!102620 (and e!102617 mapRes!5450))))

(declare-fun condMapEmpty!5450 () Bool)

(declare-fun mapDefault!5450 () ValueCell!1259)

(assert (=> b!156899 (= condMapEmpty!5450 (= (arr!2579 (_values!3138 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1259)) mapDefault!5450)))))

(assert (= (and start!15740 res!74152) b!156898))

(assert (= (and b!156898 res!74153) b!156897))

(assert (= (and b!156899 condMapEmpty!5450) mapIsEmpty!5450))

(assert (= (and b!156899 (not condMapEmpty!5450)) mapNonEmpty!5450))

(get-info :version)

(assert (= (and mapNonEmpty!5450 ((_ is ValueCellFull!1259) mapValue!5450)) b!156896))

(assert (= (and b!156899 ((_ is ValueCellFull!1259) mapDefault!5450)) b!156894))

(assert (= b!156895 b!156899))

(assert (= start!15740 b!156895))

(declare-fun m!189697 () Bool)

(assert (=> b!156895 m!189697))

(declare-fun m!189699 () Bool)

(assert (=> b!156895 m!189699))

(declare-fun m!189701 () Bool)

(assert (=> b!156897 m!189701))

(declare-fun m!189703 () Bool)

(assert (=> b!156897 m!189703))

(declare-fun m!189705 () Bool)

(assert (=> b!156897 m!189705))

(declare-fun m!189707 () Bool)

(assert (=> b!156897 m!189707))

(assert (=> b!156897 m!189701))

(declare-fun m!189709 () Bool)

(assert (=> b!156897 m!189709))

(declare-fun m!189711 () Bool)

(assert (=> mapNonEmpty!5450 m!189711))

(declare-fun m!189713 () Bool)

(assert (=> start!15740 m!189713))

(check-sat b_and!9791 (not start!15740) (not b!156895) tp_is_empty!3205 (not b_next!3403) (not mapNonEmpty!5450) (not b!156897))
(check-sat b_and!9791 (not b_next!3403))
