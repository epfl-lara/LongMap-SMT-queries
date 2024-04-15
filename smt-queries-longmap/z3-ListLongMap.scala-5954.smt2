; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77532 () Bool)

(assert start!77532)

(declare-fun b_free!16135 () Bool)

(declare-fun b_next!16135 () Bool)

(assert (=> start!77532 (= b_free!16135 (not b_next!16135))))

(declare-fun tp!56667 () Bool)

(declare-fun b_and!26475 () Bool)

(assert (=> start!77532 (= tp!56667 b_and!26475)))

(declare-fun mapIsEmpty!29542 () Bool)

(declare-fun mapRes!29542 () Bool)

(assert (=> mapIsEmpty!29542 mapRes!29542))

(declare-fun b!903312 () Bool)

(declare-fun e!506117 () Bool)

(declare-fun e!506116 () Bool)

(assert (=> b!903312 (= e!506117 (and e!506116 mapRes!29542))))

(declare-fun condMapEmpty!29542 () Bool)

(declare-datatypes ((V!29703 0))(
  ( (V!29704 (val!9327 Int)) )
))
(declare-datatypes ((ValueCell!8795 0))(
  ( (ValueCellFull!8795 (v!11831 V!29703)) (EmptyCell!8795) )
))
(declare-datatypes ((array!53141 0))(
  ( (array!53142 (arr!25530 (Array (_ BitVec 32) ValueCell!8795)) (size!25991 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53141)

(declare-fun mapDefault!29542 () ValueCell!8795)

(assert (=> b!903312 (= condMapEmpty!29542 (= (arr!25530 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8795)) mapDefault!29542)))))

(declare-fun b!903313 () Bool)

(declare-fun res!609497 () Bool)

(declare-fun e!506115 () Bool)

(assert (=> b!903313 (=> (not res!609497) (not e!506115))))

(declare-datatypes ((array!53143 0))(
  ( (array!53144 (arr!25531 (Array (_ BitVec 32) (_ BitVec 64))) (size!25992 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53143)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53143 (_ BitVec 32)) Bool)

(assert (=> b!903313 (= res!609497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903314 () Bool)

(declare-fun e!506113 () Bool)

(declare-fun tp_is_empty!18553 () Bool)

(assert (=> b!903314 (= e!506113 tp_is_empty!18553)))

(declare-fun res!609496 () Bool)

(assert (=> start!77532 (=> (not res!609496) (not e!506115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77532 (= res!609496 (validMask!0 mask!1756))))

(assert (=> start!77532 e!506115))

(declare-fun array_inv!20064 (array!53141) Bool)

(assert (=> start!77532 (and (array_inv!20064 _values!1152) e!506117)))

(assert (=> start!77532 tp!56667))

(assert (=> start!77532 true))

(assert (=> start!77532 tp_is_empty!18553))

(declare-fun array_inv!20065 (array!53143) Bool)

(assert (=> start!77532 (array_inv!20065 _keys!1386)))

(declare-fun b!903315 () Bool)

(assert (=> b!903315 (= e!506115 false)))

(declare-fun zeroValue!1094 () V!29703)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29703)

(declare-fun lt!407788 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12134 0))(
  ( (tuple2!12135 (_1!6078 (_ BitVec 64)) (_2!6078 V!29703)) )
))
(declare-datatypes ((List!17940 0))(
  ( (Nil!17937) (Cons!17936 (h!19082 tuple2!12134) (t!25314 List!17940)) )
))
(declare-datatypes ((ListLongMap!10821 0))(
  ( (ListLongMap!10822 (toList!5426 List!17940)) )
))
(declare-fun contains!4437 (ListLongMap!10821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2641 (array!53143 array!53141 (_ BitVec 32) (_ BitVec 32) V!29703 V!29703 (_ BitVec 32) Int) ListLongMap!10821)

(assert (=> b!903315 (= lt!407788 (contains!4437 (getCurrentListMap!2641 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903316 () Bool)

(declare-fun res!609495 () Bool)

(assert (=> b!903316 (=> (not res!609495) (not e!506115))))

(declare-datatypes ((List!17941 0))(
  ( (Nil!17938) (Cons!17937 (h!19083 (_ BitVec 64)) (t!25315 List!17941)) )
))
(declare-fun arrayNoDuplicates!0 (array!53143 (_ BitVec 32) List!17941) Bool)

(assert (=> b!903316 (= res!609495 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17938))))

(declare-fun b!903317 () Bool)

(assert (=> b!903317 (= e!506116 tp_is_empty!18553)))

(declare-fun mapNonEmpty!29542 () Bool)

(declare-fun tp!56668 () Bool)

(assert (=> mapNonEmpty!29542 (= mapRes!29542 (and tp!56668 e!506113))))

(declare-fun mapKey!29542 () (_ BitVec 32))

(declare-fun mapRest!29542 () (Array (_ BitVec 32) ValueCell!8795))

(declare-fun mapValue!29542 () ValueCell!8795)

(assert (=> mapNonEmpty!29542 (= (arr!25530 _values!1152) (store mapRest!29542 mapKey!29542 mapValue!29542))))

(declare-fun b!903318 () Bool)

(declare-fun res!609498 () Bool)

(assert (=> b!903318 (=> (not res!609498) (not e!506115))))

(assert (=> b!903318 (= res!609498 (and (= (size!25991 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25992 _keys!1386) (size!25991 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77532 res!609496) b!903318))

(assert (= (and b!903318 res!609498) b!903313))

(assert (= (and b!903313 res!609497) b!903316))

(assert (= (and b!903316 res!609495) b!903315))

(assert (= (and b!903312 condMapEmpty!29542) mapIsEmpty!29542))

(assert (= (and b!903312 (not condMapEmpty!29542)) mapNonEmpty!29542))

(get-info :version)

(assert (= (and mapNonEmpty!29542 ((_ is ValueCellFull!8795) mapValue!29542)) b!903314))

(assert (= (and b!903312 ((_ is ValueCellFull!8795) mapDefault!29542)) b!903317))

(assert (= start!77532 b!903312))

(declare-fun m!838451 () Bool)

(assert (=> b!903316 m!838451))

(declare-fun m!838453 () Bool)

(assert (=> start!77532 m!838453))

(declare-fun m!838455 () Bool)

(assert (=> start!77532 m!838455))

(declare-fun m!838457 () Bool)

(assert (=> start!77532 m!838457))

(declare-fun m!838459 () Bool)

(assert (=> b!903315 m!838459))

(assert (=> b!903315 m!838459))

(declare-fun m!838461 () Bool)

(assert (=> b!903315 m!838461))

(declare-fun m!838463 () Bool)

(assert (=> b!903313 m!838463))

(declare-fun m!838465 () Bool)

(assert (=> mapNonEmpty!29542 m!838465))

(check-sat tp_is_empty!18553 b_and!26475 (not mapNonEmpty!29542) (not b_next!16135) (not b!903313) (not start!77532) (not b!903316) (not b!903315))
(check-sat b_and!26475 (not b_next!16135))
