; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95086 () Bool)

(assert start!95086)

(declare-fun b_free!22189 () Bool)

(declare-fun b_next!22189 () Bool)

(assert (=> start!95086 (= b_free!22189 (not b_next!22189))))

(declare-fun tp!78049 () Bool)

(declare-fun b_and!35083 () Bool)

(assert (=> start!95086 (= tp!78049 b_and!35083)))

(declare-fun mapNonEmpty!40729 () Bool)

(declare-fun mapRes!40729 () Bool)

(declare-fun tp!78050 () Bool)

(declare-fun e!614205 () Bool)

(assert (=> mapNonEmpty!40729 (= mapRes!40729 (and tp!78050 e!614205))))

(declare-fun mapKey!40729 () (_ BitVec 32))

(declare-datatypes ((V!39801 0))(
  ( (V!39802 (val!13050 Int)) )
))
(declare-datatypes ((ValueCell!12296 0))(
  ( (ValueCellFull!12296 (v!15672 V!39801)) (EmptyCell!12296) )
))
(declare-fun mapRest!40729 () (Array (_ BitVec 32) ValueCell!12296))

(declare-datatypes ((array!68898 0))(
  ( (array!68899 (arr!33137 (Array (_ BitVec 32) ValueCell!12296)) (size!33675 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68898)

(declare-fun mapValue!40729 () ValueCell!12296)

(assert (=> mapNonEmpty!40729 (= (arr!33137 _values!955) (store mapRest!40729 mapKey!40729 mapValue!40729))))

(declare-fun mapIsEmpty!40729 () Bool)

(assert (=> mapIsEmpty!40729 mapRes!40729))

(declare-fun b!1074814 () Bool)

(declare-fun res!716623 () Bool)

(declare-fun e!614203 () Bool)

(assert (=> b!1074814 (=> (not res!716623) (not e!614203))))

(declare-datatypes ((array!68900 0))(
  ( (array!68901 (arr!33138 (Array (_ BitVec 32) (_ BitVec 64))) (size!33676 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68900)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68900 (_ BitVec 32)) Bool)

(assert (=> b!1074814 (= res!716623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074815 () Bool)

(declare-fun e!614204 () Bool)

(assert (=> b!1074815 (= e!614203 (not e!614204))))

(declare-fun res!716619 () Bool)

(assert (=> b!1074815 (=> res!716619 e!614204)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074815 (= res!716619 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16686 0))(
  ( (tuple2!16687 (_1!8354 (_ BitVec 64)) (_2!8354 V!39801)) )
))
(declare-datatypes ((List!23208 0))(
  ( (Nil!23205) (Cons!23204 (h!24413 tuple2!16686) (t!32548 List!23208)) )
))
(declare-datatypes ((ListLongMap!14655 0))(
  ( (ListLongMap!14656 (toList!7343 List!23208)) )
))
(declare-fun lt!476832 () ListLongMap!14655)

(declare-fun lt!476835 () ListLongMap!14655)

(assert (=> b!1074815 (= lt!476832 lt!476835)))

(declare-fun zeroValueBefore!47 () V!39801)

(declare-datatypes ((Unit!35231 0))(
  ( (Unit!35232) )
))
(declare-fun lt!476834 () Unit!35231)

(declare-fun minValue!907 () V!39801)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39801)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!894 (array!68900 array!68898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 V!39801 V!39801 (_ BitVec 32) Int) Unit!35231)

(assert (=> b!1074815 (= lt!476834 (lemmaNoChangeToArrayThenSameMapNoExtras!894 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3922 (array!68900 array!68898 (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 (_ BitVec 32) Int) ListLongMap!14655)

(assert (=> b!1074815 (= lt!476835 (getCurrentListMapNoExtraKeys!3922 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074815 (= lt!476832 (getCurrentListMapNoExtraKeys!3922 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074816 () Bool)

(declare-fun res!716621 () Bool)

(assert (=> b!1074816 (=> (not res!716621) (not e!614203))))

(declare-datatypes ((List!23209 0))(
  ( (Nil!23206) (Cons!23205 (h!24414 (_ BitVec 64)) (t!32549 List!23209)) )
))
(declare-fun arrayNoDuplicates!0 (array!68900 (_ BitVec 32) List!23209) Bool)

(assert (=> b!1074816 (= res!716621 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23206))))

(declare-fun b!1074817 () Bool)

(declare-fun e!614206 () Bool)

(declare-fun tp_is_empty!25999 () Bool)

(assert (=> b!1074817 (= e!614206 tp_is_empty!25999)))

(declare-fun b!1074818 () Bool)

(declare-fun res!716622 () Bool)

(assert (=> b!1074818 (=> (not res!716622) (not e!614203))))

(assert (=> b!1074818 (= res!716622 (and (= (size!33675 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33676 _keys!1163) (size!33675 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074819 () Bool)

(declare-fun e!614207 () Bool)

(assert (=> b!1074819 (= e!614207 (and e!614206 mapRes!40729))))

(declare-fun condMapEmpty!40729 () Bool)

(declare-fun mapDefault!40729 () ValueCell!12296)

(assert (=> b!1074819 (= condMapEmpty!40729 (= (arr!33137 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12296)) mapDefault!40729)))))

(declare-fun b!1074820 () Bool)

(declare-fun lt!476830 () ListLongMap!14655)

(declare-fun lt!476833 () ListLongMap!14655)

(declare-fun -!692 (ListLongMap!14655 (_ BitVec 64)) ListLongMap!14655)

(assert (=> b!1074820 (= e!614204 (= (-!692 lt!476830 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476833))))

(declare-fun lt!476829 () ListLongMap!14655)

(assert (=> b!1074820 (= (-!692 lt!476829 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476832)))

(declare-fun lt!476831 () Unit!35231)

(declare-fun addThenRemoveForNewKeyIsSame!72 (ListLongMap!14655 (_ BitVec 64) V!39801) Unit!35231)

(assert (=> b!1074820 (= lt!476831 (addThenRemoveForNewKeyIsSame!72 lt!476832 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1074820 (and (= lt!476830 lt!476829) (= lt!476833 lt!476835))))

(declare-fun +!3247 (ListLongMap!14655 tuple2!16686) ListLongMap!14655)

(assert (=> b!1074820 (= lt!476829 (+!3247 lt!476832 (tuple2!16687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4114 (array!68900 array!68898 (_ BitVec 32) (_ BitVec 32) V!39801 V!39801 (_ BitVec 32) Int) ListLongMap!14655)

(assert (=> b!1074820 (= lt!476833 (getCurrentListMap!4114 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074820 (= lt!476830 (getCurrentListMap!4114 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716620 () Bool)

(assert (=> start!95086 (=> (not res!716620) (not e!614203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95086 (= res!716620 (validMask!0 mask!1515))))

(assert (=> start!95086 e!614203))

(assert (=> start!95086 true))

(assert (=> start!95086 tp_is_empty!25999))

(declare-fun array_inv!25638 (array!68898) Bool)

(assert (=> start!95086 (and (array_inv!25638 _values!955) e!614207)))

(assert (=> start!95086 tp!78049))

(declare-fun array_inv!25639 (array!68900) Bool)

(assert (=> start!95086 (array_inv!25639 _keys!1163)))

(declare-fun b!1074821 () Bool)

(assert (=> b!1074821 (= e!614205 tp_is_empty!25999)))

(assert (= (and start!95086 res!716620) b!1074818))

(assert (= (and b!1074818 res!716622) b!1074814))

(assert (= (and b!1074814 res!716623) b!1074816))

(assert (= (and b!1074816 res!716621) b!1074815))

(assert (= (and b!1074815 (not res!716619)) b!1074820))

(assert (= (and b!1074819 condMapEmpty!40729) mapIsEmpty!40729))

(assert (= (and b!1074819 (not condMapEmpty!40729)) mapNonEmpty!40729))

(get-info :version)

(assert (= (and mapNonEmpty!40729 ((_ is ValueCellFull!12296) mapValue!40729)) b!1074821))

(assert (= (and b!1074819 ((_ is ValueCellFull!12296) mapDefault!40729)) b!1074817))

(assert (= start!95086 b!1074819))

(declare-fun m!993179 () Bool)

(assert (=> b!1074820 m!993179))

(declare-fun m!993181 () Bool)

(assert (=> b!1074820 m!993181))

(declare-fun m!993183 () Bool)

(assert (=> b!1074820 m!993183))

(declare-fun m!993185 () Bool)

(assert (=> b!1074820 m!993185))

(declare-fun m!993187 () Bool)

(assert (=> b!1074820 m!993187))

(declare-fun m!993189 () Bool)

(assert (=> b!1074820 m!993189))

(declare-fun m!993191 () Bool)

(assert (=> start!95086 m!993191))

(declare-fun m!993193 () Bool)

(assert (=> start!95086 m!993193))

(declare-fun m!993195 () Bool)

(assert (=> start!95086 m!993195))

(declare-fun m!993197 () Bool)

(assert (=> mapNonEmpty!40729 m!993197))

(declare-fun m!993199 () Bool)

(assert (=> b!1074816 m!993199))

(declare-fun m!993201 () Bool)

(assert (=> b!1074814 m!993201))

(declare-fun m!993203 () Bool)

(assert (=> b!1074815 m!993203))

(declare-fun m!993205 () Bool)

(assert (=> b!1074815 m!993205))

(declare-fun m!993207 () Bool)

(assert (=> b!1074815 m!993207))

(check-sat (not mapNonEmpty!40729) (not b!1074815) b_and!35083 (not start!95086) (not b!1074820) tp_is_empty!25999 (not b_next!22189) (not b!1074814) (not b!1074816))
(check-sat b_and!35083 (not b_next!22189))
