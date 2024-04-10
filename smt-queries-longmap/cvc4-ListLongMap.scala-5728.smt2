; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74168 () Bool)

(assert start!74168)

(declare-fun b!872467 () Bool)

(declare-fun e!485859 () Bool)

(declare-fun tp_is_empty!17207 () Bool)

(assert (=> b!872467 (= e!485859 tp_is_empty!17207)))

(declare-fun b!872468 () Bool)

(declare-fun res!592972 () Bool)

(declare-fun e!485856 () Bool)

(assert (=> b!872468 (=> (not res!592972) (not e!485856))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872468 (= res!592972 (validMask!0 mask!1196))))

(declare-fun b!872469 () Bool)

(assert (=> b!872469 (= e!485856 false)))

(declare-fun lt!395626 () Bool)

(declare-datatypes ((array!50548 0))(
  ( (array!50549 (arr!24304 (Array (_ BitVec 32) (_ BitVec 64))) (size!24744 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50548)

(declare-datatypes ((List!17263 0))(
  ( (Nil!17260) (Cons!17259 (h!18390 (_ BitVec 64)) (t!24300 List!17263)) )
))
(declare-fun arrayNoDuplicates!0 (array!50548 (_ BitVec 32) List!17263) Bool)

(assert (=> b!872469 (= lt!395626 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17260))))

(declare-fun b!872470 () Bool)

(declare-fun e!485858 () Bool)

(declare-fun e!485860 () Bool)

(declare-fun mapRes!27413 () Bool)

(assert (=> b!872470 (= e!485858 (and e!485860 mapRes!27413))))

(declare-fun condMapEmpty!27413 () Bool)

(declare-datatypes ((V!27989 0))(
  ( (V!27990 (val!8651 Int)) )
))
(declare-datatypes ((ValueCell!8164 0))(
  ( (ValueCellFull!8164 (v!11076 V!27989)) (EmptyCell!8164) )
))
(declare-datatypes ((array!50550 0))(
  ( (array!50551 (arr!24305 (Array (_ BitVec 32) ValueCell!8164)) (size!24745 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50550)

(declare-fun mapDefault!27413 () ValueCell!8164)

