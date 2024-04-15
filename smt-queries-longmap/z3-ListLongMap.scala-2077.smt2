; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35616 () Bool)

(assert start!35616)

(declare-fun b_free!7885 () Bool)

(declare-fun b_next!7885 () Bool)

(assert (=> start!35616 (= b_free!7885 (not b_next!7885))))

(declare-fun tp!27638 () Bool)

(declare-fun b_and!15101 () Bool)

(assert (=> start!35616 (= tp!27638 b_and!15101)))

(declare-fun mapNonEmpty!13632 () Bool)

(declare-fun mapRes!13632 () Bool)

(declare-fun tp!27639 () Bool)

(declare-fun e!218772 () Bool)

(assert (=> mapNonEmpty!13632 (= mapRes!13632 (and tp!27639 e!218772))))

(declare-datatypes ((V!11755 0))(
  ( (V!11756 (val!4086 Int)) )
))
(declare-datatypes ((ValueCell!3698 0))(
  ( (ValueCellFull!3698 (v!6274 V!11755)) (EmptyCell!3698) )
))
(declare-fun mapRest!13632 () (Array (_ BitVec 32) ValueCell!3698))

(declare-fun mapValue!13632 () ValueCell!3698)

(declare-datatypes ((array!19719 0))(
  ( (array!19720 (arr!9353 (Array (_ BitVec 32) ValueCell!3698)) (size!9706 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19719)

(declare-fun mapKey!13632 () (_ BitVec 32))

(assert (=> mapNonEmpty!13632 (= (arr!9353 _values!1208) (store mapRest!13632 mapKey!13632 mapValue!13632))))

(declare-fun b!357336 () Bool)

(declare-fun res!198512 () Bool)

(declare-fun e!218773 () Bool)

(assert (=> b!357336 (=> (not res!198512) (not e!218773))))

(declare-datatypes ((array!19721 0))(
  ( (array!19722 (arr!9354 (Array (_ BitVec 32) (_ BitVec 64))) (size!9707 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19721)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357336 (= res!198512 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13632 () Bool)

(assert (=> mapIsEmpty!13632 mapRes!13632))

(declare-fun b!357337 () Bool)

(declare-fun e!218775 () Bool)

(assert (=> b!357337 (= e!218775 true)))

(declare-fun minValue!1150 () V!11755)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11755)

(declare-datatypes ((tuple2!5682 0))(
  ( (tuple2!5683 (_1!2852 (_ BitVec 64)) (_2!2852 V!11755)) )
))
(declare-datatypes ((List!5366 0))(
  ( (Nil!5363) (Cons!5362 (h!6218 tuple2!5682) (t!10507 List!5366)) )
))
(declare-datatypes ((ListLongMap!4585 0))(
  ( (ListLongMap!4586 (toList!2308 List!5366)) )
))
(declare-fun contains!2398 (ListLongMap!4585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1813 (array!19721 array!19719 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 32) Int) ListLongMap!4585)

(assert (=> b!357337 (contains!2398 (getCurrentListMap!1813 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11008 0))(
  ( (Unit!11009) )
))
(declare-fun lt!165834 () Unit!11008)

(declare-fun lemmaArrayContainsKeyThenInListMap!346 (array!19721 array!19719 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 64) (_ BitVec 32) Int) Unit!11008)

(assert (=> b!357337 (= lt!165834 (lemmaArrayContainsKeyThenInListMap!346 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357338 () Bool)

(declare-fun res!198514 () Bool)

(assert (=> b!357338 (=> (not res!198514) (not e!218773))))

(declare-datatypes ((List!5367 0))(
  ( (Nil!5364) (Cons!5363 (h!6219 (_ BitVec 64)) (t!10508 List!5367)) )
))
(declare-fun arrayNoDuplicates!0 (array!19721 (_ BitVec 32) List!5367) Bool)

(assert (=> b!357338 (= res!198514 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5364))))

(declare-fun b!357339 () Bool)

(declare-fun res!198513 () Bool)

(assert (=> b!357339 (=> (not res!198513) (not e!218773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357339 (= res!198513 (validKeyInArray!0 k0!1077))))

(declare-fun b!357340 () Bool)

(declare-fun e!218770 () Bool)

(declare-fun tp_is_empty!8083 () Bool)

(assert (=> b!357340 (= e!218770 tp_is_empty!8083)))

(declare-fun b!357341 () Bool)

(declare-fun res!198516 () Bool)

(assert (=> b!357341 (=> (not res!198516) (not e!218773))))

(assert (=> b!357341 (= res!198516 (and (= (size!9706 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9707 _keys!1456) (size!9706 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!198518 () Bool)

(assert (=> start!35616 (=> (not res!198518) (not e!218773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35616 (= res!198518 (validMask!0 mask!1842))))

(assert (=> start!35616 e!218773))

(assert (=> start!35616 tp_is_empty!8083))

(assert (=> start!35616 true))

(assert (=> start!35616 tp!27638))

(declare-fun array_inv!6902 (array!19721) Bool)

(assert (=> start!35616 (array_inv!6902 _keys!1456)))

(declare-fun e!218771 () Bool)

(declare-fun array_inv!6903 (array!19719) Bool)

(assert (=> start!35616 (and (array_inv!6903 _values!1208) e!218771)))

(declare-fun b!357342 () Bool)

(assert (=> b!357342 (= e!218772 tp_is_empty!8083)))

(declare-fun b!357343 () Bool)

(declare-fun res!198520 () Bool)

(assert (=> b!357343 (=> (not res!198520) (not e!218773))))

(assert (=> b!357343 (= res!198520 (not (= (select (arr!9354 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357344 () Bool)

(declare-fun res!198515 () Bool)

(assert (=> b!357344 (=> (not res!198515) (not e!218773))))

(assert (=> b!357344 (= res!198515 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9707 _keys!1456))))))

(declare-fun b!357345 () Bool)

(assert (=> b!357345 (= e!218773 (not e!218775))))

(declare-fun res!198519 () Bool)

(assert (=> b!357345 (=> res!198519 e!218775)))

(assert (=> b!357345 (= res!198519 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9707 _keys!1456))))))

(assert (=> b!357345 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!165835 () Unit!11008)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!31 (array!19721 array!19719 (_ BitVec 32) (_ BitVec 32) V!11755 V!11755 (_ BitVec 64) (_ BitVec 32)) Unit!11008)

(assert (=> b!357345 (= lt!165835 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!31 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357346 () Bool)

(assert (=> b!357346 (= e!218771 (and e!218770 mapRes!13632))))

(declare-fun condMapEmpty!13632 () Bool)

(declare-fun mapDefault!13632 () ValueCell!3698)

(assert (=> b!357346 (= condMapEmpty!13632 (= (arr!9353 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3698)) mapDefault!13632)))))

(declare-fun b!357347 () Bool)

(declare-fun res!198517 () Bool)

(assert (=> b!357347 (=> (not res!198517) (not e!218773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19721 (_ BitVec 32)) Bool)

(assert (=> b!357347 (= res!198517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35616 res!198518) b!357341))

(assert (= (and b!357341 res!198516) b!357347))

(assert (= (and b!357347 res!198517) b!357338))

(assert (= (and b!357338 res!198514) b!357339))

(assert (= (and b!357339 res!198513) b!357344))

(assert (= (and b!357344 res!198515) b!357336))

(assert (= (and b!357336 res!198512) b!357343))

(assert (= (and b!357343 res!198520) b!357345))

(assert (= (and b!357345 (not res!198519)) b!357337))

(assert (= (and b!357346 condMapEmpty!13632) mapIsEmpty!13632))

(assert (= (and b!357346 (not condMapEmpty!13632)) mapNonEmpty!13632))

(get-info :version)

(assert (= (and mapNonEmpty!13632 ((_ is ValueCellFull!3698) mapValue!13632)) b!357342))

(assert (= (and b!357346 ((_ is ValueCellFull!3698) mapDefault!13632)) b!357340))

(assert (= start!35616 b!357346))

(declare-fun m!354921 () Bool)

(assert (=> mapNonEmpty!13632 m!354921))

(declare-fun m!354923 () Bool)

(assert (=> b!357343 m!354923))

(declare-fun m!354925 () Bool)

(assert (=> b!357339 m!354925))

(declare-fun m!354927 () Bool)

(assert (=> b!357338 m!354927))

(declare-fun m!354929 () Bool)

(assert (=> b!357347 m!354929))

(declare-fun m!354931 () Bool)

(assert (=> b!357337 m!354931))

(assert (=> b!357337 m!354931))

(declare-fun m!354933 () Bool)

(assert (=> b!357337 m!354933))

(declare-fun m!354935 () Bool)

(assert (=> b!357337 m!354935))

(declare-fun m!354937 () Bool)

(assert (=> b!357345 m!354937))

(declare-fun m!354939 () Bool)

(assert (=> b!357345 m!354939))

(declare-fun m!354941 () Bool)

(assert (=> start!35616 m!354941))

(declare-fun m!354943 () Bool)

(assert (=> start!35616 m!354943))

(declare-fun m!354945 () Bool)

(assert (=> start!35616 m!354945))

(declare-fun m!354947 () Bool)

(assert (=> b!357336 m!354947))

(check-sat (not mapNonEmpty!13632) (not b!357339) (not b!357336) (not b!357337) tp_is_empty!8083 (not start!35616) (not b_next!7885) b_and!15101 (not b!357345) (not b!357338) (not b!357347))
(check-sat b_and!15101 (not b_next!7885))
