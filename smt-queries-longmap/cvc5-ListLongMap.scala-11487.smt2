; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133720 () Bool)

(assert start!133720)

(declare-fun b_free!32083 () Bool)

(declare-fun b_next!32083 () Bool)

(assert (=> start!133720 (= b_free!32083 (not b_next!32083))))

(declare-fun tp!113454 () Bool)

(declare-fun b_and!51653 () Bool)

(assert (=> start!133720 (= tp!113454 b_and!51653)))

(declare-fun b!1563515 () Bool)

(declare-fun res!1068898 () Bool)

(declare-fun e!871402 () Bool)

(assert (=> b!1563515 (=> (not res!1068898) (not e!871402))))

(declare-datatypes ((array!104302 0))(
  ( (array!104303 (arr!50343 (Array (_ BitVec 32) (_ BitVec 64))) (size!50893 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104302)

(declare-datatypes ((List!36523 0))(
  ( (Nil!36520) (Cons!36519 (h!37965 (_ BitVec 64)) (t!51370 List!36523)) )
))
(declare-fun arrayNoDuplicates!0 (array!104302 (_ BitVec 32) List!36523) Bool)

(assert (=> b!1563515 (= res!1068898 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36520))))

(declare-fun b!1563516 () Bool)

(declare-fun e!871398 () Bool)

(declare-fun e!871400 () Bool)

(declare-fun mapRes!59580 () Bool)

(assert (=> b!1563516 (= e!871398 (and e!871400 mapRes!59580))))

(declare-fun condMapEmpty!59580 () Bool)

(declare-datatypes ((V!59945 0))(
  ( (V!59946 (val!19485 Int)) )
))
(declare-datatypes ((ValueCell!18371 0))(
  ( (ValueCellFull!18371 (v!22237 V!59945)) (EmptyCell!18371) )
))
(declare-datatypes ((array!104304 0))(
  ( (array!104305 (arr!50344 (Array (_ BitVec 32) ValueCell!18371)) (size!50894 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104304)

(declare-fun mapDefault!59580 () ValueCell!18371)

