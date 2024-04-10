; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70932 () Bool)

(assert start!70932)

(declare-fun b_free!13149 () Bool)

(declare-fun b_next!13149 () Bool)

(assert (=> start!70932 (= b_free!13149 (not b_next!13149))))

(declare-fun tp!46197 () Bool)

(declare-fun b_and!22045 () Bool)

(assert (=> start!70932 (= tp!46197 b_and!22045)))

(declare-fun mapIsEmpty!23905 () Bool)

(declare-fun mapRes!23905 () Bool)

(assert (=> mapIsEmpty!23905 mapRes!23905))

(declare-fun res!561727 () Bool)

(declare-fun e!458232 () Bool)

(assert (=> start!70932 (=> (not res!561727) (not e!458232))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70932 (= res!561727 (validMask!0 mask!1312))))

(assert (=> start!70932 e!458232))

(declare-fun tp_is_empty!14859 () Bool)

(assert (=> start!70932 tp_is_empty!14859))

(declare-datatypes ((array!45908 0))(
  ( (array!45909 (arr!22002 (Array (_ BitVec 32) (_ BitVec 64))) (size!22423 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45908)

(declare-fun array_inv!17561 (array!45908) Bool)

(assert (=> start!70932 (array_inv!17561 _keys!976)))

(assert (=> start!70932 true))

(declare-datatypes ((V!24813 0))(
  ( (V!24814 (val!7477 Int)) )
))
(declare-datatypes ((ValueCell!7014 0))(
  ( (ValueCellFull!7014 (v!9910 V!24813)) (EmptyCell!7014) )
))
(declare-datatypes ((array!45910 0))(
  ( (array!45911 (arr!22003 (Array (_ BitVec 32) ValueCell!7014)) (size!22424 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45910)

(declare-fun e!458231 () Bool)

(declare-fun array_inv!17562 (array!45910) Bool)

(assert (=> start!70932 (and (array_inv!17562 _values!788) e!458231)))

(assert (=> start!70932 tp!46197))

(declare-fun b!823801 () Bool)

(declare-fun e!458229 () Bool)

(assert (=> b!823801 (= e!458231 (and e!458229 mapRes!23905))))

(declare-fun condMapEmpty!23905 () Bool)

(declare-fun mapDefault!23905 () ValueCell!7014)

(assert (=> b!823801 (= condMapEmpty!23905 (= (arr!22003 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7014)) mapDefault!23905)))))

(declare-fun b!823802 () Bool)

(assert (=> b!823802 (= e!458232 (not true))))

(declare-datatypes ((tuple2!9888 0))(
  ( (tuple2!9889 (_1!4955 (_ BitVec 64)) (_2!4955 V!24813)) )
))
(declare-datatypes ((List!15700 0))(
  ( (Nil!15697) (Cons!15696 (h!16825 tuple2!9888) (t!22041 List!15700)) )
))
(declare-datatypes ((ListLongMap!8711 0))(
  ( (ListLongMap!8712 (toList!4371 List!15700)) )
))
(declare-fun lt!371539 () ListLongMap!8711)

(declare-fun lt!371537 () ListLongMap!8711)

(assert (=> b!823802 (= lt!371539 lt!371537)))

(declare-fun zeroValueBefore!34 () V!24813)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24813)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28210 0))(
  ( (Unit!28211) )
))
(declare-fun lt!371538 () Unit!28210)

(declare-fun zeroValueAfter!34 () V!24813)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!496 (array!45908 array!45910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24813 V!24813 V!24813 V!24813 (_ BitVec 32) Int) Unit!28210)

(assert (=> b!823802 (= lt!371538 (lemmaNoChangeToArrayThenSameMapNoExtras!496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2386 (array!45908 array!45910 (_ BitVec 32) (_ BitVec 32) V!24813 V!24813 (_ BitVec 32) Int) ListLongMap!8711)

(assert (=> b!823802 (= lt!371537 (getCurrentListMapNoExtraKeys!2386 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823802 (= lt!371539 (getCurrentListMapNoExtraKeys!2386 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823803 () Bool)

(assert (=> b!823803 (= e!458229 tp_is_empty!14859)))

(declare-fun b!823804 () Bool)

(declare-fun res!561725 () Bool)

(assert (=> b!823804 (=> (not res!561725) (not e!458232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45908 (_ BitVec 32)) Bool)

(assert (=> b!823804 (= res!561725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823805 () Bool)

(declare-fun res!561726 () Bool)

(assert (=> b!823805 (=> (not res!561726) (not e!458232))))

(declare-datatypes ((List!15701 0))(
  ( (Nil!15698) (Cons!15697 (h!16826 (_ BitVec 64)) (t!22042 List!15701)) )
))
(declare-fun arrayNoDuplicates!0 (array!45908 (_ BitVec 32) List!15701) Bool)

(assert (=> b!823805 (= res!561726 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15698))))

(declare-fun mapNonEmpty!23905 () Bool)

(declare-fun tp!46198 () Bool)

(declare-fun e!458230 () Bool)

(assert (=> mapNonEmpty!23905 (= mapRes!23905 (and tp!46198 e!458230))))

(declare-fun mapRest!23905 () (Array (_ BitVec 32) ValueCell!7014))

(declare-fun mapValue!23905 () ValueCell!7014)

(declare-fun mapKey!23905 () (_ BitVec 32))

(assert (=> mapNonEmpty!23905 (= (arr!22003 _values!788) (store mapRest!23905 mapKey!23905 mapValue!23905))))

(declare-fun b!823806 () Bool)

(declare-fun res!561728 () Bool)

(assert (=> b!823806 (=> (not res!561728) (not e!458232))))

(assert (=> b!823806 (= res!561728 (and (= (size!22424 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22423 _keys!976) (size!22424 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823807 () Bool)

(assert (=> b!823807 (= e!458230 tp_is_empty!14859)))

(assert (= (and start!70932 res!561727) b!823806))

(assert (= (and b!823806 res!561728) b!823804))

(assert (= (and b!823804 res!561725) b!823805))

(assert (= (and b!823805 res!561726) b!823802))

(assert (= (and b!823801 condMapEmpty!23905) mapIsEmpty!23905))

(assert (= (and b!823801 (not condMapEmpty!23905)) mapNonEmpty!23905))

(get-info :version)

(assert (= (and mapNonEmpty!23905 ((_ is ValueCellFull!7014) mapValue!23905)) b!823807))

(assert (= (and b!823801 ((_ is ValueCellFull!7014) mapDefault!23905)) b!823803))

(assert (= start!70932 b!823801))

(declare-fun m!765991 () Bool)

(assert (=> mapNonEmpty!23905 m!765991))

(declare-fun m!765993 () Bool)

(assert (=> start!70932 m!765993))

(declare-fun m!765995 () Bool)

(assert (=> start!70932 m!765995))

(declare-fun m!765997 () Bool)

(assert (=> start!70932 m!765997))

(declare-fun m!765999 () Bool)

(assert (=> b!823804 m!765999))

(declare-fun m!766001 () Bool)

(assert (=> b!823802 m!766001))

(declare-fun m!766003 () Bool)

(assert (=> b!823802 m!766003))

(declare-fun m!766005 () Bool)

(assert (=> b!823802 m!766005))

(declare-fun m!766007 () Bool)

(assert (=> b!823805 m!766007))

(check-sat (not start!70932) (not b!823802) (not mapNonEmpty!23905) (not b!823805) (not b_next!13149) b_and!22045 tp_is_empty!14859 (not b!823804))
(check-sat b_and!22045 (not b_next!13149))
