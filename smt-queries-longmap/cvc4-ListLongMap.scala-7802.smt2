; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97560 () Bool)

(assert start!97560)

(declare-fun b!1114158 () Bool)

(declare-fun res!743688 () Bool)

(declare-fun e!635040 () Bool)

(assert (=> b!1114158 (=> (not res!743688) (not e!635040))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72489 0))(
  ( (array!72490 (arr!34897 (Array (_ BitVec 32) (_ BitVec 64))) (size!35433 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72489)

(assert (=> b!1114158 (= res!743688 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35433 _keys!1208))))))

(declare-fun mapIsEmpty!43504 () Bool)

(declare-fun mapRes!43504 () Bool)

(assert (=> mapIsEmpty!43504 mapRes!43504))

(declare-fun b!1114159 () Bool)

(declare-fun res!743685 () Bool)

(assert (=> b!1114159 (=> (not res!743685) (not e!635040))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72489 (_ BitVec 32)) Bool)

(assert (=> b!1114159 (= res!743685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114160 () Bool)

(declare-fun res!743690 () Bool)

(assert (=> b!1114160 (=> (not res!743690) (not e!635040))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1114160 (= res!743690 (= (select (arr!34897 _keys!1208) i!673) k!934))))

(declare-fun res!743692 () Bool)

(assert (=> start!97560 (=> (not res!743692) (not e!635040))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97560 (= res!743692 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35433 _keys!1208))))))

(assert (=> start!97560 e!635040))

(declare-fun array_inv!26826 (array!72489) Bool)

(assert (=> start!97560 (array_inv!26826 _keys!1208)))

(assert (=> start!97560 true))

(declare-datatypes ((V!42181 0))(
  ( (V!42182 (val!13952 Int)) )
))
(declare-datatypes ((ValueCell!13186 0))(
  ( (ValueCellFull!13186 (v!16585 V!42181)) (EmptyCell!13186) )
))
(declare-datatypes ((array!72491 0))(
  ( (array!72492 (arr!34898 (Array (_ BitVec 32) ValueCell!13186)) (size!35434 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72491)

(declare-fun e!635038 () Bool)

(declare-fun array_inv!26827 (array!72491) Bool)

(assert (=> start!97560 (and (array_inv!26827 _values!996) e!635038)))

(declare-fun b!1114161 () Bool)

(declare-fun res!743683 () Bool)

(assert (=> b!1114161 (=> (not res!743683) (not e!635040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114161 (= res!743683 (validKeyInArray!0 k!934))))

(declare-fun b!1114162 () Bool)

(declare-fun e!635043 () Bool)

(declare-fun tp_is_empty!27791 () Bool)

(assert (=> b!1114162 (= e!635043 tp_is_empty!27791)))

(declare-fun b!1114163 () Bool)

(declare-fun e!635041 () Bool)

(assert (=> b!1114163 (= e!635041 (not true))))

(declare-fun arrayContainsKey!0 (array!72489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114163 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36570 0))(
  ( (Unit!36571) )
))
(declare-fun lt!496783 () Unit!36570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72489 (_ BitVec 64) (_ BitVec 32)) Unit!36570)

(assert (=> b!1114163 (= lt!496783 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1114164 () Bool)

(declare-fun res!743689 () Bool)

(assert (=> b!1114164 (=> (not res!743689) (not e!635041))))

(declare-fun lt!496784 () array!72489)

(declare-datatypes ((List!24324 0))(
  ( (Nil!24321) (Cons!24320 (h!25529 (_ BitVec 64)) (t!34805 List!24324)) )
))
(declare-fun arrayNoDuplicates!0 (array!72489 (_ BitVec 32) List!24324) Bool)

(assert (=> b!1114164 (= res!743689 (arrayNoDuplicates!0 lt!496784 #b00000000000000000000000000000000 Nil!24321))))

(declare-fun b!1114165 () Bool)

(declare-fun e!635039 () Bool)

(assert (=> b!1114165 (= e!635039 tp_is_empty!27791)))

(declare-fun b!1114166 () Bool)

(declare-fun res!743686 () Bool)

(assert (=> b!1114166 (=> (not res!743686) (not e!635040))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114166 (= res!743686 (and (= (size!35434 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35433 _keys!1208) (size!35434 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43504 () Bool)

(declare-fun tp!82748 () Bool)

(assert (=> mapNonEmpty!43504 (= mapRes!43504 (and tp!82748 e!635039))))

(declare-fun mapKey!43504 () (_ BitVec 32))

(declare-fun mapValue!43504 () ValueCell!13186)

(declare-fun mapRest!43504 () (Array (_ BitVec 32) ValueCell!13186))

(assert (=> mapNonEmpty!43504 (= (arr!34898 _values!996) (store mapRest!43504 mapKey!43504 mapValue!43504))))

(declare-fun b!1114167 () Bool)

(assert (=> b!1114167 (= e!635040 e!635041)))

(declare-fun res!743691 () Bool)

(assert (=> b!1114167 (=> (not res!743691) (not e!635041))))

(assert (=> b!1114167 (= res!743691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496784 mask!1564))))

(assert (=> b!1114167 (= lt!496784 (array!72490 (store (arr!34897 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35433 _keys!1208)))))

(declare-fun b!1114168 () Bool)

(declare-fun res!743684 () Bool)

(assert (=> b!1114168 (=> (not res!743684) (not e!635040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114168 (= res!743684 (validMask!0 mask!1564))))

(declare-fun b!1114169 () Bool)

(assert (=> b!1114169 (= e!635038 (and e!635043 mapRes!43504))))

(declare-fun condMapEmpty!43504 () Bool)

(declare-fun mapDefault!43504 () ValueCell!13186)

