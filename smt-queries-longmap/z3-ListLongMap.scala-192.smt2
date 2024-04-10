; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3774 () Bool)

(assert start!3774)

(declare-fun b!26360 () Bool)

(declare-fun e!17158 () Bool)

(declare-fun e!17159 () Bool)

(declare-fun mapRes!1159 () Bool)

(assert (=> b!26360 (= e!17158 (and e!17159 mapRes!1159))))

(declare-fun condMapEmpty!1159 () Bool)

(declare-datatypes ((V!1285 0))(
  ( (V!1286 (val!574 Int)) )
))
(declare-datatypes ((ValueCell!348 0))(
  ( (ValueCellFull!348 (v!1660 V!1285)) (EmptyCell!348) )
))
(declare-datatypes ((array!1433 0))(
  ( (array!1434 (arr!674 (Array (_ BitVec 32) ValueCell!348)) (size!775 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1433)

(declare-fun mapDefault!1159 () ValueCell!348)

(assert (=> b!26360 (= condMapEmpty!1159 (= (arr!674 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!348)) mapDefault!1159)))))

(declare-fun b!26361 () Bool)

(declare-fun e!17157 () Bool)

(declare-fun tp_is_empty!1095 () Bool)

(assert (=> b!26361 (= e!17157 tp_is_empty!1095)))

(declare-fun res!15656 () Bool)

(declare-fun e!17155 () Bool)

(assert (=> start!3774 (=> (not res!15656) (not e!17155))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3774 (= res!15656 (validMask!0 mask!2294))))

(assert (=> start!3774 e!17155))

(assert (=> start!3774 true))

(declare-fun array_inv!459 (array!1433) Bool)

(assert (=> start!3774 (and (array_inv!459 _values!1501) e!17158)))

(declare-datatypes ((array!1435 0))(
  ( (array!1436 (arr!675 (Array (_ BitVec 32) (_ BitVec 64))) (size!776 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1435)

(declare-fun array_inv!460 (array!1435) Bool)

(assert (=> start!3774 (array_inv!460 _keys!1833)))

(declare-fun b!26362 () Bool)

(declare-fun res!15655 () Bool)

(assert (=> b!26362 (=> (not res!15655) (not e!17155))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26362 (= res!15655 (and (= (size!775 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!776 _keys!1833) (size!775 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1159 () Bool)

(declare-fun tp!3679 () Bool)

(assert (=> mapNonEmpty!1159 (= mapRes!1159 (and tp!3679 e!17157))))

(declare-fun mapRest!1159 () (Array (_ BitVec 32) ValueCell!348))

(declare-fun mapKey!1159 () (_ BitVec 32))

(declare-fun mapValue!1159 () ValueCell!348)

(assert (=> mapNonEmpty!1159 (= (arr!674 _values!1501) (store mapRest!1159 mapKey!1159 mapValue!1159))))

(declare-fun b!26363 () Bool)

(assert (=> b!26363 (= e!17155 false)))

(declare-fun lt!10352 () Bool)

(declare-datatypes ((List!587 0))(
  ( (Nil!584) (Cons!583 (h!1150 (_ BitVec 64)) (t!3274 List!587)) )
))
(declare-fun arrayNoDuplicates!0 (array!1435 (_ BitVec 32) List!587) Bool)

(assert (=> b!26363 (= lt!10352 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!584))))

(declare-fun mapIsEmpty!1159 () Bool)

(assert (=> mapIsEmpty!1159 mapRes!1159))

(declare-fun b!26364 () Bool)

(declare-fun res!15657 () Bool)

(assert (=> b!26364 (=> (not res!15657) (not e!17155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1435 (_ BitVec 32)) Bool)

(assert (=> b!26364 (= res!15657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26365 () Bool)

(assert (=> b!26365 (= e!17159 tp_is_empty!1095)))

(assert (= (and start!3774 res!15656) b!26362))

(assert (= (and b!26362 res!15655) b!26364))

(assert (= (and b!26364 res!15657) b!26363))

(assert (= (and b!26360 condMapEmpty!1159) mapIsEmpty!1159))

(assert (= (and b!26360 (not condMapEmpty!1159)) mapNonEmpty!1159))

(get-info :version)

(assert (= (and mapNonEmpty!1159 ((_ is ValueCellFull!348) mapValue!1159)) b!26361))

(assert (= (and b!26360 ((_ is ValueCellFull!348) mapDefault!1159)) b!26365))

(assert (= start!3774 b!26360))

(declare-fun m!21161 () Bool)

(assert (=> start!3774 m!21161))

(declare-fun m!21163 () Bool)

(assert (=> start!3774 m!21163))

(declare-fun m!21165 () Bool)

(assert (=> start!3774 m!21165))

(declare-fun m!21167 () Bool)

(assert (=> mapNonEmpty!1159 m!21167))

(declare-fun m!21169 () Bool)

(assert (=> b!26363 m!21169))

(declare-fun m!21171 () Bool)

(assert (=> b!26364 m!21171))

(check-sat (not b!26364) tp_is_empty!1095 (not b!26363) (not start!3774) (not mapNonEmpty!1159))
(check-sat)
