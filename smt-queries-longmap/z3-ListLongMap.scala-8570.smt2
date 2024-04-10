; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104630 () Bool)

(assert start!104630)

(declare-fun b!1247611 () Bool)

(declare-fun e!707810 () Bool)

(declare-fun tp_is_empty!31359 () Bool)

(assert (=> b!1247611 (= e!707810 tp_is_empty!31359)))

(declare-fun b!1247612 () Bool)

(declare-fun e!707809 () Bool)

(assert (=> b!1247612 (= e!707809 false)))

(declare-fun lt!563290 () Bool)

(declare-datatypes ((array!80414 0))(
  ( (array!80415 (arr!38776 (Array (_ BitVec 32) (_ BitVec 64))) (size!39312 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80414)

(declare-datatypes ((List!27533 0))(
  ( (Nil!27530) (Cons!27529 (h!28738 (_ BitVec 64)) (t!41002 List!27533)) )
))
(declare-fun arrayNoDuplicates!0 (array!80414 (_ BitVec 32) List!27533) Bool)

(assert (=> b!1247612 (= lt!563290 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27530))))

(declare-fun b!1247613 () Bool)

(declare-fun e!707811 () Bool)

(declare-fun e!707812 () Bool)

(declare-fun mapRes!48793 () Bool)

(assert (=> b!1247613 (= e!707811 (and e!707812 mapRes!48793))))

(declare-fun condMapEmpty!48793 () Bool)

(declare-datatypes ((V!47177 0))(
  ( (V!47178 (val!15742 Int)) )
))
(declare-datatypes ((ValueCell!14916 0))(
  ( (ValueCellFull!14916 (v!18438 V!47177)) (EmptyCell!14916) )
))
(declare-datatypes ((array!80416 0))(
  ( (array!80417 (arr!38777 (Array (_ BitVec 32) ValueCell!14916)) (size!39313 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80416)

(declare-fun mapDefault!48793 () ValueCell!14916)

(assert (=> b!1247613 (= condMapEmpty!48793 (= (arr!38777 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14916)) mapDefault!48793)))))

(declare-fun res!832455 () Bool)

(assert (=> start!104630 (=> (not res!832455) (not e!707809))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104630 (= res!832455 (validMask!0 mask!1466))))

(assert (=> start!104630 e!707809))

(assert (=> start!104630 true))

(declare-fun array_inv!29605 (array!80414) Bool)

(assert (=> start!104630 (array_inv!29605 _keys!1118)))

(declare-fun array_inv!29606 (array!80416) Bool)

(assert (=> start!104630 (and (array_inv!29606 _values!914) e!707811)))

(declare-fun mapIsEmpty!48793 () Bool)

(assert (=> mapIsEmpty!48793 mapRes!48793))

(declare-fun b!1247614 () Bool)

(declare-fun res!832453 () Bool)

(assert (=> b!1247614 (=> (not res!832453) (not e!707809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80414 (_ BitVec 32)) Bool)

(assert (=> b!1247614 (= res!832453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247615 () Bool)

(assert (=> b!1247615 (= e!707812 tp_is_empty!31359)))

(declare-fun mapNonEmpty!48793 () Bool)

(declare-fun tp!92894 () Bool)

(assert (=> mapNonEmpty!48793 (= mapRes!48793 (and tp!92894 e!707810))))

(declare-fun mapValue!48793 () ValueCell!14916)

(declare-fun mapKey!48793 () (_ BitVec 32))

(declare-fun mapRest!48793 () (Array (_ BitVec 32) ValueCell!14916))

(assert (=> mapNonEmpty!48793 (= (arr!38777 _values!914) (store mapRest!48793 mapKey!48793 mapValue!48793))))

(declare-fun b!1247616 () Bool)

(declare-fun res!832454 () Bool)

(assert (=> b!1247616 (=> (not res!832454) (not e!707809))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247616 (= res!832454 (and (= (size!39313 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39312 _keys!1118) (size!39313 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104630 res!832455) b!1247616))

(assert (= (and b!1247616 res!832454) b!1247614))

(assert (= (and b!1247614 res!832453) b!1247612))

(assert (= (and b!1247613 condMapEmpty!48793) mapIsEmpty!48793))

(assert (= (and b!1247613 (not condMapEmpty!48793)) mapNonEmpty!48793))

(get-info :version)

(assert (= (and mapNonEmpty!48793 ((_ is ValueCellFull!14916) mapValue!48793)) b!1247611))

(assert (= (and b!1247613 ((_ is ValueCellFull!14916) mapDefault!48793)) b!1247615))

(assert (= start!104630 b!1247613))

(declare-fun m!1149063 () Bool)

(assert (=> b!1247612 m!1149063))

(declare-fun m!1149065 () Bool)

(assert (=> start!104630 m!1149065))

(declare-fun m!1149067 () Bool)

(assert (=> start!104630 m!1149067))

(declare-fun m!1149069 () Bool)

(assert (=> start!104630 m!1149069))

(declare-fun m!1149071 () Bool)

(assert (=> b!1247614 m!1149071))

(declare-fun m!1149073 () Bool)

(assert (=> mapNonEmpty!48793 m!1149073))

(check-sat (not start!104630) (not b!1247614) tp_is_empty!31359 (not b!1247612) (not mapNonEmpty!48793))
(check-sat)
