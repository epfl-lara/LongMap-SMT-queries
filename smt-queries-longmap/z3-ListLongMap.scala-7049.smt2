; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89572 () Bool)

(assert start!89572)

(declare-fun b!1025466 () Bool)

(declare-fun b_free!20347 () Bool)

(declare-fun b_next!20347 () Bool)

(assert (=> b!1025466 (= b_free!20347 (not b_next!20347))))

(declare-fun tp!72083 () Bool)

(declare-fun b_and!32603 () Bool)

(assert (=> b!1025466 (= tp!72083 b_and!32603)))

(declare-fun b!1025463 () Bool)

(declare-fun res!686249 () Bool)

(declare-fun e!578085 () Bool)

(assert (=> b!1025463 (=> (not res!686249) (not e!578085))))

(declare-datatypes ((V!36963 0))(
  ( (V!36964 (val!12084 Int)) )
))
(declare-datatypes ((ValueCell!11330 0))(
  ( (ValueCellFull!11330 (v!14649 V!36963)) (EmptyCell!11330) )
))
(declare-datatypes ((array!64231 0))(
  ( (array!64232 (arr!30919 (Array (_ BitVec 32) (_ BitVec 64))) (size!31433 (_ BitVec 32))) )
))
(declare-datatypes ((array!64233 0))(
  ( (array!64234 (arr!30920 (Array (_ BitVec 32) ValueCell!11330)) (size!31434 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5254 0))(
  ( (LongMapFixedSize!5255 (defaultEntry!5979 Int) (mask!29682 (_ BitVec 32)) (extraKeys!5711 (_ BitVec 32)) (zeroValue!5815 V!36963) (minValue!5815 V!36963) (_size!2682 (_ BitVec 32)) (_keys!11164 array!64231) (_values!6002 array!64233) (_vacant!2682 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5254)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025463 (= res!686249 (validMask!0 (mask!29682 thiss!1427)))))

(declare-fun b!1025464 () Bool)

(declare-fun e!578083 () Bool)

(declare-fun e!578081 () Bool)

(declare-fun mapRes!37526 () Bool)

(assert (=> b!1025464 (= e!578083 (and e!578081 mapRes!37526))))

(declare-fun condMapEmpty!37526 () Bool)

(declare-fun mapDefault!37526 () ValueCell!11330)

(assert (=> b!1025464 (= condMapEmpty!37526 (= (arr!30920 (_values!6002 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11330)) mapDefault!37526)))))

(declare-fun b!1025465 () Bool)

(declare-fun res!686246 () Bool)

(assert (=> b!1025465 (=> (not res!686246) (not e!578085))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025465 (= res!686246 (not (= key!909 (bvneg key!909))))))

(declare-fun e!578086 () Bool)

(declare-fun tp_is_empty!24067 () Bool)

(declare-fun array_inv!23969 (array!64231) Bool)

(declare-fun array_inv!23970 (array!64233) Bool)

(assert (=> b!1025466 (= e!578086 (and tp!72083 tp_is_empty!24067 (array_inv!23969 (_keys!11164 thiss!1427)) (array_inv!23970 (_values!6002 thiss!1427)) e!578083))))

(declare-fun res!686247 () Bool)

(assert (=> start!89572 (=> (not res!686247) (not e!578085))))

(declare-fun valid!2007 (LongMapFixedSize!5254) Bool)

(assert (=> start!89572 (= res!686247 (valid!2007 thiss!1427))))

(assert (=> start!89572 e!578085))

(assert (=> start!89572 e!578086))

(assert (=> start!89572 true))

(declare-fun b!1025467 () Bool)

(declare-fun e!578082 () Bool)

(assert (=> b!1025467 (= e!578082 tp_is_empty!24067)))

(declare-fun mapIsEmpty!37526 () Bool)

(assert (=> mapIsEmpty!37526 mapRes!37526))

(declare-fun b!1025468 () Bool)

(assert (=> b!1025468 (= e!578081 tp_is_empty!24067)))

(declare-fun mapNonEmpty!37526 () Bool)

(declare-fun tp!72084 () Bool)

(assert (=> mapNonEmpty!37526 (= mapRes!37526 (and tp!72084 e!578082))))

(declare-fun mapKey!37526 () (_ BitVec 32))

(declare-fun mapValue!37526 () ValueCell!11330)

(declare-fun mapRest!37526 () (Array (_ BitVec 32) ValueCell!11330))

(assert (=> mapNonEmpty!37526 (= (arr!30920 (_values!6002 thiss!1427)) (store mapRest!37526 mapKey!37526 mapValue!37526))))

(declare-fun b!1025469 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025469 (= e!578085 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1025470 () Bool)

(declare-fun res!686248 () Bool)

(assert (=> b!1025470 (=> (not res!686248) (not e!578085))))

(assert (=> b!1025470 (= res!686248 (= (size!31433 (_keys!11164 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29682 thiss!1427))))))

(assert (= (and start!89572 res!686247) b!1025465))

(assert (= (and b!1025465 res!686246) b!1025463))

(assert (= (and b!1025463 res!686249) b!1025470))

(assert (= (and b!1025470 res!686248) b!1025469))

(assert (= (and b!1025464 condMapEmpty!37526) mapIsEmpty!37526))

(assert (= (and b!1025464 (not condMapEmpty!37526)) mapNonEmpty!37526))

(get-info :version)

(assert (= (and mapNonEmpty!37526 ((_ is ValueCellFull!11330) mapValue!37526)) b!1025467))

(assert (= (and b!1025464 ((_ is ValueCellFull!11330) mapDefault!37526)) b!1025468))

(assert (= b!1025466 b!1025464))

(assert (= start!89572 b!1025466))

(declare-fun m!944261 () Bool)

(assert (=> b!1025463 m!944261))

(declare-fun m!944263 () Bool)

(assert (=> b!1025469 m!944263))

(declare-fun m!944265 () Bool)

(assert (=> b!1025466 m!944265))

(declare-fun m!944267 () Bool)

(assert (=> b!1025466 m!944267))

(declare-fun m!944269 () Bool)

(assert (=> start!89572 m!944269))

(declare-fun m!944271 () Bool)

(assert (=> mapNonEmpty!37526 m!944271))

(check-sat (not b!1025463) (not b!1025466) (not b!1025469) (not start!89572) (not mapNonEmpty!37526) tp_is_empty!24067 b_and!32603 (not b_next!20347))
(check-sat b_and!32603 (not b_next!20347))
(get-model)

(declare-fun d!123085 () Bool)

(assert (=> d!123085 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1025469 d!123085))

(declare-fun d!123087 () Bool)

(assert (=> d!123087 (= (array_inv!23969 (_keys!11164 thiss!1427)) (bvsge (size!31433 (_keys!11164 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1025466 d!123087))

(declare-fun d!123089 () Bool)

(assert (=> d!123089 (= (array_inv!23970 (_values!6002 thiss!1427)) (bvsge (size!31434 (_values!6002 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1025466 d!123089))

(declare-fun d!123091 () Bool)

(declare-fun res!686280 () Bool)

(declare-fun e!578125 () Bool)

(assert (=> d!123091 (=> (not res!686280) (not e!578125))))

(declare-fun simpleValid!389 (LongMapFixedSize!5254) Bool)

(assert (=> d!123091 (= res!686280 (simpleValid!389 thiss!1427))))

(assert (=> d!123091 (= (valid!2007 thiss!1427) e!578125)))

(declare-fun b!1025525 () Bool)

(declare-fun res!686281 () Bool)

(assert (=> b!1025525 (=> (not res!686281) (not e!578125))))

(declare-fun arrayCountValidKeys!0 (array!64231 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025525 (= res!686281 (= (arrayCountValidKeys!0 (_keys!11164 thiss!1427) #b00000000000000000000000000000000 (size!31433 (_keys!11164 thiss!1427))) (_size!2682 thiss!1427)))))

(declare-fun b!1025526 () Bool)

(declare-fun res!686282 () Bool)

(assert (=> b!1025526 (=> (not res!686282) (not e!578125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64231 (_ BitVec 32)) Bool)

(assert (=> b!1025526 (= res!686282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11164 thiss!1427) (mask!29682 thiss!1427)))))

(declare-fun b!1025527 () Bool)

(declare-datatypes ((List!21711 0))(
  ( (Nil!21708) (Cons!21707 (h!22914 (_ BitVec 64)) (t!30765 List!21711)) )
))
(declare-fun arrayNoDuplicates!0 (array!64231 (_ BitVec 32) List!21711) Bool)

(assert (=> b!1025527 (= e!578125 (arrayNoDuplicates!0 (_keys!11164 thiss!1427) #b00000000000000000000000000000000 Nil!21708))))

(assert (= (and d!123091 res!686280) b!1025525))

(assert (= (and b!1025525 res!686281) b!1025526))

(assert (= (and b!1025526 res!686282) b!1025527))

(declare-fun m!944297 () Bool)

(assert (=> d!123091 m!944297))

(declare-fun m!944299 () Bool)

(assert (=> b!1025525 m!944299))

(declare-fun m!944301 () Bool)

(assert (=> b!1025526 m!944301))

(declare-fun m!944303 () Bool)

(assert (=> b!1025527 m!944303))

(assert (=> start!89572 d!123091))

(declare-fun d!123093 () Bool)

(assert (=> d!123093 (= (validMask!0 (mask!29682 thiss!1427)) (and (or (= (mask!29682 thiss!1427) #b00000000000000000000000000000111) (= (mask!29682 thiss!1427) #b00000000000000000000000000001111) (= (mask!29682 thiss!1427) #b00000000000000000000000000011111) (= (mask!29682 thiss!1427) #b00000000000000000000000000111111) (= (mask!29682 thiss!1427) #b00000000000000000000000001111111) (= (mask!29682 thiss!1427) #b00000000000000000000000011111111) (= (mask!29682 thiss!1427) #b00000000000000000000000111111111) (= (mask!29682 thiss!1427) #b00000000000000000000001111111111) (= (mask!29682 thiss!1427) #b00000000000000000000011111111111) (= (mask!29682 thiss!1427) #b00000000000000000000111111111111) (= (mask!29682 thiss!1427) #b00000000000000000001111111111111) (= (mask!29682 thiss!1427) #b00000000000000000011111111111111) (= (mask!29682 thiss!1427) #b00000000000000000111111111111111) (= (mask!29682 thiss!1427) #b00000000000000001111111111111111) (= (mask!29682 thiss!1427) #b00000000000000011111111111111111) (= (mask!29682 thiss!1427) #b00000000000000111111111111111111) (= (mask!29682 thiss!1427) #b00000000000001111111111111111111) (= (mask!29682 thiss!1427) #b00000000000011111111111111111111) (= (mask!29682 thiss!1427) #b00000000000111111111111111111111) (= (mask!29682 thiss!1427) #b00000000001111111111111111111111) (= (mask!29682 thiss!1427) #b00000000011111111111111111111111) (= (mask!29682 thiss!1427) #b00000000111111111111111111111111) (= (mask!29682 thiss!1427) #b00000001111111111111111111111111) (= (mask!29682 thiss!1427) #b00000011111111111111111111111111) (= (mask!29682 thiss!1427) #b00000111111111111111111111111111) (= (mask!29682 thiss!1427) #b00001111111111111111111111111111) (= (mask!29682 thiss!1427) #b00011111111111111111111111111111) (= (mask!29682 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29682 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1025463 d!123093))

(declare-fun mapIsEmpty!37535 () Bool)

(declare-fun mapRes!37535 () Bool)

(assert (=> mapIsEmpty!37535 mapRes!37535))

(declare-fun b!1025535 () Bool)

(declare-fun e!578130 () Bool)

(assert (=> b!1025535 (= e!578130 tp_is_empty!24067)))

(declare-fun mapNonEmpty!37535 () Bool)

(declare-fun tp!72099 () Bool)

(declare-fun e!578131 () Bool)

(assert (=> mapNonEmpty!37535 (= mapRes!37535 (and tp!72099 e!578131))))

(declare-fun mapRest!37535 () (Array (_ BitVec 32) ValueCell!11330))

(declare-fun mapKey!37535 () (_ BitVec 32))

(declare-fun mapValue!37535 () ValueCell!11330)

(assert (=> mapNonEmpty!37535 (= mapRest!37526 (store mapRest!37535 mapKey!37535 mapValue!37535))))

(declare-fun condMapEmpty!37535 () Bool)

(declare-fun mapDefault!37535 () ValueCell!11330)

(assert (=> mapNonEmpty!37526 (= condMapEmpty!37535 (= mapRest!37526 ((as const (Array (_ BitVec 32) ValueCell!11330)) mapDefault!37535)))))

(assert (=> mapNonEmpty!37526 (= tp!72084 (and e!578130 mapRes!37535))))

(declare-fun b!1025534 () Bool)

(assert (=> b!1025534 (= e!578131 tp_is_empty!24067)))

(assert (= (and mapNonEmpty!37526 condMapEmpty!37535) mapIsEmpty!37535))

(assert (= (and mapNonEmpty!37526 (not condMapEmpty!37535)) mapNonEmpty!37535))

(assert (= (and mapNonEmpty!37535 ((_ is ValueCellFull!11330) mapValue!37535)) b!1025534))

(assert (= (and mapNonEmpty!37526 ((_ is ValueCellFull!11330) mapDefault!37535)) b!1025535))

(declare-fun m!944305 () Bool)

(assert (=> mapNonEmpty!37535 m!944305))

(check-sat (not b!1025527) (not b!1025526) (not b!1025525) tp_is_empty!24067 b_and!32603 (not b_next!20347) (not mapNonEmpty!37535) (not d!123091))
(check-sat b_and!32603 (not b_next!20347))
