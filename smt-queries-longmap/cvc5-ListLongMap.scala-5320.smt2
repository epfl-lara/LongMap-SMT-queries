; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71160 () Bool)

(assert start!71160)

(declare-fun b_free!13327 () Bool)

(declare-fun b_next!13327 () Bool)

(assert (=> start!71160 (= b_free!13327 (not b_next!13327))))

(declare-fun tp!46740 () Bool)

(declare-fun b_and!22253 () Bool)

(assert (=> start!71160 (= tp!46740 b_and!22253)))

(declare-datatypes ((V!25051 0))(
  ( (V!25052 (val!7566 Int)) )
))
(declare-datatypes ((tuple2!10024 0))(
  ( (tuple2!10025 (_1!5023 (_ BitVec 64)) (_2!5023 V!25051)) )
))
(declare-fun lt!374160 () tuple2!10024)

(declare-datatypes ((List!15822 0))(
  ( (Nil!15819) (Cons!15818 (h!16947 tuple2!10024) (t!22169 List!15822)) )
))
(declare-datatypes ((ListLongMap!8847 0))(
  ( (ListLongMap!8848 (toList!4439 List!15822)) )
))
(declare-fun lt!374151 () ListLongMap!8847)

(declare-fun e!460308 () Bool)

(declare-fun zeroValueAfter!34 () V!25051)

(declare-fun lt!374153 () ListLongMap!8847)

(declare-fun b!826574 () Bool)

(declare-fun +!1946 (ListLongMap!8847 tuple2!10024) ListLongMap!8847)

(assert (=> b!826574 (= e!460308 (= lt!374153 (+!1946 (+!1946 lt!374151 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374160)))))

(declare-fun b!826575 () Bool)

(declare-fun e!460311 () Bool)

(declare-fun tp_is_empty!15037 () Bool)

(assert (=> b!826575 (= e!460311 tp_is_empty!15037)))

(declare-fun b!826576 () Bool)

(declare-fun e!460312 () Bool)

(declare-fun mapRes!24181 () Bool)

(assert (=> b!826576 (= e!460312 (and e!460311 mapRes!24181))))

(declare-fun condMapEmpty!24181 () Bool)

(declare-datatypes ((ValueCell!7103 0))(
  ( (ValueCellFull!7103 (v!10000 V!25051)) (EmptyCell!7103) )
))
(declare-datatypes ((array!46254 0))(
  ( (array!46255 (arr!22172 (Array (_ BitVec 32) ValueCell!7103)) (size!22593 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46254)

(declare-fun mapDefault!24181 () ValueCell!7103)

