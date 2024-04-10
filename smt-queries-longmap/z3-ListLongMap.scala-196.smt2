; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3798 () Bool)

(assert start!3798)

(declare-fun mapIsEmpty!1195 () Bool)

(declare-fun mapRes!1195 () Bool)

(assert (=> mapIsEmpty!1195 mapRes!1195))

(declare-fun mapNonEmpty!1195 () Bool)

(declare-fun tp!3715 () Bool)

(declare-fun e!17339 () Bool)

(assert (=> mapNonEmpty!1195 (= mapRes!1195 (and tp!3715 e!17339))))

(declare-datatypes ((V!1317 0))(
  ( (V!1318 (val!586 Int)) )
))
(declare-datatypes ((ValueCell!360 0))(
  ( (ValueCellFull!360 (v!1672 V!1317)) (EmptyCell!360) )
))
(declare-datatypes ((array!1479 0))(
  ( (array!1480 (arr!697 (Array (_ BitVec 32) ValueCell!360)) (size!798 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1479)

(declare-fun mapRest!1195 () (Array (_ BitVec 32) ValueCell!360))

(declare-fun mapValue!1195 () ValueCell!360)

(declare-fun mapKey!1195 () (_ BitVec 32))

(assert (=> mapNonEmpty!1195 (= (arr!697 _values!1501) (store mapRest!1195 mapKey!1195 mapValue!1195))))

(declare-fun b!26576 () Bool)

(declare-fun e!17338 () Bool)

(declare-fun e!17336 () Bool)

(assert (=> b!26576 (= e!17338 (and e!17336 mapRes!1195))))

(declare-fun condMapEmpty!1195 () Bool)

(declare-fun mapDefault!1195 () ValueCell!360)

(assert (=> b!26576 (= condMapEmpty!1195 (= (arr!697 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!360)) mapDefault!1195)))))

(declare-fun b!26577 () Bool)

(declare-fun tp_is_empty!1119 () Bool)

(assert (=> b!26577 (= e!17336 tp_is_empty!1119)))

(declare-fun b!26578 () Bool)

(assert (=> b!26578 (= e!17339 tp_is_empty!1119)))

(declare-fun b!26579 () Bool)

(declare-fun res!15765 () Bool)

(declare-fun e!17337 () Bool)

(assert (=> b!26579 (=> (not res!15765) (not e!17337))))

(declare-datatypes ((array!1481 0))(
  ( (array!1482 (arr!698 (Array (_ BitVec 32) (_ BitVec 64))) (size!799 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1481)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1481 (_ BitVec 32)) Bool)

(assert (=> b!26579 (= res!15765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26580 () Bool)

(declare-fun res!15763 () Bool)

(assert (=> b!26580 (=> (not res!15763) (not e!17337))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26580 (= res!15763 (and (= (size!798 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!799 _keys!1833) (size!798 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26581 () Bool)

(assert (=> b!26581 (= e!17337 false)))

(declare-fun lt!10388 () Bool)

(declare-datatypes ((List!595 0))(
  ( (Nil!592) (Cons!591 (h!1158 (_ BitVec 64)) (t!3282 List!595)) )
))
(declare-fun arrayNoDuplicates!0 (array!1481 (_ BitVec 32) List!595) Bool)

(assert (=> b!26581 (= lt!10388 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!592))))

(declare-fun res!15764 () Bool)

(assert (=> start!3798 (=> (not res!15764) (not e!17337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3798 (= res!15764 (validMask!0 mask!2294))))

(assert (=> start!3798 e!17337))

(assert (=> start!3798 true))

(declare-fun array_inv!479 (array!1479) Bool)

(assert (=> start!3798 (and (array_inv!479 _values!1501) e!17338)))

(declare-fun array_inv!480 (array!1481) Bool)

(assert (=> start!3798 (array_inv!480 _keys!1833)))

(assert (= (and start!3798 res!15764) b!26580))

(assert (= (and b!26580 res!15763) b!26579))

(assert (= (and b!26579 res!15765) b!26581))

(assert (= (and b!26576 condMapEmpty!1195) mapIsEmpty!1195))

(assert (= (and b!26576 (not condMapEmpty!1195)) mapNonEmpty!1195))

(get-info :version)

(assert (= (and mapNonEmpty!1195 ((_ is ValueCellFull!360) mapValue!1195)) b!26578))

(assert (= (and b!26576 ((_ is ValueCellFull!360) mapDefault!1195)) b!26577))

(assert (= start!3798 b!26576))

(declare-fun m!21305 () Bool)

(assert (=> mapNonEmpty!1195 m!21305))

(declare-fun m!21307 () Bool)

(assert (=> b!26579 m!21307))

(declare-fun m!21309 () Bool)

(assert (=> b!26581 m!21309))

(declare-fun m!21311 () Bool)

(assert (=> start!3798 m!21311))

(declare-fun m!21313 () Bool)

(assert (=> start!3798 m!21313))

(declare-fun m!21315 () Bool)

(assert (=> start!3798 m!21315))

(check-sat (not b!26579) (not mapNonEmpty!1195) (not start!3798) tp_is_empty!1119 (not b!26581))
(check-sat)
