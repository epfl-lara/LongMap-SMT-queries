; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73534 () Bool)

(assert start!73534)

(declare-fun b_free!14281 () Bool)

(declare-fun b_next!14281 () Bool)

(assert (=> start!73534 (= b_free!14281 (not b_next!14281))))

(declare-fun tp!50348 () Bool)

(declare-fun b_and!23647 () Bool)

(assert (=> start!73534 (= tp!50348 b_and!23647)))

(declare-fun b!857085 () Bool)

(declare-fun res!581853 () Bool)

(declare-fun e!477853 () Bool)

(assert (=> b!857085 (=> (not res!581853) (not e!477853))))

(declare-datatypes ((array!49075 0))(
  ( (array!49076 (arr!23564 (Array (_ BitVec 32) (_ BitVec 64))) (size!24005 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49075)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49075 (_ BitVec 32)) Bool)

(assert (=> b!857085 (= res!581853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26225 () Bool)

(declare-fun mapRes!26225 () Bool)

(assert (=> mapIsEmpty!26225 mapRes!26225))

(declare-fun b!857086 () Bool)

(declare-fun e!477855 () Bool)

(assert (=> b!857086 (= e!477853 e!477855)))

(declare-fun res!581848 () Bool)

(assert (=> b!857086 (=> (not res!581848) (not e!477855))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857086 (= res!581848 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!26937 0))(
  ( (V!26938 (val!8256 Int)) )
))
(declare-datatypes ((ValueCell!7769 0))(
  ( (ValueCellFull!7769 (v!10681 V!26937)) (EmptyCell!7769) )
))
(declare-datatypes ((array!49077 0))(
  ( (array!49078 (arr!23565 (Array (_ BitVec 32) ValueCell!7769)) (size!24006 (_ BitVec 32))) )
))
(declare-fun lt!386231 () array!49077)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10806 0))(
  ( (tuple2!10807 (_1!5414 (_ BitVec 64)) (_2!5414 V!26937)) )
))
(declare-datatypes ((List!16651 0))(
  ( (Nil!16648) (Cons!16647 (h!17784 tuple2!10806) (t!23284 List!16651)) )
))
(declare-datatypes ((ListLongMap!9577 0))(
  ( (ListLongMap!9578 (toList!4804 List!16651)) )
))
(declare-fun lt!386234 () ListLongMap!9577)

(declare-fun minValue!654 () V!26937)

(declare-fun zeroValue!654 () V!26937)

(declare-fun getCurrentListMapNoExtraKeys!2860 (array!49075 array!49077 (_ BitVec 32) (_ BitVec 32) V!26937 V!26937 (_ BitVec 32) Int) ListLongMap!9577)

(assert (=> b!857086 (= lt!386234 (getCurrentListMapNoExtraKeys!2860 _keys!868 lt!386231 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26937)

(declare-fun _values!688 () array!49077)

(assert (=> b!857086 (= lt!386231 (array!49078 (store (arr!23565 _values!688) i!612 (ValueCellFull!7769 v!557)) (size!24006 _values!688)))))

(declare-fun lt!386233 () ListLongMap!9577)

(assert (=> b!857086 (= lt!386233 (getCurrentListMapNoExtraKeys!2860 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!581854 () Bool)

(assert (=> start!73534 (=> (not res!581854) (not e!477853))))

(assert (=> start!73534 (= res!581854 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24005 _keys!868))))))

(assert (=> start!73534 e!477853))

(declare-fun tp_is_empty!16417 () Bool)

(assert (=> start!73534 tp_is_empty!16417))

(assert (=> start!73534 true))

(assert (=> start!73534 tp!50348))

(declare-fun array_inv!18720 (array!49075) Bool)

(assert (=> start!73534 (array_inv!18720 _keys!868)))

(declare-fun e!477854 () Bool)

(declare-fun array_inv!18721 (array!49077) Bool)

(assert (=> start!73534 (and (array_inv!18721 _values!688) e!477854)))

(declare-fun mapNonEmpty!26225 () Bool)

(declare-fun tp!50347 () Bool)

(declare-fun e!477851 () Bool)

(assert (=> mapNonEmpty!26225 (= mapRes!26225 (and tp!50347 e!477851))))

(declare-fun mapValue!26225 () ValueCell!7769)

(declare-fun mapRest!26225 () (Array (_ BitVec 32) ValueCell!7769))

(declare-fun mapKey!26225 () (_ BitVec 32))

(assert (=> mapNonEmpty!26225 (= (arr!23565 _values!688) (store mapRest!26225 mapKey!26225 mapValue!26225))))

(declare-fun b!857087 () Bool)

(declare-fun res!581849 () Bool)

(assert (=> b!857087 (=> (not res!581849) (not e!477853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857087 (= res!581849 (validMask!0 mask!1196))))

(declare-fun b!857088 () Bool)

(declare-fun e!477852 () Bool)

(assert (=> b!857088 (= e!477852 tp_is_empty!16417)))

(declare-fun b!857089 () Bool)

(declare-fun res!581846 () Bool)

(assert (=> b!857089 (=> (not res!581846) (not e!477853))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!857089 (= res!581846 (and (= (select (arr!23564 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857090 () Bool)

(assert (=> b!857090 (= e!477854 (and e!477852 mapRes!26225))))

(declare-fun condMapEmpty!26225 () Bool)

(declare-fun mapDefault!26225 () ValueCell!7769)

(assert (=> b!857090 (= condMapEmpty!26225 (= (arr!23565 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7769)) mapDefault!26225)))))

(declare-fun b!857091 () Bool)

(declare-fun res!581852 () Bool)

(assert (=> b!857091 (=> (not res!581852) (not e!477853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857091 (= res!581852 (validKeyInArray!0 k0!854))))

(declare-fun b!857092 () Bool)

(assert (=> b!857092 (= e!477851 tp_is_empty!16417)))

(declare-fun b!857093 () Bool)

(declare-fun res!581850 () Bool)

(assert (=> b!857093 (=> (not res!581850) (not e!477853))))

(declare-datatypes ((List!16652 0))(
  ( (Nil!16649) (Cons!16648 (h!17785 (_ BitVec 64)) (t!23285 List!16652)) )
))
(declare-fun arrayNoDuplicates!0 (array!49075 (_ BitVec 32) List!16652) Bool)

(assert (=> b!857093 (= res!581850 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16649))))

(declare-fun b!857094 () Bool)

(assert (=> b!857094 (= e!477855 (not true))))

(declare-fun +!2218 (ListLongMap!9577 tuple2!10806) ListLongMap!9577)

(assert (=> b!857094 (= (getCurrentListMapNoExtraKeys!2860 _keys!868 lt!386231 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2218 (getCurrentListMapNoExtraKeys!2860 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10807 k0!854 v!557)))))

(declare-datatypes ((Unit!29192 0))(
  ( (Unit!29193) )
))
(declare-fun lt!386232 () Unit!29192)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!416 (array!49075 array!49077 (_ BitVec 32) (_ BitVec 32) V!26937 V!26937 (_ BitVec 32) (_ BitVec 64) V!26937 (_ BitVec 32) Int) Unit!29192)

(assert (=> b!857094 (= lt!386232 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!416 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857095 () Bool)

(declare-fun res!581851 () Bool)

(assert (=> b!857095 (=> (not res!581851) (not e!477853))))

(assert (=> b!857095 (= res!581851 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24005 _keys!868))))))

(declare-fun b!857096 () Bool)

(declare-fun res!581847 () Bool)

(assert (=> b!857096 (=> (not res!581847) (not e!477853))))

(assert (=> b!857096 (= res!581847 (and (= (size!24006 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24005 _keys!868) (size!24006 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73534 res!581854) b!857087))

(assert (= (and b!857087 res!581849) b!857096))

(assert (= (and b!857096 res!581847) b!857085))

(assert (= (and b!857085 res!581853) b!857093))

(assert (= (and b!857093 res!581850) b!857095))

(assert (= (and b!857095 res!581851) b!857091))

(assert (= (and b!857091 res!581852) b!857089))

(assert (= (and b!857089 res!581846) b!857086))

(assert (= (and b!857086 res!581848) b!857094))

(assert (= (and b!857090 condMapEmpty!26225) mapIsEmpty!26225))

(assert (= (and b!857090 (not condMapEmpty!26225)) mapNonEmpty!26225))

(get-info :version)

(assert (= (and mapNonEmpty!26225 ((_ is ValueCellFull!7769) mapValue!26225)) b!857092))

(assert (= (and b!857090 ((_ is ValueCellFull!7769) mapDefault!26225)) b!857088))

(assert (= start!73534 b!857090))

(declare-fun m!798461 () Bool)

(assert (=> b!857087 m!798461))

(declare-fun m!798463 () Bool)

(assert (=> b!857089 m!798463))

(declare-fun m!798465 () Bool)

(assert (=> b!857086 m!798465))

(declare-fun m!798467 () Bool)

(assert (=> b!857086 m!798467))

(declare-fun m!798469 () Bool)

(assert (=> b!857086 m!798469))

(declare-fun m!798471 () Bool)

(assert (=> b!857093 m!798471))

(declare-fun m!798473 () Bool)

(assert (=> b!857091 m!798473))

(declare-fun m!798475 () Bool)

(assert (=> b!857085 m!798475))

(declare-fun m!798477 () Bool)

(assert (=> mapNonEmpty!26225 m!798477))

(declare-fun m!798479 () Bool)

(assert (=> b!857094 m!798479))

(declare-fun m!798481 () Bool)

(assert (=> b!857094 m!798481))

(assert (=> b!857094 m!798481))

(declare-fun m!798483 () Bool)

(assert (=> b!857094 m!798483))

(declare-fun m!798485 () Bool)

(assert (=> b!857094 m!798485))

(declare-fun m!798487 () Bool)

(assert (=> start!73534 m!798487))

(declare-fun m!798489 () Bool)

(assert (=> start!73534 m!798489))

(check-sat (not mapNonEmpty!26225) tp_is_empty!16417 (not b_next!14281) (not b!857093) (not b!857087) (not start!73534) (not b!857091) (not b!857094) (not b!857086) b_and!23647 (not b!857085))
(check-sat b_and!23647 (not b_next!14281))
