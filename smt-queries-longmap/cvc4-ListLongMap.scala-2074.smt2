; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35616 () Bool)

(assert start!35616)

(declare-fun b_free!7871 () Bool)

(declare-fun b_next!7871 () Bool)

(assert (=> start!35616 (= b_free!7871 (not b_next!7871))))

(declare-fun tp!27596 () Bool)

(declare-fun b_and!15113 () Bool)

(assert (=> start!35616 (= tp!27596 b_and!15113)))

(declare-fun b!357359 () Bool)

(declare-fun e!218825 () Bool)

(declare-fun tp_is_empty!8069 () Bool)

(assert (=> b!357359 (= e!218825 tp_is_empty!8069)))

(declare-fun res!198459 () Bool)

(declare-fun e!218822 () Bool)

(assert (=> start!35616 (=> (not res!198459) (not e!218822))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35616 (= res!198459 (validMask!0 mask!1842))))

(assert (=> start!35616 e!218822))

(assert (=> start!35616 tp_is_empty!8069))

(assert (=> start!35616 true))

(assert (=> start!35616 tp!27596))

(declare-datatypes ((array!19705 0))(
  ( (array!19706 (arr!9346 (Array (_ BitVec 32) (_ BitVec 64))) (size!9698 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19705)

(declare-fun array_inv!6870 (array!19705) Bool)

(assert (=> start!35616 (array_inv!6870 _keys!1456)))

(declare-datatypes ((V!11735 0))(
  ( (V!11736 (val!4079 Int)) )
))
(declare-datatypes ((ValueCell!3691 0))(
  ( (ValueCellFull!3691 (v!6273 V!11735)) (EmptyCell!3691) )
))
(declare-datatypes ((array!19707 0))(
  ( (array!19708 (arr!9347 (Array (_ BitVec 32) ValueCell!3691)) (size!9699 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19707)

(declare-fun e!218824 () Bool)

(declare-fun array_inv!6871 (array!19707) Bool)

(assert (=> start!35616 (and (array_inv!6871 _values!1208) e!218824)))

(declare-fun b!357360 () Bool)

(declare-fun res!198454 () Bool)

(assert (=> b!357360 (=> (not res!198454) (not e!218822))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!357360 (= res!198454 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9698 _keys!1456))))))

(declare-fun b!357361 () Bool)

(declare-fun e!218820 () Bool)

(assert (=> b!357361 (= e!218822 (not e!218820))))

(declare-fun res!198452 () Bool)

(assert (=> b!357361 (=> res!198452 e!218820)))

(assert (=> b!357361 (= res!198452 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9698 _keys!1456))))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357361 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11735)

(declare-datatypes ((Unit!11012 0))(
  ( (Unit!11013) )
))
(declare-fun lt!166027 () Unit!11012)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11735)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!25 (array!19705 array!19707 (_ BitVec 32) (_ BitVec 32) V!11735 V!11735 (_ BitVec 64) (_ BitVec 32)) Unit!11012)

(assert (=> b!357361 (= lt!166027 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!25 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357362 () Bool)

(assert (=> b!357362 (= e!218820 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5700 0))(
  ( (tuple2!5701 (_1!2861 (_ BitVec 64)) (_2!2861 V!11735)) )
))
(declare-datatypes ((List!5392 0))(
  ( (Nil!5389) (Cons!5388 (h!6244 tuple2!5700) (t!10542 List!5392)) )
))
(declare-datatypes ((ListLongMap!4613 0))(
  ( (ListLongMap!4614 (toList!2322 List!5392)) )
))
(declare-fun contains!2402 (ListLongMap!4613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1843 (array!19705 array!19707 (_ BitVec 32) (_ BitVec 32) V!11735 V!11735 (_ BitVec 32) Int) ListLongMap!4613)

(assert (=> b!357362 (contains!2402 (getCurrentListMap!1843 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k!1077)))

(declare-fun lt!166028 () Unit!11012)

(declare-fun lemmaArrayContainsKeyThenInListMap!338 (array!19705 array!19707 (_ BitVec 32) (_ BitVec 32) V!11735 V!11735 (_ BitVec 64) (_ BitVec 32) Int) Unit!11012)

(assert (=> b!357362 (= lt!166028 (lemmaArrayContainsKeyThenInListMap!338 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun mapNonEmpty!13611 () Bool)

(declare-fun mapRes!13611 () Bool)

(declare-fun tp!27597 () Bool)

(declare-fun e!218823 () Bool)

(assert (=> mapNonEmpty!13611 (= mapRes!13611 (and tp!27597 e!218823))))

(declare-fun mapValue!13611 () ValueCell!3691)

(declare-fun mapKey!13611 () (_ BitVec 32))

(declare-fun mapRest!13611 () (Array (_ BitVec 32) ValueCell!3691))

(assert (=> mapNonEmpty!13611 (= (arr!9347 _values!1208) (store mapRest!13611 mapKey!13611 mapValue!13611))))

(declare-fun b!357363 () Bool)

(assert (=> b!357363 (= e!218823 tp_is_empty!8069)))

(declare-fun b!357364 () Bool)

(declare-fun res!198456 () Bool)

(assert (=> b!357364 (=> (not res!198456) (not e!218822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19705 (_ BitVec 32)) Bool)

(assert (=> b!357364 (= res!198456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357365 () Bool)

(declare-fun res!198455 () Bool)

(assert (=> b!357365 (=> (not res!198455) (not e!218822))))

(assert (=> b!357365 (= res!198455 (and (= (size!9699 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9698 _keys!1456) (size!9699 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357366 () Bool)

(declare-fun res!198458 () Bool)

(assert (=> b!357366 (=> (not res!198458) (not e!218822))))

(declare-datatypes ((List!5393 0))(
  ( (Nil!5390) (Cons!5389 (h!6245 (_ BitVec 64)) (t!10543 List!5393)) )
))
(declare-fun arrayNoDuplicates!0 (array!19705 (_ BitVec 32) List!5393) Bool)

(assert (=> b!357366 (= res!198458 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5390))))

(declare-fun b!357367 () Bool)

(declare-fun res!198457 () Bool)

(assert (=> b!357367 (=> (not res!198457) (not e!218822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357367 (= res!198457 (validKeyInArray!0 k!1077))))

(declare-fun mapIsEmpty!13611 () Bool)

(assert (=> mapIsEmpty!13611 mapRes!13611))

(declare-fun b!357368 () Bool)

(declare-fun res!198460 () Bool)

(assert (=> b!357368 (=> (not res!198460) (not e!218822))))

(assert (=> b!357368 (= res!198460 (not (= (select (arr!9346 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357369 () Bool)

(declare-fun res!198453 () Bool)

(assert (=> b!357369 (=> (not res!198453) (not e!218822))))

(assert (=> b!357369 (= res!198453 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!357370 () Bool)

(assert (=> b!357370 (= e!218824 (and e!218825 mapRes!13611))))

(declare-fun condMapEmpty!13611 () Bool)

(declare-fun mapDefault!13611 () ValueCell!3691)

