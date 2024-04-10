; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132086 () Bool)

(assert start!132086)

(declare-fun b_free!31799 () Bool)

(declare-fun b_next!31799 () Bool)

(assert (=> start!132086 (= b_free!31799 (not b_next!31799))))

(declare-fun tp!111648 () Bool)

(declare-fun b_and!51209 () Bool)

(assert (=> start!132086 (= tp!111648 b_and!51209)))

(declare-fun b!1548617 () Bool)

(declare-datatypes ((V!59209 0))(
  ( (V!59210 (val!19115 Int)) )
))
(declare-datatypes ((tuple2!24608 0))(
  ( (tuple2!24609 (_1!12315 (_ BitVec 64)) (_2!12315 V!59209)) )
))
(declare-datatypes ((List!36099 0))(
  ( (Nil!36096) (Cons!36095 (h!37540 tuple2!24608) (t!50793 List!36099)) )
))
(declare-datatypes ((ListLongMap!22217 0))(
  ( (ListLongMap!22218 (toList!11124 List!36099)) )
))
(declare-fun e!862015 () ListLongMap!22217)

(declare-fun e!862009 () ListLongMap!22217)

(assert (=> b!1548617 (= e!862015 e!862009)))

(declare-fun c!142225 () Bool)

(declare-fun lt!667398 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548617 (= c!142225 (and (not lt!667398) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548618 () Bool)

(declare-fun e!862014 () Bool)

(declare-fun e!862012 () Bool)

(declare-fun mapRes!58816 () Bool)

(assert (=> b!1548618 (= e!862014 (and e!862012 mapRes!58816))))

(declare-fun condMapEmpty!58816 () Bool)

(declare-datatypes ((ValueCell!18127 0))(
  ( (ValueCellFull!18127 (v!21916 V!59209)) (EmptyCell!18127) )
))
(declare-datatypes ((array!103350 0))(
  ( (array!103351 (arr!49877 (Array (_ BitVec 32) ValueCell!18127)) (size!50427 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103350)

(declare-fun mapDefault!58816 () ValueCell!18127)

