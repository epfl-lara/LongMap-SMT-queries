; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89378 () Bool)

(assert start!89378)

(declare-fun b!1023355 () Bool)

(declare-fun b_free!20185 () Bool)

(declare-fun b_next!20185 () Bool)

(assert (=> b!1023355 (= b_free!20185 (not b_next!20185))))

(declare-fun tp!71589 () Bool)

(declare-fun b_and!32393 () Bool)

(assert (=> b!1023355 (= tp!71589 b_and!32393)))

(declare-fun b!1023351 () Bool)

(declare-fun e!576544 () Bool)

(declare-fun e!576541 () Bool)

(declare-fun mapRes!37275 () Bool)

(assert (=> b!1023351 (= e!576544 (and e!576541 mapRes!37275))))

(declare-fun condMapEmpty!37275 () Bool)

(declare-datatypes ((V!36747 0))(
  ( (V!36748 (val!12003 Int)) )
))
(declare-datatypes ((ValueCell!11249 0))(
  ( (ValueCellFull!11249 (v!14568 V!36747)) (EmptyCell!11249) )
))
(declare-datatypes ((array!63903 0))(
  ( (array!63904 (arr!30757 (Array (_ BitVec 32) (_ BitVec 64))) (size!31269 (_ BitVec 32))) )
))
(declare-datatypes ((array!63905 0))(
  ( (array!63906 (arr!30758 (Array (_ BitVec 32) ValueCell!11249)) (size!31270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5092 0))(
  ( (LongMapFixedSize!5093 (defaultEntry!5898 Int) (mask!29543 (_ BitVec 32)) (extraKeys!5630 (_ BitVec 32)) (zeroValue!5734 V!36747) (minValue!5734 V!36747) (_size!2601 (_ BitVec 32)) (_keys!11081 array!63903) (_values!5921 array!63905) (_vacant!2601 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5092)

(declare-fun mapDefault!37275 () ValueCell!11249)

(assert (=> b!1023351 (= condMapEmpty!37275 (= (arr!30758 (_values!5921 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11249)) mapDefault!37275)))))

(declare-fun b!1023352 () Bool)

(declare-fun res!685223 () Bool)

(declare-fun e!576545 () Bool)

(assert (=> b!1023352 (=> (not res!685223) (not e!576545))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023352 (= res!685223 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023353 () Bool)

(declare-fun e!576543 () Bool)

(declare-fun tp_is_empty!23905 () Bool)

(assert (=> b!1023353 (= e!576543 tp_is_empty!23905)))

(declare-fun res!685222 () Bool)

(assert (=> start!89378 (=> (not res!685222) (not e!576545))))

(declare-fun valid!1947 (LongMapFixedSize!5092) Bool)

(assert (=> start!89378 (= res!685222 (valid!1947 thiss!1427))))

(assert (=> start!89378 e!576545))

(declare-fun e!576546 () Bool)

(assert (=> start!89378 e!576546))

(assert (=> start!89378 true))

(declare-fun b!1023354 () Bool)

(assert (=> b!1023354 (= e!576545 false)))

(declare-fun lt!450686 () Bool)

(declare-datatypes ((List!21658 0))(
  ( (Nil!21655) (Cons!21654 (h!22861 (_ BitVec 64)) (t!30664 List!21658)) )
))
(declare-fun arrayNoDuplicates!0 (array!63903 (_ BitVec 32) List!21658) Bool)

(assert (=> b!1023354 (= lt!450686 (arrayNoDuplicates!0 (_keys!11081 thiss!1427) #b00000000000000000000000000000000 Nil!21655))))

(declare-fun array_inv!23861 (array!63903) Bool)

(declare-fun array_inv!23862 (array!63905) Bool)

(assert (=> b!1023355 (= e!576546 (and tp!71589 tp_is_empty!23905 (array_inv!23861 (_keys!11081 thiss!1427)) (array_inv!23862 (_values!5921 thiss!1427)) e!576544))))

(declare-fun b!1023356 () Bool)

(declare-fun res!685224 () Bool)

(assert (=> b!1023356 (=> (not res!685224) (not e!576545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023356 (= res!685224 (validMask!0 (mask!29543 thiss!1427)))))

(declare-fun b!1023357 () Bool)

(declare-fun res!685225 () Bool)

(assert (=> b!1023357 (=> (not res!685225) (not e!576545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63903 (_ BitVec 32)) Bool)

(assert (=> b!1023357 (= res!685225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11081 thiss!1427) (mask!29543 thiss!1427)))))

(declare-fun mapIsEmpty!37275 () Bool)

(assert (=> mapIsEmpty!37275 mapRes!37275))

(declare-fun mapNonEmpty!37275 () Bool)

(declare-fun tp!71590 () Bool)

(assert (=> mapNonEmpty!37275 (= mapRes!37275 (and tp!71590 e!576543))))

(declare-fun mapValue!37275 () ValueCell!11249)

(declare-fun mapRest!37275 () (Array (_ BitVec 32) ValueCell!11249))

(declare-fun mapKey!37275 () (_ BitVec 32))

(assert (=> mapNonEmpty!37275 (= (arr!30758 (_values!5921 thiss!1427)) (store mapRest!37275 mapKey!37275 mapValue!37275))))

(declare-fun b!1023358 () Bool)

(declare-fun res!685226 () Bool)

(assert (=> b!1023358 (=> (not res!685226) (not e!576545))))

(assert (=> b!1023358 (= res!685226 (and (= (size!31270 (_values!5921 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29543 thiss!1427))) (= (size!31269 (_keys!11081 thiss!1427)) (size!31270 (_values!5921 thiss!1427))) (bvsge (mask!29543 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5630 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5630 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5630 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1023359 () Bool)

(assert (=> b!1023359 (= e!576541 tp_is_empty!23905)))

(assert (= (and start!89378 res!685222) b!1023352))

(assert (= (and b!1023352 res!685223) b!1023356))

(assert (= (and b!1023356 res!685224) b!1023358))

(assert (= (and b!1023358 res!685226) b!1023357))

(assert (= (and b!1023357 res!685225) b!1023354))

(assert (= (and b!1023351 condMapEmpty!37275) mapIsEmpty!37275))

(assert (= (and b!1023351 (not condMapEmpty!37275)) mapNonEmpty!37275))

(get-info :version)

(assert (= (and mapNonEmpty!37275 ((_ is ValueCellFull!11249) mapValue!37275)) b!1023353))

(assert (= (and b!1023351 ((_ is ValueCellFull!11249) mapDefault!37275)) b!1023359))

(assert (= b!1023355 b!1023351))

(assert (= start!89378 b!1023355))

(declare-fun m!942943 () Bool)

(assert (=> start!89378 m!942943))

(declare-fun m!942945 () Bool)

(assert (=> b!1023354 m!942945))

(declare-fun m!942947 () Bool)

(assert (=> mapNonEmpty!37275 m!942947))

(declare-fun m!942949 () Bool)

(assert (=> b!1023357 m!942949))

(declare-fun m!942951 () Bool)

(assert (=> b!1023356 m!942951))

(declare-fun m!942953 () Bool)

(assert (=> b!1023355 m!942953))

(declare-fun m!942955 () Bool)

(assert (=> b!1023355 m!942955))

(check-sat b_and!32393 (not start!89378) (not b_next!20185) (not b!1023354) (not b!1023356) (not b!1023355) (not b!1023357) tp_is_empty!23905 (not mapNonEmpty!37275))
(check-sat b_and!32393 (not b_next!20185))
