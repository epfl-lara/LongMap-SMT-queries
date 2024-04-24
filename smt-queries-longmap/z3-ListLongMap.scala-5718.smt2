; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74260 () Bool)

(assert start!74260)

(declare-fun b!872636 () Bool)

(declare-fun res!592889 () Bool)

(declare-fun e!485935 () Bool)

(assert (=> b!872636 (=> (not res!592889) (not e!485935))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872636 (= res!592889 (validMask!0 mask!1196))))

(declare-fun b!872637 () Bool)

(declare-fun e!485934 () Bool)

(declare-fun tp_is_empty!17143 () Bool)

(assert (=> b!872637 (= e!485934 tp_is_empty!17143)))

(declare-fun b!872638 () Bool)

(declare-fun e!485931 () Bool)

(assert (=> b!872638 (= e!485931 tp_is_empty!17143)))

(declare-fun b!872639 () Bool)

(declare-fun res!592888 () Bool)

(assert (=> b!872639 (=> (not res!592888) (not e!485935))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50483 0))(
  ( (array!50484 (arr!24268 (Array (_ BitVec 32) (_ BitVec 64))) (size!24709 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50483)

(declare-datatypes ((V!27905 0))(
  ( (V!27906 (val!8619 Int)) )
))
(declare-datatypes ((ValueCell!8132 0))(
  ( (ValueCellFull!8132 (v!11044 V!27905)) (EmptyCell!8132) )
))
(declare-datatypes ((array!50485 0))(
  ( (array!50486 (arr!24269 (Array (_ BitVec 32) ValueCell!8132)) (size!24710 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50485)

(assert (=> b!872639 (= res!592888 (and (= (size!24710 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24709 _keys!868) (size!24710 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872640 () Bool)

(assert (=> b!872640 (= e!485935 false)))

(declare-fun lt!395891 () Bool)

(declare-datatypes ((List!17196 0))(
  ( (Nil!17193) (Cons!17192 (h!18329 (_ BitVec 64)) (t!24225 List!17196)) )
))
(declare-fun arrayNoDuplicates!0 (array!50483 (_ BitVec 32) List!17196) Bool)

(assert (=> b!872640 (= lt!395891 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17193))))

(declare-fun res!592890 () Bool)

(assert (=> start!74260 (=> (not res!592890) (not e!485935))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74260 (= res!592890 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24709 _keys!868))))))

(assert (=> start!74260 e!485935))

(assert (=> start!74260 true))

(declare-fun array_inv!19214 (array!50483) Bool)

(assert (=> start!74260 (array_inv!19214 _keys!868)))

(declare-fun e!485932 () Bool)

(declare-fun array_inv!19215 (array!50485) Bool)

(assert (=> start!74260 (and (array_inv!19215 _values!688) e!485932)))

(declare-fun mapNonEmpty!27314 () Bool)

(declare-fun mapRes!27314 () Bool)

(declare-fun tp!52514 () Bool)

(assert (=> mapNonEmpty!27314 (= mapRes!27314 (and tp!52514 e!485934))))

(declare-fun mapValue!27314 () ValueCell!8132)

(declare-fun mapKey!27314 () (_ BitVec 32))

(declare-fun mapRest!27314 () (Array (_ BitVec 32) ValueCell!8132))

(assert (=> mapNonEmpty!27314 (= (arr!24269 _values!688) (store mapRest!27314 mapKey!27314 mapValue!27314))))

(declare-fun b!872641 () Bool)

(declare-fun res!592891 () Bool)

(assert (=> b!872641 (=> (not res!592891) (not e!485935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50483 (_ BitVec 32)) Bool)

(assert (=> b!872641 (= res!592891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872642 () Bool)

(assert (=> b!872642 (= e!485932 (and e!485931 mapRes!27314))))

(declare-fun condMapEmpty!27314 () Bool)

(declare-fun mapDefault!27314 () ValueCell!8132)

(assert (=> b!872642 (= condMapEmpty!27314 (= (arr!24269 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8132)) mapDefault!27314)))))

(declare-fun mapIsEmpty!27314 () Bool)

(assert (=> mapIsEmpty!27314 mapRes!27314))

(assert (= (and start!74260 res!592890) b!872636))

(assert (= (and b!872636 res!592889) b!872639))

(assert (= (and b!872639 res!592888) b!872641))

(assert (= (and b!872641 res!592891) b!872640))

(assert (= (and b!872642 condMapEmpty!27314) mapIsEmpty!27314))

(assert (= (and b!872642 (not condMapEmpty!27314)) mapNonEmpty!27314))

(get-info :version)

(assert (= (and mapNonEmpty!27314 ((_ is ValueCellFull!8132) mapValue!27314)) b!872637))

(assert (= (and b!872642 ((_ is ValueCellFull!8132) mapDefault!27314)) b!872638))

(assert (= start!74260 b!872642))

(declare-fun m!814151 () Bool)

(assert (=> b!872640 m!814151))

(declare-fun m!814153 () Bool)

(assert (=> b!872641 m!814153))

(declare-fun m!814155 () Bool)

(assert (=> b!872636 m!814155))

(declare-fun m!814157 () Bool)

(assert (=> mapNonEmpty!27314 m!814157))

(declare-fun m!814159 () Bool)

(assert (=> start!74260 m!814159))

(declare-fun m!814161 () Bool)

(assert (=> start!74260 m!814161))

(check-sat (not mapNonEmpty!27314) (not b!872641) (not b!872636) tp_is_empty!17143 (not b!872640) (not start!74260))
(check-sat)
