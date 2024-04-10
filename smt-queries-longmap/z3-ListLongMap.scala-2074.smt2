; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35614 () Bool)

(assert start!35614)

(declare-fun b_free!7869 () Bool)

(declare-fun b_next!7869 () Bool)

(assert (=> start!35614 (= b_free!7869 (not b_next!7869))))

(declare-fun tp!27590 () Bool)

(declare-fun b_and!15111 () Bool)

(assert (=> start!35614 (= tp!27590 b_and!15111)))

(declare-fun b!357323 () Bool)

(declare-fun e!218805 () Bool)

(declare-fun e!218807 () Bool)

(assert (=> b!357323 (= e!218805 (not e!218807))))

(declare-fun res!198427 () Bool)

(assert (=> b!357323 (=> res!198427 e!218807)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19701 0))(
  ( (array!19702 (arr!9344 (Array (_ BitVec 32) (_ BitVec 64))) (size!9696 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19701)

(assert (=> b!357323 (= res!198427 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9696 _keys!1456))))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357323 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11733 0))(
  ( (V!11734 (val!4078 Int)) )
))
(declare-fun minValue!1150 () V!11733)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3690 0))(
  ( (ValueCellFull!3690 (v!6272 V!11733)) (EmptyCell!3690) )
))
(declare-datatypes ((array!19703 0))(
  ( (array!19704 (arr!9345 (Array (_ BitVec 32) ValueCell!3690)) (size!9697 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19703)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11733)

(declare-datatypes ((Unit!11010 0))(
  ( (Unit!11011) )
))
(declare-fun lt!166021 () Unit!11010)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!24 (array!19701 array!19703 (_ BitVec 32) (_ BitVec 32) V!11733 V!11733 (_ BitVec 64) (_ BitVec 32)) Unit!11010)

(assert (=> b!357323 (= lt!166021 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!24 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357324 () Bool)

(declare-fun res!198429 () Bool)

(assert (=> b!357324 (=> (not res!198429) (not e!218805))))

(assert (=> b!357324 (= res!198429 (not (= (select (arr!9344 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357325 () Bool)

(assert (=> b!357325 (= e!218807 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5698 0))(
  ( (tuple2!5699 (_1!2860 (_ BitVec 64)) (_2!2860 V!11733)) )
))
(declare-datatypes ((List!5390 0))(
  ( (Nil!5387) (Cons!5386 (h!6242 tuple2!5698) (t!10540 List!5390)) )
))
(declare-datatypes ((ListLongMap!4611 0))(
  ( (ListLongMap!4612 (toList!2321 List!5390)) )
))
(declare-fun contains!2401 (ListLongMap!4611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1842 (array!19701 array!19703 (_ BitVec 32) (_ BitVec 32) V!11733 V!11733 (_ BitVec 32) Int) ListLongMap!4611)

(assert (=> b!357325 (contains!2401 (getCurrentListMap!1842 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166022 () Unit!11010)

(declare-fun lemmaArrayContainsKeyThenInListMap!337 (array!19701 array!19703 (_ BitVec 32) (_ BitVec 32) V!11733 V!11733 (_ BitVec 64) (_ BitVec 32) Int) Unit!11010)

(assert (=> b!357325 (= lt!166022 (lemmaArrayContainsKeyThenInListMap!337 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357326 () Bool)

(declare-fun res!198430 () Bool)

(assert (=> b!357326 (=> (not res!198430) (not e!218805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357326 (= res!198430 (validKeyInArray!0 k0!1077))))

(declare-fun b!357327 () Bool)

(declare-fun res!198431 () Bool)

(assert (=> b!357327 (=> (not res!198431) (not e!218805))))

(assert (=> b!357327 (= res!198431 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9696 _keys!1456))))))

(declare-fun res!198425 () Bool)

(assert (=> start!35614 (=> (not res!198425) (not e!218805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35614 (= res!198425 (validMask!0 mask!1842))))

(assert (=> start!35614 e!218805))

(declare-fun tp_is_empty!8067 () Bool)

(assert (=> start!35614 tp_is_empty!8067))

(assert (=> start!35614 true))

(assert (=> start!35614 tp!27590))

(declare-fun array_inv!6868 (array!19701) Bool)

(assert (=> start!35614 (array_inv!6868 _keys!1456)))

(declare-fun e!218804 () Bool)

(declare-fun array_inv!6869 (array!19703) Bool)

(assert (=> start!35614 (and (array_inv!6869 _values!1208) e!218804)))

(declare-fun b!357328 () Bool)

(declare-fun res!198433 () Bool)

(assert (=> b!357328 (=> (not res!198433) (not e!218805))))

(declare-datatypes ((List!5391 0))(
  ( (Nil!5388) (Cons!5387 (h!6243 (_ BitVec 64)) (t!10541 List!5391)) )
))
(declare-fun arrayNoDuplicates!0 (array!19701 (_ BitVec 32) List!5391) Bool)

(assert (=> b!357328 (= res!198433 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5388))))

(declare-fun b!357329 () Bool)

(declare-fun e!218806 () Bool)

(declare-fun mapRes!13608 () Bool)

(assert (=> b!357329 (= e!218804 (and e!218806 mapRes!13608))))

(declare-fun condMapEmpty!13608 () Bool)

(declare-fun mapDefault!13608 () ValueCell!3690)

(assert (=> b!357329 (= condMapEmpty!13608 (= (arr!9345 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3690)) mapDefault!13608)))))

(declare-fun b!357330 () Bool)

(declare-fun res!198426 () Bool)

(assert (=> b!357330 (=> (not res!198426) (not e!218805))))

(assert (=> b!357330 (= res!198426 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357331 () Bool)

(assert (=> b!357331 (= e!218806 tp_is_empty!8067)))

(declare-fun b!357332 () Bool)

(declare-fun e!218802 () Bool)

(assert (=> b!357332 (= e!218802 tp_is_empty!8067)))

(declare-fun b!357333 () Bool)

(declare-fun res!198428 () Bool)

(assert (=> b!357333 (=> (not res!198428) (not e!218805))))

(assert (=> b!357333 (= res!198428 (and (= (size!9697 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9696 _keys!1456) (size!9697 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357334 () Bool)

(declare-fun res!198432 () Bool)

(assert (=> b!357334 (=> (not res!198432) (not e!218805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19701 (_ BitVec 32)) Bool)

(assert (=> b!357334 (= res!198432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13608 () Bool)

(assert (=> mapIsEmpty!13608 mapRes!13608))

(declare-fun mapNonEmpty!13608 () Bool)

(declare-fun tp!27591 () Bool)

(assert (=> mapNonEmpty!13608 (= mapRes!13608 (and tp!27591 e!218802))))

(declare-fun mapValue!13608 () ValueCell!3690)

(declare-fun mapKey!13608 () (_ BitVec 32))

(declare-fun mapRest!13608 () (Array (_ BitVec 32) ValueCell!3690))

(assert (=> mapNonEmpty!13608 (= (arr!9345 _values!1208) (store mapRest!13608 mapKey!13608 mapValue!13608))))

(assert (= (and start!35614 res!198425) b!357333))

(assert (= (and b!357333 res!198428) b!357334))

(assert (= (and b!357334 res!198432) b!357328))

(assert (= (and b!357328 res!198433) b!357326))

(assert (= (and b!357326 res!198430) b!357327))

(assert (= (and b!357327 res!198431) b!357330))

(assert (= (and b!357330 res!198426) b!357324))

(assert (= (and b!357324 res!198429) b!357323))

(assert (= (and b!357323 (not res!198427)) b!357325))

(assert (= (and b!357329 condMapEmpty!13608) mapIsEmpty!13608))

(assert (= (and b!357329 (not condMapEmpty!13608)) mapNonEmpty!13608))

(get-info :version)

(assert (= (and mapNonEmpty!13608 ((_ is ValueCellFull!3690) mapValue!13608)) b!357332))

(assert (= (and b!357329 ((_ is ValueCellFull!3690) mapDefault!13608)) b!357331))

(assert (= start!35614 b!357329))

(declare-fun m!355427 () Bool)

(assert (=> b!357326 m!355427))

(declare-fun m!355429 () Bool)

(assert (=> b!357330 m!355429))

(declare-fun m!355431 () Bool)

(assert (=> b!357328 m!355431))

(declare-fun m!355433 () Bool)

(assert (=> b!357334 m!355433))

(declare-fun m!355435 () Bool)

(assert (=> b!357324 m!355435))

(declare-fun m!355437 () Bool)

(assert (=> mapNonEmpty!13608 m!355437))

(declare-fun m!355439 () Bool)

(assert (=> start!35614 m!355439))

(declare-fun m!355441 () Bool)

(assert (=> start!35614 m!355441))

(declare-fun m!355443 () Bool)

(assert (=> start!35614 m!355443))

(declare-fun m!355445 () Bool)

(assert (=> b!357325 m!355445))

(assert (=> b!357325 m!355445))

(declare-fun m!355447 () Bool)

(assert (=> b!357325 m!355447))

(declare-fun m!355449 () Bool)

(assert (=> b!357325 m!355449))

(declare-fun m!355451 () Bool)

(assert (=> b!357323 m!355451))

(declare-fun m!355453 () Bool)

(assert (=> b!357323 m!355453))

(check-sat (not b!357325) (not b_next!7869) b_and!15111 (not b!357328) (not mapNonEmpty!13608) (not b!357334) tp_is_empty!8067 (not b!357323) (not b!357330) (not start!35614) (not b!357326))
(check-sat b_and!15111 (not b_next!7869))
