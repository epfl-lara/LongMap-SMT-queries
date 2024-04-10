; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133868 () Bool)

(assert start!133868)

(declare-fun b_free!32129 () Bool)

(declare-fun b_next!32129 () Bool)

(assert (=> start!133868 (= b_free!32129 (not b_next!32129))))

(declare-fun tp!113682 () Bool)

(declare-fun b_and!51699 () Bool)

(assert (=> start!133868 (= tp!113682 b_and!51699)))

(declare-fun b!1565052 () Bool)

(declare-fun e!872335 () Bool)

(declare-fun tp_is_empty!38903 () Bool)

(assert (=> b!1565052 (= e!872335 tp_is_empty!38903)))

(declare-fun b!1565053 () Bool)

(declare-fun res!1069895 () Bool)

(declare-fun e!872331 () Bool)

(assert (=> b!1565053 (=> (not res!1069895) (not e!872331))))

(declare-datatypes ((array!104494 0))(
  ( (array!104495 (arr!50436 (Array (_ BitVec 32) (_ BitVec 64))) (size!50986 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104494)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104494 (_ BitVec 32)) Bool)

(assert (=> b!1565053 (= res!1069895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565054 () Bool)

(declare-fun res!1069896 () Bool)

(assert (=> b!1565054 (=> (not res!1069896) (not e!872331))))

(declare-datatypes ((List!36591 0))(
  ( (Nil!36588) (Cons!36587 (h!38033 (_ BitVec 64)) (t!51438 List!36591)) )
))
(declare-fun arrayNoDuplicates!0 (array!104494 (_ BitVec 32) List!36591) Bool)

(assert (=> b!1565054 (= res!1069896 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36588))))

(declare-fun res!1069897 () Bool)

(assert (=> start!133868 (=> (not res!1069897) (not e!872331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133868 (= res!1069897 (validMask!0 mask!947))))

(assert (=> start!133868 e!872331))

(assert (=> start!133868 tp!113682))

(assert (=> start!133868 tp_is_empty!38903))

(assert (=> start!133868 true))

(declare-fun array_inv!39195 (array!104494) Bool)

(assert (=> start!133868 (array_inv!39195 _keys!637)))

(declare-datatypes ((V!60077 0))(
  ( (V!60078 (val!19535 Int)) )
))
(declare-datatypes ((ValueCell!18421 0))(
  ( (ValueCellFull!18421 (v!22289 V!60077)) (EmptyCell!18421) )
))
(declare-datatypes ((array!104496 0))(
  ( (array!104497 (arr!50437 (Array (_ BitVec 32) ValueCell!18421)) (size!50987 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104496)

(declare-fun e!872334 () Bool)

(declare-fun array_inv!39196 (array!104496) Bool)

(assert (=> start!133868 (and (array_inv!39196 _values!487) e!872334)))

(declare-fun mapNonEmpty!59740 () Bool)

(declare-fun mapRes!59740 () Bool)

(declare-fun tp!113683 () Bool)

(declare-fun e!872332 () Bool)

(assert (=> mapNonEmpty!59740 (= mapRes!59740 (and tp!113683 e!872332))))

(declare-fun mapRest!59740 () (Array (_ BitVec 32) ValueCell!18421))

(declare-fun mapValue!59740 () ValueCell!18421)

(declare-fun mapKey!59740 () (_ BitVec 32))

(assert (=> mapNonEmpty!59740 (= (arr!50437 _values!487) (store mapRest!59740 mapKey!59740 mapValue!59740))))

(declare-fun b!1565055 () Bool)

(assert (=> b!1565055 (= e!872332 tp_is_empty!38903)))

(declare-fun b!1565056 () Bool)

(declare-fun res!1069893 () Bool)

(assert (=> b!1565056 (=> (not res!1069893) (not e!872331))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565056 (= res!1069893 (validKeyInArray!0 (select (arr!50436 _keys!637) from!782)))))

(declare-fun b!1565057 () Bool)

(assert (=> b!1565057 (= e!872334 (and e!872335 mapRes!59740))))

(declare-fun condMapEmpty!59740 () Bool)

(declare-fun mapDefault!59740 () ValueCell!18421)

