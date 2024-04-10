; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8274 () Bool)

(assert start!8274)

(declare-fun b!53292 () Bool)

(declare-fun b_free!1713 () Bool)

(declare-fun b_next!1713 () Bool)

(assert (=> b!53292 (= b_free!1713 (not b_next!1713))))

(declare-fun tp!7242 () Bool)

(declare-fun b_and!2967 () Bool)

(assert (=> b!53292 (= tp!7242 b_and!2967)))

(declare-fun b!53288 () Bool)

(declare-fun b_free!1715 () Bool)

(declare-fun b_next!1715 () Bool)

(assert (=> b!53288 (= b_free!1715 (not b_next!1715))))

(declare-fun tp!7241 () Bool)

(declare-fun b_and!2969 () Bool)

(assert (=> b!53288 (= tp!7241 b_and!2969)))

(declare-fun b!53275 () Bool)

(declare-fun e!34750 () Bool)

(declare-fun tp_is_empty!2273 () Bool)

(assert (=> b!53275 (= e!34750 tp_is_empty!2273)))

(declare-fun b!53276 () Bool)

(declare-fun e!34747 () Bool)

(declare-fun mapRes!2489 () Bool)

(assert (=> b!53276 (= e!34747 (and e!34750 mapRes!2489))))

(declare-fun condMapEmpty!2489 () Bool)

(declare-datatypes ((V!2677 0))(
  ( (V!2678 (val!1181 Int)) )
))
(declare-datatypes ((array!3469 0))(
  ( (array!3470 (arr!1657 (Array (_ BitVec 32) (_ BitVec 64))) (size!1886 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!793 0))(
  ( (ValueCellFull!793 (v!2251 V!2677)) (EmptyCell!793) )
))
(declare-datatypes ((array!3471 0))(
  ( (array!3472 (arr!1658 (Array (_ BitVec 32) ValueCell!793)) (size!1887 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!494 0))(
  ( (LongMapFixedSize!495 (defaultEntry!1961 Int) (mask!5794 (_ BitVec 32)) (extraKeys!1852 (_ BitVec 32)) (zeroValue!1879 V!2677) (minValue!1879 V!2677) (_size!296 (_ BitVec 32)) (_keys!3581 array!3469) (_values!1944 array!3471) (_vacant!296 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!494)

(declare-fun mapDefault!2489 () ValueCell!793)

