; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80428 () Bool)

(assert start!80428)

(declare-fun b!943615 () Bool)

(declare-fun b_free!17959 () Bool)

(declare-fun b_next!17959 () Bool)

(assert (=> b!943615 (= b_free!17959 (not b_next!17959))))

(declare-fun tp!62384 () Bool)

(declare-fun b_and!29381 () Bool)

(assert (=> b!943615 (= tp!62384 b_and!29381)))

(declare-fun mapNonEmpty!32522 () Bool)

(declare-fun mapRes!32522 () Bool)

(declare-fun tp!62383 () Bool)

(declare-fun e!530625 () Bool)

(assert (=> mapNonEmpty!32522 (= mapRes!32522 (and tp!62383 e!530625))))

(declare-datatypes ((V!32255 0))(
  ( (V!32256 (val!10284 Int)) )
))
(declare-datatypes ((ValueCell!9752 0))(
  ( (ValueCellFull!9752 (v!12812 V!32255)) (EmptyCell!9752) )
))
(declare-datatypes ((array!56951 0))(
  ( (array!56952 (arr!27397 (Array (_ BitVec 32) ValueCell!9752)) (size!27863 (_ BitVec 32))) )
))
(declare-datatypes ((array!56953 0))(
  ( (array!56954 (arr!27398 (Array (_ BitVec 32) (_ BitVec 64))) (size!27864 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4654 0))(
  ( (LongMapFixedSize!4655 (defaultEntry!5618 Int) (mask!27275 (_ BitVec 32)) (extraKeys!5350 (_ BitVec 32)) (zeroValue!5454 V!32255) (minValue!5454 V!32255) (_size!2382 (_ BitVec 32)) (_keys!10520 array!56953) (_values!5641 array!56951) (_vacant!2382 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4654)

(declare-fun mapRest!32522 () (Array (_ BitVec 32) ValueCell!9752))

(declare-fun mapKey!32522 () (_ BitVec 32))

(declare-fun mapValue!32522 () ValueCell!9752)

(assert (=> mapNonEmpty!32522 (= (arr!27397 (_values!5641 thiss!1141)) (store mapRest!32522 mapKey!32522 mapValue!32522))))

(declare-fun b!943609 () Bool)

(declare-fun res!633804 () Bool)

(declare-fun e!530626 () Bool)

(assert (=> b!943609 (=> (not res!633804) (not e!530626))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943609 (= res!633804 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943610 () Bool)

(declare-fun e!530627 () Bool)

(declare-fun tp_is_empty!20467 () Bool)

(assert (=> b!943610 (= e!530627 tp_is_empty!20467)))

(declare-fun b!943612 () Bool)

(assert (=> b!943612 (= e!530626 false)))

(declare-fun lt!425549 () Bool)

(declare-datatypes ((List!19207 0))(
  ( (Nil!19204) (Cons!19203 (h!20359 (_ BitVec 64)) (t!27514 List!19207)) )
))
(declare-fun arrayNoDuplicates!0 (array!56953 (_ BitVec 32) List!19207) Bool)

(assert (=> b!943612 (= lt!425549 (arrayNoDuplicates!0 (_keys!10520 thiss!1141) #b00000000000000000000000000000000 Nil!19204))))

(declare-fun b!943613 () Bool)

(declare-fun e!530624 () Bool)

(assert (=> b!943613 (= e!530624 (and e!530627 mapRes!32522))))

(declare-fun condMapEmpty!32522 () Bool)

(declare-fun mapDefault!32522 () ValueCell!9752)

(assert (=> b!943613 (= condMapEmpty!32522 (= (arr!27397 (_values!5641 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9752)) mapDefault!32522)))))

(declare-fun b!943614 () Bool)

(declare-fun res!633802 () Bool)

(assert (=> b!943614 (=> (not res!633802) (not e!530626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943614 (= res!633802 (validMask!0 (mask!27275 thiss!1141)))))

(declare-fun e!530628 () Bool)

(declare-fun array_inv!21378 (array!56953) Bool)

(declare-fun array_inv!21379 (array!56951) Bool)

(assert (=> b!943615 (= e!530628 (and tp!62384 tp_is_empty!20467 (array_inv!21378 (_keys!10520 thiss!1141)) (array_inv!21379 (_values!5641 thiss!1141)) e!530624))))

(declare-fun mapIsEmpty!32522 () Bool)

(assert (=> mapIsEmpty!32522 mapRes!32522))

(declare-fun b!943616 () Bool)

(assert (=> b!943616 (= e!530625 tp_is_empty!20467)))

(declare-fun b!943617 () Bool)

(declare-fun res!633806 () Bool)

(assert (=> b!943617 (=> (not res!633806) (not e!530626))))

(assert (=> b!943617 (= res!633806 (and (= (size!27863 (_values!5641 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27275 thiss!1141))) (= (size!27864 (_keys!10520 thiss!1141)) (size!27863 (_values!5641 thiss!1141))) (bvsge (mask!27275 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5350 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5350 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943618 () Bool)

(declare-fun res!633807 () Bool)

(assert (=> b!943618 (=> (not res!633807) (not e!530626))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8994 0))(
  ( (MissingZero!8994 (index!38347 (_ BitVec 32))) (Found!8994 (index!38348 (_ BitVec 32))) (Intermediate!8994 (undefined!9806 Bool) (index!38349 (_ BitVec 32)) (x!80921 (_ BitVec 32))) (Undefined!8994) (MissingVacant!8994 (index!38350 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56953 (_ BitVec 32)) SeekEntryResult!8994)

(assert (=> b!943618 (= res!633807 (not ((_ is Found!8994) (seekEntry!0 key!756 (_keys!10520 thiss!1141) (mask!27275 thiss!1141)))))))

(declare-fun b!943619 () Bool)

(declare-fun res!633805 () Bool)

(assert (=> b!943619 (=> (not res!633805) (not e!530626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56953 (_ BitVec 32)) Bool)

(assert (=> b!943619 (= res!633805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10520 thiss!1141) (mask!27275 thiss!1141)))))

(declare-fun res!633803 () Bool)

(assert (=> start!80428 (=> (not res!633803) (not e!530626))))

(declare-fun valid!1787 (LongMapFixedSize!4654) Bool)

(assert (=> start!80428 (= res!633803 (valid!1787 thiss!1141))))

(assert (=> start!80428 e!530626))

(assert (=> start!80428 e!530628))

(assert (=> start!80428 true))

(declare-fun b!943611 () Bool)

(declare-fun res!633808 () Bool)

(assert (=> b!943611 (=> (not res!633808) (not e!530626))))

(declare-datatypes ((tuple2!13394 0))(
  ( (tuple2!13395 (_1!6708 (_ BitVec 64)) (_2!6708 V!32255)) )
))
(declare-datatypes ((List!19208 0))(
  ( (Nil!19205) (Cons!19204 (h!20360 tuple2!13394) (t!27515 List!19208)) )
))
(declare-datatypes ((ListLongMap!12093 0))(
  ( (ListLongMap!12094 (toList!6062 List!19208)) )
))
(declare-fun contains!5143 (ListLongMap!12093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3296 (array!56953 array!56951 (_ BitVec 32) (_ BitVec 32) V!32255 V!32255 (_ BitVec 32) Int) ListLongMap!12093)

(assert (=> b!943611 (= res!633808 (contains!5143 (getCurrentListMap!3296 (_keys!10520 thiss!1141) (_values!5641 thiss!1141) (mask!27275 thiss!1141) (extraKeys!5350 thiss!1141) (zeroValue!5454 thiss!1141) (minValue!5454 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5618 thiss!1141)) key!756))))

(assert (= (and start!80428 res!633803) b!943609))

(assert (= (and b!943609 res!633804) b!943618))

(assert (= (and b!943618 res!633807) b!943611))

(assert (= (and b!943611 res!633808) b!943614))

(assert (= (and b!943614 res!633802) b!943617))

(assert (= (and b!943617 res!633806) b!943619))

(assert (= (and b!943619 res!633805) b!943612))

(assert (= (and b!943613 condMapEmpty!32522) mapIsEmpty!32522))

(assert (= (and b!943613 (not condMapEmpty!32522)) mapNonEmpty!32522))

(assert (= (and mapNonEmpty!32522 ((_ is ValueCellFull!9752) mapValue!32522)) b!943616))

(assert (= (and b!943613 ((_ is ValueCellFull!9752) mapDefault!32522)) b!943610))

(assert (= b!943615 b!943613))

(assert (= start!80428 b!943615))

(declare-fun m!878453 () Bool)

(assert (=> b!943618 m!878453))

(declare-fun m!878455 () Bool)

(assert (=> b!943612 m!878455))

(declare-fun m!878457 () Bool)

(assert (=> b!943619 m!878457))

(declare-fun m!878459 () Bool)

(assert (=> b!943615 m!878459))

(declare-fun m!878461 () Bool)

(assert (=> b!943615 m!878461))

(declare-fun m!878463 () Bool)

(assert (=> b!943611 m!878463))

(assert (=> b!943611 m!878463))

(declare-fun m!878465 () Bool)

(assert (=> b!943611 m!878465))

(declare-fun m!878467 () Bool)

(assert (=> start!80428 m!878467))

(declare-fun m!878469 () Bool)

(assert (=> mapNonEmpty!32522 m!878469))

(declare-fun m!878471 () Bool)

(assert (=> b!943614 m!878471))

(check-sat b_and!29381 (not b!943619) (not start!80428) (not b!943612) (not b!943611) (not mapNonEmpty!32522) (not b!943614) tp_is_empty!20467 (not b_next!17959) (not b!943618) (not b!943615))
(check-sat b_and!29381 (not b_next!17959))
