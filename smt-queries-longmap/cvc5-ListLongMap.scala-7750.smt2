; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97244 () Bool)

(assert start!97244)

(declare-fun b!1106772 () Bool)

(declare-fun res!738626 () Bool)

(declare-fun e!631533 () Bool)

(assert (=> b!1106772 (=> (not res!738626) (not e!631533))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106772 (= res!738626 (validKeyInArray!0 k!934))))

(declare-fun b!1106773 () Bool)

(declare-fun res!738619 () Bool)

(assert (=> b!1106773 (=> (not res!738619) (not e!631533))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106773 (= res!738619 (validMask!0 mask!1564))))

(declare-fun b!1106774 () Bool)

(declare-fun e!631529 () Bool)

(declare-fun tp_is_empty!27475 () Bool)

(assert (=> b!1106774 (= e!631529 tp_is_empty!27475)))

(declare-fun b!1106775 () Bool)

(declare-fun res!738623 () Bool)

(assert (=> b!1106775 (=> (not res!738623) (not e!631533))))

(declare-datatypes ((array!71867 0))(
  ( (array!71868 (arr!34586 (Array (_ BitVec 32) (_ BitVec 64))) (size!35122 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71867)

(declare-datatypes ((List!24103 0))(
  ( (Nil!24100) (Cons!24099 (h!25308 (_ BitVec 64)) (t!34368 List!24103)) )
))
(declare-fun arrayNoDuplicates!0 (array!71867 (_ BitVec 32) List!24103) Bool)

(assert (=> b!1106775 (= res!738623 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24100))))

(declare-fun b!1106776 () Bool)

(declare-fun res!738621 () Bool)

(assert (=> b!1106776 (=> (not res!738621) (not e!631533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71867 (_ BitVec 32)) Bool)

(assert (=> b!1106776 (= res!738621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106777 () Bool)

(declare-fun res!738627 () Bool)

(assert (=> b!1106777 (=> (not res!738627) (not e!631533))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1106777 (= res!738627 (= (select (arr!34586 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!43030 () Bool)

(declare-fun mapRes!43030 () Bool)

(declare-fun tp!81950 () Bool)

(assert (=> mapNonEmpty!43030 (= mapRes!43030 (and tp!81950 e!631529))))

(declare-datatypes ((V!41761 0))(
  ( (V!41762 (val!13794 Int)) )
))
(declare-datatypes ((ValueCell!13028 0))(
  ( (ValueCellFull!13028 (v!16427 V!41761)) (EmptyCell!13028) )
))
(declare-fun mapValue!43030 () ValueCell!13028)

(declare-fun mapRest!43030 () (Array (_ BitVec 32) ValueCell!13028))

(declare-fun mapKey!43030 () (_ BitVec 32))

(declare-datatypes ((array!71869 0))(
  ( (array!71870 (arr!34587 (Array (_ BitVec 32) ValueCell!13028)) (size!35123 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71869)

(assert (=> mapNonEmpty!43030 (= (arr!34587 _values!996) (store mapRest!43030 mapKey!43030 mapValue!43030))))

(declare-fun b!1106778 () Bool)

(declare-fun res!738625 () Bool)

(declare-fun e!631530 () Bool)

(assert (=> b!1106778 (=> (not res!738625) (not e!631530))))

(declare-fun lt!495512 () array!71867)

(assert (=> b!1106778 (= res!738625 (arrayNoDuplicates!0 lt!495512 #b00000000000000000000000000000000 Nil!24100))))

(declare-fun b!1106779 () Bool)

(assert (=> b!1106779 (= e!631530 (not true))))

(declare-fun arrayContainsKey!0 (array!71867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106779 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36320 0))(
  ( (Unit!36321) )
))
(declare-fun lt!495511 () Unit!36320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71867 (_ BitVec 64) (_ BitVec 32)) Unit!36320)

(assert (=> b!1106779 (= lt!495511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1106780 () Bool)

(declare-fun res!738622 () Bool)

(assert (=> b!1106780 (=> (not res!738622) (not e!631533))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106780 (= res!738622 (and (= (size!35123 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35122 _keys!1208) (size!35123 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106781 () Bool)

(declare-fun e!631532 () Bool)

(declare-fun e!631528 () Bool)

(assert (=> b!1106781 (= e!631532 (and e!631528 mapRes!43030))))

(declare-fun condMapEmpty!43030 () Bool)

(declare-fun mapDefault!43030 () ValueCell!13028)

