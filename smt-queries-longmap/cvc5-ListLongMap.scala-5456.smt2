; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72520 () Bool)

(assert start!72520)

(declare-fun b_free!13705 () Bool)

(declare-fun b_next!13705 () Bool)

(assert (=> start!72520 (= b_free!13705 (not b_next!13705))))

(declare-fun tp!48213 () Bool)

(declare-fun b_and!22791 () Bool)

(assert (=> start!72520 (= tp!48213 b_and!22791)))

(declare-fun b!841559 () Bool)

(declare-fun e!469462 () Bool)

(declare-datatypes ((V!25809 0))(
  ( (V!25810 (val!7833 Int)) )
))
(declare-datatypes ((tuple2!10396 0))(
  ( (tuple2!10397 (_1!5209 (_ BitVec 64)) (_2!5209 V!25809)) )
))
(declare-datatypes ((List!16176 0))(
  ( (Nil!16173) (Cons!16172 (h!17303 tuple2!10396) (t!22547 List!16176)) )
))
(declare-datatypes ((ListLongMap!9165 0))(
  ( (ListLongMap!9166 (toList!4598 List!16176)) )
))
(declare-fun call!37349 () ListLongMap!9165)

(declare-fun call!37348 () ListLongMap!9165)

(assert (=> b!841559 (= e!469462 (= call!37349 call!37348))))

(declare-fun b!841560 () Bool)

(declare-fun e!469459 () Bool)

(declare-fun e!469458 () Bool)

(declare-fun mapRes!24956 () Bool)

(assert (=> b!841560 (= e!469459 (and e!469458 mapRes!24956))))

(declare-fun condMapEmpty!24956 () Bool)

(declare-datatypes ((ValueCell!7346 0))(
  ( (ValueCellFull!7346 (v!10258 V!25809)) (EmptyCell!7346) )
))
(declare-datatypes ((array!47420 0))(
  ( (array!47421 (arr!22741 (Array (_ BitVec 32) ValueCell!7346)) (size!23181 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47420)

(declare-fun mapDefault!24956 () ValueCell!7346)

