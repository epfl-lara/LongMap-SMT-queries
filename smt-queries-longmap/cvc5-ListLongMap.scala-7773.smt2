; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97382 () Bool)

(assert start!97382)

(declare-fun b_free!23353 () Bool)

(declare-fun b_next!23353 () Bool)

(assert (=> start!97382 (= b_free!23353 (not b_next!23353))))

(declare-fun tp!82358 () Bool)

(declare-fun b_and!37541 () Bool)

(assert (=> start!97382 (= tp!82358 b_and!37541)))

(declare-fun b!1110219 () Bool)

(declare-fun res!740891 () Bool)

(declare-fun e!633189 () Bool)

(assert (=> b!1110219 (=> (not res!740891) (not e!633189))))

(declare-datatypes ((array!72143 0))(
  ( (array!72144 (arr!34724 (Array (_ BitVec 32) (_ BitVec 64))) (size!35260 (_ BitVec 32))) )
))
(declare-fun lt!496125 () array!72143)

(declare-datatypes ((List!24214 0))(
  ( (Nil!24211) (Cons!24210 (h!25419 (_ BitVec 64)) (t!34613 List!24214)) )
))
(declare-fun arrayNoDuplicates!0 (array!72143 (_ BitVec 32) List!24214) Bool)

(assert (=> b!1110219 (= res!740891 (arrayNoDuplicates!0 lt!496125 #b00000000000000000000000000000000 Nil!24211))))

(declare-fun b!1110220 () Bool)

(declare-fun e!633184 () Bool)

(assert (=> b!1110220 (= e!633184 e!633189)))

(declare-fun res!740895 () Bool)

(assert (=> b!1110220 (=> (not res!740895) (not e!633189))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72143 (_ BitVec 32)) Bool)

(assert (=> b!1110220 (= res!740895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496125 mask!1564))))

(declare-fun _keys!1208 () array!72143)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110220 (= lt!496125 (array!72144 (store (arr!34724 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35260 _keys!1208)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46752 () Bool)

(declare-datatypes ((V!41945 0))(
  ( (V!41946 (val!13863 Int)) )
))
(declare-datatypes ((ValueCell!13097 0))(
  ( (ValueCellFull!13097 (v!16496 V!41945)) (EmptyCell!13097) )
))
(declare-datatypes ((array!72145 0))(
  ( (array!72146 (arr!34725 (Array (_ BitVec 32) ValueCell!13097)) (size!35261 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72145)

(declare-fun minValue!944 () V!41945)

(declare-fun zeroValue!944 () V!41945)

(declare-datatypes ((tuple2!17530 0))(
  ( (tuple2!17531 (_1!8776 (_ BitVec 64)) (_2!8776 V!41945)) )
))
(declare-datatypes ((List!24215 0))(
  ( (Nil!24212) (Cons!24211 (h!25420 tuple2!17530) (t!34614 List!24215)) )
))
(declare-datatypes ((ListLongMap!15499 0))(
  ( (ListLongMap!15500 (toList!7765 List!24215)) )
))
(declare-fun call!46755 () ListLongMap!15499)

(declare-fun getCurrentListMapNoExtraKeys!4259 (array!72143 array!72145 (_ BitVec 32) (_ BitVec 32) V!41945 V!41945 (_ BitVec 32) Int) ListLongMap!15499)

(declare-fun dynLambda!2387 (Int (_ BitVec 64)) V!41945)

(assert (=> bm!46752 (= call!46755 (getCurrentListMapNoExtraKeys!4259 lt!496125 (array!72146 (store (arr!34725 _values!996) i!673 (ValueCellFull!13097 (dynLambda!2387 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35261 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!633186 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!46756 () ListLongMap!15499)

(declare-fun b!1110222 () Bool)

(declare-fun -!1038 (ListLongMap!15499 (_ BitVec 64)) ListLongMap!15499)

(assert (=> b!1110222 (= e!633186 (= call!46755 (-!1038 call!46756 k!934)))))

(declare-fun b!1110223 () Bool)

(declare-fun res!740894 () Bool)

(assert (=> b!1110223 (=> (not res!740894) (not e!633184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110223 (= res!740894 (validKeyInArray!0 k!934))))

(declare-fun b!1110224 () Bool)

(declare-fun res!740890 () Bool)

(assert (=> b!1110224 (=> (not res!740890) (not e!633184))))

(assert (=> b!1110224 (= res!740890 (= (select (arr!34724 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!43237 () Bool)

(declare-fun mapRes!43237 () Bool)

(declare-fun tp!82357 () Bool)

(declare-fun e!633182 () Bool)

(assert (=> mapNonEmpty!43237 (= mapRes!43237 (and tp!82357 e!633182))))

(declare-fun mapValue!43237 () ValueCell!13097)

(declare-fun mapRest!43237 () (Array (_ BitVec 32) ValueCell!13097))

(declare-fun mapKey!43237 () (_ BitVec 32))

(assert (=> mapNonEmpty!43237 (= (arr!34725 _values!996) (store mapRest!43237 mapKey!43237 mapValue!43237))))

(declare-fun b!1110225 () Bool)

(declare-fun res!740899 () Bool)

(assert (=> b!1110225 (=> (not res!740899) (not e!633184))))

(assert (=> b!1110225 (= res!740899 (and (= (size!35261 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35260 _keys!1208) (size!35261 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43237 () Bool)

(assert (=> mapIsEmpty!43237 mapRes!43237))

(declare-fun b!1110226 () Bool)

(declare-fun res!740889 () Bool)

(assert (=> b!1110226 (=> (not res!740889) (not e!633184))))

(assert (=> b!1110226 (= res!740889 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24211))))

(declare-fun b!1110227 () Bool)

(declare-fun res!740896 () Bool)

(assert (=> b!1110227 (=> (not res!740896) (not e!633184))))

(assert (=> b!1110227 (= res!740896 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35260 _keys!1208))))))

(declare-fun b!1110228 () Bool)

(declare-fun e!633183 () Bool)

(declare-fun e!633188 () Bool)

(assert (=> b!1110228 (= e!633183 (and e!633188 mapRes!43237))))

(declare-fun condMapEmpty!43237 () Bool)

(declare-fun mapDefault!43237 () ValueCell!13097)

