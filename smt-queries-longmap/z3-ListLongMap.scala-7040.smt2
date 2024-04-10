; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89254 () Bool)

(assert start!89254)

(declare-fun b!1023445 () Bool)

(declare-fun b_free!20295 () Bool)

(declare-fun b_next!20295 () Bool)

(assert (=> b!1023445 (= b_free!20295 (not b_next!20295))))

(declare-fun tp!71920 () Bool)

(declare-fun b_and!32517 () Bool)

(assert (=> b!1023445 (= tp!71920 b_and!32517)))

(declare-fun b!1023437 () Bool)

(declare-fun res!685433 () Bool)

(declare-fun e!576690 () Bool)

(assert (=> b!1023437 (=> (not res!685433) (not e!576690))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023437 (= res!685433 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!37440 () Bool)

(declare-fun mapRes!37440 () Bool)

(assert (=> mapIsEmpty!37440 mapRes!37440))

(declare-fun b!1023438 () Bool)

(declare-fun res!685432 () Bool)

(assert (=> b!1023438 (=> (not res!685432) (not e!576690))))

(declare-datatypes ((V!36893 0))(
  ( (V!36894 (val!12058 Int)) )
))
(declare-datatypes ((ValueCell!11304 0))(
  ( (ValueCellFull!11304 (v!14627 V!36893)) (EmptyCell!11304) )
))
(declare-datatypes ((array!64074 0))(
  ( (array!64075 (arr!30849 (Array (_ BitVec 32) (_ BitVec 64))) (size!31360 (_ BitVec 32))) )
))
(declare-datatypes ((array!64076 0))(
  ( (array!64077 (arr!30850 (Array (_ BitVec 32) ValueCell!11304)) (size!31361 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5202 0))(
  ( (LongMapFixedSize!5203 (defaultEntry!5953 Int) (mask!29574 (_ BitVec 32)) (extraKeys!5685 (_ BitVec 32)) (zeroValue!5789 V!36893) (minValue!5789 V!36893) (_size!2656 (_ BitVec 32)) (_keys!11098 array!64074) (_values!5976 array!64076) (_vacant!2656 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5202)

(assert (=> b!1023438 (= res!685432 (and (= (size!31361 (_values!5976 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29574 thiss!1427))) (= (size!31360 (_keys!11098 thiss!1427)) (size!31361 (_values!5976 thiss!1427))) (bvsge (mask!29574 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5685 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5685 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5685 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5685 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5685 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5685 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5685 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37440 () Bool)

(declare-fun tp!71919 () Bool)

(declare-fun e!576688 () Bool)

(assert (=> mapNonEmpty!37440 (= mapRes!37440 (and tp!71919 e!576688))))

(declare-fun mapKey!37440 () (_ BitVec 32))

(declare-fun mapValue!37440 () ValueCell!11304)

(declare-fun mapRest!37440 () (Array (_ BitVec 32) ValueCell!11304))

(assert (=> mapNonEmpty!37440 (= (arr!30850 (_values!5976 thiss!1427)) (store mapRest!37440 mapKey!37440 mapValue!37440))))

(declare-fun b!1023439 () Bool)

(declare-fun res!685429 () Bool)

(assert (=> b!1023439 (=> (not res!685429) (not e!576690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64074 (_ BitVec 32)) Bool)

(assert (=> b!1023439 (= res!685429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11098 thiss!1427) (mask!29574 thiss!1427)))))

(declare-fun b!1023440 () Bool)

(declare-fun tp_is_empty!24015 () Bool)

(assert (=> b!1023440 (= e!576688 tp_is_empty!24015)))

(declare-fun res!685431 () Bool)

(assert (=> start!89254 (=> (not res!685431) (not e!576690))))

(declare-fun valid!1982 (LongMapFixedSize!5202) Bool)

(assert (=> start!89254 (= res!685431 (valid!1982 thiss!1427))))

(assert (=> start!89254 e!576690))

(declare-fun e!576693 () Bool)

(assert (=> start!89254 e!576693))

(assert (=> start!89254 true))

(declare-fun b!1023441 () Bool)

(assert (=> b!1023441 (= e!576690 false)))

(declare-fun lt!450408 () Bool)

(declare-datatypes ((List!21713 0))(
  ( (Nil!21710) (Cons!21709 (h!22907 (_ BitVec 64)) (t!30751 List!21713)) )
))
(declare-fun arrayNoDuplicates!0 (array!64074 (_ BitVec 32) List!21713) Bool)

(assert (=> b!1023441 (= lt!450408 (arrayNoDuplicates!0 (_keys!11098 thiss!1427) #b00000000000000000000000000000000 Nil!21710))))

(declare-fun b!1023442 () Bool)

(declare-fun res!685430 () Bool)

(assert (=> b!1023442 (=> (not res!685430) (not e!576690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023442 (= res!685430 (validMask!0 (mask!29574 thiss!1427)))))

(declare-fun b!1023443 () Bool)

(declare-fun e!576691 () Bool)

(assert (=> b!1023443 (= e!576691 tp_is_empty!24015)))

(declare-fun b!1023444 () Bool)

(declare-fun e!576692 () Bool)

(assert (=> b!1023444 (= e!576692 (and e!576691 mapRes!37440))))

(declare-fun condMapEmpty!37440 () Bool)

(declare-fun mapDefault!37440 () ValueCell!11304)

(assert (=> b!1023444 (= condMapEmpty!37440 (= (arr!30850 (_values!5976 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11304)) mapDefault!37440)))))

(declare-fun array_inv!23903 (array!64074) Bool)

(declare-fun array_inv!23904 (array!64076) Bool)

(assert (=> b!1023445 (= e!576693 (and tp!71920 tp_is_empty!24015 (array_inv!23903 (_keys!11098 thiss!1427)) (array_inv!23904 (_values!5976 thiss!1427)) e!576692))))

(assert (= (and start!89254 res!685431) b!1023437))

(assert (= (and b!1023437 res!685433) b!1023442))

(assert (= (and b!1023442 res!685430) b!1023438))

(assert (= (and b!1023438 res!685432) b!1023439))

(assert (= (and b!1023439 res!685429) b!1023441))

(assert (= (and b!1023444 condMapEmpty!37440) mapIsEmpty!37440))

(assert (= (and b!1023444 (not condMapEmpty!37440)) mapNonEmpty!37440))

(get-info :version)

(assert (= (and mapNonEmpty!37440 ((_ is ValueCellFull!11304) mapValue!37440)) b!1023440))

(assert (= (and b!1023444 ((_ is ValueCellFull!11304) mapDefault!37440)) b!1023443))

(assert (= b!1023445 b!1023444))

(assert (= start!89254 b!1023445))

(declare-fun m!942121 () Bool)

(assert (=> start!89254 m!942121))

(declare-fun m!942123 () Bool)

(assert (=> mapNonEmpty!37440 m!942123))

(declare-fun m!942125 () Bool)

(assert (=> b!1023439 m!942125))

(declare-fun m!942127 () Bool)

(assert (=> b!1023441 m!942127))

(declare-fun m!942129 () Bool)

(assert (=> b!1023445 m!942129))

(declare-fun m!942131 () Bool)

(assert (=> b!1023445 m!942131))

(declare-fun m!942133 () Bool)

(assert (=> b!1023442 m!942133))

(check-sat (not start!89254) (not b!1023442) b_and!32517 tp_is_empty!24015 (not b!1023445) (not b!1023439) (not b_next!20295) (not b!1023441) (not mapNonEmpty!37440))
(check-sat b_and!32517 (not b_next!20295))
