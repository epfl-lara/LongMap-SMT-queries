; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3004 () Bool)

(assert start!3004)

(declare-fun b!17601 () Bool)

(declare-fun b_free!611 () Bool)

(declare-fun b_next!611 () Bool)

(assert (=> b!17601 (= b_free!611 (not b_next!611))))

(declare-fun tp!3023 () Bool)

(declare-fun b_and!1259 () Bool)

(assert (=> b!17601 (= tp!3023 b_and!1259)))

(declare-fun b!17598 () Bool)

(declare-fun e!11086 () Bool)

(declare-fun e!11077 () Bool)

(assert (=> b!17598 (= e!11086 e!11077)))

(declare-fun res!12628 () Bool)

(assert (=> b!17598 (=> (not res!12628) (not e!11077))))

(declare-datatypes ((V!991 0))(
  ( (V!992 (val!464 Int)) )
))
(declare-datatypes ((ValueCell!238 0))(
  ( (ValueCellFull!238 (v!1432 V!991)) (EmptyCell!238) )
))
(declare-datatypes ((array!955 0))(
  ( (array!956 (arr!459 (Array (_ BitVec 32) ValueCell!238)) (size!549 (_ BitVec 32))) )
))
(declare-datatypes ((array!957 0))(
  ( (array!958 (arr!460 (Array (_ BitVec 32) (_ BitVec 64))) (size!550 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!62 0))(
  ( (LongMapFixedSize!63 (defaultEntry!1642 Int) (mask!4561 (_ BitVec 32)) (extraKeys!1555 (_ BitVec 32)) (zeroValue!1578 V!991) (minValue!1578 V!991) (_size!63 (_ BitVec 32)) (_keys!3067 array!957) (_values!1639 array!955) (_vacant!63 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!62 0))(
  ( (Cell!63 (v!1433 LongMapFixedSize!62)) )
))
(declare-datatypes ((LongMap!62 0))(
  ( (LongMap!63 (underlying!42 Cell!62)) )
))
(declare-datatypes ((tuple2!752 0))(
  ( (tuple2!753 (_1!377 Bool) (_2!377 LongMap!62)) )
))
(declare-fun lt!4575 () tuple2!752)

(assert (=> b!17598 (= res!12628 (_1!377 lt!4575))))

(declare-fun e!11085 () tuple2!752)

(assert (=> b!17598 (= lt!4575 e!11085)))

(declare-fun c!1765 () Bool)

(declare-fun thiss!848 () LongMap!62)

(declare-fun imbalanced!15 (LongMap!62) Bool)

(assert (=> b!17598 (= c!1765 (imbalanced!15 thiss!848))))

(declare-fun mapIsEmpty!747 () Bool)

(declare-fun mapRes!747 () Bool)

(assert (=> mapIsEmpty!747 mapRes!747))

(declare-fun b!17599 () Bool)

(assert (=> b!17599 (= e!11085 (tuple2!753 true thiss!848))))

(declare-fun res!12627 () Bool)

(assert (=> start!3004 (=> (not res!12627) (not e!11086))))

(declare-fun valid!32 (LongMap!62) Bool)

(assert (=> start!3004 (= res!12627 (valid!32 thiss!848))))

(assert (=> start!3004 e!11086))

(declare-fun e!11082 () Bool)

(assert (=> start!3004 e!11082))

(assert (=> start!3004 true))

(declare-fun tp_is_empty!875 () Bool)

(assert (=> start!3004 tp_is_empty!875))

(declare-fun b!17600 () Bool)

(declare-fun e!11079 () Bool)

(declare-fun e!11080 () Bool)

(assert (=> b!17600 (= e!11079 (and e!11080 mapRes!747))))

(declare-fun condMapEmpty!747 () Bool)

(declare-fun mapDefault!747 () ValueCell!238)

