; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97788 () Bool)

(assert start!97788)

(declare-fun b_free!23489 () Bool)

(declare-fun b_next!23489 () Bool)

(assert (=> start!97788 (= b_free!23489 (not b_next!23489))))

(declare-fun tp!83171 () Bool)

(declare-fun b_and!37763 () Bool)

(assert (=> start!97788 (= tp!83171 b_and!37763)))

(declare-fun b!1118684 () Bool)

(declare-fun res!747184 () Bool)

(declare-fun e!637174 () Bool)

(assert (=> b!1118684 (=> (not res!747184) (not e!637174))))

(declare-datatypes ((array!72929 0))(
  ( (array!72930 (arr!35117 (Array (_ BitVec 32) (_ BitVec 64))) (size!35653 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72929)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72929 (_ BitVec 32)) Bool)

(assert (=> b!1118684 (= res!747184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118685 () Bool)

(declare-fun e!637172 () Bool)

(declare-fun tp_is_empty!28019 () Bool)

(assert (=> b!1118685 (= e!637172 tp_is_empty!28019)))

(declare-fun b!1118686 () Bool)

(declare-fun res!747192 () Bool)

(assert (=> b!1118686 (=> (not res!747192) (not e!637174))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1118686 (= res!747192 (= (select (arr!35117 _keys!1208) i!673) k!934))))

(declare-fun b!1118687 () Bool)

(declare-fun e!637170 () Bool)

(assert (=> b!1118687 (= e!637170 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!42485 0))(
  ( (V!42486 (val!14066 Int)) )
))
(declare-datatypes ((ValueCell!13300 0))(
  ( (ValueCellFull!13300 (v!16699 V!42485)) (EmptyCell!13300) )
))
(declare-datatypes ((array!72931 0))(
  ( (array!72932 (arr!35118 (Array (_ BitVec 32) ValueCell!13300)) (size!35654 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72931)

(declare-fun minValue!944 () V!42485)

(declare-datatypes ((tuple2!17646 0))(
  ( (tuple2!17647 (_1!8834 (_ BitVec 64)) (_2!8834 V!42485)) )
))
(declare-datatypes ((List!24432 0))(
  ( (Nil!24429) (Cons!24428 (h!25637 tuple2!17646) (t!34913 List!24432)) )
))
(declare-datatypes ((ListLongMap!15615 0))(
  ( (ListLongMap!15616 (toList!7823 List!24432)) )
))
(declare-fun lt!497547 () ListLongMap!15615)

(declare-fun zeroValue!944 () V!42485)

(declare-fun getCurrentListMapNoExtraKeys!4313 (array!72929 array!72931 (_ BitVec 32) (_ BitVec 32) V!42485 V!42485 (_ BitVec 32) Int) ListLongMap!15615)

(assert (=> b!1118687 (= lt!497547 (getCurrentListMapNoExtraKeys!4313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1118688 () Bool)

(declare-fun res!747189 () Bool)

(declare-fun e!637173 () Bool)

(assert (=> b!1118688 (=> (not res!747189) (not e!637173))))

(declare-fun lt!497548 () array!72929)

(declare-datatypes ((List!24433 0))(
  ( (Nil!24430) (Cons!24429 (h!25638 (_ BitVec 64)) (t!34914 List!24433)) )
))
(declare-fun arrayNoDuplicates!0 (array!72929 (_ BitVec 32) List!24433) Bool)

(assert (=> b!1118688 (= res!747189 (arrayNoDuplicates!0 lt!497548 #b00000000000000000000000000000000 Nil!24430))))

(declare-fun b!1118689 () Bool)

(declare-fun res!747188 () Bool)

(assert (=> b!1118689 (=> (not res!747188) (not e!637174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118689 (= res!747188 (validMask!0 mask!1564))))

(declare-fun res!747187 () Bool)

(assert (=> start!97788 (=> (not res!747187) (not e!637174))))

(assert (=> start!97788 (= res!747187 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35653 _keys!1208))))))

(assert (=> start!97788 e!637174))

(assert (=> start!97788 tp_is_empty!28019))

(declare-fun array_inv!26984 (array!72929) Bool)

(assert (=> start!97788 (array_inv!26984 _keys!1208)))

(assert (=> start!97788 true))

(assert (=> start!97788 tp!83171))

(declare-fun e!637176 () Bool)

(declare-fun array_inv!26985 (array!72931) Bool)

(assert (=> start!97788 (and (array_inv!26985 _values!996) e!637176)))

(declare-fun b!1118690 () Bool)

(declare-fun e!637175 () Bool)

(assert (=> b!1118690 (= e!637175 tp_is_empty!28019)))

(declare-fun b!1118691 () Bool)

(declare-fun res!747186 () Bool)

(assert (=> b!1118691 (=> (not res!747186) (not e!637174))))

(assert (=> b!1118691 (= res!747186 (and (= (size!35654 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35653 _keys!1208) (size!35654 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43846 () Bool)

(declare-fun mapRes!43846 () Bool)

(assert (=> mapIsEmpty!43846 mapRes!43846))

(declare-fun b!1118692 () Bool)

(assert (=> b!1118692 (= e!637173 (not e!637170))))

(declare-fun res!747190 () Bool)

(assert (=> b!1118692 (=> res!747190 e!637170)))

(assert (=> b!1118692 (= res!747190 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118692 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36716 0))(
  ( (Unit!36717) )
))
(declare-fun lt!497549 () Unit!36716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72929 (_ BitVec 64) (_ BitVec 32)) Unit!36716)

(assert (=> b!1118692 (= lt!497549 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1118693 () Bool)

(assert (=> b!1118693 (= e!637176 (and e!637172 mapRes!43846))))

(declare-fun condMapEmpty!43846 () Bool)

(declare-fun mapDefault!43846 () ValueCell!13300)

