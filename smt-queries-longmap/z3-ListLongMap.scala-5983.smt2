; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77706 () Bool)

(assert start!77706)

(declare-fun b_free!16309 () Bool)

(declare-fun b_next!16309 () Bool)

(assert (=> start!77706 (= b_free!16309 (not b_next!16309))))

(declare-fun tp!57189 () Bool)

(declare-fun b_and!26745 () Bool)

(assert (=> start!77706 (= tp!57189 b_and!26745)))

(declare-fun b!906606 () Bool)

(declare-fun e!508059 () Bool)

(declare-fun e!508058 () Bool)

(assert (=> b!906606 (= e!508059 (not e!508058))))

(declare-fun res!611919 () Bool)

(assert (=> b!906606 (=> res!611919 e!508058)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53469 0))(
  ( (array!53470 (arr!25694 (Array (_ BitVec 32) (_ BitVec 64))) (size!26155 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53469)

(assert (=> b!906606 (= res!611919 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26155 _keys!1386))))))

(declare-datatypes ((V!29935 0))(
  ( (V!29936 (val!9414 Int)) )
))
(declare-datatypes ((ValueCell!8882 0))(
  ( (ValueCellFull!8882 (v!11918 V!29935)) (EmptyCell!8882) )
))
(declare-datatypes ((array!53471 0))(
  ( (array!53472 (arr!25695 (Array (_ BitVec 32) ValueCell!8882)) (size!26156 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53471)

(declare-fun lt!408835 () V!29935)

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13515 (ValueCell!8882 V!29935) V!29935)

(declare-fun dynLambda!1346 (Int (_ BitVec 64)) V!29935)

(assert (=> b!906606 (= lt!408835 (get!13515 (select (arr!25695 _values!1152) i!717) (dynLambda!1346 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906606 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29935)

(declare-datatypes ((Unit!30696 0))(
  ( (Unit!30697) )
))
(declare-fun lt!408834 () Unit!30696)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29935)

(declare-fun lemmaKeyInListMapIsInArray!222 (array!53469 array!53471 (_ BitVec 32) (_ BitVec 32) V!29935 V!29935 (_ BitVec 64) Int) Unit!30696)

(assert (=> b!906606 (= lt!408834 (lemmaKeyInListMapIsInArray!222 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906607 () Bool)

(declare-fun res!611917 () Bool)

(declare-fun e!508055 () Bool)

(assert (=> b!906607 (=> res!611917 e!508055)))

(declare-datatypes ((tuple2!12278 0))(
  ( (tuple2!12279 (_1!6150 (_ BitVec 64)) (_2!6150 V!29935)) )
))
(declare-datatypes ((List!18064 0))(
  ( (Nil!18061) (Cons!18060 (h!19206 tuple2!12278) (t!25536 List!18064)) )
))
(declare-datatypes ((ListLongMap!10965 0))(
  ( (ListLongMap!10966 (toList!5498 List!18064)) )
))
(declare-fun lt!408833 () ListLongMap!10965)

(declare-fun apply!474 (ListLongMap!10965 (_ BitVec 64)) V!29935)

(assert (=> b!906607 (= res!611917 (not (= (apply!474 lt!408833 k0!1033) lt!408835)))))

(declare-fun b!906608 () Bool)

(declare-fun res!611913 () Bool)

(assert (=> b!906608 (=> (not res!611913) (not e!508059))))

(assert (=> b!906608 (= res!611913 (and (= (select (arr!25694 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906609 () Bool)

(declare-fun res!611915 () Bool)

(declare-fun e!508057 () Bool)

(assert (=> b!906609 (=> (not res!611915) (not e!508057))))

(assert (=> b!906609 (= res!611915 (and (= (size!26156 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26155 _keys!1386) (size!26156 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906610 () Bool)

(declare-fun e!508061 () Bool)

(declare-fun tp_is_empty!18727 () Bool)

(assert (=> b!906610 (= e!508061 tp_is_empty!18727)))

(declare-fun mapIsEmpty!29803 () Bool)

(declare-fun mapRes!29803 () Bool)

(assert (=> mapIsEmpty!29803 mapRes!29803))

(declare-fun b!906612 () Bool)

(declare-fun e!508056 () Bool)

(assert (=> b!906612 (= e!508056 tp_is_empty!18727)))

(declare-fun b!906613 () Bool)

(declare-fun e!508054 () Bool)

(assert (=> b!906613 (= e!508054 (and e!508056 mapRes!29803))))

(declare-fun condMapEmpty!29803 () Bool)

(declare-fun mapDefault!29803 () ValueCell!8882)

(assert (=> b!906613 (= condMapEmpty!29803 (= (arr!25695 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8882)) mapDefault!29803)))))

(declare-fun b!906614 () Bool)

(declare-fun res!611912 () Bool)

(assert (=> b!906614 (=> (not res!611912) (not e!508057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53469 (_ BitVec 32)) Bool)

(assert (=> b!906614 (= res!611912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29803 () Bool)

(declare-fun tp!57190 () Bool)

(assert (=> mapNonEmpty!29803 (= mapRes!29803 (and tp!57190 e!508061))))

(declare-fun mapKey!29803 () (_ BitVec 32))

(declare-fun mapRest!29803 () (Array (_ BitVec 32) ValueCell!8882))

(declare-fun mapValue!29803 () ValueCell!8882)

(assert (=> mapNonEmpty!29803 (= (arr!25695 _values!1152) (store mapRest!29803 mapKey!29803 mapValue!29803))))

(declare-fun b!906615 () Bool)

(assert (=> b!906615 (= e!508057 e!508059)))

(declare-fun res!611914 () Bool)

(assert (=> b!906615 (=> (not res!611914) (not e!508059))))

(declare-fun lt!408832 () ListLongMap!10965)

(declare-fun contains!4503 (ListLongMap!10965 (_ BitVec 64)) Bool)

(assert (=> b!906615 (= res!611914 (contains!4503 lt!408832 k0!1033))))

(declare-fun getCurrentListMap!2707 (array!53469 array!53471 (_ BitVec 32) (_ BitVec 32) V!29935 V!29935 (_ BitVec 32) Int) ListLongMap!10965)

(assert (=> b!906615 (= lt!408832 (getCurrentListMap!2707 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906616 () Bool)

(assert (=> b!906616 (= e!508055 true)))

(assert (=> b!906616 (= (apply!474 lt!408832 k0!1033) lt!408835)))

(declare-fun lt!408831 () Unit!30696)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!35 (array!53469 array!53471 (_ BitVec 32) (_ BitVec 32) V!29935 V!29935 (_ BitVec 64) V!29935 (_ BitVec 32) Int) Unit!30696)

(assert (=> b!906616 (= lt!408831 (lemmaListMapApplyFromThenApplyFromZero!35 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408835 i!717 defaultEntry!1160))))

(declare-fun res!611918 () Bool)

(assert (=> start!77706 (=> (not res!611918) (not e!508057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77706 (= res!611918 (validMask!0 mask!1756))))

(assert (=> start!77706 e!508057))

(declare-fun array_inv!20164 (array!53471) Bool)

(assert (=> start!77706 (and (array_inv!20164 _values!1152) e!508054)))

(assert (=> start!77706 tp!57189))

(assert (=> start!77706 true))

(assert (=> start!77706 tp_is_empty!18727))

(declare-fun array_inv!20165 (array!53469) Bool)

(assert (=> start!77706 (array_inv!20165 _keys!1386)))

(declare-fun b!906611 () Bool)

(declare-fun res!611916 () Bool)

(assert (=> b!906611 (=> (not res!611916) (not e!508059))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906611 (= res!611916 (inRange!0 i!717 mask!1756))))

(declare-fun b!906617 () Bool)

(declare-fun res!611911 () Bool)

(assert (=> b!906617 (=> (not res!611911) (not e!508057))))

(declare-datatypes ((List!18065 0))(
  ( (Nil!18062) (Cons!18061 (h!19207 (_ BitVec 64)) (t!25537 List!18065)) )
))
(declare-fun arrayNoDuplicates!0 (array!53469 (_ BitVec 32) List!18065) Bool)

(assert (=> b!906617 (= res!611911 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18062))))

(declare-fun b!906618 () Bool)

(assert (=> b!906618 (= e!508058 e!508055)))

(declare-fun res!611910 () Bool)

(assert (=> b!906618 (=> res!611910 e!508055)))

(assert (=> b!906618 (= res!611910 (not (contains!4503 lt!408833 k0!1033)))))

(assert (=> b!906618 (= lt!408833 (getCurrentListMap!2707 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77706 res!611918) b!906609))

(assert (= (and b!906609 res!611915) b!906614))

(assert (= (and b!906614 res!611912) b!906617))

(assert (= (and b!906617 res!611911) b!906615))

(assert (= (and b!906615 res!611914) b!906611))

(assert (= (and b!906611 res!611916) b!906608))

(assert (= (and b!906608 res!611913) b!906606))

(assert (= (and b!906606 (not res!611919)) b!906618))

(assert (= (and b!906618 (not res!611910)) b!906607))

(assert (= (and b!906607 (not res!611917)) b!906616))

(assert (= (and b!906613 condMapEmpty!29803) mapIsEmpty!29803))

(assert (= (and b!906613 (not condMapEmpty!29803)) mapNonEmpty!29803))

(get-info :version)

(assert (= (and mapNonEmpty!29803 ((_ is ValueCellFull!8882) mapValue!29803)) b!906610))

(assert (= (and b!906613 ((_ is ValueCellFull!8882) mapDefault!29803)) b!906612))

(assert (= start!77706 b!906613))

(declare-fun b_lambda!13165 () Bool)

(assert (=> (not b_lambda!13165) (not b!906606)))

(declare-fun t!25535 () Bool)

(declare-fun tb!5323 () Bool)

(assert (=> (and start!77706 (= defaultEntry!1160 defaultEntry!1160) t!25535) tb!5323))

(declare-fun result!10449 () Bool)

(assert (=> tb!5323 (= result!10449 tp_is_empty!18727)))

(assert (=> b!906606 t!25535))

(declare-fun b_and!26747 () Bool)

(assert (= b_and!26745 (and (=> t!25535 result!10449) b_and!26747)))

(declare-fun m!841457 () Bool)

(assert (=> b!906614 m!841457))

(declare-fun m!841459 () Bool)

(assert (=> b!906608 m!841459))

(declare-fun m!841461 () Bool)

(assert (=> b!906615 m!841461))

(declare-fun m!841463 () Bool)

(assert (=> b!906615 m!841463))

(declare-fun m!841465 () Bool)

(assert (=> b!906606 m!841465))

(declare-fun m!841467 () Bool)

(assert (=> b!906606 m!841467))

(declare-fun m!841469 () Bool)

(assert (=> b!906606 m!841469))

(declare-fun m!841471 () Bool)

(assert (=> b!906606 m!841471))

(assert (=> b!906606 m!841465))

(assert (=> b!906606 m!841469))

(declare-fun m!841473 () Bool)

(assert (=> b!906606 m!841473))

(declare-fun m!841475 () Bool)

(assert (=> b!906607 m!841475))

(declare-fun m!841477 () Bool)

(assert (=> start!77706 m!841477))

(declare-fun m!841479 () Bool)

(assert (=> start!77706 m!841479))

(declare-fun m!841481 () Bool)

(assert (=> start!77706 m!841481))

(declare-fun m!841483 () Bool)

(assert (=> mapNonEmpty!29803 m!841483))

(declare-fun m!841485 () Bool)

(assert (=> b!906618 m!841485))

(declare-fun m!841487 () Bool)

(assert (=> b!906618 m!841487))

(declare-fun m!841489 () Bool)

(assert (=> b!906617 m!841489))

(declare-fun m!841491 () Bool)

(assert (=> b!906611 m!841491))

(declare-fun m!841493 () Bool)

(assert (=> b!906616 m!841493))

(declare-fun m!841495 () Bool)

(assert (=> b!906616 m!841495))

(check-sat (not b!906611) (not b!906617) (not b!906616) (not b!906606) b_and!26747 (not b!906614) (not b_next!16309) (not b!906615) (not mapNonEmpty!29803) (not b!906607) tp_is_empty!18727 (not start!77706) (not b_lambda!13165) (not b!906618))
(check-sat b_and!26747 (not b_next!16309))
