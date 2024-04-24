; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35448 () Bool)

(assert start!35448)

(declare-fun b_free!7849 () Bool)

(declare-fun b_next!7849 () Bool)

(assert (=> start!35448 (= b_free!7849 (not b_next!7849))))

(declare-fun tp!27333 () Bool)

(declare-fun b_and!15105 () Bool)

(assert (=> start!35448 (= tp!27333 b_and!15105)))

(declare-fun b!355227 () Bool)

(declare-fun res!197071 () Bool)

(declare-fun e!217625 () Bool)

(assert (=> b!355227 (=> (not res!197071) (not e!217625))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19400 0))(
  ( (array!19401 (arr!9193 (Array (_ BitVec 32) (_ BitVec 64))) (size!9545 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19400)

(declare-datatypes ((V!11531 0))(
  ( (V!11532 (val!4002 Int)) )
))
(declare-datatypes ((ValueCell!3614 0))(
  ( (ValueCellFull!3614 (v!6197 V!11531)) (EmptyCell!3614) )
))
(declare-datatypes ((array!19402 0))(
  ( (array!19403 (arr!9194 (Array (_ BitVec 32) ValueCell!3614)) (size!9546 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19402)

(assert (=> b!355227 (= res!197071 (and (= (size!9546 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9545 _keys!1456) (size!9546 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355228 () Bool)

(assert (=> b!355228 (= e!217625 (not true))))

(declare-fun minValue!1150 () V!11531)

(declare-fun defaultEntry!1216 () Int)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11531)

(declare-datatypes ((tuple2!5602 0))(
  ( (tuple2!5603 (_1!2812 (_ BitVec 64)) (_2!2812 V!11531)) )
))
(declare-datatypes ((List!5238 0))(
  ( (Nil!5235) (Cons!5234 (h!6090 tuple2!5602) (t!10380 List!5238)) )
))
(declare-datatypes ((ListLongMap!4517 0))(
  ( (ListLongMap!4518 (toList!2274 List!5238)) )
))
(declare-fun contains!2373 (ListLongMap!4517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1802 (array!19400 array!19402 (_ BitVec 32) (_ BitVec 32) V!11531 V!11531 (_ BitVec 32) Int) ListLongMap!4517)

(assert (=> b!355228 (contains!2373 (getCurrentListMap!1802 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9193 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10933 0))(
  ( (Unit!10934) )
))
(declare-fun lt!165806 () Unit!10933)

(declare-fun lemmaValidKeyInArrayIsInListMap!192 (array!19400 array!19402 (_ BitVec 32) (_ BitVec 32) V!11531 V!11531 (_ BitVec 32) Int) Unit!10933)

(assert (=> b!355228 (= lt!165806 (lemmaValidKeyInArrayIsInListMap!192 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!355229 () Bool)

(declare-fun res!197066 () Bool)

(assert (=> b!355229 (=> (not res!197066) (not e!217625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355229 (= res!197066 (validKeyInArray!0 (select (arr!9193 _keys!1456) from!1805)))))

(declare-fun b!355230 () Bool)

(declare-fun e!217624 () Bool)

(declare-fun tp_is_empty!7915 () Bool)

(assert (=> b!355230 (= e!217624 tp_is_empty!7915)))

(declare-fun b!355231 () Bool)

(declare-fun res!197070 () Bool)

(assert (=> b!355231 (=> (not res!197070) (not e!217625))))

(declare-datatypes ((List!5239 0))(
  ( (Nil!5236) (Cons!5235 (h!6091 (_ BitVec 64)) (t!10381 List!5239)) )
))
(declare-fun arrayNoDuplicates!0 (array!19400 (_ BitVec 32) List!5239) Bool)

(assert (=> b!355231 (= res!197070 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5236))))

(declare-fun mapIsEmpty!13380 () Bool)

(declare-fun mapRes!13380 () Bool)

(assert (=> mapIsEmpty!13380 mapRes!13380))

(declare-fun b!355232 () Bool)

(declare-fun res!197069 () Bool)

(assert (=> b!355232 (=> (not res!197069) (not e!217625))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355232 (= res!197069 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355233 () Bool)

(declare-fun res!197063 () Bool)

(assert (=> b!355233 (=> (not res!197063) (not e!217625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19400 (_ BitVec 32)) Bool)

(assert (=> b!355233 (= res!197063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355235 () Bool)

(declare-fun res!197064 () Bool)

(assert (=> b!355235 (=> (not res!197064) (not e!217625))))

(assert (=> b!355235 (= res!197064 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13380 () Bool)

(declare-fun tp!27332 () Bool)

(declare-fun e!217626 () Bool)

(assert (=> mapNonEmpty!13380 (= mapRes!13380 (and tp!27332 e!217626))))

(declare-fun mapKey!13380 () (_ BitVec 32))

(declare-fun mapValue!13380 () ValueCell!3614)

(declare-fun mapRest!13380 () (Array (_ BitVec 32) ValueCell!3614))

(assert (=> mapNonEmpty!13380 (= (arr!9194 _values!1208) (store mapRest!13380 mapKey!13380 mapValue!13380))))

(declare-fun b!355234 () Bool)

(assert (=> b!355234 (= e!217626 tp_is_empty!7915)))

(declare-fun res!197065 () Bool)

(assert (=> start!35448 (=> (not res!197065) (not e!217625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35448 (= res!197065 (validMask!0 mask!1842))))

(assert (=> start!35448 e!217625))

(assert (=> start!35448 tp_is_empty!7915))

(assert (=> start!35448 true))

(assert (=> start!35448 tp!27333))

(declare-fun array_inv!6796 (array!19400) Bool)

(assert (=> start!35448 (array_inv!6796 _keys!1456)))

(declare-fun e!217623 () Bool)

(declare-fun array_inv!6797 (array!19402) Bool)

(assert (=> start!35448 (and (array_inv!6797 _values!1208) e!217623)))

(declare-fun b!355236 () Bool)

(assert (=> b!355236 (= e!217623 (and e!217624 mapRes!13380))))

(declare-fun condMapEmpty!13380 () Bool)

(declare-fun mapDefault!13380 () ValueCell!3614)

(assert (=> b!355236 (= condMapEmpty!13380 (= (arr!9194 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3614)) mapDefault!13380)))))

(declare-fun b!355237 () Bool)

(declare-fun res!197067 () Bool)

(assert (=> b!355237 (=> (not res!197067) (not e!217625))))

(assert (=> b!355237 (= res!197067 (= (select (arr!9193 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355238 () Bool)

(declare-fun res!197068 () Bool)

(assert (=> b!355238 (=> (not res!197068) (not e!217625))))

(assert (=> b!355238 (= res!197068 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9545 _keys!1456))))))

(assert (= (and start!35448 res!197065) b!355227))

(assert (= (and b!355227 res!197071) b!355233))

(assert (= (and b!355233 res!197063) b!355231))

(assert (= (and b!355231 res!197070) b!355235))

(assert (= (and b!355235 res!197064) b!355238))

(assert (= (and b!355238 res!197068) b!355232))

(assert (= (and b!355232 res!197069) b!355237))

(assert (= (and b!355237 res!197067) b!355229))

(assert (= (and b!355229 res!197066) b!355228))

(assert (= (and b!355236 condMapEmpty!13380) mapIsEmpty!13380))

(assert (= (and b!355236 (not condMapEmpty!13380)) mapNonEmpty!13380))

(get-info :version)

(assert (= (and mapNonEmpty!13380 ((_ is ValueCellFull!3614) mapValue!13380)) b!355234))

(assert (= (and b!355236 ((_ is ValueCellFull!3614) mapDefault!13380)) b!355230))

(assert (= start!35448 b!355236))

(declare-fun m!354267 () Bool)

(assert (=> b!355235 m!354267))

(declare-fun m!354269 () Bool)

(assert (=> b!355237 m!354269))

(declare-fun m!354271 () Bool)

(assert (=> b!355233 m!354271))

(declare-fun m!354273 () Bool)

(assert (=> mapNonEmpty!13380 m!354273))

(assert (=> b!355229 m!354269))

(assert (=> b!355229 m!354269))

(declare-fun m!354275 () Bool)

(assert (=> b!355229 m!354275))

(declare-fun m!354277 () Bool)

(assert (=> b!355231 m!354277))

(declare-fun m!354279 () Bool)

(assert (=> b!355228 m!354279))

(assert (=> b!355228 m!354269))

(assert (=> b!355228 m!354279))

(assert (=> b!355228 m!354269))

(declare-fun m!354281 () Bool)

(assert (=> b!355228 m!354281))

(declare-fun m!354283 () Bool)

(assert (=> b!355228 m!354283))

(declare-fun m!354285 () Bool)

(assert (=> b!355232 m!354285))

(declare-fun m!354287 () Bool)

(assert (=> start!35448 m!354287))

(declare-fun m!354289 () Bool)

(assert (=> start!35448 m!354289))

(declare-fun m!354291 () Bool)

(assert (=> start!35448 m!354291))

(check-sat (not b!355235) (not b!355228) (not start!35448) (not b!355231) (not b!355232) (not b!355233) (not b!355229) b_and!15105 tp_is_empty!7915 (not b_next!7849) (not mapNonEmpty!13380))
(check-sat b_and!15105 (not b_next!7849))
