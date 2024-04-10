; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99590 () Bool)

(assert start!99590)

(declare-fun b_free!25169 () Bool)

(declare-fun b_next!25169 () Bool)

(assert (=> start!99590 (= b_free!25169 (not b_next!25169))))

(declare-fun tp!88221 () Bool)

(declare-fun b_and!41205 () Bool)

(assert (=> start!99590 (= tp!88221 b_and!41205)))

(declare-fun b!1179335 () Bool)

(declare-fun res!783514 () Bool)

(declare-fun e!670475 () Bool)

(assert (=> b!1179335 (=> (not res!783514) (not e!670475))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179335 (= res!783514 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!46376 () Bool)

(declare-fun mapRes!46376 () Bool)

(declare-fun tp!88220 () Bool)

(declare-fun e!670480 () Bool)

(assert (=> mapNonEmpty!46376 (= mapRes!46376 (and tp!88220 e!670480))))

(declare-datatypes ((V!44725 0))(
  ( (V!44726 (val!14906 Int)) )
))
(declare-datatypes ((ValueCell!14140 0))(
  ( (ValueCellFull!14140 (v!17544 V!44725)) (EmptyCell!14140) )
))
(declare-fun mapRest!46376 () (Array (_ BitVec 32) ValueCell!14140))

(declare-fun mapValue!46376 () ValueCell!14140)

(declare-fun mapKey!46376 () (_ BitVec 32))

(declare-datatypes ((array!76201 0))(
  ( (array!76202 (arr!36750 (Array (_ BitVec 32) ValueCell!14140)) (size!37286 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76201)

(assert (=> mapNonEmpty!46376 (= (arr!36750 _values!996) (store mapRest!46376 mapKey!46376 mapValue!46376))))

(declare-fun b!1179336 () Bool)

(declare-fun e!670471 () Bool)

(declare-fun e!670473 () Bool)

(assert (=> b!1179336 (= e!670471 e!670473)))

(declare-fun res!783520 () Bool)

(assert (=> b!1179336 (=> res!783520 e!670473)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179336 (= res!783520 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44725)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!532978 () array!76201)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44725)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!76203 0))(
  ( (array!76204 (arr!36751 (Array (_ BitVec 32) (_ BitVec 64))) (size!37287 (_ BitVec 32))) )
))
(declare-fun lt!532977 () array!76203)

(declare-datatypes ((tuple2!19080 0))(
  ( (tuple2!19081 (_1!9551 (_ BitVec 64)) (_2!9551 V!44725)) )
))
(declare-datatypes ((List!25817 0))(
  ( (Nil!25814) (Cons!25813 (h!27022 tuple2!19080) (t!37978 List!25817)) )
))
(declare-datatypes ((ListLongMap!17049 0))(
  ( (ListLongMap!17050 (toList!8540 List!25817)) )
))
(declare-fun lt!532974 () ListLongMap!17049)

(declare-fun getCurrentListMapNoExtraKeys!4995 (array!76203 array!76201 (_ BitVec 32) (_ BitVec 32) V!44725 V!44725 (_ BitVec 32) Int) ListLongMap!17049)

(assert (=> b!1179336 (= lt!532974 (getCurrentListMapNoExtraKeys!4995 lt!532977 lt!532978 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532979 () V!44725)

(assert (=> b!1179336 (= lt!532978 (array!76202 (store (arr!36750 _values!996) i!673 (ValueCellFull!14140 lt!532979)) (size!37286 _values!996)))))

(declare-fun dynLambda!2955 (Int (_ BitVec 64)) V!44725)

(assert (=> b!1179336 (= lt!532979 (dynLambda!2955 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532975 () ListLongMap!17049)

(declare-fun _keys!1208 () array!76203)

(assert (=> b!1179336 (= lt!532975 (getCurrentListMapNoExtraKeys!4995 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46376 () Bool)

(assert (=> mapIsEmpty!46376 mapRes!46376))

(declare-fun b!1179337 () Bool)

(declare-fun e!670481 () Bool)

(declare-fun e!670479 () Bool)

(assert (=> b!1179337 (= e!670481 e!670479)))

(declare-fun res!783524 () Bool)

(assert (=> b!1179337 (=> res!783524 e!670479)))

(assert (=> b!1179337 (= res!783524 (not (= (select (arr!36751 _keys!1208) from!1455) k!934)))))

(declare-fun res!783526 () Bool)

(assert (=> start!99590 (=> (not res!783526) (not e!670475))))

(assert (=> start!99590 (= res!783526 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37287 _keys!1208))))))

(assert (=> start!99590 e!670475))

(declare-fun tp_is_empty!29699 () Bool)

(assert (=> start!99590 tp_is_empty!29699))

(declare-fun array_inv!28060 (array!76203) Bool)

(assert (=> start!99590 (array_inv!28060 _keys!1208)))

(assert (=> start!99590 true))

(assert (=> start!99590 tp!88221))

(declare-fun e!670482 () Bool)

(declare-fun array_inv!28061 (array!76201) Bool)

(assert (=> start!99590 (and (array_inv!28061 _values!996) e!670482)))

(declare-fun b!1179338 () Bool)

(declare-fun res!783529 () Bool)

(assert (=> b!1179338 (=> (not res!783529) (not e!670475))))

(declare-datatypes ((List!25818 0))(
  ( (Nil!25815) (Cons!25814 (h!27023 (_ BitVec 64)) (t!37979 List!25818)) )
))
(declare-fun arrayNoDuplicates!0 (array!76203 (_ BitVec 32) List!25818) Bool)

(assert (=> b!1179338 (= res!783529 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25815))))

(declare-fun b!1179339 () Bool)

(declare-fun res!783523 () Bool)

(assert (=> b!1179339 (=> (not res!783523) (not e!670475))))

(assert (=> b!1179339 (= res!783523 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37287 _keys!1208))))))

(declare-fun b!1179340 () Bool)

(declare-fun e!670477 () Bool)

(assert (=> b!1179340 (= e!670482 (and e!670477 mapRes!46376))))

(declare-fun condMapEmpty!46376 () Bool)

(declare-fun mapDefault!46376 () ValueCell!14140)

