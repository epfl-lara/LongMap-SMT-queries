; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106990 () Bool)

(assert start!106990)

(declare-fun b!1268609 () Bool)

(declare-fun res!844335 () Bool)

(declare-fun e!722924 () Bool)

(assert (=> b!1268609 (=> (not res!844335) (not e!722924))))

(declare-datatypes ((array!82630 0))(
  ( (array!82631 (arr!39852 (Array (_ BitVec 32) (_ BitVec 64))) (size!40388 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82630)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82630 (_ BitVec 32)) Bool)

(assert (=> b!1268609 (= res!844335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50599 () Bool)

(declare-fun mapRes!50599 () Bool)

(assert (=> mapIsEmpty!50599 mapRes!50599))

(declare-fun b!1268610 () Bool)

(declare-fun e!722928 () Bool)

(declare-fun e!722925 () Bool)

(assert (=> b!1268610 (= e!722928 (and e!722925 mapRes!50599))))

(declare-fun condMapEmpty!50599 () Bool)

(declare-datatypes ((V!48765 0))(
  ( (V!48766 (val!16414 Int)) )
))
(declare-datatypes ((ValueCell!15486 0))(
  ( (ValueCellFull!15486 (v!19051 V!48765)) (EmptyCell!15486) )
))
(declare-datatypes ((array!82632 0))(
  ( (array!82633 (arr!39853 (Array (_ BitVec 32) ValueCell!15486)) (size!40389 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82632)

(declare-fun mapDefault!50599 () ValueCell!15486)

(assert (=> b!1268610 (= condMapEmpty!50599 (= (arr!39853 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15486)) mapDefault!50599)))))

(declare-fun res!844337 () Bool)

(assert (=> start!106990 (=> (not res!844337) (not e!722924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106990 (= res!844337 (validMask!0 mask!1730))))

(assert (=> start!106990 e!722924))

(declare-fun array_inv!30323 (array!82632) Bool)

(assert (=> start!106990 (and (array_inv!30323 _values!1134) e!722928)))

(assert (=> start!106990 true))

(declare-fun array_inv!30324 (array!82630) Bool)

(assert (=> start!106990 (array_inv!30324 _keys!1364)))

(declare-fun mapNonEmpty!50599 () Bool)

(declare-fun tp!96778 () Bool)

(declare-fun e!722927 () Bool)

(assert (=> mapNonEmpty!50599 (= mapRes!50599 (and tp!96778 e!722927))))

(declare-fun mapValue!50599 () ValueCell!15486)

(declare-fun mapRest!50599 () (Array (_ BitVec 32) ValueCell!15486))

(declare-fun mapKey!50599 () (_ BitVec 32))

(assert (=> mapNonEmpty!50599 (= (arr!39853 _values!1134) (store mapRest!50599 mapKey!50599 mapValue!50599))))

(declare-fun b!1268611 () Bool)

(declare-fun res!844336 () Bool)

(assert (=> b!1268611 (=> (not res!844336) (not e!722924))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268611 (= res!844336 (and (= (size!40389 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40388 _keys!1364) (size!40389 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268612 () Bool)

(declare-fun tp_is_empty!32679 () Bool)

(assert (=> b!1268612 (= e!722927 tp_is_empty!32679)))

(declare-fun b!1268613 () Bool)

(assert (=> b!1268613 (= e!722925 tp_is_empty!32679)))

(declare-fun b!1268614 () Bool)

(assert (=> b!1268614 (= e!722924 false)))

(declare-fun lt!574455 () Bool)

(declare-datatypes ((List!28387 0))(
  ( (Nil!28384) (Cons!28383 (h!29592 (_ BitVec 64)) (t!41916 List!28387)) )
))
(declare-fun arrayNoDuplicates!0 (array!82630 (_ BitVec 32) List!28387) Bool)

(assert (=> b!1268614 (= lt!574455 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28384))))

(assert (= (and start!106990 res!844337) b!1268611))

(assert (= (and b!1268611 res!844336) b!1268609))

(assert (= (and b!1268609 res!844335) b!1268614))

(assert (= (and b!1268610 condMapEmpty!50599) mapIsEmpty!50599))

(assert (= (and b!1268610 (not condMapEmpty!50599)) mapNonEmpty!50599))

(get-info :version)

(assert (= (and mapNonEmpty!50599 ((_ is ValueCellFull!15486) mapValue!50599)) b!1268612))

(assert (= (and b!1268610 ((_ is ValueCellFull!15486) mapDefault!50599)) b!1268613))

(assert (= start!106990 b!1268610))

(declare-fun m!1167395 () Bool)

(assert (=> b!1268609 m!1167395))

(declare-fun m!1167397 () Bool)

(assert (=> start!106990 m!1167397))

(declare-fun m!1167399 () Bool)

(assert (=> start!106990 m!1167399))

(declare-fun m!1167401 () Bool)

(assert (=> start!106990 m!1167401))

(declare-fun m!1167403 () Bool)

(assert (=> mapNonEmpty!50599 m!1167403))

(declare-fun m!1167405 () Bool)

(assert (=> b!1268614 m!1167405))

(check-sat (not b!1268609) tp_is_empty!32679 (not mapNonEmpty!50599) (not b!1268614) (not start!106990))
(check-sat)
