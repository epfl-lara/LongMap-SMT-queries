; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41630 () Bool)

(assert start!41630)

(declare-fun b_free!11283 () Bool)

(declare-fun b_next!11283 () Bool)

(assert (=> start!41630 (= b_free!11283 (not b_next!11283))))

(declare-fun tp!39850 () Bool)

(declare-fun b_and!19631 () Bool)

(assert (=> start!41630 (= tp!39850 b_and!19631)))

(declare-fun b!464903 () Bool)

(declare-fun res!277921 () Bool)

(declare-fun e!271627 () Bool)

(assert (=> b!464903 (=> (not res!277921) (not e!271627))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29207 0))(
  ( (array!29208 (arr!14034 (Array (_ BitVec 32) (_ BitVec 64))) (size!14386 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29207)

(declare-datatypes ((V!18053 0))(
  ( (V!18054 (val!6400 Int)) )
))
(declare-datatypes ((ValueCell!6012 0))(
  ( (ValueCellFull!6012 (v!8687 V!18053)) (EmptyCell!6012) )
))
(declare-datatypes ((array!29209 0))(
  ( (array!29210 (arr!14035 (Array (_ BitVec 32) ValueCell!6012)) (size!14387 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29209)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!464903 (= res!277921 (and (= (size!14387 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14386 _keys!1025) (size!14387 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464904 () Bool)

(declare-fun e!271625 () Bool)

(declare-fun tp_is_empty!12711 () Bool)

(assert (=> b!464904 (= e!271625 tp_is_empty!12711)))

(declare-fun b!464905 () Bool)

(declare-fun res!277922 () Bool)

(assert (=> b!464905 (=> (not res!277922) (not e!271627))))

(declare-datatypes ((List!8477 0))(
  ( (Nil!8474) (Cons!8473 (h!9329 (_ BitVec 64)) (t!14425 List!8477)) )
))
(declare-fun arrayNoDuplicates!0 (array!29207 (_ BitVec 32) List!8477) Bool)

(assert (=> b!464905 (= res!277922 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8474))))

(declare-fun b!464906 () Bool)

(assert (=> b!464906 (= e!271627 (not true))))

(declare-datatypes ((tuple2!8386 0))(
  ( (tuple2!8387 (_1!4204 (_ BitVec 64)) (_2!4204 V!18053)) )
))
(declare-datatypes ((List!8478 0))(
  ( (Nil!8475) (Cons!8474 (h!9330 tuple2!8386) (t!14426 List!8478)) )
))
(declare-datatypes ((ListLongMap!7299 0))(
  ( (ListLongMap!7300 (toList!3665 List!8478)) )
))
(declare-fun lt!209919 () ListLongMap!7299)

(declare-fun lt!209917 () ListLongMap!7299)

(assert (=> b!464906 (= lt!209919 lt!209917)))

(declare-fun minValueBefore!38 () V!18053)

(declare-datatypes ((Unit!13498 0))(
  ( (Unit!13499) )
))
(declare-fun lt!209918 () Unit!13498)

(declare-fun zeroValue!794 () V!18053)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18053)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!25 (array!29207 array!29209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18053 V!18053 V!18053 V!18053 (_ BitVec 32) Int) Unit!13498)

(assert (=> b!464906 (= lt!209918 (lemmaNoChangeToArrayThenSameMapNoExtras!25 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1845 (array!29207 array!29209 (_ BitVec 32) (_ BitVec 32) V!18053 V!18053 (_ BitVec 32) Int) ListLongMap!7299)

(assert (=> b!464906 (= lt!209917 (getCurrentListMapNoExtraKeys!1845 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464906 (= lt!209919 (getCurrentListMapNoExtraKeys!1845 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464908 () Bool)

(declare-fun res!277923 () Bool)

(assert (=> b!464908 (=> (not res!277923) (not e!271627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29207 (_ BitVec 32)) Bool)

(assert (=> b!464908 (= res!277923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20746 () Bool)

(declare-fun mapRes!20746 () Bool)

(declare-fun tp!39849 () Bool)

(declare-fun e!271624 () Bool)

(assert (=> mapNonEmpty!20746 (= mapRes!20746 (and tp!39849 e!271624))))

(declare-fun mapValue!20746 () ValueCell!6012)

(declare-fun mapRest!20746 () (Array (_ BitVec 32) ValueCell!6012))

(declare-fun mapKey!20746 () (_ BitVec 32))

(assert (=> mapNonEmpty!20746 (= (arr!14035 _values!833) (store mapRest!20746 mapKey!20746 mapValue!20746))))

(declare-fun b!464909 () Bool)

(assert (=> b!464909 (= e!271624 tp_is_empty!12711)))

(declare-fun mapIsEmpty!20746 () Bool)

(assert (=> mapIsEmpty!20746 mapRes!20746))

(declare-fun b!464907 () Bool)

(declare-fun e!271626 () Bool)

(assert (=> b!464907 (= e!271626 (and e!271625 mapRes!20746))))

(declare-fun condMapEmpty!20746 () Bool)

(declare-fun mapDefault!20746 () ValueCell!6012)

(assert (=> b!464907 (= condMapEmpty!20746 (= (arr!14035 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6012)) mapDefault!20746)))))

(declare-fun res!277920 () Bool)

(assert (=> start!41630 (=> (not res!277920) (not e!271627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41630 (= res!277920 (validMask!0 mask!1365))))

(assert (=> start!41630 e!271627))

(assert (=> start!41630 tp_is_empty!12711))

(assert (=> start!41630 tp!39850))

(assert (=> start!41630 true))

(declare-fun array_inv!10136 (array!29207) Bool)

(assert (=> start!41630 (array_inv!10136 _keys!1025)))

(declare-fun array_inv!10137 (array!29209) Bool)

(assert (=> start!41630 (and (array_inv!10137 _values!833) e!271626)))

(assert (= (and start!41630 res!277920) b!464903))

(assert (= (and b!464903 res!277921) b!464908))

(assert (= (and b!464908 res!277923) b!464905))

(assert (= (and b!464905 res!277922) b!464906))

(assert (= (and b!464907 condMapEmpty!20746) mapIsEmpty!20746))

(assert (= (and b!464907 (not condMapEmpty!20746)) mapNonEmpty!20746))

(get-info :version)

(assert (= (and mapNonEmpty!20746 ((_ is ValueCellFull!6012) mapValue!20746)) b!464909))

(assert (= (and b!464907 ((_ is ValueCellFull!6012) mapDefault!20746)) b!464904))

(assert (= start!41630 b!464907))

(declare-fun m!447215 () Bool)

(assert (=> mapNonEmpty!20746 m!447215))

(declare-fun m!447217 () Bool)

(assert (=> start!41630 m!447217))

(declare-fun m!447219 () Bool)

(assert (=> start!41630 m!447219))

(declare-fun m!447221 () Bool)

(assert (=> start!41630 m!447221))

(declare-fun m!447223 () Bool)

(assert (=> b!464905 m!447223))

(declare-fun m!447225 () Bool)

(assert (=> b!464906 m!447225))

(declare-fun m!447227 () Bool)

(assert (=> b!464906 m!447227))

(declare-fun m!447229 () Bool)

(assert (=> b!464906 m!447229))

(declare-fun m!447231 () Bool)

(assert (=> b!464908 m!447231))

(check-sat tp_is_empty!12711 b_and!19631 (not start!41630) (not mapNonEmpty!20746) (not b!464908) (not b_next!11283) (not b!464906) (not b!464905))
(check-sat b_and!19631 (not b_next!11283))
