; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74744 () Bool)

(assert start!74744)

(declare-fun b_free!15265 () Bool)

(declare-fun b_next!15265 () Bool)

(assert (=> start!74744 (= b_free!15265 (not b_next!15265))))

(declare-fun tp!53477 () Bool)

(declare-fun b_and!25151 () Bool)

(assert (=> start!74744 (= tp!53477 b_and!25151)))

(declare-fun b!879613 () Bool)

(declare-fun res!597327 () Bool)

(declare-fun e!489607 () Bool)

(assert (=> b!879613 (=> (not res!597327) (not e!489607))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51183 0))(
  ( (array!51184 (arr!24613 (Array (_ BitVec 32) (_ BitVec 64))) (size!25054 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51183)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879613 (= res!597327 (and (= (select (arr!24613 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879614 () Bool)

(declare-fun res!597323 () Bool)

(assert (=> b!879614 (=> (not res!597323) (not e!489607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879614 (= res!597323 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27879 () Bool)

(declare-fun mapRes!27879 () Bool)

(declare-fun tp!53478 () Bool)

(declare-fun e!489608 () Bool)

(assert (=> mapNonEmpty!27879 (= mapRes!27879 (and tp!53478 e!489608))))

(declare-fun mapKey!27879 () (_ BitVec 32))

(declare-datatypes ((V!28393 0))(
  ( (V!28394 (val!8802 Int)) )
))
(declare-datatypes ((ValueCell!8315 0))(
  ( (ValueCellFull!8315 (v!11242 V!28393)) (EmptyCell!8315) )
))
(declare-fun mapValue!27879 () ValueCell!8315)

(declare-fun mapRest!27879 () (Array (_ BitVec 32) ValueCell!8315))

(declare-datatypes ((array!51185 0))(
  ( (array!51186 (arr!24614 (Array (_ BitVec 32) ValueCell!8315)) (size!25055 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51185)

(assert (=> mapNonEmpty!27879 (= (arr!24614 _values!688) (store mapRest!27879 mapKey!27879 mapValue!27879))))

(declare-fun b!879615 () Bool)

(declare-fun tp_is_empty!17509 () Bool)

(assert (=> b!879615 (= e!489608 tp_is_empty!17509)))

(declare-fun b!879617 () Bool)

(declare-fun e!489606 () Bool)

(assert (=> b!879617 (= e!489606 (not (bvslt from!1053 (size!25054 _keys!868))))))

(declare-fun v!557 () V!28393)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397671 () array!51185)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28393)

(declare-fun zeroValue!654 () V!28393)

(declare-datatypes ((tuple2!11576 0))(
  ( (tuple2!11577 (_1!5799 (_ BitVec 64)) (_2!5799 V!28393)) )
))
(declare-datatypes ((List!17411 0))(
  ( (Nil!17408) (Cons!17407 (h!18544 tuple2!11576) (t!24492 List!17411)) )
))
(declare-datatypes ((ListLongMap!10347 0))(
  ( (ListLongMap!10348 (toList!5189 List!17411)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3231 (array!51183 array!51185 (_ BitVec 32) (_ BitVec 32) V!28393 V!28393 (_ BitVec 32) Int) ListLongMap!10347)

(declare-fun +!2507 (ListLongMap!10347 tuple2!11576) ListLongMap!10347)

(assert (=> b!879617 (= (getCurrentListMapNoExtraKeys!3231 _keys!868 lt!397671 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2507 (getCurrentListMapNoExtraKeys!3231 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11577 k0!854 v!557)))))

(declare-datatypes ((Unit!29986 0))(
  ( (Unit!29987) )
))
(declare-fun lt!397670 () Unit!29986)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!675 (array!51183 array!51185 (_ BitVec 32) (_ BitVec 32) V!28393 V!28393 (_ BitVec 32) (_ BitVec 64) V!28393 (_ BitVec 32) Int) Unit!29986)

(assert (=> b!879617 (= lt!397670 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!675 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879618 () Bool)

(declare-fun res!597330 () Bool)

(assert (=> b!879618 (=> (not res!597330) (not e!489607))))

(declare-datatypes ((List!17412 0))(
  ( (Nil!17409) (Cons!17408 (h!18545 (_ BitVec 64)) (t!24493 List!17412)) )
))
(declare-fun arrayNoDuplicates!0 (array!51183 (_ BitVec 32) List!17412) Bool)

(assert (=> b!879618 (= res!597330 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17409))))

(declare-fun b!879619 () Bool)

(declare-fun res!597329 () Bool)

(assert (=> b!879619 (=> (not res!597329) (not e!489607))))

(assert (=> b!879619 (= res!597329 (and (= (size!25055 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25054 _keys!868) (size!25055 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879620 () Bool)

(declare-fun e!489605 () Bool)

(declare-fun e!489610 () Bool)

(assert (=> b!879620 (= e!489605 (and e!489610 mapRes!27879))))

(declare-fun condMapEmpty!27879 () Bool)

(declare-fun mapDefault!27879 () ValueCell!8315)

(assert (=> b!879620 (= condMapEmpty!27879 (= (arr!24614 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8315)) mapDefault!27879)))))

(declare-fun mapIsEmpty!27879 () Bool)

(assert (=> mapIsEmpty!27879 mapRes!27879))

(declare-fun b!879621 () Bool)

(assert (=> b!879621 (= e!489607 e!489606)))

(declare-fun res!597328 () Bool)

(assert (=> b!879621 (=> (not res!597328) (not e!489606))))

(assert (=> b!879621 (= res!597328 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397669 () ListLongMap!10347)

(assert (=> b!879621 (= lt!397669 (getCurrentListMapNoExtraKeys!3231 _keys!868 lt!397671 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879621 (= lt!397671 (array!51186 (store (arr!24614 _values!688) i!612 (ValueCellFull!8315 v!557)) (size!25055 _values!688)))))

(declare-fun lt!397672 () ListLongMap!10347)

(assert (=> b!879621 (= lt!397672 (getCurrentListMapNoExtraKeys!3231 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879616 () Bool)

(declare-fun res!597326 () Bool)

(assert (=> b!879616 (=> (not res!597326) (not e!489607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879616 (= res!597326 (validMask!0 mask!1196))))

(declare-fun res!597325 () Bool)

(assert (=> start!74744 (=> (not res!597325) (not e!489607))))

(assert (=> start!74744 (= res!597325 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25054 _keys!868))))))

(assert (=> start!74744 e!489607))

(assert (=> start!74744 tp_is_empty!17509))

(assert (=> start!74744 true))

(assert (=> start!74744 tp!53477))

(declare-fun array_inv!19434 (array!51183) Bool)

(assert (=> start!74744 (array_inv!19434 _keys!868)))

(declare-fun array_inv!19435 (array!51185) Bool)

(assert (=> start!74744 (and (array_inv!19435 _values!688) e!489605)))

(declare-fun b!879622 () Bool)

(declare-fun res!597331 () Bool)

(assert (=> b!879622 (=> (not res!597331) (not e!489607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51183 (_ BitVec 32)) Bool)

(assert (=> b!879622 (= res!597331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879623 () Bool)

(declare-fun res!597324 () Bool)

(assert (=> b!879623 (=> (not res!597324) (not e!489607))))

(assert (=> b!879623 (= res!597324 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25054 _keys!868))))))

(declare-fun b!879624 () Bool)

(assert (=> b!879624 (= e!489610 tp_is_empty!17509)))

(assert (= (and start!74744 res!597325) b!879616))

(assert (= (and b!879616 res!597326) b!879619))

(assert (= (and b!879619 res!597329) b!879622))

(assert (= (and b!879622 res!597331) b!879618))

(assert (= (and b!879618 res!597330) b!879623))

(assert (= (and b!879623 res!597324) b!879614))

(assert (= (and b!879614 res!597323) b!879613))

(assert (= (and b!879613 res!597327) b!879621))

(assert (= (and b!879621 res!597328) b!879617))

(assert (= (and b!879620 condMapEmpty!27879) mapIsEmpty!27879))

(assert (= (and b!879620 (not condMapEmpty!27879)) mapNonEmpty!27879))

(get-info :version)

(assert (= (and mapNonEmpty!27879 ((_ is ValueCellFull!8315) mapValue!27879)) b!879615))

(assert (= (and b!879620 ((_ is ValueCellFull!8315) mapDefault!27879)) b!879624))

(assert (= start!74744 b!879620))

(declare-fun m!819783 () Bool)

(assert (=> start!74744 m!819783))

(declare-fun m!819785 () Bool)

(assert (=> start!74744 m!819785))

(declare-fun m!819787 () Bool)

(assert (=> b!879616 m!819787))

(declare-fun m!819789 () Bool)

(assert (=> b!879613 m!819789))

(declare-fun m!819791 () Bool)

(assert (=> b!879622 m!819791))

(declare-fun m!819793 () Bool)

(assert (=> mapNonEmpty!27879 m!819793))

(declare-fun m!819795 () Bool)

(assert (=> b!879618 m!819795))

(declare-fun m!819797 () Bool)

(assert (=> b!879614 m!819797))

(declare-fun m!819799 () Bool)

(assert (=> b!879621 m!819799))

(declare-fun m!819801 () Bool)

(assert (=> b!879621 m!819801))

(declare-fun m!819803 () Bool)

(assert (=> b!879621 m!819803))

(declare-fun m!819805 () Bool)

(assert (=> b!879617 m!819805))

(declare-fun m!819807 () Bool)

(assert (=> b!879617 m!819807))

(assert (=> b!879617 m!819807))

(declare-fun m!819809 () Bool)

(assert (=> b!879617 m!819809))

(declare-fun m!819811 () Bool)

(assert (=> b!879617 m!819811))

(check-sat (not start!74744) (not mapNonEmpty!27879) (not b!879622) (not b!879617) (not b!879621) (not b!879614) (not b_next!15265) tp_is_empty!17509 b_and!25151 (not b!879618) (not b!879616))
(check-sat b_and!25151 (not b_next!15265))
