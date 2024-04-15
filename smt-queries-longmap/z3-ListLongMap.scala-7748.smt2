; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97226 () Bool)

(assert start!97226)

(declare-fun b!1106385 () Bool)

(declare-fun e!631331 () Bool)

(declare-fun tp_is_empty!27463 () Bool)

(assert (=> b!1106385 (= e!631331 tp_is_empty!27463)))

(declare-fun mapIsEmpty!43012 () Bool)

(declare-fun mapRes!43012 () Bool)

(assert (=> mapIsEmpty!43012 mapRes!43012))

(declare-fun b!1106386 () Bool)

(declare-fun e!631329 () Bool)

(assert (=> b!1106386 (= e!631329 (not true))))

(declare-datatypes ((array!71752 0))(
  ( (array!71753 (arr!34529 (Array (_ BitVec 32) (_ BitVec 64))) (size!35067 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71752)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106386 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36131 0))(
  ( (Unit!36132) )
))
(declare-fun lt!495276 () Unit!36131)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71752 (_ BitVec 64) (_ BitVec 32)) Unit!36131)

(assert (=> b!1106386 (= lt!495276 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106387 () Bool)

(declare-fun res!738377 () Bool)

(declare-fun e!631328 () Bool)

(assert (=> b!1106387 (=> (not res!738377) (not e!631328))))

(declare-datatypes ((List!24130 0))(
  ( (Nil!24127) (Cons!24126 (h!25335 (_ BitVec 64)) (t!34386 List!24130)) )
))
(declare-fun arrayNoDuplicates!0 (array!71752 (_ BitVec 32) List!24130) Bool)

(assert (=> b!1106387 (= res!738377 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24127))))

(declare-fun mapNonEmpty!43012 () Bool)

(declare-fun tp!81932 () Bool)

(assert (=> mapNonEmpty!43012 (= mapRes!43012 (and tp!81932 e!631331))))

(declare-datatypes ((V!41745 0))(
  ( (V!41746 (val!13788 Int)) )
))
(declare-datatypes ((ValueCell!13022 0))(
  ( (ValueCellFull!13022 (v!16420 V!41745)) (EmptyCell!13022) )
))
(declare-fun mapValue!43012 () ValueCell!13022)

(declare-fun mapRest!43012 () (Array (_ BitVec 32) ValueCell!13022))

(declare-fun mapKey!43012 () (_ BitVec 32))

(declare-datatypes ((array!71754 0))(
  ( (array!71755 (arr!34530 (Array (_ BitVec 32) ValueCell!13022)) (size!35068 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71754)

(assert (=> mapNonEmpty!43012 (= (arr!34530 _values!996) (store mapRest!43012 mapKey!43012 mapValue!43012))))

(declare-fun b!1106388 () Bool)

(declare-fun res!738372 () Bool)

(assert (=> b!1106388 (=> (not res!738372) (not e!631328))))

(assert (=> b!1106388 (= res!738372 (= (select (arr!34529 _keys!1208) i!673) k0!934))))

(declare-fun b!1106389 () Bool)

(declare-fun res!738370 () Bool)

(assert (=> b!1106389 (=> (not res!738370) (not e!631328))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71752 (_ BitVec 32)) Bool)

(assert (=> b!1106389 (= res!738370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106390 () Bool)

(assert (=> b!1106390 (= e!631328 e!631329)))

(declare-fun res!738371 () Bool)

(assert (=> b!1106390 (=> (not res!738371) (not e!631329))))

(declare-fun lt!495275 () array!71752)

(assert (=> b!1106390 (= res!738371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495275 mask!1564))))

(assert (=> b!1106390 (= lt!495275 (array!71753 (store (arr!34529 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35067 _keys!1208)))))

(declare-fun b!1106391 () Bool)

(declare-fun res!738378 () Bool)

(assert (=> b!1106391 (=> (not res!738378) (not e!631328))))

(assert (=> b!1106391 (= res!738378 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35067 _keys!1208))))))

(declare-fun b!1106393 () Bool)

(declare-fun res!738375 () Bool)

(assert (=> b!1106393 (=> (not res!738375) (not e!631328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106393 (= res!738375 (validMask!0 mask!1564))))

(declare-fun b!1106394 () Bool)

(declare-fun res!738373 () Bool)

(assert (=> b!1106394 (=> (not res!738373) (not e!631328))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106394 (= res!738373 (and (= (size!35068 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35067 _keys!1208) (size!35068 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106395 () Bool)

(declare-fun res!738374 () Bool)

(assert (=> b!1106395 (=> (not res!738374) (not e!631329))))

(assert (=> b!1106395 (= res!738374 (arrayNoDuplicates!0 lt!495275 #b00000000000000000000000000000000 Nil!24127))))

(declare-fun b!1106396 () Bool)

(declare-fun e!631332 () Bool)

(assert (=> b!1106396 (= e!631332 tp_is_empty!27463)))

(declare-fun b!1106397 () Bool)

(declare-fun res!738379 () Bool)

(assert (=> b!1106397 (=> (not res!738379) (not e!631328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106397 (= res!738379 (validKeyInArray!0 k0!934))))

(declare-fun res!738376 () Bool)

(assert (=> start!97226 (=> (not res!738376) (not e!631328))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97226 (= res!738376 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35067 _keys!1208))))))

(assert (=> start!97226 e!631328))

(declare-fun array_inv!26628 (array!71752) Bool)

(assert (=> start!97226 (array_inv!26628 _keys!1208)))

(assert (=> start!97226 true))

(declare-fun e!631330 () Bool)

(declare-fun array_inv!26629 (array!71754) Bool)

(assert (=> start!97226 (and (array_inv!26629 _values!996) e!631330)))

(declare-fun b!1106392 () Bool)

(assert (=> b!1106392 (= e!631330 (and e!631332 mapRes!43012))))

(declare-fun condMapEmpty!43012 () Bool)

(declare-fun mapDefault!43012 () ValueCell!13022)

(assert (=> b!1106392 (= condMapEmpty!43012 (= (arr!34530 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13022)) mapDefault!43012)))))

(assert (= (and start!97226 res!738376) b!1106393))

(assert (= (and b!1106393 res!738375) b!1106394))

(assert (= (and b!1106394 res!738373) b!1106389))

(assert (= (and b!1106389 res!738370) b!1106387))

(assert (= (and b!1106387 res!738377) b!1106391))

(assert (= (and b!1106391 res!738378) b!1106397))

(assert (= (and b!1106397 res!738379) b!1106388))

(assert (= (and b!1106388 res!738372) b!1106390))

(assert (= (and b!1106390 res!738371) b!1106395))

(assert (= (and b!1106395 res!738374) b!1106386))

(assert (= (and b!1106392 condMapEmpty!43012) mapIsEmpty!43012))

(assert (= (and b!1106392 (not condMapEmpty!43012)) mapNonEmpty!43012))

(get-info :version)

(assert (= (and mapNonEmpty!43012 ((_ is ValueCellFull!13022) mapValue!43012)) b!1106385))

(assert (= (and b!1106392 ((_ is ValueCellFull!13022) mapDefault!43012)) b!1106396))

(assert (= start!97226 b!1106392))

(declare-fun m!1024941 () Bool)

(assert (=> b!1106390 m!1024941))

(declare-fun m!1024943 () Bool)

(assert (=> b!1106390 m!1024943))

(declare-fun m!1024945 () Bool)

(assert (=> b!1106386 m!1024945))

(declare-fun m!1024947 () Bool)

(assert (=> b!1106386 m!1024947))

(declare-fun m!1024949 () Bool)

(assert (=> b!1106388 m!1024949))

(declare-fun m!1024951 () Bool)

(assert (=> b!1106397 m!1024951))

(declare-fun m!1024953 () Bool)

(assert (=> b!1106395 m!1024953))

(declare-fun m!1024955 () Bool)

(assert (=> mapNonEmpty!43012 m!1024955))

(declare-fun m!1024957 () Bool)

(assert (=> b!1106393 m!1024957))

(declare-fun m!1024959 () Bool)

(assert (=> start!97226 m!1024959))

(declare-fun m!1024961 () Bool)

(assert (=> start!97226 m!1024961))

(declare-fun m!1024963 () Bool)

(assert (=> b!1106389 m!1024963))

(declare-fun m!1024965 () Bool)

(assert (=> b!1106387 m!1024965))

(check-sat (not b!1106395) (not b!1106390) (not mapNonEmpty!43012) (not b!1106387) (not b!1106397) tp_is_empty!27463 (not b!1106389) (not b!1106386) (not start!97226) (not b!1106393))
(check-sat)
