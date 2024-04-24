; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70374 () Bool)

(assert start!70374)

(declare-fun b_free!12601 () Bool)

(declare-fun b_next!12601 () Bool)

(assert (=> start!70374 (= b_free!12601 (not b_next!12601))))

(declare-fun tp!44524 () Bool)

(declare-fun b_and!21399 () Bool)

(assert (=> start!70374 (= tp!44524 b_and!21399)))

(declare-fun mapIsEmpty!23053 () Bool)

(declare-fun mapRes!23053 () Bool)

(assert (=> mapIsEmpty!23053 mapRes!23053))

(declare-fun b!816549 () Bool)

(declare-fun e!452902 () Bool)

(assert (=> b!816549 (= e!452902 true)))

(declare-datatypes ((V!24083 0))(
  ( (V!24084 (val!7203 Int)) )
))
(declare-datatypes ((tuple2!9370 0))(
  ( (tuple2!9371 (_1!4696 (_ BitVec 64)) (_2!4696 V!24083)) )
))
(declare-datatypes ((List!15184 0))(
  ( (Nil!15181) (Cons!15180 (h!16315 tuple2!9370) (t!21497 List!15184)) )
))
(declare-datatypes ((ListLongMap!8195 0))(
  ( (ListLongMap!8196 (toList!4113 List!15184)) )
))
(declare-fun lt!365531 () ListLongMap!8195)

(declare-datatypes ((array!44823 0))(
  ( (array!44824 (arr!21465 (Array (_ BitVec 32) (_ BitVec 64))) (size!21885 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44823)

(declare-fun zeroValueAfter!34 () V!24083)

(declare-fun minValue!754 () V!24083)

(declare-datatypes ((ValueCell!6740 0))(
  ( (ValueCellFull!6740 (v!9630 V!24083)) (EmptyCell!6740) )
))
(declare-datatypes ((array!44825 0))(
  ( (array!44826 (arr!21466 (Array (_ BitVec 32) ValueCell!6740)) (size!21886 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44825)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2334 (array!44823 array!44825 (_ BitVec 32) (_ BitVec 32) V!24083 V!24083 (_ BitVec 32) Int) ListLongMap!8195)

(assert (=> b!816549 (= lt!365531 (getCurrentListMap!2334 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365530 () ListLongMap!8195)

(declare-fun zeroValueBefore!34 () V!24083)

(declare-fun +!1794 (ListLongMap!8195 tuple2!9370) ListLongMap!8195)

(assert (=> b!816549 (= lt!365530 (+!1794 (getCurrentListMap!2334 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816550 () Bool)

(declare-fun res!557293 () Bool)

(declare-fun e!452898 () Bool)

(assert (=> b!816550 (=> (not res!557293) (not e!452898))))

(assert (=> b!816550 (= res!557293 (and (= (size!21886 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21885 _keys!976) (size!21886 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!557295 () Bool)

(assert (=> start!70374 (=> (not res!557295) (not e!452898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70374 (= res!557295 (validMask!0 mask!1312))))

(assert (=> start!70374 e!452898))

(declare-fun tp_is_empty!14311 () Bool)

(assert (=> start!70374 tp_is_empty!14311))

(declare-fun array_inv!17217 (array!44823) Bool)

(assert (=> start!70374 (array_inv!17217 _keys!976)))

(assert (=> start!70374 true))

(declare-fun e!452901 () Bool)

(declare-fun array_inv!17218 (array!44825) Bool)

(assert (=> start!70374 (and (array_inv!17218 _values!788) e!452901)))

(assert (=> start!70374 tp!44524))

(declare-fun b!816551 () Bool)

(declare-fun e!452900 () Bool)

(assert (=> b!816551 (= e!452900 tp_is_empty!14311)))

(declare-fun b!816552 () Bool)

(declare-fun e!452897 () Bool)

(assert (=> b!816552 (= e!452897 tp_is_empty!14311)))

(declare-fun b!816553 () Bool)

(declare-fun res!557291 () Bool)

(assert (=> b!816553 (=> (not res!557291) (not e!452898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44823 (_ BitVec 32)) Bool)

(assert (=> b!816553 (= res!557291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816554 () Bool)

(assert (=> b!816554 (= e!452898 (not e!452902))))

(declare-fun res!557292 () Bool)

(assert (=> b!816554 (=> res!557292 e!452902)))

(assert (=> b!816554 (= res!557292 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365533 () ListLongMap!8195)

(declare-fun lt!365532 () ListLongMap!8195)

(assert (=> b!816554 (= lt!365533 lt!365532)))

(declare-datatypes ((Unit!27793 0))(
  ( (Unit!27794) )
))
(declare-fun lt!365534 () Unit!27793)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!308 (array!44823 array!44825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24083 V!24083 V!24083 V!24083 (_ BitVec 32) Int) Unit!27793)

(assert (=> b!816554 (= lt!365534 (lemmaNoChangeToArrayThenSameMapNoExtras!308 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2220 (array!44823 array!44825 (_ BitVec 32) (_ BitVec 32) V!24083 V!24083 (_ BitVec 32) Int) ListLongMap!8195)

(assert (=> b!816554 (= lt!365532 (getCurrentListMapNoExtraKeys!2220 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816554 (= lt!365533 (getCurrentListMapNoExtraKeys!2220 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23053 () Bool)

(declare-fun tp!44523 () Bool)

(assert (=> mapNonEmpty!23053 (= mapRes!23053 (and tp!44523 e!452900))))

(declare-fun mapKey!23053 () (_ BitVec 32))

(declare-fun mapValue!23053 () ValueCell!6740)

(declare-fun mapRest!23053 () (Array (_ BitVec 32) ValueCell!6740))

(assert (=> mapNonEmpty!23053 (= (arr!21466 _values!788) (store mapRest!23053 mapKey!23053 mapValue!23053))))

(declare-fun b!816555 () Bool)

(assert (=> b!816555 (= e!452901 (and e!452897 mapRes!23053))))

(declare-fun condMapEmpty!23053 () Bool)

(declare-fun mapDefault!23053 () ValueCell!6740)

(assert (=> b!816555 (= condMapEmpty!23053 (= (arr!21466 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6740)) mapDefault!23053)))))

(declare-fun b!816556 () Bool)

(declare-fun res!557294 () Bool)

(assert (=> b!816556 (=> (not res!557294) (not e!452898))))

(declare-datatypes ((List!15185 0))(
  ( (Nil!15182) (Cons!15181 (h!16316 (_ BitVec 64)) (t!21498 List!15185)) )
))
(declare-fun arrayNoDuplicates!0 (array!44823 (_ BitVec 32) List!15185) Bool)

(assert (=> b!816556 (= res!557294 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15182))))

(assert (= (and start!70374 res!557295) b!816550))

(assert (= (and b!816550 res!557293) b!816553))

(assert (= (and b!816553 res!557291) b!816556))

(assert (= (and b!816556 res!557294) b!816554))

(assert (= (and b!816554 (not res!557292)) b!816549))

(assert (= (and b!816555 condMapEmpty!23053) mapIsEmpty!23053))

(assert (= (and b!816555 (not condMapEmpty!23053)) mapNonEmpty!23053))

(get-info :version)

(assert (= (and mapNonEmpty!23053 ((_ is ValueCellFull!6740) mapValue!23053)) b!816551))

(assert (= (and b!816555 ((_ is ValueCellFull!6740) mapDefault!23053)) b!816552))

(assert (= start!70374 b!816555))

(declare-fun m!758583 () Bool)

(assert (=> b!816554 m!758583))

(declare-fun m!758585 () Bool)

(assert (=> b!816554 m!758585))

(declare-fun m!758587 () Bool)

(assert (=> b!816554 m!758587))

(declare-fun m!758589 () Bool)

(assert (=> b!816556 m!758589))

(declare-fun m!758591 () Bool)

(assert (=> b!816553 m!758591))

(declare-fun m!758593 () Bool)

(assert (=> mapNonEmpty!23053 m!758593))

(declare-fun m!758595 () Bool)

(assert (=> start!70374 m!758595))

(declare-fun m!758597 () Bool)

(assert (=> start!70374 m!758597))

(declare-fun m!758599 () Bool)

(assert (=> start!70374 m!758599))

(declare-fun m!758601 () Bool)

(assert (=> b!816549 m!758601))

(declare-fun m!758603 () Bool)

(assert (=> b!816549 m!758603))

(assert (=> b!816549 m!758603))

(declare-fun m!758605 () Bool)

(assert (=> b!816549 m!758605))

(check-sat b_and!21399 tp_is_empty!14311 (not b_next!12601) (not b!816549) (not b!816556) (not b!816553) (not b!816554) (not mapNonEmpty!23053) (not start!70374))
(check-sat b_and!21399 (not b_next!12601))
