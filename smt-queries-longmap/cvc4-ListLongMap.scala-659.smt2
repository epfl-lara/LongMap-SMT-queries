; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16306 () Bool)

(assert start!16306)

(declare-fun b!162723 () Bool)

(declare-fun b_free!3767 () Bool)

(declare-fun b_next!3767 () Bool)

(assert (=> b!162723 (= b_free!3767 (not b_next!3767))))

(declare-fun tp!13870 () Bool)

(declare-fun b_and!10181 () Bool)

(assert (=> b!162723 (= tp!13870 b_and!10181)))

(declare-fun b!162721 () Bool)

(declare-fun e!106720 () Bool)

(assert (=> b!162721 (= e!106720 false)))

(declare-datatypes ((V!4405 0))(
  ( (V!4406 (val!1829 Int)) )
))
(declare-fun v!309 () V!4405)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!390 0))(
  ( (MissingZero!390 (index!3728 (_ BitVec 32))) (Found!390 (index!3729 (_ BitVec 32))) (Intermediate!390 (undefined!1202 Bool) (index!3730 (_ BitVec 32)) (x!18006 (_ BitVec 32))) (Undefined!390) (MissingVacant!390 (index!3731 (_ BitVec 32))) )
))
(declare-fun lt!82533 () SeekEntryResult!390)

(declare-datatypes ((ValueCell!1441 0))(
  ( (ValueCellFull!1441 (v!3694 V!4405)) (EmptyCell!1441) )
))
(declare-datatypes ((array!6217 0))(
  ( (array!6218 (arr!2953 (Array (_ BitVec 32) (_ BitVec 64))) (size!3237 (_ BitVec 32))) )
))
(declare-datatypes ((array!6219 0))(
  ( (array!6220 (arr!2954 (Array (_ BitVec 32) ValueCell!1441)) (size!3238 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1790 0))(
  ( (LongMapFixedSize!1791 (defaultEntry!3337 Int) (mask!7967 (_ BitVec 32)) (extraKeys!3078 (_ BitVec 32)) (zeroValue!3180 V!4405) (minValue!3180 V!4405) (_size!944 (_ BitVec 32)) (_keys!5138 array!6217) (_values!3320 array!6219) (_vacant!944 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1790)

(declare-fun lt!82534 () Bool)

(declare-fun valid!806 (LongMapFixedSize!1790) Bool)

(declare-datatypes ((tuple2!3012 0))(
  ( (tuple2!3013 (_1!1517 Bool) (_2!1517 LongMapFixedSize!1790)) )
))
(declare-fun updateHelperNewKey!86 (LongMapFixedSize!1790 (_ BitVec 64) V!4405 (_ BitVec 32)) tuple2!3012)

(assert (=> b!162721 (= lt!82534 (valid!806 (_2!1517 (updateHelperNewKey!86 thiss!1248 key!828 v!309 (index!3728 lt!82533)))))))

(declare-fun b!162722 () Bool)

(declare-fun e!106721 () Bool)

(declare-fun tp_is_empty!3569 () Bool)

(assert (=> b!162722 (= e!106721 tp_is_empty!3569)))

(declare-fun e!106725 () Bool)

(declare-fun e!106722 () Bool)

(declare-fun array_inv!1887 (array!6217) Bool)

(declare-fun array_inv!1888 (array!6219) Bool)

(assert (=> b!162723 (= e!106722 (and tp!13870 tp_is_empty!3569 (array_inv!1887 (_keys!5138 thiss!1248)) (array_inv!1888 (_values!3320 thiss!1248)) e!106725))))

(declare-fun b!162724 () Bool)

(declare-fun e!106723 () Bool)

(assert (=> b!162724 (= e!106723 e!106720)))

(declare-fun res!77063 () Bool)

(assert (=> b!162724 (=> (not res!77063) (not e!106720))))

(assert (=> b!162724 (= res!77063 (and (not (is-Undefined!390 lt!82533)) (not (is-MissingVacant!390 lt!82533)) (is-MissingZero!390 lt!82533)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6217 (_ BitVec 32)) SeekEntryResult!390)

(assert (=> b!162724 (= lt!82533 (seekEntryOrOpen!0 key!828 (_keys!5138 thiss!1248) (mask!7967 thiss!1248)))))

(declare-fun res!77061 () Bool)

(assert (=> start!16306 (=> (not res!77061) (not e!106723))))

(assert (=> start!16306 (= res!77061 (valid!806 thiss!1248))))

(assert (=> start!16306 e!106723))

(assert (=> start!16306 e!106722))

(assert (=> start!16306 true))

(assert (=> start!16306 tp_is_empty!3569))

(declare-fun b!162725 () Bool)

(declare-fun e!106724 () Bool)

(assert (=> b!162725 (= e!106724 tp_is_empty!3569)))

(declare-fun mapNonEmpty!6041 () Bool)

(declare-fun mapRes!6041 () Bool)

(declare-fun tp!13871 () Bool)

(assert (=> mapNonEmpty!6041 (= mapRes!6041 (and tp!13871 e!106724))))

(declare-fun mapRest!6041 () (Array (_ BitVec 32) ValueCell!1441))

(declare-fun mapValue!6041 () ValueCell!1441)

(declare-fun mapKey!6041 () (_ BitVec 32))

(assert (=> mapNonEmpty!6041 (= (arr!2954 (_values!3320 thiss!1248)) (store mapRest!6041 mapKey!6041 mapValue!6041))))

(declare-fun b!162726 () Bool)

(assert (=> b!162726 (= e!106725 (and e!106721 mapRes!6041))))

(declare-fun condMapEmpty!6041 () Bool)

(declare-fun mapDefault!6041 () ValueCell!1441)

