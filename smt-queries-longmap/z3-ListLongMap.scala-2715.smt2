; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40110 () Bool)

(assert start!40110)

(declare-fun b_free!10377 () Bool)

(declare-fun b_next!10377 () Bool)

(assert (=> start!40110 (= b_free!10377 (not b_next!10377))))

(declare-fun tp!36660 () Bool)

(declare-fun b_and!18345 () Bool)

(assert (=> start!40110 (= tp!36660 b_and!18345)))

(declare-fun b!438405 () Bool)

(declare-fun e!258602 () Bool)

(declare-fun e!258600 () Bool)

(assert (=> b!438405 (= e!258602 e!258600)))

(declare-fun res!258850 () Bool)

(assert (=> b!438405 (=> (not res!258850) (not e!258600))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438405 (= res!258850 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16477 0))(
  ( (V!16478 (val!5809 Int)) )
))
(declare-fun minValue!515 () V!16477)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5421 0))(
  ( (ValueCellFull!5421 (v!8056 V!16477)) (EmptyCell!5421) )
))
(declare-datatypes ((array!26875 0))(
  ( (array!26876 (arr!12887 (Array (_ BitVec 32) ValueCell!5421)) (size!13239 (_ BitVec 32))) )
))
(declare-fun lt!201948 () array!26875)

(declare-datatypes ((tuple2!7704 0))(
  ( (tuple2!7705 (_1!3863 (_ BitVec 64)) (_2!3863 V!16477)) )
))
(declare-datatypes ((List!7703 0))(
  ( (Nil!7700) (Cons!7699 (h!8555 tuple2!7704) (t!13459 List!7703)) )
))
(declare-datatypes ((ListLongMap!6617 0))(
  ( (ListLongMap!6618 (toList!3324 List!7703)) )
))
(declare-fun lt!201949 () ListLongMap!6617)

(declare-fun zeroValue!515 () V!16477)

(declare-datatypes ((array!26877 0))(
  ( (array!26878 (arr!12888 (Array (_ BitVec 32) (_ BitVec 64))) (size!13240 (_ BitVec 32))) )
))
(declare-fun lt!201950 () array!26877)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1513 (array!26877 array!26875 (_ BitVec 32) (_ BitVec 32) V!16477 V!16477 (_ BitVec 32) Int) ListLongMap!6617)

(assert (=> b!438405 (= lt!201949 (getCurrentListMapNoExtraKeys!1513 lt!201950 lt!201948 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26875)

(declare-fun v!412 () V!16477)

(assert (=> b!438405 (= lt!201948 (array!26876 (store (arr!12887 _values!549) i!563 (ValueCellFull!5421 v!412)) (size!13239 _values!549)))))

(declare-fun lt!201946 () ListLongMap!6617)

(declare-fun _keys!709 () array!26877)

(assert (=> b!438405 (= lt!201946 (getCurrentListMapNoExtraKeys!1513 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438406 () Bool)

(declare-fun e!258603 () Bool)

(declare-fun tp_is_empty!11529 () Bool)

(assert (=> b!438406 (= e!258603 tp_is_empty!11529)))

(declare-fun mapNonEmpty!18915 () Bool)

(declare-fun mapRes!18915 () Bool)

(declare-fun tp!36659 () Bool)

(declare-fun e!258606 () Bool)

(assert (=> mapNonEmpty!18915 (= mapRes!18915 (and tp!36659 e!258606))))

(declare-fun mapKey!18915 () (_ BitVec 32))

(declare-fun mapRest!18915 () (Array (_ BitVec 32) ValueCell!5421))

(declare-fun mapValue!18915 () ValueCell!5421)

(assert (=> mapNonEmpty!18915 (= (arr!12887 _values!549) (store mapRest!18915 mapKey!18915 mapValue!18915))))

(declare-fun b!438407 () Bool)

(declare-fun res!258852 () Bool)

(assert (=> b!438407 (=> (not res!258852) (not e!258602))))

(assert (=> b!438407 (= res!258852 (bvsle from!863 i!563))))

(declare-fun b!438408 () Bool)

(assert (=> b!438408 (= e!258606 tp_is_empty!11529)))

(declare-fun b!438409 () Bool)

(declare-fun e!258601 () Bool)

(assert (=> b!438409 (= e!258601 e!258602)))

(declare-fun res!258853 () Bool)

(assert (=> b!438409 (=> (not res!258853) (not e!258602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26877 (_ BitVec 32)) Bool)

(assert (=> b!438409 (= res!258853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201950 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!438409 (= lt!201950 (array!26878 (store (arr!12888 _keys!709) i!563 k0!794) (size!13240 _keys!709)))))

(declare-fun b!438410 () Bool)

(declare-fun res!258846 () Bool)

(assert (=> b!438410 (=> (not res!258846) (not e!258601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438410 (= res!258846 (validKeyInArray!0 k0!794))))

(declare-fun b!438411 () Bool)

(declare-fun res!258844 () Bool)

(assert (=> b!438411 (=> (not res!258844) (not e!258601))))

(assert (=> b!438411 (= res!258844 (or (= (select (arr!12888 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12888 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438412 () Bool)

(declare-fun res!258851 () Bool)

(assert (=> b!438412 (=> (not res!258851) (not e!258601))))

(assert (=> b!438412 (= res!258851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438413 () Bool)

(assert (=> b!438413 (= e!258600 (not true))))

(declare-fun +!1467 (ListLongMap!6617 tuple2!7704) ListLongMap!6617)

(assert (=> b!438413 (= (getCurrentListMapNoExtraKeys!1513 lt!201950 lt!201948 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1467 (getCurrentListMapNoExtraKeys!1513 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7705 k0!794 v!412)))))

(declare-datatypes ((Unit!13038 0))(
  ( (Unit!13039) )
))
(declare-fun lt!201947 () Unit!13038)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!636 (array!26877 array!26875 (_ BitVec 32) (_ BitVec 32) V!16477 V!16477 (_ BitVec 32) (_ BitVec 64) V!16477 (_ BitVec 32) Int) Unit!13038)

(assert (=> b!438413 (= lt!201947 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!636 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438414 () Bool)

(declare-fun res!258848 () Bool)

(assert (=> b!438414 (=> (not res!258848) (not e!258602))))

(declare-datatypes ((List!7704 0))(
  ( (Nil!7701) (Cons!7700 (h!8556 (_ BitVec 64)) (t!13460 List!7704)) )
))
(declare-fun arrayNoDuplicates!0 (array!26877 (_ BitVec 32) List!7704) Bool)

(assert (=> b!438414 (= res!258848 (arrayNoDuplicates!0 lt!201950 #b00000000000000000000000000000000 Nil!7701))))

(declare-fun res!258847 () Bool)

(assert (=> start!40110 (=> (not res!258847) (not e!258601))))

(assert (=> start!40110 (= res!258847 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13240 _keys!709))))))

(assert (=> start!40110 e!258601))

(assert (=> start!40110 tp_is_empty!11529))

(assert (=> start!40110 tp!36660))

(assert (=> start!40110 true))

(declare-fun e!258605 () Bool)

(declare-fun array_inv!9360 (array!26875) Bool)

(assert (=> start!40110 (and (array_inv!9360 _values!549) e!258605)))

(declare-fun array_inv!9361 (array!26877) Bool)

(assert (=> start!40110 (array_inv!9361 _keys!709)))

(declare-fun b!438404 () Bool)

(declare-fun res!258855 () Bool)

(assert (=> b!438404 (=> (not res!258855) (not e!258601))))

(assert (=> b!438404 (= res!258855 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7701))))

(declare-fun b!438415 () Bool)

(declare-fun res!258845 () Bool)

(assert (=> b!438415 (=> (not res!258845) (not e!258601))))

(declare-fun arrayContainsKey!0 (array!26877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438415 (= res!258845 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18915 () Bool)

(assert (=> mapIsEmpty!18915 mapRes!18915))

(declare-fun b!438416 () Bool)

(declare-fun res!258849 () Bool)

(assert (=> b!438416 (=> (not res!258849) (not e!258601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438416 (= res!258849 (validMask!0 mask!1025))))

(declare-fun b!438417 () Bool)

(assert (=> b!438417 (= e!258605 (and e!258603 mapRes!18915))))

(declare-fun condMapEmpty!18915 () Bool)

(declare-fun mapDefault!18915 () ValueCell!5421)

(assert (=> b!438417 (= condMapEmpty!18915 (= (arr!12887 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5421)) mapDefault!18915)))))

(declare-fun b!438418 () Bool)

(declare-fun res!258843 () Bool)

(assert (=> b!438418 (=> (not res!258843) (not e!258601))))

(assert (=> b!438418 (= res!258843 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13240 _keys!709))))))

(declare-fun b!438419 () Bool)

(declare-fun res!258854 () Bool)

(assert (=> b!438419 (=> (not res!258854) (not e!258601))))

(assert (=> b!438419 (= res!258854 (and (= (size!13239 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13240 _keys!709) (size!13239 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40110 res!258847) b!438416))

(assert (= (and b!438416 res!258849) b!438419))

(assert (= (and b!438419 res!258854) b!438412))

(assert (= (and b!438412 res!258851) b!438404))

(assert (= (and b!438404 res!258855) b!438418))

(assert (= (and b!438418 res!258843) b!438410))

(assert (= (and b!438410 res!258846) b!438411))

(assert (= (and b!438411 res!258844) b!438415))

(assert (= (and b!438415 res!258845) b!438409))

(assert (= (and b!438409 res!258853) b!438414))

(assert (= (and b!438414 res!258848) b!438407))

(assert (= (and b!438407 res!258852) b!438405))

(assert (= (and b!438405 res!258850) b!438413))

(assert (= (and b!438417 condMapEmpty!18915) mapIsEmpty!18915))

(assert (= (and b!438417 (not condMapEmpty!18915)) mapNonEmpty!18915))

(get-info :version)

(assert (= (and mapNonEmpty!18915 ((_ is ValueCellFull!5421) mapValue!18915)) b!438408))

(assert (= (and b!438417 ((_ is ValueCellFull!5421) mapDefault!18915)) b!438406))

(assert (= start!40110 b!438417))

(declare-fun m!425873 () Bool)

(assert (=> b!438404 m!425873))

(declare-fun m!425875 () Bool)

(assert (=> b!438414 m!425875))

(declare-fun m!425877 () Bool)

(assert (=> b!438405 m!425877))

(declare-fun m!425879 () Bool)

(assert (=> b!438405 m!425879))

(declare-fun m!425881 () Bool)

(assert (=> b!438405 m!425881))

(declare-fun m!425883 () Bool)

(assert (=> b!438413 m!425883))

(declare-fun m!425885 () Bool)

(assert (=> b!438413 m!425885))

(assert (=> b!438413 m!425885))

(declare-fun m!425887 () Bool)

(assert (=> b!438413 m!425887))

(declare-fun m!425889 () Bool)

(assert (=> b!438413 m!425889))

(declare-fun m!425891 () Bool)

(assert (=> b!438411 m!425891))

(declare-fun m!425893 () Bool)

(assert (=> b!438410 m!425893))

(declare-fun m!425895 () Bool)

(assert (=> b!438409 m!425895))

(declare-fun m!425897 () Bool)

(assert (=> b!438409 m!425897))

(declare-fun m!425899 () Bool)

(assert (=> b!438412 m!425899))

(declare-fun m!425901 () Bool)

(assert (=> mapNonEmpty!18915 m!425901))

(declare-fun m!425903 () Bool)

(assert (=> b!438416 m!425903))

(declare-fun m!425905 () Bool)

(assert (=> b!438415 m!425905))

(declare-fun m!425907 () Bool)

(assert (=> start!40110 m!425907))

(declare-fun m!425909 () Bool)

(assert (=> start!40110 m!425909))

(check-sat tp_is_empty!11529 b_and!18345 (not b!438412) (not start!40110) (not b!438404) (not b_next!10377) (not b!438410) (not b!438414) (not mapNonEmpty!18915) (not b!438405) (not b!438413) (not b!438416) (not b!438409) (not b!438415))
(check-sat b_and!18345 (not b_next!10377))
