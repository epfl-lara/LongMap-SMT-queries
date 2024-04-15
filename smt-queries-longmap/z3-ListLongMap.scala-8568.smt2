; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104612 () Bool)

(assert start!104612)

(declare-fun mapIsEmpty!48772 () Bool)

(declare-fun mapRes!48772 () Bool)

(assert (=> mapIsEmpty!48772 mapRes!48772))

(declare-fun b!1247403 () Bool)

(declare-fun e!707660 () Bool)

(declare-fun tp_is_empty!31345 () Bool)

(assert (=> b!1247403 (= e!707660 tp_is_empty!31345)))

(declare-fun mapNonEmpty!48772 () Bool)

(declare-fun tp!92873 () Bool)

(assert (=> mapNonEmpty!48772 (= mapRes!48772 (and tp!92873 e!707660))))

(declare-datatypes ((V!47159 0))(
  ( (V!47160 (val!15735 Int)) )
))
(declare-datatypes ((ValueCell!14909 0))(
  ( (ValueCellFull!14909 (v!18430 V!47159)) (EmptyCell!14909) )
))
(declare-datatypes ((array!80307 0))(
  ( (array!80308 (arr!38723 (Array (_ BitVec 32) ValueCell!14909)) (size!39261 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80307)

(declare-fun mapValue!48772 () ValueCell!14909)

(declare-fun mapKey!48772 () (_ BitVec 32))

(declare-fun mapRest!48772 () (Array (_ BitVec 32) ValueCell!14909))

(assert (=> mapNonEmpty!48772 (= (arr!38723 _values!914) (store mapRest!48772 mapKey!48772 mapValue!48772))))

(declare-fun b!1247405 () Bool)

(declare-fun res!832351 () Bool)

(declare-fun e!707662 () Bool)

(assert (=> b!1247405 (=> (not res!832351) (not e!707662))))

(declare-datatypes ((array!80309 0))(
  ( (array!80310 (arr!38724 (Array (_ BitVec 32) (_ BitVec 64))) (size!39262 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80309)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80309 (_ BitVec 32)) Bool)

(assert (=> b!1247405 (= res!832351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!832350 () Bool)

(assert (=> start!104612 (=> (not res!832350) (not e!707662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104612 (= res!832350 (validMask!0 mask!1466))))

(assert (=> start!104612 e!707662))

(assert (=> start!104612 true))

(declare-fun array_inv!29689 (array!80309) Bool)

(assert (=> start!104612 (array_inv!29689 _keys!1118)))

(declare-fun e!707659 () Bool)

(declare-fun array_inv!29690 (array!80307) Bool)

(assert (=> start!104612 (and (array_inv!29690 _values!914) e!707659)))

(declare-fun b!1247404 () Bool)

(assert (=> b!1247404 (= e!707662 false)))

(declare-fun lt!563090 () Bool)

(declare-datatypes ((List!27592 0))(
  ( (Nil!27589) (Cons!27588 (h!28797 (_ BitVec 64)) (t!41052 List!27592)) )
))
(declare-fun arrayNoDuplicates!0 (array!80309 (_ BitVec 32) List!27592) Bool)

(assert (=> b!1247404 (= lt!563090 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27589))))

(declare-fun b!1247406 () Bool)

(declare-fun res!832352 () Bool)

(assert (=> b!1247406 (=> (not res!832352) (not e!707662))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1247406 (= res!832352 (and (= (size!39261 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39262 _keys!1118) (size!39261 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247407 () Bool)

(declare-fun e!707658 () Bool)

(assert (=> b!1247407 (= e!707659 (and e!707658 mapRes!48772))))

(declare-fun condMapEmpty!48772 () Bool)

(declare-fun mapDefault!48772 () ValueCell!14909)

(assert (=> b!1247407 (= condMapEmpty!48772 (= (arr!38723 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14909)) mapDefault!48772)))))

(declare-fun b!1247408 () Bool)

(assert (=> b!1247408 (= e!707658 tp_is_empty!31345)))

(assert (= (and start!104612 res!832350) b!1247406))

(assert (= (and b!1247406 res!832352) b!1247405))

(assert (= (and b!1247405 res!832351) b!1247404))

(assert (= (and b!1247407 condMapEmpty!48772) mapIsEmpty!48772))

(assert (= (and b!1247407 (not condMapEmpty!48772)) mapNonEmpty!48772))

(get-info :version)

(assert (= (and mapNonEmpty!48772 ((_ is ValueCellFull!14909) mapValue!48772)) b!1247403))

(assert (= (and b!1247407 ((_ is ValueCellFull!14909) mapDefault!48772)) b!1247408))

(assert (= start!104612 b!1247407))

(declare-fun m!1148459 () Bool)

(assert (=> mapNonEmpty!48772 m!1148459))

(declare-fun m!1148461 () Bool)

(assert (=> b!1247405 m!1148461))

(declare-fun m!1148463 () Bool)

(assert (=> start!104612 m!1148463))

(declare-fun m!1148465 () Bool)

(assert (=> start!104612 m!1148465))

(declare-fun m!1148467 () Bool)

(assert (=> start!104612 m!1148467))

(declare-fun m!1148469 () Bool)

(assert (=> b!1247404 m!1148469))

(check-sat (not b!1247405) tp_is_empty!31345 (not b!1247404) (not mapNonEmpty!48772) (not start!104612))
(check-sat)
