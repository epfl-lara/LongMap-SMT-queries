; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89266 () Bool)

(assert start!89266)

(declare-fun b!1022226 () Bool)

(declare-fun b_free!20101 () Bool)

(declare-fun b_next!20101 () Bool)

(assert (=> b!1022226 (= b_free!20101 (not b_next!20101))))

(declare-fun tp!71328 () Bool)

(declare-fun b_and!32299 () Bool)

(assert (=> b!1022226 (= tp!71328 b_and!32299)))

(declare-fun b!1022223 () Bool)

(declare-fun e!575603 () Bool)

(declare-datatypes ((V!36635 0))(
  ( (V!36636 (val!11961 Int)) )
))
(declare-datatypes ((array!63729 0))(
  ( (array!63730 (arr!30673 (Array (_ BitVec 32) (_ BitVec 64))) (size!31185 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11207 0))(
  ( (ValueCellFull!11207 (v!14505 V!36635)) (EmptyCell!11207) )
))
(declare-datatypes ((array!63731 0))(
  ( (array!63732 (arr!30674 (Array (_ BitVec 32) ValueCell!11207)) (size!31186 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5008 0))(
  ( (LongMapFixedSize!5009 (defaultEntry!5856 Int) (mask!29473 (_ BitVec 32)) (extraKeys!5588 (_ BitVec 32)) (zeroValue!5692 V!36635) (minValue!5692 V!36635) (_size!2559 (_ BitVec 32)) (_keys!11039 array!63729) (_values!5879 array!63731) (_vacant!2559 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1082 0))(
  ( (Cell!1083 (v!14506 LongMapFixedSize!5008)) )
))
(declare-datatypes ((LongMap!1082 0))(
  ( (LongMap!1083 (underlying!552 Cell!1082)) )
))
(declare-fun thiss!908 () LongMap!1082)

(declare-fun valid!1912 (LongMapFixedSize!5008) Bool)

(assert (=> b!1022223 (= e!575603 (not (valid!1912 (v!14506 (underlying!552 thiss!908)))))))

(declare-fun b!1022224 () Bool)

(declare-fun e!575599 () Bool)

(declare-fun tp_is_empty!23821 () Bool)

(assert (=> b!1022224 (= e!575599 tp_is_empty!23821)))

(declare-fun b!1022225 () Bool)

(declare-fun e!575600 () Bool)

(assert (=> b!1022225 (= e!575600 tp_is_empty!23821)))

(declare-fun mapIsEmpty!37140 () Bool)

(declare-fun mapRes!37140 () Bool)

(assert (=> mapIsEmpty!37140 mapRes!37140))

(declare-fun mapNonEmpty!37140 () Bool)

(declare-fun tp!71329 () Bool)

(assert (=> mapNonEmpty!37140 (= mapRes!37140 (and tp!71329 e!575599))))

(declare-fun mapRest!37140 () (Array (_ BitVec 32) ValueCell!11207))

(declare-fun mapValue!37140 () ValueCell!11207)

(declare-fun mapKey!37140 () (_ BitVec 32))

(assert (=> mapNonEmpty!37140 (= (arr!30674 (_values!5879 (v!14506 (underlying!552 thiss!908)))) (store mapRest!37140 mapKey!37140 mapValue!37140))))

(declare-fun e!575597 () Bool)

(declare-fun e!575601 () Bool)

(declare-fun array_inv!23809 (array!63729) Bool)

(declare-fun array_inv!23810 (array!63731) Bool)

(assert (=> b!1022226 (= e!575601 (and tp!71328 tp_is_empty!23821 (array_inv!23809 (_keys!11039 (v!14506 (underlying!552 thiss!908)))) (array_inv!23810 (_values!5879 (v!14506 (underlying!552 thiss!908)))) e!575597))))

(declare-fun b!1022227 () Bool)

(declare-fun e!575604 () Bool)

(assert (=> b!1022227 (= e!575604 e!575601)))

(declare-fun b!1022228 () Bool)

(declare-fun e!575598 () Bool)

(assert (=> b!1022228 (= e!575598 e!575604)))

(declare-fun b!1022229 () Bool)

(assert (=> b!1022229 (= e!575597 (and e!575600 mapRes!37140))))

(declare-fun condMapEmpty!37140 () Bool)

(declare-fun mapDefault!37140 () ValueCell!11207)

(assert (=> b!1022229 (= condMapEmpty!37140 (= (arr!30674 (_values!5879 (v!14506 (underlying!552 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11207)) mapDefault!37140)))))

(declare-fun res!684806 () Bool)

(assert (=> start!89266 (=> (not res!684806) (not e!575603))))

(declare-fun valid!1913 (LongMap!1082) Bool)

(assert (=> start!89266 (= res!684806 (valid!1913 thiss!908))))

(assert (=> start!89266 e!575603))

(assert (=> start!89266 e!575598))

(assert (= (and start!89266 res!684806) b!1022223))

(assert (= (and b!1022229 condMapEmpty!37140) mapIsEmpty!37140))

(assert (= (and b!1022229 (not condMapEmpty!37140)) mapNonEmpty!37140))

(get-info :version)

(assert (= (and mapNonEmpty!37140 ((_ is ValueCellFull!11207) mapValue!37140)) b!1022224))

(assert (= (and b!1022229 ((_ is ValueCellFull!11207) mapDefault!37140)) b!1022225))

(assert (= b!1022226 b!1022229))

(assert (= b!1022227 b!1022226))

(assert (= b!1022228 b!1022227))

(assert (= start!89266 b!1022228))

(declare-fun m!942297 () Bool)

(assert (=> b!1022223 m!942297))

(declare-fun m!942299 () Bool)

(assert (=> mapNonEmpty!37140 m!942299))

(declare-fun m!942301 () Bool)

(assert (=> b!1022226 m!942301))

(declare-fun m!942303 () Bool)

(assert (=> b!1022226 m!942303))

(declare-fun m!942305 () Bool)

(assert (=> start!89266 m!942305))

(check-sat (not start!89266) b_and!32299 (not b!1022223) tp_is_empty!23821 (not b!1022226) (not b_next!20101) (not mapNonEmpty!37140))
(check-sat b_and!32299 (not b_next!20101))
(get-model)

(declare-fun d!122939 () Bool)

(assert (=> d!122939 (= (array_inv!23809 (_keys!11039 (v!14506 (underlying!552 thiss!908)))) (bvsge (size!31185 (_keys!11039 (v!14506 (underlying!552 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1022226 d!122939))

(declare-fun d!122941 () Bool)

(assert (=> d!122941 (= (array_inv!23810 (_values!5879 (v!14506 (underlying!552 thiss!908)))) (bvsge (size!31186 (_values!5879 (v!14506 (underlying!552 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1022226 d!122941))

(declare-fun d!122943 () Bool)

(declare-fun res!684819 () Bool)

(declare-fun e!575655 () Bool)

(assert (=> d!122943 (=> (not res!684819) (not e!575655))))

(declare-fun simpleValid!385 (LongMapFixedSize!5008) Bool)

(assert (=> d!122943 (= res!684819 (simpleValid!385 (v!14506 (underlying!552 thiss!908))))))

(assert (=> d!122943 (= (valid!1912 (v!14506 (underlying!552 thiss!908))) e!575655)))

(declare-fun b!1022278 () Bool)

(declare-fun res!684820 () Bool)

(assert (=> b!1022278 (=> (not res!684820) (not e!575655))))

(declare-fun arrayCountValidKeys!0 (array!63729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1022278 (= res!684820 (= (arrayCountValidKeys!0 (_keys!11039 (v!14506 (underlying!552 thiss!908))) #b00000000000000000000000000000000 (size!31185 (_keys!11039 (v!14506 (underlying!552 thiss!908))))) (_size!2559 (v!14506 (underlying!552 thiss!908)))))))

(declare-fun b!1022279 () Bool)

(declare-fun res!684821 () Bool)

(assert (=> b!1022279 (=> (not res!684821) (not e!575655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63729 (_ BitVec 32)) Bool)

(assert (=> b!1022279 (= res!684821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11039 (v!14506 (underlying!552 thiss!908))) (mask!29473 (v!14506 (underlying!552 thiss!908)))))))

(declare-fun b!1022280 () Bool)

(declare-datatypes ((List!21638 0))(
  ( (Nil!21635) (Cons!21634 (h!22841 (_ BitVec 64)) (t!30640 List!21638)) )
))
(declare-fun arrayNoDuplicates!0 (array!63729 (_ BitVec 32) List!21638) Bool)

(assert (=> b!1022280 (= e!575655 (arrayNoDuplicates!0 (_keys!11039 (v!14506 (underlying!552 thiss!908))) #b00000000000000000000000000000000 Nil!21635))))

(assert (= (and d!122943 res!684819) b!1022278))

(assert (= (and b!1022278 res!684820) b!1022279))

(assert (= (and b!1022279 res!684821) b!1022280))

(declare-fun m!942327 () Bool)

(assert (=> d!122943 m!942327))

(declare-fun m!942329 () Bool)

(assert (=> b!1022278 m!942329))

(declare-fun m!942331 () Bool)

(assert (=> b!1022279 m!942331))

(declare-fun m!942333 () Bool)

(assert (=> b!1022280 m!942333))

(assert (=> b!1022223 d!122943))

(declare-fun d!122945 () Bool)

(assert (=> d!122945 (= (valid!1913 thiss!908) (valid!1912 (v!14506 (underlying!552 thiss!908))))))

(declare-fun bs!29769 () Bool)

(assert (= bs!29769 d!122945))

(assert (=> bs!29769 m!942297))

(assert (=> start!89266 d!122945))

(declare-fun condMapEmpty!37149 () Bool)

(declare-fun mapDefault!37149 () ValueCell!11207)

(assert (=> mapNonEmpty!37140 (= condMapEmpty!37149 (= mapRest!37140 ((as const (Array (_ BitVec 32) ValueCell!11207)) mapDefault!37149)))))

(declare-fun e!575661 () Bool)

(declare-fun mapRes!37149 () Bool)

(assert (=> mapNonEmpty!37140 (= tp!71329 (and e!575661 mapRes!37149))))

(declare-fun b!1022288 () Bool)

(assert (=> b!1022288 (= e!575661 tp_is_empty!23821)))

(declare-fun mapIsEmpty!37149 () Bool)

(assert (=> mapIsEmpty!37149 mapRes!37149))

(declare-fun mapNonEmpty!37149 () Bool)

(declare-fun tp!71344 () Bool)

(declare-fun e!575660 () Bool)

(assert (=> mapNonEmpty!37149 (= mapRes!37149 (and tp!71344 e!575660))))

(declare-fun mapKey!37149 () (_ BitVec 32))

(declare-fun mapValue!37149 () ValueCell!11207)

(declare-fun mapRest!37149 () (Array (_ BitVec 32) ValueCell!11207))

(assert (=> mapNonEmpty!37149 (= mapRest!37140 (store mapRest!37149 mapKey!37149 mapValue!37149))))

(declare-fun b!1022287 () Bool)

(assert (=> b!1022287 (= e!575660 tp_is_empty!23821)))

(assert (= (and mapNonEmpty!37140 condMapEmpty!37149) mapIsEmpty!37149))

(assert (= (and mapNonEmpty!37140 (not condMapEmpty!37149)) mapNonEmpty!37149))

(assert (= (and mapNonEmpty!37149 ((_ is ValueCellFull!11207) mapValue!37149)) b!1022287))

(assert (= (and mapNonEmpty!37140 ((_ is ValueCellFull!11207) mapDefault!37149)) b!1022288))

(declare-fun m!942335 () Bool)

(assert (=> mapNonEmpty!37149 m!942335))

(check-sat (not mapNonEmpty!37149) (not b!1022278) b_and!32299 (not d!122943) tp_is_empty!23821 (not d!122945) (not b!1022280) (not b_next!20101) (not b!1022279))
(check-sat b_and!32299 (not b_next!20101))
