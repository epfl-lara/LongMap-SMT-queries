; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94968 () Bool)

(assert start!94968)

(declare-fun b_free!21985 () Bool)

(declare-fun b_next!21985 () Bool)

(assert (=> start!94968 (= b_free!21985 (not b_next!21985))))

(declare-fun tp!77413 () Bool)

(declare-fun b_and!34825 () Bool)

(assert (=> start!94968 (= tp!77413 b_and!34825)))

(declare-fun mapNonEmpty!40399 () Bool)

(declare-fun mapRes!40399 () Bool)

(declare-fun tp!77414 () Bool)

(declare-fun e!612390 () Bool)

(assert (=> mapNonEmpty!40399 (= mapRes!40399 (and tp!77414 e!612390))))

(declare-datatypes ((V!39529 0))(
  ( (V!39530 (val!12948 Int)) )
))
(declare-datatypes ((ValueCell!12194 0))(
  ( (ValueCellFull!12194 (v!15560 V!39529)) (EmptyCell!12194) )
))
(declare-fun mapRest!40399 () (Array (_ BitVec 32) ValueCell!12194))

(declare-fun mapValue!40399 () ValueCell!12194)

(declare-datatypes ((array!68603 0))(
  ( (array!68604 (arr!32991 (Array (_ BitVec 32) ValueCell!12194)) (size!33528 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68603)

(declare-fun mapKey!40399 () (_ BitVec 32))

(assert (=> mapNonEmpty!40399 (= (arr!32991 _values!955) (store mapRest!40399 mapKey!40399 mapValue!40399))))

(declare-fun b!1072429 () Bool)

(declare-fun e!612388 () Bool)

(assert (=> b!1072429 (= e!612388 true)))

(declare-datatypes ((tuple2!16446 0))(
  ( (tuple2!16447 (_1!8234 (_ BitVec 64)) (_2!8234 V!39529)) )
))
(declare-datatypes ((List!23008 0))(
  ( (Nil!23005) (Cons!23004 (h!24222 tuple2!16446) (t!32333 List!23008)) )
))
(declare-datatypes ((ListLongMap!14423 0))(
  ( (ListLongMap!14424 (toList!7227 List!23008)) )
))
(declare-fun lt!474107 () ListLongMap!14423)

(declare-fun lt!474110 () ListLongMap!14423)

(declare-fun -!664 (ListLongMap!14423 (_ BitVec 64)) ListLongMap!14423)

(assert (=> b!1072429 (= lt!474107 (-!664 lt!474110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474116 () ListLongMap!14423)

(declare-fun lt!474111 () ListLongMap!14423)

(assert (=> b!1072429 (= lt!474116 lt!474111)))

(declare-fun zeroValueBefore!47 () V!39529)

(declare-fun lt!474112 () ListLongMap!14423)

(declare-datatypes ((Unit!35241 0))(
  ( (Unit!35242) )
))
(declare-fun lt!474115 () Unit!35241)

(declare-fun minValue!907 () V!39529)

(declare-fun addCommutativeForDiffKeys!721 (ListLongMap!14423 (_ BitVec 64) V!39529 (_ BitVec 64) V!39529) Unit!35241)

(assert (=> b!1072429 (= lt!474115 (addCommutativeForDiffKeys!721 lt!474112 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474117 () ListLongMap!14423)

(assert (=> b!1072429 (= (-!664 lt!474111 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474117)))

(declare-fun lt!474113 () tuple2!16446)

(declare-fun +!3191 (ListLongMap!14423 tuple2!16446) ListLongMap!14423)

(assert (=> b!1072429 (= lt!474111 (+!3191 lt!474117 lt!474113))))

(declare-fun lt!474114 () Unit!35241)

(declare-fun addThenRemoveForNewKeyIsSame!39 (ListLongMap!14423 (_ BitVec 64) V!39529) Unit!35241)

(assert (=> b!1072429 (= lt!474114 (addThenRemoveForNewKeyIsSame!39 lt!474117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474106 () tuple2!16446)

(assert (=> b!1072429 (= lt!474117 (+!3191 lt!474112 lt!474106))))

(declare-fun e!612386 () Bool)

(assert (=> b!1072429 e!612386))

(declare-fun res!715038 () Bool)

(assert (=> b!1072429 (=> (not res!715038) (not e!612386))))

(assert (=> b!1072429 (= res!715038 (= lt!474110 lt!474116))))

(assert (=> b!1072429 (= lt!474116 (+!3191 (+!3191 lt!474112 lt!474113) lt!474106))))

(assert (=> b!1072429 (= lt!474106 (tuple2!16447 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072429 (= lt!474113 (tuple2!16447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!474109 () ListLongMap!14423)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39529)

(declare-datatypes ((array!68605 0))(
  ( (array!68606 (arr!32992 (Array (_ BitVec 32) (_ BitVec 64))) (size!33529 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68605)

(declare-fun getCurrentListMap!4125 (array!68605 array!68603 (_ BitVec 32) (_ BitVec 32) V!39529 V!39529 (_ BitVec 32) Int) ListLongMap!14423)

(assert (=> b!1072429 (= lt!474109 (getCurrentListMap!4125 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072429 (= lt!474110 (getCurrentListMap!4125 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40399 () Bool)

(assert (=> mapIsEmpty!40399 mapRes!40399))

(declare-fun b!1072430 () Bool)

(declare-fun e!612389 () Bool)

(declare-fun e!612391 () Bool)

(assert (=> b!1072430 (= e!612389 (and e!612391 mapRes!40399))))

(declare-fun condMapEmpty!40399 () Bool)

(declare-fun mapDefault!40399 () ValueCell!12194)

(assert (=> b!1072430 (= condMapEmpty!40399 (= (arr!32991 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12194)) mapDefault!40399)))))

(declare-fun b!1072431 () Bool)

(declare-fun res!715041 () Bool)

(declare-fun e!612392 () Bool)

(assert (=> b!1072431 (=> (not res!715041) (not e!612392))))

(declare-datatypes ((List!23009 0))(
  ( (Nil!23006) (Cons!23005 (h!24223 (_ BitVec 64)) (t!32334 List!23009)) )
))
(declare-fun arrayNoDuplicates!0 (array!68605 (_ BitVec 32) List!23009) Bool)

(assert (=> b!1072431 (= res!715041 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23006))))

(declare-fun b!1072432 () Bool)

(declare-fun res!715042 () Bool)

(assert (=> b!1072432 (=> (not res!715042) (not e!612392))))

(assert (=> b!1072432 (= res!715042 (and (= (size!33528 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33529 _keys!1163) (size!33528 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072433 () Bool)

(declare-fun res!715040 () Bool)

(assert (=> b!1072433 (=> (not res!715040) (not e!612392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68605 (_ BitVec 32)) Bool)

(assert (=> b!1072433 (= res!715040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072434 () Bool)

(declare-fun tp_is_empty!25795 () Bool)

(assert (=> b!1072434 (= e!612391 tp_is_empty!25795)))

(declare-fun b!1072435 () Bool)

(assert (=> b!1072435 (= e!612390 tp_is_empty!25795)))

(declare-fun res!715039 () Bool)

(assert (=> start!94968 (=> (not res!715039) (not e!612392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94968 (= res!715039 (validMask!0 mask!1515))))

(assert (=> start!94968 e!612392))

(assert (=> start!94968 true))

(assert (=> start!94968 tp_is_empty!25795))

(declare-fun array_inv!25544 (array!68603) Bool)

(assert (=> start!94968 (and (array_inv!25544 _values!955) e!612389)))

(assert (=> start!94968 tp!77413))

(declare-fun array_inv!25545 (array!68605) Bool)

(assert (=> start!94968 (array_inv!25545 _keys!1163)))

(declare-fun b!1072436 () Bool)

(declare-fun lt!474118 () ListLongMap!14423)

(assert (=> b!1072436 (= e!612386 (= lt!474109 (+!3191 lt!474118 lt!474106)))))

(declare-fun b!1072437 () Bool)

(assert (=> b!1072437 (= e!612392 (not e!612388))))

(declare-fun res!715037 () Bool)

(assert (=> b!1072437 (=> res!715037 e!612388)))

(assert (=> b!1072437 (= res!715037 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072437 (= lt!474112 lt!474118)))

(declare-fun lt!474108 () Unit!35241)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!838 (array!68605 array!68603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39529 V!39529 V!39529 V!39529 (_ BitVec 32) Int) Unit!35241)

(assert (=> b!1072437 (= lt!474108 (lemmaNoChangeToArrayThenSameMapNoExtras!838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3835 (array!68605 array!68603 (_ BitVec 32) (_ BitVec 32) V!39529 V!39529 (_ BitVec 32) Int) ListLongMap!14423)

(assert (=> b!1072437 (= lt!474118 (getCurrentListMapNoExtraKeys!3835 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072437 (= lt!474112 (getCurrentListMapNoExtraKeys!3835 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94968 res!715039) b!1072432))

(assert (= (and b!1072432 res!715042) b!1072433))

(assert (= (and b!1072433 res!715040) b!1072431))

(assert (= (and b!1072431 res!715041) b!1072437))

(assert (= (and b!1072437 (not res!715037)) b!1072429))

(assert (= (and b!1072429 res!715038) b!1072436))

(assert (= (and b!1072430 condMapEmpty!40399) mapIsEmpty!40399))

(assert (= (and b!1072430 (not condMapEmpty!40399)) mapNonEmpty!40399))

(get-info :version)

(assert (= (and mapNonEmpty!40399 ((_ is ValueCellFull!12194) mapValue!40399)) b!1072435))

(assert (= (and b!1072430 ((_ is ValueCellFull!12194) mapDefault!40399)) b!1072434))

(assert (= start!94968 b!1072430))

(declare-fun m!991121 () Bool)

(assert (=> b!1072437 m!991121))

(declare-fun m!991123 () Bool)

(assert (=> b!1072437 m!991123))

(declare-fun m!991125 () Bool)

(assert (=> b!1072437 m!991125))

(declare-fun m!991127 () Bool)

(assert (=> b!1072431 m!991127))

(declare-fun m!991129 () Bool)

(assert (=> b!1072436 m!991129))

(declare-fun m!991131 () Bool)

(assert (=> start!94968 m!991131))

(declare-fun m!991133 () Bool)

(assert (=> start!94968 m!991133))

(declare-fun m!991135 () Bool)

(assert (=> start!94968 m!991135))

(declare-fun m!991137 () Bool)

(assert (=> mapNonEmpty!40399 m!991137))

(declare-fun m!991139 () Bool)

(assert (=> b!1072429 m!991139))

(declare-fun m!991141 () Bool)

(assert (=> b!1072429 m!991141))

(declare-fun m!991143 () Bool)

(assert (=> b!1072429 m!991143))

(declare-fun m!991145 () Bool)

(assert (=> b!1072429 m!991145))

(declare-fun m!991147 () Bool)

(assert (=> b!1072429 m!991147))

(declare-fun m!991149 () Bool)

(assert (=> b!1072429 m!991149))

(declare-fun m!991151 () Bool)

(assert (=> b!1072429 m!991151))

(assert (=> b!1072429 m!991139))

(declare-fun m!991153 () Bool)

(assert (=> b!1072429 m!991153))

(declare-fun m!991155 () Bool)

(assert (=> b!1072429 m!991155))

(declare-fun m!991157 () Bool)

(assert (=> b!1072429 m!991157))

(declare-fun m!991159 () Bool)

(assert (=> b!1072433 m!991159))

(check-sat (not b!1072433) (not start!94968) (not b!1072431) (not b!1072436) (not mapNonEmpty!40399) b_and!34825 tp_is_empty!25795 (not b_next!21985) (not b!1072437) (not b!1072429))
(check-sat b_and!34825 (not b_next!21985))
