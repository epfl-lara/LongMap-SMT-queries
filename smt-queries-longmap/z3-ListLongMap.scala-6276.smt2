; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80260 () Bool)

(assert start!80260)

(declare-fun b!942767 () Bool)

(declare-fun b_free!17977 () Bool)

(declare-fun b_next!17977 () Bool)

(assert (=> b!942767 (= b_free!17977 (not b_next!17977))))

(declare-fun tp!62437 () Bool)

(declare-fun b_and!29363 () Bool)

(assert (=> b!942767 (= tp!62437 b_and!29363)))

(declare-fun res!633539 () Bool)

(declare-fun e!530055 () Bool)

(assert (=> start!80260 (=> (not res!633539) (not e!530055))))

(declare-datatypes ((V!32279 0))(
  ( (V!32280 (val!10293 Int)) )
))
(declare-datatypes ((ValueCell!9761 0))(
  ( (ValueCellFull!9761 (v!12823 V!32279)) (EmptyCell!9761) )
))
(declare-datatypes ((array!56901 0))(
  ( (array!56902 (arr!27377 (Array (_ BitVec 32) ValueCell!9761)) (size!27844 (_ BitVec 32))) )
))
(declare-datatypes ((array!56903 0))(
  ( (array!56904 (arr!27378 (Array (_ BitVec 32) (_ BitVec 64))) (size!27845 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4672 0))(
  ( (LongMapFixedSize!4673 (defaultEntry!5627 Int) (mask!27240 (_ BitVec 32)) (extraKeys!5359 (_ BitVec 32)) (zeroValue!5463 V!32279) (minValue!5463 V!32279) (_size!2391 (_ BitVec 32)) (_keys!10496 array!56903) (_values!5650 array!56901) (_vacant!2391 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4672)

(declare-fun valid!1797 (LongMapFixedSize!4672) Bool)

(assert (=> start!80260 (= res!633539 (valid!1797 thiss!1141))))

(assert (=> start!80260 e!530055))

(declare-fun e!530056 () Bool)

(assert (=> start!80260 e!530056))

(assert (=> start!80260 true))

(declare-fun mapNonEmpty!32549 () Bool)

(declare-fun mapRes!32549 () Bool)

(declare-fun tp!62438 () Bool)

(declare-fun e!530060 () Bool)

(assert (=> mapNonEmpty!32549 (= mapRes!32549 (and tp!62438 e!530060))))

(declare-fun mapRest!32549 () (Array (_ BitVec 32) ValueCell!9761))

(declare-fun mapKey!32549 () (_ BitVec 32))

(declare-fun mapValue!32549 () ValueCell!9761)

(assert (=> mapNonEmpty!32549 (= (arr!27377 (_values!5650 thiss!1141)) (store mapRest!32549 mapKey!32549 mapValue!32549))))

(declare-fun b!942764 () Bool)

(declare-fun e!530058 () Bool)

(declare-fun tp_is_empty!20485 () Bool)

(assert (=> b!942764 (= e!530058 tp_is_empty!20485)))

(declare-fun b!942765 () Bool)

(declare-fun res!633537 () Bool)

(assert (=> b!942765 (=> (not res!633537) (not e!530055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56903 (_ BitVec 32)) Bool)

(assert (=> b!942765 (= res!633537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10496 thiss!1141) (mask!27240 thiss!1141)))))

(declare-fun b!942766 () Bool)

(declare-fun res!633543 () Bool)

(assert (=> b!942766 (=> (not res!633543) (not e!530055))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9045 0))(
  ( (MissingZero!9045 (index!38551 (_ BitVec 32))) (Found!9045 (index!38552 (_ BitVec 32))) (Intermediate!9045 (undefined!9857 Bool) (index!38553 (_ BitVec 32)) (x!80977 (_ BitVec 32))) (Undefined!9045) (MissingVacant!9045 (index!38554 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56903 (_ BitVec 32)) SeekEntryResult!9045)

(assert (=> b!942766 (= res!633543 (not ((_ is Found!9045) (seekEntry!0 key!756 (_keys!10496 thiss!1141) (mask!27240 thiss!1141)))))))

(declare-fun e!530059 () Bool)

(declare-fun array_inv!21338 (array!56903) Bool)

(declare-fun array_inv!21339 (array!56901) Bool)

(assert (=> b!942767 (= e!530056 (and tp!62437 tp_is_empty!20485 (array_inv!21338 (_keys!10496 thiss!1141)) (array_inv!21339 (_values!5650 thiss!1141)) e!530059))))

(declare-fun b!942768 () Bool)

(declare-fun res!633538 () Bool)

(assert (=> b!942768 (=> (not res!633538) (not e!530055))))

(assert (=> b!942768 (= res!633538 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942769 () Bool)

(assert (=> b!942769 (= e!530060 tp_is_empty!20485)))

(declare-fun b!942770 () Bool)

(declare-fun res!633542 () Bool)

(assert (=> b!942770 (=> (not res!633542) (not e!530055))))

(assert (=> b!942770 (= res!633542 (and (= (size!27844 (_values!5650 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27240 thiss!1141))) (= (size!27845 (_keys!10496 thiss!1141)) (size!27844 (_values!5650 thiss!1141))) (bvsge (mask!27240 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5359 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5359 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942771 () Bool)

(assert (=> b!942771 (= e!530059 (and e!530058 mapRes!32549))))

(declare-fun condMapEmpty!32549 () Bool)

(declare-fun mapDefault!32549 () ValueCell!9761)

(assert (=> b!942771 (= condMapEmpty!32549 (= (arr!27377 (_values!5650 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9761)) mapDefault!32549)))))

(declare-fun b!942772 () Bool)

(declare-fun res!633541 () Bool)

(assert (=> b!942772 (=> (not res!633541) (not e!530055))))

(declare-datatypes ((tuple2!13476 0))(
  ( (tuple2!13477 (_1!6749 (_ BitVec 64)) (_2!6749 V!32279)) )
))
(declare-datatypes ((List!19245 0))(
  ( (Nil!19242) (Cons!19241 (h!20391 tuple2!13476) (t!27551 List!19245)) )
))
(declare-datatypes ((ListLongMap!12163 0))(
  ( (ListLongMap!12164 (toList!6097 List!19245)) )
))
(declare-fun contains!5110 (ListLongMap!12163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3260 (array!56903 array!56901 (_ BitVec 32) (_ BitVec 32) V!32279 V!32279 (_ BitVec 32) Int) ListLongMap!12163)

(assert (=> b!942772 (= res!633541 (contains!5110 (getCurrentListMap!3260 (_keys!10496 thiss!1141) (_values!5650 thiss!1141) (mask!27240 thiss!1141) (extraKeys!5359 thiss!1141) (zeroValue!5463 thiss!1141) (minValue!5463 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5627 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32549 () Bool)

(assert (=> mapIsEmpty!32549 mapRes!32549))

(declare-fun b!942773 () Bool)

(assert (=> b!942773 (= e!530055 false)))

(declare-fun lt!424979 () Bool)

(declare-datatypes ((List!19246 0))(
  ( (Nil!19243) (Cons!19242 (h!20392 (_ BitVec 64)) (t!27552 List!19246)) )
))
(declare-fun arrayNoDuplicates!0 (array!56903 (_ BitVec 32) List!19246) Bool)

(assert (=> b!942773 (= lt!424979 (arrayNoDuplicates!0 (_keys!10496 thiss!1141) #b00000000000000000000000000000000 Nil!19243))))

(declare-fun b!942774 () Bool)

(declare-fun res!633540 () Bool)

(assert (=> b!942774 (=> (not res!633540) (not e!530055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942774 (= res!633540 (validMask!0 (mask!27240 thiss!1141)))))

(assert (= (and start!80260 res!633539) b!942768))

(assert (= (and b!942768 res!633538) b!942766))

(assert (= (and b!942766 res!633543) b!942772))

(assert (= (and b!942772 res!633541) b!942774))

(assert (= (and b!942774 res!633540) b!942770))

(assert (= (and b!942770 res!633542) b!942765))

(assert (= (and b!942765 res!633537) b!942773))

(assert (= (and b!942771 condMapEmpty!32549) mapIsEmpty!32549))

(assert (= (and b!942771 (not condMapEmpty!32549)) mapNonEmpty!32549))

(assert (= (and mapNonEmpty!32549 ((_ is ValueCellFull!9761) mapValue!32549)) b!942769))

(assert (= (and b!942771 ((_ is ValueCellFull!9761) mapDefault!32549)) b!942764))

(assert (= b!942767 b!942771))

(assert (= start!80260 b!942767))

(declare-fun m!876581 () Bool)

(assert (=> b!942767 m!876581))

(declare-fun m!876583 () Bool)

(assert (=> b!942767 m!876583))

(declare-fun m!876585 () Bool)

(assert (=> start!80260 m!876585))

(declare-fun m!876587 () Bool)

(assert (=> b!942773 m!876587))

(declare-fun m!876589 () Bool)

(assert (=> b!942766 m!876589))

(declare-fun m!876591 () Bool)

(assert (=> b!942774 m!876591))

(declare-fun m!876593 () Bool)

(assert (=> mapNonEmpty!32549 m!876593))

(declare-fun m!876595 () Bool)

(assert (=> b!942765 m!876595))

(declare-fun m!876597 () Bool)

(assert (=> b!942772 m!876597))

(assert (=> b!942772 m!876597))

(declare-fun m!876599 () Bool)

(assert (=> b!942772 m!876599))

(check-sat (not b!942774) (not b!942767) (not start!80260) (not b_next!17977) (not b!942765) (not b!942773) (not b!942772) (not mapNonEmpty!32549) b_and!29363 (not b!942766) tp_is_empty!20485)
(check-sat b_and!29363 (not b_next!17977))
