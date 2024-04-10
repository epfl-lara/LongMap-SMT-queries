; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98010 () Bool)

(assert start!98010)

(declare-fun b_free!23711 () Bool)

(declare-fun b_next!23711 () Bool)

(assert (=> start!98010 (= b_free!23711 (not b_next!23711))))

(declare-fun tp!83836 () Bool)

(declare-fun b_and!38205 () Bool)

(assert (=> start!98010 (= tp!83836 b_and!38205)))

(declare-fun b!1124388 () Bool)

(declare-fun res!751256 () Bool)

(declare-fun e!640076 () Bool)

(assert (=> b!1124388 (=> (not res!751256) (not e!640076))))

(declare-datatypes ((array!73349 0))(
  ( (array!73350 (arr!35327 (Array (_ BitVec 32) (_ BitVec 64))) (size!35863 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73349)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1124388 (= res!751256 (= (select (arr!35327 _keys!1208) i!673) k!934))))

(declare-fun b!1124389 () Bool)

(declare-fun res!751262 () Bool)

(assert (=> b!1124389 (=> (not res!751262) (not e!640076))))

(declare-datatypes ((List!24587 0))(
  ( (Nil!24584) (Cons!24583 (h!25792 (_ BitVec 64)) (t!35290 List!24587)) )
))
(declare-fun arrayNoDuplicates!0 (array!73349 (_ BitVec 32) List!24587) Bool)

(assert (=> b!1124389 (= res!751262 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24584))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!499443 () array!73349)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!42781 0))(
  ( (V!42782 (val!14177 Int)) )
))
(declare-fun minValue!944 () V!42781)

(declare-datatypes ((tuple2!17808 0))(
  ( (tuple2!17809 (_1!8915 (_ BitVec 64)) (_2!8915 V!42781)) )
))
(declare-datatypes ((List!24588 0))(
  ( (Nil!24585) (Cons!24584 (h!25793 tuple2!17808) (t!35291 List!24588)) )
))
(declare-datatypes ((ListLongMap!15777 0))(
  ( (ListLongMap!15778 (toList!7904 List!24588)) )
))
(declare-fun call!47416 () ListLongMap!15777)

(declare-fun bm!47412 () Bool)

(declare-fun zeroValue!944 () V!42781)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13411 0))(
  ( (ValueCellFull!13411 (v!16810 V!42781)) (EmptyCell!13411) )
))
(declare-datatypes ((array!73351 0))(
  ( (array!73352 (arr!35328 (Array (_ BitVec 32) ValueCell!13411)) (size!35864 (_ BitVec 32))) )
))
(declare-fun lt!499446 () array!73351)

(declare-fun getCurrentListMapNoExtraKeys!4392 (array!73349 array!73351 (_ BitVec 32) (_ BitVec 32) V!42781 V!42781 (_ BitVec 32) Int) ListLongMap!15777)

(assert (=> bm!47412 (= call!47416 (getCurrentListMapNoExtraKeys!4392 lt!499443 lt!499446 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124390 () Bool)

(declare-fun res!751267 () Bool)

(declare-fun e!640077 () Bool)

(assert (=> b!1124390 (=> (not res!751267) (not e!640077))))

(assert (=> b!1124390 (= res!751267 (arrayNoDuplicates!0 lt!499443 #b00000000000000000000000000000000 Nil!24584))))

(declare-fun b!1124391 () Bool)

(declare-fun e!640079 () Bool)

(assert (=> b!1124391 (= e!640079 true)))

(declare-fun lt!499447 () ListLongMap!15777)

(declare-fun contains!6442 (ListLongMap!15777 (_ BitVec 64)) Bool)

(declare-fun +!3413 (ListLongMap!15777 tuple2!17808) ListLongMap!15777)

(assert (=> b!1124391 (contains!6442 (+!3413 lt!499447 (tuple2!17809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-datatypes ((Unit!36860 0))(
  ( (Unit!36861) )
))
(declare-fun lt!499445 () Unit!36860)

(declare-fun addStillContains!675 (ListLongMap!15777 (_ BitVec 64) V!42781 (_ BitVec 64)) Unit!36860)

(assert (=> b!1124391 (= lt!499445 (addStillContains!675 lt!499447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun res!751270 () Bool)

(assert (=> start!98010 (=> (not res!751270) (not e!640076))))

(assert (=> start!98010 (= res!751270 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35863 _keys!1208))))))

(assert (=> start!98010 e!640076))

(declare-fun tp_is_empty!28241 () Bool)

(assert (=> start!98010 tp_is_empty!28241))

(declare-fun array_inv!27116 (array!73349) Bool)

(assert (=> start!98010 (array_inv!27116 _keys!1208)))

(assert (=> start!98010 true))

(assert (=> start!98010 tp!83836))

(declare-fun _values!996 () array!73351)

(declare-fun e!640080 () Bool)

(declare-fun array_inv!27117 (array!73351) Bool)

(assert (=> start!98010 (and (array_inv!27117 _values!996) e!640080)))

(declare-fun b!1124392 () Bool)

(declare-fun e!640075 () Bool)

(declare-fun call!47415 () ListLongMap!15777)

(declare-fun -!1108 (ListLongMap!15777 (_ BitVec 64)) ListLongMap!15777)

(assert (=> b!1124392 (= e!640075 (= call!47416 (-!1108 call!47415 k!934)))))

(declare-fun b!1124393 () Bool)

(declare-fun res!751269 () Bool)

(assert (=> b!1124393 (=> (not res!751269) (not e!640076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73349 (_ BitVec 32)) Bool)

(assert (=> b!1124393 (= res!751269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124394 () Bool)

(assert (=> b!1124394 (= e!640075 (= call!47416 call!47415))))

(declare-fun b!1124395 () Bool)

(declare-fun e!640083 () Bool)

(declare-fun mapRes!44179 () Bool)

(assert (=> b!1124395 (= e!640080 (and e!640083 mapRes!44179))))

(declare-fun condMapEmpty!44179 () Bool)

(declare-fun mapDefault!44179 () ValueCell!13411)

