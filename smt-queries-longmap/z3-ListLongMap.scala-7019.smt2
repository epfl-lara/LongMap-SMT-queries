; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89128 () Bool)

(assert start!89128)

(declare-fun b!1021825 () Bool)

(declare-fun b_free!20169 () Bool)

(declare-fun b_next!20169 () Bool)

(assert (=> b!1021825 (= b_free!20169 (not b_next!20169))))

(declare-fun tp!71542 () Bool)

(declare-fun b_and!32367 () Bool)

(assert (=> b!1021825 (= tp!71542 b_and!32367)))

(declare-fun b!1021820 () Bool)

(declare-fun res!684595 () Bool)

(declare-fun e!575555 () Bool)

(assert (=> b!1021820 (=> (not res!684595) (not e!575555))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021820 (= res!684595 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!684593 () Bool)

(assert (=> start!89128 (=> (not res!684593) (not e!575555))))

(declare-datatypes ((V!36725 0))(
  ( (V!36726 (val!11995 Int)) )
))
(declare-datatypes ((ValueCell!11241 0))(
  ( (ValueCellFull!11241 (v!14564 V!36725)) (EmptyCell!11241) )
))
(declare-datatypes ((array!63822 0))(
  ( (array!63823 (arr!30723 (Array (_ BitVec 32) (_ BitVec 64))) (size!31234 (_ BitVec 32))) )
))
(declare-datatypes ((array!63824 0))(
  ( (array!63825 (arr!30724 (Array (_ BitVec 32) ValueCell!11241)) (size!31235 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5076 0))(
  ( (LongMapFixedSize!5077 (defaultEntry!5890 Int) (mask!29469 (_ BitVec 32)) (extraKeys!5622 (_ BitVec 32)) (zeroValue!5726 V!36725) (minValue!5726 V!36725) (_size!2593 (_ BitVec 32)) (_keys!11035 array!63822) (_values!5913 array!63824) (_vacant!2593 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5076)

(declare-fun valid!1936 (LongMapFixedSize!5076) Bool)

(assert (=> start!89128 (= res!684593 (valid!1936 thiss!1427))))

(assert (=> start!89128 e!575555))

(declare-fun e!575556 () Bool)

(assert (=> start!89128 e!575556))

(assert (=> start!89128 true))

(declare-fun b!1021821 () Bool)

(declare-fun res!684596 () Bool)

(assert (=> b!1021821 (=> (not res!684596) (not e!575555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63822 (_ BitVec 32)) Bool)

(assert (=> b!1021821 (= res!684596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11035 thiss!1427) (mask!29469 thiss!1427)))))

(declare-fun b!1021822 () Bool)

(declare-fun e!575559 () Bool)

(declare-fun tp_is_empty!23889 () Bool)

(assert (=> b!1021822 (= e!575559 tp_is_empty!23889)))

(declare-fun b!1021823 () Bool)

(declare-fun e!575557 () Bool)

(declare-fun mapRes!37251 () Bool)

(assert (=> b!1021823 (= e!575557 (and e!575559 mapRes!37251))))

(declare-fun condMapEmpty!37251 () Bool)

(declare-fun mapDefault!37251 () ValueCell!11241)

(assert (=> b!1021823 (= condMapEmpty!37251 (= (arr!30724 (_values!5913 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11241)) mapDefault!37251)))))

(declare-fun b!1021824 () Bool)

(declare-fun res!684592 () Bool)

(assert (=> b!1021824 (=> (not res!684592) (not e!575555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021824 (= res!684592 (validMask!0 (mask!29469 thiss!1427)))))

(declare-fun mapNonEmpty!37251 () Bool)

(declare-fun tp!71541 () Bool)

(declare-fun e!575558 () Bool)

(assert (=> mapNonEmpty!37251 (= mapRes!37251 (and tp!71541 e!575558))))

(declare-fun mapRest!37251 () (Array (_ BitVec 32) ValueCell!11241))

(declare-fun mapKey!37251 () (_ BitVec 32))

(declare-fun mapValue!37251 () ValueCell!11241)

(assert (=> mapNonEmpty!37251 (= (arr!30724 (_values!5913 thiss!1427)) (store mapRest!37251 mapKey!37251 mapValue!37251))))

(declare-fun array_inv!23819 (array!63822) Bool)

(declare-fun array_inv!23820 (array!63824) Bool)

(assert (=> b!1021825 (= e!575556 (and tp!71542 tp_is_empty!23889 (array_inv!23819 (_keys!11035 thiss!1427)) (array_inv!23820 (_values!5913 thiss!1427)) e!575557))))

(declare-fun b!1021826 () Bool)

(assert (=> b!1021826 (= e!575558 tp_is_empty!23889)))

(declare-fun mapIsEmpty!37251 () Bool)

(assert (=> mapIsEmpty!37251 mapRes!37251))

(declare-fun b!1021827 () Bool)

(assert (=> b!1021827 (= e!575555 false)))

(declare-fun lt!450147 () Bool)

(declare-datatypes ((List!21663 0))(
  ( (Nil!21660) (Cons!21659 (h!22857 (_ BitVec 64)) (t!30677 List!21663)) )
))
(declare-fun arrayNoDuplicates!0 (array!63822 (_ BitVec 32) List!21663) Bool)

(assert (=> b!1021827 (= lt!450147 (arrayNoDuplicates!0 (_keys!11035 thiss!1427) #b00000000000000000000000000000000 Nil!21660))))

(declare-fun b!1021828 () Bool)

(declare-fun res!684594 () Bool)

(assert (=> b!1021828 (=> (not res!684594) (not e!575555))))

(assert (=> b!1021828 (= res!684594 (and (= (size!31235 (_values!5913 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29469 thiss!1427))) (= (size!31234 (_keys!11035 thiss!1427)) (size!31235 (_values!5913 thiss!1427))) (bvsge (mask!29469 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5622 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5622 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5622 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5622 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5622 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5622 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5622 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!89128 res!684593) b!1021820))

(assert (= (and b!1021820 res!684595) b!1021824))

(assert (= (and b!1021824 res!684592) b!1021828))

(assert (= (and b!1021828 res!684594) b!1021821))

(assert (= (and b!1021821 res!684596) b!1021827))

(assert (= (and b!1021823 condMapEmpty!37251) mapIsEmpty!37251))

(assert (= (and b!1021823 (not condMapEmpty!37251)) mapNonEmpty!37251))

(get-info :version)

(assert (= (and mapNonEmpty!37251 ((_ is ValueCellFull!11241) mapValue!37251)) b!1021826))

(assert (= (and b!1021823 ((_ is ValueCellFull!11241) mapDefault!37251)) b!1021822))

(assert (= b!1021825 b!1021823))

(assert (= start!89128 b!1021825))

(declare-fun m!941167 () Bool)

(assert (=> b!1021825 m!941167))

(declare-fun m!941169 () Bool)

(assert (=> b!1021825 m!941169))

(declare-fun m!941171 () Bool)

(assert (=> mapNonEmpty!37251 m!941171))

(declare-fun m!941173 () Bool)

(assert (=> b!1021821 m!941173))

(declare-fun m!941175 () Bool)

(assert (=> b!1021824 m!941175))

(declare-fun m!941177 () Bool)

(assert (=> start!89128 m!941177))

(declare-fun m!941179 () Bool)

(assert (=> b!1021827 m!941179))

(check-sat (not b!1021824) (not b!1021821) b_and!32367 (not b!1021827) (not b_next!20169) tp_is_empty!23889 (not b!1021825) (not mapNonEmpty!37251) (not start!89128))
(check-sat b_and!32367 (not b_next!20169))
