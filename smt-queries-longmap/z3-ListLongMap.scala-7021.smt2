; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89136 () Bool)

(assert start!89136)

(declare-fun b!1021810 () Bool)

(declare-fun b_free!20179 () Bool)

(declare-fun b_next!20179 () Bool)

(assert (=> b!1021810 (= b_free!20179 (not b_next!20179))))

(declare-fun tp!71572 () Bool)

(declare-fun b_and!32351 () Bool)

(assert (=> b!1021810 (= tp!71572 b_and!32351)))

(declare-fun b!1021804 () Bool)

(declare-fun res!684601 () Bool)

(declare-fun e!575555 () Bool)

(assert (=> b!1021804 (=> (not res!684601) (not e!575555))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021804 (= res!684601 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37266 () Bool)

(declare-fun mapRes!37266 () Bool)

(declare-fun tp!71571 () Bool)

(declare-fun e!575554 () Bool)

(assert (=> mapNonEmpty!37266 (= mapRes!37266 (and tp!71571 e!575554))))

(declare-fun mapKey!37266 () (_ BitVec 32))

(declare-datatypes ((V!36739 0))(
  ( (V!36740 (val!12000 Int)) )
))
(declare-datatypes ((ValueCell!11246 0))(
  ( (ValueCellFull!11246 (v!14568 V!36739)) (EmptyCell!11246) )
))
(declare-fun mapRest!37266 () (Array (_ BitVec 32) ValueCell!11246))

(declare-datatypes ((array!63781 0))(
  ( (array!63782 (arr!30702 (Array (_ BitVec 32) (_ BitVec 64))) (size!31215 (_ BitVec 32))) )
))
(declare-datatypes ((array!63783 0))(
  ( (array!63784 (arr!30703 (Array (_ BitVec 32) ValueCell!11246)) (size!31216 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5086 0))(
  ( (LongMapFixedSize!5087 (defaultEntry!5895 Int) (mask!29473 (_ BitVec 32)) (extraKeys!5627 (_ BitVec 32)) (zeroValue!5731 V!36739) (minValue!5731 V!36739) (_size!2598 (_ BitVec 32)) (_keys!11036 array!63781) (_values!5918 array!63783) (_vacant!2598 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5086)

(declare-fun mapValue!37266 () ValueCell!11246)

(assert (=> mapNonEmpty!37266 (= (arr!30703 (_values!5918 thiss!1427)) (store mapRest!37266 mapKey!37266 mapValue!37266))))

(declare-fun b!1021805 () Bool)

(declare-fun tp_is_empty!23899 () Bool)

(assert (=> b!1021805 (= e!575554 tp_is_empty!23899)))

(declare-fun b!1021806 () Bool)

(declare-fun res!684600 () Bool)

(assert (=> b!1021806 (=> (not res!684600) (not e!575555))))

(assert (=> b!1021806 (= res!684600 (and (= (size!31216 (_values!5918 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29473 thiss!1427))) (= (size!31215 (_keys!11036 thiss!1427)) (size!31216 (_values!5918 thiss!1427))) (bvsge (mask!29473 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5627 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5627 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021807 () Bool)

(declare-fun res!684603 () Bool)

(assert (=> b!1021807 (=> (not res!684603) (not e!575555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021807 (= res!684603 (validMask!0 (mask!29473 thiss!1427)))))

(declare-fun b!1021808 () Bool)

(assert (=> b!1021808 (= e!575555 false)))

(declare-fun lt!449962 () Bool)

(declare-datatypes ((List!21700 0))(
  ( (Nil!21697) (Cons!21696 (h!22894 (_ BitVec 64)) (t!30705 List!21700)) )
))
(declare-fun arrayNoDuplicates!0 (array!63781 (_ BitVec 32) List!21700) Bool)

(assert (=> b!1021808 (= lt!449962 (arrayNoDuplicates!0 (_keys!11036 thiss!1427) #b00000000000000000000000000000000 Nil!21697))))

(declare-fun b!1021809 () Bool)

(declare-fun e!575556 () Bool)

(assert (=> b!1021809 (= e!575556 tp_is_empty!23899)))

(declare-fun e!575553 () Bool)

(declare-fun e!575558 () Bool)

(declare-fun array_inv!23817 (array!63781) Bool)

(declare-fun array_inv!23818 (array!63783) Bool)

(assert (=> b!1021810 (= e!575558 (and tp!71572 tp_is_empty!23899 (array_inv!23817 (_keys!11036 thiss!1427)) (array_inv!23818 (_values!5918 thiss!1427)) e!575553))))

(declare-fun b!1021811 () Bool)

(assert (=> b!1021811 (= e!575553 (and e!575556 mapRes!37266))))

(declare-fun condMapEmpty!37266 () Bool)

(declare-fun mapDefault!37266 () ValueCell!11246)

(assert (=> b!1021811 (= condMapEmpty!37266 (= (arr!30703 (_values!5918 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11246)) mapDefault!37266)))))

(declare-fun b!1021812 () Bool)

(declare-fun res!684602 () Bool)

(assert (=> b!1021812 (=> (not res!684602) (not e!575555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63781 (_ BitVec 32)) Bool)

(assert (=> b!1021812 (= res!684602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11036 thiss!1427) (mask!29473 thiss!1427)))))

(declare-fun res!684604 () Bool)

(assert (=> start!89136 (=> (not res!684604) (not e!575555))))

(declare-fun valid!1939 (LongMapFixedSize!5086) Bool)

(assert (=> start!89136 (= res!684604 (valid!1939 thiss!1427))))

(assert (=> start!89136 e!575555))

(assert (=> start!89136 e!575558))

(assert (=> start!89136 true))

(declare-fun mapIsEmpty!37266 () Bool)

(assert (=> mapIsEmpty!37266 mapRes!37266))

(assert (= (and start!89136 res!684604) b!1021804))

(assert (= (and b!1021804 res!684601) b!1021807))

(assert (= (and b!1021807 res!684603) b!1021806))

(assert (= (and b!1021806 res!684600) b!1021812))

(assert (= (and b!1021812 res!684602) b!1021808))

(assert (= (and b!1021811 condMapEmpty!37266) mapIsEmpty!37266))

(assert (= (and b!1021811 (not condMapEmpty!37266)) mapNonEmpty!37266))

(get-info :version)

(assert (= (and mapNonEmpty!37266 ((_ is ValueCellFull!11246) mapValue!37266)) b!1021805))

(assert (= (and b!1021811 ((_ is ValueCellFull!11246) mapDefault!37266)) b!1021809))

(assert (= b!1021810 b!1021811))

(assert (= start!89136 b!1021810))

(declare-fun m!940617 () Bool)

(assert (=> start!89136 m!940617))

(declare-fun m!940619 () Bool)

(assert (=> b!1021812 m!940619))

(declare-fun m!940621 () Bool)

(assert (=> b!1021807 m!940621))

(declare-fun m!940623 () Bool)

(assert (=> mapNonEmpty!37266 m!940623))

(declare-fun m!940625 () Bool)

(assert (=> b!1021810 m!940625))

(declare-fun m!940627 () Bool)

(assert (=> b!1021810 m!940627))

(declare-fun m!940629 () Bool)

(assert (=> b!1021808 m!940629))

(check-sat (not start!89136) (not b!1021808) (not b_next!20179) (not b!1021810) tp_is_empty!23899 (not mapNonEmpty!37266) (not b!1021812) b_and!32351 (not b!1021807))
(check-sat b_and!32351 (not b_next!20179))
