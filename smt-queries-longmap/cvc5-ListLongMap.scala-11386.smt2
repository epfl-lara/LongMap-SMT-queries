; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132306 () Bool)

(assert start!132306)

(declare-fun b_free!31933 () Bool)

(declare-fun b_next!31933 () Bool)

(assert (=> start!132306 (= b_free!31933 (not b_next!31933))))

(declare-fun tp!112063 () Bool)

(declare-fun b_and!51371 () Bool)

(assert (=> start!132306 (= tp!112063 b_and!51371)))

(declare-fun b!1552474 () Bool)

(declare-datatypes ((V!59389 0))(
  ( (V!59390 (val!19182 Int)) )
))
(declare-datatypes ((tuple2!24740 0))(
  ( (tuple2!24741 (_1!12381 (_ BitVec 64)) (_2!12381 V!59389)) )
))
(declare-datatypes ((List!36215 0))(
  ( (Nil!36212) (Cons!36211 (h!37656 tuple2!24740) (t!50931 List!36215)) )
))
(declare-datatypes ((ListLongMap!22349 0))(
  ( (ListLongMap!22350 (toList!11190 List!36215)) )
))
(declare-fun e!864276 () ListLongMap!22349)

(declare-fun call!71275 () ListLongMap!22349)

(declare-fun minValue!436 () V!59389)

(declare-fun +!5010 (ListLongMap!22349 tuple2!24740) ListLongMap!22349)

(assert (=> b!1552474 (= e!864276 (+!5010 call!71275 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-datatypes ((array!103620 0))(
  ( (array!103621 (arr!50008 (Array (_ BitVec 32) (_ BitVec 64))) (size!50558 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103620)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18194 0))(
  ( (ValueCellFull!18194 (v!21987 V!59389)) (EmptyCell!18194) )
))
(declare-datatypes ((array!103622 0))(
  ( (array!103623 (arr!50009 (Array (_ BitVec 32) ValueCell!18194)) (size!50559 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103622)

(declare-fun lt!669300 () ListLongMap!22349)

(declare-fun e!864270 () Bool)

(declare-fun b!1552475 () Bool)

(declare-fun apply!1110 (ListLongMap!22349 (_ BitVec 64)) V!59389)

(declare-fun get!26036 (ValueCell!18194 V!59389) V!59389)

(declare-fun dynLambda!3805 (Int (_ BitVec 64)) V!59389)

(assert (=> b!1552475 (= e!864270 (not (= (apply!1110 lt!669300 (select (arr!50008 _keys!618) from!762)) (get!26036 (select (arr!50009 _values!470) from!762) (dynLambda!3805 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1552476 () Bool)

(declare-datatypes ((Unit!51708 0))(
  ( (Unit!51709) )
))
(declare-fun e!864273 () Unit!51708)

(declare-fun lt!669303 () Unit!51708)

(assert (=> b!1552476 (= e!864273 lt!669303)))

(declare-fun zeroValue!436 () V!59389)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun lt!669297 () ListLongMap!22349)

(declare-fun getCurrentListMapNoExtraKeys!6635 (array!103620 array!103622 (_ BitVec 32) (_ BitVec 32) V!59389 V!59389 (_ BitVec 32) Int) ListLongMap!22349)

(assert (=> b!1552476 (= lt!669297 (getCurrentListMapNoExtraKeys!6635 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!669296 () Unit!51708)

(declare-fun addStillContains!1306 (ListLongMap!22349 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51708)

(assert (=> b!1552476 (= lt!669296 (addStillContains!1306 lt!669297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50008 _keys!618) from!762)))))

(declare-fun lt!669306 () ListLongMap!22349)

(assert (=> b!1552476 (= lt!669306 (+!5010 lt!669297 (tuple2!24741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10130 (ListLongMap!22349 (_ BitVec 64)) Bool)

(assert (=> b!1552476 (contains!10130 lt!669306 (select (arr!50008 _keys!618) from!762))))

(declare-fun addApplyDifferent!648 (ListLongMap!22349 (_ BitVec 64) V!59389 (_ BitVec 64)) Unit!51708)

(assert (=> b!1552476 (= lt!669303 (addApplyDifferent!648 lt!669297 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50008 _keys!618) from!762)))))

(declare-fun lt!669304 () V!59389)

(assert (=> b!1552476 (= lt!669304 (apply!1110 (+!5010 lt!669297 (tuple2!24741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50008 _keys!618) from!762)))))

(declare-fun lt!669299 () V!59389)

(assert (=> b!1552476 (= lt!669299 (apply!1110 lt!669297 (select (arr!50008 _keys!618) from!762)))))

(assert (=> b!1552476 (= lt!669304 lt!669299)))

(declare-fun lt!669305 () Unit!51708)

(assert (=> b!1552476 (= lt!669305 (addApplyDifferent!648 lt!669297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50008 _keys!618) from!762)))))

(assert (=> b!1552476 (= (apply!1110 lt!669306 (select (arr!50008 _keys!618) from!762)) lt!669299)))

(declare-fun b!1552477 () Bool)

(declare-fun c!142995 () Bool)

(declare-fun lt!669298 () Bool)

(assert (=> b!1552477 (= c!142995 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669298))))

(declare-fun e!864278 () ListLongMap!22349)

(declare-fun e!864279 () ListLongMap!22349)

(assert (=> b!1552477 (= e!864278 e!864279)))

(declare-fun b!1552478 () Bool)

(declare-fun res!1062868 () Bool)

(declare-fun e!864275 () Bool)

(assert (=> b!1552478 (=> res!1062868 e!864275)))

(declare-fun e!864277 () Bool)

(assert (=> b!1552478 (= res!1062868 e!864277)))

(declare-fun c!142992 () Bool)

(assert (=> b!1552478 (= c!142992 (not lt!669298))))

(declare-fun b!1552479 () Bool)

(declare-fun call!71280 () Bool)

(assert (=> b!1552479 (= e!864277 call!71280)))

(declare-fun b!1552480 () Bool)

(declare-fun e!864267 () Bool)

(declare-fun e!864274 () Bool)

(declare-fun mapRes!59029 () Bool)

(assert (=> b!1552480 (= e!864267 (and e!864274 mapRes!59029))))

(declare-fun condMapEmpty!59029 () Bool)

(declare-fun mapDefault!59029 () ValueCell!18194)

