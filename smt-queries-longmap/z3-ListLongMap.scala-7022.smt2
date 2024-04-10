; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89146 () Bool)

(assert start!89146)

(declare-fun b!1022070 () Bool)

(declare-fun b_free!20187 () Bool)

(declare-fun b_next!20187 () Bool)

(assert (=> b!1022070 (= b_free!20187 (not b_next!20187))))

(declare-fun tp!71595 () Bool)

(declare-fun b_and!32385 () Bool)

(assert (=> b!1022070 (= tp!71595 b_and!32385)))

(declare-fun b!1022063 () Bool)

(declare-fun e!575719 () Bool)

(declare-fun tp_is_empty!23907 () Bool)

(assert (=> b!1022063 (= e!575719 tp_is_empty!23907)))

(declare-fun b!1022064 () Bool)

(declare-fun res!684728 () Bool)

(declare-fun e!575721 () Bool)

(assert (=> b!1022064 (=> (not res!684728) (not e!575721))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022064 (= res!684728 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022065 () Bool)

(declare-fun res!684729 () Bool)

(assert (=> b!1022065 (=> (not res!684729) (not e!575721))))

(declare-datatypes ((V!36749 0))(
  ( (V!36750 (val!12004 Int)) )
))
(declare-datatypes ((ValueCell!11250 0))(
  ( (ValueCellFull!11250 (v!14573 V!36749)) (EmptyCell!11250) )
))
(declare-datatypes ((array!63858 0))(
  ( (array!63859 (arr!30741 (Array (_ BitVec 32) (_ BitVec 64))) (size!31252 (_ BitVec 32))) )
))
(declare-datatypes ((array!63860 0))(
  ( (array!63861 (arr!30742 (Array (_ BitVec 32) ValueCell!11250)) (size!31253 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5094 0))(
  ( (LongMapFixedSize!5095 (defaultEntry!5899 Int) (mask!29484 (_ BitVec 32)) (extraKeys!5631 (_ BitVec 32)) (zeroValue!5735 V!36749) (minValue!5735 V!36749) (_size!2602 (_ BitVec 32)) (_keys!11044 array!63858) (_values!5922 array!63860) (_vacant!2602 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5094)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022065 (= res!684729 (validMask!0 (mask!29484 thiss!1427)))))

(declare-fun b!1022066 () Bool)

(declare-fun res!684727 () Bool)

(assert (=> b!1022066 (=> (not res!684727) (not e!575721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63858 (_ BitVec 32)) Bool)

(assert (=> b!1022066 (= res!684727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11044 thiss!1427) (mask!29484 thiss!1427)))))

(declare-fun b!1022067 () Bool)

(declare-fun res!684731 () Bool)

(assert (=> b!1022067 (=> (not res!684731) (not e!575721))))

(assert (=> b!1022067 (= res!684731 (and (= (size!31253 (_values!5922 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29484 thiss!1427))) (= (size!31252 (_keys!11044 thiss!1427)) (size!31253 (_values!5922 thiss!1427))) (bvsge (mask!29484 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5631 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5631 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5631 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5631 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5631 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5631 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5631 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37278 () Bool)

(declare-fun mapRes!37278 () Bool)

(assert (=> mapIsEmpty!37278 mapRes!37278))

(declare-fun res!684730 () Bool)

(assert (=> start!89146 (=> (not res!684730) (not e!575721))))

(declare-fun valid!1942 (LongMapFixedSize!5094) Bool)

(assert (=> start!89146 (= res!684730 (valid!1942 thiss!1427))))

(assert (=> start!89146 e!575721))

(declare-fun e!575720 () Bool)

(assert (=> start!89146 e!575720))

(assert (=> start!89146 true))

(declare-fun mapNonEmpty!37278 () Bool)

(declare-fun tp!71596 () Bool)

(assert (=> mapNonEmpty!37278 (= mapRes!37278 (and tp!71596 e!575719))))

(declare-fun mapKey!37278 () (_ BitVec 32))

(declare-fun mapValue!37278 () ValueCell!11250)

(declare-fun mapRest!37278 () (Array (_ BitVec 32) ValueCell!11250))

(assert (=> mapNonEmpty!37278 (= (arr!30742 (_values!5922 thiss!1427)) (store mapRest!37278 mapKey!37278 mapValue!37278))))

(declare-fun b!1022068 () Bool)

(assert (=> b!1022068 (= e!575721 false)))

(declare-fun lt!450174 () Bool)

(declare-datatypes ((List!21671 0))(
  ( (Nil!21668) (Cons!21667 (h!22865 (_ BitVec 64)) (t!30685 List!21671)) )
))
(declare-fun arrayNoDuplicates!0 (array!63858 (_ BitVec 32) List!21671) Bool)

(assert (=> b!1022068 (= lt!450174 (arrayNoDuplicates!0 (_keys!11044 thiss!1427) #b00000000000000000000000000000000 Nil!21668))))

(declare-fun b!1022069 () Bool)

(declare-fun e!575718 () Bool)

(assert (=> b!1022069 (= e!575718 tp_is_empty!23907)))

(declare-fun e!575717 () Bool)

(declare-fun array_inv!23835 (array!63858) Bool)

(declare-fun array_inv!23836 (array!63860) Bool)

(assert (=> b!1022070 (= e!575720 (and tp!71595 tp_is_empty!23907 (array_inv!23835 (_keys!11044 thiss!1427)) (array_inv!23836 (_values!5922 thiss!1427)) e!575717))))

(declare-fun b!1022071 () Bool)

(assert (=> b!1022071 (= e!575717 (and e!575718 mapRes!37278))))

(declare-fun condMapEmpty!37278 () Bool)

(declare-fun mapDefault!37278 () ValueCell!11250)

(assert (=> b!1022071 (= condMapEmpty!37278 (= (arr!30742 (_values!5922 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11250)) mapDefault!37278)))))

(assert (= (and start!89146 res!684730) b!1022064))

(assert (= (and b!1022064 res!684728) b!1022065))

(assert (= (and b!1022065 res!684729) b!1022067))

(assert (= (and b!1022067 res!684731) b!1022066))

(assert (= (and b!1022066 res!684727) b!1022068))

(assert (= (and b!1022071 condMapEmpty!37278) mapIsEmpty!37278))

(assert (= (and b!1022071 (not condMapEmpty!37278)) mapNonEmpty!37278))

(get-info :version)

(assert (= (and mapNonEmpty!37278 ((_ is ValueCellFull!11250) mapValue!37278)) b!1022063))

(assert (= (and b!1022071 ((_ is ValueCellFull!11250) mapDefault!37278)) b!1022069))

(assert (= b!1022070 b!1022071))

(assert (= start!89146 b!1022070))

(declare-fun m!941293 () Bool)

(assert (=> start!89146 m!941293))

(declare-fun m!941295 () Bool)

(assert (=> b!1022070 m!941295))

(declare-fun m!941297 () Bool)

(assert (=> b!1022070 m!941297))

(declare-fun m!941299 () Bool)

(assert (=> mapNonEmpty!37278 m!941299))

(declare-fun m!941301 () Bool)

(assert (=> b!1022068 m!941301))

(declare-fun m!941303 () Bool)

(assert (=> b!1022065 m!941303))

(declare-fun m!941305 () Bool)

(assert (=> b!1022066 m!941305))

(check-sat (not b!1022070) tp_is_empty!23907 (not b!1022066) (not mapNonEmpty!37278) b_and!32385 (not b!1022065) (not start!89146) (not b_next!20187) (not b!1022068))
(check-sat b_and!32385 (not b_next!20187))
