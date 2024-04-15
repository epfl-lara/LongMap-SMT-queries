; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89166 () Bool)

(assert start!89166)

(declare-fun b!1022210 () Bool)

(declare-fun b_free!20209 () Bool)

(declare-fun b_next!20209 () Bool)

(assert (=> b!1022210 (= b_free!20209 (not b_next!20209))))

(declare-fun tp!71662 () Bool)

(declare-fun b_and!32381 () Bool)

(assert (=> b!1022210 (= tp!71662 b_and!32381)))

(declare-fun mapNonEmpty!37311 () Bool)

(declare-fun mapRes!37311 () Bool)

(declare-fun tp!71661 () Bool)

(declare-fun e!575828 () Bool)

(assert (=> mapNonEmpty!37311 (= mapRes!37311 (and tp!71661 e!575828))))

(declare-fun mapKey!37311 () (_ BitVec 32))

(declare-datatypes ((V!36779 0))(
  ( (V!36780 (val!12015 Int)) )
))
(declare-datatypes ((ValueCell!11261 0))(
  ( (ValueCellFull!11261 (v!14583 V!36779)) (EmptyCell!11261) )
))
(declare-datatypes ((array!63841 0))(
  ( (array!63842 (arr!30732 (Array (_ BitVec 32) (_ BitVec 64))) (size!31245 (_ BitVec 32))) )
))
(declare-datatypes ((array!63843 0))(
  ( (array!63844 (arr!30733 (Array (_ BitVec 32) ValueCell!11261)) (size!31246 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5116 0))(
  ( (LongMapFixedSize!5117 (defaultEntry!5910 Int) (mask!29498 (_ BitVec 32)) (extraKeys!5642 (_ BitVec 32)) (zeroValue!5746 V!36779) (minValue!5746 V!36779) (_size!2613 (_ BitVec 32)) (_keys!11051 array!63841) (_values!5933 array!63843) (_vacant!2613 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5116)

(declare-fun mapValue!37311 () ValueCell!11261)

(declare-fun mapRest!37311 () (Array (_ BitVec 32) ValueCell!11261))

(assert (=> mapNonEmpty!37311 (= (arr!30733 (_values!5933 thiss!1427)) (store mapRest!37311 mapKey!37311 mapValue!37311))))

(declare-fun b!1022209 () Bool)

(declare-fun tp_is_empty!23929 () Bool)

(assert (=> b!1022209 (= e!575828 tp_is_empty!23929)))

(declare-fun e!575823 () Bool)

(declare-fun e!575827 () Bool)

(declare-fun array_inv!23841 (array!63841) Bool)

(declare-fun array_inv!23842 (array!63843) Bool)

(assert (=> b!1022210 (= e!575823 (and tp!71662 tp_is_empty!23929 (array_inv!23841 (_keys!11051 thiss!1427)) (array_inv!23842 (_values!5933 thiss!1427)) e!575827))))

(declare-fun b!1022211 () Bool)

(declare-fun res!684829 () Bool)

(declare-fun e!575824 () Bool)

(assert (=> b!1022211 (=> (not res!684829) (not e!575824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022211 (= res!684829 (validMask!0 (mask!29498 thiss!1427)))))

(declare-fun b!1022212 () Bool)

(assert (=> b!1022212 (= e!575824 false)))

(declare-fun lt!450007 () Bool)

(declare-datatypes ((List!21712 0))(
  ( (Nil!21709) (Cons!21708 (h!22906 (_ BitVec 64)) (t!30717 List!21712)) )
))
(declare-fun arrayNoDuplicates!0 (array!63841 (_ BitVec 32) List!21712) Bool)

(assert (=> b!1022212 (= lt!450007 (arrayNoDuplicates!0 (_keys!11051 thiss!1427) #b00000000000000000000000000000000 Nil!21709))))

(declare-fun b!1022213 () Bool)

(declare-fun res!684827 () Bool)

(assert (=> b!1022213 (=> (not res!684827) (not e!575824))))

(assert (=> b!1022213 (= res!684827 (and (= (size!31246 (_values!5933 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29498 thiss!1427))) (= (size!31245 (_keys!11051 thiss!1427)) (size!31246 (_values!5933 thiss!1427))) (bvsge (mask!29498 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5642 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5642 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5642 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022214 () Bool)

(declare-fun res!684826 () Bool)

(assert (=> b!1022214 (=> (not res!684826) (not e!575824))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022214 (= res!684826 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37311 () Bool)

(assert (=> mapIsEmpty!37311 mapRes!37311))

(declare-fun res!684828 () Bool)

(assert (=> start!89166 (=> (not res!684828) (not e!575824))))

(declare-fun valid!1950 (LongMapFixedSize!5116) Bool)

(assert (=> start!89166 (= res!684828 (valid!1950 thiss!1427))))

(assert (=> start!89166 e!575824))

(assert (=> start!89166 e!575823))

(assert (=> start!89166 true))

(declare-fun b!1022215 () Bool)

(declare-fun res!684825 () Bool)

(assert (=> b!1022215 (=> (not res!684825) (not e!575824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63841 (_ BitVec 32)) Bool)

(assert (=> b!1022215 (= res!684825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11051 thiss!1427) (mask!29498 thiss!1427)))))

(declare-fun b!1022216 () Bool)

(declare-fun e!575826 () Bool)

(assert (=> b!1022216 (= e!575826 tp_is_empty!23929)))

(declare-fun b!1022217 () Bool)

(assert (=> b!1022217 (= e!575827 (and e!575826 mapRes!37311))))

(declare-fun condMapEmpty!37311 () Bool)

(declare-fun mapDefault!37311 () ValueCell!11261)

(assert (=> b!1022217 (= condMapEmpty!37311 (= (arr!30733 (_values!5933 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11261)) mapDefault!37311)))))

(assert (= (and start!89166 res!684828) b!1022214))

(assert (= (and b!1022214 res!684826) b!1022211))

(assert (= (and b!1022211 res!684829) b!1022213))

(assert (= (and b!1022213 res!684827) b!1022215))

(assert (= (and b!1022215 res!684825) b!1022212))

(assert (= (and b!1022217 condMapEmpty!37311) mapIsEmpty!37311))

(assert (= (and b!1022217 (not condMapEmpty!37311)) mapNonEmpty!37311))

(get-info :version)

(assert (= (and mapNonEmpty!37311 ((_ is ValueCellFull!11261) mapValue!37311)) b!1022209))

(assert (= (and b!1022217 ((_ is ValueCellFull!11261) mapDefault!37311)) b!1022216))

(assert (= b!1022210 b!1022217))

(assert (= start!89166 b!1022210))

(declare-fun m!940827 () Bool)

(assert (=> start!89166 m!940827))

(declare-fun m!940829 () Bool)

(assert (=> b!1022211 m!940829))

(declare-fun m!940831 () Bool)

(assert (=> b!1022212 m!940831))

(declare-fun m!940833 () Bool)

(assert (=> b!1022215 m!940833))

(declare-fun m!940835 () Bool)

(assert (=> b!1022210 m!940835))

(declare-fun m!940837 () Bool)

(assert (=> b!1022210 m!940837))

(declare-fun m!940839 () Bool)

(assert (=> mapNonEmpty!37311 m!940839))

(check-sat b_and!32381 (not b!1022212) (not mapNonEmpty!37311) (not b!1022210) (not b_next!20209) (not start!89166) (not b!1022215) (not b!1022211) tp_is_empty!23929)
(check-sat b_and!32381 (not b_next!20209))
