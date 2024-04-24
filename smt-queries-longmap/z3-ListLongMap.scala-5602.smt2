; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73564 () Bool)

(assert start!73564)

(declare-fun b_free!14311 () Bool)

(declare-fun b_next!14311 () Bool)

(assert (=> start!73564 (= b_free!14311 (not b_next!14311))))

(declare-fun tp!50438 () Bool)

(declare-fun b_and!23677 () Bool)

(assert (=> start!73564 (= tp!50438 b_and!23677)))

(declare-fun mapNonEmpty!26270 () Bool)

(declare-fun mapRes!26270 () Bool)

(declare-fun tp!50437 () Bool)

(declare-fun e!478121 () Bool)

(assert (=> mapNonEmpty!26270 (= mapRes!26270 (and tp!50437 e!478121))))

(declare-fun mapKey!26270 () (_ BitVec 32))

(declare-datatypes ((V!26977 0))(
  ( (V!26978 (val!8271 Int)) )
))
(declare-datatypes ((ValueCell!7784 0))(
  ( (ValueCellFull!7784 (v!10696 V!26977)) (EmptyCell!7784) )
))
(declare-fun mapValue!26270 () ValueCell!7784)

(declare-datatypes ((array!49133 0))(
  ( (array!49134 (arr!23593 (Array (_ BitVec 32) ValueCell!7784)) (size!24034 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49133)

(declare-fun mapRest!26270 () (Array (_ BitVec 32) ValueCell!7784))

(assert (=> mapNonEmpty!26270 (= (arr!23593 _values!688) (store mapRest!26270 mapKey!26270 mapValue!26270))))

(declare-fun b!857625 () Bool)

(declare-fun res!582252 () Bool)

(declare-fun e!478123 () Bool)

(assert (=> b!857625 (=> (not res!582252) (not e!478123))))

(declare-datatypes ((array!49135 0))(
  ( (array!49136 (arr!23594 (Array (_ BitVec 32) (_ BitVec 64))) (size!24035 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49135)

(declare-datatypes ((List!16671 0))(
  ( (Nil!16668) (Cons!16667 (h!17804 (_ BitVec 64)) (t!23304 List!16671)) )
))
(declare-fun arrayNoDuplicates!0 (array!49135 (_ BitVec 32) List!16671) Bool)

(assert (=> b!857625 (= res!582252 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16668))))

(declare-fun b!857626 () Bool)

(declare-fun res!582255 () Bool)

(assert (=> b!857626 (=> (not res!582255) (not e!478123))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857626 (= res!582255 (and (= (select (arr!23594 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857627 () Bool)

(declare-fun e!478124 () Bool)

(assert (=> b!857627 (= e!478123 e!478124)))

(declare-fun res!582257 () Bool)

(assert (=> b!857627 (=> (not res!582257) (not e!478124))))

(assert (=> b!857627 (= res!582257 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386411 () array!49133)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10826 0))(
  ( (tuple2!10827 (_1!5424 (_ BitVec 64)) (_2!5424 V!26977)) )
))
(declare-datatypes ((List!16672 0))(
  ( (Nil!16669) (Cons!16668 (h!17805 tuple2!10826) (t!23305 List!16672)) )
))
(declare-datatypes ((ListLongMap!9597 0))(
  ( (ListLongMap!9598 (toList!4814 List!16672)) )
))
(declare-fun lt!386414 () ListLongMap!9597)

(declare-fun minValue!654 () V!26977)

(declare-fun zeroValue!654 () V!26977)

(declare-fun getCurrentListMapNoExtraKeys!2870 (array!49135 array!49133 (_ BitVec 32) (_ BitVec 32) V!26977 V!26977 (_ BitVec 32) Int) ListLongMap!9597)

(assert (=> b!857627 (= lt!386414 (getCurrentListMapNoExtraKeys!2870 _keys!868 lt!386411 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26977)

(assert (=> b!857627 (= lt!386411 (array!49134 (store (arr!23593 _values!688) i!612 (ValueCellFull!7784 v!557)) (size!24034 _values!688)))))

(declare-fun lt!386412 () ListLongMap!9597)

(assert (=> b!857627 (= lt!386412 (getCurrentListMapNoExtraKeys!2870 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857628 () Bool)

(declare-fun res!582258 () Bool)

(assert (=> b!857628 (=> (not res!582258) (not e!478123))))

(assert (=> b!857628 (= res!582258 (and (= (size!24034 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24035 _keys!868) (size!24034 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857629 () Bool)

(declare-fun res!582254 () Bool)

(assert (=> b!857629 (=> (not res!582254) (not e!478123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857629 (= res!582254 (validKeyInArray!0 k0!854))))

(declare-fun b!857630 () Bool)

(assert (=> b!857630 (= e!478124 (not true))))

(declare-fun +!2227 (ListLongMap!9597 tuple2!10826) ListLongMap!9597)

(assert (=> b!857630 (= (getCurrentListMapNoExtraKeys!2870 _keys!868 lt!386411 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2227 (getCurrentListMapNoExtraKeys!2870 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10827 k0!854 v!557)))))

(declare-datatypes ((Unit!29210 0))(
  ( (Unit!29211) )
))
(declare-fun lt!386413 () Unit!29210)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!425 (array!49135 array!49133 (_ BitVec 32) (_ BitVec 32) V!26977 V!26977 (_ BitVec 32) (_ BitVec 64) V!26977 (_ BitVec 32) Int) Unit!29210)

(assert (=> b!857630 (= lt!386413 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!425 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857631 () Bool)

(declare-fun tp_is_empty!16447 () Bool)

(assert (=> b!857631 (= e!478121 tp_is_empty!16447)))

(declare-fun b!857632 () Bool)

(declare-fun res!582256 () Bool)

(assert (=> b!857632 (=> (not res!582256) (not e!478123))))

(assert (=> b!857632 (= res!582256 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24035 _keys!868))))))

(declare-fun b!857633 () Bool)

(declare-fun e!478126 () Bool)

(declare-fun e!478122 () Bool)

(assert (=> b!857633 (= e!478126 (and e!478122 mapRes!26270))))

(declare-fun condMapEmpty!26270 () Bool)

(declare-fun mapDefault!26270 () ValueCell!7784)

(assert (=> b!857633 (= condMapEmpty!26270 (= (arr!23593 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7784)) mapDefault!26270)))))

(declare-fun b!857634 () Bool)

(declare-fun res!582251 () Bool)

(assert (=> b!857634 (=> (not res!582251) (not e!478123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857634 (= res!582251 (validMask!0 mask!1196))))

(declare-fun b!857635 () Bool)

(declare-fun res!582259 () Bool)

(assert (=> b!857635 (=> (not res!582259) (not e!478123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49135 (_ BitVec 32)) Bool)

(assert (=> b!857635 (= res!582259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857636 () Bool)

(assert (=> b!857636 (= e!478122 tp_is_empty!16447)))

(declare-fun mapIsEmpty!26270 () Bool)

(assert (=> mapIsEmpty!26270 mapRes!26270))

(declare-fun res!582253 () Bool)

(assert (=> start!73564 (=> (not res!582253) (not e!478123))))

(assert (=> start!73564 (= res!582253 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24035 _keys!868))))))

(assert (=> start!73564 e!478123))

(assert (=> start!73564 tp_is_empty!16447))

(assert (=> start!73564 true))

(assert (=> start!73564 tp!50438))

(declare-fun array_inv!18744 (array!49135) Bool)

(assert (=> start!73564 (array_inv!18744 _keys!868)))

(declare-fun array_inv!18745 (array!49133) Bool)

(assert (=> start!73564 (and (array_inv!18745 _values!688) e!478126)))

(assert (= (and start!73564 res!582253) b!857634))

(assert (= (and b!857634 res!582251) b!857628))

(assert (= (and b!857628 res!582258) b!857635))

(assert (= (and b!857635 res!582259) b!857625))

(assert (= (and b!857625 res!582252) b!857632))

(assert (= (and b!857632 res!582256) b!857629))

(assert (= (and b!857629 res!582254) b!857626))

(assert (= (and b!857626 res!582255) b!857627))

(assert (= (and b!857627 res!582257) b!857630))

(assert (= (and b!857633 condMapEmpty!26270) mapIsEmpty!26270))

(assert (= (and b!857633 (not condMapEmpty!26270)) mapNonEmpty!26270))

(get-info :version)

(assert (= (and mapNonEmpty!26270 ((_ is ValueCellFull!7784) mapValue!26270)) b!857631))

(assert (= (and b!857633 ((_ is ValueCellFull!7784) mapDefault!26270)) b!857636))

(assert (= start!73564 b!857633))

(declare-fun m!798911 () Bool)

(assert (=> b!857629 m!798911))

(declare-fun m!798913 () Bool)

(assert (=> mapNonEmpty!26270 m!798913))

(declare-fun m!798915 () Bool)

(assert (=> start!73564 m!798915))

(declare-fun m!798917 () Bool)

(assert (=> start!73564 m!798917))

(declare-fun m!798919 () Bool)

(assert (=> b!857626 m!798919))

(declare-fun m!798921 () Bool)

(assert (=> b!857630 m!798921))

(declare-fun m!798923 () Bool)

(assert (=> b!857630 m!798923))

(assert (=> b!857630 m!798923))

(declare-fun m!798925 () Bool)

(assert (=> b!857630 m!798925))

(declare-fun m!798927 () Bool)

(assert (=> b!857630 m!798927))

(declare-fun m!798929 () Bool)

(assert (=> b!857625 m!798929))

(declare-fun m!798931 () Bool)

(assert (=> b!857635 m!798931))

(declare-fun m!798933 () Bool)

(assert (=> b!857627 m!798933))

(declare-fun m!798935 () Bool)

(assert (=> b!857627 m!798935))

(declare-fun m!798937 () Bool)

(assert (=> b!857627 m!798937))

(declare-fun m!798939 () Bool)

(assert (=> b!857634 m!798939))

(check-sat (not b!857635) (not start!73564) tp_is_empty!16447 (not b!857627) b_and!23677 (not b!857630) (not b!857629) (not b!857634) (not b!857625) (not mapNonEmpty!26270) (not b_next!14311))
(check-sat b_and!23677 (not b_next!14311))
