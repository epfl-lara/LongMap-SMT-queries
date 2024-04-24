; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89474 () Bool)

(assert start!89474)

(declare-fun b!1024568 () Bool)

(declare-fun b_free!20281 () Bool)

(declare-fun b_next!20281 () Bool)

(assert (=> b!1024568 (= b_free!20281 (not b_next!20281))))

(declare-fun tp!71877 () Bool)

(declare-fun b_and!32513 () Bool)

(assert (=> b!1024568 (= tp!71877 b_and!32513)))

(declare-fun b!1024563 () Bool)

(declare-fun e!577409 () Bool)

(declare-fun tp_is_empty!24001 () Bool)

(assert (=> b!1024563 (= e!577409 tp_is_empty!24001)))

(declare-fun res!685835 () Bool)

(declare-fun e!577406 () Bool)

(assert (=> start!89474 (=> (not res!685835) (not e!577406))))

(declare-datatypes ((V!36875 0))(
  ( (V!36876 (val!12051 Int)) )
))
(declare-datatypes ((ValueCell!11297 0))(
  ( (ValueCellFull!11297 (v!14616 V!36875)) (EmptyCell!11297) )
))
(declare-datatypes ((array!64095 0))(
  ( (array!64096 (arr!30853 (Array (_ BitVec 32) (_ BitVec 64))) (size!31365 (_ BitVec 32))) )
))
(declare-datatypes ((array!64097 0))(
  ( (array!64098 (arr!30854 (Array (_ BitVec 32) ValueCell!11297)) (size!31366 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5188 0))(
  ( (LongMapFixedSize!5189 (defaultEntry!5946 Int) (mask!29623 (_ BitVec 32)) (extraKeys!5678 (_ BitVec 32)) (zeroValue!5782 V!36875) (minValue!5782 V!36875) (_size!2649 (_ BitVec 32)) (_keys!11129 array!64095) (_values!5969 array!64097) (_vacant!2649 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5188)

(declare-fun valid!1982 (LongMapFixedSize!5188) Bool)

(assert (=> start!89474 (= res!685835 (valid!1982 thiss!1427))))

(assert (=> start!89474 e!577406))

(declare-fun e!577408 () Bool)

(assert (=> start!89474 e!577408))

(assert (=> start!89474 true))

(declare-fun b!1024564 () Bool)

(declare-fun e!577405 () Bool)

(declare-fun mapRes!37419 () Bool)

(assert (=> b!1024564 (= e!577405 (and e!577409 mapRes!37419))))

(declare-fun condMapEmpty!37419 () Bool)

(declare-fun mapDefault!37419 () ValueCell!11297)

(assert (=> b!1024564 (= condMapEmpty!37419 (= (arr!30854 (_values!5969 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11297)) mapDefault!37419)))))

(declare-fun b!1024565 () Bool)

(declare-fun res!685838 () Bool)

(assert (=> b!1024565 (=> (not res!685838) (not e!577406))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024565 (= res!685838 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024566 () Bool)

(declare-fun res!685836 () Bool)

(assert (=> b!1024566 (=> (not res!685836) (not e!577406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64095 (_ BitVec 32)) Bool)

(assert (=> b!1024566 (= res!685836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11129 thiss!1427) (mask!29623 thiss!1427)))))

(declare-fun mapIsEmpty!37419 () Bool)

(assert (=> mapIsEmpty!37419 mapRes!37419))

(declare-fun b!1024567 () Bool)

(declare-fun e!577407 () Bool)

(assert (=> b!1024567 (= e!577407 tp_is_empty!24001)))

(declare-fun array_inv!23923 (array!64095) Bool)

(declare-fun array_inv!23924 (array!64097) Bool)

(assert (=> b!1024568 (= e!577408 (and tp!71877 tp_is_empty!24001 (array_inv!23923 (_keys!11129 thiss!1427)) (array_inv!23924 (_values!5969 thiss!1427)) e!577405))))

(declare-fun b!1024569 () Bool)

(assert (=> b!1024569 (= e!577406 false)))

(declare-fun lt!450902 () Bool)

(declare-datatypes ((List!21692 0))(
  ( (Nil!21689) (Cons!21688 (h!22895 (_ BitVec 64)) (t!30722 List!21692)) )
))
(declare-fun arrayNoDuplicates!0 (array!64095 (_ BitVec 32) List!21692) Bool)

(assert (=> b!1024569 (= lt!450902 (arrayNoDuplicates!0 (_keys!11129 thiss!1427) #b00000000000000000000000000000000 Nil!21689))))

(declare-fun b!1024570 () Bool)

(declare-fun res!685837 () Bool)

(assert (=> b!1024570 (=> (not res!685837) (not e!577406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024570 (= res!685837 (validMask!0 (mask!29623 thiss!1427)))))

(declare-fun b!1024571 () Bool)

(declare-fun res!685834 () Bool)

(assert (=> b!1024571 (=> (not res!685834) (not e!577406))))

(assert (=> b!1024571 (= res!685834 (and (= (size!31366 (_values!5969 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29623 thiss!1427))) (= (size!31365 (_keys!11129 thiss!1427)) (size!31366 (_values!5969 thiss!1427))) (bvsge (mask!29623 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5678 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5678 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37419 () Bool)

(declare-fun tp!71878 () Bool)

(assert (=> mapNonEmpty!37419 (= mapRes!37419 (and tp!71878 e!577407))))

(declare-fun mapRest!37419 () (Array (_ BitVec 32) ValueCell!11297))

(declare-fun mapKey!37419 () (_ BitVec 32))

(declare-fun mapValue!37419 () ValueCell!11297)

(assert (=> mapNonEmpty!37419 (= (arr!30854 (_values!5969 thiss!1427)) (store mapRest!37419 mapKey!37419 mapValue!37419))))

(assert (= (and start!89474 res!685835) b!1024565))

(assert (= (and b!1024565 res!685838) b!1024570))

(assert (= (and b!1024570 res!685837) b!1024571))

(assert (= (and b!1024571 res!685834) b!1024566))

(assert (= (and b!1024566 res!685836) b!1024569))

(assert (= (and b!1024564 condMapEmpty!37419) mapIsEmpty!37419))

(assert (= (and b!1024564 (not condMapEmpty!37419)) mapNonEmpty!37419))

(get-info :version)

(assert (= (and mapNonEmpty!37419 ((_ is ValueCellFull!11297) mapValue!37419)) b!1024567))

(assert (= (and b!1024564 ((_ is ValueCellFull!11297) mapDefault!37419)) b!1024563))

(assert (= b!1024568 b!1024564))

(assert (= start!89474 b!1024568))

(declare-fun m!943687 () Bool)

(assert (=> mapNonEmpty!37419 m!943687))

(declare-fun m!943689 () Bool)

(assert (=> b!1024568 m!943689))

(declare-fun m!943691 () Bool)

(assert (=> b!1024568 m!943691))

(declare-fun m!943693 () Bool)

(assert (=> b!1024570 m!943693))

(declare-fun m!943695 () Bool)

(assert (=> b!1024569 m!943695))

(declare-fun m!943697 () Bool)

(assert (=> b!1024566 m!943697))

(declare-fun m!943699 () Bool)

(assert (=> start!89474 m!943699))

(check-sat (not b_next!20281) (not b!1024569) (not b!1024570) (not start!89474) (not b!1024566) tp_is_empty!24001 b_and!32513 (not mapNonEmpty!37419) (not b!1024568))
(check-sat b_and!32513 (not b_next!20281))
