; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8722 () Bool)

(assert start!8722)

(declare-fun b!60541 () Bool)

(declare-fun b_free!1981 () Bool)

(declare-fun b_next!1981 () Bool)

(assert (=> b!60541 (= b_free!1981 (not b_next!1981))))

(declare-fun tp!8065 () Bool)

(declare-fun b_and!3683 () Bool)

(assert (=> b!60541 (= tp!8065 b_and!3683)))

(declare-fun b!60539 () Bool)

(declare-fun b_free!1983 () Bool)

(declare-fun b_next!1983 () Bool)

(assert (=> b!60539 (= b_free!1983 (not b_next!1983))))

(declare-fun tp!8064 () Bool)

(declare-fun b_and!3685 () Bool)

(assert (=> b!60539 (= tp!8064 b_and!3685)))

(declare-fun b!60531 () Bool)

(declare-fun e!39802 () Bool)

(declare-fun e!39804 () Bool)

(declare-fun mapRes!2911 () Bool)

(assert (=> b!60531 (= e!39802 (and e!39804 mapRes!2911))))

(declare-fun condMapEmpty!2911 () Bool)

(declare-datatypes ((V!2857 0))(
  ( (V!2858 (val!1248 Int)) )
))
(declare-datatypes ((array!3743 0))(
  ( (array!3744 (arr!1791 (Array (_ BitVec 32) (_ BitVec 64))) (size!2022 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!860 0))(
  ( (ValueCellFull!860 (v!2401 V!2857)) (EmptyCell!860) )
))
(declare-datatypes ((array!3745 0))(
  ( (array!3746 (arr!1792 (Array (_ BitVec 32) ValueCell!860)) (size!2023 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!628 0))(
  ( (LongMapFixedSize!629 (defaultEntry!2066 Int) (mask!5962 (_ BitVec 32)) (extraKeys!1949 (_ BitVec 32)) (zeroValue!1980 V!2857) (minValue!1980 V!2857) (_size!363 (_ BitVec 32)) (_keys!3694 array!3743) (_values!2049 array!3745) (_vacant!363 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!438 0))(
  ( (Cell!439 (v!2402 LongMapFixedSize!628)) )
))
(declare-datatypes ((LongMap!438 0))(
  ( (LongMap!439 (underlying!230 Cell!438)) )
))
(declare-fun thiss!992 () LongMap!438)

(declare-fun mapDefault!2911 () ValueCell!860)

