; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94674 () Bool)

(assert start!94674)

(declare-fun b_free!21949 () Bool)

(declare-fun b_next!21949 () Bool)

(assert (=> start!94674 (= b_free!21949 (not b_next!21949))))

(declare-fun tp!77302 () Bool)

(declare-fun b_and!34743 () Bool)

(assert (=> start!94674 (= tp!77302 b_and!34743)))

(declare-fun b!1070340 () Bool)

(declare-fun res!714092 () Bool)

(declare-fun e!610993 () Bool)

(assert (=> b!1070340 (=> (not res!714092) (not e!610993))))

(declare-datatypes ((array!68430 0))(
  ( (array!68431 (arr!32912 (Array (_ BitVec 32) (_ BitVec 64))) (size!33450 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68430)

(declare-datatypes ((List!23022 0))(
  ( (Nil!23019) (Cons!23018 (h!24227 (_ BitVec 64)) (t!32344 List!23022)) )
))
(declare-fun arrayNoDuplicates!0 (array!68430 (_ BitVec 32) List!23022) Bool)

(assert (=> b!1070340 (= res!714092 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23019))))

(declare-fun mapNonEmpty!40342 () Bool)

(declare-fun mapRes!40342 () Bool)

(declare-fun tp!77303 () Bool)

(declare-fun e!610996 () Bool)

(assert (=> mapNonEmpty!40342 (= mapRes!40342 (and tp!77303 e!610996))))

(declare-datatypes ((V!39481 0))(
  ( (V!39482 (val!12930 Int)) )
))
(declare-datatypes ((ValueCell!12176 0))(
  ( (ValueCellFull!12176 (v!15545 V!39481)) (EmptyCell!12176) )
))
(declare-datatypes ((array!68432 0))(
  ( (array!68433 (arr!32913 (Array (_ BitVec 32) ValueCell!12176)) (size!33451 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68432)

(declare-fun mapValue!40342 () ValueCell!12176)

(declare-fun mapRest!40342 () (Array (_ BitVec 32) ValueCell!12176))

(declare-fun mapKey!40342 () (_ BitVec 32))

(assert (=> mapNonEmpty!40342 (= (arr!32913 _values!955) (store mapRest!40342 mapKey!40342 mapValue!40342))))

(declare-fun b!1070341 () Bool)

(declare-fun e!610991 () Bool)

(declare-fun tp_is_empty!25759 () Bool)

(assert (=> b!1070341 (= e!610991 tp_is_empty!25759)))

(declare-fun b!1070342 () Bool)

(assert (=> b!1070342 (= e!610996 tp_is_empty!25759)))

(declare-fun b!1070343 () Bool)

(declare-fun e!610994 () Bool)

(assert (=> b!1070343 (= e!610994 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((tuple2!16494 0))(
  ( (tuple2!16495 (_1!8258 (_ BitVec 64)) (_2!8258 V!39481)) )
))
(declare-datatypes ((List!23023 0))(
  ( (Nil!23020) (Cons!23019 (h!24228 tuple2!16494) (t!32345 List!23023)) )
))
(declare-datatypes ((ListLongMap!14463 0))(
  ( (ListLongMap!14464 (toList!7247 List!23023)) )
))
(declare-fun lt!472898 () ListLongMap!14463)

(declare-fun zeroValueBefore!47 () V!39481)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39481)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4061 (array!68430 array!68432 (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 (_ BitVec 32) Int) ListLongMap!14463)

(assert (=> b!1070343 (= lt!472898 (getCurrentListMap!4061 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070344 () Bool)

(declare-fun res!714093 () Bool)

(assert (=> b!1070344 (=> (not res!714093) (not e!610993))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070344 (= res!714093 (and (= (size!33451 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33450 _keys!1163) (size!33451 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070345 () Bool)

(declare-fun res!714089 () Bool)

(assert (=> b!1070345 (=> (not res!714089) (not e!610993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68430 (_ BitVec 32)) Bool)

(assert (=> b!1070345 (= res!714089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070347 () Bool)

(declare-fun e!610995 () Bool)

(assert (=> b!1070347 (= e!610995 (and e!610991 mapRes!40342))))

(declare-fun condMapEmpty!40342 () Bool)

(declare-fun mapDefault!40342 () ValueCell!12176)

(assert (=> b!1070347 (= condMapEmpty!40342 (= (arr!32913 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12176)) mapDefault!40342)))))

(declare-fun mapIsEmpty!40342 () Bool)

(assert (=> mapIsEmpty!40342 mapRes!40342))

(declare-fun res!714090 () Bool)

(assert (=> start!94674 (=> (not res!714090) (not e!610993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94674 (= res!714090 (validMask!0 mask!1515))))

(assert (=> start!94674 e!610993))

(assert (=> start!94674 true))

(assert (=> start!94674 tp_is_empty!25759))

(declare-fun array_inv!25462 (array!68432) Bool)

(assert (=> start!94674 (and (array_inv!25462 _values!955) e!610995)))

(assert (=> start!94674 tp!77302))

(declare-fun array_inv!25463 (array!68430) Bool)

(assert (=> start!94674 (array_inv!25463 _keys!1163)))

(declare-fun b!1070346 () Bool)

(assert (=> b!1070346 (= e!610993 (not e!610994))))

(declare-fun res!714091 () Bool)

(assert (=> b!1070346 (=> res!714091 e!610994)))

(assert (=> b!1070346 (= res!714091 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472899 () ListLongMap!14463)

(declare-fun lt!472900 () ListLongMap!14463)

(assert (=> b!1070346 (= lt!472899 lt!472900)))

(declare-datatypes ((Unit!35078 0))(
  ( (Unit!35079) )
))
(declare-fun lt!472901 () Unit!35078)

(declare-fun zeroValueAfter!47 () V!39481)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!828 (array!68430 array!68432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 V!39481 V!39481 (_ BitVec 32) Int) Unit!35078)

(assert (=> b!1070346 (= lt!472901 (lemmaNoChangeToArrayThenSameMapNoExtras!828 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3834 (array!68430 array!68432 (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 (_ BitVec 32) Int) ListLongMap!14463)

(assert (=> b!1070346 (= lt!472900 (getCurrentListMapNoExtraKeys!3834 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070346 (= lt!472899 (getCurrentListMapNoExtraKeys!3834 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94674 res!714090) b!1070344))

(assert (= (and b!1070344 res!714093) b!1070345))

(assert (= (and b!1070345 res!714089) b!1070340))

(assert (= (and b!1070340 res!714092) b!1070346))

(assert (= (and b!1070346 (not res!714091)) b!1070343))

(assert (= (and b!1070347 condMapEmpty!40342) mapIsEmpty!40342))

(assert (= (and b!1070347 (not condMapEmpty!40342)) mapNonEmpty!40342))

(get-info :version)

(assert (= (and mapNonEmpty!40342 ((_ is ValueCellFull!12176) mapValue!40342)) b!1070342))

(assert (= (and b!1070347 ((_ is ValueCellFull!12176) mapDefault!40342)) b!1070341))

(assert (= start!94674 b!1070347))

(declare-fun m!988207 () Bool)

(assert (=> mapNonEmpty!40342 m!988207))

(declare-fun m!988209 () Bool)

(assert (=> start!94674 m!988209))

(declare-fun m!988211 () Bool)

(assert (=> start!94674 m!988211))

(declare-fun m!988213 () Bool)

(assert (=> start!94674 m!988213))

(declare-fun m!988215 () Bool)

(assert (=> b!1070343 m!988215))

(declare-fun m!988217 () Bool)

(assert (=> b!1070345 m!988217))

(declare-fun m!988219 () Bool)

(assert (=> b!1070346 m!988219))

(declare-fun m!988221 () Bool)

(assert (=> b!1070346 m!988221))

(declare-fun m!988223 () Bool)

(assert (=> b!1070346 m!988223))

(declare-fun m!988225 () Bool)

(assert (=> b!1070340 m!988225))

(check-sat (not b!1070345) (not b!1070343) tp_is_empty!25759 (not start!94674) (not b!1070340) (not b!1070346) b_and!34743 (not b_next!21949) (not mapNonEmpty!40342))
(check-sat b_and!34743 (not b_next!21949))
