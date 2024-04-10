; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74372 () Bool)

(assert start!74372)

(declare-fun b_free!15135 () Bool)

(declare-fun b_next!15135 () Bool)

(assert (=> start!74372 (= b_free!15135 (not b_next!15135))))

(declare-fun tp!53079 () Bool)

(declare-fun b_and!24911 () Bool)

(assert (=> start!74372 (= tp!53079 b_and!24911)))

(declare-fun b!875557 () Bool)

(declare-fun e!487426 () Bool)

(declare-fun tp_is_empty!17379 () Bool)

(assert (=> b!875557 (= e!487426 tp_is_empty!17379)))

(declare-fun b!875558 () Bool)

(declare-fun e!487422 () Bool)

(declare-fun e!487424 () Bool)

(assert (=> b!875558 (= e!487422 e!487424)))

(declare-fun res!595021 () Bool)

(assert (=> b!875558 (=> (not res!595021) (not e!487424))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875558 (= res!595021 (= from!1053 i!612))))

(declare-datatypes ((V!28219 0))(
  ( (V!28220 (val!8737 Int)) )
))
(declare-datatypes ((ValueCell!8250 0))(
  ( (ValueCellFull!8250 (v!11166 V!28219)) (EmptyCell!8250) )
))
(declare-datatypes ((array!50882 0))(
  ( (array!50883 (arr!24469 (Array (_ BitVec 32) ValueCell!8250)) (size!24909 (_ BitVec 32))) )
))
(declare-fun lt!396215 () array!50882)

(declare-datatypes ((tuple2!11542 0))(
  ( (tuple2!11543 (_1!5782 (_ BitVec 64)) (_2!5782 V!28219)) )
))
(declare-datatypes ((List!17364 0))(
  ( (Nil!17361) (Cons!17360 (h!18491 tuple2!11542) (t!24405 List!17364)) )
))
(declare-datatypes ((ListLongMap!10311 0))(
  ( (ListLongMap!10312 (toList!5171 List!17364)) )
))
(declare-fun lt!396216 () ListLongMap!10311)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50884 0))(
  ( (array!50885 (arr!24470 (Array (_ BitVec 32) (_ BitVec 64))) (size!24910 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50884)

(declare-fun minValue!654 () V!28219)

(declare-fun zeroValue!654 () V!28219)

(declare-fun getCurrentListMapNoExtraKeys!3138 (array!50884 array!50882 (_ BitVec 32) (_ BitVec 32) V!28219 V!28219 (_ BitVec 32) Int) ListLongMap!10311)

(assert (=> b!875558 (= lt!396216 (getCurrentListMapNoExtraKeys!3138 _keys!868 lt!396215 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28219)

(declare-fun _values!688 () array!50882)

(assert (=> b!875558 (= lt!396215 (array!50883 (store (arr!24469 _values!688) i!612 (ValueCellFull!8250 v!557)) (size!24909 _values!688)))))

(declare-fun lt!396218 () ListLongMap!10311)

(assert (=> b!875558 (= lt!396218 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875559 () Bool)

(declare-fun res!595025 () Bool)

(assert (=> b!875559 (=> (not res!595025) (not e!487422))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!875559 (= res!595025 (and (= (select (arr!24470 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!38627 () Bool)

(declare-fun call!38631 () ListLongMap!10311)

(assert (=> bm!38627 (= call!38631 (getCurrentListMapNoExtraKeys!3138 _keys!868 lt!396215 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875560 () Bool)

(declare-fun e!487423 () Bool)

(assert (=> b!875560 (= e!487423 (bvslt from!1053 (size!24909 _values!688)))))

(declare-fun lt!396214 () ListLongMap!10311)

(assert (=> b!875560 (= lt!396214 (getCurrentListMapNoExtraKeys!3138 _keys!868 lt!396215 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875561 () Bool)

(assert (=> b!875561 (= e!487424 (not e!487423))))

(declare-fun res!595024 () Bool)

(assert (=> b!875561 (=> res!595024 e!487423)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875561 (= res!595024 (not (validKeyInArray!0 (select (arr!24470 _keys!868) from!1053))))))

(declare-fun e!487427 () Bool)

(assert (=> b!875561 e!487427))

(declare-fun c!92516 () Bool)

(assert (=> b!875561 (= c!92516 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29944 0))(
  ( (Unit!29945) )
))
(declare-fun lt!396217 () Unit!29944)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!665 (array!50884 array!50882 (_ BitVec 32) (_ BitVec 32) V!28219 V!28219 (_ BitVec 32) (_ BitVec 64) V!28219 (_ BitVec 32) Int) Unit!29944)

(assert (=> b!875561 (= lt!396217 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!665 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875562 () Bool)

(declare-fun res!595028 () Bool)

(assert (=> b!875562 (=> (not res!595028) (not e!487422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50884 (_ BitVec 32)) Bool)

(assert (=> b!875562 (= res!595028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27677 () Bool)

(declare-fun mapRes!27677 () Bool)

(declare-fun tp!53080 () Bool)

(assert (=> mapNonEmpty!27677 (= mapRes!27677 (and tp!53080 e!487426))))

(declare-fun mapRest!27677 () (Array (_ BitVec 32) ValueCell!8250))

(declare-fun mapKey!27677 () (_ BitVec 32))

(declare-fun mapValue!27677 () ValueCell!8250)

(assert (=> mapNonEmpty!27677 (= (arr!24469 _values!688) (store mapRest!27677 mapKey!27677 mapValue!27677))))

(declare-fun b!875563 () Bool)

(declare-fun res!595020 () Bool)

(assert (=> b!875563 (=> (not res!595020) (not e!487422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875563 (= res!595020 (validMask!0 mask!1196))))

(declare-fun b!875564 () Bool)

(declare-fun res!595022 () Bool)

(assert (=> b!875564 (=> (not res!595022) (not e!487422))))

(assert (=> b!875564 (= res!595022 (and (= (size!24909 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24910 _keys!868) (size!24909 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875565 () Bool)

(declare-fun res!595029 () Bool)

(assert (=> b!875565 (=> (not res!595029) (not e!487422))))

(assert (=> b!875565 (= res!595029 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24910 _keys!868))))))

(declare-fun res!595023 () Bool)

(assert (=> start!74372 (=> (not res!595023) (not e!487422))))

(assert (=> start!74372 (= res!595023 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24910 _keys!868))))))

(assert (=> start!74372 e!487422))

(assert (=> start!74372 tp_is_empty!17379))

(assert (=> start!74372 true))

(assert (=> start!74372 tp!53079))

(declare-fun array_inv!19290 (array!50884) Bool)

(assert (=> start!74372 (array_inv!19290 _keys!868)))

(declare-fun e!487421 () Bool)

(declare-fun array_inv!19291 (array!50882) Bool)

(assert (=> start!74372 (and (array_inv!19291 _values!688) e!487421)))

(declare-fun b!875566 () Bool)

(declare-fun res!595026 () Bool)

(assert (=> b!875566 (=> (not res!595026) (not e!487422))))

(assert (=> b!875566 (= res!595026 (validKeyInArray!0 k0!854))))

(declare-fun b!875567 () Bool)

(declare-fun e!487425 () Bool)

(assert (=> b!875567 (= e!487425 tp_is_empty!17379)))

(declare-fun b!875568 () Bool)

(declare-fun call!38630 () ListLongMap!10311)

(declare-fun +!2474 (ListLongMap!10311 tuple2!11542) ListLongMap!10311)

(assert (=> b!875568 (= e!487427 (= call!38631 (+!2474 call!38630 (tuple2!11543 k0!854 v!557))))))

(declare-fun b!875569 () Bool)

(assert (=> b!875569 (= e!487421 (and e!487425 mapRes!27677))))

(declare-fun condMapEmpty!27677 () Bool)

(declare-fun mapDefault!27677 () ValueCell!8250)

(assert (=> b!875569 (= condMapEmpty!27677 (= (arr!24469 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8250)) mapDefault!27677)))))

(declare-fun bm!38628 () Bool)

(assert (=> bm!38628 (= call!38630 (getCurrentListMapNoExtraKeys!3138 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875570 () Bool)

(declare-fun res!595027 () Bool)

(assert (=> b!875570 (=> (not res!595027) (not e!487422))))

(declare-datatypes ((List!17365 0))(
  ( (Nil!17362) (Cons!17361 (h!18492 (_ BitVec 64)) (t!24406 List!17365)) )
))
(declare-fun arrayNoDuplicates!0 (array!50884 (_ BitVec 32) List!17365) Bool)

(assert (=> b!875570 (= res!595027 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17362))))

(declare-fun b!875571 () Bool)

(assert (=> b!875571 (= e!487427 (= call!38631 call!38630))))

(declare-fun mapIsEmpty!27677 () Bool)

(assert (=> mapIsEmpty!27677 mapRes!27677))

(assert (= (and start!74372 res!595023) b!875563))

(assert (= (and b!875563 res!595020) b!875564))

(assert (= (and b!875564 res!595022) b!875562))

(assert (= (and b!875562 res!595028) b!875570))

(assert (= (and b!875570 res!595027) b!875565))

(assert (= (and b!875565 res!595029) b!875566))

(assert (= (and b!875566 res!595026) b!875559))

(assert (= (and b!875559 res!595025) b!875558))

(assert (= (and b!875558 res!595021) b!875561))

(assert (= (and b!875561 c!92516) b!875568))

(assert (= (and b!875561 (not c!92516)) b!875571))

(assert (= (or b!875568 b!875571) bm!38627))

(assert (= (or b!875568 b!875571) bm!38628))

(assert (= (and b!875561 (not res!595024)) b!875560))

(assert (= (and b!875569 condMapEmpty!27677) mapIsEmpty!27677))

(assert (= (and b!875569 (not condMapEmpty!27677)) mapNonEmpty!27677))

(get-info :version)

(assert (= (and mapNonEmpty!27677 ((_ is ValueCellFull!8250) mapValue!27677)) b!875557))

(assert (= (and b!875569 ((_ is ValueCellFull!8250) mapDefault!27677)) b!875567))

(assert (= start!74372 b!875569))

(declare-fun m!815393 () Bool)

(assert (=> bm!38627 m!815393))

(declare-fun m!815395 () Bool)

(assert (=> b!875562 m!815395))

(assert (=> b!875560 m!815393))

(declare-fun m!815397 () Bool)

(assert (=> b!875566 m!815397))

(declare-fun m!815399 () Bool)

(assert (=> b!875558 m!815399))

(declare-fun m!815401 () Bool)

(assert (=> b!875558 m!815401))

(declare-fun m!815403 () Bool)

(assert (=> b!875558 m!815403))

(declare-fun m!815405 () Bool)

(assert (=> b!875559 m!815405))

(declare-fun m!815407 () Bool)

(assert (=> b!875568 m!815407))

(declare-fun m!815409 () Bool)

(assert (=> start!74372 m!815409))

(declare-fun m!815411 () Bool)

(assert (=> start!74372 m!815411))

(declare-fun m!815413 () Bool)

(assert (=> mapNonEmpty!27677 m!815413))

(declare-fun m!815415 () Bool)

(assert (=> b!875561 m!815415))

(assert (=> b!875561 m!815415))

(declare-fun m!815417 () Bool)

(assert (=> b!875561 m!815417))

(declare-fun m!815419 () Bool)

(assert (=> b!875561 m!815419))

(declare-fun m!815421 () Bool)

(assert (=> bm!38628 m!815421))

(declare-fun m!815423 () Bool)

(assert (=> b!875570 m!815423))

(declare-fun m!815425 () Bool)

(assert (=> b!875563 m!815425))

(check-sat (not bm!38628) (not b!875563) (not start!74372) (not b!875568) (not mapNonEmpty!27677) (not b!875562) b_and!24911 (not b!875558) (not b!875560) tp_is_empty!17379 (not b!875570) (not b_next!15135) (not bm!38627) (not b!875566) (not b!875561))
(check-sat b_and!24911 (not b_next!15135))
