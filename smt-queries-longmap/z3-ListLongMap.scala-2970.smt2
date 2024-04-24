; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42062 () Bool)

(assert start!42062)

(declare-fun b_free!11629 () Bool)

(declare-fun b_next!11629 () Bool)

(assert (=> start!42062 (= b_free!11629 (not b_next!11629))))

(declare-fun tp!40905 () Bool)

(declare-fun b_and!20049 () Bool)

(assert (=> start!42062 (= tp!40905 b_and!20049)))

(declare-fun mapIsEmpty!21283 () Bool)

(declare-fun mapRes!21283 () Bool)

(assert (=> mapIsEmpty!21283 mapRes!21283))

(declare-fun b!469720 () Bool)

(declare-fun e!275096 () Bool)

(declare-fun tp_is_empty!13057 () Bool)

(assert (=> b!469720 (= e!275096 tp_is_empty!13057)))

(declare-fun b!469721 () Bool)

(declare-fun e!275098 () Bool)

(declare-fun e!275097 () Bool)

(assert (=> b!469721 (= e!275098 (and e!275097 mapRes!21283))))

(declare-fun condMapEmpty!21283 () Bool)

(declare-datatypes ((V!18515 0))(
  ( (V!18516 (val!6573 Int)) )
))
(declare-datatypes ((ValueCell!6185 0))(
  ( (ValueCellFull!6185 (v!8864 V!18515)) (EmptyCell!6185) )
))
(declare-datatypes ((array!29874 0))(
  ( (array!29875 (arr!14361 (Array (_ BitVec 32) ValueCell!6185)) (size!14713 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29874)

(declare-fun mapDefault!21283 () ValueCell!6185)

(assert (=> b!469721 (= condMapEmpty!21283 (= (arr!14361 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6185)) mapDefault!21283)))))

(declare-fun mapNonEmpty!21283 () Bool)

(declare-fun tp!40906 () Bool)

(assert (=> mapNonEmpty!21283 (= mapRes!21283 (and tp!40906 e!275096))))

(declare-fun mapKey!21283 () (_ BitVec 32))

(declare-fun mapValue!21283 () ValueCell!6185)

(declare-fun mapRest!21283 () (Array (_ BitVec 32) ValueCell!6185))

(assert (=> mapNonEmpty!21283 (= (arr!14361 _values!833) (store mapRest!21283 mapKey!21283 mapValue!21283))))

(declare-fun b!469722 () Bool)

(declare-fun e!275095 () Bool)

(declare-fun e!275100 () Bool)

(assert (=> b!469722 (= e!275095 (not e!275100))))

(declare-fun res!280734 () Bool)

(assert (=> b!469722 (=> res!280734 e!275100)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469722 (= res!280734 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8576 0))(
  ( (tuple2!8577 (_1!4299 (_ BitVec 64)) (_2!4299 V!18515)) )
))
(declare-datatypes ((List!8649 0))(
  ( (Nil!8646) (Cons!8645 (h!9501 tuple2!8576) (t!14601 List!8649)) )
))
(declare-datatypes ((ListLongMap!7491 0))(
  ( (ListLongMap!7492 (toList!3761 List!8649)) )
))
(declare-fun lt!213025 () ListLongMap!7491)

(declare-fun lt!213020 () ListLongMap!7491)

(assert (=> b!469722 (= lt!213025 lt!213020)))

(declare-fun minValueBefore!38 () V!18515)

(declare-fun zeroValue!794 () V!18515)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13733 0))(
  ( (Unit!13734) )
))
(declare-fun lt!213026 () Unit!13733)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29876 0))(
  ( (array!29877 (arr!14362 (Array (_ BitVec 32) (_ BitVec 64))) (size!14714 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29876)

(declare-fun minValueAfter!38 () V!18515)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!137 (array!29876 array!29874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 V!18515 V!18515 (_ BitVec 32) Int) Unit!13733)

(assert (=> b!469722 (= lt!213026 (lemmaNoChangeToArrayThenSameMapNoExtras!137 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1977 (array!29876 array!29874 (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 (_ BitVec 32) Int) ListLongMap!7491)

(assert (=> b!469722 (= lt!213020 (getCurrentListMapNoExtraKeys!1977 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469722 (= lt!213025 (getCurrentListMapNoExtraKeys!1977 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!280730 () Bool)

(assert (=> start!42062 (=> (not res!280730) (not e!275095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42062 (= res!280730 (validMask!0 mask!1365))))

(assert (=> start!42062 e!275095))

(assert (=> start!42062 tp_is_empty!13057))

(assert (=> start!42062 tp!40905))

(assert (=> start!42062 true))

(declare-fun array_inv!10454 (array!29876) Bool)

(assert (=> start!42062 (array_inv!10454 _keys!1025)))

(declare-fun array_inv!10455 (array!29874) Bool)

(assert (=> start!42062 (and (array_inv!10455 _values!833) e!275098)))

(declare-fun b!469723 () Bool)

(declare-fun res!280732 () Bool)

(assert (=> b!469723 (=> (not res!280732) (not e!275095))))

(assert (=> b!469723 (= res!280732 (and (= (size!14713 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14714 _keys!1025) (size!14713 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469724 () Bool)

(assert (=> b!469724 (= e!275100 true)))

(declare-fun lt!213021 () tuple2!8576)

(declare-fun +!1719 (ListLongMap!7491 tuple2!8576) ListLongMap!7491)

(assert (=> b!469724 (= (+!1719 lt!213025 lt!213021) (+!1719 (+!1719 lt!213025 (tuple2!8577 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213021))))

(assert (=> b!469724 (= lt!213021 (tuple2!8577 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!213024 () Unit!13733)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!125 (ListLongMap!7491 (_ BitVec 64) V!18515 V!18515) Unit!13733)

(assert (=> b!469724 (= lt!213024 (addSameAsAddTwiceSameKeyDiffValues!125 lt!213025 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!213023 () ListLongMap!7491)

(declare-fun getCurrentListMap!2185 (array!29876 array!29874 (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 (_ BitVec 32) Int) ListLongMap!7491)

(assert (=> b!469724 (= lt!213023 (getCurrentListMap!2185 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213022 () ListLongMap!7491)

(assert (=> b!469724 (= lt!213022 (getCurrentListMap!2185 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469725 () Bool)

(declare-fun res!280731 () Bool)

(assert (=> b!469725 (=> (not res!280731) (not e!275095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29876 (_ BitVec 32)) Bool)

(assert (=> b!469725 (= res!280731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469726 () Bool)

(declare-fun res!280733 () Bool)

(assert (=> b!469726 (=> (not res!280733) (not e!275095))))

(declare-datatypes ((List!8650 0))(
  ( (Nil!8647) (Cons!8646 (h!9502 (_ BitVec 64)) (t!14602 List!8650)) )
))
(declare-fun arrayNoDuplicates!0 (array!29876 (_ BitVec 32) List!8650) Bool)

(assert (=> b!469726 (= res!280733 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8647))))

(declare-fun b!469727 () Bool)

(assert (=> b!469727 (= e!275097 tp_is_empty!13057)))

(assert (= (and start!42062 res!280730) b!469723))

(assert (= (and b!469723 res!280732) b!469725))

(assert (= (and b!469725 res!280731) b!469726))

(assert (= (and b!469726 res!280733) b!469722))

(assert (= (and b!469722 (not res!280734)) b!469724))

(assert (= (and b!469721 condMapEmpty!21283) mapIsEmpty!21283))

(assert (= (and b!469721 (not condMapEmpty!21283)) mapNonEmpty!21283))

(get-info :version)

(assert (= (and mapNonEmpty!21283 ((_ is ValueCellFull!6185) mapValue!21283)) b!469720))

(assert (= (and b!469721 ((_ is ValueCellFull!6185) mapDefault!21283)) b!469727))

(assert (= start!42062 b!469721))

(declare-fun m!452213 () Bool)

(assert (=> mapNonEmpty!21283 m!452213))

(declare-fun m!452215 () Bool)

(assert (=> b!469725 m!452215))

(declare-fun m!452217 () Bool)

(assert (=> b!469724 m!452217))

(declare-fun m!452219 () Bool)

(assert (=> b!469724 m!452219))

(declare-fun m!452221 () Bool)

(assert (=> b!469724 m!452221))

(assert (=> b!469724 m!452219))

(declare-fun m!452223 () Bool)

(assert (=> b!469724 m!452223))

(declare-fun m!452225 () Bool)

(assert (=> b!469724 m!452225))

(declare-fun m!452227 () Bool)

(assert (=> b!469724 m!452227))

(declare-fun m!452229 () Bool)

(assert (=> b!469722 m!452229))

(declare-fun m!452231 () Bool)

(assert (=> b!469722 m!452231))

(declare-fun m!452233 () Bool)

(assert (=> b!469722 m!452233))

(declare-fun m!452235 () Bool)

(assert (=> start!42062 m!452235))

(declare-fun m!452237 () Bool)

(assert (=> start!42062 m!452237))

(declare-fun m!452239 () Bool)

(assert (=> start!42062 m!452239))

(declare-fun m!452241 () Bool)

(assert (=> b!469726 m!452241))

(check-sat (not b!469725) (not b!469722) (not start!42062) tp_is_empty!13057 (not mapNonEmpty!21283) (not b!469724) (not b_next!11629) b_and!20049 (not b!469726))
(check-sat b_and!20049 (not b_next!11629))
