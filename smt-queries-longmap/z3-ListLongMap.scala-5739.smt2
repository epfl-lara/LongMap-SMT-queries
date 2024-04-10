; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74264 () Bool)

(assert start!74264)

(declare-fun b_free!15027 () Bool)

(declare-fun b_next!15027 () Bool)

(assert (=> start!74264 (= b_free!15027 (not b_next!15027))))

(declare-fun tp!52756 () Bool)

(declare-fun b_and!24803 () Bool)

(assert (=> start!74264 (= tp!52756 b_and!24803)))

(declare-fun b!873620 () Bool)

(declare-fun res!593652 () Bool)

(declare-fun e!486498 () Bool)

(assert (=> b!873620 (=> (not res!593652) (not e!486498))))

(declare-datatypes ((array!50670 0))(
  ( (array!50671 (arr!24363 (Array (_ BitVec 32) (_ BitVec 64))) (size!24803 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50670)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50670 (_ BitVec 32)) Bool)

(assert (=> b!873620 (= res!593652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!593657 () Bool)

(assert (=> start!74264 (=> (not res!593657) (not e!486498))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74264 (= res!593657 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24803 _keys!868))))))

(assert (=> start!74264 e!486498))

(assert (=> start!74264 true))

(assert (=> start!74264 tp!52756))

(declare-fun array_inv!19220 (array!50670) Bool)

(assert (=> start!74264 (array_inv!19220 _keys!868)))

(declare-datatypes ((V!28075 0))(
  ( (V!28076 (val!8683 Int)) )
))
(declare-datatypes ((ValueCell!8196 0))(
  ( (ValueCellFull!8196 (v!11112 V!28075)) (EmptyCell!8196) )
))
(declare-datatypes ((array!50672 0))(
  ( (array!50673 (arr!24364 (Array (_ BitVec 32) ValueCell!8196)) (size!24804 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50672)

(declare-fun e!486499 () Bool)

(declare-fun array_inv!19221 (array!50672) Bool)

(assert (=> start!74264 (and (array_inv!19221 _values!688) e!486499)))

(declare-fun tp_is_empty!17271 () Bool)

(assert (=> start!74264 tp_is_empty!17271))

(declare-fun mapIsEmpty!27515 () Bool)

(declare-fun mapRes!27515 () Bool)

(assert (=> mapIsEmpty!27515 mapRes!27515))

(declare-fun b!873621 () Bool)

(declare-fun res!593654 () Bool)

(assert (=> b!873621 (=> (not res!593654) (not e!486498))))

(declare-datatypes ((List!17295 0))(
  ( (Nil!17292) (Cons!17291 (h!18422 (_ BitVec 64)) (t!24336 List!17295)) )
))
(declare-fun arrayNoDuplicates!0 (array!50670 (_ BitVec 32) List!17295) Bool)

(assert (=> b!873621 (= res!593654 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17292))))

(declare-fun mapNonEmpty!27515 () Bool)

(declare-fun tp!52755 () Bool)

(declare-fun e!486496 () Bool)

(assert (=> mapNonEmpty!27515 (= mapRes!27515 (and tp!52755 e!486496))))

(declare-fun mapKey!27515 () (_ BitVec 32))

(declare-fun mapValue!27515 () ValueCell!8196)

(declare-fun mapRest!27515 () (Array (_ BitVec 32) ValueCell!8196))

(assert (=> mapNonEmpty!27515 (= (arr!24364 _values!688) (store mapRest!27515 mapKey!27515 mapValue!27515))))

(declare-fun b!873622 () Bool)

(declare-fun res!593656 () Bool)

(assert (=> b!873622 (=> (not res!593656) (not e!486498))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873622 (= res!593656 (and (= (size!24804 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24803 _keys!868) (size!24804 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873623 () Bool)

(declare-fun res!593655 () Bool)

(assert (=> b!873623 (=> (not res!593655) (not e!486498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873623 (= res!593655 (validMask!0 mask!1196))))

(declare-fun b!873624 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873624 (= e!486498 (bvsge i!612 (size!24804 _values!688)))))

(declare-datatypes ((tuple2!11478 0))(
  ( (tuple2!11479 (_1!5750 (_ BitVec 64)) (_2!5750 V!28075)) )
))
(declare-datatypes ((List!17296 0))(
  ( (Nil!17293) (Cons!17292 (h!18423 tuple2!11478) (t!24337 List!17296)) )
))
(declare-datatypes ((ListLongMap!10247 0))(
  ( (ListLongMap!10248 (toList!5139 List!17296)) )
))
(declare-fun lt!395798 () ListLongMap!10247)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28075)

(declare-fun zeroValue!654 () V!28075)

(declare-fun getCurrentListMapNoExtraKeys!3106 (array!50670 array!50672 (_ BitVec 32) (_ BitVec 32) V!28075 V!28075 (_ BitVec 32) Int) ListLongMap!10247)

(assert (=> b!873624 (= lt!395798 (getCurrentListMapNoExtraKeys!3106 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873625 () Bool)

(assert (=> b!873625 (= e!486496 tp_is_empty!17271)))

(declare-fun b!873626 () Bool)

(declare-fun e!486500 () Bool)

(assert (=> b!873626 (= e!486499 (and e!486500 mapRes!27515))))

(declare-fun condMapEmpty!27515 () Bool)

(declare-fun mapDefault!27515 () ValueCell!8196)

(assert (=> b!873626 (= condMapEmpty!27515 (= (arr!24364 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8196)) mapDefault!27515)))))

(declare-fun b!873627 () Bool)

(assert (=> b!873627 (= e!486500 tp_is_empty!17271)))

(declare-fun b!873628 () Bool)

(declare-fun res!593651 () Bool)

(assert (=> b!873628 (=> (not res!593651) (not e!486498))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!873628 (= res!593651 (and (= (select (arr!24363 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!873629 () Bool)

(declare-fun res!593653 () Bool)

(assert (=> b!873629 (=> (not res!593653) (not e!486498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873629 (= res!593653 (validKeyInArray!0 k0!854))))

(declare-fun b!873630 () Bool)

(declare-fun res!593658 () Bool)

(assert (=> b!873630 (=> (not res!593658) (not e!486498))))

(assert (=> b!873630 (= res!593658 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24803 _keys!868))))))

(assert (= (and start!74264 res!593657) b!873623))

(assert (= (and b!873623 res!593655) b!873622))

(assert (= (and b!873622 res!593656) b!873620))

(assert (= (and b!873620 res!593652) b!873621))

(assert (= (and b!873621 res!593654) b!873630))

(assert (= (and b!873630 res!593658) b!873629))

(assert (= (and b!873629 res!593653) b!873628))

(assert (= (and b!873628 res!593651) b!873624))

(assert (= (and b!873626 condMapEmpty!27515) mapIsEmpty!27515))

(assert (= (and b!873626 (not condMapEmpty!27515)) mapNonEmpty!27515))

(get-info :version)

(assert (= (and mapNonEmpty!27515 ((_ is ValueCellFull!8196) mapValue!27515)) b!873625))

(assert (= (and b!873626 ((_ is ValueCellFull!8196) mapDefault!27515)) b!873627))

(assert (= start!74264 b!873626))

(declare-fun m!814069 () Bool)

(assert (=> b!873620 m!814069))

(declare-fun m!814071 () Bool)

(assert (=> b!873621 m!814071))

(declare-fun m!814073 () Bool)

(assert (=> b!873623 m!814073))

(declare-fun m!814075 () Bool)

(assert (=> mapNonEmpty!27515 m!814075))

(declare-fun m!814077 () Bool)

(assert (=> b!873624 m!814077))

(declare-fun m!814079 () Bool)

(assert (=> start!74264 m!814079))

(declare-fun m!814081 () Bool)

(assert (=> start!74264 m!814081))

(declare-fun m!814083 () Bool)

(assert (=> b!873629 m!814083))

(declare-fun m!814085 () Bool)

(assert (=> b!873628 m!814085))

(check-sat (not b_next!15027) tp_is_empty!17271 (not mapNonEmpty!27515) (not start!74264) (not b!873623) (not b!873620) (not b!873621) (not b!873629) b_and!24803 (not b!873624))
(check-sat b_and!24803 (not b_next!15027))
