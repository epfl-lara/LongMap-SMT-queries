; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77450 () Bool)

(assert start!77450)

(declare-fun b!902555 () Bool)

(declare-fun e!505547 () Bool)

(declare-fun tp_is_empty!18481 () Bool)

(assert (=> b!902555 (= e!505547 tp_is_empty!18481)))

(declare-fun b!902556 () Bool)

(declare-fun e!505550 () Bool)

(assert (=> b!902556 (= e!505550 false)))

(declare-fun lt!407680 () Bool)

(declare-datatypes ((array!53007 0))(
  ( (array!53008 (arr!25464 (Array (_ BitVec 32) (_ BitVec 64))) (size!25925 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53007)

(declare-datatypes ((List!17907 0))(
  ( (Nil!17904) (Cons!17903 (h!19049 (_ BitVec 64)) (t!25281 List!17907)) )
))
(declare-fun arrayNoDuplicates!0 (array!53007 (_ BitVec 32) List!17907) Bool)

(assert (=> b!902556 (= lt!407680 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17904))))

(declare-fun mapNonEmpty!29431 () Bool)

(declare-fun mapRes!29431 () Bool)

(declare-fun tp!56491 () Bool)

(declare-fun e!505549 () Bool)

(assert (=> mapNonEmpty!29431 (= mapRes!29431 (and tp!56491 e!505549))))

(declare-datatypes ((V!29607 0))(
  ( (V!29608 (val!9291 Int)) )
))
(declare-datatypes ((ValueCell!8759 0))(
  ( (ValueCellFull!8759 (v!11795 V!29607)) (EmptyCell!8759) )
))
(declare-datatypes ((array!53009 0))(
  ( (array!53010 (arr!25465 (Array (_ BitVec 32) ValueCell!8759)) (size!25926 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53009)

(declare-fun mapRest!29431 () (Array (_ BitVec 32) ValueCell!8759))

(declare-fun mapValue!29431 () ValueCell!8759)

(declare-fun mapKey!29431 () (_ BitVec 32))

(assert (=> mapNonEmpty!29431 (= (arr!25465 _values!1152) (store mapRest!29431 mapKey!29431 mapValue!29431))))

(declare-fun b!902557 () Bool)

(declare-fun e!505548 () Bool)

(assert (=> b!902557 (= e!505548 (and e!505547 mapRes!29431))))

(declare-fun condMapEmpty!29431 () Bool)

(declare-fun mapDefault!29431 () ValueCell!8759)

(assert (=> b!902557 (= condMapEmpty!29431 (= (arr!25465 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8759)) mapDefault!29431)))))

(declare-fun res!609084 () Bool)

(assert (=> start!77450 (=> (not res!609084) (not e!505550))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77450 (= res!609084 (validMask!0 mask!1756))))

(assert (=> start!77450 e!505550))

(assert (=> start!77450 true))

(declare-fun array_inv!20020 (array!53009) Bool)

(assert (=> start!77450 (and (array_inv!20020 _values!1152) e!505548)))

(declare-fun array_inv!20021 (array!53007) Bool)

(assert (=> start!77450 (array_inv!20021 _keys!1386)))

(declare-fun b!902558 () Bool)

(assert (=> b!902558 (= e!505549 tp_is_empty!18481)))

(declare-fun mapIsEmpty!29431 () Bool)

(assert (=> mapIsEmpty!29431 mapRes!29431))

(declare-fun b!902559 () Bool)

(declare-fun res!609083 () Bool)

(assert (=> b!902559 (=> (not res!609083) (not e!505550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53007 (_ BitVec 32)) Bool)

(assert (=> b!902559 (= res!609083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902560 () Bool)

(declare-fun res!609082 () Bool)

(assert (=> b!902560 (=> (not res!609082) (not e!505550))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902560 (= res!609082 (and (= (size!25926 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25925 _keys!1386) (size!25926 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77450 res!609084) b!902560))

(assert (= (and b!902560 res!609082) b!902559))

(assert (= (and b!902559 res!609083) b!902556))

(assert (= (and b!902557 condMapEmpty!29431) mapIsEmpty!29431))

(assert (= (and b!902557 (not condMapEmpty!29431)) mapNonEmpty!29431))

(get-info :version)

(assert (= (and mapNonEmpty!29431 ((_ is ValueCellFull!8759) mapValue!29431)) b!902558))

(assert (= (and b!902557 ((_ is ValueCellFull!8759) mapDefault!29431)) b!902555))

(assert (= start!77450 b!902557))

(declare-fun m!837917 () Bool)

(assert (=> b!902556 m!837917))

(declare-fun m!837919 () Bool)

(assert (=> mapNonEmpty!29431 m!837919))

(declare-fun m!837921 () Bool)

(assert (=> start!77450 m!837921))

(declare-fun m!837923 () Bool)

(assert (=> start!77450 m!837923))

(declare-fun m!837925 () Bool)

(assert (=> start!77450 m!837925))

(declare-fun m!837927 () Bool)

(assert (=> b!902559 m!837927))

(check-sat (not b!902556) (not start!77450) tp_is_empty!18481 (not b!902559) (not mapNonEmpty!29431))
(check-sat)
