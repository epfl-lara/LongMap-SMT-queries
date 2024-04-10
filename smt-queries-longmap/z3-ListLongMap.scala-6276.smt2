; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80280 () Bool)

(assert start!80280)

(declare-fun b!943043 () Bool)

(declare-fun b_free!17979 () Bool)

(declare-fun b_next!17979 () Bool)

(assert (=> b!943043 (= b_free!17979 (not b_next!17979))))

(declare-fun tp!62442 () Bool)

(declare-fun b_and!29391 () Bool)

(assert (=> b!943043 (= tp!62442 b_and!29391)))

(declare-fun res!633668 () Bool)

(declare-fun e!530226 () Bool)

(assert (=> start!80280 (=> (not res!633668) (not e!530226))))

(declare-datatypes ((V!32281 0))(
  ( (V!32282 (val!10294 Int)) )
))
(declare-datatypes ((ValueCell!9762 0))(
  ( (ValueCellFull!9762 (v!12825 V!32281)) (EmptyCell!9762) )
))
(declare-datatypes ((array!56940 0))(
  ( (array!56941 (arr!27396 (Array (_ BitVec 32) ValueCell!9762)) (size!27861 (_ BitVec 32))) )
))
(declare-datatypes ((array!56942 0))(
  ( (array!56943 (arr!27397 (Array (_ BitVec 32) (_ BitVec 64))) (size!27862 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4674 0))(
  ( (LongMapFixedSize!4675 (defaultEntry!5628 Int) (mask!27248 (_ BitVec 32)) (extraKeys!5360 (_ BitVec 32)) (zeroValue!5464 V!32281) (minValue!5464 V!32281) (_size!2392 (_ BitVec 32)) (_keys!10502 array!56942) (_values!5651 array!56940) (_vacant!2392 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4674)

(declare-fun valid!1787 (LongMapFixedSize!4674) Bool)

(assert (=> start!80280 (= res!633668 (valid!1787 thiss!1141))))

(assert (=> start!80280 e!530226))

(declare-fun e!530222 () Bool)

(assert (=> start!80280 e!530222))

(assert (=> start!80280 true))

(declare-fun b!943036 () Bool)

(declare-fun e!530225 () Bool)

(declare-fun e!530221 () Bool)

(declare-fun mapRes!32552 () Bool)

(assert (=> b!943036 (= e!530225 (and e!530221 mapRes!32552))))

(declare-fun condMapEmpty!32552 () Bool)

(declare-fun mapDefault!32552 () ValueCell!9762)

(assert (=> b!943036 (= condMapEmpty!32552 (= (arr!27396 (_values!5651 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9762)) mapDefault!32552)))))

(declare-fun mapNonEmpty!32552 () Bool)

(declare-fun tp!62443 () Bool)

(declare-fun e!530223 () Bool)

(assert (=> mapNonEmpty!32552 (= mapRes!32552 (and tp!62443 e!530223))))

(declare-fun mapKey!32552 () (_ BitVec 32))

(declare-fun mapRest!32552 () (Array (_ BitVec 32) ValueCell!9762))

(declare-fun mapValue!32552 () ValueCell!9762)

(assert (=> mapNonEmpty!32552 (= (arr!27396 (_values!5651 thiss!1141)) (store mapRest!32552 mapKey!32552 mapValue!32552))))

(declare-fun mapIsEmpty!32552 () Bool)

(assert (=> mapIsEmpty!32552 mapRes!32552))

(declare-fun b!943037 () Bool)

(declare-fun res!633670 () Bool)

(assert (=> b!943037 (=> (not res!633670) (not e!530226))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13428 0))(
  ( (tuple2!13429 (_1!6725 (_ BitVec 64)) (_2!6725 V!32281)) )
))
(declare-datatypes ((List!19237 0))(
  ( (Nil!19234) (Cons!19233 (h!20383 tuple2!13428) (t!27552 List!19237)) )
))
(declare-datatypes ((ListLongMap!12125 0))(
  ( (ListLongMap!12126 (toList!6078 List!19237)) )
))
(declare-fun contains!5148 (ListLongMap!12125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3312 (array!56942 array!56940 (_ BitVec 32) (_ BitVec 32) V!32281 V!32281 (_ BitVec 32) Int) ListLongMap!12125)

(assert (=> b!943037 (= res!633670 (contains!5148 (getCurrentListMap!3312 (_keys!10502 thiss!1141) (_values!5651 thiss!1141) (mask!27248 thiss!1141) (extraKeys!5360 thiss!1141) (zeroValue!5464 thiss!1141) (minValue!5464 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5628 thiss!1141)) key!756))))

(declare-fun b!943038 () Bool)

(declare-fun res!633673 () Bool)

(assert (=> b!943038 (=> (not res!633673) (not e!530226))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9044 0))(
  ( (MissingZero!9044 (index!38547 (_ BitVec 32))) (Found!9044 (index!38548 (_ BitVec 32))) (Intermediate!9044 (undefined!9856 Bool) (index!38549 (_ BitVec 32)) (x!80981 (_ BitVec 32))) (Undefined!9044) (MissingVacant!9044 (index!38550 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56942 (_ BitVec 32)) SeekEntryResult!9044)

(assert (=> b!943038 (= res!633673 (not ((_ is Found!9044) (seekEntry!0 key!756 (_keys!10502 thiss!1141) (mask!27248 thiss!1141)))))))

(declare-fun b!943039 () Bool)

(declare-fun res!633669 () Bool)

(assert (=> b!943039 (=> (not res!633669) (not e!530226))))

(assert (=> b!943039 (= res!633669 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943040 () Bool)

(declare-fun res!633671 () Bool)

(assert (=> b!943040 (=> (not res!633671) (not e!530226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943040 (= res!633671 (validMask!0 (mask!27248 thiss!1141)))))

(declare-fun b!943041 () Bool)

(declare-fun tp_is_empty!20487 () Bool)

(assert (=> b!943041 (= e!530223 tp_is_empty!20487)))

(declare-fun b!943042 () Bool)

(declare-fun res!633672 () Bool)

(assert (=> b!943042 (=> (not res!633672) (not e!530226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56942 (_ BitVec 32)) Bool)

(assert (=> b!943042 (= res!633672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10502 thiss!1141) (mask!27248 thiss!1141)))))

(declare-fun array_inv!21286 (array!56942) Bool)

(declare-fun array_inv!21287 (array!56940) Bool)

(assert (=> b!943043 (= e!530222 (and tp!62442 tp_is_empty!20487 (array_inv!21286 (_keys!10502 thiss!1141)) (array_inv!21287 (_values!5651 thiss!1141)) e!530225))))

(declare-fun b!943044 () Bool)

(declare-fun res!633674 () Bool)

(assert (=> b!943044 (=> (not res!633674) (not e!530226))))

(assert (=> b!943044 (= res!633674 (and (= (size!27861 (_values!5651 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27248 thiss!1141))) (= (size!27862 (_keys!10502 thiss!1141)) (size!27861 (_values!5651 thiss!1141))) (bvsge (mask!27248 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5360 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5360 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943045 () Bool)

(assert (=> b!943045 (= e!530221 tp_is_empty!20487)))

(declare-fun b!943046 () Bool)

(assert (=> b!943046 (= e!530226 false)))

(declare-fun lt!425218 () Bool)

(declare-datatypes ((List!19238 0))(
  ( (Nil!19235) (Cons!19234 (h!20384 (_ BitVec 64)) (t!27553 List!19238)) )
))
(declare-fun arrayNoDuplicates!0 (array!56942 (_ BitVec 32) List!19238) Bool)

(assert (=> b!943046 (= lt!425218 (arrayNoDuplicates!0 (_keys!10502 thiss!1141) #b00000000000000000000000000000000 Nil!19235))))

(assert (= (and start!80280 res!633668) b!943039))

(assert (= (and b!943039 res!633669) b!943038))

(assert (= (and b!943038 res!633673) b!943037))

(assert (= (and b!943037 res!633670) b!943040))

(assert (= (and b!943040 res!633671) b!943044))

(assert (= (and b!943044 res!633674) b!943042))

(assert (= (and b!943042 res!633672) b!943046))

(assert (= (and b!943036 condMapEmpty!32552) mapIsEmpty!32552))

(assert (= (and b!943036 (not condMapEmpty!32552)) mapNonEmpty!32552))

(assert (= (and mapNonEmpty!32552 ((_ is ValueCellFull!9762) mapValue!32552)) b!943041))

(assert (= (and b!943036 ((_ is ValueCellFull!9762) mapDefault!32552)) b!943045))

(assert (= b!943043 b!943036))

(assert (= start!80280 b!943043))

(declare-fun m!877359 () Bool)

(assert (=> b!943040 m!877359))

(declare-fun m!877361 () Bool)

(assert (=> mapNonEmpty!32552 m!877361))

(declare-fun m!877363 () Bool)

(assert (=> b!943046 m!877363))

(declare-fun m!877365 () Bool)

(assert (=> b!943037 m!877365))

(assert (=> b!943037 m!877365))

(declare-fun m!877367 () Bool)

(assert (=> b!943037 m!877367))

(declare-fun m!877369 () Bool)

(assert (=> start!80280 m!877369))

(declare-fun m!877371 () Bool)

(assert (=> b!943043 m!877371))

(declare-fun m!877373 () Bool)

(assert (=> b!943043 m!877373))

(declare-fun m!877375 () Bool)

(assert (=> b!943038 m!877375))

(declare-fun m!877377 () Bool)

(assert (=> b!943042 m!877377))

(check-sat (not b!943040) (not b!943043) tp_is_empty!20487 (not start!80280) (not b!943037) b_and!29391 (not b!943042) (not mapNonEmpty!32552) (not b_next!17979) (not b!943038) (not b!943046))
(check-sat b_and!29391 (not b_next!17979))
