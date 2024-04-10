; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132182 () Bool)

(assert start!132182)

(declare-fun b_free!31877 () Bool)

(declare-fun b_next!31877 () Bool)

(assert (=> start!132182 (= b_free!31877 (not b_next!31877))))

(declare-fun tp!111885 () Bool)

(declare-fun b_and!51303 () Bool)

(assert (=> start!132182 (= tp!111885 b_and!51303)))

(declare-fun b!1550717 () Bool)

(declare-fun res!1062112 () Bool)

(declare-fun e!863221 () Bool)

(assert (=> b!1550717 (=> (not res!1062112) (not e!863221))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103504 0))(
  ( (array!103505 (arr!49953 (Array (_ BitVec 32) (_ BitVec 64))) (size!50503 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103504)

(assert (=> b!1550717 (= res!1062112 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50503 _keys!618))))))

(declare-fun b!1550718 () Bool)

(declare-fun e!863225 () Bool)

(assert (=> b!1550718 (= e!863225 (not true))))

(declare-datatypes ((V!59313 0))(
  ( (V!59314 (val!19154 Int)) )
))
(declare-fun zeroValue!436 () V!59313)

(declare-datatypes ((tuple2!24686 0))(
  ( (tuple2!24687 (_1!12354 (_ BitVec 64)) (_2!12354 V!59313)) )
))
(declare-datatypes ((List!36165 0))(
  ( (Nil!36162) (Cons!36161 (h!37606 tuple2!24686) (t!50873 List!36165)) )
))
(declare-datatypes ((ListLongMap!22295 0))(
  ( (ListLongMap!22296 (toList!11163 List!36165)) )
))
(declare-fun lt!668375 () ListLongMap!22295)

(declare-fun contains!10104 (ListLongMap!22295 (_ BitVec 64)) Bool)

(declare-fun +!4985 (ListLongMap!22295 tuple2!24686) ListLongMap!22295)

(assert (=> b!1550718 (contains!10104 (+!4985 lt!668375 (tuple2!24687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49953 _keys!618) from!762))))

(declare-datatypes ((Unit!51650 0))(
  ( (Unit!51651) )
))
(declare-fun lt!668373 () Unit!51650)

(declare-fun addStillContains!1286 (ListLongMap!22295 (_ BitVec 64) V!59313 (_ BitVec 64)) Unit!51650)

(assert (=> b!1550718 (= lt!668373 (addStillContains!1286 lt!668375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49953 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59313)

(declare-datatypes ((ValueCell!18166 0))(
  ( (ValueCellFull!18166 (v!21956 V!59313)) (EmptyCell!18166) )
))
(declare-datatypes ((array!103506 0))(
  ( (array!103507 (arr!49954 (Array (_ BitVec 32) ValueCell!18166)) (size!50504 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103506)

(declare-fun getCurrentListMapNoExtraKeys!6612 (array!103504 array!103506 (_ BitVec 32) (_ BitVec 32) V!59313 V!59313 (_ BitVec 32) Int) ListLongMap!22295)

(assert (=> b!1550718 (= lt!668375 (getCurrentListMapNoExtraKeys!6612 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550719 () Bool)

(declare-fun res!1062113 () Bool)

(assert (=> b!1550719 (=> (not res!1062113) (not e!863221))))

(assert (=> b!1550719 (= res!1062113 (and (= (size!50504 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50503 _keys!618) (size!50504 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550720 () Bool)

(declare-fun e!863222 () ListLongMap!22295)

(declare-fun call!70827 () ListLongMap!22295)

(assert (=> b!1550720 (= e!863222 call!70827)))

(declare-fun mapIsEmpty!58936 () Bool)

(declare-fun mapRes!58936 () Bool)

(assert (=> mapIsEmpty!58936 mapRes!58936))

(declare-fun b!1550721 () Bool)

(declare-fun e!863220 () Bool)

(declare-fun tp_is_empty!38153 () Bool)

(assert (=> b!1550721 (= e!863220 tp_is_empty!38153)))

(declare-fun b!1550722 () Bool)

(declare-fun call!70826 () ListLongMap!22295)

(assert (=> b!1550722 (= e!863222 call!70826)))

(declare-fun call!70824 () ListLongMap!22295)

(declare-fun c!142633 () Bool)

(declare-fun call!70823 () ListLongMap!22295)

(declare-fun call!70825 () ListLongMap!22295)

(declare-fun c!142632 () Bool)

(declare-fun bm!70820 () Bool)

(assert (=> bm!70820 (= call!70823 (+!4985 (ite c!142632 call!70824 (ite c!142633 call!70825 call!70826)) (ite (or c!142632 c!142633) (tuple2!24687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24687 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70821 () Bool)

(assert (=> bm!70821 (= call!70824 (getCurrentListMapNoExtraKeys!6612 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550723 () Bool)

(declare-fun e!863223 () Bool)

(assert (=> b!1550723 (= e!863223 tp_is_empty!38153)))

(declare-fun b!1550724 () Bool)

(declare-fun res!1062111 () Bool)

(assert (=> b!1550724 (=> (not res!1062111) (not e!863221))))

(declare-datatypes ((List!36166 0))(
  ( (Nil!36163) (Cons!36162 (h!37607 (_ BitVec 64)) (t!50874 List!36166)) )
))
(declare-fun arrayNoDuplicates!0 (array!103504 (_ BitVec 32) List!36166) Bool)

(assert (=> b!1550724 (= res!1062111 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36163))))

(declare-fun b!1550725 () Bool)

(declare-fun c!142634 () Bool)

(declare-fun lt!668376 () Bool)

(assert (=> b!1550725 (= c!142634 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668376))))

(declare-fun e!863227 () ListLongMap!22295)

(assert (=> b!1550725 (= e!863227 e!863222)))

(declare-fun bm!70822 () Bool)

(assert (=> bm!70822 (= call!70827 call!70823)))

(declare-fun b!1550726 () Bool)

(assert (=> b!1550726 (= e!863221 e!863225)))

(declare-fun res!1062107 () Bool)

(assert (=> b!1550726 (=> (not res!1062107) (not e!863225))))

(assert (=> b!1550726 (= res!1062107 (bvslt from!762 (size!50503 _keys!618)))))

(declare-fun lt!668374 () ListLongMap!22295)

(declare-fun e!863226 () ListLongMap!22295)

(assert (=> b!1550726 (= lt!668374 e!863226)))

(assert (=> b!1550726 (= c!142632 (and (not lt!668376) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550726 (= lt!668376 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!58936 () Bool)

(declare-fun tp!111886 () Bool)

(assert (=> mapNonEmpty!58936 (= mapRes!58936 (and tp!111886 e!863220))))

(declare-fun mapRest!58936 () (Array (_ BitVec 32) ValueCell!18166))

(declare-fun mapKey!58936 () (_ BitVec 32))

(declare-fun mapValue!58936 () ValueCell!18166)

(assert (=> mapNonEmpty!58936 (= (arr!49954 _values!470) (store mapRest!58936 mapKey!58936 mapValue!58936))))

(declare-fun bm!70823 () Bool)

(assert (=> bm!70823 (= call!70825 call!70824)))

(declare-fun b!1550727 () Bool)

(assert (=> b!1550727 (= e!863226 (+!4985 call!70823 (tuple2!24687 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550728 () Bool)

(declare-fun res!1062109 () Bool)

(assert (=> b!1550728 (=> (not res!1062109) (not e!863221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103504 (_ BitVec 32)) Bool)

(assert (=> b!1550728 (= res!1062109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550729 () Bool)

(assert (=> b!1550729 (= e!863227 call!70827)))

(declare-fun res!1062110 () Bool)

(assert (=> start!132182 (=> (not res!1062110) (not e!863221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132182 (= res!1062110 (validMask!0 mask!926))))

(assert (=> start!132182 e!863221))

(declare-fun array_inv!38839 (array!103504) Bool)

(assert (=> start!132182 (array_inv!38839 _keys!618)))

(assert (=> start!132182 tp_is_empty!38153))

(assert (=> start!132182 true))

(assert (=> start!132182 tp!111885))

(declare-fun e!863224 () Bool)

(declare-fun array_inv!38840 (array!103506) Bool)

(assert (=> start!132182 (and (array_inv!38840 _values!470) e!863224)))

(declare-fun b!1550730 () Bool)

(assert (=> b!1550730 (= e!863224 (and e!863223 mapRes!58936))))

(declare-fun condMapEmpty!58936 () Bool)

(declare-fun mapDefault!58936 () ValueCell!18166)

