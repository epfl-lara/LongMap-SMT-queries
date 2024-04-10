; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94646 () Bool)

(assert start!94646)

(declare-fun b_free!21915 () Bool)

(declare-fun b_next!21915 () Bool)

(assert (=> start!94646 (= b_free!21915 (not b_next!21915))))

(declare-fun tp!77200 () Bool)

(declare-fun b_and!34735 () Bool)

(assert (=> start!94646 (= tp!77200 b_and!34735)))

(declare-fun b!1070085 () Bool)

(declare-fun e!610783 () Bool)

(declare-fun tp_is_empty!25725 () Bool)

(assert (=> b!1070085 (= e!610783 tp_is_empty!25725)))

(declare-fun res!713904 () Bool)

(declare-fun e!610782 () Bool)

(assert (=> start!94646 (=> (not res!713904) (not e!610782))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94646 (= res!713904 (validMask!0 mask!1515))))

(assert (=> start!94646 e!610782))

(assert (=> start!94646 true))

(assert (=> start!94646 tp_is_empty!25725))

(declare-datatypes ((V!39435 0))(
  ( (V!39436 (val!12913 Int)) )
))
(declare-datatypes ((ValueCell!12159 0))(
  ( (ValueCellFull!12159 (v!15529 V!39435)) (EmptyCell!12159) )
))
(declare-datatypes ((array!68429 0))(
  ( (array!68430 (arr!32911 (Array (_ BitVec 32) ValueCell!12159)) (size!33447 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68429)

(declare-fun e!610778 () Bool)

(declare-fun array_inv!25460 (array!68429) Bool)

(assert (=> start!94646 (and (array_inv!25460 _values!955) e!610778)))

(assert (=> start!94646 tp!77200))

(declare-datatypes ((array!68431 0))(
  ( (array!68432 (arr!32912 (Array (_ BitVec 32) (_ BitVec 64))) (size!33448 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68431)

(declare-fun array_inv!25461 (array!68431) Bool)

(assert (=> start!94646 (array_inv!25461 _keys!1163)))

(declare-fun b!1070086 () Bool)

(declare-fun e!610779 () Bool)

(assert (=> b!1070086 (= e!610779 tp_is_empty!25725)))

(declare-fun b!1070087 () Bool)

(declare-fun e!610780 () Bool)

(assert (=> b!1070087 (= e!610780 true)))

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39435)

(declare-datatypes ((tuple2!16418 0))(
  ( (tuple2!16419 (_1!8220 (_ BitVec 64)) (_2!8220 V!39435)) )
))
(declare-datatypes ((List!22960 0))(
  ( (Nil!22957) (Cons!22956 (h!24165 tuple2!16418) (t!32291 List!22960)) )
))
(declare-datatypes ((ListLongMap!14387 0))(
  ( (ListLongMap!14388 (toList!7209 List!22960)) )
))
(declare-fun lt!472896 () ListLongMap!14387)

(declare-fun zeroValueBefore!47 () V!39435)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4113 (array!68431 array!68429 (_ BitVec 32) (_ BitVec 32) V!39435 V!39435 (_ BitVec 32) Int) ListLongMap!14387)

(assert (=> b!1070087 (= lt!472896 (getCurrentListMap!4113 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070088 () Bool)

(declare-fun res!713905 () Bool)

(assert (=> b!1070088 (=> (not res!713905) (not e!610782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68431 (_ BitVec 32)) Bool)

(assert (=> b!1070088 (= res!713905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070089 () Bool)

(declare-fun res!713903 () Bool)

(assert (=> b!1070089 (=> (not res!713903) (not e!610782))))

(declare-datatypes ((List!22961 0))(
  ( (Nil!22958) (Cons!22957 (h!24166 (_ BitVec 64)) (t!32292 List!22961)) )
))
(declare-fun arrayNoDuplicates!0 (array!68431 (_ BitVec 32) List!22961) Bool)

(assert (=> b!1070089 (= res!713903 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22958))))

(declare-fun b!1070090 () Bool)

(assert (=> b!1070090 (= e!610782 (not e!610780))))

(declare-fun res!713907 () Bool)

(assert (=> b!1070090 (=> res!713907 e!610780)))

(assert (=> b!1070090 (= res!713907 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472895 () ListLongMap!14387)

(declare-fun lt!472894 () ListLongMap!14387)

(assert (=> b!1070090 (= lt!472895 lt!472894)))

(declare-datatypes ((Unit!35217 0))(
  ( (Unit!35218) )
))
(declare-fun lt!472897 () Unit!35217)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39435)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!822 (array!68431 array!68429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39435 V!39435 V!39435 V!39435 (_ BitVec 32) Int) Unit!35217)

(assert (=> b!1070090 (= lt!472897 (lemmaNoChangeToArrayThenSameMapNoExtras!822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3785 (array!68431 array!68429 (_ BitVec 32) (_ BitVec 32) V!39435 V!39435 (_ BitVec 32) Int) ListLongMap!14387)

(assert (=> b!1070090 (= lt!472894 (getCurrentListMapNoExtraKeys!3785 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070090 (= lt!472895 (getCurrentListMapNoExtraKeys!3785 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40291 () Bool)

(declare-fun mapRes!40291 () Bool)

(declare-fun tp!77201 () Bool)

(assert (=> mapNonEmpty!40291 (= mapRes!40291 (and tp!77201 e!610783))))

(declare-fun mapKey!40291 () (_ BitVec 32))

(declare-fun mapRest!40291 () (Array (_ BitVec 32) ValueCell!12159))

(declare-fun mapValue!40291 () ValueCell!12159)

(assert (=> mapNonEmpty!40291 (= (arr!32911 _values!955) (store mapRest!40291 mapKey!40291 mapValue!40291))))

(declare-fun b!1070091 () Bool)

(assert (=> b!1070091 (= e!610778 (and e!610779 mapRes!40291))))

(declare-fun condMapEmpty!40291 () Bool)

(declare-fun mapDefault!40291 () ValueCell!12159)

(assert (=> b!1070091 (= condMapEmpty!40291 (= (arr!32911 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12159)) mapDefault!40291)))))

(declare-fun b!1070092 () Bool)

(declare-fun res!713906 () Bool)

(assert (=> b!1070092 (=> (not res!713906) (not e!610782))))

(assert (=> b!1070092 (= res!713906 (and (= (size!33447 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33448 _keys!1163) (size!33447 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40291 () Bool)

(assert (=> mapIsEmpty!40291 mapRes!40291))

(assert (= (and start!94646 res!713904) b!1070092))

(assert (= (and b!1070092 res!713906) b!1070088))

(assert (= (and b!1070088 res!713905) b!1070089))

(assert (= (and b!1070089 res!713903) b!1070090))

(assert (= (and b!1070090 (not res!713907)) b!1070087))

(assert (= (and b!1070091 condMapEmpty!40291) mapIsEmpty!40291))

(assert (= (and b!1070091 (not condMapEmpty!40291)) mapNonEmpty!40291))

(get-info :version)

(assert (= (and mapNonEmpty!40291 ((_ is ValueCellFull!12159) mapValue!40291)) b!1070085))

(assert (= (and b!1070091 ((_ is ValueCellFull!12159) mapDefault!40291)) b!1070086))

(assert (= start!94646 b!1070091))

(declare-fun m!988493 () Bool)

(assert (=> start!94646 m!988493))

(declare-fun m!988495 () Bool)

(assert (=> start!94646 m!988495))

(declare-fun m!988497 () Bool)

(assert (=> start!94646 m!988497))

(declare-fun m!988499 () Bool)

(assert (=> b!1070087 m!988499))

(declare-fun m!988501 () Bool)

(assert (=> b!1070089 m!988501))

(declare-fun m!988503 () Bool)

(assert (=> b!1070088 m!988503))

(declare-fun m!988505 () Bool)

(assert (=> b!1070090 m!988505))

(declare-fun m!988507 () Bool)

(assert (=> b!1070090 m!988507))

(declare-fun m!988509 () Bool)

(assert (=> b!1070090 m!988509))

(declare-fun m!988511 () Bool)

(assert (=> mapNonEmpty!40291 m!988511))

(check-sat (not b!1070088) (not start!94646) (not mapNonEmpty!40291) b_and!34735 tp_is_empty!25725 (not b!1070089) (not b_next!21915) (not b!1070087) (not b!1070090))
(check-sat b_and!34735 (not b_next!21915))
