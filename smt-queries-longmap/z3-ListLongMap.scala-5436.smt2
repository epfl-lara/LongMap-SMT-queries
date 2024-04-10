; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72402 () Bool)

(assert start!72402)

(declare-fun b_free!13587 () Bool)

(declare-fun b_next!13587 () Bool)

(assert (=> start!72402 (= b_free!13587 (not b_next!13587))))

(declare-fun tp!47860 () Bool)

(declare-fun b_and!22673 () Bool)

(assert (=> start!72402 (= tp!47860 b_and!22673)))

(declare-datatypes ((V!25651 0))(
  ( (V!25652 (val!7774 Int)) )
))
(declare-datatypes ((tuple2!10288 0))(
  ( (tuple2!10289 (_1!5155 (_ BitVec 64)) (_2!5155 V!25651)) )
))
(declare-datatypes ((List!16088 0))(
  ( (Nil!16085) (Cons!16084 (h!17215 tuple2!10288) (t!22459 List!16088)) )
))
(declare-datatypes ((ListLongMap!9057 0))(
  ( (ListLongMap!9058 (toList!4544 List!16088)) )
))
(declare-fun call!36995 () ListLongMap!9057)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47188 0))(
  ( (array!47189 (arr!22625 (Array (_ BitVec 32) (_ BitVec 64))) (size!23065 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47188)

(declare-fun bm!36991 () Bool)

(declare-datatypes ((ValueCell!7287 0))(
  ( (ValueCellFull!7287 (v!10199 V!25651)) (EmptyCell!7287) )
))
(declare-datatypes ((array!47190 0))(
  ( (array!47191 (arr!22626 (Array (_ BitVec 32) ValueCell!7287)) (size!23066 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47190)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25651)

(declare-fun zeroValue!654 () V!25651)

(declare-fun getCurrentListMapNoExtraKeys!2535 (array!47188 array!47190 (_ BitVec 32) (_ BitVec 32) V!25651 V!25651 (_ BitVec 32) Int) ListLongMap!9057)

(assert (=> bm!36991 (= call!36995 (getCurrentListMapNoExtraKeys!2535 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839258 () Bool)

(declare-fun res!570640 () Bool)

(declare-fun e!468395 () Bool)

(assert (=> b!839258 (=> (not res!570640) (not e!468395))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839258 (= res!570640 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23065 _keys!868))))))

(declare-fun res!570641 () Bool)

(assert (=> start!72402 (=> (not res!570641) (not e!468395))))

(assert (=> start!72402 (= res!570641 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23065 _keys!868))))))

(assert (=> start!72402 e!468395))

(declare-fun tp_is_empty!15453 () Bool)

(assert (=> start!72402 tp_is_empty!15453))

(assert (=> start!72402 true))

(assert (=> start!72402 tp!47860))

(declare-fun array_inv!18024 (array!47188) Bool)

(assert (=> start!72402 (array_inv!18024 _keys!868)))

(declare-fun e!468399 () Bool)

(declare-fun array_inv!18025 (array!47190) Bool)

(assert (=> start!72402 (and (array_inv!18025 _values!688) e!468399)))

(declare-fun v!557 () V!25651)

(declare-fun call!36994 () ListLongMap!9057)

(declare-fun bm!36992 () Bool)

(assert (=> bm!36992 (= call!36994 (getCurrentListMapNoExtraKeys!2535 _keys!868 (array!47191 (store (arr!22626 _values!688) i!612 (ValueCellFull!7287 v!557)) (size!23066 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839259 () Bool)

(declare-fun e!468400 () Bool)

(declare-fun mapRes!24779 () Bool)

(assert (=> b!839259 (= e!468399 (and e!468400 mapRes!24779))))

(declare-fun condMapEmpty!24779 () Bool)

(declare-fun mapDefault!24779 () ValueCell!7287)

(assert (=> b!839259 (= condMapEmpty!24779 (= (arr!22626 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7287)) mapDefault!24779)))))

(declare-fun b!839260 () Bool)

(declare-fun res!570639 () Bool)

(assert (=> b!839260 (=> (not res!570639) (not e!468395))))

(assert (=> b!839260 (= res!570639 (and (= (size!23066 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23065 _keys!868) (size!23066 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839261 () Bool)

(declare-fun res!570635 () Bool)

(assert (=> b!839261 (=> (not res!570635) (not e!468395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47188 (_ BitVec 32)) Bool)

(assert (=> b!839261 (= res!570635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839262 () Bool)

(declare-fun res!570637 () Bool)

(assert (=> b!839262 (=> (not res!570637) (not e!468395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839262 (= res!570637 (validMask!0 mask!1196))))

(declare-fun b!839263 () Bool)

(declare-fun e!468398 () Bool)

(assert (=> b!839263 (= e!468398 tp_is_empty!15453)))

(declare-fun b!839264 () Bool)

(declare-fun res!570634 () Bool)

(assert (=> b!839264 (=> (not res!570634) (not e!468395))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!839264 (= res!570634 (and (= (select (arr!22625 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23065 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun e!468396 () Bool)

(declare-fun b!839265 () Bool)

(declare-fun +!2017 (ListLongMap!9057 tuple2!10288) ListLongMap!9057)

(assert (=> b!839265 (= e!468396 (= call!36994 (+!2017 call!36995 (tuple2!10289 k0!854 v!557))))))

(declare-fun b!839266 () Bool)

(declare-fun res!570638 () Bool)

(assert (=> b!839266 (=> (not res!570638) (not e!468395))))

(declare-datatypes ((List!16089 0))(
  ( (Nil!16086) (Cons!16085 (h!17216 (_ BitVec 64)) (t!22460 List!16089)) )
))
(declare-fun arrayNoDuplicates!0 (array!47188 (_ BitVec 32) List!16089) Bool)

(assert (=> b!839266 (= res!570638 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16086))))

(declare-fun b!839267 () Bool)

(declare-fun res!570636 () Bool)

(assert (=> b!839267 (=> (not res!570636) (not e!468395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839267 (= res!570636 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!24779 () Bool)

(declare-fun tp!47859 () Bool)

(assert (=> mapNonEmpty!24779 (= mapRes!24779 (and tp!47859 e!468398))))

(declare-fun mapValue!24779 () ValueCell!7287)

(declare-fun mapRest!24779 () (Array (_ BitVec 32) ValueCell!7287))

(declare-fun mapKey!24779 () (_ BitVec 32))

(assert (=> mapNonEmpty!24779 (= (arr!22626 _values!688) (store mapRest!24779 mapKey!24779 mapValue!24779))))

(declare-fun mapIsEmpty!24779 () Bool)

(assert (=> mapIsEmpty!24779 mapRes!24779))

(declare-fun b!839268 () Bool)

(assert (=> b!839268 (= e!468396 (= call!36994 call!36995))))

(declare-fun b!839269 () Bool)

(assert (=> b!839269 (= e!468400 tp_is_empty!15453)))

(declare-fun b!839270 () Bool)

(assert (=> b!839270 (= e!468395 (not true))))

(assert (=> b!839270 e!468396))

(declare-fun c!91240 () Bool)

(assert (=> b!839270 (= c!91240 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28823 0))(
  ( (Unit!28824) )
))
(declare-fun lt!380746 () Unit!28823)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!257 (array!47188 array!47190 (_ BitVec 32) (_ BitVec 32) V!25651 V!25651 (_ BitVec 32) (_ BitVec 64) V!25651 (_ BitVec 32) Int) Unit!28823)

(assert (=> b!839270 (= lt!380746 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72402 res!570641) b!839262))

(assert (= (and b!839262 res!570637) b!839260))

(assert (= (and b!839260 res!570639) b!839261))

(assert (= (and b!839261 res!570635) b!839266))

(assert (= (and b!839266 res!570638) b!839258))

(assert (= (and b!839258 res!570640) b!839267))

(assert (= (and b!839267 res!570636) b!839264))

(assert (= (and b!839264 res!570634) b!839270))

(assert (= (and b!839270 c!91240) b!839265))

(assert (= (and b!839270 (not c!91240)) b!839268))

(assert (= (or b!839265 b!839268) bm!36992))

(assert (= (or b!839265 b!839268) bm!36991))

(assert (= (and b!839259 condMapEmpty!24779) mapIsEmpty!24779))

(assert (= (and b!839259 (not condMapEmpty!24779)) mapNonEmpty!24779))

(get-info :version)

(assert (= (and mapNonEmpty!24779 ((_ is ValueCellFull!7287) mapValue!24779)) b!839263))

(assert (= (and b!839259 ((_ is ValueCellFull!7287) mapDefault!24779)) b!839269))

(assert (= start!72402 b!839259))

(declare-fun m!783425 () Bool)

(assert (=> start!72402 m!783425))

(declare-fun m!783427 () Bool)

(assert (=> start!72402 m!783427))

(declare-fun m!783429 () Bool)

(assert (=> b!839267 m!783429))

(declare-fun m!783431 () Bool)

(assert (=> b!839265 m!783431))

(declare-fun m!783433 () Bool)

(assert (=> b!839262 m!783433))

(declare-fun m!783435 () Bool)

(assert (=> b!839270 m!783435))

(declare-fun m!783437 () Bool)

(assert (=> bm!36992 m!783437))

(declare-fun m!783439 () Bool)

(assert (=> bm!36992 m!783439))

(declare-fun m!783441 () Bool)

(assert (=> b!839264 m!783441))

(declare-fun m!783443 () Bool)

(assert (=> b!839261 m!783443))

(declare-fun m!783445 () Bool)

(assert (=> bm!36991 m!783445))

(declare-fun m!783447 () Bool)

(assert (=> b!839266 m!783447))

(declare-fun m!783449 () Bool)

(assert (=> mapNonEmpty!24779 m!783449))

(check-sat tp_is_empty!15453 (not b!839270) (not start!72402) (not b!839261) (not b!839262) (not b!839266) (not b!839265) b_and!22673 (not mapNonEmpty!24779) (not b!839267) (not bm!36991) (not b_next!13587) (not bm!36992))
(check-sat b_and!22673 (not b_next!13587))
