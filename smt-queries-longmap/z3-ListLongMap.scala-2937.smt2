; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41814 () Bool)

(assert start!41814)

(declare-fun b_free!11431 () Bool)

(declare-fun b_next!11431 () Bool)

(assert (=> start!41814 (= b_free!11431 (not b_next!11431))))

(declare-fun tp!40302 () Bool)

(declare-fun b_and!19821 () Bool)

(assert (=> start!41814 (= tp!40302 b_and!19821)))

(declare-fun b!467011 () Bool)

(declare-fun e!273132 () Bool)

(declare-fun tp_is_empty!12859 () Bool)

(assert (=> b!467011 (= e!273132 tp_is_empty!12859)))

(declare-fun mapIsEmpty!20977 () Bool)

(declare-fun mapRes!20977 () Bool)

(assert (=> mapIsEmpty!20977 mapRes!20977))

(declare-fun b!467012 () Bool)

(declare-fun res!279159 () Bool)

(declare-fun e!273133 () Bool)

(assert (=> b!467012 (=> (not res!279159) (not e!273133))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29490 0))(
  ( (array!29491 (arr!14172 (Array (_ BitVec 32) (_ BitVec 64))) (size!14524 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29490)

(declare-datatypes ((V!18251 0))(
  ( (V!18252 (val!6474 Int)) )
))
(declare-datatypes ((ValueCell!6086 0))(
  ( (ValueCellFull!6086 (v!8764 V!18251)) (EmptyCell!6086) )
))
(declare-datatypes ((array!29492 0))(
  ( (array!29493 (arr!14173 (Array (_ BitVec 32) ValueCell!6086)) (size!14525 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29492)

(assert (=> b!467012 (= res!279159 (and (= (size!14525 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14524 _keys!1025) (size!14525 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20977 () Bool)

(declare-fun tp!40303 () Bool)

(declare-fun e!273131 () Bool)

(assert (=> mapNonEmpty!20977 (= mapRes!20977 (and tp!40303 e!273131))))

(declare-fun mapKey!20977 () (_ BitVec 32))

(declare-fun mapRest!20977 () (Array (_ BitVec 32) ValueCell!6086))

(declare-fun mapValue!20977 () ValueCell!6086)

(assert (=> mapNonEmpty!20977 (= (arr!14173 _values!833) (store mapRest!20977 mapKey!20977 mapValue!20977))))

(declare-fun b!467013 () Bool)

(declare-fun res!279160 () Bool)

(assert (=> b!467013 (=> (not res!279160) (not e!273133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29490 (_ BitVec 32)) Bool)

(assert (=> b!467013 (= res!279160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467015 () Bool)

(declare-fun e!273134 () Bool)

(assert (=> b!467015 (= e!273134 (and e!273132 mapRes!20977))))

(declare-fun condMapEmpty!20977 () Bool)

(declare-fun mapDefault!20977 () ValueCell!6086)

(assert (=> b!467015 (= condMapEmpty!20977 (= (arr!14173 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6086)) mapDefault!20977)))))

(declare-fun b!467016 () Bool)

(declare-fun res!279161 () Bool)

(assert (=> b!467016 (=> (not res!279161) (not e!273133))))

(declare-datatypes ((List!8509 0))(
  ( (Nil!8506) (Cons!8505 (h!9361 (_ BitVec 64)) (t!14455 List!8509)) )
))
(declare-fun arrayNoDuplicates!0 (array!29490 (_ BitVec 32) List!8509) Bool)

(assert (=> b!467016 (= res!279161 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8506))))

(declare-fun b!467017 () Bool)

(assert (=> b!467017 (= e!273133 (not true))))

(declare-datatypes ((tuple2!8430 0))(
  ( (tuple2!8431 (_1!4226 (_ BitVec 64)) (_2!4226 V!18251)) )
))
(declare-datatypes ((List!8510 0))(
  ( (Nil!8507) (Cons!8506 (h!9362 tuple2!8430) (t!14456 List!8510)) )
))
(declare-datatypes ((ListLongMap!7345 0))(
  ( (ListLongMap!7346 (toList!3688 List!8510)) )
))
(declare-fun lt!211203 () ListLongMap!7345)

(declare-fun lt!211205 () ListLongMap!7345)

(assert (=> b!467017 (= lt!211203 lt!211205)))

(declare-fun minValueBefore!38 () V!18251)

(declare-fun zeroValue!794 () V!18251)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13588 0))(
  ( (Unit!13589) )
))
(declare-fun lt!211204 () Unit!13588)

(declare-fun minValueAfter!38 () V!18251)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!70 (array!29490 array!29492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18251 V!18251 V!18251 V!18251 (_ BitVec 32) Int) Unit!13588)

(assert (=> b!467017 (= lt!211204 (lemmaNoChangeToArrayThenSameMapNoExtras!70 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1910 (array!29490 array!29492 (_ BitVec 32) (_ BitVec 32) V!18251 V!18251 (_ BitVec 32) Int) ListLongMap!7345)

(assert (=> b!467017 (= lt!211205 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467017 (= lt!211203 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279158 () Bool)

(assert (=> start!41814 (=> (not res!279158) (not e!273133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41814 (= res!279158 (validMask!0 mask!1365))))

(assert (=> start!41814 e!273133))

(assert (=> start!41814 tp_is_empty!12859))

(assert (=> start!41814 tp!40302))

(assert (=> start!41814 true))

(declare-fun array_inv!10314 (array!29490) Bool)

(assert (=> start!41814 (array_inv!10314 _keys!1025)))

(declare-fun array_inv!10315 (array!29492) Bool)

(assert (=> start!41814 (and (array_inv!10315 _values!833) e!273134)))

(declare-fun b!467014 () Bool)

(assert (=> b!467014 (= e!273131 tp_is_empty!12859)))

(assert (= (and start!41814 res!279158) b!467012))

(assert (= (and b!467012 res!279159) b!467013))

(assert (= (and b!467013 res!279160) b!467016))

(assert (= (and b!467016 res!279161) b!467017))

(assert (= (and b!467015 condMapEmpty!20977) mapIsEmpty!20977))

(assert (= (and b!467015 (not condMapEmpty!20977)) mapNonEmpty!20977))

(get-info :version)

(assert (= (and mapNonEmpty!20977 ((_ is ValueCellFull!6086) mapValue!20977)) b!467014))

(assert (= (and b!467015 ((_ is ValueCellFull!6086) mapDefault!20977)) b!467011))

(assert (= start!41814 b!467015))

(declare-fun m!449459 () Bool)

(assert (=> mapNonEmpty!20977 m!449459))

(declare-fun m!449461 () Bool)

(assert (=> b!467013 m!449461))

(declare-fun m!449463 () Bool)

(assert (=> b!467017 m!449463))

(declare-fun m!449465 () Bool)

(assert (=> b!467017 m!449465))

(declare-fun m!449467 () Bool)

(assert (=> b!467017 m!449467))

(declare-fun m!449469 () Bool)

(assert (=> b!467016 m!449469))

(declare-fun m!449471 () Bool)

(assert (=> start!41814 m!449471))

(declare-fun m!449473 () Bool)

(assert (=> start!41814 m!449473))

(declare-fun m!449475 () Bool)

(assert (=> start!41814 m!449475))

(check-sat tp_is_empty!12859 (not b_next!11431) (not b!467013) (not mapNonEmpty!20977) (not start!41814) (not b!467017) b_and!19821 (not b!467016))
(check-sat b_and!19821 (not b_next!11431))
