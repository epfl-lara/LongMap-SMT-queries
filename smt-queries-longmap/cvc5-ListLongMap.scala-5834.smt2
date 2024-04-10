; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75306 () Bool)

(assert start!75306)

(declare-fun b!887141 () Bool)

(declare-fun b_free!15505 () Bool)

(declare-fun b_next!15505 () Bool)

(assert (=> b!887141 (= b_free!15505 (not b_next!15505))))

(declare-fun tp!54448 () Bool)

(declare-fun b_and!25711 () Bool)

(assert (=> b!887141 (= tp!54448 b_and!25711)))

(declare-fun b!887136 () Bool)

(declare-fun e!493965 () Bool)

(declare-fun tp_is_empty!17833 () Bool)

(assert (=> b!887136 (= e!493965 tp_is_empty!17833)))

(declare-fun b!887137 () Bool)

(declare-fun e!493968 () Bool)

(assert (=> b!887137 (= e!493968 tp_is_empty!17833)))

(declare-fun b!887138 () Bool)

(declare-fun e!493964 () Bool)

(assert (=> b!887138 (= e!493964 false)))

(declare-fun lt!401197 () Bool)

(declare-datatypes ((V!28743 0))(
  ( (V!28744 (val!8967 Int)) )
))
(declare-datatypes ((ValueCell!8435 0))(
  ( (ValueCellFull!8435 (v!11414 V!28743)) (EmptyCell!8435) )
))
(declare-datatypes ((array!51626 0))(
  ( (array!51627 (arr!24829 (Array (_ BitVec 32) ValueCell!8435)) (size!25269 (_ BitVec 32))) )
))
(declare-datatypes ((array!51628 0))(
  ( (array!51629 (arr!24830 (Array (_ BitVec 32) (_ BitVec 64))) (size!25270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3886 0))(
  ( (LongMapFixedSize!3887 (defaultEntry!5131 Int) (mask!25524 (_ BitVec 32)) (extraKeys!4824 (_ BitVec 32)) (zeroValue!4928 V!28743) (minValue!4928 V!28743) (_size!1998 (_ BitVec 32)) (_keys!9806 array!51628) (_values!5115 array!51626) (_vacant!1998 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1046 0))(
  ( (Cell!1047 (v!11415 LongMapFixedSize!3886)) )
))
(declare-datatypes ((LongMap!1046 0))(
  ( (LongMap!1047 (underlying!534 Cell!1046)) )
))
(declare-fun thiss!833 () LongMap!1046)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun contains!4301 (LongMap!1046 (_ BitVec 64)) Bool)

(assert (=> b!887138 (= lt!401197 (contains!4301 thiss!833 key!673))))

(declare-fun lt!401196 () V!28743)

(declare-fun apply!389 (LongMapFixedSize!3886 (_ BitVec 64)) V!28743)

(assert (=> b!887138 (= lt!401196 (apply!389 (v!11415 (underlying!534 thiss!833)) key!673))))

(declare-fun mapNonEmpty!28269 () Bool)

(declare-fun mapRes!28269 () Bool)

(declare-fun tp!54449 () Bool)

(assert (=> mapNonEmpty!28269 (= mapRes!28269 (and tp!54449 e!493965))))

(declare-fun mapValue!28269 () ValueCell!8435)

(declare-fun mapKey!28269 () (_ BitVec 32))

(declare-fun mapRest!28269 () (Array (_ BitVec 32) ValueCell!8435))

(assert (=> mapNonEmpty!28269 (= (arr!24829 (_values!5115 (v!11415 (underlying!534 thiss!833)))) (store mapRest!28269 mapKey!28269 mapValue!28269))))

(declare-fun b!887139 () Bool)

(declare-fun e!493962 () Bool)

(declare-fun e!493966 () Bool)

(assert (=> b!887139 (= e!493962 e!493966)))

(declare-fun b!887140 () Bool)

(declare-fun e!493961 () Bool)

(assert (=> b!887140 (= e!493961 (and e!493968 mapRes!28269))))

(declare-fun condMapEmpty!28269 () Bool)

(declare-fun mapDefault!28269 () ValueCell!8435)

