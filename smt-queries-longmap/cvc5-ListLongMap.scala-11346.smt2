; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131980 () Bool)

(assert start!131980)

(declare-fun b_free!31693 () Bool)

(declare-fun b_next!31693 () Bool)

(assert (=> start!131980 (= b_free!31693 (not b_next!31693))))

(declare-fun tp!111330 () Bool)

(declare-fun b_and!51103 () Bool)

(assert (=> start!131980 (= tp!111330 b_and!51103)))

(declare-fun b!1546073 () Bool)

(declare-fun e!860579 () Bool)

(declare-fun tp_is_empty!37969 () Bool)

(assert (=> b!1546073 (= e!860579 tp_is_empty!37969)))

(declare-fun b!1546074 () Bool)

(declare-fun res!1060085 () Bool)

(declare-fun e!860584 () Bool)

(assert (=> b!1546074 (=> (not res!1060085) (not e!860584))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103144 0))(
  ( (array!103145 (arr!49774 (Array (_ BitVec 32) (_ BitVec 64))) (size!50324 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103144)

(assert (=> b!1546074 (= res!1060085 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50324 _keys!618))))))

(declare-fun b!1546075 () Bool)

(declare-datatypes ((V!59069 0))(
  ( (V!59070 (val!19062 Int)) )
))
(declare-datatypes ((tuple2!24506 0))(
  ( (tuple2!24507 (_1!12264 (_ BitVec 64)) (_2!12264 V!59069)) )
))
(declare-datatypes ((List!36014 0))(
  ( (Nil!36011) (Cons!36010 (h!37455 tuple2!24506) (t!50708 List!36014)) )
))
(declare-datatypes ((ListLongMap!22115 0))(
  ( (ListLongMap!22116 (toList!11073 List!36014)) )
))
(declare-fun e!860581 () ListLongMap!22115)

(declare-fun e!860578 () ListLongMap!22115)

(assert (=> b!1546075 (= e!860581 e!860578)))

(declare-fun c!141747 () Bool)

(declare-fun lt!666476 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546075 (= c!141747 (and (not lt!666476) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!436 () V!59069)

(declare-fun call!69429 () ListLongMap!22115)

(declare-fun call!69426 () ListLongMap!22115)

(declare-fun minValue!436 () V!59069)

(declare-fun call!69428 () ListLongMap!22115)

(declare-fun bm!69422 () Bool)

(declare-fun call!69427 () ListLongMap!22115)

(declare-fun c!141749 () Bool)

(declare-fun +!4908 (ListLongMap!22115 tuple2!24506) ListLongMap!22115)

(assert (=> bm!69422 (= call!69427 (+!4908 (ite c!141749 call!69426 (ite c!141747 call!69428 call!69429)) (ite (or c!141749 c!141747) (tuple2!24507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546076 () Bool)

(assert (=> b!1546076 (= e!860581 (+!4908 call!69427 (tuple2!24507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546077 () Bool)

(declare-fun res!1060084 () Bool)

(declare-fun e!860585 () Bool)

(assert (=> b!1546077 (=> (not res!1060084) (not e!860585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546077 (= res!1060084 (validKeyInArray!0 (select (arr!49774 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58657 () Bool)

(declare-fun mapRes!58657 () Bool)

(assert (=> mapIsEmpty!58657 mapRes!58657))

(declare-fun b!1546078 () Bool)

(assert (=> b!1546078 (= e!860584 e!860585)))

(declare-fun res!1060088 () Bool)

(assert (=> b!1546078 (=> (not res!1060088) (not e!860585))))

(assert (=> b!1546078 (= res!1060088 (bvslt from!762 (size!50324 _keys!618)))))

(declare-fun lt!666474 () ListLongMap!22115)

(assert (=> b!1546078 (= lt!666474 e!860581)))

(assert (=> b!1546078 (= c!141749 (and (not lt!666476) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546078 (= lt!666476 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1546079 () Bool)

(declare-fun e!860586 () Bool)

(assert (=> b!1546079 (= e!860586 tp_is_empty!37969)))

(declare-fun b!1546080 () Bool)

(assert (=> b!1546080 (= e!860585 (not true))))

(declare-fun lt!666475 () ListLongMap!22115)

(declare-fun contains!10041 (ListLongMap!22115 (_ BitVec 64)) Bool)

(assert (=> b!1546080 (contains!10041 (+!4908 lt!666475 (tuple2!24507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49774 _keys!618) from!762))))

(declare-datatypes ((Unit!51518 0))(
  ( (Unit!51519) )
))
(declare-fun lt!666473 () Unit!51518)

(declare-fun addStillContains!1229 (ListLongMap!22115 (_ BitVec 64) V!59069 (_ BitVec 64)) Unit!51518)

(assert (=> b!1546080 (= lt!666473 (addStillContains!1229 lt!666475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49774 _keys!618) from!762)))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18074 0))(
  ( (ValueCellFull!18074 (v!21863 V!59069)) (EmptyCell!18074) )
))
(declare-datatypes ((array!103146 0))(
  ( (array!103147 (arr!49775 (Array (_ BitVec 32) ValueCell!18074)) (size!50325 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103146)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6539 (array!103144 array!103146 (_ BitVec 32) (_ BitVec 32) V!59069 V!59069 (_ BitVec 32) Int) ListLongMap!22115)

(assert (=> b!1546080 (= lt!666475 (getCurrentListMapNoExtraKeys!6539 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58657 () Bool)

(declare-fun tp!111331 () Bool)

(assert (=> mapNonEmpty!58657 (= mapRes!58657 (and tp!111331 e!860579))))

(declare-fun mapValue!58657 () ValueCell!18074)

(declare-fun mapRest!58657 () (Array (_ BitVec 32) ValueCell!18074))

(declare-fun mapKey!58657 () (_ BitVec 32))

(assert (=> mapNonEmpty!58657 (= (arr!49775 _values!470) (store mapRest!58657 mapKey!58657 mapValue!58657))))

(declare-fun b!1546081 () Bool)

(declare-fun c!141748 () Bool)

(assert (=> b!1546081 (= c!141748 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666476))))

(declare-fun e!860582 () ListLongMap!22115)

(assert (=> b!1546081 (= e!860578 e!860582)))

(declare-fun b!1546082 () Bool)

(declare-fun res!1060086 () Bool)

(assert (=> b!1546082 (=> (not res!1060086) (not e!860584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103144 (_ BitVec 32)) Bool)

(assert (=> b!1546082 (= res!1060086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546083 () Bool)

(declare-fun call!69425 () ListLongMap!22115)

(assert (=> b!1546083 (= e!860582 call!69425)))

(declare-fun res!1060089 () Bool)

(assert (=> start!131980 (=> (not res!1060089) (not e!860584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131980 (= res!1060089 (validMask!0 mask!926))))

(assert (=> start!131980 e!860584))

(declare-fun array_inv!38713 (array!103144) Bool)

(assert (=> start!131980 (array_inv!38713 _keys!618)))

(assert (=> start!131980 tp_is_empty!37969))

(assert (=> start!131980 true))

(assert (=> start!131980 tp!111330))

(declare-fun e!860580 () Bool)

(declare-fun array_inv!38714 (array!103146) Bool)

(assert (=> start!131980 (and (array_inv!38714 _values!470) e!860580)))

(declare-fun bm!69423 () Bool)

(assert (=> bm!69423 (= call!69428 call!69426)))

(declare-fun b!1546084 () Bool)

(assert (=> b!1546084 (= e!860580 (and e!860586 mapRes!58657))))

(declare-fun condMapEmpty!58657 () Bool)

(declare-fun mapDefault!58657 () ValueCell!18074)

