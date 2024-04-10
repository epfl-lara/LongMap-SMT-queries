; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74506 () Bool)

(assert start!74506)

(declare-fun b_free!15195 () Bool)

(declare-fun b_next!15195 () Bool)

(assert (=> start!74506 (= b_free!15195 (not b_next!15195))))

(declare-fun tp!53267 () Bool)

(declare-fun b_and!25071 () Bool)

(assert (=> start!74506 (= tp!53267 b_and!25071)))

(declare-fun b!877553 () Bool)

(declare-fun res!596144 () Bool)

(declare-fun e!488500 () Bool)

(assert (=> b!877553 (=> (not res!596144) (not e!488500))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877553 (= res!596144 (validKeyInArray!0 k0!854))))

(declare-fun b!877554 () Bool)

(declare-fun e!488496 () Bool)

(declare-fun e!488497 () Bool)

(declare-fun mapRes!27774 () Bool)

(assert (=> b!877554 (= e!488496 (and e!488497 mapRes!27774))))

(declare-fun condMapEmpty!27774 () Bool)

(declare-datatypes ((V!28299 0))(
  ( (V!28300 (val!8767 Int)) )
))
(declare-datatypes ((ValueCell!8280 0))(
  ( (ValueCellFull!8280 (v!11207 V!28299)) (EmptyCell!8280) )
))
(declare-datatypes ((array!51006 0))(
  ( (array!51007 (arr!24529 (Array (_ BitVec 32) ValueCell!8280)) (size!24969 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51006)

(declare-fun mapDefault!27774 () ValueCell!8280)

(assert (=> b!877554 (= condMapEmpty!27774 (= (arr!24529 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8280)) mapDefault!27774)))))

(declare-fun b!877555 () Bool)

(declare-fun res!596142 () Bool)

(assert (=> b!877555 (=> (not res!596142) (not e!488500))))

(declare-datatypes ((array!51008 0))(
  ( (array!51009 (arr!24530 (Array (_ BitVec 32) (_ BitVec 64))) (size!24970 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51008)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51008 (_ BitVec 32)) Bool)

(assert (=> b!877555 (= res!596142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877556 () Bool)

(declare-fun res!596139 () Bool)

(assert (=> b!877556 (=> (not res!596139) (not e!488500))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!877556 (= res!596139 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24970 _keys!868))))))

(declare-fun b!877557 () Bool)

(declare-fun res!596137 () Bool)

(assert (=> b!877557 (=> (not res!596137) (not e!488500))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877557 (= res!596137 (and (= (select (arr!24530 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877558 () Bool)

(declare-fun res!596140 () Bool)

(assert (=> b!877558 (=> (not res!596140) (not e!488500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877558 (= res!596140 (validMask!0 mask!1196))))

(declare-fun res!596138 () Bool)

(assert (=> start!74506 (=> (not res!596138) (not e!488500))))

(assert (=> start!74506 (= res!596138 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24970 _keys!868))))))

(assert (=> start!74506 e!488500))

(declare-fun tp_is_empty!17439 () Bool)

(assert (=> start!74506 tp_is_empty!17439))

(assert (=> start!74506 true))

(assert (=> start!74506 tp!53267))

(declare-fun array_inv!19336 (array!51008) Bool)

(assert (=> start!74506 (array_inv!19336 _keys!868)))

(declare-fun array_inv!19337 (array!51006) Bool)

(assert (=> start!74506 (and (array_inv!19337 _values!688) e!488496)))

(declare-fun b!877559 () Bool)

(declare-fun e!488498 () Bool)

(assert (=> b!877559 (= e!488498 tp_is_empty!17439)))

(declare-fun b!877560 () Bool)

(assert (=> b!877560 (= e!488500 false)))

(declare-fun v!557 () V!28299)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28299)

(declare-datatypes ((tuple2!11592 0))(
  ( (tuple2!11593 (_1!5807 (_ BitVec 64)) (_2!5807 V!28299)) )
))
(declare-datatypes ((List!17408 0))(
  ( (Nil!17405) (Cons!17404 (h!18535 tuple2!11592) (t!24497 List!17408)) )
))
(declare-datatypes ((ListLongMap!10361 0))(
  ( (ListLongMap!10362 (toList!5196 List!17408)) )
))
(declare-fun lt!397094 () ListLongMap!10361)

(declare-fun zeroValue!654 () V!28299)

(declare-fun getCurrentListMapNoExtraKeys!3163 (array!51008 array!51006 (_ BitVec 32) (_ BitVec 32) V!28299 V!28299 (_ BitVec 32) Int) ListLongMap!10361)

(assert (=> b!877560 (= lt!397094 (getCurrentListMapNoExtraKeys!3163 _keys!868 (array!51007 (store (arr!24529 _values!688) i!612 (ValueCellFull!8280 v!557)) (size!24969 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397095 () ListLongMap!10361)

(assert (=> b!877560 (= lt!397095 (getCurrentListMapNoExtraKeys!3163 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877561 () Bool)

(declare-fun res!596143 () Bool)

(assert (=> b!877561 (=> (not res!596143) (not e!488500))))

(declare-datatypes ((List!17409 0))(
  ( (Nil!17406) (Cons!17405 (h!18536 (_ BitVec 64)) (t!24498 List!17409)) )
))
(declare-fun arrayNoDuplicates!0 (array!51008 (_ BitVec 32) List!17409) Bool)

(assert (=> b!877561 (= res!596143 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17406))))

(declare-fun b!877562 () Bool)

(assert (=> b!877562 (= e!488497 tp_is_empty!17439)))

(declare-fun b!877563 () Bool)

(declare-fun res!596141 () Bool)

(assert (=> b!877563 (=> (not res!596141) (not e!488500))))

(assert (=> b!877563 (= res!596141 (and (= (size!24969 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24970 _keys!868) (size!24969 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27774 () Bool)

(assert (=> mapIsEmpty!27774 mapRes!27774))

(declare-fun mapNonEmpty!27774 () Bool)

(declare-fun tp!53266 () Bool)

(assert (=> mapNonEmpty!27774 (= mapRes!27774 (and tp!53266 e!488498))))

(declare-fun mapKey!27774 () (_ BitVec 32))

(declare-fun mapValue!27774 () ValueCell!8280)

(declare-fun mapRest!27774 () (Array (_ BitVec 32) ValueCell!8280))

(assert (=> mapNonEmpty!27774 (= (arr!24529 _values!688) (store mapRest!27774 mapKey!27774 mapValue!27774))))

(assert (= (and start!74506 res!596138) b!877558))

(assert (= (and b!877558 res!596140) b!877563))

(assert (= (and b!877563 res!596141) b!877555))

(assert (= (and b!877555 res!596142) b!877561))

(assert (= (and b!877561 res!596143) b!877556))

(assert (= (and b!877556 res!596139) b!877553))

(assert (= (and b!877553 res!596144) b!877557))

(assert (= (and b!877557 res!596137) b!877560))

(assert (= (and b!877554 condMapEmpty!27774) mapIsEmpty!27774))

(assert (= (and b!877554 (not condMapEmpty!27774)) mapNonEmpty!27774))

(get-info :version)

(assert (= (and mapNonEmpty!27774 ((_ is ValueCellFull!8280) mapValue!27774)) b!877559))

(assert (= (and b!877554 ((_ is ValueCellFull!8280) mapDefault!27774)) b!877562))

(assert (= start!74506 b!877554))

(declare-fun m!817719 () Bool)

(assert (=> b!877557 m!817719))

(declare-fun m!817721 () Bool)

(assert (=> b!877553 m!817721))

(declare-fun m!817723 () Bool)

(assert (=> b!877558 m!817723))

(declare-fun m!817725 () Bool)

(assert (=> mapNonEmpty!27774 m!817725))

(declare-fun m!817727 () Bool)

(assert (=> b!877561 m!817727))

(declare-fun m!817729 () Bool)

(assert (=> b!877555 m!817729))

(declare-fun m!817731 () Bool)

(assert (=> b!877560 m!817731))

(declare-fun m!817733 () Bool)

(assert (=> b!877560 m!817733))

(declare-fun m!817735 () Bool)

(assert (=> b!877560 m!817735))

(declare-fun m!817737 () Bool)

(assert (=> start!74506 m!817737))

(declare-fun m!817739 () Bool)

(assert (=> start!74506 m!817739))

(check-sat (not mapNonEmpty!27774) (not start!74506) tp_is_empty!17439 b_and!25071 (not b!877561) (not b!877558) (not b!877560) (not b!877553) (not b!877555) (not b_next!15195))
(check-sat b_and!25071 (not b_next!15195))
