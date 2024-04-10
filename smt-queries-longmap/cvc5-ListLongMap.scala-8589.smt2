; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104764 () Bool)

(assert start!104764)

(declare-fun b_free!26569 () Bool)

(declare-fun b_next!26569 () Bool)

(assert (=> start!104764 (= b_free!26569 (not b_next!26569))))

(declare-fun tp!93196 () Bool)

(declare-fun b_and!44337 () Bool)

(assert (=> start!104764 (= tp!93196 b_and!44337)))

(declare-fun mapNonEmpty!48967 () Bool)

(declare-fun mapRes!48967 () Bool)

(declare-fun tp!93197 () Bool)

(declare-fun e!708726 () Bool)

(assert (=> mapNonEmpty!48967 (= mapRes!48967 (and tp!93197 e!708726))))

(declare-datatypes ((V!47327 0))(
  ( (V!47328 (val!15798 Int)) )
))
(declare-datatypes ((ValueCell!14972 0))(
  ( (ValueCellFull!14972 (v!18494 V!47327)) (EmptyCell!14972) )
))
(declare-datatypes ((array!80628 0))(
  ( (array!80629 (arr!38881 (Array (_ BitVec 32) ValueCell!14972)) (size!39417 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80628)

(declare-fun mapValue!48967 () ValueCell!14972)

(declare-fun mapKey!48967 () (_ BitVec 32))

(declare-fun mapRest!48967 () (Array (_ BitVec 32) ValueCell!14972))

(assert (=> mapNonEmpty!48967 (= (arr!38881 _values!914) (store mapRest!48967 mapKey!48967 mapValue!48967))))

(declare-fun b!1248864 () Bool)

(declare-fun e!708723 () Bool)

(assert (=> b!1248864 (= e!708723 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47327)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80630 0))(
  ( (array!80631 (arr!38882 (Array (_ BitVec 32) (_ BitVec 64))) (size!39418 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80630)

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47327)

(declare-datatypes ((tuple2!20344 0))(
  ( (tuple2!20345 (_1!10183 (_ BitVec 64)) (_2!10183 V!47327)) )
))
(declare-datatypes ((List!27591 0))(
  ( (Nil!27588) (Cons!27587 (h!28796 tuple2!20344) (t!41062 List!27591)) )
))
(declare-datatypes ((ListLongMap!18217 0))(
  ( (ListLongMap!18218 (toList!9124 List!27591)) )
))
(declare-fun lt!563535 () ListLongMap!18217)

(declare-fun getCurrentListMapNoExtraKeys!5531 (array!80630 array!80628 (_ BitVec 32) (_ BitVec 32) V!47327 V!47327 (_ BitVec 32) Int) ListLongMap!18217)

(assert (=> b!1248864 (= lt!563535 (getCurrentListMapNoExtraKeys!5531 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!563536 () ListLongMap!18217)

(declare-fun minValueBefore!43 () V!47327)

(assert (=> b!1248864 (= lt!563536 (getCurrentListMapNoExtraKeys!5531 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48967 () Bool)

(assert (=> mapIsEmpty!48967 mapRes!48967))

(declare-fun b!1248865 () Bool)

(declare-fun res!833136 () Bool)

(assert (=> b!1248865 (=> (not res!833136) (not e!708723))))

(assert (=> b!1248865 (= res!833136 (and (= (size!39417 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39418 _keys!1118) (size!39417 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248866 () Bool)

(declare-fun res!833138 () Bool)

(assert (=> b!1248866 (=> (not res!833138) (not e!708723))))

(declare-datatypes ((List!27592 0))(
  ( (Nil!27589) (Cons!27588 (h!28797 (_ BitVec 64)) (t!41063 List!27592)) )
))
(declare-fun arrayNoDuplicates!0 (array!80630 (_ BitVec 32) List!27592) Bool)

(assert (=> b!1248866 (= res!833138 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27589))))

(declare-fun b!1248867 () Bool)

(declare-fun e!708725 () Bool)

(declare-fun e!708724 () Bool)

(assert (=> b!1248867 (= e!708725 (and e!708724 mapRes!48967))))

(declare-fun condMapEmpty!48967 () Bool)

(declare-fun mapDefault!48967 () ValueCell!14972)

