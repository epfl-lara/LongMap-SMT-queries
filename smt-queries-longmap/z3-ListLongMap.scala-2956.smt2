; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41958 () Bool)

(assert start!41958)

(declare-fun b_free!11545 () Bool)

(declare-fun b_next!11545 () Bool)

(assert (=> start!41958 (= b_free!11545 (not b_next!11545))))

(declare-fun tp!40650 () Bool)

(declare-fun b_and!19917 () Bool)

(assert (=> start!41958 (= tp!40650 b_and!19917)))

(declare-fun res!279905 () Bool)

(declare-fun e!274095 () Bool)

(assert (=> start!41958 (=> (not res!279905) (not e!274095))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41958 (= res!279905 (validMask!0 mask!1365))))

(assert (=> start!41958 e!274095))

(declare-fun tp_is_empty!12973 () Bool)

(assert (=> start!41958 tp_is_empty!12973))

(assert (=> start!41958 tp!40650))

(assert (=> start!41958 true))

(declare-datatypes ((array!29707 0))(
  ( (array!29708 (arr!14279 (Array (_ BitVec 32) (_ BitVec 64))) (size!14632 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29707)

(declare-fun array_inv!10394 (array!29707) Bool)

(assert (=> start!41958 (array_inv!10394 _keys!1025)))

(declare-datatypes ((V!18403 0))(
  ( (V!18404 (val!6531 Int)) )
))
(declare-datatypes ((ValueCell!6143 0))(
  ( (ValueCellFull!6143 (v!8814 V!18403)) (EmptyCell!6143) )
))
(declare-datatypes ((array!29709 0))(
  ( (array!29710 (arr!14280 (Array (_ BitVec 32) ValueCell!6143)) (size!14633 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29709)

(declare-fun e!274096 () Bool)

(declare-fun array_inv!10395 (array!29709) Bool)

(assert (=> start!41958 (and (array_inv!10395 _values!833) e!274096)))

(declare-fun b!468323 () Bool)

(declare-fun e!274094 () Bool)

(assert (=> b!468323 (= e!274094 tp_is_empty!12973)))

(declare-fun b!468324 () Bool)

(declare-fun e!274097 () Bool)

(assert (=> b!468324 (= e!274097 tp_is_empty!12973)))

(declare-fun b!468325 () Bool)

(declare-fun e!274092 () Bool)

(assert (=> b!468325 (= e!274092 true)))

(declare-datatypes ((tuple2!8622 0))(
  ( (tuple2!8623 (_1!4322 (_ BitVec 64)) (_2!4322 V!18403)) )
))
(declare-datatypes ((List!8696 0))(
  ( (Nil!8693) (Cons!8692 (h!9548 tuple2!8622) (t!14645 List!8696)) )
))
(declare-datatypes ((ListLongMap!7525 0))(
  ( (ListLongMap!7526 (toList!3778 List!8696)) )
))
(declare-fun lt!211743 () ListLongMap!7525)

(declare-fun lt!211744 () tuple2!8622)

(declare-fun minValueBefore!38 () V!18403)

(declare-fun +!1711 (ListLongMap!7525 tuple2!8622) ListLongMap!7525)

(assert (=> b!468325 (= (+!1711 lt!211743 lt!211744) (+!1711 (+!1711 lt!211743 (tuple2!8623 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211744))))

(declare-fun minValueAfter!38 () V!18403)

(assert (=> b!468325 (= lt!211744 (tuple2!8623 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13653 0))(
  ( (Unit!13654) )
))
(declare-fun lt!211747 () Unit!13653)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!94 (ListLongMap!7525 (_ BitVec 64) V!18403 V!18403) Unit!13653)

(assert (=> b!468325 (= lt!211747 (addSameAsAddTwiceSameKeyDiffValues!94 lt!211743 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18403)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!211745 () ListLongMap!7525)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2147 (array!29707 array!29709 (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 (_ BitVec 32) Int) ListLongMap!7525)

(assert (=> b!468325 (= lt!211745 (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!211741 () ListLongMap!7525)

(assert (=> b!468325 (= lt!211741 (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468326 () Bool)

(declare-fun res!279903 () Bool)

(assert (=> b!468326 (=> (not res!279903) (not e!274095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29707 (_ BitVec 32)) Bool)

(assert (=> b!468326 (= res!279903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468327 () Bool)

(assert (=> b!468327 (= e!274095 (not e!274092))))

(declare-fun res!279901 () Bool)

(assert (=> b!468327 (=> res!279901 e!274092)))

(assert (=> b!468327 (= res!279901 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211742 () ListLongMap!7525)

(assert (=> b!468327 (= lt!211743 lt!211742)))

(declare-fun lt!211746 () Unit!13653)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!115 (array!29707 array!29709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 V!18403 V!18403 (_ BitVec 32) Int) Unit!13653)

(assert (=> b!468327 (= lt!211746 (lemmaNoChangeToArrayThenSameMapNoExtras!115 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1958 (array!29707 array!29709 (_ BitVec 32) (_ BitVec 32) V!18403 V!18403 (_ BitVec 32) Int) ListLongMap!7525)

(assert (=> b!468327 (= lt!211742 (getCurrentListMapNoExtraKeys!1958 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468327 (= lt!211743 (getCurrentListMapNoExtraKeys!1958 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21154 () Bool)

(declare-fun mapRes!21154 () Bool)

(assert (=> mapIsEmpty!21154 mapRes!21154))

(declare-fun b!468328 () Bool)

(assert (=> b!468328 (= e!274096 (and e!274097 mapRes!21154))))

(declare-fun condMapEmpty!21154 () Bool)

(declare-fun mapDefault!21154 () ValueCell!6143)

(assert (=> b!468328 (= condMapEmpty!21154 (= (arr!14280 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6143)) mapDefault!21154)))))

(declare-fun b!468329 () Bool)

(declare-fun res!279902 () Bool)

(assert (=> b!468329 (=> (not res!279902) (not e!274095))))

(declare-datatypes ((List!8697 0))(
  ( (Nil!8694) (Cons!8693 (h!9549 (_ BitVec 64)) (t!14646 List!8697)) )
))
(declare-fun arrayNoDuplicates!0 (array!29707 (_ BitVec 32) List!8697) Bool)

(assert (=> b!468329 (= res!279902 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8694))))

(declare-fun mapNonEmpty!21154 () Bool)

(declare-fun tp!40651 () Bool)

(assert (=> mapNonEmpty!21154 (= mapRes!21154 (and tp!40651 e!274094))))

(declare-fun mapRest!21154 () (Array (_ BitVec 32) ValueCell!6143))

(declare-fun mapKey!21154 () (_ BitVec 32))

(declare-fun mapValue!21154 () ValueCell!6143)

(assert (=> mapNonEmpty!21154 (= (arr!14280 _values!833) (store mapRest!21154 mapKey!21154 mapValue!21154))))

(declare-fun b!468330 () Bool)

(declare-fun res!279904 () Bool)

(assert (=> b!468330 (=> (not res!279904) (not e!274095))))

(assert (=> b!468330 (= res!279904 (and (= (size!14633 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14632 _keys!1025) (size!14633 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41958 res!279905) b!468330))

(assert (= (and b!468330 res!279904) b!468326))

(assert (= (and b!468326 res!279903) b!468329))

(assert (= (and b!468329 res!279902) b!468327))

(assert (= (and b!468327 (not res!279901)) b!468325))

(assert (= (and b!468328 condMapEmpty!21154) mapIsEmpty!21154))

(assert (= (and b!468328 (not condMapEmpty!21154)) mapNonEmpty!21154))

(get-info :version)

(assert (= (and mapNonEmpty!21154 ((_ is ValueCellFull!6143) mapValue!21154)) b!468323))

(assert (= (and b!468328 ((_ is ValueCellFull!6143) mapDefault!21154)) b!468324))

(assert (= start!41958 b!468328))

(declare-fun m!449837 () Bool)

(assert (=> b!468327 m!449837))

(declare-fun m!449839 () Bool)

(assert (=> b!468327 m!449839))

(declare-fun m!449841 () Bool)

(assert (=> b!468327 m!449841))

(declare-fun m!449843 () Bool)

(assert (=> mapNonEmpty!21154 m!449843))

(declare-fun m!449845 () Bool)

(assert (=> start!41958 m!449845))

(declare-fun m!449847 () Bool)

(assert (=> start!41958 m!449847))

(declare-fun m!449849 () Bool)

(assert (=> start!41958 m!449849))

(declare-fun m!449851 () Bool)

(assert (=> b!468326 m!449851))

(declare-fun m!449853 () Bool)

(assert (=> b!468329 m!449853))

(declare-fun m!449855 () Bool)

(assert (=> b!468325 m!449855))

(assert (=> b!468325 m!449855))

(declare-fun m!449857 () Bool)

(assert (=> b!468325 m!449857))

(declare-fun m!449859 () Bool)

(assert (=> b!468325 m!449859))

(declare-fun m!449861 () Bool)

(assert (=> b!468325 m!449861))

(declare-fun m!449863 () Bool)

(assert (=> b!468325 m!449863))

(declare-fun m!449865 () Bool)

(assert (=> b!468325 m!449865))

(check-sat (not b!468329) (not mapNonEmpty!21154) (not b!468327) (not b!468325) tp_is_empty!12973 (not b_next!11545) b_and!19917 (not b!468326) (not start!41958))
(check-sat b_and!19917 (not b_next!11545))
