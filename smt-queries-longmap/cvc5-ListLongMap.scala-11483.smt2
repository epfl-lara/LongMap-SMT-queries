; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133696 () Bool)

(assert start!133696)

(declare-fun b_free!32059 () Bool)

(declare-fun b_next!32059 () Bool)

(assert (=> start!133696 (= b_free!32059 (not b_next!32059))))

(declare-fun tp!113381 () Bool)

(declare-fun b_and!51629 () Bool)

(assert (=> start!133696 (= tp!113381 b_and!51629)))

(declare-fun b!1563155 () Bool)

(declare-fun res!1068645 () Bool)

(declare-fun e!871184 () Bool)

(assert (=> b!1563155 (=> (not res!1068645) (not e!871184))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104256 0))(
  ( (array!104257 (arr!50320 (Array (_ BitVec 32) (_ BitVec 64))) (size!50870 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104256)

(declare-datatypes ((V!59913 0))(
  ( (V!59914 (val!19473 Int)) )
))
(declare-datatypes ((ValueCell!18359 0))(
  ( (ValueCellFull!18359 (v!22225 V!59913)) (EmptyCell!18359) )
))
(declare-datatypes ((array!104258 0))(
  ( (array!104259 (arr!50321 (Array (_ BitVec 32) ValueCell!18359)) (size!50871 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104258)

(assert (=> b!1563155 (= res!1068645 (and (= (size!50871 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50870 _keys!637) (size!50871 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563156 () Bool)

(declare-fun e!871181 () Bool)

(assert (=> b!1563156 (= e!871181 false)))

(declare-fun lt!671831 () Bool)

(declare-datatypes ((tuple2!25124 0))(
  ( (tuple2!25125 (_1!12573 (_ BitVec 64)) (_2!12573 V!59913)) )
))
(declare-datatypes ((List!36509 0))(
  ( (Nil!36506) (Cons!36505 (h!37951 tuple2!25124) (t!51356 List!36509)) )
))
(declare-datatypes ((ListLongMap!22559 0))(
  ( (ListLongMap!22560 (toList!11295 List!36509)) )
))
(declare-fun lt!671832 () ListLongMap!22559)

(declare-fun contains!10285 (ListLongMap!22559 (_ BitVec 64)) Bool)

(assert (=> b!1563156 (= lt!671831 (contains!10285 lt!671832 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563157 () Bool)

(declare-fun res!1068646 () Bool)

(assert (=> b!1563157 (=> (not res!1068646) (not e!871184))))

(declare-datatypes ((List!36510 0))(
  ( (Nil!36507) (Cons!36506 (h!37952 (_ BitVec 64)) (t!51357 List!36510)) )
))
(declare-fun arrayNoDuplicates!0 (array!104256 (_ BitVec 32) List!36510) Bool)

(assert (=> b!1563157 (= res!1068646 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36507))))

(declare-fun b!1563158 () Bool)

(declare-fun e!871183 () Bool)

(declare-fun e!871185 () Bool)

(declare-fun mapRes!59544 () Bool)

(assert (=> b!1563158 (= e!871183 (and e!871185 mapRes!59544))))

(declare-fun condMapEmpty!59544 () Bool)

(declare-fun mapDefault!59544 () ValueCell!18359)

