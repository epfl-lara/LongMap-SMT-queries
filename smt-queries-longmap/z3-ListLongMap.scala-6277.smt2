; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80286 () Bool)

(assert start!80286)

(declare-fun b!943135 () Bool)

(declare-fun b_free!17985 () Bool)

(declare-fun b_next!17985 () Bool)

(assert (=> b!943135 (= b_free!17985 (not b_next!17985))))

(declare-fun tp!62460 () Bool)

(declare-fun b_and!29397 () Bool)

(assert (=> b!943135 (= tp!62460 b_and!29397)))

(declare-fun mapNonEmpty!32561 () Bool)

(declare-fun mapRes!32561 () Bool)

(declare-fun tp!62461 () Bool)

(declare-fun e!530275 () Bool)

(assert (=> mapNonEmpty!32561 (= mapRes!32561 (and tp!62461 e!530275))))

(declare-fun mapKey!32561 () (_ BitVec 32))

(declare-datatypes ((V!32289 0))(
  ( (V!32290 (val!10297 Int)) )
))
(declare-datatypes ((ValueCell!9765 0))(
  ( (ValueCellFull!9765 (v!12828 V!32289)) (EmptyCell!9765) )
))
(declare-datatypes ((array!56952 0))(
  ( (array!56953 (arr!27402 (Array (_ BitVec 32) ValueCell!9765)) (size!27867 (_ BitVec 32))) )
))
(declare-datatypes ((array!56954 0))(
  ( (array!56955 (arr!27403 (Array (_ BitVec 32) (_ BitVec 64))) (size!27868 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4680 0))(
  ( (LongMapFixedSize!4681 (defaultEntry!5631 Int) (mask!27253 (_ BitVec 32)) (extraKeys!5363 (_ BitVec 32)) (zeroValue!5467 V!32289) (minValue!5467 V!32289) (_size!2395 (_ BitVec 32)) (_keys!10505 array!56954) (_values!5654 array!56952) (_vacant!2395 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4680)

(declare-fun mapValue!32561 () ValueCell!9765)

(declare-fun mapRest!32561 () (Array (_ BitVec 32) ValueCell!9765))

(assert (=> mapNonEmpty!32561 (= (arr!27402 (_values!5654 thiss!1141)) (store mapRest!32561 mapKey!32561 mapValue!32561))))

(declare-fun e!530280 () Bool)

(declare-fun tp_is_empty!20493 () Bool)

(declare-fun e!530277 () Bool)

(declare-fun array_inv!21290 (array!56954) Bool)

(declare-fun array_inv!21291 (array!56952) Bool)

(assert (=> b!943135 (= e!530277 (and tp!62460 tp_is_empty!20493 (array_inv!21290 (_keys!10505 thiss!1141)) (array_inv!21291 (_values!5654 thiss!1141)) e!530280))))

(declare-fun b!943136 () Bool)

(declare-fun res!633731 () Bool)

(declare-fun e!530276 () Bool)

(assert (=> b!943136 (=> (not res!633731) (not e!530276))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13430 0))(
  ( (tuple2!13431 (_1!6726 (_ BitVec 64)) (_2!6726 V!32289)) )
))
(declare-datatypes ((List!19240 0))(
  ( (Nil!19237) (Cons!19236 (h!20386 tuple2!13430) (t!27555 List!19240)) )
))
(declare-datatypes ((ListLongMap!12127 0))(
  ( (ListLongMap!12128 (toList!6079 List!19240)) )
))
(declare-fun contains!5149 (ListLongMap!12127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3313 (array!56954 array!56952 (_ BitVec 32) (_ BitVec 32) V!32289 V!32289 (_ BitVec 32) Int) ListLongMap!12127)

(assert (=> b!943136 (= res!633731 (contains!5149 (getCurrentListMap!3313 (_keys!10505 thiss!1141) (_values!5654 thiss!1141) (mask!27253 thiss!1141) (extraKeys!5363 thiss!1141) (zeroValue!5467 thiss!1141) (minValue!5467 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5631 thiss!1141)) key!756))))

(declare-fun res!633734 () Bool)

(assert (=> start!80286 (=> (not res!633734) (not e!530276))))

(declare-fun valid!1788 (LongMapFixedSize!4680) Bool)

(assert (=> start!80286 (= res!633734 (valid!1788 thiss!1141))))

(assert (=> start!80286 e!530276))

(assert (=> start!80286 e!530277))

(assert (=> start!80286 true))

(declare-fun b!943137 () Bool)

(declare-fun res!633733 () Bool)

(assert (=> b!943137 (=> (not res!633733) (not e!530276))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9045 0))(
  ( (MissingZero!9045 (index!38551 (_ BitVec 32))) (Found!9045 (index!38552 (_ BitVec 32))) (Intermediate!9045 (undefined!9857 Bool) (index!38553 (_ BitVec 32)) (x!80990 (_ BitVec 32))) (Undefined!9045) (MissingVacant!9045 (index!38554 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56954 (_ BitVec 32)) SeekEntryResult!9045)

(assert (=> b!943137 (= res!633733 (not ((_ is Found!9045) (seekEntry!0 key!756 (_keys!10505 thiss!1141) (mask!27253 thiss!1141)))))))

(declare-fun b!943138 () Bool)

(declare-fun res!633737 () Bool)

(assert (=> b!943138 (=> (not res!633737) (not e!530276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56954 (_ BitVec 32)) Bool)

(assert (=> b!943138 (= res!633737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10505 thiss!1141) (mask!27253 thiss!1141)))))

(declare-fun b!943139 () Bool)

(assert (=> b!943139 (= e!530275 tp_is_empty!20493)))

(declare-fun mapIsEmpty!32561 () Bool)

(assert (=> mapIsEmpty!32561 mapRes!32561))

(declare-fun b!943140 () Bool)

(declare-fun res!633736 () Bool)

(assert (=> b!943140 (=> (not res!633736) (not e!530276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943140 (= res!633736 (validMask!0 (mask!27253 thiss!1141)))))

(declare-fun b!943141 () Bool)

(assert (=> b!943141 (= e!530276 false)))

(declare-fun lt!425227 () Bool)

(declare-datatypes ((List!19241 0))(
  ( (Nil!19238) (Cons!19237 (h!20387 (_ BitVec 64)) (t!27556 List!19241)) )
))
(declare-fun arrayNoDuplicates!0 (array!56954 (_ BitVec 32) List!19241) Bool)

(assert (=> b!943141 (= lt!425227 (arrayNoDuplicates!0 (_keys!10505 thiss!1141) #b00000000000000000000000000000000 Nil!19238))))

(declare-fun b!943142 () Bool)

(declare-fun e!530279 () Bool)

(assert (=> b!943142 (= e!530279 tp_is_empty!20493)))

(declare-fun b!943143 () Bool)

(declare-fun res!633732 () Bool)

(assert (=> b!943143 (=> (not res!633732) (not e!530276))))

(assert (=> b!943143 (= res!633732 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943144 () Bool)

(declare-fun res!633735 () Bool)

(assert (=> b!943144 (=> (not res!633735) (not e!530276))))

(assert (=> b!943144 (= res!633735 (and (= (size!27867 (_values!5654 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27253 thiss!1141))) (= (size!27868 (_keys!10505 thiss!1141)) (size!27867 (_values!5654 thiss!1141))) (bvsge (mask!27253 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5363 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5363 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943145 () Bool)

(assert (=> b!943145 (= e!530280 (and e!530279 mapRes!32561))))

(declare-fun condMapEmpty!32561 () Bool)

(declare-fun mapDefault!32561 () ValueCell!9765)

(assert (=> b!943145 (= condMapEmpty!32561 (= (arr!27402 (_values!5654 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9765)) mapDefault!32561)))))

(assert (= (and start!80286 res!633734) b!943143))

(assert (= (and b!943143 res!633732) b!943137))

(assert (= (and b!943137 res!633733) b!943136))

(assert (= (and b!943136 res!633731) b!943140))

(assert (= (and b!943140 res!633736) b!943144))

(assert (= (and b!943144 res!633735) b!943138))

(assert (= (and b!943138 res!633737) b!943141))

(assert (= (and b!943145 condMapEmpty!32561) mapIsEmpty!32561))

(assert (= (and b!943145 (not condMapEmpty!32561)) mapNonEmpty!32561))

(assert (= (and mapNonEmpty!32561 ((_ is ValueCellFull!9765) mapValue!32561)) b!943139))

(assert (= (and b!943145 ((_ is ValueCellFull!9765) mapDefault!32561)) b!943142))

(assert (= b!943135 b!943145))

(assert (= start!80286 b!943135))

(declare-fun m!877419 () Bool)

(assert (=> b!943140 m!877419))

(declare-fun m!877421 () Bool)

(assert (=> start!80286 m!877421))

(declare-fun m!877423 () Bool)

(assert (=> mapNonEmpty!32561 m!877423))

(declare-fun m!877425 () Bool)

(assert (=> b!943138 m!877425))

(declare-fun m!877427 () Bool)

(assert (=> b!943135 m!877427))

(declare-fun m!877429 () Bool)

(assert (=> b!943135 m!877429))

(declare-fun m!877431 () Bool)

(assert (=> b!943141 m!877431))

(declare-fun m!877433 () Bool)

(assert (=> b!943137 m!877433))

(declare-fun m!877435 () Bool)

(assert (=> b!943136 m!877435))

(assert (=> b!943136 m!877435))

(declare-fun m!877437 () Bool)

(assert (=> b!943136 m!877437))

(check-sat (not start!80286) (not b_next!17985) (not b!943138) (not b!943137) (not b!943136) (not b!943135) b_and!29397 (not mapNonEmpty!32561) tp_is_empty!20493 (not b!943140) (not b!943141))
(check-sat b_and!29397 (not b_next!17985))
