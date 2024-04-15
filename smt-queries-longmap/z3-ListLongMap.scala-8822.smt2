; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107156 () Bool)

(assert start!107156)

(declare-fun b!1270363 () Bool)

(declare-fun res!845381 () Bool)

(declare-fun e!724143 () Bool)

(assert (=> b!1270363 (=> (not res!845381) (not e!724143))))

(declare-datatypes ((V!48987 0))(
  ( (V!48988 (val!16497 Int)) )
))
(declare-datatypes ((ValueCell!15569 0))(
  ( (ValueCellFull!15569 (v!19133 V!48987)) (EmptyCell!15569) )
))
(declare-datatypes ((array!82861 0))(
  ( (array!82862 (arr!39968 (Array (_ BitVec 32) ValueCell!15569)) (size!40506 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82861)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82863 0))(
  ( (array!82864 (arr!39969 (Array (_ BitVec 32) (_ BitVec 64))) (size!40507 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82863)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270363 (= res!845381 (and (= (size!40506 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40507 _keys!1364) (size!40506 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270364 () Bool)

(declare-fun res!845379 () Bool)

(assert (=> b!1270364 (=> (not res!845379) (not e!724143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82863 (_ BitVec 32)) Bool)

(assert (=> b!1270364 (= res!845379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270365 () Bool)

(declare-fun e!724142 () Bool)

(declare-fun tp_is_empty!32845 () Bool)

(assert (=> b!1270365 (= e!724142 tp_is_empty!32845)))

(declare-fun res!845380 () Bool)

(assert (=> start!107156 (=> (not res!845380) (not e!724143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107156 (= res!845380 (validMask!0 mask!1730))))

(assert (=> start!107156 e!724143))

(declare-fun e!724141 () Bool)

(declare-fun array_inv!30565 (array!82861) Bool)

(assert (=> start!107156 (and (array_inv!30565 _values!1134) e!724141)))

(assert (=> start!107156 true))

(declare-fun array_inv!30566 (array!82863) Bool)

(assert (=> start!107156 (array_inv!30566 _keys!1364)))

(declare-fun b!1270366 () Bool)

(declare-fun e!724140 () Bool)

(assert (=> b!1270366 (= e!724140 tp_is_empty!32845)))

(declare-fun b!1270367 () Bool)

(assert (=> b!1270367 (= e!724143 false)))

(declare-fun lt!574526 () Bool)

(declare-datatypes ((List!28561 0))(
  ( (Nil!28558) (Cons!28557 (h!29766 (_ BitVec 64)) (t!42082 List!28561)) )
))
(declare-fun arrayNoDuplicates!0 (array!82863 (_ BitVec 32) List!28561) Bool)

(assert (=> b!1270367 (= lt!574526 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28558))))

(declare-fun mapNonEmpty!50848 () Bool)

(declare-fun mapRes!50848 () Bool)

(declare-fun tp!97190 () Bool)

(assert (=> mapNonEmpty!50848 (= mapRes!50848 (and tp!97190 e!724142))))

(declare-fun mapRest!50848 () (Array (_ BitVec 32) ValueCell!15569))

(declare-fun mapKey!50848 () (_ BitVec 32))

(declare-fun mapValue!50848 () ValueCell!15569)

(assert (=> mapNonEmpty!50848 (= (arr!39968 _values!1134) (store mapRest!50848 mapKey!50848 mapValue!50848))))

(declare-fun mapIsEmpty!50848 () Bool)

(assert (=> mapIsEmpty!50848 mapRes!50848))

(declare-fun b!1270368 () Bool)

(assert (=> b!1270368 (= e!724141 (and e!724140 mapRes!50848))))

(declare-fun condMapEmpty!50848 () Bool)

(declare-fun mapDefault!50848 () ValueCell!15569)

(assert (=> b!1270368 (= condMapEmpty!50848 (= (arr!39968 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15569)) mapDefault!50848)))))

(assert (= (and start!107156 res!845380) b!1270363))

(assert (= (and b!1270363 res!845381) b!1270364))

(assert (= (and b!1270364 res!845379) b!1270367))

(assert (= (and b!1270368 condMapEmpty!50848) mapIsEmpty!50848))

(assert (= (and b!1270368 (not condMapEmpty!50848)) mapNonEmpty!50848))

(get-info :version)

(assert (= (and mapNonEmpty!50848 ((_ is ValueCellFull!15569) mapValue!50848)) b!1270365))

(assert (= (and b!1270368 ((_ is ValueCellFull!15569) mapDefault!50848)) b!1270366))

(assert (= start!107156 b!1270368))

(declare-fun m!1168215 () Bool)

(assert (=> b!1270364 m!1168215))

(declare-fun m!1168217 () Bool)

(assert (=> start!107156 m!1168217))

(declare-fun m!1168219 () Bool)

(assert (=> start!107156 m!1168219))

(declare-fun m!1168221 () Bool)

(assert (=> start!107156 m!1168221))

(declare-fun m!1168223 () Bool)

(assert (=> b!1270367 m!1168223))

(declare-fun m!1168225 () Bool)

(assert (=> mapNonEmpty!50848 m!1168225))

(check-sat (not b!1270364) (not b!1270367) (not start!107156) tp_is_empty!32845 (not mapNonEmpty!50848))
(check-sat)
