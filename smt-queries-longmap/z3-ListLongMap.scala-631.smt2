; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16138 () Bool)

(assert start!16138)

(declare-fun b!160672 () Bool)

(declare-fun b_free!3595 () Bool)

(declare-fun b_next!3595 () Bool)

(assert (=> b!160672 (= b_free!3595 (not b_next!3595))))

(declare-fun tp!13354 () Bool)

(declare-fun b_and!10023 () Bool)

(assert (=> b!160672 (= tp!13354 b_and!10023)))

(declare-fun b!160664 () Bool)

(declare-fun res!76103 () Bool)

(declare-fun e!105028 () Bool)

(assert (=> b!160664 (=> (not res!76103) (not e!105028))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4177 0))(
  ( (V!4178 (val!1743 Int)) )
))
(declare-datatypes ((ValueCell!1355 0))(
  ( (ValueCellFull!1355 (v!3609 V!4177)) (EmptyCell!1355) )
))
(declare-datatypes ((array!5859 0))(
  ( (array!5860 (arr!2774 (Array (_ BitVec 32) (_ BitVec 64))) (size!3058 (_ BitVec 32))) )
))
(declare-datatypes ((array!5861 0))(
  ( (array!5862 (arr!2775 (Array (_ BitVec 32) ValueCell!1355)) (size!3059 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1618 0))(
  ( (LongMapFixedSize!1619 (defaultEntry!3251 Int) (mask!7825 (_ BitVec 32)) (extraKeys!2992 (_ BitVec 32)) (zeroValue!3094 V!4177) (minValue!3094 V!4177) (_size!858 (_ BitVec 32)) (_keys!5052 array!5859) (_values!3234 array!5861) (_vacant!858 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1618)

(get-info :version)

(declare-datatypes ((SeekEntryResult!328 0))(
  ( (MissingZero!328 (index!3480 (_ BitVec 32))) (Found!328 (index!3481 (_ BitVec 32))) (Intermediate!328 (undefined!1140 Bool) (index!3482 (_ BitVec 32)) (x!17720 (_ BitVec 32))) (Undefined!328) (MissingVacant!328 (index!3483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5859 (_ BitVec 32)) SeekEntryResult!328)

(assert (=> b!160664 (= res!76103 ((_ is Undefined!328) (seekEntryOrOpen!0 key!828 (_keys!5052 thiss!1248) (mask!7825 thiss!1248))))))

(declare-fun b!160665 () Bool)

(declare-fun res!76101 () Bool)

(assert (=> b!160665 (=> (not res!76101) (not e!105028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160665 (= res!76101 (validMask!0 (mask!7825 thiss!1248)))))

(declare-fun b!160666 () Bool)

(declare-fun e!105030 () Bool)

(declare-fun tp_is_empty!3397 () Bool)

(assert (=> b!160666 (= e!105030 tp_is_empty!3397)))

(declare-fun b!160667 () Bool)

(declare-fun res!76104 () Bool)

(assert (=> b!160667 (=> (not res!76104) (not e!105028))))

(assert (=> b!160667 (= res!76104 (and (= (size!3059 (_values!3234 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7825 thiss!1248))) (= (size!3058 (_keys!5052 thiss!1248)) (size!3059 (_values!3234 thiss!1248))) (bvsge (mask!7825 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2992 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2992 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160668 () Bool)

(declare-fun res!76105 () Bool)

(assert (=> b!160668 (=> (not res!76105) (not e!105028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5859 (_ BitVec 32)) Bool)

(assert (=> b!160668 (= res!76105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5052 thiss!1248) (mask!7825 thiss!1248)))))

(declare-fun res!76102 () Bool)

(assert (=> start!16138 (=> (not res!76102) (not e!105028))))

(declare-fun valid!768 (LongMapFixedSize!1618) Bool)

(assert (=> start!16138 (= res!76102 (valid!768 thiss!1248))))

(assert (=> start!16138 e!105028))

(declare-fun e!105029 () Bool)

(assert (=> start!16138 e!105029))

(assert (=> start!16138 true))

(declare-fun mapIsEmpty!5783 () Bool)

(declare-fun mapRes!5783 () Bool)

(assert (=> mapIsEmpty!5783 mapRes!5783))

(declare-fun b!160669 () Bool)

(declare-fun e!105026 () Bool)

(assert (=> b!160669 (= e!105026 (and e!105030 mapRes!5783))))

(declare-fun condMapEmpty!5783 () Bool)

(declare-fun mapDefault!5783 () ValueCell!1355)

(assert (=> b!160669 (= condMapEmpty!5783 (= (arr!2775 (_values!3234 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1355)) mapDefault!5783)))))

(declare-fun mapNonEmpty!5783 () Bool)

(declare-fun tp!13355 () Bool)

(declare-fun e!105027 () Bool)

(assert (=> mapNonEmpty!5783 (= mapRes!5783 (and tp!13355 e!105027))))

(declare-fun mapRest!5783 () (Array (_ BitVec 32) ValueCell!1355))

(declare-fun mapKey!5783 () (_ BitVec 32))

(declare-fun mapValue!5783 () ValueCell!1355)

(assert (=> mapNonEmpty!5783 (= (arr!2775 (_values!3234 thiss!1248)) (store mapRest!5783 mapKey!5783 mapValue!5783))))

(declare-fun b!160670 () Bool)

(assert (=> b!160670 (= e!105028 false)))

(declare-fun lt!82164 () Bool)

(declare-datatypes ((List!1940 0))(
  ( (Nil!1937) (Cons!1936 (h!2549 (_ BitVec 64)) (t!6734 List!1940)) )
))
(declare-fun arrayNoDuplicates!0 (array!5859 (_ BitVec 32) List!1940) Bool)

(assert (=> b!160670 (= lt!82164 (arrayNoDuplicates!0 (_keys!5052 thiss!1248) #b00000000000000000000000000000000 Nil!1937))))

(declare-fun b!160671 () Bool)

(declare-fun res!76100 () Bool)

(assert (=> b!160671 (=> (not res!76100) (not e!105028))))

(assert (=> b!160671 (= res!76100 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!1773 (array!5859) Bool)

(declare-fun array_inv!1774 (array!5861) Bool)

(assert (=> b!160672 (= e!105029 (and tp!13354 tp_is_empty!3397 (array_inv!1773 (_keys!5052 thiss!1248)) (array_inv!1774 (_values!3234 thiss!1248)) e!105026))))

(declare-fun b!160673 () Bool)

(assert (=> b!160673 (= e!105027 tp_is_empty!3397)))

(declare-fun b!160674 () Bool)

(declare-fun res!76106 () Bool)

(assert (=> b!160674 (=> (not res!76106) (not e!105028))))

(declare-datatypes ((tuple2!2876 0))(
  ( (tuple2!2877 (_1!1449 (_ BitVec 64)) (_2!1449 V!4177)) )
))
(declare-datatypes ((List!1941 0))(
  ( (Nil!1938) (Cons!1937 (h!2550 tuple2!2876) (t!6735 List!1941)) )
))
(declare-datatypes ((ListLongMap!1875 0))(
  ( (ListLongMap!1876 (toList!953 List!1941)) )
))
(declare-fun contains!999 (ListLongMap!1875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!620 (array!5859 array!5861 (_ BitVec 32) (_ BitVec 32) V!4177 V!4177 (_ BitVec 32) Int) ListLongMap!1875)

(assert (=> b!160674 (= res!76106 (not (contains!999 (getCurrentListMap!620 (_keys!5052 thiss!1248) (_values!3234 thiss!1248) (mask!7825 thiss!1248) (extraKeys!2992 thiss!1248) (zeroValue!3094 thiss!1248) (minValue!3094 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3251 thiss!1248)) key!828)))))

(assert (= (and start!16138 res!76102) b!160671))

(assert (= (and b!160671 res!76100) b!160664))

(assert (= (and b!160664 res!76103) b!160674))

(assert (= (and b!160674 res!76106) b!160665))

(assert (= (and b!160665 res!76101) b!160667))

(assert (= (and b!160667 res!76104) b!160668))

(assert (= (and b!160668 res!76105) b!160670))

(assert (= (and b!160669 condMapEmpty!5783) mapIsEmpty!5783))

(assert (= (and b!160669 (not condMapEmpty!5783)) mapNonEmpty!5783))

(assert (= (and mapNonEmpty!5783 ((_ is ValueCellFull!1355) mapValue!5783)) b!160673))

(assert (= (and b!160669 ((_ is ValueCellFull!1355) mapDefault!5783)) b!160666))

(assert (= b!160672 b!160669))

(assert (= start!16138 b!160672))

(declare-fun m!192599 () Bool)

(assert (=> mapNonEmpty!5783 m!192599))

(declare-fun m!192601 () Bool)

(assert (=> b!160670 m!192601))

(declare-fun m!192603 () Bool)

(assert (=> b!160665 m!192603))

(declare-fun m!192605 () Bool)

(assert (=> start!16138 m!192605))

(declare-fun m!192607 () Bool)

(assert (=> b!160674 m!192607))

(assert (=> b!160674 m!192607))

(declare-fun m!192609 () Bool)

(assert (=> b!160674 m!192609))

(declare-fun m!192611 () Bool)

(assert (=> b!160668 m!192611))

(declare-fun m!192613 () Bool)

(assert (=> b!160664 m!192613))

(declare-fun m!192615 () Bool)

(assert (=> b!160672 m!192615))

(declare-fun m!192617 () Bool)

(assert (=> b!160672 m!192617))

(check-sat (not b!160668) (not b!160665) (not mapNonEmpty!5783) b_and!10023 tp_is_empty!3397 (not b!160670) (not b!160674) (not b!160664) (not start!16138) (not b!160672) (not b_next!3595))
(check-sat b_and!10023 (not b_next!3595))
