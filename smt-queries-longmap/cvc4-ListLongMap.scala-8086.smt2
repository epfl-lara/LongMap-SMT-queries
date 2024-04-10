; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99386 () Bool)

(assert start!99386)

(declare-fun b_free!24965 () Bool)

(declare-fun b_next!24965 () Bool)

(assert (=> start!99386 (= b_free!24965 (not b_next!24965))))

(declare-fun tp!87608 () Bool)

(declare-fun b_and!40797 () Bool)

(assert (=> start!99386 (= tp!87608 b_and!40797)))

(declare-fun res!778778 () Bool)

(declare-fun e!666651 () Bool)

(assert (=> start!99386 (=> (not res!778778) (not e!666651))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75803 0))(
  ( (array!75804 (arr!36551 (Array (_ BitVec 32) (_ BitVec 64))) (size!37087 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75803)

(assert (=> start!99386 (= res!778778 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37087 _keys!1208))))))

(assert (=> start!99386 e!666651))

(declare-fun tp_is_empty!29495 () Bool)

(assert (=> start!99386 tp_is_empty!29495))

(declare-fun array_inv!27928 (array!75803) Bool)

(assert (=> start!99386 (array_inv!27928 _keys!1208)))

(assert (=> start!99386 true))

(assert (=> start!99386 tp!87608))

(declare-datatypes ((V!44453 0))(
  ( (V!44454 (val!14804 Int)) )
))
(declare-datatypes ((ValueCell!14038 0))(
  ( (ValueCellFull!14038 (v!17442 V!44453)) (EmptyCell!14038) )
))
(declare-datatypes ((array!75805 0))(
  ( (array!75806 (arr!36552 (Array (_ BitVec 32) ValueCell!14038)) (size!37088 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75805)

(declare-fun e!666650 () Bool)

(declare-fun array_inv!27929 (array!75805) Bool)

(assert (=> start!99386 (and (array_inv!27929 _values!996) e!666650)))

(declare-fun b!1172859 () Bool)

(declare-datatypes ((Unit!38675 0))(
  ( (Unit!38676) )
))
(declare-fun e!666653 () Unit!38675)

(declare-fun Unit!38677 () Unit!38675)

(assert (=> b!1172859 (= e!666653 Unit!38677)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!528543 () Unit!38675)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75803 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38675)

(assert (=> b!1172859 (= lt!528543 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172859 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528546 () Unit!38675)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75803 (_ BitVec 32) (_ BitVec 32)) Unit!38675)

(assert (=> b!1172859 (= lt!528546 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25655 0))(
  ( (Nil!25652) (Cons!25651 (h!26860 (_ BitVec 64)) (t!37612 List!25655)) )
))
(declare-fun arrayNoDuplicates!0 (array!75803 (_ BitVec 32) List!25655) Bool)

(assert (=> b!1172859 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25652)))

(declare-fun lt!528545 () Unit!38675)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75803 (_ BitVec 64) (_ BitVec 32) List!25655) Unit!38675)

(assert (=> b!1172859 (= lt!528545 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25652))))

(assert (=> b!1172859 false))

(declare-fun b!1172860 () Bool)

(declare-fun e!666649 () Bool)

(assert (=> b!1172860 (= e!666649 tp_is_empty!29495)))

(declare-fun b!1172861 () Bool)

(declare-fun res!778777 () Bool)

(declare-fun e!666647 () Bool)

(assert (=> b!1172861 (=> (not res!778777) (not e!666647))))

(declare-fun lt!528544 () array!75803)

(assert (=> b!1172861 (= res!778777 (arrayNoDuplicates!0 lt!528544 #b00000000000000000000000000000000 Nil!25652))))

(declare-fun b!1172862 () Bool)

(assert (=> b!1172862 (= e!666651 e!666647)))

(declare-fun res!778772 () Bool)

(assert (=> b!1172862 (=> (not res!778772) (not e!666647))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75803 (_ BitVec 32)) Bool)

(assert (=> b!1172862 (= res!778772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528544 mask!1564))))

(assert (=> b!1172862 (= lt!528544 (array!75804 (store (arr!36551 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37087 _keys!1208)))))

(declare-fun mapNonEmpty!46070 () Bool)

(declare-fun mapRes!46070 () Bool)

(declare-fun tp!87609 () Bool)

(assert (=> mapNonEmpty!46070 (= mapRes!46070 (and tp!87609 e!666649))))

(declare-fun mapRest!46070 () (Array (_ BitVec 32) ValueCell!14038))

(declare-fun mapKey!46070 () (_ BitVec 32))

(declare-fun mapValue!46070 () ValueCell!14038)

(assert (=> mapNonEmpty!46070 (= (arr!36552 _values!996) (store mapRest!46070 mapKey!46070 mapValue!46070))))

(declare-fun b!1172863 () Bool)

(declare-fun e!666654 () Bool)

(assert (=> b!1172863 (= e!666650 (and e!666654 mapRes!46070))))

(declare-fun condMapEmpty!46070 () Bool)

(declare-fun mapDefault!46070 () ValueCell!14038)

