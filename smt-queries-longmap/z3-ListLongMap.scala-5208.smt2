; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70260 () Bool)

(assert start!70260)

(declare-fun b_free!12655 () Bool)

(declare-fun b_next!12655 () Bool)

(assert (=> start!70260 (= b_free!12655 (not b_next!12655))))

(declare-fun tp!44688 () Bool)

(declare-fun b_and!21429 () Bool)

(assert (=> start!70260 (= tp!44688 b_and!21429)))

(declare-fun res!557328 () Bool)

(declare-fun e!452767 () Bool)

(assert (=> start!70260 (=> (not res!557328) (not e!452767))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70260 (= res!557328 (validMask!0 mask!1312))))

(assert (=> start!70260 e!452767))

(declare-fun tp_is_empty!14365 () Bool)

(assert (=> start!70260 tp_is_empty!14365))

(declare-datatypes ((array!44911 0))(
  ( (array!44912 (arr!21513 (Array (_ BitVec 32) (_ BitVec 64))) (size!21934 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44911)

(declare-fun array_inv!17293 (array!44911) Bool)

(assert (=> start!70260 (array_inv!17293 _keys!976)))

(assert (=> start!70260 true))

(declare-datatypes ((V!24155 0))(
  ( (V!24156 (val!7230 Int)) )
))
(declare-datatypes ((ValueCell!6767 0))(
  ( (ValueCellFull!6767 (v!9652 V!24155)) (EmptyCell!6767) )
))
(declare-datatypes ((array!44913 0))(
  ( (array!44914 (arr!21514 (Array (_ BitVec 32) ValueCell!6767)) (size!21935 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44913)

(declare-fun e!452765 () Bool)

(declare-fun array_inv!17294 (array!44913) Bool)

(assert (=> start!70260 (and (array_inv!17294 _values!788) e!452765)))

(assert (=> start!70260 tp!44688))

(declare-fun b!816241 () Bool)

(declare-fun res!557327 () Bool)

(assert (=> b!816241 (=> (not res!557327) (not e!452767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44911 (_ BitVec 32)) Bool)

(assert (=> b!816241 (= res!557327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816242 () Bool)

(declare-fun e!452770 () Bool)

(assert (=> b!816242 (= e!452770 tp_is_empty!14365)))

(declare-fun mapIsEmpty!23137 () Bool)

(declare-fun mapRes!23137 () Bool)

(assert (=> mapIsEmpty!23137 mapRes!23137))

(declare-fun b!816243 () Bool)

(declare-fun res!557330 () Bool)

(assert (=> b!816243 (=> (not res!557330) (not e!452767))))

(declare-datatypes ((List!15337 0))(
  ( (Nil!15334) (Cons!15333 (h!16462 (_ BitVec 64)) (t!21651 List!15337)) )
))
(declare-fun arrayNoDuplicates!0 (array!44911 (_ BitVec 32) List!15337) Bool)

(assert (=> b!816243 (= res!557330 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15334))))

(declare-fun mapNonEmpty!23137 () Bool)

(declare-fun tp!44689 () Bool)

(assert (=> mapNonEmpty!23137 (= mapRes!23137 (and tp!44689 e!452770))))

(declare-fun mapRest!23137 () (Array (_ BitVec 32) ValueCell!6767))

(declare-fun mapValue!23137 () ValueCell!6767)

(declare-fun mapKey!23137 () (_ BitVec 32))

(assert (=> mapNonEmpty!23137 (= (arr!21514 _values!788) (store mapRest!23137 mapKey!23137 mapValue!23137))))

(declare-fun b!816244 () Bool)

(declare-fun res!557326 () Bool)

(assert (=> b!816244 (=> (not res!557326) (not e!452767))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816244 (= res!557326 (and (= (size!21935 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21934 _keys!976) (size!21935 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816245 () Bool)

(declare-fun e!452769 () Bool)

(assert (=> b!816245 (= e!452767 (not e!452769))))

(declare-fun res!557329 () Bool)

(assert (=> b!816245 (=> res!557329 e!452769)))

(assert (=> b!816245 (= res!557329 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9514 0))(
  ( (tuple2!9515 (_1!4768 (_ BitVec 64)) (_2!4768 V!24155)) )
))
(declare-datatypes ((List!15338 0))(
  ( (Nil!15335) (Cons!15334 (h!16463 tuple2!9514) (t!21652 List!15338)) )
))
(declare-datatypes ((ListLongMap!8327 0))(
  ( (ListLongMap!8328 (toList!4179 List!15338)) )
))
(declare-fun lt!365461 () ListLongMap!8327)

(declare-fun lt!365462 () ListLongMap!8327)

(assert (=> b!816245 (= lt!365461 lt!365462)))

(declare-fun zeroValueBefore!34 () V!24155)

(declare-fun zeroValueAfter!34 () V!24155)

(declare-fun minValue!754 () V!24155)

(declare-datatypes ((Unit!27788 0))(
  ( (Unit!27789) )
))
(declare-fun lt!365464 () Unit!27788)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!334 (array!44911 array!44913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 V!24155 V!24155 (_ BitVec 32) Int) Unit!27788)

(assert (=> b!816245 (= lt!365464 (lemmaNoChangeToArrayThenSameMapNoExtras!334 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2241 (array!44911 array!44913 (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 (_ BitVec 32) Int) ListLongMap!8327)

(assert (=> b!816245 (= lt!365462 (getCurrentListMapNoExtraKeys!2241 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816245 (= lt!365461 (getCurrentListMapNoExtraKeys!2241 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816246 () Bool)

(declare-fun e!452766 () Bool)

(assert (=> b!816246 (= e!452765 (and e!452766 mapRes!23137))))

(declare-fun condMapEmpty!23137 () Bool)

(declare-fun mapDefault!23137 () ValueCell!6767)

(assert (=> b!816246 (= condMapEmpty!23137 (= (arr!21514 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6767)) mapDefault!23137)))))

(declare-fun b!816247 () Bool)

(assert (=> b!816247 (= e!452769 true)))

(declare-fun lt!365460 () ListLongMap!8327)

(declare-fun getCurrentListMap!2352 (array!44911 array!44913 (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 (_ BitVec 32) Int) ListLongMap!8327)

(assert (=> b!816247 (= lt!365460 (getCurrentListMap!2352 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365463 () ListLongMap!8327)

(declare-fun +!1840 (ListLongMap!8327 tuple2!9514) ListLongMap!8327)

(assert (=> b!816247 (= lt!365463 (+!1840 (getCurrentListMap!2352 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816248 () Bool)

(assert (=> b!816248 (= e!452766 tp_is_empty!14365)))

(assert (= (and start!70260 res!557328) b!816244))

(assert (= (and b!816244 res!557326) b!816241))

(assert (= (and b!816241 res!557327) b!816243))

(assert (= (and b!816243 res!557330) b!816245))

(assert (= (and b!816245 (not res!557329)) b!816247))

(assert (= (and b!816246 condMapEmpty!23137) mapIsEmpty!23137))

(assert (= (and b!816246 (not condMapEmpty!23137)) mapNonEmpty!23137))

(get-info :version)

(assert (= (and mapNonEmpty!23137 ((_ is ValueCellFull!6767) mapValue!23137)) b!816242))

(assert (= (and b!816246 ((_ is ValueCellFull!6767) mapDefault!23137)) b!816248))

(assert (= start!70260 b!816246))

(declare-fun m!757367 () Bool)

(assert (=> b!816245 m!757367))

(declare-fun m!757369 () Bool)

(assert (=> b!816245 m!757369))

(declare-fun m!757371 () Bool)

(assert (=> b!816245 m!757371))

(declare-fun m!757373 () Bool)

(assert (=> mapNonEmpty!23137 m!757373))

(declare-fun m!757375 () Bool)

(assert (=> b!816247 m!757375))

(declare-fun m!757377 () Bool)

(assert (=> b!816247 m!757377))

(assert (=> b!816247 m!757377))

(declare-fun m!757379 () Bool)

(assert (=> b!816247 m!757379))

(declare-fun m!757381 () Bool)

(assert (=> b!816243 m!757381))

(declare-fun m!757383 () Bool)

(assert (=> start!70260 m!757383))

(declare-fun m!757385 () Bool)

(assert (=> start!70260 m!757385))

(declare-fun m!757387 () Bool)

(assert (=> start!70260 m!757387))

(declare-fun m!757389 () Bool)

(assert (=> b!816241 m!757389))

(check-sat (not start!70260) tp_is_empty!14365 b_and!21429 (not mapNonEmpty!23137) (not b!816245) (not b!816241) (not b!816247) (not b!816243) (not b_next!12655))
(check-sat b_and!21429 (not b_next!12655))
