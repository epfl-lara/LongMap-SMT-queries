; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40714 () Bool)

(assert start!40714)

(declare-fun b_free!10725 () Bool)

(declare-fun b_next!10725 () Bool)

(assert (=> start!40714 (= b_free!10725 (not b_next!10725))))

(declare-fun tp!37995 () Bool)

(declare-fun b_and!18733 () Bool)

(assert (=> start!40714 (= tp!37995 b_and!18733)))

(declare-fun b!450619 () Bool)

(declare-fun e!264045 () Bool)

(declare-fun e!264047 () Bool)

(assert (=> b!450619 (= e!264045 e!264047)))

(declare-fun res!268232 () Bool)

(assert (=> b!450619 (=> (not res!268232) (not e!264047))))

(declare-datatypes ((array!27931 0))(
  ( (array!27932 (arr!13411 (Array (_ BitVec 32) (_ BitVec 64))) (size!13763 (_ BitVec 32))) )
))
(declare-fun lt!204657 () array!27931)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27931 (_ BitVec 32)) Bool)

(assert (=> b!450619 (= res!268232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204657 mask!1025))))

(declare-fun _keys!709 () array!27931)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450619 (= lt!204657 (array!27932 (store (arr!13411 _keys!709) i!563 k0!794) (size!13763 _keys!709)))))

(declare-fun b!450620 () Bool)

(declare-fun res!268223 () Bool)

(assert (=> b!450620 (=> (not res!268223) (not e!264045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450620 (= res!268223 (validMask!0 mask!1025))))

(declare-datatypes ((V!17189 0))(
  ( (V!17190 (val!6076 Int)) )
))
(declare-fun minValue!515 () V!17189)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7982 0))(
  ( (tuple2!7983 (_1!4002 (_ BitVec 64)) (_2!4002 V!17189)) )
))
(declare-datatypes ((List!8048 0))(
  ( (Nil!8045) (Cons!8044 (h!8900 tuple2!7982) (t!13810 List!8048)) )
))
(declare-datatypes ((ListLongMap!6895 0))(
  ( (ListLongMap!6896 (toList!3463 List!8048)) )
))
(declare-fun call!29767 () ListLongMap!6895)

(declare-datatypes ((ValueCell!5688 0))(
  ( (ValueCellFull!5688 (v!8331 V!17189)) (EmptyCell!5688) )
))
(declare-datatypes ((array!27933 0))(
  ( (array!27934 (arr!13412 (Array (_ BitVec 32) ValueCell!5688)) (size!13764 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27933)

(declare-fun zeroValue!515 () V!17189)

(declare-fun bm!29764 () Bool)

(declare-fun c!55994 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!204658 () array!27933)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1647 (array!27931 array!27933 (_ BitVec 32) (_ BitVec 32) V!17189 V!17189 (_ BitVec 32) Int) ListLongMap!6895)

(assert (=> bm!29764 (= call!29767 (getCurrentListMapNoExtraKeys!1647 (ite c!55994 lt!204657 _keys!709) (ite c!55994 lt!204658 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450621 () Bool)

(declare-fun e!264041 () Bool)

(declare-fun e!264039 () Bool)

(declare-fun mapRes!19728 () Bool)

(assert (=> b!450621 (= e!264041 (and e!264039 mapRes!19728))))

(declare-fun condMapEmpty!19728 () Bool)

(declare-fun mapDefault!19728 () ValueCell!5688)

(assert (=> b!450621 (= condMapEmpty!19728 (= (arr!13412 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5688)) mapDefault!19728)))))

(declare-fun b!450622 () Bool)

(declare-fun tp_is_empty!12063 () Bool)

(assert (=> b!450622 (= e!264039 tp_is_empty!12063)))

(declare-fun b!450623 () Bool)

(declare-fun res!268230 () Bool)

(assert (=> b!450623 (=> (not res!268230) (not e!264045))))

(assert (=> b!450623 (= res!268230 (or (= (select (arr!13411 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13411 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19728 () Bool)

(assert (=> mapIsEmpty!19728 mapRes!19728))

(declare-fun res!268225 () Bool)

(assert (=> start!40714 (=> (not res!268225) (not e!264045))))

(assert (=> start!40714 (= res!268225 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13763 _keys!709))))))

(assert (=> start!40714 e!264045))

(assert (=> start!40714 tp_is_empty!12063))

(assert (=> start!40714 tp!37995))

(assert (=> start!40714 true))

(declare-fun array_inv!9710 (array!27933) Bool)

(assert (=> start!40714 (and (array_inv!9710 _values!549) e!264041)))

(declare-fun array_inv!9711 (array!27931) Bool)

(assert (=> start!40714 (array_inv!9711 _keys!709)))

(declare-fun mapNonEmpty!19728 () Bool)

(declare-fun tp!37994 () Bool)

(declare-fun e!264042 () Bool)

(assert (=> mapNonEmpty!19728 (= mapRes!19728 (and tp!37994 e!264042))))

(declare-fun mapValue!19728 () ValueCell!5688)

(declare-fun mapKey!19728 () (_ BitVec 32))

(declare-fun mapRest!19728 () (Array (_ BitVec 32) ValueCell!5688))

(assert (=> mapNonEmpty!19728 (= (arr!13412 _values!549) (store mapRest!19728 mapKey!19728 mapValue!19728))))

(declare-fun b!450624 () Bool)

(declare-fun res!268231 () Bool)

(assert (=> b!450624 (=> (not res!268231) (not e!264045))))

(assert (=> b!450624 (= res!268231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450625 () Bool)

(assert (=> b!450625 (= e!264042 tp_is_empty!12063)))

(declare-fun b!450626 () Bool)

(declare-fun res!268234 () Bool)

(assert (=> b!450626 (=> (not res!268234) (not e!264045))))

(assert (=> b!450626 (= res!268234 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13763 _keys!709))))))

(declare-fun b!450627 () Bool)

(declare-fun res!268228 () Bool)

(assert (=> b!450627 (=> (not res!268228) (not e!264047))))

(declare-datatypes ((List!8049 0))(
  ( (Nil!8046) (Cons!8045 (h!8901 (_ BitVec 64)) (t!13811 List!8049)) )
))
(declare-fun arrayNoDuplicates!0 (array!27931 (_ BitVec 32) List!8049) Bool)

(assert (=> b!450627 (= res!268228 (arrayNoDuplicates!0 lt!204657 #b00000000000000000000000000000000 Nil!8046))))

(declare-fun b!450628 () Bool)

(declare-fun e!264044 () Bool)

(assert (=> b!450628 (= e!264047 e!264044)))

(declare-fun res!268235 () Bool)

(assert (=> b!450628 (=> (not res!268235) (not e!264044))))

(assert (=> b!450628 (= res!268235 (= from!863 i!563))))

(declare-fun lt!204660 () ListLongMap!6895)

(assert (=> b!450628 (= lt!204660 (getCurrentListMapNoExtraKeys!1647 lt!204657 lt!204658 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17189)

(assert (=> b!450628 (= lt!204658 (array!27934 (store (arr!13412 _values!549) i!563 (ValueCellFull!5688 v!412)) (size!13764 _values!549)))))

(declare-fun lt!204659 () ListLongMap!6895)

(assert (=> b!450628 (= lt!204659 (getCurrentListMapNoExtraKeys!1647 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450629 () Bool)

(declare-fun res!268224 () Bool)

(assert (=> b!450629 (=> (not res!268224) (not e!264045))))

(assert (=> b!450629 (= res!268224 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8046))))

(declare-fun b!450630 () Bool)

(declare-fun e!264046 () Bool)

(assert (=> b!450630 (= e!264046 (bvslt i!563 (size!13764 _values!549)))))

(declare-fun call!29768 () ListLongMap!6895)

(declare-fun e!264040 () Bool)

(declare-fun b!450631 () Bool)

(declare-fun +!1544 (ListLongMap!6895 tuple2!7982) ListLongMap!6895)

(assert (=> b!450631 (= e!264040 (= call!29767 (+!1544 call!29768 (tuple2!7983 k0!794 v!412))))))

(declare-fun b!450632 () Bool)

(declare-fun res!268229 () Bool)

(assert (=> b!450632 (=> (not res!268229) (not e!264045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450632 (= res!268229 (validKeyInArray!0 k0!794))))

(declare-fun bm!29765 () Bool)

(assert (=> bm!29765 (= call!29768 (getCurrentListMapNoExtraKeys!1647 (ite c!55994 _keys!709 lt!204657) (ite c!55994 _values!549 lt!204658) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450633 () Bool)

(declare-fun res!268227 () Bool)

(assert (=> b!450633 (=> (not res!268227) (not e!264045))))

(declare-fun arrayContainsKey!0 (array!27931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450633 (= res!268227 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450634 () Bool)

(declare-fun res!268236 () Bool)

(assert (=> b!450634 (=> (not res!268236) (not e!264047))))

(assert (=> b!450634 (= res!268236 (bvsle from!863 i!563))))

(declare-fun b!450635 () Bool)

(declare-fun res!268233 () Bool)

(assert (=> b!450635 (=> (not res!268233) (not e!264045))))

(assert (=> b!450635 (= res!268233 (and (= (size!13764 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13763 _keys!709) (size!13764 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450636 () Bool)

(assert (=> b!450636 (= e!264040 (= call!29768 call!29767))))

(declare-fun b!450637 () Bool)

(assert (=> b!450637 (= e!264044 (not e!264046))))

(declare-fun res!268226 () Bool)

(assert (=> b!450637 (=> res!268226 e!264046)))

(assert (=> b!450637 (= res!268226 (validKeyInArray!0 (select (arr!13411 _keys!709) from!863)))))

(assert (=> b!450637 e!264040))

(assert (=> b!450637 (= c!55994 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13194 0))(
  ( (Unit!13195) )
))
(declare-fun lt!204656 () Unit!13194)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!712 (array!27931 array!27933 (_ BitVec 32) (_ BitVec 32) V!17189 V!17189 (_ BitVec 32) (_ BitVec 64) V!17189 (_ BitVec 32) Int) Unit!13194)

(assert (=> b!450637 (= lt!204656 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!712 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40714 res!268225) b!450620))

(assert (= (and b!450620 res!268223) b!450635))

(assert (= (and b!450635 res!268233) b!450624))

(assert (= (and b!450624 res!268231) b!450629))

(assert (= (and b!450629 res!268224) b!450626))

(assert (= (and b!450626 res!268234) b!450632))

(assert (= (and b!450632 res!268229) b!450623))

(assert (= (and b!450623 res!268230) b!450633))

(assert (= (and b!450633 res!268227) b!450619))

(assert (= (and b!450619 res!268232) b!450627))

(assert (= (and b!450627 res!268228) b!450634))

(assert (= (and b!450634 res!268236) b!450628))

(assert (= (and b!450628 res!268235) b!450637))

(assert (= (and b!450637 c!55994) b!450631))

(assert (= (and b!450637 (not c!55994)) b!450636))

(assert (= (or b!450631 b!450636) bm!29764))

(assert (= (or b!450631 b!450636) bm!29765))

(assert (= (and b!450637 (not res!268226)) b!450630))

(assert (= (and b!450621 condMapEmpty!19728) mapIsEmpty!19728))

(assert (= (and b!450621 (not condMapEmpty!19728)) mapNonEmpty!19728))

(get-info :version)

(assert (= (and mapNonEmpty!19728 ((_ is ValueCellFull!5688) mapValue!19728)) b!450625))

(assert (= (and b!450621 ((_ is ValueCellFull!5688) mapDefault!19728)) b!450622))

(assert (= start!40714 b!450621))

(declare-fun m!434473 () Bool)

(assert (=> b!450620 m!434473))

(declare-fun m!434475 () Bool)

(assert (=> b!450627 m!434475))

(declare-fun m!434477 () Bool)

(assert (=> bm!29764 m!434477))

(declare-fun m!434479 () Bool)

(assert (=> b!450632 m!434479))

(declare-fun m!434481 () Bool)

(assert (=> b!450629 m!434481))

(declare-fun m!434483 () Bool)

(assert (=> b!450619 m!434483))

(declare-fun m!434485 () Bool)

(assert (=> b!450619 m!434485))

(declare-fun m!434487 () Bool)

(assert (=> b!450631 m!434487))

(declare-fun m!434489 () Bool)

(assert (=> mapNonEmpty!19728 m!434489))

(declare-fun m!434491 () Bool)

(assert (=> b!450633 m!434491))

(declare-fun m!434493 () Bool)

(assert (=> b!450624 m!434493))

(declare-fun m!434495 () Bool)

(assert (=> bm!29765 m!434495))

(declare-fun m!434497 () Bool)

(assert (=> b!450628 m!434497))

(declare-fun m!434499 () Bool)

(assert (=> b!450628 m!434499))

(declare-fun m!434501 () Bool)

(assert (=> b!450628 m!434501))

(declare-fun m!434503 () Bool)

(assert (=> start!40714 m!434503))

(declare-fun m!434505 () Bool)

(assert (=> start!40714 m!434505))

(declare-fun m!434507 () Bool)

(assert (=> b!450623 m!434507))

(declare-fun m!434509 () Bool)

(assert (=> b!450637 m!434509))

(assert (=> b!450637 m!434509))

(declare-fun m!434511 () Bool)

(assert (=> b!450637 m!434511))

(declare-fun m!434513 () Bool)

(assert (=> b!450637 m!434513))

(check-sat tp_is_empty!12063 (not b!450629) (not b!450624) (not b!450627) (not b!450619) (not start!40714) (not bm!29765) (not bm!29764) (not b!450637) (not b!450631) b_and!18733 (not b_next!10725) (not b!450633) (not b!450628) (not b!450620) (not mapNonEmpty!19728) (not b!450632))
(check-sat b_and!18733 (not b_next!10725))
