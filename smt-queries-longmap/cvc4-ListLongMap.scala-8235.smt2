; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100322 () Bool)

(assert start!100322)

(declare-fun b_free!25709 () Bool)

(declare-fun b_next!25709 () Bool)

(assert (=> start!100322 (= b_free!25709 (not b_next!25709))))

(declare-fun tp!90074 () Bool)

(declare-fun b_and!42289 () Bool)

(assert (=> start!100322 (= tp!90074 b_and!42289)))

(declare-fun b!1197313 () Bool)

(declare-fun e!680184 () Bool)

(declare-datatypes ((V!45645 0))(
  ( (V!45646 (val!15251 Int)) )
))
(declare-datatypes ((tuple2!19524 0))(
  ( (tuple2!19525 (_1!9773 (_ BitVec 64)) (_2!9773 V!45645)) )
))
(declare-datatypes ((List!26333 0))(
  ( (Nil!26330) (Cons!26329 (h!27538 tuple2!19524) (t!39034 List!26333)) )
))
(declare-datatypes ((ListLongMap!17493 0))(
  ( (ListLongMap!17494 (toList!8762 List!26333)) )
))
(declare-fun call!57248 () ListLongMap!17493)

(declare-fun call!57249 () ListLongMap!17493)

(assert (=> b!1197313 (= e!680184 (= call!57248 call!57249))))

(declare-fun b!1197314 () Bool)

(declare-fun e!680188 () Bool)

(declare-fun tp_is_empty!30389 () Bool)

(assert (=> b!1197314 (= e!680188 tp_is_empty!30389)))

(declare-fun b!1197315 () Bool)

(declare-fun e!680191 () Bool)

(declare-fun e!680189 () Bool)

(declare-fun mapRes!47420 () Bool)

(assert (=> b!1197315 (= e!680191 (and e!680189 mapRes!47420))))

(declare-fun condMapEmpty!47420 () Bool)

(declare-datatypes ((ValueCell!14485 0))(
  ( (ValueCellFull!14485 (v!17889 V!45645)) (EmptyCell!14485) )
))
(declare-datatypes ((array!77557 0))(
  ( (array!77558 (arr!37425 (Array (_ BitVec 32) ValueCell!14485)) (size!37961 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77557)

(declare-fun mapDefault!47420 () ValueCell!14485)

