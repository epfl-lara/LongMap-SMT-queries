; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72388 () Bool)

(assert start!72388)

(declare-fun b_free!13591 () Bool)

(declare-fun b_next!13591 () Bool)

(assert (=> start!72388 (= b_free!13591 (not b_next!13591))))

(declare-fun tp!47872 () Bool)

(declare-fun b_and!22651 () Bool)

(assert (=> start!72388 (= tp!47872 b_and!22651)))

(declare-datatypes ((V!25657 0))(
  ( (V!25658 (val!7776 Int)) )
))
(declare-datatypes ((tuple2!10308 0))(
  ( (tuple2!10309 (_1!5165 (_ BitVec 64)) (_2!5165 V!25657)) )
))
(declare-datatypes ((List!16096 0))(
  ( (Nil!16093) (Cons!16092 (h!17223 tuple2!10308) (t!22458 List!16096)) )
))
(declare-datatypes ((ListLongMap!9067 0))(
  ( (ListLongMap!9068 (toList!4549 List!16096)) )
))
(declare-fun call!36981 () ListLongMap!9067)

(declare-fun bm!36977 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47175 0))(
  ( (array!47176 (arr!22619 (Array (_ BitVec 32) (_ BitVec 64))) (size!23061 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47175)

(declare-datatypes ((ValueCell!7289 0))(
  ( (ValueCellFull!7289 (v!10195 V!25657)) (EmptyCell!7289) )
))
(declare-datatypes ((array!47177 0))(
  ( (array!47178 (arr!22620 (Array (_ BitVec 32) ValueCell!7289)) (size!23062 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47177)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25657)

(declare-fun zeroValue!654 () V!25657)

(declare-fun getCurrentListMapNoExtraKeys!2569 (array!47175 array!47177 (_ BitVec 32) (_ BitVec 32) V!25657 V!25657 (_ BitVec 32) Int) ListLongMap!9067)

(assert (=> bm!36977 (= call!36981 (getCurrentListMapNoExtraKeys!2569 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839097 () Bool)

(declare-fun e!468283 () Bool)

(declare-fun tp_is_empty!15457 () Bool)

(assert (=> b!839097 (= e!468283 tp_is_empty!15457)))

(declare-fun b!839098 () Bool)

(declare-fun res!570572 () Bool)

(declare-fun e!468288 () Bool)

(assert (=> b!839098 (=> (not res!570572) (not e!468288))))

(declare-datatypes ((List!16097 0))(
  ( (Nil!16094) (Cons!16093 (h!17224 (_ BitVec 64)) (t!22459 List!16097)) )
))
(declare-fun arrayNoDuplicates!0 (array!47175 (_ BitVec 32) List!16097) Bool)

(assert (=> b!839098 (= res!570572 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16094))))

(declare-fun b!839099 () Bool)

(declare-fun e!468287 () Bool)

(declare-fun call!36980 () ListLongMap!9067)

(assert (=> b!839099 (= e!468287 (= call!36980 call!36981))))

(declare-fun res!570574 () Bool)

(assert (=> start!72388 (=> (not res!570574) (not e!468288))))

(assert (=> start!72388 (= res!570574 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23061 _keys!868))))))

(assert (=> start!72388 e!468288))

(assert (=> start!72388 tp_is_empty!15457))

(assert (=> start!72388 true))

(assert (=> start!72388 tp!47872))

(declare-fun array_inv!18086 (array!47175) Bool)

(assert (=> start!72388 (array_inv!18086 _keys!868)))

(declare-fun e!468284 () Bool)

(declare-fun array_inv!18087 (array!47177) Bool)

(assert (=> start!72388 (and (array_inv!18087 _values!688) e!468284)))

(declare-fun b!839100 () Bool)

(declare-fun e!468285 () Bool)

(declare-fun mapRes!24785 () Bool)

(assert (=> b!839100 (= e!468284 (and e!468285 mapRes!24785))))

(declare-fun condMapEmpty!24785 () Bool)

(declare-fun mapDefault!24785 () ValueCell!7289)

(assert (=> b!839100 (= condMapEmpty!24785 (= (arr!22620 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7289)) mapDefault!24785)))))

(declare-fun v!557 () V!25657)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun bm!36978 () Bool)

(assert (=> bm!36978 (= call!36980 (getCurrentListMapNoExtraKeys!2569 _keys!868 (array!47178 (store (arr!22620 _values!688) i!612 (ValueCellFull!7289 v!557)) (size!23062 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839101 () Bool)

(declare-fun res!570576 () Bool)

(assert (=> b!839101 (=> (not res!570576) (not e!468288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839101 (= res!570576 (validMask!0 mask!1196))))

(declare-fun b!839102 () Bool)

(assert (=> b!839102 (= e!468288 (not true))))

(assert (=> b!839102 e!468287))

(declare-fun c!91181 () Bool)

(assert (=> b!839102 (= c!91181 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28769 0))(
  ( (Unit!28770) )
))
(declare-fun lt!380516 () Unit!28769)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!259 (array!47175 array!47177 (_ BitVec 32) (_ BitVec 32) V!25657 V!25657 (_ BitVec 32) (_ BitVec 64) V!25657 (_ BitVec 32) Int) Unit!28769)

(assert (=> b!839102 (= lt!380516 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!259 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839103 () Bool)

(declare-fun res!570573 () Bool)

(assert (=> b!839103 (=> (not res!570573) (not e!468288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47175 (_ BitVec 32)) Bool)

(assert (=> b!839103 (= res!570573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839104 () Bool)

(declare-fun res!570575 () Bool)

(assert (=> b!839104 (=> (not res!570575) (not e!468288))))

(assert (=> b!839104 (= res!570575 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23061 _keys!868))))))

(declare-fun b!839105 () Bool)

(declare-fun res!570578 () Bool)

(assert (=> b!839105 (=> (not res!570578) (not e!468288))))

(assert (=> b!839105 (= res!570578 (and (= (size!23062 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23061 _keys!868) (size!23062 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24785 () Bool)

(declare-fun tp!47873 () Bool)

(assert (=> mapNonEmpty!24785 (= mapRes!24785 (and tp!47873 e!468283))))

(declare-fun mapValue!24785 () ValueCell!7289)

(declare-fun mapRest!24785 () (Array (_ BitVec 32) ValueCell!7289))

(declare-fun mapKey!24785 () (_ BitVec 32))

(assert (=> mapNonEmpty!24785 (= (arr!22620 _values!688) (store mapRest!24785 mapKey!24785 mapValue!24785))))

(declare-fun b!839106 () Bool)

(declare-fun res!570577 () Bool)

(assert (=> b!839106 (=> (not res!570577) (not e!468288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839106 (= res!570577 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!24785 () Bool)

(assert (=> mapIsEmpty!24785 mapRes!24785))

(declare-fun b!839107 () Bool)

(assert (=> b!839107 (= e!468285 tp_is_empty!15457)))

(declare-fun b!839108 () Bool)

(declare-fun +!2043 (ListLongMap!9067 tuple2!10308) ListLongMap!9067)

(assert (=> b!839108 (= e!468287 (= call!36980 (+!2043 call!36981 (tuple2!10309 k0!854 v!557))))))

(declare-fun b!839109 () Bool)

(declare-fun res!570579 () Bool)

(assert (=> b!839109 (=> (not res!570579) (not e!468288))))

(assert (=> b!839109 (= res!570579 (and (= (select (arr!22619 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23061 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72388 res!570574) b!839101))

(assert (= (and b!839101 res!570576) b!839105))

(assert (= (and b!839105 res!570578) b!839103))

(assert (= (and b!839103 res!570573) b!839098))

(assert (= (and b!839098 res!570572) b!839104))

(assert (= (and b!839104 res!570575) b!839106))

(assert (= (and b!839106 res!570577) b!839109))

(assert (= (and b!839109 res!570579) b!839102))

(assert (= (and b!839102 c!91181) b!839108))

(assert (= (and b!839102 (not c!91181)) b!839099))

(assert (= (or b!839108 b!839099) bm!36978))

(assert (= (or b!839108 b!839099) bm!36977))

(assert (= (and b!839100 condMapEmpty!24785) mapIsEmpty!24785))

(assert (= (and b!839100 (not condMapEmpty!24785)) mapNonEmpty!24785))

(get-info :version)

(assert (= (and mapNonEmpty!24785 ((_ is ValueCellFull!7289) mapValue!24785)) b!839097))

(assert (= (and b!839100 ((_ is ValueCellFull!7289) mapDefault!24785)) b!839107))

(assert (= start!72388 b!839100))

(declare-fun m!782723 () Bool)

(assert (=> start!72388 m!782723))

(declare-fun m!782725 () Bool)

(assert (=> start!72388 m!782725))

(declare-fun m!782727 () Bool)

(assert (=> b!839102 m!782727))

(declare-fun m!782729 () Bool)

(assert (=> bm!36978 m!782729))

(declare-fun m!782731 () Bool)

(assert (=> bm!36978 m!782731))

(declare-fun m!782733 () Bool)

(assert (=> b!839108 m!782733))

(declare-fun m!782735 () Bool)

(assert (=> bm!36977 m!782735))

(declare-fun m!782737 () Bool)

(assert (=> b!839098 m!782737))

(declare-fun m!782739 () Bool)

(assert (=> b!839109 m!782739))

(declare-fun m!782741 () Bool)

(assert (=> b!839106 m!782741))

(declare-fun m!782743 () Bool)

(assert (=> mapNonEmpty!24785 m!782743))

(declare-fun m!782745 () Bool)

(assert (=> b!839103 m!782745))

(declare-fun m!782747 () Bool)

(assert (=> b!839101 m!782747))

(check-sat (not bm!36977) (not b_next!13591) (not b!839108) b_and!22651 (not b!839103) (not bm!36978) (not b!839098) (not mapNonEmpty!24785) tp_is_empty!15457 (not b!839106) (not b!839101) (not start!72388) (not b!839102))
(check-sat b_and!22651 (not b_next!13591))
