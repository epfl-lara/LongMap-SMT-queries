; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97866 () Bool)

(assert start!97866)

(declare-fun b_free!23567 () Bool)

(declare-fun b_next!23567 () Bool)

(assert (=> start!97866 (= b_free!23567 (not b_next!23567))))

(declare-fun tp!83405 () Bool)

(declare-fun b_and!37917 () Bool)

(assert (=> start!97866 (= tp!83405 b_and!37917)))

(declare-fun b!1120398 () Bool)

(declare-fun res!748474 () Bool)

(declare-fun e!637992 () Bool)

(assert (=> b!1120398 (=> (not res!748474) (not e!637992))))

(declare-datatypes ((array!73075 0))(
  ( (array!73076 (arr!35190 (Array (_ BitVec 32) (_ BitVec 64))) (size!35726 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73075)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73075 (_ BitVec 32)) Bool)

(assert (=> b!1120398 (= res!748474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120399 () Bool)

(declare-fun e!637990 () Bool)

(assert (=> b!1120399 (= e!637990 true)))

(declare-datatypes ((V!42589 0))(
  ( (V!42590 (val!14105 Int)) )
))
(declare-fun zeroValue!944 () V!42589)

(declare-fun lt!498017 () array!73075)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13339 0))(
  ( (ValueCellFull!13339 (v!16738 V!42589)) (EmptyCell!13339) )
))
(declare-datatypes ((array!73077 0))(
  ( (array!73078 (arr!35191 (Array (_ BitVec 32) ValueCell!13339)) (size!35727 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73077)

(declare-fun minValue!944 () V!42589)

(declare-datatypes ((tuple2!17696 0))(
  ( (tuple2!17697 (_1!8859 (_ BitVec 64)) (_2!8859 V!42589)) )
))
(declare-datatypes ((List!24482 0))(
  ( (Nil!24479) (Cons!24478 (h!25687 tuple2!17696) (t!35041 List!24482)) )
))
(declare-datatypes ((ListLongMap!15665 0))(
  ( (ListLongMap!15666 (toList!7848 List!24482)) )
))
(declare-fun lt!498015 () ListLongMap!15665)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4338 (array!73075 array!73077 (_ BitVec 32) (_ BitVec 32) V!42589 V!42589 (_ BitVec 32) Int) ListLongMap!15665)

(declare-fun dynLambda!2442 (Int (_ BitVec 64)) V!42589)

(assert (=> b!1120399 (= lt!498015 (getCurrentListMapNoExtraKeys!4338 lt!498017 (array!73078 (store (arr!35191 _values!996) i!673 (ValueCellFull!13339 (dynLambda!2442 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35727 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498016 () ListLongMap!15665)

(assert (=> b!1120399 (= lt!498016 (getCurrentListMapNoExtraKeys!4338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120400 () Bool)

(declare-fun e!637989 () Bool)

(assert (=> b!1120400 (= e!637992 e!637989)))

(declare-fun res!748478 () Bool)

(assert (=> b!1120400 (=> (not res!748478) (not e!637989))))

(assert (=> b!1120400 (= res!748478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498017 mask!1564))))

(assert (=> b!1120400 (= lt!498017 (array!73076 (store (arr!35190 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35726 _keys!1208)))))

(declare-fun mapNonEmpty!43963 () Bool)

(declare-fun mapRes!43963 () Bool)

(declare-fun tp!83404 () Bool)

(declare-fun e!637994 () Bool)

(assert (=> mapNonEmpty!43963 (= mapRes!43963 (and tp!83404 e!637994))))

(declare-fun mapValue!43963 () ValueCell!13339)

(declare-fun mapRest!43963 () (Array (_ BitVec 32) ValueCell!13339))

(declare-fun mapKey!43963 () (_ BitVec 32))

(assert (=> mapNonEmpty!43963 (= (arr!35191 _values!996) (store mapRest!43963 mapKey!43963 mapValue!43963))))

(declare-fun b!1120401 () Bool)

(declare-fun e!637991 () Bool)

(declare-fun e!637995 () Bool)

(assert (=> b!1120401 (= e!637991 (and e!637995 mapRes!43963))))

(declare-fun condMapEmpty!43963 () Bool)

(declare-fun mapDefault!43963 () ValueCell!13339)

