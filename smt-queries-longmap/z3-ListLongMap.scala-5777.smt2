; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74732 () Bool)

(assert start!74732)

(declare-fun b_free!15253 () Bool)

(declare-fun b_next!15253 () Bool)

(assert (=> start!74732 (= b_free!15253 (not b_next!15253))))

(declare-fun tp!53442 () Bool)

(declare-fun b_and!25139 () Bool)

(assert (=> start!74732 (= tp!53442 b_and!25139)))

(declare-fun b!879413 () Bool)

(declare-fun res!597182 () Bool)

(declare-fun e!489517 () Bool)

(assert (=> b!879413 (=> (not res!597182) (not e!489517))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51159 0))(
  ( (array!51160 (arr!24601 (Array (_ BitVec 32) (_ BitVec 64))) (size!25042 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51159)

(declare-datatypes ((V!28377 0))(
  ( (V!28378 (val!8796 Int)) )
))
(declare-datatypes ((ValueCell!8309 0))(
  ( (ValueCellFull!8309 (v!11236 V!28377)) (EmptyCell!8309) )
))
(declare-datatypes ((array!51161 0))(
  ( (array!51162 (arr!24602 (Array (_ BitVec 32) ValueCell!8309)) (size!25043 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51161)

(assert (=> b!879413 (= res!597182 (and (= (size!25043 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25042 _keys!868) (size!25043 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879414 () Bool)

(declare-fun e!489513 () Bool)

(declare-fun tp_is_empty!17497 () Bool)

(assert (=> b!879414 (= e!489513 tp_is_empty!17497)))

(declare-fun b!879415 () Bool)

(declare-fun e!489514 () Bool)

(assert (=> b!879415 (= e!489514 tp_is_empty!17497)))

(declare-fun b!879416 () Bool)

(declare-fun res!597183 () Bool)

(assert (=> b!879416 (=> (not res!597183) (not e!489517))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879416 (= res!597183 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25042 _keys!868))))))

(declare-fun res!597180 () Bool)

(assert (=> start!74732 (=> (not res!597180) (not e!489517))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74732 (= res!597180 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25042 _keys!868))))))

(assert (=> start!74732 e!489517))

(assert (=> start!74732 tp_is_empty!17497))

(assert (=> start!74732 true))

(assert (=> start!74732 tp!53442))

(declare-fun array_inv!19428 (array!51159) Bool)

(assert (=> start!74732 (array_inv!19428 _keys!868)))

(declare-fun e!489515 () Bool)

(declare-fun array_inv!19429 (array!51161) Bool)

(assert (=> start!74732 (and (array_inv!19429 _values!688) e!489515)))

(declare-fun b!879417 () Bool)

(declare-fun res!597178 () Bool)

(assert (=> b!879417 (=> (not res!597178) (not e!489517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51159 (_ BitVec 32)) Bool)

(assert (=> b!879417 (= res!597178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879418 () Bool)

(assert (=> b!879418 (= e!489517 false)))

(declare-fun v!557 () V!28377)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11568 0))(
  ( (tuple2!11569 (_1!5795 (_ BitVec 64)) (_2!5795 V!28377)) )
))
(declare-datatypes ((List!17401 0))(
  ( (Nil!17398) (Cons!17397 (h!18534 tuple2!11568) (t!24482 List!17401)) )
))
(declare-datatypes ((ListLongMap!10339 0))(
  ( (ListLongMap!10340 (toList!5185 List!17401)) )
))
(declare-fun lt!397629 () ListLongMap!10339)

(declare-fun minValue!654 () V!28377)

(declare-fun zeroValue!654 () V!28377)

(declare-fun getCurrentListMapNoExtraKeys!3227 (array!51159 array!51161 (_ BitVec 32) (_ BitVec 32) V!28377 V!28377 (_ BitVec 32) Int) ListLongMap!10339)

(assert (=> b!879418 (= lt!397629 (getCurrentListMapNoExtraKeys!3227 _keys!868 (array!51162 (store (arr!24602 _values!688) i!612 (ValueCellFull!8309 v!557)) (size!25043 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397630 () ListLongMap!10339)

(assert (=> b!879418 (= lt!397630 (getCurrentListMapNoExtraKeys!3227 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879419 () Bool)

(declare-fun mapRes!27861 () Bool)

(assert (=> b!879419 (= e!489515 (and e!489514 mapRes!27861))))

(declare-fun condMapEmpty!27861 () Bool)

(declare-fun mapDefault!27861 () ValueCell!8309)

(assert (=> b!879419 (= condMapEmpty!27861 (= (arr!24602 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8309)) mapDefault!27861)))))

(declare-fun b!879420 () Bool)

(declare-fun res!597177 () Bool)

(assert (=> b!879420 (=> (not res!597177) (not e!489517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879420 (= res!597177 (validMask!0 mask!1196))))

(declare-fun b!879421 () Bool)

(declare-fun res!597181 () Bool)

(assert (=> b!879421 (=> (not res!597181) (not e!489517))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!879421 (= res!597181 (and (= (select (arr!24601 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27861 () Bool)

(assert (=> mapIsEmpty!27861 mapRes!27861))

(declare-fun b!879422 () Bool)

(declare-fun res!597184 () Bool)

(assert (=> b!879422 (=> (not res!597184) (not e!489517))))

(declare-datatypes ((List!17402 0))(
  ( (Nil!17399) (Cons!17398 (h!18535 (_ BitVec 64)) (t!24483 List!17402)) )
))
(declare-fun arrayNoDuplicates!0 (array!51159 (_ BitVec 32) List!17402) Bool)

(assert (=> b!879422 (= res!597184 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17399))))

(declare-fun mapNonEmpty!27861 () Bool)

(declare-fun tp!53441 () Bool)

(assert (=> mapNonEmpty!27861 (= mapRes!27861 (and tp!53441 e!489513))))

(declare-fun mapValue!27861 () ValueCell!8309)

(declare-fun mapKey!27861 () (_ BitVec 32))

(declare-fun mapRest!27861 () (Array (_ BitVec 32) ValueCell!8309))

(assert (=> mapNonEmpty!27861 (= (arr!24602 _values!688) (store mapRest!27861 mapKey!27861 mapValue!27861))))

(declare-fun b!879423 () Bool)

(declare-fun res!597179 () Bool)

(assert (=> b!879423 (=> (not res!597179) (not e!489517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879423 (= res!597179 (validKeyInArray!0 k0!854))))

(assert (= (and start!74732 res!597180) b!879420))

(assert (= (and b!879420 res!597177) b!879413))

(assert (= (and b!879413 res!597182) b!879417))

(assert (= (and b!879417 res!597178) b!879422))

(assert (= (and b!879422 res!597184) b!879416))

(assert (= (and b!879416 res!597183) b!879423))

(assert (= (and b!879423 res!597179) b!879421))

(assert (= (and b!879421 res!597181) b!879418))

(assert (= (and b!879419 condMapEmpty!27861) mapIsEmpty!27861))

(assert (= (and b!879419 (not condMapEmpty!27861)) mapNonEmpty!27861))

(get-info :version)

(assert (= (and mapNonEmpty!27861 ((_ is ValueCellFull!8309) mapValue!27861)) b!879414))

(assert (= (and b!879419 ((_ is ValueCellFull!8309) mapDefault!27861)) b!879415))

(assert (= start!74732 b!879419))

(declare-fun m!819651 () Bool)

(assert (=> b!879420 m!819651))

(declare-fun m!819653 () Bool)

(assert (=> b!879422 m!819653))

(declare-fun m!819655 () Bool)

(assert (=> start!74732 m!819655))

(declare-fun m!819657 () Bool)

(assert (=> start!74732 m!819657))

(declare-fun m!819659 () Bool)

(assert (=> mapNonEmpty!27861 m!819659))

(declare-fun m!819661 () Bool)

(assert (=> b!879421 m!819661))

(declare-fun m!819663 () Bool)

(assert (=> b!879423 m!819663))

(declare-fun m!819665 () Bool)

(assert (=> b!879417 m!819665))

(declare-fun m!819667 () Bool)

(assert (=> b!879418 m!819667))

(declare-fun m!819669 () Bool)

(assert (=> b!879418 m!819669))

(declare-fun m!819671 () Bool)

(assert (=> b!879418 m!819671))

(check-sat b_and!25139 (not start!74732) (not b!879420) (not b!879423) (not mapNonEmpty!27861) (not b!879422) (not b!879417) (not b!879418) tp_is_empty!17497 (not b_next!15253))
(check-sat b_and!25139 (not b_next!15253))
