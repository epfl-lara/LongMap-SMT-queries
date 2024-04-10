; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89200 () Bool)

(assert start!89200)

(declare-fun b!1022708 () Bool)

(declare-fun b_free!20241 () Bool)

(declare-fun b_next!20241 () Bool)

(assert (=> b!1022708 (= b_free!20241 (not b_next!20241))))

(declare-fun tp!71757 () Bool)

(declare-fun b_and!32463 () Bool)

(assert (=> b!1022708 (= tp!71757 b_and!32463)))

(declare-fun tp_is_empty!23961 () Bool)

(declare-fun e!576203 () Bool)

(declare-fun e!576207 () Bool)

(declare-datatypes ((V!36821 0))(
  ( (V!36822 (val!12031 Int)) )
))
(declare-datatypes ((ValueCell!11277 0))(
  ( (ValueCellFull!11277 (v!14600 V!36821)) (EmptyCell!11277) )
))
(declare-datatypes ((array!63966 0))(
  ( (array!63967 (arr!30795 (Array (_ BitVec 32) (_ BitVec 64))) (size!31306 (_ BitVec 32))) )
))
(declare-datatypes ((array!63968 0))(
  ( (array!63969 (arr!30796 (Array (_ BitVec 32) ValueCell!11277)) (size!31307 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5148 0))(
  ( (LongMapFixedSize!5149 (defaultEntry!5926 Int) (mask!29529 (_ BitVec 32)) (extraKeys!5658 (_ BitVec 32)) (zeroValue!5762 V!36821) (minValue!5762 V!36821) (_size!2629 (_ BitVec 32)) (_keys!11071 array!63966) (_values!5949 array!63968) (_vacant!2629 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5148)

(declare-fun array_inv!23867 (array!63966) Bool)

(declare-fun array_inv!23868 (array!63968) Bool)

(assert (=> b!1022708 (= e!576207 (and tp!71757 tp_is_empty!23961 (array_inv!23867 (_keys!11071 thiss!1427)) (array_inv!23868 (_values!5949 thiss!1427)) e!576203))))

(declare-fun mapNonEmpty!37359 () Bool)

(declare-fun mapRes!37359 () Bool)

(declare-fun tp!71758 () Bool)

(declare-fun e!576206 () Bool)

(assert (=> mapNonEmpty!37359 (= mapRes!37359 (and tp!71758 e!576206))))

(declare-fun mapRest!37359 () (Array (_ BitVec 32) ValueCell!11277))

(declare-fun mapValue!37359 () ValueCell!11277)

(declare-fun mapKey!37359 () (_ BitVec 32))

(assert (=> mapNonEmpty!37359 (= (arr!30796 (_values!5949 thiss!1427)) (store mapRest!37359 mapKey!37359 mapValue!37359))))

(declare-fun b!1022710 () Bool)

(declare-fun e!576204 () Bool)

(assert (=> b!1022710 (= e!576204 false)))

(declare-fun lt!450327 () Bool)

(declare-datatypes ((List!21692 0))(
  ( (Nil!21689) (Cons!21688 (h!22886 (_ BitVec 64)) (t!30730 List!21692)) )
))
(declare-fun arrayNoDuplicates!0 (array!63966 (_ BitVec 32) List!21692) Bool)

(assert (=> b!1022710 (= lt!450327 (arrayNoDuplicates!0 (_keys!11071 thiss!1427) #b00000000000000000000000000000000 Nil!21689))))

(declare-fun b!1022711 () Bool)

(declare-fun res!685024 () Bool)

(assert (=> b!1022711 (=> (not res!685024) (not e!576204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022711 (= res!685024 (validMask!0 (mask!29529 thiss!1427)))))

(declare-fun mapIsEmpty!37359 () Bool)

(assert (=> mapIsEmpty!37359 mapRes!37359))

(declare-fun b!1022712 () Bool)

(declare-fun res!685026 () Bool)

(assert (=> b!1022712 (=> (not res!685026) (not e!576204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63966 (_ BitVec 32)) Bool)

(assert (=> b!1022712 (= res!685026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11071 thiss!1427) (mask!29529 thiss!1427)))))

(declare-fun b!1022713 () Bool)

(declare-fun res!685028 () Bool)

(assert (=> b!1022713 (=> (not res!685028) (not e!576204))))

(assert (=> b!1022713 (= res!685028 (and (= (size!31307 (_values!5949 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29529 thiss!1427))) (= (size!31306 (_keys!11071 thiss!1427)) (size!31307 (_values!5949 thiss!1427))) (bvsge (mask!29529 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5658 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5658 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5658 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5658 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5658 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5658 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5658 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022714 () Bool)

(declare-fun res!685027 () Bool)

(assert (=> b!1022714 (=> (not res!685027) (not e!576204))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022714 (= res!685027 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1022715 () Bool)

(declare-fun e!576202 () Bool)

(assert (=> b!1022715 (= e!576202 tp_is_empty!23961)))

(declare-fun b!1022716 () Bool)

(assert (=> b!1022716 (= e!576206 tp_is_empty!23961)))

(declare-fun b!1022709 () Bool)

(assert (=> b!1022709 (= e!576203 (and e!576202 mapRes!37359))))

(declare-fun condMapEmpty!37359 () Bool)

(declare-fun mapDefault!37359 () ValueCell!11277)

(assert (=> b!1022709 (= condMapEmpty!37359 (= (arr!30796 (_values!5949 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11277)) mapDefault!37359)))))

(declare-fun res!685025 () Bool)

(assert (=> start!89200 (=> (not res!685025) (not e!576204))))

(declare-fun valid!1962 (LongMapFixedSize!5148) Bool)

(assert (=> start!89200 (= res!685025 (valid!1962 thiss!1427))))

(assert (=> start!89200 e!576204))

(assert (=> start!89200 e!576207))

(assert (=> start!89200 true))

(assert (= (and start!89200 res!685025) b!1022714))

(assert (= (and b!1022714 res!685027) b!1022711))

(assert (= (and b!1022711 res!685024) b!1022713))

(assert (= (and b!1022713 res!685028) b!1022712))

(assert (= (and b!1022712 res!685026) b!1022710))

(assert (= (and b!1022709 condMapEmpty!37359) mapIsEmpty!37359))

(assert (= (and b!1022709 (not condMapEmpty!37359)) mapNonEmpty!37359))

(get-info :version)

(assert (= (and mapNonEmpty!37359 ((_ is ValueCellFull!11277) mapValue!37359)) b!1022716))

(assert (= (and b!1022709 ((_ is ValueCellFull!11277) mapDefault!37359)) b!1022715))

(assert (= b!1022708 b!1022709))

(assert (= start!89200 b!1022708))

(declare-fun m!941743 () Bool)

(assert (=> start!89200 m!941743))

(declare-fun m!941745 () Bool)

(assert (=> mapNonEmpty!37359 m!941745))

(declare-fun m!941747 () Bool)

(assert (=> b!1022712 m!941747))

(declare-fun m!941749 () Bool)

(assert (=> b!1022710 m!941749))

(declare-fun m!941751 () Bool)

(assert (=> b!1022711 m!941751))

(declare-fun m!941753 () Bool)

(assert (=> b!1022708 m!941753))

(declare-fun m!941755 () Bool)

(assert (=> b!1022708 m!941755))

(check-sat (not start!89200) (not b!1022708) (not b!1022712) tp_is_empty!23961 (not mapNonEmpty!37359) b_and!32463 (not b!1022710) (not b!1022711) (not b_next!20241))
(check-sat b_and!32463 (not b_next!20241))
