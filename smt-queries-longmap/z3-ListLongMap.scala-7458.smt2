; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94892 () Bool)

(assert start!94892)

(declare-fun b_free!21925 () Bool)

(declare-fun b_next!21925 () Bool)

(assert (=> start!94892 (= b_free!21925 (not b_next!21925))))

(declare-fun tp!77230 () Bool)

(declare-fun b_and!34755 () Bool)

(assert (=> start!94892 (= tp!77230 b_and!34755)))

(declare-fun mapNonEmpty!40306 () Bool)

(declare-fun mapRes!40306 () Bool)

(declare-fun tp!77231 () Bool)

(declare-fun e!611724 () Bool)

(assert (=> mapNonEmpty!40306 (= mapRes!40306 (and tp!77231 e!611724))))

(declare-fun mapKey!40306 () (_ BitVec 32))

(declare-datatypes ((V!39449 0))(
  ( (V!39450 (val!12918 Int)) )
))
(declare-datatypes ((ValueCell!12164 0))(
  ( (ValueCellFull!12164 (v!15530 V!39449)) (EmptyCell!12164) )
))
(declare-fun mapValue!40306 () ValueCell!12164)

(declare-fun mapRest!40306 () (Array (_ BitVec 32) ValueCell!12164))

(declare-datatypes ((array!68485 0))(
  ( (array!68486 (arr!32933 (Array (_ BitVec 32) ValueCell!12164)) (size!33470 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68485)

(assert (=> mapNonEmpty!40306 (= (arr!32933 _values!955) (store mapRest!40306 mapKey!40306 mapValue!40306))))

(declare-fun b!1071532 () Bool)

(declare-fun e!611726 () Bool)

(declare-fun e!611725 () Bool)

(assert (=> b!1071532 (= e!611726 (and e!611725 mapRes!40306))))

(declare-fun condMapEmpty!40306 () Bool)

(declare-fun mapDefault!40306 () ValueCell!12164)

(assert (=> b!1071532 (= condMapEmpty!40306 (= (arr!32933 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12164)) mapDefault!40306)))))

(declare-fun b!1071533 () Bool)

(declare-fun e!611723 () Bool)

(assert (=> b!1071533 (= e!611723 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39449)

(declare-datatypes ((tuple2!16396 0))(
  ( (tuple2!16397 (_1!8209 (_ BitVec 64)) (_2!8209 V!39449)) )
))
(declare-datatypes ((List!22963 0))(
  ( (Nil!22960) (Cons!22959 (h!24177 tuple2!16396) (t!32286 List!22963)) )
))
(declare-datatypes ((ListLongMap!14373 0))(
  ( (ListLongMap!14374 (toList!7202 List!22963)) )
))
(declare-fun lt!473470 () ListLongMap!14373)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39449)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68487 0))(
  ( (array!68488 (arr!32934 (Array (_ BitVec 32) (_ BitVec 64))) (size!33471 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68487)

(declare-fun getCurrentListMap!4103 (array!68487 array!68485 (_ BitVec 32) (_ BitVec 32) V!39449 V!39449 (_ BitVec 32) Int) ListLongMap!14373)

(assert (=> b!1071533 (= lt!473470 (getCurrentListMap!4103 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071534 () Bool)

(declare-fun e!611727 () Bool)

(assert (=> b!1071534 (= e!611727 (not e!611723))))

(declare-fun res!714501 () Bool)

(assert (=> b!1071534 (=> res!714501 e!611723)))

(assert (=> b!1071534 (= res!714501 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473472 () ListLongMap!14373)

(declare-fun lt!473469 () ListLongMap!14373)

(assert (=> b!1071534 (= lt!473472 lt!473469)))

(declare-datatypes ((Unit!35196 0))(
  ( (Unit!35197) )
))
(declare-fun lt!473471 () Unit!35196)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39449)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!816 (array!68487 array!68485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39449 V!39449 V!39449 V!39449 (_ BitVec 32) Int) Unit!35196)

(assert (=> b!1071534 (= lt!473471 (lemmaNoChangeToArrayThenSameMapNoExtras!816 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3813 (array!68487 array!68485 (_ BitVec 32) (_ BitVec 32) V!39449 V!39449 (_ BitVec 32) Int) ListLongMap!14373)

(assert (=> b!1071534 (= lt!473469 (getCurrentListMapNoExtraKeys!3813 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071534 (= lt!473472 (getCurrentListMapNoExtraKeys!3813 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40306 () Bool)

(assert (=> mapIsEmpty!40306 mapRes!40306))

(declare-fun b!1071535 () Bool)

(declare-fun res!714502 () Bool)

(assert (=> b!1071535 (=> (not res!714502) (not e!611727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68487 (_ BitVec 32)) Bool)

(assert (=> b!1071535 (= res!714502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071536 () Bool)

(declare-fun tp_is_empty!25735 () Bool)

(assert (=> b!1071536 (= e!611724 tp_is_empty!25735)))

(declare-fun b!1071537 () Bool)

(assert (=> b!1071537 (= e!611725 tp_is_empty!25735)))

(declare-fun b!1071539 () Bool)

(declare-fun res!714504 () Bool)

(assert (=> b!1071539 (=> (not res!714504) (not e!611727))))

(assert (=> b!1071539 (= res!714504 (and (= (size!33470 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33471 _keys!1163) (size!33470 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071538 () Bool)

(declare-fun res!714503 () Bool)

(assert (=> b!1071538 (=> (not res!714503) (not e!611727))))

(declare-datatypes ((List!22964 0))(
  ( (Nil!22961) (Cons!22960 (h!24178 (_ BitVec 64)) (t!32287 List!22964)) )
))
(declare-fun arrayNoDuplicates!0 (array!68487 (_ BitVec 32) List!22964) Bool)

(assert (=> b!1071538 (= res!714503 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22961))))

(declare-fun res!714500 () Bool)

(assert (=> start!94892 (=> (not res!714500) (not e!611727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94892 (= res!714500 (validMask!0 mask!1515))))

(assert (=> start!94892 e!611727))

(assert (=> start!94892 true))

(assert (=> start!94892 tp_is_empty!25735))

(declare-fun array_inv!25502 (array!68485) Bool)

(assert (=> start!94892 (and (array_inv!25502 _values!955) e!611726)))

(assert (=> start!94892 tp!77230))

(declare-fun array_inv!25503 (array!68487) Bool)

(assert (=> start!94892 (array_inv!25503 _keys!1163)))

(assert (= (and start!94892 res!714500) b!1071539))

(assert (= (and b!1071539 res!714504) b!1071535))

(assert (= (and b!1071535 res!714502) b!1071538))

(assert (= (and b!1071538 res!714503) b!1071534))

(assert (= (and b!1071534 (not res!714501)) b!1071533))

(assert (= (and b!1071532 condMapEmpty!40306) mapIsEmpty!40306))

(assert (= (and b!1071532 (not condMapEmpty!40306)) mapNonEmpty!40306))

(get-info :version)

(assert (= (and mapNonEmpty!40306 ((_ is ValueCellFull!12164) mapValue!40306)) b!1071536))

(assert (= (and b!1071532 ((_ is ValueCellFull!12164) mapDefault!40306)) b!1071537))

(assert (= start!94892 b!1071532))

(declare-fun m!990265 () Bool)

(assert (=> mapNonEmpty!40306 m!990265))

(declare-fun m!990267 () Bool)

(assert (=> b!1071534 m!990267))

(declare-fun m!990269 () Bool)

(assert (=> b!1071534 m!990269))

(declare-fun m!990271 () Bool)

(assert (=> b!1071534 m!990271))

(declare-fun m!990273 () Bool)

(assert (=> b!1071535 m!990273))

(declare-fun m!990275 () Bool)

(assert (=> b!1071538 m!990275))

(declare-fun m!990277 () Bool)

(assert (=> start!94892 m!990277))

(declare-fun m!990279 () Bool)

(assert (=> start!94892 m!990279))

(declare-fun m!990281 () Bool)

(assert (=> start!94892 m!990281))

(declare-fun m!990283 () Bool)

(assert (=> b!1071533 m!990283))

(check-sat (not b!1071538) (not mapNonEmpty!40306) (not b_next!21925) (not b!1071534) tp_is_empty!25735 (not b!1071535) b_and!34755 (not b!1071533) (not start!94892))
(check-sat b_and!34755 (not b_next!21925))
