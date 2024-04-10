; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89164 () Bool)

(assert start!89164)

(declare-fun b!1022306 () Bool)

(declare-fun b_free!20205 () Bool)

(declare-fun b_next!20205 () Bool)

(assert (=> b!1022306 (= b_free!20205 (not b_next!20205))))

(declare-fun tp!71649 () Bool)

(declare-fun b_and!32403 () Bool)

(assert (=> b!1022306 (= tp!71649 b_and!32403)))

(declare-fun e!575878 () Bool)

(declare-datatypes ((V!36773 0))(
  ( (V!36774 (val!12013 Int)) )
))
(declare-datatypes ((ValueCell!11259 0))(
  ( (ValueCellFull!11259 (v!14582 V!36773)) (EmptyCell!11259) )
))
(declare-datatypes ((array!63894 0))(
  ( (array!63895 (arr!30759 (Array (_ BitVec 32) (_ BitVec 64))) (size!31270 (_ BitVec 32))) )
))
(declare-datatypes ((array!63896 0))(
  ( (array!63897 (arr!30760 (Array (_ BitVec 32) ValueCell!11259)) (size!31271 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5112 0))(
  ( (LongMapFixedSize!5113 (defaultEntry!5908 Int) (mask!29499 (_ BitVec 32)) (extraKeys!5640 (_ BitVec 32)) (zeroValue!5744 V!36773) (minValue!5744 V!36773) (_size!2611 (_ BitVec 32)) (_keys!11053 array!63894) (_values!5931 array!63896) (_vacant!2611 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5112)

(declare-fun e!575882 () Bool)

(declare-fun tp_is_empty!23925 () Bool)

(declare-fun array_inv!23845 (array!63894) Bool)

(declare-fun array_inv!23846 (array!63896) Bool)

(assert (=> b!1022306 (= e!575882 (and tp!71649 tp_is_empty!23925 (array_inv!23845 (_keys!11053 thiss!1427)) (array_inv!23846 (_values!5931 thiss!1427)) e!575878))))

(declare-fun mapNonEmpty!37305 () Bool)

(declare-fun mapRes!37305 () Bool)

(declare-fun tp!71650 () Bool)

(declare-fun e!575883 () Bool)

(assert (=> mapNonEmpty!37305 (= mapRes!37305 (and tp!71650 e!575883))))

(declare-fun mapValue!37305 () ValueCell!11259)

(declare-fun mapRest!37305 () (Array (_ BitVec 32) ValueCell!11259))

(declare-fun mapKey!37305 () (_ BitVec 32))

(assert (=> mapNonEmpty!37305 (= (arr!30760 (_values!5931 thiss!1427)) (store mapRest!37305 mapKey!37305 mapValue!37305))))

(declare-fun res!684863 () Bool)

(declare-fun e!575879 () Bool)

(assert (=> start!89164 (=> (not res!684863) (not e!575879))))

(declare-fun valid!1946 (LongMapFixedSize!5112) Bool)

(assert (=> start!89164 (= res!684863 (valid!1946 thiss!1427))))

(assert (=> start!89164 e!575879))

(assert (=> start!89164 e!575882))

(assert (=> start!89164 true))

(declare-fun b!1022307 () Bool)

(declare-fun res!684862 () Bool)

(assert (=> b!1022307 (=> (not res!684862) (not e!575879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022307 (= res!684862 (validMask!0 (mask!29499 thiss!1427)))))

(declare-fun mapIsEmpty!37305 () Bool)

(assert (=> mapIsEmpty!37305 mapRes!37305))

(declare-fun b!1022308 () Bool)

(declare-fun e!575880 () Bool)

(assert (=> b!1022308 (= e!575878 (and e!575880 mapRes!37305))))

(declare-fun condMapEmpty!37305 () Bool)

(declare-fun mapDefault!37305 () ValueCell!11259)

(assert (=> b!1022308 (= condMapEmpty!37305 (= (arr!30760 (_values!5931 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11259)) mapDefault!37305)))))

(declare-fun b!1022309 () Bool)

(assert (=> b!1022309 (= e!575880 tp_is_empty!23925)))

(declare-fun b!1022310 () Bool)

(declare-fun res!684864 () Bool)

(assert (=> b!1022310 (=> (not res!684864) (not e!575879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63894 (_ BitVec 32)) Bool)

(assert (=> b!1022310 (= res!684864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11053 thiss!1427) (mask!29499 thiss!1427)))))

(declare-fun b!1022311 () Bool)

(assert (=> b!1022311 (= e!575883 tp_is_empty!23925)))

(declare-fun b!1022312 () Bool)

(declare-fun res!684865 () Bool)

(assert (=> b!1022312 (=> (not res!684865) (not e!575879))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022312 (= res!684865 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022313 () Bool)

(assert (=> b!1022313 (= e!575879 false)))

(declare-fun lt!450201 () Bool)

(declare-datatypes ((List!21678 0))(
  ( (Nil!21675) (Cons!21674 (h!22872 (_ BitVec 64)) (t!30692 List!21678)) )
))
(declare-fun arrayNoDuplicates!0 (array!63894 (_ BitVec 32) List!21678) Bool)

(assert (=> b!1022313 (= lt!450201 (arrayNoDuplicates!0 (_keys!11053 thiss!1427) #b00000000000000000000000000000000 Nil!21675))))

(declare-fun b!1022314 () Bool)

(declare-fun res!684866 () Bool)

(assert (=> b!1022314 (=> (not res!684866) (not e!575879))))

(assert (=> b!1022314 (= res!684866 (and (= (size!31271 (_values!5931 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29499 thiss!1427))) (= (size!31270 (_keys!11053 thiss!1427)) (size!31271 (_values!5931 thiss!1427))) (bvsge (mask!29499 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5640 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5640 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5640 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5640 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5640 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5640 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5640 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!89164 res!684863) b!1022312))

(assert (= (and b!1022312 res!684865) b!1022307))

(assert (= (and b!1022307 res!684862) b!1022314))

(assert (= (and b!1022314 res!684866) b!1022310))

(assert (= (and b!1022310 res!684864) b!1022313))

(assert (= (and b!1022308 condMapEmpty!37305) mapIsEmpty!37305))

(assert (= (and b!1022308 (not condMapEmpty!37305)) mapNonEmpty!37305))

(get-info :version)

(assert (= (and mapNonEmpty!37305 ((_ is ValueCellFull!11259) mapValue!37305)) b!1022311))

(assert (= (and b!1022308 ((_ is ValueCellFull!11259) mapDefault!37305)) b!1022309))

(assert (= b!1022306 b!1022308))

(assert (= start!89164 b!1022306))

(declare-fun m!941419 () Bool)

(assert (=> b!1022307 m!941419))

(declare-fun m!941421 () Bool)

(assert (=> b!1022310 m!941421))

(declare-fun m!941423 () Bool)

(assert (=> start!89164 m!941423))

(declare-fun m!941425 () Bool)

(assert (=> mapNonEmpty!37305 m!941425))

(declare-fun m!941427 () Bool)

(assert (=> b!1022313 m!941427))

(declare-fun m!941429 () Bool)

(assert (=> b!1022306 m!941429))

(declare-fun m!941431 () Bool)

(assert (=> b!1022306 m!941431))

(check-sat (not mapNonEmpty!37305) (not start!89164) (not b!1022306) (not b_next!20205) (not b!1022307) tp_is_empty!23925 b_and!32403 (not b!1022313) (not b!1022310))
(check-sat b_and!32403 (not b_next!20205))
