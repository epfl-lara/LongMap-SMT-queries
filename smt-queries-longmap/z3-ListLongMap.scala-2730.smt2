; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40184 () Bool)

(assert start!40184)

(declare-fun b_free!10465 () Bool)

(declare-fun b_next!10465 () Bool)

(assert (=> start!40184 (= b_free!10465 (not b_next!10465))))

(declare-fun tp!36923 () Bool)

(declare-fun b_and!18447 () Bool)

(assert (=> start!40184 (= tp!36923 b_and!18447)))

(declare-fun b!440467 () Bool)

(declare-fun res!260566 () Bool)

(declare-fun e!259495 () Bool)

(assert (=> b!440467 (=> (not res!260566) (not e!259495))))

(declare-datatypes ((array!27054 0))(
  ( (array!27055 (arr!12976 (Array (_ BitVec 32) (_ BitVec 64))) (size!13328 (_ BitVec 32))) )
))
(declare-fun lt!202627 () array!27054)

(declare-datatypes ((List!7674 0))(
  ( (Nil!7671) (Cons!7670 (h!8526 (_ BitVec 64)) (t!13422 List!7674)) )
))
(declare-fun arrayNoDuplicates!0 (array!27054 (_ BitVec 32) List!7674) Bool)

(assert (=> b!440467 (= res!260566 (arrayNoDuplicates!0 lt!202627 #b00000000000000000000000000000000 Nil!7671))))

(declare-fun b!440468 () Bool)

(declare-fun res!260568 () Bool)

(declare-fun e!259494 () Bool)

(assert (=> b!440468 (=> (not res!260568) (not e!259494))))

(declare-fun _keys!709 () array!27054)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440468 (= res!260568 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440469 () Bool)

(declare-fun res!260564 () Bool)

(assert (=> b!440469 (=> (not res!260564) (not e!259494))))

(declare-datatypes ((V!16595 0))(
  ( (V!16596 (val!5853 Int)) )
))
(declare-datatypes ((ValueCell!5465 0))(
  ( (ValueCellFull!5465 (v!8101 V!16595)) (EmptyCell!5465) )
))
(declare-datatypes ((array!27056 0))(
  ( (array!27057 (arr!12977 (Array (_ BitVec 32) ValueCell!5465)) (size!13329 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27056)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!440469 (= res!260564 (and (= (size!13329 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13328 _keys!709) (size!13329 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440470 () Bool)

(declare-fun res!260562 () Bool)

(assert (=> b!440470 (=> (not res!260562) (not e!259495))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440470 (= res!260562 (bvsle from!863 i!563))))

(declare-fun b!440471 () Bool)

(assert (=> b!440471 (= e!259494 e!259495)))

(declare-fun res!260559 () Bool)

(assert (=> b!440471 (=> (not res!260559) (not e!259495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27054 (_ BitVec 32)) Bool)

(assert (=> b!440471 (= res!260559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202627 mask!1025))))

(assert (=> b!440471 (= lt!202627 (array!27055 (store (arr!12976 _keys!709) i!563 k0!794) (size!13328 _keys!709)))))

(declare-fun b!440472 () Bool)

(declare-fun res!260560 () Bool)

(assert (=> b!440472 (=> (not res!260560) (not e!259494))))

(assert (=> b!440472 (= res!260560 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7671))))

(declare-fun b!440473 () Bool)

(declare-fun e!259498 () Bool)

(assert (=> b!440473 (= e!259498 (not true))))

(declare-fun minValue!515 () V!16595)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16595)

(declare-fun lt!202625 () array!27056)

(declare-fun v!412 () V!16595)

(declare-datatypes ((tuple2!7686 0))(
  ( (tuple2!7687 (_1!3854 (_ BitVec 64)) (_2!3854 V!16595)) )
))
(declare-datatypes ((List!7675 0))(
  ( (Nil!7672) (Cons!7671 (h!8527 tuple2!7686) (t!13423 List!7675)) )
))
(declare-datatypes ((ListLongMap!6601 0))(
  ( (ListLongMap!6602 (toList!3316 List!7675)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1549 (array!27054 array!27056 (_ BitVec 32) (_ BitVec 32) V!16595 V!16595 (_ BitVec 32) Int) ListLongMap!6601)

(declare-fun +!1507 (ListLongMap!6601 tuple2!7686) ListLongMap!6601)

(assert (=> b!440473 (= (getCurrentListMapNoExtraKeys!1549 lt!202627 lt!202625 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1507 (getCurrentListMapNoExtraKeys!1549 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7687 k0!794 v!412)))))

(declare-datatypes ((Unit!13089 0))(
  ( (Unit!13090) )
))
(declare-fun lt!202629 () Unit!13089)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!667 (array!27054 array!27056 (_ BitVec 32) (_ BitVec 32) V!16595 V!16595 (_ BitVec 32) (_ BitVec 64) V!16595 (_ BitVec 32) Int) Unit!13089)

(assert (=> b!440473 (= lt!202629 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!667 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440474 () Bool)

(declare-fun res!260567 () Bool)

(assert (=> b!440474 (=> (not res!260567) (not e!259494))))

(assert (=> b!440474 (= res!260567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440475 () Bool)

(declare-fun res!260563 () Bool)

(assert (=> b!440475 (=> (not res!260563) (not e!259494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440475 (= res!260563 (validMask!0 mask!1025))))

(declare-fun b!440476 () Bool)

(declare-fun res!260561 () Bool)

(assert (=> b!440476 (=> (not res!260561) (not e!259494))))

(assert (=> b!440476 (= res!260561 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13328 _keys!709))))))

(declare-fun res!260565 () Bool)

(assert (=> start!40184 (=> (not res!260565) (not e!259494))))

(assert (=> start!40184 (= res!260565 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13328 _keys!709))))))

(assert (=> start!40184 e!259494))

(declare-fun tp_is_empty!11617 () Bool)

(assert (=> start!40184 tp_is_empty!11617))

(assert (=> start!40184 tp!36923))

(assert (=> start!40184 true))

(declare-fun e!259492 () Bool)

(declare-fun array_inv!9488 (array!27056) Bool)

(assert (=> start!40184 (and (array_inv!9488 _values!549) e!259492)))

(declare-fun array_inv!9489 (array!27054) Bool)

(assert (=> start!40184 (array_inv!9489 _keys!709)))

(declare-fun b!440477 () Bool)

(declare-fun res!260556 () Bool)

(assert (=> b!440477 (=> (not res!260556) (not e!259494))))

(assert (=> b!440477 (= res!260556 (or (= (select (arr!12976 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12976 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440478 () Bool)

(declare-fun e!259496 () Bool)

(assert (=> b!440478 (= e!259496 tp_is_empty!11617)))

(declare-fun b!440479 () Bool)

(assert (=> b!440479 (= e!259495 e!259498)))

(declare-fun res!260558 () Bool)

(assert (=> b!440479 (=> (not res!260558) (not e!259498))))

(assert (=> b!440479 (= res!260558 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202626 () ListLongMap!6601)

(assert (=> b!440479 (= lt!202626 (getCurrentListMapNoExtraKeys!1549 lt!202627 lt!202625 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440479 (= lt!202625 (array!27057 (store (arr!12977 _values!549) i!563 (ValueCellFull!5465 v!412)) (size!13329 _values!549)))))

(declare-fun lt!202628 () ListLongMap!6601)

(assert (=> b!440479 (= lt!202628 (getCurrentListMapNoExtraKeys!1549 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440480 () Bool)

(declare-fun e!259497 () Bool)

(declare-fun mapRes!19047 () Bool)

(assert (=> b!440480 (= e!259492 (and e!259497 mapRes!19047))))

(declare-fun condMapEmpty!19047 () Bool)

(declare-fun mapDefault!19047 () ValueCell!5465)

(assert (=> b!440480 (= condMapEmpty!19047 (= (arr!12977 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5465)) mapDefault!19047)))))

(declare-fun mapIsEmpty!19047 () Bool)

(assert (=> mapIsEmpty!19047 mapRes!19047))

(declare-fun b!440481 () Bool)

(assert (=> b!440481 (= e!259497 tp_is_empty!11617)))

(declare-fun mapNonEmpty!19047 () Bool)

(declare-fun tp!36924 () Bool)

(assert (=> mapNonEmpty!19047 (= mapRes!19047 (and tp!36924 e!259496))))

(declare-fun mapKey!19047 () (_ BitVec 32))

(declare-fun mapRest!19047 () (Array (_ BitVec 32) ValueCell!5465))

(declare-fun mapValue!19047 () ValueCell!5465)

(assert (=> mapNonEmpty!19047 (= (arr!12977 _values!549) (store mapRest!19047 mapKey!19047 mapValue!19047))))

(declare-fun b!440482 () Bool)

(declare-fun res!260557 () Bool)

(assert (=> b!440482 (=> (not res!260557) (not e!259494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440482 (= res!260557 (validKeyInArray!0 k0!794))))

(assert (= (and start!40184 res!260565) b!440475))

(assert (= (and b!440475 res!260563) b!440469))

(assert (= (and b!440469 res!260564) b!440474))

(assert (= (and b!440474 res!260567) b!440472))

(assert (= (and b!440472 res!260560) b!440476))

(assert (= (and b!440476 res!260561) b!440482))

(assert (= (and b!440482 res!260557) b!440477))

(assert (= (and b!440477 res!260556) b!440468))

(assert (= (and b!440468 res!260568) b!440471))

(assert (= (and b!440471 res!260559) b!440467))

(assert (= (and b!440467 res!260566) b!440470))

(assert (= (and b!440470 res!260562) b!440479))

(assert (= (and b!440479 res!260558) b!440473))

(assert (= (and b!440480 condMapEmpty!19047) mapIsEmpty!19047))

(assert (= (and b!440480 (not condMapEmpty!19047)) mapNonEmpty!19047))

(get-info :version)

(assert (= (and mapNonEmpty!19047 ((_ is ValueCellFull!5465) mapValue!19047)) b!440478))

(assert (= (and b!440480 ((_ is ValueCellFull!5465) mapDefault!19047)) b!440481))

(assert (= start!40184 b!440480))

(declare-fun m!427763 () Bool)

(assert (=> mapNonEmpty!19047 m!427763))

(declare-fun m!427765 () Bool)

(assert (=> b!440471 m!427765))

(declare-fun m!427767 () Bool)

(assert (=> b!440471 m!427767))

(declare-fun m!427769 () Bool)

(assert (=> b!440472 m!427769))

(declare-fun m!427771 () Bool)

(assert (=> b!440474 m!427771))

(declare-fun m!427773 () Bool)

(assert (=> b!440468 m!427773))

(declare-fun m!427775 () Bool)

(assert (=> b!440467 m!427775))

(declare-fun m!427777 () Bool)

(assert (=> b!440479 m!427777))

(declare-fun m!427779 () Bool)

(assert (=> b!440479 m!427779))

(declare-fun m!427781 () Bool)

(assert (=> b!440479 m!427781))

(declare-fun m!427783 () Bool)

(assert (=> b!440477 m!427783))

(declare-fun m!427785 () Bool)

(assert (=> start!40184 m!427785))

(declare-fun m!427787 () Bool)

(assert (=> start!40184 m!427787))

(declare-fun m!427789 () Bool)

(assert (=> b!440473 m!427789))

(declare-fun m!427791 () Bool)

(assert (=> b!440473 m!427791))

(assert (=> b!440473 m!427791))

(declare-fun m!427793 () Bool)

(assert (=> b!440473 m!427793))

(declare-fun m!427795 () Bool)

(assert (=> b!440473 m!427795))

(declare-fun m!427797 () Bool)

(assert (=> b!440475 m!427797))

(declare-fun m!427799 () Bool)

(assert (=> b!440482 m!427799))

(check-sat (not b!440475) (not b!440474) (not b!440479) b_and!18447 (not start!40184) (not b!440467) (not b_next!10465) (not b!440472) tp_is_empty!11617 (not b!440473) (not b!440471) (not mapNonEmpty!19047) (not b!440482) (not b!440468))
(check-sat b_and!18447 (not b_next!10465))
