; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133522 () Bool)

(assert start!133522)

(declare-fun b_free!31939 () Bool)

(declare-fun b_next!31939 () Bool)

(assert (=> start!133522 (= b_free!31939 (not b_next!31939))))

(declare-fun tp!112941 () Bool)

(declare-fun b_and!51395 () Bool)

(assert (=> start!133522 (= tp!112941 b_and!51395)))

(declare-fun b!1560897 () Bool)

(declare-fun res!1067287 () Bool)

(declare-fun e!869869 () Bool)

(assert (=> b!1560897 (=> (not res!1067287) (not e!869869))))

(declare-datatypes ((array!103928 0))(
  ( (array!103929 (arr!50156 (Array (_ BitVec 32) (_ BitVec 64))) (size!50706 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103928)

(declare-datatypes ((List!36412 0))(
  ( (Nil!36409) (Cons!36408 (h!37854 (_ BitVec 64)) (t!51145 List!36412)) )
))
(declare-fun arrayNoDuplicates!0 (array!103928 (_ BitVec 32) List!36412) Bool)

(assert (=> b!1560897 (= res!1067287 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36409))))

(declare-fun b!1560898 () Bool)

(declare-fun res!1067285 () Bool)

(assert (=> b!1560898 (=> (not res!1067285) (not e!869869))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59681 0))(
  ( (V!59682 (val!19386 Int)) )
))
(declare-datatypes ((ValueCell!18272 0))(
  ( (ValueCellFull!18272 (v!22138 V!59681)) (EmptyCell!18272) )
))
(declare-datatypes ((array!103930 0))(
  ( (array!103931 (arr!50157 (Array (_ BitVec 32) ValueCell!18272)) (size!50707 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103930)

(assert (=> b!1560898 (= res!1067285 (and (= (size!50707 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50706 _keys!637) (size!50707 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560899 () Bool)

(declare-fun e!869865 () Bool)

(declare-fun e!869868 () Bool)

(declare-fun mapRes!59283 () Bool)

(assert (=> b!1560899 (= e!869865 (and e!869868 mapRes!59283))))

(declare-fun condMapEmpty!59283 () Bool)

(declare-fun mapDefault!59283 () ValueCell!18272)

