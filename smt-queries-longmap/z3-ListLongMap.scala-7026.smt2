; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89402 () Bool)

(assert start!89402)

(declare-fun b!1023675 () Bool)

(declare-fun b_free!20209 () Bool)

(declare-fun b_next!20209 () Bool)

(assert (=> b!1023675 (= b_free!20209 (not b_next!20209))))

(declare-fun tp!71661 () Bool)

(declare-fun b_and!32417 () Bool)

(assert (=> b!1023675 (= tp!71661 b_and!32417)))

(declare-fun res!685404 () Bool)

(declare-fun e!576757 () Bool)

(assert (=> start!89402 (=> (not res!685404) (not e!576757))))

(declare-datatypes ((V!36779 0))(
  ( (V!36780 (val!12015 Int)) )
))
(declare-datatypes ((ValueCell!11261 0))(
  ( (ValueCellFull!11261 (v!14580 V!36779)) (EmptyCell!11261) )
))
(declare-datatypes ((array!63951 0))(
  ( (array!63952 (arr!30781 (Array (_ BitVec 32) (_ BitVec 64))) (size!31293 (_ BitVec 32))) )
))
(declare-datatypes ((array!63953 0))(
  ( (array!63954 (arr!30782 (Array (_ BitVec 32) ValueCell!11261)) (size!31294 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5116 0))(
  ( (LongMapFixedSize!5117 (defaultEntry!5910 Int) (mask!29563 (_ BitVec 32)) (extraKeys!5642 (_ BitVec 32)) (zeroValue!5746 V!36779) (minValue!5746 V!36779) (_size!2613 (_ BitVec 32)) (_keys!11093 array!63951) (_values!5933 array!63953) (_vacant!2613 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5116)

(declare-fun valid!1953 (LongMapFixedSize!5116) Bool)

(assert (=> start!89402 (= res!685404 (valid!1953 thiss!1427))))

(assert (=> start!89402 e!576757))

(declare-fun e!576762 () Bool)

(assert (=> start!89402 e!576762))

(assert (=> start!89402 true))

(declare-fun e!576758 () Bool)

(declare-fun tp_is_empty!23929 () Bool)

(declare-fun array_inv!23875 (array!63951) Bool)

(declare-fun array_inv!23876 (array!63953) Bool)

(assert (=> b!1023675 (= e!576762 (and tp!71661 tp_is_empty!23929 (array_inv!23875 (_keys!11093 thiss!1427)) (array_inv!23876 (_values!5933 thiss!1427)) e!576758))))

(declare-fun mapNonEmpty!37311 () Bool)

(declare-fun mapRes!37311 () Bool)

(declare-fun tp!71662 () Bool)

(declare-fun e!576761 () Bool)

(assert (=> mapNonEmpty!37311 (= mapRes!37311 (and tp!71662 e!576761))))

(declare-fun mapRest!37311 () (Array (_ BitVec 32) ValueCell!11261))

(declare-fun mapKey!37311 () (_ BitVec 32))

(declare-fun mapValue!37311 () ValueCell!11261)

(assert (=> mapNonEmpty!37311 (= (arr!30782 (_values!5933 thiss!1427)) (store mapRest!37311 mapKey!37311 mapValue!37311))))

(declare-fun b!1023676 () Bool)

(declare-fun res!685402 () Bool)

(assert (=> b!1023676 (=> (not res!685402) (not e!576757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023676 (= res!685402 (validMask!0 (mask!29563 thiss!1427)))))

(declare-fun b!1023677 () Bool)

(declare-fun res!685405 () Bool)

(assert (=> b!1023677 (=> (not res!685405) (not e!576757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63951 (_ BitVec 32)) Bool)

(assert (=> b!1023677 (= res!685405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11093 thiss!1427) (mask!29563 thiss!1427)))))

(declare-fun b!1023678 () Bool)

(declare-fun e!576759 () Bool)

(assert (=> b!1023678 (= e!576758 (and e!576759 mapRes!37311))))

(declare-fun condMapEmpty!37311 () Bool)

(declare-fun mapDefault!37311 () ValueCell!11261)

(assert (=> b!1023678 (= condMapEmpty!37311 (= (arr!30782 (_values!5933 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11261)) mapDefault!37311)))))

(declare-fun b!1023679 () Bool)

(assert (=> b!1023679 (= e!576759 tp_is_empty!23929)))

(declare-fun mapIsEmpty!37311 () Bool)

(assert (=> mapIsEmpty!37311 mapRes!37311))

(declare-fun b!1023680 () Bool)

(declare-fun res!685403 () Bool)

(assert (=> b!1023680 (=> (not res!685403) (not e!576757))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023680 (= res!685403 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023681 () Bool)

(declare-fun res!685406 () Bool)

(assert (=> b!1023681 (=> (not res!685406) (not e!576757))))

(assert (=> b!1023681 (= res!685406 (and (= (size!31294 (_values!5933 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29563 thiss!1427))) (= (size!31293 (_keys!11093 thiss!1427)) (size!31294 (_values!5933 thiss!1427))) (bvsge (mask!29563 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5642 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5642 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1023682 () Bool)

(assert (=> b!1023682 (= e!576761 tp_is_empty!23929)))

(declare-fun b!1023683 () Bool)

(assert (=> b!1023683 (= e!576757 false)))

(declare-fun lt!450722 () Bool)

(declare-datatypes ((List!21666 0))(
  ( (Nil!21663) (Cons!21662 (h!22869 (_ BitVec 64)) (t!30672 List!21666)) )
))
(declare-fun arrayNoDuplicates!0 (array!63951 (_ BitVec 32) List!21666) Bool)

(assert (=> b!1023683 (= lt!450722 (arrayNoDuplicates!0 (_keys!11093 thiss!1427) #b00000000000000000000000000000000 Nil!21663))))

(assert (= (and start!89402 res!685404) b!1023680))

(assert (= (and b!1023680 res!685403) b!1023676))

(assert (= (and b!1023676 res!685402) b!1023681))

(assert (= (and b!1023681 res!685406) b!1023677))

(assert (= (and b!1023677 res!685405) b!1023683))

(assert (= (and b!1023678 condMapEmpty!37311) mapIsEmpty!37311))

(assert (= (and b!1023678 (not condMapEmpty!37311)) mapNonEmpty!37311))

(get-info :version)

(assert (= (and mapNonEmpty!37311 ((_ is ValueCellFull!11261) mapValue!37311)) b!1023682))

(assert (= (and b!1023678 ((_ is ValueCellFull!11261) mapDefault!37311)) b!1023679))

(assert (= b!1023675 b!1023678))

(assert (= start!89402 b!1023675))

(declare-fun m!943111 () Bool)

(assert (=> b!1023676 m!943111))

(declare-fun m!943113 () Bool)

(assert (=> b!1023675 m!943113))

(declare-fun m!943115 () Bool)

(assert (=> b!1023675 m!943115))

(declare-fun m!943117 () Bool)

(assert (=> mapNonEmpty!37311 m!943117))

(declare-fun m!943119 () Bool)

(assert (=> b!1023677 m!943119))

(declare-fun m!943121 () Bool)

(assert (=> b!1023683 m!943121))

(declare-fun m!943123 () Bool)

(assert (=> start!89402 m!943123))

(check-sat b_and!32417 (not b!1023683) (not b!1023677) (not b!1023676) (not b!1023675) tp_is_empty!23929 (not b_next!20209) (not mapNonEmpty!37311) (not start!89402))
(check-sat b_and!32417 (not b_next!20209))
