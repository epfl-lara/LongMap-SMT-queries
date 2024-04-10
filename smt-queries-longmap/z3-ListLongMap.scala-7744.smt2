; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97210 () Bool)

(assert start!97210)

(declare-fun mapIsEmpty!42979 () Bool)

(declare-fun mapRes!42979 () Bool)

(assert (=> mapIsEmpty!42979 mapRes!42979))

(declare-fun b!1106109 () Bool)

(declare-fun res!738112 () Bool)

(declare-fun e!631225 () Bool)

(assert (=> b!1106109 (=> (not res!738112) (not e!631225))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71799 0))(
  ( (array!71800 (arr!34552 (Array (_ BitVec 32) (_ BitVec 64))) (size!35088 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71799)

(assert (=> b!1106109 (= res!738112 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35088 _keys!1208))))))

(declare-fun b!1106110 () Bool)

(declare-fun e!631223 () Bool)

(declare-fun e!631226 () Bool)

(assert (=> b!1106110 (= e!631223 (and e!631226 mapRes!42979))))

(declare-fun condMapEmpty!42979 () Bool)

(declare-datatypes ((V!41715 0))(
  ( (V!41716 (val!13777 Int)) )
))
(declare-datatypes ((ValueCell!13011 0))(
  ( (ValueCellFull!13011 (v!16410 V!41715)) (EmptyCell!13011) )
))
(declare-datatypes ((array!71801 0))(
  ( (array!71802 (arr!34553 (Array (_ BitVec 32) ValueCell!13011)) (size!35089 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71801)

(declare-fun mapDefault!42979 () ValueCell!13011)

(assert (=> b!1106110 (= condMapEmpty!42979 (= (arr!34553 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13011)) mapDefault!42979)))))

(declare-fun b!1106111 () Bool)

(declare-fun e!631224 () Bool)

(declare-fun tp_is_empty!27441 () Bool)

(assert (=> b!1106111 (= e!631224 tp_is_empty!27441)))

(declare-fun b!1106112 () Bool)

(declare-fun res!738114 () Bool)

(assert (=> b!1106112 (=> (not res!738114) (not e!631225))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71799 (_ BitVec 32)) Bool)

(assert (=> b!1106112 (= res!738114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106113 () Bool)

(declare-fun res!738116 () Bool)

(assert (=> b!1106113 (=> (not res!738116) (not e!631225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106113 (= res!738116 (validMask!0 mask!1564))))

(declare-fun b!1106115 () Bool)

(declare-fun e!631227 () Bool)

(assert (=> b!1106115 (= e!631227 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106115 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36292 0))(
  ( (Unit!36293) )
))
(declare-fun lt!495409 () Unit!36292)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71799 (_ BitVec 64) (_ BitVec 32)) Unit!36292)

(assert (=> b!1106115 (= lt!495409 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106116 () Bool)

(declare-fun res!738118 () Bool)

(assert (=> b!1106116 (=> (not res!738118) (not e!631227))))

(declare-fun lt!495410 () array!71799)

(declare-datatypes ((List!24088 0))(
  ( (Nil!24085) (Cons!24084 (h!25293 (_ BitVec 64)) (t!34353 List!24088)) )
))
(declare-fun arrayNoDuplicates!0 (array!71799 (_ BitVec 32) List!24088) Bool)

(assert (=> b!1106116 (= res!738118 (arrayNoDuplicates!0 lt!495410 #b00000000000000000000000000000000 Nil!24085))))

(declare-fun b!1106117 () Bool)

(declare-fun res!738115 () Bool)

(assert (=> b!1106117 (=> (not res!738115) (not e!631225))))

(assert (=> b!1106117 (= res!738115 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24085))))

(declare-fun b!1106118 () Bool)

(declare-fun res!738111 () Bool)

(assert (=> b!1106118 (=> (not res!738111) (not e!631225))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106118 (= res!738111 (and (= (size!35089 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35088 _keys!1208) (size!35089 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42979 () Bool)

(declare-fun tp!81899 () Bool)

(assert (=> mapNonEmpty!42979 (= mapRes!42979 (and tp!81899 e!631224))))

(declare-fun mapKey!42979 () (_ BitVec 32))

(declare-fun mapRest!42979 () (Array (_ BitVec 32) ValueCell!13011))

(declare-fun mapValue!42979 () ValueCell!13011)

(assert (=> mapNonEmpty!42979 (= (arr!34553 _values!996) (store mapRest!42979 mapKey!42979 mapValue!42979))))

(declare-fun b!1106119 () Bool)

(declare-fun res!738110 () Bool)

(assert (=> b!1106119 (=> (not res!738110) (not e!631225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106119 (= res!738110 (validKeyInArray!0 k0!934))))

(declare-fun b!1106120 () Bool)

(assert (=> b!1106120 (= e!631225 e!631227)))

(declare-fun res!738117 () Bool)

(assert (=> b!1106120 (=> (not res!738117) (not e!631227))))

(assert (=> b!1106120 (= res!738117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495410 mask!1564))))

(assert (=> b!1106120 (= lt!495410 (array!71800 (store (arr!34552 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35088 _keys!1208)))))

(declare-fun b!1106121 () Bool)

(assert (=> b!1106121 (= e!631226 tp_is_empty!27441)))

(declare-fun b!1106114 () Bool)

(declare-fun res!738109 () Bool)

(assert (=> b!1106114 (=> (not res!738109) (not e!631225))))

(assert (=> b!1106114 (= res!738109 (= (select (arr!34552 _keys!1208) i!673) k0!934))))

(declare-fun res!738113 () Bool)

(assert (=> start!97210 (=> (not res!738113) (not e!631225))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97210 (= res!738113 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35088 _keys!1208))))))

(assert (=> start!97210 e!631225))

(declare-fun array_inv!26592 (array!71799) Bool)

(assert (=> start!97210 (array_inv!26592 _keys!1208)))

(assert (=> start!97210 true))

(declare-fun array_inv!26593 (array!71801) Bool)

(assert (=> start!97210 (and (array_inv!26593 _values!996) e!631223)))

(assert (= (and start!97210 res!738113) b!1106113))

(assert (= (and b!1106113 res!738116) b!1106118))

(assert (= (and b!1106118 res!738111) b!1106112))

(assert (= (and b!1106112 res!738114) b!1106117))

(assert (= (and b!1106117 res!738115) b!1106109))

(assert (= (and b!1106109 res!738112) b!1106119))

(assert (= (and b!1106119 res!738110) b!1106114))

(assert (= (and b!1106114 res!738109) b!1106120))

(assert (= (and b!1106120 res!738117) b!1106116))

(assert (= (and b!1106116 res!738118) b!1106115))

(assert (= (and b!1106110 condMapEmpty!42979) mapIsEmpty!42979))

(assert (= (and b!1106110 (not condMapEmpty!42979)) mapNonEmpty!42979))

(get-info :version)

(assert (= (and mapNonEmpty!42979 ((_ is ValueCellFull!13011) mapValue!42979)) b!1106111))

(assert (= (and b!1106110 ((_ is ValueCellFull!13011) mapDefault!42979)) b!1106121))

(assert (= start!97210 b!1106110))

(declare-fun m!1025281 () Bool)

(assert (=> start!97210 m!1025281))

(declare-fun m!1025283 () Bool)

(assert (=> start!97210 m!1025283))

(declare-fun m!1025285 () Bool)

(assert (=> b!1106114 m!1025285))

(declare-fun m!1025287 () Bool)

(assert (=> b!1106119 m!1025287))

(declare-fun m!1025289 () Bool)

(assert (=> b!1106116 m!1025289))

(declare-fun m!1025291 () Bool)

(assert (=> b!1106117 m!1025291))

(declare-fun m!1025293 () Bool)

(assert (=> b!1106115 m!1025293))

(declare-fun m!1025295 () Bool)

(assert (=> b!1106115 m!1025295))

(declare-fun m!1025297 () Bool)

(assert (=> b!1106112 m!1025297))

(declare-fun m!1025299 () Bool)

(assert (=> mapNonEmpty!42979 m!1025299))

(declare-fun m!1025301 () Bool)

(assert (=> b!1106120 m!1025301))

(declare-fun m!1025303 () Bool)

(assert (=> b!1106120 m!1025303))

(declare-fun m!1025305 () Bool)

(assert (=> b!1106113 m!1025305))

(check-sat (not b!1106115) (not b!1106119) (not b!1106113) (not b!1106116) (not b!1106120) (not mapNonEmpty!42979) tp_is_empty!27441 (not b!1106117) (not start!97210) (not b!1106112))
(check-sat)
