; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89090 () Bool)

(assert start!89090)

(declare-fun b!1021408 () Bool)

(declare-fun b_free!20139 () Bool)

(declare-fun b_next!20139 () Bool)

(assert (=> b!1021408 (= b_free!20139 (not b_next!20139))))

(declare-fun tp!71448 () Bool)

(declare-fun b_and!32337 () Bool)

(assert (=> b!1021408 (= tp!71448 b_and!32337)))

(declare-fun b!1021406 () Bool)

(declare-fun e!575271 () Bool)

(declare-fun e!575267 () Bool)

(assert (=> b!1021406 (= e!575271 e!575267)))

(declare-fun b!1021407 () Bool)

(declare-fun e!575268 () Bool)

(declare-fun e!575272 () Bool)

(declare-fun mapRes!37203 () Bool)

(assert (=> b!1021407 (= e!575268 (and e!575272 mapRes!37203))))

(declare-fun condMapEmpty!37203 () Bool)

(declare-datatypes ((array!63760 0))(
  ( (array!63761 (arr!30693 (Array (_ BitVec 32) (_ BitVec 64))) (size!31204 (_ BitVec 32))) )
))
(declare-datatypes ((V!36685 0))(
  ( (V!36686 (val!11980 Int)) )
))
(declare-datatypes ((ValueCell!11226 0))(
  ( (ValueCellFull!11226 (v!14547 V!36685)) (EmptyCell!11226) )
))
(declare-datatypes ((array!63762 0))(
  ( (array!63763 (arr!30694 (Array (_ BitVec 32) ValueCell!11226)) (size!31205 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5046 0))(
  ( (LongMapFixedSize!5047 (defaultEntry!5875 Int) (mask!29444 (_ BitVec 32)) (extraKeys!5607 (_ BitVec 32)) (zeroValue!5711 V!36685) (minValue!5711 V!36685) (_size!2578 (_ BitVec 32)) (_keys!11020 array!63760) (_values!5898 array!63762) (_vacant!2578 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1120 0))(
  ( (Cell!1121 (v!14548 LongMapFixedSize!5046)) )
))
(declare-datatypes ((LongMap!1120 0))(
  ( (LongMap!1121 (underlying!571 Cell!1120)) )
))
(declare-fun thiss!1120 () LongMap!1120)

(declare-fun mapDefault!37203 () ValueCell!11226)

(assert (=> b!1021407 (= condMapEmpty!37203 (= (arr!30694 (_values!5898 (v!14548 (underlying!571 thiss!1120)))) ((as const (Array (_ BitVec 32) ValueCell!11226)) mapDefault!37203)))))

(declare-fun mapIsEmpty!37203 () Bool)

(assert (=> mapIsEmpty!37203 mapRes!37203))

(declare-fun b!1021409 () Bool)

(declare-fun e!575273 () Bool)

(assert (=> b!1021409 (= e!575267 e!575273)))

(declare-fun b!1021410 () Bool)

(declare-fun e!575270 () Bool)

(declare-fun valid!1923 (LongMapFixedSize!5046) Bool)

(assert (=> b!1021410 (= e!575270 (not (valid!1923 (v!14548 (underlying!571 thiss!1120)))))))

(declare-fun b!1021411 () Bool)

(declare-fun tp_is_empty!23859 () Bool)

(assert (=> b!1021411 (= e!575272 tp_is_empty!23859)))

(declare-fun mapNonEmpty!37203 () Bool)

(declare-fun tp!71449 () Bool)

(declare-fun e!575269 () Bool)

(assert (=> mapNonEmpty!37203 (= mapRes!37203 (and tp!71449 e!575269))))

(declare-fun mapRest!37203 () (Array (_ BitVec 32) ValueCell!11226))

(declare-fun mapValue!37203 () ValueCell!11226)

(declare-fun mapKey!37203 () (_ BitVec 32))

(assert (=> mapNonEmpty!37203 (= (arr!30694 (_values!5898 (v!14548 (underlying!571 thiss!1120)))) (store mapRest!37203 mapKey!37203 mapValue!37203))))

(declare-fun b!1021412 () Bool)

(assert (=> b!1021412 (= e!575269 tp_is_empty!23859)))

(declare-fun res!684374 () Bool)

(assert (=> start!89090 (=> (not res!684374) (not e!575270))))

(declare-fun valid!1924 (LongMap!1120) Bool)

(assert (=> start!89090 (= res!684374 (valid!1924 thiss!1120))))

(assert (=> start!89090 e!575270))

(assert (=> start!89090 e!575271))

(declare-fun array_inv!23805 (array!63760) Bool)

(declare-fun array_inv!23806 (array!63762) Bool)

(assert (=> b!1021408 (= e!575273 (and tp!71448 tp_is_empty!23859 (array_inv!23805 (_keys!11020 (v!14548 (underlying!571 thiss!1120)))) (array_inv!23806 (_values!5898 (v!14548 (underlying!571 thiss!1120)))) e!575268))))

(assert (= (and start!89090 res!684374) b!1021410))

(assert (= (and b!1021407 condMapEmpty!37203) mapIsEmpty!37203))

(assert (= (and b!1021407 (not condMapEmpty!37203)) mapNonEmpty!37203))

(get-info :version)

(assert (= (and mapNonEmpty!37203 ((_ is ValueCellFull!11226) mapValue!37203)) b!1021412))

(assert (= (and b!1021407 ((_ is ValueCellFull!11226) mapDefault!37203)) b!1021411))

(assert (= b!1021408 b!1021407))

(assert (= b!1021409 b!1021408))

(assert (= b!1021406 b!1021409))

(assert (= start!89090 b!1021406))

(declare-fun m!940955 () Bool)

(assert (=> b!1021410 m!940955))

(declare-fun m!940957 () Bool)

(assert (=> mapNonEmpty!37203 m!940957))

(declare-fun m!940959 () Bool)

(assert (=> start!89090 m!940959))

(declare-fun m!940961 () Bool)

(assert (=> b!1021408 m!940961))

(declare-fun m!940963 () Bool)

(assert (=> b!1021408 m!940963))

(check-sat (not mapNonEmpty!37203) (not start!89090) (not b!1021408) (not b!1021410) tp_is_empty!23859 b_and!32337 (not b_next!20139))
(check-sat b_and!32337 (not b_next!20139))
(get-model)

(declare-fun d!122513 () Bool)

(assert (=> d!122513 (= (array_inv!23805 (_keys!11020 (v!14548 (underlying!571 thiss!1120)))) (bvsge (size!31204 (_keys!11020 (v!14548 (underlying!571 thiss!1120)))) #b00000000000000000000000000000000))))

(assert (=> b!1021408 d!122513))

(declare-fun d!122515 () Bool)

(assert (=> d!122515 (= (array_inv!23806 (_values!5898 (v!14548 (underlying!571 thiss!1120)))) (bvsge (size!31205 (_values!5898 (v!14548 (underlying!571 thiss!1120)))) #b00000000000000000000000000000000))))

(assert (=> b!1021408 d!122515))

(declare-fun d!122517 () Bool)

(declare-fun res!684384 () Bool)

(declare-fun e!575301 () Bool)

(assert (=> d!122517 (=> (not res!684384) (not e!575301))))

(declare-fun simpleValid!386 (LongMapFixedSize!5046) Bool)

(assert (=> d!122517 (= res!684384 (simpleValid!386 (v!14548 (underlying!571 thiss!1120))))))

(assert (=> d!122517 (= (valid!1923 (v!14548 (underlying!571 thiss!1120))) e!575301)))

(declare-fun b!1021440 () Bool)

(declare-fun res!684385 () Bool)

(assert (=> b!1021440 (=> (not res!684385) (not e!575301))))

(declare-fun arrayCountValidKeys!0 (array!63760 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1021440 (= res!684385 (= (arrayCountValidKeys!0 (_keys!11020 (v!14548 (underlying!571 thiss!1120))) #b00000000000000000000000000000000 (size!31204 (_keys!11020 (v!14548 (underlying!571 thiss!1120))))) (_size!2578 (v!14548 (underlying!571 thiss!1120)))))))

(declare-fun b!1021441 () Bool)

(declare-fun res!684386 () Bool)

(assert (=> b!1021441 (=> (not res!684386) (not e!575301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63760 (_ BitVec 32)) Bool)

(assert (=> b!1021441 (= res!684386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11020 (v!14548 (underlying!571 thiss!1120))) (mask!29444 (v!14548 (underlying!571 thiss!1120)))))))

(declare-fun b!1021442 () Bool)

(declare-datatypes ((List!21654 0))(
  ( (Nil!21651) (Cons!21650 (h!22848 (_ BitVec 64)) (t!30668 List!21654)) )
))
(declare-fun arrayNoDuplicates!0 (array!63760 (_ BitVec 32) List!21654) Bool)

(assert (=> b!1021442 (= e!575301 (arrayNoDuplicates!0 (_keys!11020 (v!14548 (underlying!571 thiss!1120))) #b00000000000000000000000000000000 Nil!21651))))

(assert (= (and d!122517 res!684384) b!1021440))

(assert (= (and b!1021440 res!684385) b!1021441))

(assert (= (and b!1021441 res!684386) b!1021442))

(declare-fun m!940975 () Bool)

(assert (=> d!122517 m!940975))

(declare-fun m!940977 () Bool)

(assert (=> b!1021440 m!940977))

(declare-fun m!940979 () Bool)

(assert (=> b!1021441 m!940979))

(declare-fun m!940981 () Bool)

(assert (=> b!1021442 m!940981))

(assert (=> b!1021410 d!122517))

(declare-fun d!122519 () Bool)

(assert (=> d!122519 (= (valid!1924 thiss!1120) (valid!1923 (v!14548 (underlying!571 thiss!1120))))))

(declare-fun bs!29773 () Bool)

(assert (= bs!29773 d!122519))

(assert (=> bs!29773 m!940955))

(assert (=> start!89090 d!122519))

(declare-fun condMapEmpty!37209 () Bool)

(declare-fun mapDefault!37209 () ValueCell!11226)

(assert (=> mapNonEmpty!37203 (= condMapEmpty!37209 (= mapRest!37203 ((as const (Array (_ BitVec 32) ValueCell!11226)) mapDefault!37209)))))

(declare-fun e!575307 () Bool)

(declare-fun mapRes!37209 () Bool)

(assert (=> mapNonEmpty!37203 (= tp!71449 (and e!575307 mapRes!37209))))

(declare-fun mapIsEmpty!37209 () Bool)

(assert (=> mapIsEmpty!37209 mapRes!37209))

(declare-fun mapNonEmpty!37209 () Bool)

(declare-fun tp!71458 () Bool)

(declare-fun e!575306 () Bool)

(assert (=> mapNonEmpty!37209 (= mapRes!37209 (and tp!71458 e!575306))))

(declare-fun mapValue!37209 () ValueCell!11226)

(declare-fun mapKey!37209 () (_ BitVec 32))

(declare-fun mapRest!37209 () (Array (_ BitVec 32) ValueCell!11226))

(assert (=> mapNonEmpty!37209 (= mapRest!37203 (store mapRest!37209 mapKey!37209 mapValue!37209))))

(declare-fun b!1021449 () Bool)

(assert (=> b!1021449 (= e!575306 tp_is_empty!23859)))

(declare-fun b!1021450 () Bool)

(assert (=> b!1021450 (= e!575307 tp_is_empty!23859)))

(assert (= (and mapNonEmpty!37203 condMapEmpty!37209) mapIsEmpty!37209))

(assert (= (and mapNonEmpty!37203 (not condMapEmpty!37209)) mapNonEmpty!37209))

(assert (= (and mapNonEmpty!37209 ((_ is ValueCellFull!11226) mapValue!37209)) b!1021449))

(assert (= (and mapNonEmpty!37203 ((_ is ValueCellFull!11226) mapDefault!37209)) b!1021450))

(declare-fun m!940983 () Bool)

(assert (=> mapNonEmpty!37209 m!940983))

(check-sat (not mapNonEmpty!37209) (not d!122519) (not b!1021441) tp_is_empty!23859 (not d!122517) (not b!1021442) (not b!1021440) b_and!32337 (not b_next!20139))
(check-sat b_and!32337 (not b_next!20139))
