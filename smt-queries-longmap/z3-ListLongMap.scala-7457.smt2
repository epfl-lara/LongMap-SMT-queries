; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94652 () Bool)

(assert start!94652)

(declare-fun b_free!21921 () Bool)

(declare-fun b_next!21921 () Bool)

(assert (=> start!94652 (= b_free!21921 (not b_next!21921))))

(declare-fun tp!77219 () Bool)

(declare-fun b_and!34741 () Bool)

(assert (=> start!94652 (= tp!77219 b_and!34741)))

(declare-fun b!1070157 () Bool)

(declare-fun e!610834 () Bool)

(assert (=> b!1070157 (= e!610834 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39443 0))(
  ( (V!39444 (val!12916 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39443)

(declare-datatypes ((tuple2!16422 0))(
  ( (tuple2!16423 (_1!8222 (_ BitVec 64)) (_2!8222 V!39443)) )
))
(declare-datatypes ((List!22964 0))(
  ( (Nil!22961) (Cons!22960 (h!24169 tuple2!16422) (t!32295 List!22964)) )
))
(declare-datatypes ((ListLongMap!14391 0))(
  ( (ListLongMap!14392 (toList!7211 List!22964)) )
))
(declare-fun lt!472933 () ListLongMap!14391)

(declare-datatypes ((ValueCell!12162 0))(
  ( (ValueCellFull!12162 (v!15532 V!39443)) (EmptyCell!12162) )
))
(declare-datatypes ((array!68439 0))(
  ( (array!68440 (arr!32916 (Array (_ BitVec 32) ValueCell!12162)) (size!33452 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68439)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39443)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68441 0))(
  ( (array!68442 (arr!32917 (Array (_ BitVec 32) (_ BitVec 64))) (size!33453 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68441)

(declare-fun getCurrentListMap!4114 (array!68441 array!68439 (_ BitVec 32) (_ BitVec 32) V!39443 V!39443 (_ BitVec 32) Int) ListLongMap!14391)

(assert (=> b!1070157 (= lt!472933 (getCurrentListMap!4114 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070158 () Bool)

(declare-fun e!610832 () Bool)

(declare-fun tp_is_empty!25731 () Bool)

(assert (=> b!1070158 (= e!610832 tp_is_empty!25731)))

(declare-fun b!1070159 () Bool)

(declare-fun e!610833 () Bool)

(assert (=> b!1070159 (= e!610833 tp_is_empty!25731)))

(declare-fun b!1070160 () Bool)

(declare-fun e!610837 () Bool)

(declare-fun mapRes!40300 () Bool)

(assert (=> b!1070160 (= e!610837 (and e!610833 mapRes!40300))))

(declare-fun condMapEmpty!40300 () Bool)

(declare-fun mapDefault!40300 () ValueCell!12162)

(assert (=> b!1070160 (= condMapEmpty!40300 (= (arr!32916 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12162)) mapDefault!40300)))))

(declare-fun res!713951 () Bool)

(declare-fun e!610835 () Bool)

(assert (=> start!94652 (=> (not res!713951) (not e!610835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94652 (= res!713951 (validMask!0 mask!1515))))

(assert (=> start!94652 e!610835))

(assert (=> start!94652 true))

(assert (=> start!94652 tp_is_empty!25731))

(declare-fun array_inv!25464 (array!68439) Bool)

(assert (=> start!94652 (and (array_inv!25464 _values!955) e!610837)))

(assert (=> start!94652 tp!77219))

(declare-fun array_inv!25465 (array!68441) Bool)

(assert (=> start!94652 (array_inv!25465 _keys!1163)))

(declare-fun b!1070161 () Bool)

(declare-fun res!713948 () Bool)

(assert (=> b!1070161 (=> (not res!713948) (not e!610835))))

(declare-datatypes ((List!22965 0))(
  ( (Nil!22962) (Cons!22961 (h!24170 (_ BitVec 64)) (t!32296 List!22965)) )
))
(declare-fun arrayNoDuplicates!0 (array!68441 (_ BitVec 32) List!22965) Bool)

(assert (=> b!1070161 (= res!713948 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22962))))

(declare-fun mapNonEmpty!40300 () Bool)

(declare-fun tp!77218 () Bool)

(assert (=> mapNonEmpty!40300 (= mapRes!40300 (and tp!77218 e!610832))))

(declare-fun mapKey!40300 () (_ BitVec 32))

(declare-fun mapValue!40300 () ValueCell!12162)

(declare-fun mapRest!40300 () (Array (_ BitVec 32) ValueCell!12162))

(assert (=> mapNonEmpty!40300 (= (arr!32916 _values!955) (store mapRest!40300 mapKey!40300 mapValue!40300))))

(declare-fun b!1070162 () Bool)

(declare-fun res!713949 () Bool)

(assert (=> b!1070162 (=> (not res!713949) (not e!610835))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070162 (= res!713949 (and (= (size!33452 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33453 _keys!1163) (size!33452 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40300 () Bool)

(assert (=> mapIsEmpty!40300 mapRes!40300))

(declare-fun b!1070163 () Bool)

(declare-fun res!713950 () Bool)

(assert (=> b!1070163 (=> (not res!713950) (not e!610835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68441 (_ BitVec 32)) Bool)

(assert (=> b!1070163 (= res!713950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070164 () Bool)

(assert (=> b!1070164 (= e!610835 (not e!610834))))

(declare-fun res!713952 () Bool)

(assert (=> b!1070164 (=> res!713952 e!610834)))

(assert (=> b!1070164 (= res!713952 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472932 () ListLongMap!14391)

(declare-fun lt!472931 () ListLongMap!14391)

(assert (=> b!1070164 (= lt!472932 lt!472931)))

(declare-fun zeroValueAfter!47 () V!39443)

(declare-datatypes ((Unit!35221 0))(
  ( (Unit!35222) )
))
(declare-fun lt!472930 () Unit!35221)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!824 (array!68441 array!68439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39443 V!39443 V!39443 V!39443 (_ BitVec 32) Int) Unit!35221)

(assert (=> b!1070164 (= lt!472930 (lemmaNoChangeToArrayThenSameMapNoExtras!824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3787 (array!68441 array!68439 (_ BitVec 32) (_ BitVec 32) V!39443 V!39443 (_ BitVec 32) Int) ListLongMap!14391)

(assert (=> b!1070164 (= lt!472931 (getCurrentListMapNoExtraKeys!3787 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070164 (= lt!472932 (getCurrentListMapNoExtraKeys!3787 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94652 res!713951) b!1070162))

(assert (= (and b!1070162 res!713949) b!1070163))

(assert (= (and b!1070163 res!713950) b!1070161))

(assert (= (and b!1070161 res!713948) b!1070164))

(assert (= (and b!1070164 (not res!713952)) b!1070157))

(assert (= (and b!1070160 condMapEmpty!40300) mapIsEmpty!40300))

(assert (= (and b!1070160 (not condMapEmpty!40300)) mapNonEmpty!40300))

(get-info :version)

(assert (= (and mapNonEmpty!40300 ((_ is ValueCellFull!12162) mapValue!40300)) b!1070158))

(assert (= (and b!1070160 ((_ is ValueCellFull!12162) mapDefault!40300)) b!1070159))

(assert (= start!94652 b!1070160))

(declare-fun m!988553 () Bool)

(assert (=> b!1070161 m!988553))

(declare-fun m!988555 () Bool)

(assert (=> mapNonEmpty!40300 m!988555))

(declare-fun m!988557 () Bool)

(assert (=> b!1070164 m!988557))

(declare-fun m!988559 () Bool)

(assert (=> b!1070164 m!988559))

(declare-fun m!988561 () Bool)

(assert (=> b!1070164 m!988561))

(declare-fun m!988563 () Bool)

(assert (=> start!94652 m!988563))

(declare-fun m!988565 () Bool)

(assert (=> start!94652 m!988565))

(declare-fun m!988567 () Bool)

(assert (=> start!94652 m!988567))

(declare-fun m!988569 () Bool)

(assert (=> b!1070163 m!988569))

(declare-fun m!988571 () Bool)

(assert (=> b!1070157 m!988571))

(check-sat (not b!1070157) (not b_next!21921) (not b!1070164) (not start!94652) (not mapNonEmpty!40300) (not b!1070161) (not b!1070163) tp_is_empty!25731 b_and!34741)
(check-sat b_and!34741 (not b_next!21921))
