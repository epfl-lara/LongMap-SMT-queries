; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97374 () Bool)

(assert start!97374)

(declare-fun b!1106294 () Bool)

(declare-fun res!737768 () Bool)

(declare-fun e!631537 () Bool)

(assert (=> b!1106294 (=> (not res!737768) (not e!631537))))

(declare-datatypes ((array!71725 0))(
  ( (array!71726 (arr!34510 (Array (_ BitVec 32) (_ BitVec 64))) (size!35047 (_ BitVec 32))) )
))
(declare-fun lt!495742 () array!71725)

(declare-datatypes ((List!24088 0))(
  ( (Nil!24085) (Cons!24084 (h!25302 (_ BitVec 64)) (t!34345 List!24088)) )
))
(declare-fun arrayNoDuplicates!0 (array!71725 (_ BitVec 32) List!24088) Bool)

(assert (=> b!1106294 (= res!737768 (arrayNoDuplicates!0 lt!495742 #b00000000000000000000000000000000 Nil!24085))))

(declare-fun res!737765 () Bool)

(declare-fun e!631533 () Bool)

(assert (=> start!97374 (=> (not res!737765) (not e!631533))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!71725)

(assert (=> start!97374 (= res!737765 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35047 _keys!1208))))))

(assert (=> start!97374 e!631533))

(declare-fun array_inv!26604 (array!71725) Bool)

(assert (=> start!97374 (array_inv!26604 _keys!1208)))

(assert (=> start!97374 true))

(declare-datatypes ((V!41641 0))(
  ( (V!41642 (val!13749 Int)) )
))
(declare-datatypes ((ValueCell!12983 0))(
  ( (ValueCellFull!12983 (v!16378 V!41641)) (EmptyCell!12983) )
))
(declare-datatypes ((array!71727 0))(
  ( (array!71728 (arr!34511 (Array (_ BitVec 32) ValueCell!12983)) (size!35048 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71727)

(declare-fun e!631536 () Bool)

(declare-fun array_inv!26605 (array!71727) Bool)

(assert (=> start!97374 (and (array_inv!26605 _values!996) e!631536)))

(declare-fun b!1106295 () Bool)

(declare-fun res!737767 () Bool)

(assert (=> b!1106295 (=> (not res!737767) (not e!631533))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1106295 (= res!737767 (= (select (arr!34510 _keys!1208) i!673) k0!934))))

(declare-fun b!1106296 () Bool)

(declare-fun e!631538 () Bool)

(declare-fun mapRes!42892 () Bool)

(assert (=> b!1106296 (= e!631536 (and e!631538 mapRes!42892))))

(declare-fun condMapEmpty!42892 () Bool)

(declare-fun mapDefault!42892 () ValueCell!12983)

(assert (=> b!1106296 (= condMapEmpty!42892 (= (arr!34511 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12983)) mapDefault!42892)))))

(declare-fun mapNonEmpty!42892 () Bool)

(declare-fun tp!81812 () Bool)

(declare-fun e!631534 () Bool)

(assert (=> mapNonEmpty!42892 (= mapRes!42892 (and tp!81812 e!631534))))

(declare-fun mapKey!42892 () (_ BitVec 32))

(declare-fun mapValue!42892 () ValueCell!12983)

(declare-fun mapRest!42892 () (Array (_ BitVec 32) ValueCell!12983))

(assert (=> mapNonEmpty!42892 (= (arr!34511 _values!996) (store mapRest!42892 mapKey!42892 mapValue!42892))))

(declare-fun b!1106297 () Bool)

(declare-fun tp_is_empty!27385 () Bool)

(assert (=> b!1106297 (= e!631538 tp_is_empty!27385)))

(declare-fun b!1106298 () Bool)

(declare-fun res!737766 () Bool)

(assert (=> b!1106298 (=> (not res!737766) (not e!631533))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106298 (= res!737766 (validMask!0 mask!1564))))

(declare-fun b!1106299 () Bool)

(assert (=> b!1106299 (= e!631537 (not (bvslt #b00000000000000000000000000000000 (size!35047 _keys!1208))))))

(declare-fun arrayContainsKey!0 (array!71725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106299 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36245 0))(
  ( (Unit!36246) )
))
(declare-fun lt!495741 () Unit!36245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71725 (_ BitVec 64) (_ BitVec 32)) Unit!36245)

(assert (=> b!1106299 (= lt!495741 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106300 () Bool)

(assert (=> b!1106300 (= e!631533 e!631537)))

(declare-fun res!737772 () Bool)

(assert (=> b!1106300 (=> (not res!737772) (not e!631537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71725 (_ BitVec 32)) Bool)

(assert (=> b!1106300 (= res!737772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495742 mask!1564))))

(assert (=> b!1106300 (= lt!495742 (array!71726 (store (arr!34510 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35047 _keys!1208)))))

(declare-fun b!1106301 () Bool)

(declare-fun res!737774 () Bool)

(assert (=> b!1106301 (=> (not res!737774) (not e!631533))))

(assert (=> b!1106301 (= res!737774 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24085))))

(declare-fun b!1106302 () Bool)

(declare-fun res!737771 () Bool)

(assert (=> b!1106302 (=> (not res!737771) (not e!631533))))

(assert (=> b!1106302 (= res!737771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106303 () Bool)

(declare-fun res!737773 () Bool)

(assert (=> b!1106303 (=> (not res!737773) (not e!631533))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106303 (= res!737773 (and (= (size!35048 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35047 _keys!1208) (size!35048 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106304 () Bool)

(assert (=> b!1106304 (= e!631534 tp_is_empty!27385)))

(declare-fun b!1106305 () Bool)

(declare-fun res!737769 () Bool)

(assert (=> b!1106305 (=> (not res!737769) (not e!631533))))

(assert (=> b!1106305 (= res!737769 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35047 _keys!1208))))))

(declare-fun b!1106306 () Bool)

(declare-fun res!737770 () Bool)

(assert (=> b!1106306 (=> (not res!737770) (not e!631533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106306 (= res!737770 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!42892 () Bool)

(assert (=> mapIsEmpty!42892 mapRes!42892))

(assert (= (and start!97374 res!737765) b!1106298))

(assert (= (and b!1106298 res!737766) b!1106303))

(assert (= (and b!1106303 res!737773) b!1106302))

(assert (= (and b!1106302 res!737771) b!1106301))

(assert (= (and b!1106301 res!737774) b!1106305))

(assert (= (and b!1106305 res!737769) b!1106306))

(assert (= (and b!1106306 res!737770) b!1106295))

(assert (= (and b!1106295 res!737767) b!1106300))

(assert (= (and b!1106300 res!737772) b!1106294))

(assert (= (and b!1106294 res!737768) b!1106299))

(assert (= (and b!1106296 condMapEmpty!42892) mapIsEmpty!42892))

(assert (= (and b!1106296 (not condMapEmpty!42892)) mapNonEmpty!42892))

(get-info :version)

(assert (= (and mapNonEmpty!42892 ((_ is ValueCellFull!12983) mapValue!42892)) b!1106304))

(assert (= (and b!1106296 ((_ is ValueCellFull!12983) mapDefault!42892)) b!1106297))

(assert (= start!97374 b!1106296))

(declare-fun m!1026187 () Bool)

(assert (=> b!1106298 m!1026187))

(declare-fun m!1026189 () Bool)

(assert (=> b!1106300 m!1026189))

(declare-fun m!1026191 () Bool)

(assert (=> b!1106300 m!1026191))

(declare-fun m!1026193 () Bool)

(assert (=> mapNonEmpty!42892 m!1026193))

(declare-fun m!1026195 () Bool)

(assert (=> b!1106294 m!1026195))

(declare-fun m!1026197 () Bool)

(assert (=> start!97374 m!1026197))

(declare-fun m!1026199 () Bool)

(assert (=> start!97374 m!1026199))

(declare-fun m!1026201 () Bool)

(assert (=> b!1106302 m!1026201))

(declare-fun m!1026203 () Bool)

(assert (=> b!1106301 m!1026203))

(declare-fun m!1026205 () Bool)

(assert (=> b!1106299 m!1026205))

(declare-fun m!1026207 () Bool)

(assert (=> b!1106299 m!1026207))

(declare-fun m!1026209 () Bool)

(assert (=> b!1106306 m!1026209))

(declare-fun m!1026211 () Bool)

(assert (=> b!1106295 m!1026211))

(check-sat tp_is_empty!27385 (not b!1106299) (not b!1106301) (not mapNonEmpty!42892) (not b!1106300) (not b!1106294) (not b!1106302) (not b!1106298) (not b!1106306) (not start!97374))
(check-sat)
