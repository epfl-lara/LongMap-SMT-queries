; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89116 () Bool)

(assert start!89116)

(declare-fun b!1021658 () Bool)

(declare-fun b_free!20157 () Bool)

(declare-fun b_next!20157 () Bool)

(assert (=> b!1021658 (= b_free!20157 (not b_next!20157))))

(declare-fun tp!71506 () Bool)

(declare-fun b_and!32355 () Bool)

(assert (=> b!1021658 (= tp!71506 b_and!32355)))

(declare-fun e!575449 () Bool)

(declare-fun e!575446 () Bool)

(declare-datatypes ((V!36709 0))(
  ( (V!36710 (val!11989 Int)) )
))
(declare-datatypes ((ValueCell!11235 0))(
  ( (ValueCellFull!11235 (v!14558 V!36709)) (EmptyCell!11235) )
))
(declare-datatypes ((array!63798 0))(
  ( (array!63799 (arr!30711 (Array (_ BitVec 32) (_ BitVec 64))) (size!31222 (_ BitVec 32))) )
))
(declare-datatypes ((array!63800 0))(
  ( (array!63801 (arr!30712 (Array (_ BitVec 32) ValueCell!11235)) (size!31223 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5064 0))(
  ( (LongMapFixedSize!5065 (defaultEntry!5884 Int) (mask!29459 (_ BitVec 32)) (extraKeys!5616 (_ BitVec 32)) (zeroValue!5720 V!36709) (minValue!5720 V!36709) (_size!2587 (_ BitVec 32)) (_keys!11029 array!63798) (_values!5907 array!63800) (_vacant!2587 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5064)

(declare-fun tp_is_empty!23877 () Bool)

(declare-fun array_inv!23813 (array!63798) Bool)

(declare-fun array_inv!23814 (array!63800) Bool)

(assert (=> b!1021658 (= e!575449 (and tp!71506 tp_is_empty!23877 (array_inv!23813 (_keys!11029 thiss!1427)) (array_inv!23814 (_values!5907 thiss!1427)) e!575446))))

(declare-fun b!1021659 () Bool)

(declare-fun e!575448 () Bool)

(assert (=> b!1021659 (= e!575448 tp_is_empty!23877)))

(declare-fun b!1021660 () Bool)

(declare-fun res!684502 () Bool)

(declare-fun e!575447 () Bool)

(assert (=> b!1021660 (=> (not res!684502) (not e!575447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021660 (= res!684502 (validMask!0 (mask!29459 thiss!1427)))))

(declare-fun b!1021661 () Bool)

(declare-fun res!684505 () Bool)

(assert (=> b!1021661 (=> (not res!684505) (not e!575447))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021661 (= res!684505 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021662 () Bool)

(declare-fun e!575451 () Bool)

(assert (=> b!1021662 (= e!575451 tp_is_empty!23877)))

(declare-fun mapNonEmpty!37233 () Bool)

(declare-fun mapRes!37233 () Bool)

(declare-fun tp!71505 () Bool)

(assert (=> mapNonEmpty!37233 (= mapRes!37233 (and tp!71505 e!575451))))

(declare-fun mapValue!37233 () ValueCell!11235)

(declare-fun mapKey!37233 () (_ BitVec 32))

(declare-fun mapRest!37233 () (Array (_ BitVec 32) ValueCell!11235))

(assert (=> mapNonEmpty!37233 (= (arr!30712 (_values!5907 thiss!1427)) (store mapRest!37233 mapKey!37233 mapValue!37233))))

(declare-fun res!684504 () Bool)

(assert (=> start!89116 (=> (not res!684504) (not e!575447))))

(declare-fun valid!1932 (LongMapFixedSize!5064) Bool)

(assert (=> start!89116 (= res!684504 (valid!1932 thiss!1427))))

(assert (=> start!89116 e!575447))

(assert (=> start!89116 e!575449))

(assert (=> start!89116 true))

(declare-fun mapIsEmpty!37233 () Bool)

(assert (=> mapIsEmpty!37233 mapRes!37233))

(declare-fun b!1021663 () Bool)

(assert (=> b!1021663 (= e!575447 false)))

(declare-fun lt!450129 () Bool)

(declare-datatypes ((List!21659 0))(
  ( (Nil!21656) (Cons!21655 (h!22853 (_ BitVec 64)) (t!30673 List!21659)) )
))
(declare-fun arrayNoDuplicates!0 (array!63798 (_ BitVec 32) List!21659) Bool)

(assert (=> b!1021663 (= lt!450129 (arrayNoDuplicates!0 (_keys!11029 thiss!1427) #b00000000000000000000000000000000 Nil!21656))))

(declare-fun b!1021664 () Bool)

(declare-fun res!684503 () Bool)

(assert (=> b!1021664 (=> (not res!684503) (not e!575447))))

(assert (=> b!1021664 (= res!684503 (and (= (size!31223 (_values!5907 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29459 thiss!1427))) (= (size!31222 (_keys!11029 thiss!1427)) (size!31223 (_values!5907 thiss!1427))) (bvsge (mask!29459 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5616 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5616 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5616 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5616 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5616 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5616 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5616 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021665 () Bool)

(assert (=> b!1021665 (= e!575446 (and e!575448 mapRes!37233))))

(declare-fun condMapEmpty!37233 () Bool)

(declare-fun mapDefault!37233 () ValueCell!11235)

(assert (=> b!1021665 (= condMapEmpty!37233 (= (arr!30712 (_values!5907 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11235)) mapDefault!37233)))))

(declare-fun b!1021666 () Bool)

(declare-fun res!684506 () Bool)

(assert (=> b!1021666 (=> (not res!684506) (not e!575447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63798 (_ BitVec 32)) Bool)

(assert (=> b!1021666 (= res!684506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11029 thiss!1427) (mask!29459 thiss!1427)))))

(assert (= (and start!89116 res!684504) b!1021661))

(assert (= (and b!1021661 res!684505) b!1021660))

(assert (= (and b!1021660 res!684502) b!1021664))

(assert (= (and b!1021664 res!684503) b!1021666))

(assert (= (and b!1021666 res!684506) b!1021663))

(assert (= (and b!1021665 condMapEmpty!37233) mapIsEmpty!37233))

(assert (= (and b!1021665 (not condMapEmpty!37233)) mapNonEmpty!37233))

(get-info :version)

(assert (= (and mapNonEmpty!37233 ((_ is ValueCellFull!11235) mapValue!37233)) b!1021662))

(assert (= (and b!1021665 ((_ is ValueCellFull!11235) mapDefault!37233)) b!1021659))

(assert (= b!1021658 b!1021665))

(assert (= start!89116 b!1021658))

(declare-fun m!941083 () Bool)

(assert (=> b!1021658 m!941083))

(declare-fun m!941085 () Bool)

(assert (=> b!1021658 m!941085))

(declare-fun m!941087 () Bool)

(assert (=> mapNonEmpty!37233 m!941087))

(declare-fun m!941089 () Bool)

(assert (=> b!1021663 m!941089))

(declare-fun m!941091 () Bool)

(assert (=> b!1021660 m!941091))

(declare-fun m!941093 () Bool)

(assert (=> start!89116 m!941093))

(declare-fun m!941095 () Bool)

(assert (=> b!1021666 m!941095))

(check-sat (not start!89116) (not mapNonEmpty!37233) (not b!1021660) (not b!1021666) (not b!1021663) (not b_next!20157) (not b!1021658) tp_is_empty!23877 b_and!32355)
(check-sat b_and!32355 (not b_next!20157))
