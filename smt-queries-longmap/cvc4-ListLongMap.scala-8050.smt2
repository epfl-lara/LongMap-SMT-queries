; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99144 () Bool)

(assert start!99144)

(declare-fun b_free!24749 () Bool)

(declare-fun b_next!24749 () Bool)

(assert (=> start!99144 (= b_free!24749 (not b_next!24749))))

(declare-fun tp!86958 () Bool)

(declare-fun b_and!40347 () Bool)

(assert (=> start!99144 (= tp!86958 b_and!40347)))

(declare-fun b!1166655 () Bool)

(declare-fun res!773862 () Bool)

(declare-fun e!663146 () Bool)

(assert (=> b!1166655 (=> (not res!773862) (not e!663146))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75389 0))(
  ( (array!75390 (arr!36345 (Array (_ BitVec 32) (_ BitVec 64))) (size!36881 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75389)

(assert (=> b!1166655 (= res!773862 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36881 _keys!1208))))))

(declare-fun b!1166656 () Bool)

(declare-fun e!663153 () Bool)

(declare-fun e!663152 () Bool)

(assert (=> b!1166656 (= e!663153 (not e!663152))))

(declare-fun res!773864 () Bool)

(assert (=> b!1166656 (=> res!773864 e!663152)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1166656 (= res!773864 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166656 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38496 0))(
  ( (Unit!38497) )
))
(declare-fun lt!525339 () Unit!38496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75389 (_ BitVec 64) (_ BitVec 32)) Unit!38496)

(assert (=> b!1166656 (= lt!525339 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1166657 () Bool)

(declare-fun e!663148 () Bool)

(declare-fun tp_is_empty!29279 () Bool)

(assert (=> b!1166657 (= e!663148 tp_is_empty!29279)))

(declare-fun b!1166658 () Bool)

(declare-fun e!663149 () Bool)

(assert (=> b!1166658 (= e!663149 tp_is_empty!29279)))

(declare-fun b!1166659 () Bool)

(declare-fun res!773863 () Bool)

(assert (=> b!1166659 (=> (not res!773863) (not e!663146))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44165 0))(
  ( (V!44166 (val!14696 Int)) )
))
(declare-datatypes ((ValueCell!13930 0))(
  ( (ValueCellFull!13930 (v!17333 V!44165)) (EmptyCell!13930) )
))
(declare-datatypes ((array!75391 0))(
  ( (array!75392 (arr!36346 (Array (_ BitVec 32) ValueCell!13930)) (size!36882 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75391)

(assert (=> b!1166659 (= res!773863 (and (= (size!36882 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36881 _keys!1208) (size!36882 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166660 () Bool)

(declare-fun e!663147 () Bool)

(assert (=> b!1166660 (= e!663152 e!663147)))

(declare-fun res!773861 () Bool)

(assert (=> b!1166660 (=> res!773861 e!663147)))

(assert (=> b!1166660 (= res!773861 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44165)

(declare-datatypes ((tuple2!18742 0))(
  ( (tuple2!18743 (_1!9382 (_ BitVec 64)) (_2!9382 V!44165)) )
))
(declare-datatypes ((List!25483 0))(
  ( (Nil!25480) (Cons!25479 (h!26688 tuple2!18742) (t!37224 List!25483)) )
))
(declare-datatypes ((ListLongMap!16711 0))(
  ( (ListLongMap!16712 (toList!8371 List!25483)) )
))
(declare-fun lt!525334 () ListLongMap!16711)

(declare-fun lt!525336 () array!75391)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44165)

(declare-fun lt!525335 () array!75389)

(declare-fun getCurrentListMapNoExtraKeys!4835 (array!75389 array!75391 (_ BitVec 32) (_ BitVec 32) V!44165 V!44165 (_ BitVec 32) Int) ListLongMap!16711)

(assert (=> b!1166660 (= lt!525334 (getCurrentListMapNoExtraKeys!4835 lt!525335 lt!525336 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2824 (Int (_ BitVec 64)) V!44165)

(assert (=> b!1166660 (= lt!525336 (array!75392 (store (arr!36346 _values!996) i!673 (ValueCellFull!13930 (dynLambda!2824 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36882 _values!996)))))

(declare-fun lt!525338 () ListLongMap!16711)

(assert (=> b!1166660 (= lt!525338 (getCurrentListMapNoExtraKeys!4835 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166661 () Bool)

(assert (=> b!1166661 (= e!663146 e!663153)))

(declare-fun res!773858 () Bool)

(assert (=> b!1166661 (=> (not res!773858) (not e!663153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75389 (_ BitVec 32)) Bool)

(assert (=> b!1166661 (= res!773858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525335 mask!1564))))

(assert (=> b!1166661 (= lt!525335 (array!75390 (store (arr!36345 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36881 _keys!1208)))))

(declare-fun b!1166662 () Bool)

(declare-fun res!773859 () Bool)

(assert (=> b!1166662 (=> (not res!773859) (not e!663146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166662 (= res!773859 (validKeyInArray!0 k!934))))

(declare-fun b!1166664 () Bool)

(declare-fun res!773860 () Bool)

(assert (=> b!1166664 (=> (not res!773860) (not e!663146))))

(assert (=> b!1166664 (= res!773860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166665 () Bool)

(declare-fun res!773867 () Bool)

(assert (=> b!1166665 (=> (not res!773867) (not e!663146))))

(assert (=> b!1166665 (= res!773867 (= (select (arr!36345 _keys!1208) i!673) k!934))))

(declare-fun b!1166666 () Bool)

(declare-fun res!773856 () Bool)

(assert (=> b!1166666 (=> (not res!773856) (not e!663146))))

(declare-datatypes ((List!25484 0))(
  ( (Nil!25481) (Cons!25480 (h!26689 (_ BitVec 64)) (t!37225 List!25484)) )
))
(declare-fun arrayNoDuplicates!0 (array!75389 (_ BitVec 32) List!25484) Bool)

(assert (=> b!1166666 (= res!773856 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25481))))

(declare-fun mapIsEmpty!45743 () Bool)

(declare-fun mapRes!45743 () Bool)

(assert (=> mapIsEmpty!45743 mapRes!45743))

(declare-fun b!1166667 () Bool)

(declare-fun res!773866 () Bool)

(assert (=> b!1166667 (=> (not res!773866) (not e!663146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166667 (= res!773866 (validMask!0 mask!1564))))

(declare-fun b!1166668 () Bool)

(declare-fun e!663150 () Bool)

(assert (=> b!1166668 (= e!663150 (and e!663148 mapRes!45743))))

(declare-fun condMapEmpty!45743 () Bool)

(declare-fun mapDefault!45743 () ValueCell!13930)

