; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89348 () Bool)

(assert start!89348)

(declare-fun b!1022953 () Bool)

(declare-fun b_free!20155 () Bool)

(declare-fun b_next!20155 () Bool)

(assert (=> b!1022953 (= b_free!20155 (not b_next!20155))))

(declare-fun tp!71500 () Bool)

(declare-fun b_and!32363 () Bool)

(assert (=> b!1022953 (= tp!71500 b_and!32363)))

(declare-fun b!1022946 () Bool)

(declare-fun e!576271 () Bool)

(declare-fun tp_is_empty!23875 () Bool)

(assert (=> b!1022946 (= e!576271 tp_is_empty!23875)))

(declare-fun b!1022948 () Bool)

(declare-fun res!685001 () Bool)

(declare-fun e!576276 () Bool)

(assert (=> b!1022948 (=> (not res!685001) (not e!576276))))

(declare-datatypes ((V!36707 0))(
  ( (V!36708 (val!11988 Int)) )
))
(declare-datatypes ((ValueCell!11234 0))(
  ( (ValueCellFull!11234 (v!14553 V!36707)) (EmptyCell!11234) )
))
(declare-datatypes ((array!63843 0))(
  ( (array!63844 (arr!30727 (Array (_ BitVec 32) (_ BitVec 64))) (size!31239 (_ BitVec 32))) )
))
(declare-datatypes ((array!63845 0))(
  ( (array!63846 (arr!30728 (Array (_ BitVec 32) ValueCell!11234)) (size!31240 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5062 0))(
  ( (LongMapFixedSize!5063 (defaultEntry!5883 Int) (mask!29518 (_ BitVec 32)) (extraKeys!5615 (_ BitVec 32)) (zeroValue!5719 V!36707) (minValue!5719 V!36707) (_size!2586 (_ BitVec 32)) (_keys!11066 array!63843) (_values!5906 array!63845) (_vacant!2586 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5062)

(assert (=> b!1022948 (= res!685001 (and (= (size!31240 (_values!5906 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29518 thiss!1427))) (= (size!31239 (_keys!11066 thiss!1427)) (size!31240 (_values!5906 thiss!1427))) (bvsge (mask!29518 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5615 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5615 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022949 () Bool)

(declare-fun res!684999 () Bool)

(assert (=> b!1022949 (=> (not res!684999) (not e!576276))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022949 (= res!684999 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022950 () Bool)

(declare-fun res!684997 () Bool)

(assert (=> b!1022950 (=> (not res!684997) (not e!576276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022950 (= res!684997 (validMask!0 (mask!29518 thiss!1427)))))

(declare-fun res!684998 () Bool)

(assert (=> start!89348 (=> (not res!684998) (not e!576276))))

(declare-fun valid!1935 (LongMapFixedSize!5062) Bool)

(assert (=> start!89348 (= res!684998 (valid!1935 thiss!1427))))

(assert (=> start!89348 e!576276))

(declare-fun e!576273 () Bool)

(assert (=> start!89348 e!576273))

(assert (=> start!89348 true))

(declare-fun b!1022947 () Bool)

(assert (=> b!1022947 (= e!576276 false)))

(declare-fun lt!450641 () Bool)

(declare-datatypes ((List!21648 0))(
  ( (Nil!21645) (Cons!21644 (h!22851 (_ BitVec 64)) (t!30654 List!21648)) )
))
(declare-fun arrayNoDuplicates!0 (array!63843 (_ BitVec 32) List!21648) Bool)

(assert (=> b!1022947 (= lt!450641 (arrayNoDuplicates!0 (_keys!11066 thiss!1427) #b00000000000000000000000000000000 Nil!21645))))

(declare-fun mapNonEmpty!37230 () Bool)

(declare-fun mapRes!37230 () Bool)

(declare-fun tp!71499 () Bool)

(assert (=> mapNonEmpty!37230 (= mapRes!37230 (and tp!71499 e!576271))))

(declare-fun mapRest!37230 () (Array (_ BitVec 32) ValueCell!11234))

(declare-fun mapValue!37230 () ValueCell!11234)

(declare-fun mapKey!37230 () (_ BitVec 32))

(assert (=> mapNonEmpty!37230 (= (arr!30728 (_values!5906 thiss!1427)) (store mapRest!37230 mapKey!37230 mapValue!37230))))

(declare-fun b!1022951 () Bool)

(declare-fun e!576274 () Bool)

(declare-fun e!576272 () Bool)

(assert (=> b!1022951 (= e!576274 (and e!576272 mapRes!37230))))

(declare-fun condMapEmpty!37230 () Bool)

(declare-fun mapDefault!37230 () ValueCell!11234)

(assert (=> b!1022951 (= condMapEmpty!37230 (= (arr!30728 (_values!5906 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11234)) mapDefault!37230)))))

(declare-fun b!1022952 () Bool)

(assert (=> b!1022952 (= e!576272 tp_is_empty!23875)))

(declare-fun array_inv!23847 (array!63843) Bool)

(declare-fun array_inv!23848 (array!63845) Bool)

(assert (=> b!1022953 (= e!576273 (and tp!71500 tp_is_empty!23875 (array_inv!23847 (_keys!11066 thiss!1427)) (array_inv!23848 (_values!5906 thiss!1427)) e!576274))))

(declare-fun mapIsEmpty!37230 () Bool)

(assert (=> mapIsEmpty!37230 mapRes!37230))

(declare-fun b!1022954 () Bool)

(declare-fun res!685000 () Bool)

(assert (=> b!1022954 (=> (not res!685000) (not e!576276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63843 (_ BitVec 32)) Bool)

(assert (=> b!1022954 (= res!685000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11066 thiss!1427) (mask!29518 thiss!1427)))))

(assert (= (and start!89348 res!684998) b!1022949))

(assert (= (and b!1022949 res!684999) b!1022950))

(assert (= (and b!1022950 res!684997) b!1022948))

(assert (= (and b!1022948 res!685001) b!1022954))

(assert (= (and b!1022954 res!685000) b!1022947))

(assert (= (and b!1022951 condMapEmpty!37230) mapIsEmpty!37230))

(assert (= (and b!1022951 (not condMapEmpty!37230)) mapNonEmpty!37230))

(get-info :version)

(assert (= (and mapNonEmpty!37230 ((_ is ValueCellFull!11234) mapValue!37230)) b!1022946))

(assert (= (and b!1022951 ((_ is ValueCellFull!11234) mapDefault!37230)) b!1022952))

(assert (= b!1022953 b!1022951))

(assert (= start!89348 b!1022953))

(declare-fun m!942733 () Bool)

(assert (=> b!1022947 m!942733))

(declare-fun m!942735 () Bool)

(assert (=> b!1022954 m!942735))

(declare-fun m!942737 () Bool)

(assert (=> mapNonEmpty!37230 m!942737))

(declare-fun m!942739 () Bool)

(assert (=> start!89348 m!942739))

(declare-fun m!942741 () Bool)

(assert (=> b!1022950 m!942741))

(declare-fun m!942743 () Bool)

(assert (=> b!1022953 m!942743))

(declare-fun m!942745 () Bool)

(assert (=> b!1022953 m!942745))

(check-sat (not mapNonEmpty!37230) (not start!89348) tp_is_empty!23875 b_and!32363 (not b!1022954) (not b!1022947) (not b!1022950) (not b!1022953) (not b_next!20155))
(check-sat b_and!32363 (not b_next!20155))
