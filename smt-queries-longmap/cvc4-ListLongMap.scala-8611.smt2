; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104914 () Bool)

(assert start!104914)

(declare-fun b_free!26705 () Bool)

(declare-fun b_next!26705 () Bool)

(assert (=> start!104914 (= b_free!26705 (not b_next!26705))))

(declare-fun tp!93607 () Bool)

(declare-fun b_and!44481 () Bool)

(assert (=> start!104914 (= tp!93607 b_and!44481)))

(declare-fun b!1250510 () Bool)

(declare-fun res!834118 () Bool)

(declare-fun e!709935 () Bool)

(assert (=> b!1250510 (=> (not res!834118) (not e!709935))))

(declare-datatypes ((array!80882 0))(
  ( (array!80883 (arr!39007 (Array (_ BitVec 32) (_ BitVec 64))) (size!39543 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80882)

(declare-datatypes ((List!27684 0))(
  ( (Nil!27681) (Cons!27680 (h!28889 (_ BitVec 64)) (t!41157 List!27684)) )
))
(declare-fun arrayNoDuplicates!0 (array!80882 (_ BitVec 32) List!27684) Bool)

(assert (=> b!1250510 (= res!834118 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27681))))

(declare-fun b!1250511 () Bool)

(declare-fun e!709931 () Bool)

(declare-fun tp_is_empty!31607 () Bool)

(assert (=> b!1250511 (= e!709931 tp_is_empty!31607)))

(declare-fun mapNonEmpty!49174 () Bool)

(declare-fun mapRes!49174 () Bool)

(declare-fun tp!93608 () Bool)

(assert (=> mapNonEmpty!49174 (= mapRes!49174 (and tp!93608 e!709931))))

(declare-datatypes ((V!47507 0))(
  ( (V!47508 (val!15866 Int)) )
))
(declare-datatypes ((ValueCell!15040 0))(
  ( (ValueCellFull!15040 (v!18562 V!47507)) (EmptyCell!15040) )
))
(declare-fun mapValue!49174 () ValueCell!15040)

(declare-datatypes ((array!80884 0))(
  ( (array!80885 (arr!39008 (Array (_ BitVec 32) ValueCell!15040)) (size!39544 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80884)

(declare-fun mapKey!49174 () (_ BitVec 32))

(declare-fun mapRest!49174 () (Array (_ BitVec 32) ValueCell!15040))

(assert (=> mapNonEmpty!49174 (= (arr!39008 _values!914) (store mapRest!49174 mapKey!49174 mapValue!49174))))

(declare-fun res!834120 () Bool)

(assert (=> start!104914 (=> (not res!834120) (not e!709935))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104914 (= res!834120 (validMask!0 mask!1466))))

(assert (=> start!104914 e!709935))

(assert (=> start!104914 true))

(assert (=> start!104914 tp!93607))

(assert (=> start!104914 tp_is_empty!31607))

(declare-fun array_inv!29757 (array!80882) Bool)

(assert (=> start!104914 (array_inv!29757 _keys!1118)))

(declare-fun e!709933 () Bool)

(declare-fun array_inv!29758 (array!80884) Bool)

(assert (=> start!104914 (and (array_inv!29758 _values!914) e!709933)))

(declare-fun b!1250512 () Bool)

(declare-fun e!709937 () Bool)

(declare-fun e!709936 () Bool)

(assert (=> b!1250512 (= e!709937 e!709936)))

(declare-fun res!834117 () Bool)

(assert (=> b!1250512 (=> res!834117 e!709936)))

(declare-datatypes ((tuple2!20444 0))(
  ( (tuple2!20445 (_1!10233 (_ BitVec 64)) (_2!10233 V!47507)) )
))
(declare-datatypes ((List!27685 0))(
  ( (Nil!27682) (Cons!27681 (h!28890 tuple2!20444) (t!41158 List!27685)) )
))
(declare-datatypes ((ListLongMap!18317 0))(
  ( (ListLongMap!18318 (toList!9174 List!27685)) )
))
(declare-fun lt!564270 () ListLongMap!18317)

(declare-fun contains!7488 (ListLongMap!18317 (_ BitVec 64)) Bool)

(assert (=> b!1250512 (= res!834117 (contains!7488 lt!564270 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47507)

(declare-fun minValueBefore!43 () V!47507)

(declare-fun getCurrentListMap!4449 (array!80882 array!80884 (_ BitVec 32) (_ BitVec 32) V!47507 V!47507 (_ BitVec 32) Int) ListLongMap!18317)

(assert (=> b!1250512 (= lt!564270 (getCurrentListMap!4449 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250513 () Bool)

(declare-fun res!834119 () Bool)

(assert (=> b!1250513 (=> (not res!834119) (not e!709935))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250513 (= res!834119 (and (= (size!39544 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39543 _keys!1118) (size!39544 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250514 () Bool)

(assert (=> b!1250514 (= e!709935 (not e!709937))))

(declare-fun res!834121 () Bool)

(assert (=> b!1250514 (=> res!834121 e!709937)))

(assert (=> b!1250514 (= res!834121 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564272 () ListLongMap!18317)

(declare-fun lt!564268 () ListLongMap!18317)

(assert (=> b!1250514 (= lt!564272 lt!564268)))

(declare-fun minValueAfter!43 () V!47507)

(declare-datatypes ((Unit!41539 0))(
  ( (Unit!41540) )
))
(declare-fun lt!564269 () Unit!41539)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!941 (array!80882 array!80884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47507 V!47507 V!47507 V!47507 (_ BitVec 32) Int) Unit!41539)

(assert (=> b!1250514 (= lt!564269 (lemmaNoChangeToArrayThenSameMapNoExtras!941 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5577 (array!80882 array!80884 (_ BitVec 32) (_ BitVec 32) V!47507 V!47507 (_ BitVec 32) Int) ListLongMap!18317)

(assert (=> b!1250514 (= lt!564268 (getCurrentListMapNoExtraKeys!5577 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250514 (= lt!564272 (getCurrentListMapNoExtraKeys!5577 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250515 () Bool)

(declare-fun e!709932 () Bool)

(assert (=> b!1250515 (= e!709932 tp_is_empty!31607)))

(declare-fun b!1250516 () Bool)

(assert (=> b!1250516 (= e!709933 (and e!709932 mapRes!49174))))

(declare-fun condMapEmpty!49174 () Bool)

(declare-fun mapDefault!49174 () ValueCell!15040)

