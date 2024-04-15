; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35622 () Bool)

(assert start!35622)

(declare-fun b_free!7891 () Bool)

(declare-fun b_next!7891 () Bool)

(assert (=> start!35622 (= b_free!7891 (not b_next!7891))))

(declare-fun tp!27657 () Bool)

(declare-fun b_and!15107 () Bool)

(assert (=> start!35622 (= tp!27657 b_and!15107)))

(declare-fun b!357444 () Bool)

(declare-fun res!198599 () Bool)

(declare-fun e!218826 () Bool)

(assert (=> b!357444 (=> (not res!198599) (not e!218826))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11763 0))(
  ( (V!11764 (val!4089 Int)) )
))
(declare-datatypes ((ValueCell!3701 0))(
  ( (ValueCellFull!3701 (v!6277 V!11763)) (EmptyCell!3701) )
))
(declare-datatypes ((array!19729 0))(
  ( (array!19730 (arr!9358 (Array (_ BitVec 32) ValueCell!3701)) (size!9711 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19729)

(declare-datatypes ((array!19731 0))(
  ( (array!19732 (arr!9359 (Array (_ BitVec 32) (_ BitVec 64))) (size!9712 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19731)

(assert (=> b!357444 (= res!198599 (and (= (size!9711 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9712 _keys!1456) (size!9711 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357445 () Bool)

(declare-fun e!218827 () Bool)

(declare-fun tp_is_empty!8089 () Bool)

(assert (=> b!357445 (= e!218827 tp_is_empty!8089)))

(declare-fun b!357446 () Bool)

(declare-fun e!218825 () Bool)

(assert (=> b!357446 (= e!218825 tp_is_empty!8089)))

(declare-fun b!357447 () Bool)

(declare-fun res!198601 () Bool)

(assert (=> b!357447 (=> (not res!198601) (not e!218826))))

(declare-datatypes ((List!5369 0))(
  ( (Nil!5366) (Cons!5365 (h!6221 (_ BitVec 64)) (t!10510 List!5369)) )
))
(declare-fun arrayNoDuplicates!0 (array!19731 (_ BitVec 32) List!5369) Bool)

(assert (=> b!357447 (= res!198601 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5366))))

(declare-fun b!357448 () Bool)

(declare-fun res!198596 () Bool)

(assert (=> b!357448 (=> (not res!198596) (not e!218826))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357448 (= res!198596 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357449 () Bool)

(declare-fun e!218828 () Bool)

(assert (=> b!357449 (= e!218828 true)))

(declare-fun minValue!1150 () V!11763)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11763)

(declare-datatypes ((tuple2!5684 0))(
  ( (tuple2!5685 (_1!2853 (_ BitVec 64)) (_2!2853 V!11763)) )
))
(declare-datatypes ((List!5370 0))(
  ( (Nil!5367) (Cons!5366 (h!6222 tuple2!5684) (t!10511 List!5370)) )
))
(declare-datatypes ((ListLongMap!4587 0))(
  ( (ListLongMap!4588 (toList!2309 List!5370)) )
))
(declare-fun contains!2399 (ListLongMap!4587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1814 (array!19731 array!19729 (_ BitVec 32) (_ BitVec 32) V!11763 V!11763 (_ BitVec 32) Int) ListLongMap!4587)

(assert (=> b!357449 (contains!2399 (getCurrentListMap!1814 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11010 0))(
  ( (Unit!11011) )
))
(declare-fun lt!165853 () Unit!11010)

(declare-fun lemmaArrayContainsKeyThenInListMap!347 (array!19731 array!19729 (_ BitVec 32) (_ BitVec 32) V!11763 V!11763 (_ BitVec 64) (_ BitVec 32) Int) Unit!11010)

(assert (=> b!357449 (= lt!165853 (lemmaArrayContainsKeyThenInListMap!347 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun mapNonEmpty!13641 () Bool)

(declare-fun mapRes!13641 () Bool)

(declare-fun tp!27656 () Bool)

(assert (=> mapNonEmpty!13641 (= mapRes!13641 (and tp!27656 e!218827))))

(declare-fun mapRest!13641 () (Array (_ BitVec 32) ValueCell!3701))

(declare-fun mapKey!13641 () (_ BitVec 32))

(declare-fun mapValue!13641 () ValueCell!3701)

(assert (=> mapNonEmpty!13641 (= (arr!9358 _values!1208) (store mapRest!13641 mapKey!13641 mapValue!13641))))

(declare-fun b!357451 () Bool)

(assert (=> b!357451 (= e!218826 (not e!218828))))

(declare-fun res!198600 () Bool)

(assert (=> b!357451 (=> res!198600 e!218828)))

(assert (=> b!357451 (= res!198600 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9712 _keys!1456))))))

(assert (=> b!357451 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!165852 () Unit!11010)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!32 (array!19731 array!19729 (_ BitVec 32) (_ BitVec 32) V!11763 V!11763 (_ BitVec 64) (_ BitVec 32)) Unit!11010)

(assert (=> b!357451 (= lt!165852 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!32 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13641 () Bool)

(assert (=> mapIsEmpty!13641 mapRes!13641))

(declare-fun b!357452 () Bool)

(declare-fun res!198598 () Bool)

(assert (=> b!357452 (=> (not res!198598) (not e!218826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357452 (= res!198598 (validKeyInArray!0 k0!1077))))

(declare-fun b!357453 () Bool)

(declare-fun res!198597 () Bool)

(assert (=> b!357453 (=> (not res!198597) (not e!218826))))

(assert (=> b!357453 (= res!198597 (not (= (select (arr!9359 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357454 () Bool)

(declare-fun res!198593 () Bool)

(assert (=> b!357454 (=> (not res!198593) (not e!218826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19731 (_ BitVec 32)) Bool)

(assert (=> b!357454 (= res!198593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357455 () Bool)

(declare-fun e!218824 () Bool)

(assert (=> b!357455 (= e!218824 (and e!218825 mapRes!13641))))

(declare-fun condMapEmpty!13641 () Bool)

(declare-fun mapDefault!13641 () ValueCell!3701)

(assert (=> b!357455 (= condMapEmpty!13641 (= (arr!9358 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3701)) mapDefault!13641)))))

(declare-fun res!198594 () Bool)

(assert (=> start!35622 (=> (not res!198594) (not e!218826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35622 (= res!198594 (validMask!0 mask!1842))))

(assert (=> start!35622 e!218826))

(assert (=> start!35622 tp_is_empty!8089))

(assert (=> start!35622 true))

(assert (=> start!35622 tp!27657))

(declare-fun array_inv!6906 (array!19731) Bool)

(assert (=> start!35622 (array_inv!6906 _keys!1456)))

(declare-fun array_inv!6907 (array!19729) Bool)

(assert (=> start!35622 (and (array_inv!6907 _values!1208) e!218824)))

(declare-fun b!357450 () Bool)

(declare-fun res!198595 () Bool)

(assert (=> b!357450 (=> (not res!198595) (not e!218826))))

(assert (=> b!357450 (= res!198595 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9712 _keys!1456))))))

(assert (= (and start!35622 res!198594) b!357444))

(assert (= (and b!357444 res!198599) b!357454))

(assert (= (and b!357454 res!198593) b!357447))

(assert (= (and b!357447 res!198601) b!357452))

(assert (= (and b!357452 res!198598) b!357450))

(assert (= (and b!357450 res!198595) b!357448))

(assert (= (and b!357448 res!198596) b!357453))

(assert (= (and b!357453 res!198597) b!357451))

(assert (= (and b!357451 (not res!198600)) b!357449))

(assert (= (and b!357455 condMapEmpty!13641) mapIsEmpty!13641))

(assert (= (and b!357455 (not condMapEmpty!13641)) mapNonEmpty!13641))

(get-info :version)

(assert (= (and mapNonEmpty!13641 ((_ is ValueCellFull!3701) mapValue!13641)) b!357445))

(assert (= (and b!357455 ((_ is ValueCellFull!3701) mapDefault!13641)) b!357446))

(assert (= start!35622 b!357455))

(declare-fun m!355005 () Bool)

(assert (=> b!357451 m!355005))

(declare-fun m!355007 () Bool)

(assert (=> b!357451 m!355007))

(declare-fun m!355009 () Bool)

(assert (=> b!357454 m!355009))

(declare-fun m!355011 () Bool)

(assert (=> b!357452 m!355011))

(declare-fun m!355013 () Bool)

(assert (=> b!357447 m!355013))

(declare-fun m!355015 () Bool)

(assert (=> mapNonEmpty!13641 m!355015))

(declare-fun m!355017 () Bool)

(assert (=> b!357453 m!355017))

(declare-fun m!355019 () Bool)

(assert (=> b!357449 m!355019))

(assert (=> b!357449 m!355019))

(declare-fun m!355021 () Bool)

(assert (=> b!357449 m!355021))

(declare-fun m!355023 () Bool)

(assert (=> b!357449 m!355023))

(declare-fun m!355025 () Bool)

(assert (=> b!357448 m!355025))

(declare-fun m!355027 () Bool)

(assert (=> start!35622 m!355027))

(declare-fun m!355029 () Bool)

(assert (=> start!35622 m!355029))

(declare-fun m!355031 () Bool)

(assert (=> start!35622 m!355031))

(check-sat (not start!35622) b_and!15107 (not b!357451) (not b!357452) (not mapNonEmpty!13641) (not b!357447) (not b!357448) tp_is_empty!8089 (not b_next!7891) (not b!357454) (not b!357449))
(check-sat b_and!15107 (not b_next!7891))
