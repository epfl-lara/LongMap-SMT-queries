; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89340 () Bool)

(assert start!89340)

(declare-fun b!1024177 () Bool)

(declare-fun b_free!20349 () Bool)

(declare-fun b_next!20349 () Bool)

(assert (=> b!1024177 (= b_free!20349 (not b_next!20349))))

(declare-fun tp!72090 () Bool)

(declare-fun b_and!32595 () Bool)

(assert (=> b!1024177 (= tp!72090 b_and!32595)))

(declare-fun b!1024172 () Bool)

(declare-fun e!577259 () Bool)

(declare-fun tp_is_empty!24069 () Bool)

(assert (=> b!1024172 (= e!577259 tp_is_empty!24069)))

(declare-fun b!1024173 () Bool)

(declare-fun res!685750 () Bool)

(declare-fun e!577258 () Bool)

(assert (=> b!1024173 (=> (not res!685750) (not e!577258))))

(declare-datatypes ((V!36965 0))(
  ( (V!36966 (val!12085 Int)) )
))
(declare-datatypes ((ValueCell!11331 0))(
  ( (ValueCellFull!11331 (v!14654 V!36965)) (EmptyCell!11331) )
))
(declare-datatypes ((array!64186 0))(
  ( (array!64187 (arr!30903 (Array (_ BitVec 32) (_ BitVec 64))) (size!31416 (_ BitVec 32))) )
))
(declare-datatypes ((array!64188 0))(
  ( (array!64189 (arr!30904 (Array (_ BitVec 32) ValueCell!11331)) (size!31417 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5256 0))(
  ( (LongMapFixedSize!5257 (defaultEntry!5980 Int) (mask!29623 (_ BitVec 32)) (extraKeys!5712 (_ BitVec 32)) (zeroValue!5816 V!36965) (minValue!5816 V!36965) (_size!2683 (_ BitVec 32)) (_keys!11127 array!64186) (_values!6003 array!64188) (_vacant!2683 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5256)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024173 (= res!685750 (validMask!0 (mask!29623 thiss!1427)))))

(declare-fun b!1024174 () Bool)

(declare-fun e!577260 () Bool)

(declare-fun mapRes!37529 () Bool)

(assert (=> b!1024174 (= e!577260 (and e!577259 mapRes!37529))))

(declare-fun condMapEmpty!37529 () Bool)

(declare-fun mapDefault!37529 () ValueCell!11331)

(assert (=> b!1024174 (= condMapEmpty!37529 (= (arr!30904 (_values!6003 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11331)) mapDefault!37529)))))

(declare-fun b!1024175 () Bool)

(declare-fun res!685751 () Bool)

(assert (=> b!1024175 (=> (not res!685751) (not e!577258))))

(assert (=> b!1024175 (= res!685751 (= (size!31416 (_keys!11127 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29623 thiss!1427))))))

(declare-fun b!1024176 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1024176 (= e!577258 (not (validKeyInArray!0 key!909)))))

(declare-fun e!577257 () Bool)

(declare-fun array_inv!23941 (array!64186) Bool)

(declare-fun array_inv!23942 (array!64188) Bool)

(assert (=> b!1024177 (= e!577257 (and tp!72090 tp_is_empty!24069 (array_inv!23941 (_keys!11127 thiss!1427)) (array_inv!23942 (_values!6003 thiss!1427)) e!577260))))

(declare-fun b!1024178 () Bool)

(declare-fun res!685748 () Bool)

(assert (=> b!1024178 (=> (not res!685748) (not e!577258))))

(assert (=> b!1024178 (= res!685748 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37529 () Bool)

(assert (=> mapIsEmpty!37529 mapRes!37529))

(declare-fun res!685749 () Bool)

(assert (=> start!89340 (=> (not res!685749) (not e!577258))))

(declare-fun valid!2001 (LongMapFixedSize!5256) Bool)

(assert (=> start!89340 (= res!685749 (valid!2001 thiss!1427))))

(assert (=> start!89340 e!577258))

(assert (=> start!89340 e!577257))

(assert (=> start!89340 true))

(declare-fun b!1024179 () Bool)

(declare-fun e!577261 () Bool)

(assert (=> b!1024179 (= e!577261 tp_is_empty!24069)))

(declare-fun mapNonEmpty!37529 () Bool)

(declare-fun tp!72089 () Bool)

(assert (=> mapNonEmpty!37529 (= mapRes!37529 (and tp!72089 e!577261))))

(declare-fun mapKey!37529 () (_ BitVec 32))

(declare-fun mapRest!37529 () (Array (_ BitVec 32) ValueCell!11331))

(declare-fun mapValue!37529 () ValueCell!11331)

(assert (=> mapNonEmpty!37529 (= (arr!30904 (_values!6003 thiss!1427)) (store mapRest!37529 mapKey!37529 mapValue!37529))))

(assert (= (and start!89340 res!685749) b!1024178))

(assert (= (and b!1024178 res!685748) b!1024173))

(assert (= (and b!1024173 res!685750) b!1024175))

(assert (= (and b!1024175 res!685751) b!1024176))

(assert (= (and b!1024174 condMapEmpty!37529) mapIsEmpty!37529))

(assert (= (and b!1024174 (not condMapEmpty!37529)) mapNonEmpty!37529))

(get-info :version)

(assert (= (and mapNonEmpty!37529 ((_ is ValueCellFull!11331) mapValue!37529)) b!1024179))

(assert (= (and b!1024174 ((_ is ValueCellFull!11331) mapDefault!37529)) b!1024172))

(assert (= b!1024177 b!1024174))

(assert (= start!89340 b!1024177))

(declare-fun m!942609 () Bool)

(assert (=> b!1024173 m!942609))

(declare-fun m!942611 () Bool)

(assert (=> mapNonEmpty!37529 m!942611))

(declare-fun m!942613 () Bool)

(assert (=> b!1024177 m!942613))

(declare-fun m!942615 () Bool)

(assert (=> b!1024177 m!942615))

(declare-fun m!942617 () Bool)

(assert (=> b!1024176 m!942617))

(declare-fun m!942619 () Bool)

(assert (=> start!89340 m!942619))

(check-sat (not start!89340) (not b!1024173) (not b!1024177) (not b_next!20349) b_and!32595 (not mapNonEmpty!37529) tp_is_empty!24069 (not b!1024176))
(check-sat b_and!32595 (not b_next!20349))
(get-model)

(declare-fun d!122623 () Bool)

(assert (=> d!122623 (= (validMask!0 (mask!29623 thiss!1427)) (and (or (= (mask!29623 thiss!1427) #b00000000000000000000000000000111) (= (mask!29623 thiss!1427) #b00000000000000000000000000001111) (= (mask!29623 thiss!1427) #b00000000000000000000000000011111) (= (mask!29623 thiss!1427) #b00000000000000000000000000111111) (= (mask!29623 thiss!1427) #b00000000000000000000000001111111) (= (mask!29623 thiss!1427) #b00000000000000000000000011111111) (= (mask!29623 thiss!1427) #b00000000000000000000000111111111) (= (mask!29623 thiss!1427) #b00000000000000000000001111111111) (= (mask!29623 thiss!1427) #b00000000000000000000011111111111) (= (mask!29623 thiss!1427) #b00000000000000000000111111111111) (= (mask!29623 thiss!1427) #b00000000000000000001111111111111) (= (mask!29623 thiss!1427) #b00000000000000000011111111111111) (= (mask!29623 thiss!1427) #b00000000000000000111111111111111) (= (mask!29623 thiss!1427) #b00000000000000001111111111111111) (= (mask!29623 thiss!1427) #b00000000000000011111111111111111) (= (mask!29623 thiss!1427) #b00000000000000111111111111111111) (= (mask!29623 thiss!1427) #b00000000000001111111111111111111) (= (mask!29623 thiss!1427) #b00000000000011111111111111111111) (= (mask!29623 thiss!1427) #b00000000000111111111111111111111) (= (mask!29623 thiss!1427) #b00000000001111111111111111111111) (= (mask!29623 thiss!1427) #b00000000011111111111111111111111) (= (mask!29623 thiss!1427) #b00000000111111111111111111111111) (= (mask!29623 thiss!1427) #b00000001111111111111111111111111) (= (mask!29623 thiss!1427) #b00000011111111111111111111111111) (= (mask!29623 thiss!1427) #b00000111111111111111111111111111) (= (mask!29623 thiss!1427) #b00001111111111111111111111111111) (= (mask!29623 thiss!1427) #b00011111111111111111111111111111) (= (mask!29623 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29623 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1024173 d!122623))

(declare-fun d!122625 () Bool)

(declare-fun res!685770 () Bool)

(declare-fun e!577282 () Bool)

(assert (=> d!122625 (=> (not res!685770) (not e!577282))))

(declare-fun simpleValid!389 (LongMapFixedSize!5256) Bool)

(assert (=> d!122625 (= res!685770 (simpleValid!389 thiss!1427))))

(assert (=> d!122625 (= (valid!2001 thiss!1427) e!577282)))

(declare-fun b!1024210 () Bool)

(declare-fun res!685771 () Bool)

(assert (=> b!1024210 (=> (not res!685771) (not e!577282))))

(declare-fun arrayCountValidKeys!0 (array!64186 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024210 (= res!685771 (= (arrayCountValidKeys!0 (_keys!11127 thiss!1427) #b00000000000000000000000000000000 (size!31416 (_keys!11127 thiss!1427))) (_size!2683 thiss!1427)))))

(declare-fun b!1024211 () Bool)

(declare-fun res!685772 () Bool)

(assert (=> b!1024211 (=> (not res!685772) (not e!577282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64186 (_ BitVec 32)) Bool)

(assert (=> b!1024211 (= res!685772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11127 thiss!1427) (mask!29623 thiss!1427)))))

(declare-fun b!1024212 () Bool)

(declare-datatypes ((List!21726 0))(
  ( (Nil!21723) (Cons!21722 (h!22920 (_ BitVec 64)) (t!30788 List!21726)) )
))
(declare-fun arrayNoDuplicates!0 (array!64186 (_ BitVec 32) List!21726) Bool)

(assert (=> b!1024212 (= e!577282 (arrayNoDuplicates!0 (_keys!11127 thiss!1427) #b00000000000000000000000000000000 Nil!21723))))

(assert (= (and d!122625 res!685770) b!1024210))

(assert (= (and b!1024210 res!685771) b!1024211))

(assert (= (and b!1024211 res!685772) b!1024212))

(declare-fun m!942633 () Bool)

(assert (=> d!122625 m!942633))

(declare-fun m!942635 () Bool)

(assert (=> b!1024210 m!942635))

(declare-fun m!942637 () Bool)

(assert (=> b!1024211 m!942637))

(declare-fun m!942639 () Bool)

(assert (=> b!1024212 m!942639))

(assert (=> start!89340 d!122625))

(declare-fun d!122627 () Bool)

(assert (=> d!122627 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1024176 d!122627))

(declare-fun d!122629 () Bool)

(assert (=> d!122629 (= (array_inv!23941 (_keys!11127 thiss!1427)) (bvsge (size!31416 (_keys!11127 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1024177 d!122629))

(declare-fun d!122631 () Bool)

(assert (=> d!122631 (= (array_inv!23942 (_values!6003 thiss!1427)) (bvsge (size!31417 (_values!6003 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1024177 d!122631))

(declare-fun b!1024220 () Bool)

(declare-fun e!577287 () Bool)

(assert (=> b!1024220 (= e!577287 tp_is_empty!24069)))

(declare-fun condMapEmpty!37535 () Bool)

(declare-fun mapDefault!37535 () ValueCell!11331)

(assert (=> mapNonEmpty!37529 (= condMapEmpty!37535 (= mapRest!37529 ((as const (Array (_ BitVec 32) ValueCell!11331)) mapDefault!37535)))))

(declare-fun mapRes!37535 () Bool)

(assert (=> mapNonEmpty!37529 (= tp!72089 (and e!577287 mapRes!37535))))

(declare-fun b!1024219 () Bool)

(declare-fun e!577288 () Bool)

(assert (=> b!1024219 (= e!577288 tp_is_empty!24069)))

(declare-fun mapIsEmpty!37535 () Bool)

(assert (=> mapIsEmpty!37535 mapRes!37535))

(declare-fun mapNonEmpty!37535 () Bool)

(declare-fun tp!72099 () Bool)

(assert (=> mapNonEmpty!37535 (= mapRes!37535 (and tp!72099 e!577288))))

(declare-fun mapKey!37535 () (_ BitVec 32))

(declare-fun mapRest!37535 () (Array (_ BitVec 32) ValueCell!11331))

(declare-fun mapValue!37535 () ValueCell!11331)

(assert (=> mapNonEmpty!37535 (= mapRest!37529 (store mapRest!37535 mapKey!37535 mapValue!37535))))

(assert (= (and mapNonEmpty!37529 condMapEmpty!37535) mapIsEmpty!37535))

(assert (= (and mapNonEmpty!37529 (not condMapEmpty!37535)) mapNonEmpty!37535))

(assert (= (and mapNonEmpty!37535 ((_ is ValueCellFull!11331) mapValue!37535)) b!1024219))

(assert (= (and mapNonEmpty!37529 ((_ is ValueCellFull!11331) mapDefault!37535)) b!1024220))

(declare-fun m!942641 () Bool)

(assert (=> mapNonEmpty!37535 m!942641))

(check-sat (not mapNonEmpty!37535) (not b!1024210) (not d!122625) (not b!1024212) (not b_next!20349) b_and!32595 (not b!1024211) tp_is_empty!24069)
(check-sat b_and!32595 (not b_next!20349))
