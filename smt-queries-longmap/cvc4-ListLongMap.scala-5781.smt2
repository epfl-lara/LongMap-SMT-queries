; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74592 () Bool)

(assert start!74592)

(declare-fun b_free!15281 () Bool)

(declare-fun b_next!15281 () Bool)

(assert (=> start!74592 (= b_free!15281 (not b_next!15281))))

(declare-fun tp!53524 () Bool)

(declare-fun b_and!25157 () Bool)

(assert (=> start!74592 (= tp!53524 b_and!25157)))

(declare-fun b!879015 () Bool)

(declare-fun e!489187 () Bool)

(declare-fun tp_is_empty!17525 () Bool)

(assert (=> b!879015 (= e!489187 tp_is_empty!17525)))

(declare-fun b!879016 () Bool)

(declare-fun e!489189 () Bool)

(assert (=> b!879016 (= e!489189 tp_is_empty!17525)))

(declare-fun b!879017 () Bool)

(declare-fun res!597216 () Bool)

(declare-fun e!489184 () Bool)

(assert (=> b!879017 (=> (not res!597216) (not e!489184))))

(declare-datatypes ((array!51176 0))(
  ( (array!51177 (arr!24614 (Array (_ BitVec 32) (_ BitVec 64))) (size!25054 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51176)

(declare-datatypes ((List!17467 0))(
  ( (Nil!17464) (Cons!17463 (h!18594 (_ BitVec 64)) (t!24556 List!17467)) )
))
(declare-fun arrayNoDuplicates!0 (array!51176 (_ BitVec 32) List!17467) Bool)

(assert (=> b!879017 (= res!597216 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17464))))

(declare-fun res!597212 () Bool)

(assert (=> start!74592 (=> (not res!597212) (not e!489184))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74592 (= res!597212 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25054 _keys!868))))))

(assert (=> start!74592 e!489184))

(assert (=> start!74592 tp_is_empty!17525))

(assert (=> start!74592 true))

(assert (=> start!74592 tp!53524))

(declare-fun array_inv!19398 (array!51176) Bool)

(assert (=> start!74592 (array_inv!19398 _keys!868)))

(declare-datatypes ((V!28413 0))(
  ( (V!28414 (val!8810 Int)) )
))
(declare-datatypes ((ValueCell!8323 0))(
  ( (ValueCellFull!8323 (v!11250 V!28413)) (EmptyCell!8323) )
))
(declare-datatypes ((array!51178 0))(
  ( (array!51179 (arr!24615 (Array (_ BitVec 32) ValueCell!8323)) (size!25055 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51178)

(declare-fun e!489185 () Bool)

(declare-fun array_inv!19399 (array!51178) Bool)

(assert (=> start!74592 (and (array_inv!19399 _values!688) e!489185)))

(declare-fun b!879018 () Bool)

(declare-fun res!597217 () Bool)

(assert (=> b!879018 (=> (not res!597217) (not e!489184))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51176 (_ BitVec 32)) Bool)

(assert (=> b!879018 (= res!597217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879019 () Bool)

(declare-fun e!489190 () Bool)

(declare-fun e!489188 () Bool)

(assert (=> b!879019 (= e!489190 (not e!489188))))

(declare-fun res!597219 () Bool)

(assert (=> b!879019 (=> res!597219 e!489188)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879019 (= res!597219 (not (validKeyInArray!0 (select (arr!24614 _keys!868) from!1053))))))

(declare-fun v!557 () V!28413)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397404 () array!51178)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28413)

(declare-fun zeroValue!654 () V!28413)

(declare-datatypes ((tuple2!11650 0))(
  ( (tuple2!11651 (_1!5836 (_ BitVec 64)) (_2!5836 V!28413)) )
))
(declare-datatypes ((List!17468 0))(
  ( (Nil!17465) (Cons!17464 (h!18595 tuple2!11650) (t!24557 List!17468)) )
))
(declare-datatypes ((ListLongMap!10419 0))(
  ( (ListLongMap!10420 (toList!5225 List!17468)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3192 (array!51176 array!51178 (_ BitVec 32) (_ BitVec 32) V!28413 V!28413 (_ BitVec 32) Int) ListLongMap!10419)

(declare-fun +!2498 (ListLongMap!10419 tuple2!11650) ListLongMap!10419)

(assert (=> b!879019 (= (getCurrentListMapNoExtraKeys!3192 _keys!868 lt!397404 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2498 (getCurrentListMapNoExtraKeys!3192 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11651 k!854 v!557)))))

(declare-datatypes ((Unit!30022 0))(
  ( (Unit!30023) )
))
(declare-fun lt!397406 () Unit!30022)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!693 (array!51176 array!51178 (_ BitVec 32) (_ BitVec 32) V!28413 V!28413 (_ BitVec 32) (_ BitVec 64) V!28413 (_ BitVec 32) Int) Unit!30022)

(assert (=> b!879019 (= lt!397406 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!693 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879020 () Bool)

(assert (=> b!879020 (= e!489184 e!489190)))

(declare-fun res!597213 () Bool)

(assert (=> b!879020 (=> (not res!597213) (not e!489190))))

(assert (=> b!879020 (= res!597213 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397405 () ListLongMap!10419)

(assert (=> b!879020 (= lt!397405 (getCurrentListMapNoExtraKeys!3192 _keys!868 lt!397404 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879020 (= lt!397404 (array!51179 (store (arr!24615 _values!688) i!612 (ValueCellFull!8323 v!557)) (size!25055 _values!688)))))

(declare-fun lt!397407 () ListLongMap!10419)

(assert (=> b!879020 (= lt!397407 (getCurrentListMapNoExtraKeys!3192 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27903 () Bool)

(declare-fun mapRes!27903 () Bool)

(declare-fun tp!53525 () Bool)

(assert (=> mapNonEmpty!27903 (= mapRes!27903 (and tp!53525 e!489187))))

(declare-fun mapKey!27903 () (_ BitVec 32))

(declare-fun mapValue!27903 () ValueCell!8323)

(declare-fun mapRest!27903 () (Array (_ BitVec 32) ValueCell!8323))

(assert (=> mapNonEmpty!27903 (= (arr!24615 _values!688) (store mapRest!27903 mapKey!27903 mapValue!27903))))

(declare-fun b!879021 () Bool)

(assert (=> b!879021 (= e!489185 (and e!489189 mapRes!27903))))

(declare-fun condMapEmpty!27903 () Bool)

(declare-fun mapDefault!27903 () ValueCell!8323)

