; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104864 () Bool)

(assert start!104864)

(declare-fun b!1249006 () Bool)

(declare-fun e!708730 () Bool)

(declare-fun tp_is_empty!31369 () Bool)

(assert (=> b!1249006 (= e!708730 tp_is_empty!31369)))

(declare-fun mapNonEmpty!48808 () Bool)

(declare-fun mapRes!48808 () Bool)

(declare-fun tp!92909 () Bool)

(declare-fun e!708732 () Bool)

(assert (=> mapNonEmpty!48808 (= mapRes!48808 (and tp!92909 e!708732))))

(declare-datatypes ((V!47191 0))(
  ( (V!47192 (val!15747 Int)) )
))
(declare-datatypes ((ValueCell!14921 0))(
  ( (ValueCellFull!14921 (v!18439 V!47191)) (EmptyCell!14921) )
))
(declare-fun mapValue!48808 () ValueCell!14921)

(declare-fun mapKey!48808 () (_ BitVec 32))

(declare-datatypes ((array!80461 0))(
  ( (array!80462 (arr!38795 (Array (_ BitVec 32) ValueCell!14921)) (size!39332 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80461)

(declare-fun mapRest!48808 () (Array (_ BitVec 32) ValueCell!14921))

(assert (=> mapNonEmpty!48808 (= (arr!38795 _values!914) (store mapRest!48808 mapKey!48808 mapValue!48808))))

(declare-fun res!833019 () Bool)

(declare-fun e!708731 () Bool)

(assert (=> start!104864 (=> (not res!833019) (not e!708731))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104864 (= res!833019 (validMask!0 mask!1466))))

(assert (=> start!104864 e!708731))

(assert (=> start!104864 true))

(declare-datatypes ((array!80463 0))(
  ( (array!80464 (arr!38796 (Array (_ BitVec 32) (_ BitVec 64))) (size!39333 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80463)

(declare-fun array_inv!29715 (array!80463) Bool)

(assert (=> start!104864 (array_inv!29715 _keys!1118)))

(declare-fun e!708733 () Bool)

(declare-fun array_inv!29716 (array!80461) Bool)

(assert (=> start!104864 (and (array_inv!29716 _values!914) e!708733)))

(declare-fun b!1249007 () Bool)

(declare-fun res!833020 () Bool)

(assert (=> b!1249007 (=> (not res!833020) (not e!708731))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249007 (= res!833020 (and (= (size!39332 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39333 _keys!1118) (size!39332 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249008 () Bool)

(declare-fun res!833018 () Bool)

(assert (=> b!1249008 (=> (not res!833018) (not e!708731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80463 (_ BitVec 32)) Bool)

(assert (=> b!1249008 (= res!833018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249009 () Bool)

(assert (=> b!1249009 (= e!708732 tp_is_empty!31369)))

(declare-fun b!1249010 () Bool)

(assert (=> b!1249010 (= e!708733 (and e!708730 mapRes!48808))))

(declare-fun condMapEmpty!48808 () Bool)

(declare-fun mapDefault!48808 () ValueCell!14921)

(assert (=> b!1249010 (= condMapEmpty!48808 (= (arr!38795 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14921)) mapDefault!48808)))))

(declare-fun mapIsEmpty!48808 () Bool)

(assert (=> mapIsEmpty!48808 mapRes!48808))

(declare-fun b!1249011 () Bool)

(assert (=> b!1249011 (= e!708731 false)))

(declare-fun lt!563789 () Bool)

(declare-datatypes ((List!27560 0))(
  ( (Nil!27557) (Cons!27556 (h!28774 (_ BitVec 64)) (t!41021 List!27560)) )
))
(declare-fun arrayNoDuplicates!0 (array!80463 (_ BitVec 32) List!27560) Bool)

(assert (=> b!1249011 (= lt!563789 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27557))))

(assert (= (and start!104864 res!833019) b!1249007))

(assert (= (and b!1249007 res!833020) b!1249008))

(assert (= (and b!1249008 res!833018) b!1249011))

(assert (= (and b!1249010 condMapEmpty!48808) mapIsEmpty!48808))

(assert (= (and b!1249010 (not condMapEmpty!48808)) mapNonEmpty!48808))

(get-info :version)

(assert (= (and mapNonEmpty!48808 ((_ is ValueCellFull!14921) mapValue!48808)) b!1249009))

(assert (= (and b!1249010 ((_ is ValueCellFull!14921) mapDefault!48808)) b!1249006))

(assert (= start!104864 b!1249010))

(declare-fun m!1150735 () Bool)

(assert (=> mapNonEmpty!48808 m!1150735))

(declare-fun m!1150737 () Bool)

(assert (=> start!104864 m!1150737))

(declare-fun m!1150739 () Bool)

(assert (=> start!104864 m!1150739))

(declare-fun m!1150741 () Bool)

(assert (=> start!104864 m!1150741))

(declare-fun m!1150743 () Bool)

(assert (=> b!1249008 m!1150743))

(declare-fun m!1150745 () Bool)

(assert (=> b!1249011 m!1150745))

(check-sat (not b!1249008) (not mapNonEmpty!48808) tp_is_empty!31369 (not b!1249011) (not start!104864))
(check-sat)
