; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35610 () Bool)

(assert start!35610)

(declare-fun b_free!7879 () Bool)

(declare-fun b_next!7879 () Bool)

(assert (=> start!35610 (= b_free!7879 (not b_next!7879))))

(declare-fun tp!27620 () Bool)

(declare-fun b_and!15095 () Bool)

(assert (=> start!35610 (= tp!27620 b_and!15095)))

(declare-fun b!357228 () Bool)

(declare-fun res!198435 () Bool)

(declare-fun e!218717 () Bool)

(assert (=> b!357228 (=> (not res!198435) (not e!218717))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19709 0))(
  ( (array!19710 (arr!9348 (Array (_ BitVec 32) (_ BitVec 64))) (size!9701 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19709)

(declare-datatypes ((V!11747 0))(
  ( (V!11748 (val!4083 Int)) )
))
(declare-datatypes ((ValueCell!3695 0))(
  ( (ValueCellFull!3695 (v!6271 V!11747)) (EmptyCell!3695) )
))
(declare-datatypes ((array!19711 0))(
  ( (array!19712 (arr!9349 (Array (_ BitVec 32) ValueCell!3695)) (size!9702 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19711)

(assert (=> b!357228 (= res!198435 (and (= (size!9702 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9701 _keys!1456) (size!9702 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357229 () Bool)

(declare-fun res!198437 () Bool)

(assert (=> b!357229 (=> (not res!198437) (not e!218717))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!357229 (= res!198437 (not (= (select (arr!9348 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13623 () Bool)

(declare-fun mapRes!13623 () Bool)

(assert (=> mapIsEmpty!13623 mapRes!13623))

(declare-fun b!357230 () Bool)

(declare-fun res!198432 () Bool)

(assert (=> b!357230 (=> (not res!198432) (not e!218717))))

(declare-fun arrayContainsKey!0 (array!19709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357230 (= res!198432 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357231 () Bool)

(declare-fun res!198436 () Bool)

(assert (=> b!357231 (=> (not res!198436) (not e!218717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357231 (= res!198436 (validKeyInArray!0 k0!1077))))

(declare-fun b!357232 () Bool)

(declare-fun res!198434 () Bool)

(assert (=> b!357232 (=> (not res!198434) (not e!218717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19709 (_ BitVec 32)) Bool)

(assert (=> b!357232 (= res!198434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!198431 () Bool)

(assert (=> start!35610 (=> (not res!198431) (not e!218717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35610 (= res!198431 (validMask!0 mask!1842))))

(assert (=> start!35610 e!218717))

(declare-fun tp_is_empty!8077 () Bool)

(assert (=> start!35610 tp_is_empty!8077))

(assert (=> start!35610 true))

(assert (=> start!35610 tp!27620))

(declare-fun array_inv!6900 (array!19709) Bool)

(assert (=> start!35610 (array_inv!6900 _keys!1456)))

(declare-fun e!218718 () Bool)

(declare-fun array_inv!6901 (array!19711) Bool)

(assert (=> start!35610 (and (array_inv!6901 _values!1208) e!218718)))

(declare-fun b!357233 () Bool)

(declare-fun e!218716 () Bool)

(assert (=> b!357233 (= e!218716 true)))

(declare-fun minValue!1150 () V!11747)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11747)

(declare-datatypes ((tuple2!5678 0))(
  ( (tuple2!5679 (_1!2850 (_ BitVec 64)) (_2!2850 V!11747)) )
))
(declare-datatypes ((List!5363 0))(
  ( (Nil!5360) (Cons!5359 (h!6215 tuple2!5678) (t!10504 List!5363)) )
))
(declare-datatypes ((ListLongMap!4581 0))(
  ( (ListLongMap!4582 (toList!2306 List!5363)) )
))
(declare-fun contains!2396 (ListLongMap!4581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1811 (array!19709 array!19711 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 32) Int) ListLongMap!4581)

(assert (=> b!357233 (contains!2396 (getCurrentListMap!1811 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11004 0))(
  ( (Unit!11005) )
))
(declare-fun lt!165816 () Unit!11004)

(declare-fun lemmaArrayContainsKeyThenInListMap!344 (array!19709 array!19711 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 64) (_ BitVec 32) Int) Unit!11004)

(assert (=> b!357233 (= lt!165816 (lemmaArrayContainsKeyThenInListMap!344 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357234 () Bool)

(declare-fun res!198433 () Bool)

(assert (=> b!357234 (=> (not res!198433) (not e!218717))))

(declare-datatypes ((List!5364 0))(
  ( (Nil!5361) (Cons!5360 (h!6216 (_ BitVec 64)) (t!10505 List!5364)) )
))
(declare-fun arrayNoDuplicates!0 (array!19709 (_ BitVec 32) List!5364) Bool)

(assert (=> b!357234 (= res!198433 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5361))))

(declare-fun b!357235 () Bool)

(assert (=> b!357235 (= e!218717 (not e!218716))))

(declare-fun res!198438 () Bool)

(assert (=> b!357235 (=> res!198438 e!218716)))

(assert (=> b!357235 (= res!198438 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9701 _keys!1456))))))

(assert (=> b!357235 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!165817 () Unit!11004)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!29 (array!19709 array!19711 (_ BitVec 32) (_ BitVec 32) V!11747 V!11747 (_ BitVec 64) (_ BitVec 32)) Unit!11004)

(assert (=> b!357235 (= lt!165817 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!29 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13623 () Bool)

(declare-fun tp!27621 () Bool)

(declare-fun e!218721 () Bool)

(assert (=> mapNonEmpty!13623 (= mapRes!13623 (and tp!27621 e!218721))))

(declare-fun mapKey!13623 () (_ BitVec 32))

(declare-fun mapValue!13623 () ValueCell!3695)

(declare-fun mapRest!13623 () (Array (_ BitVec 32) ValueCell!3695))

(assert (=> mapNonEmpty!13623 (= (arr!9349 _values!1208) (store mapRest!13623 mapKey!13623 mapValue!13623))))

(declare-fun b!357236 () Bool)

(assert (=> b!357236 (= e!218721 tp_is_empty!8077)))

(declare-fun b!357237 () Bool)

(declare-fun res!198439 () Bool)

(assert (=> b!357237 (=> (not res!198439) (not e!218717))))

(assert (=> b!357237 (= res!198439 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9701 _keys!1456))))))

(declare-fun b!357238 () Bool)

(declare-fun e!218720 () Bool)

(assert (=> b!357238 (= e!218718 (and e!218720 mapRes!13623))))

(declare-fun condMapEmpty!13623 () Bool)

(declare-fun mapDefault!13623 () ValueCell!3695)

(assert (=> b!357238 (= condMapEmpty!13623 (= (arr!9349 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3695)) mapDefault!13623)))))

(declare-fun b!357239 () Bool)

(assert (=> b!357239 (= e!218720 tp_is_empty!8077)))

(assert (= (and start!35610 res!198431) b!357228))

(assert (= (and b!357228 res!198435) b!357232))

(assert (= (and b!357232 res!198434) b!357234))

(assert (= (and b!357234 res!198433) b!357231))

(assert (= (and b!357231 res!198436) b!357237))

(assert (= (and b!357237 res!198439) b!357230))

(assert (= (and b!357230 res!198432) b!357229))

(assert (= (and b!357229 res!198437) b!357235))

(assert (= (and b!357235 (not res!198438)) b!357233))

(assert (= (and b!357238 condMapEmpty!13623) mapIsEmpty!13623))

(assert (= (and b!357238 (not condMapEmpty!13623)) mapNonEmpty!13623))

(get-info :version)

(assert (= (and mapNonEmpty!13623 ((_ is ValueCellFull!3695) mapValue!13623)) b!357236))

(assert (= (and b!357238 ((_ is ValueCellFull!3695) mapDefault!13623)) b!357239))

(assert (= start!35610 b!357238))

(declare-fun m!354837 () Bool)

(assert (=> b!357235 m!354837))

(declare-fun m!354839 () Bool)

(assert (=> b!357235 m!354839))

(declare-fun m!354841 () Bool)

(assert (=> b!357233 m!354841))

(assert (=> b!357233 m!354841))

(declare-fun m!354843 () Bool)

(assert (=> b!357233 m!354843))

(declare-fun m!354845 () Bool)

(assert (=> b!357233 m!354845))

(declare-fun m!354847 () Bool)

(assert (=> b!357234 m!354847))

(declare-fun m!354849 () Bool)

(assert (=> b!357232 m!354849))

(declare-fun m!354851 () Bool)

(assert (=> b!357230 m!354851))

(declare-fun m!354853 () Bool)

(assert (=> b!357229 m!354853))

(declare-fun m!354855 () Bool)

(assert (=> b!357231 m!354855))

(declare-fun m!354857 () Bool)

(assert (=> mapNonEmpty!13623 m!354857))

(declare-fun m!354859 () Bool)

(assert (=> start!35610 m!354859))

(declare-fun m!354861 () Bool)

(assert (=> start!35610 m!354861))

(declare-fun m!354863 () Bool)

(assert (=> start!35610 m!354863))

(check-sat (not b!357234) b_and!15095 (not b!357230) tp_is_empty!8077 (not mapNonEmpty!13623) (not start!35610) (not b_next!7879) (not b!357235) (not b!357232) (not b!357231) (not b!357233))
(check-sat b_and!15095 (not b_next!7879))
