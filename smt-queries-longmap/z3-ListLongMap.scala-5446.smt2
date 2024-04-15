; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72442 () Bool)

(assert start!72442)

(declare-fun b_free!13645 () Bool)

(declare-fun b_next!13645 () Bool)

(assert (=> start!72442 (= b_free!13645 (not b_next!13645))))

(declare-fun tp!48034 () Bool)

(declare-fun b_and!22705 () Bool)

(assert (=> start!72442 (= tp!48034 b_and!22705)))

(declare-fun res!571221 () Bool)

(declare-fun e!468769 () Bool)

(assert (=> start!72442 (=> (not res!571221) (not e!468769))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47277 0))(
  ( (array!47278 (arr!22670 (Array (_ BitVec 32) (_ BitVec 64))) (size!23112 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47277)

(assert (=> start!72442 (= res!571221 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23112 _keys!868))))))

(assert (=> start!72442 e!468769))

(declare-fun tp_is_empty!15511 () Bool)

(assert (=> start!72442 tp_is_empty!15511))

(assert (=> start!72442 true))

(assert (=> start!72442 tp!48034))

(declare-fun array_inv!18122 (array!47277) Bool)

(assert (=> start!72442 (array_inv!18122 _keys!868)))

(declare-datatypes ((V!25729 0))(
  ( (V!25730 (val!7803 Int)) )
))
(declare-datatypes ((ValueCell!7316 0))(
  ( (ValueCellFull!7316 (v!10222 V!25729)) (EmptyCell!7316) )
))
(declare-datatypes ((array!47279 0))(
  ( (array!47280 (arr!22671 (Array (_ BitVec 32) ValueCell!7316)) (size!23113 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47279)

(declare-fun e!468773 () Bool)

(declare-fun array_inv!18123 (array!47279) Bool)

(assert (=> start!72442 (and (array_inv!18123 _values!688) e!468773)))

(declare-fun b!840150 () Bool)

(declare-fun res!571220 () Bool)

(assert (=> b!840150 (=> (not res!571220) (not e!468769))))

(declare-datatypes ((List!16136 0))(
  ( (Nil!16133) (Cons!16132 (h!17263 (_ BitVec 64)) (t!22498 List!16136)) )
))
(declare-fun arrayNoDuplicates!0 (array!47277 (_ BitVec 32) List!16136) Bool)

(assert (=> b!840150 (= res!571220 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16133))))

(declare-fun mapNonEmpty!24866 () Bool)

(declare-fun mapRes!24866 () Bool)

(declare-fun tp!48035 () Bool)

(declare-fun e!468770 () Bool)

(assert (=> mapNonEmpty!24866 (= mapRes!24866 (and tp!48035 e!468770))))

(declare-fun mapValue!24866 () ValueCell!7316)

(declare-fun mapKey!24866 () (_ BitVec 32))

(declare-fun mapRest!24866 () (Array (_ BitVec 32) ValueCell!7316))

(assert (=> mapNonEmpty!24866 (= (arr!22671 _values!688) (store mapRest!24866 mapKey!24866 mapValue!24866))))

(declare-fun b!840151 () Bool)

(declare-fun res!571225 () Bool)

(assert (=> b!840151 (=> (not res!571225) (not e!468769))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840151 (= res!571225 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23112 _keys!868))))))

(declare-datatypes ((tuple2!10356 0))(
  ( (tuple2!10357 (_1!5189 (_ BitVec 64)) (_2!5189 V!25729)) )
))
(declare-datatypes ((List!16137 0))(
  ( (Nil!16134) (Cons!16133 (h!17264 tuple2!10356) (t!22499 List!16137)) )
))
(declare-datatypes ((ListLongMap!9115 0))(
  ( (ListLongMap!9116 (toList!4573 List!16137)) )
))
(declare-fun call!37142 () ListLongMap!9115)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37139 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25729)

(declare-fun zeroValue!654 () V!25729)

(declare-fun getCurrentListMapNoExtraKeys!2593 (array!47277 array!47279 (_ BitVec 32) (_ BitVec 32) V!25729 V!25729 (_ BitVec 32) Int) ListLongMap!9115)

(assert (=> bm!37139 (= call!37142 (getCurrentListMapNoExtraKeys!2593 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840152 () Bool)

(assert (=> b!840152 (= e!468770 tp_is_empty!15511)))

(declare-fun v!557 () V!25729)

(declare-fun bm!37140 () Bool)

(declare-fun call!37143 () ListLongMap!9115)

(assert (=> bm!37140 (= call!37143 (getCurrentListMapNoExtraKeys!2593 _keys!868 (array!47280 (store (arr!22671 _values!688) i!612 (ValueCellFull!7316 v!557)) (size!23113 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840153 () Bool)

(declare-fun res!571224 () Bool)

(assert (=> b!840153 (=> (not res!571224) (not e!468769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840153 (= res!571224 (validMask!0 mask!1196))))

(declare-fun b!840154 () Bool)

(declare-fun e!468774 () Bool)

(assert (=> b!840154 (= e!468774 (= call!37143 call!37142))))

(declare-fun b!840155 () Bool)

(assert (=> b!840155 (= e!468769 (not true))))

(assert (=> b!840155 e!468774))

(declare-fun c!91262 () Bool)

(assert (=> b!840155 (= c!91262 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28807 0))(
  ( (Unit!28808) )
))
(declare-fun lt!380597 () Unit!28807)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!278 (array!47277 array!47279 (_ BitVec 32) (_ BitVec 32) V!25729 V!25729 (_ BitVec 32) (_ BitVec 64) V!25729 (_ BitVec 32) Int) Unit!28807)

(assert (=> b!840155 (= lt!380597 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!278 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840156 () Bool)

(declare-fun e!468771 () Bool)

(assert (=> b!840156 (= e!468771 tp_is_empty!15511)))

(declare-fun b!840157 () Bool)

(declare-fun res!571223 () Bool)

(assert (=> b!840157 (=> (not res!571223) (not e!468769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47277 (_ BitVec 32)) Bool)

(assert (=> b!840157 (= res!571223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840158 () Bool)

(declare-fun res!571227 () Bool)

(assert (=> b!840158 (=> (not res!571227) (not e!468769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840158 (= res!571227 (validKeyInArray!0 k0!854))))

(declare-fun b!840159 () Bool)

(assert (=> b!840159 (= e!468773 (and e!468771 mapRes!24866))))

(declare-fun condMapEmpty!24866 () Bool)

(declare-fun mapDefault!24866 () ValueCell!7316)

(assert (=> b!840159 (= condMapEmpty!24866 (= (arr!22671 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7316)) mapDefault!24866)))))

(declare-fun b!840160 () Bool)

(declare-fun res!571226 () Bool)

(assert (=> b!840160 (=> (not res!571226) (not e!468769))))

(assert (=> b!840160 (= res!571226 (and (= (size!23113 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23112 _keys!868) (size!23113 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840161 () Bool)

(declare-fun res!571222 () Bool)

(assert (=> b!840161 (=> (not res!571222) (not e!468769))))

(assert (=> b!840161 (= res!571222 (and (= (select (arr!22670 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23112 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24866 () Bool)

(assert (=> mapIsEmpty!24866 mapRes!24866))

(declare-fun b!840162 () Bool)

(declare-fun +!2061 (ListLongMap!9115 tuple2!10356) ListLongMap!9115)

(assert (=> b!840162 (= e!468774 (= call!37143 (+!2061 call!37142 (tuple2!10357 k0!854 v!557))))))

(assert (= (and start!72442 res!571221) b!840153))

(assert (= (and b!840153 res!571224) b!840160))

(assert (= (and b!840160 res!571226) b!840157))

(assert (= (and b!840157 res!571223) b!840150))

(assert (= (and b!840150 res!571220) b!840151))

(assert (= (and b!840151 res!571225) b!840158))

(assert (= (and b!840158 res!571227) b!840161))

(assert (= (and b!840161 res!571222) b!840155))

(assert (= (and b!840155 c!91262) b!840162))

(assert (= (and b!840155 (not c!91262)) b!840154))

(assert (= (or b!840162 b!840154) bm!37140))

(assert (= (or b!840162 b!840154) bm!37139))

(assert (= (and b!840159 condMapEmpty!24866) mapIsEmpty!24866))

(assert (= (and b!840159 (not condMapEmpty!24866)) mapNonEmpty!24866))

(get-info :version)

(assert (= (and mapNonEmpty!24866 ((_ is ValueCellFull!7316) mapValue!24866)) b!840152))

(assert (= (and b!840159 ((_ is ValueCellFull!7316) mapDefault!24866)) b!840156))

(assert (= start!72442 b!840159))

(declare-fun m!783425 () Bool)

(assert (=> b!840155 m!783425))

(declare-fun m!783427 () Bool)

(assert (=> b!840161 m!783427))

(declare-fun m!783429 () Bool)

(assert (=> bm!37140 m!783429))

(declare-fun m!783431 () Bool)

(assert (=> bm!37140 m!783431))

(declare-fun m!783433 () Bool)

(assert (=> b!840153 m!783433))

(declare-fun m!783435 () Bool)

(assert (=> b!840150 m!783435))

(declare-fun m!783437 () Bool)

(assert (=> bm!37139 m!783437))

(declare-fun m!783439 () Bool)

(assert (=> b!840158 m!783439))

(declare-fun m!783441 () Bool)

(assert (=> b!840157 m!783441))

(declare-fun m!783443 () Bool)

(assert (=> start!72442 m!783443))

(declare-fun m!783445 () Bool)

(assert (=> start!72442 m!783445))

(declare-fun m!783447 () Bool)

(assert (=> mapNonEmpty!24866 m!783447))

(declare-fun m!783449 () Bool)

(assert (=> b!840162 m!783449))

(check-sat tp_is_empty!15511 (not b!840155) (not b!840157) (not mapNonEmpty!24866) (not start!72442) b_and!22705 (not b!840150) (not b!840158) (not b!840162) (not b!840153) (not bm!37140) (not bm!37139) (not b_next!13645))
(check-sat b_and!22705 (not b_next!13645))
