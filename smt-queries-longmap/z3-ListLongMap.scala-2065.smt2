; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35544 () Bool)

(assert start!35544)

(declare-fun b!356341 () Bool)

(declare-fun res!197747 () Bool)

(declare-fun e!218347 () Bool)

(assert (=> b!356341 (=> (not res!197747) (not e!218347))))

(declare-datatypes ((array!19576 0))(
  ( (array!19577 (arr!9281 (Array (_ BitVec 32) (_ BitVec 64))) (size!9633 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19576)

(declare-datatypes ((List!5276 0))(
  ( (Nil!5273) (Cons!5272 (h!6128 (_ BitVec 64)) (t!10418 List!5276)) )
))
(declare-fun arrayNoDuplicates!0 (array!19576 (_ BitVec 32) List!5276) Bool)

(assert (=> b!356341 (= res!197747 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5273))))

(declare-fun b!356342 () Bool)

(declare-fun res!197745 () Bool)

(assert (=> b!356342 (=> (not res!197745) (not e!218347))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11659 0))(
  ( (V!11660 (val!4050 Int)) )
))
(declare-datatypes ((ValueCell!3662 0))(
  ( (ValueCellFull!3662 (v!6245 V!11659)) (EmptyCell!3662) )
))
(declare-datatypes ((array!19578 0))(
  ( (array!19579 (arr!9282 (Array (_ BitVec 32) ValueCell!3662)) (size!9634 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19578)

(assert (=> b!356342 (= res!197745 (and (= (size!9634 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9633 _keys!1456) (size!9634 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356343 () Bool)

(assert (=> b!356343 (= e!218347 (not true))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356343 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11659)

(declare-datatypes ((Unit!10953 0))(
  ( (Unit!10954) )
))
(declare-fun lt!165950 () Unit!10953)

(declare-fun zeroValue!1150 () V!11659)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!5 (array!19576 array!19578 (_ BitVec 32) (_ BitVec 32) V!11659 V!11659 (_ BitVec 64) (_ BitVec 32)) Unit!10953)

(assert (=> b!356343 (= lt!165950 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!5 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356344 () Bool)

(declare-fun res!197749 () Bool)

(assert (=> b!356344 (=> (not res!197749) (not e!218347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19576 (_ BitVec 32)) Bool)

(assert (=> b!356344 (= res!197749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356345 () Bool)

(declare-fun res!197752 () Bool)

(assert (=> b!356345 (=> (not res!197752) (not e!218347))))

(assert (=> b!356345 (= res!197752 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356346 () Bool)

(declare-fun e!218344 () Bool)

(declare-fun tp_is_empty!8011 () Bool)

(assert (=> b!356346 (= e!218344 tp_is_empty!8011)))

(declare-fun b!356347 () Bool)

(declare-fun e!218343 () Bool)

(declare-fun e!218345 () Bool)

(declare-fun mapRes!13524 () Bool)

(assert (=> b!356347 (= e!218343 (and e!218345 mapRes!13524))))

(declare-fun condMapEmpty!13524 () Bool)

(declare-fun mapDefault!13524 () ValueCell!3662)

(assert (=> b!356347 (= condMapEmpty!13524 (= (arr!9282 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3662)) mapDefault!13524)))))

(declare-fun b!356348 () Bool)

(assert (=> b!356348 (= e!218345 tp_is_empty!8011)))

(declare-fun b!356349 () Bool)

(declare-fun res!197751 () Bool)

(assert (=> b!356349 (=> (not res!197751) (not e!218347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356349 (= res!197751 (validKeyInArray!0 k0!1077))))

(declare-fun res!197746 () Bool)

(assert (=> start!35544 (=> (not res!197746) (not e!218347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35544 (= res!197746 (validMask!0 mask!1842))))

(assert (=> start!35544 e!218347))

(assert (=> start!35544 tp_is_empty!8011))

(assert (=> start!35544 true))

(declare-fun array_inv!6860 (array!19576) Bool)

(assert (=> start!35544 (array_inv!6860 _keys!1456)))

(declare-fun array_inv!6861 (array!19578) Bool)

(assert (=> start!35544 (and (array_inv!6861 _values!1208) e!218343)))

(declare-fun b!356350 () Bool)

(declare-fun res!197750 () Bool)

(assert (=> b!356350 (=> (not res!197750) (not e!218347))))

(assert (=> b!356350 (= res!197750 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9633 _keys!1456))))))

(declare-fun mapNonEmpty!13524 () Bool)

(declare-fun tp!27501 () Bool)

(assert (=> mapNonEmpty!13524 (= mapRes!13524 (and tp!27501 e!218344))))

(declare-fun mapValue!13524 () ValueCell!3662)

(declare-fun mapRest!13524 () (Array (_ BitVec 32) ValueCell!3662))

(declare-fun mapKey!13524 () (_ BitVec 32))

(assert (=> mapNonEmpty!13524 (= (arr!9282 _values!1208) (store mapRest!13524 mapKey!13524 mapValue!13524))))

(declare-fun b!356351 () Bool)

(declare-fun res!197748 () Bool)

(assert (=> b!356351 (=> (not res!197748) (not e!218347))))

(assert (=> b!356351 (= res!197748 (not (= (select (arr!9281 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13524 () Bool)

(assert (=> mapIsEmpty!13524 mapRes!13524))

(assert (= (and start!35544 res!197746) b!356342))

(assert (= (and b!356342 res!197745) b!356344))

(assert (= (and b!356344 res!197749) b!356341))

(assert (= (and b!356341 res!197747) b!356349))

(assert (= (and b!356349 res!197751) b!356350))

(assert (= (and b!356350 res!197750) b!356345))

(assert (= (and b!356345 res!197752) b!356351))

(assert (= (and b!356351 res!197748) b!356343))

(assert (= (and b!356347 condMapEmpty!13524) mapIsEmpty!13524))

(assert (= (and b!356347 (not condMapEmpty!13524)) mapNonEmpty!13524))

(get-info :version)

(assert (= (and mapNonEmpty!13524 ((_ is ValueCellFull!3662) mapValue!13524)) b!356346))

(assert (= (and b!356347 ((_ is ValueCellFull!3662) mapDefault!13524)) b!356348))

(assert (= start!35544 b!356347))

(declare-fun m!355029 () Bool)

(assert (=> mapNonEmpty!13524 m!355029))

(declare-fun m!355031 () Bool)

(assert (=> start!35544 m!355031))

(declare-fun m!355033 () Bool)

(assert (=> start!35544 m!355033))

(declare-fun m!355035 () Bool)

(assert (=> start!35544 m!355035))

(declare-fun m!355037 () Bool)

(assert (=> b!356349 m!355037))

(declare-fun m!355039 () Bool)

(assert (=> b!356345 m!355039))

(declare-fun m!355041 () Bool)

(assert (=> b!356351 m!355041))

(declare-fun m!355043 () Bool)

(assert (=> b!356343 m!355043))

(declare-fun m!355045 () Bool)

(assert (=> b!356343 m!355045))

(declare-fun m!355047 () Bool)

(assert (=> b!356341 m!355047))

(declare-fun m!355049 () Bool)

(assert (=> b!356344 m!355049))

(check-sat (not mapNonEmpty!13524) tp_is_empty!8011 (not b!356344) (not b!356345) (not b!356341) (not b!356343) (not start!35544) (not b!356349))
(check-sat)
