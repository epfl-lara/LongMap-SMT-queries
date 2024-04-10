; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15660 () Bool)

(assert start!15660)

(declare-fun b!156038 () Bool)

(declare-fun b_free!3327 () Bool)

(declare-fun b_next!3327 () Bool)

(assert (=> b!156038 (= b_free!3327 (not b_next!3327))))

(declare-fun tp!12505 () Bool)

(declare-fun b_and!9741 () Bool)

(assert (=> b!156038 (= tp!12505 b_and!9741)))

(declare-fun b!156033 () Bool)

(declare-fun e!102039 () Bool)

(declare-fun tp_is_empty!3129 () Bool)

(assert (=> b!156033 (= e!102039 tp_is_empty!3129)))

(declare-fun b!156034 () Bool)

(declare-fun e!102037 () Bool)

(assert (=> b!156034 (= e!102037 (not true))))

(declare-fun lt!81501 () Bool)

(declare-datatypes ((V!3819 0))(
  ( (V!3820 (val!1609 Int)) )
))
(declare-datatypes ((ValueCell!1221 0))(
  ( (ValueCellFull!1221 (v!3474 V!3819)) (EmptyCell!1221) )
))
(declare-datatypes ((array!5311 0))(
  ( (array!5312 (arr!2513 (Array (_ BitVec 32) (_ BitVec 64))) (size!2791 (_ BitVec 32))) )
))
(declare-datatypes ((array!5313 0))(
  ( (array!5314 (arr!2514 (Array (_ BitVec 32) ValueCell!1221)) (size!2792 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1350 0))(
  ( (LongMapFixedSize!1351 (defaultEntry!3117 Int) (mask!7558 (_ BitVec 32)) (extraKeys!2858 (_ BitVec 32)) (zeroValue!2960 V!3819) (minValue!2960 V!3819) (_size!724 (_ BitVec 32)) (_keys!4892 array!5311) (_values!3100 array!5313) (_vacant!724 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1350)

(declare-fun v!309 () V!3819)

(declare-fun valid!657 (LongMapFixedSize!1350) Bool)

(assert (=> b!156034 (= lt!81501 (valid!657 (LongMapFixedSize!1351 (defaultEntry!3117 thiss!1248) (mask!7558 thiss!1248) (bvor (extraKeys!2858 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2960 thiss!1248) (_size!724 thiss!1248) (_keys!4892 thiss!1248) (_values!3100 thiss!1248) (_vacant!724 thiss!1248))))))

(declare-datatypes ((tuple2!2852 0))(
  ( (tuple2!2853 (_1!1437 (_ BitVec 64)) (_2!1437 V!3819)) )
))
(declare-datatypes ((List!1844 0))(
  ( (Nil!1841) (Cons!1840 (h!2449 tuple2!2852) (t!6646 List!1844)) )
))
(declare-datatypes ((ListLongMap!1839 0))(
  ( (ListLongMap!1840 (toList!935 List!1844)) )
))
(declare-fun +!203 (ListLongMap!1839 tuple2!2852) ListLongMap!1839)

(declare-fun getCurrentListMap!599 (array!5311 array!5313 (_ BitVec 32) (_ BitVec 32) V!3819 V!3819 (_ BitVec 32) Int) ListLongMap!1839)

(assert (=> b!156034 (= (+!203 (getCurrentListMap!599 (_keys!4892 thiss!1248) (_values!3100 thiss!1248) (mask!7558 thiss!1248) (extraKeys!2858 thiss!1248) (zeroValue!2960 thiss!1248) (minValue!2960 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3117 thiss!1248)) (tuple2!2853 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!599 (_keys!4892 thiss!1248) (_values!3100 thiss!1248) (mask!7558 thiss!1248) (bvor (extraKeys!2858 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2960 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3117 thiss!1248)))))

(declare-datatypes ((Unit!4950 0))(
  ( (Unit!4951) )
))
(declare-fun lt!81502 () Unit!4950)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!82 (array!5311 array!5313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3819 V!3819 V!3819 Int) Unit!4950)

(assert (=> b!156034 (= lt!81502 (lemmaChangeZeroKeyThenAddPairToListMap!82 (_keys!4892 thiss!1248) (_values!3100 thiss!1248) (mask!7558 thiss!1248) (extraKeys!2858 thiss!1248) (bvor (extraKeys!2858 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2960 thiss!1248) v!309 (minValue!2960 thiss!1248) (defaultEntry!3117 thiss!1248)))))

(declare-fun mapIsEmpty!5336 () Bool)

(declare-fun mapRes!5336 () Bool)

(assert (=> mapIsEmpty!5336 mapRes!5336))

(declare-fun res!73696 () Bool)

(assert (=> start!15660 (=> (not res!73696) (not e!102037))))

(assert (=> start!15660 (= res!73696 (valid!657 thiss!1248))))

(assert (=> start!15660 e!102037))

(declare-fun e!102034 () Bool)

(assert (=> start!15660 e!102034))

(assert (=> start!15660 true))

(assert (=> start!15660 tp_is_empty!3129))

(declare-fun b!156035 () Bool)

(declare-fun e!102038 () Bool)

(assert (=> b!156035 (= e!102038 tp_is_empty!3129)))

(declare-fun b!156036 () Bool)

(declare-fun e!102036 () Bool)

(assert (=> b!156036 (= e!102036 (and e!102039 mapRes!5336))))

(declare-fun condMapEmpty!5336 () Bool)

(declare-fun mapDefault!5336 () ValueCell!1221)

(assert (=> b!156036 (= condMapEmpty!5336 (= (arr!2514 (_values!3100 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1221)) mapDefault!5336)))))

(declare-fun b!156037 () Bool)

(declare-fun res!73695 () Bool)

(assert (=> b!156037 (=> (not res!73695) (not e!102037))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156037 (= res!73695 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!5336 () Bool)

(declare-fun tp!12506 () Bool)

(assert (=> mapNonEmpty!5336 (= mapRes!5336 (and tp!12506 e!102038))))

(declare-fun mapKey!5336 () (_ BitVec 32))

(declare-fun mapValue!5336 () ValueCell!1221)

(declare-fun mapRest!5336 () (Array (_ BitVec 32) ValueCell!1221))

(assert (=> mapNonEmpty!5336 (= (arr!2514 (_values!3100 thiss!1248)) (store mapRest!5336 mapKey!5336 mapValue!5336))))

(declare-fun array_inv!1587 (array!5311) Bool)

(declare-fun array_inv!1588 (array!5313) Bool)

(assert (=> b!156038 (= e!102034 (and tp!12505 tp_is_empty!3129 (array_inv!1587 (_keys!4892 thiss!1248)) (array_inv!1588 (_values!3100 thiss!1248)) e!102036))))

(assert (= (and start!15660 res!73696) b!156037))

(assert (= (and b!156037 res!73695) b!156034))

(assert (= (and b!156036 condMapEmpty!5336) mapIsEmpty!5336))

(assert (= (and b!156036 (not condMapEmpty!5336)) mapNonEmpty!5336))

(get-info :version)

(assert (= (and mapNonEmpty!5336 ((_ is ValueCellFull!1221) mapValue!5336)) b!156035))

(assert (= (and b!156036 ((_ is ValueCellFull!1221) mapDefault!5336)) b!156033))

(assert (= b!156038 b!156036))

(assert (= start!15660 b!156038))

(declare-fun m!189777 () Bool)

(assert (=> b!156034 m!189777))

(declare-fun m!189779 () Bool)

(assert (=> b!156034 m!189779))

(assert (=> b!156034 m!189777))

(declare-fun m!189781 () Bool)

(assert (=> b!156034 m!189781))

(declare-fun m!189783 () Bool)

(assert (=> b!156034 m!189783))

(declare-fun m!189785 () Bool)

(assert (=> b!156034 m!189785))

(declare-fun m!189787 () Bool)

(assert (=> start!15660 m!189787))

(declare-fun m!189789 () Bool)

(assert (=> mapNonEmpty!5336 m!189789))

(declare-fun m!189791 () Bool)

(assert (=> b!156038 m!189791))

(declare-fun m!189793 () Bool)

(assert (=> b!156038 m!189793))

(check-sat (not b!156034) b_and!9741 tp_is_empty!3129 (not start!15660) (not b!156038) (not mapNonEmpty!5336) (not b_next!3327))
(check-sat b_and!9741 (not b_next!3327))
