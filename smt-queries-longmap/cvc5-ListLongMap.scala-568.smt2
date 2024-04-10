; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15460 () Bool)

(assert start!15460)

(declare-fun b!153705 () Bool)

(declare-fun b_free!3205 () Bool)

(declare-fun b_next!3205 () Bool)

(assert (=> b!153705 (= b_free!3205 (not b_next!3205))))

(declare-fun tp!12132 () Bool)

(declare-fun b_and!9567 () Bool)

(assert (=> b!153705 (= tp!12132 b_and!9567)))

(declare-fun b!153704 () Bool)

(declare-fun b_free!3207 () Bool)

(declare-fun b_next!3207 () Bool)

(assert (=> b!153704 (= b_free!3207 (not b_next!3207))))

(declare-fun tp!12133 () Bool)

(declare-fun b_and!9569 () Bool)

(assert (=> b!153704 (= tp!12133 b_and!9569)))

(declare-datatypes ((V!3673 0))(
  ( (V!3674 (val!1554 Int)) )
))
(declare-datatypes ((array!5087 0))(
  ( (array!5088 (arr!2403 (Array (_ BitVec 32) (_ BitVec 64))) (size!2680 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1166 0))(
  ( (ValueCellFull!1166 (v!3410 V!3673)) (EmptyCell!1166) )
))
(declare-datatypes ((array!5089 0))(
  ( (array!5090 (arr!2404 (Array (_ BitVec 32) ValueCell!1166)) (size!2681 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1240 0))(
  ( (LongMapFixedSize!1241 (defaultEntry!3059 Int) (mask!7461 (_ BitVec 32)) (extraKeys!2800 (_ BitVec 32)) (zeroValue!2902 V!3673) (minValue!2902 V!3673) (_size!669 (_ BitVec 32)) (_keys!4832 array!5087) (_values!3042 array!5089) (_vacant!669 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1240)

(declare-fun e!100403 () Bool)

(declare-fun e!100396 () Bool)

(declare-fun tp_is_empty!3019 () Bool)

(declare-fun array_inv!1517 (array!5087) Bool)

(declare-fun array_inv!1518 (array!5089) Bool)

(assert (=> b!153704 (= e!100403 (and tp!12133 tp_is_empty!3019 (array_inv!1517 (_keys!4832 newMap!16)) (array_inv!1518 (_values!3042 newMap!16)) e!100396))))

(declare-fun res!72623 () Bool)

(declare-fun e!100392 () Bool)

(assert (=> start!15460 (=> (not res!72623) (not e!100392))))

(declare-datatypes ((Cell!1022 0))(
  ( (Cell!1023 (v!3411 LongMapFixedSize!1240)) )
))
(declare-datatypes ((LongMap!1022 0))(
  ( (LongMap!1023 (underlying!522 Cell!1022)) )
))
(declare-fun thiss!992 () LongMap!1022)

(declare-fun valid!611 (LongMap!1022) Bool)

(assert (=> start!15460 (= res!72623 (valid!611 thiss!992))))

(assert (=> start!15460 e!100392))

(declare-fun e!100397 () Bool)

(assert (=> start!15460 e!100397))

(assert (=> start!15460 true))

(assert (=> start!15460 e!100403))

(declare-fun mapIsEmpty!5143 () Bool)

(declare-fun mapRes!5143 () Bool)

(assert (=> mapIsEmpty!5143 mapRes!5143))

(declare-fun e!100402 () Bool)

(declare-fun e!100406 () Bool)

(assert (=> b!153705 (= e!100402 (and tp!12132 tp_is_empty!3019 (array_inv!1517 (_keys!4832 (v!3411 (underlying!522 thiss!992)))) (array_inv!1518 (_values!3042 (v!3411 (underlying!522 thiss!992)))) e!100406))))

(declare-fun mapIsEmpty!5144 () Bool)

(declare-fun mapRes!5144 () Bool)

(assert (=> mapIsEmpty!5144 mapRes!5144))

(declare-fun b!153706 () Bool)

(declare-fun res!72624 () Bool)

(assert (=> b!153706 (=> (not res!72624) (not e!100392))))

(assert (=> b!153706 (= res!72624 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7461 newMap!16)) (_size!669 (v!3411 (underlying!522 thiss!992)))))))

(declare-fun b!153707 () Bool)

(declare-fun e!100399 () Bool)

(assert (=> b!153707 (= e!100396 (and e!100399 mapRes!5143))))

(declare-fun condMapEmpty!5144 () Bool)

(declare-fun mapDefault!5144 () ValueCell!1166)

