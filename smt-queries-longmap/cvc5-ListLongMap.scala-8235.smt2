; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100318 () Bool)

(assert start!100318)

(declare-fun b_free!25705 () Bool)

(declare-fun b_next!25705 () Bool)

(assert (=> start!100318 (= b_free!25705 (not b_next!25705))))

(declare-fun tp!90063 () Bool)

(declare-fun b_and!42277 () Bool)

(assert (=> start!100318 (= tp!90063 b_and!42277)))

(declare-fun mapIsEmpty!47414 () Bool)

(declare-fun mapRes!47414 () Bool)

(assert (=> mapIsEmpty!47414 mapRes!47414))

(declare-fun b!1197213 () Bool)

(declare-fun res!796760 () Bool)

(declare-fun e!680141 () Bool)

(assert (=> b!1197213 (=> (not res!796760) (not e!680141))))

(declare-datatypes ((array!77549 0))(
  ( (array!77550 (arr!37421 (Array (_ BitVec 32) (_ BitVec 64))) (size!37957 (_ BitVec 32))) )
))
(declare-fun lt!543218 () array!77549)

(declare-datatypes ((List!26329 0))(
  ( (Nil!26326) (Cons!26325 (h!27534 (_ BitVec 64)) (t!39026 List!26329)) )
))
(declare-fun arrayNoDuplicates!0 (array!77549 (_ BitVec 32) List!26329) Bool)

(assert (=> b!1197213 (= res!796760 (arrayNoDuplicates!0 lt!543218 #b00000000000000000000000000000000 Nil!26326))))

(declare-fun b!1197214 () Bool)

(declare-fun e!680137 () Bool)

(declare-datatypes ((V!45641 0))(
  ( (V!45642 (val!15249 Int)) )
))
(declare-datatypes ((tuple2!19520 0))(
  ( (tuple2!19521 (_1!9771 (_ BitVec 64)) (_2!9771 V!45641)) )
))
(declare-datatypes ((List!26330 0))(
  ( (Nil!26327) (Cons!26326 (h!27535 tuple2!19520) (t!39027 List!26330)) )
))
(declare-datatypes ((ListLongMap!17489 0))(
  ( (ListLongMap!17490 (toList!8760 List!26330)) )
))
(declare-fun call!57237 () ListLongMap!17489)

(declare-fun call!57236 () ListLongMap!17489)

(assert (=> b!1197214 (= e!680137 (= call!57237 call!57236))))

(declare-fun zeroValue!944 () V!45641)

(declare-fun _keys!1208 () array!77549)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!57233 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14483 0))(
  ( (ValueCellFull!14483 (v!17887 V!45641)) (EmptyCell!14483) )
))
(declare-datatypes ((array!77551 0))(
  ( (array!77552 (arr!37422 (Array (_ BitVec 32) ValueCell!14483)) (size!37958 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77551)

(declare-fun minValue!944 () V!45641)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5200 (array!77549 array!77551 (_ BitVec 32) (_ BitVec 32) V!45641 V!45641 (_ BitVec 32) Int) ListLongMap!17489)

(assert (=> bm!57233 (= call!57236 (getCurrentListMapNoExtraKeys!5200 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1197215 () Bool)

(declare-fun -!1778 (ListLongMap!17489 (_ BitVec 64)) ListLongMap!17489)

(assert (=> b!1197215 (= e!680137 (= call!57237 (-!1778 call!57236 k!934)))))

(declare-fun b!1197216 () Bool)

(declare-fun res!796762 () Bool)

(declare-fun e!680136 () Bool)

(assert (=> b!1197216 (=> (not res!796762) (not e!680136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197216 (= res!796762 (validMask!0 mask!1564))))

(declare-fun res!796759 () Bool)

(assert (=> start!100318 (=> (not res!796759) (not e!680136))))

(assert (=> start!100318 (= res!796759 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37957 _keys!1208))))))

(assert (=> start!100318 e!680136))

(declare-fun tp_is_empty!30385 () Bool)

(assert (=> start!100318 tp_is_empty!30385))

(declare-fun array_inv!28520 (array!77549) Bool)

(assert (=> start!100318 (array_inv!28520 _keys!1208)))

(assert (=> start!100318 true))

(assert (=> start!100318 tp!90063))

(declare-fun e!680138 () Bool)

(declare-fun array_inv!28521 (array!77551) Bool)

(assert (=> start!100318 (and (array_inv!28521 _values!996) e!680138)))

(declare-fun b!1197217 () Bool)

(declare-fun e!680142 () Bool)

(assert (=> b!1197217 (= e!680138 (and e!680142 mapRes!47414))))

(declare-fun condMapEmpty!47414 () Bool)

(declare-fun mapDefault!47414 () ValueCell!14483)

