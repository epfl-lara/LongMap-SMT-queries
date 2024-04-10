; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133694 () Bool)

(assert start!133694)

(declare-fun b!1563126 () Bool)

(declare-fun e!871168 () Bool)

(declare-fun tp_is_empty!38777 () Bool)

(assert (=> b!1563126 (= e!871168 tp_is_empty!38777)))

(declare-fun b!1563127 () Bool)

(declare-fun res!1068629 () Bool)

(declare-fun e!871167 () Bool)

(assert (=> b!1563127 (=> (not res!1068629) (not e!871167))))

(declare-datatypes ((array!104252 0))(
  ( (array!104253 (arr!50318 (Array (_ BitVec 32) (_ BitVec 64))) (size!50868 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104252)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563127 (= res!1068629 (not (validKeyInArray!0 (select (arr!50318 _keys!637) from!782))))))

(declare-fun b!1563128 () Bool)

(declare-fun res!1068627 () Bool)

(assert (=> b!1563128 (=> (not res!1068627) (not e!871167))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59909 0))(
  ( (V!59910 (val!19472 Int)) )
))
(declare-datatypes ((ValueCell!18358 0))(
  ( (ValueCellFull!18358 (v!22224 V!59909)) (EmptyCell!18358) )
))
(declare-datatypes ((array!104254 0))(
  ( (array!104255 (arr!50319 (Array (_ BitVec 32) ValueCell!18358)) (size!50869 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104254)

(assert (=> b!1563128 (= res!1068627 (and (= (size!50869 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50868 _keys!637) (size!50869 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563129 () Bool)

(declare-fun res!1068630 () Bool)

(assert (=> b!1563129 (=> (not res!1068630) (not e!871167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104252 (_ BitVec 32)) Bool)

(assert (=> b!1563129 (= res!1068630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563130 () Bool)

(assert (=> b!1563130 (= e!871167 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun res!1068625 () Bool)

(assert (=> start!133694 (=> (not res!1068625) (not e!871167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133694 (= res!1068625 (validMask!0 mask!947))))

(assert (=> start!133694 e!871167))

(assert (=> start!133694 true))

(declare-fun array_inv!39109 (array!104252) Bool)

(assert (=> start!133694 (array_inv!39109 _keys!637)))

(declare-fun e!871164 () Bool)

(declare-fun array_inv!39110 (array!104254) Bool)

(assert (=> start!133694 (and (array_inv!39110 _values!487) e!871164)))

(declare-fun b!1563131 () Bool)

(declare-fun res!1068626 () Bool)

(assert (=> b!1563131 (=> (not res!1068626) (not e!871167))))

(assert (=> b!1563131 (= res!1068626 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50868 _keys!637)) (bvslt from!782 (size!50868 _keys!637))))))

(declare-fun mapIsEmpty!59541 () Bool)

(declare-fun mapRes!59541 () Bool)

(assert (=> mapIsEmpty!59541 mapRes!59541))

(declare-fun b!1563132 () Bool)

(declare-fun res!1068628 () Bool)

(assert (=> b!1563132 (=> (not res!1068628) (not e!871167))))

(declare-datatypes ((List!36508 0))(
  ( (Nil!36505) (Cons!36504 (h!37950 (_ BitVec 64)) (t!51355 List!36508)) )
))
(declare-fun arrayNoDuplicates!0 (array!104252 (_ BitVec 32) List!36508) Bool)

(assert (=> b!1563132 (= res!1068628 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36505))))

(declare-fun b!1563133 () Bool)

(declare-fun e!871166 () Bool)

(assert (=> b!1563133 (= e!871166 tp_is_empty!38777)))

(declare-fun mapNonEmpty!59541 () Bool)

(declare-fun tp!113376 () Bool)

(assert (=> mapNonEmpty!59541 (= mapRes!59541 (and tp!113376 e!871168))))

(declare-fun mapValue!59541 () ValueCell!18358)

(declare-fun mapKey!59541 () (_ BitVec 32))

(declare-fun mapRest!59541 () (Array (_ BitVec 32) ValueCell!18358))

(assert (=> mapNonEmpty!59541 (= (arr!50319 _values!487) (store mapRest!59541 mapKey!59541 mapValue!59541))))

(declare-fun b!1563134 () Bool)

(assert (=> b!1563134 (= e!871164 (and e!871166 mapRes!59541))))

(declare-fun condMapEmpty!59541 () Bool)

(declare-fun mapDefault!59541 () ValueCell!18358)

