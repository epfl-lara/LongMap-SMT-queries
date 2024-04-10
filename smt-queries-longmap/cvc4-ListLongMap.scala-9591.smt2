; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113412 () Bool)

(assert start!113412)

(declare-fun b_free!31463 () Bool)

(declare-fun b_next!31463 () Bool)

(assert (=> start!113412 (= b_free!31463 (not b_next!31463))))

(declare-fun tp!110194 () Bool)

(declare-fun b_and!50751 () Bool)

(assert (=> start!113412 (= tp!110194 b_and!50751)))

(declare-fun b!1346298 () Bool)

(declare-fun res!893336 () Bool)

(declare-fun e!766032 () Bool)

(assert (=> b!1346298 (=> (not res!893336) (not e!766032))))

(declare-datatypes ((array!91762 0))(
  ( (array!91763 (arr!44337 (Array (_ BitVec 32) (_ BitVec 64))) (size!44887 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91762)

(declare-datatypes ((List!31399 0))(
  ( (Nil!31396) (Cons!31395 (h!32604 (_ BitVec 64)) (t!45989 List!31399)) )
))
(declare-fun arrayNoDuplicates!0 (array!91762 (_ BitVec 32) List!31399) Bool)

(assert (=> b!1346298 (= res!893336 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31396))))

(declare-fun b!1346299 () Bool)

(declare-fun res!893337 () Bool)

(assert (=> b!1346299 (=> (not res!893337) (not e!766032))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55053 0))(
  ( (V!55054 (val!18806 Int)) )
))
(declare-datatypes ((ValueCell!17833 0))(
  ( (ValueCellFull!17833 (v!21454 V!55053)) (EmptyCell!17833) )
))
(declare-datatypes ((array!91764 0))(
  ( (array!91765 (arr!44338 (Array (_ BitVec 32) ValueCell!17833)) (size!44888 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91764)

(assert (=> b!1346299 (= res!893337 (and (= (size!44888 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44887 _keys!1571) (size!44888 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57901 () Bool)

(declare-fun mapRes!57901 () Bool)

(assert (=> mapIsEmpty!57901 mapRes!57901))

(declare-fun b!1346300 () Bool)

(declare-fun e!766031 () Bool)

(declare-fun tp_is_empty!37463 () Bool)

(assert (=> b!1346300 (= e!766031 tp_is_empty!37463)))

(declare-fun b!1346301 () Bool)

(declare-fun e!766033 () Bool)

(assert (=> b!1346301 (= e!766033 (and e!766031 mapRes!57901))))

(declare-fun condMapEmpty!57901 () Bool)

(declare-fun mapDefault!57901 () ValueCell!17833)

