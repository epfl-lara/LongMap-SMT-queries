; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80248 () Bool)

(assert start!80248)

(declare-fun b!942576 () Bool)

(declare-fun b_free!17965 () Bool)

(declare-fun b_next!17965 () Bool)

(assert (=> b!942576 (= b_free!17965 (not b_next!17965))))

(declare-fun tp!62402 () Bool)

(declare-fun b_and!29351 () Bool)

(assert (=> b!942576 (= tp!62402 b_and!29351)))

(declare-fun mapIsEmpty!32531 () Bool)

(declare-fun mapRes!32531 () Bool)

(assert (=> mapIsEmpty!32531 mapRes!32531))

(declare-fun mapNonEmpty!32531 () Bool)

(declare-fun tp!62401 () Bool)

(declare-fun e!529948 () Bool)

(assert (=> mapNonEmpty!32531 (= mapRes!32531 (and tp!62401 e!529948))))

(declare-datatypes ((V!32263 0))(
  ( (V!32264 (val!10287 Int)) )
))
(declare-datatypes ((ValueCell!9755 0))(
  ( (ValueCellFull!9755 (v!12817 V!32263)) (EmptyCell!9755) )
))
(declare-fun mapRest!32531 () (Array (_ BitVec 32) ValueCell!9755))

(declare-fun mapKey!32531 () (_ BitVec 32))

(declare-fun mapValue!32531 () ValueCell!9755)

(declare-datatypes ((array!56877 0))(
  ( (array!56878 (arr!27365 (Array (_ BitVec 32) ValueCell!9755)) (size!27832 (_ BitVec 32))) )
))
(declare-datatypes ((array!56879 0))(
  ( (array!56880 (arr!27366 (Array (_ BitVec 32) (_ BitVec 64))) (size!27833 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4660 0))(
  ( (LongMapFixedSize!4661 (defaultEntry!5621 Int) (mask!27230 (_ BitVec 32)) (extraKeys!5353 (_ BitVec 32)) (zeroValue!5457 V!32263) (minValue!5457 V!32263) (_size!2385 (_ BitVec 32)) (_keys!10490 array!56879) (_values!5644 array!56877) (_vacant!2385 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4660)

(assert (=> mapNonEmpty!32531 (= (arr!27365 (_values!5644 thiss!1141)) (store mapRest!32531 mapKey!32531 mapValue!32531))))

(declare-fun b!942566 () Bool)

(declare-fun e!529952 () Bool)

(assert (=> b!942566 (= e!529952 false)))

(declare-fun lt!424961 () Bool)

(declare-datatypes ((List!19236 0))(
  ( (Nil!19233) (Cons!19232 (h!20382 (_ BitVec 64)) (t!27542 List!19236)) )
))
(declare-fun arrayNoDuplicates!0 (array!56879 (_ BitVec 32) List!19236) Bool)

(assert (=> b!942566 (= lt!424961 (arrayNoDuplicates!0 (_keys!10490 thiss!1141) #b00000000000000000000000000000000 Nil!19233))))

(declare-fun b!942568 () Bool)

(declare-fun res!633416 () Bool)

(assert (=> b!942568 (=> (not res!633416) (not e!529952))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13466 0))(
  ( (tuple2!13467 (_1!6744 (_ BitVec 64)) (_2!6744 V!32263)) )
))
(declare-datatypes ((List!19237 0))(
  ( (Nil!19234) (Cons!19233 (h!20383 tuple2!13466) (t!27543 List!19237)) )
))
(declare-datatypes ((ListLongMap!12153 0))(
  ( (ListLongMap!12154 (toList!6092 List!19237)) )
))
(declare-fun contains!5105 (ListLongMap!12153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3255 (array!56879 array!56877 (_ BitVec 32) (_ BitVec 32) V!32263 V!32263 (_ BitVec 32) Int) ListLongMap!12153)

(assert (=> b!942568 (= res!633416 (contains!5105 (getCurrentListMap!3255 (_keys!10490 thiss!1141) (_values!5644 thiss!1141) (mask!27230 thiss!1141) (extraKeys!5353 thiss!1141) (zeroValue!5457 thiss!1141) (minValue!5457 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5621 thiss!1141)) key!756))))

(declare-fun b!942569 () Bool)

(declare-fun tp_is_empty!20473 () Bool)

(assert (=> b!942569 (= e!529948 tp_is_empty!20473)))

(declare-fun b!942570 () Bool)

(declare-fun res!633415 () Bool)

(assert (=> b!942570 (=> (not res!633415) (not e!529952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56879 (_ BitVec 32)) Bool)

(assert (=> b!942570 (= res!633415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10490 thiss!1141) (mask!27230 thiss!1141)))))

(declare-fun b!942571 () Bool)

(declare-fun res!633417 () Bool)

(assert (=> b!942571 (=> (not res!633417) (not e!529952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942571 (= res!633417 (validMask!0 (mask!27230 thiss!1141)))))

(declare-fun b!942572 () Bool)

(declare-fun res!633414 () Bool)

(assert (=> b!942572 (=> (not res!633414) (not e!529952))))

(assert (=> b!942572 (= res!633414 (and (= (size!27832 (_values!5644 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27230 thiss!1141))) (= (size!27833 (_keys!10490 thiss!1141)) (size!27832 (_values!5644 thiss!1141))) (bvsge (mask!27230 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5353 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5353 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942573 () Bool)

(declare-fun e!529949 () Bool)

(assert (=> b!942573 (= e!529949 tp_is_empty!20473)))

(declare-fun b!942574 () Bool)

(declare-fun res!633413 () Bool)

(assert (=> b!942574 (=> (not res!633413) (not e!529952))))

(assert (=> b!942574 (= res!633413 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942575 () Bool)

(declare-fun e!529947 () Bool)

(assert (=> b!942575 (= e!529947 (and e!529949 mapRes!32531))))

(declare-fun condMapEmpty!32531 () Bool)

(declare-fun mapDefault!32531 () ValueCell!9755)

(assert (=> b!942575 (= condMapEmpty!32531 (= (arr!27365 (_values!5644 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9755)) mapDefault!32531)))))

(declare-fun e!529950 () Bool)

(declare-fun array_inv!21330 (array!56879) Bool)

(declare-fun array_inv!21331 (array!56877) Bool)

(assert (=> b!942576 (= e!529950 (and tp!62402 tp_is_empty!20473 (array_inv!21330 (_keys!10490 thiss!1141)) (array_inv!21331 (_values!5644 thiss!1141)) e!529947))))

(declare-fun res!633412 () Bool)

(assert (=> start!80248 (=> (not res!633412) (not e!529952))))

(declare-fun valid!1792 (LongMapFixedSize!4660) Bool)

(assert (=> start!80248 (= res!633412 (valid!1792 thiss!1141))))

(assert (=> start!80248 e!529952))

(assert (=> start!80248 e!529950))

(assert (=> start!80248 true))

(declare-fun b!942567 () Bool)

(declare-fun res!633411 () Bool)

(assert (=> b!942567 (=> (not res!633411) (not e!529952))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9040 0))(
  ( (MissingZero!9040 (index!38531 (_ BitVec 32))) (Found!9040 (index!38532 (_ BitVec 32))) (Intermediate!9040 (undefined!9852 Bool) (index!38533 (_ BitVec 32)) (x!80956 (_ BitVec 32))) (Undefined!9040) (MissingVacant!9040 (index!38534 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56879 (_ BitVec 32)) SeekEntryResult!9040)

(assert (=> b!942567 (= res!633411 (not ((_ is Found!9040) (seekEntry!0 key!756 (_keys!10490 thiss!1141) (mask!27230 thiss!1141)))))))

(assert (= (and start!80248 res!633412) b!942574))

(assert (= (and b!942574 res!633413) b!942567))

(assert (= (and b!942567 res!633411) b!942568))

(assert (= (and b!942568 res!633416) b!942571))

(assert (= (and b!942571 res!633417) b!942572))

(assert (= (and b!942572 res!633414) b!942570))

(assert (= (and b!942570 res!633415) b!942566))

(assert (= (and b!942575 condMapEmpty!32531) mapIsEmpty!32531))

(assert (= (and b!942575 (not condMapEmpty!32531)) mapNonEmpty!32531))

(assert (= (and mapNonEmpty!32531 ((_ is ValueCellFull!9755) mapValue!32531)) b!942569))

(assert (= (and b!942575 ((_ is ValueCellFull!9755) mapDefault!32531)) b!942573))

(assert (= b!942576 b!942575))

(assert (= start!80248 b!942576))

(declare-fun m!876461 () Bool)

(assert (=> b!942568 m!876461))

(assert (=> b!942568 m!876461))

(declare-fun m!876463 () Bool)

(assert (=> b!942568 m!876463))

(declare-fun m!876465 () Bool)

(assert (=> b!942576 m!876465))

(declare-fun m!876467 () Bool)

(assert (=> b!942576 m!876467))

(declare-fun m!876469 () Bool)

(assert (=> mapNonEmpty!32531 m!876469))

(declare-fun m!876471 () Bool)

(assert (=> start!80248 m!876471))

(declare-fun m!876473 () Bool)

(assert (=> b!942570 m!876473))

(declare-fun m!876475 () Bool)

(assert (=> b!942567 m!876475))

(declare-fun m!876477 () Bool)

(assert (=> b!942571 m!876477))

(declare-fun m!876479 () Bool)

(assert (=> b!942566 m!876479))

(check-sat (not b!942570) tp_is_empty!20473 (not mapNonEmpty!32531) (not b!942571) (not b!942568) b_and!29351 (not b!942567) (not start!80248) (not b_next!17965) (not b!942576) (not b!942566))
(check-sat b_and!29351 (not b_next!17965))
