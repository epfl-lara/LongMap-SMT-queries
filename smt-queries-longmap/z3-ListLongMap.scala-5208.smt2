; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70446 () Bool)

(assert start!70446)

(declare-fun b_free!12655 () Bool)

(declare-fun b_next!12655 () Bool)

(assert (=> start!70446 (= b_free!12655 (not b_next!12655))))

(declare-fun tp!44689 () Bool)

(declare-fun b_and!21465 () Bool)

(assert (=> start!70446 (= tp!44689 b_and!21465)))

(declare-fun b!817381 () Bool)

(declare-fun res!557779 () Bool)

(declare-fun e!453498 () Bool)

(assert (=> b!817381 (=> (not res!557779) (not e!453498))))

(declare-datatypes ((array!44931 0))(
  ( (array!44932 (arr!21518 (Array (_ BitVec 32) (_ BitVec 64))) (size!21938 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44931)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24155 0))(
  ( (V!24156 (val!7230 Int)) )
))
(declare-datatypes ((ValueCell!6767 0))(
  ( (ValueCellFull!6767 (v!9658 V!24155)) (EmptyCell!6767) )
))
(declare-datatypes ((array!44933 0))(
  ( (array!44934 (arr!21519 (Array (_ BitVec 32) ValueCell!6767)) (size!21939 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44933)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817381 (= res!557779 (and (= (size!21939 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21938 _keys!976) (size!21939 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817382 () Bool)

(declare-fun e!453494 () Bool)

(assert (=> b!817382 (= e!453494 true)))

(declare-datatypes ((tuple2!9408 0))(
  ( (tuple2!9409 (_1!4715 (_ BitVec 64)) (_2!4715 V!24155)) )
))
(declare-datatypes ((List!15220 0))(
  ( (Nil!15217) (Cons!15216 (h!16351 tuple2!9408) (t!21535 List!15220)) )
))
(declare-datatypes ((ListLongMap!8233 0))(
  ( (ListLongMap!8234 (toList!4132 List!15220)) )
))
(declare-fun lt!366059 () ListLongMap!8233)

(declare-fun zeroValueAfter!34 () V!24155)

(declare-fun minValue!754 () V!24155)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2351 (array!44931 array!44933 (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 (_ BitVec 32) Int) ListLongMap!8233)

(assert (=> b!817382 (= lt!366059 (getCurrentListMap!2351 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366061 () ListLongMap!8233)

(declare-fun zeroValueBefore!34 () V!24155)

(declare-fun +!1811 (ListLongMap!8233 tuple2!9408) ListLongMap!8233)

(assert (=> b!817382 (= lt!366061 (+!1811 (getCurrentListMap!2351 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9409 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!817383 () Bool)

(declare-fun e!453496 () Bool)

(declare-fun tp_is_empty!14365 () Bool)

(assert (=> b!817383 (= e!453496 tp_is_empty!14365)))

(declare-fun b!817384 () Bool)

(declare-fun e!453497 () Bool)

(declare-fun e!453495 () Bool)

(declare-fun mapRes!23137 () Bool)

(assert (=> b!817384 (= e!453497 (and e!453495 mapRes!23137))))

(declare-fun condMapEmpty!23137 () Bool)

(declare-fun mapDefault!23137 () ValueCell!6767)

(assert (=> b!817384 (= condMapEmpty!23137 (= (arr!21519 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6767)) mapDefault!23137)))))

(declare-fun b!817385 () Bool)

(declare-fun res!557778 () Bool)

(assert (=> b!817385 (=> (not res!557778) (not e!453498))))

(declare-datatypes ((List!15221 0))(
  ( (Nil!15218) (Cons!15217 (h!16352 (_ BitVec 64)) (t!21536 List!15221)) )
))
(declare-fun arrayNoDuplicates!0 (array!44931 (_ BitVec 32) List!15221) Bool)

(assert (=> b!817385 (= res!557778 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15218))))

(declare-fun res!557782 () Bool)

(assert (=> start!70446 (=> (not res!557782) (not e!453498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70446 (= res!557782 (validMask!0 mask!1312))))

(assert (=> start!70446 e!453498))

(assert (=> start!70446 tp_is_empty!14365))

(declare-fun array_inv!17251 (array!44931) Bool)

(assert (=> start!70446 (array_inv!17251 _keys!976)))

(assert (=> start!70446 true))

(declare-fun array_inv!17252 (array!44933) Bool)

(assert (=> start!70446 (and (array_inv!17252 _values!788) e!453497)))

(assert (=> start!70446 tp!44689))

(declare-fun mapIsEmpty!23137 () Bool)

(assert (=> mapIsEmpty!23137 mapRes!23137))

(declare-fun mapNonEmpty!23137 () Bool)

(declare-fun tp!44688 () Bool)

(assert (=> mapNonEmpty!23137 (= mapRes!23137 (and tp!44688 e!453496))))

(declare-fun mapRest!23137 () (Array (_ BitVec 32) ValueCell!6767))

(declare-fun mapKey!23137 () (_ BitVec 32))

(declare-fun mapValue!23137 () ValueCell!6767)

(assert (=> mapNonEmpty!23137 (= (arr!21519 _values!788) (store mapRest!23137 mapKey!23137 mapValue!23137))))

(declare-fun b!817386 () Bool)

(assert (=> b!817386 (= e!453495 tp_is_empty!14365)))

(declare-fun b!817387 () Bool)

(assert (=> b!817387 (= e!453498 (not e!453494))))

(declare-fun res!557781 () Bool)

(assert (=> b!817387 (=> res!557781 e!453494)))

(assert (=> b!817387 (= res!557781 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!366060 () ListLongMap!8233)

(declare-fun lt!366057 () ListLongMap!8233)

(assert (=> b!817387 (= lt!366060 lt!366057)))

(declare-datatypes ((Unit!27823 0))(
  ( (Unit!27824) )
))
(declare-fun lt!366058 () Unit!27823)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!322 (array!44931 array!44933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 V!24155 V!24155 (_ BitVec 32) Int) Unit!27823)

(assert (=> b!817387 (= lt!366058 (lemmaNoChangeToArrayThenSameMapNoExtras!322 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2234 (array!44931 array!44933 (_ BitVec 32) (_ BitVec 32) V!24155 V!24155 (_ BitVec 32) Int) ListLongMap!8233)

(assert (=> b!817387 (= lt!366057 (getCurrentListMapNoExtraKeys!2234 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817387 (= lt!366060 (getCurrentListMapNoExtraKeys!2234 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817388 () Bool)

(declare-fun res!557780 () Bool)

(assert (=> b!817388 (=> (not res!557780) (not e!453498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44931 (_ BitVec 32)) Bool)

(assert (=> b!817388 (= res!557780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70446 res!557782) b!817381))

(assert (= (and b!817381 res!557779) b!817388))

(assert (= (and b!817388 res!557780) b!817385))

(assert (= (and b!817385 res!557778) b!817387))

(assert (= (and b!817387 (not res!557781)) b!817382))

(assert (= (and b!817384 condMapEmpty!23137) mapIsEmpty!23137))

(assert (= (and b!817384 (not condMapEmpty!23137)) mapNonEmpty!23137))

(get-info :version)

(assert (= (and mapNonEmpty!23137 ((_ is ValueCellFull!6767) mapValue!23137)) b!817383))

(assert (= (and b!817384 ((_ is ValueCellFull!6767) mapDefault!23137)) b!817386))

(assert (= start!70446 b!817384))

(declare-fun m!759401 () Bool)

(assert (=> b!817382 m!759401))

(declare-fun m!759403 () Bool)

(assert (=> b!817382 m!759403))

(assert (=> b!817382 m!759403))

(declare-fun m!759405 () Bool)

(assert (=> b!817382 m!759405))

(declare-fun m!759407 () Bool)

(assert (=> b!817387 m!759407))

(declare-fun m!759409 () Bool)

(assert (=> b!817387 m!759409))

(declare-fun m!759411 () Bool)

(assert (=> b!817387 m!759411))

(declare-fun m!759413 () Bool)

(assert (=> b!817385 m!759413))

(declare-fun m!759415 () Bool)

(assert (=> start!70446 m!759415))

(declare-fun m!759417 () Bool)

(assert (=> start!70446 m!759417))

(declare-fun m!759419 () Bool)

(assert (=> start!70446 m!759419))

(declare-fun m!759421 () Bool)

(assert (=> b!817388 m!759421))

(declare-fun m!759423 () Bool)

(assert (=> mapNonEmpty!23137 m!759423))

(check-sat (not b!817387) (not b_next!12655) (not mapNonEmpty!23137) tp_is_empty!14365 (not start!70446) (not b!817382) (not b!817388) b_and!21465 (not b!817385))
(check-sat b_and!21465 (not b_next!12655))
