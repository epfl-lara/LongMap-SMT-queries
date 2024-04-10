; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104612 () Bool)

(assert start!104612)

(declare-fun b!1247449 () Bool)

(declare-fun e!707673 () Bool)

(assert (=> b!1247449 (= e!707673 false)))

(declare-fun lt!563263 () Bool)

(declare-datatypes ((array!80378 0))(
  ( (array!80379 (arr!38758 (Array (_ BitVec 32) (_ BitVec 64))) (size!39294 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80378)

(declare-datatypes ((List!27527 0))(
  ( (Nil!27524) (Cons!27523 (h!28732 (_ BitVec 64)) (t!40996 List!27527)) )
))
(declare-fun arrayNoDuplicates!0 (array!80378 (_ BitVec 32) List!27527) Bool)

(assert (=> b!1247449 (= lt!563263 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27524))))

(declare-fun b!1247450 () Bool)

(declare-fun res!832372 () Bool)

(assert (=> b!1247450 (=> (not res!832372) (not e!707673))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47153 0))(
  ( (V!47154 (val!15733 Int)) )
))
(declare-datatypes ((ValueCell!14907 0))(
  ( (ValueCellFull!14907 (v!18429 V!47153)) (EmptyCell!14907) )
))
(declare-datatypes ((array!80380 0))(
  ( (array!80381 (arr!38759 (Array (_ BitVec 32) ValueCell!14907)) (size!39295 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80380)

(assert (=> b!1247450 (= res!832372 (and (= (size!39295 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39294 _keys!1118) (size!39295 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48766 () Bool)

(declare-fun mapRes!48766 () Bool)

(declare-fun tp!92867 () Bool)

(declare-fun e!707674 () Bool)

(assert (=> mapNonEmpty!48766 (= mapRes!48766 (and tp!92867 e!707674))))

(declare-fun mapRest!48766 () (Array (_ BitVec 32) ValueCell!14907))

(declare-fun mapValue!48766 () ValueCell!14907)

(declare-fun mapKey!48766 () (_ BitVec 32))

(assert (=> mapNonEmpty!48766 (= (arr!38759 _values!914) (store mapRest!48766 mapKey!48766 mapValue!48766))))

(declare-fun res!832373 () Bool)

(assert (=> start!104612 (=> (not res!832373) (not e!707673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104612 (= res!832373 (validMask!0 mask!1466))))

(assert (=> start!104612 e!707673))

(assert (=> start!104612 true))

(declare-fun array_inv!29595 (array!80378) Bool)

(assert (=> start!104612 (array_inv!29595 _keys!1118)))

(declare-fun e!707676 () Bool)

(declare-fun array_inv!29596 (array!80380) Bool)

(assert (=> start!104612 (and (array_inv!29596 _values!914) e!707676)))

(declare-fun b!1247451 () Bool)

(declare-fun tp_is_empty!31341 () Bool)

(assert (=> b!1247451 (= e!707674 tp_is_empty!31341)))

(declare-fun b!1247452 () Bool)

(declare-fun e!707677 () Bool)

(assert (=> b!1247452 (= e!707676 (and e!707677 mapRes!48766))))

(declare-fun condMapEmpty!48766 () Bool)

(declare-fun mapDefault!48766 () ValueCell!14907)

(assert (=> b!1247452 (= condMapEmpty!48766 (= (arr!38759 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14907)) mapDefault!48766)))))

(declare-fun b!1247453 () Bool)

(assert (=> b!1247453 (= e!707677 tp_is_empty!31341)))

(declare-fun b!1247454 () Bool)

(declare-fun res!832374 () Bool)

(assert (=> b!1247454 (=> (not res!832374) (not e!707673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80378 (_ BitVec 32)) Bool)

(assert (=> b!1247454 (= res!832374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48766 () Bool)

(assert (=> mapIsEmpty!48766 mapRes!48766))

(assert (= (and start!104612 res!832373) b!1247450))

(assert (= (and b!1247450 res!832372) b!1247454))

(assert (= (and b!1247454 res!832374) b!1247449))

(assert (= (and b!1247452 condMapEmpty!48766) mapIsEmpty!48766))

(assert (= (and b!1247452 (not condMapEmpty!48766)) mapNonEmpty!48766))

(get-info :version)

(assert (= (and mapNonEmpty!48766 ((_ is ValueCellFull!14907) mapValue!48766)) b!1247451))

(assert (= (and b!1247452 ((_ is ValueCellFull!14907) mapDefault!48766)) b!1247453))

(assert (= start!104612 b!1247452))

(declare-fun m!1148955 () Bool)

(assert (=> b!1247449 m!1148955))

(declare-fun m!1148957 () Bool)

(assert (=> mapNonEmpty!48766 m!1148957))

(declare-fun m!1148959 () Bool)

(assert (=> start!104612 m!1148959))

(declare-fun m!1148961 () Bool)

(assert (=> start!104612 m!1148961))

(declare-fun m!1148963 () Bool)

(assert (=> start!104612 m!1148963))

(declare-fun m!1148965 () Bool)

(assert (=> b!1247454 m!1148965))

(check-sat (not start!104612) (not b!1247449) (not b!1247454) tp_is_empty!31341 (not mapNonEmpty!48766))
(check-sat)
