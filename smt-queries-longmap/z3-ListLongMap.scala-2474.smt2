; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38648 () Bool)

(assert start!38648)

(declare-fun b_free!9199 () Bool)

(declare-fun b_next!9199 () Bool)

(assert (=> start!38648 (= b_free!9199 (not b_next!9199))))

(declare-fun tp!32721 () Bool)

(declare-fun b_and!16599 () Bool)

(assert (=> start!38648 (= tp!32721 b_and!16599)))

(declare-fun mapIsEmpty!16743 () Bool)

(declare-fun mapRes!16743 () Bool)

(assert (=> mapIsEmpty!16743 mapRes!16743))

(declare-fun e!242061 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!401484 () Bool)

(declare-datatypes ((V!14547 0))(
  ( (V!14548 (val!5085 Int)) )
))
(declare-datatypes ((tuple2!6612 0))(
  ( (tuple2!6613 (_1!3317 (_ BitVec 64)) (_2!3317 V!14547)) )
))
(declare-datatypes ((List!6533 0))(
  ( (Nil!6530) (Cons!6529 (h!7385 tuple2!6612) (t!11699 List!6533)) )
))
(declare-datatypes ((ListLongMap!5527 0))(
  ( (ListLongMap!5528 (toList!2779 List!6533)) )
))
(declare-fun call!28248 () ListLongMap!5527)

(declare-fun call!28249 () ListLongMap!5527)

(declare-fun v!412 () V!14547)

(declare-fun +!1124 (ListLongMap!5527 tuple2!6612) ListLongMap!5527)

(assert (=> b!401484 (= e!242061 (= call!28249 (+!1124 call!28248 (tuple2!6613 k0!794 v!412))))))

(declare-fun mapNonEmpty!16743 () Bool)

(declare-fun tp!32720 () Bool)

(declare-fun e!242060 () Bool)

(assert (=> mapNonEmpty!16743 (= mapRes!16743 (and tp!32720 e!242060))))

(declare-datatypes ((ValueCell!4697 0))(
  ( (ValueCellFull!4697 (v!7333 V!14547)) (EmptyCell!4697) )
))
(declare-fun mapRest!16743 () (Array (_ BitVec 32) ValueCell!4697))

(declare-fun mapKey!16743 () (_ BitVec 32))

(declare-datatypes ((array!24046 0))(
  ( (array!24047 (arr!11472 (Array (_ BitVec 32) ValueCell!4697)) (size!11824 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24046)

(declare-fun mapValue!16743 () ValueCell!4697)

(assert (=> mapNonEmpty!16743 (= (arr!11472 _values!549) (store mapRest!16743 mapKey!16743 mapValue!16743))))

(declare-fun b!401485 () Bool)

(declare-fun e!242059 () Bool)

(declare-fun e!242063 () Bool)

(assert (=> b!401485 (= e!242059 e!242063)))

(declare-fun res!231157 () Bool)

(assert (=> b!401485 (=> (not res!231157) (not e!242063))))

(declare-datatypes ((array!24048 0))(
  ( (array!24049 (arr!11473 (Array (_ BitVec 32) (_ BitVec 64))) (size!11825 (_ BitVec 32))) )
))
(declare-fun lt!187841 () array!24048)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24048 (_ BitVec 32)) Bool)

(assert (=> b!401485 (= res!231157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187841 mask!1025))))

(declare-fun _keys!709 () array!24048)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401485 (= lt!187841 (array!24049 (store (arr!11473 _keys!709) i!563 k0!794) (size!11825 _keys!709)))))

(declare-fun minValue!515 () V!14547)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!28246 () Bool)

(declare-fun zeroValue!515 () V!14547)

(declare-fun c!54732 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1036 (array!24048 array!24046 (_ BitVec 32) (_ BitVec 32) V!14547 V!14547 (_ BitVec 32) Int) ListLongMap!5527)

(assert (=> bm!28246 (= call!28248 (getCurrentListMapNoExtraKeys!1036 (ite c!54732 _keys!709 lt!187841) (ite c!54732 _values!549 (array!24047 (store (arr!11472 _values!549) i!563 (ValueCellFull!4697 v!412)) (size!11824 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401486 () Bool)

(declare-fun res!231158 () Bool)

(assert (=> b!401486 (=> (not res!231158) (not e!242059))))

(assert (=> b!401486 (= res!231158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401487 () Bool)

(declare-fun res!231160 () Bool)

(assert (=> b!401487 (=> (not res!231160) (not e!242059))))

(assert (=> b!401487 (= res!231160 (and (= (size!11824 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11825 _keys!709) (size!11824 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401488 () Bool)

(declare-fun tp_is_empty!10081 () Bool)

(assert (=> b!401488 (= e!242060 tp_is_empty!10081)))

(declare-fun b!401489 () Bool)

(declare-fun res!231162 () Bool)

(assert (=> b!401489 (=> (not res!231162) (not e!242063))))

(declare-datatypes ((List!6534 0))(
  ( (Nil!6531) (Cons!6530 (h!7386 (_ BitVec 64)) (t!11700 List!6534)) )
))
(declare-fun arrayNoDuplicates!0 (array!24048 (_ BitVec 32) List!6534) Bool)

(assert (=> b!401489 (= res!231162 (arrayNoDuplicates!0 lt!187841 #b00000000000000000000000000000000 Nil!6531))))

(declare-fun b!401490 () Bool)

(declare-fun res!231156 () Bool)

(assert (=> b!401490 (=> (not res!231156) (not e!242059))))

(assert (=> b!401490 (= res!231156 (or (= (select (arr!11473 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11473 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401491 () Bool)

(declare-fun res!231154 () Bool)

(assert (=> b!401491 (=> (not res!231154) (not e!242059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401491 (= res!231154 (validKeyInArray!0 k0!794))))

(declare-fun b!401492 () Bool)

(declare-fun e!242064 () Bool)

(assert (=> b!401492 (= e!242064 tp_is_empty!10081)))

(declare-fun bm!28245 () Bool)

(assert (=> bm!28245 (= call!28249 (getCurrentListMapNoExtraKeys!1036 (ite c!54732 lt!187841 _keys!709) (ite c!54732 (array!24047 (store (arr!11472 _values!549) i!563 (ValueCellFull!4697 v!412)) (size!11824 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!231151 () Bool)

(assert (=> start!38648 (=> (not res!231151) (not e!242059))))

(assert (=> start!38648 (= res!231151 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11825 _keys!709))))))

(assert (=> start!38648 e!242059))

(assert (=> start!38648 tp_is_empty!10081))

(assert (=> start!38648 tp!32721))

(assert (=> start!38648 true))

(declare-fun e!242062 () Bool)

(declare-fun array_inv!8472 (array!24046) Bool)

(assert (=> start!38648 (and (array_inv!8472 _values!549) e!242062)))

(declare-fun array_inv!8473 (array!24048) Bool)

(assert (=> start!38648 (array_inv!8473 _keys!709)))

(declare-fun b!401493 () Bool)

(assert (=> b!401493 (= e!242062 (and e!242064 mapRes!16743))))

(declare-fun condMapEmpty!16743 () Bool)

(declare-fun mapDefault!16743 () ValueCell!4697)

(assert (=> b!401493 (= condMapEmpty!16743 (= (arr!11472 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4697)) mapDefault!16743)))))

(declare-fun b!401494 () Bool)

(declare-fun res!231152 () Bool)

(assert (=> b!401494 (=> (not res!231152) (not e!242059))))

(assert (=> b!401494 (= res!231152 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11825 _keys!709))))))

(declare-fun b!401495 () Bool)

(declare-fun res!231159 () Bool)

(assert (=> b!401495 (=> (not res!231159) (not e!242059))))

(declare-fun arrayContainsKey!0 (array!24048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401495 (= res!231159 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401496 () Bool)

(assert (=> b!401496 (= e!242061 (= call!28248 call!28249))))

(declare-fun b!401497 () Bool)

(assert (=> b!401497 (= e!242063 (not true))))

(assert (=> b!401497 e!242061))

(assert (=> b!401497 (= c!54732 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12135 0))(
  ( (Unit!12136) )
))
(declare-fun lt!187842 () Unit!12135)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!335 (array!24048 array!24046 (_ BitVec 32) (_ BitVec 32) V!14547 V!14547 (_ BitVec 32) (_ BitVec 64) V!14547 (_ BitVec 32) Int) Unit!12135)

(assert (=> b!401497 (= lt!187842 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401498 () Bool)

(declare-fun res!231161 () Bool)

(assert (=> b!401498 (=> (not res!231161) (not e!242059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401498 (= res!231161 (validMask!0 mask!1025))))

(declare-fun b!401499 () Bool)

(declare-fun res!231153 () Bool)

(assert (=> b!401499 (=> (not res!231153) (not e!242063))))

(assert (=> b!401499 (= res!231153 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11825 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401500 () Bool)

(declare-fun res!231155 () Bool)

(assert (=> b!401500 (=> (not res!231155) (not e!242059))))

(assert (=> b!401500 (= res!231155 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6531))))

(assert (= (and start!38648 res!231151) b!401498))

(assert (= (and b!401498 res!231161) b!401487))

(assert (= (and b!401487 res!231160) b!401486))

(assert (= (and b!401486 res!231158) b!401500))

(assert (= (and b!401500 res!231155) b!401494))

(assert (= (and b!401494 res!231152) b!401491))

(assert (= (and b!401491 res!231154) b!401490))

(assert (= (and b!401490 res!231156) b!401495))

(assert (= (and b!401495 res!231159) b!401485))

(assert (= (and b!401485 res!231157) b!401489))

(assert (= (and b!401489 res!231162) b!401499))

(assert (= (and b!401499 res!231153) b!401497))

(assert (= (and b!401497 c!54732) b!401484))

(assert (= (and b!401497 (not c!54732)) b!401496))

(assert (= (or b!401484 b!401496) bm!28245))

(assert (= (or b!401484 b!401496) bm!28246))

(assert (= (and b!401493 condMapEmpty!16743) mapIsEmpty!16743))

(assert (= (and b!401493 (not condMapEmpty!16743)) mapNonEmpty!16743))

(get-info :version)

(assert (= (and mapNonEmpty!16743 ((_ is ValueCellFull!4697) mapValue!16743)) b!401488))

(assert (= (and b!401493 ((_ is ValueCellFull!4697) mapDefault!16743)) b!401492))

(assert (= start!38648 b!401493))

(declare-fun m!395589 () Bool)

(assert (=> mapNonEmpty!16743 m!395589))

(declare-fun m!395591 () Bool)

(assert (=> start!38648 m!395591))

(declare-fun m!395593 () Bool)

(assert (=> start!38648 m!395593))

(declare-fun m!395595 () Bool)

(assert (=> b!401500 m!395595))

(declare-fun m!395597 () Bool)

(assert (=> b!401484 m!395597))

(declare-fun m!395599 () Bool)

(assert (=> b!401498 m!395599))

(declare-fun m!395601 () Bool)

(assert (=> b!401486 m!395601))

(declare-fun m!395603 () Bool)

(assert (=> b!401491 m!395603))

(declare-fun m!395605 () Bool)

(assert (=> b!401489 m!395605))

(declare-fun m!395607 () Bool)

(assert (=> b!401485 m!395607))

(declare-fun m!395609 () Bool)

(assert (=> b!401485 m!395609))

(declare-fun m!395611 () Bool)

(assert (=> bm!28245 m!395611))

(declare-fun m!395613 () Bool)

(assert (=> bm!28245 m!395613))

(declare-fun m!395615 () Bool)

(assert (=> b!401490 m!395615))

(assert (=> bm!28246 m!395611))

(declare-fun m!395617 () Bool)

(assert (=> bm!28246 m!395617))

(declare-fun m!395619 () Bool)

(assert (=> b!401495 m!395619))

(declare-fun m!395621 () Bool)

(assert (=> b!401497 m!395621))

(check-sat (not bm!28246) (not b!401489) (not b!401491) (not b!401495) (not b!401485) (not b!401486) (not bm!28245) (not b!401498) (not b!401497) (not mapNonEmpty!16743) (not b!401500) (not b_next!9199) (not b!401484) b_and!16599 tp_is_empty!10081 (not start!38648))
(check-sat b_and!16599 (not b_next!9199))
