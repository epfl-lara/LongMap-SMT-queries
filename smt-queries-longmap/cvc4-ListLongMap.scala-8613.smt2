; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104926 () Bool)

(assert start!104926)

(declare-fun b_free!26717 () Bool)

(declare-fun b_next!26717 () Bool)

(assert (=> start!104926 (= b_free!26717 (not b_next!26717))))

(declare-fun tp!93644 () Bool)

(declare-fun b_and!44493 () Bool)

(assert (=> start!104926 (= tp!93644 b_and!44493)))

(declare-fun b!1250672 () Bool)

(declare-fun res!834226 () Bool)

(declare-fun e!710061 () Bool)

(assert (=> b!1250672 (=> (not res!834226) (not e!710061))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((array!80904 0))(
  ( (array!80905 (arr!39018 (Array (_ BitVec 32) (_ BitVec 64))) (size!39554 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80904)

(declare-datatypes ((V!47523 0))(
  ( (V!47524 (val!15872 Int)) )
))
(declare-datatypes ((ValueCell!15046 0))(
  ( (ValueCellFull!15046 (v!18568 V!47523)) (EmptyCell!15046) )
))
(declare-datatypes ((array!80906 0))(
  ( (array!80907 (arr!39019 (Array (_ BitVec 32) ValueCell!15046)) (size!39555 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80906)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250672 (= res!834226 (and (= (size!39555 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39554 _keys!1118) (size!39555 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250673 () Bool)

(declare-fun e!710059 () Bool)

(declare-fun tp_is_empty!31619 () Bool)

(assert (=> b!1250673 (= e!710059 tp_is_empty!31619)))

(declare-fun b!1250674 () Bool)

(declare-fun e!710062 () Bool)

(assert (=> b!1250674 (= e!710062 (bvsle #b00000000000000000000000000000000 (size!39554 _keys!1118)))))

(declare-datatypes ((tuple2!20454 0))(
  ( (tuple2!20455 (_1!10238 (_ BitVec 64)) (_2!10238 V!47523)) )
))
(declare-datatypes ((List!27693 0))(
  ( (Nil!27690) (Cons!27689 (h!28898 tuple2!20454) (t!41166 List!27693)) )
))
(declare-datatypes ((ListLongMap!18327 0))(
  ( (ListLongMap!18328 (toList!9179 List!27693)) )
))
(declare-fun lt!564359 () ListLongMap!18327)

(declare-fun -!2003 (ListLongMap!18327 (_ BitVec 64)) ListLongMap!18327)

(assert (=> b!1250674 (= (-!2003 lt!564359 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564359)))

(declare-datatypes ((Unit!41547 0))(
  ( (Unit!41548) )
))
(declare-fun lt!564360 () Unit!41547)

(declare-fun removeNotPresentStillSame!98 (ListLongMap!18327 (_ BitVec 64)) Unit!41547)

(assert (=> b!1250674 (= lt!564360 (removeNotPresentStillSame!98 lt!564359 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250675 () Bool)

(declare-fun e!710060 () Bool)

(assert (=> b!1250675 (= e!710060 e!710062)))

(declare-fun res!834227 () Bool)

(assert (=> b!1250675 (=> res!834227 e!710062)))

(declare-fun contains!7492 (ListLongMap!18327 (_ BitVec 64)) Bool)

(assert (=> b!1250675 (= res!834227 (contains!7492 lt!564359 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47523)

(declare-fun minValueBefore!43 () V!47523)

(declare-fun getCurrentListMap!4453 (array!80904 array!80906 (_ BitVec 32) (_ BitVec 32) V!47523 V!47523 (_ BitVec 32) Int) ListLongMap!18327)

(assert (=> b!1250675 (= lt!564359 (getCurrentListMap!4453 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250676 () Bool)

(declare-fun res!834224 () Bool)

(assert (=> b!1250676 (=> (not res!834224) (not e!710061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80904 (_ BitVec 32)) Bool)

(assert (=> b!1250676 (= res!834224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250677 () Bool)

(declare-fun res!834225 () Bool)

(assert (=> b!1250677 (=> (not res!834225) (not e!710061))))

(declare-datatypes ((List!27694 0))(
  ( (Nil!27691) (Cons!27690 (h!28899 (_ BitVec 64)) (t!41167 List!27694)) )
))
(declare-fun arrayNoDuplicates!0 (array!80904 (_ BitVec 32) List!27694) Bool)

(assert (=> b!1250677 (= res!834225 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27691))))

(declare-fun b!1250678 () Bool)

(declare-fun e!710057 () Bool)

(assert (=> b!1250678 (= e!710057 tp_is_empty!31619)))

(declare-fun mapIsEmpty!49192 () Bool)

(declare-fun mapRes!49192 () Bool)

(assert (=> mapIsEmpty!49192 mapRes!49192))

(declare-fun b!1250679 () Bool)

(declare-fun e!710063 () Bool)

(assert (=> b!1250679 (= e!710063 (and e!710057 mapRes!49192))))

(declare-fun condMapEmpty!49192 () Bool)

(declare-fun mapDefault!49192 () ValueCell!15046)

