; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97902 () Bool)

(assert start!97902)

(declare-fun b_free!23603 () Bool)

(declare-fun b_next!23603 () Bool)

(assert (=> start!97902 (= b_free!23603 (not b_next!23603))))

(declare-fun tp!83512 () Bool)

(declare-fun b_and!37989 () Bool)

(assert (=> start!97902 (= tp!83512 b_and!37989)))

(declare-fun b!1121322 () Bool)

(declare-fun res!749108 () Bool)

(declare-fun e!638457 () Bool)

(assert (=> b!1121322 (=> (not res!749108) (not e!638457))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73147 0))(
  ( (array!73148 (arr!35226 (Array (_ BitVec 32) (_ BitVec 64))) (size!35762 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73147)

(assert (=> b!1121322 (= res!749108 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35762 _keys!1208))))))

(declare-fun b!1121323 () Bool)

(declare-fun e!638462 () Bool)

(declare-fun e!638455 () Bool)

(assert (=> b!1121323 (= e!638462 e!638455)))

(declare-fun res!749114 () Bool)

(assert (=> b!1121323 (=> res!749114 e!638455)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1121323 (= res!749114 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42637 0))(
  ( (V!42638 (val!14123 Int)) )
))
(declare-datatypes ((ValueCell!13357 0))(
  ( (ValueCellFull!13357 (v!16756 V!42637)) (EmptyCell!13357) )
))
(declare-datatypes ((array!73149 0))(
  ( (array!73150 (arr!35227 (Array (_ BitVec 32) ValueCell!13357)) (size!35763 (_ BitVec 32))) )
))
(declare-fun lt!498323 () array!73149)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!498318 () array!73147)

(declare-fun minValue!944 () V!42637)

(declare-datatypes ((tuple2!17726 0))(
  ( (tuple2!17727 (_1!8874 (_ BitVec 64)) (_2!8874 V!42637)) )
))
(declare-datatypes ((List!24511 0))(
  ( (Nil!24508) (Cons!24507 (h!25716 tuple2!17726) (t!35106 List!24511)) )
))
(declare-datatypes ((ListLongMap!15695 0))(
  ( (ListLongMap!15696 (toList!7863 List!24511)) )
))
(declare-fun lt!498321 () ListLongMap!15695)

(declare-fun zeroValue!944 () V!42637)

(declare-fun getCurrentListMapNoExtraKeys!4352 (array!73147 array!73149 (_ BitVec 32) (_ BitVec 32) V!42637 V!42637 (_ BitVec 32) Int) ListLongMap!15695)

(assert (=> b!1121323 (= lt!498321 (getCurrentListMapNoExtraKeys!4352 lt!498318 lt!498323 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73149)

(declare-fun dynLambda!2454 (Int (_ BitVec 64)) V!42637)

(assert (=> b!1121323 (= lt!498323 (array!73150 (store (arr!35227 _values!996) i!673 (ValueCellFull!13357 (dynLambda!2454 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35763 _values!996)))))

(declare-fun lt!498319 () ListLongMap!15695)

(assert (=> b!1121323 (= lt!498319 (getCurrentListMapNoExtraKeys!4352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121324 () Bool)

(declare-fun e!638456 () Bool)

(assert (=> b!1121324 (= e!638457 e!638456)))

(declare-fun res!749119 () Bool)

(assert (=> b!1121324 (=> (not res!749119) (not e!638456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73147 (_ BitVec 32)) Bool)

(assert (=> b!1121324 (= res!749119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498318 mask!1564))))

(assert (=> b!1121324 (= lt!498318 (array!73148 (store (arr!35226 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35762 _keys!1208)))))

(declare-fun b!1121325 () Bool)

(declare-fun e!638458 () Bool)

(declare-fun e!638459 () Bool)

(declare-fun mapRes!44017 () Bool)

(assert (=> b!1121325 (= e!638458 (and e!638459 mapRes!44017))))

(declare-fun condMapEmpty!44017 () Bool)

(declare-fun mapDefault!44017 () ValueCell!13357)

