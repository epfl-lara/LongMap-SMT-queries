; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133574 () Bool)

(assert start!133574)

(declare-fun b_free!31991 () Bool)

(declare-fun b_next!31991 () Bool)

(assert (=> start!133574 (= b_free!31991 (not b_next!31991))))

(declare-fun tp!113097 () Bool)

(declare-fun b_and!51493 () Bool)

(assert (=> start!133574 (= tp!113097 b_and!51493)))

(declare-fun b!1561645 () Bool)

(declare-fun res!1067755 () Bool)

(declare-fun e!870258 () Bool)

(assert (=> b!1561645 (=> (not res!1067755) (not e!870258))))

(declare-datatypes ((array!104032 0))(
  ( (array!104033 (arr!50208 (Array (_ BitVec 32) (_ BitVec 64))) (size!50758 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104032)

(declare-datatypes ((List!36450 0))(
  ( (Nil!36447) (Cons!36446 (h!37892 (_ BitVec 64)) (t!51231 List!36450)) )
))
(declare-fun arrayNoDuplicates!0 (array!104032 (_ BitVec 32) List!36450) Bool)

(assert (=> b!1561645 (= res!1067755 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36447))))

(declare-fun b!1561646 () Bool)

(declare-fun res!1067752 () Bool)

(assert (=> b!1561646 (=> (not res!1067752) (not e!870258))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1561646 (= res!1067752 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50758 _keys!637)) (bvslt from!782 (size!50758 _keys!637))))))

(declare-fun res!1067754 () Bool)

(assert (=> start!133574 (=> (not res!1067754) (not e!870258))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133574 (= res!1067754 (validMask!0 mask!947))))

(assert (=> start!133574 e!870258))

(assert (=> start!133574 tp!113097))

(declare-fun tp_is_empty!38657 () Bool)

(assert (=> start!133574 tp_is_empty!38657))

(assert (=> start!133574 true))

(declare-fun array_inv!39027 (array!104032) Bool)

(assert (=> start!133574 (array_inv!39027 _keys!637)))

(declare-datatypes ((V!59749 0))(
  ( (V!59750 (val!19412 Int)) )
))
(declare-datatypes ((ValueCell!18298 0))(
  ( (ValueCellFull!18298 (v!22164 V!59749)) (EmptyCell!18298) )
))
(declare-datatypes ((array!104034 0))(
  ( (array!104035 (arr!50209 (Array (_ BitVec 32) ValueCell!18298)) (size!50759 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104034)

(declare-fun e!870259 () Bool)

(declare-fun array_inv!39028 (array!104034) Bool)

(assert (=> start!133574 (and (array_inv!39028 _values!487) e!870259)))

(declare-fun b!1561647 () Bool)

(declare-fun res!1067757 () Bool)

(assert (=> b!1561647 (=> (not res!1067757) (not e!870258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104032 (_ BitVec 32)) Bool)

(assert (=> b!1561647 (= res!1067757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59361 () Bool)

(declare-fun mapRes!59361 () Bool)

(declare-fun tp!113096 () Bool)

(declare-fun e!870257 () Bool)

(assert (=> mapNonEmpty!59361 (= mapRes!59361 (and tp!113096 e!870257))))

(declare-fun mapKey!59361 () (_ BitVec 32))

(declare-fun mapRest!59361 () (Array (_ BitVec 32) ValueCell!18298))

(declare-fun mapValue!59361 () ValueCell!18298)

(assert (=> mapNonEmpty!59361 (= (arr!50209 _values!487) (store mapRest!59361 mapKey!59361 mapValue!59361))))

(declare-fun b!1561648 () Bool)

(declare-fun e!870256 () Bool)

(assert (=> b!1561648 (= e!870259 (and e!870256 mapRes!59361))))

(declare-fun condMapEmpty!59361 () Bool)

(declare-fun mapDefault!59361 () ValueCell!18298)

