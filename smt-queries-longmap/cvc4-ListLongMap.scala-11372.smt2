; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132140 () Bool)

(assert start!132140)

(declare-fun b_free!31853 () Bool)

(declare-fun b_next!31853 () Bool)

(assert (=> start!132140 (= b_free!31853 (not b_next!31853))))

(declare-fun tp!111811 () Bool)

(declare-fun b_and!51273 () Bool)

(assert (=> start!132140 (= tp!111811 b_and!51273)))

(declare-fun b!1550058 () Bool)

(declare-datatypes ((V!59281 0))(
  ( (V!59282 (val!19142 Int)) )
))
(declare-datatypes ((tuple2!24662 0))(
  ( (tuple2!24663 (_1!12342 (_ BitVec 64)) (_2!12342 V!59281)) )
))
(declare-datatypes ((List!36146 0))(
  ( (Nil!36143) (Cons!36142 (h!37587 tuple2!24662) (t!50852 List!36146)) )
))
(declare-datatypes ((ListLongMap!22271 0))(
  ( (ListLongMap!22272 (toList!11151 List!36146)) )
))
(declare-fun e!862845 () ListLongMap!22271)

(declare-fun call!70634 () ListLongMap!22271)

(assert (=> b!1550058 (= e!862845 call!70634)))

(declare-fun b!1550059 () Bool)

(declare-datatypes ((Unit!51640 0))(
  ( (Unit!51641) )
))
(declare-fun e!862850 () Unit!51640)

(declare-fun Unit!51642 () Unit!51640)

(assert (=> b!1550059 (= e!862850 Unit!51642)))

(declare-fun b!1550060 () Bool)

(declare-fun e!862846 () Bool)

(declare-fun e!862854 () Bool)

(assert (=> b!1550060 (= e!862846 e!862854)))

(declare-fun res!1061834 () Bool)

(assert (=> b!1550060 (=> (not res!1061834) (not e!862854))))

(declare-fun e!862847 () Bool)

(assert (=> b!1550060 (= res!1061834 e!862847)))

(declare-fun res!1061837 () Bool)

(assert (=> b!1550060 (=> res!1061837 e!862847)))

(declare-fun lt!668215 () Bool)

(assert (=> b!1550060 (= res!1061837 lt!668215)))

(declare-fun lt!668210 () Unit!51640)

(assert (=> b!1550060 (= lt!668210 e!862850)))

(declare-fun c!142501 () Bool)

(assert (=> b!1550060 (= c!142501 (not lt!668215))))

(declare-fun e!862849 () Bool)

(assert (=> b!1550060 (= lt!668215 e!862849)))

(declare-fun res!1061839 () Bool)

(assert (=> b!1550060 (=> res!1061839 e!862849)))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103454 0))(
  ( (array!103455 (arr!49929 (Array (_ BitVec 32) (_ BitVec 64))) (size!50479 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103454)

(assert (=> b!1550060 (= res!1061839 (bvsge from!762 (size!50479 _keys!618)))))

(declare-fun lt!668208 () ListLongMap!22271)

(declare-fun e!862848 () ListLongMap!22271)

(assert (=> b!1550060 (= lt!668208 e!862848)))

(declare-fun c!142503 () Bool)

(declare-fun lt!668219 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1550060 (= c!142503 (and (not lt!668219) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550060 (= lt!668219 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!436 () V!59281)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18154 0))(
  ( (ValueCellFull!18154 (v!21943 V!59281)) (EmptyCell!18154) )
))
(declare-datatypes ((array!103456 0))(
  ( (array!103457 (arr!49930 (Array (_ BitVec 32) ValueCell!18154)) (size!50480 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103456)

(declare-fun minValue!436 () V!59281)

(declare-fun bm!70630 () Bool)

(declare-fun call!70635 () ListLongMap!22271)

(declare-fun getCurrentListMapNoExtraKeys!6601 (array!103454 array!103456 (_ BitVec 32) (_ BitVec 32) V!59281 V!59281 (_ BitVec 32) Int) ListLongMap!22271)

(assert (=> bm!70630 (= call!70635 (getCurrentListMapNoExtraKeys!6601 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550061 () Bool)

(declare-fun e!862851 () Bool)

(declare-fun tp_is_empty!38129 () Bool)

(assert (=> b!1550061 (= e!862851 tp_is_empty!38129)))

(declare-fun b!1550062 () Bool)

(declare-fun call!70633 () ListLongMap!22271)

(assert (=> b!1550062 (= e!862845 call!70633)))

(declare-fun b!1550063 () Bool)

(declare-fun c!142504 () Bool)

(assert (=> b!1550063 (= c!142504 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668219))))

(declare-fun e!862844 () ListLongMap!22271)

(assert (=> b!1550063 (= e!862844 e!862845)))

(declare-fun bm!70631 () Bool)

(declare-fun call!70638 () ListLongMap!22271)

(assert (=> bm!70631 (= call!70633 call!70638)))

(declare-fun b!1550064 () Bool)

(declare-fun +!4976 (ListLongMap!22271 tuple2!24662) ListLongMap!22271)

(assert (=> b!1550064 (= e!862848 (+!4976 call!70638 (tuple2!24663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun e!862841 () Bool)

(declare-fun b!1550065 () Bool)

(declare-fun apply!1090 (ListLongMap!22271 (_ BitVec 64)) V!59281)

(declare-fun get!26001 (ValueCell!18154 V!59281) V!59281)

(declare-fun dynLambda!3800 (Int (_ BitVec 64)) V!59281)

(assert (=> b!1550065 (= e!862841 (= (apply!1090 lt!668208 (select (arr!49929 _keys!618) from!762)) (get!26001 (select (arr!49930 _values!470) from!762) (dynLambda!3800 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1550066 () Bool)

(declare-fun e!862842 () Bool)

(declare-fun e!862843 () Bool)

(assert (=> b!1550066 (= e!862842 e!862843)))

(declare-fun res!1061832 () Bool)

(declare-fun call!70636 () Bool)

(assert (=> b!1550066 (= res!1061832 call!70636)))

(assert (=> b!1550066 (=> (not res!1061832) (not e!862843))))

(declare-fun b!1550067 () Bool)

(declare-fun res!1061830 () Bool)

(assert (=> b!1550067 (=> (not res!1061830) (not e!862846))))

(assert (=> b!1550067 (= res!1061830 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50479 _keys!618))))))

(declare-fun bm!70632 () Bool)

(declare-fun call!70637 () ListLongMap!22271)

(assert (=> bm!70632 (= call!70637 call!70635)))

(declare-fun c!142502 () Bool)

(declare-fun bm!70633 () Bool)

(assert (=> bm!70633 (= call!70638 (+!4976 (ite c!142503 call!70635 (ite c!142502 call!70637 call!70634)) (ite (or c!142503 c!142502) (tuple2!24663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550068 () Bool)

(declare-fun res!1061835 () Bool)

(assert (=> b!1550068 (=> (not res!1061835) (not e!862846))))

(assert (=> b!1550068 (= res!1061835 (and (= (size!50480 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50479 _keys!618) (size!50480 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550069 () Bool)

(declare-fun res!1061831 () Bool)

(assert (=> b!1550069 (=> (not res!1061831) (not e!862846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103454 (_ BitVec 32)) Bool)

(assert (=> b!1550069 (= res!1061831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70634 () Bool)

(declare-fun contains!10097 (ListLongMap!22271 (_ BitVec 64)) Bool)

(assert (=> bm!70634 (= call!70636 (contains!10097 lt!668208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!58897 () Bool)

(declare-fun mapRes!58897 () Bool)

(assert (=> mapIsEmpty!58897 mapRes!58897))

(declare-fun b!1550070 () Bool)

(assert (=> b!1550070 (= e!862848 e!862844)))

(assert (=> b!1550070 (= c!142502 (and (not lt!668219) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550071 () Bool)

(declare-fun e!862840 () Bool)

(assert (=> b!1550071 (= e!862840 (and e!862851 mapRes!58897))))

(declare-fun condMapEmpty!58897 () Bool)

(declare-fun mapDefault!58897 () ValueCell!18154)

