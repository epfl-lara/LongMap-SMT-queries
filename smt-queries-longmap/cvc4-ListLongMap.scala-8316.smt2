; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101248 () Bool)

(assert start!101248)

(declare-fun b_free!26171 () Bool)

(declare-fun b_next!26171 () Bool)

(assert (=> start!101248 (= b_free!26171 (not b_next!26171))))

(declare-fun tp!91535 () Bool)

(declare-fun b_and!43459 () Bool)

(assert (=> start!101248 (= tp!91535 b_and!43459)))

(declare-fun b!1216036 () Bool)

(declare-fun res!807459 () Bool)

(declare-fun e!690428 () Bool)

(assert (=> b!1216036 (=> (not res!807459) (not e!690428))))

(declare-datatypes ((array!78523 0))(
  ( (array!78524 (arr!37896 (Array (_ BitVec 32) (_ BitVec 64))) (size!38432 (_ BitVec 32))) )
))
(declare-fun lt!552777 () array!78523)

(declare-datatypes ((List!26715 0))(
  ( (Nil!26712) (Cons!26711 (h!27920 (_ BitVec 64)) (t!39866 List!26715)) )
))
(declare-fun arrayNoDuplicates!0 (array!78523 (_ BitVec 32) List!26715) Bool)

(assert (=> b!1216036 (= res!807459 (arrayNoDuplicates!0 lt!552777 #b00000000000000000000000000000000 Nil!26712))))

(declare-fun b!1216037 () Bool)

(declare-fun res!807453 () Bool)

(declare-fun e!690432 () Bool)

(assert (=> b!1216037 (=> (not res!807453) (not e!690432))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216037 (= res!807453 (validKeyInArray!0 k!934))))

(declare-fun b!1216038 () Bool)

(declare-fun res!807456 () Bool)

(assert (=> b!1216038 (=> (not res!807456) (not e!690432))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216038 (= res!807456 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48187 () Bool)

(declare-fun mapRes!48187 () Bool)

(declare-fun tp!91534 () Bool)

(declare-fun e!690430 () Bool)

(assert (=> mapNonEmpty!48187 (= mapRes!48187 (and tp!91534 e!690430))))

(declare-datatypes ((V!46293 0))(
  ( (V!46294 (val!15494 Int)) )
))
(declare-datatypes ((ValueCell!14728 0))(
  ( (ValueCellFull!14728 (v!18147 V!46293)) (EmptyCell!14728) )
))
(declare-fun mapRest!48187 () (Array (_ BitVec 32) ValueCell!14728))

(declare-datatypes ((array!78525 0))(
  ( (array!78526 (arr!37897 (Array (_ BitVec 32) ValueCell!14728)) (size!38433 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78525)

(declare-fun mapValue!48187 () ValueCell!14728)

(declare-fun mapKey!48187 () (_ BitVec 32))

(assert (=> mapNonEmpty!48187 (= (arr!37897 _values!996) (store mapRest!48187 mapKey!48187 mapValue!48187))))

(declare-fun mapIsEmpty!48187 () Bool)

(assert (=> mapIsEmpty!48187 mapRes!48187))

(declare-fun b!1216039 () Bool)

(declare-fun e!690427 () Bool)

(assert (=> b!1216039 (= e!690427 true)))

(declare-fun zeroValue!944 () V!46293)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46293)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19912 0))(
  ( (tuple2!19913 (_1!9967 (_ BitVec 64)) (_2!9967 V!46293)) )
))
(declare-datatypes ((List!26716 0))(
  ( (Nil!26713) (Cons!26712 (h!27921 tuple2!19912) (t!39867 List!26716)) )
))
(declare-datatypes ((ListLongMap!17881 0))(
  ( (ListLongMap!17882 (toList!8956 List!26716)) )
))
(declare-fun lt!552780 () ListLongMap!17881)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5383 (array!78523 array!78525 (_ BitVec 32) (_ BitVec 32) V!46293 V!46293 (_ BitVec 32) Int) ListLongMap!17881)

(declare-fun dynLambda!3272 (Int (_ BitVec 64)) V!46293)

(assert (=> b!1216039 (= lt!552780 (getCurrentListMapNoExtraKeys!5383 lt!552777 (array!78526 (store (arr!37897 _values!996) i!673 (ValueCellFull!14728 (dynLambda!3272 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38433 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!78523)

(declare-fun lt!552779 () ListLongMap!17881)

(assert (=> b!1216039 (= lt!552779 (getCurrentListMapNoExtraKeys!5383 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216040 () Bool)

(declare-fun e!690431 () Bool)

(declare-fun tp_is_empty!30875 () Bool)

(assert (=> b!1216040 (= e!690431 tp_is_empty!30875)))

(declare-fun b!1216041 () Bool)

(declare-fun res!807452 () Bool)

(assert (=> b!1216041 (=> (not res!807452) (not e!690432))))

(assert (=> b!1216041 (= res!807452 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26712))))

(declare-fun b!1216042 () Bool)

(declare-fun res!807454 () Bool)

(assert (=> b!1216042 (=> (not res!807454) (not e!690432))))

(assert (=> b!1216042 (= res!807454 (= (select (arr!37896 _keys!1208) i!673) k!934))))

(declare-fun b!1216043 () Bool)

(declare-fun res!807457 () Bool)

(assert (=> b!1216043 (=> (not res!807457) (not e!690432))))

(assert (=> b!1216043 (= res!807457 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38432 _keys!1208))))))

(declare-fun b!1216044 () Bool)

(declare-fun res!807458 () Bool)

(assert (=> b!1216044 (=> (not res!807458) (not e!690432))))

(assert (=> b!1216044 (= res!807458 (and (= (size!38433 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38432 _keys!1208) (size!38433 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216045 () Bool)

(declare-fun e!690429 () Bool)

(assert (=> b!1216045 (= e!690429 (and e!690431 mapRes!48187))))

(declare-fun condMapEmpty!48187 () Bool)

(declare-fun mapDefault!48187 () ValueCell!14728)

