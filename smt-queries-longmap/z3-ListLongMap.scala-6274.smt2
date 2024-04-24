; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80434 () Bool)

(assert start!80434)

(declare-fun b!943717 () Bool)

(declare-fun b_free!17965 () Bool)

(declare-fun b_next!17965 () Bool)

(assert (=> b!943717 (= b_free!17965 (not b_next!17965))))

(declare-fun tp!62401 () Bool)

(declare-fun b_and!29387 () Bool)

(assert (=> b!943717 (= tp!62401 b_and!29387)))

(declare-fun b!943708 () Bool)

(declare-fun e!530679 () Bool)

(declare-fun tp_is_empty!20473 () Bool)

(assert (=> b!943708 (= e!530679 tp_is_empty!20473)))

(declare-fun b!943709 () Bool)

(declare-fun res!633871 () Bool)

(declare-fun e!530678 () Bool)

(assert (=> b!943709 (=> (not res!633871) (not e!530678))))

(declare-datatypes ((V!32263 0))(
  ( (V!32264 (val!10287 Int)) )
))
(declare-datatypes ((ValueCell!9755 0))(
  ( (ValueCellFull!9755 (v!12815 V!32263)) (EmptyCell!9755) )
))
(declare-datatypes ((array!56963 0))(
  ( (array!56964 (arr!27403 (Array (_ BitVec 32) ValueCell!9755)) (size!27869 (_ BitVec 32))) )
))
(declare-datatypes ((array!56965 0))(
  ( (array!56966 (arr!27404 (Array (_ BitVec 32) (_ BitVec 64))) (size!27870 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4660 0))(
  ( (LongMapFixedSize!4661 (defaultEntry!5621 Int) (mask!27280 (_ BitVec 32)) (extraKeys!5353 (_ BitVec 32)) (zeroValue!5457 V!32263) (minValue!5457 V!32263) (_size!2385 (_ BitVec 32)) (_keys!10523 array!56965) (_values!5644 array!56963) (_vacant!2385 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4660)

(assert (=> b!943709 (= res!633871 (and (= (size!27869 (_values!5644 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27280 thiss!1141))) (= (size!27870 (_keys!10523 thiss!1141)) (size!27869 (_values!5644 thiss!1141))) (bvsge (mask!27280 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5353 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5353 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943710 () Bool)

(declare-fun res!633866 () Bool)

(assert (=> b!943710 (=> (not res!633866) (not e!530678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943710 (= res!633866 (validMask!0 (mask!27280 thiss!1141)))))

(declare-fun mapIsEmpty!32531 () Bool)

(declare-fun mapRes!32531 () Bool)

(assert (=> mapIsEmpty!32531 mapRes!32531))

(declare-fun b!943711 () Bool)

(declare-fun res!633865 () Bool)

(assert (=> b!943711 (=> (not res!633865) (not e!530678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56965 (_ BitVec 32)) Bool)

(assert (=> b!943711 (= res!633865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10523 thiss!1141) (mask!27280 thiss!1141)))))

(declare-fun b!943712 () Bool)

(declare-fun e!530677 () Bool)

(assert (=> b!943712 (= e!530677 tp_is_empty!20473)))

(declare-fun res!633868 () Bool)

(assert (=> start!80434 (=> (not res!633868) (not e!530678))))

(declare-fun valid!1789 (LongMapFixedSize!4660) Bool)

(assert (=> start!80434 (= res!633868 (valid!1789 thiss!1141))))

(assert (=> start!80434 e!530678))

(declare-fun e!530680 () Bool)

(assert (=> start!80434 e!530680))

(assert (=> start!80434 true))

(declare-fun b!943713 () Bool)

(declare-fun res!633869 () Bool)

(assert (=> b!943713 (=> (not res!633869) (not e!530678))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8997 0))(
  ( (MissingZero!8997 (index!38359 (_ BitVec 32))) (Found!8997 (index!38360 (_ BitVec 32))) (Intermediate!8997 (undefined!9809 Bool) (index!38361 (_ BitVec 32)) (x!80932 (_ BitVec 32))) (Undefined!8997) (MissingVacant!8997 (index!38362 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56965 (_ BitVec 32)) SeekEntryResult!8997)

(assert (=> b!943713 (= res!633869 (not ((_ is Found!8997) (seekEntry!0 key!756 (_keys!10523 thiss!1141) (mask!27280 thiss!1141)))))))

(declare-fun mapNonEmpty!32531 () Bool)

(declare-fun tp!62402 () Bool)

(assert (=> mapNonEmpty!32531 (= mapRes!32531 (and tp!62402 e!530679))))

(declare-fun mapValue!32531 () ValueCell!9755)

(declare-fun mapKey!32531 () (_ BitVec 32))

(declare-fun mapRest!32531 () (Array (_ BitVec 32) ValueCell!9755))

(assert (=> mapNonEmpty!32531 (= (arr!27403 (_values!5644 thiss!1141)) (store mapRest!32531 mapKey!32531 mapValue!32531))))

(declare-fun b!943714 () Bool)

(assert (=> b!943714 (= e!530678 false)))

(declare-fun lt!425558 () Bool)

(declare-datatypes ((List!19211 0))(
  ( (Nil!19208) (Cons!19207 (h!20363 (_ BitVec 64)) (t!27518 List!19211)) )
))
(declare-fun arrayNoDuplicates!0 (array!56965 (_ BitVec 32) List!19211) Bool)

(assert (=> b!943714 (= lt!425558 (arrayNoDuplicates!0 (_keys!10523 thiss!1141) #b00000000000000000000000000000000 Nil!19208))))

(declare-fun b!943715 () Bool)

(declare-fun e!530682 () Bool)

(assert (=> b!943715 (= e!530682 (and e!530677 mapRes!32531))))

(declare-fun condMapEmpty!32531 () Bool)

(declare-fun mapDefault!32531 () ValueCell!9755)

(assert (=> b!943715 (= condMapEmpty!32531 (= (arr!27403 (_values!5644 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9755)) mapDefault!32531)))))

(declare-fun b!943716 () Bool)

(declare-fun res!633867 () Bool)

(assert (=> b!943716 (=> (not res!633867) (not e!530678))))

(declare-datatypes ((tuple2!13398 0))(
  ( (tuple2!13399 (_1!6710 (_ BitVec 64)) (_2!6710 V!32263)) )
))
(declare-datatypes ((List!19212 0))(
  ( (Nil!19209) (Cons!19208 (h!20364 tuple2!13398) (t!27519 List!19212)) )
))
(declare-datatypes ((ListLongMap!12097 0))(
  ( (ListLongMap!12098 (toList!6064 List!19212)) )
))
(declare-fun contains!5145 (ListLongMap!12097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3298 (array!56965 array!56963 (_ BitVec 32) (_ BitVec 32) V!32263 V!32263 (_ BitVec 32) Int) ListLongMap!12097)

(assert (=> b!943716 (= res!633867 (contains!5145 (getCurrentListMap!3298 (_keys!10523 thiss!1141) (_values!5644 thiss!1141) (mask!27280 thiss!1141) (extraKeys!5353 thiss!1141) (zeroValue!5457 thiss!1141) (minValue!5457 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5621 thiss!1141)) key!756))))

(declare-fun array_inv!21382 (array!56965) Bool)

(declare-fun array_inv!21383 (array!56963) Bool)

(assert (=> b!943717 (= e!530680 (and tp!62401 tp_is_empty!20473 (array_inv!21382 (_keys!10523 thiss!1141)) (array_inv!21383 (_values!5644 thiss!1141)) e!530682))))

(declare-fun b!943718 () Bool)

(declare-fun res!633870 () Bool)

(assert (=> b!943718 (=> (not res!633870) (not e!530678))))

(assert (=> b!943718 (= res!633870 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80434 res!633868) b!943718))

(assert (= (and b!943718 res!633870) b!943713))

(assert (= (and b!943713 res!633869) b!943716))

(assert (= (and b!943716 res!633867) b!943710))

(assert (= (and b!943710 res!633866) b!943709))

(assert (= (and b!943709 res!633871) b!943711))

(assert (= (and b!943711 res!633865) b!943714))

(assert (= (and b!943715 condMapEmpty!32531) mapIsEmpty!32531))

(assert (= (and b!943715 (not condMapEmpty!32531)) mapNonEmpty!32531))

(assert (= (and mapNonEmpty!32531 ((_ is ValueCellFull!9755) mapValue!32531)) b!943708))

(assert (= (and b!943715 ((_ is ValueCellFull!9755) mapDefault!32531)) b!943712))

(assert (= b!943717 b!943715))

(assert (= start!80434 b!943717))

(declare-fun m!878513 () Bool)

(assert (=> mapNonEmpty!32531 m!878513))

(declare-fun m!878515 () Bool)

(assert (=> start!80434 m!878515))

(declare-fun m!878517 () Bool)

(assert (=> b!943711 m!878517))

(declare-fun m!878519 () Bool)

(assert (=> b!943714 m!878519))

(declare-fun m!878521 () Bool)

(assert (=> b!943713 m!878521))

(declare-fun m!878523 () Bool)

(assert (=> b!943717 m!878523))

(declare-fun m!878525 () Bool)

(assert (=> b!943717 m!878525))

(declare-fun m!878527 () Bool)

(assert (=> b!943710 m!878527))

(declare-fun m!878529 () Bool)

(assert (=> b!943716 m!878529))

(assert (=> b!943716 m!878529))

(declare-fun m!878531 () Bool)

(assert (=> b!943716 m!878531))

(check-sat (not start!80434) (not b!943711) (not b!943713) (not mapNonEmpty!32531) (not b_next!17965) b_and!29387 (not b!943717) tp_is_empty!20473 (not b!943714) (not b!943716) (not b!943710))
(check-sat b_and!29387 (not b_next!17965))
