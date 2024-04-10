; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74434 () Bool)

(assert start!74434)

(declare-fun b_free!15177 () Bool)

(declare-fun b_next!15177 () Bool)

(assert (=> start!74434 (= b_free!15177 (not b_next!15177))))

(declare-fun tp!53208 () Bool)

(declare-fun b_and!25007 () Bool)

(assert (=> start!74434 (= tp!53208 b_and!25007)))

(declare-fun b!876670 () Bool)

(declare-fun res!595709 () Bool)

(declare-fun e!488010 () Bool)

(assert (=> b!876670 (=> (not res!595709) (not e!488010))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876670 (= res!595709 (validKeyInArray!0 k0!854))))

(declare-fun b!876671 () Bool)

(declare-fun res!595704 () Bool)

(assert (=> b!876671 (=> (not res!595704) (not e!488010))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50968 0))(
  ( (array!50969 (arr!24511 (Array (_ BitVec 32) (_ BitVec 64))) (size!24951 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50968)

(declare-datatypes ((V!28275 0))(
  ( (V!28276 (val!8758 Int)) )
))
(declare-datatypes ((ValueCell!8271 0))(
  ( (ValueCellFull!8271 (v!11191 V!28275)) (EmptyCell!8271) )
))
(declare-datatypes ((array!50970 0))(
  ( (array!50971 (arr!24512 (Array (_ BitVec 32) ValueCell!8271)) (size!24952 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50970)

(assert (=> b!876671 (= res!595704 (and (= (size!24952 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24951 _keys!868) (size!24952 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876672 () Bool)

(declare-fun e!488009 () Bool)

(declare-fun tp_is_empty!17421 () Bool)

(assert (=> b!876672 (= e!488009 tp_is_empty!17421)))

(declare-fun b!876673 () Bool)

(declare-fun res!595701 () Bool)

(assert (=> b!876673 (=> (not res!595701) (not e!488010))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876673 (= res!595701 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24951 _keys!868))))))

(declare-fun b!876674 () Bool)

(declare-fun res!595703 () Bool)

(assert (=> b!876674 (=> (not res!595703) (not e!488010))))

(declare-datatypes ((List!17396 0))(
  ( (Nil!17393) (Cons!17392 (h!18523 (_ BitVec 64)) (t!24477 List!17396)) )
))
(declare-fun arrayNoDuplicates!0 (array!50968 (_ BitVec 32) List!17396) Bool)

(assert (=> b!876674 (= res!595703 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17393))))

(declare-fun b!876675 () Bool)

(declare-fun res!595708 () Bool)

(assert (=> b!876675 (=> (not res!595708) (not e!488010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876675 (= res!595708 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27743 () Bool)

(declare-fun mapRes!27743 () Bool)

(assert (=> mapIsEmpty!27743 mapRes!27743))

(declare-fun b!876676 () Bool)

(declare-fun e!488013 () Bool)

(declare-fun e!488012 () Bool)

(assert (=> b!876676 (= e!488013 (not e!488012))))

(declare-fun res!595702 () Bool)

(assert (=> b!876676 (=> res!595702 e!488012)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!876676 (= res!595702 (not (validKeyInArray!0 (select (arr!24511 _keys!868) from!1053))))))

(declare-fun e!488008 () Bool)

(assert (=> b!876676 e!488008))

(declare-fun c!92615 () Bool)

(assert (=> b!876676 (= c!92615 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28275)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28275)

(declare-fun zeroValue!654 () V!28275)

(declare-datatypes ((Unit!29980 0))(
  ( (Unit!29981) )
))
(declare-fun lt!396632 () Unit!29980)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!683 (array!50968 array!50970 (_ BitVec 32) (_ BitVec 32) V!28275 V!28275 (_ BitVec 32) (_ BitVec 64) V!28275 (_ BitVec 32) Int) Unit!29980)

(assert (=> b!876676 (= lt!396632 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!683 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876677 () Bool)

(declare-fun e!488006 () Bool)

(declare-fun e!488011 () Bool)

(assert (=> b!876677 (= e!488006 (and e!488011 mapRes!27743))))

(declare-fun condMapEmpty!27743 () Bool)

(declare-fun mapDefault!27743 () ValueCell!8271)

(assert (=> b!876677 (= condMapEmpty!27743 (= (arr!24512 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8271)) mapDefault!27743)))))

(declare-fun res!595706 () Bool)

(assert (=> start!74434 (=> (not res!595706) (not e!488010))))

(assert (=> start!74434 (= res!595706 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24951 _keys!868))))))

(assert (=> start!74434 e!488010))

(assert (=> start!74434 tp_is_empty!17421))

(assert (=> start!74434 true))

(assert (=> start!74434 tp!53208))

(declare-fun array_inv!19322 (array!50968) Bool)

(assert (=> start!74434 (array_inv!19322 _keys!868)))

(declare-fun array_inv!19323 (array!50970) Bool)

(assert (=> start!74434 (and (array_inv!19323 _values!688) e!488006)))

(declare-fun b!876678 () Bool)

(assert (=> b!876678 (= e!488012 true)))

(declare-datatypes ((tuple2!11578 0))(
  ( (tuple2!11579 (_1!5800 (_ BitVec 64)) (_2!5800 V!28275)) )
))
(declare-fun lt!396628 () tuple2!11578)

(declare-fun lt!396630 () V!28275)

(declare-datatypes ((List!17397 0))(
  ( (Nil!17394) (Cons!17393 (h!18524 tuple2!11578) (t!24478 List!17397)) )
))
(declare-datatypes ((ListLongMap!10347 0))(
  ( (ListLongMap!10348 (toList!5189 List!17397)) )
))
(declare-fun lt!396627 () ListLongMap!10347)

(declare-fun +!2489 (ListLongMap!10347 tuple2!11578) ListLongMap!10347)

(assert (=> b!876678 (= (+!2489 lt!396627 lt!396628) (+!2489 (+!2489 lt!396627 (tuple2!11579 k0!854 lt!396630)) lt!396628))))

(declare-fun lt!396629 () V!28275)

(assert (=> b!876678 (= lt!396628 (tuple2!11579 k0!854 lt!396629))))

(declare-fun lt!396625 () Unit!29980)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!322 (ListLongMap!10347 (_ BitVec 64) V!28275 V!28275) Unit!29980)

(assert (=> b!876678 (= lt!396625 (addSameAsAddTwiceSameKeyDiffValues!322 lt!396627 k0!854 lt!396630 lt!396629))))

(declare-fun lt!396631 () V!28275)

(declare-fun get!12890 (ValueCell!8271 V!28275) V!28275)

(assert (=> b!876678 (= lt!396630 (get!12890 (select (arr!24512 _values!688) from!1053) lt!396631))))

(declare-fun lt!396624 () ListLongMap!10347)

(assert (=> b!876678 (= lt!396624 (+!2489 lt!396627 (tuple2!11579 (select (arr!24511 _keys!868) from!1053) lt!396629)))))

(assert (=> b!876678 (= lt!396629 (get!12890 (select (store (arr!24512 _values!688) i!612 (ValueCellFull!8271 v!557)) from!1053) lt!396631))))

(declare-fun dynLambda!1216 (Int (_ BitVec 64)) V!28275)

(assert (=> b!876678 (= lt!396631 (dynLambda!1216 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!396633 () array!50970)

(declare-fun getCurrentListMapNoExtraKeys!3156 (array!50968 array!50970 (_ BitVec 32) (_ BitVec 32) V!28275 V!28275 (_ BitVec 32) Int) ListLongMap!10347)

(assert (=> b!876678 (= lt!396627 (getCurrentListMapNoExtraKeys!3156 _keys!868 lt!396633 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876679 () Bool)

(declare-fun res!595700 () Bool)

(assert (=> b!876679 (=> (not res!595700) (not e!488010))))

(assert (=> b!876679 (= res!595700 (and (= (select (arr!24511 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876680 () Bool)

(declare-fun res!595707 () Bool)

(assert (=> b!876680 (=> (not res!595707) (not e!488010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50968 (_ BitVec 32)) Bool)

(assert (=> b!876680 (= res!595707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876681 () Bool)

(assert (=> b!876681 (= e!488010 e!488013)))

(declare-fun res!595705 () Bool)

(assert (=> b!876681 (=> (not res!595705) (not e!488013))))

(assert (=> b!876681 (= res!595705 (= from!1053 i!612))))

(assert (=> b!876681 (= lt!396624 (getCurrentListMapNoExtraKeys!3156 _keys!868 lt!396633 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876681 (= lt!396633 (array!50971 (store (arr!24512 _values!688) i!612 (ValueCellFull!8271 v!557)) (size!24952 _values!688)))))

(declare-fun lt!396626 () ListLongMap!10347)

(assert (=> b!876681 (= lt!396626 (getCurrentListMapNoExtraKeys!3156 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876682 () Bool)

(assert (=> b!876682 (= e!488011 tp_is_empty!17421)))

(declare-fun bm!38771 () Bool)

(declare-fun call!38775 () ListLongMap!10347)

(assert (=> bm!38771 (= call!38775 (getCurrentListMapNoExtraKeys!3156 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876683 () Bool)

(declare-fun call!38774 () ListLongMap!10347)

(assert (=> b!876683 (= e!488008 (= call!38774 call!38775))))

(declare-fun mapNonEmpty!27743 () Bool)

(declare-fun tp!53209 () Bool)

(assert (=> mapNonEmpty!27743 (= mapRes!27743 (and tp!53209 e!488009))))

(declare-fun mapValue!27743 () ValueCell!8271)

(declare-fun mapKey!27743 () (_ BitVec 32))

(declare-fun mapRest!27743 () (Array (_ BitVec 32) ValueCell!8271))

(assert (=> mapNonEmpty!27743 (= (arr!24512 _values!688) (store mapRest!27743 mapKey!27743 mapValue!27743))))

(declare-fun bm!38772 () Bool)

(assert (=> bm!38772 (= call!38774 (getCurrentListMapNoExtraKeys!3156 _keys!868 lt!396633 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876684 () Bool)

(assert (=> b!876684 (= e!488008 (= call!38774 (+!2489 call!38775 (tuple2!11579 k0!854 v!557))))))

(assert (= (and start!74434 res!595706) b!876675))

(assert (= (and b!876675 res!595708) b!876671))

(assert (= (and b!876671 res!595704) b!876680))

(assert (= (and b!876680 res!595707) b!876674))

(assert (= (and b!876674 res!595703) b!876673))

(assert (= (and b!876673 res!595701) b!876670))

(assert (= (and b!876670 res!595709) b!876679))

(assert (= (and b!876679 res!595700) b!876681))

(assert (= (and b!876681 res!595705) b!876676))

(assert (= (and b!876676 c!92615) b!876684))

(assert (= (and b!876676 (not c!92615)) b!876683))

(assert (= (or b!876684 b!876683) bm!38772))

(assert (= (or b!876684 b!876683) bm!38771))

(assert (= (and b!876676 (not res!595702)) b!876678))

(assert (= (and b!876677 condMapEmpty!27743) mapIsEmpty!27743))

(assert (= (and b!876677 (not condMapEmpty!27743)) mapNonEmpty!27743))

(get-info :version)

(assert (= (and mapNonEmpty!27743 ((_ is ValueCellFull!8271) mapValue!27743)) b!876672))

(assert (= (and b!876677 ((_ is ValueCellFull!8271) mapDefault!27743)) b!876682))

(assert (= start!74434 b!876677))

(declare-fun b_lambda!12245 () Bool)

(assert (=> (not b_lambda!12245) (not b!876678)))

(declare-fun t!24476 () Bool)

(declare-fun tb!4937 () Bool)

(assert (=> (and start!74434 (= defaultEntry!696 defaultEntry!696) t!24476) tb!4937))

(declare-fun result!9493 () Bool)

(assert (=> tb!4937 (= result!9493 tp_is_empty!17421)))

(assert (=> b!876678 t!24476))

(declare-fun b_and!25009 () Bool)

(assert (= b_and!25007 (and (=> t!24476 result!9493) b_and!25009)))

(declare-fun m!816455 () Bool)

(assert (=> mapNonEmpty!27743 m!816455))

(declare-fun m!816457 () Bool)

(assert (=> bm!38772 m!816457))

(declare-fun m!816459 () Bool)

(assert (=> bm!38771 m!816459))

(declare-fun m!816461 () Bool)

(assert (=> b!876681 m!816461))

(declare-fun m!816463 () Bool)

(assert (=> b!876681 m!816463))

(declare-fun m!816465 () Bool)

(assert (=> b!876681 m!816465))

(declare-fun m!816467 () Bool)

(assert (=> b!876679 m!816467))

(declare-fun m!816469 () Bool)

(assert (=> b!876670 m!816469))

(declare-fun m!816471 () Bool)

(assert (=> b!876675 m!816471))

(declare-fun m!816473 () Bool)

(assert (=> b!876678 m!816473))

(declare-fun m!816475 () Bool)

(assert (=> b!876678 m!816475))

(declare-fun m!816477 () Bool)

(assert (=> b!876678 m!816477))

(declare-fun m!816479 () Bool)

(assert (=> b!876678 m!816479))

(declare-fun m!816481 () Bool)

(assert (=> b!876678 m!816481))

(declare-fun m!816483 () Bool)

(assert (=> b!876678 m!816483))

(declare-fun m!816485 () Bool)

(assert (=> b!876678 m!816485))

(assert (=> b!876678 m!816481))

(declare-fun m!816487 () Bool)

(assert (=> b!876678 m!816487))

(assert (=> b!876678 m!816457))

(assert (=> b!876678 m!816477))

(assert (=> b!876678 m!816473))

(assert (=> b!876678 m!816463))

(declare-fun m!816489 () Bool)

(assert (=> b!876678 m!816489))

(declare-fun m!816491 () Bool)

(assert (=> b!876678 m!816491))

(declare-fun m!816493 () Bool)

(assert (=> b!876678 m!816493))

(assert (=> b!876676 m!816489))

(assert (=> b!876676 m!816489))

(declare-fun m!816495 () Bool)

(assert (=> b!876676 m!816495))

(declare-fun m!816497 () Bool)

(assert (=> b!876676 m!816497))

(declare-fun m!816499 () Bool)

(assert (=> b!876684 m!816499))

(declare-fun m!816501 () Bool)

(assert (=> b!876680 m!816501))

(declare-fun m!816503 () Bool)

(assert (=> start!74434 m!816503))

(declare-fun m!816505 () Bool)

(assert (=> start!74434 m!816505))

(declare-fun m!816507 () Bool)

(assert (=> b!876674 m!816507))

(check-sat (not mapNonEmpty!27743) (not b_next!15177) (not b!876678) (not b!876681) (not b!876675) (not b!876670) (not start!74434) (not bm!38772) (not b!876680) (not b!876684) (not bm!38771) (not b_lambda!12245) tp_is_empty!17421 (not b!876674) b_and!25009 (not b!876676))
(check-sat b_and!25009 (not b_next!15177))
