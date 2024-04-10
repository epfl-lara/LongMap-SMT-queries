; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41998 () Bool)

(assert start!41998)

(declare-fun b_free!11571 () Bool)

(declare-fun b_next!11571 () Bool)

(assert (=> start!41998 (= b_free!11571 (not b_next!11571))))

(declare-fun tp!40728 () Bool)

(declare-fun b_and!19969 () Bool)

(assert (=> start!41998 (= tp!40728 b_and!19969)))

(declare-fun mapIsEmpty!21193 () Bool)

(declare-fun mapRes!21193 () Bool)

(assert (=> mapIsEmpty!21193 mapRes!21193))

(declare-fun b!468906 () Bool)

(declare-fun e!274503 () Bool)

(declare-fun e!274505 () Bool)

(assert (=> b!468906 (= e!274503 (not e!274505))))

(declare-fun res!280229 () Bool)

(assert (=> b!468906 (=> res!280229 e!274505)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468906 (= res!280229 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18437 0))(
  ( (V!18438 (val!6544 Int)) )
))
(declare-datatypes ((tuple2!8604 0))(
  ( (tuple2!8605 (_1!4313 (_ BitVec 64)) (_2!4313 V!18437)) )
))
(declare-datatypes ((List!8688 0))(
  ( (Nil!8685) (Cons!8684 (h!9540 tuple2!8604) (t!14646 List!8688)) )
))
(declare-datatypes ((ListLongMap!7517 0))(
  ( (ListLongMap!7518 (toList!3774 List!8688)) )
))
(declare-fun lt!212254 () ListLongMap!7517)

(declare-fun lt!212250 () ListLongMap!7517)

(assert (=> b!468906 (= lt!212254 lt!212250)))

(declare-fun minValueBefore!38 () V!18437)

(declare-fun zeroValue!794 () V!18437)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13703 0))(
  ( (Unit!13704) )
))
(declare-fun lt!212253 () Unit!13703)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29771 0))(
  ( (array!29772 (arr!14311 (Array (_ BitVec 32) (_ BitVec 64))) (size!14663 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29771)

(declare-datatypes ((ValueCell!6156 0))(
  ( (ValueCellFull!6156 (v!8833 V!18437)) (EmptyCell!6156) )
))
(declare-datatypes ((array!29773 0))(
  ( (array!29774 (arr!14312 (Array (_ BitVec 32) ValueCell!6156)) (size!14664 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29773)

(declare-fun minValueAfter!38 () V!18437)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!124 (array!29771 array!29773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18437 V!18437 V!18437 V!18437 (_ BitVec 32) Int) Unit!13703)

(assert (=> b!468906 (= lt!212253 (lemmaNoChangeToArrayThenSameMapNoExtras!124 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1944 (array!29771 array!29773 (_ BitVec 32) (_ BitVec 32) V!18437 V!18437 (_ BitVec 32) Int) ListLongMap!7517)

(assert (=> b!468906 (= lt!212250 (getCurrentListMapNoExtraKeys!1944 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468906 (= lt!212254 (getCurrentListMapNoExtraKeys!1944 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468907 () Bool)

(declare-fun e!274504 () Bool)

(declare-fun tp_is_empty!12999 () Bool)

(assert (=> b!468907 (= e!274504 tp_is_empty!12999)))

(declare-fun b!468908 () Bool)

(declare-fun res!280227 () Bool)

(assert (=> b!468908 (=> (not res!280227) (not e!274503))))

(declare-datatypes ((List!8689 0))(
  ( (Nil!8686) (Cons!8685 (h!9541 (_ BitVec 64)) (t!14647 List!8689)) )
))
(declare-fun arrayNoDuplicates!0 (array!29771 (_ BitVec 32) List!8689) Bool)

(assert (=> b!468908 (= res!280227 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8686))))

(declare-fun mapNonEmpty!21193 () Bool)

(declare-fun tp!40729 () Bool)

(assert (=> mapNonEmpty!21193 (= mapRes!21193 (and tp!40729 e!274504))))

(declare-fun mapRest!21193 () (Array (_ BitVec 32) ValueCell!6156))

(declare-fun mapKey!21193 () (_ BitVec 32))

(declare-fun mapValue!21193 () ValueCell!6156)

(assert (=> mapNonEmpty!21193 (= (arr!14312 _values!833) (store mapRest!21193 mapKey!21193 mapValue!21193))))

(declare-fun b!468909 () Bool)

(declare-fun res!280228 () Bool)

(assert (=> b!468909 (=> (not res!280228) (not e!274503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29771 (_ BitVec 32)) Bool)

(assert (=> b!468909 (= res!280228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!280225 () Bool)

(assert (=> start!41998 (=> (not res!280225) (not e!274503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41998 (= res!280225 (validMask!0 mask!1365))))

(assert (=> start!41998 e!274503))

(assert (=> start!41998 tp_is_empty!12999))

(assert (=> start!41998 tp!40728))

(assert (=> start!41998 true))

(declare-fun array_inv!10328 (array!29771) Bool)

(assert (=> start!41998 (array_inv!10328 _keys!1025)))

(declare-fun e!274500 () Bool)

(declare-fun array_inv!10329 (array!29773) Bool)

(assert (=> start!41998 (and (array_inv!10329 _values!833) e!274500)))

(declare-fun b!468910 () Bool)

(declare-fun e!274501 () Bool)

(assert (=> b!468910 (= e!274501 tp_is_empty!12999)))

(declare-fun b!468911 () Bool)

(assert (=> b!468911 (= e!274505 true)))

(declare-fun lt!212251 () tuple2!8604)

(declare-fun +!1685 (ListLongMap!7517 tuple2!8604) ListLongMap!7517)

(assert (=> b!468911 (= (+!1685 lt!212254 lt!212251) (+!1685 (+!1685 lt!212254 (tuple2!8605 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212251))))

(assert (=> b!468911 (= lt!212251 (tuple2!8605 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212248 () Unit!13703)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!98 (ListLongMap!7517 (_ BitVec 64) V!18437 V!18437) Unit!13703)

(assert (=> b!468911 (= lt!212248 (addSameAsAddTwiceSameKeyDiffValues!98 lt!212254 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212249 () ListLongMap!7517)

(declare-fun getCurrentListMap!2199 (array!29771 array!29773 (_ BitVec 32) (_ BitVec 32) V!18437 V!18437 (_ BitVec 32) Int) ListLongMap!7517)

(assert (=> b!468911 (= lt!212249 (getCurrentListMap!2199 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212252 () ListLongMap!7517)

(assert (=> b!468911 (= lt!212252 (getCurrentListMap!2199 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468912 () Bool)

(declare-fun res!280226 () Bool)

(assert (=> b!468912 (=> (not res!280226) (not e!274503))))

(assert (=> b!468912 (= res!280226 (and (= (size!14664 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14663 _keys!1025) (size!14664 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468913 () Bool)

(assert (=> b!468913 (= e!274500 (and e!274501 mapRes!21193))))

(declare-fun condMapEmpty!21193 () Bool)

(declare-fun mapDefault!21193 () ValueCell!6156)

(assert (=> b!468913 (= condMapEmpty!21193 (= (arr!14312 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6156)) mapDefault!21193)))))

(assert (= (and start!41998 res!280225) b!468912))

(assert (= (and b!468912 res!280226) b!468909))

(assert (= (and b!468909 res!280228) b!468908))

(assert (= (and b!468908 res!280227) b!468906))

(assert (= (and b!468906 (not res!280229)) b!468911))

(assert (= (and b!468913 condMapEmpty!21193) mapIsEmpty!21193))

(assert (= (and b!468913 (not condMapEmpty!21193)) mapNonEmpty!21193))

(get-info :version)

(assert (= (and mapNonEmpty!21193 ((_ is ValueCellFull!6156) mapValue!21193)) b!468907))

(assert (= (and b!468913 ((_ is ValueCellFull!6156) mapDefault!21193)) b!468910))

(assert (= start!41998 b!468913))

(declare-fun m!450961 () Bool)

(assert (=> start!41998 m!450961))

(declare-fun m!450963 () Bool)

(assert (=> start!41998 m!450963))

(declare-fun m!450965 () Bool)

(assert (=> start!41998 m!450965))

(declare-fun m!450967 () Bool)

(assert (=> b!468911 m!450967))

(declare-fun m!450969 () Bool)

(assert (=> b!468911 m!450969))

(declare-fun m!450971 () Bool)

(assert (=> b!468911 m!450971))

(assert (=> b!468911 m!450967))

(declare-fun m!450973 () Bool)

(assert (=> b!468911 m!450973))

(declare-fun m!450975 () Bool)

(assert (=> b!468911 m!450975))

(declare-fun m!450977 () Bool)

(assert (=> b!468911 m!450977))

(declare-fun m!450979 () Bool)

(assert (=> b!468906 m!450979))

(declare-fun m!450981 () Bool)

(assert (=> b!468906 m!450981))

(declare-fun m!450983 () Bool)

(assert (=> b!468906 m!450983))

(declare-fun m!450985 () Bool)

(assert (=> mapNonEmpty!21193 m!450985))

(declare-fun m!450987 () Bool)

(assert (=> b!468908 m!450987))

(declare-fun m!450989 () Bool)

(assert (=> b!468909 m!450989))

(check-sat (not b!468906) (not b_next!11571) b_and!19969 (not b!468911) (not mapNonEmpty!21193) (not b!468908) tp_is_empty!12999 (not start!41998) (not b!468909))
(check-sat b_and!19969 (not b_next!11571))
