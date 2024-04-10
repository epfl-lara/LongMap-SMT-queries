; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89290 () Bool)

(assert start!89290)

(declare-fun b!1023849 () Bool)

(declare-fun b_free!20331 () Bool)

(declare-fun b_next!20331 () Bool)

(assert (=> b!1023849 (= b_free!20331 (not b_next!20331))))

(declare-fun tp!72028 () Bool)

(declare-fun b_and!32573 () Bool)

(assert (=> b!1023849 (= tp!72028 b_and!32573)))

(declare-fun b!1023847 () Bool)

(declare-fun e!577017 () Bool)

(assert (=> b!1023847 (= e!577017 (not true))))

(declare-fun lt!450528 () Bool)

(declare-datatypes ((V!36941 0))(
  ( (V!36942 (val!12076 Int)) )
))
(declare-datatypes ((ValueCell!11322 0))(
  ( (ValueCellFull!11322 (v!14645 V!36941)) (EmptyCell!11322) )
))
(declare-datatypes ((array!64146 0))(
  ( (array!64147 (arr!30885 (Array (_ BitVec 32) (_ BitVec 64))) (size!31396 (_ BitVec 32))) )
))
(declare-datatypes ((array!64148 0))(
  ( (array!64149 (arr!30886 (Array (_ BitVec 32) ValueCell!11322)) (size!31397 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5238 0))(
  ( (LongMapFixedSize!5239 (defaultEntry!5971 Int) (mask!29604 (_ BitVec 32)) (extraKeys!5703 (_ BitVec 32)) (zeroValue!5807 V!36941) (minValue!5807 V!36941) (_size!2674 (_ BitVec 32)) (_keys!11116 array!64146) (_values!5994 array!64148) (_vacant!2674 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5238)

(declare-fun lt!450527 () V!36941)

(declare-fun valid!1996 (LongMapFixedSize!5238) Bool)

(assert (=> b!1023847 (= lt!450528 (valid!1996 (LongMapFixedSize!5239 (defaultEntry!5971 thiss!1427) (mask!29604 thiss!1427) (bvand (extraKeys!5703 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5807 thiss!1427) lt!450527 (_size!2674 thiss!1427) (_keys!11116 thiss!1427) (_values!5994 thiss!1427) (_vacant!2674 thiss!1427))))))

(declare-datatypes ((tuple2!15524 0))(
  ( (tuple2!15525 (_1!7773 (_ BitVec 64)) (_2!7773 V!36941)) )
))
(declare-datatypes ((List!21723 0))(
  ( (Nil!21720) (Cons!21719 (h!22917 tuple2!15524) (t!30783 List!21723)) )
))
(declare-datatypes ((ListLongMap!13665 0))(
  ( (ListLongMap!13666 (toList!6848 List!21723)) )
))
(declare-fun -!475 (ListLongMap!13665 (_ BitVec 64)) ListLongMap!13665)

(declare-fun getCurrentListMap!3896 (array!64146 array!64148 (_ BitVec 32) (_ BitVec 32) V!36941 V!36941 (_ BitVec 32) Int) ListLongMap!13665)

(assert (=> b!1023847 (= (-!475 (getCurrentListMap!3896 (_keys!11116 thiss!1427) (_values!5994 thiss!1427) (mask!29604 thiss!1427) (extraKeys!5703 thiss!1427) (zeroValue!5807 thiss!1427) (minValue!5807 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5971 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3896 (_keys!11116 thiss!1427) (_values!5994 thiss!1427) (mask!29604 thiss!1427) (bvand (extraKeys!5703 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5807 thiss!1427) lt!450527 #b00000000000000000000000000000000 (defaultEntry!5971 thiss!1427)))))

(declare-datatypes ((Unit!33339 0))(
  ( (Unit!33340) )
))
(declare-fun lt!450526 () Unit!33339)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!7 (array!64146 array!64148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36941 V!36941 V!36941 Int) Unit!33339)

(assert (=> b!1023847 (= lt!450526 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!7 (_keys!11116 thiss!1427) (_values!5994 thiss!1427) (mask!29604 thiss!1427) (extraKeys!5703 thiss!1427) (bvand (extraKeys!5703 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5807 thiss!1427) (minValue!5807 thiss!1427) lt!450527 (defaultEntry!5971 thiss!1427)))))

(declare-fun dynLambda!1945 (Int (_ BitVec 64)) V!36941)

(assert (=> b!1023847 (= lt!450527 (dynLambda!1945 (defaultEntry!5971 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1023848 () Bool)

(declare-fun e!577015 () Bool)

(declare-fun tp_is_empty!24051 () Bool)

(assert (=> b!1023848 (= e!577015 tp_is_empty!24051)))

(declare-fun res!685603 () Bool)

(assert (=> start!89290 (=> (not res!685603) (not e!577017))))

(assert (=> start!89290 (= res!685603 (valid!1996 thiss!1427))))

(assert (=> start!89290 e!577017))

(declare-fun e!577014 () Bool)

(assert (=> start!89290 e!577014))

(assert (=> start!89290 true))

(declare-fun mapIsEmpty!37494 () Bool)

(declare-fun mapRes!37494 () Bool)

(assert (=> mapIsEmpty!37494 mapRes!37494))

(declare-fun e!577013 () Bool)

(declare-fun array_inv!23929 (array!64146) Bool)

(declare-fun array_inv!23930 (array!64148) Bool)

(assert (=> b!1023849 (= e!577014 (and tp!72028 tp_is_empty!24051 (array_inv!23929 (_keys!11116 thiss!1427)) (array_inv!23930 (_values!5994 thiss!1427)) e!577013))))

(declare-fun b!1023850 () Bool)

(declare-fun e!577012 () Bool)

(assert (=> b!1023850 (= e!577012 tp_is_empty!24051)))

(declare-fun mapNonEmpty!37494 () Bool)

(declare-fun tp!72027 () Bool)

(assert (=> mapNonEmpty!37494 (= mapRes!37494 (and tp!72027 e!577012))))

(declare-fun mapRest!37494 () (Array (_ BitVec 32) ValueCell!11322))

(declare-fun mapValue!37494 () ValueCell!11322)

(declare-fun mapKey!37494 () (_ BitVec 32))

(assert (=> mapNonEmpty!37494 (= (arr!30886 (_values!5994 thiss!1427)) (store mapRest!37494 mapKey!37494 mapValue!37494))))

(declare-fun b!1023851 () Bool)

(declare-fun res!685604 () Bool)

(assert (=> b!1023851 (=> (not res!685604) (not e!577017))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023851 (= res!685604 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023852 () Bool)

(assert (=> b!1023852 (= e!577013 (and e!577015 mapRes!37494))))

(declare-fun condMapEmpty!37494 () Bool)

(declare-fun mapDefault!37494 () ValueCell!11322)

(assert (=> b!1023852 (= condMapEmpty!37494 (= (arr!30886 (_values!5994 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11322)) mapDefault!37494)))))

(assert (= (and start!89290 res!685603) b!1023851))

(assert (= (and b!1023851 res!685604) b!1023847))

(assert (= (and b!1023852 condMapEmpty!37494) mapIsEmpty!37494))

(assert (= (and b!1023852 (not condMapEmpty!37494)) mapNonEmpty!37494))

(get-info :version)

(assert (= (and mapNonEmpty!37494 ((_ is ValueCellFull!11322) mapValue!37494)) b!1023850))

(assert (= (and b!1023852 ((_ is ValueCellFull!11322) mapDefault!37494)) b!1023848))

(assert (= b!1023849 b!1023852))

(assert (= start!89290 b!1023849))

(declare-fun b_lambda!15715 () Bool)

(assert (=> (not b_lambda!15715) (not b!1023847)))

(declare-fun t!30782 () Bool)

(declare-fun tb!6883 () Bool)

(assert (=> (and b!1023849 (= (defaultEntry!5971 thiss!1427) (defaultEntry!5971 thiss!1427)) t!30782) tb!6883))

(declare-fun result!14075 () Bool)

(assert (=> tb!6883 (= result!14075 tp_is_empty!24051)))

(assert (=> b!1023847 t!30782))

(declare-fun b_and!32575 () Bool)

(assert (= b_and!32573 (and (=> t!30782 result!14075) b_and!32575)))

(declare-fun m!942433 () Bool)

(assert (=> b!1023847 m!942433))

(declare-fun m!942435 () Bool)

(assert (=> b!1023847 m!942435))

(declare-fun m!942437 () Bool)

(assert (=> b!1023847 m!942437))

(declare-fun m!942439 () Bool)

(assert (=> b!1023847 m!942439))

(declare-fun m!942441 () Bool)

(assert (=> b!1023847 m!942441))

(assert (=> b!1023847 m!942435))

(declare-fun m!942443 () Bool)

(assert (=> b!1023847 m!942443))

(declare-fun m!942445 () Bool)

(assert (=> start!89290 m!942445))

(declare-fun m!942447 () Bool)

(assert (=> b!1023849 m!942447))

(declare-fun m!942449 () Bool)

(assert (=> b!1023849 m!942449))

(declare-fun m!942451 () Bool)

(assert (=> mapNonEmpty!37494 m!942451))

(check-sat (not b_next!20331) (not b!1023847) (not start!89290) (not b!1023849) (not b_lambda!15715) (not mapNonEmpty!37494) b_and!32575 tp_is_empty!24051)
(check-sat b_and!32575 (not b_next!20331))
