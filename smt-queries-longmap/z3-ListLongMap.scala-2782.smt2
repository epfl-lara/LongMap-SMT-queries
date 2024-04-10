; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40582 () Bool)

(assert start!40582)

(declare-fun b_free!10593 () Bool)

(declare-fun b_next!10593 () Bool)

(assert (=> start!40582 (= b_free!10593 (not b_next!10593))))

(declare-fun tp!37598 () Bool)

(declare-fun b_and!18601 () Bool)

(assert (=> start!40582 (= tp!37598 b_and!18601)))

(declare-fun b!447512 () Bool)

(declare-fun e!262760 () Bool)

(assert (=> b!447512 (= e!262760 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17013 0))(
  ( (V!17014 (val!6010 Int)) )
))
(declare-fun minValue!515 () V!17013)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7882 0))(
  ( (tuple2!7883 (_1!3952 (_ BitVec 64)) (_2!3952 V!17013)) )
))
(declare-datatypes ((List!7946 0))(
  ( (Nil!7943) (Cons!7942 (h!8798 tuple2!7882) (t!13708 List!7946)) )
))
(declare-datatypes ((ListLongMap!6795 0))(
  ( (ListLongMap!6796 (toList!3413 List!7946)) )
))
(declare-fun lt!203980 () ListLongMap!6795)

(declare-datatypes ((ValueCell!5622 0))(
  ( (ValueCellFull!5622 (v!8265 V!17013)) (EmptyCell!5622) )
))
(declare-datatypes ((array!27669 0))(
  ( (array!27670 (arr!13280 (Array (_ BitVec 32) ValueCell!5622)) (size!13632 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27669)

(declare-fun zeroValue!515 () V!17013)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17013)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27671 0))(
  ( (array!27672 (arr!13281 (Array (_ BitVec 32) (_ BitVec 64))) (size!13633 (_ BitVec 32))) )
))
(declare-fun lt!203982 () array!27671)

(declare-fun getCurrentListMapNoExtraKeys!1599 (array!27671 array!27669 (_ BitVec 32) (_ BitVec 32) V!17013 V!17013 (_ BitVec 32) Int) ListLongMap!6795)

(assert (=> b!447512 (= lt!203980 (getCurrentListMapNoExtraKeys!1599 lt!203982 (array!27670 (store (arr!13280 _values!549) i!563 (ValueCellFull!5622 v!412)) (size!13632 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203981 () ListLongMap!6795)

(declare-fun _keys!709 () array!27671)

(assert (=> b!447512 (= lt!203981 (getCurrentListMapNoExtraKeys!1599 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447513 () Bool)

(declare-fun res!265794 () Bool)

(declare-fun e!262756 () Bool)

(assert (=> b!447513 (=> (not res!265794) (not e!262756))))

(assert (=> b!447513 (= res!265794 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13633 _keys!709))))))

(declare-fun b!447514 () Bool)

(declare-fun e!262757 () Bool)

(declare-fun tp_is_empty!11931 () Bool)

(assert (=> b!447514 (= e!262757 tp_is_empty!11931)))

(declare-fun b!447515 () Bool)

(declare-fun res!265802 () Bool)

(assert (=> b!447515 (=> (not res!265802) (not e!262760))))

(assert (=> b!447515 (= res!265802 (bvsle from!863 i!563))))

(declare-fun b!447516 () Bool)

(declare-fun e!262759 () Bool)

(assert (=> b!447516 (= e!262759 tp_is_empty!11931)))

(declare-fun b!447517 () Bool)

(declare-fun res!265796 () Bool)

(assert (=> b!447517 (=> (not res!265796) (not e!262756))))

(assert (=> b!447517 (= res!265796 (or (= (select (arr!13281 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13281 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447518 () Bool)

(declare-fun res!265800 () Bool)

(assert (=> b!447518 (=> (not res!265800) (not e!262756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27671 (_ BitVec 32)) Bool)

(assert (=> b!447518 (= res!265800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447519 () Bool)

(declare-fun res!265797 () Bool)

(assert (=> b!447519 (=> (not res!265797) (not e!262756))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447519 (= res!265797 (validKeyInArray!0 k0!794))))

(declare-fun res!265795 () Bool)

(assert (=> start!40582 (=> (not res!265795) (not e!262756))))

(assert (=> start!40582 (= res!265795 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13633 _keys!709))))))

(assert (=> start!40582 e!262756))

(assert (=> start!40582 tp_is_empty!11931))

(assert (=> start!40582 tp!37598))

(assert (=> start!40582 true))

(declare-fun e!262755 () Bool)

(declare-fun array_inv!9628 (array!27669) Bool)

(assert (=> start!40582 (and (array_inv!9628 _values!549) e!262755)))

(declare-fun array_inv!9629 (array!27671) Bool)

(assert (=> start!40582 (array_inv!9629 _keys!709)))

(declare-fun b!447520 () Bool)

(declare-fun mapRes!19530 () Bool)

(assert (=> b!447520 (= e!262755 (and e!262759 mapRes!19530))))

(declare-fun condMapEmpty!19530 () Bool)

(declare-fun mapDefault!19530 () ValueCell!5622)

(assert (=> b!447520 (= condMapEmpty!19530 (= (arr!13280 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5622)) mapDefault!19530)))))

(declare-fun b!447521 () Bool)

(assert (=> b!447521 (= e!262756 e!262760)))

(declare-fun res!265799 () Bool)

(assert (=> b!447521 (=> (not res!265799) (not e!262760))))

(assert (=> b!447521 (= res!265799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203982 mask!1025))))

(assert (=> b!447521 (= lt!203982 (array!27672 (store (arr!13281 _keys!709) i!563 k0!794) (size!13633 _keys!709)))))

(declare-fun b!447522 () Bool)

(declare-fun res!265792 () Bool)

(assert (=> b!447522 (=> (not res!265792) (not e!262756))))

(assert (=> b!447522 (= res!265792 (and (= (size!13632 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13633 _keys!709) (size!13632 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447523 () Bool)

(declare-fun res!265793 () Bool)

(assert (=> b!447523 (=> (not res!265793) (not e!262756))))

(declare-datatypes ((List!7947 0))(
  ( (Nil!7944) (Cons!7943 (h!8799 (_ BitVec 64)) (t!13709 List!7947)) )
))
(declare-fun arrayNoDuplicates!0 (array!27671 (_ BitVec 32) List!7947) Bool)

(assert (=> b!447523 (= res!265793 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7944))))

(declare-fun b!447524 () Bool)

(declare-fun res!265801 () Bool)

(assert (=> b!447524 (=> (not res!265801) (not e!262756))))

(declare-fun arrayContainsKey!0 (array!27671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447524 (= res!265801 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19530 () Bool)

(declare-fun tp!37599 () Bool)

(assert (=> mapNonEmpty!19530 (= mapRes!19530 (and tp!37599 e!262757))))

(declare-fun mapValue!19530 () ValueCell!5622)

(declare-fun mapKey!19530 () (_ BitVec 32))

(declare-fun mapRest!19530 () (Array (_ BitVec 32) ValueCell!5622))

(assert (=> mapNonEmpty!19530 (= (arr!13280 _values!549) (store mapRest!19530 mapKey!19530 mapValue!19530))))

(declare-fun b!447525 () Bool)

(declare-fun res!265798 () Bool)

(assert (=> b!447525 (=> (not res!265798) (not e!262760))))

(assert (=> b!447525 (= res!265798 (arrayNoDuplicates!0 lt!203982 #b00000000000000000000000000000000 Nil!7944))))

(declare-fun mapIsEmpty!19530 () Bool)

(assert (=> mapIsEmpty!19530 mapRes!19530))

(declare-fun b!447526 () Bool)

(declare-fun res!265803 () Bool)

(assert (=> b!447526 (=> (not res!265803) (not e!262756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447526 (= res!265803 (validMask!0 mask!1025))))

(assert (= (and start!40582 res!265795) b!447526))

(assert (= (and b!447526 res!265803) b!447522))

(assert (= (and b!447522 res!265792) b!447518))

(assert (= (and b!447518 res!265800) b!447523))

(assert (= (and b!447523 res!265793) b!447513))

(assert (= (and b!447513 res!265794) b!447519))

(assert (= (and b!447519 res!265797) b!447517))

(assert (= (and b!447517 res!265796) b!447524))

(assert (= (and b!447524 res!265801) b!447521))

(assert (= (and b!447521 res!265799) b!447525))

(assert (= (and b!447525 res!265798) b!447515))

(assert (= (and b!447515 res!265802) b!447512))

(assert (= (and b!447520 condMapEmpty!19530) mapIsEmpty!19530))

(assert (= (and b!447520 (not condMapEmpty!19530)) mapNonEmpty!19530))

(get-info :version)

(assert (= (and mapNonEmpty!19530 ((_ is ValueCellFull!5622) mapValue!19530)) b!447514))

(assert (= (and b!447520 ((_ is ValueCellFull!5622) mapDefault!19530)) b!447516))

(assert (= start!40582 b!447520))

(declare-fun m!432373 () Bool)

(assert (=> b!447523 m!432373))

(declare-fun m!432375 () Bool)

(assert (=> b!447524 m!432375))

(declare-fun m!432377 () Bool)

(assert (=> start!40582 m!432377))

(declare-fun m!432379 () Bool)

(assert (=> start!40582 m!432379))

(declare-fun m!432381 () Bool)

(assert (=> b!447517 m!432381))

(declare-fun m!432383 () Bool)

(assert (=> b!447526 m!432383))

(declare-fun m!432385 () Bool)

(assert (=> b!447519 m!432385))

(declare-fun m!432387 () Bool)

(assert (=> b!447518 m!432387))

(declare-fun m!432389 () Bool)

(assert (=> b!447525 m!432389))

(declare-fun m!432391 () Bool)

(assert (=> b!447512 m!432391))

(declare-fun m!432393 () Bool)

(assert (=> b!447512 m!432393))

(declare-fun m!432395 () Bool)

(assert (=> b!447512 m!432395))

(declare-fun m!432397 () Bool)

(assert (=> b!447521 m!432397))

(declare-fun m!432399 () Bool)

(assert (=> b!447521 m!432399))

(declare-fun m!432401 () Bool)

(assert (=> mapNonEmpty!19530 m!432401))

(check-sat (not b!447526) b_and!18601 (not b!447521) (not b!447518) (not b_next!10593) (not b!447525) (not b!447523) (not b!447519) (not b!447512) (not start!40582) (not b!447524) (not mapNonEmpty!19530) tp_is_empty!11931)
(check-sat b_and!18601 (not b_next!10593))
