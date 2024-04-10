; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70358 () Bool)

(assert start!70358)

(declare-fun b_free!12715 () Bool)

(declare-fun b_next!12715 () Bool)

(assert (=> start!70358 (= b_free!12715 (not b_next!12715))))

(declare-fun tp!44872 () Bool)

(declare-fun b_and!21527 () Bool)

(assert (=> start!70358 (= tp!44872 b_and!21527)))

(declare-fun b!817363 () Bool)

(declare-fun e!453536 () Bool)

(assert (=> b!817363 (= e!453536 (not true))))

(declare-datatypes ((V!24235 0))(
  ( (V!24236 (val!7260 Int)) )
))
(declare-datatypes ((tuple2!9540 0))(
  ( (tuple2!9541 (_1!4781 (_ BitVec 64)) (_2!4781 V!24235)) )
))
(declare-datatypes ((List!15369 0))(
  ( (Nil!15366) (Cons!15365 (h!16494 tuple2!9540) (t!21694 List!15369)) )
))
(declare-datatypes ((ListLongMap!8363 0))(
  ( (ListLongMap!8364 (toList!4197 List!15369)) )
))
(declare-fun lt!366218 () ListLongMap!8363)

(declare-fun lt!366219 () ListLongMap!8363)

(assert (=> b!817363 (= lt!366218 lt!366219)))

(declare-datatypes ((Unit!27878 0))(
  ( (Unit!27879) )
))
(declare-fun lt!366217 () Unit!27878)

(declare-fun zeroValueBefore!34 () V!24235)

(declare-datatypes ((array!45050 0))(
  ( (array!45051 (arr!21581 (Array (_ BitVec 32) (_ BitVec 64))) (size!22002 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45050)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24235)

(declare-fun minValue!754 () V!24235)

(declare-datatypes ((ValueCell!6797 0))(
  ( (ValueCellFull!6797 (v!9689 V!24235)) (EmptyCell!6797) )
))
(declare-datatypes ((array!45052 0))(
  ( (array!45053 (arr!21582 (Array (_ BitVec 32) ValueCell!6797)) (size!22003 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45052)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!348 (array!45050 array!45052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24235 V!24235 V!24235 V!24235 (_ BitVec 32) Int) Unit!27878)

(assert (=> b!817363 (= lt!366217 (lemmaNoChangeToArrayThenSameMapNoExtras!348 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2238 (array!45050 array!45052 (_ BitVec 32) (_ BitVec 32) V!24235 V!24235 (_ BitVec 32) Int) ListLongMap!8363)

(assert (=> b!817363 (= lt!366219 (getCurrentListMapNoExtraKeys!2238 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817363 (= lt!366218 (getCurrentListMapNoExtraKeys!2238 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817364 () Bool)

(declare-fun res!557936 () Bool)

(assert (=> b!817364 (=> (not res!557936) (not e!453536))))

(declare-datatypes ((List!15370 0))(
  ( (Nil!15367) (Cons!15366 (h!16495 (_ BitVec 64)) (t!21695 List!15370)) )
))
(declare-fun arrayNoDuplicates!0 (array!45050 (_ BitVec 32) List!15370) Bool)

(assert (=> b!817364 (= res!557936 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15367))))

(declare-fun b!817365 () Bool)

(declare-fun e!453540 () Bool)

(declare-fun tp_is_empty!14425 () Bool)

(assert (=> b!817365 (= e!453540 tp_is_empty!14425)))

(declare-fun b!817366 () Bool)

(declare-fun res!557937 () Bool)

(assert (=> b!817366 (=> (not res!557937) (not e!453536))))

(assert (=> b!817366 (= res!557937 (and (= (size!22003 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22002 _keys!976) (size!22003 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817367 () Bool)

(declare-fun res!557938 () Bool)

(assert (=> b!817367 (=> (not res!557938) (not e!453536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45050 (_ BitVec 32)) Bool)

(assert (=> b!817367 (= res!557938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23230 () Bool)

(declare-fun mapRes!23230 () Bool)

(declare-fun tp!44871 () Bool)

(assert (=> mapNonEmpty!23230 (= mapRes!23230 (and tp!44871 e!453540))))

(declare-fun mapValue!23230 () ValueCell!6797)

(declare-fun mapKey!23230 () (_ BitVec 32))

(declare-fun mapRest!23230 () (Array (_ BitVec 32) ValueCell!6797))

(assert (=> mapNonEmpty!23230 (= (arr!21582 _values!788) (store mapRest!23230 mapKey!23230 mapValue!23230))))

(declare-fun b!817368 () Bool)

(declare-fun e!453539 () Bool)

(assert (=> b!817368 (= e!453539 tp_is_empty!14425)))

(declare-fun mapIsEmpty!23230 () Bool)

(assert (=> mapIsEmpty!23230 mapRes!23230))

(declare-fun b!817362 () Bool)

(declare-fun e!453537 () Bool)

(assert (=> b!817362 (= e!453537 (and e!453539 mapRes!23230))))

(declare-fun condMapEmpty!23230 () Bool)

(declare-fun mapDefault!23230 () ValueCell!6797)

