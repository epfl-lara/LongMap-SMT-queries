; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104828 () Bool)

(assert start!104828)

(declare-fun mapNonEmpty!48754 () Bool)

(declare-fun mapRes!48754 () Bool)

(declare-fun tp!92855 () Bool)

(declare-fun e!708460 () Bool)

(assert (=> mapNonEmpty!48754 (= mapRes!48754 (and tp!92855 e!708460))))

(declare-datatypes ((V!47143 0))(
  ( (V!47144 (val!15729 Int)) )
))
(declare-datatypes ((ValueCell!14903 0))(
  ( (ValueCellFull!14903 (v!18421 V!47143)) (EmptyCell!14903) )
))
(declare-fun mapValue!48754 () ValueCell!14903)

(declare-datatypes ((array!80393 0))(
  ( (array!80394 (arr!38761 (Array (_ BitVec 32) ValueCell!14903)) (size!39298 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80393)

(declare-fun mapKey!48754 () (_ BitVec 32))

(declare-fun mapRest!48754 () (Array (_ BitVec 32) ValueCell!14903))

(assert (=> mapNonEmpty!48754 (= (arr!38761 _values!914) (store mapRest!48754 mapKey!48754 mapValue!48754))))

(declare-fun res!832858 () Bool)

(declare-fun e!708463 () Bool)

(assert (=> start!104828 (=> (not res!832858) (not e!708463))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104828 (= res!832858 (validMask!0 mask!1466))))

(assert (=> start!104828 e!708463))

(assert (=> start!104828 true))

(declare-datatypes ((array!80395 0))(
  ( (array!80396 (arr!38762 (Array (_ BitVec 32) (_ BitVec 64))) (size!39299 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80395)

(declare-fun array_inv!29687 (array!80395) Bool)

(assert (=> start!104828 (array_inv!29687 _keys!1118)))

(declare-fun e!708461 () Bool)

(declare-fun array_inv!29688 (array!80393) Bool)

(assert (=> start!104828 (and (array_inv!29688 _values!914) e!708461)))

(declare-fun b!1248682 () Bool)

(declare-fun tp_is_empty!31333 () Bool)

(assert (=> b!1248682 (= e!708460 tp_is_empty!31333)))

(declare-fun b!1248683 () Bool)

(declare-fun res!832857 () Bool)

(assert (=> b!1248683 (=> (not res!832857) (not e!708463))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248683 (= res!832857 (and (= (size!39298 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39299 _keys!1118) (size!39298 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248684 () Bool)

(declare-fun res!832856 () Bool)

(assert (=> b!1248684 (=> (not res!832856) (not e!708463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80395 (_ BitVec 32)) Bool)

(assert (=> b!1248684 (= res!832856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248685 () Bool)

(declare-fun e!708462 () Bool)

(assert (=> b!1248685 (= e!708462 tp_is_empty!31333)))

(declare-fun b!1248686 () Bool)

(assert (=> b!1248686 (= e!708463 false)))

(declare-fun lt!563735 () Bool)

(declare-datatypes ((List!27550 0))(
  ( (Nil!27547) (Cons!27546 (h!28764 (_ BitVec 64)) (t!41011 List!27550)) )
))
(declare-fun arrayNoDuplicates!0 (array!80395 (_ BitVec 32) List!27550) Bool)

(assert (=> b!1248686 (= lt!563735 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27547))))

(declare-fun mapIsEmpty!48754 () Bool)

(assert (=> mapIsEmpty!48754 mapRes!48754))

(declare-fun b!1248687 () Bool)

(assert (=> b!1248687 (= e!708461 (and e!708462 mapRes!48754))))

(declare-fun condMapEmpty!48754 () Bool)

(declare-fun mapDefault!48754 () ValueCell!14903)

(assert (=> b!1248687 (= condMapEmpty!48754 (= (arr!38761 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14903)) mapDefault!48754)))))

(assert (= (and start!104828 res!832858) b!1248683))

(assert (= (and b!1248683 res!832857) b!1248684))

(assert (= (and b!1248684 res!832856) b!1248686))

(assert (= (and b!1248687 condMapEmpty!48754) mapIsEmpty!48754))

(assert (= (and b!1248687 (not condMapEmpty!48754)) mapNonEmpty!48754))

(get-info :version)

(assert (= (and mapNonEmpty!48754 ((_ is ValueCellFull!14903) mapValue!48754)) b!1248682))

(assert (= (and b!1248687 ((_ is ValueCellFull!14903) mapDefault!48754)) b!1248685))

(assert (= start!104828 b!1248687))

(declare-fun m!1150519 () Bool)

(assert (=> mapNonEmpty!48754 m!1150519))

(declare-fun m!1150521 () Bool)

(assert (=> start!104828 m!1150521))

(declare-fun m!1150523 () Bool)

(assert (=> start!104828 m!1150523))

(declare-fun m!1150525 () Bool)

(assert (=> start!104828 m!1150525))

(declare-fun m!1150527 () Bool)

(assert (=> b!1248684 m!1150527))

(declare-fun m!1150529 () Bool)

(assert (=> b!1248686 m!1150529))

(check-sat (not b!1248686) (not b!1248684) tp_is_empty!31333 (not mapNonEmpty!48754) (not start!104828))
(check-sat)
