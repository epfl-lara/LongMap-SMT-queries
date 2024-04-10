; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97764 () Bool)

(assert start!97764)

(declare-fun b_free!23465 () Bool)

(declare-fun b_next!23465 () Bool)

(assert (=> start!97764 (= b_free!23465 (not b_next!23465))))

(declare-fun tp!83099 () Bool)

(declare-fun b_and!37739 () Bool)

(assert (=> start!97764 (= tp!83099 b_and!37739)))

(declare-fun mapIsEmpty!43810 () Bool)

(declare-fun mapRes!43810 () Bool)

(assert (=> mapIsEmpty!43810 mapRes!43810))

(declare-fun b!1118181 () Bool)

(declare-fun e!636923 () Bool)

(declare-fun e!636921 () Bool)

(assert (=> b!1118181 (= e!636923 e!636921)))

(declare-fun res!746789 () Bool)

(assert (=> b!1118181 (=> (not res!746789) (not e!636921))))

(declare-datatypes ((array!72881 0))(
  ( (array!72882 (arr!35093 (Array (_ BitVec 32) (_ BitVec 64))) (size!35629 (_ BitVec 32))) )
))
(declare-fun lt!497441 () array!72881)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72881 (_ BitVec 32)) Bool)

(assert (=> b!1118181 (= res!746789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497441 mask!1564))))

(declare-fun _keys!1208 () array!72881)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118181 (= lt!497441 (array!72882 (store (arr!35093 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35629 _keys!1208)))))

(declare-fun b!1118182 () Bool)

(declare-fun e!636922 () Bool)

(declare-fun tp_is_empty!27995 () Bool)

(assert (=> b!1118182 (= e!636922 tp_is_empty!27995)))

(declare-fun b!1118183 () Bool)

(declare-fun res!746797 () Bool)

(assert (=> b!1118183 (=> (not res!746797) (not e!636921))))

(declare-datatypes ((List!24410 0))(
  ( (Nil!24407) (Cons!24406 (h!25615 (_ BitVec 64)) (t!34891 List!24410)) )
))
(declare-fun arrayNoDuplicates!0 (array!72881 (_ BitVec 32) List!24410) Bool)

(assert (=> b!1118183 (= res!746797 (arrayNoDuplicates!0 lt!497441 #b00000000000000000000000000000000 Nil!24407))))

(declare-fun b!1118184 () Bool)

(declare-fun res!746788 () Bool)

(assert (=> b!1118184 (=> (not res!746788) (not e!636923))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1118184 (= res!746788 (= (select (arr!35093 _keys!1208) i!673) k!934))))

(declare-fun b!1118185 () Bool)

(declare-fun res!746792 () Bool)

(assert (=> b!1118185 (=> (not res!746792) (not e!636923))))

(assert (=> b!1118185 (= res!746792 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35629 _keys!1208))))))

(declare-fun b!1118186 () Bool)

(declare-fun e!636919 () Bool)

(assert (=> b!1118186 (= e!636919 true)))

(declare-datatypes ((V!42453 0))(
  ( (V!42454 (val!14054 Int)) )
))
(declare-fun zeroValue!944 () V!42453)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17624 0))(
  ( (tuple2!17625 (_1!8823 (_ BitVec 64)) (_2!8823 V!42453)) )
))
(declare-datatypes ((List!24411 0))(
  ( (Nil!24408) (Cons!24407 (h!25616 tuple2!17624) (t!34892 List!24411)) )
))
(declare-datatypes ((ListLongMap!15593 0))(
  ( (ListLongMap!15594 (toList!7812 List!24411)) )
))
(declare-fun lt!497440 () ListLongMap!15593)

(declare-datatypes ((ValueCell!13288 0))(
  ( (ValueCellFull!13288 (v!16687 V!42453)) (EmptyCell!13288) )
))
(declare-datatypes ((array!72883 0))(
  ( (array!72884 (arr!35094 (Array (_ BitVec 32) ValueCell!13288)) (size!35630 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72883)

(declare-fun minValue!944 () V!42453)

(declare-fun getCurrentListMapNoExtraKeys!4302 (array!72881 array!72883 (_ BitVec 32) (_ BitVec 32) V!42453 V!42453 (_ BitVec 32) Int) ListLongMap!15593)

(assert (=> b!1118186 (= lt!497440 (getCurrentListMapNoExtraKeys!4302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118187 () Bool)

(declare-fun e!636918 () Bool)

(assert (=> b!1118187 (= e!636918 tp_is_empty!27995)))

(declare-fun b!1118188 () Bool)

(declare-fun res!746791 () Bool)

(assert (=> b!1118188 (=> (not res!746791) (not e!636923))))

(assert (=> b!1118188 (= res!746791 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24407))))

(declare-fun b!1118189 () Bool)

(declare-fun res!746787 () Bool)

(assert (=> b!1118189 (=> (not res!746787) (not e!636923))))

(assert (=> b!1118189 (= res!746787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118190 () Bool)

(assert (=> b!1118190 (= e!636921 (not e!636919))))

(declare-fun res!746793 () Bool)

(assert (=> b!1118190 (=> res!746793 e!636919)))

(assert (=> b!1118190 (= res!746793 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118190 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36698 0))(
  ( (Unit!36699) )
))
(declare-fun lt!497439 () Unit!36698)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72881 (_ BitVec 64) (_ BitVec 32)) Unit!36698)

(assert (=> b!1118190 (= lt!497439 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1118180 () Bool)

(declare-fun res!746796 () Bool)

(assert (=> b!1118180 (=> (not res!746796) (not e!636923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118180 (= res!746796 (validKeyInArray!0 k!934))))

(declare-fun res!746790 () Bool)

(assert (=> start!97764 (=> (not res!746790) (not e!636923))))

(assert (=> start!97764 (= res!746790 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35629 _keys!1208))))))

(assert (=> start!97764 e!636923))

(assert (=> start!97764 tp_is_empty!27995))

(declare-fun array_inv!26962 (array!72881) Bool)

(assert (=> start!97764 (array_inv!26962 _keys!1208)))

(assert (=> start!97764 true))

(assert (=> start!97764 tp!83099))

(declare-fun e!636920 () Bool)

(declare-fun array_inv!26963 (array!72883) Bool)

(assert (=> start!97764 (and (array_inv!26963 _values!996) e!636920)))

(declare-fun b!1118191 () Bool)

(declare-fun res!746794 () Bool)

(assert (=> b!1118191 (=> (not res!746794) (not e!636923))))

(assert (=> b!1118191 (= res!746794 (and (= (size!35630 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35629 _keys!1208) (size!35630 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118192 () Bool)

(assert (=> b!1118192 (= e!636920 (and e!636918 mapRes!43810))))

(declare-fun condMapEmpty!43810 () Bool)

(declare-fun mapDefault!43810 () ValueCell!13288)

