; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105574 () Bool)

(assert start!105574)

(declare-fun b_free!27189 () Bool)

(declare-fun b_next!27189 () Bool)

(assert (=> start!105574 (= b_free!27189 (not b_next!27189))))

(declare-fun tp!95086 () Bool)

(declare-fun b_and!45055 () Bool)

(assert (=> start!105574 (= tp!95086 b_and!45055)))

(declare-fun res!838345 () Bool)

(declare-fun e!715199 () Bool)

(assert (=> start!105574 (=> (not res!838345) (not e!715199))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105574 (= res!838345 (validMask!0 mask!1466))))

(assert (=> start!105574 e!715199))

(assert (=> start!105574 true))

(assert (=> start!105574 tp!95086))

(declare-fun tp_is_empty!32091 () Bool)

(assert (=> start!105574 tp_is_empty!32091))

(declare-datatypes ((array!81814 0))(
  ( (array!81815 (arr!39464 (Array (_ BitVec 32) (_ BitVec 64))) (size!40000 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81814)

(declare-fun array_inv!30059 (array!81814) Bool)

(assert (=> start!105574 (array_inv!30059 _keys!1118)))

(declare-datatypes ((V!48153 0))(
  ( (V!48154 (val!16108 Int)) )
))
(declare-datatypes ((ValueCell!15282 0))(
  ( (ValueCellFull!15282 (v!18810 V!48153)) (EmptyCell!15282) )
))
(declare-datatypes ((array!81816 0))(
  ( (array!81817 (arr!39465 (Array (_ BitVec 32) ValueCell!15282)) (size!40001 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81816)

(declare-fun e!715200 () Bool)

(declare-fun array_inv!30060 (array!81816) Bool)

(assert (=> start!105574 (and (array_inv!30060 _values!914) e!715200)))

(declare-fun mapIsEmpty!49927 () Bool)

(declare-fun mapRes!49927 () Bool)

(assert (=> mapIsEmpty!49927 mapRes!49927))

(declare-fun b!1257700 () Bool)

(declare-fun res!838344 () Bool)

(assert (=> b!1257700 (=> (not res!838344) (not e!715199))))

(declare-datatypes ((List!28026 0))(
  ( (Nil!28023) (Cons!28022 (h!29231 (_ BitVec 64)) (t!41517 List!28026)) )
))
(declare-fun arrayNoDuplicates!0 (array!81814 (_ BitVec 32) List!28026) Bool)

(assert (=> b!1257700 (= res!838344 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28023))))

(declare-fun b!1257701 () Bool)

(declare-fun e!715201 () Bool)

(assert (=> b!1257701 (= e!715201 tp_is_empty!32091)))

(declare-fun b!1257702 () Bool)

(declare-fun e!715198 () Bool)

(assert (=> b!1257702 (= e!715198 tp_is_empty!32091)))

(declare-fun b!1257703 () Bool)

(declare-fun res!838343 () Bool)

(assert (=> b!1257703 (=> (not res!838343) (not e!715199))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257703 (= res!838343 (and (= (size!40001 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40000 _keys!1118) (size!40001 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49927 () Bool)

(declare-fun tp!95087 () Bool)

(assert (=> mapNonEmpty!49927 (= mapRes!49927 (and tp!95087 e!715198))))

(declare-fun mapKey!49927 () (_ BitVec 32))

(declare-fun mapValue!49927 () ValueCell!15282)

(declare-fun mapRest!49927 () (Array (_ BitVec 32) ValueCell!15282))

(assert (=> mapNonEmpty!49927 (= (arr!39465 _values!914) (store mapRest!49927 mapKey!49927 mapValue!49927))))

(declare-fun b!1257704 () Bool)

(assert (=> b!1257704 (= e!715199 (not true))))

(declare-datatypes ((tuple2!20812 0))(
  ( (tuple2!20813 (_1!10417 (_ BitVec 64)) (_2!10417 V!48153)) )
))
(declare-datatypes ((List!28027 0))(
  ( (Nil!28024) (Cons!28023 (h!29232 tuple2!20812) (t!41518 List!28027)) )
))
(declare-datatypes ((ListLongMap!18685 0))(
  ( (ListLongMap!18686 (toList!9358 List!28027)) )
))
(declare-fun lt!568855 () ListLongMap!18685)

(declare-fun lt!568856 () ListLongMap!18685)

(assert (=> b!1257704 (= lt!568855 lt!568856)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48153)

(declare-datatypes ((Unit!41900 0))(
  ( (Unit!41901) )
))
(declare-fun lt!568857 () Unit!41900)

(declare-fun zeroValue!871 () V!48153)

(declare-fun minValueBefore!43 () V!48153)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1100 (array!81814 array!81816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48153 V!48153 V!48153 V!48153 (_ BitVec 32) Int) Unit!41900)

(assert (=> b!1257704 (= lt!568857 (lemmaNoChangeToArrayThenSameMapNoExtras!1100 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5736 (array!81814 array!81816 (_ BitVec 32) (_ BitVec 32) V!48153 V!48153 (_ BitVec 32) Int) ListLongMap!18685)

(assert (=> b!1257704 (= lt!568856 (getCurrentListMapNoExtraKeys!5736 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257704 (= lt!568855 (getCurrentListMapNoExtraKeys!5736 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257705 () Bool)

(assert (=> b!1257705 (= e!715200 (and e!715201 mapRes!49927))))

(declare-fun condMapEmpty!49927 () Bool)

(declare-fun mapDefault!49927 () ValueCell!15282)

(assert (=> b!1257705 (= condMapEmpty!49927 (= (arr!39465 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15282)) mapDefault!49927)))))

(declare-fun b!1257706 () Bool)

(declare-fun res!838342 () Bool)

(assert (=> b!1257706 (=> (not res!838342) (not e!715199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81814 (_ BitVec 32)) Bool)

(assert (=> b!1257706 (= res!838342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105574 res!838345) b!1257703))

(assert (= (and b!1257703 res!838343) b!1257706))

(assert (= (and b!1257706 res!838342) b!1257700))

(assert (= (and b!1257700 res!838344) b!1257704))

(assert (= (and b!1257705 condMapEmpty!49927) mapIsEmpty!49927))

(assert (= (and b!1257705 (not condMapEmpty!49927)) mapNonEmpty!49927))

(get-info :version)

(assert (= (and mapNonEmpty!49927 ((_ is ValueCellFull!15282) mapValue!49927)) b!1257702))

(assert (= (and b!1257705 ((_ is ValueCellFull!15282) mapDefault!49927)) b!1257701))

(assert (= start!105574 b!1257705))

(declare-fun m!1158251 () Bool)

(assert (=> b!1257704 m!1158251))

(declare-fun m!1158253 () Bool)

(assert (=> b!1257704 m!1158253))

(declare-fun m!1158255 () Bool)

(assert (=> b!1257704 m!1158255))

(declare-fun m!1158257 () Bool)

(assert (=> b!1257706 m!1158257))

(declare-fun m!1158259 () Bool)

(assert (=> mapNonEmpty!49927 m!1158259))

(declare-fun m!1158261 () Bool)

(assert (=> b!1257700 m!1158261))

(declare-fun m!1158263 () Bool)

(assert (=> start!105574 m!1158263))

(declare-fun m!1158265 () Bool)

(assert (=> start!105574 m!1158265))

(declare-fun m!1158267 () Bool)

(assert (=> start!105574 m!1158267))

(check-sat (not start!105574) tp_is_empty!32091 (not b!1257704) (not b!1257700) (not b_next!27189) b_and!45055 (not b!1257706) (not mapNonEmpty!49927))
(check-sat b_and!45055 (not b_next!27189))
