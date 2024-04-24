; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70524 () Bool)

(assert start!70524)

(declare-fun b_free!12715 () Bool)

(declare-fun b_next!12715 () Bool)

(assert (=> start!70524 (= b_free!12715 (not b_next!12715))))

(declare-fun tp!44872 () Bool)

(declare-fun b_and!21537 () Bool)

(assert (=> start!70524 (= tp!44872 b_and!21537)))

(declare-fun b!818256 () Bool)

(declare-fun res!558283 () Bool)

(declare-fun e!454114 () Bool)

(assert (=> b!818256 (=> (not res!558283) (not e!454114))))

(declare-datatypes ((array!45049 0))(
  ( (array!45050 (arr!21576 (Array (_ BitVec 32) (_ BitVec 64))) (size!21996 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45049)

(declare-datatypes ((List!15258 0))(
  ( (Nil!15255) (Cons!15254 (h!16389 (_ BitVec 64)) (t!21575 List!15258)) )
))
(declare-fun arrayNoDuplicates!0 (array!45049 (_ BitVec 32) List!15258) Bool)

(assert (=> b!818256 (= res!558283 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15255))))

(declare-fun b!818257 () Bool)

(assert (=> b!818257 (= e!454114 (not true))))

(declare-datatypes ((V!24235 0))(
  ( (V!24236 (val!7260 Int)) )
))
(declare-datatypes ((tuple2!9446 0))(
  ( (tuple2!9447 (_1!4734 (_ BitVec 64)) (_2!4734 V!24235)) )
))
(declare-datatypes ((List!15259 0))(
  ( (Nil!15256) (Cons!15255 (h!16390 tuple2!9446) (t!21576 List!15259)) )
))
(declare-datatypes ((ListLongMap!8271 0))(
  ( (ListLongMap!8272 (toList!4151 List!15259)) )
))
(declare-fun lt!366572 () ListLongMap!8271)

(declare-fun lt!366573 () ListLongMap!8271)

(assert (=> b!818257 (= lt!366572 lt!366573)))

(declare-fun zeroValueBefore!34 () V!24235)

(declare-datatypes ((Unit!27857 0))(
  ( (Unit!27858) )
))
(declare-fun lt!366571 () Unit!27857)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24235)

(declare-fun minValue!754 () V!24235)

(declare-datatypes ((ValueCell!6797 0))(
  ( (ValueCellFull!6797 (v!9689 V!24235)) (EmptyCell!6797) )
))
(declare-datatypes ((array!45051 0))(
  ( (array!45052 (arr!21577 (Array (_ BitVec 32) ValueCell!6797)) (size!21997 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45051)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!338 (array!45049 array!45051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24235 V!24235 V!24235 V!24235 (_ BitVec 32) Int) Unit!27857)

(assert (=> b!818257 (= lt!366571 (lemmaNoChangeToArrayThenSameMapNoExtras!338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2250 (array!45049 array!45051 (_ BitVec 32) (_ BitVec 32) V!24235 V!24235 (_ BitVec 32) Int) ListLongMap!8271)

(assert (=> b!818257 (= lt!366573 (getCurrentListMapNoExtraKeys!2250 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818257 (= lt!366572 (getCurrentListMapNoExtraKeys!2250 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818258 () Bool)

(declare-fun e!454118 () Bool)

(declare-fun e!454115 () Bool)

(declare-fun mapRes!23230 () Bool)

(assert (=> b!818258 (= e!454118 (and e!454115 mapRes!23230))))

(declare-fun condMapEmpty!23230 () Bool)

(declare-fun mapDefault!23230 () ValueCell!6797)

(assert (=> b!818258 (= condMapEmpty!23230 (= (arr!21577 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6797)) mapDefault!23230)))))

(declare-fun b!818259 () Bool)

(declare-fun res!558284 () Bool)

(assert (=> b!818259 (=> (not res!558284) (not e!454114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45049 (_ BitVec 32)) Bool)

(assert (=> b!818259 (= res!558284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!558281 () Bool)

(assert (=> start!70524 (=> (not res!558281) (not e!454114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70524 (= res!558281 (validMask!0 mask!1312))))

(assert (=> start!70524 e!454114))

(declare-fun tp_is_empty!14425 () Bool)

(assert (=> start!70524 tp_is_empty!14425))

(declare-fun array_inv!17287 (array!45049) Bool)

(assert (=> start!70524 (array_inv!17287 _keys!976)))

(assert (=> start!70524 true))

(declare-fun array_inv!17288 (array!45051) Bool)

(assert (=> start!70524 (and (array_inv!17288 _values!788) e!454118)))

(assert (=> start!70524 tp!44872))

(declare-fun b!818260 () Bool)

(declare-fun res!558282 () Bool)

(assert (=> b!818260 (=> (not res!558282) (not e!454114))))

(assert (=> b!818260 (= res!558282 (and (= (size!21997 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21996 _keys!976) (size!21997 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23230 () Bool)

(declare-fun tp!44871 () Bool)

(declare-fun e!454116 () Bool)

(assert (=> mapNonEmpty!23230 (= mapRes!23230 (and tp!44871 e!454116))))

(declare-fun mapValue!23230 () ValueCell!6797)

(declare-fun mapKey!23230 () (_ BitVec 32))

(declare-fun mapRest!23230 () (Array (_ BitVec 32) ValueCell!6797))

(assert (=> mapNonEmpty!23230 (= (arr!21577 _values!788) (store mapRest!23230 mapKey!23230 mapValue!23230))))

(declare-fun b!818261 () Bool)

(assert (=> b!818261 (= e!454115 tp_is_empty!14425)))

(declare-fun mapIsEmpty!23230 () Bool)

(assert (=> mapIsEmpty!23230 mapRes!23230))

(declare-fun b!818262 () Bool)

(assert (=> b!818262 (= e!454116 tp_is_empty!14425)))

(assert (= (and start!70524 res!558281) b!818260))

(assert (= (and b!818260 res!558282) b!818259))

(assert (= (and b!818259 res!558284) b!818256))

(assert (= (and b!818256 res!558283) b!818257))

(assert (= (and b!818258 condMapEmpty!23230) mapIsEmpty!23230))

(assert (= (and b!818258 (not condMapEmpty!23230)) mapNonEmpty!23230))

(get-info :version)

(assert (= (and mapNonEmpty!23230 ((_ is ValueCellFull!6797) mapValue!23230)) b!818262))

(assert (= (and b!818258 ((_ is ValueCellFull!6797) mapDefault!23230)) b!818261))

(assert (= start!70524 b!818258))

(declare-fun m!760237 () Bool)

(assert (=> b!818259 m!760237))

(declare-fun m!760239 () Bool)

(assert (=> mapNonEmpty!23230 m!760239))

(declare-fun m!760241 () Bool)

(assert (=> start!70524 m!760241))

(declare-fun m!760243 () Bool)

(assert (=> start!70524 m!760243))

(declare-fun m!760245 () Bool)

(assert (=> start!70524 m!760245))

(declare-fun m!760247 () Bool)

(assert (=> b!818256 m!760247))

(declare-fun m!760249 () Bool)

(assert (=> b!818257 m!760249))

(declare-fun m!760251 () Bool)

(assert (=> b!818257 m!760251))

(declare-fun m!760253 () Bool)

(assert (=> b!818257 m!760253))

(check-sat (not b_next!12715) b_and!21537 (not b!818259) (not mapNonEmpty!23230) (not b!818256) (not start!70524) tp_is_empty!14425 (not b!818257))
(check-sat b_and!21537 (not b_next!12715))
