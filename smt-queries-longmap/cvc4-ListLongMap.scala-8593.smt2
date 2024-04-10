; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104792 () Bool)

(assert start!104792)

(declare-fun b_free!26597 () Bool)

(declare-fun b_next!26597 () Bool)

(assert (=> start!104792 (= b_free!26597 (not b_next!26597))))

(declare-fun tp!93280 () Bool)

(declare-fun b_and!44365 () Bool)

(assert (=> start!104792 (= tp!93280 b_and!44365)))

(declare-fun b!1249158 () Bool)

(declare-fun res!833307 () Bool)

(declare-fun e!708934 () Bool)

(assert (=> b!1249158 (=> (not res!833307) (not e!708934))))

(declare-datatypes ((array!80682 0))(
  ( (array!80683 (arr!38908 (Array (_ BitVec 32) (_ BitVec 64))) (size!39444 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80682)

(declare-datatypes ((List!27616 0))(
  ( (Nil!27613) (Cons!27612 (h!28821 (_ BitVec 64)) (t!41087 List!27616)) )
))
(declare-fun arrayNoDuplicates!0 (array!80682 (_ BitVec 32) List!27616) Bool)

(assert (=> b!1249158 (= res!833307 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27613))))

(declare-fun b!1249159 () Bool)

(assert (=> b!1249159 (= e!708934 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47363 0))(
  ( (V!47364 (val!15812 Int)) )
))
(declare-fun minValueAfter!43 () V!47363)

(declare-datatypes ((tuple2!20370 0))(
  ( (tuple2!20371 (_1!10196 (_ BitVec 64)) (_2!10196 V!47363)) )
))
(declare-datatypes ((List!27617 0))(
  ( (Nil!27614) (Cons!27613 (h!28822 tuple2!20370) (t!41088 List!27617)) )
))
(declare-datatypes ((ListLongMap!18243 0))(
  ( (ListLongMap!18244 (toList!9137 List!27617)) )
))
(declare-fun lt!563619 () ListLongMap!18243)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47363)

(declare-datatypes ((ValueCell!14986 0))(
  ( (ValueCellFull!14986 (v!18508 V!47363)) (EmptyCell!14986) )
))
(declare-datatypes ((array!80684 0))(
  ( (array!80685 (arr!38909 (Array (_ BitVec 32) ValueCell!14986)) (size!39445 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80684)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5544 (array!80682 array!80684 (_ BitVec 32) (_ BitVec 32) V!47363 V!47363 (_ BitVec 32) Int) ListLongMap!18243)

(assert (=> b!1249159 (= lt!563619 (getCurrentListMapNoExtraKeys!5544 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563620 () ListLongMap!18243)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47363)

(assert (=> b!1249159 (= lt!563620 (getCurrentListMapNoExtraKeys!5544 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249160 () Bool)

(declare-fun e!708935 () Bool)

(declare-fun tp_is_empty!31499 () Bool)

(assert (=> b!1249160 (= e!708935 tp_is_empty!31499)))

(declare-fun mapIsEmpty!49009 () Bool)

(declare-fun mapRes!49009 () Bool)

(assert (=> mapIsEmpty!49009 mapRes!49009))

(declare-fun b!1249161 () Bool)

(declare-fun e!708937 () Bool)

(assert (=> b!1249161 (= e!708937 tp_is_empty!31499)))

(declare-fun b!1249162 () Bool)

(declare-fun res!833306 () Bool)

(assert (=> b!1249162 (=> (not res!833306) (not e!708934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80682 (_ BitVec 32)) Bool)

(assert (=> b!1249162 (= res!833306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49009 () Bool)

(declare-fun tp!93281 () Bool)

(assert (=> mapNonEmpty!49009 (= mapRes!49009 (and tp!93281 e!708935))))

(declare-fun mapKey!49009 () (_ BitVec 32))

(declare-fun mapValue!49009 () ValueCell!14986)

(declare-fun mapRest!49009 () (Array (_ BitVec 32) ValueCell!14986))

(assert (=> mapNonEmpty!49009 (= (arr!38909 _values!914) (store mapRest!49009 mapKey!49009 mapValue!49009))))

(declare-fun b!1249163 () Bool)

(declare-fun res!833305 () Bool)

(assert (=> b!1249163 (=> (not res!833305) (not e!708934))))

(assert (=> b!1249163 (= res!833305 (and (= (size!39445 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39444 _keys!1118) (size!39445 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833304 () Bool)

(assert (=> start!104792 (=> (not res!833304) (not e!708934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104792 (= res!833304 (validMask!0 mask!1466))))

(assert (=> start!104792 e!708934))

(assert (=> start!104792 true))

(assert (=> start!104792 tp!93280))

(assert (=> start!104792 tp_is_empty!31499))

(declare-fun array_inv!29695 (array!80682) Bool)

(assert (=> start!104792 (array_inv!29695 _keys!1118)))

(declare-fun e!708936 () Bool)

(declare-fun array_inv!29696 (array!80684) Bool)

(assert (=> start!104792 (and (array_inv!29696 _values!914) e!708936)))

(declare-fun b!1249164 () Bool)

(assert (=> b!1249164 (= e!708936 (and e!708937 mapRes!49009))))

(declare-fun condMapEmpty!49009 () Bool)

(declare-fun mapDefault!49009 () ValueCell!14986)

