; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112582 () Bool)

(assert start!112582)

(declare-fun b_free!30977 () Bool)

(declare-fun b_next!30977 () Bool)

(assert (=> start!112582 (= b_free!30977 (not b_next!30977))))

(declare-fun tp!108568 () Bool)

(declare-fun b_and!49885 () Bool)

(assert (=> start!112582 (= tp!108568 b_and!49885)))

(declare-fun b!1335497 () Bool)

(declare-fun e!760609 () Bool)

(declare-fun e!760608 () Bool)

(declare-fun mapRes!57004 () Bool)

(assert (=> b!1335497 (= e!760609 (and e!760608 mapRes!57004))))

(declare-fun condMapEmpty!57004 () Bool)

(declare-datatypes ((V!54285 0))(
  ( (V!54286 (val!18518 Int)) )
))
(declare-datatypes ((ValueCell!17545 0))(
  ( (ValueCellFull!17545 (v!21155 V!54285)) (EmptyCell!17545) )
))
(declare-datatypes ((array!90634 0))(
  ( (array!90635 (arr!43783 (Array (_ BitVec 32) ValueCell!17545)) (size!44333 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90634)

(declare-fun mapDefault!57004 () ValueCell!17545)

