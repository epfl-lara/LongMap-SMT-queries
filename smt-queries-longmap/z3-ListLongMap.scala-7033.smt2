; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89208 () Bool)

(assert start!89208)

(declare-fun b!1022697 () Bool)

(declare-fun b_free!20251 () Bool)

(declare-fun b_next!20251 () Bool)

(assert (=> b!1022697 (= b_free!20251 (not b_next!20251))))

(declare-fun tp!71788 () Bool)

(declare-fun b_and!32447 () Bool)

(assert (=> b!1022697 (= tp!71788 b_and!32447)))

(declare-fun b!1022692 () Bool)

(declare-fun e!576205 () Bool)

(assert (=> b!1022692 (= e!576205 false)))

(declare-fun lt!450142 () Bool)

(declare-datatypes ((V!36835 0))(
  ( (V!36836 (val!12036 Int)) )
))
(declare-datatypes ((ValueCell!11282 0))(
  ( (ValueCellFull!11282 (v!14604 V!36835)) (EmptyCell!11282) )
))
(declare-datatypes ((array!63925 0))(
  ( (array!63926 (arr!30774 (Array (_ BitVec 32) (_ BitVec 64))) (size!31287 (_ BitVec 32))) )
))
(declare-datatypes ((array!63927 0))(
  ( (array!63928 (arr!30775 (Array (_ BitVec 32) ValueCell!11282)) (size!31288 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5158 0))(
  ( (LongMapFixedSize!5159 (defaultEntry!5931 Int) (mask!29533 (_ BitVec 32)) (extraKeys!5663 (_ BitVec 32)) (zeroValue!5767 V!36835) (minValue!5767 V!36835) (_size!2634 (_ BitVec 32)) (_keys!11072 array!63925) (_values!5954 array!63927) (_vacant!2634 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5158)

(declare-datatypes ((List!21727 0))(
  ( (Nil!21724) (Cons!21723 (h!22921 (_ BitVec 64)) (t!30756 List!21727)) )
))
(declare-fun arrayNoDuplicates!0 (array!63925 (_ BitVec 32) List!21727) Bool)

(assert (=> b!1022692 (= lt!450142 (arrayNoDuplicates!0 (_keys!11072 thiss!1427) #b00000000000000000000000000000000 Nil!21724))))

(declare-fun mapIsEmpty!37374 () Bool)

(declare-fun mapRes!37374 () Bool)

(assert (=> mapIsEmpty!37374 mapRes!37374))

(declare-fun b!1022693 () Bool)

(declare-fun res!685036 () Bool)

(assert (=> b!1022693 (=> (not res!685036) (not e!576205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63925 (_ BitVec 32)) Bool)

(assert (=> b!1022693 (= res!685036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11072 thiss!1427) (mask!29533 thiss!1427)))))

(declare-fun b!1022694 () Bool)

(declare-fun e!576206 () Bool)

(declare-fun tp_is_empty!23971 () Bool)

(assert (=> b!1022694 (= e!576206 tp_is_empty!23971)))

(declare-fun b!1022695 () Bool)

(declare-fun res!685033 () Bool)

(assert (=> b!1022695 (=> (not res!685033) (not e!576205))))

(assert (=> b!1022695 (= res!685033 (and (= (size!31288 (_values!5954 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29533 thiss!1427))) (= (size!31287 (_keys!11072 thiss!1427)) (size!31288 (_values!5954 thiss!1427))) (bvsge (mask!29533 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5663 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5663 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022696 () Bool)

(declare-fun res!685032 () Bool)

(assert (=> b!1022696 (=> (not res!685032) (not e!576205))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022696 (= res!685032 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!576204 () Bool)

(declare-fun e!576201 () Bool)

(declare-fun array_inv!23869 (array!63925) Bool)

(declare-fun array_inv!23870 (array!63927) Bool)

(assert (=> b!1022697 (= e!576204 (and tp!71788 tp_is_empty!23971 (array_inv!23869 (_keys!11072 thiss!1427)) (array_inv!23870 (_values!5954 thiss!1427)) e!576201))))

(declare-fun b!1022698 () Bool)

(declare-fun res!685035 () Bool)

(assert (=> b!1022698 (=> (not res!685035) (not e!576205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022698 (= res!685035 (validMask!0 (mask!29533 thiss!1427)))))

(declare-fun mapNonEmpty!37374 () Bool)

(declare-fun tp!71787 () Bool)

(assert (=> mapNonEmpty!37374 (= mapRes!37374 (and tp!71787 e!576206))))

(declare-fun mapRest!37374 () (Array (_ BitVec 32) ValueCell!11282))

(declare-fun mapKey!37374 () (_ BitVec 32))

(declare-fun mapValue!37374 () ValueCell!11282)

(assert (=> mapNonEmpty!37374 (= (arr!30775 (_values!5954 thiss!1427)) (store mapRest!37374 mapKey!37374 mapValue!37374))))

(declare-fun res!685034 () Bool)

(assert (=> start!89208 (=> (not res!685034) (not e!576205))))

(declare-fun valid!1964 (LongMapFixedSize!5158) Bool)

(assert (=> start!89208 (= res!685034 (valid!1964 thiss!1427))))

(assert (=> start!89208 e!576205))

(assert (=> start!89208 e!576204))

(assert (=> start!89208 true))

(declare-fun b!1022699 () Bool)

(declare-fun e!576202 () Bool)

(assert (=> b!1022699 (= e!576201 (and e!576202 mapRes!37374))))

(declare-fun condMapEmpty!37374 () Bool)

(declare-fun mapDefault!37374 () ValueCell!11282)

(assert (=> b!1022699 (= condMapEmpty!37374 (= (arr!30775 (_values!5954 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11282)) mapDefault!37374)))))

(declare-fun b!1022700 () Bool)

(assert (=> b!1022700 (= e!576202 tp_is_empty!23971)))

(assert (= (and start!89208 res!685034) b!1022696))

(assert (= (and b!1022696 res!685032) b!1022698))

(assert (= (and b!1022698 res!685035) b!1022695))

(assert (= (and b!1022695 res!685033) b!1022693))

(assert (= (and b!1022693 res!685036) b!1022692))

(assert (= (and b!1022699 condMapEmpty!37374) mapIsEmpty!37374))

(assert (= (and b!1022699 (not condMapEmpty!37374)) mapNonEmpty!37374))

(get-info :version)

(assert (= (and mapNonEmpty!37374 ((_ is ValueCellFull!11282) mapValue!37374)) b!1022694))

(assert (= (and b!1022699 ((_ is ValueCellFull!11282) mapDefault!37374)) b!1022700))

(assert (= b!1022697 b!1022699))

(assert (= start!89208 b!1022697))

(declare-fun m!941193 () Bool)

(assert (=> start!89208 m!941193))

(declare-fun m!941195 () Bool)

(assert (=> mapNonEmpty!37374 m!941195))

(declare-fun m!941197 () Bool)

(assert (=> b!1022698 m!941197))

(declare-fun m!941199 () Bool)

(assert (=> b!1022697 m!941199))

(declare-fun m!941201 () Bool)

(assert (=> b!1022697 m!941201))

(declare-fun m!941203 () Bool)

(assert (=> b!1022692 m!941203))

(declare-fun m!941205 () Bool)

(assert (=> b!1022693 m!941205))

(check-sat (not start!89208) (not mapNonEmpty!37374) (not b!1022698) (not b_next!20251) (not b!1022692) tp_is_empty!23971 (not b!1022697) (not b!1022693) b_and!32447)
(check-sat b_and!32447 (not b_next!20251))
