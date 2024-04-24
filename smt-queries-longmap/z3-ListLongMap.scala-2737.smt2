; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40226 () Bool)

(assert start!40226)

(declare-fun b_free!10507 () Bool)

(declare-fun b_next!10507 () Bool)

(assert (=> start!40226 (= b_free!10507 (not b_next!10507))))

(declare-fun tp!37050 () Bool)

(declare-fun b_and!18489 () Bool)

(assert (=> start!40226 (= tp!37050 b_and!18489)))

(declare-fun b!441475 () Bool)

(declare-fun e!259938 () Bool)

(assert (=> b!441475 (= e!259938 (not true))))

(declare-datatypes ((V!16651 0))(
  ( (V!16652 (val!5874 Int)) )
))
(declare-fun minValue!515 () V!16651)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5486 0))(
  ( (ValueCellFull!5486 (v!8122 V!16651)) (EmptyCell!5486) )
))
(declare-datatypes ((array!27136 0))(
  ( (array!27137 (arr!13017 (Array (_ BitVec 32) ValueCell!5486)) (size!13369 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27136)

(declare-fun zeroValue!515 () V!16651)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27138 0))(
  ( (array!27139 (arr!13018 (Array (_ BitVec 32) (_ BitVec 64))) (size!13370 (_ BitVec 32))) )
))
(declare-fun lt!202941 () array!27138)

(declare-fun _keys!709 () array!27138)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202943 () array!27136)

(declare-fun v!412 () V!16651)

(declare-datatypes ((tuple2!7718 0))(
  ( (tuple2!7719 (_1!3870 (_ BitVec 64)) (_2!3870 V!16651)) )
))
(declare-datatypes ((List!7709 0))(
  ( (Nil!7706) (Cons!7705 (h!8561 tuple2!7718) (t!13457 List!7709)) )
))
(declare-datatypes ((ListLongMap!6633 0))(
  ( (ListLongMap!6634 (toList!3332 List!7709)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1565 (array!27138 array!27136 (_ BitVec 32) (_ BitVec 32) V!16651 V!16651 (_ BitVec 32) Int) ListLongMap!6633)

(declare-fun +!1520 (ListLongMap!6633 tuple2!7718) ListLongMap!6633)

(assert (=> b!441475 (= (getCurrentListMapNoExtraKeys!1565 lt!202941 lt!202943 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1520 (getCurrentListMapNoExtraKeys!1565 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7719 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13115 0))(
  ( (Unit!13116) )
))
(declare-fun lt!202944 () Unit!13115)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!680 (array!27138 array!27136 (_ BitVec 32) (_ BitVec 32) V!16651 V!16651 (_ BitVec 32) (_ BitVec 64) V!16651 (_ BitVec 32) Int) Unit!13115)

(assert (=> b!441475 (= lt!202944 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441476 () Bool)

(declare-fun res!261384 () Bool)

(declare-fun e!259939 () Bool)

(assert (=> b!441476 (=> (not res!261384) (not e!259939))))

(assert (=> b!441476 (= res!261384 (and (= (size!13369 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13370 _keys!709) (size!13369 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441477 () Bool)

(declare-fun e!259935 () Bool)

(declare-fun tp_is_empty!11659 () Bool)

(assert (=> b!441477 (= e!259935 tp_is_empty!11659)))

(declare-fun b!441478 () Bool)

(declare-fun res!261382 () Bool)

(assert (=> b!441478 (=> (not res!261382) (not e!259939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27138 (_ BitVec 32)) Bool)

(assert (=> b!441478 (= res!261382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19110 () Bool)

(declare-fun mapRes!19110 () Bool)

(assert (=> mapIsEmpty!19110 mapRes!19110))

(declare-fun b!441479 () Bool)

(declare-fun res!261379 () Bool)

(assert (=> b!441479 (=> (not res!261379) (not e!259939))))

(assert (=> b!441479 (= res!261379 (or (= (select (arr!13018 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13018 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19110 () Bool)

(declare-fun tp!37049 () Bool)

(declare-fun e!259933 () Bool)

(assert (=> mapNonEmpty!19110 (= mapRes!19110 (and tp!37049 e!259933))))

(declare-fun mapKey!19110 () (_ BitVec 32))

(declare-fun mapRest!19110 () (Array (_ BitVec 32) ValueCell!5486))

(declare-fun mapValue!19110 () ValueCell!5486)

(assert (=> mapNonEmpty!19110 (= (arr!13017 _values!549) (store mapRest!19110 mapKey!19110 mapValue!19110))))

(declare-fun b!441480 () Bool)

(declare-fun res!261385 () Bool)

(declare-fun e!259936 () Bool)

(assert (=> b!441480 (=> (not res!261385) (not e!259936))))

(assert (=> b!441480 (= res!261385 (bvsle from!863 i!563))))

(declare-fun res!261378 () Bool)

(assert (=> start!40226 (=> (not res!261378) (not e!259939))))

(assert (=> start!40226 (= res!261378 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13370 _keys!709))))))

(assert (=> start!40226 e!259939))

(assert (=> start!40226 tp_is_empty!11659))

(assert (=> start!40226 tp!37050))

(assert (=> start!40226 true))

(declare-fun e!259934 () Bool)

(declare-fun array_inv!9512 (array!27136) Bool)

(assert (=> start!40226 (and (array_inv!9512 _values!549) e!259934)))

(declare-fun array_inv!9513 (array!27138) Bool)

(assert (=> start!40226 (array_inv!9513 _keys!709)))

(declare-fun b!441481 () Bool)

(declare-fun res!261386 () Bool)

(assert (=> b!441481 (=> (not res!261386) (not e!259939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441481 (= res!261386 (validKeyInArray!0 k0!794))))

(declare-fun b!441482 () Bool)

(assert (=> b!441482 (= e!259939 e!259936)))

(declare-fun res!261376 () Bool)

(assert (=> b!441482 (=> (not res!261376) (not e!259936))))

(assert (=> b!441482 (= res!261376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202941 mask!1025))))

(assert (=> b!441482 (= lt!202941 (array!27139 (store (arr!13018 _keys!709) i!563 k0!794) (size!13370 _keys!709)))))

(declare-fun b!441483 () Bool)

(assert (=> b!441483 (= e!259934 (and e!259935 mapRes!19110))))

(declare-fun condMapEmpty!19110 () Bool)

(declare-fun mapDefault!19110 () ValueCell!5486)

(assert (=> b!441483 (= condMapEmpty!19110 (= (arr!13017 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5486)) mapDefault!19110)))))

(declare-fun b!441484 () Bool)

(declare-fun res!261377 () Bool)

(assert (=> b!441484 (=> (not res!261377) (not e!259939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441484 (= res!261377 (validMask!0 mask!1025))))

(declare-fun b!441485 () Bool)

(declare-fun res!261380 () Bool)

(assert (=> b!441485 (=> (not res!261380) (not e!259939))))

(declare-fun arrayContainsKey!0 (array!27138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441485 (= res!261380 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441486 () Bool)

(assert (=> b!441486 (= e!259936 e!259938)))

(declare-fun res!261383 () Bool)

(assert (=> b!441486 (=> (not res!261383) (not e!259938))))

(assert (=> b!441486 (= res!261383 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202940 () ListLongMap!6633)

(assert (=> b!441486 (= lt!202940 (getCurrentListMapNoExtraKeys!1565 lt!202941 lt!202943 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441486 (= lt!202943 (array!27137 (store (arr!13017 _values!549) i!563 (ValueCellFull!5486 v!412)) (size!13369 _values!549)))))

(declare-fun lt!202942 () ListLongMap!6633)

(assert (=> b!441486 (= lt!202942 (getCurrentListMapNoExtraKeys!1565 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441487 () Bool)

(assert (=> b!441487 (= e!259933 tp_is_empty!11659)))

(declare-fun b!441488 () Bool)

(declare-fun res!261381 () Bool)

(assert (=> b!441488 (=> (not res!261381) (not e!259939))))

(assert (=> b!441488 (= res!261381 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13370 _keys!709))))))

(declare-fun b!441489 () Bool)

(declare-fun res!261387 () Bool)

(assert (=> b!441489 (=> (not res!261387) (not e!259939))))

(declare-datatypes ((List!7710 0))(
  ( (Nil!7707) (Cons!7706 (h!8562 (_ BitVec 64)) (t!13458 List!7710)) )
))
(declare-fun arrayNoDuplicates!0 (array!27138 (_ BitVec 32) List!7710) Bool)

(assert (=> b!441489 (= res!261387 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7707))))

(declare-fun b!441490 () Bool)

(declare-fun res!261375 () Bool)

(assert (=> b!441490 (=> (not res!261375) (not e!259936))))

(assert (=> b!441490 (= res!261375 (arrayNoDuplicates!0 lt!202941 #b00000000000000000000000000000000 Nil!7707))))

(assert (= (and start!40226 res!261378) b!441484))

(assert (= (and b!441484 res!261377) b!441476))

(assert (= (and b!441476 res!261384) b!441478))

(assert (= (and b!441478 res!261382) b!441489))

(assert (= (and b!441489 res!261387) b!441488))

(assert (= (and b!441488 res!261381) b!441481))

(assert (= (and b!441481 res!261386) b!441479))

(assert (= (and b!441479 res!261379) b!441485))

(assert (= (and b!441485 res!261380) b!441482))

(assert (= (and b!441482 res!261376) b!441490))

(assert (= (and b!441490 res!261375) b!441480))

(assert (= (and b!441480 res!261385) b!441486))

(assert (= (and b!441486 res!261383) b!441475))

(assert (= (and b!441483 condMapEmpty!19110) mapIsEmpty!19110))

(assert (= (and b!441483 (not condMapEmpty!19110)) mapNonEmpty!19110))

(get-info :version)

(assert (= (and mapNonEmpty!19110 ((_ is ValueCellFull!5486) mapValue!19110)) b!441487))

(assert (= (and b!441483 ((_ is ValueCellFull!5486) mapDefault!19110)) b!441477))

(assert (= start!40226 b!441483))

(declare-fun m!428561 () Bool)

(assert (=> b!441490 m!428561))

(declare-fun m!428563 () Bool)

(assert (=> start!40226 m!428563))

(declare-fun m!428565 () Bool)

(assert (=> start!40226 m!428565))

(declare-fun m!428567 () Bool)

(assert (=> b!441475 m!428567))

(declare-fun m!428569 () Bool)

(assert (=> b!441475 m!428569))

(assert (=> b!441475 m!428569))

(declare-fun m!428571 () Bool)

(assert (=> b!441475 m!428571))

(declare-fun m!428573 () Bool)

(assert (=> b!441475 m!428573))

(declare-fun m!428575 () Bool)

(assert (=> b!441486 m!428575))

(declare-fun m!428577 () Bool)

(assert (=> b!441486 m!428577))

(declare-fun m!428579 () Bool)

(assert (=> b!441486 m!428579))

(declare-fun m!428581 () Bool)

(assert (=> b!441478 m!428581))

(declare-fun m!428583 () Bool)

(assert (=> b!441489 m!428583))

(declare-fun m!428585 () Bool)

(assert (=> b!441482 m!428585))

(declare-fun m!428587 () Bool)

(assert (=> b!441482 m!428587))

(declare-fun m!428589 () Bool)

(assert (=> b!441485 m!428589))

(declare-fun m!428591 () Bool)

(assert (=> mapNonEmpty!19110 m!428591))

(declare-fun m!428593 () Bool)

(assert (=> b!441481 m!428593))

(declare-fun m!428595 () Bool)

(assert (=> b!441484 m!428595))

(declare-fun m!428597 () Bool)

(assert (=> b!441479 m!428597))

(check-sat (not b!441475) b_and!18489 (not mapNonEmpty!19110) (not b!441481) (not start!40226) (not b!441484) (not b!441485) (not b!441490) (not b!441489) tp_is_empty!11659 (not b!441482) (not b_next!10507) (not b!441478) (not b!441486))
(check-sat b_and!18489 (not b_next!10507))
