; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35454 () Bool)

(assert start!35454)

(declare-fun b_free!7855 () Bool)

(declare-fun b_next!7855 () Bool)

(assert (=> start!35454 (= b_free!7855 (not b_next!7855))))

(declare-fun tp!27350 () Bool)

(declare-fun b_and!15071 () Bool)

(assert (=> start!35454 (= tp!27350 b_and!15071)))

(declare-fun b!355113 () Bool)

(declare-fun e!217530 () Bool)

(declare-fun tp_is_empty!7921 () Bool)

(assert (=> b!355113 (= e!217530 tp_is_empty!7921)))

(declare-fun b!355114 () Bool)

(declare-fun e!217528 () Bool)

(declare-fun e!217527 () Bool)

(declare-fun mapRes!13389 () Bool)

(assert (=> b!355114 (= e!217528 (and e!217527 mapRes!13389))))

(declare-fun condMapEmpty!13389 () Bool)

(declare-datatypes ((V!11539 0))(
  ( (V!11540 (val!4005 Int)) )
))
(declare-datatypes ((ValueCell!3617 0))(
  ( (ValueCellFull!3617 (v!6193 V!11539)) (EmptyCell!3617) )
))
(declare-datatypes ((array!19407 0))(
  ( (array!19408 (arr!9197 (Array (_ BitVec 32) ValueCell!3617)) (size!9550 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19407)

(declare-fun mapDefault!13389 () ValueCell!3617)

(assert (=> b!355114 (= condMapEmpty!13389 (= (arr!9197 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3617)) mapDefault!13389)))))

(declare-fun b!355115 () Bool)

(assert (=> b!355115 (= e!217527 tp_is_empty!7921)))

(declare-fun b!355116 () Bool)

(declare-fun res!197024 () Bool)

(declare-fun e!217526 () Bool)

(assert (=> b!355116 (=> (not res!197024) (not e!217526))))

(declare-datatypes ((array!19409 0))(
  ( (array!19410 (arr!9198 (Array (_ BitVec 32) (_ BitVec 64))) (size!9551 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19409)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!355116 (= res!197024 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!355117 () Bool)

(declare-fun res!197022 () Bool)

(assert (=> b!355117 (=> (not res!197022) (not e!217526))))

(assert (=> b!355117 (= res!197022 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9551 _keys!1456))))))

(declare-fun b!355118 () Bool)

(assert (=> b!355118 (= e!217526 (not true))))

(declare-fun minValue!1150 () V!11539)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11539)

(declare-datatypes ((tuple2!5662 0))(
  ( (tuple2!5663 (_1!2842 (_ BitVec 64)) (_2!2842 V!11539)) )
))
(declare-datatypes ((List!5304 0))(
  ( (Nil!5301) (Cons!5300 (h!6156 tuple2!5662) (t!10445 List!5304)) )
))
(declare-datatypes ((ListLongMap!4565 0))(
  ( (ListLongMap!4566 (toList!2298 List!5304)) )
))
(declare-fun contains!2388 (ListLongMap!4565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1803 (array!19409 array!19407 (_ BitVec 32) (_ BitVec 32) V!11539 V!11539 (_ BitVec 32) Int) ListLongMap!4565)

(assert (=> b!355118 (contains!2388 (getCurrentListMap!1803 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9198 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10942 0))(
  ( (Unit!10943) )
))
(declare-fun lt!165562 () Unit!10942)

(declare-fun lemmaValidKeyInArrayIsInListMap!195 (array!19409 array!19407 (_ BitVec 32) (_ BitVec 32) V!11539 V!11539 (_ BitVec 32) Int) Unit!10942)

(assert (=> b!355118 (= lt!165562 (lemmaValidKeyInArrayIsInListMap!195 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapIsEmpty!13389 () Bool)

(assert (=> mapIsEmpty!13389 mapRes!13389))

(declare-fun b!355119 () Bool)

(declare-fun res!197026 () Bool)

(assert (=> b!355119 (=> (not res!197026) (not e!217526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!355119 (= res!197026 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13389 () Bool)

(declare-fun tp!27351 () Bool)

(assert (=> mapNonEmpty!13389 (= mapRes!13389 (and tp!27351 e!217530))))

(declare-fun mapRest!13389 () (Array (_ BitVec 32) ValueCell!3617))

(declare-fun mapValue!13389 () ValueCell!3617)

(declare-fun mapKey!13389 () (_ BitVec 32))

(assert (=> mapNonEmpty!13389 (= (arr!9197 _values!1208) (store mapRest!13389 mapKey!13389 mapValue!13389))))

(declare-fun res!197023 () Bool)

(assert (=> start!35454 (=> (not res!197023) (not e!217526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35454 (= res!197023 (validMask!0 mask!1842))))

(assert (=> start!35454 e!217526))

(assert (=> start!35454 tp_is_empty!7921))

(assert (=> start!35454 true))

(assert (=> start!35454 tp!27350))

(declare-fun array_inv!6808 (array!19409) Bool)

(assert (=> start!35454 (array_inv!6808 _keys!1456)))

(declare-fun array_inv!6809 (array!19407) Bool)

(assert (=> start!35454 (and (array_inv!6809 _values!1208) e!217528)))

(declare-fun b!355120 () Bool)

(declare-fun res!197025 () Bool)

(assert (=> b!355120 (=> (not res!197025) (not e!217526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19409 (_ BitVec 32)) Bool)

(assert (=> b!355120 (= res!197025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355121 () Bool)

(declare-fun res!197019 () Bool)

(assert (=> b!355121 (=> (not res!197019) (not e!217526))))

(assert (=> b!355121 (= res!197019 (and (= (size!9550 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9551 _keys!1456) (size!9550 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355122 () Bool)

(declare-fun res!197021 () Bool)

(assert (=> b!355122 (=> (not res!197021) (not e!217526))))

(assert (=> b!355122 (= res!197021 (validKeyInArray!0 (select (arr!9198 _keys!1456) from!1805)))))

(declare-fun b!355123 () Bool)

(declare-fun res!197018 () Bool)

(assert (=> b!355123 (=> (not res!197018) (not e!217526))))

(assert (=> b!355123 (= res!197018 (= (select (arr!9198 _keys!1456) from!1805) k0!1077))))

(declare-fun b!355124 () Bool)

(declare-fun res!197020 () Bool)

(assert (=> b!355124 (=> (not res!197020) (not e!217526))))

(declare-datatypes ((List!5305 0))(
  ( (Nil!5302) (Cons!5301 (h!6157 (_ BitVec 64)) (t!10446 List!5305)) )
))
(declare-fun arrayNoDuplicates!0 (array!19409 (_ BitVec 32) List!5305) Bool)

(assert (=> b!355124 (= res!197020 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5302))))

(assert (= (and start!35454 res!197023) b!355121))

(assert (= (and b!355121 res!197019) b!355120))

(assert (= (and b!355120 res!197025) b!355124))

(assert (= (and b!355124 res!197020) b!355119))

(assert (= (and b!355119 res!197026) b!355117))

(assert (= (and b!355117 res!197022) b!355116))

(assert (= (and b!355116 res!197024) b!355123))

(assert (= (and b!355123 res!197018) b!355122))

(assert (= (and b!355122 res!197021) b!355118))

(assert (= (and b!355114 condMapEmpty!13389) mapIsEmpty!13389))

(assert (= (and b!355114 (not condMapEmpty!13389)) mapNonEmpty!13389))

(get-info :version)

(assert (= (and mapNonEmpty!13389 ((_ is ValueCellFull!3617) mapValue!13389)) b!355113))

(assert (= (and b!355114 ((_ is ValueCellFull!3617) mapDefault!13389)) b!355115))

(assert (= start!35454 b!355114))

(declare-fun m!353391 () Bool)

(assert (=> b!355123 m!353391))

(declare-fun m!353393 () Bool)

(assert (=> b!355124 m!353393))

(declare-fun m!353395 () Bool)

(assert (=> b!355118 m!353395))

(assert (=> b!355118 m!353391))

(assert (=> b!355118 m!353395))

(assert (=> b!355118 m!353391))

(declare-fun m!353397 () Bool)

(assert (=> b!355118 m!353397))

(declare-fun m!353399 () Bool)

(assert (=> b!355118 m!353399))

(assert (=> b!355122 m!353391))

(assert (=> b!355122 m!353391))

(declare-fun m!353401 () Bool)

(assert (=> b!355122 m!353401))

(declare-fun m!353403 () Bool)

(assert (=> b!355116 m!353403))

(declare-fun m!353405 () Bool)

(assert (=> b!355119 m!353405))

(declare-fun m!353407 () Bool)

(assert (=> mapNonEmpty!13389 m!353407))

(declare-fun m!353409 () Bool)

(assert (=> b!355120 m!353409))

(declare-fun m!353411 () Bool)

(assert (=> start!35454 m!353411))

(declare-fun m!353413 () Bool)

(assert (=> start!35454 m!353413))

(declare-fun m!353415 () Bool)

(assert (=> start!35454 m!353415))

(check-sat (not mapNonEmpty!13389) (not b!355118) (not b!355119) (not b!355122) (not b!355124) (not start!35454) b_and!15071 (not b_next!7855) tp_is_empty!7921 (not b!355116) (not b!355120))
(check-sat b_and!15071 (not b_next!7855))
