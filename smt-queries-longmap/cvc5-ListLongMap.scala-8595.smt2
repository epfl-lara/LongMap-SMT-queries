; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104800 () Bool)

(assert start!104800)

(declare-fun b_free!26605 () Bool)

(declare-fun b_next!26605 () Bool)

(assert (=> start!104800 (= b_free!26605 (not b_next!26605))))

(declare-fun tp!93305 () Bool)

(declare-fun b_and!44373 () Bool)

(assert (=> start!104800 (= tp!93305 b_and!44373)))

(declare-fun b!1249242 () Bool)

(declare-fun e!708993 () Bool)

(assert (=> b!1249242 (= e!708993 (not true))))

(declare-datatypes ((V!47375 0))(
  ( (V!47376 (val!15816 Int)) )
))
(declare-datatypes ((tuple2!20376 0))(
  ( (tuple2!20377 (_1!10199 (_ BitVec 64)) (_2!10199 V!47375)) )
))
(declare-datatypes ((List!27621 0))(
  ( (Nil!27618) (Cons!27617 (h!28826 tuple2!20376) (t!41092 List!27621)) )
))
(declare-datatypes ((ListLongMap!18249 0))(
  ( (ListLongMap!18250 (toList!9140 List!27621)) )
))
(declare-fun lt!563647 () ListLongMap!18249)

(declare-fun lt!563645 () ListLongMap!18249)

(assert (=> b!1249242 (= lt!563647 lt!563645)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47375)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47375)

(declare-datatypes ((Unit!41477 0))(
  ( (Unit!41478) )
))
(declare-fun lt!563646 () Unit!41477)

(declare-datatypes ((array!80696 0))(
  ( (array!80697 (arr!38915 (Array (_ BitVec 32) (_ BitVec 64))) (size!39451 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80696)

(declare-datatypes ((ValueCell!14990 0))(
  ( (ValueCellFull!14990 (v!18512 V!47375)) (EmptyCell!14990) )
))
(declare-datatypes ((array!80698 0))(
  ( (array!80699 (arr!38916 (Array (_ BitVec 32) ValueCell!14990)) (size!39452 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80698)

(declare-fun minValueBefore!43 () V!47375)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!911 (array!80696 array!80698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47375 V!47375 V!47375 V!47375 (_ BitVec 32) Int) Unit!41477)

(assert (=> b!1249242 (= lt!563646 (lemmaNoChangeToArrayThenSameMapNoExtras!911 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5547 (array!80696 array!80698 (_ BitVec 32) (_ BitVec 32) V!47375 V!47375 (_ BitVec 32) Int) ListLongMap!18249)

(assert (=> b!1249242 (= lt!563645 (getCurrentListMapNoExtraKeys!5547 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249242 (= lt!563647 (getCurrentListMapNoExtraKeys!5547 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249243 () Bool)

(declare-fun res!833354 () Bool)

(assert (=> b!1249243 (=> (not res!833354) (not e!708993))))

(assert (=> b!1249243 (= res!833354 (and (= (size!39452 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39451 _keys!1118) (size!39452 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49021 () Bool)

(declare-fun mapRes!49021 () Bool)

(declare-fun tp!93304 () Bool)

(declare-fun e!708997 () Bool)

(assert (=> mapNonEmpty!49021 (= mapRes!49021 (and tp!93304 e!708997))))

(declare-fun mapKey!49021 () (_ BitVec 32))

(declare-fun mapRest!49021 () (Array (_ BitVec 32) ValueCell!14990))

(declare-fun mapValue!49021 () ValueCell!14990)

(assert (=> mapNonEmpty!49021 (= (arr!38916 _values!914) (store mapRest!49021 mapKey!49021 mapValue!49021))))

(declare-fun b!1249244 () Bool)

(declare-fun tp_is_empty!31507 () Bool)

(assert (=> b!1249244 (= e!708997 tp_is_empty!31507)))

(declare-fun b!1249245 () Bool)

(declare-fun e!708994 () Bool)

(declare-fun e!708995 () Bool)

(assert (=> b!1249245 (= e!708994 (and e!708995 mapRes!49021))))

(declare-fun condMapEmpty!49021 () Bool)

(declare-fun mapDefault!49021 () ValueCell!14990)

