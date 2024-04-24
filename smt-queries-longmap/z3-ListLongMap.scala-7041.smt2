; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89492 () Bool)

(assert start!89492)

(declare-fun b!1024807 () Bool)

(declare-fun b_free!20299 () Bool)

(declare-fun b_next!20299 () Bool)

(assert (=> b!1024807 (= b_free!20299 (not b_next!20299))))

(declare-fun tp!71931 () Bool)

(declare-fun b_and!32531 () Bool)

(assert (=> b!1024807 (= tp!71931 b_and!32531)))

(declare-fun mapIsEmpty!37446 () Bool)

(declare-fun mapRes!37446 () Bool)

(assert (=> mapIsEmpty!37446 mapRes!37446))

(declare-fun res!685970 () Bool)

(declare-fun e!577570 () Bool)

(assert (=> start!89492 (=> (not res!685970) (not e!577570))))

(declare-datatypes ((V!36899 0))(
  ( (V!36900 (val!12060 Int)) )
))
(declare-datatypes ((ValueCell!11306 0))(
  ( (ValueCellFull!11306 (v!14625 V!36899)) (EmptyCell!11306) )
))
(declare-datatypes ((array!64131 0))(
  ( (array!64132 (arr!30871 (Array (_ BitVec 32) (_ BitVec 64))) (size!31383 (_ BitVec 32))) )
))
(declare-datatypes ((array!64133 0))(
  ( (array!64134 (arr!30872 (Array (_ BitVec 32) ValueCell!11306)) (size!31384 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5206 0))(
  ( (LongMapFixedSize!5207 (defaultEntry!5955 Int) (mask!29638 (_ BitVec 32)) (extraKeys!5687 (_ BitVec 32)) (zeroValue!5791 V!36899) (minValue!5791 V!36899) (_size!2658 (_ BitVec 32)) (_keys!11138 array!64131) (_values!5978 array!64133) (_vacant!2658 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5206)

(declare-fun valid!1989 (LongMapFixedSize!5206) Bool)

(assert (=> start!89492 (= res!685970 (valid!1989 thiss!1427))))

(assert (=> start!89492 e!577570))

(declare-fun e!577568 () Bool)

(assert (=> start!89492 e!577568))

(assert (=> start!89492 true))

(declare-fun b!1024806 () Bool)

(declare-fun e!577572 () Bool)

(declare-fun tp_is_empty!24019 () Bool)

(assert (=> b!1024806 (= e!577572 tp_is_empty!24019)))

(declare-fun mapNonEmpty!37446 () Bool)

(declare-fun tp!71932 () Bool)

(assert (=> mapNonEmpty!37446 (= mapRes!37446 (and tp!71932 e!577572))))

(declare-fun mapKey!37446 () (_ BitVec 32))

(declare-fun mapRest!37446 () (Array (_ BitVec 32) ValueCell!11306))

(declare-fun mapValue!37446 () ValueCell!11306)

(assert (=> mapNonEmpty!37446 (= (arr!30872 (_values!5978 thiss!1427)) (store mapRest!37446 mapKey!37446 mapValue!37446))))

(declare-fun e!577571 () Bool)

(declare-fun array_inv!23937 (array!64131) Bool)

(declare-fun array_inv!23938 (array!64133) Bool)

(assert (=> b!1024807 (= e!577568 (and tp!71931 tp_is_empty!24019 (array_inv!23937 (_keys!11138 thiss!1427)) (array_inv!23938 (_values!5978 thiss!1427)) e!577571))))

(declare-fun b!1024808 () Bool)

(declare-fun e!577567 () Bool)

(assert (=> b!1024808 (= e!577567 tp_is_empty!24019)))

(declare-fun b!1024809 () Bool)

(declare-fun res!685969 () Bool)

(assert (=> b!1024809 (=> (not res!685969) (not e!577570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64131 (_ BitVec 32)) Bool)

(assert (=> b!1024809 (= res!685969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11138 thiss!1427) (mask!29638 thiss!1427)))))

(declare-fun b!1024810 () Bool)

(assert (=> b!1024810 (= e!577570 false)))

(declare-fun lt!450929 () Bool)

(declare-datatypes ((List!21698 0))(
  ( (Nil!21695) (Cons!21694 (h!22901 (_ BitVec 64)) (t!30728 List!21698)) )
))
(declare-fun arrayNoDuplicates!0 (array!64131 (_ BitVec 32) List!21698) Bool)

(assert (=> b!1024810 (= lt!450929 (arrayNoDuplicates!0 (_keys!11138 thiss!1427) #b00000000000000000000000000000000 Nil!21695))))

(declare-fun b!1024811 () Bool)

(assert (=> b!1024811 (= e!577571 (and e!577567 mapRes!37446))))

(declare-fun condMapEmpty!37446 () Bool)

(declare-fun mapDefault!37446 () ValueCell!11306)

(assert (=> b!1024811 (= condMapEmpty!37446 (= (arr!30872 (_values!5978 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11306)) mapDefault!37446)))))

(declare-fun b!1024812 () Bool)

(declare-fun res!685971 () Bool)

(assert (=> b!1024812 (=> (not res!685971) (not e!577570))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024812 (= res!685971 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024813 () Bool)

(declare-fun res!685973 () Bool)

(assert (=> b!1024813 (=> (not res!685973) (not e!577570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024813 (= res!685973 (validMask!0 (mask!29638 thiss!1427)))))

(declare-fun b!1024814 () Bool)

(declare-fun res!685972 () Bool)

(assert (=> b!1024814 (=> (not res!685972) (not e!577570))))

(assert (=> b!1024814 (= res!685972 (and (= (size!31384 (_values!5978 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29638 thiss!1427))) (= (size!31383 (_keys!11138 thiss!1427)) (size!31384 (_values!5978 thiss!1427))) (bvsge (mask!29638 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5687 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5687 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!89492 res!685970) b!1024812))

(assert (= (and b!1024812 res!685971) b!1024813))

(assert (= (and b!1024813 res!685973) b!1024814))

(assert (= (and b!1024814 res!685972) b!1024809))

(assert (= (and b!1024809 res!685969) b!1024810))

(assert (= (and b!1024811 condMapEmpty!37446) mapIsEmpty!37446))

(assert (= (and b!1024811 (not condMapEmpty!37446)) mapNonEmpty!37446))

(get-info :version)

(assert (= (and mapNonEmpty!37446 ((_ is ValueCellFull!11306) mapValue!37446)) b!1024806))

(assert (= (and b!1024811 ((_ is ValueCellFull!11306) mapDefault!37446)) b!1024808))

(assert (= b!1024807 b!1024811))

(assert (= start!89492 b!1024807))

(declare-fun m!943813 () Bool)

(assert (=> b!1024807 m!943813))

(declare-fun m!943815 () Bool)

(assert (=> b!1024807 m!943815))

(declare-fun m!943817 () Bool)

(assert (=> b!1024809 m!943817))

(declare-fun m!943819 () Bool)

(assert (=> b!1024810 m!943819))

(declare-fun m!943821 () Bool)

(assert (=> b!1024813 m!943821))

(declare-fun m!943823 () Bool)

(assert (=> mapNonEmpty!37446 m!943823))

(declare-fun m!943825 () Bool)

(assert (=> start!89492 m!943825))

(check-sat (not b!1024807) (not b!1024810) (not start!89492) b_and!32531 (not b!1024813) (not mapNonEmpty!37446) (not b!1024809) (not b_next!20299) tp_is_empty!24019)
(check-sat b_and!32531 (not b_next!20299))
