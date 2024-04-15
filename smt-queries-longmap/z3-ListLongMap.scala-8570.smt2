; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104624 () Bool)

(assert start!104624)

(declare-fun mapIsEmpty!48790 () Bool)

(declare-fun mapRes!48790 () Bool)

(assert (=> mapIsEmpty!48790 mapRes!48790))

(declare-fun res!832406 () Bool)

(declare-fun e!707749 () Bool)

(assert (=> start!104624 (=> (not res!832406) (not e!707749))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104624 (= res!832406 (validMask!0 mask!1466))))

(assert (=> start!104624 e!707749))

(assert (=> start!104624 true))

(declare-datatypes ((array!80331 0))(
  ( (array!80332 (arr!38735 (Array (_ BitVec 32) (_ BitVec 64))) (size!39273 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80331)

(declare-fun array_inv!29701 (array!80331) Bool)

(assert (=> start!104624 (array_inv!29701 _keys!1118)))

(declare-datatypes ((V!47175 0))(
  ( (V!47176 (val!15741 Int)) )
))
(declare-datatypes ((ValueCell!14915 0))(
  ( (ValueCellFull!14915 (v!18436 V!47175)) (EmptyCell!14915) )
))
(declare-datatypes ((array!80333 0))(
  ( (array!80334 (arr!38736 (Array (_ BitVec 32) ValueCell!14915)) (size!39274 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80333)

(declare-fun e!707748 () Bool)

(declare-fun array_inv!29702 (array!80333) Bool)

(assert (=> start!104624 (and (array_inv!29702 _values!914) e!707748)))

(declare-fun b!1247511 () Bool)

(declare-fun e!707750 () Bool)

(declare-fun tp_is_empty!31357 () Bool)

(assert (=> b!1247511 (= e!707750 tp_is_empty!31357)))

(declare-fun b!1247512 () Bool)

(declare-fun res!832405 () Bool)

(assert (=> b!1247512 (=> (not res!832405) (not e!707749))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247512 (= res!832405 (and (= (size!39274 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39273 _keys!1118) (size!39274 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247513 () Bool)

(assert (=> b!1247513 (= e!707749 false)))

(declare-fun lt!563108 () Bool)

(declare-datatypes ((List!27598 0))(
  ( (Nil!27595) (Cons!27594 (h!28803 (_ BitVec 64)) (t!41058 List!27598)) )
))
(declare-fun arrayNoDuplicates!0 (array!80331 (_ BitVec 32) List!27598) Bool)

(assert (=> b!1247513 (= lt!563108 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27595))))

(declare-fun mapNonEmpty!48790 () Bool)

(declare-fun tp!92891 () Bool)

(declare-fun e!707752 () Bool)

(assert (=> mapNonEmpty!48790 (= mapRes!48790 (and tp!92891 e!707752))))

(declare-fun mapKey!48790 () (_ BitVec 32))

(declare-fun mapRest!48790 () (Array (_ BitVec 32) ValueCell!14915))

(declare-fun mapValue!48790 () ValueCell!14915)

(assert (=> mapNonEmpty!48790 (= (arr!38736 _values!914) (store mapRest!48790 mapKey!48790 mapValue!48790))))

(declare-fun b!1247514 () Bool)

(declare-fun res!832404 () Bool)

(assert (=> b!1247514 (=> (not res!832404) (not e!707749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80331 (_ BitVec 32)) Bool)

(assert (=> b!1247514 (= res!832404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247515 () Bool)

(assert (=> b!1247515 (= e!707748 (and e!707750 mapRes!48790))))

(declare-fun condMapEmpty!48790 () Bool)

(declare-fun mapDefault!48790 () ValueCell!14915)

(assert (=> b!1247515 (= condMapEmpty!48790 (= (arr!38736 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14915)) mapDefault!48790)))))

(declare-fun b!1247516 () Bool)

(assert (=> b!1247516 (= e!707752 tp_is_empty!31357)))

(assert (= (and start!104624 res!832406) b!1247512))

(assert (= (and b!1247512 res!832405) b!1247514))

(assert (= (and b!1247514 res!832404) b!1247513))

(assert (= (and b!1247515 condMapEmpty!48790) mapIsEmpty!48790))

(assert (= (and b!1247515 (not condMapEmpty!48790)) mapNonEmpty!48790))

(get-info :version)

(assert (= (and mapNonEmpty!48790 ((_ is ValueCellFull!14915) mapValue!48790)) b!1247516))

(assert (= (and b!1247515 ((_ is ValueCellFull!14915) mapDefault!48790)) b!1247511))

(assert (= start!104624 b!1247515))

(declare-fun m!1148531 () Bool)

(assert (=> start!104624 m!1148531))

(declare-fun m!1148533 () Bool)

(assert (=> start!104624 m!1148533))

(declare-fun m!1148535 () Bool)

(assert (=> start!104624 m!1148535))

(declare-fun m!1148537 () Bool)

(assert (=> b!1247513 m!1148537))

(declare-fun m!1148539 () Bool)

(assert (=> mapNonEmpty!48790 m!1148539))

(declare-fun m!1148541 () Bool)

(assert (=> b!1247514 m!1148541))

(check-sat tp_is_empty!31357 (not mapNonEmpty!48790) (not b!1247513) (not b!1247514) (not start!104624))
(check-sat)
