; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73146 () Bool)

(assert start!73146)

(declare-fun b_free!14061 () Bool)

(declare-fun b_next!14061 () Bool)

(assert (=> start!73146 (= b_free!14061 (not b_next!14061))))

(declare-fun tp!49687 () Bool)

(declare-fun b_and!23281 () Bool)

(assert (=> start!73146 (= tp!49687 b_and!23281)))

(declare-fun b!851588 () Bool)

(declare-datatypes ((V!26643 0))(
  ( (V!26644 (val!8146 Int)) )
))
(declare-datatypes ((tuple2!10688 0))(
  ( (tuple2!10689 (_1!5355 (_ BitVec 64)) (_2!5355 V!26643)) )
))
(declare-datatypes ((List!16524 0))(
  ( (Nil!16521) (Cons!16520 (h!17651 tuple2!10688) (t!23031 List!16524)) )
))
(declare-datatypes ((ListLongMap!9457 0))(
  ( (ListLongMap!9458 (toList!4744 List!16524)) )
))
(declare-fun call!38039 () ListLongMap!9457)

(declare-fun v!557 () V!26643)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!38038 () ListLongMap!9457)

(declare-fun e!474999 () Bool)

(declare-fun +!2143 (ListLongMap!9457 tuple2!10688) ListLongMap!9457)

(assert (=> b!851588 (= e!474999 (= call!38038 (+!2143 call!38039 (tuple2!10689 k0!854 v!557))))))

(declare-fun res!578445 () Bool)

(declare-fun e!475000 () Bool)

(assert (=> start!73146 (=> (not res!578445) (not e!475000))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48594 0))(
  ( (array!48595 (arr!23328 (Array (_ BitVec 32) (_ BitVec 64))) (size!23768 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48594)

(assert (=> start!73146 (= res!578445 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23768 _keys!868))))))

(assert (=> start!73146 e!475000))

(declare-fun tp_is_empty!16197 () Bool)

(assert (=> start!73146 tp_is_empty!16197))

(assert (=> start!73146 true))

(assert (=> start!73146 tp!49687))

(declare-fun array_inv!18504 (array!48594) Bool)

(assert (=> start!73146 (array_inv!18504 _keys!868)))

(declare-datatypes ((ValueCell!7659 0))(
  ( (ValueCellFull!7659 (v!10571 V!26643)) (EmptyCell!7659) )
))
(declare-datatypes ((array!48596 0))(
  ( (array!48597 (arr!23329 (Array (_ BitVec 32) ValueCell!7659)) (size!23769 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48596)

(declare-fun e!474993 () Bool)

(declare-fun array_inv!18505 (array!48596) Bool)

(assert (=> start!73146 (and (array_inv!18505 _values!688) e!474993)))

(declare-fun b!851589 () Bool)

(declare-fun e!474997 () Bool)

(assert (=> b!851589 (= e!474997 tp_is_empty!16197)))

(declare-fun b!851590 () Bool)

(declare-fun e!474998 () Bool)

(assert (=> b!851590 (= e!474998 true)))

(declare-fun lt!383562 () V!26643)

(declare-fun lt!383554 () ListLongMap!9457)

(declare-fun lt!383561 () tuple2!10688)

(assert (=> b!851590 (= (+!2143 lt!383554 lt!383561) (+!2143 (+!2143 lt!383554 (tuple2!10689 k0!854 lt!383562)) lt!383561))))

(declare-fun lt!383559 () V!26643)

(assert (=> b!851590 (= lt!383561 (tuple2!10689 k0!854 lt!383559))))

(declare-datatypes ((Unit!29075 0))(
  ( (Unit!29076) )
))
(declare-fun lt!383556 () Unit!29075)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!275 (ListLongMap!9457 (_ BitVec 64) V!26643 V!26643) Unit!29075)

(assert (=> b!851590 (= lt!383556 (addSameAsAddTwiceSameKeyDiffValues!275 lt!383554 k0!854 lt!383562 lt!383559))))

(declare-fun lt!383557 () V!26643)

(declare-fun get!12293 (ValueCell!7659 V!26643) V!26643)

(assert (=> b!851590 (= lt!383562 (get!12293 (select (arr!23329 _values!688) from!1053) lt!383557))))

(declare-fun lt!383555 () ListLongMap!9457)

(assert (=> b!851590 (= lt!383555 (+!2143 lt!383554 (tuple2!10689 (select (arr!23328 _keys!868) from!1053) lt!383559)))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851590 (= lt!383559 (get!12293 (select (store (arr!23329 _values!688) i!612 (ValueCellFull!7659 v!557)) from!1053) lt!383557))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1029 (Int (_ BitVec 64)) V!26643)

(assert (=> b!851590 (= lt!383557 (dynLambda!1029 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383563 () array!48596)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26643)

(declare-fun zeroValue!654 () V!26643)

(declare-fun getCurrentListMapNoExtraKeys!2726 (array!48594 array!48596 (_ BitVec 32) (_ BitVec 32) V!26643 V!26643 (_ BitVec 32) Int) ListLongMap!9457)

(assert (=> b!851590 (= lt!383554 (getCurrentListMapNoExtraKeys!2726 _keys!868 lt!383563 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851591 () Bool)

(declare-fun res!578447 () Bool)

(assert (=> b!851591 (=> (not res!578447) (not e!475000))))

(declare-datatypes ((List!16525 0))(
  ( (Nil!16522) (Cons!16521 (h!17652 (_ BitVec 64)) (t!23032 List!16525)) )
))
(declare-fun arrayNoDuplicates!0 (array!48594 (_ BitVec 32) List!16525) Bool)

(assert (=> b!851591 (= res!578447 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16522))))

(declare-fun b!851592 () Bool)

(declare-fun res!578439 () Bool)

(assert (=> b!851592 (=> (not res!578439) (not e!475000))))

(assert (=> b!851592 (= res!578439 (and (= (size!23769 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23768 _keys!868) (size!23769 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851593 () Bool)

(declare-fun res!578442 () Bool)

(assert (=> b!851593 (=> (not res!578442) (not e!475000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48594 (_ BitVec 32)) Bool)

(assert (=> b!851593 (= res!578442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851594 () Bool)

(declare-fun e!474995 () Bool)

(assert (=> b!851594 (= e!474995 tp_is_empty!16197)))

(declare-fun b!851595 () Bool)

(declare-fun res!578438 () Bool)

(assert (=> b!851595 (=> (not res!578438) (not e!475000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851595 (= res!578438 (validKeyInArray!0 k0!854))))

(declare-fun b!851596 () Bool)

(declare-fun mapRes!25895 () Bool)

(assert (=> b!851596 (= e!474993 (and e!474997 mapRes!25895))))

(declare-fun condMapEmpty!25895 () Bool)

(declare-fun mapDefault!25895 () ValueCell!7659)

(assert (=> b!851596 (= condMapEmpty!25895 (= (arr!23329 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7659)) mapDefault!25895)))))

(declare-fun bm!38035 () Bool)

(assert (=> bm!38035 (= call!38039 (getCurrentListMapNoExtraKeys!2726 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851597 () Bool)

(declare-fun res!578441 () Bool)

(assert (=> b!851597 (=> (not res!578441) (not e!475000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851597 (= res!578441 (validMask!0 mask!1196))))

(declare-fun bm!38036 () Bool)

(assert (=> bm!38036 (= call!38038 (getCurrentListMapNoExtraKeys!2726 _keys!868 lt!383563 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851598 () Bool)

(declare-fun e!474996 () Bool)

(assert (=> b!851598 (= e!475000 e!474996)))

(declare-fun res!578444 () Bool)

(assert (=> b!851598 (=> (not res!578444) (not e!474996))))

(assert (=> b!851598 (= res!578444 (= from!1053 i!612))))

(assert (=> b!851598 (= lt!383555 (getCurrentListMapNoExtraKeys!2726 _keys!868 lt!383563 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851598 (= lt!383563 (array!48597 (store (arr!23329 _values!688) i!612 (ValueCellFull!7659 v!557)) (size!23769 _values!688)))))

(declare-fun lt!383560 () ListLongMap!9457)

(assert (=> b!851598 (= lt!383560 (getCurrentListMapNoExtraKeys!2726 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851599 () Bool)

(assert (=> b!851599 (= e!474996 (not e!474998))))

(declare-fun res!578446 () Bool)

(assert (=> b!851599 (=> res!578446 e!474998)))

(assert (=> b!851599 (= res!578446 (not (validKeyInArray!0 (select (arr!23328 _keys!868) from!1053))))))

(assert (=> b!851599 e!474999))

(declare-fun c!91762 () Bool)

(assert (=> b!851599 (= c!91762 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383558 () Unit!29075)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!379 (array!48594 array!48596 (_ BitVec 32) (_ BitVec 32) V!26643 V!26643 (_ BitVec 32) (_ BitVec 64) V!26643 (_ BitVec 32) Int) Unit!29075)

(assert (=> b!851599 (= lt!383558 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!379 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25895 () Bool)

(assert (=> mapIsEmpty!25895 mapRes!25895))

(declare-fun b!851600 () Bool)

(assert (=> b!851600 (= e!474999 (= call!38038 call!38039))))

(declare-fun mapNonEmpty!25895 () Bool)

(declare-fun tp!49686 () Bool)

(assert (=> mapNonEmpty!25895 (= mapRes!25895 (and tp!49686 e!474995))))

(declare-fun mapRest!25895 () (Array (_ BitVec 32) ValueCell!7659))

(declare-fun mapKey!25895 () (_ BitVec 32))

(declare-fun mapValue!25895 () ValueCell!7659)

(assert (=> mapNonEmpty!25895 (= (arr!23329 _values!688) (store mapRest!25895 mapKey!25895 mapValue!25895))))

(declare-fun b!851601 () Bool)

(declare-fun res!578440 () Bool)

(assert (=> b!851601 (=> (not res!578440) (not e!475000))))

(assert (=> b!851601 (= res!578440 (and (= (select (arr!23328 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851602 () Bool)

(declare-fun res!578443 () Bool)

(assert (=> b!851602 (=> (not res!578443) (not e!475000))))

(assert (=> b!851602 (= res!578443 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23768 _keys!868))))))

(assert (= (and start!73146 res!578445) b!851597))

(assert (= (and b!851597 res!578441) b!851592))

(assert (= (and b!851592 res!578439) b!851593))

(assert (= (and b!851593 res!578442) b!851591))

(assert (= (and b!851591 res!578447) b!851602))

(assert (= (and b!851602 res!578443) b!851595))

(assert (= (and b!851595 res!578438) b!851601))

(assert (= (and b!851601 res!578440) b!851598))

(assert (= (and b!851598 res!578444) b!851599))

(assert (= (and b!851599 c!91762) b!851588))

(assert (= (and b!851599 (not c!91762)) b!851600))

(assert (= (or b!851588 b!851600) bm!38035))

(assert (= (or b!851588 b!851600) bm!38036))

(assert (= (and b!851599 (not res!578446)) b!851590))

(assert (= (and b!851596 condMapEmpty!25895) mapIsEmpty!25895))

(assert (= (and b!851596 (not condMapEmpty!25895)) mapNonEmpty!25895))

(get-info :version)

(assert (= (and mapNonEmpty!25895 ((_ is ValueCellFull!7659) mapValue!25895)) b!851594))

(assert (= (and b!851596 ((_ is ValueCellFull!7659) mapDefault!25895)) b!851589))

(assert (= start!73146 b!851596))

(declare-fun b_lambda!11593 () Bool)

(assert (=> (not b_lambda!11593) (not b!851590)))

(declare-fun t!23030 () Bool)

(declare-fun tb!4363 () Bool)

(assert (=> (and start!73146 (= defaultEntry!696 defaultEntry!696) t!23030) tb!4363))

(declare-fun result!8337 () Bool)

(assert (=> tb!4363 (= result!8337 tp_is_empty!16197)))

(assert (=> b!851590 t!23030))

(declare-fun b_and!23283 () Bool)

(assert (= b_and!23281 (and (=> t!23030 result!8337) b_and!23283)))

(declare-fun m!792523 () Bool)

(assert (=> b!851599 m!792523))

(assert (=> b!851599 m!792523))

(declare-fun m!792525 () Bool)

(assert (=> b!851599 m!792525))

(declare-fun m!792527 () Bool)

(assert (=> b!851599 m!792527))

(declare-fun m!792529 () Bool)

(assert (=> b!851590 m!792529))

(declare-fun m!792531 () Bool)

(assert (=> b!851590 m!792531))

(declare-fun m!792533 () Bool)

(assert (=> b!851590 m!792533))

(assert (=> b!851590 m!792531))

(declare-fun m!792535 () Bool)

(assert (=> b!851590 m!792535))

(declare-fun m!792537 () Bool)

(assert (=> b!851590 m!792537))

(declare-fun m!792539 () Bool)

(assert (=> b!851590 m!792539))

(declare-fun m!792541 () Bool)

(assert (=> b!851590 m!792541))

(declare-fun m!792543 () Bool)

(assert (=> b!851590 m!792543))

(assert (=> b!851590 m!792533))

(declare-fun m!792545 () Bool)

(assert (=> b!851590 m!792545))

(assert (=> b!851590 m!792541))

(declare-fun m!792547 () Bool)

(assert (=> b!851590 m!792547))

(declare-fun m!792549 () Bool)

(assert (=> b!851590 m!792549))

(assert (=> b!851590 m!792523))

(declare-fun m!792551 () Bool)

(assert (=> b!851590 m!792551))

(assert (=> bm!38036 m!792537))

(declare-fun m!792553 () Bool)

(assert (=> b!851598 m!792553))

(assert (=> b!851598 m!792547))

(declare-fun m!792555 () Bool)

(assert (=> b!851598 m!792555))

(declare-fun m!792557 () Bool)

(assert (=> b!851595 m!792557))

(declare-fun m!792559 () Bool)

(assert (=> b!851597 m!792559))

(declare-fun m!792561 () Bool)

(assert (=> b!851591 m!792561))

(declare-fun m!792563 () Bool)

(assert (=> b!851593 m!792563))

(declare-fun m!792565 () Bool)

(assert (=> b!851601 m!792565))

(declare-fun m!792567 () Bool)

(assert (=> mapNonEmpty!25895 m!792567))

(declare-fun m!792569 () Bool)

(assert (=> b!851588 m!792569))

(declare-fun m!792571 () Bool)

(assert (=> start!73146 m!792571))

(declare-fun m!792573 () Bool)

(assert (=> start!73146 m!792573))

(declare-fun m!792575 () Bool)

(assert (=> bm!38035 m!792575))

(check-sat (not b!851595) tp_is_empty!16197 (not b!851598) (not b!851593) (not b!851588) (not bm!38035) (not b_lambda!11593) (not b!851591) (not b!851599) (not b_next!14061) (not bm!38036) (not start!73146) (not b!851597) b_and!23283 (not mapNonEmpty!25895) (not b!851590))
(check-sat b_and!23283 (not b_next!14061))
