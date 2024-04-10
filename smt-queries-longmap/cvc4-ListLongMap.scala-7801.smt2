; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97554 () Bool)

(assert start!97554)

(declare-fun b!1114041 () Bool)

(declare-fun e!634989 () Bool)

(declare-fun e!634988 () Bool)

(assert (=> b!1114041 (= e!634989 e!634988)))

(declare-fun res!743595 () Bool)

(assert (=> b!1114041 (=> (not res!743595) (not e!634988))))

(declare-datatypes ((array!72477 0))(
  ( (array!72478 (arr!34891 (Array (_ BitVec 32) (_ BitVec 64))) (size!35427 (_ BitVec 32))) )
))
(declare-fun lt!496765 () array!72477)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72477 (_ BitVec 32)) Bool)

(assert (=> b!1114041 (= res!743595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496765 mask!1564))))

(declare-fun _keys!1208 () array!72477)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114041 (= lt!496765 (array!72478 (store (arr!34891 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35427 _keys!1208)))))

(declare-fun b!1114042 () Bool)

(declare-fun e!634985 () Bool)

(declare-fun tp_is_empty!27785 () Bool)

(assert (=> b!1114042 (= e!634985 tp_is_empty!27785)))

(declare-fun b!1114043 () Bool)

(assert (=> b!1114043 (= e!634988 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114043 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36564 0))(
  ( (Unit!36565) )
))
(declare-fun lt!496766 () Unit!36564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72477 (_ BitVec 64) (_ BitVec 32)) Unit!36564)

(assert (=> b!1114043 (= lt!496766 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1114044 () Bool)

(declare-fun res!743598 () Bool)

(assert (=> b!1114044 (=> (not res!743598) (not e!634988))))

(declare-datatypes ((List!24321 0))(
  ( (Nil!24318) (Cons!24317 (h!25526 (_ BitVec 64)) (t!34802 List!24321)) )
))
(declare-fun arrayNoDuplicates!0 (array!72477 (_ BitVec 32) List!24321) Bool)

(assert (=> b!1114044 (= res!743598 (arrayNoDuplicates!0 lt!496765 #b00000000000000000000000000000000 Nil!24318))))

(declare-fun b!1114045 () Bool)

(declare-fun res!743602 () Bool)

(assert (=> b!1114045 (=> (not res!743602) (not e!634989))))

(assert (=> b!1114045 (= res!743602 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24318))))

(declare-fun b!1114046 () Bool)

(declare-fun res!743596 () Bool)

(assert (=> b!1114046 (=> (not res!743596) (not e!634989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114046 (= res!743596 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43495 () Bool)

(declare-fun mapRes!43495 () Bool)

(declare-fun tp!82739 () Bool)

(declare-fun e!634984 () Bool)

(assert (=> mapNonEmpty!43495 (= mapRes!43495 (and tp!82739 e!634984))))

(declare-fun mapKey!43495 () (_ BitVec 32))

(declare-datatypes ((V!42173 0))(
  ( (V!42174 (val!13949 Int)) )
))
(declare-datatypes ((ValueCell!13183 0))(
  ( (ValueCellFull!13183 (v!16582 V!42173)) (EmptyCell!13183) )
))
(declare-fun mapRest!43495 () (Array (_ BitVec 32) ValueCell!13183))

(declare-fun mapValue!43495 () ValueCell!13183)

(declare-datatypes ((array!72479 0))(
  ( (array!72480 (arr!34892 (Array (_ BitVec 32) ValueCell!13183)) (size!35428 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72479)

(assert (=> mapNonEmpty!43495 (= (arr!34892 _values!996) (store mapRest!43495 mapKey!43495 mapValue!43495))))

(declare-fun res!743593 () Bool)

(assert (=> start!97554 (=> (not res!743593) (not e!634989))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97554 (= res!743593 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35427 _keys!1208))))))

(assert (=> start!97554 e!634989))

(declare-fun array_inv!26820 (array!72477) Bool)

(assert (=> start!97554 (array_inv!26820 _keys!1208)))

(assert (=> start!97554 true))

(declare-fun e!634987 () Bool)

(declare-fun array_inv!26821 (array!72479) Bool)

(assert (=> start!97554 (and (array_inv!26821 _values!996) e!634987)))

(declare-fun b!1114047 () Bool)

(assert (=> b!1114047 (= e!634984 tp_is_empty!27785)))

(declare-fun b!1114048 () Bool)

(declare-fun res!743597 () Bool)

(assert (=> b!1114048 (=> (not res!743597) (not e!634989))))

(assert (=> b!1114048 (= res!743597 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35427 _keys!1208))))))

(declare-fun b!1114049 () Bool)

(declare-fun res!743594 () Bool)

(assert (=> b!1114049 (=> (not res!743594) (not e!634989))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114049 (= res!743594 (and (= (size!35428 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35427 _keys!1208) (size!35428 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114050 () Bool)

(declare-fun res!743601 () Bool)

(assert (=> b!1114050 (=> (not res!743601) (not e!634989))))

(assert (=> b!1114050 (= res!743601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114051 () Bool)

(declare-fun res!743600 () Bool)

(assert (=> b!1114051 (=> (not res!743600) (not e!634989))))

(assert (=> b!1114051 (= res!743600 (= (select (arr!34891 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43495 () Bool)

(assert (=> mapIsEmpty!43495 mapRes!43495))

(declare-fun b!1114052 () Bool)

(declare-fun res!743599 () Bool)

(assert (=> b!1114052 (=> (not res!743599) (not e!634989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114052 (= res!743599 (validMask!0 mask!1564))))

(declare-fun b!1114053 () Bool)

(assert (=> b!1114053 (= e!634987 (and e!634985 mapRes!43495))))

(declare-fun condMapEmpty!43495 () Bool)

(declare-fun mapDefault!43495 () ValueCell!13183)

