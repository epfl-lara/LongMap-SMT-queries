; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10838 () Bool)

(assert start!10838)

(declare-fun b!87676 () Bool)

(declare-fun b_free!2245 () Bool)

(declare-fun b_next!2245 () Bool)

(assert (=> b!87676 (= b_free!2245 (not b_next!2245))))

(declare-fun tp!8968 () Bool)

(declare-fun b_and!5279 () Bool)

(assert (=> b!87676 (= tp!8968 b_and!5279)))

(declare-fun b!87674 () Bool)

(declare-fun b_free!2247 () Bool)

(declare-fun b_next!2247 () Bool)

(assert (=> b!87674 (= b_free!2247 (not b_next!2247))))

(declare-fun tp!8967 () Bool)

(declare-fun b_and!5281 () Bool)

(assert (=> b!87674 (= tp!8967 b_and!5281)))

(declare-fun e!57130 () Bool)

(declare-fun e!57114 () Bool)

(declare-datatypes ((V!3033 0))(
  ( (V!3034 (val!1314 Int)) )
))
(declare-datatypes ((array!4039 0))(
  ( (array!4040 (arr!1923 (Array (_ BitVec 32) (_ BitVec 64))) (size!2168 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!926 0))(
  ( (ValueCellFull!926 (v!2658 V!3033)) (EmptyCell!926) )
))
(declare-datatypes ((array!4041 0))(
  ( (array!4042 (arr!1924 (Array (_ BitVec 32) ValueCell!926)) (size!2169 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!760 0))(
  ( (LongMapFixedSize!761 (defaultEntry!2358 Int) (mask!6396 (_ BitVec 32)) (extraKeys!2193 (_ BitVec 32)) (zeroValue!2248 V!3033) (minValue!2248 V!3033) (_size!429 (_ BitVec 32)) (_keys!4034 array!4039) (_values!2341 array!4041) (_vacant!429 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!760)

(declare-fun tp_is_empty!2539 () Bool)

(declare-fun array_inv!1189 (array!4039) Bool)

(declare-fun array_inv!1190 (array!4041) Bool)

(assert (=> b!87674 (= e!57130 (and tp!8967 tp_is_empty!2539 (array_inv!1189 (_keys!4034 newMap!16)) (array_inv!1190 (_values!2341 newMap!16)) e!57114))))

(declare-fun b!87675 () Bool)

(declare-fun e!57117 () Bool)

(assert (=> b!87675 (= e!57117 tp_is_empty!2539)))

(declare-datatypes ((Cell!560 0))(
  ( (Cell!561 (v!2659 LongMapFixedSize!760)) )
))
(declare-datatypes ((LongMap!560 0))(
  ( (LongMap!561 (underlying!291 Cell!560)) )
))
(declare-fun thiss!992 () LongMap!560)

(declare-fun e!57120 () Bool)

(declare-fun e!57116 () Bool)

(assert (=> b!87676 (= e!57116 (and tp!8968 tp_is_empty!2539 (array_inv!1189 (_keys!4034 (v!2659 (underlying!291 thiss!992)))) (array_inv!1190 (_values!2341 (v!2659 (underlying!291 thiss!992)))) e!57120))))

(declare-fun b!87677 () Bool)

(declare-fun e!57126 () Bool)

(declare-fun mapRes!3420 () Bool)

(assert (=> b!87677 (= e!57114 (and e!57126 mapRes!3420))))

(declare-fun condMapEmpty!3419 () Bool)

(declare-fun mapDefault!3420 () ValueCell!926)

