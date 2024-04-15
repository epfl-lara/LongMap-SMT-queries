; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38702 () Bool)

(assert start!38702)

(declare-fun b_free!9253 () Bool)

(declare-fun b_next!9253 () Bool)

(assert (=> start!38702 (= b_free!9253 (not b_next!9253))))

(declare-fun tp!32883 () Bool)

(declare-fun b_and!16613 () Bool)

(assert (=> start!38702 (= tp!32883 b_and!16613)))

(declare-fun b!402639 () Bool)

(declare-fun e!242489 () Bool)

(assert (=> b!402639 (= e!242489 (not true))))

(declare-fun e!242488 () Bool)

(assert (=> b!402639 e!242488))

(declare-fun c!54765 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402639 (= c!54765 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14619 0))(
  ( (V!14620 (val!5112 Int)) )
))
(declare-fun minValue!515 () V!14619)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4724 0))(
  ( (ValueCellFull!4724 (v!7353 V!14619)) (EmptyCell!4724) )
))
(declare-datatypes ((array!24151 0))(
  ( (array!24152 (arr!11525 (Array (_ BitVec 32) ValueCell!4724)) (size!11878 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24151)

(declare-fun zeroValue!515 () V!14619)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14619)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24153 0))(
  ( (array!24154 (arr!11526 (Array (_ BitVec 32) (_ BitVec 64))) (size!11879 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24153)

(declare-datatypes ((Unit!12162 0))(
  ( (Unit!12163) )
))
(declare-fun lt!187751 () Unit!12162)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!344 (array!24153 array!24151 (_ BitVec 32) (_ BitVec 32) V!14619 V!14619 (_ BitVec 32) (_ BitVec 64) V!14619 (_ BitVec 32) Int) Unit!12162)

(assert (=> b!402639 (= lt!187751 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!344 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402640 () Bool)

(declare-fun res!231998 () Bool)

(declare-fun e!242486 () Bool)

(assert (=> b!402640 (=> (not res!231998) (not e!242486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402640 (= res!231998 (validMask!0 mask!1025))))

(declare-fun b!402641 () Bool)

(assert (=> b!402641 (= e!242486 e!242489)))

(declare-fun res!232006 () Bool)

(assert (=> b!402641 (=> (not res!232006) (not e!242489))))

(declare-fun lt!187750 () array!24153)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24153 (_ BitVec 32)) Bool)

(assert (=> b!402641 (= res!232006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187750 mask!1025))))

(assert (=> b!402641 (= lt!187750 (array!24154 (store (arr!11526 _keys!709) i!563 k0!794) (size!11879 _keys!709)))))

(declare-fun b!402642 () Bool)

(declare-fun e!242487 () Bool)

(declare-fun tp_is_empty!10135 () Bool)

(assert (=> b!402642 (= e!242487 tp_is_empty!10135)))

(declare-fun b!402643 () Bool)

(declare-datatypes ((tuple2!6774 0))(
  ( (tuple2!6775 (_1!3398 (_ BitVec 64)) (_2!3398 V!14619)) )
))
(declare-datatypes ((List!6678 0))(
  ( (Nil!6675) (Cons!6674 (h!7530 tuple2!6774) (t!11843 List!6678)) )
))
(declare-datatypes ((ListLongMap!5677 0))(
  ( (ListLongMap!5678 (toList!2854 List!6678)) )
))
(declare-fun call!28398 () ListLongMap!5677)

(declare-fun call!28399 () ListLongMap!5677)

(assert (=> b!402643 (= e!242488 (= call!28398 call!28399))))

(declare-fun b!402644 () Bool)

(declare-fun e!242484 () Bool)

(declare-fun mapRes!16824 () Bool)

(assert (=> b!402644 (= e!242484 (and e!242487 mapRes!16824))))

(declare-fun condMapEmpty!16824 () Bool)

(declare-fun mapDefault!16824 () ValueCell!4724)

(assert (=> b!402644 (= condMapEmpty!16824 (= (arr!11525 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4724)) mapDefault!16824)))))

(declare-fun mapNonEmpty!16824 () Bool)

(declare-fun tp!32882 () Bool)

(declare-fun e!242485 () Bool)

(assert (=> mapNonEmpty!16824 (= mapRes!16824 (and tp!32882 e!242485))))

(declare-fun mapValue!16824 () ValueCell!4724)

(declare-fun mapKey!16824 () (_ BitVec 32))

(declare-fun mapRest!16824 () (Array (_ BitVec 32) ValueCell!4724))

(assert (=> mapNonEmpty!16824 (= (arr!11525 _values!549) (store mapRest!16824 mapKey!16824 mapValue!16824))))

(declare-fun b!402645 () Bool)

(declare-fun res!232004 () Bool)

(assert (=> b!402645 (=> (not res!232004) (not e!242486))))

(declare-fun arrayContainsKey!0 (array!24153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402645 (= res!232004 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402646 () Bool)

(declare-fun res!232008 () Bool)

(assert (=> b!402646 (=> (not res!232008) (not e!242489))))

(declare-datatypes ((List!6679 0))(
  ( (Nil!6676) (Cons!6675 (h!7531 (_ BitVec 64)) (t!11844 List!6679)) )
))
(declare-fun arrayNoDuplicates!0 (array!24153 (_ BitVec 32) List!6679) Bool)

(assert (=> b!402646 (= res!232008 (arrayNoDuplicates!0 lt!187750 #b00000000000000000000000000000000 Nil!6676))))

(declare-fun bm!28395 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1070 (array!24153 array!24151 (_ BitVec 32) (_ BitVec 32) V!14619 V!14619 (_ BitVec 32) Int) ListLongMap!5677)

(assert (=> bm!28395 (= call!28398 (getCurrentListMapNoExtraKeys!1070 (ite c!54765 _keys!709 lt!187750) (ite c!54765 _values!549 (array!24152 (store (arr!11525 _values!549) i!563 (ValueCellFull!4724 v!412)) (size!11878 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402647 () Bool)

(declare-fun res!232007 () Bool)

(assert (=> b!402647 (=> (not res!232007) (not e!242486))))

(assert (=> b!402647 (= res!232007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28396 () Bool)

(assert (=> bm!28396 (= call!28399 (getCurrentListMapNoExtraKeys!1070 (ite c!54765 lt!187750 _keys!709) (ite c!54765 (array!24152 (store (arr!11525 _values!549) i!563 (ValueCellFull!4724 v!412)) (size!11878 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402648 () Bool)

(declare-fun res!232001 () Bool)

(assert (=> b!402648 (=> (not res!232001) (not e!242486))))

(assert (=> b!402648 (= res!232001 (or (= (select (arr!11526 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11526 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402649 () Bool)

(declare-fun res!231997 () Bool)

(assert (=> b!402649 (=> (not res!231997) (not e!242486))))

(assert (=> b!402649 (= res!231997 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11879 _keys!709))))))

(declare-fun b!402650 () Bool)

(assert (=> b!402650 (= e!242485 tp_is_empty!10135)))

(declare-fun b!402651 () Bool)

(declare-fun res!232002 () Bool)

(assert (=> b!402651 (=> (not res!232002) (not e!242486))))

(assert (=> b!402651 (= res!232002 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6676))))

(declare-fun b!402652 () Bool)

(declare-fun res!232000 () Bool)

(assert (=> b!402652 (=> (not res!232000) (not e!242489))))

(assert (=> b!402652 (= res!232000 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11879 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16824 () Bool)

(assert (=> mapIsEmpty!16824 mapRes!16824))

(declare-fun b!402653 () Bool)

(declare-fun res!232005 () Bool)

(assert (=> b!402653 (=> (not res!232005) (not e!242486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402653 (= res!232005 (validKeyInArray!0 k0!794))))

(declare-fun b!402654 () Bool)

(declare-fun +!1157 (ListLongMap!5677 tuple2!6774) ListLongMap!5677)

(assert (=> b!402654 (= e!242488 (= call!28399 (+!1157 call!28398 (tuple2!6775 k0!794 v!412))))))

(declare-fun res!232003 () Bool)

(assert (=> start!38702 (=> (not res!232003) (not e!242486))))

(assert (=> start!38702 (= res!232003 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11879 _keys!709))))))

(assert (=> start!38702 e!242486))

(assert (=> start!38702 tp_is_empty!10135))

(assert (=> start!38702 tp!32883))

(assert (=> start!38702 true))

(declare-fun array_inv!8452 (array!24151) Bool)

(assert (=> start!38702 (and (array_inv!8452 _values!549) e!242484)))

(declare-fun array_inv!8453 (array!24153) Bool)

(assert (=> start!38702 (array_inv!8453 _keys!709)))

(declare-fun b!402655 () Bool)

(declare-fun res!231999 () Bool)

(assert (=> b!402655 (=> (not res!231999) (not e!242486))))

(assert (=> b!402655 (= res!231999 (and (= (size!11878 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11879 _keys!709) (size!11878 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38702 res!232003) b!402640))

(assert (= (and b!402640 res!231998) b!402655))

(assert (= (and b!402655 res!231999) b!402647))

(assert (= (and b!402647 res!232007) b!402651))

(assert (= (and b!402651 res!232002) b!402649))

(assert (= (and b!402649 res!231997) b!402653))

(assert (= (and b!402653 res!232005) b!402648))

(assert (= (and b!402648 res!232001) b!402645))

(assert (= (and b!402645 res!232004) b!402641))

(assert (= (and b!402641 res!232006) b!402646))

(assert (= (and b!402646 res!232008) b!402652))

(assert (= (and b!402652 res!232000) b!402639))

(assert (= (and b!402639 c!54765) b!402654))

(assert (= (and b!402639 (not c!54765)) b!402643))

(assert (= (or b!402654 b!402643) bm!28396))

(assert (= (or b!402654 b!402643) bm!28395))

(assert (= (and b!402644 condMapEmpty!16824) mapIsEmpty!16824))

(assert (= (and b!402644 (not condMapEmpty!16824)) mapNonEmpty!16824))

(get-info :version)

(assert (= (and mapNonEmpty!16824 ((_ is ValueCellFull!4724) mapValue!16824)) b!402650))

(assert (= (and b!402644 ((_ is ValueCellFull!4724) mapDefault!16824)) b!402642))

(assert (= start!38702 b!402644))

(declare-fun m!395553 () Bool)

(assert (=> bm!28396 m!395553))

(declare-fun m!395555 () Bool)

(assert (=> bm!28396 m!395555))

(declare-fun m!395557 () Bool)

(assert (=> b!402641 m!395557))

(declare-fun m!395559 () Bool)

(assert (=> b!402641 m!395559))

(declare-fun m!395561 () Bool)

(assert (=> b!402639 m!395561))

(declare-fun m!395563 () Bool)

(assert (=> start!38702 m!395563))

(declare-fun m!395565 () Bool)

(assert (=> start!38702 m!395565))

(declare-fun m!395567 () Bool)

(assert (=> b!402654 m!395567))

(declare-fun m!395569 () Bool)

(assert (=> b!402646 m!395569))

(declare-fun m!395571 () Bool)

(assert (=> b!402651 m!395571))

(declare-fun m!395573 () Bool)

(assert (=> b!402647 m!395573))

(assert (=> bm!28395 m!395553))

(declare-fun m!395575 () Bool)

(assert (=> bm!28395 m!395575))

(declare-fun m!395577 () Bool)

(assert (=> b!402653 m!395577))

(declare-fun m!395579 () Bool)

(assert (=> mapNonEmpty!16824 m!395579))

(declare-fun m!395581 () Bool)

(assert (=> b!402645 m!395581))

(declare-fun m!395583 () Bool)

(assert (=> b!402648 m!395583))

(declare-fun m!395585 () Bool)

(assert (=> b!402640 m!395585))

(check-sat (not mapNonEmpty!16824) (not b!402654) (not b!402641) (not start!38702) (not b!402651) (not b!402640) (not bm!28396) (not b!402653) (not b!402645) (not b!402646) tp_is_empty!10135 (not b!402647) (not b_next!9253) (not bm!28395) (not b!402639) b_and!16613)
(check-sat b_and!16613 (not b_next!9253))
