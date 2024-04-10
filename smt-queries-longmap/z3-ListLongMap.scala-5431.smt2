; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72372 () Bool)

(assert start!72372)

(declare-fun b_free!13557 () Bool)

(declare-fun b_next!13557 () Bool)

(assert (=> start!72372 (= b_free!13557 (not b_next!13557))))

(declare-fun tp!47770 () Bool)

(declare-fun b_and!22643 () Bool)

(assert (=> start!72372 (= tp!47770 b_and!22643)))

(declare-fun b!838673 () Bool)

(declare-fun e!468128 () Bool)

(declare-fun tp_is_empty!15423 () Bool)

(assert (=> b!838673 (= e!468128 tp_is_empty!15423)))

(declare-fun b!838674 () Bool)

(declare-fun res!570277 () Bool)

(declare-fun e!468125 () Bool)

(assert (=> b!838674 (=> (not res!570277) (not e!468125))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47132 0))(
  ( (array!47133 (arr!22597 (Array (_ BitVec 32) (_ BitVec 64))) (size!23037 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47132)

(assert (=> b!838674 (= res!570277 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23037 _keys!868))))))

(declare-fun b!838675 () Bool)

(declare-fun e!468127 () Bool)

(declare-fun mapRes!24734 () Bool)

(assert (=> b!838675 (= e!468127 (and e!468128 mapRes!24734))))

(declare-fun condMapEmpty!24734 () Bool)

(declare-datatypes ((V!25611 0))(
  ( (V!25612 (val!7759 Int)) )
))
(declare-datatypes ((ValueCell!7272 0))(
  ( (ValueCellFull!7272 (v!10184 V!25611)) (EmptyCell!7272) )
))
(declare-datatypes ((array!47134 0))(
  ( (array!47135 (arr!22598 (Array (_ BitVec 32) ValueCell!7272)) (size!23038 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47134)

(declare-fun mapDefault!24734 () ValueCell!7272)

(assert (=> b!838675 (= condMapEmpty!24734 (= (arr!22598 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7272)) mapDefault!24734)))))

(declare-datatypes ((tuple2!10264 0))(
  ( (tuple2!10265 (_1!5143 (_ BitVec 64)) (_2!5143 V!25611)) )
))
(declare-datatypes ((List!16066 0))(
  ( (Nil!16063) (Cons!16062 (h!17193 tuple2!10264) (t!22437 List!16066)) )
))
(declare-datatypes ((ListLongMap!9033 0))(
  ( (ListLongMap!9034 (toList!4532 List!16066)) )
))
(declare-fun call!36905 () ListLongMap!9033)

(declare-fun v!557 () V!25611)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!36901 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25611)

(declare-fun zeroValue!654 () V!25611)

(declare-fun getCurrentListMapNoExtraKeys!2524 (array!47132 array!47134 (_ BitVec 32) (_ BitVec 32) V!25611 V!25611 (_ BitVec 32) Int) ListLongMap!9033)

(assert (=> bm!36901 (= call!36905 (getCurrentListMapNoExtraKeys!2524 _keys!868 (array!47135 (store (arr!22598 _values!688) i!612 (ValueCellFull!7272 v!557)) (size!23038 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun e!468129 () Bool)

(declare-fun b!838676 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!36904 () ListLongMap!9033)

(declare-fun +!2006 (ListLongMap!9033 tuple2!10264) ListLongMap!9033)

(assert (=> b!838676 (= e!468129 (= call!36905 (+!2006 call!36904 (tuple2!10265 k0!854 v!557))))))

(declare-fun b!838677 () Bool)

(declare-fun e!468130 () Bool)

(assert (=> b!838677 (= e!468130 tp_is_empty!15423)))

(declare-fun mapIsEmpty!24734 () Bool)

(assert (=> mapIsEmpty!24734 mapRes!24734))

(declare-fun b!838678 () Bool)

(declare-fun res!570276 () Bool)

(assert (=> b!838678 (=> (not res!570276) (not e!468125))))

(assert (=> b!838678 (= res!570276 (and (= (select (arr!22597 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23037 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838679 () Bool)

(assert (=> b!838679 (= e!468125 (not true))))

(assert (=> b!838679 e!468129))

(declare-fun c!91195 () Bool)

(assert (=> b!838679 (= c!91195 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28803 0))(
  ( (Unit!28804) )
))
(declare-fun lt!380701 () Unit!28803)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!247 (array!47132 array!47134 (_ BitVec 32) (_ BitVec 32) V!25611 V!25611 (_ BitVec 32) (_ BitVec 64) V!25611 (_ BitVec 32) Int) Unit!28803)

(assert (=> b!838679 (= lt!380701 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!247 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570279 () Bool)

(assert (=> start!72372 (=> (not res!570279) (not e!468125))))

(assert (=> start!72372 (= res!570279 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23037 _keys!868))))))

(assert (=> start!72372 e!468125))

(assert (=> start!72372 tp_is_empty!15423))

(assert (=> start!72372 true))

(assert (=> start!72372 tp!47770))

(declare-fun array_inv!18002 (array!47132) Bool)

(assert (=> start!72372 (array_inv!18002 _keys!868)))

(declare-fun array_inv!18003 (array!47134) Bool)

(assert (=> start!72372 (and (array_inv!18003 _values!688) e!468127)))

(declare-fun b!838680 () Bool)

(declare-fun res!570275 () Bool)

(assert (=> b!838680 (=> (not res!570275) (not e!468125))))

(declare-datatypes ((List!16067 0))(
  ( (Nil!16064) (Cons!16063 (h!17194 (_ BitVec 64)) (t!22438 List!16067)) )
))
(declare-fun arrayNoDuplicates!0 (array!47132 (_ BitVec 32) List!16067) Bool)

(assert (=> b!838680 (= res!570275 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16064))))

(declare-fun b!838681 () Bool)

(declare-fun res!570281 () Bool)

(assert (=> b!838681 (=> (not res!570281) (not e!468125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838681 (= res!570281 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24734 () Bool)

(declare-fun tp!47769 () Bool)

(assert (=> mapNonEmpty!24734 (= mapRes!24734 (and tp!47769 e!468130))))

(declare-fun mapValue!24734 () ValueCell!7272)

(declare-fun mapRest!24734 () (Array (_ BitVec 32) ValueCell!7272))

(declare-fun mapKey!24734 () (_ BitVec 32))

(assert (=> mapNonEmpty!24734 (= (arr!22598 _values!688) (store mapRest!24734 mapKey!24734 mapValue!24734))))

(declare-fun b!838682 () Bool)

(declare-fun res!570278 () Bool)

(assert (=> b!838682 (=> (not res!570278) (not e!468125))))

(assert (=> b!838682 (= res!570278 (and (= (size!23038 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23037 _keys!868) (size!23038 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838683 () Bool)

(declare-fun res!570274 () Bool)

(assert (=> b!838683 (=> (not res!570274) (not e!468125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838683 (= res!570274 (validKeyInArray!0 k0!854))))

(declare-fun b!838684 () Bool)

(assert (=> b!838684 (= e!468129 (= call!36905 call!36904))))

(declare-fun b!838685 () Bool)

(declare-fun res!570280 () Bool)

(assert (=> b!838685 (=> (not res!570280) (not e!468125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47132 (_ BitVec 32)) Bool)

(assert (=> b!838685 (= res!570280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!36902 () Bool)

(assert (=> bm!36902 (= call!36904 (getCurrentListMapNoExtraKeys!2524 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72372 res!570279) b!838681))

(assert (= (and b!838681 res!570281) b!838682))

(assert (= (and b!838682 res!570278) b!838685))

(assert (= (and b!838685 res!570280) b!838680))

(assert (= (and b!838680 res!570275) b!838674))

(assert (= (and b!838674 res!570277) b!838683))

(assert (= (and b!838683 res!570274) b!838678))

(assert (= (and b!838678 res!570276) b!838679))

(assert (= (and b!838679 c!91195) b!838676))

(assert (= (and b!838679 (not c!91195)) b!838684))

(assert (= (or b!838676 b!838684) bm!36901))

(assert (= (or b!838676 b!838684) bm!36902))

(assert (= (and b!838675 condMapEmpty!24734) mapIsEmpty!24734))

(assert (= (and b!838675 (not condMapEmpty!24734)) mapNonEmpty!24734))

(get-info :version)

(assert (= (and mapNonEmpty!24734 ((_ is ValueCellFull!7272) mapValue!24734)) b!838677))

(assert (= (and b!838675 ((_ is ValueCellFull!7272) mapDefault!24734)) b!838673))

(assert (= start!72372 b!838675))

(declare-fun m!783035 () Bool)

(assert (=> bm!36901 m!783035))

(declare-fun m!783037 () Bool)

(assert (=> bm!36901 m!783037))

(declare-fun m!783039 () Bool)

(assert (=> b!838680 m!783039))

(declare-fun m!783041 () Bool)

(assert (=> start!72372 m!783041))

(declare-fun m!783043 () Bool)

(assert (=> start!72372 m!783043))

(declare-fun m!783045 () Bool)

(assert (=> mapNonEmpty!24734 m!783045))

(declare-fun m!783047 () Bool)

(assert (=> b!838681 m!783047))

(declare-fun m!783049 () Bool)

(assert (=> b!838676 m!783049))

(declare-fun m!783051 () Bool)

(assert (=> b!838679 m!783051))

(declare-fun m!783053 () Bool)

(assert (=> b!838685 m!783053))

(declare-fun m!783055 () Bool)

(assert (=> b!838683 m!783055))

(declare-fun m!783057 () Bool)

(assert (=> b!838678 m!783057))

(declare-fun m!783059 () Bool)

(assert (=> bm!36902 m!783059))

(check-sat (not b!838683) (not b!838680) (not bm!36901) tp_is_empty!15423 (not b!838676) (not b_next!13557) (not start!72372) (not b!838681) (not b!838679) b_and!22643 (not mapNonEmpty!24734) (not bm!36902) (not b!838685))
(check-sat b_and!22643 (not b_next!13557))
