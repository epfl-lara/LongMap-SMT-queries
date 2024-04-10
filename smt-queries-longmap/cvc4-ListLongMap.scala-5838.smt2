; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75406 () Bool)

(assert start!75406)

(declare-fun b!887816 () Bool)

(declare-fun b_free!15533 () Bool)

(declare-fun b_next!15533 () Bool)

(assert (=> b!887816 (= b_free!15533 (not b_next!15533))))

(declare-fun tp!54543 () Bool)

(declare-fun b_and!25769 () Bool)

(assert (=> b!887816 (= tp!54543 b_and!25769)))

(declare-fun b!887812 () Bool)

(declare-fun e!494531 () Bool)

(declare-fun e!494530 () Bool)

(assert (=> b!887812 (= e!494531 e!494530)))

(declare-fun b!887813 () Bool)

(declare-fun e!494525 () Bool)

(assert (=> b!887813 (= e!494525 false)))

(declare-fun lt!401462 () Bool)

(declare-datatypes ((V!28779 0))(
  ( (V!28780 (val!8981 Int)) )
))
(declare-datatypes ((array!51688 0))(
  ( (array!51689 (arr!24857 (Array (_ BitVec 32) (_ BitVec 64))) (size!25297 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8449 0))(
  ( (ValueCellFull!8449 (v!11448 V!28779)) (EmptyCell!8449) )
))
(declare-datatypes ((array!51690 0))(
  ( (array!51691 (arr!24858 (Array (_ BitVec 32) ValueCell!8449)) (size!25298 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3914 0))(
  ( (LongMapFixedSize!3915 (defaultEntry!5148 Int) (mask!25552 (_ BitVec 32)) (extraKeys!4842 (_ BitVec 32)) (zeroValue!4946 V!28779) (minValue!4946 V!28779) (_size!2012 (_ BitVec 32)) (_keys!9825 array!51688) (_values!5133 array!51690) (_vacant!2012 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1074 0))(
  ( (Cell!1075 (v!11449 LongMapFixedSize!3914)) )
))
(declare-datatypes ((LongMap!1074 0))(
  ( (LongMap!1075 (underlying!548 Cell!1074)) )
))
(declare-fun thiss!821 () LongMap!1074)

(declare-fun key!666 () (_ BitVec 64))

(declare-fun contains!4313 (LongMapFixedSize!3914 (_ BitVec 64)) Bool)

(assert (=> b!887813 (= lt!401462 (contains!4313 (v!11449 (underlying!548 thiss!821)) key!666))))

(declare-fun b!887814 () Bool)

(declare-fun e!494524 () Bool)

(declare-fun tp_is_empty!17861 () Bool)

(assert (=> b!887814 (= e!494524 tp_is_empty!17861)))

(declare-fun b!887815 () Bool)

(declare-fun e!494526 () Bool)

(assert (=> b!887815 (= e!494526 tp_is_empty!17861)))

(declare-fun mapIsEmpty!28321 () Bool)

(declare-fun mapRes!28321 () Bool)

(assert (=> mapIsEmpty!28321 mapRes!28321))

(declare-fun e!494527 () Bool)

(declare-fun e!494529 () Bool)

(declare-fun array_inv!19564 (array!51688) Bool)

(declare-fun array_inv!19565 (array!51690) Bool)

(assert (=> b!887816 (= e!494529 (and tp!54543 tp_is_empty!17861 (array_inv!19564 (_keys!9825 (v!11449 (underlying!548 thiss!821)))) (array_inv!19565 (_values!5133 (v!11449 (underlying!548 thiss!821)))) e!494527))))

(declare-fun b!887817 () Bool)

(assert (=> b!887817 (= e!494527 (and e!494524 mapRes!28321))))

(declare-fun condMapEmpty!28321 () Bool)

(declare-fun mapDefault!28321 () ValueCell!8449)

