; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97172 () Bool)

(assert start!97172)

(declare-fun b!1105332 () Bool)

(declare-fun e!630841 () Bool)

(declare-fun tp_is_empty!27409 () Bool)

(assert (=> b!1105332 (= e!630841 tp_is_empty!27409)))

(declare-fun res!737566 () Bool)

(declare-fun e!630843 () Bool)

(assert (=> start!97172 (=> (not res!737566) (not e!630843))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71652 0))(
  ( (array!71653 (arr!34479 (Array (_ BitVec 32) (_ BitVec 64))) (size!35017 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71652)

(assert (=> start!97172 (= res!737566 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35017 _keys!1208))))))

(assert (=> start!97172 e!630843))

(declare-fun array_inv!26590 (array!71652) Bool)

(assert (=> start!97172 (array_inv!26590 _keys!1208)))

(assert (=> start!97172 true))

(declare-datatypes ((V!41673 0))(
  ( (V!41674 (val!13761 Int)) )
))
(declare-datatypes ((ValueCell!12995 0))(
  ( (ValueCellFull!12995 (v!16393 V!41673)) (EmptyCell!12995) )
))
(declare-datatypes ((array!71654 0))(
  ( (array!71655 (arr!34480 (Array (_ BitVec 32) ValueCell!12995)) (size!35018 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71654)

(declare-fun e!630842 () Bool)

(declare-fun array_inv!26591 (array!71654) Bool)

(assert (=> start!97172 (and (array_inv!26591 _values!996) e!630842)))

(declare-fun b!1105333 () Bool)

(declare-fun res!737569 () Bool)

(assert (=> b!1105333 (=> (not res!737569) (not e!630843))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105333 (= res!737569 (validKeyInArray!0 k0!934))))

(declare-fun b!1105334 () Bool)

(declare-fun e!630845 () Bool)

(assert (=> b!1105334 (= e!630845 (not true))))

(declare-fun arrayContainsKey!0 (array!71652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105334 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36095 0))(
  ( (Unit!36096) )
))
(declare-fun lt!495113 () Unit!36095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71652 (_ BitVec 64) (_ BitVec 32)) Unit!36095)

(assert (=> b!1105334 (= lt!495113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105335 () Bool)

(declare-fun res!737562 () Bool)

(assert (=> b!1105335 (=> (not res!737562) (not e!630843))))

(assert (=> b!1105335 (= res!737562 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35017 _keys!1208))))))

(declare-fun b!1105336 () Bool)

(declare-fun res!737568 () Bool)

(assert (=> b!1105336 (=> (not res!737568) (not e!630843))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71652 (_ BitVec 32)) Bool)

(assert (=> b!1105336 (= res!737568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105337 () Bool)

(declare-fun e!630844 () Bool)

(declare-fun mapRes!42931 () Bool)

(assert (=> b!1105337 (= e!630842 (and e!630844 mapRes!42931))))

(declare-fun condMapEmpty!42931 () Bool)

(declare-fun mapDefault!42931 () ValueCell!12995)

(assert (=> b!1105337 (= condMapEmpty!42931 (= (arr!34480 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12995)) mapDefault!42931)))))

(declare-fun b!1105338 () Bool)

(assert (=> b!1105338 (= e!630844 tp_is_empty!27409)))

(declare-fun b!1105339 () Bool)

(declare-fun res!737561 () Bool)

(assert (=> b!1105339 (=> (not res!737561) (not e!630845))))

(declare-fun lt!495114 () array!71652)

(declare-datatypes ((List!24110 0))(
  ( (Nil!24107) (Cons!24106 (h!25315 (_ BitVec 64)) (t!34366 List!24110)) )
))
(declare-fun arrayNoDuplicates!0 (array!71652 (_ BitVec 32) List!24110) Bool)

(assert (=> b!1105339 (= res!737561 (arrayNoDuplicates!0 lt!495114 #b00000000000000000000000000000000 Nil!24107))))

(declare-fun b!1105340 () Bool)

(declare-fun res!737564 () Bool)

(assert (=> b!1105340 (=> (not res!737564) (not e!630843))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105340 (= res!737564 (and (= (size!35018 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35017 _keys!1208) (size!35018 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42931 () Bool)

(declare-fun tp!81851 () Bool)

(assert (=> mapNonEmpty!42931 (= mapRes!42931 (and tp!81851 e!630841))))

(declare-fun mapValue!42931 () ValueCell!12995)

(declare-fun mapKey!42931 () (_ BitVec 32))

(declare-fun mapRest!42931 () (Array (_ BitVec 32) ValueCell!12995))

(assert (=> mapNonEmpty!42931 (= (arr!34480 _values!996) (store mapRest!42931 mapKey!42931 mapValue!42931))))

(declare-fun b!1105341 () Bool)

(declare-fun res!737565 () Bool)

(assert (=> b!1105341 (=> (not res!737565) (not e!630843))))

(assert (=> b!1105341 (= res!737565 (= (select (arr!34479 _keys!1208) i!673) k0!934))))

(declare-fun b!1105342 () Bool)

(declare-fun res!737560 () Bool)

(assert (=> b!1105342 (=> (not res!737560) (not e!630843))))

(assert (=> b!1105342 (= res!737560 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24107))))

(declare-fun b!1105343 () Bool)

(declare-fun res!737567 () Bool)

(assert (=> b!1105343 (=> (not res!737567) (not e!630843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105343 (= res!737567 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42931 () Bool)

(assert (=> mapIsEmpty!42931 mapRes!42931))

(declare-fun b!1105344 () Bool)

(assert (=> b!1105344 (= e!630843 e!630845)))

(declare-fun res!737563 () Bool)

(assert (=> b!1105344 (=> (not res!737563) (not e!630845))))

(assert (=> b!1105344 (= res!737563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495114 mask!1564))))

(assert (=> b!1105344 (= lt!495114 (array!71653 (store (arr!34479 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35017 _keys!1208)))))

(assert (= (and start!97172 res!737566) b!1105343))

(assert (= (and b!1105343 res!737567) b!1105340))

(assert (= (and b!1105340 res!737564) b!1105336))

(assert (= (and b!1105336 res!737568) b!1105342))

(assert (= (and b!1105342 res!737560) b!1105335))

(assert (= (and b!1105335 res!737562) b!1105333))

(assert (= (and b!1105333 res!737569) b!1105341))

(assert (= (and b!1105341 res!737565) b!1105344))

(assert (= (and b!1105344 res!737563) b!1105339))

(assert (= (and b!1105339 res!737561) b!1105334))

(assert (= (and b!1105337 condMapEmpty!42931) mapIsEmpty!42931))

(assert (= (and b!1105337 (not condMapEmpty!42931)) mapNonEmpty!42931))

(get-info :version)

(assert (= (and mapNonEmpty!42931 ((_ is ValueCellFull!12995) mapValue!42931)) b!1105332))

(assert (= (and b!1105337 ((_ is ValueCellFull!12995) mapDefault!42931)) b!1105338))

(assert (= start!97172 b!1105337))

(declare-fun m!1024239 () Bool)

(assert (=> b!1105341 m!1024239))

(declare-fun m!1024241 () Bool)

(assert (=> b!1105333 m!1024241))

(declare-fun m!1024243 () Bool)

(assert (=> b!1105344 m!1024243))

(declare-fun m!1024245 () Bool)

(assert (=> b!1105344 m!1024245))

(declare-fun m!1024247 () Bool)

(assert (=> mapNonEmpty!42931 m!1024247))

(declare-fun m!1024249 () Bool)

(assert (=> b!1105334 m!1024249))

(declare-fun m!1024251 () Bool)

(assert (=> b!1105334 m!1024251))

(declare-fun m!1024253 () Bool)

(assert (=> b!1105336 m!1024253))

(declare-fun m!1024255 () Bool)

(assert (=> b!1105339 m!1024255))

(declare-fun m!1024257 () Bool)

(assert (=> b!1105343 m!1024257))

(declare-fun m!1024259 () Bool)

(assert (=> start!97172 m!1024259))

(declare-fun m!1024261 () Bool)

(assert (=> start!97172 m!1024261))

(declare-fun m!1024263 () Bool)

(assert (=> b!1105342 m!1024263))

(check-sat (not start!97172) (not b!1105344) (not b!1105342) (not b!1105339) tp_is_empty!27409 (not b!1105343) (not b!1105333) (not mapNonEmpty!42931) (not b!1105334) (not b!1105336))
(check-sat)
