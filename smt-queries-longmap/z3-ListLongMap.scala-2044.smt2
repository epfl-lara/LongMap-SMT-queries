; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35418 () Bool)

(assert start!35418)

(declare-fun b_free!7819 () Bool)

(declare-fun b_next!7819 () Bool)

(assert (=> start!35418 (= b_free!7819 (not b_next!7819))))

(declare-fun tp!27243 () Bool)

(declare-fun b_and!15035 () Bool)

(assert (=> start!35418 (= tp!27243 b_and!15035)))

(declare-fun b!354465 () Bool)

(declare-fun res!196536 () Bool)

(declare-fun e!217260 () Bool)

(assert (=> b!354465 (=> (not res!196536) (not e!217260))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19335 0))(
  ( (array!19336 (arr!9161 (Array (_ BitVec 32) (_ BitVec 64))) (size!9514 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19335)

(declare-datatypes ((V!11491 0))(
  ( (V!11492 (val!3987 Int)) )
))
(declare-datatypes ((ValueCell!3599 0))(
  ( (ValueCellFull!3599 (v!6175 V!11491)) (EmptyCell!3599) )
))
(declare-datatypes ((array!19337 0))(
  ( (array!19338 (arr!9162 (Array (_ BitVec 32) ValueCell!3599)) (size!9515 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19337)

(assert (=> b!354465 (= res!196536 (and (= (size!9515 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9514 _keys!1456) (size!9515 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354466 () Bool)

(declare-fun res!196533 () Bool)

(assert (=> b!354466 (=> (not res!196533) (not e!217260))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354466 (= res!196533 (validKeyInArray!0 (select (arr!9161 _keys!1456) from!1805)))))

(declare-fun mapNonEmpty!13335 () Bool)

(declare-fun mapRes!13335 () Bool)

(declare-fun tp!27242 () Bool)

(declare-fun e!217259 () Bool)

(assert (=> mapNonEmpty!13335 (= mapRes!13335 (and tp!27242 e!217259))))

(declare-fun mapValue!13335 () ValueCell!3599)

(declare-fun mapRest!13335 () (Array (_ BitVec 32) ValueCell!3599))

(declare-fun mapKey!13335 () (_ BitVec 32))

(assert (=> mapNonEmpty!13335 (= (arr!9162 _values!1208) (store mapRest!13335 mapKey!13335 mapValue!13335))))

(declare-fun mapIsEmpty!13335 () Bool)

(assert (=> mapIsEmpty!13335 mapRes!13335))

(declare-fun b!354467 () Bool)

(declare-fun res!196534 () Bool)

(assert (=> b!354467 (=> (not res!196534) (not e!217260))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!354467 (= res!196534 (= (select (arr!9161 _keys!1456) from!1805) k0!1077))))

(declare-fun b!354468 () Bool)

(declare-fun res!196539 () Bool)

(assert (=> b!354468 (=> (not res!196539) (not e!217260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19335 (_ BitVec 32)) Bool)

(assert (=> b!354468 (= res!196539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354469 () Bool)

(assert (=> b!354469 (= e!217260 (not true))))

(declare-fun minValue!1150 () V!11491)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11491)

(declare-datatypes ((tuple2!5638 0))(
  ( (tuple2!5639 (_1!2830 (_ BitVec 64)) (_2!2830 V!11491)) )
))
(declare-datatypes ((List!5278 0))(
  ( (Nil!5275) (Cons!5274 (h!6130 tuple2!5638) (t!10419 List!5278)) )
))
(declare-datatypes ((ListLongMap!4541 0))(
  ( (ListLongMap!4542 (toList!2286 List!5278)) )
))
(declare-fun contains!2376 (ListLongMap!4541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1791 (array!19335 array!19337 (_ BitVec 32) (_ BitVec 32) V!11491 V!11491 (_ BitVec 32) Int) ListLongMap!4541)

(assert (=> b!354469 (contains!2376 (getCurrentListMap!1791 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9161 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10918 0))(
  ( (Unit!10919) )
))
(declare-fun lt!165508 () Unit!10918)

(declare-fun lemmaValidKeyInArrayIsInListMap!183 (array!19335 array!19337 (_ BitVec 32) (_ BitVec 32) V!11491 V!11491 (_ BitVec 32) Int) Unit!10918)

(assert (=> b!354469 (= lt!165508 (lemmaValidKeyInArrayIsInListMap!183 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354471 () Bool)

(declare-fun res!196532 () Bool)

(assert (=> b!354471 (=> (not res!196532) (not e!217260))))

(declare-datatypes ((List!5279 0))(
  ( (Nil!5276) (Cons!5275 (h!6131 (_ BitVec 64)) (t!10420 List!5279)) )
))
(declare-fun arrayNoDuplicates!0 (array!19335 (_ BitVec 32) List!5279) Bool)

(assert (=> b!354471 (= res!196532 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5276))))

(declare-fun b!354472 () Bool)

(declare-fun e!217258 () Bool)

(declare-fun tp_is_empty!7885 () Bool)

(assert (=> b!354472 (= e!217258 tp_is_empty!7885)))

(declare-fun b!354473 () Bool)

(declare-fun res!196540 () Bool)

(assert (=> b!354473 (=> (not res!196540) (not e!217260))))

(declare-fun arrayContainsKey!0 (array!19335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354473 (= res!196540 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354474 () Bool)

(declare-fun e!217256 () Bool)

(assert (=> b!354474 (= e!217256 (and e!217258 mapRes!13335))))

(declare-fun condMapEmpty!13335 () Bool)

(declare-fun mapDefault!13335 () ValueCell!3599)

(assert (=> b!354474 (= condMapEmpty!13335 (= (arr!9162 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3599)) mapDefault!13335)))))

(declare-fun b!354475 () Bool)

(declare-fun res!196538 () Bool)

(assert (=> b!354475 (=> (not res!196538) (not e!217260))))

(assert (=> b!354475 (= res!196538 (validKeyInArray!0 k0!1077))))

(declare-fun b!354476 () Bool)

(assert (=> b!354476 (= e!217259 tp_is_empty!7885)))

(declare-fun res!196535 () Bool)

(assert (=> start!35418 (=> (not res!196535) (not e!217260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35418 (= res!196535 (validMask!0 mask!1842))))

(assert (=> start!35418 e!217260))

(assert (=> start!35418 tp_is_empty!7885))

(assert (=> start!35418 true))

(assert (=> start!35418 tp!27243))

(declare-fun array_inv!6784 (array!19335) Bool)

(assert (=> start!35418 (array_inv!6784 _keys!1456)))

(declare-fun array_inv!6785 (array!19337) Bool)

(assert (=> start!35418 (and (array_inv!6785 _values!1208) e!217256)))

(declare-fun b!354470 () Bool)

(declare-fun res!196537 () Bool)

(assert (=> b!354470 (=> (not res!196537) (not e!217260))))

(assert (=> b!354470 (= res!196537 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9514 _keys!1456))))))

(assert (= (and start!35418 res!196535) b!354465))

(assert (= (and b!354465 res!196536) b!354468))

(assert (= (and b!354468 res!196539) b!354471))

(assert (= (and b!354471 res!196532) b!354475))

(assert (= (and b!354475 res!196538) b!354470))

(assert (= (and b!354470 res!196537) b!354473))

(assert (= (and b!354473 res!196540) b!354467))

(assert (= (and b!354467 res!196534) b!354466))

(assert (= (and b!354466 res!196533) b!354469))

(assert (= (and b!354474 condMapEmpty!13335) mapIsEmpty!13335))

(assert (= (and b!354474 (not condMapEmpty!13335)) mapNonEmpty!13335))

(get-info :version)

(assert (= (and mapNonEmpty!13335 ((_ is ValueCellFull!3599) mapValue!13335)) b!354476))

(assert (= (and b!354474 ((_ is ValueCellFull!3599) mapDefault!13335)) b!354472))

(assert (= start!35418 b!354474))

(declare-fun m!352923 () Bool)

(assert (=> b!354467 m!352923))

(declare-fun m!352925 () Bool)

(assert (=> mapNonEmpty!13335 m!352925))

(declare-fun m!352927 () Bool)

(assert (=> b!354471 m!352927))

(declare-fun m!352929 () Bool)

(assert (=> start!35418 m!352929))

(declare-fun m!352931 () Bool)

(assert (=> start!35418 m!352931))

(declare-fun m!352933 () Bool)

(assert (=> start!35418 m!352933))

(declare-fun m!352935 () Bool)

(assert (=> b!354475 m!352935))

(assert (=> b!354466 m!352923))

(assert (=> b!354466 m!352923))

(declare-fun m!352937 () Bool)

(assert (=> b!354466 m!352937))

(declare-fun m!352939 () Bool)

(assert (=> b!354469 m!352939))

(assert (=> b!354469 m!352923))

(assert (=> b!354469 m!352939))

(assert (=> b!354469 m!352923))

(declare-fun m!352941 () Bool)

(assert (=> b!354469 m!352941))

(declare-fun m!352943 () Bool)

(assert (=> b!354469 m!352943))

(declare-fun m!352945 () Bool)

(assert (=> b!354468 m!352945))

(declare-fun m!352947 () Bool)

(assert (=> b!354473 m!352947))

(check-sat (not b!354466) (not mapNonEmpty!13335) b_and!15035 (not b!354468) (not start!35418) (not b!354473) (not b!354475) (not b_next!7819) (not b!354471) tp_is_empty!7885 (not b!354469))
(check-sat b_and!15035 (not b_next!7819))
