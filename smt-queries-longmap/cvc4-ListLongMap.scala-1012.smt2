; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21676 () Bool)

(assert start!21676)

(declare-fun b!217633 () Bool)

(declare-fun b_free!5825 () Bool)

(declare-fun b_next!5825 () Bool)

(assert (=> b!217633 (= b_free!5825 (not b_next!5825))))

(declare-fun tp!20609 () Bool)

(declare-fun b_and!12715 () Bool)

(assert (=> b!217633 (= tp!20609 b_and!12715)))

(declare-fun res!106589 () Bool)

(declare-fun e!141573 () Bool)

(assert (=> start!21676 (=> (not res!106589) (not e!141573))))

(declare-datatypes ((V!7229 0))(
  ( (V!7230 (val!2888 Int)) )
))
(declare-datatypes ((ValueCell!2500 0))(
  ( (ValueCellFull!2500 (v!4906 V!7229)) (EmptyCell!2500) )
))
(declare-datatypes ((array!10613 0))(
  ( (array!10614 (arr!5028 (Array (_ BitVec 32) ValueCell!2500)) (size!5360 (_ BitVec 32))) )
))
(declare-datatypes ((array!10615 0))(
  ( (array!10616 (arr!5029 (Array (_ BitVec 32) (_ BitVec 64))) (size!5361 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2900 0))(
  ( (LongMapFixedSize!2901 (defaultEntry!4100 Int) (mask!9859 (_ BitVec 32)) (extraKeys!3837 (_ BitVec 32)) (zeroValue!3941 V!7229) (minValue!3941 V!7229) (_size!1499 (_ BitVec 32)) (_keys!6149 array!10615) (_values!4083 array!10613) (_vacant!1499 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2900)

(declare-fun valid!1176 (LongMapFixedSize!2900) Bool)

(assert (=> start!21676 (= res!106589 (valid!1176 thiss!1504))))

(assert (=> start!21676 e!141573))

(declare-fun e!141575 () Bool)

(assert (=> start!21676 e!141575))

(assert (=> start!21676 true))

(declare-fun b!217624 () Bool)

(declare-fun res!106593 () Bool)

(declare-fun e!141577 () Bool)

(assert (=> b!217624 (=> (not res!106593) (not e!141577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10615 (_ BitVec 32)) Bool)

(assert (=> b!217624 (= res!106593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6149 thiss!1504) (mask!9859 thiss!1504)))))

(declare-fun b!217625 () Bool)

(declare-fun res!106591 () Bool)

(assert (=> b!217625 (=> (not res!106591) (not e!141577))))

(assert (=> b!217625 (= res!106591 (and (= (size!5360 (_values!4083 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9859 thiss!1504))) (= (size!5361 (_keys!6149 thiss!1504)) (size!5360 (_values!4083 thiss!1504))) (bvsge (mask!9859 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3837 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3837 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9693 () Bool)

(declare-fun mapRes!9693 () Bool)

(declare-fun tp!20610 () Bool)

(declare-fun e!141574 () Bool)

(assert (=> mapNonEmpty!9693 (= mapRes!9693 (and tp!20610 e!141574))))

(declare-fun mapKey!9693 () (_ BitVec 32))

(declare-fun mapRest!9693 () (Array (_ BitVec 32) ValueCell!2500))

(declare-fun mapValue!9693 () ValueCell!2500)

(assert (=> mapNonEmpty!9693 (= (arr!5028 (_values!4083 thiss!1504)) (store mapRest!9693 mapKey!9693 mapValue!9693))))

(declare-fun b!217626 () Bool)

(declare-fun res!106588 () Bool)

(assert (=> b!217626 (=> (not res!106588) (not e!141577))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4292 0))(
  ( (tuple2!4293 (_1!2157 (_ BitVec 64)) (_2!2157 V!7229)) )
))
(declare-datatypes ((List!3197 0))(
  ( (Nil!3194) (Cons!3193 (h!3840 tuple2!4292) (t!8152 List!3197)) )
))
(declare-datatypes ((ListLongMap!3205 0))(
  ( (ListLongMap!3206 (toList!1618 List!3197)) )
))
(declare-fun contains!1459 (ListLongMap!3205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1146 (array!10615 array!10613 (_ BitVec 32) (_ BitVec 32) V!7229 V!7229 (_ BitVec 32) Int) ListLongMap!3205)

(assert (=> b!217626 (= res!106588 (not (contains!1459 (getCurrentListMap!1146 (_keys!6149 thiss!1504) (_values!4083 thiss!1504) (mask!9859 thiss!1504) (extraKeys!3837 thiss!1504) (zeroValue!3941 thiss!1504) (minValue!3941 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4100 thiss!1504)) key!932)))))

(declare-fun b!217627 () Bool)

(declare-fun e!141571 () Bool)

(declare-fun e!141572 () Bool)

(assert (=> b!217627 (= e!141571 (and e!141572 mapRes!9693))))

(declare-fun condMapEmpty!9693 () Bool)

(declare-fun mapDefault!9693 () ValueCell!2500)

