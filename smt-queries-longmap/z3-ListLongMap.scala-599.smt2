; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15738 () Bool)

(assert start!15738)

(declare-fun b!157061 () Bool)

(declare-fun b_free!3405 () Bool)

(declare-fun b_next!3405 () Bool)

(assert (=> b!157061 (= b_free!3405 (not b_next!3405))))

(declare-fun tp!12740 () Bool)

(declare-fun b_and!9819 () Bool)

(assert (=> b!157061 (= tp!12740 b_and!9819)))

(declare-fun b!157059 () Bool)

(declare-fun e!102739 () Bool)

(declare-fun tp_is_empty!3207 () Bool)

(assert (=> b!157059 (= e!102739 tp_is_empty!3207)))

(declare-fun b!157060 () Bool)

(declare-fun e!102737 () Bool)

(declare-fun e!102738 () Bool)

(declare-fun mapRes!5453 () Bool)

(assert (=> b!157060 (= e!102737 (and e!102738 mapRes!5453))))

(declare-fun condMapEmpty!5453 () Bool)

(declare-datatypes ((V!3923 0))(
  ( (V!3924 (val!1648 Int)) )
))
(declare-datatypes ((ValueCell!1260 0))(
  ( (ValueCellFull!1260 (v!3513 V!3923)) (EmptyCell!1260) )
))
(declare-datatypes ((array!5467 0))(
  ( (array!5468 (arr!2591 (Array (_ BitVec 32) (_ BitVec 64))) (size!2869 (_ BitVec 32))) )
))
(declare-datatypes ((array!5469 0))(
  ( (array!5470 (arr!2592 (Array (_ BitVec 32) ValueCell!1260)) (size!2870 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1428 0))(
  ( (LongMapFixedSize!1429 (defaultEntry!3156 Int) (mask!7623 (_ BitVec 32)) (extraKeys!2897 (_ BitVec 32)) (zeroValue!2999 V!3923) (minValue!2999 V!3923) (_size!763 (_ BitVec 32)) (_keys!4931 array!5467) (_values!3139 array!5469) (_vacant!763 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1428)

(declare-fun mapDefault!5453 () ValueCell!1260)

(assert (=> b!157060 (= condMapEmpty!5453 (= (arr!2592 (_values!3139 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1260)) mapDefault!5453)))))

(declare-fun e!102741 () Bool)

(declare-fun array_inv!1639 (array!5467) Bool)

(declare-fun array_inv!1640 (array!5469) Bool)

(assert (=> b!157061 (= e!102741 (and tp!12740 tp_is_empty!3207 (array_inv!1639 (_keys!4931 thiss!1248)) (array_inv!1640 (_values!3139 thiss!1248)) e!102737))))

(declare-fun mapNonEmpty!5453 () Bool)

(declare-fun tp!12739 () Bool)

(assert (=> mapNonEmpty!5453 (= mapRes!5453 (and tp!12739 e!102739))))

(declare-fun mapRest!5453 () (Array (_ BitVec 32) ValueCell!1260))

(declare-fun mapValue!5453 () ValueCell!1260)

(declare-fun mapKey!5453 () (_ BitVec 32))

(assert (=> mapNonEmpty!5453 (= (arr!2592 (_values!3139 thiss!1248)) (store mapRest!5453 mapKey!5453 mapValue!5453))))

(declare-fun mapIsEmpty!5453 () Bool)

(assert (=> mapIsEmpty!5453 mapRes!5453))

(declare-fun res!74253 () Bool)

(declare-fun e!102736 () Bool)

(assert (=> start!15738 (=> (not res!74253) (not e!102736))))

(declare-fun valid!680 (LongMapFixedSize!1428) Bool)

(assert (=> start!15738 (= res!74253 (valid!680 thiss!1248))))

(assert (=> start!15738 e!102736))

(assert (=> start!15738 e!102741))

(assert (=> start!15738 true))

(assert (=> start!15738 tp_is_empty!3207))

(declare-fun b!157062 () Bool)

(assert (=> b!157062 (= e!102736 (not true))))

(declare-fun lt!81628 () Bool)

(declare-fun v!309 () V!3923)

(assert (=> b!157062 (= lt!81628 (valid!680 (LongMapFixedSize!1429 (defaultEntry!3156 thiss!1248) (mask!7623 thiss!1248) (bvor (extraKeys!2897 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2999 thiss!1248) v!309 (_size!763 thiss!1248) (_keys!4931 thiss!1248) (_values!3139 thiss!1248) (_vacant!763 thiss!1248))))))

(declare-datatypes ((tuple2!2856 0))(
  ( (tuple2!2857 (_1!1439 (_ BitVec 64)) (_2!1439 V!3923)) )
))
(declare-datatypes ((List!1870 0))(
  ( (Nil!1867) (Cons!1866 (h!2475 tuple2!2856) (t!6672 List!1870)) )
))
(declare-datatypes ((ListLongMap!1843 0))(
  ( (ListLongMap!1844 (toList!937 List!1870)) )
))
(declare-fun +!205 (ListLongMap!1843 tuple2!2856) ListLongMap!1843)

(declare-fun getCurrentListMap!601 (array!5467 array!5469 (_ BitVec 32) (_ BitVec 32) V!3923 V!3923 (_ BitVec 32) Int) ListLongMap!1843)

(assert (=> b!157062 (= (+!205 (getCurrentListMap!601 (_keys!4931 thiss!1248) (_values!3139 thiss!1248) (mask!7623 thiss!1248) (extraKeys!2897 thiss!1248) (zeroValue!2999 thiss!1248) (minValue!2999 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3156 thiss!1248)) (tuple2!2857 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!601 (_keys!4931 thiss!1248) (_values!3139 thiss!1248) (mask!7623 thiss!1248) (bvor (extraKeys!2897 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2999 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3156 thiss!1248)))))

(declare-datatypes ((Unit!4954 0))(
  ( (Unit!4955) )
))
(declare-fun lt!81627 () Unit!4954)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!73 (array!5467 array!5469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3923 V!3923 V!3923 Int) Unit!4954)

(assert (=> b!157062 (= lt!81627 (lemmaChangeLongMinValueKeyThenAddPairToListMap!73 (_keys!4931 thiss!1248) (_values!3139 thiss!1248) (mask!7623 thiss!1248) (extraKeys!2897 thiss!1248) (bvor (extraKeys!2897 thiss!1248) #b00000000000000000000000000000010) (zeroValue!2999 thiss!1248) (minValue!2999 thiss!1248) v!309 (defaultEntry!3156 thiss!1248)))))

(declare-fun b!157063 () Bool)

(assert (=> b!157063 (= e!102738 tp_is_empty!3207)))

(declare-fun b!157064 () Bool)

(declare-fun res!74254 () Bool)

(assert (=> b!157064 (=> (not res!74254) (not e!102736))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157064 (= res!74254 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!15738 res!74253) b!157064))

(assert (= (and b!157064 res!74254) b!157062))

(assert (= (and b!157060 condMapEmpty!5453) mapIsEmpty!5453))

(assert (= (and b!157060 (not condMapEmpty!5453)) mapNonEmpty!5453))

(get-info :version)

(assert (= (and mapNonEmpty!5453 ((_ is ValueCellFull!1260) mapValue!5453)) b!157059))

(assert (= (and b!157060 ((_ is ValueCellFull!1260) mapDefault!5453)) b!157063))

(assert (= b!157061 b!157060))

(assert (= start!15738 b!157061))

(declare-fun m!190335 () Bool)

(assert (=> b!157061 m!190335))

(declare-fun m!190337 () Bool)

(assert (=> b!157061 m!190337))

(declare-fun m!190339 () Bool)

(assert (=> mapNonEmpty!5453 m!190339))

(declare-fun m!190341 () Bool)

(assert (=> start!15738 m!190341))

(declare-fun m!190343 () Bool)

(assert (=> b!157062 m!190343))

(declare-fun m!190345 () Bool)

(assert (=> b!157062 m!190345))

(declare-fun m!190347 () Bool)

(assert (=> b!157062 m!190347))

(declare-fun m!190349 () Bool)

(assert (=> b!157062 m!190349))

(assert (=> b!157062 m!190343))

(declare-fun m!190351 () Bool)

(assert (=> b!157062 m!190351))

(check-sat (not start!15738) b_and!9819 (not b!157061) tp_is_empty!3207 (not b!157062) (not mapNonEmpty!5453) (not b_next!3405))
(check-sat b_and!9819 (not b_next!3405))
