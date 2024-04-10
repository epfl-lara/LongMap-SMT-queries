; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74270 () Bool)

(assert start!74270)

(declare-fun b_free!15033 () Bool)

(declare-fun b_next!15033 () Bool)

(assert (=> start!74270 (= b_free!15033 (not b_next!15033))))

(declare-fun tp!52773 () Bool)

(declare-fun b_and!24809 () Bool)

(assert (=> start!74270 (= tp!52773 b_and!24809)))

(declare-fun b!873719 () Bool)

(declare-fun e!486544 () Bool)

(declare-fun tp_is_empty!17277 () Bool)

(assert (=> b!873719 (= e!486544 tp_is_empty!17277)))

(declare-fun b!873720 () Bool)

(declare-fun res!593728 () Bool)

(declare-fun e!486541 () Bool)

(assert (=> b!873720 (=> (not res!593728) (not e!486541))))

(declare-datatypes ((array!50682 0))(
  ( (array!50683 (arr!24369 (Array (_ BitVec 32) (_ BitVec 64))) (size!24809 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50682)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50682 (_ BitVec 32)) Bool)

(assert (=> b!873720 (= res!593728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27524 () Bool)

(declare-fun mapRes!27524 () Bool)

(declare-fun tp!52774 () Bool)

(declare-fun e!486545 () Bool)

(assert (=> mapNonEmpty!27524 (= mapRes!27524 (and tp!52774 e!486545))))

(declare-datatypes ((V!28083 0))(
  ( (V!28084 (val!8686 Int)) )
))
(declare-datatypes ((ValueCell!8199 0))(
  ( (ValueCellFull!8199 (v!11115 V!28083)) (EmptyCell!8199) )
))
(declare-fun mapRest!27524 () (Array (_ BitVec 32) ValueCell!8199))

(declare-fun mapKey!27524 () (_ BitVec 32))

(declare-fun mapValue!27524 () ValueCell!8199)

(declare-datatypes ((array!50684 0))(
  ( (array!50685 (arr!24370 (Array (_ BitVec 32) ValueCell!8199)) (size!24810 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50684)

(assert (=> mapNonEmpty!27524 (= (arr!24370 _values!688) (store mapRest!27524 mapKey!27524 mapValue!27524))))

(declare-fun b!873721 () Bool)

(declare-fun res!593727 () Bool)

(assert (=> b!873721 (=> (not res!593727) (not e!486541))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!873721 (= res!593727 (and (= (select (arr!24369 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27524 () Bool)

(assert (=> mapIsEmpty!27524 mapRes!27524))

(declare-fun b!873722 () Bool)

(declare-fun res!593729 () Bool)

(assert (=> b!873722 (=> (not res!593729) (not e!486541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873722 (= res!593729 (validKeyInArray!0 k0!854))))

(declare-fun b!873723 () Bool)

(declare-fun res!593723 () Bool)

(assert (=> b!873723 (=> (not res!593723) (not e!486541))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873723 (= res!593723 (and (= (size!24810 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24809 _keys!868) (size!24810 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!593724 () Bool)

(assert (=> start!74270 (=> (not res!593724) (not e!486541))))

(assert (=> start!74270 (= res!593724 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24809 _keys!868))))))

(assert (=> start!74270 e!486541))

(assert (=> start!74270 tp_is_empty!17277))

(assert (=> start!74270 true))

(assert (=> start!74270 tp!52773))

(declare-fun array_inv!19224 (array!50682) Bool)

(assert (=> start!74270 (array_inv!19224 _keys!868)))

(declare-fun e!486543 () Bool)

(declare-fun array_inv!19225 (array!50684) Bool)

(assert (=> start!74270 (and (array_inv!19225 _values!688) e!486543)))

(declare-fun b!873724 () Bool)

(declare-fun res!593725 () Bool)

(assert (=> b!873724 (=> (not res!593725) (not e!486541))))

(assert (=> b!873724 (= res!593725 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24809 _keys!868))))))

(declare-fun b!873725 () Bool)

(assert (=> b!873725 (= e!486541 (and (= from!1053 i!612) (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24809 _keys!868)))))))

(declare-fun v!557 () V!28083)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11480 0))(
  ( (tuple2!11481 (_1!5751 (_ BitVec 64)) (_2!5751 V!28083)) )
))
(declare-datatypes ((List!17297 0))(
  ( (Nil!17294) (Cons!17293 (h!18424 tuple2!11480) (t!24338 List!17297)) )
))
(declare-datatypes ((ListLongMap!10249 0))(
  ( (ListLongMap!10250 (toList!5140 List!17297)) )
))
(declare-fun lt!395813 () ListLongMap!10249)

(declare-fun minValue!654 () V!28083)

(declare-fun zeroValue!654 () V!28083)

(declare-fun getCurrentListMapNoExtraKeys!3107 (array!50682 array!50684 (_ BitVec 32) (_ BitVec 32) V!28083 V!28083 (_ BitVec 32) Int) ListLongMap!10249)

(assert (=> b!873725 (= lt!395813 (getCurrentListMapNoExtraKeys!3107 _keys!868 (array!50685 (store (arr!24370 _values!688) i!612 (ValueCellFull!8199 v!557)) (size!24810 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395812 () ListLongMap!10249)

(assert (=> b!873725 (= lt!395812 (getCurrentListMapNoExtraKeys!3107 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873726 () Bool)

(assert (=> b!873726 (= e!486545 tp_is_empty!17277)))

(declare-fun b!873727 () Bool)

(assert (=> b!873727 (= e!486543 (and e!486544 mapRes!27524))))

(declare-fun condMapEmpty!27524 () Bool)

(declare-fun mapDefault!27524 () ValueCell!8199)

(assert (=> b!873727 (= condMapEmpty!27524 (= (arr!24370 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8199)) mapDefault!27524)))))

(declare-fun b!873728 () Bool)

(declare-fun res!593730 () Bool)

(assert (=> b!873728 (=> (not res!593730) (not e!486541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873728 (= res!593730 (validMask!0 mask!1196))))

(declare-fun b!873729 () Bool)

(declare-fun res!593726 () Bool)

(assert (=> b!873729 (=> (not res!593726) (not e!486541))))

(declare-datatypes ((List!17298 0))(
  ( (Nil!17295) (Cons!17294 (h!18425 (_ BitVec 64)) (t!24339 List!17298)) )
))
(declare-fun arrayNoDuplicates!0 (array!50682 (_ BitVec 32) List!17298) Bool)

(assert (=> b!873729 (= res!593726 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17295))))

(assert (= (and start!74270 res!593724) b!873728))

(assert (= (and b!873728 res!593730) b!873723))

(assert (= (and b!873723 res!593723) b!873720))

(assert (= (and b!873720 res!593728) b!873729))

(assert (= (and b!873729 res!593726) b!873724))

(assert (= (and b!873724 res!593725) b!873722))

(assert (= (and b!873722 res!593729) b!873721))

(assert (= (and b!873721 res!593727) b!873725))

(assert (= (and b!873727 condMapEmpty!27524) mapIsEmpty!27524))

(assert (= (and b!873727 (not condMapEmpty!27524)) mapNonEmpty!27524))

(get-info :version)

(assert (= (and mapNonEmpty!27524 ((_ is ValueCellFull!8199) mapValue!27524)) b!873726))

(assert (= (and b!873727 ((_ is ValueCellFull!8199) mapDefault!27524)) b!873719))

(assert (= start!74270 b!873727))

(declare-fun m!814127 () Bool)

(assert (=> b!873729 m!814127))

(declare-fun m!814129 () Bool)

(assert (=> mapNonEmpty!27524 m!814129))

(declare-fun m!814131 () Bool)

(assert (=> b!873721 m!814131))

(declare-fun m!814133 () Bool)

(assert (=> start!74270 m!814133))

(declare-fun m!814135 () Bool)

(assert (=> start!74270 m!814135))

(declare-fun m!814137 () Bool)

(assert (=> b!873725 m!814137))

(declare-fun m!814139 () Bool)

(assert (=> b!873725 m!814139))

(declare-fun m!814141 () Bool)

(assert (=> b!873725 m!814141))

(declare-fun m!814143 () Bool)

(assert (=> b!873720 m!814143))

(declare-fun m!814145 () Bool)

(assert (=> b!873722 m!814145))

(declare-fun m!814147 () Bool)

(assert (=> b!873728 m!814147))

(check-sat b_and!24809 (not b!873729) (not b_next!15033) (not start!74270) (not b!873722) (not b!873725) (not mapNonEmpty!27524) (not b!873728) tp_is_empty!17277 (not b!873720))
(check-sat b_and!24809 (not b_next!15033))
