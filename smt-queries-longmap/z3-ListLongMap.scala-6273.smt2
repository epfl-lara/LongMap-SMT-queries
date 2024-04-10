; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80262 () Bool)

(assert start!80262)

(declare-fun b!942743 () Bool)

(declare-fun b_free!17961 () Bool)

(declare-fun b_next!17961 () Bool)

(assert (=> b!942743 (= b_free!17961 (not b_next!17961))))

(declare-fun tp!62389 () Bool)

(declare-fun b_and!29373 () Bool)

(assert (=> b!942743 (= tp!62389 b_and!29373)))

(declare-fun b!942739 () Bool)

(declare-fun res!633480 () Bool)

(declare-fun e!530062 () Bool)

(assert (=> b!942739 (=> (not res!633480) (not e!530062))))

(declare-datatypes ((V!32257 0))(
  ( (V!32258 (val!10285 Int)) )
))
(declare-datatypes ((ValueCell!9753 0))(
  ( (ValueCellFull!9753 (v!12816 V!32257)) (EmptyCell!9753) )
))
(declare-datatypes ((array!56904 0))(
  ( (array!56905 (arr!27378 (Array (_ BitVec 32) ValueCell!9753)) (size!27843 (_ BitVec 32))) )
))
(declare-datatypes ((array!56906 0))(
  ( (array!56907 (arr!27379 (Array (_ BitVec 32) (_ BitVec 64))) (size!27844 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4656 0))(
  ( (LongMapFixedSize!4657 (defaultEntry!5619 Int) (mask!27233 (_ BitVec 32)) (extraKeys!5351 (_ BitVec 32)) (zeroValue!5455 V!32257) (minValue!5455 V!32257) (_size!2383 (_ BitVec 32)) (_keys!10493 array!56906) (_values!5642 array!56904) (_vacant!2383 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4656)

(assert (=> b!942739 (= res!633480 (and (= (size!27843 (_values!5642 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27233 thiss!1141))) (= (size!27844 (_keys!10493 thiss!1141)) (size!27843 (_values!5642 thiss!1141))) (bvsge (mask!27233 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5351 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5351 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942740 () Bool)

(declare-fun res!633484 () Bool)

(assert (=> b!942740 (=> (not res!633484) (not e!530062))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9036 0))(
  ( (MissingZero!9036 (index!38515 (_ BitVec 32))) (Found!9036 (index!38516 (_ BitVec 32))) (Intermediate!9036 (undefined!9848 Bool) (index!38517 (_ BitVec 32)) (x!80949 (_ BitVec 32))) (Undefined!9036) (MissingVacant!9036 (index!38518 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56906 (_ BitVec 32)) SeekEntryResult!9036)

(assert (=> b!942740 (= res!633484 (not ((_ is Found!9036) (seekEntry!0 key!756 (_keys!10493 thiss!1141) (mask!27233 thiss!1141)))))))

(declare-fun b!942741 () Bool)

(declare-fun res!633479 () Bool)

(assert (=> b!942741 (=> (not res!633479) (not e!530062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56906 (_ BitVec 32)) Bool)

(assert (=> b!942741 (= res!633479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10493 thiss!1141) (mask!27233 thiss!1141)))))

(declare-fun b!942742 () Bool)

(declare-fun res!633483 () Bool)

(assert (=> b!942742 (=> (not res!633483) (not e!530062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942742 (= res!633483 (validMask!0 (mask!27233 thiss!1141)))))

(declare-fun e!530060 () Bool)

(declare-fun e!530064 () Bool)

(declare-fun tp_is_empty!20469 () Bool)

(declare-fun array_inv!21270 (array!56906) Bool)

(declare-fun array_inv!21271 (array!56904) Bool)

(assert (=> b!942743 (= e!530060 (and tp!62389 tp_is_empty!20469 (array_inv!21270 (_keys!10493 thiss!1141)) (array_inv!21271 (_values!5642 thiss!1141)) e!530064))))

(declare-fun b!942744 () Bool)

(assert (=> b!942744 (= e!530062 false)))

(declare-fun lt!425191 () Bool)

(declare-datatypes ((List!19221 0))(
  ( (Nil!19218) (Cons!19217 (h!20367 (_ BitVec 64)) (t!27536 List!19221)) )
))
(declare-fun arrayNoDuplicates!0 (array!56906 (_ BitVec 32) List!19221) Bool)

(assert (=> b!942744 (= lt!425191 (arrayNoDuplicates!0 (_keys!10493 thiss!1141) #b00000000000000000000000000000000 Nil!19218))))

(declare-fun res!633481 () Bool)

(assert (=> start!80262 (=> (not res!633481) (not e!530062))))

(declare-fun valid!1782 (LongMapFixedSize!4656) Bool)

(assert (=> start!80262 (= res!633481 (valid!1782 thiss!1141))))

(assert (=> start!80262 e!530062))

(assert (=> start!80262 e!530060))

(assert (=> start!80262 true))

(declare-fun b!942745 () Bool)

(declare-fun e!530063 () Bool)

(declare-fun mapRes!32525 () Bool)

(assert (=> b!942745 (= e!530064 (and e!530063 mapRes!32525))))

(declare-fun condMapEmpty!32525 () Bool)

(declare-fun mapDefault!32525 () ValueCell!9753)

(assert (=> b!942745 (= condMapEmpty!32525 (= (arr!27378 (_values!5642 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9753)) mapDefault!32525)))))

(declare-fun mapNonEmpty!32525 () Bool)

(declare-fun tp!62388 () Bool)

(declare-fun e!530059 () Bool)

(assert (=> mapNonEmpty!32525 (= mapRes!32525 (and tp!62388 e!530059))))

(declare-fun mapValue!32525 () ValueCell!9753)

(declare-fun mapRest!32525 () (Array (_ BitVec 32) ValueCell!9753))

(declare-fun mapKey!32525 () (_ BitVec 32))

(assert (=> mapNonEmpty!32525 (= (arr!27378 (_values!5642 thiss!1141)) (store mapRest!32525 mapKey!32525 mapValue!32525))))

(declare-fun b!942746 () Bool)

(declare-fun res!633485 () Bool)

(assert (=> b!942746 (=> (not res!633485) (not e!530062))))

(declare-datatypes ((tuple2!13410 0))(
  ( (tuple2!13411 (_1!6716 (_ BitVec 64)) (_2!6716 V!32257)) )
))
(declare-datatypes ((List!19222 0))(
  ( (Nil!19219) (Cons!19218 (h!20368 tuple2!13410) (t!27537 List!19222)) )
))
(declare-datatypes ((ListLongMap!12107 0))(
  ( (ListLongMap!12108 (toList!6069 List!19222)) )
))
(declare-fun contains!5139 (ListLongMap!12107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3303 (array!56906 array!56904 (_ BitVec 32) (_ BitVec 32) V!32257 V!32257 (_ BitVec 32) Int) ListLongMap!12107)

(assert (=> b!942746 (= res!633485 (contains!5139 (getCurrentListMap!3303 (_keys!10493 thiss!1141) (_values!5642 thiss!1141) (mask!27233 thiss!1141) (extraKeys!5351 thiss!1141) (zeroValue!5455 thiss!1141) (minValue!5455 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5619 thiss!1141)) key!756))))

(declare-fun b!942747 () Bool)

(assert (=> b!942747 (= e!530059 tp_is_empty!20469)))

(declare-fun mapIsEmpty!32525 () Bool)

(assert (=> mapIsEmpty!32525 mapRes!32525))

(declare-fun b!942748 () Bool)

(declare-fun res!633482 () Bool)

(assert (=> b!942748 (=> (not res!633482) (not e!530062))))

(assert (=> b!942748 (= res!633482 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942749 () Bool)

(assert (=> b!942749 (= e!530063 tp_is_empty!20469)))

(assert (= (and start!80262 res!633481) b!942748))

(assert (= (and b!942748 res!633482) b!942740))

(assert (= (and b!942740 res!633484) b!942746))

(assert (= (and b!942746 res!633485) b!942742))

(assert (= (and b!942742 res!633483) b!942739))

(assert (= (and b!942739 res!633480) b!942741))

(assert (= (and b!942741 res!633479) b!942744))

(assert (= (and b!942745 condMapEmpty!32525) mapIsEmpty!32525))

(assert (= (and b!942745 (not condMapEmpty!32525)) mapNonEmpty!32525))

(assert (= (and mapNonEmpty!32525 ((_ is ValueCellFull!9753) mapValue!32525)) b!942747))

(assert (= (and b!942745 ((_ is ValueCellFull!9753) mapDefault!32525)) b!942749))

(assert (= b!942743 b!942745))

(assert (= start!80262 b!942743))

(declare-fun m!877179 () Bool)

(assert (=> b!942744 m!877179))

(declare-fun m!877181 () Bool)

(assert (=> b!942740 m!877181))

(declare-fun m!877183 () Bool)

(assert (=> start!80262 m!877183))

(declare-fun m!877185 () Bool)

(assert (=> b!942741 m!877185))

(declare-fun m!877187 () Bool)

(assert (=> b!942743 m!877187))

(declare-fun m!877189 () Bool)

(assert (=> b!942743 m!877189))

(declare-fun m!877191 () Bool)

(assert (=> mapNonEmpty!32525 m!877191))

(declare-fun m!877193 () Bool)

(assert (=> b!942742 m!877193))

(declare-fun m!877195 () Bool)

(assert (=> b!942746 m!877195))

(assert (=> b!942746 m!877195))

(declare-fun m!877197 () Bool)

(assert (=> b!942746 m!877197))

(check-sat (not mapNonEmpty!32525) b_and!29373 (not b!942743) (not b!942746) tp_is_empty!20469 (not b!942744) (not b_next!17961) (not b!942742) (not b!942741) (not start!80262) (not b!942740))
(check-sat b_and!29373 (not b_next!17961))
