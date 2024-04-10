; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13436 () Bool)

(assert start!13436)

(declare-fun b!123129 () Bool)

(declare-fun b_free!2805 () Bool)

(declare-fun b_next!2805 () Bool)

(assert (=> b!123129 (= b_free!2805 (not b_next!2805))))

(declare-fun tp!10802 () Bool)

(declare-fun b_and!7559 () Bool)

(assert (=> b!123129 (= tp!10802 b_and!7559)))

(declare-fun b!123127 () Bool)

(declare-fun b_free!2807 () Bool)

(declare-fun b_next!2807 () Bool)

(assert (=> b!123127 (= b_free!2807 (not b_next!2807))))

(declare-fun tp!10803 () Bool)

(declare-fun b_and!7561 () Bool)

(assert (=> b!123127 (= tp!10803 b_and!7561)))

(declare-fun b!123117 () Bool)

(declare-fun e!80465 () Bool)

(declare-fun tp_is_empty!2819 () Bool)

(assert (=> b!123117 (= e!80465 tp_is_empty!2819)))

(declare-fun b!123118 () Bool)

(declare-fun res!59814 () Bool)

(declare-fun e!80466 () Bool)

(assert (=> b!123118 (=> (not res!59814) (not e!80466))))

(declare-datatypes ((V!3405 0))(
  ( (V!3406 (val!1454 Int)) )
))
(declare-datatypes ((array!4649 0))(
  ( (array!4650 (arr!2203 (Array (_ BitVec 32) (_ BitVec 64))) (size!2465 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1066 0))(
  ( (ValueCellFull!1066 (v!3087 V!3405)) (EmptyCell!1066) )
))
(declare-datatypes ((array!4651 0))(
  ( (array!4652 (arr!2204 (Array (_ BitVec 32) ValueCell!1066)) (size!2466 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1040 0))(
  ( (LongMapFixedSize!1041 (defaultEntry!2753 Int) (mask!6989 (_ BitVec 32)) (extraKeys!2538 (_ BitVec 32)) (zeroValue!2618 V!3405) (minValue!2618 V!3405) (_size!569 (_ BitVec 32)) (_keys!4480 array!4649) (_values!2736 array!4651) (_vacant!569 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1040)

(declare-fun valid!495 (LongMapFixedSize!1040) Bool)

(assert (=> b!123118 (= res!59814 (valid!495 newMap!16))))

(declare-fun b!123119 () Bool)

(declare-fun res!59816 () Bool)

(assert (=> b!123119 (=> (not res!59816) (not e!80466))))

(declare-datatypes ((Cell!836 0))(
  ( (Cell!837 (v!3088 LongMapFixedSize!1040)) )
))
(declare-datatypes ((LongMap!836 0))(
  ( (LongMap!837 (underlying!429 Cell!836)) )
))
(declare-fun thiss!992 () LongMap!836)

(assert (=> b!123119 (= res!59816 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6989 newMap!16)) (_size!569 (v!3088 (underlying!429 thiss!992)))))))

(declare-fun mapIsEmpty!4413 () Bool)

(declare-fun mapRes!4414 () Bool)

(assert (=> mapIsEmpty!4413 mapRes!4414))

(declare-fun b!123120 () Bool)

(declare-fun e!80461 () Bool)

(declare-fun e!80467 () Bool)

(assert (=> b!123120 (= e!80461 e!80467)))

(declare-fun b!123121 () Bool)

(declare-fun e!80455 () Bool)

(assert (=> b!123121 (= e!80455 tp_is_empty!2819)))

(declare-fun res!59815 () Bool)

(assert (=> start!13436 (=> (not res!59815) (not e!80466))))

(declare-fun valid!496 (LongMap!836) Bool)

(assert (=> start!13436 (= res!59815 (valid!496 thiss!992))))

(assert (=> start!13436 e!80466))

(declare-fun e!80458 () Bool)

(assert (=> start!13436 e!80458))

(assert (=> start!13436 true))

(declare-fun e!80457 () Bool)

(assert (=> start!13436 e!80457))

(declare-fun b!123122 () Bool)

(declare-fun e!80456 () Bool)

(declare-fun e!80459 () Bool)

(declare-fun mapRes!4413 () Bool)

(assert (=> b!123122 (= e!80456 (and e!80459 mapRes!4413))))

(declare-fun condMapEmpty!4413 () Bool)

(declare-fun mapDefault!4414 () ValueCell!1066)

