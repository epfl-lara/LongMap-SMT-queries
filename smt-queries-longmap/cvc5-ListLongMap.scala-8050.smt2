; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99140 () Bool)

(assert start!99140)

(declare-fun b_free!24745 () Bool)

(declare-fun b_next!24745 () Bool)

(assert (=> start!99140 (= b_free!24745 (not b_next!24745))))

(declare-fun tp!86946 () Bool)

(declare-fun b_and!40339 () Bool)

(assert (=> start!99140 (= tp!86946 b_and!40339)))

(declare-fun b!1166561 () Bool)

(declare-fun res!773792 () Bool)

(declare-fun e!663102 () Bool)

(assert (=> b!1166561 (=> (not res!773792) (not e!663102))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166561 (= res!773792 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!45737 () Bool)

(declare-fun mapRes!45737 () Bool)

(declare-fun tp!86945 () Bool)

(declare-fun e!663103 () Bool)

(assert (=> mapNonEmpty!45737 (= mapRes!45737 (and tp!86945 e!663103))))

(declare-datatypes ((V!44161 0))(
  ( (V!44162 (val!14694 Int)) )
))
(declare-datatypes ((ValueCell!13928 0))(
  ( (ValueCellFull!13928 (v!17331 V!44161)) (EmptyCell!13928) )
))
(declare-fun mapValue!45737 () ValueCell!13928)

(declare-fun mapKey!45737 () (_ BitVec 32))

(declare-fun mapRest!45737 () (Array (_ BitVec 32) ValueCell!13928))

(declare-datatypes ((array!75381 0))(
  ( (array!75382 (arr!36341 (Array (_ BitVec 32) ValueCell!13928)) (size!36877 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75381)

(assert (=> mapNonEmpty!45737 (= (arr!36341 _values!996) (store mapRest!45737 mapKey!45737 mapValue!45737))))

(declare-fun b!1166563 () Bool)

(declare-fun e!663105 () Bool)

(declare-fun e!663098 () Bool)

(assert (=> b!1166563 (= e!663105 e!663098)))

(declare-fun res!773791 () Bool)

(assert (=> b!1166563 (=> res!773791 e!663098)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166563 (= res!773791 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44161)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!75383 0))(
  ( (array!75384 (arr!36342 (Array (_ BitVec 32) (_ BitVec 64))) (size!36878 (_ BitVec 32))) )
))
(declare-fun lt!525302 () array!75383)

(declare-fun lt!525299 () array!75381)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18738 0))(
  ( (tuple2!18739 (_1!9380 (_ BitVec 64)) (_2!9380 V!44161)) )
))
(declare-datatypes ((List!25479 0))(
  ( (Nil!25476) (Cons!25475 (h!26684 tuple2!18738) (t!37216 List!25479)) )
))
(declare-datatypes ((ListLongMap!16707 0))(
  ( (ListLongMap!16708 (toList!8369 List!25479)) )
))
(declare-fun lt!525298 () ListLongMap!16707)

(declare-fun minValue!944 () V!44161)

(declare-fun getCurrentListMapNoExtraKeys!4833 (array!75383 array!75381 (_ BitVec 32) (_ BitVec 32) V!44161 V!44161 (_ BitVec 32) Int) ListLongMap!16707)

(assert (=> b!1166563 (= lt!525298 (getCurrentListMapNoExtraKeys!4833 lt!525302 lt!525299 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2822 (Int (_ BitVec 64)) V!44161)

(assert (=> b!1166563 (= lt!525299 (array!75382 (store (arr!36341 _values!996) i!673 (ValueCellFull!13928 (dynLambda!2822 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36877 _values!996)))))

(declare-fun _keys!1208 () array!75383)

(declare-fun lt!525300 () ListLongMap!16707)

(assert (=> b!1166563 (= lt!525300 (getCurrentListMapNoExtraKeys!4833 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166564 () Bool)

(declare-fun res!773795 () Bool)

(assert (=> b!1166564 (=> (not res!773795) (not e!663102))))

(assert (=> b!1166564 (= res!773795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36878 _keys!1208))))))

(declare-fun mapIsEmpty!45737 () Bool)

(assert (=> mapIsEmpty!45737 mapRes!45737))

(declare-fun b!1166565 () Bool)

(assert (=> b!1166565 (= e!663098 true)))

(declare-fun -!1446 (ListLongMap!16707 (_ BitVec 64)) ListLongMap!16707)

(assert (=> b!1166565 (= (getCurrentListMapNoExtraKeys!4833 lt!525302 lt!525299 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1446 (getCurrentListMapNoExtraKeys!4833 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38492 0))(
  ( (Unit!38493) )
))
(declare-fun lt!525303 () Unit!38492)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!673 (array!75383 array!75381 (_ BitVec 32) (_ BitVec 32) V!44161 V!44161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38492)

(assert (=> b!1166565 (= lt!525303 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166566 () Bool)

(declare-fun res!773789 () Bool)

(assert (=> b!1166566 (=> (not res!773789) (not e!663102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166566 (= res!773789 (validMask!0 mask!1564))))

(declare-fun b!1166567 () Bool)

(declare-fun res!773794 () Bool)

(assert (=> b!1166567 (=> (not res!773794) (not e!663102))))

(declare-datatypes ((List!25480 0))(
  ( (Nil!25477) (Cons!25476 (h!26685 (_ BitVec 64)) (t!37217 List!25480)) )
))
(declare-fun arrayNoDuplicates!0 (array!75383 (_ BitVec 32) List!25480) Bool)

(assert (=> b!1166567 (= res!773794 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25477))))

(declare-fun b!1166568 () Bool)

(declare-fun e!663100 () Bool)

(assert (=> b!1166568 (= e!663102 e!663100)))

(declare-fun res!773790 () Bool)

(assert (=> b!1166568 (=> (not res!773790) (not e!663100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75383 (_ BitVec 32)) Bool)

(assert (=> b!1166568 (= res!773790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525302 mask!1564))))

(assert (=> b!1166568 (= lt!525302 (array!75384 (store (arr!36342 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36878 _keys!1208)))))

(declare-fun b!1166569 () Bool)

(declare-fun e!663099 () Bool)

(declare-fun e!663104 () Bool)

(assert (=> b!1166569 (= e!663099 (and e!663104 mapRes!45737))))

(declare-fun condMapEmpty!45737 () Bool)

(declare-fun mapDefault!45737 () ValueCell!13928)

