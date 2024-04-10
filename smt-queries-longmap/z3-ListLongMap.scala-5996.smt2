; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77830 () Bool)

(assert start!77830)

(declare-fun b_free!16389 () Bool)

(declare-fun b_next!16389 () Bool)

(assert (=> start!77830 (= b_free!16389 (not b_next!16389))))

(declare-fun tp!57431 () Bool)

(declare-fun b_and!26935 () Bool)

(assert (=> start!77830 (= tp!57431 b_and!26935)))

(declare-fun b!908637 () Bool)

(declare-fun res!613290 () Bool)

(declare-fun e!509264 () Bool)

(assert (=> b!908637 (=> (not res!613290) (not e!509264))))

(declare-datatypes ((V!30041 0))(
  ( (V!30042 (val!9454 Int)) )
))
(declare-datatypes ((ValueCell!8922 0))(
  ( (ValueCellFull!8922 (v!11961 V!30041)) (EmptyCell!8922) )
))
(declare-datatypes ((array!53644 0))(
  ( (array!53645 (arr!25780 (Array (_ BitVec 32) ValueCell!8922)) (size!26239 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53644)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53646 0))(
  ( (array!53647 (arr!25781 (Array (_ BitVec 32) (_ BitVec 64))) (size!26240 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53646)

(assert (=> b!908637 (= res!613290 (and (= (size!26239 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26240 _keys!1386) (size!26239 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29926 () Bool)

(declare-fun mapRes!29926 () Bool)

(assert (=> mapIsEmpty!29926 mapRes!29926))

(declare-fun b!908639 () Bool)

(declare-fun res!613284 () Bool)

(assert (=> b!908639 (=> (not res!613284) (not e!509264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53646 (_ BitVec 32)) Bool)

(assert (=> b!908639 (= res!613284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908640 () Bool)

(declare-fun res!613287 () Bool)

(assert (=> b!908640 (=> (not res!613287) (not e!509264))))

(declare-datatypes ((List!18113 0))(
  ( (Nil!18110) (Cons!18109 (h!19255 (_ BitVec 64)) (t!25674 List!18113)) )
))
(declare-fun arrayNoDuplicates!0 (array!53646 (_ BitVec 32) List!18113) Bool)

(assert (=> b!908640 (= res!613287 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18110))))

(declare-fun b!908641 () Bool)

(declare-fun e!509270 () Bool)

(declare-fun tp_is_empty!18807 () Bool)

(assert (=> b!908641 (= e!509270 tp_is_empty!18807)))

(declare-fun b!908642 () Bool)

(declare-fun res!613285 () Bool)

(declare-fun e!509265 () Bool)

(assert (=> b!908642 (=> (not res!613285) (not e!509265))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!908642 (= res!613285 (and (= (select (arr!25781 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908643 () Bool)

(declare-fun e!509266 () Bool)

(assert (=> b!908643 (= e!509266 true)))

(declare-datatypes ((tuple2!12318 0))(
  ( (tuple2!12319 (_1!6170 (_ BitVec 64)) (_2!6170 V!30041)) )
))
(declare-datatypes ((List!18114 0))(
  ( (Nil!18111) (Cons!18110 (h!19256 tuple2!12318) (t!25675 List!18114)) )
))
(declare-datatypes ((ListLongMap!11015 0))(
  ( (ListLongMap!11016 (toList!5523 List!18114)) )
))
(declare-fun lt!409790 () ListLongMap!11015)

(declare-fun lt!409789 () V!30041)

(declare-fun apply!504 (ListLongMap!11015 (_ BitVec 64)) V!30041)

(assert (=> b!908643 (= (apply!504 lt!409790 k0!1033) lt!409789)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30838 0))(
  ( (Unit!30839) )
))
(declare-fun lt!409786 () Unit!30838)

(declare-fun zeroValue!1094 () V!30041)

(declare-fun minValue!1094 () V!30041)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!56 (array!53646 array!53644 (_ BitVec 32) (_ BitVec 32) V!30041 V!30041 (_ BitVec 64) V!30041 (_ BitVec 32) Int) Unit!30838)

(assert (=> b!908643 (= lt!409786 (lemmaListMapApplyFromThenApplyFromZero!56 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409789 i!717 defaultEntry!1160))))

(declare-fun b!908644 () Bool)

(declare-fun e!509269 () Bool)

(assert (=> b!908644 (= e!509269 e!509266)))

(declare-fun res!613289 () Bool)

(assert (=> b!908644 (=> res!613289 e!509266)))

(declare-fun lt!409788 () ListLongMap!11015)

(declare-fun contains!4566 (ListLongMap!11015 (_ BitVec 64)) Bool)

(assert (=> b!908644 (= res!613289 (not (contains!4566 lt!409788 k0!1033)))))

(declare-fun getCurrentListMap!2786 (array!53646 array!53644 (_ BitVec 32) (_ BitVec 32) V!30041 V!30041 (_ BitVec 32) Int) ListLongMap!11015)

(assert (=> b!908644 (= lt!409788 (getCurrentListMap!2786 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908645 () Bool)

(declare-fun e!509268 () Bool)

(assert (=> b!908645 (= e!509268 (and e!509270 mapRes!29926))))

(declare-fun condMapEmpty!29926 () Bool)

(declare-fun mapDefault!29926 () ValueCell!8922)

(assert (=> b!908645 (= condMapEmpty!29926 (= (arr!25780 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8922)) mapDefault!29926)))))

(declare-fun b!908646 () Bool)

(declare-fun e!509267 () Bool)

(assert (=> b!908646 (= e!509267 tp_is_empty!18807)))

(declare-fun res!613291 () Bool)

(assert (=> start!77830 (=> (not res!613291) (not e!509264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77830 (= res!613291 (validMask!0 mask!1756))))

(assert (=> start!77830 e!509264))

(declare-fun array_inv!20182 (array!53644) Bool)

(assert (=> start!77830 (and (array_inv!20182 _values!1152) e!509268)))

(assert (=> start!77830 tp!57431))

(assert (=> start!77830 true))

(assert (=> start!77830 tp_is_empty!18807))

(declare-fun array_inv!20183 (array!53646) Bool)

(assert (=> start!77830 (array_inv!20183 _keys!1386)))

(declare-fun b!908638 () Bool)

(declare-fun res!613288 () Bool)

(assert (=> b!908638 (=> res!613288 e!509266)))

(assert (=> b!908638 (= res!613288 (not (= (apply!504 lt!409788 k0!1033) lt!409789)))))

(declare-fun b!908647 () Bool)

(assert (=> b!908647 (= e!509265 (not e!509269))))

(declare-fun res!613292 () Bool)

(assert (=> b!908647 (=> res!613292 e!509269)))

(assert (=> b!908647 (= res!613292 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26240 _keys!1386))))))

(declare-fun get!13572 (ValueCell!8922 V!30041) V!30041)

(declare-fun dynLambda!1379 (Int (_ BitVec 64)) V!30041)

(assert (=> b!908647 (= lt!409789 (get!13572 (select (arr!25780 _values!1152) i!717) (dynLambda!1379 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908647 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409787 () Unit!30838)

(declare-fun lemmaKeyInListMapIsInArray!251 (array!53646 array!53644 (_ BitVec 32) (_ BitVec 32) V!30041 V!30041 (_ BitVec 64) Int) Unit!30838)

(assert (=> b!908647 (= lt!409787 (lemmaKeyInListMapIsInArray!251 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!29926 () Bool)

(declare-fun tp!57432 () Bool)

(assert (=> mapNonEmpty!29926 (= mapRes!29926 (and tp!57432 e!509267))))

(declare-fun mapKey!29926 () (_ BitVec 32))

(declare-fun mapRest!29926 () (Array (_ BitVec 32) ValueCell!8922))

(declare-fun mapValue!29926 () ValueCell!8922)

(assert (=> mapNonEmpty!29926 (= (arr!25780 _values!1152) (store mapRest!29926 mapKey!29926 mapValue!29926))))

(declare-fun b!908648 () Bool)

(declare-fun res!613286 () Bool)

(assert (=> b!908648 (=> (not res!613286) (not e!509265))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908648 (= res!613286 (inRange!0 i!717 mask!1756))))

(declare-fun b!908649 () Bool)

(assert (=> b!908649 (= e!509264 e!509265)))

(declare-fun res!613293 () Bool)

(assert (=> b!908649 (=> (not res!613293) (not e!509265))))

(assert (=> b!908649 (= res!613293 (contains!4566 lt!409790 k0!1033))))

(assert (=> b!908649 (= lt!409790 (getCurrentListMap!2786 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(assert (= (and start!77830 res!613291) b!908637))

(assert (= (and b!908637 res!613290) b!908639))

(assert (= (and b!908639 res!613284) b!908640))

(assert (= (and b!908640 res!613287) b!908649))

(assert (= (and b!908649 res!613293) b!908648))

(assert (= (and b!908648 res!613286) b!908642))

(assert (= (and b!908642 res!613285) b!908647))

(assert (= (and b!908647 (not res!613292)) b!908644))

(assert (= (and b!908644 (not res!613289)) b!908638))

(assert (= (and b!908638 (not res!613288)) b!908643))

(assert (= (and b!908645 condMapEmpty!29926) mapIsEmpty!29926))

(assert (= (and b!908645 (not condMapEmpty!29926)) mapNonEmpty!29926))

(get-info :version)

(assert (= (and mapNonEmpty!29926 ((_ is ValueCellFull!8922) mapValue!29926)) b!908646))

(assert (= (and b!908645 ((_ is ValueCellFull!8922) mapDefault!29926)) b!908641))

(assert (= start!77830 b!908645))

(declare-fun b_lambda!13273 () Bool)

(assert (=> (not b_lambda!13273) (not b!908647)))

(declare-fun t!25673 () Bool)

(declare-fun tb!5411 () Bool)

(assert (=> (and start!77830 (= defaultEntry!1160 defaultEntry!1160) t!25673) tb!5411))

(declare-fun result!10619 () Bool)

(assert (=> tb!5411 (= result!10619 tp_is_empty!18807)))

(assert (=> b!908647 t!25673))

(declare-fun b_and!26937 () Bool)

(assert (= b_and!26935 (and (=> t!25673 result!10619) b_and!26937)))

(declare-fun m!843969 () Bool)

(assert (=> b!908638 m!843969))

(declare-fun m!843971 () Bool)

(assert (=> b!908644 m!843971))

(declare-fun m!843973 () Bool)

(assert (=> b!908644 m!843973))

(declare-fun m!843975 () Bool)

(assert (=> b!908639 m!843975))

(declare-fun m!843977 () Bool)

(assert (=> b!908640 m!843977))

(declare-fun m!843979 () Bool)

(assert (=> b!908649 m!843979))

(declare-fun m!843981 () Bool)

(assert (=> b!908649 m!843981))

(declare-fun m!843983 () Bool)

(assert (=> mapNonEmpty!29926 m!843983))

(declare-fun m!843985 () Bool)

(assert (=> start!77830 m!843985))

(declare-fun m!843987 () Bool)

(assert (=> start!77830 m!843987))

(declare-fun m!843989 () Bool)

(assert (=> start!77830 m!843989))

(declare-fun m!843991 () Bool)

(assert (=> b!908648 m!843991))

(declare-fun m!843993 () Bool)

(assert (=> b!908642 m!843993))

(declare-fun m!843995 () Bool)

(assert (=> b!908647 m!843995))

(declare-fun m!843997 () Bool)

(assert (=> b!908647 m!843997))

(declare-fun m!843999 () Bool)

(assert (=> b!908647 m!843999))

(declare-fun m!844001 () Bool)

(assert (=> b!908647 m!844001))

(assert (=> b!908647 m!843995))

(assert (=> b!908647 m!843999))

(declare-fun m!844003 () Bool)

(assert (=> b!908647 m!844003))

(declare-fun m!844005 () Bool)

(assert (=> b!908643 m!844005))

(declare-fun m!844007 () Bool)

(assert (=> b!908643 m!844007))

(check-sat (not b!908643) (not b!908639) (not b!908640) (not b_next!16389) (not b!908638) tp_is_empty!18807 b_and!26937 (not b!908648) (not b!908649) (not b_lambda!13273) (not start!77830) (not mapNonEmpty!29926) (not b!908647) (not b!908644))
(check-sat b_and!26937 (not b_next!16389))
