; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133944 () Bool)

(assert start!133944)

(declare-fun b_free!32167 () Bool)

(declare-fun b_next!32167 () Bool)

(assert (=> start!133944 (= b_free!32167 (not b_next!32167))))

(declare-fun tp!113803 () Bool)

(declare-fun b_and!51775 () Bool)

(assert (=> start!133944 (= tp!113803 b_and!51775)))

(declare-fun b!1565784 () Bool)

(declare-fun res!1070316 () Bool)

(declare-fun e!872745 () Bool)

(assert (=> b!1565784 (=> (not res!1070316) (not e!872745))))

(declare-datatypes ((array!104572 0))(
  ( (array!104573 (arr!50473 (Array (_ BitVec 32) (_ BitVec 64))) (size!51023 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104572)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104572 (_ BitVec 32)) Bool)

(assert (=> b!1565784 (= res!1070316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565785 () Bool)

(declare-fun res!1070315 () Bool)

(assert (=> b!1565785 (=> (not res!1070315) (not e!872745))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60129 0))(
  ( (V!60130 (val!19554 Int)) )
))
(declare-datatypes ((ValueCell!18440 0))(
  ( (ValueCellFull!18440 (v!22310 V!60129)) (EmptyCell!18440) )
))
(declare-datatypes ((array!104574 0))(
  ( (array!104575 (arr!50474 (Array (_ BitVec 32) ValueCell!18440)) (size!51024 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104574)

(assert (=> b!1565785 (= res!1070315 (and (= (size!51024 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51023 _keys!637) (size!51024 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565786 () Bool)

(declare-fun e!872748 () Bool)

(declare-fun e!872747 () Bool)

(declare-fun mapRes!59803 () Bool)

(assert (=> b!1565786 (= e!872748 (and e!872747 mapRes!59803))))

(declare-fun condMapEmpty!59803 () Bool)

(declare-fun mapDefault!59803 () ValueCell!18440)

