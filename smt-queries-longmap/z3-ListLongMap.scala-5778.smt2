; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74738 () Bool)

(assert start!74738)

(declare-fun b_free!15259 () Bool)

(declare-fun b_next!15259 () Bool)

(assert (=> start!74738 (= b_free!15259 (not b_next!15259))))

(declare-fun tp!53460 () Bool)

(declare-fun b_and!25145 () Bool)

(assert (=> start!74738 (= tp!53460 b_and!25145)))

(declare-fun b!879512 () Bool)

(declare-fun res!597252 () Bool)

(declare-fun e!489559 () Bool)

(assert (=> b!879512 (=> (not res!597252) (not e!489559))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879512 (= res!597252 (validKeyInArray!0 k0!854))))

(declare-fun b!879513 () Bool)

(declare-fun res!597253 () Bool)

(assert (=> b!879513 (=> (not res!597253) (not e!489559))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51171 0))(
  ( (array!51172 (arr!24607 (Array (_ BitVec 32) (_ BitVec 64))) (size!25048 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51171)

(declare-datatypes ((V!28385 0))(
  ( (V!28386 (val!8799 Int)) )
))
(declare-datatypes ((ValueCell!8312 0))(
  ( (ValueCellFull!8312 (v!11239 V!28385)) (EmptyCell!8312) )
))
(declare-datatypes ((array!51173 0))(
  ( (array!51174 (arr!24608 (Array (_ BitVec 32) ValueCell!8312)) (size!25049 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51173)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!879513 (= res!597253 (and (= (size!25049 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25048 _keys!868) (size!25049 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879514 () Bool)

(declare-fun e!489560 () Bool)

(declare-fun tp_is_empty!17503 () Bool)

(assert (=> b!879514 (= e!489560 tp_is_empty!17503)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun b!879515 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879515 (= e!489559 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25048 _keys!868)) (bvsge (bvsub (size!25048 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!25048 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11572 0))(
  ( (tuple2!11573 (_1!5797 (_ BitVec 64)) (_2!5797 V!28385)) )
))
(declare-datatypes ((List!17406 0))(
  ( (Nil!17403) (Cons!17402 (h!18539 tuple2!11572) (t!24487 List!17406)) )
))
(declare-datatypes ((ListLongMap!10343 0))(
  ( (ListLongMap!10344 (toList!5187 List!17406)) )
))
(declare-fun lt!397648 () ListLongMap!10343)

(declare-fun v!557 () V!28385)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28385)

(declare-fun zeroValue!654 () V!28385)

(declare-fun getCurrentListMapNoExtraKeys!3229 (array!51171 array!51173 (_ BitVec 32) (_ BitVec 32) V!28385 V!28385 (_ BitVec 32) Int) ListLongMap!10343)

(assert (=> b!879515 (= lt!397648 (getCurrentListMapNoExtraKeys!3229 _keys!868 (array!51174 (store (arr!24608 _values!688) i!612 (ValueCellFull!8312 v!557)) (size!25049 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397647 () ListLongMap!10343)

(assert (=> b!879515 (= lt!397647 (getCurrentListMapNoExtraKeys!3229 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879516 () Bool)

(declare-fun res!597254 () Bool)

(assert (=> b!879516 (=> (not res!597254) (not e!489559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51171 (_ BitVec 32)) Bool)

(assert (=> b!879516 (= res!597254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879517 () Bool)

(declare-fun res!597249 () Bool)

(assert (=> b!879517 (=> (not res!597249) (not e!489559))))

(declare-datatypes ((List!17407 0))(
  ( (Nil!17404) (Cons!17403 (h!18540 (_ BitVec 64)) (t!24488 List!17407)) )
))
(declare-fun arrayNoDuplicates!0 (array!51171 (_ BitVec 32) List!17407) Bool)

(assert (=> b!879517 (= res!597249 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17404))))

(declare-fun mapIsEmpty!27870 () Bool)

(declare-fun mapRes!27870 () Bool)

(assert (=> mapIsEmpty!27870 mapRes!27870))

(declare-fun mapNonEmpty!27870 () Bool)

(declare-fun tp!53459 () Bool)

(declare-fun e!489558 () Bool)

(assert (=> mapNonEmpty!27870 (= mapRes!27870 (and tp!53459 e!489558))))

(declare-fun mapKey!27870 () (_ BitVec 32))

(declare-fun mapValue!27870 () ValueCell!8312)

(declare-fun mapRest!27870 () (Array (_ BitVec 32) ValueCell!8312))

(assert (=> mapNonEmpty!27870 (= (arr!24608 _values!688) (store mapRest!27870 mapKey!27870 mapValue!27870))))

(declare-fun res!597250 () Bool)

(assert (=> start!74738 (=> (not res!597250) (not e!489559))))

(assert (=> start!74738 (= res!597250 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25048 _keys!868))))))

(assert (=> start!74738 e!489559))

(assert (=> start!74738 tp_is_empty!17503))

(assert (=> start!74738 true))

(assert (=> start!74738 tp!53460))

(declare-fun array_inv!19430 (array!51171) Bool)

(assert (=> start!74738 (array_inv!19430 _keys!868)))

(declare-fun e!489562 () Bool)

(declare-fun array_inv!19431 (array!51173) Bool)

(assert (=> start!74738 (and (array_inv!19431 _values!688) e!489562)))

(declare-fun b!879518 () Bool)

(assert (=> b!879518 (= e!489562 (and e!489560 mapRes!27870))))

(declare-fun condMapEmpty!27870 () Bool)

(declare-fun mapDefault!27870 () ValueCell!8312)

(assert (=> b!879518 (= condMapEmpty!27870 (= (arr!24608 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8312)) mapDefault!27870)))))

(declare-fun b!879519 () Bool)

(declare-fun res!597255 () Bool)

(assert (=> b!879519 (=> (not res!597255) (not e!489559))))

(assert (=> b!879519 (= res!597255 (and (= (select (arr!24607 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879520 () Bool)

(declare-fun res!597256 () Bool)

(assert (=> b!879520 (=> (not res!597256) (not e!489559))))

(assert (=> b!879520 (= res!597256 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25048 _keys!868))))))

(declare-fun b!879521 () Bool)

(declare-fun res!597251 () Bool)

(assert (=> b!879521 (=> (not res!597251) (not e!489559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879521 (= res!597251 (validMask!0 mask!1196))))

(declare-fun b!879522 () Bool)

(assert (=> b!879522 (= e!489558 tp_is_empty!17503)))

(assert (= (and start!74738 res!597250) b!879521))

(assert (= (and b!879521 res!597251) b!879513))

(assert (= (and b!879513 res!597253) b!879516))

(assert (= (and b!879516 res!597254) b!879517))

(assert (= (and b!879517 res!597249) b!879520))

(assert (= (and b!879520 res!597256) b!879512))

(assert (= (and b!879512 res!597252) b!879519))

(assert (= (and b!879519 res!597255) b!879515))

(assert (= (and b!879518 condMapEmpty!27870) mapIsEmpty!27870))

(assert (= (and b!879518 (not condMapEmpty!27870)) mapNonEmpty!27870))

(get-info :version)

(assert (= (and mapNonEmpty!27870 ((_ is ValueCellFull!8312) mapValue!27870)) b!879522))

(assert (= (and b!879518 ((_ is ValueCellFull!8312) mapDefault!27870)) b!879514))

(assert (= start!74738 b!879518))

(declare-fun m!819717 () Bool)

(assert (=> b!879516 m!819717))

(declare-fun m!819719 () Bool)

(assert (=> b!879515 m!819719))

(declare-fun m!819721 () Bool)

(assert (=> b!879515 m!819721))

(declare-fun m!819723 () Bool)

(assert (=> b!879515 m!819723))

(declare-fun m!819725 () Bool)

(assert (=> mapNonEmpty!27870 m!819725))

(declare-fun m!819727 () Bool)

(assert (=> start!74738 m!819727))

(declare-fun m!819729 () Bool)

(assert (=> start!74738 m!819729))

(declare-fun m!819731 () Bool)

(assert (=> b!879521 m!819731))

(declare-fun m!819733 () Bool)

(assert (=> b!879517 m!819733))

(declare-fun m!819735 () Bool)

(assert (=> b!879519 m!819735))

(declare-fun m!819737 () Bool)

(assert (=> b!879512 m!819737))

(check-sat b_and!25145 (not mapNonEmpty!27870) (not b!879515) (not b!879516) (not b!879512) tp_is_empty!17503 (not b!879521) (not start!74738) (not b!879517) (not b_next!15259))
(check-sat b_and!25145 (not b_next!15259))
