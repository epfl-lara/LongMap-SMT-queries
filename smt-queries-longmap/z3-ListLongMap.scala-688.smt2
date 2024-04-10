; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16634 () Bool)

(assert start!16634)

(declare-fun b!166136 () Bool)

(declare-fun b_free!3939 () Bool)

(declare-fun b_next!3939 () Bool)

(assert (=> b!166136 (= b_free!3939 (not b_next!3939))))

(declare-fun tp!14417 () Bool)

(declare-fun b_and!10353 () Bool)

(assert (=> b!166136 (= tp!14417 b_and!10353)))

(declare-fun b!166130 () Bool)

(declare-fun res!78935 () Bool)

(declare-fun e!108968 () Bool)

(assert (=> b!166130 (=> (not res!78935) (not e!108968))))

(declare-datatypes ((V!4635 0))(
  ( (V!4636 (val!1915 Int)) )
))
(declare-datatypes ((ValueCell!1527 0))(
  ( (ValueCellFull!1527 (v!3780 V!4635)) (EmptyCell!1527) )
))
(declare-datatypes ((array!6579 0))(
  ( (array!6580 (arr!3125 (Array (_ BitVec 32) (_ BitVec 64))) (size!3413 (_ BitVec 32))) )
))
(declare-datatypes ((array!6581 0))(
  ( (array!6582 (arr!3126 (Array (_ BitVec 32) ValueCell!1527)) (size!3414 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1962 0))(
  ( (LongMapFixedSize!1963 (defaultEntry!3423 Int) (mask!8148 (_ BitVec 32)) (extraKeys!3164 (_ BitVec 32)) (zeroValue!3266 V!4635) (minValue!3266 V!4635) (_size!1030 (_ BitVec 32)) (_keys!5248 array!6579) (_values!3406 array!6581) (_vacant!1030 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1962)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3096 0))(
  ( (tuple2!3097 (_1!1559 (_ BitVec 64)) (_2!1559 V!4635)) )
))
(declare-datatypes ((List!2081 0))(
  ( (Nil!2078) (Cons!2077 (h!2694 tuple2!3096) (t!6883 List!2081)) )
))
(declare-datatypes ((ListLongMap!2051 0))(
  ( (ListLongMap!2052 (toList!1041 List!2081)) )
))
(declare-fun contains!1083 (ListLongMap!2051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!699 (array!6579 array!6581 (_ BitVec 32) (_ BitVec 32) V!4635 V!4635 (_ BitVec 32) Int) ListLongMap!2051)

(assert (=> b!166130 (= res!78935 (not (contains!1083 (getCurrentListMap!699 (_keys!5248 thiss!1248) (_values!3406 thiss!1248) (mask!8148 thiss!1248) (extraKeys!3164 thiss!1248) (zeroValue!3266 thiss!1248) (minValue!3266 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3423 thiss!1248)) key!828)))))

(declare-fun b!166131 () Bool)

(declare-fun e!108962 () Bool)

(declare-fun e!108965 () Bool)

(declare-fun mapRes!6330 () Bool)

(assert (=> b!166131 (= e!108962 (and e!108965 mapRes!6330))))

(declare-fun condMapEmpty!6330 () Bool)

(declare-fun mapDefault!6330 () ValueCell!1527)

(assert (=> b!166131 (= condMapEmpty!6330 (= (arr!3126 (_values!3406 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1527)) mapDefault!6330)))))

(declare-fun b!166132 () Bool)

(declare-fun e!108966 () Bool)

(declare-fun tp_is_empty!3741 () Bool)

(assert (=> b!166132 (= e!108966 tp_is_empty!3741)))

(declare-fun mapNonEmpty!6330 () Bool)

(declare-fun tp!14418 () Bool)

(assert (=> mapNonEmpty!6330 (= mapRes!6330 (and tp!14418 e!108966))))

(declare-fun mapRest!6330 () (Array (_ BitVec 32) ValueCell!1527))

(declare-fun mapKey!6330 () (_ BitVec 32))

(declare-fun mapValue!6330 () ValueCell!1527)

(assert (=> mapNonEmpty!6330 (= (arr!3126 (_values!3406 thiss!1248)) (store mapRest!6330 mapKey!6330 mapValue!6330))))

(declare-fun b!166133 () Bool)

(declare-fun res!78936 () Bool)

(assert (=> b!166133 (=> (not res!78936) (not e!108968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6579 (_ BitVec 32)) Bool)

(assert (=> b!166133 (= res!78936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5248 thiss!1248) (mask!8148 thiss!1248)))))

(declare-fun b!166134 () Bool)

(assert (=> b!166134 (= e!108965 tp_is_empty!3741)))

(declare-fun res!78932 () Bool)

(declare-fun e!108963 () Bool)

(assert (=> start!16634 (=> (not res!78932) (not e!108963))))

(declare-fun valid!864 (LongMapFixedSize!1962) Bool)

(assert (=> start!16634 (= res!78932 (valid!864 thiss!1248))))

(assert (=> start!16634 e!108963))

(declare-fun e!108967 () Bool)

(assert (=> start!16634 e!108967))

(assert (=> start!16634 true))

(declare-fun b!166135 () Bool)

(assert (=> b!166135 (= e!108963 e!108968)))

(declare-fun res!78934 () Bool)

(assert (=> b!166135 (=> (not res!78934) (not e!108968))))

(declare-datatypes ((SeekEntryResult!450 0))(
  ( (MissingZero!450 (index!3968 (_ BitVec 32))) (Found!450 (index!3969 (_ BitVec 32))) (Intermediate!450 (undefined!1262 Bool) (index!3970 (_ BitVec 32)) (x!18406 (_ BitVec 32))) (Undefined!450) (MissingVacant!450 (index!3971 (_ BitVec 32))) )
))
(declare-fun lt!83196 () SeekEntryResult!450)

(get-info :version)

(assert (=> b!166135 (= res!78934 (and (not ((_ is Undefined!450) lt!83196)) (not ((_ is MissingVacant!450) lt!83196)) (not ((_ is MissingZero!450) lt!83196)) ((_ is Found!450) lt!83196)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6579 (_ BitVec 32)) SeekEntryResult!450)

(assert (=> b!166135 (= lt!83196 (seekEntryOrOpen!0 key!828 (_keys!5248 thiss!1248) (mask!8148 thiss!1248)))))

(declare-fun array_inv!2005 (array!6579) Bool)

(declare-fun array_inv!2006 (array!6581) Bool)

(assert (=> b!166136 (= e!108967 (and tp!14417 tp_is_empty!3741 (array_inv!2005 (_keys!5248 thiss!1248)) (array_inv!2006 (_values!3406 thiss!1248)) e!108962))))

(declare-fun b!166137 () Bool)

(declare-fun res!78931 () Bool)

(assert (=> b!166137 (=> (not res!78931) (not e!108963))))

(assert (=> b!166137 (= res!78931 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6330 () Bool)

(assert (=> mapIsEmpty!6330 mapRes!6330))

(declare-fun b!166138 () Bool)

(declare-fun res!78933 () Bool)

(assert (=> b!166138 (=> (not res!78933) (not e!108968))))

(assert (=> b!166138 (= res!78933 (and (= (size!3414 (_values!3406 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8148 thiss!1248))) (= (size!3413 (_keys!5248 thiss!1248)) (size!3414 (_values!3406 thiss!1248))) (bvsge (mask!8148 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3164 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3164 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166139 () Bool)

(assert (=> b!166139 (= e!108968 false)))

(declare-fun lt!83197 () Bool)

(declare-datatypes ((List!2082 0))(
  ( (Nil!2079) (Cons!2078 (h!2695 (_ BitVec 64)) (t!6884 List!2082)) )
))
(declare-fun arrayNoDuplicates!0 (array!6579 (_ BitVec 32) List!2082) Bool)

(assert (=> b!166139 (= lt!83197 (arrayNoDuplicates!0 (_keys!5248 thiss!1248) #b00000000000000000000000000000000 Nil!2079))))

(declare-fun b!166140 () Bool)

(declare-fun res!78930 () Bool)

(assert (=> b!166140 (=> (not res!78930) (not e!108968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166140 (= res!78930 (validMask!0 (mask!8148 thiss!1248)))))

(assert (= (and start!16634 res!78932) b!166137))

(assert (= (and b!166137 res!78931) b!166135))

(assert (= (and b!166135 res!78934) b!166130))

(assert (= (and b!166130 res!78935) b!166140))

(assert (= (and b!166140 res!78930) b!166138))

(assert (= (and b!166138 res!78933) b!166133))

(assert (= (and b!166133 res!78936) b!166139))

(assert (= (and b!166131 condMapEmpty!6330) mapIsEmpty!6330))

(assert (= (and b!166131 (not condMapEmpty!6330)) mapNonEmpty!6330))

(assert (= (and mapNonEmpty!6330 ((_ is ValueCellFull!1527) mapValue!6330)) b!166132))

(assert (= (and b!166131 ((_ is ValueCellFull!1527) mapDefault!6330)) b!166134))

(assert (= b!166136 b!166131))

(assert (= start!16634 b!166136))

(declare-fun m!195671 () Bool)

(assert (=> b!166139 m!195671))

(declare-fun m!195673 () Bool)

(assert (=> b!166135 m!195673))

(declare-fun m!195675 () Bool)

(assert (=> b!166133 m!195675))

(declare-fun m!195677 () Bool)

(assert (=> b!166140 m!195677))

(declare-fun m!195679 () Bool)

(assert (=> b!166136 m!195679))

(declare-fun m!195681 () Bool)

(assert (=> b!166136 m!195681))

(declare-fun m!195683 () Bool)

(assert (=> mapNonEmpty!6330 m!195683))

(declare-fun m!195685 () Bool)

(assert (=> start!16634 m!195685))

(declare-fun m!195687 () Bool)

(assert (=> b!166130 m!195687))

(assert (=> b!166130 m!195687))

(declare-fun m!195689 () Bool)

(assert (=> b!166130 m!195689))

(check-sat (not b!166130) (not b!166136) (not b_next!3939) tp_is_empty!3741 (not b!166140) (not b!166139) (not mapNonEmpty!6330) (not b!166133) b_and!10353 (not start!16634) (not b!166135))
(check-sat b_and!10353 (not b_next!3939))
