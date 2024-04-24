; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89480 () Bool)

(assert start!89480)

(declare-fun b!1024651 () Bool)

(declare-fun b_free!20287 () Bool)

(declare-fun b_next!20287 () Bool)

(assert (=> b!1024651 (= b_free!20287 (not b_next!20287))))

(declare-fun tp!71895 () Bool)

(declare-fun b_and!32519 () Bool)

(assert (=> b!1024651 (= tp!71895 b_and!32519)))

(declare-fun b!1024645 () Bool)

(declare-fun e!577463 () Bool)

(assert (=> b!1024645 (= e!577463 false)))

(declare-fun lt!450911 () Bool)

(declare-datatypes ((V!36883 0))(
  ( (V!36884 (val!12054 Int)) )
))
(declare-datatypes ((ValueCell!11300 0))(
  ( (ValueCellFull!11300 (v!14619 V!36883)) (EmptyCell!11300) )
))
(declare-datatypes ((array!64107 0))(
  ( (array!64108 (arr!30859 (Array (_ BitVec 32) (_ BitVec 64))) (size!31371 (_ BitVec 32))) )
))
(declare-datatypes ((array!64109 0))(
  ( (array!64110 (arr!30860 (Array (_ BitVec 32) ValueCell!11300)) (size!31372 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5194 0))(
  ( (LongMapFixedSize!5195 (defaultEntry!5949 Int) (mask!29628 (_ BitVec 32)) (extraKeys!5681 (_ BitVec 32)) (zeroValue!5785 V!36883) (minValue!5785 V!36883) (_size!2652 (_ BitVec 32)) (_keys!11132 array!64107) (_values!5972 array!64109) (_vacant!2652 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5194)

(declare-datatypes ((List!21693 0))(
  ( (Nil!21690) (Cons!21689 (h!22896 (_ BitVec 64)) (t!30723 List!21693)) )
))
(declare-fun arrayNoDuplicates!0 (array!64107 (_ BitVec 32) List!21693) Bool)

(assert (=> b!1024645 (= lt!450911 (arrayNoDuplicates!0 (_keys!11132 thiss!1427) #b00000000000000000000000000000000 Nil!21690))))

(declare-fun mapNonEmpty!37428 () Bool)

(declare-fun mapRes!37428 () Bool)

(declare-fun tp!71896 () Bool)

(declare-fun e!577460 () Bool)

(assert (=> mapNonEmpty!37428 (= mapRes!37428 (and tp!71896 e!577460))))

(declare-fun mapKey!37428 () (_ BitVec 32))

(declare-fun mapValue!37428 () ValueCell!11300)

(declare-fun mapRest!37428 () (Array (_ BitVec 32) ValueCell!11300))

(assert (=> mapNonEmpty!37428 (= (arr!30860 (_values!5972 thiss!1427)) (store mapRest!37428 mapKey!37428 mapValue!37428))))

(declare-fun b!1024646 () Bool)

(declare-fun res!685882 () Bool)

(assert (=> b!1024646 (=> (not res!685882) (not e!577463))))

(assert (=> b!1024646 (= res!685882 (and (= (size!31372 (_values!5972 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29628 thiss!1427))) (= (size!31371 (_keys!11132 thiss!1427)) (size!31372 (_values!5972 thiss!1427))) (bvsge (mask!29628 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5681 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5681 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1024647 () Bool)

(declare-fun res!685881 () Bool)

(assert (=> b!1024647 (=> (not res!685881) (not e!577463))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024647 (= res!685881 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024648 () Bool)

(declare-fun res!685883 () Bool)

(assert (=> b!1024648 (=> (not res!685883) (not e!577463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024648 (= res!685883 (validMask!0 (mask!29628 thiss!1427)))))

(declare-fun b!1024649 () Bool)

(declare-fun res!685880 () Bool)

(assert (=> b!1024649 (=> (not res!685880) (not e!577463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64107 (_ BitVec 32)) Bool)

(assert (=> b!1024649 (= res!685880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11132 thiss!1427) (mask!29628 thiss!1427)))))

(declare-fun b!1024650 () Bool)

(declare-fun e!577459 () Bool)

(declare-fun tp_is_empty!24007 () Bool)

(assert (=> b!1024650 (= e!577459 tp_is_empty!24007)))

(declare-fun mapIsEmpty!37428 () Bool)

(assert (=> mapIsEmpty!37428 mapRes!37428))

(declare-fun b!1024644 () Bool)

(declare-fun e!577464 () Bool)

(assert (=> b!1024644 (= e!577464 (and e!577459 mapRes!37428))))

(declare-fun condMapEmpty!37428 () Bool)

(declare-fun mapDefault!37428 () ValueCell!11300)

(assert (=> b!1024644 (= condMapEmpty!37428 (= (arr!30860 (_values!5972 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11300)) mapDefault!37428)))))

(declare-fun res!685879 () Bool)

(assert (=> start!89480 (=> (not res!685879) (not e!577463))))

(declare-fun valid!1983 (LongMapFixedSize!5194) Bool)

(assert (=> start!89480 (= res!685879 (valid!1983 thiss!1427))))

(assert (=> start!89480 e!577463))

(declare-fun e!577462 () Bool)

(assert (=> start!89480 e!577462))

(assert (=> start!89480 true))

(declare-fun array_inv!23927 (array!64107) Bool)

(declare-fun array_inv!23928 (array!64109) Bool)

(assert (=> b!1024651 (= e!577462 (and tp!71895 tp_is_empty!24007 (array_inv!23927 (_keys!11132 thiss!1427)) (array_inv!23928 (_values!5972 thiss!1427)) e!577464))))

(declare-fun b!1024652 () Bool)

(assert (=> b!1024652 (= e!577460 tp_is_empty!24007)))

(assert (= (and start!89480 res!685879) b!1024647))

(assert (= (and b!1024647 res!685881) b!1024648))

(assert (= (and b!1024648 res!685883) b!1024646))

(assert (= (and b!1024646 res!685882) b!1024649))

(assert (= (and b!1024649 res!685880) b!1024645))

(assert (= (and b!1024644 condMapEmpty!37428) mapIsEmpty!37428))

(assert (= (and b!1024644 (not condMapEmpty!37428)) mapNonEmpty!37428))

(get-info :version)

(assert (= (and mapNonEmpty!37428 ((_ is ValueCellFull!11300) mapValue!37428)) b!1024652))

(assert (= (and b!1024644 ((_ is ValueCellFull!11300) mapDefault!37428)) b!1024650))

(assert (= b!1024651 b!1024644))

(assert (= start!89480 b!1024651))

(declare-fun m!943729 () Bool)

(assert (=> b!1024649 m!943729))

(declare-fun m!943731 () Bool)

(assert (=> start!89480 m!943731))

(declare-fun m!943733 () Bool)

(assert (=> b!1024648 m!943733))

(declare-fun m!943735 () Bool)

(assert (=> mapNonEmpty!37428 m!943735))

(declare-fun m!943737 () Bool)

(assert (=> b!1024651 m!943737))

(declare-fun m!943739 () Bool)

(assert (=> b!1024651 m!943739))

(declare-fun m!943741 () Bool)

(assert (=> b!1024645 m!943741))

(check-sat (not b!1024649) (not b!1024648) (not b_next!20287) (not b!1024645) b_and!32519 (not start!89480) (not b!1024651) (not mapNonEmpty!37428) tp_is_empty!24007)
(check-sat b_and!32519 (not b_next!20287))
