; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99210 () Bool)

(assert start!99210)

(declare-fun b_free!24815 () Bool)

(declare-fun b_next!24815 () Bool)

(assert (=> start!99210 (= b_free!24815 (not b_next!24815))))

(declare-fun tp!87155 () Bool)

(declare-fun b_and!40479 () Bool)

(assert (=> start!99210 (= tp!87155 b_and!40479)))

(declare-fun mapIsEmpty!45842 () Bool)

(declare-fun mapRes!45842 () Bool)

(assert (=> mapIsEmpty!45842 mapRes!45842))

(declare-fun b!1168206 () Bool)

(declare-fun e!663944 () Bool)

(declare-fun e!663943 () Bool)

(assert (=> b!1168206 (= e!663944 e!663943)))

(declare-fun res!775051 () Bool)

(assert (=> b!1168206 (=> res!775051 e!663943)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168206 (= res!775051 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44253 0))(
  ( (V!44254 (val!14729 Int)) )
))
(declare-fun zeroValue!944 () V!44253)

(declare-datatypes ((array!75511 0))(
  ( (array!75512 (arr!36406 (Array (_ BitVec 32) (_ BitVec 64))) (size!36942 (_ BitVec 32))) )
))
(declare-fun lt!525933 () array!75511)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13963 0))(
  ( (ValueCellFull!13963 (v!17366 V!44253)) (EmptyCell!13963) )
))
(declare-datatypes ((array!75513 0))(
  ( (array!75514 (arr!36407 (Array (_ BitVec 32) ValueCell!13963)) (size!36943 (_ BitVec 32))) )
))
(declare-fun lt!525930 () array!75513)

(declare-fun minValue!944 () V!44253)

(declare-datatypes ((tuple2!18794 0))(
  ( (tuple2!18795 (_1!9408 (_ BitVec 64)) (_2!9408 V!44253)) )
))
(declare-datatypes ((List!25534 0))(
  ( (Nil!25531) (Cons!25530 (h!26739 tuple2!18794) (t!37341 List!25534)) )
))
(declare-datatypes ((ListLongMap!16763 0))(
  ( (ListLongMap!16764 (toList!8397 List!25534)) )
))
(declare-fun lt!525931 () ListLongMap!16763)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4861 (array!75511 array!75513 (_ BitVec 32) (_ BitVec 32) V!44253 V!44253 (_ BitVec 32) Int) ListLongMap!16763)

(assert (=> b!1168206 (= lt!525931 (getCurrentListMapNoExtraKeys!4861 lt!525933 lt!525930 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75513)

(declare-fun dynLambda!2842 (Int (_ BitVec 64)) V!44253)

(assert (=> b!1168206 (= lt!525930 (array!75514 (store (arr!36407 _values!996) i!673 (ValueCellFull!13963 (dynLambda!2842 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36943 _values!996)))))

(declare-fun _keys!1208 () array!75511)

(declare-fun lt!525928 () ListLongMap!16763)

(assert (=> b!1168206 (= lt!525928 (getCurrentListMapNoExtraKeys!4861 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168208 () Bool)

(declare-fun res!775054 () Bool)

(declare-fun e!663939 () Bool)

(assert (=> b!1168208 (=> (not res!775054) (not e!663939))))

(assert (=> b!1168208 (= res!775054 (and (= (size!36943 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36942 _keys!1208) (size!36943 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168209 () Bool)

(declare-fun e!663938 () Bool)

(declare-fun tp_is_empty!29345 () Bool)

(assert (=> b!1168209 (= e!663938 tp_is_empty!29345)))

(declare-fun b!1168210 () Bool)

(declare-fun res!775052 () Bool)

(assert (=> b!1168210 (=> (not res!775052) (not e!663939))))

(assert (=> b!1168210 (= res!775052 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36942 _keys!1208))))))

(declare-fun b!1168211 () Bool)

(declare-fun e!663941 () Bool)

(assert (=> b!1168211 (= e!663939 e!663941)))

(declare-fun res!775050 () Bool)

(assert (=> b!1168211 (=> (not res!775050) (not e!663941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75511 (_ BitVec 32)) Bool)

(assert (=> b!1168211 (= res!775050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525933 mask!1564))))

(assert (=> b!1168211 (= lt!525933 (array!75512 (store (arr!36406 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36942 _keys!1208)))))

(declare-fun b!1168212 () Bool)

(declare-fun res!775055 () Bool)

(assert (=> b!1168212 (=> (not res!775055) (not e!663941))))

(declare-datatypes ((List!25535 0))(
  ( (Nil!25532) (Cons!25531 (h!26740 (_ BitVec 64)) (t!37342 List!25535)) )
))
(declare-fun arrayNoDuplicates!0 (array!75511 (_ BitVec 32) List!25535) Bool)

(assert (=> b!1168212 (= res!775055 (arrayNoDuplicates!0 lt!525933 #b00000000000000000000000000000000 Nil!25532))))

(declare-fun b!1168213 () Bool)

(declare-fun res!775048 () Bool)

(assert (=> b!1168213 (=> (not res!775048) (not e!663939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168213 (= res!775048 (validMask!0 mask!1564))))

(declare-fun b!1168214 () Bool)

(declare-fun e!663942 () Bool)

(assert (=> b!1168214 (= e!663942 tp_is_empty!29345)))

(declare-fun b!1168215 () Bool)

(declare-fun res!775053 () Bool)

(assert (=> b!1168215 (=> (not res!775053) (not e!663939))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168215 (= res!775053 (validKeyInArray!0 k!934))))

(declare-fun b!1168216 () Bool)

(assert (=> b!1168216 (= e!663941 (not e!663944))))

(declare-fun res!775044 () Bool)

(assert (=> b!1168216 (=> res!775044 e!663944)))

(assert (=> b!1168216 (= res!775044 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168216 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38546 0))(
  ( (Unit!38547) )
))
(declare-fun lt!525929 () Unit!38546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75511 (_ BitVec 64) (_ BitVec 32)) Unit!38546)

(assert (=> b!1168216 (= lt!525929 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1168217 () Bool)

(declare-fun res!775046 () Bool)

(assert (=> b!1168217 (=> (not res!775046) (not e!663939))))

(assert (=> b!1168217 (= res!775046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168207 () Bool)

(declare-fun res!775045 () Bool)

(assert (=> b!1168207 (=> (not res!775045) (not e!663939))))

(assert (=> b!1168207 (= res!775045 (= (select (arr!36406 _keys!1208) i!673) k!934))))

(declare-fun res!775049 () Bool)

(assert (=> start!99210 (=> (not res!775049) (not e!663939))))

(assert (=> start!99210 (= res!775049 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36942 _keys!1208))))))

(assert (=> start!99210 e!663939))

(assert (=> start!99210 tp_is_empty!29345))

(declare-fun array_inv!27830 (array!75511) Bool)

(assert (=> start!99210 (array_inv!27830 _keys!1208)))

(assert (=> start!99210 true))

(assert (=> start!99210 tp!87155))

(declare-fun e!663940 () Bool)

(declare-fun array_inv!27831 (array!75513) Bool)

(assert (=> start!99210 (and (array_inv!27831 _values!996) e!663940)))

(declare-fun b!1168218 () Bool)

(declare-fun res!775047 () Bool)

(assert (=> b!1168218 (=> (not res!775047) (not e!663939))))

(assert (=> b!1168218 (= res!775047 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25532))))

(declare-fun b!1168219 () Bool)

(assert (=> b!1168219 (= e!663940 (and e!663942 mapRes!45842))))

(declare-fun condMapEmpty!45842 () Bool)

(declare-fun mapDefault!45842 () ValueCell!13963)

