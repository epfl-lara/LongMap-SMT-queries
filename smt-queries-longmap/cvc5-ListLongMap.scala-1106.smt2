; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22828 () Bool)

(assert start!22828)

(declare-fun b!237847 () Bool)

(declare-fun b_free!6385 () Bool)

(declare-fun b_next!6385 () Bool)

(assert (=> b!237847 (= b_free!6385 (not b_next!6385))))

(declare-fun tp!22349 () Bool)

(declare-fun b_and!13345 () Bool)

(assert (=> b!237847 (= tp!22349 b_and!13345)))

(declare-fun b!237840 () Bool)

(declare-fun e!154441 () Bool)

(declare-fun tp_is_empty!6247 () Bool)

(assert (=> b!237840 (= e!154441 tp_is_empty!6247)))

(declare-fun b!237841 () Bool)

(declare-fun res!116548 () Bool)

(declare-fun e!154443 () Bool)

(assert (=> b!237841 (=> (not res!116548) (not e!154443))))

(declare-datatypes ((V!7977 0))(
  ( (V!7978 (val!3168 Int)) )
))
(declare-datatypes ((ValueCell!2780 0))(
  ( (ValueCellFull!2780 (v!5203 V!7977)) (EmptyCell!2780) )
))
(declare-datatypes ((array!11767 0))(
  ( (array!11768 (arr!5588 (Array (_ BitVec 32) ValueCell!2780)) (size!5929 (_ BitVec 32))) )
))
(declare-datatypes ((array!11769 0))(
  ( (array!11770 (arr!5589 (Array (_ BitVec 32) (_ BitVec 64))) (size!5930 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3460 0))(
  ( (LongMapFixedSize!3461 (defaultEntry!4412 Int) (mask!10433 (_ BitVec 32)) (extraKeys!4149 (_ BitVec 32)) (zeroValue!4253 V!7977) (minValue!4253 V!7977) (_size!1779 (_ BitVec 32)) (_keys!6508 array!11769) (_values!4395 array!11767) (_vacant!1779 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3460)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237841 (= res!116548 (validMask!0 (mask!10433 thiss!1504)))))

(declare-fun b!237842 () Bool)

(declare-fun res!116549 () Bool)

(assert (=> b!237842 (=> (not res!116549) (not e!154443))))

(assert (=> b!237842 (= res!116549 (and (= (size!5929 (_values!4395 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10433 thiss!1504))) (= (size!5930 (_keys!6508 thiss!1504)) (size!5929 (_values!4395 thiss!1504))) (bvsge (mask!10433 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4149 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4149 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!237843 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11769 (_ BitVec 32)) Bool)

(assert (=> b!237843 (= e!154443 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6508 thiss!1504) (mask!10433 thiss!1504))))))

(declare-fun mapIsEmpty!10593 () Bool)

(declare-fun mapRes!10593 () Bool)

(assert (=> mapIsEmpty!10593 mapRes!10593))

(declare-fun b!237845 () Bool)

(declare-fun e!154440 () Bool)

(assert (=> b!237845 (= e!154440 e!154443)))

(declare-fun res!116547 () Bool)

(assert (=> b!237845 (=> (not res!116547) (not e!154443))))

(declare-datatypes ((SeekEntryResult!1011 0))(
  ( (MissingZero!1011 (index!6214 (_ BitVec 32))) (Found!1011 (index!6215 (_ BitVec 32))) (Intermediate!1011 (undefined!1823 Bool) (index!6216 (_ BitVec 32)) (x!23989 (_ BitVec 32))) (Undefined!1011) (MissingVacant!1011 (index!6217 (_ BitVec 32))) )
))
(declare-fun lt!120291 () SeekEntryResult!1011)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237845 (= res!116547 (or (= lt!120291 (MissingZero!1011 index!297)) (= lt!120291 (MissingVacant!1011 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11769 (_ BitVec 32)) SeekEntryResult!1011)

(assert (=> b!237845 (= lt!120291 (seekEntryOrOpen!0 key!932 (_keys!6508 thiss!1504) (mask!10433 thiss!1504)))))

(declare-fun b!237846 () Bool)

(declare-fun e!154439 () Bool)

(assert (=> b!237846 (= e!154439 tp_is_empty!6247)))

(declare-fun e!154442 () Bool)

(declare-fun e!154437 () Bool)

(declare-fun array_inv!3691 (array!11769) Bool)

(declare-fun array_inv!3692 (array!11767) Bool)

(assert (=> b!237847 (= e!154442 (and tp!22349 tp_is_empty!6247 (array_inv!3691 (_keys!6508 thiss!1504)) (array_inv!3692 (_values!4395 thiss!1504)) e!154437))))

(declare-fun mapNonEmpty!10593 () Bool)

(declare-fun tp!22350 () Bool)

(assert (=> mapNonEmpty!10593 (= mapRes!10593 (and tp!22350 e!154439))))

(declare-fun mapValue!10593 () ValueCell!2780)

(declare-fun mapRest!10593 () (Array (_ BitVec 32) ValueCell!2780))

(declare-fun mapKey!10593 () (_ BitVec 32))

(assert (=> mapNonEmpty!10593 (= (arr!5588 (_values!4395 thiss!1504)) (store mapRest!10593 mapKey!10593 mapValue!10593))))

(declare-fun b!237844 () Bool)

(declare-fun res!116544 () Bool)

(assert (=> b!237844 (=> (not res!116544) (not e!154440))))

(assert (=> b!237844 (= res!116544 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!116545 () Bool)

(assert (=> start!22828 (=> (not res!116545) (not e!154440))))

(declare-fun valid!1366 (LongMapFixedSize!3460) Bool)

(assert (=> start!22828 (= res!116545 (valid!1366 thiss!1504))))

(assert (=> start!22828 e!154440))

(assert (=> start!22828 e!154442))

(assert (=> start!22828 true))

(declare-fun b!237848 () Bool)

(declare-fun res!116546 () Bool)

(assert (=> b!237848 (=> (not res!116546) (not e!154443))))

(declare-datatypes ((tuple2!4670 0))(
  ( (tuple2!4671 (_1!2346 (_ BitVec 64)) (_2!2346 V!7977)) )
))
(declare-datatypes ((List!3569 0))(
  ( (Nil!3566) (Cons!3565 (h!4221 tuple2!4670) (t!8558 List!3569)) )
))
(declare-datatypes ((ListLongMap!3583 0))(
  ( (ListLongMap!3584 (toList!1807 List!3569)) )
))
(declare-fun contains!1693 (ListLongMap!3583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1335 (array!11769 array!11767 (_ BitVec 32) (_ BitVec 32) V!7977 V!7977 (_ BitVec 32) Int) ListLongMap!3583)

(assert (=> b!237848 (= res!116546 (not (contains!1693 (getCurrentListMap!1335 (_keys!6508 thiss!1504) (_values!4395 thiss!1504) (mask!10433 thiss!1504) (extraKeys!4149 thiss!1504) (zeroValue!4253 thiss!1504) (minValue!4253 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4412 thiss!1504)) key!932)))))

(declare-fun b!237849 () Bool)

(assert (=> b!237849 (= e!154437 (and e!154441 mapRes!10593))))

(declare-fun condMapEmpty!10593 () Bool)

(declare-fun mapDefault!10593 () ValueCell!2780)

