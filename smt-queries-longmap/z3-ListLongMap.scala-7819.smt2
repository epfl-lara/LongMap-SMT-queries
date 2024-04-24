; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97894 () Bool)

(assert start!97894)

(declare-fun b!1117396 () Bool)

(declare-fun res!745680 () Bool)

(declare-fun e!636778 () Bool)

(assert (=> b!1117396 (=> (not res!745680) (not e!636778))))

(declare-datatypes ((array!72717 0))(
  ( (array!72718 (arr!35005 (Array (_ BitVec 32) (_ BitVec 64))) (size!35542 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72717)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42313 0))(
  ( (V!42314 (val!14001 Int)) )
))
(declare-datatypes ((ValueCell!13235 0))(
  ( (ValueCellFull!13235 (v!16630 V!42313)) (EmptyCell!13235) )
))
(declare-datatypes ((array!72719 0))(
  ( (array!72720 (arr!35006 (Array (_ BitVec 32) ValueCell!13235)) (size!35543 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72719)

(assert (=> b!1117396 (= res!745680 (and (= (size!35543 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35542 _keys!1208) (size!35543 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117397 () Bool)

(declare-fun res!745678 () Bool)

(assert (=> b!1117397 (=> (not res!745678) (not e!636778))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117397 (= res!745678 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35542 _keys!1208))))))

(declare-fun b!1117398 () Bool)

(declare-fun res!745681 () Bool)

(assert (=> b!1117398 (=> (not res!745681) (not e!636778))))

(declare-datatypes ((List!24380 0))(
  ( (Nil!24377) (Cons!24376 (h!25594 (_ BitVec 64)) (t!34853 List!24380)) )
))
(declare-fun arrayNoDuplicates!0 (array!72717 (_ BitVec 32) List!24380) Bool)

(assert (=> b!1117398 (= res!745681 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24377))))

(declare-fun b!1117399 () Bool)

(declare-fun res!745676 () Bool)

(assert (=> b!1117399 (=> (not res!745676) (not e!636778))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117399 (= res!745676 (= (select (arr!35005 _keys!1208) i!673) k0!934))))

(declare-fun res!745683 () Bool)

(assert (=> start!97894 (=> (not res!745683) (not e!636778))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97894 (= res!745683 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35542 _keys!1208))))))

(assert (=> start!97894 e!636778))

(declare-fun array_inv!26968 (array!72717) Bool)

(assert (=> start!97894 (array_inv!26968 _keys!1208)))

(assert (=> start!97894 true))

(declare-fun e!636775 () Bool)

(declare-fun array_inv!26969 (array!72719) Bool)

(assert (=> start!97894 (and (array_inv!26969 _values!996) e!636775)))

(declare-fun b!1117400 () Bool)

(declare-fun res!745679 () Bool)

(assert (=> b!1117400 (=> (not res!745679) (not e!636778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72717 (_ BitVec 32)) Bool)

(assert (=> b!1117400 (= res!745679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43651 () Bool)

(declare-fun mapRes!43651 () Bool)

(declare-fun tp!82895 () Bool)

(declare-fun e!636777 () Bool)

(assert (=> mapNonEmpty!43651 (= mapRes!43651 (and tp!82895 e!636777))))

(declare-fun mapRest!43651 () (Array (_ BitVec 32) ValueCell!13235))

(declare-fun mapValue!43651 () ValueCell!13235)

(declare-fun mapKey!43651 () (_ BitVec 32))

(assert (=> mapNonEmpty!43651 (= (arr!35006 _values!996) (store mapRest!43651 mapKey!43651 mapValue!43651))))

(declare-fun mapIsEmpty!43651 () Bool)

(assert (=> mapIsEmpty!43651 mapRes!43651))

(declare-fun b!1117401 () Bool)

(declare-fun res!745684 () Bool)

(assert (=> b!1117401 (=> (not res!745684) (not e!636778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117401 (= res!745684 (validKeyInArray!0 k0!934))))

(declare-fun b!1117402 () Bool)

(declare-fun tp_is_empty!27889 () Bool)

(assert (=> b!1117402 (= e!636777 tp_is_empty!27889)))

(declare-fun b!1117403 () Bool)

(declare-fun e!636779 () Bool)

(assert (=> b!1117403 (= e!636779 (not true))))

(declare-fun arrayContainsKey!0 (array!72717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117403 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36597 0))(
  ( (Unit!36598) )
))
(declare-fun lt!497593 () Unit!36597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72717 (_ BitVec 64) (_ BitVec 32)) Unit!36597)

(assert (=> b!1117403 (= lt!497593 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117404 () Bool)

(assert (=> b!1117404 (= e!636778 e!636779)))

(declare-fun res!745677 () Bool)

(assert (=> b!1117404 (=> (not res!745677) (not e!636779))))

(declare-fun lt!497592 () array!72717)

(assert (=> b!1117404 (= res!745677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497592 mask!1564))))

(assert (=> b!1117404 (= lt!497592 (array!72718 (store (arr!35005 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35542 _keys!1208)))))

(declare-fun b!1117405 () Bool)

(declare-fun res!745675 () Bool)

(assert (=> b!1117405 (=> (not res!745675) (not e!636778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117405 (= res!745675 (validMask!0 mask!1564))))

(declare-fun b!1117406 () Bool)

(declare-fun e!636780 () Bool)

(assert (=> b!1117406 (= e!636775 (and e!636780 mapRes!43651))))

(declare-fun condMapEmpty!43651 () Bool)

(declare-fun mapDefault!43651 () ValueCell!13235)

(assert (=> b!1117406 (= condMapEmpty!43651 (= (arr!35006 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13235)) mapDefault!43651)))))

(declare-fun b!1117407 () Bool)

(declare-fun res!745682 () Bool)

(assert (=> b!1117407 (=> (not res!745682) (not e!636779))))

(assert (=> b!1117407 (= res!745682 (arrayNoDuplicates!0 lt!497592 #b00000000000000000000000000000000 Nil!24377))))

(declare-fun b!1117408 () Bool)

(assert (=> b!1117408 (= e!636780 tp_is_empty!27889)))

(assert (= (and start!97894 res!745683) b!1117405))

(assert (= (and b!1117405 res!745675) b!1117396))

(assert (= (and b!1117396 res!745680) b!1117400))

(assert (= (and b!1117400 res!745679) b!1117398))

(assert (= (and b!1117398 res!745681) b!1117397))

(assert (= (and b!1117397 res!745678) b!1117401))

(assert (= (and b!1117401 res!745684) b!1117399))

(assert (= (and b!1117399 res!745676) b!1117404))

(assert (= (and b!1117404 res!745677) b!1117407))

(assert (= (and b!1117407 res!745682) b!1117403))

(assert (= (and b!1117406 condMapEmpty!43651) mapIsEmpty!43651))

(assert (= (and b!1117406 (not condMapEmpty!43651)) mapNonEmpty!43651))

(get-info :version)

(assert (= (and mapNonEmpty!43651 ((_ is ValueCellFull!13235) mapValue!43651)) b!1117402))

(assert (= (and b!1117406 ((_ is ValueCellFull!13235) mapDefault!43651)) b!1117408))

(assert (= start!97894 b!1117406))

(declare-fun m!1034073 () Bool)

(assert (=> b!1117400 m!1034073))

(declare-fun m!1034075 () Bool)

(assert (=> mapNonEmpty!43651 m!1034075))

(declare-fun m!1034077 () Bool)

(assert (=> b!1117403 m!1034077))

(declare-fun m!1034079 () Bool)

(assert (=> b!1117403 m!1034079))

(declare-fun m!1034081 () Bool)

(assert (=> b!1117404 m!1034081))

(declare-fun m!1034083 () Bool)

(assert (=> b!1117404 m!1034083))

(declare-fun m!1034085 () Bool)

(assert (=> b!1117407 m!1034085))

(declare-fun m!1034087 () Bool)

(assert (=> start!97894 m!1034087))

(declare-fun m!1034089 () Bool)

(assert (=> start!97894 m!1034089))

(declare-fun m!1034091 () Bool)

(assert (=> b!1117405 m!1034091))

(declare-fun m!1034093 () Bool)

(assert (=> b!1117399 m!1034093))

(declare-fun m!1034095 () Bool)

(assert (=> b!1117398 m!1034095))

(declare-fun m!1034097 () Bool)

(assert (=> b!1117401 m!1034097))

(check-sat (not start!97894) (not mapNonEmpty!43651) (not b!1117403) (not b!1117398) (not b!1117405) (not b!1117407) (not b!1117404) (not b!1117400) tp_is_empty!27889 (not b!1117401))
(check-sat)
