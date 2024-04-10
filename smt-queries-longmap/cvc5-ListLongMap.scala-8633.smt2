; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105100 () Bool)

(assert start!105100)

(declare-fun b_free!26833 () Bool)

(declare-fun b_next!26833 () Bool)

(assert (=> start!105100 (= b_free!26833 (not b_next!26833))))

(declare-fun tp!94001 () Bool)

(declare-fun b_and!44637 () Bool)

(assert (=> start!105100 (= tp!94001 b_and!44637)))

(declare-fun b!1252464 () Bool)

(declare-fun e!711361 () Bool)

(declare-fun tp_is_empty!31735 () Bool)

(assert (=> b!1252464 (= e!711361 tp_is_empty!31735)))

(declare-fun b!1252465 () Bool)

(declare-fun res!835249 () Bool)

(declare-fun e!711357 () Bool)

(assert (=> b!1252465 (=> (not res!835249) (not e!711357))))

(declare-datatypes ((array!81132 0))(
  ( (array!81133 (arr!39129 (Array (_ BitVec 32) (_ BitVec 64))) (size!39665 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81132)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81132 (_ BitVec 32)) Bool)

(assert (=> b!1252465 (= res!835249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252466 () Bool)

(declare-fun res!835250 () Bool)

(assert (=> b!1252466 (=> (not res!835250) (not e!711357))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47679 0))(
  ( (V!47680 (val!15930 Int)) )
))
(declare-datatypes ((ValueCell!15104 0))(
  ( (ValueCellFull!15104 (v!18628 V!47679)) (EmptyCell!15104) )
))
(declare-datatypes ((array!81134 0))(
  ( (array!81135 (arr!39130 (Array (_ BitVec 32) ValueCell!15104)) (size!39666 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81134)

(assert (=> b!1252466 (= res!835250 (and (= (size!39666 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39665 _keys!1118) (size!39666 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49375 () Bool)

(declare-fun mapRes!49375 () Bool)

(declare-fun tp!94000 () Bool)

(declare-fun e!711362 () Bool)

(assert (=> mapNonEmpty!49375 (= mapRes!49375 (and tp!94000 e!711362))))

(declare-fun mapValue!49375 () ValueCell!15104)

(declare-fun mapKey!49375 () (_ BitVec 32))

(declare-fun mapRest!49375 () (Array (_ BitVec 32) ValueCell!15104))

(assert (=> mapNonEmpty!49375 (= (arr!39130 _values!914) (store mapRest!49375 mapKey!49375 mapValue!49375))))

(declare-fun res!835248 () Bool)

(assert (=> start!105100 (=> (not res!835248) (not e!711357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105100 (= res!835248 (validMask!0 mask!1466))))

(assert (=> start!105100 e!711357))

(assert (=> start!105100 true))

(assert (=> start!105100 tp!94001))

(assert (=> start!105100 tp_is_empty!31735))

(declare-fun array_inv!29845 (array!81132) Bool)

(assert (=> start!105100 (array_inv!29845 _keys!1118)))

(declare-fun e!711360 () Bool)

(declare-fun array_inv!29846 (array!81134) Bool)

(assert (=> start!105100 (and (array_inv!29846 _values!914) e!711360)))

(declare-fun b!1252467 () Bool)

(declare-fun e!711358 () Bool)

(assert (=> b!1252467 (= e!711357 (not e!711358))))

(declare-fun res!835252 () Bool)

(assert (=> b!1252467 (=> res!835252 e!711358)))

(assert (=> b!1252467 (= res!835252 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20548 0))(
  ( (tuple2!20549 (_1!10285 (_ BitVec 64)) (_2!10285 V!47679)) )
))
(declare-datatypes ((List!27780 0))(
  ( (Nil!27777) (Cons!27776 (h!28985 tuple2!20548) (t!41259 List!27780)) )
))
(declare-datatypes ((ListLongMap!18421 0))(
  ( (ListLongMap!18422 (toList!9226 List!27780)) )
))
(declare-fun lt!565346 () ListLongMap!18421)

(declare-fun lt!565344 () ListLongMap!18421)

(assert (=> b!1252467 (= lt!565346 lt!565344)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47679)

(declare-fun zeroValue!871 () V!47679)

(declare-fun minValueBefore!43 () V!47679)

(declare-datatypes ((Unit!41641 0))(
  ( (Unit!41642) )
))
(declare-fun lt!565345 () Unit!41641)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!986 (array!81132 array!81134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 V!47679 V!47679 (_ BitVec 32) Int) Unit!41641)

(assert (=> b!1252467 (= lt!565345 (lemmaNoChangeToArrayThenSameMapNoExtras!986 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5622 (array!81132 array!81134 (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 (_ BitVec 32) Int) ListLongMap!18421)

(assert (=> b!1252467 (= lt!565344 (getCurrentListMapNoExtraKeys!5622 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252467 (= lt!565346 (getCurrentListMapNoExtraKeys!5622 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252468 () Bool)

(assert (=> b!1252468 (= e!711358 true)))

(declare-fun lt!565343 () ListLongMap!18421)

(declare-fun getCurrentListMap!4474 (array!81132 array!81134 (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 (_ BitVec 32) Int) ListLongMap!18421)

(assert (=> b!1252468 (= lt!565343 (getCurrentListMap!4474 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252469 () Bool)

(declare-fun res!835251 () Bool)

(assert (=> b!1252469 (=> (not res!835251) (not e!711357))))

(declare-datatypes ((List!27781 0))(
  ( (Nil!27778) (Cons!27777 (h!28986 (_ BitVec 64)) (t!41260 List!27781)) )
))
(declare-fun arrayNoDuplicates!0 (array!81132 (_ BitVec 32) List!27781) Bool)

(assert (=> b!1252469 (= res!835251 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27778))))

(declare-fun mapIsEmpty!49375 () Bool)

(assert (=> mapIsEmpty!49375 mapRes!49375))

(declare-fun b!1252470 () Bool)

(assert (=> b!1252470 (= e!711360 (and e!711361 mapRes!49375))))

(declare-fun condMapEmpty!49375 () Bool)

(declare-fun mapDefault!49375 () ValueCell!15104)

