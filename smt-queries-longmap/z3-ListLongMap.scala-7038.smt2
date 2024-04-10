; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89242 () Bool)

(assert start!89242)

(declare-fun b!1023282 () Bool)

(declare-fun b_free!20283 () Bool)

(declare-fun b_next!20283 () Bool)

(assert (=> b!1023282 (= b_free!20283 (not b_next!20283))))

(declare-fun tp!71883 () Bool)

(declare-fun b_and!32505 () Bool)

(assert (=> b!1023282 (= tp!71883 b_and!32505)))

(declare-fun b!1023275 () Bool)

(declare-fun res!685343 () Bool)

(declare-fun e!576580 () Bool)

(assert (=> b!1023275 (=> (not res!685343) (not e!576580))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023275 (= res!685343 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023276 () Bool)

(declare-fun res!685342 () Bool)

(assert (=> b!1023276 (=> (not res!685342) (not e!576580))))

(declare-datatypes ((V!36877 0))(
  ( (V!36878 (val!12052 Int)) )
))
(declare-datatypes ((ValueCell!11298 0))(
  ( (ValueCellFull!11298 (v!14621 V!36877)) (EmptyCell!11298) )
))
(declare-datatypes ((array!64050 0))(
  ( (array!64051 (arr!30837 (Array (_ BitVec 32) (_ BitVec 64))) (size!31348 (_ BitVec 32))) )
))
(declare-datatypes ((array!64052 0))(
  ( (array!64053 (arr!30838 (Array (_ BitVec 32) ValueCell!11298)) (size!31349 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5190 0))(
  ( (LongMapFixedSize!5191 (defaultEntry!5947 Int) (mask!29564 (_ BitVec 32)) (extraKeys!5679 (_ BitVec 32)) (zeroValue!5783 V!36877) (minValue!5783 V!36877) (_size!2650 (_ BitVec 32)) (_keys!11092 array!64050) (_values!5970 array!64052) (_vacant!2650 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5190)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64050 (_ BitVec 32)) Bool)

(assert (=> b!1023276 (= res!685342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11092 thiss!1427) (mask!29564 thiss!1427)))))

(declare-fun b!1023277 () Bool)

(assert (=> b!1023277 (= e!576580 false)))

(declare-fun lt!450390 () Bool)

(declare-datatypes ((List!21709 0))(
  ( (Nil!21706) (Cons!21705 (h!22903 (_ BitVec 64)) (t!30747 List!21709)) )
))
(declare-fun arrayNoDuplicates!0 (array!64050 (_ BitVec 32) List!21709) Bool)

(assert (=> b!1023277 (= lt!450390 (arrayNoDuplicates!0 (_keys!11092 thiss!1427) #b00000000000000000000000000000000 Nil!21706))))

(declare-fun b!1023278 () Bool)

(declare-fun e!576585 () Bool)

(declare-fun tp_is_empty!24003 () Bool)

(assert (=> b!1023278 (= e!576585 tp_is_empty!24003)))

(declare-fun b!1023279 () Bool)

(declare-fun res!685340 () Bool)

(assert (=> b!1023279 (=> (not res!685340) (not e!576580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023279 (= res!685340 (validMask!0 (mask!29564 thiss!1427)))))

(declare-fun mapNonEmpty!37422 () Bool)

(declare-fun mapRes!37422 () Bool)

(declare-fun tp!71884 () Bool)

(declare-fun e!576582 () Bool)

(assert (=> mapNonEmpty!37422 (= mapRes!37422 (and tp!71884 e!576582))))

(declare-fun mapValue!37422 () ValueCell!11298)

(declare-fun mapKey!37422 () (_ BitVec 32))

(declare-fun mapRest!37422 () (Array (_ BitVec 32) ValueCell!11298))

(assert (=> mapNonEmpty!37422 (= (arr!30838 (_values!5970 thiss!1427)) (store mapRest!37422 mapKey!37422 mapValue!37422))))

(declare-fun b!1023280 () Bool)

(declare-fun e!576584 () Bool)

(assert (=> b!1023280 (= e!576584 (and e!576585 mapRes!37422))))

(declare-fun condMapEmpty!37422 () Bool)

(declare-fun mapDefault!37422 () ValueCell!11298)

(assert (=> b!1023280 (= condMapEmpty!37422 (= (arr!30838 (_values!5970 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11298)) mapDefault!37422)))))

(declare-fun b!1023281 () Bool)

(assert (=> b!1023281 (= e!576582 tp_is_empty!24003)))

(declare-fun res!685339 () Bool)

(assert (=> start!89242 (=> (not res!685339) (not e!576580))))

(declare-fun valid!1977 (LongMapFixedSize!5190) Bool)

(assert (=> start!89242 (= res!685339 (valid!1977 thiss!1427))))

(assert (=> start!89242 e!576580))

(declare-fun e!576581 () Bool)

(assert (=> start!89242 e!576581))

(assert (=> start!89242 true))

(declare-fun mapIsEmpty!37422 () Bool)

(assert (=> mapIsEmpty!37422 mapRes!37422))

(declare-fun array_inv!23895 (array!64050) Bool)

(declare-fun array_inv!23896 (array!64052) Bool)

(assert (=> b!1023282 (= e!576581 (and tp!71883 tp_is_empty!24003 (array_inv!23895 (_keys!11092 thiss!1427)) (array_inv!23896 (_values!5970 thiss!1427)) e!576584))))

(declare-fun b!1023283 () Bool)

(declare-fun res!685341 () Bool)

(assert (=> b!1023283 (=> (not res!685341) (not e!576580))))

(assert (=> b!1023283 (= res!685341 (and (= (size!31349 (_values!5970 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29564 thiss!1427))) (= (size!31348 (_keys!11092 thiss!1427)) (size!31349 (_values!5970 thiss!1427))) (bvsge (mask!29564 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5679 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5679 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5679 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5679 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5679 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5679 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5679 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!89242 res!685339) b!1023275))

(assert (= (and b!1023275 res!685343) b!1023279))

(assert (= (and b!1023279 res!685340) b!1023283))

(assert (= (and b!1023283 res!685341) b!1023276))

(assert (= (and b!1023276 res!685342) b!1023277))

(assert (= (and b!1023280 condMapEmpty!37422) mapIsEmpty!37422))

(assert (= (and b!1023280 (not condMapEmpty!37422)) mapNonEmpty!37422))

(get-info :version)

(assert (= (and mapNonEmpty!37422 ((_ is ValueCellFull!11298) mapValue!37422)) b!1023281))

(assert (= (and b!1023280 ((_ is ValueCellFull!11298) mapDefault!37422)) b!1023278))

(assert (= b!1023282 b!1023280))

(assert (= start!89242 b!1023282))

(declare-fun m!942037 () Bool)

(assert (=> b!1023277 m!942037))

(declare-fun m!942039 () Bool)

(assert (=> b!1023276 m!942039))

(declare-fun m!942041 () Bool)

(assert (=> b!1023279 m!942041))

(declare-fun m!942043 () Bool)

(assert (=> b!1023282 m!942043))

(declare-fun m!942045 () Bool)

(assert (=> b!1023282 m!942045))

(declare-fun m!942047 () Bool)

(assert (=> start!89242 m!942047))

(declare-fun m!942049 () Bool)

(assert (=> mapNonEmpty!37422 m!942049))

(check-sat (not b!1023276) (not b_next!20283) (not b!1023279) (not b!1023277) (not b!1023282) tp_is_empty!24003 (not mapNonEmpty!37422) (not start!89242) b_and!32505)
(check-sat b_and!32505 (not b_next!20283))
