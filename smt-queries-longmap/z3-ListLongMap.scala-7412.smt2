; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94280 () Bool)

(assert start!94280)

(declare-fun b_free!21649 () Bool)

(declare-fun b_next!21649 () Bool)

(assert (=> start!94280 (= b_free!21649 (not b_next!21649))))

(declare-fun tp!76388 () Bool)

(declare-fun b_and!34395 () Bool)

(assert (=> start!94280 (= tp!76388 b_and!34395)))

(declare-fun b!1066072 () Bool)

(declare-fun e!607867 () Bool)

(declare-fun tp_is_empty!25459 () Bool)

(assert (=> b!1066072 (= e!607867 tp_is_empty!25459)))

(declare-fun res!711577 () Bool)

(declare-fun e!607862 () Bool)

(assert (=> start!94280 (=> (not res!711577) (not e!607862))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94280 (= res!711577 (validMask!0 mask!1515))))

(assert (=> start!94280 e!607862))

(assert (=> start!94280 true))

(assert (=> start!94280 tp_is_empty!25459))

(declare-datatypes ((V!39081 0))(
  ( (V!39082 (val!12780 Int)) )
))
(declare-datatypes ((ValueCell!12026 0))(
  ( (ValueCellFull!12026 (v!15392 V!39081)) (EmptyCell!12026) )
))
(declare-datatypes ((array!67844 0))(
  ( (array!67845 (arr!32624 (Array (_ BitVec 32) ValueCell!12026)) (size!33162 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67844)

(declare-fun e!607866 () Bool)

(declare-fun array_inv!25258 (array!67844) Bool)

(assert (=> start!94280 (and (array_inv!25258 _values!955) e!607866)))

(assert (=> start!94280 tp!76388))

(declare-datatypes ((array!67846 0))(
  ( (array!67847 (arr!32625 (Array (_ BitVec 32) (_ BitVec 64))) (size!33163 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67846)

(declare-fun array_inv!25259 (array!67846) Bool)

(assert (=> start!94280 (array_inv!25259 _keys!1163)))

(declare-fun mapNonEmpty!39877 () Bool)

(declare-fun mapRes!39877 () Bool)

(declare-fun tp!76387 () Bool)

(assert (=> mapNonEmpty!39877 (= mapRes!39877 (and tp!76387 e!607867))))

(declare-fun mapRest!39877 () (Array (_ BitVec 32) ValueCell!12026))

(declare-fun mapKey!39877 () (_ BitVec 32))

(declare-fun mapValue!39877 () ValueCell!12026)

(assert (=> mapNonEmpty!39877 (= (arr!32624 _values!955) (store mapRest!39877 mapKey!39877 mapValue!39877))))

(declare-fun b!1066073 () Bool)

(declare-fun e!607865 () Bool)

(assert (=> b!1066073 (= e!607862 (not e!607865))))

(declare-fun res!711576 () Bool)

(assert (=> b!1066073 (=> res!711576 e!607865)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066073 (= res!711576 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16260 0))(
  ( (tuple2!16261 (_1!8141 (_ BitVec 64)) (_2!8141 V!39081)) )
))
(declare-datatypes ((List!22806 0))(
  ( (Nil!22803) (Cons!22802 (h!24011 tuple2!16260) (t!32118 List!22806)) )
))
(declare-datatypes ((ListLongMap!14229 0))(
  ( (ListLongMap!14230 (toList!7130 List!22806)) )
))
(declare-fun lt!470394 () ListLongMap!14229)

(declare-fun lt!470391 () ListLongMap!14229)

(assert (=> b!1066073 (= lt!470394 lt!470391)))

(declare-fun zeroValueBefore!47 () V!39081)

(declare-datatypes ((Unit!34848 0))(
  ( (Unit!34849) )
))
(declare-fun lt!470392 () Unit!34848)

(declare-fun minValue!907 () V!39081)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39081)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!723 (array!67846 array!67844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39081 V!39081 V!39081 V!39081 (_ BitVec 32) Int) Unit!34848)

(assert (=> b!1066073 (= lt!470392 (lemmaNoChangeToArrayThenSameMapNoExtras!723 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3729 (array!67846 array!67844 (_ BitVec 32) (_ BitVec 32) V!39081 V!39081 (_ BitVec 32) Int) ListLongMap!14229)

(assert (=> b!1066073 (= lt!470391 (getCurrentListMapNoExtraKeys!3729 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066073 (= lt!470394 (getCurrentListMapNoExtraKeys!3729 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39877 () Bool)

(assert (=> mapIsEmpty!39877 mapRes!39877))

(declare-fun b!1066074 () Bool)

(declare-fun res!711573 () Bool)

(assert (=> b!1066074 (=> (not res!711573) (not e!607862))))

(assert (=> b!1066074 (= res!711573 (and (= (size!33162 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33163 _keys!1163) (size!33162 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066075 () Bool)

(declare-fun e!607864 () Bool)

(assert (=> b!1066075 (= e!607864 tp_is_empty!25459)))

(declare-fun b!1066076 () Bool)

(declare-fun res!711574 () Bool)

(assert (=> b!1066076 (=> (not res!711574) (not e!607862))))

(declare-datatypes ((List!22807 0))(
  ( (Nil!22804) (Cons!22803 (h!24012 (_ BitVec 64)) (t!32119 List!22807)) )
))
(declare-fun arrayNoDuplicates!0 (array!67846 (_ BitVec 32) List!22807) Bool)

(assert (=> b!1066076 (= res!711574 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22804))))

(declare-fun b!1066077 () Bool)

(assert (=> b!1066077 (= e!607865 true)))

(declare-fun lt!470388 () ListLongMap!14229)

(declare-fun lt!470395 () ListLongMap!14229)

(declare-fun -!603 (ListLongMap!14229 (_ BitVec 64)) ListLongMap!14229)

(assert (=> b!1066077 (= lt!470388 (-!603 lt!470395 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470390 () ListLongMap!14229)

(assert (=> b!1066077 (= (-!603 lt!470390 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470394)))

(declare-fun lt!470389 () Unit!34848)

(declare-fun addThenRemoveForNewKeyIsSame!21 (ListLongMap!14229 (_ BitVec 64) V!39081) Unit!34848)

(assert (=> b!1066077 (= lt!470389 (addThenRemoveForNewKeyIsSame!21 lt!470394 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470393 () ListLongMap!14229)

(assert (=> b!1066077 (and (= lt!470395 lt!470390) (= lt!470393 lt!470391))))

(declare-fun +!3169 (ListLongMap!14229 tuple2!16260) ListLongMap!14229)

(assert (=> b!1066077 (= lt!470390 (+!3169 lt!470394 (tuple2!16261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4001 (array!67846 array!67844 (_ BitVec 32) (_ BitVec 32) V!39081 V!39081 (_ BitVec 32) Int) ListLongMap!14229)

(assert (=> b!1066077 (= lt!470393 (getCurrentListMap!4001 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066077 (= lt!470395 (getCurrentListMap!4001 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066078 () Bool)

(assert (=> b!1066078 (= e!607866 (and e!607864 mapRes!39877))))

(declare-fun condMapEmpty!39877 () Bool)

(declare-fun mapDefault!39877 () ValueCell!12026)

(assert (=> b!1066078 (= condMapEmpty!39877 (= (arr!32624 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12026)) mapDefault!39877)))))

(declare-fun b!1066079 () Bool)

(declare-fun res!711575 () Bool)

(assert (=> b!1066079 (=> (not res!711575) (not e!607862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67846 (_ BitVec 32)) Bool)

(assert (=> b!1066079 (= res!711575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94280 res!711577) b!1066074))

(assert (= (and b!1066074 res!711573) b!1066079))

(assert (= (and b!1066079 res!711575) b!1066076))

(assert (= (and b!1066076 res!711574) b!1066073))

(assert (= (and b!1066073 (not res!711576)) b!1066077))

(assert (= (and b!1066078 condMapEmpty!39877) mapIsEmpty!39877))

(assert (= (and b!1066078 (not condMapEmpty!39877)) mapNonEmpty!39877))

(get-info :version)

(assert (= (and mapNonEmpty!39877 ((_ is ValueCellFull!12026) mapValue!39877)) b!1066072))

(assert (= (and b!1066078 ((_ is ValueCellFull!12026) mapDefault!39877)) b!1066075))

(assert (= start!94280 b!1066078))

(declare-fun m!984207 () Bool)

(assert (=> mapNonEmpty!39877 m!984207))

(declare-fun m!984209 () Bool)

(assert (=> b!1066076 m!984209))

(declare-fun m!984211 () Bool)

(assert (=> b!1066077 m!984211))

(declare-fun m!984213 () Bool)

(assert (=> b!1066077 m!984213))

(declare-fun m!984215 () Bool)

(assert (=> b!1066077 m!984215))

(declare-fun m!984217 () Bool)

(assert (=> b!1066077 m!984217))

(declare-fun m!984219 () Bool)

(assert (=> b!1066077 m!984219))

(declare-fun m!984221 () Bool)

(assert (=> b!1066077 m!984221))

(declare-fun m!984223 () Bool)

(assert (=> b!1066073 m!984223))

(declare-fun m!984225 () Bool)

(assert (=> b!1066073 m!984225))

(declare-fun m!984227 () Bool)

(assert (=> b!1066073 m!984227))

(declare-fun m!984229 () Bool)

(assert (=> b!1066079 m!984229))

(declare-fun m!984231 () Bool)

(assert (=> start!94280 m!984231))

(declare-fun m!984233 () Bool)

(assert (=> start!94280 m!984233))

(declare-fun m!984235 () Bool)

(assert (=> start!94280 m!984235))

(check-sat (not b_next!21649) b_and!34395 (not start!94280) (not mapNonEmpty!39877) (not b!1066079) tp_is_empty!25459 (not b!1066073) (not b!1066076) (not b!1066077))
(check-sat b_and!34395 (not b_next!21649))
