; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89498 () Bool)

(assert start!89498)

(declare-fun b!1024895 () Bool)

(declare-fun b_free!20305 () Bool)

(declare-fun b_next!20305 () Bool)

(assert (=> b!1024895 (= b_free!20305 (not b_next!20305))))

(declare-fun tp!71949 () Bool)

(declare-fun b_and!32537 () Bool)

(assert (=> b!1024895 (= tp!71949 b_and!32537)))

(declare-fun res!686017 () Bool)

(declare-fun e!577622 () Bool)

(assert (=> start!89498 (=> (not res!686017) (not e!577622))))

(declare-datatypes ((V!36907 0))(
  ( (V!36908 (val!12063 Int)) )
))
(declare-datatypes ((ValueCell!11309 0))(
  ( (ValueCellFull!11309 (v!14628 V!36907)) (EmptyCell!11309) )
))
(declare-datatypes ((array!64143 0))(
  ( (array!64144 (arr!30877 (Array (_ BitVec 32) (_ BitVec 64))) (size!31389 (_ BitVec 32))) )
))
(declare-datatypes ((array!64145 0))(
  ( (array!64146 (arr!30878 (Array (_ BitVec 32) ValueCell!11309)) (size!31390 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5212 0))(
  ( (LongMapFixedSize!5213 (defaultEntry!5958 Int) (mask!29643 (_ BitVec 32)) (extraKeys!5690 (_ BitVec 32)) (zeroValue!5794 V!36907) (minValue!5794 V!36907) (_size!2661 (_ BitVec 32)) (_keys!11141 array!64143) (_values!5981 array!64145) (_vacant!2661 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5212)

(declare-fun valid!1990 (LongMapFixedSize!5212) Bool)

(assert (=> start!89498 (= res!686017 (valid!1990 thiss!1427))))

(assert (=> start!89498 e!577622))

(declare-fun e!577625 () Bool)

(assert (=> start!89498 e!577625))

(assert (=> start!89498 true))

(declare-fun b!1024887 () Bool)

(declare-fun res!686015 () Bool)

(assert (=> b!1024887 (=> (not res!686015) (not e!577622))))

(assert (=> b!1024887 (= res!686015 (and (= (size!31390 (_values!5981 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29643 thiss!1427))) (= (size!31389 (_keys!11141 thiss!1427)) (size!31390 (_values!5981 thiss!1427))) (bvsge (mask!29643 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5690 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5690 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1024888 () Bool)

(declare-fun res!686014 () Bool)

(assert (=> b!1024888 (=> (not res!686014) (not e!577622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64143 (_ BitVec 32)) Bool)

(assert (=> b!1024888 (= res!686014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11141 thiss!1427) (mask!29643 thiss!1427)))))

(declare-fun b!1024889 () Bool)

(assert (=> b!1024889 (= e!577622 false)))

(declare-fun lt!450938 () Bool)

(declare-datatypes ((List!21699 0))(
  ( (Nil!21696) (Cons!21695 (h!22902 (_ BitVec 64)) (t!30729 List!21699)) )
))
(declare-fun arrayNoDuplicates!0 (array!64143 (_ BitVec 32) List!21699) Bool)

(assert (=> b!1024889 (= lt!450938 (arrayNoDuplicates!0 (_keys!11141 thiss!1427) #b00000000000000000000000000000000 Nil!21696))))

(declare-fun b!1024890 () Bool)

(declare-fun e!577624 () Bool)

(declare-fun e!577623 () Bool)

(declare-fun mapRes!37455 () Bool)

(assert (=> b!1024890 (= e!577624 (and e!577623 mapRes!37455))))

(declare-fun condMapEmpty!37455 () Bool)

(declare-fun mapDefault!37455 () ValueCell!11309)

(assert (=> b!1024890 (= condMapEmpty!37455 (= (arr!30878 (_values!5981 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11309)) mapDefault!37455)))))

(declare-fun b!1024891 () Bool)

(declare-fun e!577621 () Bool)

(declare-fun tp_is_empty!24025 () Bool)

(assert (=> b!1024891 (= e!577621 tp_is_empty!24025)))

(declare-fun mapIsEmpty!37455 () Bool)

(assert (=> mapIsEmpty!37455 mapRes!37455))

(declare-fun b!1024892 () Bool)

(declare-fun res!686018 () Bool)

(assert (=> b!1024892 (=> (not res!686018) (not e!577622))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024892 (= res!686018 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024893 () Bool)

(declare-fun res!686016 () Bool)

(assert (=> b!1024893 (=> (not res!686016) (not e!577622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024893 (= res!686016 (validMask!0 (mask!29643 thiss!1427)))))

(declare-fun b!1024894 () Bool)

(assert (=> b!1024894 (= e!577623 tp_is_empty!24025)))

(declare-fun mapNonEmpty!37455 () Bool)

(declare-fun tp!71950 () Bool)

(assert (=> mapNonEmpty!37455 (= mapRes!37455 (and tp!71950 e!577621))))

(declare-fun mapValue!37455 () ValueCell!11309)

(declare-fun mapRest!37455 () (Array (_ BitVec 32) ValueCell!11309))

(declare-fun mapKey!37455 () (_ BitVec 32))

(assert (=> mapNonEmpty!37455 (= (arr!30878 (_values!5981 thiss!1427)) (store mapRest!37455 mapKey!37455 mapValue!37455))))

(declare-fun array_inv!23939 (array!64143) Bool)

(declare-fun array_inv!23940 (array!64145) Bool)

(assert (=> b!1024895 (= e!577625 (and tp!71949 tp_is_empty!24025 (array_inv!23939 (_keys!11141 thiss!1427)) (array_inv!23940 (_values!5981 thiss!1427)) e!577624))))

(assert (= (and start!89498 res!686017) b!1024892))

(assert (= (and b!1024892 res!686018) b!1024893))

(assert (= (and b!1024893 res!686016) b!1024887))

(assert (= (and b!1024887 res!686015) b!1024888))

(assert (= (and b!1024888 res!686014) b!1024889))

(assert (= (and b!1024890 condMapEmpty!37455) mapIsEmpty!37455))

(assert (= (and b!1024890 (not condMapEmpty!37455)) mapNonEmpty!37455))

(get-info :version)

(assert (= (and mapNonEmpty!37455 ((_ is ValueCellFull!11309) mapValue!37455)) b!1024891))

(assert (= (and b!1024890 ((_ is ValueCellFull!11309) mapDefault!37455)) b!1024894))

(assert (= b!1024895 b!1024890))

(assert (= start!89498 b!1024895))

(declare-fun m!943855 () Bool)

(assert (=> b!1024888 m!943855))

(declare-fun m!943857 () Bool)

(assert (=> start!89498 m!943857))

(declare-fun m!943859 () Bool)

(assert (=> b!1024893 m!943859))

(declare-fun m!943861 () Bool)

(assert (=> mapNonEmpty!37455 m!943861))

(declare-fun m!943863 () Bool)

(assert (=> b!1024895 m!943863))

(declare-fun m!943865 () Bool)

(assert (=> b!1024895 m!943865))

(declare-fun m!943867 () Bool)

(assert (=> b!1024889 m!943867))

(check-sat (not b_next!20305) b_and!32537 (not b!1024893) tp_is_empty!24025 (not start!89498) (not b!1024895) (not b!1024889) (not mapNonEmpty!37455) (not b!1024888))
(check-sat b_and!32537 (not b_next!20305))
