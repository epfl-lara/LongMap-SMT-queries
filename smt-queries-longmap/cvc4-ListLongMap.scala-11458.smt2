; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133550 () Bool)

(assert start!133550)

(declare-fun b_free!31967 () Bool)

(declare-fun b_next!31967 () Bool)

(assert (=> start!133550 (= b_free!31967 (not b_next!31967))))

(declare-fun tp!113025 () Bool)

(declare-fun b_and!51445 () Bool)

(assert (=> start!133550 (= tp!113025 b_and!51445)))

(declare-fun b!1561297 () Bool)

(declare-fun e!870075 () Bool)

(declare-fun tp_is_empty!38633 () Bool)

(assert (=> b!1561297 (= e!870075 tp_is_empty!38633)))

(declare-fun b!1561299 () Bool)

(declare-fun res!1067541 () Bool)

(declare-fun e!870079 () Bool)

(assert (=> b!1561299 (=> (not res!1067541) (not e!870079))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103984 0))(
  ( (array!103985 (arr!50184 (Array (_ BitVec 32) (_ BitVec 64))) (size!50734 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103984)

(declare-datatypes ((V!59717 0))(
  ( (V!59718 (val!19400 Int)) )
))
(declare-datatypes ((ValueCell!18286 0))(
  ( (ValueCellFull!18286 (v!22152 V!59717)) (EmptyCell!18286) )
))
(declare-datatypes ((array!103986 0))(
  ( (array!103987 (arr!50185 (Array (_ BitVec 32) ValueCell!18286)) (size!50735 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103986)

(assert (=> b!1561299 (= res!1067541 (and (= (size!50735 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50734 _keys!637) (size!50735 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561300 () Bool)

(declare-fun res!1067538 () Bool)

(assert (=> b!1561300 (=> (not res!1067538) (not e!870079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103984 (_ BitVec 32)) Bool)

(assert (=> b!1561300 (= res!1067538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561301 () Bool)

(declare-fun e!870077 () Bool)

(assert (=> b!1561301 (= e!870077 tp_is_empty!38633)))

(declare-fun b!1561302 () Bool)

(declare-fun res!1067536 () Bool)

(assert (=> b!1561302 (=> (not res!1067536) (not e!870079))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561302 (= res!1067536 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50734 _keys!637)) (bvslt from!782 (size!50734 _keys!637))))))

(declare-fun b!1561303 () Bool)

(declare-fun e!870076 () Bool)

(declare-fun mapRes!59325 () Bool)

(assert (=> b!1561303 (= e!870076 (and e!870075 mapRes!59325))))

(declare-fun condMapEmpty!59325 () Bool)

(declare-fun mapDefault!59325 () ValueCell!18286)

