; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70524 () Bool)

(assert start!70524)

(declare-fun b_free!12851 () Bool)

(declare-fun b_next!12851 () Bool)

(assert (=> start!70524 (= b_free!12851 (not b_next!12851))))

(declare-fun tp!45286 () Bool)

(declare-fun b_and!21681 () Bool)

(assert (=> start!70524 (= tp!45286 b_and!21681)))

(declare-fun b!819246 () Bool)

(declare-fun res!559067 () Bool)

(declare-fun e!454931 () Bool)

(assert (=> b!819246 (=> (not res!559067) (not e!454931))))

(declare-datatypes ((array!45318 0))(
  ( (array!45319 (arr!21713 (Array (_ BitVec 32) (_ BitVec 64))) (size!22134 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45318)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24415 0))(
  ( (V!24416 (val!7328 Int)) )
))
(declare-datatypes ((ValueCell!6865 0))(
  ( (ValueCellFull!6865 (v!9757 V!24415)) (EmptyCell!6865) )
))
(declare-datatypes ((array!45320 0))(
  ( (array!45321 (arr!21714 (Array (_ BitVec 32) ValueCell!6865)) (size!22135 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45320)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819246 (= res!559067 (and (= (size!22135 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22134 _keys!976) (size!22135 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819248 () Bool)

(declare-fun res!559064 () Bool)

(assert (=> b!819248 (=> (not res!559064) (not e!454931))))

(declare-datatypes ((List!15469 0))(
  ( (Nil!15466) (Cons!15465 (h!16594 (_ BitVec 64)) (t!21798 List!15469)) )
))
(declare-fun arrayNoDuplicates!0 (array!45318 (_ BitVec 32) List!15469) Bool)

(assert (=> b!819248 (= res!559064 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15466))))

(declare-fun b!819249 () Bool)

(declare-fun e!454932 () Bool)

(assert (=> b!819249 (= e!454931 (not e!454932))))

(declare-fun res!559068 () Bool)

(assert (=> b!819249 (=> res!559068 e!454932)))

(assert (=> b!819249 (= res!559068 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9640 0))(
  ( (tuple2!9641 (_1!4831 (_ BitVec 64)) (_2!4831 V!24415)) )
))
(declare-datatypes ((List!15470 0))(
  ( (Nil!15467) (Cons!15466 (h!16595 tuple2!9640) (t!21799 List!15470)) )
))
(declare-datatypes ((ListLongMap!8463 0))(
  ( (ListLongMap!8464 (toList!4247 List!15470)) )
))
(declare-fun lt!367557 () ListLongMap!8463)

(declare-fun lt!367555 () ListLongMap!8463)

(assert (=> b!819249 (= lt!367557 lt!367555)))

(declare-fun zeroValueBefore!34 () V!24415)

(declare-datatypes ((Unit!27971 0))(
  ( (Unit!27972) )
))
(declare-fun lt!367556 () Unit!27971)

(declare-fun zeroValueAfter!34 () V!24415)

(declare-fun minValue!754 () V!24415)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!390 (array!45318 array!45320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24415 V!24415 V!24415 V!24415 (_ BitVec 32) Int) Unit!27971)

(assert (=> b!819249 (= lt!367556 (lemmaNoChangeToArrayThenSameMapNoExtras!390 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2280 (array!45318 array!45320 (_ BitVec 32) (_ BitVec 32) V!24415 V!24415 (_ BitVec 32) Int) ListLongMap!8463)

(assert (=> b!819249 (= lt!367555 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819249 (= lt!367557 (getCurrentListMapNoExtraKeys!2280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819250 () Bool)

(declare-fun lt!367561 () ListLongMap!8463)

(declare-fun e!454930 () Bool)

(declare-fun +!1844 (ListLongMap!8463 tuple2!9640) ListLongMap!8463)

(assert (=> b!819250 (= e!454930 (= lt!367561 (+!1844 lt!367555 (tuple2!9641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819251 () Bool)

(declare-fun e!454928 () Bool)

(declare-fun tp_is_empty!14561 () Bool)

(assert (=> b!819251 (= e!454928 tp_is_empty!14561)))

(declare-fun b!819252 () Bool)

(assert (=> b!819252 (= e!454932 true)))

(declare-fun lt!367559 () tuple2!9640)

(declare-fun lt!367554 () ListLongMap!8463)

(declare-fun lt!367558 () tuple2!9640)

(assert (=> b!819252 (= lt!367554 (+!1844 (+!1844 lt!367555 lt!367558) lt!367559))))

(declare-fun lt!367562 () ListLongMap!8463)

(assert (=> b!819252 (= (+!1844 lt!367557 lt!367559) (+!1844 lt!367562 lt!367559))))

(declare-fun lt!367560 () Unit!27971)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!183 (ListLongMap!8463 (_ BitVec 64) V!24415 V!24415) Unit!27971)

(assert (=> b!819252 (= lt!367560 (addSameAsAddTwiceSameKeyDiffValues!183 lt!367557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819252 (= lt!367559 (tuple2!9641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819252 e!454930))

(declare-fun res!559063 () Bool)

(assert (=> b!819252 (=> (not res!559063) (not e!454930))))

(declare-fun lt!367553 () ListLongMap!8463)

(assert (=> b!819252 (= res!559063 (= lt!367553 lt!367562))))

(assert (=> b!819252 (= lt!367562 (+!1844 lt!367557 lt!367558))))

(assert (=> b!819252 (= lt!367558 (tuple2!9641 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2449 (array!45318 array!45320 (_ BitVec 32) (_ BitVec 32) V!24415 V!24415 (_ BitVec 32) Int) ListLongMap!8463)

(assert (=> b!819252 (= lt!367561 (getCurrentListMap!2449 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819252 (= lt!367553 (getCurrentListMap!2449 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23440 () Bool)

(declare-fun mapRes!23440 () Bool)

(declare-fun tp!45285 () Bool)

(assert (=> mapNonEmpty!23440 (= mapRes!23440 (and tp!45285 e!454928))))

(declare-fun mapValue!23440 () ValueCell!6865)

(declare-fun mapKey!23440 () (_ BitVec 32))

(declare-fun mapRest!23440 () (Array (_ BitVec 32) ValueCell!6865))

(assert (=> mapNonEmpty!23440 (= (arr!21714 _values!788) (store mapRest!23440 mapKey!23440 mapValue!23440))))

(declare-fun mapIsEmpty!23440 () Bool)

(assert (=> mapIsEmpty!23440 mapRes!23440))

(declare-fun b!819247 () Bool)

(declare-fun res!559065 () Bool)

(assert (=> b!819247 (=> (not res!559065) (not e!454931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45318 (_ BitVec 32)) Bool)

(assert (=> b!819247 (= res!559065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!559066 () Bool)

(assert (=> start!70524 (=> (not res!559066) (not e!454931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70524 (= res!559066 (validMask!0 mask!1312))))

(assert (=> start!70524 e!454931))

(assert (=> start!70524 tp_is_empty!14561))

(declare-fun array_inv!17357 (array!45318) Bool)

(assert (=> start!70524 (array_inv!17357 _keys!976)))

(assert (=> start!70524 true))

(declare-fun e!454934 () Bool)

(declare-fun array_inv!17358 (array!45320) Bool)

(assert (=> start!70524 (and (array_inv!17358 _values!788) e!454934)))

(assert (=> start!70524 tp!45286))

(declare-fun b!819253 () Bool)

(declare-fun e!454933 () Bool)

(assert (=> b!819253 (= e!454933 tp_is_empty!14561)))

(declare-fun b!819254 () Bool)

(assert (=> b!819254 (= e!454934 (and e!454933 mapRes!23440))))

(declare-fun condMapEmpty!23440 () Bool)

(declare-fun mapDefault!23440 () ValueCell!6865)

