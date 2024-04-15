; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97658 () Bool)

(assert start!97658)

(declare-fun res!745177 () Bool)

(declare-fun e!635895 () Bool)

(assert (=> start!97658 (=> (not res!745177) (not e!635895))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72588 0))(
  ( (array!72589 (arr!34947 (Array (_ BitVec 32) (_ BitVec 64))) (size!35485 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72588)

(assert (=> start!97658 (= res!745177 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35485 _keys!1208))))))

(assert (=> start!97658 e!635895))

(declare-fun array_inv!26928 (array!72588) Bool)

(assert (=> start!97658 (array_inv!26928 _keys!1208)))

(assert (=> start!97658 true))

(declare-datatypes ((V!42321 0))(
  ( (V!42322 (val!14004 Int)) )
))
(declare-datatypes ((ValueCell!13238 0))(
  ( (ValueCellFull!13238 (v!16636 V!42321)) (EmptyCell!13238) )
))
(declare-datatypes ((array!72590 0))(
  ( (array!72591 (arr!34948 (Array (_ BitVec 32) ValueCell!13238)) (size!35486 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72590)

(declare-fun e!635893 () Bool)

(declare-fun array_inv!26929 (array!72590) Bool)

(assert (=> start!97658 (and (array_inv!26929 _values!996) e!635893)))

(declare-fun b!1116057 () Bool)

(declare-fun res!745180 () Bool)

(assert (=> b!1116057 (=> (not res!745180) (not e!635895))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116057 (= res!745180 (= (select (arr!34947 _keys!1208) i!673) k0!934))))

(declare-fun b!1116058 () Bool)

(declare-fun e!635894 () Bool)

(declare-fun tp_is_empty!27895 () Bool)

(assert (=> b!1116058 (= e!635894 tp_is_empty!27895)))

(declare-fun mapNonEmpty!43660 () Bool)

(declare-fun mapRes!43660 () Bool)

(declare-fun tp!82904 () Bool)

(declare-fun e!635896 () Bool)

(assert (=> mapNonEmpty!43660 (= mapRes!43660 (and tp!82904 e!635896))))

(declare-fun mapValue!43660 () ValueCell!13238)

(declare-fun mapRest!43660 () (Array (_ BitVec 32) ValueCell!13238))

(declare-fun mapKey!43660 () (_ BitVec 32))

(assert (=> mapNonEmpty!43660 (= (arr!34948 _values!996) (store mapRest!43660 mapKey!43660 mapValue!43660))))

(declare-fun b!1116059 () Bool)

(declare-fun res!745182 () Bool)

(declare-fun e!635898 () Bool)

(assert (=> b!1116059 (=> (not res!745182) (not e!635898))))

(declare-fun lt!496895 () array!72588)

(declare-datatypes ((List!24396 0))(
  ( (Nil!24393) (Cons!24392 (h!25601 (_ BitVec 64)) (t!34868 List!24396)) )
))
(declare-fun arrayNoDuplicates!0 (array!72588 (_ BitVec 32) List!24396) Bool)

(assert (=> b!1116059 (= res!745182 (arrayNoDuplicates!0 lt!496895 #b00000000000000000000000000000000 Nil!24393))))

(declare-fun b!1116060 () Bool)

(declare-fun res!745175 () Bool)

(assert (=> b!1116060 (=> (not res!745175) (not e!635895))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116060 (= res!745175 (validMask!0 mask!1564))))

(declare-fun b!1116061 () Bool)

(assert (=> b!1116061 (= e!635896 tp_is_empty!27895)))

(declare-fun mapIsEmpty!43660 () Bool)

(assert (=> mapIsEmpty!43660 mapRes!43660))

(declare-fun b!1116062 () Bool)

(declare-fun res!745176 () Bool)

(assert (=> b!1116062 (=> (not res!745176) (not e!635895))))

(assert (=> b!1116062 (= res!745176 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35485 _keys!1208))))))

(declare-fun b!1116063 () Bool)

(assert (=> b!1116063 (= e!635893 (and e!635894 mapRes!43660))))

(declare-fun condMapEmpty!43660 () Bool)

(declare-fun mapDefault!43660 () ValueCell!13238)

(assert (=> b!1116063 (= condMapEmpty!43660 (= (arr!34948 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13238)) mapDefault!43660)))))

(declare-fun b!1116064 () Bool)

(declare-fun res!745178 () Bool)

(assert (=> b!1116064 (=> (not res!745178) (not e!635895))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116064 (= res!745178 (and (= (size!35486 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35485 _keys!1208) (size!35486 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116065 () Bool)

(declare-fun res!745174 () Bool)

(assert (=> b!1116065 (=> (not res!745174) (not e!635895))))

(assert (=> b!1116065 (= res!745174 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24393))))

(declare-fun b!1116066 () Bool)

(assert (=> b!1116066 (= e!635898 (not true))))

(declare-fun arrayContainsKey!0 (array!72588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116066 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36453 0))(
  ( (Unit!36454) )
))
(declare-fun lt!496896 () Unit!36453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72588 (_ BitVec 64) (_ BitVec 32)) Unit!36453)

(assert (=> b!1116066 (= lt!496896 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116067 () Bool)

(assert (=> b!1116067 (= e!635895 e!635898)))

(declare-fun res!745179 () Bool)

(assert (=> b!1116067 (=> (not res!745179) (not e!635898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72588 (_ BitVec 32)) Bool)

(assert (=> b!1116067 (= res!745179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496895 mask!1564))))

(assert (=> b!1116067 (= lt!496895 (array!72589 (store (arr!34947 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35485 _keys!1208)))))

(declare-fun b!1116068 () Bool)

(declare-fun res!745181 () Bool)

(assert (=> b!1116068 (=> (not res!745181) (not e!635895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116068 (= res!745181 (validKeyInArray!0 k0!934))))

(declare-fun b!1116069 () Bool)

(declare-fun res!745183 () Bool)

(assert (=> b!1116069 (=> (not res!745183) (not e!635895))))

(assert (=> b!1116069 (= res!745183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97658 res!745177) b!1116060))

(assert (= (and b!1116060 res!745175) b!1116064))

(assert (= (and b!1116064 res!745178) b!1116069))

(assert (= (and b!1116069 res!745183) b!1116065))

(assert (= (and b!1116065 res!745174) b!1116062))

(assert (= (and b!1116062 res!745176) b!1116068))

(assert (= (and b!1116068 res!745181) b!1116057))

(assert (= (and b!1116057 res!745180) b!1116067))

(assert (= (and b!1116067 res!745179) b!1116059))

(assert (= (and b!1116059 res!745182) b!1116066))

(assert (= (and b!1116063 condMapEmpty!43660) mapIsEmpty!43660))

(assert (= (and b!1116063 (not condMapEmpty!43660)) mapNonEmpty!43660))

(get-info :version)

(assert (= (and mapNonEmpty!43660 ((_ is ValueCellFull!13238) mapValue!43660)) b!1116061))

(assert (= (and b!1116063 ((_ is ValueCellFull!13238) mapDefault!43660)) b!1116058))

(assert (= start!97658 b!1116063))

(declare-fun m!1031853 () Bool)

(assert (=> mapNonEmpty!43660 m!1031853))

(declare-fun m!1031855 () Bool)

(assert (=> b!1116059 m!1031855))

(declare-fun m!1031857 () Bool)

(assert (=> b!1116068 m!1031857))

(declare-fun m!1031859 () Bool)

(assert (=> b!1116067 m!1031859))

(declare-fun m!1031861 () Bool)

(assert (=> b!1116067 m!1031861))

(declare-fun m!1031863 () Bool)

(assert (=> b!1116060 m!1031863))

(declare-fun m!1031865 () Bool)

(assert (=> b!1116057 m!1031865))

(declare-fun m!1031867 () Bool)

(assert (=> b!1116066 m!1031867))

(declare-fun m!1031869 () Bool)

(assert (=> b!1116066 m!1031869))

(declare-fun m!1031871 () Bool)

(assert (=> b!1116065 m!1031871))

(declare-fun m!1031873 () Bool)

(assert (=> b!1116069 m!1031873))

(declare-fun m!1031875 () Bool)

(assert (=> start!97658 m!1031875))

(declare-fun m!1031877 () Bool)

(assert (=> start!97658 m!1031877))

(check-sat (not b!1116060) (not b!1116067) (not b!1116066) tp_is_empty!27895 (not mapNonEmpty!43660) (not b!1116069) (not b!1116065) (not b!1116059) (not b!1116068) (not start!97658))
(check-sat)
