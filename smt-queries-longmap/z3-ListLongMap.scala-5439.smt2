; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72400 () Bool)

(assert start!72400)

(declare-fun b_free!13603 () Bool)

(declare-fun b_next!13603 () Bool)

(assert (=> start!72400 (= b_free!13603 (not b_next!13603))))

(declare-fun tp!47909 () Bool)

(declare-fun b_and!22663 () Bool)

(assert (=> start!72400 (= tp!47909 b_and!22663)))

(declare-fun b!839331 () Bool)

(declare-fun e!468394 () Bool)

(assert (=> b!839331 (= e!468394 (not true))))

(declare-fun e!468391 () Bool)

(assert (=> b!839331 e!468391))

(declare-fun c!91199 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839331 (= c!91199 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25673 0))(
  ( (V!25674 (val!7782 Int)) )
))
(declare-fun v!557 () V!25673)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47199 0))(
  ( (array!47200 (arr!22631 (Array (_ BitVec 32) (_ BitVec 64))) (size!23073 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47199)

(declare-fun minValue!654 () V!25673)

(declare-fun zeroValue!654 () V!25673)

(declare-datatypes ((Unit!28779 0))(
  ( (Unit!28780) )
))
(declare-fun lt!380534 () Unit!28779)

(declare-datatypes ((ValueCell!7295 0))(
  ( (ValueCellFull!7295 (v!10201 V!25673)) (EmptyCell!7295) )
))
(declare-datatypes ((array!47201 0))(
  ( (array!47202 (arr!22632 (Array (_ BitVec 32) ValueCell!7295)) (size!23074 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47201)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!264 (array!47199 array!47201 (_ BitVec 32) (_ BitVec 32) V!25673 V!25673 (_ BitVec 32) (_ BitVec 64) V!25673 (_ BitVec 32) Int) Unit!28779)

(assert (=> b!839331 (= lt!380534 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!264 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839333 () Bool)

(declare-fun e!468395 () Bool)

(declare-fun tp_is_empty!15469 () Bool)

(assert (=> b!839333 (= e!468395 tp_is_empty!15469)))

(declare-fun b!839334 () Bool)

(declare-fun res!570722 () Bool)

(assert (=> b!839334 (=> (not res!570722) (not e!468394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839334 (= res!570722 (validMask!0 mask!1196))))

(declare-fun b!839335 () Bool)

(declare-fun res!570723 () Bool)

(assert (=> b!839335 (=> (not res!570723) (not e!468394))))

(assert (=> b!839335 (= res!570723 (and (= (select (arr!22631 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23073 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839336 () Bool)

(declare-fun res!570720 () Bool)

(assert (=> b!839336 (=> (not res!570720) (not e!468394))))

(assert (=> b!839336 (= res!570720 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23073 _keys!868))))))

(declare-datatypes ((tuple2!10320 0))(
  ( (tuple2!10321 (_1!5171 (_ BitVec 64)) (_2!5171 V!25673)) )
))
(declare-datatypes ((List!16106 0))(
  ( (Nil!16103) (Cons!16102 (h!17233 tuple2!10320) (t!22468 List!16106)) )
))
(declare-datatypes ((ListLongMap!9079 0))(
  ( (ListLongMap!9080 (toList!4555 List!16106)) )
))
(declare-fun call!37017 () ListLongMap!9079)

(declare-fun b!839337 () Bool)

(declare-fun call!37016 () ListLongMap!9079)

(declare-fun +!2049 (ListLongMap!9079 tuple2!10320) ListLongMap!9079)

(assert (=> b!839337 (= e!468391 (= call!37017 (+!2049 call!37016 (tuple2!10321 k0!854 v!557))))))

(declare-fun mapIsEmpty!24803 () Bool)

(declare-fun mapRes!24803 () Bool)

(assert (=> mapIsEmpty!24803 mapRes!24803))

(declare-fun bm!37013 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2575 (array!47199 array!47201 (_ BitVec 32) (_ BitVec 32) V!25673 V!25673 (_ BitVec 32) Int) ListLongMap!9079)

(assert (=> bm!37013 (= call!37016 (getCurrentListMapNoExtraKeys!2575 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839338 () Bool)

(declare-fun res!570721 () Bool)

(assert (=> b!839338 (=> (not res!570721) (not e!468394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839338 (= res!570721 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!24803 () Bool)

(declare-fun tp!47908 () Bool)

(declare-fun e!468396 () Bool)

(assert (=> mapNonEmpty!24803 (= mapRes!24803 (and tp!47908 e!468396))))

(declare-fun mapRest!24803 () (Array (_ BitVec 32) ValueCell!7295))

(declare-fun mapValue!24803 () ValueCell!7295)

(declare-fun mapKey!24803 () (_ BitVec 32))

(assert (=> mapNonEmpty!24803 (= (arr!22632 _values!688) (store mapRest!24803 mapKey!24803 mapValue!24803))))

(declare-fun res!570718 () Bool)

(assert (=> start!72400 (=> (not res!570718) (not e!468394))))

(assert (=> start!72400 (= res!570718 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23073 _keys!868))))))

(assert (=> start!72400 e!468394))

(assert (=> start!72400 tp_is_empty!15469))

(assert (=> start!72400 true))

(assert (=> start!72400 tp!47909))

(declare-fun array_inv!18096 (array!47199) Bool)

(assert (=> start!72400 (array_inv!18096 _keys!868)))

(declare-fun e!468393 () Bool)

(declare-fun array_inv!18097 (array!47201) Bool)

(assert (=> start!72400 (and (array_inv!18097 _values!688) e!468393)))

(declare-fun b!839332 () Bool)

(assert (=> b!839332 (= e!468391 (= call!37017 call!37016))))

(declare-fun bm!37014 () Bool)

(assert (=> bm!37014 (= call!37017 (getCurrentListMapNoExtraKeys!2575 _keys!868 (array!47202 (store (arr!22632 _values!688) i!612 (ValueCellFull!7295 v!557)) (size!23074 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839339 () Bool)

(declare-fun res!570717 () Bool)

(assert (=> b!839339 (=> (not res!570717) (not e!468394))))

(declare-datatypes ((List!16107 0))(
  ( (Nil!16104) (Cons!16103 (h!17234 (_ BitVec 64)) (t!22469 List!16107)) )
))
(declare-fun arrayNoDuplicates!0 (array!47199 (_ BitVec 32) List!16107) Bool)

(assert (=> b!839339 (= res!570717 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16104))))

(declare-fun b!839340 () Bool)

(declare-fun res!570716 () Bool)

(assert (=> b!839340 (=> (not res!570716) (not e!468394))))

(assert (=> b!839340 (= res!570716 (and (= (size!23074 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23073 _keys!868) (size!23074 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839341 () Bool)

(declare-fun res!570719 () Bool)

(assert (=> b!839341 (=> (not res!570719) (not e!468394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47199 (_ BitVec 32)) Bool)

(assert (=> b!839341 (= res!570719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839342 () Bool)

(assert (=> b!839342 (= e!468393 (and e!468395 mapRes!24803))))

(declare-fun condMapEmpty!24803 () Bool)

(declare-fun mapDefault!24803 () ValueCell!7295)

(assert (=> b!839342 (= condMapEmpty!24803 (= (arr!22632 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7295)) mapDefault!24803)))))

(declare-fun b!839343 () Bool)

(assert (=> b!839343 (= e!468396 tp_is_empty!15469)))

(assert (= (and start!72400 res!570718) b!839334))

(assert (= (and b!839334 res!570722) b!839340))

(assert (= (and b!839340 res!570716) b!839341))

(assert (= (and b!839341 res!570719) b!839339))

(assert (= (and b!839339 res!570717) b!839336))

(assert (= (and b!839336 res!570720) b!839338))

(assert (= (and b!839338 res!570721) b!839335))

(assert (= (and b!839335 res!570723) b!839331))

(assert (= (and b!839331 c!91199) b!839337))

(assert (= (and b!839331 (not c!91199)) b!839332))

(assert (= (or b!839337 b!839332) bm!37014))

(assert (= (or b!839337 b!839332) bm!37013))

(assert (= (and b!839342 condMapEmpty!24803) mapIsEmpty!24803))

(assert (= (and b!839342 (not condMapEmpty!24803)) mapNonEmpty!24803))

(get-info :version)

(assert (= (and mapNonEmpty!24803 ((_ is ValueCellFull!7295) mapValue!24803)) b!839343))

(assert (= (and b!839342 ((_ is ValueCellFull!7295) mapDefault!24803)) b!839333))

(assert (= start!72400 b!839342))

(declare-fun m!782879 () Bool)

(assert (=> b!839341 m!782879))

(declare-fun m!782881 () Bool)

(assert (=> b!839335 m!782881))

(declare-fun m!782883 () Bool)

(assert (=> b!839339 m!782883))

(declare-fun m!782885 () Bool)

(assert (=> bm!37014 m!782885))

(declare-fun m!782887 () Bool)

(assert (=> bm!37014 m!782887))

(declare-fun m!782889 () Bool)

(assert (=> b!839337 m!782889))

(declare-fun m!782891 () Bool)

(assert (=> b!839334 m!782891))

(declare-fun m!782893 () Bool)

(assert (=> bm!37013 m!782893))

(declare-fun m!782895 () Bool)

(assert (=> start!72400 m!782895))

(declare-fun m!782897 () Bool)

(assert (=> start!72400 m!782897))

(declare-fun m!782899 () Bool)

(assert (=> b!839331 m!782899))

(declare-fun m!782901 () Bool)

(assert (=> b!839338 m!782901))

(declare-fun m!782903 () Bool)

(assert (=> mapNonEmpty!24803 m!782903))

(check-sat (not b!839339) (not b_next!13603) (not b!839337) (not mapNonEmpty!24803) (not b!839331) (not bm!37013) tp_is_empty!15469 (not start!72400) b_and!22663 (not b!839341) (not b!839334) (not b!839338) (not bm!37014))
(check-sat b_and!22663 (not b_next!13603))
