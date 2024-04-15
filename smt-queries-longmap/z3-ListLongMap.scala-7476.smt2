; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94798 () Bool)

(assert start!94798)

(declare-fun b_free!22033 () Bool)

(declare-fun b_next!22033 () Bool)

(assert (=> start!94798 (= b_free!22033 (not b_next!22033))))

(declare-fun tp!77561 () Bool)

(declare-fun b_and!34849 () Bool)

(assert (=> start!94798 (= tp!77561 b_and!34849)))

(declare-fun b!1071789 () Bool)

(declare-fun res!714970 () Bool)

(declare-fun e!612066 () Bool)

(assert (=> b!1071789 (=> (not res!714970) (not e!612066))))

(declare-datatypes ((array!68596 0))(
  ( (array!68597 (arr!32993 (Array (_ BitVec 32) (_ BitVec 64))) (size!33531 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68596)

(declare-datatypes ((List!23090 0))(
  ( (Nil!23087) (Cons!23086 (h!24295 (_ BitVec 64)) (t!32416 List!23090)) )
))
(declare-fun arrayNoDuplicates!0 (array!68596 (_ BitVec 32) List!23090) Bool)

(assert (=> b!1071789 (= res!714970 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23087))))

(declare-datatypes ((V!39593 0))(
  ( (V!39594 (val!12972 Int)) )
))
(declare-datatypes ((tuple2!16564 0))(
  ( (tuple2!16565 (_1!8293 (_ BitVec 64)) (_2!8293 V!39593)) )
))
(declare-datatypes ((List!23091 0))(
  ( (Nil!23088) (Cons!23087 (h!24296 tuple2!16564) (t!32417 List!23091)) )
))
(declare-datatypes ((ListLongMap!14533 0))(
  ( (ListLongMap!14534 (toList!7282 List!23091)) )
))
(declare-fun lt!474493 () ListLongMap!14533)

(declare-fun e!612067 () Bool)

(declare-fun lt!474495 () tuple2!16564)

(declare-fun lt!474491 () ListLongMap!14533)

(declare-fun b!1071790 () Bool)

(declare-fun +!3215 (ListLongMap!14533 tuple2!16564) ListLongMap!14533)

(assert (=> b!1071790 (= e!612067 (= lt!474493 (+!3215 lt!474491 lt!474495)))))

(declare-fun res!714971 () Bool)

(assert (=> start!94798 (=> (not res!714971) (not e!612066))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94798 (= res!714971 (validMask!0 mask!1515))))

(assert (=> start!94798 e!612066))

(assert (=> start!94798 true))

(declare-fun tp_is_empty!25843 () Bool)

(assert (=> start!94798 tp_is_empty!25843))

(declare-datatypes ((ValueCell!12218 0))(
  ( (ValueCellFull!12218 (v!15588 V!39593)) (EmptyCell!12218) )
))
(declare-datatypes ((array!68598 0))(
  ( (array!68599 (arr!32994 (Array (_ BitVec 32) ValueCell!12218)) (size!33532 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68598)

(declare-fun e!612065 () Bool)

(declare-fun array_inv!25524 (array!68598) Bool)

(assert (=> start!94798 (and (array_inv!25524 _values!955) e!612065)))

(assert (=> start!94798 tp!77561))

(declare-fun array_inv!25525 (array!68596) Bool)

(assert (=> start!94798 (array_inv!25525 _keys!1163)))

(declare-fun mapIsEmpty!40474 () Bool)

(declare-fun mapRes!40474 () Bool)

(assert (=> mapIsEmpty!40474 mapRes!40474))

(declare-fun b!1071791 () Bool)

(declare-fun res!714973 () Bool)

(assert (=> b!1071791 (=> (not res!714973) (not e!612066))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071791 (= res!714973 (and (= (size!33532 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33531 _keys!1163) (size!33532 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071792 () Bool)

(declare-fun e!612071 () Bool)

(assert (=> b!1071792 (= e!612066 (not e!612071))))

(declare-fun res!714968 () Bool)

(assert (=> b!1071792 (=> res!714968 e!612071)))

(assert (=> b!1071792 (= res!714968 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!474496 () ListLongMap!14533)

(assert (=> b!1071792 (= lt!474496 lt!474491)))

(declare-fun zeroValueBefore!47 () V!39593)

(declare-datatypes ((Unit!35145 0))(
  ( (Unit!35146) )
))
(declare-fun lt!474492 () Unit!35145)

(declare-fun minValue!907 () V!39593)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39593)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!860 (array!68596 array!68598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39593 V!39593 V!39593 V!39593 (_ BitVec 32) Int) Unit!35145)

(assert (=> b!1071792 (= lt!474492 (lemmaNoChangeToArrayThenSameMapNoExtras!860 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3866 (array!68596 array!68598 (_ BitVec 32) (_ BitVec 32) V!39593 V!39593 (_ BitVec 32) Int) ListLongMap!14533)

(assert (=> b!1071792 (= lt!474491 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071792 (= lt!474496 (getCurrentListMapNoExtraKeys!3866 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071793 () Bool)

(declare-fun e!612069 () Bool)

(assert (=> b!1071793 (= e!612065 (and e!612069 mapRes!40474))))

(declare-fun condMapEmpty!40474 () Bool)

(declare-fun mapDefault!40474 () ValueCell!12218)

(assert (=> b!1071793 (= condMapEmpty!40474 (= (arr!32994 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12218)) mapDefault!40474)))))

(declare-fun b!1071794 () Bool)

(declare-fun res!714972 () Bool)

(assert (=> b!1071794 (=> (not res!714972) (not e!612066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68596 (_ BitVec 32)) Bool)

(assert (=> b!1071794 (= res!714972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40474 () Bool)

(declare-fun tp!77560 () Bool)

(declare-fun e!612070 () Bool)

(assert (=> mapNonEmpty!40474 (= mapRes!40474 (and tp!77560 e!612070))))

(declare-fun mapRest!40474 () (Array (_ BitVec 32) ValueCell!12218))

(declare-fun mapValue!40474 () ValueCell!12218)

(declare-fun mapKey!40474 () (_ BitVec 32))

(assert (=> mapNonEmpty!40474 (= (arr!32994 _values!955) (store mapRest!40474 mapKey!40474 mapValue!40474))))

(declare-fun b!1071795 () Bool)

(assert (=> b!1071795 (= e!612069 tp_is_empty!25843)))

(declare-fun b!1071796 () Bool)

(assert (=> b!1071796 (= e!612071 true)))

(declare-fun lt!474487 () ListLongMap!14533)

(declare-fun lt!474494 () ListLongMap!14533)

(declare-fun -!675 (ListLongMap!14533 (_ BitVec 64)) ListLongMap!14533)

(assert (=> b!1071796 (= lt!474487 (-!675 lt!474494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474489 () ListLongMap!14533)

(declare-fun lt!474485 () ListLongMap!14533)

(assert (=> b!1071796 (= lt!474489 lt!474485)))

(declare-fun lt!474484 () Unit!35145)

(declare-fun addCommutativeForDiffKeys!733 (ListLongMap!14533 (_ BitVec 64) V!39593 (_ BitVec 64) V!39593) Unit!35145)

(assert (=> b!1071796 (= lt!474484 (addCommutativeForDiffKeys!733 lt!474496 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474488 () ListLongMap!14533)

(assert (=> b!1071796 (= (-!675 lt!474485 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474488)))

(declare-fun lt!474486 () tuple2!16564)

(assert (=> b!1071796 (= lt!474485 (+!3215 lt!474488 lt!474486))))

(declare-fun lt!474490 () Unit!35145)

(declare-fun addThenRemoveForNewKeyIsSame!56 (ListLongMap!14533 (_ BitVec 64) V!39593) Unit!35145)

(assert (=> b!1071796 (= lt!474490 (addThenRemoveForNewKeyIsSame!56 lt!474488 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071796 (= lt!474488 (+!3215 lt!474496 lt!474495))))

(assert (=> b!1071796 e!612067))

(declare-fun res!714969 () Bool)

(assert (=> b!1071796 (=> (not res!714969) (not e!612067))))

(assert (=> b!1071796 (= res!714969 (= lt!474494 lt!474489))))

(assert (=> b!1071796 (= lt!474489 (+!3215 (+!3215 lt!474496 lt!474486) lt!474495))))

(assert (=> b!1071796 (= lt!474495 (tuple2!16565 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071796 (= lt!474486 (tuple2!16565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4088 (array!68596 array!68598 (_ BitVec 32) (_ BitVec 32) V!39593 V!39593 (_ BitVec 32) Int) ListLongMap!14533)

(assert (=> b!1071796 (= lt!474493 (getCurrentListMap!4088 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071796 (= lt!474494 (getCurrentListMap!4088 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071797 () Bool)

(assert (=> b!1071797 (= e!612070 tp_is_empty!25843)))

(assert (= (and start!94798 res!714971) b!1071791))

(assert (= (and b!1071791 res!714973) b!1071794))

(assert (= (and b!1071794 res!714972) b!1071789))

(assert (= (and b!1071789 res!714970) b!1071792))

(assert (= (and b!1071792 (not res!714968)) b!1071796))

(assert (= (and b!1071796 res!714969) b!1071790))

(assert (= (and b!1071793 condMapEmpty!40474) mapIsEmpty!40474))

(assert (= (and b!1071793 (not condMapEmpty!40474)) mapNonEmpty!40474))

(get-info :version)

(assert (= (and mapNonEmpty!40474 ((_ is ValueCellFull!12218) mapValue!40474)) b!1071797))

(assert (= (and b!1071793 ((_ is ValueCellFull!12218) mapDefault!40474)) b!1071795))

(assert (= start!94798 b!1071793))

(declare-fun m!990027 () Bool)

(assert (=> b!1071796 m!990027))

(declare-fun m!990029 () Bool)

(assert (=> b!1071796 m!990029))

(declare-fun m!990031 () Bool)

(assert (=> b!1071796 m!990031))

(declare-fun m!990033 () Bool)

(assert (=> b!1071796 m!990033))

(declare-fun m!990035 () Bool)

(assert (=> b!1071796 m!990035))

(declare-fun m!990037 () Bool)

(assert (=> b!1071796 m!990037))

(declare-fun m!990039 () Bool)

(assert (=> b!1071796 m!990039))

(declare-fun m!990041 () Bool)

(assert (=> b!1071796 m!990041))

(assert (=> b!1071796 m!990041))

(declare-fun m!990043 () Bool)

(assert (=> b!1071796 m!990043))

(declare-fun m!990045 () Bool)

(assert (=> b!1071796 m!990045))

(declare-fun m!990047 () Bool)

(assert (=> b!1071790 m!990047))

(declare-fun m!990049 () Bool)

(assert (=> b!1071794 m!990049))

(declare-fun m!990051 () Bool)

(assert (=> mapNonEmpty!40474 m!990051))

(declare-fun m!990053 () Bool)

(assert (=> start!94798 m!990053))

(declare-fun m!990055 () Bool)

(assert (=> start!94798 m!990055))

(declare-fun m!990057 () Bool)

(assert (=> start!94798 m!990057))

(declare-fun m!990059 () Bool)

(assert (=> b!1071792 m!990059))

(declare-fun m!990061 () Bool)

(assert (=> b!1071792 m!990061))

(declare-fun m!990063 () Bool)

(assert (=> b!1071792 m!990063))

(declare-fun m!990065 () Bool)

(assert (=> b!1071789 m!990065))

(check-sat tp_is_empty!25843 (not mapNonEmpty!40474) (not b!1071790) (not b!1071794) (not b!1071796) (not b_next!22033) (not b!1071789) b_and!34849 (not start!94798) (not b!1071792))
(check-sat b_and!34849 (not b_next!22033))
