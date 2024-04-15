; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16522 () Bool)

(assert start!16522)

(declare-fun b!164069 () Bool)

(declare-fun b_free!3823 () Bool)

(declare-fun b_next!3823 () Bool)

(assert (=> b!164069 (= b_free!3823 (not b_next!3823))))

(declare-fun tp!14069 () Bool)

(declare-fun b_and!10211 () Bool)

(assert (=> b!164069 (= tp!14069 b_and!10211)))

(declare-fun res!77623 () Bool)

(declare-fun e!107643 () Bool)

(assert (=> start!16522 (=> (not res!77623) (not e!107643))))

(declare-datatypes ((V!4481 0))(
  ( (V!4482 (val!1857 Int)) )
))
(declare-datatypes ((ValueCell!1469 0))(
  ( (ValueCellFull!1469 (v!3716 V!4481)) (EmptyCell!1469) )
))
(declare-datatypes ((array!6327 0))(
  ( (array!6328 (arr!2998 (Array (_ BitVec 32) (_ BitVec 64))) (size!3287 (_ BitVec 32))) )
))
(declare-datatypes ((array!6329 0))(
  ( (array!6330 (arr!2999 (Array (_ BitVec 32) ValueCell!1469)) (size!3288 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1846 0))(
  ( (LongMapFixedSize!1847 (defaultEntry!3365 Int) (mask!8051 (_ BitVec 32)) (extraKeys!3106 (_ BitVec 32)) (zeroValue!3208 V!4481) (minValue!3208 V!4481) (_size!972 (_ BitVec 32)) (_keys!5189 array!6327) (_values!3348 array!6329) (_vacant!972 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1846)

(declare-fun valid!830 (LongMapFixedSize!1846) Bool)

(assert (=> start!16522 (= res!77623 (valid!830 thiss!1248))))

(assert (=> start!16522 e!107643))

(declare-fun e!107647 () Bool)

(assert (=> start!16522 e!107647))

(assert (=> start!16522 true))

(declare-fun e!107645 () Bool)

(declare-fun tp_is_empty!3625 () Bool)

(declare-fun array_inv!1931 (array!6327) Bool)

(declare-fun array_inv!1932 (array!6329) Bool)

(assert (=> b!164069 (= e!107647 (and tp!14069 tp_is_empty!3625 (array_inv!1931 (_keys!5189 thiss!1248)) (array_inv!1932 (_values!3348 thiss!1248)) e!107645))))

(declare-fun b!164070 () Bool)

(declare-fun res!77618 () Bool)

(declare-fun e!107649 () Bool)

(assert (=> b!164070 (=> (not res!77618) (not e!107649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164070 (= res!77618 (validMask!0 (mask!8051 thiss!1248)))))

(declare-fun mapIsEmpty!6156 () Bool)

(declare-fun mapRes!6156 () Bool)

(assert (=> mapIsEmpty!6156 mapRes!6156))

(declare-fun b!164071 () Bool)

(declare-fun res!77621 () Bool)

(assert (=> b!164071 (=> (not res!77621) (not e!107649))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3004 0))(
  ( (tuple2!3005 (_1!1513 (_ BitVec 64)) (_2!1513 V!4481)) )
))
(declare-datatypes ((List!2004 0))(
  ( (Nil!2001) (Cons!2000 (h!2617 tuple2!3004) (t!6797 List!2004)) )
))
(declare-datatypes ((ListLongMap!1947 0))(
  ( (ListLongMap!1948 (toList!989 List!2004)) )
))
(declare-fun contains!1034 (ListLongMap!1947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!631 (array!6327 array!6329 (_ BitVec 32) (_ BitVec 32) V!4481 V!4481 (_ BitVec 32) Int) ListLongMap!1947)

(assert (=> b!164071 (= res!77621 (contains!1034 (getCurrentListMap!631 (_keys!5189 thiss!1248) (_values!3348 thiss!1248) (mask!8051 thiss!1248) (extraKeys!3106 thiss!1248) (zeroValue!3208 thiss!1248) (minValue!3208 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3365 thiss!1248)) key!828))))

(declare-fun b!164072 () Bool)

(assert (=> b!164072 (= e!107643 e!107649)))

(declare-fun res!77620 () Bool)

(assert (=> b!164072 (=> (not res!77620) (not e!107649))))

(declare-datatypes ((SeekEntryResult!420 0))(
  ( (MissingZero!420 (index!3848 (_ BitVec 32))) (Found!420 (index!3849 (_ BitVec 32))) (Intermediate!420 (undefined!1232 Bool) (index!3850 (_ BitVec 32)) (x!18223 (_ BitVec 32))) (Undefined!420) (MissingVacant!420 (index!3851 (_ BitVec 32))) )
))
(declare-fun lt!82668 () SeekEntryResult!420)

(get-info :version)

(assert (=> b!164072 (= res!77620 (and (not ((_ is Undefined!420) lt!82668)) (not ((_ is MissingVacant!420) lt!82668)) (not ((_ is MissingZero!420) lt!82668)) ((_ is Found!420) lt!82668)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6327 (_ BitVec 32)) SeekEntryResult!420)

(assert (=> b!164072 (= lt!82668 (seekEntryOrOpen!0 key!828 (_keys!5189 thiss!1248) (mask!8051 thiss!1248)))))

(declare-fun b!164073 () Bool)

(declare-fun e!107644 () Bool)

(assert (=> b!164073 (= e!107645 (and e!107644 mapRes!6156))))

(declare-fun condMapEmpty!6156 () Bool)

(declare-fun mapDefault!6156 () ValueCell!1469)

(assert (=> b!164073 (= condMapEmpty!6156 (= (arr!2999 (_values!3348 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1469)) mapDefault!6156)))))

(declare-fun b!164074 () Bool)

(assert (=> b!164074 (= e!107644 tp_is_empty!3625)))

(declare-fun b!164075 () Bool)

(declare-fun res!77622 () Bool)

(assert (=> b!164075 (=> (not res!77622) (not e!107649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6327 (_ BitVec 32)) Bool)

(assert (=> b!164075 (= res!77622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5189 thiss!1248) (mask!8051 thiss!1248)))))

(declare-fun b!164076 () Bool)

(declare-fun res!77617 () Bool)

(assert (=> b!164076 (=> (not res!77617) (not e!107649))))

(assert (=> b!164076 (= res!77617 (and (= (size!3288 (_values!3348 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8051 thiss!1248))) (= (size!3287 (_keys!5189 thiss!1248)) (size!3288 (_values!3348 thiss!1248))) (bvsge (mask!8051 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3106 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3106 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164077 () Bool)

(declare-fun e!107646 () Bool)

(assert (=> b!164077 (= e!107646 tp_is_empty!3625)))

(declare-fun b!164078 () Bool)

(declare-fun res!77619 () Bool)

(assert (=> b!164078 (=> (not res!77619) (not e!107643))))

(assert (=> b!164078 (= res!77619 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164079 () Bool)

(assert (=> b!164079 (= e!107649 false)))

(declare-fun lt!82667 () Bool)

(declare-datatypes ((List!2005 0))(
  ( (Nil!2002) (Cons!2001 (h!2618 (_ BitVec 64)) (t!6798 List!2005)) )
))
(declare-fun arrayNoDuplicates!0 (array!6327 (_ BitVec 32) List!2005) Bool)

(assert (=> b!164079 (= lt!82667 (arrayNoDuplicates!0 (_keys!5189 thiss!1248) #b00000000000000000000000000000000 Nil!2002))))

(declare-fun mapNonEmpty!6156 () Bool)

(declare-fun tp!14070 () Bool)

(assert (=> mapNonEmpty!6156 (= mapRes!6156 (and tp!14070 e!107646))))

(declare-fun mapValue!6156 () ValueCell!1469)

(declare-fun mapKey!6156 () (_ BitVec 32))

(declare-fun mapRest!6156 () (Array (_ BitVec 32) ValueCell!1469))

(assert (=> mapNonEmpty!6156 (= (arr!2999 (_values!3348 thiss!1248)) (store mapRest!6156 mapKey!6156 mapValue!6156))))

(assert (= (and start!16522 res!77623) b!164078))

(assert (= (and b!164078 res!77619) b!164072))

(assert (= (and b!164072 res!77620) b!164071))

(assert (= (and b!164071 res!77621) b!164070))

(assert (= (and b!164070 res!77618) b!164076))

(assert (= (and b!164076 res!77617) b!164075))

(assert (= (and b!164075 res!77622) b!164079))

(assert (= (and b!164073 condMapEmpty!6156) mapIsEmpty!6156))

(assert (= (and b!164073 (not condMapEmpty!6156)) mapNonEmpty!6156))

(assert (= (and mapNonEmpty!6156 ((_ is ValueCellFull!1469) mapValue!6156)) b!164077))

(assert (= (and b!164073 ((_ is ValueCellFull!1469) mapDefault!6156)) b!164074))

(assert (= b!164069 b!164073))

(assert (= start!16522 b!164069))

(declare-fun m!193891 () Bool)

(assert (=> start!16522 m!193891))

(declare-fun m!193893 () Bool)

(assert (=> b!164069 m!193893))

(declare-fun m!193895 () Bool)

(assert (=> b!164069 m!193895))

(declare-fun m!193897 () Bool)

(assert (=> b!164071 m!193897))

(assert (=> b!164071 m!193897))

(declare-fun m!193899 () Bool)

(assert (=> b!164071 m!193899))

(declare-fun m!193901 () Bool)

(assert (=> b!164075 m!193901))

(declare-fun m!193903 () Bool)

(assert (=> b!164072 m!193903))

(declare-fun m!193905 () Bool)

(assert (=> b!164079 m!193905))

(declare-fun m!193907 () Bool)

(assert (=> mapNonEmpty!6156 m!193907))

(declare-fun m!193909 () Bool)

(assert (=> b!164070 m!193909))

(check-sat b_and!10211 (not b!164070) (not b_next!3823) (not b!164072) (not b!164079) tp_is_empty!3625 (not b!164075) (not b!164071) (not start!16522) (not b!164069) (not mapNonEmpty!6156))
(check-sat b_and!10211 (not b_next!3823))
