; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14574 () Bool)

(assert start!14574)

(declare-fun b!137642 () Bool)

(declare-fun b_free!2965 () Bool)

(declare-fun b_next!2965 () Bool)

(assert (=> b!137642 (= b_free!2965 (not b_next!2965))))

(declare-fun tp!11356 () Bool)

(declare-fun b_and!8539 () Bool)

(assert (=> b!137642 (= tp!11356 b_and!8539)))

(declare-fun b!137639 () Bool)

(declare-fun b_free!2967 () Bool)

(declare-fun b_next!2967 () Bool)

(assert (=> b!137639 (= b_free!2967 (not b_next!2967))))

(declare-fun tp!11357 () Bool)

(declare-fun b_and!8541 () Bool)

(assert (=> b!137639 (= tp!11357 b_and!8541)))

(declare-fun res!65974 () Bool)

(declare-fun e!89651 () Bool)

(assert (=> start!14574 (=> (not res!65974) (not e!89651))))

(declare-datatypes ((V!3513 0))(
  ( (V!3514 (val!1494 Int)) )
))
(declare-datatypes ((array!4829 0))(
  ( (array!4830 (arr!2283 (Array (_ BitVec 32) (_ BitVec 64))) (size!2554 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1106 0))(
  ( (ValueCellFull!1106 (v!3240 V!3513)) (EmptyCell!1106) )
))
(declare-datatypes ((array!4831 0))(
  ( (array!4832 (arr!2284 (Array (_ BitVec 32) ValueCell!1106)) (size!2555 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1120 0))(
  ( (LongMapFixedSize!1121 (defaultEntry!2912 Int) (mask!7238 (_ BitVec 32)) (extraKeys!2669 (_ BitVec 32)) (zeroValue!2763 V!3513) (minValue!2763 V!3513) (_size!609 (_ BitVec 32)) (_keys!4669 array!4829) (_values!2895 array!4831) (_vacant!609 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!908 0))(
  ( (Cell!909 (v!3241 LongMapFixedSize!1120)) )
))
(declare-datatypes ((LongMap!908 0))(
  ( (LongMap!909 (underlying!465 Cell!908)) )
))
(declare-fun thiss!992 () LongMap!908)

(declare-fun valid!540 (LongMap!908) Bool)

(assert (=> start!14574 (= res!65974 (valid!540 thiss!992))))

(assert (=> start!14574 e!89651))

(declare-fun e!89642 () Bool)

(assert (=> start!14574 e!89642))

(assert (=> start!14574 true))

(declare-fun e!89656 () Bool)

(assert (=> start!14574 e!89656))

(declare-fun b!137635 () Bool)

(declare-fun e!89648 () Bool)

(declare-fun tp_is_empty!2899 () Bool)

(assert (=> b!137635 (= e!89648 tp_is_empty!2899)))

(declare-fun mapNonEmpty!4727 () Bool)

(declare-fun mapRes!4727 () Bool)

(declare-fun tp!11355 () Bool)

(assert (=> mapNonEmpty!4727 (= mapRes!4727 (and tp!11355 e!89648))))

(declare-fun mapValue!4728 () ValueCell!1106)

(declare-fun mapKey!4728 () (_ BitVec 32))

(declare-fun mapRest!4728 () (Array (_ BitVec 32) ValueCell!1106))

(assert (=> mapNonEmpty!4727 (= (arr!2284 (_values!2895 (v!3241 (underlying!465 thiss!992)))) (store mapRest!4728 mapKey!4728 mapValue!4728))))

(declare-fun b!137636 () Bool)

(declare-fun e!89647 () Bool)

(declare-fun e!89655 () Bool)

(assert (=> b!137636 (= e!89647 (and e!89655 mapRes!4727))))

(declare-fun condMapEmpty!4728 () Bool)

(declare-fun mapDefault!4728 () ValueCell!1106)

