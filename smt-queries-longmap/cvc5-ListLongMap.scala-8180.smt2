; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99946 () Bool)

(assert start!99946)

(declare-fun b_free!25525 () Bool)

(declare-fun b_next!25525 () Bool)

(assert (=> start!99946 (= b_free!25525 (not b_next!25525))))

(declare-fun tp!89288 () Bool)

(declare-fun b_and!41917 () Bool)

(assert (=> start!99946 (= tp!89288 b_and!41917)))

(declare-fun b!1190011 () Bool)

(declare-fun e!676545 () Bool)

(declare-fun e!676539 () Bool)

(assert (=> b!1190011 (= e!676545 e!676539)))

(declare-fun res!791387 () Bool)

(assert (=> b!1190011 (=> (not res!791387) (not e!676539))))

(declare-datatypes ((array!76901 0))(
  ( (array!76902 (arr!37100 (Array (_ BitVec 32) (_ BitVec 64))) (size!37636 (_ BitVec 32))) )
))
(declare-fun lt!541287 () array!76901)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76901 (_ BitVec 32)) Bool)

(assert (=> b!1190011 (= res!791387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541287 mask!1564))))

(declare-fun _keys!1208 () array!76901)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190011 (= lt!541287 (array!76902 (store (arr!37100 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37636 _keys!1208)))))

(declare-fun mapIsEmpty!46910 () Bool)

(declare-fun mapRes!46910 () Bool)

(assert (=> mapIsEmpty!46910 mapRes!46910))

(declare-fun b!1190012 () Bool)

(declare-fun res!791391 () Bool)

(assert (=> b!1190012 (=> (not res!791391) (not e!676545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190012 (= res!791391 (validMask!0 mask!1564))))

(declare-fun b!1190013 () Bool)

(declare-fun e!676544 () Bool)

(declare-fun tp_is_empty!30055 () Bool)

(assert (=> b!1190013 (= e!676544 tp_is_empty!30055)))

(declare-fun res!791385 () Bool)

(assert (=> start!99946 (=> (not res!791385) (not e!676545))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99946 (= res!791385 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37636 _keys!1208))))))

(assert (=> start!99946 e!676545))

(assert (=> start!99946 tp_is_empty!30055))

(declare-fun array_inv!28296 (array!76901) Bool)

(assert (=> start!99946 (array_inv!28296 _keys!1208)))

(assert (=> start!99946 true))

(assert (=> start!99946 tp!89288))

(declare-datatypes ((V!45201 0))(
  ( (V!45202 (val!15084 Int)) )
))
(declare-datatypes ((ValueCell!14318 0))(
  ( (ValueCellFull!14318 (v!17722 V!45201)) (EmptyCell!14318) )
))
(declare-datatypes ((array!76903 0))(
  ( (array!76904 (arr!37101 (Array (_ BitVec 32) ValueCell!14318)) (size!37637 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76903)

(declare-fun e!676540 () Bool)

(declare-fun array_inv!28297 (array!76903) Bool)

(assert (=> start!99946 (and (array_inv!28297 _values!996) e!676540)))

(declare-fun b!1190014 () Bool)

(declare-fun res!791393 () Bool)

(assert (=> b!1190014 (=> (not res!791393) (not e!676545))))

(assert (=> b!1190014 (= res!791393 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37636 _keys!1208))))))

(declare-fun b!1190015 () Bool)

(declare-fun res!791388 () Bool)

(assert (=> b!1190015 (=> (not res!791388) (not e!676545))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190015 (= res!791388 (validKeyInArray!0 k!934))))

(declare-fun b!1190016 () Bool)

(declare-fun e!676546 () Bool)

(assert (=> b!1190016 (= e!676546 tp_is_empty!30055)))

(declare-fun b!1190017 () Bool)

(declare-fun e!676543 () Bool)

(declare-fun e!676542 () Bool)

(assert (=> b!1190017 (= e!676543 e!676542)))

(declare-fun res!791384 () Bool)

(assert (=> b!1190017 (=> res!791384 e!676542)))

(assert (=> b!1190017 (= res!791384 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45201)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19372 0))(
  ( (tuple2!19373 (_1!9697 (_ BitVec 64)) (_2!9697 V!45201)) )
))
(declare-datatypes ((List!26118 0))(
  ( (Nil!26115) (Cons!26114 (h!27323 tuple2!19372) (t!38635 List!26118)) )
))
(declare-datatypes ((ListLongMap!17341 0))(
  ( (ListLongMap!17342 (toList!8686 List!26118)) )
))
(declare-fun lt!541290 () ListLongMap!17341)

(declare-fun lt!541285 () array!76903)

(declare-fun minValue!944 () V!45201)

(declare-fun getCurrentListMapNoExtraKeys!5127 (array!76901 array!76903 (_ BitVec 32) (_ BitVec 32) V!45201 V!45201 (_ BitVec 32) Int) ListLongMap!17341)

(assert (=> b!1190017 (= lt!541290 (getCurrentListMapNoExtraKeys!5127 lt!541287 lt!541285 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3069 (Int (_ BitVec 64)) V!45201)

(assert (=> b!1190017 (= lt!541285 (array!76904 (store (arr!37101 _values!996) i!673 (ValueCellFull!14318 (dynLambda!3069 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37637 _values!996)))))

(declare-fun lt!541288 () ListLongMap!17341)

(assert (=> b!1190017 (= lt!541288 (getCurrentListMapNoExtraKeys!5127 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190018 () Bool)

(declare-fun res!791386 () Bool)

(assert (=> b!1190018 (=> (not res!791386) (not e!676545))))

(declare-datatypes ((List!26119 0))(
  ( (Nil!26116) (Cons!26115 (h!27324 (_ BitVec 64)) (t!38636 List!26119)) )
))
(declare-fun arrayNoDuplicates!0 (array!76901 (_ BitVec 32) List!26119) Bool)

(assert (=> b!1190018 (= res!791386 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26116))))

(declare-fun b!1190019 () Bool)

(declare-fun res!791395 () Bool)

(assert (=> b!1190019 (=> (not res!791395) (not e!676545))))

(assert (=> b!1190019 (= res!791395 (and (= (size!37637 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37636 _keys!1208) (size!37637 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190020 () Bool)

(declare-fun res!791394 () Bool)

(assert (=> b!1190020 (=> (not res!791394) (not e!676539))))

(assert (=> b!1190020 (= res!791394 (arrayNoDuplicates!0 lt!541287 #b00000000000000000000000000000000 Nil!26116))))

(declare-fun b!1190021 () Bool)

(declare-fun res!791392 () Bool)

(assert (=> b!1190021 (=> (not res!791392) (not e!676545))))

(assert (=> b!1190021 (= res!791392 (= (select (arr!37100 _keys!1208) i!673) k!934))))

(declare-fun b!1190022 () Bool)

(assert (=> b!1190022 (= e!676540 (and e!676544 mapRes!46910))))

(declare-fun condMapEmpty!46910 () Bool)

(declare-fun mapDefault!46910 () ValueCell!14318)

