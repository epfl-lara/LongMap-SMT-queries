; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104846 () Bool)

(assert start!104846)

(declare-fun b!1248844 () Bool)

(declare-fun res!832938 () Bool)

(declare-fun e!708598 () Bool)

(assert (=> b!1248844 (=> (not res!832938) (not e!708598))))

(declare-datatypes ((array!80427 0))(
  ( (array!80428 (arr!38778 (Array (_ BitVec 32) (_ BitVec 64))) (size!39315 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80427)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80427 (_ BitVec 32)) Bool)

(assert (=> b!1248844 (= res!832938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248845 () Bool)

(assert (=> b!1248845 (= e!708598 false)))

(declare-fun lt!563762 () Bool)

(declare-datatypes ((List!27555 0))(
  ( (Nil!27552) (Cons!27551 (h!28769 (_ BitVec 64)) (t!41016 List!27555)) )
))
(declare-fun arrayNoDuplicates!0 (array!80427 (_ BitVec 32) List!27555) Bool)

(assert (=> b!1248845 (= lt!563762 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27552))))

(declare-fun res!832937 () Bool)

(assert (=> start!104846 (=> (not res!832937) (not e!708598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104846 (= res!832937 (validMask!0 mask!1466))))

(assert (=> start!104846 e!708598))

(assert (=> start!104846 true))

(declare-fun array_inv!29701 (array!80427) Bool)

(assert (=> start!104846 (array_inv!29701 _keys!1118)))

(declare-datatypes ((V!47167 0))(
  ( (V!47168 (val!15738 Int)) )
))
(declare-datatypes ((ValueCell!14912 0))(
  ( (ValueCellFull!14912 (v!18430 V!47167)) (EmptyCell!14912) )
))
(declare-datatypes ((array!80429 0))(
  ( (array!80430 (arr!38779 (Array (_ BitVec 32) ValueCell!14912)) (size!39316 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80429)

(declare-fun e!708595 () Bool)

(declare-fun array_inv!29702 (array!80429) Bool)

(assert (=> start!104846 (and (array_inv!29702 _values!914) e!708595)))

(declare-fun b!1248846 () Bool)

(declare-fun e!708599 () Bool)

(declare-fun tp_is_empty!31351 () Bool)

(assert (=> b!1248846 (= e!708599 tp_is_empty!31351)))

(declare-fun b!1248847 () Bool)

(declare-fun mapRes!48781 () Bool)

(assert (=> b!1248847 (= e!708595 (and e!708599 mapRes!48781))))

(declare-fun condMapEmpty!48781 () Bool)

(declare-fun mapDefault!48781 () ValueCell!14912)

(assert (=> b!1248847 (= condMapEmpty!48781 (= (arr!38779 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14912)) mapDefault!48781)))))

(declare-fun mapIsEmpty!48781 () Bool)

(assert (=> mapIsEmpty!48781 mapRes!48781))

(declare-fun mapNonEmpty!48781 () Bool)

(declare-fun tp!92882 () Bool)

(declare-fun e!708596 () Bool)

(assert (=> mapNonEmpty!48781 (= mapRes!48781 (and tp!92882 e!708596))))

(declare-fun mapRest!48781 () (Array (_ BitVec 32) ValueCell!14912))

(declare-fun mapKey!48781 () (_ BitVec 32))

(declare-fun mapValue!48781 () ValueCell!14912)

(assert (=> mapNonEmpty!48781 (= (arr!38779 _values!914) (store mapRest!48781 mapKey!48781 mapValue!48781))))

(declare-fun b!1248848 () Bool)

(assert (=> b!1248848 (= e!708596 tp_is_empty!31351)))

(declare-fun b!1248849 () Bool)

(declare-fun res!832939 () Bool)

(assert (=> b!1248849 (=> (not res!832939) (not e!708598))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248849 (= res!832939 (and (= (size!39316 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39315 _keys!1118) (size!39316 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104846 res!832937) b!1248849))

(assert (= (and b!1248849 res!832939) b!1248844))

(assert (= (and b!1248844 res!832938) b!1248845))

(assert (= (and b!1248847 condMapEmpty!48781) mapIsEmpty!48781))

(assert (= (and b!1248847 (not condMapEmpty!48781)) mapNonEmpty!48781))

(get-info :version)

(assert (= (and mapNonEmpty!48781 ((_ is ValueCellFull!14912) mapValue!48781)) b!1248848))

(assert (= (and b!1248847 ((_ is ValueCellFull!14912) mapDefault!48781)) b!1248846))

(assert (= start!104846 b!1248847))

(declare-fun m!1150627 () Bool)

(assert (=> b!1248844 m!1150627))

(declare-fun m!1150629 () Bool)

(assert (=> b!1248845 m!1150629))

(declare-fun m!1150631 () Bool)

(assert (=> start!104846 m!1150631))

(declare-fun m!1150633 () Bool)

(assert (=> start!104846 m!1150633))

(declare-fun m!1150635 () Bool)

(assert (=> start!104846 m!1150635))

(declare-fun m!1150637 () Bool)

(assert (=> mapNonEmpty!48781 m!1150637))

(check-sat (not start!104846) (not b!1248845) (not mapNonEmpty!48781) (not b!1248844) tp_is_empty!31351)
(check-sat)
