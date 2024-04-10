; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132016 () Bool)

(assert start!132016)

(declare-fun b_free!31729 () Bool)

(declare-fun b_next!31729 () Bool)

(assert (=> start!132016 (= b_free!31729 (not b_next!31729))))

(declare-fun tp!111438 () Bool)

(declare-fun b_and!51139 () Bool)

(assert (=> start!132016 (= tp!111438 b_and!51139)))

(declare-datatypes ((V!59117 0))(
  ( (V!59118 (val!19080 Int)) )
))
(declare-fun zeroValue!436 () V!59117)

(declare-fun bm!69692 () Bool)

(declare-datatypes ((tuple2!24540 0))(
  ( (tuple2!24541 (_1!12281 (_ BitVec 64)) (_2!12281 V!59117)) )
))
(declare-datatypes ((List!36041 0))(
  ( (Nil!36038) (Cons!36037 (h!37482 tuple2!24540) (t!50735 List!36041)) )
))
(declare-datatypes ((ListLongMap!22149 0))(
  ( (ListLongMap!22150 (toList!11090 List!36041)) )
))
(declare-fun call!69696 () ListLongMap!22149)

(declare-fun c!141909 () Bool)

(declare-fun call!69699 () ListLongMap!22149)

(declare-fun minValue!436 () V!59117)

(declare-fun call!69695 () ListLongMap!22149)

(declare-fun c!141910 () Bool)

(declare-fun call!69697 () ListLongMap!22149)

(declare-fun +!4922 (ListLongMap!22149 tuple2!24540) ListLongMap!22149)

(assert (=> bm!69692 (= call!69696 (+!4922 (ite c!141909 call!69695 (ite c!141910 call!69699 call!69697)) (ite (or c!141909 c!141910) (tuple2!24541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546937 () Bool)

(declare-fun res!1060465 () Bool)

(declare-fun e!861065 () Bool)

(assert (=> b!1546937 (=> (not res!1060465) (not e!861065))))

(declare-datatypes ((array!103210 0))(
  ( (array!103211 (arr!49807 (Array (_ BitVec 32) (_ BitVec 64))) (size!50357 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103210)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546937 (= res!1060465 (validKeyInArray!0 (select (arr!49807 _keys!618) from!762)))))

(declare-fun b!1546938 () Bool)

(declare-fun res!1060462 () Bool)

(declare-fun e!861067 () Bool)

(assert (=> b!1546938 (=> (not res!1060462) (not e!861067))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18092 0))(
  ( (ValueCellFull!18092 (v!21881 V!59117)) (EmptyCell!18092) )
))
(declare-datatypes ((array!103212 0))(
  ( (array!103213 (arr!49808 (Array (_ BitVec 32) ValueCell!18092)) (size!50358 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103212)

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1546938 (= res!1060462 (and (= (size!50358 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50357 _keys!618) (size!50358 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546939 () Bool)

(declare-fun e!861066 () Bool)

(declare-fun tp_is_empty!38005 () Bool)

(assert (=> b!1546939 (= e!861066 tp_is_empty!38005)))

(declare-fun mapIsEmpty!58711 () Bool)

(declare-fun mapRes!58711 () Bool)

(assert (=> mapIsEmpty!58711 mapRes!58711))

(declare-fun bm!69693 () Bool)

(assert (=> bm!69693 (= call!69699 call!69695)))

(declare-fun b!1546940 () Bool)

(assert (=> b!1546940 (= e!861065 (not true))))

(declare-fun lt!666720 () ListLongMap!22149)

(declare-fun apply!1044 (ListLongMap!22149 (_ BitVec 64)) V!59117)

(assert (=> b!1546940 (= (apply!1044 (+!4922 lt!666720 (tuple2!24541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49807 _keys!618) from!762)) (apply!1044 lt!666720 (select (arr!49807 _keys!618) from!762)))))

(declare-datatypes ((Unit!51538 0))(
  ( (Unit!51539) )
))
(declare-fun lt!666722 () Unit!51538)

(declare-fun addApplyDifferent!586 (ListLongMap!22149 (_ BitVec 64) V!59117 (_ BitVec 64)) Unit!51538)

(assert (=> b!1546940 (= lt!666722 (addApplyDifferent!586 lt!666720 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49807 _keys!618) from!762)))))

(declare-fun contains!10051 (ListLongMap!22149 (_ BitVec 64)) Bool)

(assert (=> b!1546940 (contains!10051 (+!4922 lt!666720 (tuple2!24541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49807 _keys!618) from!762))))

(declare-fun lt!666721 () Unit!51538)

(declare-fun addStillContains!1239 (ListLongMap!22149 (_ BitVec 64) V!59117 (_ BitVec 64)) Unit!51538)

(assert (=> b!1546940 (= lt!666721 (addStillContains!1239 lt!666720 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49807 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6551 (array!103210 array!103212 (_ BitVec 32) (_ BitVec 32) V!59117 V!59117 (_ BitVec 32) Int) ListLongMap!22149)

(assert (=> b!1546940 (= lt!666720 (getCurrentListMapNoExtraKeys!6551 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58711 () Bool)

(declare-fun tp!111439 () Bool)

(declare-fun e!861069 () Bool)

(assert (=> mapNonEmpty!58711 (= mapRes!58711 (and tp!111439 e!861069))))

(declare-fun mapKey!58711 () (_ BitVec 32))

(declare-fun mapValue!58711 () ValueCell!18092)

(declare-fun mapRest!58711 () (Array (_ BitVec 32) ValueCell!18092))

(assert (=> mapNonEmpty!58711 (= (arr!49808 _values!470) (store mapRest!58711 mapKey!58711 mapValue!58711))))

(declare-fun b!1546941 () Bool)

(declare-fun e!861070 () ListLongMap!22149)

(assert (=> b!1546941 (= e!861070 (+!4922 call!69696 (tuple2!24541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69694 () Bool)

(declare-fun call!69698 () ListLongMap!22149)

(assert (=> bm!69694 (= call!69698 call!69696)))

(declare-fun b!1546942 () Bool)

(assert (=> b!1546942 (= e!861067 e!861065)))

(declare-fun res!1060466 () Bool)

(assert (=> b!1546942 (=> (not res!1060466) (not e!861065))))

(assert (=> b!1546942 (= res!1060466 (bvslt from!762 (size!50357 _keys!618)))))

(declare-fun lt!666719 () ListLongMap!22149)

(assert (=> b!1546942 (= lt!666719 e!861070)))

(declare-fun lt!666718 () Bool)

(assert (=> b!1546942 (= c!141909 (and (not lt!666718) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546942 (= lt!666718 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546943 () Bool)

(declare-fun e!861064 () ListLongMap!22149)

(assert (=> b!1546943 (= e!861064 call!69697)))

(declare-fun b!1546944 () Bool)

(assert (=> b!1546944 (= e!861064 call!69698)))

(declare-fun b!1546945 () Bool)

(declare-fun res!1060464 () Bool)

(assert (=> b!1546945 (=> (not res!1060464) (not e!861067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103210 (_ BitVec 32)) Bool)

(assert (=> b!1546945 (= res!1060464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546946 () Bool)

(assert (=> b!1546946 (= e!861069 tp_is_empty!38005)))

(declare-fun b!1546947 () Bool)

(declare-fun e!861072 () ListLongMap!22149)

(assert (=> b!1546947 (= e!861070 e!861072)))

(assert (=> b!1546947 (= c!141910 (and (not lt!666718) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546948 () Bool)

(declare-fun res!1060463 () Bool)

(assert (=> b!1546948 (=> (not res!1060463) (not e!861067))))

(assert (=> b!1546948 (= res!1060463 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50357 _keys!618))))))

(declare-fun b!1546949 () Bool)

(assert (=> b!1546949 (= e!861072 call!69698)))

(declare-fun b!1546950 () Bool)

(declare-fun res!1060461 () Bool)

(assert (=> b!1546950 (=> (not res!1060461) (not e!861067))))

(declare-datatypes ((List!36042 0))(
  ( (Nil!36039) (Cons!36038 (h!37483 (_ BitVec 64)) (t!50736 List!36042)) )
))
(declare-fun arrayNoDuplicates!0 (array!103210 (_ BitVec 32) List!36042) Bool)

(assert (=> b!1546950 (= res!1060461 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36039))))

(declare-fun res!1060467 () Bool)

(assert (=> start!132016 (=> (not res!1060467) (not e!861067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132016 (= res!1060467 (validMask!0 mask!926))))

(assert (=> start!132016 e!861067))

(declare-fun array_inv!38737 (array!103210) Bool)

(assert (=> start!132016 (array_inv!38737 _keys!618)))

(assert (=> start!132016 tp_is_empty!38005))

(assert (=> start!132016 true))

(assert (=> start!132016 tp!111438))

(declare-fun e!861071 () Bool)

(declare-fun array_inv!38738 (array!103212) Bool)

(assert (=> start!132016 (and (array_inv!38738 _values!470) e!861071)))

(declare-fun b!1546951 () Bool)

(declare-fun c!141911 () Bool)

(assert (=> b!1546951 (= c!141911 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666718))))

(assert (=> b!1546951 (= e!861072 e!861064)))

(declare-fun bm!69695 () Bool)

(assert (=> bm!69695 (= call!69697 call!69699)))

(declare-fun bm!69696 () Bool)

(assert (=> bm!69696 (= call!69695 (getCurrentListMapNoExtraKeys!6551 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546952 () Bool)

(assert (=> b!1546952 (= e!861071 (and e!861066 mapRes!58711))))

(declare-fun condMapEmpty!58711 () Bool)

(declare-fun mapDefault!58711 () ValueCell!18092)

