; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97346 () Bool)

(assert start!97346)

(declare-fun b_free!23317 () Bool)

(declare-fun b_next!23317 () Bool)

(assert (=> start!97346 (= b_free!23317 (not b_next!23317))))

(declare-fun tp!82249 () Bool)

(declare-fun b_and!37469 () Bool)

(assert (=> start!97346 (= tp!82249 b_and!37469)))

(declare-fun b!1109319 () Bool)

(declare-fun e!632757 () Bool)

(assert (=> b!1109319 (= e!632757 true)))

(declare-fun e!632752 () Bool)

(assert (=> b!1109319 e!632752))

(declare-fun c!109167 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109319 (= c!109167 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41897 0))(
  ( (V!41898 (val!13845 Int)) )
))
(declare-fun zeroValue!944 () V!41897)

(declare-datatypes ((array!72071 0))(
  ( (array!72072 (arr!34688 (Array (_ BitVec 32) (_ BitVec 64))) (size!35224 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72071)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36408 0))(
  ( (Unit!36409) )
))
(declare-fun lt!495963 () Unit!36408)

(declare-fun minValue!944 () V!41897)

(declare-datatypes ((ValueCell!13079 0))(
  ( (ValueCellFull!13079 (v!16478 V!41897)) (EmptyCell!13079) )
))
(declare-datatypes ((array!72073 0))(
  ( (array!72074 (arr!34689 (Array (_ BitVec 32) ValueCell!13079)) (size!35225 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72073)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!273 (array!72071 array!72073 (_ BitVec 32) (_ BitVec 32) V!41897 V!41897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36408)

(assert (=> b!1109319 (= lt!495963 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!273 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109320 () Bool)

(declare-fun e!632754 () Bool)

(assert (=> b!1109320 (= e!632754 (not e!632757))))

(declare-fun res!740301 () Bool)

(assert (=> b!1109320 (=> res!740301 e!632757)))

(assert (=> b!1109320 (= res!740301 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35224 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109320 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!495965 () Unit!36408)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72071 (_ BitVec 64) (_ BitVec 32)) Unit!36408)

(assert (=> b!1109320 (= lt!495965 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!740304 () Bool)

(declare-fun e!632750 () Bool)

(assert (=> start!97346 (=> (not res!740304) (not e!632750))))

(assert (=> start!97346 (= res!740304 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35224 _keys!1208))))))

(assert (=> start!97346 e!632750))

(declare-fun tp_is_empty!27577 () Bool)

(assert (=> start!97346 tp_is_empty!27577))

(declare-fun array_inv!26694 (array!72071) Bool)

(assert (=> start!97346 (array_inv!26694 _keys!1208)))

(assert (=> start!97346 true))

(assert (=> start!97346 tp!82249))

(declare-fun e!632753 () Bool)

(declare-fun array_inv!26695 (array!72073) Bool)

(assert (=> start!97346 (and (array_inv!26695 _values!996) e!632753)))

(declare-fun b!1109321 () Bool)

(declare-fun res!740296 () Bool)

(assert (=> b!1109321 (=> (not res!740296) (not e!632750))))

(assert (=> b!1109321 (= res!740296 (= (select (arr!34688 _keys!1208) i!673) k!934))))

(declare-fun b!1109322 () Bool)

(declare-fun res!740295 () Bool)

(assert (=> b!1109322 (=> (not res!740295) (not e!632750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72071 (_ BitVec 32)) Bool)

(assert (=> b!1109322 (= res!740295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109323 () Bool)

(declare-fun e!632751 () Bool)

(declare-fun mapRes!43183 () Bool)

(assert (=> b!1109323 (= e!632753 (and e!632751 mapRes!43183))))

(declare-fun condMapEmpty!43183 () Bool)

(declare-fun mapDefault!43183 () ValueCell!13079)

