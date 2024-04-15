; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89232 () Bool)

(assert start!89232)

(declare-fun b!1023022 () Bool)

(declare-fun b_free!20275 () Bool)

(declare-fun b_next!20275 () Bool)

(assert (=> b!1023022 (= b_free!20275 (not b_next!20275))))

(declare-fun tp!71860 () Bool)

(declare-fun b_and!32471 () Bool)

(assert (=> b!1023022 (= tp!71860 b_and!32471)))

(declare-fun mapNonEmpty!37410 () Bool)

(declare-fun mapRes!37410 () Bool)

(declare-fun tp!71859 () Bool)

(declare-fun e!576418 () Bool)

(assert (=> mapNonEmpty!37410 (= mapRes!37410 (and tp!71859 e!576418))))

(declare-datatypes ((V!36867 0))(
  ( (V!36868 (val!12048 Int)) )
))
(declare-datatypes ((ValueCell!11294 0))(
  ( (ValueCellFull!11294 (v!14616 V!36867)) (EmptyCell!11294) )
))
(declare-fun mapValue!37410 () ValueCell!11294)

(declare-fun mapKey!37410 () (_ BitVec 32))

(declare-fun mapRest!37410 () (Array (_ BitVec 32) ValueCell!11294))

(declare-datatypes ((array!63973 0))(
  ( (array!63974 (arr!30798 (Array (_ BitVec 32) (_ BitVec 64))) (size!31311 (_ BitVec 32))) )
))
(declare-datatypes ((array!63975 0))(
  ( (array!63976 (arr!30799 (Array (_ BitVec 32) ValueCell!11294)) (size!31312 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5182 0))(
  ( (LongMapFixedSize!5183 (defaultEntry!5943 Int) (mask!29553 (_ BitVec 32)) (extraKeys!5675 (_ BitVec 32)) (zeroValue!5779 V!36867) (minValue!5779 V!36867) (_size!2646 (_ BitVec 32)) (_keys!11084 array!63973) (_values!5966 array!63975) (_vacant!2646 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5182)

(assert (=> mapNonEmpty!37410 (= (arr!30799 (_values!5966 thiss!1427)) (store mapRest!37410 mapKey!37410 mapValue!37410))))

(declare-fun b!1023016 () Bool)

(declare-fun e!576420 () Bool)

(assert (=> b!1023016 (= e!576420 false)))

(declare-fun lt!450178 () Bool)

(declare-datatypes ((List!21734 0))(
  ( (Nil!21731) (Cons!21730 (h!22928 (_ BitVec 64)) (t!30763 List!21734)) )
))
(declare-fun arrayNoDuplicates!0 (array!63973 (_ BitVec 32) List!21734) Bool)

(assert (=> b!1023016 (= lt!450178 (arrayNoDuplicates!0 (_keys!11084 thiss!1427) #b00000000000000000000000000000000 Nil!21731))))

(declare-fun b!1023017 () Bool)

(declare-fun res!685216 () Bool)

(assert (=> b!1023017 (=> (not res!685216) (not e!576420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023017 (= res!685216 (validMask!0 (mask!29553 thiss!1427)))))

(declare-fun b!1023018 () Bool)

(declare-fun e!576422 () Bool)

(declare-fun tp_is_empty!23995 () Bool)

(assert (=> b!1023018 (= e!576422 tp_is_empty!23995)))

(declare-fun mapIsEmpty!37410 () Bool)

(assert (=> mapIsEmpty!37410 mapRes!37410))

(declare-fun b!1023020 () Bool)

(assert (=> b!1023020 (= e!576418 tp_is_empty!23995)))

(declare-fun b!1023021 () Bool)

(declare-fun res!685215 () Bool)

(assert (=> b!1023021 (=> (not res!685215) (not e!576420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63973 (_ BitVec 32)) Bool)

(assert (=> b!1023021 (= res!685215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11084 thiss!1427) (mask!29553 thiss!1427)))))

(declare-fun e!576421 () Bool)

(declare-fun e!576419 () Bool)

(declare-fun array_inv!23883 (array!63973) Bool)

(declare-fun array_inv!23884 (array!63975) Bool)

(assert (=> b!1023022 (= e!576421 (and tp!71860 tp_is_empty!23995 (array_inv!23883 (_keys!11084 thiss!1427)) (array_inv!23884 (_values!5966 thiss!1427)) e!576419))))

(declare-fun res!685212 () Bool)

(assert (=> start!89232 (=> (not res!685212) (not e!576420))))

(declare-fun valid!1971 (LongMapFixedSize!5182) Bool)

(assert (=> start!89232 (= res!685212 (valid!1971 thiss!1427))))

(assert (=> start!89232 e!576420))

(assert (=> start!89232 e!576421))

(assert (=> start!89232 true))

(declare-fun b!1023019 () Bool)

(assert (=> b!1023019 (= e!576419 (and e!576422 mapRes!37410))))

(declare-fun condMapEmpty!37410 () Bool)

(declare-fun mapDefault!37410 () ValueCell!11294)

(assert (=> b!1023019 (= condMapEmpty!37410 (= (arr!30799 (_values!5966 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11294)) mapDefault!37410)))))

(declare-fun b!1023023 () Bool)

(declare-fun res!685213 () Bool)

(assert (=> b!1023023 (=> (not res!685213) (not e!576420))))

(assert (=> b!1023023 (= res!685213 (and (= (size!31312 (_values!5966 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29553 thiss!1427))) (= (size!31311 (_keys!11084 thiss!1427)) (size!31312 (_values!5966 thiss!1427))) (bvsge (mask!29553 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5675 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5675 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5675 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023024 () Bool)

(declare-fun res!685214 () Bool)

(assert (=> b!1023024 (=> (not res!685214) (not e!576420))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023024 (= res!685214 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!89232 res!685212) b!1023024))

(assert (= (and b!1023024 res!685214) b!1023017))

(assert (= (and b!1023017 res!685216) b!1023023))

(assert (= (and b!1023023 res!685213) b!1023021))

(assert (= (and b!1023021 res!685215) b!1023016))

(assert (= (and b!1023019 condMapEmpty!37410) mapIsEmpty!37410))

(assert (= (and b!1023019 (not condMapEmpty!37410)) mapNonEmpty!37410))

(get-info :version)

(assert (= (and mapNonEmpty!37410 ((_ is ValueCellFull!11294) mapValue!37410)) b!1023020))

(assert (= (and b!1023019 ((_ is ValueCellFull!11294) mapDefault!37410)) b!1023018))

(assert (= b!1023022 b!1023019))

(assert (= start!89232 b!1023022))

(declare-fun m!941361 () Bool)

(assert (=> b!1023016 m!941361))

(declare-fun m!941363 () Bool)

(assert (=> b!1023021 m!941363))

(declare-fun m!941365 () Bool)

(assert (=> b!1023017 m!941365))

(declare-fun m!941367 () Bool)

(assert (=> mapNonEmpty!37410 m!941367))

(declare-fun m!941369 () Bool)

(assert (=> start!89232 m!941369))

(declare-fun m!941371 () Bool)

(assert (=> b!1023022 m!941371))

(declare-fun m!941373 () Bool)

(assert (=> b!1023022 m!941373))

(check-sat (not start!89232) tp_is_empty!23995 (not b!1023021) (not b_next!20275) b_and!32471 (not b!1023022) (not mapNonEmpty!37410) (not b!1023016) (not b!1023017))
(check-sat b_and!32471 (not b_next!20275))
