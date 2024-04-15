; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70356 () Bool)

(assert start!70356)

(declare-fun b_free!12733 () Bool)

(declare-fun b_next!12733 () Bool)

(assert (=> start!70356 (= b_free!12733 (not b_next!12733))))

(declare-fun tp!44926 () Bool)

(declare-fun b_and!21519 () Bool)

(assert (=> start!70356 (= tp!44926 b_and!21519)))

(declare-fun b!817305 () Bool)

(declare-fun e!453525 () Bool)

(assert (=> b!817305 (= e!453525 (not true))))

(declare-datatypes ((V!24259 0))(
  ( (V!24260 (val!7269 Int)) )
))
(declare-datatypes ((tuple2!9570 0))(
  ( (tuple2!9571 (_1!4796 (_ BitVec 64)) (_2!4796 V!24259)) )
))
(declare-datatypes ((List!15391 0))(
  ( (Nil!15388) (Cons!15387 (h!16516 tuple2!9570) (t!21707 List!15391)) )
))
(declare-datatypes ((ListLongMap!8383 0))(
  ( (ListLongMap!8384 (toList!4207 List!15391)) )
))
(declare-fun lt!366055 () ListLongMap!8383)

(declare-fun lt!366056 () ListLongMap!8383)

(assert (=> b!817305 (= lt!366055 lt!366056)))

(declare-fun zeroValueBefore!34 () V!24259)

(declare-datatypes ((array!45063 0))(
  ( (array!45064 (arr!21588 (Array (_ BitVec 32) (_ BitVec 64))) (size!22009 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45063)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24259)

(declare-fun minValue!754 () V!24259)

(declare-datatypes ((ValueCell!6806 0))(
  ( (ValueCellFull!6806 (v!9692 V!24259)) (EmptyCell!6806) )
))
(declare-datatypes ((array!45065 0))(
  ( (array!45066 (arr!21589 (Array (_ BitVec 32) ValueCell!6806)) (size!22010 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45065)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27842 0))(
  ( (Unit!27843) )
))
(declare-fun lt!366057 () Unit!27842)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!360 (array!45063 array!45065 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24259 V!24259 V!24259 V!24259 (_ BitVec 32) Int) Unit!27842)

(assert (=> b!817305 (= lt!366057 (lemmaNoChangeToArrayThenSameMapNoExtras!360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2267 (array!45063 array!45065 (_ BitVec 32) (_ BitVec 32) V!24259 V!24259 (_ BitVec 32) Int) ListLongMap!8383)

(assert (=> b!817305 (= lt!366056 (getCurrentListMapNoExtraKeys!2267 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817305 (= lt!366055 (getCurrentListMapNoExtraKeys!2267 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557939 () Bool)

(assert (=> start!70356 (=> (not res!557939) (not e!453525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70356 (= res!557939 (validMask!0 mask!1312))))

(assert (=> start!70356 e!453525))

(declare-fun tp_is_empty!14443 () Bool)

(assert (=> start!70356 tp_is_empty!14443))

(declare-fun array_inv!17335 (array!45063) Bool)

(assert (=> start!70356 (array_inv!17335 _keys!976)))

(assert (=> start!70356 true))

(declare-fun e!453521 () Bool)

(declare-fun array_inv!17336 (array!45065) Bool)

(assert (=> start!70356 (and (array_inv!17336 _values!788) e!453521)))

(assert (=> start!70356 tp!44926))

(declare-fun b!817306 () Bool)

(declare-fun res!557938 () Bool)

(assert (=> b!817306 (=> (not res!557938) (not e!453525))))

(assert (=> b!817306 (= res!557938 (and (= (size!22010 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22009 _keys!976) (size!22010 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23257 () Bool)

(declare-fun mapRes!23257 () Bool)

(assert (=> mapIsEmpty!23257 mapRes!23257))

(declare-fun mapNonEmpty!23257 () Bool)

(declare-fun tp!44925 () Bool)

(declare-fun e!453522 () Bool)

(assert (=> mapNonEmpty!23257 (= mapRes!23257 (and tp!44925 e!453522))))

(declare-fun mapKey!23257 () (_ BitVec 32))

(declare-fun mapRest!23257 () (Array (_ BitVec 32) ValueCell!6806))

(declare-fun mapValue!23257 () ValueCell!6806)

(assert (=> mapNonEmpty!23257 (= (arr!21589 _values!788) (store mapRest!23257 mapKey!23257 mapValue!23257))))

(declare-fun b!817307 () Bool)

(declare-fun e!453523 () Bool)

(assert (=> b!817307 (= e!453523 tp_is_empty!14443)))

(declare-fun b!817308 () Bool)

(assert (=> b!817308 (= e!453521 (and e!453523 mapRes!23257))))

(declare-fun condMapEmpty!23257 () Bool)

(declare-fun mapDefault!23257 () ValueCell!6806)

(assert (=> b!817308 (= condMapEmpty!23257 (= (arr!21589 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6806)) mapDefault!23257)))))

(declare-fun b!817309 () Bool)

(assert (=> b!817309 (= e!453522 tp_is_empty!14443)))

(declare-fun b!817310 () Bool)

(declare-fun res!557937 () Bool)

(assert (=> b!817310 (=> (not res!557937) (not e!453525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45063 (_ BitVec 32)) Bool)

(assert (=> b!817310 (= res!557937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817311 () Bool)

(declare-fun res!557940 () Bool)

(assert (=> b!817311 (=> (not res!557940) (not e!453525))))

(declare-datatypes ((List!15392 0))(
  ( (Nil!15389) (Cons!15388 (h!16517 (_ BitVec 64)) (t!21708 List!15392)) )
))
(declare-fun arrayNoDuplicates!0 (array!45063 (_ BitVec 32) List!15392) Bool)

(assert (=> b!817311 (= res!557940 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15389))))

(assert (= (and start!70356 res!557939) b!817306))

(assert (= (and b!817306 res!557938) b!817310))

(assert (= (and b!817310 res!557937) b!817311))

(assert (= (and b!817311 res!557940) b!817305))

(assert (= (and b!817308 condMapEmpty!23257) mapIsEmpty!23257))

(assert (= (and b!817308 (not condMapEmpty!23257)) mapNonEmpty!23257))

(get-info :version)

(assert (= (and mapNonEmpty!23257 ((_ is ValueCellFull!6806) mapValue!23257)) b!817309))

(assert (= (and b!817308 ((_ is ValueCellFull!6806) mapDefault!23257)) b!817307))

(assert (= start!70356 b!817308))

(declare-fun m!758365 () Bool)

(assert (=> mapNonEmpty!23257 m!758365))

(declare-fun m!758367 () Bool)

(assert (=> b!817311 m!758367))

(declare-fun m!758369 () Bool)

(assert (=> b!817310 m!758369))

(declare-fun m!758371 () Bool)

(assert (=> start!70356 m!758371))

(declare-fun m!758373 () Bool)

(assert (=> start!70356 m!758373))

(declare-fun m!758375 () Bool)

(assert (=> start!70356 m!758375))

(declare-fun m!758377 () Bool)

(assert (=> b!817305 m!758377))

(declare-fun m!758379 () Bool)

(assert (=> b!817305 m!758379))

(declare-fun m!758381 () Bool)

(assert (=> b!817305 m!758381))

(check-sat (not start!70356) (not mapNonEmpty!23257) (not b!817305) (not b!817311) (not b!817310) tp_is_empty!14443 (not b_next!12733) b_and!21519)
(check-sat b_and!21519 (not b_next!12733))
