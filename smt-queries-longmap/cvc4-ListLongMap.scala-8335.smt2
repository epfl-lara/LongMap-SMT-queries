; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101468 () Bool)

(assert start!101468)

(declare-fun b_free!26285 () Bool)

(declare-fun b_next!26285 () Bool)

(assert (=> start!101468 (= b_free!26285 (not b_next!26285))))

(declare-fun tp!91889 () Bool)

(declare-fun b_and!43759 () Bool)

(assert (=> start!101468 (= tp!91889 b_and!43759)))

(declare-fun b!1219605 () Bool)

(declare-fun res!810072 () Bool)

(declare-fun e!692499 () Bool)

(assert (=> b!1219605 (=> (not res!810072) (not e!692499))))

(declare-datatypes ((array!78755 0))(
  ( (array!78756 (arr!38008 (Array (_ BitVec 32) (_ BitVec 64))) (size!38544 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78755)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1219605 (= res!810072 (= (select (arr!38008 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!48370 () Bool)

(declare-fun mapRes!48370 () Bool)

(assert (=> mapIsEmpty!48370 mapRes!48370))

(declare-fun b!1219606 () Bool)

(declare-fun e!692489 () Bool)

(declare-fun e!692500 () Bool)

(assert (=> b!1219606 (= e!692489 e!692500)))

(declare-fun res!810064 () Bool)

(assert (=> b!1219606 (=> res!810064 e!692500)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1219606 (= res!810064 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!46445 0))(
  ( (V!46446 (val!15551 Int)) )
))
(declare-datatypes ((tuple2!20014 0))(
  ( (tuple2!20015 (_1!10018 (_ BitVec 64)) (_2!10018 V!46445)) )
))
(declare-datatypes ((List!26815 0))(
  ( (Nil!26812) (Cons!26811 (h!28020 tuple2!20014) (t!40080 List!26815)) )
))
(declare-datatypes ((ListLongMap!17983 0))(
  ( (ListLongMap!17984 (toList!9007 List!26815)) )
))
(declare-fun lt!554529 () ListLongMap!17983)

(declare-fun minValue!944 () V!46445)

(declare-datatypes ((ValueCell!14785 0))(
  ( (ValueCellFull!14785 (v!18208 V!46445)) (EmptyCell!14785) )
))
(declare-datatypes ((array!78757 0))(
  ( (array!78758 (arr!38009 (Array (_ BitVec 32) ValueCell!14785)) (size!38545 (_ BitVec 32))) )
))
(declare-fun lt!554531 () array!78757)

(declare-fun zeroValue!944 () V!46445)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!554523 () array!78755)

(declare-fun getCurrentListMapNoExtraKeys!5432 (array!78755 array!78757 (_ BitVec 32) (_ BitVec 32) V!46445 V!46445 (_ BitVec 32) Int) ListLongMap!17983)

(assert (=> b!1219606 (= lt!554529 (getCurrentListMapNoExtraKeys!5432 lt!554523 lt!554531 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554524 () V!46445)

(declare-fun _values!996 () array!78757)

(assert (=> b!1219606 (= lt!554531 (array!78758 (store (arr!38009 _values!996) i!673 (ValueCellFull!14785 lt!554524)) (size!38545 _values!996)))))

(declare-fun dynLambda!3314 (Int (_ BitVec 64)) V!46445)

(assert (=> b!1219606 (= lt!554524 (dynLambda!3314 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554522 () ListLongMap!17983)

(assert (=> b!1219606 (= lt!554522 (getCurrentListMapNoExtraKeys!5432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219607 () Bool)

(declare-fun e!692492 () Bool)

(declare-fun e!692498 () Bool)

(assert (=> b!1219607 (= e!692492 e!692498)))

(declare-fun res!810058 () Bool)

(assert (=> b!1219607 (=> res!810058 e!692498)))

(assert (=> b!1219607 (= res!810058 (not (= (select (arr!38008 _keys!1208) from!1455) k!934)))))

(declare-fun e!692497 () Bool)

(assert (=> b!1219607 e!692497))

(declare-fun res!810062 () Bool)

(assert (=> b!1219607 (=> (not res!810062) (not e!692497))))

(declare-fun lt!554526 () ListLongMap!17983)

(declare-fun +!4075 (ListLongMap!17983 tuple2!20014) ListLongMap!17983)

(declare-fun get!19384 (ValueCell!14785 V!46445) V!46445)

(assert (=> b!1219607 (= res!810062 (= lt!554529 (+!4075 lt!554526 (tuple2!20015 (select (arr!38008 _keys!1208) from!1455) (get!19384 (select (arr!38009 _values!996) from!1455) lt!554524)))))))

(declare-fun b!1219608 () Bool)

(declare-fun e!692494 () Bool)

(declare-fun tp_is_empty!30989 () Bool)

(assert (=> b!1219608 (= e!692494 tp_is_empty!30989)))

(declare-fun b!1219609 () Bool)

(declare-fun res!810063 () Bool)

(assert (=> b!1219609 (=> (not res!810063) (not e!692499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219609 (= res!810063 (validMask!0 mask!1564))))

(declare-fun e!692495 () Bool)

(declare-fun b!1219610 () Bool)

(declare-fun arrayContainsKey!0 (array!78755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219610 (= e!692495 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219611 () Bool)

(declare-fun e!692490 () Bool)

(assert (=> b!1219611 (= e!692490 tp_is_empty!30989)))

(declare-fun b!1219612 () Bool)

(declare-fun res!810057 () Bool)

(assert (=> b!1219612 (=> (not res!810057) (not e!692499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78755 (_ BitVec 32)) Bool)

(assert (=> b!1219612 (= res!810057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219613 () Bool)

(assert (=> b!1219613 (= e!692500 e!692492)))

(declare-fun res!810069 () Bool)

(assert (=> b!1219613 (=> res!810069 e!692492)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219613 (= res!810069 (not (validKeyInArray!0 (select (arr!38008 _keys!1208) from!1455))))))

(declare-fun lt!554528 () ListLongMap!17983)

(assert (=> b!1219613 (= lt!554528 lt!554526)))

(declare-fun lt!554525 () ListLongMap!17983)

(declare-fun -!1919 (ListLongMap!17983 (_ BitVec 64)) ListLongMap!17983)

(assert (=> b!1219613 (= lt!554526 (-!1919 lt!554525 k!934))))

(assert (=> b!1219613 (= lt!554528 (getCurrentListMapNoExtraKeys!5432 lt!554523 lt!554531 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219613 (= lt!554525 (getCurrentListMapNoExtraKeys!5432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40414 0))(
  ( (Unit!40415) )
))
(declare-fun lt!554527 () Unit!40414)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1126 (array!78755 array!78757 (_ BitVec 32) (_ BitVec 32) V!46445 V!46445 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40414)

(assert (=> b!1219613 (= lt!554527 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1126 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219614 () Bool)

(declare-fun e!692491 () Bool)

(assert (=> b!1219614 (= e!692491 (and e!692490 mapRes!48370))))

(declare-fun condMapEmpty!48370 () Bool)

(declare-fun mapDefault!48370 () ValueCell!14785)

