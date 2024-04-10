; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132180 () Bool)

(assert start!132180)

(declare-fun b_free!31875 () Bool)

(declare-fun b_next!31875 () Bool)

(assert (=> start!132180 (= b_free!31875 (not b_next!31875))))

(declare-fun tp!111879 () Bool)

(declare-fun b_and!51301 () Bool)

(assert (=> start!132180 (= tp!111879 b_and!51301)))

(declare-fun b!1550669 () Bool)

(declare-datatypes ((V!59311 0))(
  ( (V!59312 (val!19153 Int)) )
))
(declare-datatypes ((tuple2!24684 0))(
  ( (tuple2!24685 (_1!12353 (_ BitVec 64)) (_2!12353 V!59311)) )
))
(declare-datatypes ((List!36163 0))(
  ( (Nil!36160) (Cons!36159 (h!37604 tuple2!24684) (t!50871 List!36163)) )
))
(declare-datatypes ((ListLongMap!22293 0))(
  ( (ListLongMap!22294 (toList!11162 List!36163)) )
))
(declare-fun e!863194 () ListLongMap!22293)

(declare-fun call!70808 () ListLongMap!22293)

(assert (=> b!1550669 (= e!863194 call!70808)))

(declare-fun bm!70805 () Bool)

(declare-fun call!70811 () ListLongMap!22293)

(assert (=> bm!70805 (= call!70808 call!70811)))

(declare-fun b!1550670 () Bool)

(declare-fun e!863199 () ListLongMap!22293)

(declare-fun minValue!436 () V!59311)

(declare-fun +!4984 (ListLongMap!22293 tuple2!24684) ListLongMap!22293)

(assert (=> b!1550670 (= e!863199 (+!4984 call!70811 (tuple2!24685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550671 () Bool)

(declare-fun res!1062087 () Bool)

(declare-fun e!863195 () Bool)

(assert (=> b!1550671 (=> (not res!1062087) (not e!863195))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103500 0))(
  ( (array!103501 (arr!49951 (Array (_ BitVec 32) (_ BitVec 64))) (size!50501 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103500)

(assert (=> b!1550671 (= res!1062087 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50501 _keys!618))))))

(declare-fun b!1550672 () Bool)

(declare-fun res!1062091 () Bool)

(declare-fun e!863192 () Bool)

(assert (=> b!1550672 (=> (not res!1062091) (not e!863192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550672 (= res!1062091 (validKeyInArray!0 (select (arr!49951 _keys!618) from!762)))))

(declare-fun res!1062086 () Bool)

(assert (=> start!132180 (=> (not res!1062086) (not e!863195))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132180 (= res!1062086 (validMask!0 mask!926))))

(assert (=> start!132180 e!863195))

(declare-fun array_inv!38837 (array!103500) Bool)

(assert (=> start!132180 (array_inv!38837 _keys!618)))

(declare-fun tp_is_empty!38151 () Bool)

(assert (=> start!132180 tp_is_empty!38151))

(assert (=> start!132180 true))

(assert (=> start!132180 tp!111879))

(declare-datatypes ((ValueCell!18165 0))(
  ( (ValueCellFull!18165 (v!21955 V!59311)) (EmptyCell!18165) )
))
(declare-datatypes ((array!103502 0))(
  ( (array!103503 (arr!49952 (Array (_ BitVec 32) ValueCell!18165)) (size!50502 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103502)

(declare-fun e!863200 () Bool)

(declare-fun array_inv!38838 (array!103502) Bool)

(assert (=> start!132180 (and (array_inv!38838 _values!470) e!863200)))

(declare-fun mapIsEmpty!58933 () Bool)

(declare-fun mapRes!58933 () Bool)

(assert (=> mapIsEmpty!58933 mapRes!58933))

(declare-fun b!1550673 () Bool)

(declare-fun c!142623 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668361 () Bool)

(assert (=> b!1550673 (= c!142623 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668361))))

(declare-fun e!863197 () ListLongMap!22293)

(assert (=> b!1550673 (= e!863194 e!863197)))

(declare-fun b!1550674 () Bool)

(declare-fun res!1062089 () Bool)

(assert (=> b!1550674 (=> (not res!1062089) (not e!863195))))

(assert (=> b!1550674 (= res!1062089 (and (= (size!50502 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50501 _keys!618) (size!50502 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550675 () Bool)

(assert (=> b!1550675 (= e!863199 e!863194)))

(declare-fun c!142624 () Bool)

(assert (=> b!1550675 (= c!142624 (and (not lt!668361) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550676 () Bool)

(assert (=> b!1550676 (= e!863192 (not true))))

(declare-fun zeroValue!436 () V!59311)

(declare-fun lt!668364 () ListLongMap!22293)

(declare-fun contains!10103 (ListLongMap!22293 (_ BitVec 64)) Bool)

(assert (=> b!1550676 (contains!10103 (+!4984 lt!668364 (tuple2!24685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49951 _keys!618) from!762))))

(declare-datatypes ((Unit!51648 0))(
  ( (Unit!51649) )
))
(declare-fun lt!668362 () Unit!51648)

(declare-fun addStillContains!1285 (ListLongMap!22293 (_ BitVec 64) V!59311 (_ BitVec 64)) Unit!51648)

(assert (=> b!1550676 (= lt!668362 (addStillContains!1285 lt!668364 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49951 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6611 (array!103500 array!103502 (_ BitVec 32) (_ BitVec 32) V!59311 V!59311 (_ BitVec 32) Int) ListLongMap!22293)

(assert (=> b!1550676 (= lt!668364 (getCurrentListMapNoExtraKeys!6611 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550677 () Bool)

(declare-fun e!863198 () Bool)

(assert (=> b!1550677 (= e!863198 tp_is_empty!38151)))

(declare-fun b!1550678 () Bool)

(declare-fun e!863193 () Bool)

(assert (=> b!1550678 (= e!863200 (and e!863193 mapRes!58933))))

(declare-fun condMapEmpty!58933 () Bool)

(declare-fun mapDefault!58933 () ValueCell!18165)

(assert (=> b!1550678 (= condMapEmpty!58933 (= (arr!49952 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18165)) mapDefault!58933)))))

(declare-fun b!1550679 () Bool)

(assert (=> b!1550679 (= e!863193 tp_is_empty!38151)))

(declare-fun bm!70806 () Bool)

(declare-fun call!70812 () ListLongMap!22293)

(declare-fun call!70809 () ListLongMap!22293)

(assert (=> bm!70806 (= call!70812 call!70809)))

(declare-fun mapNonEmpty!58933 () Bool)

(declare-fun tp!111880 () Bool)

(assert (=> mapNonEmpty!58933 (= mapRes!58933 (and tp!111880 e!863198))))

(declare-fun mapKey!58933 () (_ BitVec 32))

(declare-fun mapRest!58933 () (Array (_ BitVec 32) ValueCell!18165))

(declare-fun mapValue!58933 () ValueCell!18165)

(assert (=> mapNonEmpty!58933 (= (arr!49952 _values!470) (store mapRest!58933 mapKey!58933 mapValue!58933))))

(declare-fun b!1550680 () Bool)

(declare-fun res!1062092 () Bool)

(assert (=> b!1550680 (=> (not res!1062092) (not e!863195))))

(declare-datatypes ((List!36164 0))(
  ( (Nil!36161) (Cons!36160 (h!37605 (_ BitVec 64)) (t!50872 List!36164)) )
))
(declare-fun arrayNoDuplicates!0 (array!103500 (_ BitVec 32) List!36164) Bool)

(assert (=> b!1550680 (= res!1062092 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36161))))

(declare-fun b!1550681 () Bool)

(assert (=> b!1550681 (= e!863195 e!863192)))

(declare-fun res!1062088 () Bool)

(assert (=> b!1550681 (=> (not res!1062088) (not e!863192))))

(assert (=> b!1550681 (= res!1062088 (bvslt from!762 (size!50501 _keys!618)))))

(declare-fun lt!668363 () ListLongMap!22293)

(assert (=> b!1550681 (= lt!668363 e!863199)))

(declare-fun c!142625 () Bool)

(assert (=> b!1550681 (= c!142625 (and (not lt!668361) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550681 (= lt!668361 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70807 () Bool)

(assert (=> bm!70807 (= call!70809 (getCurrentListMapNoExtraKeys!6611 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550682 () Bool)

(declare-fun res!1062090 () Bool)

(assert (=> b!1550682 (=> (not res!1062090) (not e!863195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103500 (_ BitVec 32)) Bool)

(assert (=> b!1550682 (= res!1062090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550683 () Bool)

(assert (=> b!1550683 (= e!863197 call!70808)))

(declare-fun bm!70808 () Bool)

(declare-fun call!70810 () ListLongMap!22293)

(assert (=> bm!70808 (= call!70810 call!70812)))

(declare-fun bm!70809 () Bool)

(assert (=> bm!70809 (= call!70811 (+!4984 (ite c!142625 call!70809 (ite c!142624 call!70812 call!70810)) (ite (or c!142625 c!142624) (tuple2!24685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550684 () Bool)

(assert (=> b!1550684 (= e!863197 call!70810)))

(assert (= (and start!132180 res!1062086) b!1550674))

(assert (= (and b!1550674 res!1062089) b!1550682))

(assert (= (and b!1550682 res!1062090) b!1550680))

(assert (= (and b!1550680 res!1062092) b!1550671))

(assert (= (and b!1550671 res!1062087) b!1550681))

(assert (= (and b!1550681 c!142625) b!1550670))

(assert (= (and b!1550681 (not c!142625)) b!1550675))

(assert (= (and b!1550675 c!142624) b!1550669))

(assert (= (and b!1550675 (not c!142624)) b!1550673))

(assert (= (and b!1550673 c!142623) b!1550683))

(assert (= (and b!1550673 (not c!142623)) b!1550684))

(assert (= (or b!1550683 b!1550684) bm!70808))

(assert (= (or b!1550669 bm!70808) bm!70806))

(assert (= (or b!1550669 b!1550683) bm!70805))

(assert (= (or b!1550670 bm!70806) bm!70807))

(assert (= (or b!1550670 bm!70805) bm!70809))

(assert (= (and b!1550681 res!1062088) b!1550672))

(assert (= (and b!1550672 res!1062091) b!1550676))

(assert (= (and b!1550678 condMapEmpty!58933) mapIsEmpty!58933))

(assert (= (and b!1550678 (not condMapEmpty!58933)) mapNonEmpty!58933))

(get-info :version)

(assert (= (and mapNonEmpty!58933 ((_ is ValueCellFull!18165) mapValue!58933)) b!1550677))

(assert (= (and b!1550678 ((_ is ValueCellFull!18165) mapDefault!58933)) b!1550679))

(assert (= start!132180 b!1550678))

(declare-fun m!1429503 () Bool)

(assert (=> b!1550670 m!1429503))

(declare-fun m!1429505 () Bool)

(assert (=> b!1550676 m!1429505))

(declare-fun m!1429507 () Bool)

(assert (=> b!1550676 m!1429507))

(declare-fun m!1429509 () Bool)

(assert (=> b!1550676 m!1429509))

(assert (=> b!1550676 m!1429507))

(declare-fun m!1429511 () Bool)

(assert (=> b!1550676 m!1429511))

(assert (=> b!1550676 m!1429509))

(assert (=> b!1550676 m!1429507))

(declare-fun m!1429513 () Bool)

(assert (=> b!1550676 m!1429513))

(declare-fun m!1429515 () Bool)

(assert (=> b!1550680 m!1429515))

(declare-fun m!1429517 () Bool)

(assert (=> start!132180 m!1429517))

(declare-fun m!1429519 () Bool)

(assert (=> start!132180 m!1429519))

(declare-fun m!1429521 () Bool)

(assert (=> start!132180 m!1429521))

(assert (=> b!1550672 m!1429507))

(assert (=> b!1550672 m!1429507))

(declare-fun m!1429523 () Bool)

(assert (=> b!1550672 m!1429523))

(declare-fun m!1429525 () Bool)

(assert (=> bm!70809 m!1429525))

(assert (=> bm!70807 m!1429505))

(declare-fun m!1429527 () Bool)

(assert (=> mapNonEmpty!58933 m!1429527))

(declare-fun m!1429529 () Bool)

(assert (=> b!1550682 m!1429529))

(check-sat (not bm!70807) (not mapNonEmpty!58933) (not bm!70809) (not b!1550680) (not start!132180) tp_is_empty!38151 (not b!1550682) (not b!1550670) (not b!1550672) b_and!51301 (not b_next!31875) (not b!1550676))
(check-sat b_and!51301 (not b_next!31875))
