; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89134 () Bool)

(assert start!89134)

(declare-fun b!1021904 () Bool)

(declare-fun b_free!20175 () Bool)

(declare-fun b_next!20175 () Bool)

(assert (=> b!1021904 (= b_free!20175 (not b_next!20175))))

(declare-fun tp!71559 () Bool)

(declare-fun b_and!32373 () Bool)

(assert (=> b!1021904 (= tp!71559 b_and!32373)))

(declare-fun b!1021901 () Bool)

(declare-fun res!684638 () Bool)

(declare-fun e!575611 () Bool)

(assert (=> b!1021901 (=> (not res!684638) (not e!575611))))

(declare-datatypes ((V!36733 0))(
  ( (V!36734 (val!11998 Int)) )
))
(declare-datatypes ((ValueCell!11244 0))(
  ( (ValueCellFull!11244 (v!14567 V!36733)) (EmptyCell!11244) )
))
(declare-datatypes ((array!63834 0))(
  ( (array!63835 (arr!30729 (Array (_ BitVec 32) (_ BitVec 64))) (size!31240 (_ BitVec 32))) )
))
(declare-datatypes ((array!63836 0))(
  ( (array!63837 (arr!30730 (Array (_ BitVec 32) ValueCell!11244)) (size!31241 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5082 0))(
  ( (LongMapFixedSize!5083 (defaultEntry!5893 Int) (mask!29474 (_ BitVec 32)) (extraKeys!5625 (_ BitVec 32)) (zeroValue!5729 V!36733) (minValue!5729 V!36733) (_size!2596 (_ BitVec 32)) (_keys!11038 array!63834) (_values!5916 array!63836) (_vacant!2596 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5082)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63834 (_ BitVec 32)) Bool)

(assert (=> b!1021901 (= res!684638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11038 thiss!1427) (mask!29474 thiss!1427)))))

(declare-fun b!1021902 () Bool)

(assert (=> b!1021902 (= e!575611 false)))

(declare-fun lt!450156 () Bool)

(declare-datatypes ((List!21666 0))(
  ( (Nil!21663) (Cons!21662 (h!22860 (_ BitVec 64)) (t!30680 List!21666)) )
))
(declare-fun arrayNoDuplicates!0 (array!63834 (_ BitVec 32) List!21666) Bool)

(assert (=> b!1021902 (= lt!450156 (arrayNoDuplicates!0 (_keys!11038 thiss!1427) #b00000000000000000000000000000000 Nil!21663))))

(declare-fun tp_is_empty!23895 () Bool)

(declare-fun e!575610 () Bool)

(declare-fun e!575613 () Bool)

(declare-fun array_inv!23825 (array!63834) Bool)

(declare-fun array_inv!23826 (array!63836) Bool)

(assert (=> b!1021904 (= e!575610 (and tp!71559 tp_is_empty!23895 (array_inv!23825 (_keys!11038 thiss!1427)) (array_inv!23826 (_values!5916 thiss!1427)) e!575613))))

(declare-fun b!1021905 () Bool)

(declare-fun res!684641 () Bool)

(assert (=> b!1021905 (=> (not res!684641) (not e!575611))))

(assert (=> b!1021905 (= res!684641 (and (= (size!31241 (_values!5916 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29474 thiss!1427))) (= (size!31240 (_keys!11038 thiss!1427)) (size!31241 (_values!5916 thiss!1427))) (bvsge (mask!29474 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5625 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5625 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5625 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5625 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5625 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5625 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5625 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021906 () Bool)

(declare-fun e!575608 () Bool)

(declare-fun mapRes!37260 () Bool)

(assert (=> b!1021906 (= e!575613 (and e!575608 mapRes!37260))))

(declare-fun condMapEmpty!37260 () Bool)

(declare-fun mapDefault!37260 () ValueCell!11244)

(assert (=> b!1021906 (= condMapEmpty!37260 (= (arr!30730 (_values!5916 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11244)) mapDefault!37260)))))

(declare-fun b!1021907 () Bool)

(assert (=> b!1021907 (= e!575608 tp_is_empty!23895)))

(declare-fun mapNonEmpty!37260 () Bool)

(declare-fun tp!71560 () Bool)

(declare-fun e!575612 () Bool)

(assert (=> mapNonEmpty!37260 (= mapRes!37260 (and tp!71560 e!575612))))

(declare-fun mapKey!37260 () (_ BitVec 32))

(declare-fun mapValue!37260 () ValueCell!11244)

(declare-fun mapRest!37260 () (Array (_ BitVec 32) ValueCell!11244))

(assert (=> mapNonEmpty!37260 (= (arr!30730 (_values!5916 thiss!1427)) (store mapRest!37260 mapKey!37260 mapValue!37260))))

(declare-fun b!1021908 () Bool)

(declare-fun res!684639 () Bool)

(assert (=> b!1021908 (=> (not res!684639) (not e!575611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021908 (= res!684639 (validMask!0 (mask!29474 thiss!1427)))))

(declare-fun res!684637 () Bool)

(assert (=> start!89134 (=> (not res!684637) (not e!575611))))

(declare-fun valid!1938 (LongMapFixedSize!5082) Bool)

(assert (=> start!89134 (= res!684637 (valid!1938 thiss!1427))))

(assert (=> start!89134 e!575611))

(assert (=> start!89134 e!575610))

(assert (=> start!89134 true))

(declare-fun b!1021903 () Bool)

(assert (=> b!1021903 (= e!575612 tp_is_empty!23895)))

(declare-fun mapIsEmpty!37260 () Bool)

(assert (=> mapIsEmpty!37260 mapRes!37260))

(declare-fun b!1021909 () Bool)

(declare-fun res!684640 () Bool)

(assert (=> b!1021909 (=> (not res!684640) (not e!575611))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021909 (= res!684640 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!89134 res!684637) b!1021909))

(assert (= (and b!1021909 res!684640) b!1021908))

(assert (= (and b!1021908 res!684639) b!1021905))

(assert (= (and b!1021905 res!684641) b!1021901))

(assert (= (and b!1021901 res!684638) b!1021902))

(assert (= (and b!1021906 condMapEmpty!37260) mapIsEmpty!37260))

(assert (= (and b!1021906 (not condMapEmpty!37260)) mapNonEmpty!37260))

(get-info :version)

(assert (= (and mapNonEmpty!37260 ((_ is ValueCellFull!11244) mapValue!37260)) b!1021903))

(assert (= (and b!1021906 ((_ is ValueCellFull!11244) mapDefault!37260)) b!1021907))

(assert (= b!1021904 b!1021906))

(assert (= start!89134 b!1021904))

(declare-fun m!941209 () Bool)

(assert (=> b!1021908 m!941209))

(declare-fun m!941211 () Bool)

(assert (=> b!1021901 m!941211))

(declare-fun m!941213 () Bool)

(assert (=> b!1021902 m!941213))

(declare-fun m!941215 () Bool)

(assert (=> b!1021904 m!941215))

(declare-fun m!941217 () Bool)

(assert (=> b!1021904 m!941217))

(declare-fun m!941219 () Bool)

(assert (=> start!89134 m!941219))

(declare-fun m!941221 () Bool)

(assert (=> mapNonEmpty!37260 m!941221))

(check-sat (not b!1021904) (not b_next!20175) (not b!1021902) (not mapNonEmpty!37260) (not b!1021908) (not start!89134) (not b!1021901) b_and!32373 tp_is_empty!23895)
(check-sat b_and!32373 (not b_next!20175))
