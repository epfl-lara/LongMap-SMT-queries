; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35328 () Bool)

(assert start!35328)

(declare-fun b!353866 () Bool)

(declare-fun res!196210 () Bool)

(declare-fun e!216787 () Bool)

(assert (=> b!353866 (=> (not res!196210) (not e!216787))))

(declare-datatypes ((array!19192 0))(
  ( (array!19193 (arr!9090 (Array (_ BitVec 32) (_ BitVec 64))) (size!9442 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19192)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19192 (_ BitVec 32)) Bool)

(assert (=> b!353866 (= res!196210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13215 () Bool)

(declare-fun mapRes!13215 () Bool)

(declare-fun tp!27111 () Bool)

(declare-fun e!216786 () Bool)

(assert (=> mapNonEmpty!13215 (= mapRes!13215 (and tp!27111 e!216786))))

(declare-fun mapKey!13215 () (_ BitVec 32))

(declare-datatypes ((V!11387 0))(
  ( (V!11388 (val!3948 Int)) )
))
(declare-datatypes ((ValueCell!3560 0))(
  ( (ValueCellFull!3560 (v!6143 V!11387)) (EmptyCell!3560) )
))
(declare-fun mapRest!13215 () (Array (_ BitVec 32) ValueCell!3560))

(declare-fun mapValue!13215 () ValueCell!3560)

(declare-datatypes ((array!19194 0))(
  ( (array!19195 (arr!9091 (Array (_ BitVec 32) ValueCell!3560)) (size!9443 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19194)

(assert (=> mapNonEmpty!13215 (= (arr!9091 _values!1208) (store mapRest!13215 mapKey!13215 mapValue!13215))))

(declare-fun b!353867 () Bool)

(declare-fun tp_is_empty!7807 () Bool)

(assert (=> b!353867 (= e!216786 tp_is_empty!7807)))

(declare-fun b!353868 () Bool)

(declare-fun e!216788 () Bool)

(declare-fun e!216790 () Bool)

(assert (=> b!353868 (= e!216788 (and e!216790 mapRes!13215))))

(declare-fun condMapEmpty!13215 () Bool)

(declare-fun mapDefault!13215 () ValueCell!3560)

(assert (=> b!353868 (= condMapEmpty!13215 (= (arr!9091 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3560)) mapDefault!13215)))))

(declare-fun b!353869 () Bool)

(declare-fun res!196209 () Bool)

(assert (=> b!353869 (=> (not res!196209) (not e!216787))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353869 (= res!196209 (and (= (size!9443 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9442 _keys!1456) (size!9443 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13215 () Bool)

(assert (=> mapIsEmpty!13215 mapRes!13215))

(declare-fun b!353870 () Bool)

(assert (=> b!353870 (= e!216787 false)))

(declare-fun lt!165644 () Bool)

(declare-datatypes ((List!5189 0))(
  ( (Nil!5186) (Cons!5185 (h!6041 (_ BitVec 64)) (t!10331 List!5189)) )
))
(declare-fun arrayNoDuplicates!0 (array!19192 (_ BitVec 32) List!5189) Bool)

(assert (=> b!353870 (= lt!165644 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5186))))

(declare-fun b!353871 () Bool)

(assert (=> b!353871 (= e!216790 tp_is_empty!7807)))

(declare-fun res!196208 () Bool)

(assert (=> start!35328 (=> (not res!196208) (not e!216787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35328 (= res!196208 (validMask!0 mask!1842))))

(assert (=> start!35328 e!216787))

(assert (=> start!35328 true))

(declare-fun array_inv!6710 (array!19194) Bool)

(assert (=> start!35328 (and (array_inv!6710 _values!1208) e!216788)))

(declare-fun array_inv!6711 (array!19192) Bool)

(assert (=> start!35328 (array_inv!6711 _keys!1456)))

(assert (= (and start!35328 res!196208) b!353869))

(assert (= (and b!353869 res!196209) b!353866))

(assert (= (and b!353866 res!196210) b!353870))

(assert (= (and b!353868 condMapEmpty!13215) mapIsEmpty!13215))

(assert (= (and b!353868 (not condMapEmpty!13215)) mapNonEmpty!13215))

(get-info :version)

(assert (= (and mapNonEmpty!13215 ((_ is ValueCellFull!3560) mapValue!13215)) b!353867))

(assert (= (and b!353868 ((_ is ValueCellFull!3560) mapDefault!13215)) b!353871))

(assert (= start!35328 b!353868))

(declare-fun m!353343 () Bool)

(assert (=> b!353866 m!353343))

(declare-fun m!353345 () Bool)

(assert (=> mapNonEmpty!13215 m!353345))

(declare-fun m!353347 () Bool)

(assert (=> b!353870 m!353347))

(declare-fun m!353349 () Bool)

(assert (=> start!35328 m!353349))

(declare-fun m!353351 () Bool)

(assert (=> start!35328 m!353351))

(declare-fun m!353353 () Bool)

(assert (=> start!35328 m!353353))

(check-sat (not b!353870) (not b!353866) (not start!35328) tp_is_empty!7807 (not mapNonEmpty!13215))
(check-sat)
