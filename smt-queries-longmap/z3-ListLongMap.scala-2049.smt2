; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35448 () Bool)

(assert start!35448)

(declare-fun b_free!7849 () Bool)

(declare-fun b_next!7849 () Bool)

(assert (=> start!35448 (= b_free!7849 (not b_next!7849))))

(declare-fun tp!27333 () Bool)

(declare-fun b_and!15065 () Bool)

(assert (=> start!35448 (= tp!27333 b_and!15065)))

(declare-fun b!355005 () Bool)

(declare-fun e!217485 () Bool)

(declare-fun e!217482 () Bool)

(declare-fun mapRes!13380 () Bool)

(assert (=> b!355005 (= e!217485 (and e!217482 mapRes!13380))))

(declare-fun condMapEmpty!13380 () Bool)

(declare-datatypes ((V!11531 0))(
  ( (V!11532 (val!4002 Int)) )
))
(declare-datatypes ((ValueCell!3614 0))(
  ( (ValueCellFull!3614 (v!6190 V!11531)) (EmptyCell!3614) )
))
(declare-datatypes ((array!19395 0))(
  ( (array!19396 (arr!9191 (Array (_ BitVec 32) ValueCell!3614)) (size!9544 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19395)

(declare-fun mapDefault!13380 () ValueCell!3614)

(assert (=> b!355005 (= condMapEmpty!13380 (= (arr!9191 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3614)) mapDefault!13380)))))

(declare-fun b!355006 () Bool)

(declare-fun res!196943 () Bool)

(declare-fun e!217484 () Bool)

(assert (=> b!355006 (=> (not res!196943) (not e!217484))))

(declare-datatypes ((array!19397 0))(
  ( (array!19398 (arr!9192 (Array (_ BitVec 32) (_ BitVec 64))) (size!9545 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19397)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355006 (= res!196943 (validKeyInArray!0 (select (arr!9192 _keys!1456) from!1805)))))

(declare-fun mapNonEmpty!13380 () Bool)

(declare-fun tp!27332 () Bool)

(declare-fun e!217483 () Bool)

(assert (=> mapNonEmpty!13380 (= mapRes!13380 (and tp!27332 e!217483))))

(declare-fun mapKey!13380 () (_ BitVec 32))

(declare-fun mapRest!13380 () (Array (_ BitVec 32) ValueCell!3614))

(declare-fun mapValue!13380 () ValueCell!3614)

(assert (=> mapNonEmpty!13380 (= (arr!9191 _values!1208) (store mapRest!13380 mapKey!13380 mapValue!13380))))

(declare-fun b!355007 () Bool)

(declare-fun res!196940 () Bool)

(assert (=> b!355007 (=> (not res!196940) (not e!217484))))

(declare-datatypes ((List!5300 0))(
  ( (Nil!5297) (Cons!5296 (h!6152 (_ BitVec 64)) (t!10441 List!5300)) )
))
(declare-fun arrayNoDuplicates!0 (array!19397 (_ BitVec 32) List!5300) Bool)

(assert (=> b!355007 (= res!196940 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5297))))

(declare-fun b!355009 () Bool)

(declare-fun res!196944 () Bool)

(assert (=> b!355009 (=> (not res!196944) (not e!217484))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!355009 (= res!196944 (validKeyInArray!0 k0!1077))))

(declare-fun b!355010 () Bool)

(declare-fun res!196945 () Bool)

(assert (=> b!355010 (=> (not res!196945) (not e!217484))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19397 (_ BitVec 32)) Bool)

(assert (=> b!355010 (= res!196945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355011 () Bool)

(declare-fun res!196939 () Bool)

(assert (=> b!355011 (=> (not res!196939) (not e!217484))))

(assert (=> b!355011 (= res!196939 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9545 _keys!1456))))))

(declare-fun b!355012 () Bool)

(declare-fun res!196941 () Bool)

(assert (=> b!355012 (=> (not res!196941) (not e!217484))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355012 (= res!196941 (and (= (size!9544 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9545 _keys!1456) (size!9544 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355013 () Bool)

(declare-fun res!196937 () Bool)

(assert (=> b!355013 (=> (not res!196937) (not e!217484))))

(assert (=> b!355013 (= res!196937 (= (select (arr!9192 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355014 () Bool)

(declare-fun tp_is_empty!7915 () Bool)

(assert (=> b!355014 (= e!217483 tp_is_empty!7915)))

(declare-fun b!355015 () Bool)

(assert (=> b!355015 (= e!217484 (not true))))

(declare-fun minValue!1150 () V!11531)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11531)

(declare-datatypes ((tuple2!5658 0))(
  ( (tuple2!5659 (_1!2840 (_ BitVec 64)) (_2!2840 V!11531)) )
))
(declare-datatypes ((List!5301 0))(
  ( (Nil!5298) (Cons!5297 (h!6153 tuple2!5658) (t!10442 List!5301)) )
))
(declare-datatypes ((ListLongMap!4561 0))(
  ( (ListLongMap!4562 (toList!2296 List!5301)) )
))
(declare-fun contains!2386 (ListLongMap!4561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1801 (array!19397 array!19395 (_ BitVec 32) (_ BitVec 32) V!11531 V!11531 (_ BitVec 32) Int) ListLongMap!4561)

(assert (=> b!355015 (contains!2386 (getCurrentListMap!1801 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9192 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10938 0))(
  ( (Unit!10939) )
))
(declare-fun lt!165553 () Unit!10938)

(declare-fun lemmaValidKeyInArrayIsInListMap!193 (array!19397 array!19395 (_ BitVec 32) (_ BitVec 32) V!11531 V!11531 (_ BitVec 32) Int) Unit!10938)

(assert (=> b!355015 (= lt!165553 (lemmaValidKeyInArrayIsInListMap!193 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun res!196938 () Bool)

(assert (=> start!35448 (=> (not res!196938) (not e!217484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35448 (= res!196938 (validMask!0 mask!1842))))

(assert (=> start!35448 e!217484))

(assert (=> start!35448 tp_is_empty!7915))

(assert (=> start!35448 true))

(assert (=> start!35448 tp!27333))

(declare-fun array_inv!6804 (array!19397) Bool)

(assert (=> start!35448 (array_inv!6804 _keys!1456)))

(declare-fun array_inv!6805 (array!19395) Bool)

(assert (=> start!35448 (and (array_inv!6805 _values!1208) e!217485)))

(declare-fun b!355008 () Bool)

(declare-fun res!196942 () Bool)

(assert (=> b!355008 (=> (not res!196942) (not e!217484))))

(declare-fun arrayContainsKey!0 (array!19397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355008 (= res!196942 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13380 () Bool)

(assert (=> mapIsEmpty!13380 mapRes!13380))

(declare-fun b!355016 () Bool)

(assert (=> b!355016 (= e!217482 tp_is_empty!7915)))

(assert (= (and start!35448 res!196938) b!355012))

(assert (= (and b!355012 res!196941) b!355010))

(assert (= (and b!355010 res!196945) b!355007))

(assert (= (and b!355007 res!196940) b!355009))

(assert (= (and b!355009 res!196944) b!355011))

(assert (= (and b!355011 res!196939) b!355008))

(assert (= (and b!355008 res!196942) b!355013))

(assert (= (and b!355013 res!196937) b!355006))

(assert (= (and b!355006 res!196943) b!355015))

(assert (= (and b!355005 condMapEmpty!13380) mapIsEmpty!13380))

(assert (= (and b!355005 (not condMapEmpty!13380)) mapNonEmpty!13380))

(get-info :version)

(assert (= (and mapNonEmpty!13380 ((_ is ValueCellFull!3614) mapValue!13380)) b!355014))

(assert (= (and b!355005 ((_ is ValueCellFull!3614) mapDefault!13380)) b!355016))

(assert (= start!35448 b!355005))

(declare-fun m!353313 () Bool)

(assert (=> b!355015 m!353313))

(declare-fun m!353315 () Bool)

(assert (=> b!355015 m!353315))

(assert (=> b!355015 m!353313))

(assert (=> b!355015 m!353315))

(declare-fun m!353317 () Bool)

(assert (=> b!355015 m!353317))

(declare-fun m!353319 () Bool)

(assert (=> b!355015 m!353319))

(declare-fun m!353321 () Bool)

(assert (=> mapNonEmpty!13380 m!353321))

(declare-fun m!353323 () Bool)

(assert (=> b!355007 m!353323))

(declare-fun m!353325 () Bool)

(assert (=> b!355010 m!353325))

(declare-fun m!353327 () Bool)

(assert (=> b!355009 m!353327))

(declare-fun m!353329 () Bool)

(assert (=> start!35448 m!353329))

(declare-fun m!353331 () Bool)

(assert (=> start!35448 m!353331))

(declare-fun m!353333 () Bool)

(assert (=> start!35448 m!353333))

(declare-fun m!353335 () Bool)

(assert (=> b!355008 m!353335))

(assert (=> b!355013 m!353315))

(assert (=> b!355006 m!353315))

(assert (=> b!355006 m!353315))

(declare-fun m!353337 () Bool)

(assert (=> b!355006 m!353337))

(check-sat (not b!355006) (not b!355007) (not b!355010) b_and!15065 tp_is_empty!7915 (not b!355009) (not mapNonEmpty!13380) (not b!355008) (not b!355015) (not start!35448) (not b_next!7849))
(check-sat b_and!15065 (not b_next!7849))
