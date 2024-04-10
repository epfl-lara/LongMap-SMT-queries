; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71178 () Bool)

(assert start!71178)

(declare-fun b_free!13345 () Bool)

(declare-fun b_next!13345 () Bool)

(assert (=> start!71178 (= b_free!13345 (not b_next!13345))))

(declare-fun tp!46794 () Bool)

(declare-fun b_and!22271 () Bool)

(assert (=> start!71178 (= tp!46794 b_and!22271)))

(declare-fun e!460530 () Bool)

(declare-datatypes ((V!25075 0))(
  ( (V!25076 (val!7575 Int)) )
))
(declare-datatypes ((tuple2!10040 0))(
  ( (tuple2!10041 (_1!5031 (_ BitVec 64)) (_2!5031 V!25075)) )
))
(declare-datatypes ((List!15838 0))(
  ( (Nil!15835) (Cons!15834 (h!16963 tuple2!10040) (t!22185 List!15838)) )
))
(declare-datatypes ((ListLongMap!8863 0))(
  ( (ListLongMap!8864 (toList!4447 List!15838)) )
))
(declare-fun lt!374536 () ListLongMap!8863)

(declare-fun zeroValueAfter!34 () V!25075)

(declare-fun lt!374535 () ListLongMap!8863)

(declare-fun b!826846 () Bool)

(declare-fun lt!374537 () tuple2!10040)

(declare-fun +!1954 (ListLongMap!8863 tuple2!10040) ListLongMap!8863)

(assert (=> b!826846 (= e!460530 (= lt!374535 (+!1954 (+!1954 lt!374536 (tuple2!10041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374537)))))

(declare-fun b!826847 () Bool)

(declare-fun e!460529 () Bool)

(declare-fun e!460532 () Bool)

(declare-fun mapRes!24208 () Bool)

(assert (=> b!826847 (= e!460529 (and e!460532 mapRes!24208))))

(declare-fun condMapEmpty!24208 () Bool)

(declare-datatypes ((ValueCell!7112 0))(
  ( (ValueCellFull!7112 (v!10009 V!25075)) (EmptyCell!7112) )
))
(declare-datatypes ((array!46288 0))(
  ( (array!46289 (arr!22189 (Array (_ BitVec 32) ValueCell!7112)) (size!22610 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46288)

(declare-fun mapDefault!24208 () ValueCell!7112)

