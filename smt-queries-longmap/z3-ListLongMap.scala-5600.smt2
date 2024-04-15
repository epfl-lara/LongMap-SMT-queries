; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73366 () Bool)

(assert start!73366)

(declare-fun b_free!14299 () Bool)

(declare-fun b_next!14299 () Bool)

(assert (=> start!73366 (= b_free!14299 (not b_next!14299))))

(declare-fun tp!50402 () Bool)

(declare-fun b_and!23629 () Bool)

(assert (=> start!73366 (= tp!50402 b_and!23629)))

(declare-fun b!856267 () Bool)

(declare-fun res!581642 () Bool)

(declare-fun e!477284 () Bool)

(assert (=> b!856267 (=> (not res!581642) (not e!477284))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856267 (= res!581642 (validMask!0 mask!1196))))

(declare-fun b!856268 () Bool)

(declare-fun res!581643 () Bool)

(assert (=> b!856268 (=> (not res!581643) (not e!477284))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49047 0))(
  ( (array!49048 (arr!23555 (Array (_ BitVec 32) (_ BitVec 64))) (size!23997 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49047)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!856268 (= res!581643 (and (= (select (arr!23555 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856269 () Bool)

(declare-fun res!581639 () Bool)

(assert (=> b!856269 (=> (not res!581639) (not e!477284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856269 (= res!581639 (validKeyInArray!0 k0!854))))

(declare-fun b!856270 () Bool)

(declare-fun res!581638 () Bool)

(assert (=> b!856270 (=> (not res!581638) (not e!477284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49047 (_ BitVec 32)) Bool)

(assert (=> b!856270 (= res!581638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856271 () Bool)

(declare-fun e!477286 () Bool)

(assert (=> b!856271 (= e!477286 (not true))))

(declare-datatypes ((V!26961 0))(
  ( (V!26962 (val!8265 Int)) )
))
(declare-fun v!557 () V!26961)

(declare-datatypes ((ValueCell!7778 0))(
  ( (ValueCellFull!7778 (v!10684 V!26961)) (EmptyCell!7778) )
))
(declare-datatypes ((array!49049 0))(
  ( (array!49050 (arr!23556 (Array (_ BitVec 32) ValueCell!7778)) (size!23998 (_ BitVec 32))) )
))
(declare-fun lt!385745 () array!49049)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun _values!688 () array!49049)

(declare-fun minValue!654 () V!26961)

(declare-fun zeroValue!654 () V!26961)

(declare-datatypes ((tuple2!10904 0))(
  ( (tuple2!10905 (_1!5463 (_ BitVec 64)) (_2!5463 V!26961)) )
))
(declare-datatypes ((List!16710 0))(
  ( (Nil!16707) (Cons!16706 (h!17837 tuple2!10904) (t!23342 List!16710)) )
))
(declare-datatypes ((ListLongMap!9663 0))(
  ( (ListLongMap!9664 (toList!4847 List!16710)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2854 (array!49047 array!49049 (_ BitVec 32) (_ BitVec 32) V!26961 V!26961 (_ BitVec 32) Int) ListLongMap!9663)

(declare-fun +!2226 (ListLongMap!9663 tuple2!10904) ListLongMap!9663)

(assert (=> b!856271 (= (getCurrentListMapNoExtraKeys!2854 _keys!868 lt!385745 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2226 (getCurrentListMapNoExtraKeys!2854 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10905 k0!854 v!557)))))

(declare-datatypes ((Unit!29121 0))(
  ( (Unit!29122) )
))
(declare-fun lt!385744 () Unit!29121)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!423 (array!49047 array!49049 (_ BitVec 32) (_ BitVec 32) V!26961 V!26961 (_ BitVec 32) (_ BitVec 64) V!26961 (_ BitVec 32) Int) Unit!29121)

(assert (=> b!856271 (= lt!385744 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!423 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!581635 () Bool)

(assert (=> start!73366 (=> (not res!581635) (not e!477284))))

(assert (=> start!73366 (= res!581635 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23997 _keys!868))))))

(assert (=> start!73366 e!477284))

(declare-fun tp_is_empty!16435 () Bool)

(assert (=> start!73366 tp_is_empty!16435))

(assert (=> start!73366 true))

(assert (=> start!73366 tp!50402))

(declare-fun array_inv!18726 (array!49047) Bool)

(assert (=> start!73366 (array_inv!18726 _keys!868)))

(declare-fun e!477283 () Bool)

(declare-fun array_inv!18727 (array!49049) Bool)

(assert (=> start!73366 (and (array_inv!18727 _values!688) e!477283)))

(declare-fun b!856272 () Bool)

(declare-fun res!581641 () Bool)

(assert (=> b!856272 (=> (not res!581641) (not e!477284))))

(assert (=> b!856272 (= res!581641 (and (= (size!23998 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23997 _keys!868) (size!23998 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856273 () Bool)

(declare-fun e!477288 () Bool)

(declare-fun mapRes!26252 () Bool)

(assert (=> b!856273 (= e!477283 (and e!477288 mapRes!26252))))

(declare-fun condMapEmpty!26252 () Bool)

(declare-fun mapDefault!26252 () ValueCell!7778)

(assert (=> b!856273 (= condMapEmpty!26252 (= (arr!23556 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7778)) mapDefault!26252)))))

(declare-fun mapNonEmpty!26252 () Bool)

(declare-fun tp!50401 () Bool)

(declare-fun e!477285 () Bool)

(assert (=> mapNonEmpty!26252 (= mapRes!26252 (and tp!50401 e!477285))))

(declare-fun mapValue!26252 () ValueCell!7778)

(declare-fun mapKey!26252 () (_ BitVec 32))

(declare-fun mapRest!26252 () (Array (_ BitVec 32) ValueCell!7778))

(assert (=> mapNonEmpty!26252 (= (arr!23556 _values!688) (store mapRest!26252 mapKey!26252 mapValue!26252))))

(declare-fun b!856274 () Bool)

(assert (=> b!856274 (= e!477284 e!477286)))

(declare-fun res!581637 () Bool)

(assert (=> b!856274 (=> (not res!581637) (not e!477286))))

(assert (=> b!856274 (= res!581637 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385743 () ListLongMap!9663)

(assert (=> b!856274 (= lt!385743 (getCurrentListMapNoExtraKeys!2854 _keys!868 lt!385745 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856274 (= lt!385745 (array!49050 (store (arr!23556 _values!688) i!612 (ValueCellFull!7778 v!557)) (size!23998 _values!688)))))

(declare-fun lt!385742 () ListLongMap!9663)

(assert (=> b!856274 (= lt!385742 (getCurrentListMapNoExtraKeys!2854 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856275 () Bool)

(declare-fun res!581636 () Bool)

(assert (=> b!856275 (=> (not res!581636) (not e!477284))))

(assert (=> b!856275 (= res!581636 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23997 _keys!868))))))

(declare-fun b!856276 () Bool)

(declare-fun res!581640 () Bool)

(assert (=> b!856276 (=> (not res!581640) (not e!477284))))

(declare-datatypes ((List!16711 0))(
  ( (Nil!16708) (Cons!16707 (h!17838 (_ BitVec 64)) (t!23343 List!16711)) )
))
(declare-fun arrayNoDuplicates!0 (array!49047 (_ BitVec 32) List!16711) Bool)

(assert (=> b!856276 (= res!581640 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16708))))

(declare-fun b!856277 () Bool)

(assert (=> b!856277 (= e!477288 tp_is_empty!16435)))

(declare-fun mapIsEmpty!26252 () Bool)

(assert (=> mapIsEmpty!26252 mapRes!26252))

(declare-fun b!856278 () Bool)

(assert (=> b!856278 (= e!477285 tp_is_empty!16435)))

(assert (= (and start!73366 res!581635) b!856267))

(assert (= (and b!856267 res!581642) b!856272))

(assert (= (and b!856272 res!581641) b!856270))

(assert (= (and b!856270 res!581638) b!856276))

(assert (= (and b!856276 res!581640) b!856275))

(assert (= (and b!856275 res!581636) b!856269))

(assert (= (and b!856269 res!581639) b!856268))

(assert (= (and b!856268 res!581643) b!856274))

(assert (= (and b!856274 res!581637) b!856271))

(assert (= (and b!856273 condMapEmpty!26252) mapIsEmpty!26252))

(assert (= (and b!856273 (not condMapEmpty!26252)) mapNonEmpty!26252))

(get-info :version)

(assert (= (and mapNonEmpty!26252 ((_ is ValueCellFull!7778) mapValue!26252)) b!856278))

(assert (= (and b!856273 ((_ is ValueCellFull!7778) mapDefault!26252)) b!856277))

(assert (= start!73366 b!856273))

(declare-fun m!796683 () Bool)

(assert (=> b!856270 m!796683))

(declare-fun m!796685 () Bool)

(assert (=> b!856274 m!796685))

(declare-fun m!796687 () Bool)

(assert (=> b!856274 m!796687))

(declare-fun m!796689 () Bool)

(assert (=> b!856274 m!796689))

(declare-fun m!796691 () Bool)

(assert (=> b!856269 m!796691))

(declare-fun m!796693 () Bool)

(assert (=> mapNonEmpty!26252 m!796693))

(declare-fun m!796695 () Bool)

(assert (=> b!856271 m!796695))

(declare-fun m!796697 () Bool)

(assert (=> b!856271 m!796697))

(assert (=> b!856271 m!796697))

(declare-fun m!796699 () Bool)

(assert (=> b!856271 m!796699))

(declare-fun m!796701 () Bool)

(assert (=> b!856271 m!796701))

(declare-fun m!796703 () Bool)

(assert (=> start!73366 m!796703))

(declare-fun m!796705 () Bool)

(assert (=> start!73366 m!796705))

(declare-fun m!796707 () Bool)

(assert (=> b!856268 m!796707))

(declare-fun m!796709 () Bool)

(assert (=> b!856267 m!796709))

(declare-fun m!796711 () Bool)

(assert (=> b!856276 m!796711))

(check-sat b_and!23629 (not start!73366) (not mapNonEmpty!26252) (not b!856267) tp_is_empty!16435 (not b!856276) (not b!856270) (not b_next!14299) (not b!856274) (not b!856269) (not b!856271))
(check-sat b_and!23629 (not b_next!14299))
