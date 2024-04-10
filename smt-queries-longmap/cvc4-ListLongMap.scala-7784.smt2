; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97452 () Bool)

(assert start!97452)

(declare-fun b_free!23423 () Bool)

(declare-fun b_next!23423 () Bool)

(assert (=> start!97452 (= b_free!23423 (not b_next!23423))))

(declare-fun tp!82568 () Bool)

(declare-fun b_and!37683 () Bool)

(assert (=> start!97452 (= tp!82568 b_and!37683)))

(declare-fun b!1111981 () Bool)

(declare-fun e!634028 () Bool)

(declare-fun e!634034 () Bool)

(assert (=> b!1111981 (= e!634028 e!634034)))

(declare-fun res!742049 () Bool)

(assert (=> b!1111981 (=> (not res!742049) (not e!634034))))

(declare-datatypes ((array!72279 0))(
  ( (array!72280 (arr!34792 (Array (_ BitVec 32) (_ BitVec 64))) (size!35328 (_ BitVec 32))) )
))
(declare-fun lt!496440 () array!72279)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72279 (_ BitVec 32)) Bool)

(assert (=> b!1111981 (= res!742049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496440 mask!1564))))

(declare-fun _keys!1208 () array!72279)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111981 (= lt!496440 (array!72280 (store (arr!34792 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35328 _keys!1208)))))

(declare-fun b!1111982 () Bool)

(declare-fun e!634030 () Bool)

(declare-datatypes ((V!42037 0))(
  ( (V!42038 (val!13898 Int)) )
))
(declare-datatypes ((tuple2!17590 0))(
  ( (tuple2!17591 (_1!8806 (_ BitVec 64)) (_2!8806 V!42037)) )
))
(declare-datatypes ((List!24273 0))(
  ( (Nil!24270) (Cons!24269 (h!25478 tuple2!17590) (t!34742 List!24273)) )
))
(declare-datatypes ((ListLongMap!15559 0))(
  ( (ListLongMap!15560 (toList!7795 List!24273)) )
))
(declare-fun call!46965 () ListLongMap!15559)

(declare-fun call!46966 () ListLongMap!15559)

(assert (=> b!1111982 (= e!634030 (= call!46965 call!46966))))

(declare-fun zeroValue!944 () V!42037)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46962 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13132 0))(
  ( (ValueCellFull!13132 (v!16531 V!42037)) (EmptyCell!13132) )
))
(declare-datatypes ((array!72281 0))(
  ( (array!72282 (arr!34793 (Array (_ BitVec 32) ValueCell!13132)) (size!35329 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72281)

(declare-fun minValue!944 () V!42037)

(declare-fun getCurrentListMapNoExtraKeys!4286 (array!72279 array!72281 (_ BitVec 32) (_ BitVec 32) V!42037 V!42037 (_ BitVec 32) Int) ListLongMap!15559)

(assert (=> bm!46962 (= call!46966 (getCurrentListMapNoExtraKeys!4286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111983 () Bool)

(declare-fun res!742047 () Bool)

(assert (=> b!1111983 (=> (not res!742047) (not e!634034))))

(declare-datatypes ((List!24274 0))(
  ( (Nil!24271) (Cons!24270 (h!25479 (_ BitVec 64)) (t!34743 List!24274)) )
))
(declare-fun arrayNoDuplicates!0 (array!72279 (_ BitVec 32) List!24274) Bool)

(assert (=> b!1111983 (= res!742047 (arrayNoDuplicates!0 lt!496440 #b00000000000000000000000000000000 Nil!24271))))

(declare-fun b!1111984 () Bool)

(declare-fun res!742045 () Bool)

(assert (=> b!1111984 (=> (not res!742045) (not e!634028))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1111984 (= res!742045 (= (select (arr!34792 _keys!1208) i!673) k!934))))

(declare-fun b!1111985 () Bool)

(declare-fun res!742052 () Bool)

(assert (=> b!1111985 (=> (not res!742052) (not e!634028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111985 (= res!742052 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43342 () Bool)

(declare-fun mapRes!43342 () Bool)

(assert (=> mapIsEmpty!43342 mapRes!43342))

(declare-fun b!1111986 () Bool)

(declare-fun e!634035 () Bool)

(declare-fun e!634032 () Bool)

(assert (=> b!1111986 (= e!634035 (and e!634032 mapRes!43342))))

(declare-fun condMapEmpty!43342 () Bool)

(declare-fun mapDefault!43342 () ValueCell!13132)

