; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35392 () Bool)

(assert start!35392)

(declare-fun b!354314 () Bool)

(declare-fun res!196416 () Bool)

(declare-fun e!217132 () Bool)

(assert (=> b!354314 (=> (not res!196416) (not e!217132))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19277 0))(
  ( (array!19278 (arr!9132 (Array (_ BitVec 32) (_ BitVec 64))) (size!9484 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19277)

(declare-datatypes ((V!11437 0))(
  ( (V!11438 (val!3967 Int)) )
))
(declare-datatypes ((ValueCell!3579 0))(
  ( (ValueCellFull!3579 (v!6161 V!11437)) (EmptyCell!3579) )
))
(declare-datatypes ((array!19279 0))(
  ( (array!19280 (arr!9133 (Array (_ BitVec 32) ValueCell!3579)) (size!9485 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19279)

(assert (=> b!354314 (= res!196416 (and (= (size!9485 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9484 _keys!1456) (size!9485 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354315 () Bool)

(declare-fun res!196415 () Bool)

(assert (=> b!354315 (=> (not res!196415) (not e!217132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19277 (_ BitVec 32)) Bool)

(assert (=> b!354315 (= res!196415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196417 () Bool)

(assert (=> start!35392 (=> (not res!196417) (not e!217132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35392 (= res!196417 (validMask!0 mask!1842))))

(assert (=> start!35392 e!217132))

(assert (=> start!35392 true))

(declare-fun e!217133 () Bool)

(declare-fun array_inv!6718 (array!19279) Bool)

(assert (=> start!35392 (and (array_inv!6718 _values!1208) e!217133)))

(declare-fun array_inv!6719 (array!19277) Bool)

(assert (=> start!35392 (array_inv!6719 _keys!1456)))

(declare-fun mapNonEmpty!13275 () Bool)

(declare-fun mapRes!13275 () Bool)

(declare-fun tp!27171 () Bool)

(declare-fun e!217134 () Bool)

(assert (=> mapNonEmpty!13275 (= mapRes!13275 (and tp!27171 e!217134))))

(declare-fun mapRest!13275 () (Array (_ BitVec 32) ValueCell!3579))

(declare-fun mapKey!13275 () (_ BitVec 32))

(declare-fun mapValue!13275 () ValueCell!3579)

(assert (=> mapNonEmpty!13275 (= (arr!9133 _values!1208) (store mapRest!13275 mapKey!13275 mapValue!13275))))

(declare-fun b!354316 () Bool)

(declare-fun e!217135 () Bool)

(assert (=> b!354316 (= e!217133 (and e!217135 mapRes!13275))))

(declare-fun condMapEmpty!13275 () Bool)

(declare-fun mapDefault!13275 () ValueCell!3579)

(assert (=> b!354316 (= condMapEmpty!13275 (= (arr!9133 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3579)) mapDefault!13275)))))

(declare-fun mapIsEmpty!13275 () Bool)

(assert (=> mapIsEmpty!13275 mapRes!13275))

(declare-fun b!354317 () Bool)

(declare-fun tp_is_empty!7845 () Bool)

(assert (=> b!354317 (= e!217135 tp_is_empty!7845)))

(declare-fun b!354318 () Bool)

(assert (=> b!354318 (= e!217134 tp_is_empty!7845)))

(declare-fun b!354319 () Bool)

(assert (=> b!354319 (= e!217132 false)))

(declare-fun lt!165683 () Bool)

(declare-datatypes ((List!5294 0))(
  ( (Nil!5291) (Cons!5290 (h!6146 (_ BitVec 64)) (t!10444 List!5294)) )
))
(declare-fun arrayNoDuplicates!0 (array!19277 (_ BitVec 32) List!5294) Bool)

(assert (=> b!354319 (= lt!165683 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5291))))

(assert (= (and start!35392 res!196417) b!354314))

(assert (= (and b!354314 res!196416) b!354315))

(assert (= (and b!354315 res!196415) b!354319))

(assert (= (and b!354316 condMapEmpty!13275) mapIsEmpty!13275))

(assert (= (and b!354316 (not condMapEmpty!13275)) mapNonEmpty!13275))

(get-info :version)

(assert (= (and mapNonEmpty!13275 ((_ is ValueCellFull!3579) mapValue!13275)) b!354318))

(assert (= (and b!354316 ((_ is ValueCellFull!3579) mapDefault!13275)) b!354317))

(assert (= start!35392 b!354316))

(declare-fun m!353371 () Bool)

(assert (=> b!354315 m!353371))

(declare-fun m!353373 () Bool)

(assert (=> start!35392 m!353373))

(declare-fun m!353375 () Bool)

(assert (=> start!35392 m!353375))

(declare-fun m!353377 () Bool)

(assert (=> start!35392 m!353377))

(declare-fun m!353379 () Bool)

(assert (=> mapNonEmpty!13275 m!353379))

(declare-fun m!353381 () Bool)

(assert (=> b!354319 m!353381))

(check-sat (not b!354319) tp_is_empty!7845 (not start!35392) (not mapNonEmpty!13275) (not b!354315))
(check-sat)
