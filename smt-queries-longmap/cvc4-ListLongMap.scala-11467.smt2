; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133604 () Bool)

(assert start!133604)

(declare-fun b_free!32021 () Bool)

(declare-fun b_next!32021 () Bool)

(assert (=> start!133604 (= b_free!32021 (not b_next!32021))))

(declare-fun tp!113186 () Bool)

(declare-fun b_and!51553 () Bool)

(assert (=> start!133604 (= tp!113186 b_and!51553)))

(declare-fun b!1562090 () Bool)

(declare-fun e!870493 () Bool)

(declare-fun tp_is_empty!38687 () Bool)

(assert (=> b!1562090 (= e!870493 tp_is_empty!38687)))

(declare-fun b!1562091 () Bool)

(declare-fun res!1068032 () Bool)

(declare-fun e!870490 () Bool)

(assert (=> b!1562091 (=> (not res!1068032) (not e!870490))))

(declare-datatypes ((array!104092 0))(
  ( (array!104093 (arr!50238 (Array (_ BitVec 32) (_ BitVec 64))) (size!50788 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104092)

(declare-datatypes ((List!36469 0))(
  ( (Nil!36466) (Cons!36465 (h!37911 (_ BitVec 64)) (t!51280 List!36469)) )
))
(declare-fun arrayNoDuplicates!0 (array!104092 (_ BitVec 32) List!36469) Bool)

(assert (=> b!1562091 (= res!1068032 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36466))))

(declare-fun mapIsEmpty!59406 () Bool)

(declare-fun mapRes!59406 () Bool)

(assert (=> mapIsEmpty!59406 mapRes!59406))

(declare-fun b!1562092 () Bool)

(declare-fun res!1068036 () Bool)

(assert (=> b!1562092 (=> (not res!1068036) (not e!870490))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562092 (= res!1068036 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50788 _keys!637)) (bvslt from!782 (size!50788 _keys!637))))))

(declare-fun b!1562093 () Bool)

(declare-fun res!1068031 () Bool)

(assert (=> b!1562093 (=> (not res!1068031) (not e!870490))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104092 (_ BitVec 32)) Bool)

(assert (=> b!1562093 (= res!1068031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562094 () Bool)

(declare-fun res!1068033 () Bool)

(assert (=> b!1562094 (=> (not res!1068033) (not e!870490))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59789 0))(
  ( (V!59790 (val!19427 Int)) )
))
(declare-datatypes ((ValueCell!18313 0))(
  ( (ValueCellFull!18313 (v!22179 V!59789)) (EmptyCell!18313) )
))
(declare-datatypes ((array!104094 0))(
  ( (array!104095 (arr!50239 (Array (_ BitVec 32) ValueCell!18313)) (size!50789 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104094)

(assert (=> b!1562094 (= res!1068033 (and (= (size!50789 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50788 _keys!637) (size!50789 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068034 () Bool)

(assert (=> start!133604 (=> (not res!1068034) (not e!870490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133604 (= res!1068034 (validMask!0 mask!947))))

(assert (=> start!133604 e!870490))

(assert (=> start!133604 tp!113186))

(assert (=> start!133604 tp_is_empty!38687))

(assert (=> start!133604 true))

(declare-fun array_inv!39049 (array!104092) Bool)

(assert (=> start!133604 (array_inv!39049 _keys!637)))

(declare-fun e!870491 () Bool)

(declare-fun array_inv!39050 (array!104094) Bool)

(assert (=> start!133604 (and (array_inv!39050 _values!487) e!870491)))

(declare-fun b!1562089 () Bool)

(declare-fun res!1068035 () Bool)

(assert (=> b!1562089 (=> (not res!1068035) (not e!870490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562089 (= res!1068035 (validKeyInArray!0 (select (arr!50238 _keys!637) from!782)))))

(declare-fun b!1562095 () Bool)

(declare-fun e!870489 () Bool)

(assert (=> b!1562095 (= e!870491 (and e!870489 mapRes!59406))))

(declare-fun condMapEmpty!59406 () Bool)

(declare-fun mapDefault!59406 () ValueCell!18313)

