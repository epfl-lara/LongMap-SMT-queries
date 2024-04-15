; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74182 () Bool)

(assert start!74182)

(declare-fun b_free!15007 () Bool)

(declare-fun b_next!15007 () Bool)

(assert (=> start!74182 (= b_free!15007 (not b_next!15007))))

(declare-fun tp!52672 () Bool)

(declare-fun b_and!24733 () Bool)

(assert (=> start!74182 (= tp!52672 b_and!24733)))

(declare-fun res!593127 () Bool)

(declare-fun e!485960 () Bool)

(assert (=> start!74182 (=> (not res!593127) (not e!485960))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50595 0))(
  ( (array!50596 (arr!24328 (Array (_ BitVec 32) (_ BitVec 64))) (size!24770 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50595)

(assert (=> start!74182 (= res!593127 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24770 _keys!868))))))

(assert (=> start!74182 e!485960))

(declare-fun tp_is_empty!17239 () Bool)

(assert (=> start!74182 tp_is_empty!17239))

(assert (=> start!74182 true))

(assert (=> start!74182 tp!52672))

(declare-fun array_inv!19260 (array!50595) Bool)

(assert (=> start!74182 (array_inv!19260 _keys!868)))

(declare-datatypes ((V!28033 0))(
  ( (V!28034 (val!8667 Int)) )
))
(declare-datatypes ((ValueCell!8180 0))(
  ( (ValueCellFull!8180 (v!11086 V!28033)) (EmptyCell!8180) )
))
(declare-datatypes ((array!50597 0))(
  ( (array!50598 (arr!24329 (Array (_ BitVec 32) ValueCell!8180)) (size!24771 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50597)

(declare-fun e!485961 () Bool)

(declare-fun array_inv!19261 (array!50597) Bool)

(assert (=> start!74182 (and (array_inv!19261 _values!688) e!485961)))

(declare-fun b!872657 () Bool)

(declare-fun res!593124 () Bool)

(assert (=> b!872657 (=> (not res!593124) (not e!485960))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!872657 (= res!593124 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24770 _keys!868))))))

(declare-fun mapNonEmpty!27461 () Bool)

(declare-fun mapRes!27461 () Bool)

(declare-fun tp!52673 () Bool)

(declare-fun e!485959 () Bool)

(assert (=> mapNonEmpty!27461 (= mapRes!27461 (and tp!52673 e!485959))))

(declare-fun mapKey!27461 () (_ BitVec 32))

(declare-fun mapValue!27461 () ValueCell!8180)

(declare-fun mapRest!27461 () (Array (_ BitVec 32) ValueCell!8180))

(assert (=> mapNonEmpty!27461 (= (arr!24329 _values!688) (store mapRest!27461 mapKey!27461 mapValue!27461))))

(declare-fun b!872658 () Bool)

(assert (=> b!872658 (= e!485960 (not (bvslt i!612 (size!24771 _values!688))))))

(declare-fun e!485962 () Bool)

(assert (=> b!872658 e!485962))

(declare-fun c!92339 () Bool)

(assert (=> b!872658 (= c!92339 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28033)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28033)

(declare-fun zeroValue!654 () V!28033)

(declare-datatypes ((Unit!29865 0))(
  ( (Unit!29866) )
))
(declare-fun lt!395429 () Unit!29865)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!656 (array!50595 array!50597 (_ BitVec 32) (_ BitVec 32) V!28033 V!28033 (_ BitVec 32) (_ BitVec 64) V!28033 (_ BitVec 32) Int) Unit!29865)

(assert (=> b!872658 (= lt!395429 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!656 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872659 () Bool)

(declare-fun res!593129 () Bool)

(assert (=> b!872659 (=> (not res!593129) (not e!485960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872659 (= res!593129 (validMask!0 mask!1196))))

(declare-fun b!872660 () Bool)

(declare-fun res!593125 () Bool)

(assert (=> b!872660 (=> (not res!593125) (not e!485960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50595 (_ BitVec 32)) Bool)

(assert (=> b!872660 (= res!593125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872661 () Bool)

(declare-fun e!485964 () Bool)

(assert (=> b!872661 (= e!485964 tp_is_empty!17239)))

(declare-fun b!872662 () Bool)

(declare-fun res!593126 () Bool)

(assert (=> b!872662 (=> (not res!593126) (not e!485960))))

(assert (=> b!872662 (= res!593126 (and (= (select (arr!24328 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24770 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!872663 () Bool)

(declare-datatypes ((tuple2!11474 0))(
  ( (tuple2!11475 (_1!5748 (_ BitVec 64)) (_2!5748 V!28033)) )
))
(declare-datatypes ((List!17283 0))(
  ( (Nil!17280) (Cons!17279 (h!18410 tuple2!11474) (t!24311 List!17283)) )
))
(declare-datatypes ((ListLongMap!10233 0))(
  ( (ListLongMap!10234 (toList!5132 List!17283)) )
))
(declare-fun call!38462 () ListLongMap!10233)

(declare-fun call!38463 () ListLongMap!10233)

(declare-fun +!2486 (ListLongMap!10233 tuple2!11474) ListLongMap!10233)

(assert (=> b!872663 (= e!485962 (= call!38462 (+!2486 call!38463 (tuple2!11475 k0!854 v!557))))))

(declare-fun b!872664 () Bool)

(assert (=> b!872664 (= e!485961 (and e!485964 mapRes!27461))))

(declare-fun condMapEmpty!27461 () Bool)

(declare-fun mapDefault!27461 () ValueCell!8180)

(assert (=> b!872664 (= condMapEmpty!27461 (= (arr!24329 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8180)) mapDefault!27461)))))

(declare-fun b!872665 () Bool)

(declare-fun res!593123 () Bool)

(assert (=> b!872665 (=> (not res!593123) (not e!485960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872665 (= res!593123 (validKeyInArray!0 k0!854))))

(declare-fun bm!38459 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3125 (array!50595 array!50597 (_ BitVec 32) (_ BitVec 32) V!28033 V!28033 (_ BitVec 32) Int) ListLongMap!10233)

(assert (=> bm!38459 (= call!38463 (getCurrentListMapNoExtraKeys!3125 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38460 () Bool)

(assert (=> bm!38460 (= call!38462 (getCurrentListMapNoExtraKeys!3125 _keys!868 (array!50598 (store (arr!24329 _values!688) i!612 (ValueCellFull!8180 v!557)) (size!24771 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872666 () Bool)

(assert (=> b!872666 (= e!485962 (= call!38462 call!38463))))

(declare-fun mapIsEmpty!27461 () Bool)

(assert (=> mapIsEmpty!27461 mapRes!27461))

(declare-fun b!872667 () Bool)

(declare-fun res!593130 () Bool)

(assert (=> b!872667 (=> (not res!593130) (not e!485960))))

(declare-datatypes ((List!17284 0))(
  ( (Nil!17281) (Cons!17280 (h!18411 (_ BitVec 64)) (t!24312 List!17284)) )
))
(declare-fun arrayNoDuplicates!0 (array!50595 (_ BitVec 32) List!17284) Bool)

(assert (=> b!872667 (= res!593130 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17281))))

(declare-fun b!872668 () Bool)

(assert (=> b!872668 (= e!485959 tp_is_empty!17239)))

(declare-fun b!872669 () Bool)

(declare-fun res!593128 () Bool)

(assert (=> b!872669 (=> (not res!593128) (not e!485960))))

(assert (=> b!872669 (= res!593128 (and (= (size!24771 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24770 _keys!868) (size!24771 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74182 res!593127) b!872659))

(assert (= (and b!872659 res!593129) b!872669))

(assert (= (and b!872669 res!593128) b!872660))

(assert (= (and b!872660 res!593125) b!872667))

(assert (= (and b!872667 res!593130) b!872657))

(assert (= (and b!872657 res!593124) b!872665))

(assert (= (and b!872665 res!593123) b!872662))

(assert (= (and b!872662 res!593126) b!872658))

(assert (= (and b!872658 c!92339) b!872663))

(assert (= (and b!872658 (not c!92339)) b!872666))

(assert (= (or b!872663 b!872666) bm!38460))

(assert (= (or b!872663 b!872666) bm!38459))

(assert (= (and b!872664 condMapEmpty!27461) mapIsEmpty!27461))

(assert (= (and b!872664 (not condMapEmpty!27461)) mapNonEmpty!27461))

(get-info :version)

(assert (= (and mapNonEmpty!27461 ((_ is ValueCellFull!8180) mapValue!27461)) b!872668))

(assert (= (and b!872664 ((_ is ValueCellFull!8180) mapDefault!27461)) b!872661))

(assert (= start!74182 b!872664))

(declare-fun m!812763 () Bool)

(assert (=> b!872659 m!812763))

(declare-fun m!812765 () Bool)

(assert (=> b!872663 m!812765))

(declare-fun m!812767 () Bool)

(assert (=> start!74182 m!812767))

(declare-fun m!812769 () Bool)

(assert (=> start!74182 m!812769))

(declare-fun m!812771 () Bool)

(assert (=> b!872660 m!812771))

(declare-fun m!812773 () Bool)

(assert (=> bm!38459 m!812773))

(declare-fun m!812775 () Bool)

(assert (=> mapNonEmpty!27461 m!812775))

(declare-fun m!812777 () Bool)

(assert (=> b!872667 m!812777))

(declare-fun m!812779 () Bool)

(assert (=> b!872662 m!812779))

(declare-fun m!812781 () Bool)

(assert (=> b!872665 m!812781))

(declare-fun m!812783 () Bool)

(assert (=> b!872658 m!812783))

(declare-fun m!812785 () Bool)

(assert (=> bm!38460 m!812785))

(declare-fun m!812787 () Bool)

(assert (=> bm!38460 m!812787))

(check-sat (not start!74182) (not b!872658) (not mapNonEmpty!27461) (not b_next!15007) (not bm!38459) (not b!872663) (not b!872665) tp_is_empty!17239 (not b!872667) (not bm!38460) b_and!24733 (not b!872659) (not b!872660))
(check-sat b_and!24733 (not b_next!15007))
