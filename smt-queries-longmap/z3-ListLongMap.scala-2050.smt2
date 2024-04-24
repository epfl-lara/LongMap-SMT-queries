; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35454 () Bool)

(assert start!35454)

(declare-fun b_free!7855 () Bool)

(declare-fun b_next!7855 () Bool)

(assert (=> start!35454 (= b_free!7855 (not b_next!7855))))

(declare-fun tp!27350 () Bool)

(declare-fun b_and!15111 () Bool)

(assert (=> start!35454 (= tp!27350 b_and!15111)))

(declare-fun b!355335 () Bool)

(declare-fun res!197149 () Bool)

(declare-fun e!217669 () Bool)

(assert (=> b!355335 (=> (not res!197149) (not e!217669))))

(declare-datatypes ((array!19412 0))(
  ( (array!19413 (arr!9199 (Array (_ BitVec 32) (_ BitVec 64))) (size!9551 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19412)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!355335 (= res!197149 (= (select (arr!9199 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355336 () Bool)

(declare-fun res!197147 () Bool)

(assert (=> b!355336 (=> (not res!197147) (not e!217669))))

(declare-fun arrayContainsKey!0 (array!19412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355336 (= res!197147 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355337 () Bool)

(declare-fun res!197151 () Bool)

(assert (=> b!355337 (=> (not res!197151) (not e!217669))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11539 0))(
  ( (V!11540 (val!4005 Int)) )
))
(declare-datatypes ((ValueCell!3617 0))(
  ( (ValueCellFull!3617 (v!6200 V!11539)) (EmptyCell!3617) )
))
(declare-datatypes ((array!19414 0))(
  ( (array!19415 (arr!9200 (Array (_ BitVec 32) ValueCell!3617)) (size!9552 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19414)

(assert (=> b!355337 (= res!197151 (and (= (size!9552 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9551 _keys!1456) (size!9552 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355338 () Bool)

(declare-fun res!197145 () Bool)

(assert (=> b!355338 (=> (not res!197145) (not e!217669))))

(assert (=> b!355338 (= res!197145 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9551 _keys!1456))))))

(declare-fun b!355340 () Bool)

(declare-fun e!217672 () Bool)

(declare-fun tp_is_empty!7921 () Bool)

(assert (=> b!355340 (= e!217672 tp_is_empty!7921)))

(declare-fun mapNonEmpty!13389 () Bool)

(declare-fun mapRes!13389 () Bool)

(declare-fun tp!27351 () Bool)

(declare-fun e!217670 () Bool)

(assert (=> mapNonEmpty!13389 (= mapRes!13389 (and tp!27351 e!217670))))

(declare-fun mapValue!13389 () ValueCell!3617)

(declare-fun mapKey!13389 () (_ BitVec 32))

(declare-fun mapRest!13389 () (Array (_ BitVec 32) ValueCell!3617))

(assert (=> mapNonEmpty!13389 (= (arr!9200 _values!1208) (store mapRest!13389 mapKey!13389 mapValue!13389))))

(declare-fun b!355341 () Bool)

(declare-fun res!197152 () Bool)

(assert (=> b!355341 (=> (not res!197152) (not e!217669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355341 (= res!197152 (validKeyInArray!0 (select (arr!9199 _keys!1456) from!1805)))))

(declare-fun b!355342 () Bool)

(declare-fun res!197146 () Bool)

(assert (=> b!355342 (=> (not res!197146) (not e!217669))))

(assert (=> b!355342 (= res!197146 (validKeyInArray!0 k0!1077))))

(declare-fun b!355343 () Bool)

(declare-fun e!217668 () Bool)

(assert (=> b!355343 (= e!217668 (and e!217672 mapRes!13389))))

(declare-fun condMapEmpty!13389 () Bool)

(declare-fun mapDefault!13389 () ValueCell!3617)

(assert (=> b!355343 (= condMapEmpty!13389 (= (arr!9200 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3617)) mapDefault!13389)))))

(declare-fun b!355344 () Bool)

(declare-fun res!197144 () Bool)

(assert (=> b!355344 (=> (not res!197144) (not e!217669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19412 (_ BitVec 32)) Bool)

(assert (=> b!355344 (= res!197144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355345 () Bool)

(declare-fun res!197148 () Bool)

(assert (=> b!355345 (=> (not res!197148) (not e!217669))))

(declare-datatypes ((List!5242 0))(
  ( (Nil!5239) (Cons!5238 (h!6094 (_ BitVec 64)) (t!10384 List!5242)) )
))
(declare-fun arrayNoDuplicates!0 (array!19412 (_ BitVec 32) List!5242) Bool)

(assert (=> b!355345 (= res!197148 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5239))))

(declare-fun b!355346 () Bool)

(assert (=> b!355346 (= e!217669 (not true))))

(declare-fun minValue!1150 () V!11539)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11539)

(declare-datatypes ((tuple2!5606 0))(
  ( (tuple2!5607 (_1!2814 (_ BitVec 64)) (_2!2814 V!11539)) )
))
(declare-datatypes ((List!5243 0))(
  ( (Nil!5240) (Cons!5239 (h!6095 tuple2!5606) (t!10385 List!5243)) )
))
(declare-datatypes ((ListLongMap!4521 0))(
  ( (ListLongMap!4522 (toList!2276 List!5243)) )
))
(declare-fun contains!2375 (ListLongMap!4521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1804 (array!19412 array!19414 (_ BitVec 32) (_ BitVec 32) V!11539 V!11539 (_ BitVec 32) Int) ListLongMap!4521)

(assert (=> b!355346 (contains!2375 (getCurrentListMap!1804 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9199 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10937 0))(
  ( (Unit!10938) )
))
(declare-fun lt!165815 () Unit!10937)

(declare-fun lemmaValidKeyInArrayIsInListMap!194 (array!19412 array!19414 (_ BitVec 32) (_ BitVec 32) V!11539 V!11539 (_ BitVec 32) Int) Unit!10937)

(assert (=> b!355346 (= lt!165815 (lemmaValidKeyInArrayIsInListMap!194 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapIsEmpty!13389 () Bool)

(assert (=> mapIsEmpty!13389 mapRes!13389))

(declare-fun res!197150 () Bool)

(assert (=> start!35454 (=> (not res!197150) (not e!217669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35454 (= res!197150 (validMask!0 mask!1842))))

(assert (=> start!35454 e!217669))

(assert (=> start!35454 tp_is_empty!7921))

(assert (=> start!35454 true))

(assert (=> start!35454 tp!27350))

(declare-fun array_inv!6800 (array!19412) Bool)

(assert (=> start!35454 (array_inv!6800 _keys!1456)))

(declare-fun array_inv!6801 (array!19414) Bool)

(assert (=> start!35454 (and (array_inv!6801 _values!1208) e!217668)))

(declare-fun b!355339 () Bool)

(assert (=> b!355339 (= e!217670 tp_is_empty!7921)))

(assert (= (and start!35454 res!197150) b!355337))

(assert (= (and b!355337 res!197151) b!355344))

(assert (= (and b!355344 res!197144) b!355345))

(assert (= (and b!355345 res!197148) b!355342))

(assert (= (and b!355342 res!197146) b!355338))

(assert (= (and b!355338 res!197145) b!355336))

(assert (= (and b!355336 res!197147) b!355335))

(assert (= (and b!355335 res!197149) b!355341))

(assert (= (and b!355341 res!197152) b!355346))

(assert (= (and b!355343 condMapEmpty!13389) mapIsEmpty!13389))

(assert (= (and b!355343 (not condMapEmpty!13389)) mapNonEmpty!13389))

(get-info :version)

(assert (= (and mapNonEmpty!13389 ((_ is ValueCellFull!3617) mapValue!13389)) b!355339))

(assert (= (and b!355343 ((_ is ValueCellFull!3617) mapDefault!13389)) b!355340))

(assert (= start!35454 b!355343))

(declare-fun m!354345 () Bool)

(assert (=> b!355336 m!354345))

(declare-fun m!354347 () Bool)

(assert (=> b!355344 m!354347))

(declare-fun m!354349 () Bool)

(assert (=> mapNonEmpty!13389 m!354349))

(declare-fun m!354351 () Bool)

(assert (=> b!355341 m!354351))

(assert (=> b!355341 m!354351))

(declare-fun m!354353 () Bool)

(assert (=> b!355341 m!354353))

(assert (=> b!355335 m!354351))

(declare-fun m!354355 () Bool)

(assert (=> b!355342 m!354355))

(declare-fun m!354357 () Bool)

(assert (=> b!355345 m!354357))

(declare-fun m!354359 () Bool)

(assert (=> b!355346 m!354359))

(assert (=> b!355346 m!354351))

(assert (=> b!355346 m!354359))

(assert (=> b!355346 m!354351))

(declare-fun m!354361 () Bool)

(assert (=> b!355346 m!354361))

(declare-fun m!354363 () Bool)

(assert (=> b!355346 m!354363))

(declare-fun m!354365 () Bool)

(assert (=> start!35454 m!354365))

(declare-fun m!354367 () Bool)

(assert (=> start!35454 m!354367))

(declare-fun m!354369 () Bool)

(assert (=> start!35454 m!354369))

(check-sat (not start!35454) (not b!355344) (not b!355336) (not mapNonEmpty!13389) (not b!355346) (not b!355341) tp_is_empty!7921 (not b!355345) b_and!15111 (not b!355342) (not b_next!7855))
(check-sat b_and!15111 (not b_next!7855))
