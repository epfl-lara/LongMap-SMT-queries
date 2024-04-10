; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95244 () Bool)

(assert start!95244)

(declare-fun b_free!22245 () Bool)

(declare-fun b_next!22245 () Bool)

(assert (=> start!95244 (= b_free!22245 (not b_next!22245))))

(declare-fun tp!78232 () Bool)

(declare-fun b_and!35223 () Bool)

(assert (=> start!95244 (= tp!78232 b_and!35223)))

(declare-fun b!1076579 () Bool)

(declare-fun res!717537 () Bool)

(declare-fun e!615419 () Bool)

(assert (=> b!1076579 (=> (not res!717537) (not e!615419))))

(declare-datatypes ((array!69081 0))(
  ( (array!69082 (arr!33223 (Array (_ BitVec 32) (_ BitVec 64))) (size!33759 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69081)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69081 (_ BitVec 32)) Bool)

(assert (=> b!1076579 (= res!717537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076580 () Bool)

(declare-fun e!615418 () Bool)

(assert (=> b!1076580 (= e!615419 (not e!615418))))

(declare-fun res!717535 () Bool)

(assert (=> b!1076580 (=> res!717535 e!615418)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076580 (= res!717535 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39875 0))(
  ( (V!39876 (val!13078 Int)) )
))
(declare-datatypes ((tuple2!16666 0))(
  ( (tuple2!16667 (_1!8344 (_ BitVec 64)) (_2!8344 V!39875)) )
))
(declare-datatypes ((List!23198 0))(
  ( (Nil!23195) (Cons!23194 (h!24403 tuple2!16666) (t!32557 List!23198)) )
))
(declare-datatypes ((ListLongMap!14635 0))(
  ( (ListLongMap!14636 (toList!7333 List!23198)) )
))
(declare-fun lt!478328 () ListLongMap!14635)

(declare-fun lt!478332 () ListLongMap!14635)

(assert (=> b!1076580 (= lt!478328 lt!478332)))

(declare-fun zeroValueBefore!47 () V!39875)

(declare-datatypes ((ValueCell!12324 0))(
  ( (ValueCellFull!12324 (v!15706 V!39875)) (EmptyCell!12324) )
))
(declare-datatypes ((array!69083 0))(
  ( (array!69084 (arr!33224 (Array (_ BitVec 32) ValueCell!12324)) (size!33760 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69083)

(declare-datatypes ((Unit!35442 0))(
  ( (Unit!35443) )
))
(declare-fun lt!478334 () Unit!35442)

(declare-fun minValue!907 () V!39875)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39875)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!909 (array!69081 array!69083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39875 V!39875 V!39875 V!39875 (_ BitVec 32) Int) Unit!35442)

(assert (=> b!1076580 (= lt!478334 (lemmaNoChangeToArrayThenSameMapNoExtras!909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3893 (array!69081 array!69083 (_ BitVec 32) (_ BitVec 32) V!39875 V!39875 (_ BitVec 32) Int) ListLongMap!14635)

(assert (=> b!1076580 (= lt!478332 (getCurrentListMapNoExtraKeys!3893 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076580 (= lt!478328 (getCurrentListMapNoExtraKeys!3893 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478329 () ListLongMap!14635)

(declare-fun b!1076581 () Bool)

(declare-fun e!615415 () Bool)

(declare-fun lt!478327 () tuple2!16666)

(declare-fun +!3237 (ListLongMap!14635 tuple2!16666) ListLongMap!14635)

(assert (=> b!1076581 (= e!615415 (= lt!478329 (+!3237 lt!478332 lt!478327)))))

(declare-fun b!1076582 () Bool)

(declare-fun e!615417 () Bool)

(declare-fun tp_is_empty!26055 () Bool)

(assert (=> b!1076582 (= e!615417 tp_is_empty!26055)))

(declare-fun b!1076583 () Bool)

(assert (=> b!1076583 (= e!615418 true)))

(declare-fun lt!478324 () ListLongMap!14635)

(declare-fun lt!478323 () ListLongMap!14635)

(declare-fun -!719 (ListLongMap!14635 (_ BitVec 64)) ListLongMap!14635)

(assert (=> b!1076583 (= lt!478324 (-!719 lt!478323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!478322 () ListLongMap!14635)

(declare-fun lt!478333 () ListLongMap!14635)

(assert (=> b!1076583 (= lt!478322 lt!478333)))

(declare-fun lt!478325 () Unit!35442)

(declare-fun addCommutativeForDiffKeys!753 (ListLongMap!14635 (_ BitVec 64) V!39875 (_ BitVec 64) V!39875) Unit!35442)

(assert (=> b!1076583 (= lt!478325 (addCommutativeForDiffKeys!753 lt!478328 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!478331 () ListLongMap!14635)

(assert (=> b!1076583 (= (-!719 lt!478333 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478331)))

(declare-fun lt!478330 () tuple2!16666)

(assert (=> b!1076583 (= lt!478333 (+!3237 lt!478331 lt!478330))))

(declare-fun lt!478326 () Unit!35442)

(declare-fun addThenRemoveForNewKeyIsSame!84 (ListLongMap!14635 (_ BitVec 64) V!39875) Unit!35442)

(assert (=> b!1076583 (= lt!478326 (addThenRemoveForNewKeyIsSame!84 lt!478331 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1076583 (= lt!478331 (+!3237 lt!478328 lt!478327))))

(assert (=> b!1076583 e!615415))

(declare-fun res!717536 () Bool)

(assert (=> b!1076583 (=> (not res!717536) (not e!615415))))

(assert (=> b!1076583 (= res!717536 (= lt!478323 lt!478322))))

(assert (=> b!1076583 (= lt!478322 (+!3237 (+!3237 lt!478328 lt!478330) lt!478327))))

(assert (=> b!1076583 (= lt!478327 (tuple2!16667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076583 (= lt!478330 (tuple2!16667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4199 (array!69081 array!69083 (_ BitVec 32) (_ BitVec 32) V!39875 V!39875 (_ BitVec 32) Int) ListLongMap!14635)

(assert (=> b!1076583 (= lt!478329 (getCurrentListMap!4199 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076583 (= lt!478323 (getCurrentListMap!4199 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40828 () Bool)

(declare-fun mapRes!40828 () Bool)

(declare-fun tp!78233 () Bool)

(declare-fun e!615414 () Bool)

(assert (=> mapNonEmpty!40828 (= mapRes!40828 (and tp!78233 e!615414))))

(declare-fun mapValue!40828 () ValueCell!12324)

(declare-fun mapKey!40828 () (_ BitVec 32))

(declare-fun mapRest!40828 () (Array (_ BitVec 32) ValueCell!12324))

(assert (=> mapNonEmpty!40828 (= (arr!33224 _values!955) (store mapRest!40828 mapKey!40828 mapValue!40828))))

(declare-fun mapIsEmpty!40828 () Bool)

(assert (=> mapIsEmpty!40828 mapRes!40828))

(declare-fun b!1076584 () Bool)

(declare-fun e!615416 () Bool)

(assert (=> b!1076584 (= e!615416 (and e!615417 mapRes!40828))))

(declare-fun condMapEmpty!40828 () Bool)

(declare-fun mapDefault!40828 () ValueCell!12324)

(assert (=> b!1076584 (= condMapEmpty!40828 (= (arr!33224 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12324)) mapDefault!40828)))))

(declare-fun res!717534 () Bool)

(assert (=> start!95244 (=> (not res!717534) (not e!615419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95244 (= res!717534 (validMask!0 mask!1515))))

(assert (=> start!95244 e!615419))

(assert (=> start!95244 true))

(assert (=> start!95244 tp_is_empty!26055))

(declare-fun array_inv!25668 (array!69083) Bool)

(assert (=> start!95244 (and (array_inv!25668 _values!955) e!615416)))

(assert (=> start!95244 tp!78232))

(declare-fun array_inv!25669 (array!69081) Bool)

(assert (=> start!95244 (array_inv!25669 _keys!1163)))

(declare-fun b!1076585 () Bool)

(declare-fun res!717533 () Bool)

(assert (=> b!1076585 (=> (not res!717533) (not e!615419))))

(assert (=> b!1076585 (= res!717533 (and (= (size!33760 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33759 _keys!1163) (size!33760 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076586 () Bool)

(declare-fun res!717532 () Bool)

(assert (=> b!1076586 (=> (not res!717532) (not e!615419))))

(declare-datatypes ((List!23199 0))(
  ( (Nil!23196) (Cons!23195 (h!24404 (_ BitVec 64)) (t!32558 List!23199)) )
))
(declare-fun arrayNoDuplicates!0 (array!69081 (_ BitVec 32) List!23199) Bool)

(assert (=> b!1076586 (= res!717532 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23196))))

(declare-fun b!1076587 () Bool)

(assert (=> b!1076587 (= e!615414 tp_is_empty!26055)))

(assert (= (and start!95244 res!717534) b!1076585))

(assert (= (and b!1076585 res!717533) b!1076579))

(assert (= (and b!1076579 res!717537) b!1076586))

(assert (= (and b!1076586 res!717532) b!1076580))

(assert (= (and b!1076580 (not res!717535)) b!1076583))

(assert (= (and b!1076583 res!717536) b!1076581))

(assert (= (and b!1076584 condMapEmpty!40828) mapIsEmpty!40828))

(assert (= (and b!1076584 (not condMapEmpty!40828)) mapNonEmpty!40828))

(get-info :version)

(assert (= (and mapNonEmpty!40828 ((_ is ValueCellFull!12324) mapValue!40828)) b!1076587))

(assert (= (and b!1076584 ((_ is ValueCellFull!12324) mapDefault!40828)) b!1076582))

(assert (= start!95244 b!1076584))

(declare-fun m!995543 () Bool)

(assert (=> start!95244 m!995543))

(declare-fun m!995545 () Bool)

(assert (=> start!95244 m!995545))

(declare-fun m!995547 () Bool)

(assert (=> start!95244 m!995547))

(declare-fun m!995549 () Bool)

(assert (=> b!1076581 m!995549))

(declare-fun m!995551 () Bool)

(assert (=> b!1076579 m!995551))

(declare-fun m!995553 () Bool)

(assert (=> b!1076580 m!995553))

(declare-fun m!995555 () Bool)

(assert (=> b!1076580 m!995555))

(declare-fun m!995557 () Bool)

(assert (=> b!1076580 m!995557))

(declare-fun m!995559 () Bool)

(assert (=> mapNonEmpty!40828 m!995559))

(declare-fun m!995561 () Bool)

(assert (=> b!1076583 m!995561))

(declare-fun m!995563 () Bool)

(assert (=> b!1076583 m!995563))

(assert (=> b!1076583 m!995561))

(declare-fun m!995565 () Bool)

(assert (=> b!1076583 m!995565))

(declare-fun m!995567 () Bool)

(assert (=> b!1076583 m!995567))

(declare-fun m!995569 () Bool)

(assert (=> b!1076583 m!995569))

(declare-fun m!995571 () Bool)

(assert (=> b!1076583 m!995571))

(declare-fun m!995573 () Bool)

(assert (=> b!1076583 m!995573))

(declare-fun m!995575 () Bool)

(assert (=> b!1076583 m!995575))

(declare-fun m!995577 () Bool)

(assert (=> b!1076583 m!995577))

(declare-fun m!995579 () Bool)

(assert (=> b!1076583 m!995579))

(declare-fun m!995581 () Bool)

(assert (=> b!1076586 m!995581))

(check-sat (not b!1076579) (not b!1076583) (not start!95244) b_and!35223 (not b_next!22245) (not b!1076580) (not b!1076581) (not mapNonEmpty!40828) tp_is_empty!26055 (not b!1076586))
(check-sat b_and!35223 (not b_next!22245))
