; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101794 () Bool)

(assert start!101794)

(declare-fun b_free!26483 () Bool)

(declare-fun b_next!26483 () Bool)

(assert (=> start!101794 (= b_free!26483 (not b_next!26483))))

(declare-fun tp!92495 () Bool)

(declare-fun b_and!44227 () Bool)

(assert (=> start!101794 (= tp!92495 b_and!44227)))

(declare-fun b!1226232 () Bool)

(declare-fun res!814966 () Bool)

(declare-fun e!696425 () Bool)

(assert (=> b!1226232 (=> (not res!814966) (not e!696425))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226232 (= res!814966 (validMask!0 mask!1564))))

(declare-fun b!1226233 () Bool)

(declare-fun res!814971 () Bool)

(declare-fun e!696423 () Bool)

(assert (=> b!1226233 (=> (not res!814971) (not e!696423))))

(declare-datatypes ((array!79151 0))(
  ( (array!79152 (arr!38202 (Array (_ BitVec 32) (_ BitVec 64))) (size!38738 (_ BitVec 32))) )
))
(declare-fun lt!558746 () array!79151)

(declare-datatypes ((List!26975 0))(
  ( (Nil!26972) (Cons!26971 (h!28180 (_ BitVec 64)) (t!40438 List!26975)) )
))
(declare-fun arrayNoDuplicates!0 (array!79151 (_ BitVec 32) List!26975) Bool)

(assert (=> b!1226233 (= res!814971 (arrayNoDuplicates!0 lt!558746 #b00000000000000000000000000000000 Nil!26972))))

(declare-fun b!1226234 () Bool)

(declare-fun res!814968 () Bool)

(assert (=> b!1226234 (=> (not res!814968) (not e!696425))))

(declare-fun _keys!1208 () array!79151)

(assert (=> b!1226234 (= res!814968 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26972))))

(declare-fun b!1226235 () Bool)

(declare-fun res!814967 () Bool)

(assert (=> b!1226235 (=> (not res!814967) (not e!696425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79151 (_ BitVec 32)) Bool)

(assert (=> b!1226235 (= res!814967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226236 () Bool)

(declare-fun e!696427 () Bool)

(declare-fun e!696429 () Bool)

(assert (=> b!1226236 (= e!696427 e!696429)))

(declare-fun res!814975 () Bool)

(assert (=> b!1226236 (=> res!814975 e!696429)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1226236 (= res!814975 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46709 0))(
  ( (V!46710 (val!15650 Int)) )
))
(declare-fun zeroValue!944 () V!46709)

(declare-datatypes ((tuple2!20172 0))(
  ( (tuple2!20173 (_1!10097 (_ BitVec 64)) (_2!10097 V!46709)) )
))
(declare-datatypes ((List!26976 0))(
  ( (Nil!26973) (Cons!26972 (h!28181 tuple2!20172) (t!40439 List!26976)) )
))
(declare-datatypes ((ListLongMap!18141 0))(
  ( (ListLongMap!18142 (toList!9086 List!26976)) )
))
(declare-fun lt!558743 () ListLongMap!18141)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46709)

(declare-datatypes ((ValueCell!14884 0))(
  ( (ValueCellFull!14884 (v!18312 V!46709)) (EmptyCell!14884) )
))
(declare-datatypes ((array!79153 0))(
  ( (array!79154 (arr!38203 (Array (_ BitVec 32) ValueCell!14884)) (size!38739 (_ BitVec 32))) )
))
(declare-fun lt!558742 () array!79153)

(declare-fun getCurrentListMapNoExtraKeys!5505 (array!79151 array!79153 (_ BitVec 32) (_ BitVec 32) V!46709 V!46709 (_ BitVec 32) Int) ListLongMap!18141)

(assert (=> b!1226236 (= lt!558743 (getCurrentListMapNoExtraKeys!5505 lt!558746 lt!558742 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!79153)

(declare-fun dynLambda!3376 (Int (_ BitVec 64)) V!46709)

(assert (=> b!1226236 (= lt!558742 (array!79154 (store (arr!38203 _values!996) i!673 (ValueCellFull!14884 (dynLambda!3376 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38739 _values!996)))))

(declare-fun lt!558741 () ListLongMap!18141)

(assert (=> b!1226236 (= lt!558741 (getCurrentListMapNoExtraKeys!5505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!814969 () Bool)

(assert (=> start!101794 (=> (not res!814969) (not e!696425))))

(assert (=> start!101794 (= res!814969 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38738 _keys!1208))))))

(assert (=> start!101794 e!696425))

(declare-fun tp_is_empty!31187 () Bool)

(assert (=> start!101794 tp_is_empty!31187))

(declare-fun array_inv!29050 (array!79151) Bool)

(assert (=> start!101794 (array_inv!29050 _keys!1208)))

(assert (=> start!101794 true))

(assert (=> start!101794 tp!92495))

(declare-fun e!696428 () Bool)

(declare-fun array_inv!29051 (array!79153) Bool)

(assert (=> start!101794 (and (array_inv!29051 _values!996) e!696428)))

(declare-fun b!1226237 () Bool)

(declare-fun res!814963 () Bool)

(assert (=> b!1226237 (=> (not res!814963) (not e!696425))))

(assert (=> b!1226237 (= res!814963 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38738 _keys!1208))))))

(declare-fun mapIsEmpty!48679 () Bool)

(declare-fun mapRes!48679 () Bool)

(assert (=> mapIsEmpty!48679 mapRes!48679))

(declare-fun mapNonEmpty!48679 () Bool)

(declare-fun tp!92494 () Bool)

(declare-fun e!696426 () Bool)

(assert (=> mapNonEmpty!48679 (= mapRes!48679 (and tp!92494 e!696426))))

(declare-fun mapKey!48679 () (_ BitVec 32))

(declare-fun mapRest!48679 () (Array (_ BitVec 32) ValueCell!14884))

(declare-fun mapValue!48679 () ValueCell!14884)

(assert (=> mapNonEmpty!48679 (= (arr!38203 _values!996) (store mapRest!48679 mapKey!48679 mapValue!48679))))

(declare-fun b!1226238 () Bool)

(declare-fun e!696422 () Bool)

(assert (=> b!1226238 (= e!696422 tp_is_empty!31187)))

(declare-fun b!1226239 () Bool)

(declare-fun res!814974 () Bool)

(assert (=> b!1226239 (=> (not res!814974) (not e!696425))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226239 (= res!814974 (validKeyInArray!0 k!934))))

(declare-fun b!1226240 () Bool)

(assert (=> b!1226240 (= e!696425 e!696423)))

(declare-fun res!814972 () Bool)

(assert (=> b!1226240 (=> (not res!814972) (not e!696423))))

(assert (=> b!1226240 (= res!814972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558746 mask!1564))))

(assert (=> b!1226240 (= lt!558746 (array!79152 (store (arr!38202 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38738 _keys!1208)))))

(declare-fun b!1226241 () Bool)

(assert (=> b!1226241 (= e!696428 (and e!696422 mapRes!48679))))

(declare-fun condMapEmpty!48679 () Bool)

(declare-fun mapDefault!48679 () ValueCell!14884)

