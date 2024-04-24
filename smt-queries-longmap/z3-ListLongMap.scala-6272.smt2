; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80422 () Bool)

(assert start!80422)

(declare-fun b!943515 () Bool)

(declare-fun b_free!17953 () Bool)

(declare-fun b_next!17953 () Bool)

(assert (=> b!943515 (= b_free!17953 (not b_next!17953))))

(declare-fun tp!62365 () Bool)

(declare-fun b_and!29375 () Bool)

(assert (=> b!943515 (= tp!62365 b_and!29375)))

(declare-fun b!943510 () Bool)

(declare-fun res!633742 () Bool)

(declare-fun e!530571 () Bool)

(assert (=> b!943510 (=> (not res!633742) (not e!530571))))

(declare-datatypes ((V!32247 0))(
  ( (V!32248 (val!10281 Int)) )
))
(declare-datatypes ((ValueCell!9749 0))(
  ( (ValueCellFull!9749 (v!12809 V!32247)) (EmptyCell!9749) )
))
(declare-datatypes ((array!56939 0))(
  ( (array!56940 (arr!27391 (Array (_ BitVec 32) ValueCell!9749)) (size!27857 (_ BitVec 32))) )
))
(declare-datatypes ((array!56941 0))(
  ( (array!56942 (arr!27392 (Array (_ BitVec 32) (_ BitVec 64))) (size!27858 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4648 0))(
  ( (LongMapFixedSize!4649 (defaultEntry!5615 Int) (mask!27270 (_ BitVec 32)) (extraKeys!5347 (_ BitVec 32)) (zeroValue!5451 V!32247) (minValue!5451 V!32247) (_size!2379 (_ BitVec 32)) (_keys!10517 array!56941) (_values!5638 array!56939) (_vacant!2379 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4648)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56941 (_ BitVec 32)) Bool)

(assert (=> b!943510 (= res!633742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10517 thiss!1141) (mask!27270 thiss!1141)))))

(declare-fun b!943511 () Bool)

(declare-fun res!633745 () Bool)

(assert (=> b!943511 (=> (not res!633745) (not e!530571))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943511 (= res!633745 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943512 () Bool)

(declare-fun e!530572 () Bool)

(declare-fun e!530574 () Bool)

(declare-fun mapRes!32513 () Bool)

(assert (=> b!943512 (= e!530572 (and e!530574 mapRes!32513))))

(declare-fun condMapEmpty!32513 () Bool)

(declare-fun mapDefault!32513 () ValueCell!9749)

(assert (=> b!943512 (= condMapEmpty!32513 (= (arr!27391 (_values!5638 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9749)) mapDefault!32513)))))

(declare-fun b!943513 () Bool)

(declare-fun e!530570 () Bool)

(declare-fun tp_is_empty!20461 () Bool)

(assert (=> b!943513 (= e!530570 tp_is_empty!20461)))

(declare-fun b!943514 () Bool)

(declare-fun res!633741 () Bool)

(assert (=> b!943514 (=> (not res!633741) (not e!530571))))

(declare-datatypes ((tuple2!13390 0))(
  ( (tuple2!13391 (_1!6706 (_ BitVec 64)) (_2!6706 V!32247)) )
))
(declare-datatypes ((List!19203 0))(
  ( (Nil!19200) (Cons!19199 (h!20355 tuple2!13390) (t!27510 List!19203)) )
))
(declare-datatypes ((ListLongMap!12089 0))(
  ( (ListLongMap!12090 (toList!6060 List!19203)) )
))
(declare-fun contains!5141 (ListLongMap!12089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3294 (array!56941 array!56939 (_ BitVec 32) (_ BitVec 32) V!32247 V!32247 (_ BitVec 32) Int) ListLongMap!12089)

(assert (=> b!943514 (= res!633741 (contains!5141 (getCurrentListMap!3294 (_keys!10517 thiss!1141) (_values!5638 thiss!1141) (mask!27270 thiss!1141) (extraKeys!5347 thiss!1141) (zeroValue!5451 thiss!1141) (minValue!5451 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5615 thiss!1141)) key!756))))

(declare-fun e!530573 () Bool)

(declare-fun array_inv!21374 (array!56941) Bool)

(declare-fun array_inv!21375 (array!56939) Bool)

(assert (=> b!943515 (= e!530573 (and tp!62365 tp_is_empty!20461 (array_inv!21374 (_keys!10517 thiss!1141)) (array_inv!21375 (_values!5638 thiss!1141)) e!530572))))

(declare-fun b!943516 () Bool)

(declare-fun res!633740 () Bool)

(assert (=> b!943516 (=> (not res!633740) (not e!530571))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8991 0))(
  ( (MissingZero!8991 (index!38335 (_ BitVec 32))) (Found!8991 (index!38336 (_ BitVec 32))) (Intermediate!8991 (undefined!9803 Bool) (index!38337 (_ BitVec 32)) (x!80910 (_ BitVec 32))) (Undefined!8991) (MissingVacant!8991 (index!38338 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56941 (_ BitVec 32)) SeekEntryResult!8991)

(assert (=> b!943516 (= res!633740 (not ((_ is Found!8991) (seekEntry!0 key!756 (_keys!10517 thiss!1141) (mask!27270 thiss!1141)))))))

(declare-fun b!943517 () Bool)

(declare-fun res!633739 () Bool)

(assert (=> b!943517 (=> (not res!633739) (not e!530571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943517 (= res!633739 (validMask!0 (mask!27270 thiss!1141)))))

(declare-fun b!943518 () Bool)

(assert (=> b!943518 (= e!530574 tp_is_empty!20461)))

(declare-fun mapNonEmpty!32513 () Bool)

(declare-fun tp!62366 () Bool)

(assert (=> mapNonEmpty!32513 (= mapRes!32513 (and tp!62366 e!530570))))

(declare-fun mapRest!32513 () (Array (_ BitVec 32) ValueCell!9749))

(declare-fun mapKey!32513 () (_ BitVec 32))

(declare-fun mapValue!32513 () ValueCell!9749)

(assert (=> mapNonEmpty!32513 (= (arr!27391 (_values!5638 thiss!1141)) (store mapRest!32513 mapKey!32513 mapValue!32513))))

(declare-fun res!633743 () Bool)

(assert (=> start!80422 (=> (not res!633743) (not e!530571))))

(declare-fun valid!1785 (LongMapFixedSize!4648) Bool)

(assert (=> start!80422 (= res!633743 (valid!1785 thiss!1141))))

(assert (=> start!80422 e!530571))

(assert (=> start!80422 e!530573))

(assert (=> start!80422 true))

(declare-fun b!943519 () Bool)

(declare-fun res!633744 () Bool)

(assert (=> b!943519 (=> (not res!633744) (not e!530571))))

(assert (=> b!943519 (= res!633744 (and (= (size!27857 (_values!5638 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27270 thiss!1141))) (= (size!27858 (_keys!10517 thiss!1141)) (size!27857 (_values!5638 thiss!1141))) (bvsge (mask!27270 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5347 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5347 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943520 () Bool)

(assert (=> b!943520 (= e!530571 false)))

(declare-fun lt!425540 () Bool)

(declare-datatypes ((List!19204 0))(
  ( (Nil!19201) (Cons!19200 (h!20356 (_ BitVec 64)) (t!27511 List!19204)) )
))
(declare-fun arrayNoDuplicates!0 (array!56941 (_ BitVec 32) List!19204) Bool)

(assert (=> b!943520 (= lt!425540 (arrayNoDuplicates!0 (_keys!10517 thiss!1141) #b00000000000000000000000000000000 Nil!19201))))

(declare-fun mapIsEmpty!32513 () Bool)

(assert (=> mapIsEmpty!32513 mapRes!32513))

(assert (= (and start!80422 res!633743) b!943511))

(assert (= (and b!943511 res!633745) b!943516))

(assert (= (and b!943516 res!633740) b!943514))

(assert (= (and b!943514 res!633741) b!943517))

(assert (= (and b!943517 res!633739) b!943519))

(assert (= (and b!943519 res!633744) b!943510))

(assert (= (and b!943510 res!633742) b!943520))

(assert (= (and b!943512 condMapEmpty!32513) mapIsEmpty!32513))

(assert (= (and b!943512 (not condMapEmpty!32513)) mapNonEmpty!32513))

(assert (= (and mapNonEmpty!32513 ((_ is ValueCellFull!9749) mapValue!32513)) b!943513))

(assert (= (and b!943512 ((_ is ValueCellFull!9749) mapDefault!32513)) b!943518))

(assert (= b!943515 b!943512))

(assert (= start!80422 b!943515))

(declare-fun m!878393 () Bool)

(assert (=> start!80422 m!878393))

(declare-fun m!878395 () Bool)

(assert (=> b!943520 m!878395))

(declare-fun m!878397 () Bool)

(assert (=> b!943517 m!878397))

(declare-fun m!878399 () Bool)

(assert (=> b!943514 m!878399))

(assert (=> b!943514 m!878399))

(declare-fun m!878401 () Bool)

(assert (=> b!943514 m!878401))

(declare-fun m!878403 () Bool)

(assert (=> b!943516 m!878403))

(declare-fun m!878405 () Bool)

(assert (=> mapNonEmpty!32513 m!878405))

(declare-fun m!878407 () Bool)

(assert (=> b!943510 m!878407))

(declare-fun m!878409 () Bool)

(assert (=> b!943515 m!878409))

(declare-fun m!878411 () Bool)

(assert (=> b!943515 m!878411))

(check-sat (not start!80422) b_and!29375 tp_is_empty!20461 (not b!943517) (not b!943514) (not b_next!17953) (not b!943510) (not b!943515) (not mapNonEmpty!32513) (not b!943516) (not b!943520))
(check-sat b_and!29375 (not b_next!17953))
