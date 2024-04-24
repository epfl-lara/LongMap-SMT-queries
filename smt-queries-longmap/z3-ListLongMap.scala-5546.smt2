; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73228 () Bool)

(assert start!73228)

(declare-fun b_free!13975 () Bool)

(declare-fun b_next!13975 () Bool)

(assert (=> start!73228 (= b_free!13975 (not b_next!13975))))

(declare-fun tp!49430 () Bool)

(declare-fun b_and!23119 () Bool)

(assert (=> start!73228 (= tp!49430 b_and!23119)))

(declare-fun mapIsEmpty!25766 () Bool)

(declare-fun mapRes!25766 () Bool)

(assert (=> mapIsEmpty!25766 mapRes!25766))

(declare-fun b!850470 () Bool)

(declare-fun e!474548 () Bool)

(declare-fun e!474543 () Bool)

(assert (=> b!850470 (= e!474548 (and e!474543 mapRes!25766))))

(declare-fun condMapEmpty!25766 () Bool)

(declare-datatypes ((V!26529 0))(
  ( (V!26530 (val!8103 Int)) )
))
(declare-datatypes ((ValueCell!7616 0))(
  ( (ValueCellFull!7616 (v!10528 V!26529)) (EmptyCell!7616) )
))
(declare-datatypes ((array!48479 0))(
  ( (array!48480 (arr!23266 (Array (_ BitVec 32) ValueCell!7616)) (size!23707 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48479)

(declare-fun mapDefault!25766 () ValueCell!7616)

(assert (=> b!850470 (= condMapEmpty!25766 (= (arr!23266 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7616)) mapDefault!25766)))))

(declare-fun b!850471 () Bool)

(declare-fun tp_is_empty!16111 () Bool)

(assert (=> b!850471 (= e!474543 tp_is_empty!16111)))

(declare-fun b!850472 () Bool)

(declare-fun res!577492 () Bool)

(declare-fun e!474544 () Bool)

(assert (=> b!850472 (=> (not res!577492) (not e!474544))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48481 0))(
  ( (array!48482 (arr!23267 (Array (_ BitVec 32) (_ BitVec 64))) (size!23708 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48481)

(assert (=> b!850472 (= res!577492 (and (= (size!23707 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23708 _keys!868) (size!23707 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850473 () Bool)

(declare-fun res!577493 () Bool)

(assert (=> b!850473 (=> (not res!577493) (not e!474544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850473 (= res!577493 (validMask!0 mask!1196))))

(declare-fun bm!37822 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26529)

(declare-fun zeroValue!654 () V!26529)

(declare-datatypes ((tuple2!10538 0))(
  ( (tuple2!10539 (_1!5280 (_ BitVec 64)) (_2!5280 V!26529)) )
))
(declare-datatypes ((List!16404 0))(
  ( (Nil!16401) (Cons!16400 (h!17537 tuple2!10538) (t!22817 List!16404)) )
))
(declare-datatypes ((ListLongMap!9309 0))(
  ( (ListLongMap!9310 (toList!4670 List!16404)) )
))
(declare-fun call!37826 () ListLongMap!9309)

(declare-fun getCurrentListMapNoExtraKeys!2728 (array!48481 array!48479 (_ BitVec 32) (_ BitVec 32) V!26529 V!26529 (_ BitVec 32) Int) ListLongMap!9309)

(assert (=> bm!37822 (= call!37826 (getCurrentListMapNoExtraKeys!2728 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577495 () Bool)

(assert (=> start!73228 (=> (not res!577495) (not e!474544))))

(assert (=> start!73228 (= res!577495 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23708 _keys!868))))))

(assert (=> start!73228 e!474544))

(assert (=> start!73228 tp_is_empty!16111))

(assert (=> start!73228 true))

(assert (=> start!73228 tp!49430))

(declare-fun array_inv!18520 (array!48481) Bool)

(assert (=> start!73228 (array_inv!18520 _keys!868)))

(declare-fun array_inv!18521 (array!48479) Bool)

(assert (=> start!73228 (and (array_inv!18521 _values!688) e!474548)))

(declare-fun b!850474 () Bool)

(declare-fun e!474547 () Bool)

(assert (=> b!850474 (= e!474547 tp_is_empty!16111)))

(declare-fun b!850475 () Bool)

(declare-fun res!577497 () Bool)

(assert (=> b!850475 (=> (not res!577497) (not e!474544))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!850475 (= res!577497 (and (= (select (arr!23267 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850476 () Bool)

(declare-fun e!474545 () Bool)

(assert (=> b!850476 (= e!474544 e!474545)))

(declare-fun res!577501 () Bool)

(assert (=> b!850476 (=> (not res!577501) (not e!474545))))

(assert (=> b!850476 (= res!577501 (= from!1053 i!612))))

(declare-fun lt!382669 () ListLongMap!9309)

(declare-fun lt!382670 () array!48479)

(assert (=> b!850476 (= lt!382669 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!382670 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26529)

(assert (=> b!850476 (= lt!382670 (array!48480 (store (arr!23266 _values!688) i!612 (ValueCellFull!7616 v!557)) (size!23707 _values!688)))))

(declare-fun lt!382667 () ListLongMap!9309)

(assert (=> b!850476 (= lt!382667 (getCurrentListMapNoExtraKeys!2728 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850477 () Bool)

(declare-fun res!577494 () Bool)

(assert (=> b!850477 (=> (not res!577494) (not e!474544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48481 (_ BitVec 32)) Bool)

(assert (=> b!850477 (= res!577494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850478 () Bool)

(declare-fun res!577499 () Bool)

(assert (=> b!850478 (=> (not res!577499) (not e!474544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850478 (= res!577499 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!25766 () Bool)

(declare-fun tp!49429 () Bool)

(assert (=> mapNonEmpty!25766 (= mapRes!25766 (and tp!49429 e!474547))))

(declare-fun mapRest!25766 () (Array (_ BitVec 32) ValueCell!7616))

(declare-fun mapKey!25766 () (_ BitVec 32))

(declare-fun mapValue!25766 () ValueCell!7616)

(assert (=> mapNonEmpty!25766 (= (arr!23266 _values!688) (store mapRest!25766 mapKey!25766 mapValue!25766))))

(declare-fun call!37825 () ListLongMap!9309)

(declare-fun bm!37823 () Bool)

(assert (=> bm!37823 (= call!37825 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!382670 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850479 () Bool)

(declare-fun e!474549 () Bool)

(declare-fun +!2121 (ListLongMap!9309 tuple2!10538) ListLongMap!9309)

(assert (=> b!850479 (= e!474549 (= call!37825 (+!2121 call!37826 (tuple2!10539 k0!854 v!557))))))

(declare-fun b!850480 () Bool)

(declare-fun e!474550 () Bool)

(assert (=> b!850480 (= e!474545 (not e!474550))))

(declare-fun res!577500 () Bool)

(assert (=> b!850480 (=> res!577500 e!474550)))

(assert (=> b!850480 (= res!577500 (not (validKeyInArray!0 (select (arr!23267 _keys!868) from!1053))))))

(assert (=> b!850480 e!474549))

(declare-fun c!91915 () Bool)

(assert (=> b!850480 (= c!91915 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29008 0))(
  ( (Unit!29009) )
))
(declare-fun lt!382668 () Unit!29008)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!340 (array!48481 array!48479 (_ BitVec 32) (_ BitVec 32) V!26529 V!26529 (_ BitVec 32) (_ BitVec 64) V!26529 (_ BitVec 32) Int) Unit!29008)

(assert (=> b!850480 (= lt!382668 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!340 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850481 () Bool)

(declare-fun res!577496 () Bool)

(assert (=> b!850481 (=> (not res!577496) (not e!474544))))

(assert (=> b!850481 (= res!577496 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23708 _keys!868))))))

(declare-fun b!850482 () Bool)

(assert (=> b!850482 (= e!474549 (= call!37825 call!37826))))

(declare-fun b!850483 () Bool)

(assert (=> b!850483 (= e!474550 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23708 _keys!868))))))

(declare-fun get!12241 (ValueCell!7616 V!26529) V!26529)

(declare-fun dynLambda!999 (Int (_ BitVec 64)) V!26529)

(assert (=> b!850483 (= lt!382669 (+!2121 (getCurrentListMapNoExtraKeys!2728 _keys!868 lt!382670 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10539 (select (arr!23267 _keys!868) from!1053) (get!12241 (select (arr!23266 lt!382670) from!1053) (dynLambda!999 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!850484 () Bool)

(declare-fun res!577498 () Bool)

(assert (=> b!850484 (=> (not res!577498) (not e!474544))))

(declare-datatypes ((List!16405 0))(
  ( (Nil!16402) (Cons!16401 (h!17538 (_ BitVec 64)) (t!22818 List!16405)) )
))
(declare-fun arrayNoDuplicates!0 (array!48481 (_ BitVec 32) List!16405) Bool)

(assert (=> b!850484 (= res!577498 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16402))))

(assert (= (and start!73228 res!577495) b!850473))

(assert (= (and b!850473 res!577493) b!850472))

(assert (= (and b!850472 res!577492) b!850477))

(assert (= (and b!850477 res!577494) b!850484))

(assert (= (and b!850484 res!577498) b!850481))

(assert (= (and b!850481 res!577496) b!850478))

(assert (= (and b!850478 res!577499) b!850475))

(assert (= (and b!850475 res!577497) b!850476))

(assert (= (and b!850476 res!577501) b!850480))

(assert (= (and b!850480 c!91915) b!850479))

(assert (= (and b!850480 (not c!91915)) b!850482))

(assert (= (or b!850479 b!850482) bm!37823))

(assert (= (or b!850479 b!850482) bm!37822))

(assert (= (and b!850480 (not res!577500)) b!850483))

(assert (= (and b!850470 condMapEmpty!25766) mapIsEmpty!25766))

(assert (= (and b!850470 (not condMapEmpty!25766)) mapNonEmpty!25766))

(get-info :version)

(assert (= (and mapNonEmpty!25766 ((_ is ValueCellFull!7616) mapValue!25766)) b!850474))

(assert (= (and b!850470 ((_ is ValueCellFull!7616) mapDefault!25766)) b!850471))

(assert (= start!73228 b!850470))

(declare-fun b_lambda!11521 () Bool)

(assert (=> (not b_lambda!11521) (not b!850483)))

(declare-fun t!22816 () Bool)

(declare-fun tb!4269 () Bool)

(assert (=> (and start!73228 (= defaultEntry!696 defaultEntry!696) t!22816) tb!4269))

(declare-fun result!8157 () Bool)

(assert (=> tb!4269 (= result!8157 tp_is_empty!16111)))

(assert (=> b!850483 t!22816))

(declare-fun b_and!23121 () Bool)

(assert (= b_and!23119 (and (=> t!22816 result!8157) b_and!23121)))

(declare-fun m!791527 () Bool)

(assert (=> bm!37822 m!791527))

(declare-fun m!791529 () Bool)

(assert (=> b!850483 m!791529))

(assert (=> b!850483 m!791529))

(declare-fun m!791531 () Bool)

(assert (=> b!850483 m!791531))

(declare-fun m!791533 () Bool)

(assert (=> b!850483 m!791533))

(declare-fun m!791535 () Bool)

(assert (=> b!850483 m!791535))

(declare-fun m!791537 () Bool)

(assert (=> b!850483 m!791537))

(assert (=> b!850483 m!791535))

(declare-fun m!791539 () Bool)

(assert (=> b!850483 m!791539))

(assert (=> b!850483 m!791537))

(declare-fun m!791541 () Bool)

(assert (=> b!850479 m!791541))

(declare-fun m!791543 () Bool)

(assert (=> b!850473 m!791543))

(declare-fun m!791545 () Bool)

(assert (=> b!850477 m!791545))

(declare-fun m!791547 () Bool)

(assert (=> b!850478 m!791547))

(declare-fun m!791549 () Bool)

(assert (=> b!850484 m!791549))

(declare-fun m!791551 () Bool)

(assert (=> mapNonEmpty!25766 m!791551))

(declare-fun m!791553 () Bool)

(assert (=> b!850476 m!791553))

(declare-fun m!791555 () Bool)

(assert (=> b!850476 m!791555))

(declare-fun m!791557 () Bool)

(assert (=> b!850476 m!791557))

(assert (=> b!850480 m!791533))

(assert (=> b!850480 m!791533))

(declare-fun m!791559 () Bool)

(assert (=> b!850480 m!791559))

(declare-fun m!791561 () Bool)

(assert (=> b!850480 m!791561))

(declare-fun m!791563 () Bool)

(assert (=> b!850475 m!791563))

(declare-fun m!791565 () Bool)

(assert (=> start!73228 m!791565))

(declare-fun m!791567 () Bool)

(assert (=> start!73228 m!791567))

(assert (=> bm!37823 m!791529))

(check-sat (not b!850478) (not b!850479) (not bm!37823) (not b!850473) b_and!23121 (not b!850477) (not b!850484) (not start!73228) (not b!850483) (not b_next!13975) tp_is_empty!16111 (not mapNonEmpty!25766) (not b_lambda!11521) (not b!850480) (not bm!37822) (not b!850476))
(check-sat b_and!23121 (not b_next!13975))
