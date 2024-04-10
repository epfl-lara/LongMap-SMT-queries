; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16620 () Bool)

(assert start!16620)

(declare-fun b!165902 () Bool)

(declare-fun b_free!3925 () Bool)

(declare-fun b_next!3925 () Bool)

(assert (=> b!165902 (= b_free!3925 (not b_next!3925))))

(declare-fun tp!14375 () Bool)

(declare-fun b_and!10339 () Bool)

(assert (=> b!165902 (= tp!14375 b_and!10339)))

(declare-fun b!165899 () Bool)

(declare-fun res!78785 () Bool)

(declare-fun e!108820 () Bool)

(assert (=> b!165899 (=> (not res!78785) (not e!108820))))

(declare-datatypes ((V!4617 0))(
  ( (V!4618 (val!1908 Int)) )
))
(declare-datatypes ((ValueCell!1520 0))(
  ( (ValueCellFull!1520 (v!3773 V!4617)) (EmptyCell!1520) )
))
(declare-datatypes ((array!6551 0))(
  ( (array!6552 (arr!3111 (Array (_ BitVec 32) (_ BitVec 64))) (size!3399 (_ BitVec 32))) )
))
(declare-datatypes ((array!6553 0))(
  ( (array!6554 (arr!3112 (Array (_ BitVec 32) ValueCell!1520)) (size!3400 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1948 0))(
  ( (LongMapFixedSize!1949 (defaultEntry!3416 Int) (mask!8137 (_ BitVec 32)) (extraKeys!3157 (_ BitVec 32)) (zeroValue!3259 V!4617) (minValue!3259 V!4617) (_size!1023 (_ BitVec 32)) (_keys!5241 array!6551) (_values!3399 array!6553) (_vacant!1023 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1948)

(assert (=> b!165899 (= res!78785 (and (= (size!3400 (_values!3399 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8137 thiss!1248))) (= (size!3399 (_keys!5241 thiss!1248)) (size!3400 (_values!3399 thiss!1248))) (bvsge (mask!8137 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3157 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3157 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165900 () Bool)

(declare-fun res!78788 () Bool)

(assert (=> b!165900 (=> (not res!78788) (not e!108820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6551 (_ BitVec 32)) Bool)

(assert (=> b!165900 (= res!78788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5241 thiss!1248) (mask!8137 thiss!1248)))))

(declare-fun b!165901 () Bool)

(declare-fun res!78784 () Bool)

(assert (=> b!165901 (=> (not res!78784) (not e!108820))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3088 0))(
  ( (tuple2!3089 (_1!1555 (_ BitVec 64)) (_2!1555 V!4617)) )
))
(declare-datatypes ((List!2073 0))(
  ( (Nil!2070) (Cons!2069 (h!2686 tuple2!3088) (t!6875 List!2073)) )
))
(declare-datatypes ((ListLongMap!2043 0))(
  ( (ListLongMap!2044 (toList!1037 List!2073)) )
))
(declare-fun contains!1079 (ListLongMap!2043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!695 (array!6551 array!6553 (_ BitVec 32) (_ BitVec 32) V!4617 V!4617 (_ BitVec 32) Int) ListLongMap!2043)

(assert (=> b!165901 (= res!78784 (not (contains!1079 (getCurrentListMap!695 (_keys!5241 thiss!1248) (_values!3399 thiss!1248) (mask!8137 thiss!1248) (extraKeys!3157 thiss!1248) (zeroValue!3259 thiss!1248) (minValue!3259 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3416 thiss!1248)) key!828)))))

(declare-fun e!108818 () Bool)

(declare-fun e!108821 () Bool)

(declare-fun tp_is_empty!3727 () Bool)

(declare-fun array_inv!1997 (array!6551) Bool)

(declare-fun array_inv!1998 (array!6553) Bool)

(assert (=> b!165902 (= e!108818 (and tp!14375 tp_is_empty!3727 (array_inv!1997 (_keys!5241 thiss!1248)) (array_inv!1998 (_values!3399 thiss!1248)) e!108821))))

(declare-fun b!165903 () Bool)

(declare-fun res!78783 () Bool)

(assert (=> b!165903 (=> (not res!78783) (not e!108820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165903 (= res!78783 (validMask!0 (mask!8137 thiss!1248)))))

(declare-fun b!165905 () Bool)

(declare-fun e!108819 () Bool)

(assert (=> b!165905 (= e!108819 tp_is_empty!3727)))

(declare-fun b!165906 () Bool)

(declare-fun e!108816 () Bool)

(assert (=> b!165906 (= e!108816 e!108820)))

(declare-fun res!78786 () Bool)

(assert (=> b!165906 (=> (not res!78786) (not e!108820))))

(declare-datatypes ((SeekEntryResult!445 0))(
  ( (MissingZero!445 (index!3948 (_ BitVec 32))) (Found!445 (index!3949 (_ BitVec 32))) (Intermediate!445 (undefined!1257 Bool) (index!3950 (_ BitVec 32)) (x!18385 (_ BitVec 32))) (Undefined!445) (MissingVacant!445 (index!3951 (_ BitVec 32))) )
))
(declare-fun lt!83154 () SeekEntryResult!445)

(assert (=> b!165906 (= res!78786 (and (not (is-Undefined!445 lt!83154)) (not (is-MissingVacant!445 lt!83154)) (not (is-MissingZero!445 lt!83154)) (is-Found!445 lt!83154)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6551 (_ BitVec 32)) SeekEntryResult!445)

(assert (=> b!165906 (= lt!83154 (seekEntryOrOpen!0 key!828 (_keys!5241 thiss!1248) (mask!8137 thiss!1248)))))

(declare-fun b!165904 () Bool)

(declare-fun e!108815 () Bool)

(assert (=> b!165904 (= e!108815 tp_is_empty!3727)))

(declare-fun res!78787 () Bool)

(assert (=> start!16620 (=> (not res!78787) (not e!108816))))

(declare-fun valid!860 (LongMapFixedSize!1948) Bool)

(assert (=> start!16620 (= res!78787 (valid!860 thiss!1248))))

(assert (=> start!16620 e!108816))

(assert (=> start!16620 e!108818))

(assert (=> start!16620 true))

(declare-fun b!165907 () Bool)

(declare-fun mapRes!6309 () Bool)

(assert (=> b!165907 (= e!108821 (and e!108819 mapRes!6309))))

(declare-fun condMapEmpty!6309 () Bool)

(declare-fun mapDefault!6309 () ValueCell!1520)

