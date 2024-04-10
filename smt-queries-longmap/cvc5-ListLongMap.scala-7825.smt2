; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97694 () Bool)

(assert start!97694)

(declare-fun b!1116771 () Bool)

(declare-fun e!636246 () Bool)

(assert (=> b!1116771 (= e!636246 (not true))))

(declare-datatypes ((array!72747 0))(
  ( (array!72748 (arr!35026 (Array (_ BitVec 32) (_ BitVec 64))) (size!35562 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72747)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116771 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36648 0))(
  ( (Unit!36649) )
))
(declare-fun lt!497185 () Unit!36648)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72747 (_ BitVec 64) (_ BitVec 32)) Unit!36648)

(assert (=> b!1116771 (= lt!497185 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1116772 () Bool)

(declare-fun res!745699 () Bool)

(declare-fun e!636245 () Bool)

(assert (=> b!1116772 (=> (not res!745699) (not e!636245))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116772 (= res!745699 (validMask!0 mask!1564))))

(declare-fun b!1116773 () Bool)

(declare-fun res!745694 () Bool)

(assert (=> b!1116773 (=> (not res!745694) (not e!636245))))

(assert (=> b!1116773 (= res!745694 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35562 _keys!1208))))))

(declare-fun b!1116774 () Bool)

(declare-fun res!745701 () Bool)

(assert (=> b!1116774 (=> (not res!745701) (not e!636246))))

(declare-fun lt!497186 () array!72747)

(declare-datatypes ((List!24375 0))(
  ( (Nil!24372) (Cons!24371 (h!25580 (_ BitVec 64)) (t!34856 List!24375)) )
))
(declare-fun arrayNoDuplicates!0 (array!72747 (_ BitVec 32) List!24375) Bool)

(assert (=> b!1116774 (= res!745701 (arrayNoDuplicates!0 lt!497186 #b00000000000000000000000000000000 Nil!24372))))

(declare-fun b!1116775 () Bool)

(declare-fun res!745698 () Bool)

(assert (=> b!1116775 (=> (not res!745698) (not e!636245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116775 (= res!745698 (validKeyInArray!0 k!934))))

(declare-fun b!1116776 () Bool)

(declare-fun res!745693 () Bool)

(assert (=> b!1116776 (=> (not res!745693) (not e!636245))))

(assert (=> b!1116776 (= res!745693 (= (select (arr!35026 _keys!1208) i!673) k!934))))

(declare-fun b!1116777 () Bool)

(assert (=> b!1116777 (= e!636245 e!636246)))

(declare-fun res!745702 () Bool)

(assert (=> b!1116777 (=> (not res!745702) (not e!636246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72747 (_ BitVec 32)) Bool)

(assert (=> b!1116777 (= res!745702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497186 mask!1564))))

(assert (=> b!1116777 (= lt!497186 (array!72748 (store (arr!35026 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35562 _keys!1208)))))

(declare-fun b!1116778 () Bool)

(declare-fun res!745700 () Bool)

(assert (=> b!1116778 (=> (not res!745700) (not e!636245))))

(assert (=> b!1116778 (= res!745700 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24372))))

(declare-fun b!1116779 () Bool)

(declare-fun res!745696 () Bool)

(assert (=> b!1116779 (=> (not res!745696) (not e!636245))))

(assert (=> b!1116779 (= res!745696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116780 () Bool)

(declare-fun e!636249 () Bool)

(declare-fun tp_is_empty!27925 () Bool)

(assert (=> b!1116780 (= e!636249 tp_is_empty!27925)))

(declare-fun b!1116781 () Bool)

(declare-fun e!636247 () Bool)

(assert (=> b!1116781 (= e!636247 tp_is_empty!27925)))

(declare-fun mapIsEmpty!43705 () Bool)

(declare-fun mapRes!43705 () Bool)

(assert (=> mapIsEmpty!43705 mapRes!43705))

(declare-fun res!745697 () Bool)

(assert (=> start!97694 (=> (not res!745697) (not e!636245))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97694 (= res!745697 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35562 _keys!1208))))))

(assert (=> start!97694 e!636245))

(declare-fun array_inv!26920 (array!72747) Bool)

(assert (=> start!97694 (array_inv!26920 _keys!1208)))

(assert (=> start!97694 true))

(declare-datatypes ((V!42361 0))(
  ( (V!42362 (val!14019 Int)) )
))
(declare-datatypes ((ValueCell!13253 0))(
  ( (ValueCellFull!13253 (v!16652 V!42361)) (EmptyCell!13253) )
))
(declare-datatypes ((array!72749 0))(
  ( (array!72750 (arr!35027 (Array (_ BitVec 32) ValueCell!13253)) (size!35563 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72749)

(declare-fun e!636248 () Bool)

(declare-fun array_inv!26921 (array!72749) Bool)

(assert (=> start!97694 (and (array_inv!26921 _values!996) e!636248)))

(declare-fun mapNonEmpty!43705 () Bool)

(declare-fun tp!82949 () Bool)

(assert (=> mapNonEmpty!43705 (= mapRes!43705 (and tp!82949 e!636249))))

(declare-fun mapValue!43705 () ValueCell!13253)

(declare-fun mapRest!43705 () (Array (_ BitVec 32) ValueCell!13253))

(declare-fun mapKey!43705 () (_ BitVec 32))

(assert (=> mapNonEmpty!43705 (= (arr!35027 _values!996) (store mapRest!43705 mapKey!43705 mapValue!43705))))

(declare-fun b!1116782 () Bool)

(declare-fun res!745695 () Bool)

(assert (=> b!1116782 (=> (not res!745695) (not e!636245))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116782 (= res!745695 (and (= (size!35563 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35562 _keys!1208) (size!35563 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116783 () Bool)

(assert (=> b!1116783 (= e!636248 (and e!636247 mapRes!43705))))

(declare-fun condMapEmpty!43705 () Bool)

(declare-fun mapDefault!43705 () ValueCell!13253)

