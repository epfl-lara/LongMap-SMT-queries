; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77366 () Bool)

(assert start!77366)

(declare-fun b!902154 () Bool)

(declare-fun e!505166 () Bool)

(declare-fun tp_is_empty!18423 () Bool)

(assert (=> b!902154 (= e!505166 tp_is_empty!18423)))

(declare-fun b!902155 () Bool)

(declare-fun e!505164 () Bool)

(declare-fun mapRes!29329 () Bool)

(assert (=> b!902155 (= e!505164 (and e!505166 mapRes!29329))))

(declare-fun condMapEmpty!29329 () Bool)

(declare-datatypes ((V!29529 0))(
  ( (V!29530 (val!9262 Int)) )
))
(declare-datatypes ((ValueCell!8730 0))(
  ( (ValueCellFull!8730 (v!11766 V!29529)) (EmptyCell!8730) )
))
(declare-datatypes ((array!52908 0))(
  ( (array!52909 (arr!25419 (Array (_ BitVec 32) ValueCell!8730)) (size!25878 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52908)

(declare-fun mapDefault!29329 () ValueCell!8730)

(assert (=> b!902155 (= condMapEmpty!29329 (= (arr!25419 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8730)) mapDefault!29329)))))

(declare-fun res!608877 () Bool)

(declare-fun e!505167 () Bool)

(assert (=> start!77366 (=> (not res!608877) (not e!505167))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77366 (= res!608877 (validMask!0 mask!1756))))

(assert (=> start!77366 e!505167))

(assert (=> start!77366 true))

(declare-fun array_inv!19934 (array!52908) Bool)

(assert (=> start!77366 (and (array_inv!19934 _values!1152) e!505164)))

(declare-datatypes ((array!52910 0))(
  ( (array!52911 (arr!25420 (Array (_ BitVec 32) (_ BitVec 64))) (size!25879 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52910)

(declare-fun array_inv!19935 (array!52910) Bool)

(assert (=> start!77366 (array_inv!19935 _keys!1386)))

(declare-fun mapIsEmpty!29329 () Bool)

(assert (=> mapIsEmpty!29329 mapRes!29329))

(declare-fun b!902156 () Bool)

(declare-fun e!505168 () Bool)

(assert (=> b!902156 (= e!505168 tp_is_empty!18423)))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun b!902157 () Bool)

(assert (=> b!902157 (= e!505167 (and (= (size!25878 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25879 _keys!1386) (size!25878 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (not (= (size!25879 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)))))))

(declare-fun mapNonEmpty!29329 () Bool)

(declare-fun tp!56388 () Bool)

(assert (=> mapNonEmpty!29329 (= mapRes!29329 (and tp!56388 e!505168))))

(declare-fun mapKey!29329 () (_ BitVec 32))

(declare-fun mapValue!29329 () ValueCell!8730)

(declare-fun mapRest!29329 () (Array (_ BitVec 32) ValueCell!8730))

(assert (=> mapNonEmpty!29329 (= (arr!25419 _values!1152) (store mapRest!29329 mapKey!29329 mapValue!29329))))

(assert (= (and start!77366 res!608877) b!902157))

(assert (= (and b!902155 condMapEmpty!29329) mapIsEmpty!29329))

(assert (= (and b!902155 (not condMapEmpty!29329)) mapNonEmpty!29329))

(get-info :version)

(assert (= (and mapNonEmpty!29329 ((_ is ValueCellFull!8730) mapValue!29329)) b!902156))

(assert (= (and b!902155 ((_ is ValueCellFull!8730) mapDefault!29329)) b!902154))

(assert (= start!77366 b!902155))

(declare-fun m!838271 () Bool)

(assert (=> start!77366 m!838271))

(declare-fun m!838273 () Bool)

(assert (=> start!77366 m!838273))

(declare-fun m!838275 () Bool)

(assert (=> start!77366 m!838275))

(declare-fun m!838277 () Bool)

(assert (=> mapNonEmpty!29329 m!838277))

(check-sat (not start!77366) (not mapNonEmpty!29329) tp_is_empty!18423)
(check-sat)
