; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97806 () Bool)

(assert start!97806)

(declare-fun b_free!23507 () Bool)

(declare-fun b_next!23507 () Bool)

(assert (=> start!97806 (= b_free!23507 (not b_next!23507))))

(declare-fun tp!83225 () Bool)

(declare-fun b_and!37797 () Bool)

(assert (=> start!97806 (= tp!83225 b_and!37797)))

(declare-fun b!1119078 () Bool)

(declare-fun res!747485 () Bool)

(declare-fun e!637365 () Bool)

(assert (=> b!1119078 (=> (not res!747485) (not e!637365))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119078 (= res!747485 (validMask!0 mask!1564))))

(declare-fun b!1119079 () Bool)

(declare-fun res!747489 () Bool)

(assert (=> b!1119079 (=> (not res!747489) (not e!637365))))

(declare-datatypes ((array!72961 0))(
  ( (array!72962 (arr!35133 (Array (_ BitVec 32) (_ BitVec 64))) (size!35669 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72961)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72961 (_ BitVec 32)) Bool)

(assert (=> b!1119079 (= res!747489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119080 () Bool)

(declare-fun e!637360 () Bool)

(declare-fun tp_is_empty!28037 () Bool)

(assert (=> b!1119080 (= e!637360 tp_is_empty!28037)))

(declare-fun b!1119081 () Bool)

(declare-fun e!637361 () Bool)

(assert (=> b!1119081 (= e!637361 true)))

(declare-datatypes ((V!42509 0))(
  ( (V!42510 (val!14075 Int)) )
))
(declare-fun zeroValue!944 () V!42509)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!497654 () array!72961)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13309 0))(
  ( (ValueCellFull!13309 (v!16708 V!42509)) (EmptyCell!13309) )
))
(declare-datatypes ((array!72963 0))(
  ( (array!72964 (arr!35134 (Array (_ BitVec 32) ValueCell!13309)) (size!35670 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72963)

(declare-fun minValue!944 () V!42509)

(declare-datatypes ((tuple2!17658 0))(
  ( (tuple2!17659 (_1!8840 (_ BitVec 64)) (_2!8840 V!42509)) )
))
(declare-datatypes ((List!24444 0))(
  ( (Nil!24441) (Cons!24440 (h!25649 tuple2!17658) (t!34943 List!24444)) )
))
(declare-datatypes ((ListLongMap!15627 0))(
  ( (ListLongMap!15628 (toList!7829 List!24444)) )
))
(declare-fun lt!497657 () ListLongMap!15627)

(declare-fun getCurrentListMapNoExtraKeys!4319 (array!72961 array!72963 (_ BitVec 32) (_ BitVec 32) V!42509 V!42509 (_ BitVec 32) Int) ListLongMap!15627)

(declare-fun dynLambda!2423 (Int (_ BitVec 64)) V!42509)

(assert (=> b!1119081 (= lt!497657 (getCurrentListMapNoExtraKeys!4319 lt!497654 (array!72964 (store (arr!35134 _values!996) i!673 (ValueCellFull!13309 (dynLambda!2423 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35670 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497655 () ListLongMap!15627)

(assert (=> b!1119081 (= lt!497655 (getCurrentListMapNoExtraKeys!4319 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!43873 () Bool)

(declare-fun mapRes!43873 () Bool)

(assert (=> mapIsEmpty!43873 mapRes!43873))

(declare-fun b!1119082 () Bool)

(declare-fun e!637359 () Bool)

(assert (=> b!1119082 (= e!637359 (and e!637360 mapRes!43873))))

(declare-fun condMapEmpty!43873 () Bool)

(declare-fun mapDefault!43873 () ValueCell!13309)

