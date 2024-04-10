; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132288 () Bool)

(assert start!132288)

(declare-fun b_free!31915 () Bool)

(declare-fun b_next!31915 () Bool)

(assert (=> start!132288 (= b_free!31915 (not b_next!31915))))

(declare-fun tp!112008 () Bool)

(declare-fun b_and!51353 () Bool)

(assert (=> start!132288 (= tp!112008 b_and!51353)))

(declare-fun b!1551968 () Bool)

(declare-fun e!863970 () Bool)

(declare-datatypes ((array!103586 0))(
  ( (array!103587 (arr!49991 (Array (_ BitVec 32) (_ BitVec 64))) (size!50541 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103586)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551968 (= e!863970 (validKeyInArray!0 (select (arr!49991 _keys!618) from!762)))))

(declare-fun b!1551969 () Bool)

(declare-datatypes ((V!59365 0))(
  ( (V!59366 (val!19173 Int)) )
))
(declare-datatypes ((tuple2!24722 0))(
  ( (tuple2!24723 (_1!12372 (_ BitVec 64)) (_2!12372 V!59365)) )
))
(declare-datatypes ((List!36199 0))(
  ( (Nil!36196) (Cons!36195 (h!37640 tuple2!24722) (t!50913 List!36199)) )
))
(declare-datatypes ((ListLongMap!22331 0))(
  ( (ListLongMap!22332 (toList!11181 List!36199)) )
))
(declare-fun e!863965 () ListLongMap!22331)

(declare-fun call!71138 () ListLongMap!22331)

(declare-fun minValue!436 () V!59365)

(declare-fun +!5002 (ListLongMap!22331 tuple2!24722) ListLongMap!22331)

(assert (=> b!1551969 (= e!863965 (+!5002 call!71138 (tuple2!24723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!71132 () Bool)

(declare-fun call!71136 () ListLongMap!22331)

(declare-fun call!71135 () ListLongMap!22331)

(assert (=> bm!71132 (= call!71136 call!71135)))

(declare-fun b!1551971 () Bool)

(declare-fun c!142881 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!668999 () Bool)

(assert (=> b!1551971 (= c!142881 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668999))))

(declare-fun e!863969 () ListLongMap!22331)

(declare-fun e!863964 () ListLongMap!22331)

(assert (=> b!1551971 (= e!863969 e!863964)))

(declare-fun b!1551972 () Bool)

(declare-datatypes ((Unit!51685 0))(
  ( (Unit!51686) )
))
(declare-fun e!863967 () Unit!51685)

(declare-fun lt!669001 () Unit!51685)

(assert (=> b!1551972 (= e!863967 lt!669001)))

(declare-fun lt!669000 () ListLongMap!22331)

(declare-fun zeroValue!436 () V!59365)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18185 0))(
  ( (ValueCellFull!18185 (v!21978 V!59365)) (EmptyCell!18185) )
))
(declare-datatypes ((array!103588 0))(
  ( (array!103589 (arr!49992 (Array (_ BitVec 32) ValueCell!18185)) (size!50542 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103588)

(declare-fun getCurrentListMapNoExtraKeys!6628 (array!103586 array!103588 (_ BitVec 32) (_ BitVec 32) V!59365 V!59365 (_ BitVec 32) Int) ListLongMap!22331)

(assert (=> b!1551972 (= lt!669000 (getCurrentListMapNoExtraKeys!6628 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669005 () Unit!51685)

(declare-fun addStillContains!1299 (ListLongMap!22331 (_ BitVec 64) V!59365 (_ BitVec 64)) Unit!51685)

(assert (=> b!1551972 (= lt!669005 (addStillContains!1299 lt!669000 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49991 _keys!618) from!762)))))

(declare-fun lt!669003 () ListLongMap!22331)

(assert (=> b!1551972 (= lt!669003 (+!5002 lt!669000 (tuple2!24723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10123 (ListLongMap!22331 (_ BitVec 64)) Bool)

(assert (=> b!1551972 (contains!10123 lt!669003 (select (arr!49991 _keys!618) from!762))))

(declare-fun addApplyDifferent!641 (ListLongMap!22331 (_ BitVec 64) V!59365 (_ BitVec 64)) Unit!51685)

(assert (=> b!1551972 (= lt!669001 (addApplyDifferent!641 lt!669000 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49991 _keys!618) from!762)))))

(declare-fun lt!669004 () V!59365)

(declare-fun apply!1103 (ListLongMap!22331 (_ BitVec 64)) V!59365)

(assert (=> b!1551972 (= lt!669004 (apply!1103 (+!5002 lt!669000 (tuple2!24723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49991 _keys!618) from!762)))))

(declare-fun lt!669002 () V!59365)

(assert (=> b!1551972 (= lt!669002 (apply!1103 lt!669000 (select (arr!49991 _keys!618) from!762)))))

(assert (=> b!1551972 (= lt!669004 lt!669002)))

(declare-fun lt!669006 () Unit!51685)

(assert (=> b!1551972 (= lt!669006 (addApplyDifferent!641 lt!669000 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49991 _keys!618) from!762)))))

(assert (=> b!1551972 (= (apply!1103 lt!669003 (select (arr!49991 _keys!618) from!762)) lt!669002)))

(declare-fun bm!71133 () Bool)

(declare-fun call!71139 () ListLongMap!22331)

(assert (=> bm!71133 (= call!71139 (getCurrentListMapNoExtraKeys!6628 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71134 () Bool)

(declare-fun call!71137 () ListLongMap!22331)

(assert (=> bm!71134 (= call!71137 call!71138)))

(declare-fun mapNonEmpty!59002 () Bool)

(declare-fun mapRes!59002 () Bool)

(declare-fun tp!112009 () Bool)

(declare-fun e!863966 () Bool)

(assert (=> mapNonEmpty!59002 (= mapRes!59002 (and tp!112009 e!863966))))

(declare-fun mapKey!59002 () (_ BitVec 32))

(declare-fun mapRest!59002 () (Array (_ BitVec 32) ValueCell!18185))

(declare-fun mapValue!59002 () ValueCell!18185)

(assert (=> mapNonEmpty!59002 (= (arr!49992 _values!470) (store mapRest!59002 mapKey!59002 mapValue!59002))))

(declare-fun b!1551973 () Bool)

(declare-fun e!863962 () Bool)

(declare-fun tp_is_empty!38191 () Bool)

(assert (=> b!1551973 (= e!863962 tp_is_empty!38191)))

(declare-fun bm!71135 () Bool)

(assert (=> bm!71135 (= call!71135 call!71139)))

(declare-fun c!142883 () Bool)

(declare-fun bm!71136 () Bool)

(declare-fun c!142882 () Bool)

(assert (=> bm!71136 (= call!71138 (+!5002 (ite c!142883 call!71139 (ite c!142882 call!71135 call!71136)) (ite (or c!142883 c!142882) (tuple2!24723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551974 () Bool)

(declare-fun res!1062657 () Bool)

(declare-fun e!863963 () Bool)

(assert (=> b!1551974 (=> (not res!1062657) (not e!863963))))

(declare-datatypes ((List!36200 0))(
  ( (Nil!36197) (Cons!36196 (h!37641 (_ BitVec 64)) (t!50914 List!36200)) )
))
(declare-fun arrayNoDuplicates!0 (array!103586 (_ BitVec 32) List!36200) Bool)

(assert (=> b!1551974 (= res!1062657 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36197))))

(declare-fun b!1551975 () Bool)

(assert (=> b!1551975 (= e!863964 call!71137)))

(declare-fun b!1551976 () Bool)

(assert (=> b!1551976 (= e!863964 call!71136)))

(declare-fun b!1551970 () Bool)

(assert (=> b!1551970 (= e!863965 e!863969)))

(assert (=> b!1551970 (= c!142882 (and (not lt!668999) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1062660 () Bool)

(assert (=> start!132288 (=> (not res!1062660) (not e!863963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132288 (= res!1062660 (validMask!0 mask!926))))

(assert (=> start!132288 e!863963))

(declare-fun array_inv!38863 (array!103586) Bool)

(assert (=> start!132288 (array_inv!38863 _keys!618)))

(assert (=> start!132288 tp_is_empty!38191))

(assert (=> start!132288 true))

(assert (=> start!132288 tp!112008))

(declare-fun e!863968 () Bool)

(declare-fun array_inv!38864 (array!103588) Bool)

(assert (=> start!132288 (and (array_inv!38864 _values!470) e!863968)))

(declare-fun b!1551977 () Bool)

(declare-fun res!1062658 () Bool)

(assert (=> b!1551977 (=> (not res!1062658) (not e!863963))))

(assert (=> b!1551977 (= res!1062658 (and (= (size!50542 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50541 _keys!618) (size!50542 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59002 () Bool)

(assert (=> mapIsEmpty!59002 mapRes!59002))

(declare-fun b!1551978 () Bool)

(declare-fun Unit!51687 () Unit!51685)

(assert (=> b!1551978 (= e!863967 Unit!51687)))

(declare-fun b!1551979 () Bool)

(assert (=> b!1551979 (= e!863968 (and e!863962 mapRes!59002))))

(declare-fun condMapEmpty!59002 () Bool)

(declare-fun mapDefault!59002 () ValueCell!18185)

