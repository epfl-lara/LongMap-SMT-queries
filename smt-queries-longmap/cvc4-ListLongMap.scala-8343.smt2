; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101546 () Bool)

(assert start!101546)

(declare-fun b_free!26333 () Bool)

(declare-fun b_next!26333 () Bool)

(assert (=> start!101546 (= b_free!26333 (not b_next!26333))))

(declare-fun tp!92035 () Bool)

(declare-fun b_and!43873 () Bool)

(assert (=> start!101546 (= tp!92035 b_and!43873)))

(declare-fun b!1221181 () Bool)

(declare-fun e!693465 () Bool)

(declare-fun e!693466 () Bool)

(assert (=> b!1221181 (= e!693465 (not e!693466))))

(declare-fun res!811283 () Bool)

(assert (=> b!1221181 (=> res!811283 e!693466)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1221181 (= res!811283 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78853 0))(
  ( (array!78854 (arr!38056 (Array (_ BitVec 32) (_ BitVec 64))) (size!38592 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78853)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221181 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40458 0))(
  ( (Unit!40459) )
))
(declare-fun lt!555454 () Unit!40458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78853 (_ BitVec 64) (_ BitVec 32)) Unit!40458)

(assert (=> b!1221181 (= lt!555454 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!48445 () Bool)

(declare-fun mapRes!48445 () Bool)

(declare-fun tp!92036 () Bool)

(declare-fun e!693470 () Bool)

(assert (=> mapNonEmpty!48445 (= mapRes!48445 (and tp!92036 e!693470))))

(declare-fun mapKey!48445 () (_ BitVec 32))

(declare-datatypes ((V!46509 0))(
  ( (V!46510 (val!15575 Int)) )
))
(declare-datatypes ((ValueCell!14809 0))(
  ( (ValueCellFull!14809 (v!18233 V!46509)) (EmptyCell!14809) )
))
(declare-fun mapValue!48445 () ValueCell!14809)

(declare-datatypes ((array!78855 0))(
  ( (array!78856 (arr!38057 (Array (_ BitVec 32) ValueCell!14809)) (size!38593 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78855)

(declare-fun mapRest!48445 () (Array (_ BitVec 32) ValueCell!14809))

(assert (=> mapNonEmpty!48445 (= (arr!38057 _values!996) (store mapRest!48445 mapKey!48445 mapValue!48445))))

(declare-fun b!1221182 () Bool)

(declare-fun e!693474 () Bool)

(assert (=> b!1221182 (= e!693466 e!693474)))

(declare-fun res!811298 () Bool)

(assert (=> b!1221182 (=> res!811298 e!693474)))

(assert (=> b!1221182 (= res!811298 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46509)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!20054 0))(
  ( (tuple2!20055 (_1!10038 (_ BitVec 64)) (_2!10038 V!46509)) )
))
(declare-datatypes ((List!26855 0))(
  ( (Nil!26852) (Cons!26851 (h!28060 tuple2!20054) (t!40168 List!26855)) )
))
(declare-datatypes ((ListLongMap!18023 0))(
  ( (ListLongMap!18024 (toList!9027 List!26855)) )
))
(declare-fun lt!555448 () ListLongMap!18023)

(declare-fun minValue!944 () V!46509)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!555450 () array!78855)

(declare-fun lt!555451 () array!78853)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5449 (array!78853 array!78855 (_ BitVec 32) (_ BitVec 32) V!46509 V!46509 (_ BitVec 32) Int) ListLongMap!18023)

(assert (=> b!1221182 (= lt!555448 (getCurrentListMapNoExtraKeys!5449 lt!555451 lt!555450 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555449 () V!46509)

(assert (=> b!1221182 (= lt!555450 (array!78856 (store (arr!38057 _values!996) i!673 (ValueCellFull!14809 lt!555449)) (size!38593 _values!996)))))

(declare-fun dynLambda!3329 (Int (_ BitVec 64)) V!46509)

(assert (=> b!1221182 (= lt!555449 (dynLambda!3329 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555458 () ListLongMap!18023)

(assert (=> b!1221182 (= lt!555458 (getCurrentListMapNoExtraKeys!5449 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1221183 () Bool)

(declare-fun e!693473 () Bool)

(declare-fun e!693471 () Bool)

(assert (=> b!1221183 (= e!693473 (and e!693471 mapRes!48445))))

(declare-fun condMapEmpty!48445 () Bool)

(declare-fun mapDefault!48445 () ValueCell!14809)

