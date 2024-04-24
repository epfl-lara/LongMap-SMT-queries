; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95472 () Bool)

(assert start!95472)

(declare-fun b_free!22237 () Bool)

(declare-fun b_next!22237 () Bool)

(assert (=> start!95472 (= b_free!22237 (not b_next!22237))))

(declare-fun tp!78209 () Bool)

(declare-fun b_and!35225 () Bool)

(assert (=> start!95472 (= tp!78209 b_and!35225)))

(declare-fun b!1077798 () Bool)

(declare-fun e!616190 () Bool)

(declare-datatypes ((V!39865 0))(
  ( (V!39866 (val!13074 Int)) )
))
(declare-datatypes ((tuple2!16652 0))(
  ( (tuple2!16653 (_1!8337 (_ BitVec 64)) (_2!8337 V!39865)) )
))
(declare-datatypes ((List!23200 0))(
  ( (Nil!23197) (Cons!23196 (h!24414 tuple2!16652) (t!32551 List!23200)) )
))
(declare-datatypes ((ListLongMap!14629 0))(
  ( (ListLongMap!14630 (toList!7330 List!23200)) )
))
(declare-fun lt!478697 () ListLongMap!14629)

(declare-fun lt!478689 () ListLongMap!14629)

(declare-fun -!707 (ListLongMap!14629 (_ BitVec 64)) ListLongMap!14629)

(assert (=> b!1077798 (= e!616190 (= (-!707 lt!478697 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478689))))

(declare-fun lt!478690 () ListLongMap!14629)

(declare-fun lt!478696 () ListLongMap!14629)

(assert (=> b!1077798 (= lt!478690 lt!478696)))

(declare-fun zeroValueBefore!47 () V!39865)

(declare-fun lt!478691 () ListLongMap!14629)

(declare-fun minValue!907 () V!39865)

(declare-datatypes ((Unit!35409 0))(
  ( (Unit!35410) )
))
(declare-fun lt!478698 () Unit!35409)

(declare-fun addCommutativeForDiffKeys!756 (ListLongMap!14629 (_ BitVec 64) V!39865 (_ BitVec 64) V!39865) Unit!35409)

(assert (=> b!1077798 (= lt!478698 (addCommutativeForDiffKeys!756 lt!478691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!478695 () ListLongMap!14629)

(assert (=> b!1077798 (= (-!707 lt!478696 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478695)))

(declare-fun lt!478688 () tuple2!16652)

(declare-fun +!3257 (ListLongMap!14629 tuple2!16652) ListLongMap!14629)

(assert (=> b!1077798 (= lt!478696 (+!3257 lt!478695 lt!478688))))

(declare-fun lt!478694 () Unit!35409)

(declare-fun addThenRemoveForNewKeyIsSame!79 (ListLongMap!14629 (_ BitVec 64) V!39865) Unit!35409)

(assert (=> b!1077798 (= lt!478694 (addThenRemoveForNewKeyIsSame!79 lt!478695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478699 () tuple2!16652)

(assert (=> b!1077798 (= lt!478695 (+!3257 lt!478691 lt!478699))))

(declare-fun e!616188 () Bool)

(assert (=> b!1077798 e!616188))

(declare-fun res!717986 () Bool)

(assert (=> b!1077798 (=> (not res!717986) (not e!616188))))

(assert (=> b!1077798 (= res!717986 (= lt!478697 lt!478690))))

(assert (=> b!1077798 (= lt!478690 (+!3257 (+!3257 lt!478691 lt!478688) lt!478699))))

(assert (=> b!1077798 (= lt!478699 (tuple2!16653 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1077798 (= lt!478688 (tuple2!16653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-datatypes ((ValueCell!12320 0))(
  ( (ValueCellFull!12320 (v!15698 V!39865)) (EmptyCell!12320) )
))
(declare-datatypes ((array!69111 0))(
  ( (array!69112 (arr!33232 (Array (_ BitVec 32) ValueCell!12320)) (size!33769 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69111)

(declare-datatypes ((array!69113 0))(
  ( (array!69114 (arr!33233 (Array (_ BitVec 32) (_ BitVec 64))) (size!33770 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69113)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39865)

(declare-fun getCurrentListMap!4186 (array!69113 array!69111 (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 (_ BitVec 32) Int) ListLongMap!14629)

(assert (=> b!1077798 (= lt!478689 (getCurrentListMap!4186 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1077798 (= lt!478697 (getCurrentListMap!4186 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077799 () Bool)

(declare-fun res!717984 () Bool)

(declare-fun e!616187 () Bool)

(assert (=> b!1077799 (=> (not res!717984) (not e!616187))))

(declare-datatypes ((List!23201 0))(
  ( (Nil!23198) (Cons!23197 (h!24415 (_ BitVec 64)) (t!32552 List!23201)) )
))
(declare-fun arrayNoDuplicates!0 (array!69113 (_ BitVec 32) List!23201) Bool)

(assert (=> b!1077799 (= res!717984 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23198))))

(declare-fun b!1077800 () Bool)

(declare-fun e!616186 () Bool)

(declare-fun tp_is_empty!26047 () Bool)

(assert (=> b!1077800 (= e!616186 tp_is_empty!26047)))

(declare-fun res!717983 () Bool)

(assert (=> start!95472 (=> (not res!717983) (not e!616187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95472 (= res!717983 (validMask!0 mask!1515))))

(assert (=> start!95472 e!616187))

(assert (=> start!95472 true))

(assert (=> start!95472 tp_is_empty!26047))

(declare-fun e!616185 () Bool)

(declare-fun array_inv!25718 (array!69111) Bool)

(assert (=> start!95472 (and (array_inv!25718 _values!955) e!616185)))

(assert (=> start!95472 tp!78209))

(declare-fun array_inv!25719 (array!69113) Bool)

(assert (=> start!95472 (array_inv!25719 _keys!1163)))

(declare-fun mapNonEmpty!40816 () Bool)

(declare-fun mapRes!40816 () Bool)

(declare-fun tp!78208 () Bool)

(assert (=> mapNonEmpty!40816 (= mapRes!40816 (and tp!78208 e!616186))))

(declare-fun mapKey!40816 () (_ BitVec 32))

(declare-fun mapRest!40816 () (Array (_ BitVec 32) ValueCell!12320))

(declare-fun mapValue!40816 () ValueCell!12320)

(assert (=> mapNonEmpty!40816 (= (arr!33232 _values!955) (store mapRest!40816 mapKey!40816 mapValue!40816))))

(declare-fun b!1077801 () Bool)

(assert (=> b!1077801 (= e!616187 (not e!616190))))

(declare-fun res!717987 () Bool)

(assert (=> b!1077801 (=> res!717987 e!616190)))

(assert (=> b!1077801 (= res!717987 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!478693 () ListLongMap!14629)

(assert (=> b!1077801 (= lt!478691 lt!478693)))

(declare-fun lt!478692 () Unit!35409)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!900 (array!69113 array!69111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 V!39865 V!39865 (_ BitVec 32) Int) Unit!35409)

(assert (=> b!1077801 (= lt!478692 (lemmaNoChangeToArrayThenSameMapNoExtras!900 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3920 (array!69113 array!69111 (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 (_ BitVec 32) Int) ListLongMap!14629)

(assert (=> b!1077801 (= lt!478693 (getCurrentListMapNoExtraKeys!3920 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1077801 (= lt!478691 (getCurrentListMapNoExtraKeys!3920 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077802 () Bool)

(assert (=> b!1077802 (= e!616188 (= lt!478689 (+!3257 lt!478693 lt!478699)))))

(declare-fun b!1077803 () Bool)

(declare-fun res!717985 () Bool)

(assert (=> b!1077803 (=> (not res!717985) (not e!616187))))

(assert (=> b!1077803 (= res!717985 (and (= (size!33769 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33770 _keys!1163) (size!33769 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40816 () Bool)

(assert (=> mapIsEmpty!40816 mapRes!40816))

(declare-fun b!1077804 () Bool)

(declare-fun e!616191 () Bool)

(assert (=> b!1077804 (= e!616185 (and e!616191 mapRes!40816))))

(declare-fun condMapEmpty!40816 () Bool)

(declare-fun mapDefault!40816 () ValueCell!12320)

(assert (=> b!1077804 (= condMapEmpty!40816 (= (arr!33232 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12320)) mapDefault!40816)))))

(declare-fun b!1077805 () Bool)

(declare-fun res!717982 () Bool)

(assert (=> b!1077805 (=> (not res!717982) (not e!616187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69113 (_ BitVec 32)) Bool)

(assert (=> b!1077805 (= res!717982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1077806 () Bool)

(assert (=> b!1077806 (= e!616191 tp_is_empty!26047)))

(assert (= (and start!95472 res!717983) b!1077803))

(assert (= (and b!1077803 res!717985) b!1077805))

(assert (= (and b!1077805 res!717982) b!1077799))

(assert (= (and b!1077799 res!717984) b!1077801))

(assert (= (and b!1077801 (not res!717987)) b!1077798))

(assert (= (and b!1077798 res!717986) b!1077802))

(assert (= (and b!1077804 condMapEmpty!40816) mapIsEmpty!40816))

(assert (= (and b!1077804 (not condMapEmpty!40816)) mapNonEmpty!40816))

(get-info :version)

(assert (= (and mapNonEmpty!40816 ((_ is ValueCellFull!12320) mapValue!40816)) b!1077800))

(assert (= (and b!1077804 ((_ is ValueCellFull!12320) mapDefault!40816)) b!1077806))

(assert (= start!95472 b!1077804))

(declare-fun m!997055 () Bool)

(assert (=> b!1077798 m!997055))

(declare-fun m!997057 () Bool)

(assert (=> b!1077798 m!997057))

(declare-fun m!997059 () Bool)

(assert (=> b!1077798 m!997059))

(declare-fun m!997061 () Bool)

(assert (=> b!1077798 m!997061))

(declare-fun m!997063 () Bool)

(assert (=> b!1077798 m!997063))

(declare-fun m!997065 () Bool)

(assert (=> b!1077798 m!997065))

(declare-fun m!997067 () Bool)

(assert (=> b!1077798 m!997067))

(declare-fun m!997069 () Bool)

(assert (=> b!1077798 m!997069))

(declare-fun m!997071 () Bool)

(assert (=> b!1077798 m!997071))

(declare-fun m!997073 () Bool)

(assert (=> b!1077798 m!997073))

(assert (=> b!1077798 m!997059))

(declare-fun m!997075 () Bool)

(assert (=> b!1077801 m!997075))

(declare-fun m!997077 () Bool)

(assert (=> b!1077801 m!997077))

(declare-fun m!997079 () Bool)

(assert (=> b!1077801 m!997079))

(declare-fun m!997081 () Bool)

(assert (=> b!1077802 m!997081))

(declare-fun m!997083 () Bool)

(assert (=> start!95472 m!997083))

(declare-fun m!997085 () Bool)

(assert (=> start!95472 m!997085))

(declare-fun m!997087 () Bool)

(assert (=> start!95472 m!997087))

(declare-fun m!997089 () Bool)

(assert (=> b!1077799 m!997089))

(declare-fun m!997091 () Bool)

(assert (=> b!1077805 m!997091))

(declare-fun m!997093 () Bool)

(assert (=> mapNonEmpty!40816 m!997093))

(check-sat (not b!1077802) (not b!1077799) (not b_next!22237) b_and!35225 (not start!95472) (not b!1077801) tp_is_empty!26047 (not mapNonEmpty!40816) (not b!1077805) (not b!1077798))
(check-sat b_and!35225 (not b_next!22237))
