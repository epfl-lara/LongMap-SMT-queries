; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113268 () Bool)

(assert start!113268)

(declare-fun b_free!31319 () Bool)

(declare-fun b_next!31319 () Bool)

(assert (=> start!113268 (= b_free!31319 (not b_next!31319))))

(declare-fun tp!109762 () Bool)

(declare-fun b_and!50541 () Bool)

(assert (=> start!113268 (= tp!109762 b_and!50541)))

(declare-fun mapNonEmpty!57685 () Bool)

(declare-fun mapRes!57685 () Bool)

(declare-fun tp!109761 () Bool)

(declare-fun e!764873 () Bool)

(assert (=> mapNonEmpty!57685 (= mapRes!57685 (and tp!109761 e!764873))))

(declare-datatypes ((V!54861 0))(
  ( (V!54862 (val!18734 Int)) )
))
(declare-datatypes ((ValueCell!17761 0))(
  ( (ValueCellFull!17761 (v!21382 V!54861)) (EmptyCell!17761) )
))
(declare-fun mapValue!57685 () ValueCell!17761)

(declare-fun mapKey!57685 () (_ BitVec 32))

(declare-fun mapRest!57685 () (Array (_ BitVec 32) ValueCell!17761))

(declare-datatypes ((array!91482 0))(
  ( (array!91483 (arr!44197 (Array (_ BitVec 32) ValueCell!17761)) (size!44747 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91482)

(assert (=> mapNonEmpty!57685 (= (arr!44197 _values!1303) (store mapRest!57685 mapKey!57685 mapValue!57685))))

(declare-fun b!1343919 () Bool)

(declare-fun res!891671 () Bool)

(declare-fun e!764870 () Bool)

(assert (=> b!1343919 (=> (not res!891671) (not e!764870))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91484 0))(
  ( (array!91485 (arr!44198 (Array (_ BitVec 32) (_ BitVec 64))) (size!44748 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91484)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343919 (= res!891671 (and (= (size!44747 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44748 _keys!1571) (size!44747 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343920 () Bool)

(declare-fun e!764869 () Bool)

(declare-fun e!764871 () Bool)

(assert (=> b!1343920 (= e!764869 (and e!764871 mapRes!57685))))

(declare-fun condMapEmpty!57685 () Bool)

(declare-fun mapDefault!57685 () ValueCell!17761)

