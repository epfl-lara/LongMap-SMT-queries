; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40248 () Bool)

(assert start!40248)

(declare-fun b_free!10515 () Bool)

(declare-fun b_next!10515 () Bool)

(assert (=> start!40248 (= b_free!10515 (not b_next!10515))))

(declare-fun tp!37073 () Bool)

(declare-fun b_and!18483 () Bool)

(assert (=> start!40248 (= tp!37073 b_and!18483)))

(declare-fun b!441716 () Bool)

(declare-fun res!261539 () Bool)

(declare-fun e!260049 () Bool)

(assert (=> b!441716 (=> (not res!261539) (not e!260049))))

(declare-datatypes ((array!27145 0))(
  ( (array!27146 (arr!13022 (Array (_ BitVec 32) (_ BitVec 64))) (size!13374 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27145)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441716 (= res!261539 (or (= (select (arr!13022 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13022 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441717 () Bool)

(declare-fun res!261542 () Bool)

(declare-fun e!260051 () Bool)

(assert (=> b!441717 (=> (not res!261542) (not e!260051))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!441717 (= res!261542 (bvsle from!863 i!563))))

(declare-fun b!441718 () Bool)

(declare-fun res!261535 () Bool)

(assert (=> b!441718 (=> (not res!261535) (not e!260049))))

(assert (=> b!441718 (= res!261535 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13374 _keys!709))))))

(declare-fun mapNonEmpty!19122 () Bool)

(declare-fun mapRes!19122 () Bool)

(declare-fun tp!37074 () Bool)

(declare-fun e!260050 () Bool)

(assert (=> mapNonEmpty!19122 (= mapRes!19122 (and tp!37074 e!260050))))

(declare-datatypes ((V!16661 0))(
  ( (V!16662 (val!5878 Int)) )
))
(declare-datatypes ((ValueCell!5490 0))(
  ( (ValueCellFull!5490 (v!8125 V!16661)) (EmptyCell!5490) )
))
(declare-fun mapRest!19122 () (Array (_ BitVec 32) ValueCell!5490))

(declare-fun mapValue!19122 () ValueCell!5490)

(declare-datatypes ((array!27147 0))(
  ( (array!27148 (arr!13023 (Array (_ BitVec 32) ValueCell!5490)) (size!13375 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27147)

(declare-fun mapKey!19122 () (_ BitVec 32))

(assert (=> mapNonEmpty!19122 (= (arr!13023 _values!549) (store mapRest!19122 mapKey!19122 mapValue!19122))))

(declare-fun b!441719 () Bool)

(declare-fun res!261544 () Bool)

(assert (=> b!441719 (=> (not res!261544) (not e!260049))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27145 (_ BitVec 32)) Bool)

(assert (=> b!441719 (= res!261544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441720 () Bool)

(declare-fun res!261536 () Bool)

(assert (=> b!441720 (=> (not res!261536) (not e!260049))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441720 (= res!261536 (validKeyInArray!0 k0!794))))

(declare-fun b!441721 () Bool)

(declare-fun res!261540 () Bool)

(assert (=> b!441721 (=> (not res!261540) (not e!260049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441721 (= res!261540 (validMask!0 mask!1025))))

(declare-fun b!441722 () Bool)

(declare-fun res!261541 () Bool)

(assert (=> b!441722 (=> (not res!261541) (not e!260049))))

(declare-datatypes ((List!7818 0))(
  ( (Nil!7815) (Cons!7814 (h!8670 (_ BitVec 64)) (t!13574 List!7818)) )
))
(declare-fun arrayNoDuplicates!0 (array!27145 (_ BitVec 32) List!7818) Bool)

(assert (=> b!441722 (= res!261541 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7815))))

(declare-fun b!441723 () Bool)

(assert (=> b!441723 (= e!260049 e!260051)))

(declare-fun res!261537 () Bool)

(assert (=> b!441723 (=> (not res!261537) (not e!260051))))

(declare-fun lt!202983 () array!27145)

(assert (=> b!441723 (= res!261537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202983 mask!1025))))

(assert (=> b!441723 (= lt!202983 (array!27146 (store (arr!13022 _keys!709) i!563 k0!794) (size!13374 _keys!709)))))

(declare-fun b!441724 () Bool)

(declare-fun res!261538 () Bool)

(assert (=> b!441724 (=> (not res!261538) (not e!260051))))

(assert (=> b!441724 (= res!261538 (arrayNoDuplicates!0 lt!202983 #b00000000000000000000000000000000 Nil!7815))))

(declare-fun mapIsEmpty!19122 () Bool)

(assert (=> mapIsEmpty!19122 mapRes!19122))

(declare-fun b!441725 () Bool)

(declare-fun res!261534 () Bool)

(assert (=> b!441725 (=> (not res!261534) (not e!260049))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!441725 (= res!261534 (and (= (size!13375 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13374 _keys!709) (size!13375 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!261545 () Bool)

(assert (=> start!40248 (=> (not res!261545) (not e!260049))))

(assert (=> start!40248 (= res!261545 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13374 _keys!709))))))

(assert (=> start!40248 e!260049))

(declare-fun tp_is_empty!11667 () Bool)

(assert (=> start!40248 tp_is_empty!11667))

(assert (=> start!40248 tp!37073))

(assert (=> start!40248 true))

(declare-fun e!260055 () Bool)

(declare-fun array_inv!9450 (array!27147) Bool)

(assert (=> start!40248 (and (array_inv!9450 _values!549) e!260055)))

(declare-fun array_inv!9451 (array!27145) Bool)

(assert (=> start!40248 (array_inv!9451 _keys!709)))

(declare-fun b!441726 () Bool)

(declare-fun e!260054 () Bool)

(assert (=> b!441726 (= e!260054 (not true))))

(declare-fun lt!202984 () array!27147)

(declare-fun minValue!515 () V!16661)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16661)

(declare-fun v!412 () V!16661)

(declare-datatypes ((tuple2!7822 0))(
  ( (tuple2!7823 (_1!3922 (_ BitVec 64)) (_2!3922 V!16661)) )
))
(declare-datatypes ((List!7819 0))(
  ( (Nil!7816) (Cons!7815 (h!8671 tuple2!7822) (t!13575 List!7819)) )
))
(declare-datatypes ((ListLongMap!6735 0))(
  ( (ListLongMap!6736 (toList!3383 List!7819)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1572 (array!27145 array!27147 (_ BitVec 32) (_ BitVec 32) V!16661 V!16661 (_ BitVec 32) Int) ListLongMap!6735)

(declare-fun +!1519 (ListLongMap!6735 tuple2!7822) ListLongMap!6735)

(assert (=> b!441726 (= (getCurrentListMapNoExtraKeys!1572 lt!202983 lt!202984 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1519 (getCurrentListMapNoExtraKeys!1572 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7823 k0!794 v!412)))))

(declare-datatypes ((Unit!13142 0))(
  ( (Unit!13143) )
))
(declare-fun lt!202981 () Unit!13142)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!688 (array!27145 array!27147 (_ BitVec 32) (_ BitVec 32) V!16661 V!16661 (_ BitVec 32) (_ BitVec 64) V!16661 (_ BitVec 32) Int) Unit!13142)

(assert (=> b!441726 (= lt!202981 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!688 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441727 () Bool)

(declare-fun res!261546 () Bool)

(assert (=> b!441727 (=> (not res!261546) (not e!260049))))

(declare-fun arrayContainsKey!0 (array!27145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441727 (= res!261546 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441728 () Bool)

(assert (=> b!441728 (= e!260051 e!260054)))

(declare-fun res!261543 () Bool)

(assert (=> b!441728 (=> (not res!261543) (not e!260054))))

(assert (=> b!441728 (= res!261543 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202985 () ListLongMap!6735)

(assert (=> b!441728 (= lt!202985 (getCurrentListMapNoExtraKeys!1572 lt!202983 lt!202984 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441728 (= lt!202984 (array!27148 (store (arr!13023 _values!549) i!563 (ValueCellFull!5490 v!412)) (size!13375 _values!549)))))

(declare-fun lt!202982 () ListLongMap!6735)

(assert (=> b!441728 (= lt!202982 (getCurrentListMapNoExtraKeys!1572 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441729 () Bool)

(assert (=> b!441729 (= e!260050 tp_is_empty!11667)))

(declare-fun b!441730 () Bool)

(declare-fun e!260053 () Bool)

(assert (=> b!441730 (= e!260053 tp_is_empty!11667)))

(declare-fun b!441731 () Bool)

(assert (=> b!441731 (= e!260055 (and e!260053 mapRes!19122))))

(declare-fun condMapEmpty!19122 () Bool)

(declare-fun mapDefault!19122 () ValueCell!5490)

(assert (=> b!441731 (= condMapEmpty!19122 (= (arr!13023 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5490)) mapDefault!19122)))))

(assert (= (and start!40248 res!261545) b!441721))

(assert (= (and b!441721 res!261540) b!441725))

(assert (= (and b!441725 res!261534) b!441719))

(assert (= (and b!441719 res!261544) b!441722))

(assert (= (and b!441722 res!261541) b!441718))

(assert (= (and b!441718 res!261535) b!441720))

(assert (= (and b!441720 res!261536) b!441716))

(assert (= (and b!441716 res!261539) b!441727))

(assert (= (and b!441727 res!261546) b!441723))

(assert (= (and b!441723 res!261537) b!441724))

(assert (= (and b!441724 res!261538) b!441717))

(assert (= (and b!441717 res!261542) b!441728))

(assert (= (and b!441728 res!261543) b!441726))

(assert (= (and b!441731 condMapEmpty!19122) mapIsEmpty!19122))

(assert (= (and b!441731 (not condMapEmpty!19122)) mapNonEmpty!19122))

(get-info :version)

(assert (= (and mapNonEmpty!19122 ((_ is ValueCellFull!5490) mapValue!19122)) b!441729))

(assert (= (and b!441731 ((_ is ValueCellFull!5490) mapDefault!19122)) b!441730))

(assert (= start!40248 b!441731))

(declare-fun m!428495 () Bool)

(assert (=> b!441721 m!428495))

(declare-fun m!428497 () Bool)

(assert (=> b!441720 m!428497))

(declare-fun m!428499 () Bool)

(assert (=> b!441723 m!428499))

(declare-fun m!428501 () Bool)

(assert (=> b!441723 m!428501))

(declare-fun m!428503 () Bool)

(assert (=> b!441716 m!428503))

(declare-fun m!428505 () Bool)

(assert (=> b!441728 m!428505))

(declare-fun m!428507 () Bool)

(assert (=> b!441728 m!428507))

(declare-fun m!428509 () Bool)

(assert (=> b!441728 m!428509))

(declare-fun m!428511 () Bool)

(assert (=> start!40248 m!428511))

(declare-fun m!428513 () Bool)

(assert (=> start!40248 m!428513))

(declare-fun m!428515 () Bool)

(assert (=> b!441724 m!428515))

(declare-fun m!428517 () Bool)

(assert (=> b!441726 m!428517))

(declare-fun m!428519 () Bool)

(assert (=> b!441726 m!428519))

(assert (=> b!441726 m!428519))

(declare-fun m!428521 () Bool)

(assert (=> b!441726 m!428521))

(declare-fun m!428523 () Bool)

(assert (=> b!441726 m!428523))

(declare-fun m!428525 () Bool)

(assert (=> b!441722 m!428525))

(declare-fun m!428527 () Bool)

(assert (=> b!441719 m!428527))

(declare-fun m!428529 () Bool)

(assert (=> mapNonEmpty!19122 m!428529))

(declare-fun m!428531 () Bool)

(assert (=> b!441727 m!428531))

(check-sat (not b!441720) (not b!441719) (not start!40248) (not mapNonEmpty!19122) (not b!441724) (not b!441728) (not b!441726) (not b!441727) (not b!441722) b_and!18483 (not b!441723) tp_is_empty!11667 (not b_next!10515) (not b!441721))
(check-sat b_and!18483 (not b_next!10515))
