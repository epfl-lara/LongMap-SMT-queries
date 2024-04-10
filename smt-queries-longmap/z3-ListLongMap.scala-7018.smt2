; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89122 () Bool)

(assert start!89122)

(declare-fun b!1021747 () Bool)

(declare-fun b_free!20163 () Bool)

(declare-fun b_next!20163 () Bool)

(assert (=> b!1021747 (= b_free!20163 (not b_next!20163))))

(declare-fun tp!71523 () Bool)

(declare-fun b_and!32361 () Bool)

(assert (=> b!1021747 (= tp!71523 b_and!32361)))

(declare-fun res!684549 () Bool)

(declare-fun e!575504 () Bool)

(assert (=> start!89122 (=> (not res!684549) (not e!575504))))

(declare-datatypes ((V!36717 0))(
  ( (V!36718 (val!11992 Int)) )
))
(declare-datatypes ((ValueCell!11238 0))(
  ( (ValueCellFull!11238 (v!14561 V!36717)) (EmptyCell!11238) )
))
(declare-datatypes ((array!63810 0))(
  ( (array!63811 (arr!30717 (Array (_ BitVec 32) (_ BitVec 64))) (size!31228 (_ BitVec 32))) )
))
(declare-datatypes ((array!63812 0))(
  ( (array!63813 (arr!30718 (Array (_ BitVec 32) ValueCell!11238)) (size!31229 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5070 0))(
  ( (LongMapFixedSize!5071 (defaultEntry!5887 Int) (mask!29464 (_ BitVec 32)) (extraKeys!5619 (_ BitVec 32)) (zeroValue!5723 V!36717) (minValue!5723 V!36717) (_size!2590 (_ BitVec 32)) (_keys!11032 array!63810) (_values!5910 array!63812) (_vacant!2590 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5070)

(declare-fun valid!1934 (LongMapFixedSize!5070) Bool)

(assert (=> start!89122 (= res!684549 (valid!1934 thiss!1427))))

(assert (=> start!89122 e!575504))

(declare-fun e!575500 () Bool)

(assert (=> start!89122 e!575500))

(assert (=> start!89122 true))

(declare-fun mapNonEmpty!37242 () Bool)

(declare-fun mapRes!37242 () Bool)

(declare-fun tp!71524 () Bool)

(declare-fun e!575503 () Bool)

(assert (=> mapNonEmpty!37242 (= mapRes!37242 (and tp!71524 e!575503))))

(declare-fun mapRest!37242 () (Array (_ BitVec 32) ValueCell!11238))

(declare-fun mapValue!37242 () ValueCell!11238)

(declare-fun mapKey!37242 () (_ BitVec 32))

(assert (=> mapNonEmpty!37242 (= (arr!30718 (_values!5910 thiss!1427)) (store mapRest!37242 mapKey!37242 mapValue!37242))))

(declare-fun b!1021739 () Bool)

(assert (=> b!1021739 (= e!575504 false)))

(declare-fun lt!450138 () Bool)

(declare-datatypes ((List!21661 0))(
  ( (Nil!21658) (Cons!21657 (h!22855 (_ BitVec 64)) (t!30675 List!21661)) )
))
(declare-fun arrayNoDuplicates!0 (array!63810 (_ BitVec 32) List!21661) Bool)

(assert (=> b!1021739 (= lt!450138 (arrayNoDuplicates!0 (_keys!11032 thiss!1427) #b00000000000000000000000000000000 Nil!21658))))

(declare-fun b!1021740 () Bool)

(declare-fun res!684551 () Bool)

(assert (=> b!1021740 (=> (not res!684551) (not e!575504))))

(assert (=> b!1021740 (= res!684551 (and (= (size!31229 (_values!5910 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29464 thiss!1427))) (= (size!31228 (_keys!11032 thiss!1427)) (size!31229 (_values!5910 thiss!1427))) (bvsge (mask!29464 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5619 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5619 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5619 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5619 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5619 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5619 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5619 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021741 () Bool)

(declare-fun e!575502 () Bool)

(declare-fun e!575501 () Bool)

(assert (=> b!1021741 (= e!575502 (and e!575501 mapRes!37242))))

(declare-fun condMapEmpty!37242 () Bool)

(declare-fun mapDefault!37242 () ValueCell!11238)

(assert (=> b!1021741 (= condMapEmpty!37242 (= (arr!30718 (_values!5910 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11238)) mapDefault!37242)))))

(declare-fun b!1021742 () Bool)

(declare-fun res!684547 () Bool)

(assert (=> b!1021742 (=> (not res!684547) (not e!575504))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021742 (= res!684547 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021743 () Bool)

(declare-fun res!684548 () Bool)

(assert (=> b!1021743 (=> (not res!684548) (not e!575504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63810 (_ BitVec 32)) Bool)

(assert (=> b!1021743 (= res!684548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11032 thiss!1427) (mask!29464 thiss!1427)))))

(declare-fun b!1021744 () Bool)

(declare-fun tp_is_empty!23883 () Bool)

(assert (=> b!1021744 (= e!575501 tp_is_empty!23883)))

(declare-fun mapIsEmpty!37242 () Bool)

(assert (=> mapIsEmpty!37242 mapRes!37242))

(declare-fun b!1021745 () Bool)

(assert (=> b!1021745 (= e!575503 tp_is_empty!23883)))

(declare-fun b!1021746 () Bool)

(declare-fun res!684550 () Bool)

(assert (=> b!1021746 (=> (not res!684550) (not e!575504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021746 (= res!684550 (validMask!0 (mask!29464 thiss!1427)))))

(declare-fun array_inv!23817 (array!63810) Bool)

(declare-fun array_inv!23818 (array!63812) Bool)

(assert (=> b!1021747 (= e!575500 (and tp!71523 tp_is_empty!23883 (array_inv!23817 (_keys!11032 thiss!1427)) (array_inv!23818 (_values!5910 thiss!1427)) e!575502))))

(assert (= (and start!89122 res!684549) b!1021742))

(assert (= (and b!1021742 res!684547) b!1021746))

(assert (= (and b!1021746 res!684550) b!1021740))

(assert (= (and b!1021740 res!684551) b!1021743))

(assert (= (and b!1021743 res!684548) b!1021739))

(assert (= (and b!1021741 condMapEmpty!37242) mapIsEmpty!37242))

(assert (= (and b!1021741 (not condMapEmpty!37242)) mapNonEmpty!37242))

(get-info :version)

(assert (= (and mapNonEmpty!37242 ((_ is ValueCellFull!11238) mapValue!37242)) b!1021745))

(assert (= (and b!1021741 ((_ is ValueCellFull!11238) mapDefault!37242)) b!1021744))

(assert (= b!1021747 b!1021741))

(assert (= start!89122 b!1021747))

(declare-fun m!941125 () Bool)

(assert (=> b!1021746 m!941125))

(declare-fun m!941127 () Bool)

(assert (=> b!1021743 m!941127))

(declare-fun m!941129 () Bool)

(assert (=> start!89122 m!941129))

(declare-fun m!941131 () Bool)

(assert (=> mapNonEmpty!37242 m!941131))

(declare-fun m!941133 () Bool)

(assert (=> b!1021739 m!941133))

(declare-fun m!941135 () Bool)

(assert (=> b!1021747 m!941135))

(declare-fun m!941137 () Bool)

(assert (=> b!1021747 m!941137))

(check-sat b_and!32361 (not b!1021747) (not b_next!20163) (not b!1021743) (not b!1021746) (not start!89122) (not mapNonEmpty!37242) (not b!1021739) tp_is_empty!23883)
(check-sat b_and!32361 (not b_next!20163))
