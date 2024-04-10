; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99084 () Bool)

(assert start!99084)

(declare-fun b_free!24689 () Bool)

(declare-fun b_next!24689 () Bool)

(assert (=> start!99084 (= b_free!24689 (not b_next!24689))))

(declare-fun tp!86778 () Bool)

(declare-fun b_and!40227 () Bool)

(assert (=> start!99084 (= tp!86778 b_and!40227)))

(declare-fun b!1165282 () Bool)

(declare-fun e!662464 () Bool)

(assert (=> b!1165282 (= e!662464 true)))

(declare-datatypes ((V!44085 0))(
  ( (V!44086 (val!14666 Int)) )
))
(declare-fun zeroValue!944 () V!44085)

(declare-datatypes ((tuple2!18704 0))(
  ( (tuple2!18705 (_1!9363 (_ BitVec 64)) (_2!9363 V!44085)) )
))
(declare-datatypes ((List!25439 0))(
  ( (Nil!25436) (Cons!25435 (h!26644 tuple2!18704) (t!37120 List!25439)) )
))
(declare-datatypes ((ListLongMap!16673 0))(
  ( (ListLongMap!16674 (toList!8352 List!25439)) )
))
(declare-fun lt!524869 () ListLongMap!16673)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13900 0))(
  ( (ValueCellFull!13900 (v!17303 V!44085)) (EmptyCell!13900) )
))
(declare-datatypes ((array!75269 0))(
  ( (array!75270 (arr!36285 (Array (_ BitVec 32) ValueCell!13900)) (size!36821 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75269)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!75271 0))(
  ( (array!75272 (arr!36286 (Array (_ BitVec 32) (_ BitVec 64))) (size!36822 (_ BitVec 32))) )
))
(declare-fun lt!524870 () array!75271)

(declare-fun minValue!944 () V!44085)

(declare-fun getCurrentListMapNoExtraKeys!4816 (array!75271 array!75269 (_ BitVec 32) (_ BitVec 32) V!44085 V!44085 (_ BitVec 32) Int) ListLongMap!16673)

(declare-fun dynLambda!2806 (Int (_ BitVec 64)) V!44085)

(assert (=> b!1165282 (= lt!524869 (getCurrentListMapNoExtraKeys!4816 lt!524870 (array!75270 (store (arr!36285 _values!996) i!673 (ValueCellFull!13900 (dynLambda!2806 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36821 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75271)

(declare-fun lt!524868 () ListLongMap!16673)

(assert (=> b!1165282 (= lt!524868 (getCurrentListMapNoExtraKeys!4816 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45653 () Bool)

(declare-fun mapRes!45653 () Bool)

(declare-fun tp!86777 () Bool)

(declare-fun e!662463 () Bool)

(assert (=> mapNonEmpty!45653 (= mapRes!45653 (and tp!86777 e!662463))))

(declare-fun mapKey!45653 () (_ BitVec 32))

(declare-fun mapValue!45653 () ValueCell!13900)

(declare-fun mapRest!45653 () (Array (_ BitVec 32) ValueCell!13900))

(assert (=> mapNonEmpty!45653 (= (arr!36285 _values!996) (store mapRest!45653 mapKey!45653 mapValue!45653))))

(declare-fun b!1165283 () Bool)

(declare-fun res!772813 () Bool)

(declare-fun e!662468 () Bool)

(assert (=> b!1165283 (=> (not res!772813) (not e!662468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75271 (_ BitVec 32)) Bool)

(assert (=> b!1165283 (= res!772813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165284 () Bool)

(declare-fun e!662466 () Bool)

(declare-fun e!662465 () Bool)

(assert (=> b!1165284 (= e!662466 (and e!662465 mapRes!45653))))

(declare-fun condMapEmpty!45653 () Bool)

(declare-fun mapDefault!45653 () ValueCell!13900)

