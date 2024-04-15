; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80272 () Bool)

(assert start!80272)

(declare-fun b!942972 () Bool)

(declare-fun b_free!17989 () Bool)

(declare-fun b_next!17989 () Bool)

(assert (=> b!942972 (= b_free!17989 (not b_next!17989))))

(declare-fun tp!62473 () Bool)

(declare-fun b_and!29375 () Bool)

(assert (=> b!942972 (= tp!62473 b_and!29375)))

(declare-fun b!942962 () Bool)

(declare-fun res!633667 () Bool)

(declare-fun e!530163 () Bool)

(assert (=> b!942962 (=> (not res!633667) (not e!530163))))

(declare-datatypes ((V!32295 0))(
  ( (V!32296 (val!10299 Int)) )
))
(declare-datatypes ((ValueCell!9767 0))(
  ( (ValueCellFull!9767 (v!12829 V!32295)) (EmptyCell!9767) )
))
(declare-datatypes ((array!56925 0))(
  ( (array!56926 (arr!27389 (Array (_ BitVec 32) ValueCell!9767)) (size!27856 (_ BitVec 32))) )
))
(declare-datatypes ((array!56927 0))(
  ( (array!56928 (arr!27390 (Array (_ BitVec 32) (_ BitVec 64))) (size!27857 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4684 0))(
  ( (LongMapFixedSize!4685 (defaultEntry!5633 Int) (mask!27250 (_ BitVec 32)) (extraKeys!5365 (_ BitVec 32)) (zeroValue!5469 V!32295) (minValue!5469 V!32295) (_size!2397 (_ BitVec 32)) (_keys!10502 array!56927) (_values!5656 array!56925) (_vacant!2397 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4684)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56927 (_ BitVec 32)) Bool)

(assert (=> b!942962 (= res!633667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10502 thiss!1141) (mask!27250 thiss!1141)))))

(declare-fun b!942963 () Bool)

(assert (=> b!942963 (= e!530163 false)))

(declare-fun lt!424997 () Bool)

(declare-datatypes ((List!19253 0))(
  ( (Nil!19250) (Cons!19249 (h!20399 (_ BitVec 64)) (t!27559 List!19253)) )
))
(declare-fun arrayNoDuplicates!0 (array!56927 (_ BitVec 32) List!19253) Bool)

(assert (=> b!942963 (= lt!424997 (arrayNoDuplicates!0 (_keys!10502 thiss!1141) #b00000000000000000000000000000000 Nil!19250))))

(declare-fun b!942964 () Bool)

(declare-fun res!633663 () Bool)

(assert (=> b!942964 (=> (not res!633663) (not e!530163))))

(assert (=> b!942964 (= res!633663 (and (= (size!27856 (_values!5656 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27250 thiss!1141))) (= (size!27857 (_keys!10502 thiss!1141)) (size!27856 (_values!5656 thiss!1141))) (bvsge (mask!27250 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5365 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5365 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942965 () Bool)

(declare-fun e!530167 () Bool)

(declare-fun e!530165 () Bool)

(declare-fun mapRes!32567 () Bool)

(assert (=> b!942965 (= e!530167 (and e!530165 mapRes!32567))))

(declare-fun condMapEmpty!32567 () Bool)

(declare-fun mapDefault!32567 () ValueCell!9767)

(assert (=> b!942965 (= condMapEmpty!32567 (= (arr!27389 (_values!5656 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9767)) mapDefault!32567)))))

(declare-fun b!942966 () Bool)

(declare-fun res!633664 () Bool)

(assert (=> b!942966 (=> (not res!633664) (not e!530163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942966 (= res!633664 (validMask!0 (mask!27250 thiss!1141)))))

(declare-fun b!942967 () Bool)

(declare-fun e!530164 () Bool)

(declare-fun tp_is_empty!20497 () Bool)

(assert (=> b!942967 (= e!530164 tp_is_empty!20497)))

(declare-fun mapIsEmpty!32567 () Bool)

(assert (=> mapIsEmpty!32567 mapRes!32567))

(declare-fun b!942968 () Bool)

(assert (=> b!942968 (= e!530165 tp_is_empty!20497)))

(declare-fun b!942969 () Bool)

(declare-fun res!633666 () Bool)

(assert (=> b!942969 (=> (not res!633666) (not e!530163))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942969 (= res!633666 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942970 () Bool)

(declare-fun res!633665 () Bool)

(assert (=> b!942970 (=> (not res!633665) (not e!530163))))

(declare-datatypes ((tuple2!13486 0))(
  ( (tuple2!13487 (_1!6754 (_ BitVec 64)) (_2!6754 V!32295)) )
))
(declare-datatypes ((List!19254 0))(
  ( (Nil!19251) (Cons!19250 (h!20400 tuple2!13486) (t!27560 List!19254)) )
))
(declare-datatypes ((ListLongMap!12173 0))(
  ( (ListLongMap!12174 (toList!6102 List!19254)) )
))
(declare-fun contains!5115 (ListLongMap!12173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3265 (array!56927 array!56925 (_ BitVec 32) (_ BitVec 32) V!32295 V!32295 (_ BitVec 32) Int) ListLongMap!12173)

(assert (=> b!942970 (= res!633665 (contains!5115 (getCurrentListMap!3265 (_keys!10502 thiss!1141) (_values!5656 thiss!1141) (mask!27250 thiss!1141) (extraKeys!5365 thiss!1141) (zeroValue!5469 thiss!1141) (minValue!5469 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5633 thiss!1141)) key!756))))

(declare-fun b!942971 () Bool)

(declare-fun res!633668 () Bool)

(assert (=> b!942971 (=> (not res!633668) (not e!530163))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9048 0))(
  ( (MissingZero!9048 (index!38563 (_ BitVec 32))) (Found!9048 (index!38564 (_ BitVec 32))) (Intermediate!9048 (undefined!9860 Bool) (index!38565 (_ BitVec 32)) (x!80996 (_ BitVec 32))) (Undefined!9048) (MissingVacant!9048 (index!38566 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56927 (_ BitVec 32)) SeekEntryResult!9048)

(assert (=> b!942971 (= res!633668 (not ((_ is Found!9048) (seekEntry!0 key!756 (_keys!10502 thiss!1141) (mask!27250 thiss!1141)))))))

(declare-fun e!530168 () Bool)

(declare-fun array_inv!21344 (array!56927) Bool)

(declare-fun array_inv!21345 (array!56925) Bool)

(assert (=> b!942972 (= e!530168 (and tp!62473 tp_is_empty!20497 (array_inv!21344 (_keys!10502 thiss!1141)) (array_inv!21345 (_values!5656 thiss!1141)) e!530167))))

(declare-fun mapNonEmpty!32567 () Bool)

(declare-fun tp!62474 () Bool)

(assert (=> mapNonEmpty!32567 (= mapRes!32567 (and tp!62474 e!530164))))

(declare-fun mapRest!32567 () (Array (_ BitVec 32) ValueCell!9767))

(declare-fun mapKey!32567 () (_ BitVec 32))

(declare-fun mapValue!32567 () ValueCell!9767)

(assert (=> mapNonEmpty!32567 (= (arr!27389 (_values!5656 thiss!1141)) (store mapRest!32567 mapKey!32567 mapValue!32567))))

(declare-fun res!633669 () Bool)

(assert (=> start!80272 (=> (not res!633669) (not e!530163))))

(declare-fun valid!1800 (LongMapFixedSize!4684) Bool)

(assert (=> start!80272 (= res!633669 (valid!1800 thiss!1141))))

(assert (=> start!80272 e!530163))

(assert (=> start!80272 e!530168))

(assert (=> start!80272 true))

(assert (= (and start!80272 res!633669) b!942969))

(assert (= (and b!942969 res!633666) b!942971))

(assert (= (and b!942971 res!633668) b!942970))

(assert (= (and b!942970 res!633665) b!942966))

(assert (= (and b!942966 res!633664) b!942964))

(assert (= (and b!942964 res!633663) b!942962))

(assert (= (and b!942962 res!633667) b!942963))

(assert (= (and b!942965 condMapEmpty!32567) mapIsEmpty!32567))

(assert (= (and b!942965 (not condMapEmpty!32567)) mapNonEmpty!32567))

(assert (= (and mapNonEmpty!32567 ((_ is ValueCellFull!9767) mapValue!32567)) b!942967))

(assert (= (and b!942965 ((_ is ValueCellFull!9767) mapDefault!32567)) b!942968))

(assert (= b!942972 b!942965))

(assert (= start!80272 b!942972))

(declare-fun m!876701 () Bool)

(assert (=> mapNonEmpty!32567 m!876701))

(declare-fun m!876703 () Bool)

(assert (=> b!942963 m!876703))

(declare-fun m!876705 () Bool)

(assert (=> start!80272 m!876705))

(declare-fun m!876707 () Bool)

(assert (=> b!942971 m!876707))

(declare-fun m!876709 () Bool)

(assert (=> b!942962 m!876709))

(declare-fun m!876711 () Bool)

(assert (=> b!942970 m!876711))

(assert (=> b!942970 m!876711))

(declare-fun m!876713 () Bool)

(assert (=> b!942970 m!876713))

(declare-fun m!876715 () Bool)

(assert (=> b!942972 m!876715))

(declare-fun m!876717 () Bool)

(assert (=> b!942972 m!876717))

(declare-fun m!876719 () Bool)

(assert (=> b!942966 m!876719))

(check-sat (not start!80272) (not b!942963) (not b!942972) (not b!942970) (not b_next!17989) tp_is_empty!20497 (not mapNonEmpty!32567) (not b!942966) b_and!29375 (not b!942971) (not b!942962))
(check-sat b_and!29375 (not b_next!17989))
