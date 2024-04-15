; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104876 () Bool)

(assert start!104876)

(declare-fun b_free!26671 () Bool)

(declare-fun b_next!26671 () Bool)

(assert (=> start!104876 (= b_free!26671 (not b_next!26671))))

(declare-fun tp!93505 () Bool)

(declare-fun b_and!44429 () Bool)

(assert (=> start!104876 (= tp!93505 b_and!44429)))

(declare-fun b!1249969 () Bool)

(declare-fun res!833775 () Bool)

(declare-fun e!709529 () Bool)

(assert (=> b!1249969 (=> (not res!833775) (not e!709529))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80737 0))(
  ( (array!80738 (arr!38935 (Array (_ BitVec 32) (_ BitVec 64))) (size!39473 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80737)

(declare-datatypes ((V!47463 0))(
  ( (V!47464 (val!15849 Int)) )
))
(declare-datatypes ((ValueCell!15023 0))(
  ( (ValueCellFull!15023 (v!18544 V!47463)) (EmptyCell!15023) )
))
(declare-datatypes ((array!80739 0))(
  ( (array!80740 (arr!38936 (Array (_ BitVec 32) ValueCell!15023)) (size!39474 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80739)

(assert (=> b!1249969 (= res!833775 (and (= (size!39474 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39473 _keys!1118) (size!39474 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833772 () Bool)

(assert (=> start!104876 (=> (not res!833772) (not e!709529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104876 (= res!833772 (validMask!0 mask!1466))))

(assert (=> start!104876 e!709529))

(assert (=> start!104876 true))

(assert (=> start!104876 tp!93505))

(declare-fun tp_is_empty!31573 () Bool)

(assert (=> start!104876 tp_is_empty!31573))

(declare-fun array_inv!29837 (array!80737) Bool)

(assert (=> start!104876 (array_inv!29837 _keys!1118)))

(declare-fun e!709534 () Bool)

(declare-fun array_inv!29838 (array!80739) Bool)

(assert (=> start!104876 (and (array_inv!29838 _values!914) e!709534)))

(declare-fun b!1249970 () Bool)

(declare-fun e!709530 () Bool)

(assert (=> b!1249970 (= e!709530 tp_is_empty!31573)))

(declare-fun b!1249971 () Bool)

(declare-fun e!709533 () Bool)

(assert (=> b!1249971 (= e!709533 tp_is_empty!31573)))

(declare-fun b!1249972 () Bool)

(declare-fun e!709532 () Bool)

(declare-fun e!709535 () Bool)

(assert (=> b!1249972 (= e!709532 e!709535)))

(declare-fun res!833773 () Bool)

(assert (=> b!1249972 (=> res!833773 e!709535)))

(declare-datatypes ((tuple2!20496 0))(
  ( (tuple2!20497 (_1!10259 (_ BitVec 64)) (_2!10259 V!47463)) )
))
(declare-datatypes ((List!27724 0))(
  ( (Nil!27721) (Cons!27720 (h!28929 tuple2!20496) (t!41188 List!27724)) )
))
(declare-datatypes ((ListLongMap!18369 0))(
  ( (ListLongMap!18370 (toList!9200 List!27724)) )
))
(declare-fun lt!563838 () ListLongMap!18369)

(declare-fun contains!7449 (ListLongMap!18369 (_ BitVec 64)) Bool)

(assert (=> b!1249972 (= res!833773 (contains!7449 lt!563838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47463)

(declare-fun minValueBefore!43 () V!47463)

(declare-fun getCurrentListMap!4376 (array!80737 array!80739 (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 (_ BitVec 32) Int) ListLongMap!18369)

(assert (=> b!1249972 (= lt!563838 (getCurrentListMap!4376 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49123 () Bool)

(declare-fun mapRes!49123 () Bool)

(declare-fun tp!93506 () Bool)

(assert (=> mapNonEmpty!49123 (= mapRes!49123 (and tp!93506 e!709533))))

(declare-fun mapValue!49123 () ValueCell!15023)

(declare-fun mapKey!49123 () (_ BitVec 32))

(declare-fun mapRest!49123 () (Array (_ BitVec 32) ValueCell!15023))

(assert (=> mapNonEmpty!49123 (= (arr!38936 _values!914) (store mapRest!49123 mapKey!49123 mapValue!49123))))

(declare-fun b!1249973 () Bool)

(assert (=> b!1249973 (= e!709529 (not e!709532))))

(declare-fun res!833771 () Bool)

(assert (=> b!1249973 (=> res!833771 e!709532)))

(assert (=> b!1249973 (= res!833771 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!563834 () ListLongMap!18369)

(declare-fun lt!563837 () ListLongMap!18369)

(assert (=> b!1249973 (= lt!563834 lt!563837)))

(declare-fun minValueAfter!43 () V!47463)

(declare-datatypes ((Unit!41366 0))(
  ( (Unit!41367) )
))
(declare-fun lt!563836 () Unit!41366)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!938 (array!80737 array!80739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 V!47463 V!47463 (_ BitVec 32) Int) Unit!41366)

(assert (=> b!1249973 (= lt!563836 (lemmaNoChangeToArrayThenSameMapNoExtras!938 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5616 (array!80737 array!80739 (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 (_ BitVec 32) Int) ListLongMap!18369)

(assert (=> b!1249973 (= lt!563837 (getCurrentListMapNoExtraKeys!5616 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249973 (= lt!563834 (getCurrentListMapNoExtraKeys!5616 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249974 () Bool)

(declare-fun res!833770 () Bool)

(assert (=> b!1249974 (=> (not res!833770) (not e!709529))))

(declare-datatypes ((List!27725 0))(
  ( (Nil!27722) (Cons!27721 (h!28930 (_ BitVec 64)) (t!41189 List!27725)) )
))
(declare-fun arrayNoDuplicates!0 (array!80737 (_ BitVec 32) List!27725) Bool)

(assert (=> b!1249974 (= res!833770 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27722))))

(declare-fun b!1249975 () Bool)

(assert (=> b!1249975 (= e!709535 true)))

(declare-fun -!1948 (ListLongMap!18369 (_ BitVec 64)) ListLongMap!18369)

(assert (=> b!1249975 (= (-!1948 lt!563838 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563838)))

(declare-fun lt!563835 () Unit!41366)

(declare-fun removeNotPresentStillSame!76 (ListLongMap!18369 (_ BitVec 64)) Unit!41366)

(assert (=> b!1249975 (= lt!563835 (removeNotPresentStillSame!76 lt!563838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1249976 () Bool)

(assert (=> b!1249976 (= e!709534 (and e!709530 mapRes!49123))))

(declare-fun condMapEmpty!49123 () Bool)

(declare-fun mapDefault!49123 () ValueCell!15023)

(assert (=> b!1249976 (= condMapEmpty!49123 (= (arr!38936 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15023)) mapDefault!49123)))))

(declare-fun mapIsEmpty!49123 () Bool)

(assert (=> mapIsEmpty!49123 mapRes!49123))

(declare-fun b!1249977 () Bool)

(declare-fun res!833774 () Bool)

(assert (=> b!1249977 (=> (not res!833774) (not e!709529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80737 (_ BitVec 32)) Bool)

(assert (=> b!1249977 (= res!833774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104876 res!833772) b!1249969))

(assert (= (and b!1249969 res!833775) b!1249977))

(assert (= (and b!1249977 res!833774) b!1249974))

(assert (= (and b!1249974 res!833770) b!1249973))

(assert (= (and b!1249973 (not res!833771)) b!1249972))

(assert (= (and b!1249972 (not res!833773)) b!1249975))

(assert (= (and b!1249976 condMapEmpty!49123) mapIsEmpty!49123))

(assert (= (and b!1249976 (not condMapEmpty!49123)) mapNonEmpty!49123))

(get-info :version)

(assert (= (and mapNonEmpty!49123 ((_ is ValueCellFull!15023) mapValue!49123)) b!1249971))

(assert (= (and b!1249976 ((_ is ValueCellFull!15023) mapDefault!49123)) b!1249970))

(assert (= start!104876 b!1249976))

(declare-fun m!1150375 () Bool)

(assert (=> b!1249977 m!1150375))

(declare-fun m!1150377 () Bool)

(assert (=> b!1249973 m!1150377))

(declare-fun m!1150379 () Bool)

(assert (=> b!1249973 m!1150379))

(declare-fun m!1150381 () Bool)

(assert (=> b!1249973 m!1150381))

(declare-fun m!1150383 () Bool)

(assert (=> mapNonEmpty!49123 m!1150383))

(declare-fun m!1150385 () Bool)

(assert (=> b!1249974 m!1150385))

(declare-fun m!1150387 () Bool)

(assert (=> b!1249972 m!1150387))

(declare-fun m!1150389 () Bool)

(assert (=> b!1249972 m!1150389))

(declare-fun m!1150391 () Bool)

(assert (=> start!104876 m!1150391))

(declare-fun m!1150393 () Bool)

(assert (=> start!104876 m!1150393))

(declare-fun m!1150395 () Bool)

(assert (=> start!104876 m!1150395))

(declare-fun m!1150397 () Bool)

(assert (=> b!1249975 m!1150397))

(declare-fun m!1150399 () Bool)

(assert (=> b!1249975 m!1150399))

(check-sat (not start!104876) b_and!44429 (not b!1249975) (not b!1249977) (not b_next!26671) (not mapNonEmpty!49123) tp_is_empty!31573 (not b!1249974) (not b!1249973) (not b!1249972))
(check-sat b_and!44429 (not b_next!26671))
