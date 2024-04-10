; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113186 () Bool)

(assert start!113186)

(declare-fun b_free!31237 () Bool)

(declare-fun b_next!31237 () Bool)

(assert (=> start!113186 (= b_free!31237 (not b_next!31237))))

(declare-fun tp!109515 () Bool)

(declare-fun b_and!50381 () Bool)

(assert (=> start!113186 (= tp!109515 b_and!50381)))

(declare-fun b!1342397 () Bool)

(declare-fun res!890597 () Bool)

(declare-fun e!764258 () Bool)

(assert (=> b!1342397 (=> (not res!890597) (not e!764258))))

(declare-datatypes ((array!91324 0))(
  ( (array!91325 (arr!44118 (Array (_ BitVec 32) (_ BitVec 64))) (size!44668 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91324)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91324 (_ BitVec 32)) Bool)

(assert (=> b!1342397 (= res!890597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342398 () Bool)

(declare-fun res!890598 () Bool)

(assert (=> b!1342398 (=> (not res!890598) (not e!764258))))

(declare-datatypes ((List!31232 0))(
  ( (Nil!31229) (Cons!31228 (h!32437 (_ BitVec 64)) (t!45680 List!31232)) )
))
(declare-fun arrayNoDuplicates!0 (array!91324 (_ BitVec 32) List!31232) Bool)

(assert (=> b!1342398 (= res!890598 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31229))))

(declare-fun b!1342399 () Bool)

(declare-fun res!890601 () Bool)

(assert (=> b!1342399 (=> (not res!890601) (not e!764258))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342399 (= res!890601 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342400 () Bool)

(declare-fun e!764255 () Bool)

(declare-fun e!764256 () Bool)

(declare-fun mapRes!57562 () Bool)

(assert (=> b!1342400 (= e!764255 (and e!764256 mapRes!57562))))

(declare-fun condMapEmpty!57562 () Bool)

(declare-datatypes ((V!54753 0))(
  ( (V!54754 (val!18693 Int)) )
))
(declare-datatypes ((ValueCell!17720 0))(
  ( (ValueCellFull!17720 (v!21341 V!54753)) (EmptyCell!17720) )
))
(declare-datatypes ((array!91326 0))(
  ( (array!91327 (arr!44119 (Array (_ BitVec 32) ValueCell!17720)) (size!44669 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91326)

(declare-fun mapDefault!57562 () ValueCell!17720)

