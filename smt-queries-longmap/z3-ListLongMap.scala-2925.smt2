; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41706 () Bool)

(assert start!41706)

(declare-fun b_free!11359 () Bool)

(declare-fun b_next!11359 () Bool)

(assert (=> start!41706 (= b_free!11359 (not b_next!11359))))

(declare-fun tp!40080 () Bool)

(declare-fun b_and!19689 () Bool)

(assert (=> start!41706 (= tp!40080 b_and!19689)))

(declare-fun b!465571 () Bool)

(declare-fun e!272130 () Bool)

(declare-fun tp_is_empty!12787 () Bool)

(assert (=> b!465571 (= e!272130 tp_is_empty!12787)))

(declare-fun mapIsEmpty!20863 () Bool)

(declare-fun mapRes!20863 () Bool)

(assert (=> mapIsEmpty!20863 mapRes!20863))

(declare-fun b!465572 () Bool)

(declare-fun e!272132 () Bool)

(declare-fun e!272133 () Bool)

(assert (=> b!465572 (= e!272132 (and e!272133 mapRes!20863))))

(declare-fun condMapEmpty!20863 () Bool)

(declare-datatypes ((V!18155 0))(
  ( (V!18156 (val!6438 Int)) )
))
(declare-datatypes ((ValueCell!6050 0))(
  ( (ValueCellFull!6050 (v!8719 V!18155)) (EmptyCell!6050) )
))
(declare-datatypes ((array!29353 0))(
  ( (array!29354 (arr!14106 (Array (_ BitVec 32) ValueCell!6050)) (size!14459 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29353)

(declare-fun mapDefault!20863 () ValueCell!6050)

(assert (=> b!465572 (= condMapEmpty!20863 (= (arr!14106 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6050)) mapDefault!20863)))))

(declare-fun b!465573 () Bool)

(declare-fun res!278338 () Bool)

(declare-fun e!272135 () Bool)

(assert (=> b!465573 (=> (not res!278338) (not e!272135))))

(declare-datatypes ((array!29355 0))(
  ( (array!29356 (arr!14107 (Array (_ BitVec 32) (_ BitVec 64))) (size!14460 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29355)

(declare-datatypes ((List!8566 0))(
  ( (Nil!8563) (Cons!8562 (h!9418 (_ BitVec 64)) (t!14507 List!8566)) )
))
(declare-fun arrayNoDuplicates!0 (array!29355 (_ BitVec 32) List!8566) Bool)

(assert (=> b!465573 (= res!278338 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8563))))

(declare-fun b!465574 () Bool)

(declare-fun e!272131 () Bool)

(assert (=> b!465574 (= e!272135 (not e!272131))))

(declare-fun res!278337 () Bool)

(assert (=> b!465574 (=> res!278337 e!272131)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465574 (= res!278337 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8482 0))(
  ( (tuple2!8483 (_1!4252 (_ BitVec 64)) (_2!4252 V!18155)) )
))
(declare-datatypes ((List!8567 0))(
  ( (Nil!8564) (Cons!8563 (h!9419 tuple2!8482) (t!14508 List!8567)) )
))
(declare-datatypes ((ListLongMap!7385 0))(
  ( (ListLongMap!7386 (toList!3708 List!8567)) )
))
(declare-fun lt!210178 () ListLongMap!7385)

(declare-fun lt!210180 () ListLongMap!7385)

(assert (=> b!465574 (= lt!210178 lt!210180)))

(declare-fun minValueBefore!38 () V!18155)

(declare-fun zeroValue!794 () V!18155)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13526 0))(
  ( (Unit!13527) )
))
(declare-fun lt!210179 () Unit!13526)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18155)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!54 (array!29355 array!29353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18155 V!18155 V!18155 V!18155 (_ BitVec 32) Int) Unit!13526)

(assert (=> b!465574 (= lt!210179 (lemmaNoChangeToArrayThenSameMapNoExtras!54 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1897 (array!29355 array!29353 (_ BitVec 32) (_ BitVec 32) V!18155 V!18155 (_ BitVec 32) Int) ListLongMap!7385)

(assert (=> b!465574 (= lt!210180 (getCurrentListMapNoExtraKeys!1897 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465574 (= lt!210178 (getCurrentListMapNoExtraKeys!1897 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465575 () Bool)

(assert (=> b!465575 (= e!272131 true)))

(declare-fun lt!210181 () ListLongMap!7385)

(declare-fun getCurrentListMap!2101 (array!29355 array!29353 (_ BitVec 32) (_ BitVec 32) V!18155 V!18155 (_ BitVec 32) Int) ListLongMap!7385)

(assert (=> b!465575 (= lt!210181 (getCurrentListMap!2101 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210177 () ListLongMap!7385)

(declare-fun +!1682 (ListLongMap!7385 tuple2!8482) ListLongMap!7385)

(assert (=> b!465575 (= lt!210177 (+!1682 (getCurrentListMap!2101 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8483 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465576 () Bool)

(declare-fun res!278335 () Bool)

(assert (=> b!465576 (=> (not res!278335) (not e!272135))))

(assert (=> b!465576 (= res!278335 (and (= (size!14459 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14460 _keys!1025) (size!14459 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!278336 () Bool)

(assert (=> start!41706 (=> (not res!278336) (not e!272135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41706 (= res!278336 (validMask!0 mask!1365))))

(assert (=> start!41706 e!272135))

(assert (=> start!41706 tp_is_empty!12787))

(assert (=> start!41706 tp!40080))

(assert (=> start!41706 true))

(declare-fun array_inv!10266 (array!29355) Bool)

(assert (=> start!41706 (array_inv!10266 _keys!1025)))

(declare-fun array_inv!10267 (array!29353) Bool)

(assert (=> start!41706 (and (array_inv!10267 _values!833) e!272132)))

(declare-fun mapNonEmpty!20863 () Bool)

(declare-fun tp!40081 () Bool)

(assert (=> mapNonEmpty!20863 (= mapRes!20863 (and tp!40081 e!272130))))

(declare-fun mapValue!20863 () ValueCell!6050)

(declare-fun mapRest!20863 () (Array (_ BitVec 32) ValueCell!6050))

(declare-fun mapKey!20863 () (_ BitVec 32))

(assert (=> mapNonEmpty!20863 (= (arr!14106 _values!833) (store mapRest!20863 mapKey!20863 mapValue!20863))))

(declare-fun b!465577 () Bool)

(assert (=> b!465577 (= e!272133 tp_is_empty!12787)))

(declare-fun b!465578 () Bool)

(declare-fun res!278334 () Bool)

(assert (=> b!465578 (=> (not res!278334) (not e!272135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29355 (_ BitVec 32)) Bool)

(assert (=> b!465578 (= res!278334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41706 res!278336) b!465576))

(assert (= (and b!465576 res!278335) b!465578))

(assert (= (and b!465578 res!278334) b!465573))

(assert (= (and b!465573 res!278338) b!465574))

(assert (= (and b!465574 (not res!278337)) b!465575))

(assert (= (and b!465572 condMapEmpty!20863) mapIsEmpty!20863))

(assert (= (and b!465572 (not condMapEmpty!20863)) mapNonEmpty!20863))

(get-info :version)

(assert (= (and mapNonEmpty!20863 ((_ is ValueCellFull!6050) mapValue!20863)) b!465571))

(assert (= (and b!465572 ((_ is ValueCellFull!6050) mapDefault!20863)) b!465577))

(assert (= start!41706 b!465572))

(declare-fun m!447339 () Bool)

(assert (=> b!465574 m!447339))

(declare-fun m!447341 () Bool)

(assert (=> b!465574 m!447341))

(declare-fun m!447343 () Bool)

(assert (=> b!465574 m!447343))

(declare-fun m!447345 () Bool)

(assert (=> b!465573 m!447345))

(declare-fun m!447347 () Bool)

(assert (=> b!465578 m!447347))

(declare-fun m!447349 () Bool)

(assert (=> b!465575 m!447349))

(declare-fun m!447351 () Bool)

(assert (=> b!465575 m!447351))

(assert (=> b!465575 m!447351))

(declare-fun m!447353 () Bool)

(assert (=> b!465575 m!447353))

(declare-fun m!447355 () Bool)

(assert (=> mapNonEmpty!20863 m!447355))

(declare-fun m!447357 () Bool)

(assert (=> start!41706 m!447357))

(declare-fun m!447359 () Bool)

(assert (=> start!41706 m!447359))

(declare-fun m!447361 () Bool)

(assert (=> start!41706 m!447361))

(check-sat b_and!19689 (not start!41706) (not b!465573) (not mapNonEmpty!20863) (not b!465574) (not b!465575) (not b_next!11359) tp_is_empty!12787 (not b!465578))
(check-sat b_and!19689 (not b_next!11359))
