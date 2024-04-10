; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74932 () Bool)

(assert start!74932)

(declare-fun b_free!15451 () Bool)

(declare-fun b_next!15451 () Bool)

(assert (=> start!74932 (= b_free!15451 (not b_next!15451))))

(declare-fun tp!54055 () Bool)

(declare-fun b_and!25601 () Bool)

(assert (=> start!74932 (= tp!54055 b_and!25601)))

(declare-fun mapIsEmpty!28179 () Bool)

(declare-fun mapRes!28179 () Bool)

(assert (=> mapIsEmpty!28179 mapRes!28179))

(declare-fun b!883790 () Bool)

(declare-datatypes ((Unit!30164 0))(
  ( (Unit!30165) )
))
(declare-fun e!491849 () Unit!30164)

(declare-fun Unit!30166 () Unit!30164)

(assert (=> b!883790 (= e!491849 Unit!30166)))

(declare-fun b!883791 () Bool)

(declare-fun e!491847 () Bool)

(declare-fun tp_is_empty!17695 () Bool)

(assert (=> b!883791 (= e!491847 tp_is_empty!17695)))

(declare-fun b!883792 () Bool)

(declare-fun e!491848 () Bool)

(assert (=> b!883792 (= e!491848 tp_is_empty!17695)))

(declare-fun b!883793 () Bool)

(declare-fun res!600416 () Bool)

(declare-fun e!491844 () Bool)

(assert (=> b!883793 (=> (not res!600416) (not e!491844))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51516 0))(
  ( (array!51517 (arr!24777 (Array (_ BitVec 32) (_ BitVec 64))) (size!25217 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51516)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!883793 (= res!600416 (and (= (select (arr!24777 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!883794 () Bool)

(declare-fun res!600418 () Bool)

(assert (=> b!883794 (=> (not res!600418) (not e!491844))))

(assert (=> b!883794 (= res!600418 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25217 _keys!868))))))

(declare-fun b!883795 () Bool)

(declare-fun res!600420 () Bool)

(assert (=> b!883795 (=> (not res!600420) (not e!491844))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28641 0))(
  ( (V!28642 (val!8895 Int)) )
))
(declare-datatypes ((ValueCell!8408 0))(
  ( (ValueCellFull!8408 (v!11364 V!28641)) (EmptyCell!8408) )
))
(declare-datatypes ((array!51518 0))(
  ( (array!51519 (arr!24778 (Array (_ BitVec 32) ValueCell!8408)) (size!25218 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51518)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!883795 (= res!600420 (and (= (size!25218 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25217 _keys!868) (size!25218 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883796 () Bool)

(declare-fun res!600422 () Bool)

(assert (=> b!883796 (=> (not res!600422) (not e!491844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883796 (= res!600422 (validKeyInArray!0 k!854))))

(declare-fun b!883797 () Bool)

(declare-fun e!491843 () Bool)

(declare-fun e!491845 () Bool)

(assert (=> b!883797 (= e!491843 (not e!491845))))

(declare-fun res!600417 () Bool)

(assert (=> b!883797 (=> res!600417 e!491845)))

(assert (=> b!883797 (= res!600417 (not (validKeyInArray!0 (select (arr!24777 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11790 0))(
  ( (tuple2!11791 (_1!5906 (_ BitVec 64)) (_2!5906 V!28641)) )
))
(declare-datatypes ((List!17598 0))(
  ( (Nil!17595) (Cons!17594 (h!18725 tuple2!11790) (t!24851 List!17598)) )
))
(declare-datatypes ((ListLongMap!10559 0))(
  ( (ListLongMap!10560 (toList!5295 List!17598)) )
))
(declare-fun lt!400098 () ListLongMap!10559)

(declare-fun lt!400097 () ListLongMap!10559)

(assert (=> b!883797 (= lt!400098 lt!400097)))

(declare-fun lt!400091 () ListLongMap!10559)

(declare-fun v!557 () V!28641)

(declare-fun +!2564 (ListLongMap!10559 tuple2!11790) ListLongMap!10559)

(assert (=> b!883797 (= lt!400097 (+!2564 lt!400091 (tuple2!11791 k!854 v!557)))))

(declare-fun lt!400099 () array!51518)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28641)

(declare-fun zeroValue!654 () V!28641)

(declare-fun getCurrentListMapNoExtraKeys!3254 (array!51516 array!51518 (_ BitVec 32) (_ BitVec 32) V!28641 V!28641 (_ BitVec 32) Int) ListLongMap!10559)

(assert (=> b!883797 (= lt!400098 (getCurrentListMapNoExtraKeys!3254 _keys!868 lt!400099 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883797 (= lt!400091 (getCurrentListMapNoExtraKeys!3254 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400094 () Unit!30164)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!748 (array!51516 array!51518 (_ BitVec 32) (_ BitVec 32) V!28641 V!28641 (_ BitVec 32) (_ BitVec 64) V!28641 (_ BitVec 32) Int) Unit!30164)

(assert (=> b!883797 (= lt!400094 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!748 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!28179 () Bool)

(declare-fun tp!54056 () Bool)

(assert (=> mapNonEmpty!28179 (= mapRes!28179 (and tp!54056 e!491847))))

(declare-fun mapKey!28179 () (_ BitVec 32))

(declare-fun mapRest!28179 () (Array (_ BitVec 32) ValueCell!8408))

(declare-fun mapValue!28179 () ValueCell!8408)

(assert (=> mapNonEmpty!28179 (= (arr!24778 _values!688) (store mapRest!28179 mapKey!28179 mapValue!28179))))

(declare-fun b!883799 () Bool)

(declare-fun res!600414 () Bool)

(assert (=> b!883799 (=> (not res!600414) (not e!491844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51516 (_ BitVec 32)) Bool)

(assert (=> b!883799 (= res!600414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883800 () Bool)

(declare-fun e!491850 () Bool)

(assert (=> b!883800 (= e!491850 (and e!491848 mapRes!28179))))

(declare-fun condMapEmpty!28179 () Bool)

(declare-fun mapDefault!28179 () ValueCell!8408)

