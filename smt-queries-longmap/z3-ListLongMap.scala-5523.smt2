; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72924 () Bool)

(assert start!72924)

(declare-fun b_free!13839 () Bool)

(declare-fun b_next!13839 () Bool)

(assert (=> start!72924 (= b_free!13839 (not b_next!13839))))

(declare-fun tp!49021 () Bool)

(declare-fun b_and!22925 () Bool)

(assert (=> start!72924 (= tp!49021 b_and!22925)))

(declare-fun mapNonEmpty!25562 () Bool)

(declare-fun mapRes!25562 () Bool)

(declare-fun tp!49020 () Bool)

(declare-fun e!472549 () Bool)

(assert (=> mapNonEmpty!25562 (= mapRes!25562 (and tp!49020 e!472549))))

(declare-datatypes ((V!26347 0))(
  ( (V!26348 (val!8035 Int)) )
))
(declare-datatypes ((ValueCell!7548 0))(
  ( (ValueCellFull!7548 (v!10460 V!26347)) (EmptyCell!7548) )
))
(declare-fun mapValue!25562 () ValueCell!7548)

(declare-fun mapRest!25562 () (Array (_ BitVec 32) ValueCell!7548))

(declare-fun mapKey!25562 () (_ BitVec 32))

(declare-datatypes ((array!48162 0))(
  ( (array!48163 (arr!23112 (Array (_ BitVec 32) ValueCell!7548)) (size!23552 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48162)

(assert (=> mapNonEmpty!25562 (= (arr!23112 _values!688) (store mapRest!25562 mapKey!25562 mapValue!25562))))

(declare-fun b!846727 () Bool)

(declare-fun e!472550 () Bool)

(declare-fun e!472552 () Bool)

(assert (=> b!846727 (= e!472550 (and e!472552 mapRes!25562))))

(declare-fun condMapEmpty!25562 () Bool)

(declare-fun mapDefault!25562 () ValueCell!7548)

(assert (=> b!846727 (= condMapEmpty!25562 (= (arr!23112 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7548)) mapDefault!25562)))))

(declare-fun mapIsEmpty!25562 () Bool)

(assert (=> mapIsEmpty!25562 mapRes!25562))

(declare-fun b!846728 () Bool)

(declare-fun res!575284 () Bool)

(declare-fun e!472551 () Bool)

(assert (=> b!846728 (=> (not res!575284) (not e!472551))))

(declare-datatypes ((array!48164 0))(
  ( (array!48165 (arr!23113 (Array (_ BitVec 32) (_ BitVec 64))) (size!23553 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48164)

(declare-datatypes ((List!16354 0))(
  ( (Nil!16351) (Cons!16350 (h!17481 (_ BitVec 64)) (t!22725 List!16354)) )
))
(declare-fun arrayNoDuplicates!0 (array!48164 (_ BitVec 32) List!16354) Bool)

(assert (=> b!846728 (= res!575284 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16351))))

(declare-fun b!846729 () Bool)

(declare-fun res!575281 () Bool)

(assert (=> b!846729 (=> (not res!575281) (not e!472551))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48164 (_ BitVec 32)) Bool)

(assert (=> b!846729 (= res!575281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!575280 () Bool)

(assert (=> start!72924 (=> (not res!575280) (not e!472551))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72924 (= res!575280 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23553 _keys!868))))))

(assert (=> start!72924 e!472551))

(declare-fun tp_is_empty!15975 () Bool)

(assert (=> start!72924 tp_is_empty!15975))

(assert (=> start!72924 true))

(assert (=> start!72924 tp!49021))

(declare-fun array_inv!18356 (array!48164) Bool)

(assert (=> start!72924 (array_inv!18356 _keys!868)))

(declare-fun array_inv!18357 (array!48162) Bool)

(assert (=> start!72924 (and (array_inv!18357 _values!688) e!472550)))

(declare-fun b!846730 () Bool)

(assert (=> b!846730 (= e!472549 tp_is_empty!15975)))

(declare-fun b!846731 () Bool)

(assert (=> b!846731 (= e!472552 tp_is_empty!15975)))

(declare-fun b!846732 () Bool)

(declare-fun res!575285 () Bool)

(assert (=> b!846732 (=> (not res!575285) (not e!472551))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846732 (= res!575285 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23553 _keys!868))))))

(declare-fun b!846733 () Bool)

(declare-fun res!575278 () Bool)

(assert (=> b!846733 (=> (not res!575278) (not e!472551))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!846733 (= res!575278 (and (= (size!23552 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23553 _keys!868) (size!23552 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846734 () Bool)

(declare-fun res!575279 () Bool)

(assert (=> b!846734 (=> (not res!575279) (not e!472551))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!846734 (= res!575279 (and (= (select (arr!23113 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!846735 () Bool)

(assert (=> b!846735 (= e!472551 false)))

(declare-fun v!557 () V!26347)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10492 0))(
  ( (tuple2!10493 (_1!5257 (_ BitVec 64)) (_2!5257 V!26347)) )
))
(declare-datatypes ((List!16355 0))(
  ( (Nil!16352) (Cons!16351 (h!17482 tuple2!10492) (t!22726 List!16355)) )
))
(declare-datatypes ((ListLongMap!9261 0))(
  ( (ListLongMap!9262 (toList!4646 List!16355)) )
))
(declare-fun lt!381588 () ListLongMap!9261)

(declare-fun minValue!654 () V!26347)

(declare-fun zeroValue!654 () V!26347)

(declare-fun getCurrentListMapNoExtraKeys!2631 (array!48164 array!48162 (_ BitVec 32) (_ BitVec 32) V!26347 V!26347 (_ BitVec 32) Int) ListLongMap!9261)

(assert (=> b!846735 (= lt!381588 (getCurrentListMapNoExtraKeys!2631 _keys!868 (array!48163 (store (arr!23112 _values!688) i!612 (ValueCellFull!7548 v!557)) (size!23552 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381589 () ListLongMap!9261)

(assert (=> b!846735 (= lt!381589 (getCurrentListMapNoExtraKeys!2631 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!846736 () Bool)

(declare-fun res!575282 () Bool)

(assert (=> b!846736 (=> (not res!575282) (not e!472551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846736 (= res!575282 (validMask!0 mask!1196))))

(declare-fun b!846737 () Bool)

(declare-fun res!575283 () Bool)

(assert (=> b!846737 (=> (not res!575283) (not e!472551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846737 (= res!575283 (validKeyInArray!0 k0!854))))

(assert (= (and start!72924 res!575280) b!846736))

(assert (= (and b!846736 res!575282) b!846733))

(assert (= (and b!846733 res!575278) b!846729))

(assert (= (and b!846729 res!575281) b!846728))

(assert (= (and b!846728 res!575284) b!846732))

(assert (= (and b!846732 res!575285) b!846737))

(assert (= (and b!846737 res!575283) b!846734))

(assert (= (and b!846734 res!575279) b!846735))

(assert (= (and b!846727 condMapEmpty!25562) mapIsEmpty!25562))

(assert (= (and b!846727 (not condMapEmpty!25562)) mapNonEmpty!25562))

(get-info :version)

(assert (= (and mapNonEmpty!25562 ((_ is ValueCellFull!7548) mapValue!25562)) b!846730))

(assert (= (and b!846727 ((_ is ValueCellFull!7548) mapDefault!25562)) b!846731))

(assert (= start!72924 b!846727))

(declare-fun m!788029 () Bool)

(assert (=> b!846736 m!788029))

(declare-fun m!788031 () Bool)

(assert (=> b!846729 m!788031))

(declare-fun m!788033 () Bool)

(assert (=> b!846735 m!788033))

(declare-fun m!788035 () Bool)

(assert (=> b!846735 m!788035))

(declare-fun m!788037 () Bool)

(assert (=> b!846735 m!788037))

(declare-fun m!788039 () Bool)

(assert (=> mapNonEmpty!25562 m!788039))

(declare-fun m!788041 () Bool)

(assert (=> b!846734 m!788041))

(declare-fun m!788043 () Bool)

(assert (=> b!846728 m!788043))

(declare-fun m!788045 () Bool)

(assert (=> start!72924 m!788045))

(declare-fun m!788047 () Bool)

(assert (=> start!72924 m!788047))

(declare-fun m!788049 () Bool)

(assert (=> b!846737 m!788049))

(check-sat (not b!846728) b_and!22925 (not b!846737) (not b!846736) tp_is_empty!15975 (not b!846735) (not b!846729) (not start!72924) (not b_next!13839) (not mapNonEmpty!25562))
(check-sat b_and!22925 (not b_next!13839))
