; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7974 () Bool)

(assert start!7974)

(declare-fun b!49875 () Bool)

(declare-fun b_free!1519 () Bool)

(declare-fun b_next!1519 () Bool)

(assert (=> b!49875 (= b_free!1519 (not b_next!1519))))

(declare-fun tp!6602 () Bool)

(declare-fun b_and!2727 () Bool)

(assert (=> b!49875 (= tp!6602 b_and!2727)))

(declare-fun b!49874 () Bool)

(declare-fun e!32144 () Bool)

(declare-fun tp_is_empty!2173 () Bool)

(assert (=> b!49874 (= e!32144 tp_is_empty!2173)))

(declare-fun mapNonEmpty!2144 () Bool)

(declare-fun mapRes!2144 () Bool)

(declare-fun tp!6601 () Bool)

(assert (=> mapNonEmpty!2144 (= mapRes!2144 (and tp!6601 e!32144))))

(declare-datatypes ((V!2545 0))(
  ( (V!2546 (val!1131 Int)) )
))
(declare-datatypes ((ValueCell!743 0))(
  ( (ValueCellFull!743 (v!2151 V!2545)) (EmptyCell!743) )
))
(declare-fun mapValue!2144 () ValueCell!743)

(declare-fun mapRest!2144 () (Array (_ BitVec 32) ValueCell!743))

(declare-datatypes ((array!3241 0))(
  ( (array!3242 (arr!1550 (Array (_ BitVec 32) (_ BitVec 64))) (size!1772 (_ BitVec 32))) )
))
(declare-datatypes ((array!3243 0))(
  ( (array!3244 (arr!1551 (Array (_ BitVec 32) ValueCell!743)) (size!1773 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!394 0))(
  ( (LongMapFixedSize!395 (defaultEntry!1911 Int) (mask!5691 (_ BitVec 32)) (extraKeys!1802 (_ BitVec 32)) (zeroValue!1829 V!2545) (minValue!1829 V!2545) (_size!246 (_ BitVec 32)) (_keys!3517 array!3241) (_values!1894 array!3243) (_vacant!246 (_ BitVec 32))) )
))
(declare-fun thiss!1134 () LongMapFixedSize!394)

(declare-fun mapKey!2144 () (_ BitVec 32))

(assert (=> mapNonEmpty!2144 (= (arr!1551 (_values!1894 thiss!1134)) (store mapRest!2144 mapKey!2144 mapValue!2144))))

(declare-fun mapIsEmpty!2144 () Bool)

(assert (=> mapIsEmpty!2144 mapRes!2144))

(declare-fun b!49876 () Bool)

(declare-fun e!32148 () Bool)

(assert (=> b!49876 (= e!32148 tp_is_empty!2173)))

(declare-fun b!49877 () Bool)

(declare-fun e!32146 () Bool)

(assert (=> b!49877 (= e!32146 (and e!32148 mapRes!2144))))

(declare-fun condMapEmpty!2144 () Bool)

(declare-fun mapDefault!2144 () ValueCell!743)

(assert (=> b!49877 (= condMapEmpty!2144 (= (arr!1551 (_values!1894 thiss!1134)) ((as const (Array (_ BitVec 32) ValueCell!743)) mapDefault!2144)))))

(declare-fun e!32147 () Bool)

(declare-fun array_inv!935 (array!3241) Bool)

(declare-fun array_inv!936 (array!3243) Bool)

(assert (=> b!49875 (= e!32147 (and tp!6602 tp_is_empty!2173 (array_inv!935 (_keys!3517 thiss!1134)) (array_inv!936 (_values!1894 thiss!1134)) e!32146))))

(declare-fun lt!20962 () Bool)

(declare-fun valid!141 (LongMapFixedSize!394) Bool)

(assert (=> start!7974 (= lt!20962 (valid!141 thiss!1134))))

(assert (=> start!7974 false))

(assert (=> start!7974 e!32147))

(assert (= (and b!49877 condMapEmpty!2144) mapIsEmpty!2144))

(assert (= (and b!49877 (not condMapEmpty!2144)) mapNonEmpty!2144))

(get-info :version)

(assert (= (and mapNonEmpty!2144 ((_ is ValueCellFull!743) mapValue!2144)) b!49874))

(assert (= (and b!49877 ((_ is ValueCellFull!743) mapDefault!2144)) b!49876))

(assert (= b!49875 b!49877))

(assert (= start!7974 b!49875))

(declare-fun m!43295 () Bool)

(assert (=> mapNonEmpty!2144 m!43295))

(declare-fun m!43297 () Bool)

(assert (=> b!49875 m!43297))

(declare-fun m!43299 () Bool)

(assert (=> b!49875 m!43299))

(declare-fun m!43301 () Bool)

(assert (=> start!7974 m!43301))

(check-sat b_and!2727 (not mapNonEmpty!2144) (not b!49875) tp_is_empty!2173 (not start!7974) (not b_next!1519))
(check-sat b_and!2727 (not b_next!1519))
