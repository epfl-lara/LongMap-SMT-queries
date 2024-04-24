; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97278 () Bool)

(assert start!97278)

(declare-fun b!1105138 () Bool)

(declare-fun res!736925 () Bool)

(declare-fun e!630966 () Bool)

(assert (=> b!1105138 (=> (not res!736925) (not e!630966))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41569 0))(
  ( (V!41570 (val!13722 Int)) )
))
(declare-datatypes ((ValueCell!12956 0))(
  ( (ValueCellFull!12956 (v!16350 V!41569)) (EmptyCell!12956) )
))
(declare-datatypes ((array!71619 0))(
  ( (array!71620 (arr!34460 (Array (_ BitVec 32) ValueCell!12956)) (size!34997 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71619)

(declare-datatypes ((array!71621 0))(
  ( (array!71622 (arr!34461 (Array (_ BitVec 32) (_ BitVec 64))) (size!34998 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71621)

(assert (=> b!1105138 (= res!736925 (and (= (size!34997 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34998 _keys!1208) (size!34997 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105139 () Bool)

(declare-fun res!736923 () Bool)

(assert (=> b!1105139 (=> (not res!736923) (not e!630966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71621 (_ BitVec 32)) Bool)

(assert (=> b!1105139 (= res!736923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105140 () Bool)

(declare-fun res!736921 () Bool)

(assert (=> b!1105140 (=> (not res!736921) (not e!630966))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105140 (= res!736921 (= (select (arr!34461 _keys!1208) i!673) k0!934))))

(declare-fun b!1105141 () Bool)

(declare-fun res!736926 () Bool)

(assert (=> b!1105141 (=> (not res!736926) (not e!630966))))

(assert (=> b!1105141 (= res!736926 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34998 _keys!1208))))))

(declare-fun b!1105142 () Bool)

(declare-fun res!736920 () Bool)

(assert (=> b!1105142 (=> (not res!736920) (not e!630966))))

(declare-datatypes ((List!24069 0))(
  ( (Nil!24066) (Cons!24065 (h!25283 (_ BitVec 64)) (t!34326 List!24069)) )
))
(declare-fun arrayNoDuplicates!0 (array!71621 (_ BitVec 32) List!24069) Bool)

(assert (=> b!1105142 (= res!736920 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24066))))

(declare-fun b!1105143 () Bool)

(declare-fun e!630963 () Bool)

(declare-fun tp_is_empty!27331 () Bool)

(assert (=> b!1105143 (= e!630963 tp_is_empty!27331)))

(declare-fun b!1105144 () Bool)

(assert (=> b!1105144 (= e!630966 (bvsgt #b00000000000000000000000000000000 (size!34998 _keys!1208)))))

(declare-fun mapNonEmpty!42802 () Bool)

(declare-fun mapRes!42802 () Bool)

(declare-fun tp!81722 () Bool)

(declare-fun e!630965 () Bool)

(assert (=> mapNonEmpty!42802 (= mapRes!42802 (and tp!81722 e!630965))))

(declare-fun mapValue!42802 () ValueCell!12956)

(declare-fun mapKey!42802 () (_ BitVec 32))

(declare-fun mapRest!42802 () (Array (_ BitVec 32) ValueCell!12956))

(assert (=> mapNonEmpty!42802 (= (arr!34460 _values!996) (store mapRest!42802 mapKey!42802 mapValue!42802))))

(declare-fun b!1105145 () Bool)

(declare-fun res!736919 () Bool)

(assert (=> b!1105145 (=> (not res!736919) (not e!630966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105145 (= res!736919 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!42802 () Bool)

(assert (=> mapIsEmpty!42802 mapRes!42802))

(declare-fun b!1105146 () Bool)

(declare-fun res!736922 () Bool)

(assert (=> b!1105146 (=> (not res!736922) (not e!630966))))

(assert (=> b!1105146 (= res!736922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71622 (store (arr!34461 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34998 _keys!1208)) mask!1564))))

(declare-fun b!1105147 () Bool)

(assert (=> b!1105147 (= e!630965 tp_is_empty!27331)))

(declare-fun b!1105148 () Bool)

(declare-fun e!630962 () Bool)

(assert (=> b!1105148 (= e!630962 (and e!630963 mapRes!42802))))

(declare-fun condMapEmpty!42802 () Bool)

(declare-fun mapDefault!42802 () ValueCell!12956)

(assert (=> b!1105148 (= condMapEmpty!42802 (= (arr!34460 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12956)) mapDefault!42802)))))

(declare-fun res!736924 () Bool)

(assert (=> start!97278 (=> (not res!736924) (not e!630966))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97278 (= res!736924 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34998 _keys!1208))))))

(assert (=> start!97278 e!630966))

(declare-fun array_inv!26570 (array!71621) Bool)

(assert (=> start!97278 (array_inv!26570 _keys!1208)))

(assert (=> start!97278 true))

(declare-fun array_inv!26571 (array!71619) Bool)

(assert (=> start!97278 (and (array_inv!26571 _values!996) e!630962)))

(declare-fun b!1105149 () Bool)

(declare-fun res!736918 () Bool)

(assert (=> b!1105149 (=> (not res!736918) (not e!630966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105149 (= res!736918 (validMask!0 mask!1564))))

(assert (= (and start!97278 res!736924) b!1105149))

(assert (= (and b!1105149 res!736918) b!1105138))

(assert (= (and b!1105138 res!736925) b!1105139))

(assert (= (and b!1105139 res!736923) b!1105142))

(assert (= (and b!1105142 res!736920) b!1105141))

(assert (= (and b!1105141 res!736926) b!1105145))

(assert (= (and b!1105145 res!736919) b!1105140))

(assert (= (and b!1105140 res!736921) b!1105146))

(assert (= (and b!1105146 res!736922) b!1105144))

(assert (= (and b!1105148 condMapEmpty!42802) mapIsEmpty!42802))

(assert (= (and b!1105148 (not condMapEmpty!42802)) mapNonEmpty!42802))

(get-info :version)

(assert (= (and mapNonEmpty!42802 ((_ is ValueCellFull!12956) mapValue!42802)) b!1105147))

(assert (= (and b!1105148 ((_ is ValueCellFull!12956) mapDefault!42802)) b!1105143))

(assert (= start!97278 b!1105148))

(declare-fun m!1025473 () Bool)

(assert (=> b!1105139 m!1025473))

(declare-fun m!1025475 () Bool)

(assert (=> b!1105149 m!1025475))

(declare-fun m!1025477 () Bool)

(assert (=> b!1105142 m!1025477))

(declare-fun m!1025479 () Bool)

(assert (=> b!1105146 m!1025479))

(declare-fun m!1025481 () Bool)

(assert (=> b!1105146 m!1025481))

(declare-fun m!1025483 () Bool)

(assert (=> start!97278 m!1025483))

(declare-fun m!1025485 () Bool)

(assert (=> start!97278 m!1025485))

(declare-fun m!1025487 () Bool)

(assert (=> b!1105140 m!1025487))

(declare-fun m!1025489 () Bool)

(assert (=> b!1105145 m!1025489))

(declare-fun m!1025491 () Bool)

(assert (=> mapNonEmpty!42802 m!1025491))

(check-sat tp_is_empty!27331 (not b!1105146) (not b!1105142) (not b!1105149) (not start!97278) (not mapNonEmpty!42802) (not b!1105139) (not b!1105145))
(check-sat)
