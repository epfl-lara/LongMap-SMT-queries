; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70382 () Bool)

(assert start!70382)

(declare-fun b_free!12739 () Bool)

(declare-fun b_next!12739 () Bool)

(assert (=> start!70382 (= b_free!12739 (not b_next!12739))))

(declare-fun tp!44944 () Bool)

(declare-fun b_and!21551 () Bool)

(assert (=> start!70382 (= tp!44944 b_and!21551)))

(declare-fun b!817614 () Bool)

(declare-fun e!453716 () Bool)

(assert (=> b!817614 (= e!453716 (not true))))

(declare-datatypes ((V!24267 0))(
  ( (V!24268 (val!7272 Int)) )
))
(declare-datatypes ((tuple2!9556 0))(
  ( (tuple2!9557 (_1!4789 (_ BitVec 64)) (_2!4789 V!24267)) )
))
(declare-datatypes ((List!15386 0))(
  ( (Nil!15383) (Cons!15382 (h!16511 tuple2!9556) (t!21711 List!15386)) )
))
(declare-datatypes ((ListLongMap!8379 0))(
  ( (ListLongMap!8380 (toList!4205 List!15386)) )
))
(declare-fun lt!366327 () ListLongMap!8379)

(declare-fun lt!366326 () ListLongMap!8379)

(assert (=> b!817614 (= lt!366327 lt!366326)))

(declare-datatypes ((array!45096 0))(
  ( (array!45097 (arr!21604 (Array (_ BitVec 32) (_ BitVec 64))) (size!22025 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45096)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24267)

(declare-datatypes ((ValueCell!6809 0))(
  ( (ValueCellFull!6809 (v!9701 V!24267)) (EmptyCell!6809) )
))
(declare-datatypes ((array!45098 0))(
  ( (array!45099 (arr!21605 (Array (_ BitVec 32) ValueCell!6809)) (size!22026 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45098)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27894 0))(
  ( (Unit!27895) )
))
(declare-fun lt!366325 () Unit!27894)

(declare-fun zeroValueBefore!34 () V!24267)

(declare-fun minValue!754 () V!24267)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!356 (array!45096 array!45098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24267 V!24267 V!24267 V!24267 (_ BitVec 32) Int) Unit!27894)

(assert (=> b!817614 (= lt!366325 (lemmaNoChangeToArrayThenSameMapNoExtras!356 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2246 (array!45096 array!45098 (_ BitVec 32) (_ BitVec 32) V!24267 V!24267 (_ BitVec 32) Int) ListLongMap!8379)

(assert (=> b!817614 (= lt!366326 (getCurrentListMapNoExtraKeys!2246 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817614 (= lt!366327 (getCurrentListMapNoExtraKeys!2246 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817615 () Bool)

(declare-fun res!558082 () Bool)

(assert (=> b!817615 (=> (not res!558082) (not e!453716))))

(assert (=> b!817615 (= res!558082 (and (= (size!22026 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22025 _keys!976) (size!22026 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817616 () Bool)

(declare-fun e!453719 () Bool)

(declare-fun tp_is_empty!14449 () Bool)

(assert (=> b!817616 (= e!453719 tp_is_empty!14449)))

(declare-fun mapIsEmpty!23266 () Bool)

(declare-fun mapRes!23266 () Bool)

(assert (=> mapIsEmpty!23266 mapRes!23266))

(declare-fun b!817617 () Bool)

(declare-fun e!453720 () Bool)

(assert (=> b!817617 (= e!453720 (and e!453719 mapRes!23266))))

(declare-fun condMapEmpty!23266 () Bool)

(declare-fun mapDefault!23266 () ValueCell!6809)

