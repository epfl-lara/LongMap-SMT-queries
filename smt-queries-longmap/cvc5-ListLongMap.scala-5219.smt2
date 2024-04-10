; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70364 () Bool)

(assert start!70364)

(declare-fun b_free!12721 () Bool)

(declare-fun b_next!12721 () Bool)

(assert (=> start!70364 (= b_free!12721 (not b_next!12721))))

(declare-fun tp!44889 () Bool)

(declare-fun b_and!21533 () Bool)

(assert (=> start!70364 (= tp!44889 b_and!21533)))

(declare-fun mapNonEmpty!23239 () Bool)

(declare-fun mapRes!23239 () Bool)

(declare-fun tp!44890 () Bool)

(declare-fun e!453582 () Bool)

(assert (=> mapNonEmpty!23239 (= mapRes!23239 (and tp!44890 e!453582))))

(declare-datatypes ((V!24243 0))(
  ( (V!24244 (val!7263 Int)) )
))
(declare-datatypes ((ValueCell!6800 0))(
  ( (ValueCellFull!6800 (v!9692 V!24243)) (EmptyCell!6800) )
))
(declare-fun mapValue!23239 () ValueCell!6800)

(declare-datatypes ((array!45062 0))(
  ( (array!45063 (arr!21587 (Array (_ BitVec 32) ValueCell!6800)) (size!22008 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45062)

(declare-fun mapKey!23239 () (_ BitVec 32))

(declare-fun mapRest!23239 () (Array (_ BitVec 32) ValueCell!6800))

(assert (=> mapNonEmpty!23239 (= (arr!21587 _values!788) (store mapRest!23239 mapKey!23239 mapValue!23239))))

(declare-fun b!817425 () Bool)

(declare-fun res!557974 () Bool)

(declare-fun e!453581 () Bool)

(assert (=> b!817425 (=> (not res!557974) (not e!453581))))

(declare-datatypes ((array!45064 0))(
  ( (array!45065 (arr!21588 (Array (_ BitVec 32) (_ BitVec 64))) (size!22009 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45064)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45064 (_ BitVec 32)) Bool)

(assert (=> b!817425 (= res!557974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817426 () Bool)

(declare-fun tp_is_empty!14431 () Bool)

(assert (=> b!817426 (= e!453582 tp_is_empty!14431)))

(declare-fun res!557972 () Bool)

(assert (=> start!70364 (=> (not res!557972) (not e!453581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70364 (= res!557972 (validMask!0 mask!1312))))

(assert (=> start!70364 e!453581))

(assert (=> start!70364 tp_is_empty!14431))

(declare-fun array_inv!17271 (array!45064) Bool)

(assert (=> start!70364 (array_inv!17271 _keys!976)))

(assert (=> start!70364 true))

(declare-fun e!453584 () Bool)

(declare-fun array_inv!17272 (array!45062) Bool)

(assert (=> start!70364 (and (array_inv!17272 _values!788) e!453584)))

(assert (=> start!70364 tp!44889))

(declare-fun b!817427 () Bool)

(declare-fun res!557971 () Bool)

(assert (=> b!817427 (=> (not res!557971) (not e!453581))))

(declare-datatypes ((List!15374 0))(
  ( (Nil!15371) (Cons!15370 (h!16499 (_ BitVec 64)) (t!21699 List!15374)) )
))
(declare-fun arrayNoDuplicates!0 (array!45064 (_ BitVec 32) List!15374) Bool)

(assert (=> b!817427 (= res!557971 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15371))))

(declare-fun mapIsEmpty!23239 () Bool)

(assert (=> mapIsEmpty!23239 mapRes!23239))

(declare-fun b!817428 () Bool)

(assert (=> b!817428 (= e!453581 (not true))))

(declare-datatypes ((tuple2!9544 0))(
  ( (tuple2!9545 (_1!4783 (_ BitVec 64)) (_2!4783 V!24243)) )
))
(declare-datatypes ((List!15375 0))(
  ( (Nil!15372) (Cons!15371 (h!16500 tuple2!9544) (t!21700 List!15375)) )
))
(declare-datatypes ((ListLongMap!8367 0))(
  ( (ListLongMap!8368 (toList!4199 List!15375)) )
))
(declare-fun lt!366245 () ListLongMap!8367)

(declare-fun lt!366244 () ListLongMap!8367)

(assert (=> b!817428 (= lt!366245 lt!366244)))

(declare-fun zeroValueBefore!34 () V!24243)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24243)

(declare-fun minValue!754 () V!24243)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27882 0))(
  ( (Unit!27883) )
))
(declare-fun lt!366246 () Unit!27882)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!350 (array!45064 array!45062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24243 V!24243 V!24243 V!24243 (_ BitVec 32) Int) Unit!27882)

(assert (=> b!817428 (= lt!366246 (lemmaNoChangeToArrayThenSameMapNoExtras!350 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2240 (array!45064 array!45062 (_ BitVec 32) (_ BitVec 32) V!24243 V!24243 (_ BitVec 32) Int) ListLongMap!8367)

(assert (=> b!817428 (= lt!366244 (getCurrentListMapNoExtraKeys!2240 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817428 (= lt!366245 (getCurrentListMapNoExtraKeys!2240 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817429 () Bool)

(declare-fun e!453583 () Bool)

(assert (=> b!817429 (= e!453583 tp_is_empty!14431)))

(declare-fun b!817430 () Bool)

(assert (=> b!817430 (= e!453584 (and e!453583 mapRes!23239))))

(declare-fun condMapEmpty!23239 () Bool)

(declare-fun mapDefault!23239 () ValueCell!6800)

