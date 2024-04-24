; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89390 () Bool)

(assert start!89390)

(declare-fun b!1023514 () Bool)

(declare-fun b_free!20197 () Bool)

(declare-fun b_next!20197 () Bool)

(assert (=> b!1023514 (= b_free!20197 (not b_next!20197))))

(declare-fun tp!71625 () Bool)

(declare-fun b_and!32405 () Bool)

(assert (=> b!1023514 (= tp!71625 b_and!32405)))

(declare-fun res!685312 () Bool)

(declare-fun e!576649 () Bool)

(assert (=> start!89390 (=> (not res!685312) (not e!576649))))

(declare-datatypes ((V!36763 0))(
  ( (V!36764 (val!12009 Int)) )
))
(declare-datatypes ((ValueCell!11255 0))(
  ( (ValueCellFull!11255 (v!14574 V!36763)) (EmptyCell!11255) )
))
(declare-datatypes ((array!63927 0))(
  ( (array!63928 (arr!30769 (Array (_ BitVec 32) (_ BitVec 64))) (size!31281 (_ BitVec 32))) )
))
(declare-datatypes ((array!63929 0))(
  ( (array!63930 (arr!30770 (Array (_ BitVec 32) ValueCell!11255)) (size!31282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5104 0))(
  ( (LongMapFixedSize!5105 (defaultEntry!5904 Int) (mask!29553 (_ BitVec 32)) (extraKeys!5636 (_ BitVec 32)) (zeroValue!5740 V!36763) (minValue!5740 V!36763) (_size!2607 (_ BitVec 32)) (_keys!11087 array!63927) (_values!5927 array!63929) (_vacant!2607 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5104)

(declare-fun valid!1949 (LongMapFixedSize!5104) Bool)

(assert (=> start!89390 (= res!685312 (valid!1949 thiss!1427))))

(assert (=> start!89390 e!576649))

(declare-fun e!576652 () Bool)

(assert (=> start!89390 e!576652))

(assert (=> start!89390 true))

(declare-fun b!1023513 () Bool)

(declare-fun res!685314 () Bool)

(assert (=> b!1023513 (=> (not res!685314) (not e!576649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63927 (_ BitVec 32)) Bool)

(assert (=> b!1023513 (= res!685314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11087 thiss!1427) (mask!29553 thiss!1427)))))

(declare-fun mapIsEmpty!37293 () Bool)

(declare-fun mapRes!37293 () Bool)

(assert (=> mapIsEmpty!37293 mapRes!37293))

(declare-fun e!576650 () Bool)

(declare-fun tp_is_empty!23917 () Bool)

(declare-fun array_inv!23867 (array!63927) Bool)

(declare-fun array_inv!23868 (array!63929) Bool)

(assert (=> b!1023514 (= e!576652 (and tp!71625 tp_is_empty!23917 (array_inv!23867 (_keys!11087 thiss!1427)) (array_inv!23868 (_values!5927 thiss!1427)) e!576650))))

(declare-fun b!1023515 () Bool)

(declare-fun e!576654 () Bool)

(assert (=> b!1023515 (= e!576654 tp_is_empty!23917)))

(declare-fun b!1023516 () Bool)

(assert (=> b!1023516 (= e!576650 (and e!576654 mapRes!37293))))

(declare-fun condMapEmpty!37293 () Bool)

(declare-fun mapDefault!37293 () ValueCell!11255)

(assert (=> b!1023516 (= condMapEmpty!37293 (= (arr!30770 (_values!5927 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11255)) mapDefault!37293)))))

(declare-fun b!1023517 () Bool)

(declare-fun res!685315 () Bool)

(assert (=> b!1023517 (=> (not res!685315) (not e!576649))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023517 (= res!685315 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023518 () Bool)

(declare-fun e!576653 () Bool)

(assert (=> b!1023518 (= e!576653 tp_is_empty!23917)))

(declare-fun mapNonEmpty!37293 () Bool)

(declare-fun tp!71626 () Bool)

(assert (=> mapNonEmpty!37293 (= mapRes!37293 (and tp!71626 e!576653))))

(declare-fun mapRest!37293 () (Array (_ BitVec 32) ValueCell!11255))

(declare-fun mapKey!37293 () (_ BitVec 32))

(declare-fun mapValue!37293 () ValueCell!11255)

(assert (=> mapNonEmpty!37293 (= (arr!30770 (_values!5927 thiss!1427)) (store mapRest!37293 mapKey!37293 mapValue!37293))))

(declare-fun b!1023519 () Bool)

(declare-fun res!685316 () Bool)

(assert (=> b!1023519 (=> (not res!685316) (not e!576649))))

(assert (=> b!1023519 (= res!685316 (and (= (size!31282 (_values!5927 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29553 thiss!1427))) (= (size!31281 (_keys!11087 thiss!1427)) (size!31282 (_values!5927 thiss!1427))) (bvsge (mask!29553 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5636 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5636 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1023520 () Bool)

(assert (=> b!1023520 (= e!576649 false)))

(declare-fun lt!450704 () Bool)

(declare-datatypes ((List!21662 0))(
  ( (Nil!21659) (Cons!21658 (h!22865 (_ BitVec 64)) (t!30668 List!21662)) )
))
(declare-fun arrayNoDuplicates!0 (array!63927 (_ BitVec 32) List!21662) Bool)

(assert (=> b!1023520 (= lt!450704 (arrayNoDuplicates!0 (_keys!11087 thiss!1427) #b00000000000000000000000000000000 Nil!21659))))

(declare-fun b!1023521 () Bool)

(declare-fun res!685313 () Bool)

(assert (=> b!1023521 (=> (not res!685313) (not e!576649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023521 (= res!685313 (validMask!0 (mask!29553 thiss!1427)))))

(assert (= (and start!89390 res!685312) b!1023517))

(assert (= (and b!1023517 res!685315) b!1023521))

(assert (= (and b!1023521 res!685313) b!1023519))

(assert (= (and b!1023519 res!685316) b!1023513))

(assert (= (and b!1023513 res!685314) b!1023520))

(assert (= (and b!1023516 condMapEmpty!37293) mapIsEmpty!37293))

(assert (= (and b!1023516 (not condMapEmpty!37293)) mapNonEmpty!37293))

(get-info :version)

(assert (= (and mapNonEmpty!37293 ((_ is ValueCellFull!11255) mapValue!37293)) b!1023518))

(assert (= (and b!1023516 ((_ is ValueCellFull!11255) mapDefault!37293)) b!1023515))

(assert (= b!1023514 b!1023516))

(assert (= start!89390 b!1023514))

(declare-fun m!943027 () Bool)

(assert (=> b!1023513 m!943027))

(declare-fun m!943029 () Bool)

(assert (=> b!1023514 m!943029))

(declare-fun m!943031 () Bool)

(assert (=> b!1023514 m!943031))

(declare-fun m!943033 () Bool)

(assert (=> b!1023520 m!943033))

(declare-fun m!943035 () Bool)

(assert (=> start!89390 m!943035))

(declare-fun m!943037 () Bool)

(assert (=> b!1023521 m!943037))

(declare-fun m!943039 () Bool)

(assert (=> mapNonEmpty!37293 m!943039))

(check-sat (not b!1023520) (not start!89390) (not b_next!20197) (not b!1023521) (not b!1023514) (not b!1023513) b_and!32405 tp_is_empty!23917 (not mapNonEmpty!37293))
(check-sat b_and!32405 (not b_next!20197))
