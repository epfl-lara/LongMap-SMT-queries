; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41988 () Bool)

(assert start!41988)

(declare-fun b_free!11575 () Bool)

(declare-fun b_next!11575 () Bool)

(assert (=> start!41988 (= b_free!11575 (not b_next!11575))))

(declare-fun tp!40741 () Bool)

(declare-fun b_and!19983 () Bool)

(assert (=> start!41988 (= tp!40741 b_and!19983)))

(declare-fun b!468893 () Bool)

(declare-fun e!274498 () Bool)

(assert (=> b!468893 (= e!274498 true)))

(declare-datatypes ((V!18443 0))(
  ( (V!18444 (val!6546 Int)) )
))
(declare-datatypes ((tuple2!8528 0))(
  ( (tuple2!8529 (_1!4275 (_ BitVec 64)) (_2!4275 V!18443)) )
))
(declare-datatypes ((List!8604 0))(
  ( (Nil!8601) (Cons!8600 (h!9456 tuple2!8528) (t!14554 List!8604)) )
))
(declare-datatypes ((ListLongMap!7443 0))(
  ( (ListLongMap!7444 (toList!3737 List!8604)) )
))
(declare-fun lt!212308 () ListLongMap!7443)

(declare-fun lt!212306 () tuple2!8528)

(declare-fun minValueBefore!38 () V!18443)

(declare-fun +!1696 (ListLongMap!7443 tuple2!8528) ListLongMap!7443)

(assert (=> b!468893 (= (+!1696 lt!212308 lt!212306) (+!1696 (+!1696 lt!212308 (tuple2!8529 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212306))))

(declare-fun minValueAfter!38 () V!18443)

(assert (=> b!468893 (= lt!212306 (tuple2!8529 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13683 0))(
  ( (Unit!13684) )
))
(declare-fun lt!212304 () Unit!13683)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!102 (ListLongMap!7443 (_ BitVec 64) V!18443 V!18443) Unit!13683)

(assert (=> b!468893 (= lt!212304 (addSameAsAddTwiceSameKeyDiffValues!102 lt!212308 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18443)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212302 () ListLongMap!7443)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29764 0))(
  ( (array!29765 (arr!14307 (Array (_ BitVec 32) (_ BitVec 64))) (size!14659 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29764)

(declare-datatypes ((ValueCell!6158 0))(
  ( (ValueCellFull!6158 (v!8836 V!18443)) (EmptyCell!6158) )
))
(declare-datatypes ((array!29766 0))(
  ( (array!29767 (arr!14308 (Array (_ BitVec 32) ValueCell!6158)) (size!14660 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29766)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2162 (array!29764 array!29766 (_ BitVec 32) (_ BitVec 32) V!18443 V!18443 (_ BitVec 32) Int) ListLongMap!7443)

(assert (=> b!468893 (= lt!212302 (getCurrentListMap!2162 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212305 () ListLongMap!7443)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468893 (= lt!212305 (getCurrentListMap!2162 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!280249 () Bool)

(declare-fun e!274501 () Bool)

(assert (=> start!41988 (=> (not res!280249) (not e!274501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41988 (= res!280249 (validMask!0 mask!1365))))

(assert (=> start!41988 e!274501))

(declare-fun tp_is_empty!13003 () Bool)

(assert (=> start!41988 tp_is_empty!13003))

(assert (=> start!41988 tp!40741))

(assert (=> start!41988 true))

(declare-fun array_inv!10420 (array!29764) Bool)

(assert (=> start!41988 (array_inv!10420 _keys!1025)))

(declare-fun e!274502 () Bool)

(declare-fun array_inv!10421 (array!29766) Bool)

(assert (=> start!41988 (and (array_inv!10421 _values!833) e!274502)))

(declare-fun b!468894 () Bool)

(declare-fun e!274497 () Bool)

(declare-fun mapRes!21199 () Bool)

(assert (=> b!468894 (= e!274502 (and e!274497 mapRes!21199))))

(declare-fun condMapEmpty!21199 () Bool)

(declare-fun mapDefault!21199 () ValueCell!6158)

(assert (=> b!468894 (= condMapEmpty!21199 (= (arr!14308 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6158)) mapDefault!21199)))))

(declare-fun mapIsEmpty!21199 () Bool)

(assert (=> mapIsEmpty!21199 mapRes!21199))

(declare-fun mapNonEmpty!21199 () Bool)

(declare-fun tp!40740 () Bool)

(declare-fun e!274500 () Bool)

(assert (=> mapNonEmpty!21199 (= mapRes!21199 (and tp!40740 e!274500))))

(declare-fun mapKey!21199 () (_ BitVec 32))

(declare-fun mapRest!21199 () (Array (_ BitVec 32) ValueCell!6158))

(declare-fun mapValue!21199 () ValueCell!6158)

(assert (=> mapNonEmpty!21199 (= (arr!14308 _values!833) (store mapRest!21199 mapKey!21199 mapValue!21199))))

(declare-fun b!468895 () Bool)

(declare-fun res!280248 () Bool)

(assert (=> b!468895 (=> (not res!280248) (not e!274501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29764 (_ BitVec 32)) Bool)

(assert (=> b!468895 (= res!280248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468896 () Bool)

(assert (=> b!468896 (= e!274497 tp_is_empty!13003)))

(declare-fun b!468897 () Bool)

(assert (=> b!468897 (= e!274501 (not e!274498))))

(declare-fun res!280250 () Bool)

(assert (=> b!468897 (=> res!280250 e!274498)))

(assert (=> b!468897 (= res!280250 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212303 () ListLongMap!7443)

(assert (=> b!468897 (= lt!212308 lt!212303)))

(declare-fun lt!212307 () Unit!13683)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!116 (array!29764 array!29766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18443 V!18443 V!18443 V!18443 (_ BitVec 32) Int) Unit!13683)

(assert (=> b!468897 (= lt!212307 (lemmaNoChangeToArrayThenSameMapNoExtras!116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1956 (array!29764 array!29766 (_ BitVec 32) (_ BitVec 32) V!18443 V!18443 (_ BitVec 32) Int) ListLongMap!7443)

(assert (=> b!468897 (= lt!212303 (getCurrentListMapNoExtraKeys!1956 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468897 (= lt!212308 (getCurrentListMapNoExtraKeys!1956 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468898 () Bool)

(declare-fun res!280252 () Bool)

(assert (=> b!468898 (=> (not res!280252) (not e!274501))))

(assert (=> b!468898 (= res!280252 (and (= (size!14660 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14659 _keys!1025) (size!14660 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468899 () Bool)

(declare-fun res!280251 () Bool)

(assert (=> b!468899 (=> (not res!280251) (not e!274501))))

(declare-datatypes ((List!8605 0))(
  ( (Nil!8602) (Cons!8601 (h!9457 (_ BitVec 64)) (t!14555 List!8605)) )
))
(declare-fun arrayNoDuplicates!0 (array!29764 (_ BitVec 32) List!8605) Bool)

(assert (=> b!468899 (= res!280251 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8602))))

(declare-fun b!468900 () Bool)

(assert (=> b!468900 (= e!274500 tp_is_empty!13003)))

(assert (= (and start!41988 res!280249) b!468898))

(assert (= (and b!468898 res!280252) b!468895))

(assert (= (and b!468895 res!280248) b!468899))

(assert (= (and b!468899 res!280251) b!468897))

(assert (= (and b!468897 (not res!280250)) b!468893))

(assert (= (and b!468894 condMapEmpty!21199) mapIsEmpty!21199))

(assert (= (and b!468894 (not condMapEmpty!21199)) mapNonEmpty!21199))

(get-info :version)

(assert (= (and mapNonEmpty!21199 ((_ is ValueCellFull!6158) mapValue!21199)) b!468900))

(assert (= (and b!468894 ((_ is ValueCellFull!6158) mapDefault!21199)) b!468896))

(assert (= start!41988 b!468894))

(declare-fun m!451203 () Bool)

(assert (=> b!468897 m!451203))

(declare-fun m!451205 () Bool)

(assert (=> b!468897 m!451205))

(declare-fun m!451207 () Bool)

(assert (=> b!468897 m!451207))

(declare-fun m!451209 () Bool)

(assert (=> mapNonEmpty!21199 m!451209))

(declare-fun m!451211 () Bool)

(assert (=> b!468899 m!451211))

(declare-fun m!451213 () Bool)

(assert (=> b!468893 m!451213))

(declare-fun m!451215 () Bool)

(assert (=> b!468893 m!451215))

(declare-fun m!451217 () Bool)

(assert (=> b!468893 m!451217))

(assert (=> b!468893 m!451213))

(declare-fun m!451219 () Bool)

(assert (=> b!468893 m!451219))

(declare-fun m!451221 () Bool)

(assert (=> b!468893 m!451221))

(declare-fun m!451223 () Bool)

(assert (=> b!468893 m!451223))

(declare-fun m!451225 () Bool)

(assert (=> start!41988 m!451225))

(declare-fun m!451227 () Bool)

(assert (=> start!41988 m!451227))

(declare-fun m!451229 () Bool)

(assert (=> start!41988 m!451229))

(declare-fun m!451231 () Bool)

(assert (=> b!468895 m!451231))

(check-sat (not b!468893) (not b!468895) b_and!19983 (not b!468897) (not mapNonEmpty!21199) tp_is_empty!13003 (not b!468899) (not start!41988) (not b_next!11575))
(check-sat b_and!19983 (not b_next!11575))
