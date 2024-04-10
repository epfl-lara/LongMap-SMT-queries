; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15996 () Bool)

(assert start!15996)

(declare-fun b!158846 () Bool)

(declare-fun b_free!3497 () Bool)

(declare-fun b_next!3497 () Bool)

(assert (=> b!158846 (= b_free!3497 (not b_next!3497))))

(declare-fun tp!13052 () Bool)

(declare-fun b_and!9911 () Bool)

(assert (=> b!158846 (= tp!13052 b_and!9911)))

(declare-fun b!158840 () Bool)

(declare-fun res!75000 () Bool)

(declare-fun e!104014 () Bool)

(assert (=> b!158840 (=> (not res!75000) (not e!104014))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4045 0))(
  ( (V!4046 (val!1694 Int)) )
))
(declare-datatypes ((ValueCell!1306 0))(
  ( (ValueCellFull!1306 (v!3559 V!4045)) (EmptyCell!1306) )
))
(declare-datatypes ((array!5671 0))(
  ( (array!5672 (arr!2683 (Array (_ BitVec 32) (_ BitVec 64))) (size!2967 (_ BitVec 32))) )
))
(declare-datatypes ((array!5673 0))(
  ( (array!5674 (arr!2684 (Array (_ BitVec 32) ValueCell!1306)) (size!2968 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1520 0))(
  ( (LongMapFixedSize!1521 (defaultEntry!3202 Int) (mask!7733 (_ BitVec 32)) (extraKeys!2943 (_ BitVec 32)) (zeroValue!3045 V!4045) (minValue!3045 V!4045) (_size!809 (_ BitVec 32)) (_keys!4997 array!5671) (_values!3185 array!5673) (_vacant!809 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1520)

(declare-datatypes ((SeekEntryResult!301 0))(
  ( (MissingZero!301 (index!3372 (_ BitVec 32))) (Found!301 (index!3373 (_ BitVec 32))) (Intermediate!301 (undefined!1113 Bool) (index!3374 (_ BitVec 32)) (x!17533 (_ BitVec 32))) (Undefined!301) (MissingVacant!301 (index!3375 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5671 (_ BitVec 32)) SeekEntryResult!301)

(assert (=> b!158840 (= res!75000 (is-Undefined!301 (seekEntryOrOpen!0 key!828 (_keys!4997 thiss!1248) (mask!7733 thiss!1248))))))

(declare-fun b!158841 () Bool)

(declare-fun res!74999 () Bool)

(assert (=> b!158841 (=> (not res!74999) (not e!104014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158841 (= res!74999 (validMask!0 (mask!7733 thiss!1248)))))

(declare-fun mapNonEmpty!5627 () Bool)

(declare-fun mapRes!5627 () Bool)

(declare-fun tp!13051 () Bool)

(declare-fun e!104016 () Bool)

(assert (=> mapNonEmpty!5627 (= mapRes!5627 (and tp!13051 e!104016))))

(declare-fun mapKey!5627 () (_ BitVec 32))

(declare-fun mapValue!5627 () ValueCell!1306)

(declare-fun mapRest!5627 () (Array (_ BitVec 32) ValueCell!1306))

(assert (=> mapNonEmpty!5627 (= (arr!2684 (_values!3185 thiss!1248)) (store mapRest!5627 mapKey!5627 mapValue!5627))))

(declare-fun mapIsEmpty!5627 () Bool)

(assert (=> mapIsEmpty!5627 mapRes!5627))

(declare-fun b!158843 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5671 (_ BitVec 32)) Bool)

(assert (=> b!158843 (= e!104014 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4997 thiss!1248) (mask!7733 thiss!1248))))))

(declare-fun b!158844 () Bool)

(declare-fun res!75002 () Bool)

(assert (=> b!158844 (=> (not res!75002) (not e!104014))))

(assert (=> b!158844 (= res!75002 (and (= (size!2968 (_values!3185 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7733 thiss!1248))) (= (size!2967 (_keys!4997 thiss!1248)) (size!2968 (_values!3185 thiss!1248))) (bvsge (mask!7733 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2943 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2943 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158845 () Bool)

(declare-fun res!74998 () Bool)

(assert (=> b!158845 (=> (not res!74998) (not e!104014))))

(assert (=> b!158845 (= res!74998 (not (= key!828 (bvneg key!828))))))

(declare-fun e!104017 () Bool)

(declare-fun tp_is_empty!3299 () Bool)

(declare-fun e!104015 () Bool)

(declare-fun array_inv!1705 (array!5671) Bool)

(declare-fun array_inv!1706 (array!5673) Bool)

(assert (=> b!158846 (= e!104015 (and tp!13052 tp_is_empty!3299 (array_inv!1705 (_keys!4997 thiss!1248)) (array_inv!1706 (_values!3185 thiss!1248)) e!104017))))

(declare-fun b!158847 () Bool)

(declare-fun e!104019 () Bool)

(assert (=> b!158847 (= e!104017 (and e!104019 mapRes!5627))))

(declare-fun condMapEmpty!5627 () Bool)

(declare-fun mapDefault!5627 () ValueCell!1306)

