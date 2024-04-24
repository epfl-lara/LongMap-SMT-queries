; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70530 () Bool)

(assert start!70530)

(declare-fun b_free!12721 () Bool)

(declare-fun b_next!12721 () Bool)

(assert (=> start!70530 (= b_free!12721 (not b_next!12721))))

(declare-fun tp!44889 () Bool)

(declare-fun b_and!21543 () Bool)

(assert (=> start!70530 (= tp!44889 b_and!21543)))

(declare-fun res!558318 () Bool)

(declare-fun e!454160 () Bool)

(assert (=> start!70530 (=> (not res!558318) (not e!454160))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70530 (= res!558318 (validMask!0 mask!1312))))

(assert (=> start!70530 e!454160))

(declare-fun tp_is_empty!14431 () Bool)

(assert (=> start!70530 tp_is_empty!14431))

(declare-datatypes ((array!45061 0))(
  ( (array!45062 (arr!21582 (Array (_ BitVec 32) (_ BitVec 64))) (size!22002 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45061)

(declare-fun array_inv!17291 (array!45061) Bool)

(assert (=> start!70530 (array_inv!17291 _keys!976)))

(assert (=> start!70530 true))

(declare-datatypes ((V!24243 0))(
  ( (V!24244 (val!7263 Int)) )
))
(declare-datatypes ((ValueCell!6800 0))(
  ( (ValueCellFull!6800 (v!9692 V!24243)) (EmptyCell!6800) )
))
(declare-datatypes ((array!45063 0))(
  ( (array!45064 (arr!21583 (Array (_ BitVec 32) ValueCell!6800)) (size!22003 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45063)

(declare-fun e!454161 () Bool)

(declare-fun array_inv!17292 (array!45063) Bool)

(assert (=> start!70530 (and (array_inv!17292 _values!788) e!454161)))

(assert (=> start!70530 tp!44889))

(declare-fun b!818319 () Bool)

(declare-fun e!454162 () Bool)

(assert (=> b!818319 (= e!454162 tp_is_empty!14431)))

(declare-fun b!818320 () Bool)

(declare-fun e!454159 () Bool)

(declare-fun mapRes!23239 () Bool)

(assert (=> b!818320 (= e!454161 (and e!454159 mapRes!23239))))

(declare-fun condMapEmpty!23239 () Bool)

(declare-fun mapDefault!23239 () ValueCell!6800)

(assert (=> b!818320 (= condMapEmpty!23239 (= (arr!21583 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6800)) mapDefault!23239)))))

(declare-fun b!818321 () Bool)

(assert (=> b!818321 (= e!454160 (not true))))

(declare-datatypes ((tuple2!9452 0))(
  ( (tuple2!9453 (_1!4737 (_ BitVec 64)) (_2!4737 V!24243)) )
))
(declare-datatypes ((List!15264 0))(
  ( (Nil!15261) (Cons!15260 (h!16395 tuple2!9452) (t!21581 List!15264)) )
))
(declare-datatypes ((ListLongMap!8277 0))(
  ( (ListLongMap!8278 (toList!4154 List!15264)) )
))
(declare-fun lt!366598 () ListLongMap!8277)

(declare-fun lt!366599 () ListLongMap!8277)

(assert (=> b!818321 (= lt!366598 lt!366599)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24243)

(declare-fun minValue!754 () V!24243)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24243)

(declare-datatypes ((Unit!27863 0))(
  ( (Unit!27864) )
))
(declare-fun lt!366600 () Unit!27863)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!341 (array!45061 array!45063 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24243 V!24243 V!24243 V!24243 (_ BitVec 32) Int) Unit!27863)

(assert (=> b!818321 (= lt!366600 (lemmaNoChangeToArrayThenSameMapNoExtras!341 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2253 (array!45061 array!45063 (_ BitVec 32) (_ BitVec 32) V!24243 V!24243 (_ BitVec 32) Int) ListLongMap!8277)

(assert (=> b!818321 (= lt!366599 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818321 (= lt!366598 (getCurrentListMapNoExtraKeys!2253 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23239 () Bool)

(assert (=> mapIsEmpty!23239 mapRes!23239))

(declare-fun b!818322 () Bool)

(assert (=> b!818322 (= e!454159 tp_is_empty!14431)))

(declare-fun b!818323 () Bool)

(declare-fun res!558319 () Bool)

(assert (=> b!818323 (=> (not res!558319) (not e!454160))))

(declare-datatypes ((List!15265 0))(
  ( (Nil!15262) (Cons!15261 (h!16396 (_ BitVec 64)) (t!21582 List!15265)) )
))
(declare-fun arrayNoDuplicates!0 (array!45061 (_ BitVec 32) List!15265) Bool)

(assert (=> b!818323 (= res!558319 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15262))))

(declare-fun b!818324 () Bool)

(declare-fun res!558320 () Bool)

(assert (=> b!818324 (=> (not res!558320) (not e!454160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45061 (_ BitVec 32)) Bool)

(assert (=> b!818324 (= res!558320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818325 () Bool)

(declare-fun res!558317 () Bool)

(assert (=> b!818325 (=> (not res!558317) (not e!454160))))

(assert (=> b!818325 (= res!558317 (and (= (size!22003 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22002 _keys!976) (size!22003 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23239 () Bool)

(declare-fun tp!44890 () Bool)

(assert (=> mapNonEmpty!23239 (= mapRes!23239 (and tp!44890 e!454162))))

(declare-fun mapKey!23239 () (_ BitVec 32))

(declare-fun mapValue!23239 () ValueCell!6800)

(declare-fun mapRest!23239 () (Array (_ BitVec 32) ValueCell!6800))

(assert (=> mapNonEmpty!23239 (= (arr!21583 _values!788) (store mapRest!23239 mapKey!23239 mapValue!23239))))

(assert (= (and start!70530 res!558318) b!818325))

(assert (= (and b!818325 res!558317) b!818324))

(assert (= (and b!818324 res!558320) b!818323))

(assert (= (and b!818323 res!558319) b!818321))

(assert (= (and b!818320 condMapEmpty!23239) mapIsEmpty!23239))

(assert (= (and b!818320 (not condMapEmpty!23239)) mapNonEmpty!23239))

(get-info :version)

(assert (= (and mapNonEmpty!23239 ((_ is ValueCellFull!6800) mapValue!23239)) b!818319))

(assert (= (and b!818320 ((_ is ValueCellFull!6800) mapDefault!23239)) b!818322))

(assert (= start!70530 b!818320))

(declare-fun m!760291 () Bool)

(assert (=> b!818323 m!760291))

(declare-fun m!760293 () Bool)

(assert (=> b!818321 m!760293))

(declare-fun m!760295 () Bool)

(assert (=> b!818321 m!760295))

(declare-fun m!760297 () Bool)

(assert (=> b!818321 m!760297))

(declare-fun m!760299 () Bool)

(assert (=> b!818324 m!760299))

(declare-fun m!760301 () Bool)

(assert (=> mapNonEmpty!23239 m!760301))

(declare-fun m!760303 () Bool)

(assert (=> start!70530 m!760303))

(declare-fun m!760305 () Bool)

(assert (=> start!70530 m!760305))

(declare-fun m!760307 () Bool)

(assert (=> start!70530 m!760307))

(check-sat (not mapNonEmpty!23239) tp_is_empty!14431 b_and!21543 (not b_next!12721) (not b!818324) (not b!818323) (not start!70530) (not b!818321))
(check-sat b_and!21543 (not b_next!12721))
