; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38738 () Bool)

(assert start!38738)

(declare-fun b_free!9289 () Bool)

(declare-fun b_next!9289 () Bool)

(assert (=> start!38738 (= b_free!9289 (not b_next!9289))))

(declare-fun tp!32990 () Bool)

(declare-fun b_and!16649 () Bool)

(assert (=> start!38738 (= tp!32990 b_and!16649)))

(declare-datatypes ((V!14667 0))(
  ( (V!14668 (val!5130 Int)) )
))
(declare-fun minValue!515 () V!14667)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6808 0))(
  ( (tuple2!6809 (_1!3415 (_ BitVec 64)) (_2!3415 V!14667)) )
))
(declare-datatypes ((List!6711 0))(
  ( (Nil!6708) (Cons!6707 (h!7563 tuple2!6808) (t!11876 List!6711)) )
))
(declare-datatypes ((ListLongMap!5711 0))(
  ( (ListLongMap!5712 (toList!2871 List!6711)) )
))
(declare-fun call!28507 () ListLongMap!5711)

(declare-datatypes ((array!24223 0))(
  ( (array!24224 (arr!11561 (Array (_ BitVec 32) (_ BitVec 64))) (size!11914 (_ BitVec 32))) )
))
(declare-fun lt!187858 () array!24223)

(declare-datatypes ((ValueCell!4742 0))(
  ( (ValueCellFull!4742 (v!7371 V!14667)) (EmptyCell!4742) )
))
(declare-datatypes ((array!24225 0))(
  ( (array!24226 (arr!11562 (Array (_ BitVec 32) ValueCell!4742)) (size!11915 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24225)

(declare-fun zeroValue!515 () V!14667)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54819 () Bool)

(declare-fun v!412 () V!14667)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!28503 () Bool)

(declare-fun _keys!709 () array!24223)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1086 (array!24223 array!24225 (_ BitVec 32) (_ BitVec 32) V!14667 V!14667 (_ BitVec 32) Int) ListLongMap!5711)

(assert (=> bm!28503 (= call!28507 (getCurrentListMapNoExtraKeys!1086 (ite c!54819 _keys!709 lt!187858) (ite c!54819 _values!549 (array!24226 (store (arr!11562 _values!549) i!563 (ValueCellFull!4742 v!412)) (size!11915 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403557 () Bool)

(declare-fun res!232647 () Bool)

(declare-fun e!242862 () Bool)

(assert (=> b!403557 (=> (not res!232647) (not e!242862))))

(assert (=> b!403557 (= res!232647 (or (= (select (arr!11561 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11561 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403558 () Bool)

(declare-fun res!232648 () Bool)

(assert (=> b!403558 (=> (not res!232648) (not e!242862))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403558 (= res!232648 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403559 () Bool)

(declare-fun e!242867 () Bool)

(assert (=> b!403559 (= e!242862 e!242867)))

(declare-fun res!232649 () Bool)

(assert (=> b!403559 (=> (not res!232649) (not e!242867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24223 (_ BitVec 32)) Bool)

(assert (=> b!403559 (= res!232649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187858 mask!1025))))

(assert (=> b!403559 (= lt!187858 (array!24224 (store (arr!11561 _keys!709) i!563 k0!794) (size!11914 _keys!709)))))

(declare-fun b!403560 () Bool)

(declare-fun res!232655 () Bool)

(assert (=> b!403560 (=> (not res!232655) (not e!242862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403560 (= res!232655 (validKeyInArray!0 k0!794))))

(declare-fun b!403561 () Bool)

(declare-fun e!242865 () Bool)

(declare-fun tp_is_empty!10171 () Bool)

(assert (=> b!403561 (= e!242865 tp_is_empty!10171)))

(declare-fun b!403562 () Bool)

(declare-fun res!232645 () Bool)

(assert (=> b!403562 (=> (not res!232645) (not e!242862))))

(assert (=> b!403562 (= res!232645 (and (= (size!11915 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11914 _keys!709) (size!11915 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403563 () Bool)

(declare-fun res!232646 () Bool)

(assert (=> b!403563 (=> (not res!232646) (not e!242862))))

(declare-datatypes ((List!6712 0))(
  ( (Nil!6709) (Cons!6708 (h!7564 (_ BitVec 64)) (t!11877 List!6712)) )
))
(declare-fun arrayNoDuplicates!0 (array!24223 (_ BitVec 32) List!6712) Bool)

(assert (=> b!403563 (= res!232646 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6709))))

(declare-fun b!403564 () Bool)

(declare-fun e!242864 () Bool)

(declare-fun call!28506 () ListLongMap!5711)

(assert (=> b!403564 (= e!242864 (= call!28507 call!28506))))

(declare-fun b!403565 () Bool)

(declare-fun e!242868 () Bool)

(declare-fun e!242863 () Bool)

(declare-fun mapRes!16878 () Bool)

(assert (=> b!403565 (= e!242868 (and e!242863 mapRes!16878))))

(declare-fun condMapEmpty!16878 () Bool)

(declare-fun mapDefault!16878 () ValueCell!4742)

(assert (=> b!403565 (= condMapEmpty!16878 (= (arr!11562 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4742)) mapDefault!16878)))))

(declare-fun b!403566 () Bool)

(assert (=> b!403566 (= e!242867 (not true))))

(assert (=> b!403566 e!242864))

(assert (=> b!403566 (= c!54819 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12186 0))(
  ( (Unit!12187) )
))
(declare-fun lt!187859 () Unit!12186)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!356 (array!24223 array!24225 (_ BitVec 32) (_ BitVec 32) V!14667 V!14667 (_ BitVec 32) (_ BitVec 64) V!14667 (_ BitVec 32) Int) Unit!12186)

(assert (=> b!403566 (= lt!187859 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!356 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403567 () Bool)

(declare-fun res!232651 () Bool)

(assert (=> b!403567 (=> (not res!232651) (not e!242867))))

(assert (=> b!403567 (= res!232651 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11914 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403568 () Bool)

(declare-fun res!232650 () Bool)

(assert (=> b!403568 (=> (not res!232650) (not e!242862))))

(assert (=> b!403568 (= res!232650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403569 () Bool)

(assert (=> b!403569 (= e!242863 tp_is_empty!10171)))

(declare-fun b!403570 () Bool)

(declare-fun res!232652 () Bool)

(assert (=> b!403570 (=> (not res!232652) (not e!242862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403570 (= res!232652 (validMask!0 mask!1025))))

(declare-fun bm!28504 () Bool)

(assert (=> bm!28504 (= call!28506 (getCurrentListMapNoExtraKeys!1086 (ite c!54819 lt!187858 _keys!709) (ite c!54819 (array!24226 (store (arr!11562 _values!549) i!563 (ValueCellFull!4742 v!412)) (size!11915 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403571 () Bool)

(declare-fun res!232653 () Bool)

(assert (=> b!403571 (=> (not res!232653) (not e!242867))))

(assert (=> b!403571 (= res!232653 (arrayNoDuplicates!0 lt!187858 #b00000000000000000000000000000000 Nil!6709))))

(declare-fun b!403572 () Bool)

(declare-fun res!232656 () Bool)

(assert (=> b!403572 (=> (not res!232656) (not e!242862))))

(assert (=> b!403572 (= res!232656 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11914 _keys!709))))))

(declare-fun mapIsEmpty!16878 () Bool)

(assert (=> mapIsEmpty!16878 mapRes!16878))

(declare-fun b!403573 () Bool)

(declare-fun +!1171 (ListLongMap!5711 tuple2!6808) ListLongMap!5711)

(assert (=> b!403573 (= e!242864 (= call!28506 (+!1171 call!28507 (tuple2!6809 k0!794 v!412))))))

(declare-fun res!232654 () Bool)

(assert (=> start!38738 (=> (not res!232654) (not e!242862))))

(assert (=> start!38738 (= res!232654 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11914 _keys!709))))))

(assert (=> start!38738 e!242862))

(assert (=> start!38738 tp_is_empty!10171))

(assert (=> start!38738 tp!32990))

(assert (=> start!38738 true))

(declare-fun array_inv!8482 (array!24225) Bool)

(assert (=> start!38738 (and (array_inv!8482 _values!549) e!242868)))

(declare-fun array_inv!8483 (array!24223) Bool)

(assert (=> start!38738 (array_inv!8483 _keys!709)))

(declare-fun mapNonEmpty!16878 () Bool)

(declare-fun tp!32991 () Bool)

(assert (=> mapNonEmpty!16878 (= mapRes!16878 (and tp!32991 e!242865))))

(declare-fun mapValue!16878 () ValueCell!4742)

(declare-fun mapRest!16878 () (Array (_ BitVec 32) ValueCell!4742))

(declare-fun mapKey!16878 () (_ BitVec 32))

(assert (=> mapNonEmpty!16878 (= (arr!11562 _values!549) (store mapRest!16878 mapKey!16878 mapValue!16878))))

(assert (= (and start!38738 res!232654) b!403570))

(assert (= (and b!403570 res!232652) b!403562))

(assert (= (and b!403562 res!232645) b!403568))

(assert (= (and b!403568 res!232650) b!403563))

(assert (= (and b!403563 res!232646) b!403572))

(assert (= (and b!403572 res!232656) b!403560))

(assert (= (and b!403560 res!232655) b!403557))

(assert (= (and b!403557 res!232647) b!403558))

(assert (= (and b!403558 res!232648) b!403559))

(assert (= (and b!403559 res!232649) b!403571))

(assert (= (and b!403571 res!232653) b!403567))

(assert (= (and b!403567 res!232651) b!403566))

(assert (= (and b!403566 c!54819) b!403573))

(assert (= (and b!403566 (not c!54819)) b!403564))

(assert (= (or b!403573 b!403564) bm!28504))

(assert (= (or b!403573 b!403564) bm!28503))

(assert (= (and b!403565 condMapEmpty!16878) mapIsEmpty!16878))

(assert (= (and b!403565 (not condMapEmpty!16878)) mapNonEmpty!16878))

(get-info :version)

(assert (= (and mapNonEmpty!16878 ((_ is ValueCellFull!4742) mapValue!16878)) b!403561))

(assert (= (and b!403565 ((_ is ValueCellFull!4742) mapDefault!16878)) b!403569))

(assert (= start!38738 b!403565))

(declare-fun m!396165 () Bool)

(assert (=> b!403573 m!396165))

(declare-fun m!396167 () Bool)

(assert (=> b!403563 m!396167))

(declare-fun m!396169 () Bool)

(assert (=> b!403571 m!396169))

(declare-fun m!396171 () Bool)

(assert (=> b!403570 m!396171))

(declare-fun m!396173 () Bool)

(assert (=> b!403559 m!396173))

(declare-fun m!396175 () Bool)

(assert (=> b!403559 m!396175))

(declare-fun m!396177 () Bool)

(assert (=> bm!28503 m!396177))

(declare-fun m!396179 () Bool)

(assert (=> bm!28503 m!396179))

(declare-fun m!396181 () Bool)

(assert (=> b!403568 m!396181))

(declare-fun m!396183 () Bool)

(assert (=> b!403560 m!396183))

(declare-fun m!396185 () Bool)

(assert (=> start!38738 m!396185))

(declare-fun m!396187 () Bool)

(assert (=> start!38738 m!396187))

(declare-fun m!396189 () Bool)

(assert (=> mapNonEmpty!16878 m!396189))

(declare-fun m!396191 () Bool)

(assert (=> b!403566 m!396191))

(declare-fun m!396193 () Bool)

(assert (=> b!403558 m!396193))

(declare-fun m!396195 () Bool)

(assert (=> b!403557 m!396195))

(assert (=> bm!28504 m!396177))

(declare-fun m!396197 () Bool)

(assert (=> bm!28504 m!396197))

(check-sat (not b!403560) (not b!403570) (not b!403566) (not b!403563) (not b!403573) (not b!403559) (not start!38738) b_and!16649 (not bm!28504) (not b!403568) (not b!403571) (not mapNonEmpty!16878) (not b!403558) (not b_next!9289) tp_is_empty!10171 (not bm!28503))
(check-sat b_and!16649 (not b_next!9289))
