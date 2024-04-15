; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73492 () Bool)

(assert start!73492)

(declare-fun b_free!14425 () Bool)

(declare-fun b_next!14425 () Bool)

(assert (=> start!73492 (= b_free!14425 (not b_next!14425))))

(declare-fun tp!50780 () Bool)

(declare-fun b_and!23803 () Bool)

(assert (=> start!73492 (= tp!50780 b_and!23803)))

(declare-fun b!858695 () Bool)

(declare-fun e!478536 () Bool)

(declare-fun tp_is_empty!16561 () Bool)

(assert (=> b!858695 (= e!478536 tp_is_empty!16561)))

(declare-fun res!583455 () Bool)

(declare-fun e!478530 () Bool)

(assert (=> start!73492 (=> (not res!583455) (not e!478530))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49289 0))(
  ( (array!49290 (arr!23676 (Array (_ BitVec 32) (_ BitVec 64))) (size!24118 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49289)

(assert (=> start!73492 (= res!583455 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24118 _keys!868))))))

(assert (=> start!73492 e!478530))

(assert (=> start!73492 tp_is_empty!16561))

(assert (=> start!73492 true))

(assert (=> start!73492 tp!50780))

(declare-fun array_inv!18810 (array!49289) Bool)

(assert (=> start!73492 (array_inv!18810 _keys!868)))

(declare-datatypes ((V!27129 0))(
  ( (V!27130 (val!8328 Int)) )
))
(declare-datatypes ((ValueCell!7841 0))(
  ( (ValueCellFull!7841 (v!10747 V!27129)) (EmptyCell!7841) )
))
(declare-datatypes ((array!49291 0))(
  ( (array!49292 (arr!23677 (Array (_ BitVec 32) ValueCell!7841)) (size!24119 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49291)

(declare-fun e!478534 () Bool)

(declare-fun array_inv!18811 (array!49291) Bool)

(assert (=> start!73492 (and (array_inv!18811 _values!688) e!478534)))

(declare-fun b!858696 () Bool)

(declare-fun e!478532 () Bool)

(assert (=> b!858696 (= e!478532 true)))

(declare-datatypes ((List!16803 0))(
  ( (Nil!16800) (Cons!16799 (h!17930 (_ BitVec 64)) (t!23485 List!16803)) )
))
(declare-fun arrayNoDuplicates!0 (array!49289 (_ BitVec 32) List!16803) Bool)

(assert (=> b!858696 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16800)))

(declare-datatypes ((Unit!29209 0))(
  ( (Unit!29210) )
))
(declare-fun lt!386754 () Unit!29209)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49289 (_ BitVec 32) (_ BitVec 32)) Unit!29209)

(assert (=> b!858696 (= lt!386754 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!858697 () Bool)

(declare-fun e!478531 () Bool)

(assert (=> b!858697 (= e!478530 e!478531)))

(declare-fun res!583457 () Bool)

(assert (=> b!858697 (=> (not res!583457) (not e!478531))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858697 (= res!583457 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386751 () array!49291)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11002 0))(
  ( (tuple2!11003 (_1!5512 (_ BitVec 64)) (_2!5512 V!27129)) )
))
(declare-datatypes ((List!16804 0))(
  ( (Nil!16801) (Cons!16800 (h!17931 tuple2!11002) (t!23486 List!16804)) )
))
(declare-datatypes ((ListLongMap!9761 0))(
  ( (ListLongMap!9762 (toList!4896 List!16804)) )
))
(declare-fun lt!386752 () ListLongMap!9761)

(declare-fun minValue!654 () V!27129)

(declare-fun zeroValue!654 () V!27129)

(declare-fun getCurrentListMapNoExtraKeys!2901 (array!49289 array!49291 (_ BitVec 32) (_ BitVec 32) V!27129 V!27129 (_ BitVec 32) Int) ListLongMap!9761)

(assert (=> b!858697 (= lt!386752 (getCurrentListMapNoExtraKeys!2901 _keys!868 lt!386751 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27129)

(assert (=> b!858697 (= lt!386751 (array!49292 (store (arr!23677 _values!688) i!612 (ValueCellFull!7841 v!557)) (size!24119 _values!688)))))

(declare-fun lt!386755 () ListLongMap!9761)

(assert (=> b!858697 (= lt!386755 (getCurrentListMapNoExtraKeys!2901 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858698 () Bool)

(declare-fun res!583456 () Bool)

(assert (=> b!858698 (=> (not res!583456) (not e!478530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858698 (= res!583456 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26441 () Bool)

(declare-fun mapRes!26441 () Bool)

(assert (=> mapIsEmpty!26441 mapRes!26441))

(declare-fun mapNonEmpty!26441 () Bool)

(declare-fun tp!50779 () Bool)

(assert (=> mapNonEmpty!26441 (= mapRes!26441 (and tp!50779 e!478536))))

(declare-fun mapRest!26441 () (Array (_ BitVec 32) ValueCell!7841))

(declare-fun mapKey!26441 () (_ BitVec 32))

(declare-fun mapValue!26441 () ValueCell!7841)

(assert (=> mapNonEmpty!26441 (= (arr!23677 _values!688) (store mapRest!26441 mapKey!26441 mapValue!26441))))

(declare-fun b!858699 () Bool)

(declare-fun res!583449 () Bool)

(assert (=> b!858699 (=> (not res!583449) (not e!478530))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858699 (= res!583449 (validKeyInArray!0 k0!854))))

(declare-fun b!858700 () Bool)

(declare-fun e!478535 () Bool)

(assert (=> b!858700 (= e!478535 e!478532)))

(declare-fun res!583450 () Bool)

(assert (=> b!858700 (=> res!583450 e!478532)))

(assert (=> b!858700 (= res!583450 (not (= (select (arr!23676 _keys!868) from!1053) k0!854)))))

(declare-fun lt!386756 () ListLongMap!9761)

(declare-fun +!2270 (ListLongMap!9761 tuple2!11002) ListLongMap!9761)

(declare-fun get!12477 (ValueCell!7841 V!27129) V!27129)

(declare-fun dynLambda!1088 (Int (_ BitVec 64)) V!27129)

(assert (=> b!858700 (= lt!386752 (+!2270 lt!386756 (tuple2!11003 (select (arr!23676 _keys!868) from!1053) (get!12477 (select (arr!23677 _values!688) from!1053) (dynLambda!1088 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858701 () Bool)

(declare-fun res!583453 () Bool)

(assert (=> b!858701 (=> (not res!583453) (not e!478530))))

(assert (=> b!858701 (= res!583453 (and (= (size!24119 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24118 _keys!868) (size!24119 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858702 () Bool)

(declare-fun res!583454 () Bool)

(assert (=> b!858702 (=> (not res!583454) (not e!478530))))

(assert (=> b!858702 (= res!583454 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16800))))

(declare-fun b!858703 () Bool)

(declare-fun res!583452 () Bool)

(assert (=> b!858703 (=> (not res!583452) (not e!478530))))

(assert (=> b!858703 (= res!583452 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24118 _keys!868))))))

(declare-fun b!858704 () Bool)

(declare-fun e!478533 () Bool)

(assert (=> b!858704 (= e!478534 (and e!478533 mapRes!26441))))

(declare-fun condMapEmpty!26441 () Bool)

(declare-fun mapDefault!26441 () ValueCell!7841)

(assert (=> b!858704 (= condMapEmpty!26441 (= (arr!23677 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7841)) mapDefault!26441)))))

(declare-fun b!858705 () Bool)

(declare-fun res!583448 () Bool)

(assert (=> b!858705 (=> (not res!583448) (not e!478530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49289 (_ BitVec 32)) Bool)

(assert (=> b!858705 (= res!583448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858706 () Bool)

(assert (=> b!858706 (= e!478531 (not e!478535))))

(declare-fun res!583451 () Bool)

(assert (=> b!858706 (=> res!583451 e!478535)))

(assert (=> b!858706 (= res!583451 (not (validKeyInArray!0 (select (arr!23676 _keys!868) from!1053))))))

(declare-fun lt!386750 () ListLongMap!9761)

(assert (=> b!858706 (= lt!386750 lt!386756)))

(declare-fun lt!386753 () ListLongMap!9761)

(assert (=> b!858706 (= lt!386756 (+!2270 lt!386753 (tuple2!11003 k0!854 v!557)))))

(assert (=> b!858706 (= lt!386750 (getCurrentListMapNoExtraKeys!2901 _keys!868 lt!386751 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858706 (= lt!386753 (getCurrentListMapNoExtraKeys!2901 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386749 () Unit!29209)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!463 (array!49289 array!49291 (_ BitVec 32) (_ BitVec 32) V!27129 V!27129 (_ BitVec 32) (_ BitVec 64) V!27129 (_ BitVec 32) Int) Unit!29209)

(assert (=> b!858706 (= lt!386749 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!463 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858707 () Bool)

(declare-fun res!583458 () Bool)

(assert (=> b!858707 (=> (not res!583458) (not e!478530))))

(assert (=> b!858707 (= res!583458 (and (= (select (arr!23676 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858708 () Bool)

(assert (=> b!858708 (= e!478533 tp_is_empty!16561)))

(assert (= (and start!73492 res!583455) b!858698))

(assert (= (and b!858698 res!583456) b!858701))

(assert (= (and b!858701 res!583453) b!858705))

(assert (= (and b!858705 res!583448) b!858702))

(assert (= (and b!858702 res!583454) b!858703))

(assert (= (and b!858703 res!583452) b!858699))

(assert (= (and b!858699 res!583449) b!858707))

(assert (= (and b!858707 res!583458) b!858697))

(assert (= (and b!858697 res!583457) b!858706))

(assert (= (and b!858706 (not res!583451)) b!858700))

(assert (= (and b!858700 (not res!583450)) b!858696))

(assert (= (and b!858704 condMapEmpty!26441) mapIsEmpty!26441))

(assert (= (and b!858704 (not condMapEmpty!26441)) mapNonEmpty!26441))

(get-info :version)

(assert (= (and mapNonEmpty!26441 ((_ is ValueCellFull!7841) mapValue!26441)) b!858695))

(assert (= (and b!858704 ((_ is ValueCellFull!7841) mapDefault!26441)) b!858708))

(assert (= start!73492 b!858704))

(declare-fun b_lambda!11759 () Bool)

(assert (=> (not b_lambda!11759) (not b!858700)))

(declare-fun t!23484 () Bool)

(declare-fun tb!4539 () Bool)

(assert (=> (and start!73492 (= defaultEntry!696 defaultEntry!696) t!23484) tb!4539))

(declare-fun result!8697 () Bool)

(assert (=> tb!4539 (= result!8697 tp_is_empty!16561)))

(assert (=> b!858700 t!23484))

(declare-fun b_and!23805 () Bool)

(assert (= b_and!23803 (and (=> t!23484 result!8697) b_and!23805)))

(declare-fun m!798909 () Bool)

(assert (=> b!858700 m!798909))

(declare-fun m!798911 () Bool)

(assert (=> b!858700 m!798911))

(declare-fun m!798913 () Bool)

(assert (=> b!858700 m!798913))

(declare-fun m!798915 () Bool)

(assert (=> b!858700 m!798915))

(assert (=> b!858700 m!798911))

(declare-fun m!798917 () Bool)

(assert (=> b!858700 m!798917))

(assert (=> b!858700 m!798913))

(declare-fun m!798919 () Bool)

(assert (=> b!858698 m!798919))

(declare-fun m!798921 () Bool)

(assert (=> b!858706 m!798921))

(declare-fun m!798923 () Bool)

(assert (=> b!858706 m!798923))

(assert (=> b!858706 m!798917))

(declare-fun m!798925 () Bool)

(assert (=> b!858706 m!798925))

(assert (=> b!858706 m!798917))

(declare-fun m!798927 () Bool)

(assert (=> b!858706 m!798927))

(declare-fun m!798929 () Bool)

(assert (=> b!858706 m!798929))

(declare-fun m!798931 () Bool)

(assert (=> mapNonEmpty!26441 m!798931))

(declare-fun m!798933 () Bool)

(assert (=> b!858705 m!798933))

(declare-fun m!798935 () Bool)

(assert (=> b!858696 m!798935))

(declare-fun m!798937 () Bool)

(assert (=> b!858696 m!798937))

(declare-fun m!798939 () Bool)

(assert (=> b!858707 m!798939))

(declare-fun m!798941 () Bool)

(assert (=> start!73492 m!798941))

(declare-fun m!798943 () Bool)

(assert (=> start!73492 m!798943))

(declare-fun m!798945 () Bool)

(assert (=> b!858697 m!798945))

(declare-fun m!798947 () Bool)

(assert (=> b!858697 m!798947))

(declare-fun m!798949 () Bool)

(assert (=> b!858697 m!798949))

(declare-fun m!798951 () Bool)

(assert (=> b!858702 m!798951))

(declare-fun m!798953 () Bool)

(assert (=> b!858699 m!798953))

(check-sat (not b!858706) (not b_next!14425) (not b!858700) (not b!858699) tp_is_empty!16561 (not b_lambda!11759) (not start!73492) (not b!858702) b_and!23805 (not b!858696) (not mapNonEmpty!26441) (not b!858698) (not b!858697) (not b!858705))
(check-sat b_and!23805 (not b_next!14425))
