; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17236 () Bool)

(assert start!17236)

(declare-fun b!172895 () Bool)

(declare-fun b_free!4279 () Bool)

(declare-fun b_next!4279 () Bool)

(assert (=> b!172895 (= b_free!4279 (not b_next!4279))))

(declare-fun tp!15495 () Bool)

(declare-fun b_and!10733 () Bool)

(assert (=> b!172895 (= tp!15495 b_and!10733)))

(declare-fun tp_is_empty!4051 () Bool)

(declare-fun e!114153 () Bool)

(declare-fun e!114157 () Bool)

(declare-datatypes ((V!5049 0))(
  ( (V!5050 (val!2070 Int)) )
))
(declare-datatypes ((ValueCell!1682 0))(
  ( (ValueCellFull!1682 (v!3939 V!5049)) (EmptyCell!1682) )
))
(declare-datatypes ((array!7215 0))(
  ( (array!7216 (arr!3428 (Array (_ BitVec 32) (_ BitVec 64))) (size!3727 (_ BitVec 32))) )
))
(declare-datatypes ((array!7217 0))(
  ( (array!7218 (arr!3429 (Array (_ BitVec 32) ValueCell!1682)) (size!3728 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2272 0))(
  ( (LongMapFixedSize!2273 (defaultEntry!3582 Int) (mask!8440 (_ BitVec 32)) (extraKeys!3321 (_ BitVec 32)) (zeroValue!3423 V!5049) (minValue!3425 V!5049) (_size!1185 (_ BitVec 32)) (_keys!5421 array!7215) (_values!3565 array!7217) (_vacant!1185 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2272)

(declare-fun array_inv!2207 (array!7215) Bool)

(declare-fun array_inv!2208 (array!7217) Bool)

(assert (=> b!172895 (= e!114157 (and tp!15495 tp_is_empty!4051 (array_inv!2207 (_keys!5421 thiss!1248)) (array_inv!2208 (_values!3565 thiss!1248)) e!114153))))

(declare-fun mapIsEmpty!6897 () Bool)

(declare-fun mapRes!6897 () Bool)

(assert (=> mapIsEmpty!6897 mapRes!6897))

(declare-fun b!172896 () Bool)

(declare-fun e!114155 () Bool)

(assert (=> b!172896 (= e!114155 tp_is_empty!4051)))

(declare-fun res!82090 () Bool)

(declare-fun e!114158 () Bool)

(assert (=> start!17236 (=> (not res!82090) (not e!114158))))

(declare-fun valid!978 (LongMapFixedSize!2272) Bool)

(assert (=> start!17236 (= res!82090 (valid!978 thiss!1248))))

(assert (=> start!17236 e!114158))

(assert (=> start!17236 e!114157))

(assert (=> start!17236 true))

(declare-fun b!172897 () Bool)

(assert (=> b!172897 (= e!114153 (and e!114155 mapRes!6897))))

(declare-fun condMapEmpty!6897 () Bool)

(declare-fun mapDefault!6897 () ValueCell!1682)

(assert (=> b!172897 (= condMapEmpty!6897 (= (arr!3429 (_values!3565 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1682)) mapDefault!6897)))))

(declare-fun b!172898 () Bool)

(declare-fun res!82092 () Bool)

(assert (=> b!172898 (=> (not res!82092) (not e!114158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172898 (= res!82092 (validMask!0 (mask!8440 thiss!1248)))))

(declare-fun b!172899 () Bool)

(assert (=> b!172899 (= e!114158 (and (= (size!3728 (_values!3565 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8440 thiss!1248))) (= (size!3727 (_keys!5421 thiss!1248)) (size!3728 (_values!3565 thiss!1248))) (bvsge (mask!8440 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3321 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3321 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3321 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt (bvor (extraKeys!3321 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011)))))

(declare-fun b!172900 () Bool)

(declare-fun e!114154 () Bool)

(assert (=> b!172900 (= e!114154 tp_is_empty!4051)))

(declare-fun mapNonEmpty!6897 () Bool)

(declare-fun tp!15494 () Bool)

(assert (=> mapNonEmpty!6897 (= mapRes!6897 (and tp!15494 e!114154))))

(declare-fun mapKey!6897 () (_ BitVec 32))

(declare-fun mapValue!6897 () ValueCell!1682)

(declare-fun mapRest!6897 () (Array (_ BitVec 32) ValueCell!1682))

(assert (=> mapNonEmpty!6897 (= (arr!3429 (_values!3565 thiss!1248)) (store mapRest!6897 mapKey!6897 mapValue!6897))))

(declare-fun b!172901 () Bool)

(declare-fun res!82091 () Bool)

(assert (=> b!172901 (=> (not res!82091) (not e!114158))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172901 (= res!82091 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!17236 res!82090) b!172901))

(assert (= (and b!172901 res!82091) b!172898))

(assert (= (and b!172898 res!82092) b!172899))

(assert (= (and b!172897 condMapEmpty!6897) mapIsEmpty!6897))

(assert (= (and b!172897 (not condMapEmpty!6897)) mapNonEmpty!6897))

(get-info :version)

(assert (= (and mapNonEmpty!6897 ((_ is ValueCellFull!1682) mapValue!6897)) b!172900))

(assert (= (and b!172897 ((_ is ValueCellFull!1682) mapDefault!6897)) b!172896))

(assert (= b!172895 b!172897))

(assert (= start!17236 b!172895))

(declare-fun m!201605 () Bool)

(assert (=> b!172895 m!201605))

(declare-fun m!201607 () Bool)

(assert (=> b!172895 m!201607))

(declare-fun m!201609 () Bool)

(assert (=> start!17236 m!201609))

(declare-fun m!201611 () Bool)

(assert (=> b!172898 m!201611))

(declare-fun m!201613 () Bool)

(assert (=> mapNonEmpty!6897 m!201613))

(check-sat b_and!10733 tp_is_empty!4051 (not mapNonEmpty!6897) (not b_next!4279) (not b!172898) (not start!17236) (not b!172895))
(check-sat b_and!10733 (not b_next!4279))
