; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101788 () Bool)

(assert start!101788)

(declare-fun b_free!26477 () Bool)

(declare-fun b_next!26477 () Bool)

(assert (=> start!101788 (= b_free!26477 (not b_next!26477))))

(declare-fun tp!92476 () Bool)

(declare-fun b_and!44215 () Bool)

(assert (=> start!101788 (= tp!92476 b_and!44215)))

(declare-fun b!1226083 () Bool)

(declare-fun e!696347 () Bool)

(declare-fun e!696344 () Bool)

(assert (=> b!1226083 (= e!696347 e!696344)))

(declare-fun res!814848 () Bool)

(assert (=> b!1226083 (=> res!814848 e!696344)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1226083 (= res!814848 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46701 0))(
  ( (V!46702 (val!15647 Int)) )
))
(declare-fun zeroValue!944 () V!46701)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20166 0))(
  ( (tuple2!20167 (_1!10094 (_ BitVec 64)) (_2!10094 V!46701)) )
))
(declare-datatypes ((List!26969 0))(
  ( (Nil!26966) (Cons!26965 (h!28174 tuple2!20166) (t!40426 List!26969)) )
))
(declare-datatypes ((ListLongMap!18135 0))(
  ( (ListLongMap!18136 (toList!9083 List!26969)) )
))
(declare-fun lt!558687 () ListLongMap!18135)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!79139 0))(
  ( (array!79140 (arr!38196 (Array (_ BitVec 32) (_ BitVec 64))) (size!38732 (_ BitVec 32))) )
))
(declare-fun lt!558689 () array!79139)

(declare-datatypes ((ValueCell!14881 0))(
  ( (ValueCellFull!14881 (v!18309 V!46701)) (EmptyCell!14881) )
))
(declare-datatypes ((array!79141 0))(
  ( (array!79142 (arr!38197 (Array (_ BitVec 32) ValueCell!14881)) (size!38733 (_ BitVec 32))) )
))
(declare-fun lt!558692 () array!79141)

(declare-fun minValue!944 () V!46701)

(declare-fun getCurrentListMapNoExtraKeys!5502 (array!79139 array!79141 (_ BitVec 32) (_ BitVec 32) V!46701 V!46701 (_ BitVec 32) Int) ListLongMap!18135)

(assert (=> b!1226083 (= lt!558687 (getCurrentListMapNoExtraKeys!5502 lt!558689 lt!558692 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!79141)

(declare-fun dynLambda!3373 (Int (_ BitVec 64)) V!46701)

(assert (=> b!1226083 (= lt!558692 (array!79142 (store (arr!38197 _values!996) i!673 (ValueCellFull!14881 (dynLambda!3373 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38733 _values!996)))))

(declare-fun _keys!1208 () array!79139)

(declare-fun lt!558688 () ListLongMap!18135)

(assert (=> b!1226083 (= lt!558688 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!814852 () Bool)

(declare-fun e!696349 () Bool)

(assert (=> start!101788 (=> (not res!814852) (not e!696349))))

(assert (=> start!101788 (= res!814852 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38732 _keys!1208))))))

(assert (=> start!101788 e!696349))

(declare-fun tp_is_empty!31181 () Bool)

(assert (=> start!101788 tp_is_empty!31181))

(declare-fun array_inv!29044 (array!79139) Bool)

(assert (=> start!101788 (array_inv!29044 _keys!1208)))

(assert (=> start!101788 true))

(assert (=> start!101788 tp!92476))

(declare-fun e!696346 () Bool)

(declare-fun array_inv!29045 (array!79141) Bool)

(assert (=> start!101788 (and (array_inv!29045 _values!996) e!696346)))

(declare-fun b!1226084 () Bool)

(declare-fun res!814851 () Bool)

(assert (=> b!1226084 (=> (not res!814851) (not e!696349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226084 (= res!814851 (validMask!0 mask!1564))))

(declare-fun b!1226085 () Bool)

(assert (=> b!1226085 (= e!696344 true)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1982 (ListLongMap!18135 (_ BitVec 64)) ListLongMap!18135)

(assert (=> b!1226085 (= (getCurrentListMapNoExtraKeys!5502 lt!558689 lt!558692 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1982 (getCurrentListMapNoExtraKeys!5502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!40634 0))(
  ( (Unit!40635) )
))
(declare-fun lt!558691 () Unit!40634)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1188 (array!79139 array!79141 (_ BitVec 32) (_ BitVec 32) V!46701 V!46701 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40634)

(assert (=> b!1226085 (= lt!558691 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1188 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226086 () Bool)

(declare-fun res!814855 () Bool)

(assert (=> b!1226086 (=> (not res!814855) (not e!696349))))

(declare-datatypes ((List!26970 0))(
  ( (Nil!26967) (Cons!26966 (h!28175 (_ BitVec 64)) (t!40427 List!26970)) )
))
(declare-fun arrayNoDuplicates!0 (array!79139 (_ BitVec 32) List!26970) Bool)

(assert (=> b!1226086 (= res!814855 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26967))))

(declare-fun b!1226087 () Bool)

(declare-fun res!814854 () Bool)

(assert (=> b!1226087 (=> (not res!814854) (not e!696349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226087 (= res!814854 (validKeyInArray!0 k!934))))

(declare-fun b!1226088 () Bool)

(declare-fun res!814849 () Bool)

(assert (=> b!1226088 (=> (not res!814849) (not e!696349))))

(assert (=> b!1226088 (= res!814849 (and (= (size!38733 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38732 _keys!1208) (size!38733 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226089 () Bool)

(declare-fun res!814847 () Bool)

(assert (=> b!1226089 (=> (not res!814847) (not e!696349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79139 (_ BitVec 32)) Bool)

(assert (=> b!1226089 (= res!814847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226090 () Bool)

(declare-fun e!696343 () Bool)

(assert (=> b!1226090 (= e!696343 (not e!696347))))

(declare-fun res!814858 () Bool)

(assert (=> b!1226090 (=> res!814858 e!696347)))

(assert (=> b!1226090 (= res!814858 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226090 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!558690 () Unit!40634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79139 (_ BitVec 64) (_ BitVec 32)) Unit!40634)

(assert (=> b!1226090 (= lt!558690 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!48670 () Bool)

(declare-fun mapRes!48670 () Bool)

(assert (=> mapIsEmpty!48670 mapRes!48670))

(declare-fun b!1226091 () Bool)

(declare-fun e!696342 () Bool)

(assert (=> b!1226091 (= e!696342 tp_is_empty!31181)))

(declare-fun b!1226092 () Bool)

(assert (=> b!1226092 (= e!696346 (and e!696342 mapRes!48670))))

(declare-fun condMapEmpty!48670 () Bool)

(declare-fun mapDefault!48670 () ValueCell!14881)

