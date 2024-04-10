; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104694 () Bool)

(assert start!104694)

(declare-fun b_free!26511 () Bool)

(declare-fun b_next!26511 () Bool)

(assert (=> start!104694 (= b_free!26511 (not b_next!26511))))

(declare-fun tp!93020 () Bool)

(declare-fun b_and!44275 () Bool)

(assert (=> start!104694 (= tp!93020 b_and!44275)))

(declare-fun mapIsEmpty!48877 () Bool)

(declare-fun mapRes!48877 () Bool)

(assert (=> mapIsEmpty!48877 mapRes!48877))

(declare-fun b!1248182 () Bool)

(declare-fun e!708241 () Bool)

(declare-fun tp_is_empty!31413 () Bool)

(assert (=> b!1248182 (= e!708241 tp_is_empty!31413)))

(declare-fun b!1248183 () Bool)

(declare-fun res!832762 () Bool)

(declare-fun e!708242 () Bool)

(assert (=> b!1248183 (=> (not res!832762) (not e!708242))))

(declare-datatypes ((array!80518 0))(
  ( (array!80519 (arr!38827 (Array (_ BitVec 32) (_ BitVec 64))) (size!39363 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80518)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80518 (_ BitVec 32)) Bool)

(assert (=> b!1248183 (= res!832762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48877 () Bool)

(declare-fun tp!93019 () Bool)

(assert (=> mapNonEmpty!48877 (= mapRes!48877 (and tp!93019 e!708241))))

(declare-datatypes ((V!47249 0))(
  ( (V!47250 (val!15769 Int)) )
))
(declare-datatypes ((ValueCell!14943 0))(
  ( (ValueCellFull!14943 (v!18465 V!47249)) (EmptyCell!14943) )
))
(declare-fun mapRest!48877 () (Array (_ BitVec 32) ValueCell!14943))

(declare-fun mapKey!48877 () (_ BitVec 32))

(declare-datatypes ((array!80520 0))(
  ( (array!80521 (arr!38828 (Array (_ BitVec 32) ValueCell!14943)) (size!39364 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80520)

(declare-fun mapValue!48877 () ValueCell!14943)

(assert (=> mapNonEmpty!48877 (= (arr!38828 _values!914) (store mapRest!48877 mapKey!48877 mapValue!48877))))

(declare-fun b!1248184 () Bool)

(assert (=> b!1248184 (= e!708242 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47249)

(declare-datatypes ((tuple2!20312 0))(
  ( (tuple2!20313 (_1!10167 (_ BitVec 64)) (_2!10167 V!47249)) )
))
(declare-datatypes ((List!27559 0))(
  ( (Nil!27556) (Cons!27555 (h!28764 tuple2!20312) (t!41028 List!27559)) )
))
(declare-datatypes ((ListLongMap!18185 0))(
  ( (ListLongMap!18186 (toList!9108 List!27559)) )
))
(declare-fun lt!563371 () ListLongMap!18185)

(declare-fun minValueBefore!43 () V!47249)

(declare-fun getCurrentListMapNoExtraKeys!5515 (array!80518 array!80520 (_ BitVec 32) (_ BitVec 32) V!47249 V!47249 (_ BitVec 32) Int) ListLongMap!18185)

(assert (=> b!1248184 (= lt!563371 (getCurrentListMapNoExtraKeys!5515 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!832761 () Bool)

(assert (=> start!104694 (=> (not res!832761) (not e!708242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104694 (= res!832761 (validMask!0 mask!1466))))

(assert (=> start!104694 e!708242))

(assert (=> start!104694 true))

(assert (=> start!104694 tp!93020))

(assert (=> start!104694 tp_is_empty!31413))

(declare-fun array_inv!29637 (array!80518) Bool)

(assert (=> start!104694 (array_inv!29637 _keys!1118)))

(declare-fun e!708240 () Bool)

(declare-fun array_inv!29638 (array!80520) Bool)

(assert (=> start!104694 (and (array_inv!29638 _values!914) e!708240)))

(declare-fun b!1248185 () Bool)

(declare-fun res!832764 () Bool)

(assert (=> b!1248185 (=> (not res!832764) (not e!708242))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248185 (= res!832764 (and (= (size!39364 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39363 _keys!1118) (size!39364 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248186 () Bool)

(declare-fun res!832763 () Bool)

(assert (=> b!1248186 (=> (not res!832763) (not e!708242))))

(declare-datatypes ((List!27560 0))(
  ( (Nil!27557) (Cons!27556 (h!28765 (_ BitVec 64)) (t!41029 List!27560)) )
))
(declare-fun arrayNoDuplicates!0 (array!80518 (_ BitVec 32) List!27560) Bool)

(assert (=> b!1248186 (= res!832763 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27557))))

(declare-fun b!1248187 () Bool)

(declare-fun e!708244 () Bool)

(assert (=> b!1248187 (= e!708244 tp_is_empty!31413)))

(declare-fun b!1248188 () Bool)

(assert (=> b!1248188 (= e!708240 (and e!708244 mapRes!48877))))

(declare-fun condMapEmpty!48877 () Bool)

(declare-fun mapDefault!48877 () ValueCell!14943)

(assert (=> b!1248188 (= condMapEmpty!48877 (= (arr!38828 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14943)) mapDefault!48877)))))

(assert (= (and start!104694 res!832761) b!1248185))

(assert (= (and b!1248185 res!832764) b!1248183))

(assert (= (and b!1248183 res!832762) b!1248186))

(assert (= (and b!1248186 res!832763) b!1248184))

(assert (= (and b!1248188 condMapEmpty!48877) mapIsEmpty!48877))

(assert (= (and b!1248188 (not condMapEmpty!48877)) mapNonEmpty!48877))

(get-info :version)

(assert (= (and mapNonEmpty!48877 ((_ is ValueCellFull!14943) mapValue!48877)) b!1248182))

(assert (= (and b!1248188 ((_ is ValueCellFull!14943) mapDefault!48877)) b!1248187))

(assert (= start!104694 b!1248188))

(declare-fun m!1149431 () Bool)

(assert (=> mapNonEmpty!48877 m!1149431))

(declare-fun m!1149433 () Bool)

(assert (=> b!1248184 m!1149433))

(declare-fun m!1149435 () Bool)

(assert (=> b!1248186 m!1149435))

(declare-fun m!1149437 () Bool)

(assert (=> b!1248183 m!1149437))

(declare-fun m!1149439 () Bool)

(assert (=> start!104694 m!1149439))

(declare-fun m!1149441 () Bool)

(assert (=> start!104694 m!1149441))

(declare-fun m!1149443 () Bool)

(assert (=> start!104694 m!1149443))

(check-sat (not b!1248184) tp_is_empty!31413 (not mapNonEmpty!48877) b_and!44275 (not b_next!26511) (not b!1248183) (not start!104694) (not b!1248186))
(check-sat b_and!44275 (not b_next!26511))
