; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97174 () Bool)

(assert start!97174)

(declare-fun b!1105407 () Bool)

(declare-fun e!630899 () Bool)

(assert (=> b!1105407 (= e!630899 (not true))))

(declare-datatypes ((array!71733 0))(
  ( (array!71734 (arr!34519 (Array (_ BitVec 32) (_ BitVec 64))) (size!35055 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71733)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105407 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36272 0))(
  ( (Unit!36273) )
))
(declare-fun lt!495301 () Unit!36272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71733 (_ BitVec 64) (_ BitVec 32)) Unit!36272)

(assert (=> b!1105407 (= lt!495301 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105408 () Bool)

(declare-fun res!737577 () Bool)

(declare-fun e!630902 () Bool)

(assert (=> b!1105408 (=> (not res!737577) (not e!630902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105408 (= res!737577 (validKeyInArray!0 k0!934))))

(declare-fun b!1105409 () Bool)

(declare-fun e!630901 () Bool)

(declare-fun tp_is_empty!27405 () Bool)

(assert (=> b!1105409 (= e!630901 tp_is_empty!27405)))

(declare-fun b!1105411 () Bool)

(declare-fun e!630903 () Bool)

(assert (=> b!1105411 (= e!630903 tp_is_empty!27405)))

(declare-fun mapNonEmpty!42925 () Bool)

(declare-fun mapRes!42925 () Bool)

(declare-fun tp!81845 () Bool)

(assert (=> mapNonEmpty!42925 (= mapRes!42925 (and tp!81845 e!630901))))

(declare-datatypes ((V!41667 0))(
  ( (V!41668 (val!13759 Int)) )
))
(declare-datatypes ((ValueCell!12993 0))(
  ( (ValueCellFull!12993 (v!16392 V!41667)) (EmptyCell!12993) )
))
(declare-fun mapRest!42925 () (Array (_ BitVec 32) ValueCell!12993))

(declare-datatypes ((array!71735 0))(
  ( (array!71736 (arr!34520 (Array (_ BitVec 32) ValueCell!12993)) (size!35056 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71735)

(declare-fun mapValue!42925 () ValueCell!12993)

(declare-fun mapKey!42925 () (_ BitVec 32))

(assert (=> mapNonEmpty!42925 (= (arr!34520 _values!996) (store mapRest!42925 mapKey!42925 mapValue!42925))))

(declare-fun mapIsEmpty!42925 () Bool)

(assert (=> mapIsEmpty!42925 mapRes!42925))

(declare-fun b!1105412 () Bool)

(declare-fun res!737572 () Bool)

(assert (=> b!1105412 (=> (not res!737572) (not e!630902))))

(assert (=> b!1105412 (= res!737572 (= (select (arr!34519 _keys!1208) i!673) k0!934))))

(declare-fun b!1105413 () Bool)

(declare-fun res!737578 () Bool)

(assert (=> b!1105413 (=> (not res!737578) (not e!630902))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1105413 (= res!737578 (and (= (size!35056 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35055 _keys!1208) (size!35056 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105414 () Bool)

(declare-fun e!630900 () Bool)

(assert (=> b!1105414 (= e!630900 (and e!630903 mapRes!42925))))

(declare-fun condMapEmpty!42925 () Bool)

(declare-fun mapDefault!42925 () ValueCell!12993)

(assert (=> b!1105414 (= condMapEmpty!42925 (= (arr!34520 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12993)) mapDefault!42925)))))

(declare-fun b!1105415 () Bool)

(declare-fun res!737576 () Bool)

(assert (=> b!1105415 (=> (not res!737576) (not e!630902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105415 (= res!737576 (validMask!0 mask!1564))))

(declare-fun b!1105416 () Bool)

(assert (=> b!1105416 (= e!630902 e!630899)))

(declare-fun res!737569 () Bool)

(assert (=> b!1105416 (=> (not res!737569) (not e!630899))))

(declare-fun lt!495302 () array!71733)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71733 (_ BitVec 32)) Bool)

(assert (=> b!1105416 (= res!737569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495302 mask!1564))))

(assert (=> b!1105416 (= lt!495302 (array!71734 (store (arr!34519 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35055 _keys!1208)))))

(declare-fun b!1105417 () Bool)

(declare-fun res!737575 () Bool)

(assert (=> b!1105417 (=> (not res!737575) (not e!630899))))

(declare-datatypes ((List!24074 0))(
  ( (Nil!24071) (Cons!24070 (h!25279 (_ BitVec 64)) (t!34339 List!24074)) )
))
(declare-fun arrayNoDuplicates!0 (array!71733 (_ BitVec 32) List!24074) Bool)

(assert (=> b!1105417 (= res!737575 (arrayNoDuplicates!0 lt!495302 #b00000000000000000000000000000000 Nil!24071))))

(declare-fun res!737574 () Bool)

(assert (=> start!97174 (=> (not res!737574) (not e!630902))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97174 (= res!737574 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35055 _keys!1208))))))

(assert (=> start!97174 e!630902))

(declare-fun array_inv!26574 (array!71733) Bool)

(assert (=> start!97174 (array_inv!26574 _keys!1208)))

(assert (=> start!97174 true))

(declare-fun array_inv!26575 (array!71735) Bool)

(assert (=> start!97174 (and (array_inv!26575 _values!996) e!630900)))

(declare-fun b!1105410 () Bool)

(declare-fun res!737571 () Bool)

(assert (=> b!1105410 (=> (not res!737571) (not e!630902))))

(assert (=> b!1105410 (= res!737571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105418 () Bool)

(declare-fun res!737573 () Bool)

(assert (=> b!1105418 (=> (not res!737573) (not e!630902))))

(assert (=> b!1105418 (= res!737573 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35055 _keys!1208))))))

(declare-fun b!1105419 () Bool)

(declare-fun res!737570 () Bool)

(assert (=> b!1105419 (=> (not res!737570) (not e!630902))))

(assert (=> b!1105419 (= res!737570 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24071))))

(assert (= (and start!97174 res!737574) b!1105415))

(assert (= (and b!1105415 res!737576) b!1105413))

(assert (= (and b!1105413 res!737578) b!1105410))

(assert (= (and b!1105410 res!737571) b!1105419))

(assert (= (and b!1105419 res!737570) b!1105418))

(assert (= (and b!1105418 res!737573) b!1105408))

(assert (= (and b!1105408 res!737577) b!1105412))

(assert (= (and b!1105412 res!737572) b!1105416))

(assert (= (and b!1105416 res!737569) b!1105417))

(assert (= (and b!1105417 res!737575) b!1105407))

(assert (= (and b!1105414 condMapEmpty!42925) mapIsEmpty!42925))

(assert (= (and b!1105414 (not condMapEmpty!42925)) mapNonEmpty!42925))

(get-info :version)

(assert (= (and mapNonEmpty!42925 ((_ is ValueCellFull!12993) mapValue!42925)) b!1105409))

(assert (= (and b!1105414 ((_ is ValueCellFull!12993) mapDefault!42925)) b!1105411))

(assert (= start!97174 b!1105414))

(declare-fun m!1024813 () Bool)

(assert (=> b!1105407 m!1024813))

(declare-fun m!1024815 () Bool)

(assert (=> b!1105407 m!1024815))

(declare-fun m!1024817 () Bool)

(assert (=> b!1105408 m!1024817))

(declare-fun m!1024819 () Bool)

(assert (=> b!1105417 m!1024819))

(declare-fun m!1024821 () Bool)

(assert (=> mapNonEmpty!42925 m!1024821))

(declare-fun m!1024823 () Bool)

(assert (=> b!1105419 m!1024823))

(declare-fun m!1024825 () Bool)

(assert (=> b!1105410 m!1024825))

(declare-fun m!1024827 () Bool)

(assert (=> b!1105416 m!1024827))

(declare-fun m!1024829 () Bool)

(assert (=> b!1105416 m!1024829))

(declare-fun m!1024831 () Bool)

(assert (=> start!97174 m!1024831))

(declare-fun m!1024833 () Bool)

(assert (=> start!97174 m!1024833))

(declare-fun m!1024835 () Bool)

(assert (=> b!1105412 m!1024835))

(declare-fun m!1024837 () Bool)

(assert (=> b!1105415 m!1024837))

(check-sat (not b!1105417) (not b!1105408) (not b!1105407) (not mapNonEmpty!42925) (not start!97174) (not b!1105416) tp_is_empty!27405 (not b!1105415) (not b!1105419) (not b!1105410))
(check-sat)
