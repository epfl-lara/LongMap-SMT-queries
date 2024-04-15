; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3762 () Bool)

(assert start!3762)

(declare-fun b!26288 () Bool)

(declare-fun e!17098 () Bool)

(declare-fun tp_is_empty!1093 () Bool)

(assert (=> b!26288 (= e!17098 tp_is_empty!1093)))

(declare-fun b!26289 () Bool)

(declare-fun e!17100 () Bool)

(assert (=> b!26289 (= e!17100 false)))

(declare-fun lt!10345 () Bool)

(declare-datatypes ((array!1409 0))(
  ( (array!1410 (arr!662 (Array (_ BitVec 32) (_ BitVec 64))) (size!763 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1409)

(declare-datatypes ((List!582 0))(
  ( (Nil!579) (Cons!578 (h!1145 (_ BitVec 64)) (t!3262 List!582)) )
))
(declare-fun arrayNoDuplicates!0 (array!1409 (_ BitVec 32) List!582) Bool)

(assert (=> b!26289 (= lt!10345 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!579))))

(declare-fun b!26290 () Bool)

(declare-fun e!17097 () Bool)

(declare-fun mapRes!1156 () Bool)

(assert (=> b!26290 (= e!17097 (and e!17098 mapRes!1156))))

(declare-fun condMapEmpty!1156 () Bool)

(declare-datatypes ((V!1283 0))(
  ( (V!1284 (val!573 Int)) )
))
(declare-datatypes ((ValueCell!347 0))(
  ( (ValueCellFull!347 (v!1658 V!1283)) (EmptyCell!347) )
))
(declare-datatypes ((array!1411 0))(
  ( (array!1412 (arr!663 (Array (_ BitVec 32) ValueCell!347)) (size!764 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1411)

(declare-fun mapDefault!1156 () ValueCell!347)

(assert (=> b!26290 (= condMapEmpty!1156 (= (arr!663 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!347)) mapDefault!1156)))))

(declare-fun mapIsEmpty!1156 () Bool)

(assert (=> mapIsEmpty!1156 mapRes!1156))

(declare-fun b!26292 () Bool)

(declare-fun e!17099 () Bool)

(assert (=> b!26292 (= e!17099 tp_is_empty!1093)))

(declare-fun mapNonEmpty!1156 () Bool)

(declare-fun tp!3676 () Bool)

(assert (=> mapNonEmpty!1156 (= mapRes!1156 (and tp!3676 e!17099))))

(declare-fun mapValue!1156 () ValueCell!347)

(declare-fun mapRest!1156 () (Array (_ BitVec 32) ValueCell!347))

(declare-fun mapKey!1156 () (_ BitVec 32))

(assert (=> mapNonEmpty!1156 (= (arr!663 _values!1501) (store mapRest!1156 mapKey!1156 mapValue!1156))))

(declare-fun b!26293 () Bool)

(declare-fun res!15616 () Bool)

(assert (=> b!26293 (=> (not res!15616) (not e!17100))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1409 (_ BitVec 32)) Bool)

(assert (=> b!26293 (= res!15616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!15615 () Bool)

(assert (=> start!3762 (=> (not res!15615) (not e!17100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3762 (= res!15615 (validMask!0 mask!2294))))

(assert (=> start!3762 e!17100))

(assert (=> start!3762 true))

(declare-fun array_inv!465 (array!1411) Bool)

(assert (=> start!3762 (and (array_inv!465 _values!1501) e!17097)))

(declare-fun array_inv!466 (array!1409) Bool)

(assert (=> start!3762 (array_inv!466 _keys!1833)))

(declare-fun b!26291 () Bool)

(declare-fun res!15614 () Bool)

(assert (=> b!26291 (=> (not res!15614) (not e!17100))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26291 (= res!15614 (and (= (size!764 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!763 _keys!1833) (size!764 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3762 res!15615) b!26291))

(assert (= (and b!26291 res!15614) b!26293))

(assert (= (and b!26293 res!15616) b!26289))

(assert (= (and b!26290 condMapEmpty!1156) mapIsEmpty!1156))

(assert (= (and b!26290 (not condMapEmpty!1156)) mapNonEmpty!1156))

(get-info :version)

(assert (= (and mapNonEmpty!1156 ((_ is ValueCellFull!347) mapValue!1156)) b!26292))

(assert (= (and b!26290 ((_ is ValueCellFull!347) mapDefault!1156)) b!26288))

(assert (= start!3762 b!26290))

(declare-fun m!21079 () Bool)

(assert (=> b!26289 m!21079))

(declare-fun m!21081 () Bool)

(assert (=> mapNonEmpty!1156 m!21081))

(declare-fun m!21083 () Bool)

(assert (=> b!26293 m!21083))

(declare-fun m!21085 () Bool)

(assert (=> start!3762 m!21085))

(declare-fun m!21087 () Bool)

(assert (=> start!3762 m!21087))

(declare-fun m!21089 () Bool)

(assert (=> start!3762 m!21089))

(check-sat tp_is_empty!1093 (not b!26289) (not b!26293) (not start!3762) (not mapNonEmpty!1156))
(check-sat)
