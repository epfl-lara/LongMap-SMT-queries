; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38642 () Bool)

(assert start!38642)

(declare-fun b_free!9193 () Bool)

(declare-fun b_next!9193 () Bool)

(assert (=> start!38642 (= b_free!9193 (not b_next!9193))))

(declare-fun tp!32703 () Bool)

(declare-fun b_and!16553 () Bool)

(assert (=> start!38642 (= tp!32703 b_and!16553)))

(declare-fun b!401109 () Bool)

(declare-fun e!241854 () Bool)

(declare-fun e!241860 () Bool)

(assert (=> b!401109 (= e!241854 e!241860)))

(declare-fun res!230920 () Bool)

(assert (=> b!401109 (=> (not res!230920) (not e!241860))))

(declare-datatypes ((array!24037 0))(
  ( (array!24038 (arr!11468 (Array (_ BitVec 32) (_ BitVec 64))) (size!11821 (_ BitVec 32))) )
))
(declare-fun lt!187571 () array!24037)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24037 (_ BitVec 32)) Bool)

(assert (=> b!401109 (= res!230920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187571 mask!1025))))

(declare-fun _keys!709 () array!24037)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401109 (= lt!187571 (array!24038 (store (arr!11468 _keys!709) i!563 k0!794) (size!11821 _keys!709)))))

(declare-fun mapNonEmpty!16734 () Bool)

(declare-fun mapRes!16734 () Bool)

(declare-fun tp!32702 () Bool)

(declare-fun e!241859 () Bool)

(assert (=> mapNonEmpty!16734 (= mapRes!16734 (and tp!32702 e!241859))))

(declare-datatypes ((V!14539 0))(
  ( (V!14540 (val!5082 Int)) )
))
(declare-datatypes ((ValueCell!4694 0))(
  ( (ValueCellFull!4694 (v!7323 V!14539)) (EmptyCell!4694) )
))
(declare-datatypes ((array!24039 0))(
  ( (array!24040 (arr!11469 (Array (_ BitVec 32) ValueCell!4694)) (size!11822 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24039)

(declare-fun mapValue!16734 () ValueCell!4694)

(declare-fun mapRest!16734 () (Array (_ BitVec 32) ValueCell!4694))

(declare-fun mapKey!16734 () (_ BitVec 32))

(assert (=> mapNonEmpty!16734 (= (arr!11469 _values!549) (store mapRest!16734 mapKey!16734 mapValue!16734))))

(declare-fun b!401110 () Bool)

(declare-fun res!230923 () Bool)

(assert (=> b!401110 (=> (not res!230923) (not e!241854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401110 (= res!230923 (validMask!0 mask!1025))))

(declare-fun b!401111 () Bool)

(declare-fun e!241856 () Bool)

(declare-fun tp_is_empty!10075 () Bool)

(assert (=> b!401111 (= e!241856 tp_is_empty!10075)))

(declare-fun b!401112 () Bool)

(declare-fun res!230918 () Bool)

(assert (=> b!401112 (=> (not res!230918) (not e!241860))))

(declare-datatypes ((List!6630 0))(
  ( (Nil!6627) (Cons!6626 (h!7482 (_ BitVec 64)) (t!11795 List!6630)) )
))
(declare-fun arrayNoDuplicates!0 (array!24037 (_ BitVec 32) List!6630) Bool)

(assert (=> b!401112 (= res!230918 (arrayNoDuplicates!0 lt!187571 #b00000000000000000000000000000000 Nil!6627))))

(declare-fun b!401113 () Bool)

(declare-fun e!241857 () Bool)

(assert (=> b!401113 (= e!241857 (and e!241856 mapRes!16734))))

(declare-fun condMapEmpty!16734 () Bool)

(declare-fun mapDefault!16734 () ValueCell!4694)

(assert (=> b!401113 (= condMapEmpty!16734 (= (arr!11469 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4694)) mapDefault!16734)))))

(declare-fun b!401114 () Bool)

(declare-fun res!230928 () Bool)

(assert (=> b!401114 (=> (not res!230928) (not e!241854))))

(assert (=> b!401114 (= res!230928 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6627))))

(declare-datatypes ((tuple2!6724 0))(
  ( (tuple2!6725 (_1!3373 (_ BitVec 64)) (_2!3373 V!14539)) )
))
(declare-datatypes ((List!6631 0))(
  ( (Nil!6628) (Cons!6627 (h!7483 tuple2!6724) (t!11796 List!6631)) )
))
(declare-datatypes ((ListLongMap!5627 0))(
  ( (ListLongMap!5628 (toList!2829 List!6631)) )
))
(declare-fun call!28218 () ListLongMap!5627)

(declare-fun e!241855 () Bool)

(declare-fun b!401115 () Bool)

(declare-fun v!412 () V!14539)

(declare-fun call!28219 () ListLongMap!5627)

(declare-fun +!1135 (ListLongMap!5627 tuple2!6724) ListLongMap!5627)

(assert (=> b!401115 (= e!241855 (= call!28218 (+!1135 call!28219 (tuple2!6725 k0!794 v!412))))))

(declare-fun b!401116 () Bool)

(assert (=> b!401116 (= e!241860 (not true))))

(assert (=> b!401116 e!241855))

(declare-fun c!54675 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401116 (= c!54675 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12126 0))(
  ( (Unit!12127) )
))
(declare-fun lt!187570 () Unit!12126)

(declare-fun minValue!515 () V!14539)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14539)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!326 (array!24037 array!24039 (_ BitVec 32) (_ BitVec 32) V!14539 V!14539 (_ BitVec 32) (_ BitVec 64) V!14539 (_ BitVec 32) Int) Unit!12126)

(assert (=> b!401116 (= lt!187570 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!326 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401117 () Bool)

(declare-fun res!230925 () Bool)

(assert (=> b!401117 (=> (not res!230925) (not e!241854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401117 (= res!230925 (validKeyInArray!0 k0!794))))

(declare-fun res!230922 () Bool)

(assert (=> start!38642 (=> (not res!230922) (not e!241854))))

(assert (=> start!38642 (= res!230922 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11821 _keys!709))))))

(assert (=> start!38642 e!241854))

(assert (=> start!38642 tp_is_empty!10075))

(assert (=> start!38642 tp!32703))

(assert (=> start!38642 true))

(declare-fun array_inv!8412 (array!24039) Bool)

(assert (=> start!38642 (and (array_inv!8412 _values!549) e!241857)))

(declare-fun array_inv!8413 (array!24037) Bool)

(assert (=> start!38642 (array_inv!8413 _keys!709)))

(declare-fun bm!28215 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1047 (array!24037 array!24039 (_ BitVec 32) (_ BitVec 32) V!14539 V!14539 (_ BitVec 32) Int) ListLongMap!5627)

(assert (=> bm!28215 (= call!28218 (getCurrentListMapNoExtraKeys!1047 (ite c!54675 lt!187571 _keys!709) (ite c!54675 (array!24040 (store (arr!11469 _values!549) i!563 (ValueCellFull!4694 v!412)) (size!11822 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401118 () Bool)

(assert (=> b!401118 (= e!241859 tp_is_empty!10075)))

(declare-fun b!401119 () Bool)

(declare-fun res!230921 () Bool)

(assert (=> b!401119 (=> (not res!230921) (not e!241860))))

(assert (=> b!401119 (= res!230921 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11821 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28216 () Bool)

(assert (=> bm!28216 (= call!28219 (getCurrentListMapNoExtraKeys!1047 (ite c!54675 _keys!709 lt!187571) (ite c!54675 _values!549 (array!24040 (store (arr!11469 _values!549) i!563 (ValueCellFull!4694 v!412)) (size!11822 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401120 () Bool)

(assert (=> b!401120 (= e!241855 (= call!28219 call!28218))))

(declare-fun b!401121 () Bool)

(declare-fun res!230927 () Bool)

(assert (=> b!401121 (=> (not res!230927) (not e!241854))))

(assert (=> b!401121 (= res!230927 (and (= (size!11822 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11821 _keys!709) (size!11822 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401122 () Bool)

(declare-fun res!230924 () Bool)

(assert (=> b!401122 (=> (not res!230924) (not e!241854))))

(assert (=> b!401122 (= res!230924 (or (= (select (arr!11468 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11468 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401123 () Bool)

(declare-fun res!230919 () Bool)

(assert (=> b!401123 (=> (not res!230919) (not e!241854))))

(assert (=> b!401123 (= res!230919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401124 () Bool)

(declare-fun res!230926 () Bool)

(assert (=> b!401124 (=> (not res!230926) (not e!241854))))

(assert (=> b!401124 (= res!230926 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11821 _keys!709))))))

(declare-fun mapIsEmpty!16734 () Bool)

(assert (=> mapIsEmpty!16734 mapRes!16734))

(declare-fun b!401125 () Bool)

(declare-fun res!230917 () Bool)

(assert (=> b!401125 (=> (not res!230917) (not e!241854))))

(declare-fun arrayContainsKey!0 (array!24037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401125 (= res!230917 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38642 res!230922) b!401110))

(assert (= (and b!401110 res!230923) b!401121))

(assert (= (and b!401121 res!230927) b!401123))

(assert (= (and b!401123 res!230919) b!401114))

(assert (= (and b!401114 res!230928) b!401124))

(assert (= (and b!401124 res!230926) b!401117))

(assert (= (and b!401117 res!230925) b!401122))

(assert (= (and b!401122 res!230924) b!401125))

(assert (= (and b!401125 res!230917) b!401109))

(assert (= (and b!401109 res!230920) b!401112))

(assert (= (and b!401112 res!230918) b!401119))

(assert (= (and b!401119 res!230921) b!401116))

(assert (= (and b!401116 c!54675) b!401115))

(assert (= (and b!401116 (not c!54675)) b!401120))

(assert (= (or b!401115 b!401120) bm!28215))

(assert (= (or b!401115 b!401120) bm!28216))

(assert (= (and b!401113 condMapEmpty!16734) mapIsEmpty!16734))

(assert (= (and b!401113 (not condMapEmpty!16734)) mapNonEmpty!16734))

(get-info :version)

(assert (= (and mapNonEmpty!16734 ((_ is ValueCellFull!4694) mapValue!16734)) b!401118))

(assert (= (and b!401113 ((_ is ValueCellFull!4694) mapDefault!16734)) b!401111))

(assert (= start!38642 b!401113))

(declare-fun m!394533 () Bool)

(assert (=> b!401109 m!394533))

(declare-fun m!394535 () Bool)

(assert (=> b!401109 m!394535))

(declare-fun m!394537 () Bool)

(assert (=> b!401112 m!394537))

(declare-fun m!394539 () Bool)

(assert (=> bm!28216 m!394539))

(declare-fun m!394541 () Bool)

(assert (=> bm!28216 m!394541))

(declare-fun m!394543 () Bool)

(assert (=> mapNonEmpty!16734 m!394543))

(declare-fun m!394545 () Bool)

(assert (=> b!401114 m!394545))

(declare-fun m!394547 () Bool)

(assert (=> b!401125 m!394547))

(declare-fun m!394549 () Bool)

(assert (=> start!38642 m!394549))

(declare-fun m!394551 () Bool)

(assert (=> start!38642 m!394551))

(declare-fun m!394553 () Bool)

(assert (=> b!401110 m!394553))

(declare-fun m!394555 () Bool)

(assert (=> b!401116 m!394555))

(declare-fun m!394557 () Bool)

(assert (=> b!401115 m!394557))

(declare-fun m!394559 () Bool)

(assert (=> b!401122 m!394559))

(declare-fun m!394561 () Bool)

(assert (=> b!401117 m!394561))

(declare-fun m!394563 () Bool)

(assert (=> b!401123 m!394563))

(assert (=> bm!28215 m!394539))

(declare-fun m!394565 () Bool)

(assert (=> bm!28215 m!394565))

(check-sat (not b!401123) (not b!401117) (not start!38642) (not b!401115) (not b!401109) (not bm!28215) (not b!401125) (not b!401116) (not bm!28216) (not b_next!9193) (not b!401112) b_and!16553 (not b!401114) (not b!401110) (not mapNonEmpty!16734) tp_is_empty!10075)
(check-sat b_and!16553 (not b_next!9193))
