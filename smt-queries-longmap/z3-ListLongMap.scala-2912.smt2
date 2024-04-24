; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41614 () Bool)

(assert start!41614)

(declare-fun b_free!11281 () Bool)

(declare-fun b_next!11281 () Bool)

(assert (=> start!41614 (= b_free!11281 (not b_next!11281))))

(declare-fun tp!39843 () Bool)

(declare-fun b_and!19639 () Bool)

(assert (=> start!41614 (= tp!39843 b_and!19639)))

(declare-fun b!464821 () Bool)

(declare-fun e!271569 () Bool)

(declare-fun e!271572 () Bool)

(declare-fun mapRes!20743 () Bool)

(assert (=> b!464821 (= e!271569 (and e!271572 mapRes!20743))))

(declare-fun condMapEmpty!20743 () Bool)

(declare-datatypes ((V!18051 0))(
  ( (V!18052 (val!6399 Int)) )
))
(declare-datatypes ((ValueCell!6011 0))(
  ( (ValueCellFull!6011 (v!8687 V!18051)) (EmptyCell!6011) )
))
(declare-datatypes ((array!29200 0))(
  ( (array!29201 (arr!14030 (Array (_ BitVec 32) ValueCell!6011)) (size!14382 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29200)

(declare-fun mapDefault!20743 () ValueCell!6011)

(assert (=> b!464821 (= condMapEmpty!20743 (= (arr!14030 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6011)) mapDefault!20743)))))

(declare-fun b!464822 () Bool)

(declare-fun tp_is_empty!12709 () Bool)

(assert (=> b!464822 (= e!271572 tp_is_empty!12709)))

(declare-fun b!464823 () Bool)

(declare-fun e!271570 () Bool)

(assert (=> b!464823 (= e!271570 (not true))))

(declare-datatypes ((tuple2!8320 0))(
  ( (tuple2!8321 (_1!4171 (_ BitVec 64)) (_2!4171 V!18051)) )
))
(declare-datatypes ((List!8406 0))(
  ( (Nil!8403) (Cons!8402 (h!9258 tuple2!8320) (t!14346 List!8406)) )
))
(declare-datatypes ((ListLongMap!7235 0))(
  ( (ListLongMap!7236 (toList!3633 List!8406)) )
))
(declare-fun lt!209922 () ListLongMap!7235)

(declare-fun lt!209920 () ListLongMap!7235)

(assert (=> b!464823 (= lt!209922 lt!209920)))

(declare-fun minValueBefore!38 () V!18051)

(declare-datatypes ((Unit!13484 0))(
  ( (Unit!13485) )
))
(declare-fun lt!209921 () Unit!13484)

(declare-fun zeroValue!794 () V!18051)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29202 0))(
  ( (array!29203 (arr!14031 (Array (_ BitVec 32) (_ BitVec 64))) (size!14383 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29202)

(declare-fun minValueAfter!38 () V!18051)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!20 (array!29202 array!29200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18051 V!18051 V!18051 V!18051 (_ BitVec 32) Int) Unit!13484)

(assert (=> b!464823 (= lt!209921 (lemmaNoChangeToArrayThenSameMapNoExtras!20 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1860 (array!29202 array!29200 (_ BitVec 32) (_ BitVec 32) V!18051 V!18051 (_ BitVec 32) Int) ListLongMap!7235)

(assert (=> b!464823 (= lt!209920 (getCurrentListMapNoExtraKeys!1860 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464823 (= lt!209922 (getCurrentListMapNoExtraKeys!1860 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464824 () Bool)

(declare-fun e!271571 () Bool)

(assert (=> b!464824 (= e!271571 tp_is_empty!12709)))

(declare-fun mapNonEmpty!20743 () Bool)

(declare-fun tp!39844 () Bool)

(assert (=> mapNonEmpty!20743 (= mapRes!20743 (and tp!39844 e!271571))))

(declare-fun mapRest!20743 () (Array (_ BitVec 32) ValueCell!6011))

(declare-fun mapKey!20743 () (_ BitVec 32))

(declare-fun mapValue!20743 () ValueCell!6011)

(assert (=> mapNonEmpty!20743 (= (arr!14030 _values!833) (store mapRest!20743 mapKey!20743 mapValue!20743))))

(declare-fun b!464825 () Bool)

(declare-fun res!277902 () Bool)

(assert (=> b!464825 (=> (not res!277902) (not e!271570))))

(declare-datatypes ((List!8407 0))(
  ( (Nil!8404) (Cons!8403 (h!9259 (_ BitVec 64)) (t!14347 List!8407)) )
))
(declare-fun arrayNoDuplicates!0 (array!29202 (_ BitVec 32) List!8407) Bool)

(assert (=> b!464825 (= res!277902 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8404))))

(declare-fun b!464826 () Bool)

(declare-fun res!277903 () Bool)

(assert (=> b!464826 (=> (not res!277903) (not e!271570))))

(assert (=> b!464826 (= res!277903 (and (= (size!14382 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14383 _keys!1025) (size!14382 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464827 () Bool)

(declare-fun res!277904 () Bool)

(assert (=> b!464827 (=> (not res!277904) (not e!271570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29202 (_ BitVec 32)) Bool)

(assert (=> b!464827 (= res!277904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277901 () Bool)

(assert (=> start!41614 (=> (not res!277901) (not e!271570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41614 (= res!277901 (validMask!0 mask!1365))))

(assert (=> start!41614 e!271570))

(assert (=> start!41614 tp_is_empty!12709))

(assert (=> start!41614 tp!39843))

(assert (=> start!41614 true))

(declare-fun array_inv!10216 (array!29202) Bool)

(assert (=> start!41614 (array_inv!10216 _keys!1025)))

(declare-fun array_inv!10217 (array!29200) Bool)

(assert (=> start!41614 (and (array_inv!10217 _values!833) e!271569)))

(declare-fun mapIsEmpty!20743 () Bool)

(assert (=> mapIsEmpty!20743 mapRes!20743))

(assert (= (and start!41614 res!277901) b!464826))

(assert (= (and b!464826 res!277903) b!464827))

(assert (= (and b!464827 res!277904) b!464825))

(assert (= (and b!464825 res!277902) b!464823))

(assert (= (and b!464821 condMapEmpty!20743) mapIsEmpty!20743))

(assert (= (and b!464821 (not condMapEmpty!20743)) mapNonEmpty!20743))

(get-info :version)

(assert (= (and mapNonEmpty!20743 ((_ is ValueCellFull!6011) mapValue!20743)) b!464824))

(assert (= (and b!464821 ((_ is ValueCellFull!6011) mapDefault!20743)) b!464822))

(assert (= start!41614 b!464821))

(declare-fun m!447379 () Bool)

(assert (=> b!464825 m!447379))

(declare-fun m!447381 () Bool)

(assert (=> start!41614 m!447381))

(declare-fun m!447383 () Bool)

(assert (=> start!41614 m!447383))

(declare-fun m!447385 () Bool)

(assert (=> start!41614 m!447385))

(declare-fun m!447387 () Bool)

(assert (=> b!464827 m!447387))

(declare-fun m!447389 () Bool)

(assert (=> mapNonEmpty!20743 m!447389))

(declare-fun m!447391 () Bool)

(assert (=> b!464823 m!447391))

(declare-fun m!447393 () Bool)

(assert (=> b!464823 m!447393))

(declare-fun m!447395 () Bool)

(assert (=> b!464823 m!447395))

(check-sat (not b!464827) b_and!19639 (not b_next!11281) (not b!464823) (not b!464825) (not start!41614) (not mapNonEmpty!20743) tp_is_empty!12709)
(check-sat b_and!19639 (not b_next!11281))
