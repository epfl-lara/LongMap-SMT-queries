; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98610 () Bool)

(assert start!98610)

(declare-fun b_free!24215 () Bool)

(declare-fun b_next!24215 () Bool)

(assert (=> start!98610 (= b_free!24215 (not b_next!24215))))

(declare-fun tp!85355 () Bool)

(declare-fun b_and!39279 () Bool)

(assert (=> start!98610 (= tp!85355 b_and!39279)))

(declare-fun b!1144902 () Bool)

(declare-fun res!762513 () Bool)

(declare-fun e!651275 () Bool)

(assert (=> b!1144902 (=> (not res!762513) (not e!651275))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74341 0))(
  ( (array!74342 (arr!35821 (Array (_ BitVec 32) (_ BitVec 64))) (size!36357 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74341)

(assert (=> b!1144902 (= res!762513 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36357 _keys!1208))))))

(declare-fun res!762514 () Bool)

(assert (=> start!98610 (=> (not res!762514) (not e!651275))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98610 (= res!762514 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36357 _keys!1208))))))

(assert (=> start!98610 e!651275))

(declare-fun tp_is_empty!28745 () Bool)

(assert (=> start!98610 tp_is_empty!28745))

(declare-fun array_inv!27444 (array!74341) Bool)

(assert (=> start!98610 (array_inv!27444 _keys!1208)))

(assert (=> start!98610 true))

(assert (=> start!98610 tp!85355))

(declare-datatypes ((V!43453 0))(
  ( (V!43454 (val!14429 Int)) )
))
(declare-datatypes ((ValueCell!13663 0))(
  ( (ValueCellFull!13663 (v!17066 V!43453)) (EmptyCell!13663) )
))
(declare-datatypes ((array!74343 0))(
  ( (array!74344 (arr!35822 (Array (_ BitVec 32) ValueCell!13663)) (size!36358 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74343)

(declare-fun e!651267 () Bool)

(declare-fun array_inv!27445 (array!74343) Bool)

(assert (=> start!98610 (and (array_inv!27445 _values!996) e!651267)))

(declare-fun bm!52119 () Bool)

(declare-fun c!112795 () Bool)

(declare-fun call!52122 () Bool)

(declare-datatypes ((tuple2!18272 0))(
  ( (tuple2!18273 (_1!9147 (_ BitVec 64)) (_2!9147 V!43453)) )
))
(declare-datatypes ((List!25026 0))(
  ( (Nil!25023) (Cons!25022 (h!26231 tuple2!18272) (t!36233 List!25026)) )
))
(declare-datatypes ((ListLongMap!16241 0))(
  ( (ListLongMap!16242 (toList!8136 List!25026)) )
))
(declare-fun lt!510983 () ListLongMap!16241)

(declare-fun call!52123 () ListLongMap!16241)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6665 (ListLongMap!16241 (_ BitVec 64)) Bool)

(assert (=> bm!52119 (= call!52122 (contains!6665 (ite c!112795 lt!510983 call!52123) k!934))))

(declare-fun b!1144903 () Bool)

(declare-datatypes ((Unit!37582 0))(
  ( (Unit!37583) )
))
(declare-fun e!651266 () Unit!37582)

(declare-fun lt!510964 () Unit!37582)

(assert (=> b!1144903 (= e!651266 lt!510964)))

(declare-fun call!52128 () Unit!37582)

(assert (=> b!1144903 (= lt!510964 call!52128)))

(declare-fun call!52124 () Bool)

(assert (=> b!1144903 call!52124))

(declare-fun b!1144904 () Bool)

(declare-fun e!651271 () Bool)

(declare-fun mapRes!44942 () Bool)

(assert (=> b!1144904 (= e!651267 (and e!651271 mapRes!44942))))

(declare-fun condMapEmpty!44942 () Bool)

(declare-fun mapDefault!44942 () ValueCell!13663)

