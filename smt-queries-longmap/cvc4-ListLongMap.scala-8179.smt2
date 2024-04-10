; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99944 () Bool)

(assert start!99944)

(declare-fun b_free!25523 () Bool)

(declare-fun b_next!25523 () Bool)

(assert (=> start!99944 (= b_free!25523 (not b_next!25523))))

(declare-fun tp!89282 () Bool)

(declare-fun b_and!41913 () Bool)

(assert (=> start!99944 (= tp!89282 b_and!41913)))

(declare-fun b!1189964 () Bool)

(declare-fun res!791351 () Bool)

(declare-fun e!676516 () Bool)

(assert (=> b!1189964 (=> (not res!791351) (not e!676516))))

(declare-datatypes ((array!76897 0))(
  ( (array!76898 (arr!37098 (Array (_ BitVec 32) (_ BitVec 64))) (size!37634 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76897)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1189964 (= res!791351 (= (select (arr!37098 _keys!1208) i!673) k!934))))

(declare-fun b!1189965 () Bool)

(declare-fun res!791355 () Bool)

(assert (=> b!1189965 (=> (not res!791355) (not e!676516))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45197 0))(
  ( (V!45198 (val!15083 Int)) )
))
(declare-datatypes ((ValueCell!14317 0))(
  ( (ValueCellFull!14317 (v!17721 V!45197)) (EmptyCell!14317) )
))
(declare-datatypes ((array!76899 0))(
  ( (array!76900 (arr!37099 (Array (_ BitVec 32) ValueCell!14317)) (size!37635 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76899)

(assert (=> b!1189965 (= res!791355 (and (= (size!37635 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37634 _keys!1208) (size!37635 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189966 () Bool)

(declare-fun e!676519 () Bool)

(assert (=> b!1189966 (= e!676516 e!676519)))

(declare-fun res!791349 () Bool)

(assert (=> b!1189966 (=> (not res!791349) (not e!676519))))

(declare-fun lt!541272 () array!76897)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76897 (_ BitVec 32)) Bool)

(assert (=> b!1189966 (= res!791349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541272 mask!1564))))

(assert (=> b!1189966 (= lt!541272 (array!76898 (store (arr!37098 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37634 _keys!1208)))))

(declare-fun b!1189967 () Bool)

(declare-fun res!791359 () Bool)

(assert (=> b!1189967 (=> (not res!791359) (not e!676516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189967 (= res!791359 (validKeyInArray!0 k!934))))

(declare-fun b!1189968 () Bool)

(declare-fun res!791350 () Bool)

(assert (=> b!1189968 (=> (not res!791350) (not e!676516))))

(assert (=> b!1189968 (= res!791350 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37634 _keys!1208))))))

(declare-fun b!1189969 () Bool)

(declare-fun e!676517 () Bool)

(declare-fun e!676522 () Bool)

(assert (=> b!1189969 (= e!676517 e!676522)))

(declare-fun res!791348 () Bool)

(assert (=> b!1189969 (=> res!791348 e!676522)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1189969 (= res!791348 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45197)

(declare-fun lt!541271 () array!76899)

(declare-datatypes ((tuple2!19370 0))(
  ( (tuple2!19371 (_1!9696 (_ BitVec 64)) (_2!9696 V!45197)) )
))
(declare-datatypes ((List!26116 0))(
  ( (Nil!26113) (Cons!26112 (h!27321 tuple2!19370) (t!38631 List!26116)) )
))
(declare-datatypes ((ListLongMap!17339 0))(
  ( (ListLongMap!17340 (toList!8685 List!26116)) )
))
(declare-fun lt!541269 () ListLongMap!17339)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45197)

(declare-fun getCurrentListMapNoExtraKeys!5126 (array!76897 array!76899 (_ BitVec 32) (_ BitVec 32) V!45197 V!45197 (_ BitVec 32) Int) ListLongMap!17339)

(assert (=> b!1189969 (= lt!541269 (getCurrentListMapNoExtraKeys!5126 lt!541272 lt!541271 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3068 (Int (_ BitVec 64)) V!45197)

(assert (=> b!1189969 (= lt!541271 (array!76900 (store (arr!37099 _values!996) i!673 (ValueCellFull!14317 (dynLambda!3068 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37635 _values!996)))))

(declare-fun lt!541267 () ListLongMap!17339)

(assert (=> b!1189969 (= lt!541267 (getCurrentListMapNoExtraKeys!5126 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189970 () Bool)

(declare-fun res!791354 () Bool)

(assert (=> b!1189970 (=> (not res!791354) (not e!676516))))

(assert (=> b!1189970 (= res!791354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189972 () Bool)

(declare-fun res!791353 () Bool)

(assert (=> b!1189972 (=> (not res!791353) (not e!676519))))

(declare-datatypes ((List!26117 0))(
  ( (Nil!26114) (Cons!26113 (h!27322 (_ BitVec 64)) (t!38632 List!26117)) )
))
(declare-fun arrayNoDuplicates!0 (array!76897 (_ BitVec 32) List!26117) Bool)

(assert (=> b!1189972 (= res!791353 (arrayNoDuplicates!0 lt!541272 #b00000000000000000000000000000000 Nil!26114))))

(declare-fun b!1189973 () Bool)

(declare-fun e!676521 () Bool)

(declare-fun e!676518 () Bool)

(declare-fun mapRes!46907 () Bool)

(assert (=> b!1189973 (= e!676521 (and e!676518 mapRes!46907))))

(declare-fun condMapEmpty!46907 () Bool)

(declare-fun mapDefault!46907 () ValueCell!14317)

