; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11802 () Bool)

(assert start!11802)

(declare-fun b!99150 () Bool)

(declare-fun b_free!2445 () Bool)

(declare-fun b_next!2445 () Bool)

(assert (=> b!99150 (= b_free!2445 (not b_next!2445))))

(declare-fun tp!9625 () Bool)

(declare-fun b_and!6103 () Bool)

(assert (=> b!99150 (= tp!9625 b_and!6103)))

(declare-fun b!99142 () Bool)

(declare-fun b_free!2447 () Bool)

(declare-fun b_next!2447 () Bool)

(assert (=> b!99142 (= b_free!2447 (not b_next!2447))))

(declare-fun tp!9626 () Bool)

(declare-fun b_and!6105 () Bool)

(assert (=> b!99142 (= tp!9626 b_and!6105)))

(declare-fun b!99136 () Bool)

(declare-fun e!64628 () Bool)

(declare-fun tp_is_empty!2639 () Bool)

(assert (=> b!99136 (= e!64628 tp_is_empty!2639)))

(declare-fun b!99137 () Bool)

(declare-fun res!49822 () Bool)

(declare-fun e!64626 () Bool)

(assert (=> b!99137 (=> (not res!49822) (not e!64626))))

(declare-datatypes ((V!3165 0))(
  ( (V!3166 (val!1364 Int)) )
))
(declare-datatypes ((array!4259 0))(
  ( (array!4260 (arr!2023 (Array (_ BitVec 32) (_ BitVec 64))) (size!2274 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!976 0))(
  ( (ValueCellFull!976 (v!2817 V!3165)) (EmptyCell!976) )
))
(declare-datatypes ((array!4261 0))(
  ( (array!4262 (arr!2024 (Array (_ BitVec 32) ValueCell!976)) (size!2275 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!860 0))(
  ( (LongMapFixedSize!861 (defaultEntry!2503 Int) (mask!6610 (_ BitVec 32)) (extraKeys!2320 (_ BitVec 32)) (zeroValue!2384 V!3165) (minValue!2384 V!3165) (_size!479 (_ BitVec 32)) (_keys!4197 array!4259) (_values!2486 array!4261) (_vacant!479 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!660 0))(
  ( (Cell!661 (v!2818 LongMapFixedSize!860)) )
))
(declare-datatypes ((LongMap!660 0))(
  ( (LongMap!661 (underlying!341 Cell!660)) )
))
(declare-fun thiss!992 () LongMap!660)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!99137 (= res!49822 (validMask!0 (mask!6610 (v!2818 (underlying!341 thiss!992)))))))

(declare-fun b!99138 () Bool)

(assert (=> b!99138 (= e!64626 (and (= (size!2275 (_values!2486 (v!2818 (underlying!341 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6610 (v!2818 (underlying!341 thiss!992))))) (= (size!2274 (_keys!4197 (v!2818 (underlying!341 thiss!992)))) (size!2275 (_values!2486 (v!2818 (underlying!341 thiss!992))))) (bvsge (mask!6610 (v!2818 (underlying!341 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2320 (v!2818 (underlying!341 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2320 (v!2818 (underlying!341 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!99139 () Bool)

(declare-fun e!64633 () Bool)

(declare-fun e!64632 () Bool)

(assert (=> b!99139 (= e!64633 e!64632)))

(declare-fun b!99140 () Bool)

(declare-fun e!64631 () Bool)

(assert (=> b!99140 (= e!64631 tp_is_empty!2639)))

(declare-fun mapIsEmpty!3777 () Bool)

(declare-fun mapRes!3778 () Bool)

(assert (=> mapIsEmpty!3777 mapRes!3778))

(declare-fun b!99141 () Bool)

(declare-fun res!49823 () Bool)

(declare-fun e!64630 () Bool)

(assert (=> b!99141 (=> (not res!49823) (not e!64630))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!99141 (= res!49823 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2274 (_keys!4197 (v!2818 (underlying!341 thiss!992)))))))))

(declare-fun e!64625 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!860)

(declare-fun e!64618 () Bool)

(declare-fun array_inv!1261 (array!4259) Bool)

(declare-fun array_inv!1262 (array!4261) Bool)

(assert (=> b!99142 (= e!64625 (and tp!9626 tp_is_empty!2639 (array_inv!1261 (_keys!4197 newMap!16)) (array_inv!1262 (_values!2486 newMap!16)) e!64618))))

(declare-fun b!99143 () Bool)

(declare-fun e!64629 () Bool)

(assert (=> b!99143 (= e!64618 (and e!64629 mapRes!3778))))

(declare-fun condMapEmpty!3777 () Bool)

(declare-fun mapDefault!3778 () ValueCell!976)

