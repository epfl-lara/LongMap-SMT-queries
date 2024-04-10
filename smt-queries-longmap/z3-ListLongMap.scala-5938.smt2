; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77446 () Bool)

(assert start!77446)

(declare-fun b!902596 () Bool)

(declare-fun res!609095 () Bool)

(declare-fun e!505533 () Bool)

(assert (=> b!902596 (=> (not res!609095) (not e!505533))))

(declare-datatypes ((array!52980 0))(
  ( (array!52981 (arr!25450 (Array (_ BitVec 32) (_ BitVec 64))) (size!25909 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52980)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52980 (_ BitVec 32)) Bool)

(assert (=> b!902596 (= res!609095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609094 () Bool)

(assert (=> start!77446 (=> (not res!609094) (not e!505533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77446 (= res!609094 (validMask!0 mask!1756))))

(assert (=> start!77446 e!505533))

(assert (=> start!77446 true))

(declare-datatypes ((V!29577 0))(
  ( (V!29578 (val!9280 Int)) )
))
(declare-datatypes ((ValueCell!8748 0))(
  ( (ValueCellFull!8748 (v!11785 V!29577)) (EmptyCell!8748) )
))
(declare-datatypes ((array!52982 0))(
  ( (array!52983 (arr!25451 (Array (_ BitVec 32) ValueCell!8748)) (size!25910 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52982)

(declare-fun e!505530 () Bool)

(declare-fun array_inv!19950 (array!52982) Bool)

(assert (=> start!77446 (and (array_inv!19950 _values!1152) e!505530)))

(declare-fun array_inv!19951 (array!52980) Bool)

(assert (=> start!77446 (array_inv!19951 _keys!1386)))

(declare-fun b!902597 () Bool)

(declare-fun e!505532 () Bool)

(declare-fun mapRes!29398 () Bool)

(assert (=> b!902597 (= e!505530 (and e!505532 mapRes!29398))))

(declare-fun condMapEmpty!29398 () Bool)

(declare-fun mapDefault!29398 () ValueCell!8748)

(assert (=> b!902597 (= condMapEmpty!29398 (= (arr!25451 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8748)) mapDefault!29398)))))

(declare-fun mapNonEmpty!29398 () Bool)

(declare-fun tp!56457 () Bool)

(declare-fun e!505531 () Bool)

(assert (=> mapNonEmpty!29398 (= mapRes!29398 (and tp!56457 e!505531))))

(declare-fun mapValue!29398 () ValueCell!8748)

(declare-fun mapRest!29398 () (Array (_ BitVec 32) ValueCell!8748))

(declare-fun mapKey!29398 () (_ BitVec 32))

(assert (=> mapNonEmpty!29398 (= (arr!25451 _values!1152) (store mapRest!29398 mapKey!29398 mapValue!29398))))

(declare-fun b!902598 () Bool)

(declare-fun tp_is_empty!18459 () Bool)

(assert (=> b!902598 (= e!505531 tp_is_empty!18459)))

(declare-fun b!902599 () Bool)

(assert (=> b!902599 (= e!505532 tp_is_empty!18459)))

(declare-fun mapIsEmpty!29398 () Bool)

(assert (=> mapIsEmpty!29398 mapRes!29398))

(declare-fun b!902600 () Bool)

(assert (=> b!902600 (= e!505533 false)))

(declare-fun lt!407883 () Bool)

(declare-datatypes ((List!17886 0))(
  ( (Nil!17883) (Cons!17882 (h!19028 (_ BitVec 64)) (t!25269 List!17886)) )
))
(declare-fun arrayNoDuplicates!0 (array!52980 (_ BitVec 32) List!17886) Bool)

(assert (=> b!902600 (= lt!407883 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17883))))

(declare-fun b!902601 () Bool)

(declare-fun res!609093 () Bool)

(assert (=> b!902601 (=> (not res!609093) (not e!505533))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902601 (= res!609093 (and (= (size!25910 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25909 _keys!1386) (size!25910 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77446 res!609094) b!902601))

(assert (= (and b!902601 res!609093) b!902596))

(assert (= (and b!902596 res!609095) b!902600))

(assert (= (and b!902597 condMapEmpty!29398) mapIsEmpty!29398))

(assert (= (and b!902597 (not condMapEmpty!29398)) mapNonEmpty!29398))

(get-info :version)

(assert (= (and mapNonEmpty!29398 ((_ is ValueCellFull!8748) mapValue!29398)) b!902598))

(assert (= (and b!902597 ((_ is ValueCellFull!8748) mapDefault!29398)) b!902599))

(assert (= start!77446 b!902597))

(declare-fun m!838543 () Bool)

(assert (=> b!902596 m!838543))

(declare-fun m!838545 () Bool)

(assert (=> start!77446 m!838545))

(declare-fun m!838547 () Bool)

(assert (=> start!77446 m!838547))

(declare-fun m!838549 () Bool)

(assert (=> start!77446 m!838549))

(declare-fun m!838551 () Bool)

(assert (=> mapNonEmpty!29398 m!838551))

(declare-fun m!838553 () Bool)

(assert (=> b!902600 m!838553))

(check-sat (not b!902600) (not mapNonEmpty!29398) (not b!902596) tp_is_empty!18459 (not start!77446))
(check-sat)
