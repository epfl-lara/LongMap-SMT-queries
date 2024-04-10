; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77482 () Bool)

(assert start!77482)

(declare-fun b!902920 () Bool)

(declare-fun e!505800 () Bool)

(declare-fun tp_is_empty!18495 () Bool)

(assert (=> b!902920 (= e!505800 tp_is_empty!18495)))

(declare-fun b!902921 () Bool)

(declare-fun e!505803 () Bool)

(assert (=> b!902921 (= e!505803 tp_is_empty!18495)))

(declare-fun res!609257 () Bool)

(declare-fun e!505799 () Bool)

(assert (=> start!77482 (=> (not res!609257) (not e!505799))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77482 (= res!609257 (validMask!0 mask!1756))))

(assert (=> start!77482 e!505799))

(assert (=> start!77482 true))

(declare-datatypes ((V!29625 0))(
  ( (V!29626 (val!9298 Int)) )
))
(declare-datatypes ((ValueCell!8766 0))(
  ( (ValueCellFull!8766 (v!11803 V!29625)) (EmptyCell!8766) )
))
(declare-datatypes ((array!53048 0))(
  ( (array!53049 (arr!25484 (Array (_ BitVec 32) ValueCell!8766)) (size!25943 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53048)

(declare-fun e!505801 () Bool)

(declare-fun array_inv!19978 (array!53048) Bool)

(assert (=> start!77482 (and (array_inv!19978 _values!1152) e!505801)))

(declare-datatypes ((array!53050 0))(
  ( (array!53051 (arr!25485 (Array (_ BitVec 32) (_ BitVec 64))) (size!25944 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53050)

(declare-fun array_inv!19979 (array!53050) Bool)

(assert (=> start!77482 (array_inv!19979 _keys!1386)))

(declare-fun b!902922 () Bool)

(assert (=> b!902922 (= e!505799 false)))

(declare-fun lt!407937 () Bool)

(declare-datatypes ((List!17898 0))(
  ( (Nil!17895) (Cons!17894 (h!19040 (_ BitVec 64)) (t!25281 List!17898)) )
))
(declare-fun arrayNoDuplicates!0 (array!53050 (_ BitVec 32) List!17898) Bool)

(assert (=> b!902922 (= lt!407937 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17895))))

(declare-fun b!902923 () Bool)

(declare-fun mapRes!29452 () Bool)

(assert (=> b!902923 (= e!505801 (and e!505803 mapRes!29452))))

(declare-fun condMapEmpty!29452 () Bool)

(declare-fun mapDefault!29452 () ValueCell!8766)

(assert (=> b!902923 (= condMapEmpty!29452 (= (arr!25484 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8766)) mapDefault!29452)))))

(declare-fun mapIsEmpty!29452 () Bool)

(assert (=> mapIsEmpty!29452 mapRes!29452))

(declare-fun b!902924 () Bool)

(declare-fun res!609256 () Bool)

(assert (=> b!902924 (=> (not res!609256) (not e!505799))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902924 (= res!609256 (and (= (size!25943 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25944 _keys!1386) (size!25943 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29452 () Bool)

(declare-fun tp!56511 () Bool)

(assert (=> mapNonEmpty!29452 (= mapRes!29452 (and tp!56511 e!505800))))

(declare-fun mapKey!29452 () (_ BitVec 32))

(declare-fun mapValue!29452 () ValueCell!8766)

(declare-fun mapRest!29452 () (Array (_ BitVec 32) ValueCell!8766))

(assert (=> mapNonEmpty!29452 (= (arr!25484 _values!1152) (store mapRest!29452 mapKey!29452 mapValue!29452))))

(declare-fun b!902925 () Bool)

(declare-fun res!609255 () Bool)

(assert (=> b!902925 (=> (not res!609255) (not e!505799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53050 (_ BitVec 32)) Bool)

(assert (=> b!902925 (= res!609255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77482 res!609257) b!902924))

(assert (= (and b!902924 res!609256) b!902925))

(assert (= (and b!902925 res!609255) b!902922))

(assert (= (and b!902923 condMapEmpty!29452) mapIsEmpty!29452))

(assert (= (and b!902923 (not condMapEmpty!29452)) mapNonEmpty!29452))

(get-info :version)

(assert (= (and mapNonEmpty!29452 ((_ is ValueCellFull!8766) mapValue!29452)) b!902920))

(assert (= (and b!902923 ((_ is ValueCellFull!8766) mapDefault!29452)) b!902921))

(assert (= start!77482 b!902923))

(declare-fun m!838759 () Bool)

(assert (=> start!77482 m!838759))

(declare-fun m!838761 () Bool)

(assert (=> start!77482 m!838761))

(declare-fun m!838763 () Bool)

(assert (=> start!77482 m!838763))

(declare-fun m!838765 () Bool)

(assert (=> b!902922 m!838765))

(declare-fun m!838767 () Bool)

(assert (=> mapNonEmpty!29452 m!838767))

(declare-fun m!838769 () Bool)

(assert (=> b!902925 m!838769))

(check-sat (not start!77482) (not b!902922) (not b!902925) tp_is_empty!18495 (not mapNonEmpty!29452))
(check-sat)
