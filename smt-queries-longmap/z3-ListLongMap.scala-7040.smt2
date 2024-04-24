; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89486 () Bool)

(assert start!89486)

(declare-fun b!1024729 () Bool)

(declare-fun b_free!20293 () Bool)

(declare-fun b_next!20293 () Bool)

(assert (=> b!1024729 (= b_free!20293 (not b_next!20293))))

(declare-fun tp!71914 () Bool)

(declare-fun b_and!32525 () Bool)

(assert (=> b!1024729 (= tp!71914 b_and!32525)))

(declare-fun res!685925 () Bool)

(declare-fun e!577517 () Bool)

(assert (=> start!89486 (=> (not res!685925) (not e!577517))))

(declare-datatypes ((V!36891 0))(
  ( (V!36892 (val!12057 Int)) )
))
(declare-datatypes ((ValueCell!11303 0))(
  ( (ValueCellFull!11303 (v!14622 V!36891)) (EmptyCell!11303) )
))
(declare-datatypes ((array!64119 0))(
  ( (array!64120 (arr!30865 (Array (_ BitVec 32) (_ BitVec 64))) (size!31377 (_ BitVec 32))) )
))
(declare-datatypes ((array!64121 0))(
  ( (array!64122 (arr!30866 (Array (_ BitVec 32) ValueCell!11303)) (size!31378 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5200 0))(
  ( (LongMapFixedSize!5201 (defaultEntry!5952 Int) (mask!29633 (_ BitVec 32)) (extraKeys!5684 (_ BitVec 32)) (zeroValue!5788 V!36891) (minValue!5788 V!36891) (_size!2655 (_ BitVec 32)) (_keys!11135 array!64119) (_values!5975 array!64121) (_vacant!2655 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5200)

(declare-fun valid!1986 (LongMapFixedSize!5200) Bool)

(assert (=> start!89486 (= res!685925 (valid!1986 thiss!1427))))

(assert (=> start!89486 e!577517))

(declare-fun e!577515 () Bool)

(assert (=> start!89486 e!577515))

(assert (=> start!89486 true))

(declare-fun b!1024725 () Bool)

(declare-fun res!685924 () Bool)

(assert (=> b!1024725 (=> (not res!685924) (not e!577517))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024725 (= res!685924 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024726 () Bool)

(declare-fun res!685928 () Bool)

(assert (=> b!1024726 (=> (not res!685928) (not e!577517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024726 (= res!685928 (validMask!0 (mask!29633 thiss!1427)))))

(declare-fun b!1024727 () Bool)

(declare-fun e!577514 () Bool)

(declare-fun tp_is_empty!24013 () Bool)

(assert (=> b!1024727 (= e!577514 tp_is_empty!24013)))

(declare-fun b!1024728 () Bool)

(declare-fun res!685927 () Bool)

(assert (=> b!1024728 (=> (not res!685927) (not e!577517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64119 (_ BitVec 32)) Bool)

(assert (=> b!1024728 (= res!685927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11135 thiss!1427) (mask!29633 thiss!1427)))))

(declare-fun e!577513 () Bool)

(declare-fun array_inv!23931 (array!64119) Bool)

(declare-fun array_inv!23932 (array!64121) Bool)

(assert (=> b!1024729 (= e!577515 (and tp!71914 tp_is_empty!24013 (array_inv!23931 (_keys!11135 thiss!1427)) (array_inv!23932 (_values!5975 thiss!1427)) e!577513))))

(declare-fun b!1024730 () Bool)

(assert (=> b!1024730 (= e!577517 false)))

(declare-fun lt!450920 () Bool)

(declare-datatypes ((List!21695 0))(
  ( (Nil!21692) (Cons!21691 (h!22898 (_ BitVec 64)) (t!30725 List!21695)) )
))
(declare-fun arrayNoDuplicates!0 (array!64119 (_ BitVec 32) List!21695) Bool)

(assert (=> b!1024730 (= lt!450920 (arrayNoDuplicates!0 (_keys!11135 thiss!1427) #b00000000000000000000000000000000 Nil!21692))))

(declare-fun b!1024731 () Bool)

(declare-fun res!685926 () Bool)

(assert (=> b!1024731 (=> (not res!685926) (not e!577517))))

(assert (=> b!1024731 (= res!685926 (and (= (size!31378 (_values!5975 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29633 thiss!1427))) (= (size!31377 (_keys!11135 thiss!1427)) (size!31378 (_values!5975 thiss!1427))) (bvsge (mask!29633 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5684 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5684 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37437 () Bool)

(declare-fun mapRes!37437 () Bool)

(assert (=> mapIsEmpty!37437 mapRes!37437))

(declare-fun b!1024732 () Bool)

(declare-fun e!577518 () Bool)

(assert (=> b!1024732 (= e!577513 (and e!577518 mapRes!37437))))

(declare-fun condMapEmpty!37437 () Bool)

(declare-fun mapDefault!37437 () ValueCell!11303)

(assert (=> b!1024732 (= condMapEmpty!37437 (= (arr!30866 (_values!5975 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11303)) mapDefault!37437)))))

(declare-fun mapNonEmpty!37437 () Bool)

(declare-fun tp!71913 () Bool)

(assert (=> mapNonEmpty!37437 (= mapRes!37437 (and tp!71913 e!577514))))

(declare-fun mapValue!37437 () ValueCell!11303)

(declare-fun mapKey!37437 () (_ BitVec 32))

(declare-fun mapRest!37437 () (Array (_ BitVec 32) ValueCell!11303))

(assert (=> mapNonEmpty!37437 (= (arr!30866 (_values!5975 thiss!1427)) (store mapRest!37437 mapKey!37437 mapValue!37437))))

(declare-fun b!1024733 () Bool)

(assert (=> b!1024733 (= e!577518 tp_is_empty!24013)))

(assert (= (and start!89486 res!685925) b!1024725))

(assert (= (and b!1024725 res!685924) b!1024726))

(assert (= (and b!1024726 res!685928) b!1024731))

(assert (= (and b!1024731 res!685926) b!1024728))

(assert (= (and b!1024728 res!685927) b!1024730))

(assert (= (and b!1024732 condMapEmpty!37437) mapIsEmpty!37437))

(assert (= (and b!1024732 (not condMapEmpty!37437)) mapNonEmpty!37437))

(get-info :version)

(assert (= (and mapNonEmpty!37437 ((_ is ValueCellFull!11303) mapValue!37437)) b!1024727))

(assert (= (and b!1024732 ((_ is ValueCellFull!11303) mapDefault!37437)) b!1024733))

(assert (= b!1024729 b!1024732))

(assert (= start!89486 b!1024729))

(declare-fun m!943771 () Bool)

(assert (=> b!1024729 m!943771))

(declare-fun m!943773 () Bool)

(assert (=> b!1024729 m!943773))

(declare-fun m!943775 () Bool)

(assert (=> b!1024726 m!943775))

(declare-fun m!943777 () Bool)

(assert (=> b!1024730 m!943777))

(declare-fun m!943779 () Bool)

(assert (=> mapNonEmpty!37437 m!943779))

(declare-fun m!943781 () Bool)

(assert (=> b!1024728 m!943781))

(declare-fun m!943783 () Bool)

(assert (=> start!89486 m!943783))

(check-sat (not b!1024728) b_and!32525 (not b_next!20293) (not mapNonEmpty!37437) (not start!89486) (not b!1024730) (not b!1024726) tp_is_empty!24013 (not b!1024729))
(check-sat b_and!32525 (not b_next!20293))
