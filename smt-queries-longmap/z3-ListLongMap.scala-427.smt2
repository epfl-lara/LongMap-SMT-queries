; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7974 () Bool)

(assert start!7974)

(declare-fun b!49865 () Bool)

(declare-fun b_free!1519 () Bool)

(declare-fun b_next!1519 () Bool)

(assert (=> b!49865 (= b_free!1519 (not b_next!1519))))

(declare-fun tp!6602 () Bool)

(declare-fun b_and!2731 () Bool)

(assert (=> b!49865 (= tp!6602 b_and!2731)))

(declare-fun mapIsEmpty!2144 () Bool)

(declare-fun mapRes!2144 () Bool)

(assert (=> mapIsEmpty!2144 mapRes!2144))

(declare-fun e!32141 () Bool)

(declare-fun e!32142 () Bool)

(declare-datatypes ((array!3235 0))(
  ( (array!3236 (arr!1546 (Array (_ BitVec 32) (_ BitVec 64))) (size!1769 (_ BitVec 32))) )
))
(declare-datatypes ((V!2545 0))(
  ( (V!2546 (val!1131 Int)) )
))
(declare-datatypes ((ValueCell!743 0))(
  ( (ValueCellFull!743 (v!2148 V!2545)) (EmptyCell!743) )
))
(declare-datatypes ((array!3237 0))(
  ( (array!3238 (arr!1547 (Array (_ BitVec 32) ValueCell!743)) (size!1770 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!394 0))(
  ( (LongMapFixedSize!395 (defaultEntry!1911 Int) (mask!5690 (_ BitVec 32)) (extraKeys!1802 (_ BitVec 32)) (zeroValue!1829 V!2545) (minValue!1829 V!2545) (_size!246 (_ BitVec 32)) (_keys!3516 array!3235) (_values!1894 array!3237) (_vacant!246 (_ BitVec 32))) )
))
(declare-fun thiss!1134 () LongMapFixedSize!394)

(declare-fun tp_is_empty!2173 () Bool)

(declare-fun array_inv!945 (array!3235) Bool)

(declare-fun array_inv!946 (array!3237) Bool)

(assert (=> b!49865 (= e!32141 (and tp!6602 tp_is_empty!2173 (array_inv!945 (_keys!3516 thiss!1134)) (array_inv!946 (_values!1894 thiss!1134)) e!32142))))

(declare-fun lt!20989 () Bool)

(declare-fun valid!137 (LongMapFixedSize!394) Bool)

(assert (=> start!7974 (= lt!20989 (valid!137 thiss!1134))))

(assert (=> start!7974 false))

(assert (=> start!7974 e!32141))

(declare-fun b!49866 () Bool)

(declare-fun e!32140 () Bool)

(assert (=> b!49866 (= e!32140 tp_is_empty!2173)))

(declare-fun mapNonEmpty!2144 () Bool)

(declare-fun tp!6601 () Bool)

(declare-fun e!32139 () Bool)

(assert (=> mapNonEmpty!2144 (= mapRes!2144 (and tp!6601 e!32139))))

(declare-fun mapKey!2144 () (_ BitVec 32))

(declare-fun mapValue!2144 () ValueCell!743)

(declare-fun mapRest!2144 () (Array (_ BitVec 32) ValueCell!743))

(assert (=> mapNonEmpty!2144 (= (arr!1547 (_values!1894 thiss!1134)) (store mapRest!2144 mapKey!2144 mapValue!2144))))

(declare-fun b!49867 () Bool)

(assert (=> b!49867 (= e!32139 tp_is_empty!2173)))

(declare-fun b!49868 () Bool)

(assert (=> b!49868 (= e!32142 (and e!32140 mapRes!2144))))

(declare-fun condMapEmpty!2144 () Bool)

(declare-fun mapDefault!2144 () ValueCell!743)

(assert (=> b!49868 (= condMapEmpty!2144 (= (arr!1547 (_values!1894 thiss!1134)) ((as const (Array (_ BitVec 32) ValueCell!743)) mapDefault!2144)))))

(assert (= (and b!49868 condMapEmpty!2144) mapIsEmpty!2144))

(assert (= (and b!49868 (not condMapEmpty!2144)) mapNonEmpty!2144))

(get-info :version)

(assert (= (and mapNonEmpty!2144 ((_ is ValueCellFull!743) mapValue!2144)) b!49867))

(assert (= (and b!49868 ((_ is ValueCellFull!743) mapDefault!2144)) b!49866))

(assert (= b!49865 b!49868))

(assert (= start!7974 b!49865))

(declare-fun m!43337 () Bool)

(assert (=> b!49865 m!43337))

(declare-fun m!43339 () Bool)

(assert (=> b!49865 m!43339))

(declare-fun m!43341 () Bool)

(assert (=> start!7974 m!43341))

(declare-fun m!43343 () Bool)

(assert (=> mapNonEmpty!2144 m!43343))

(check-sat b_and!2731 (not start!7974) (not mapNonEmpty!2144) (not b_next!1519) (not b!49865) tp_is_empty!2173)
(check-sat b_and!2731 (not b_next!1519))
