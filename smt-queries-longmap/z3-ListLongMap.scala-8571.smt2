; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104636 () Bool)

(assert start!104636)

(declare-fun b!1247665 () Bool)

(declare-fun res!832482 () Bool)

(declare-fun e!707853 () Bool)

(assert (=> b!1247665 (=> (not res!832482) (not e!707853))))

(declare-datatypes ((array!80424 0))(
  ( (array!80425 (arr!38781 (Array (_ BitVec 32) (_ BitVec 64))) (size!39317 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80424)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80424 (_ BitVec 32)) Bool)

(assert (=> b!1247665 (= res!832482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!832480 () Bool)

(assert (=> start!104636 (=> (not res!832480) (not e!707853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104636 (= res!832480 (validMask!0 mask!1466))))

(assert (=> start!104636 e!707853))

(assert (=> start!104636 true))

(declare-fun array_inv!29609 (array!80424) Bool)

(assert (=> start!104636 (array_inv!29609 _keys!1118)))

(declare-datatypes ((V!47185 0))(
  ( (V!47186 (val!15745 Int)) )
))
(declare-datatypes ((ValueCell!14919 0))(
  ( (ValueCellFull!14919 (v!18441 V!47185)) (EmptyCell!14919) )
))
(declare-datatypes ((array!80426 0))(
  ( (array!80427 (arr!38782 (Array (_ BitVec 32) ValueCell!14919)) (size!39318 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80426)

(declare-fun e!707856 () Bool)

(declare-fun array_inv!29610 (array!80426) Bool)

(assert (=> start!104636 (and (array_inv!29610 _values!914) e!707856)))

(declare-fun b!1247666 () Bool)

(declare-fun e!707855 () Bool)

(declare-fun tp_is_empty!31365 () Bool)

(assert (=> b!1247666 (= e!707855 tp_is_empty!31365)))

(declare-fun mapIsEmpty!48802 () Bool)

(declare-fun mapRes!48802 () Bool)

(assert (=> mapIsEmpty!48802 mapRes!48802))

(declare-fun b!1247667 () Bool)

(declare-fun res!832481 () Bool)

(assert (=> b!1247667 (=> (not res!832481) (not e!707853))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247667 (= res!832481 (and (= (size!39318 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39317 _keys!1118) (size!39318 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247668 () Bool)

(assert (=> b!1247668 (= e!707853 false)))

(declare-fun lt!563299 () Bool)

(declare-datatypes ((List!27534 0))(
  ( (Nil!27531) (Cons!27530 (h!28739 (_ BitVec 64)) (t!41003 List!27534)) )
))
(declare-fun arrayNoDuplicates!0 (array!80424 (_ BitVec 32) List!27534) Bool)

(assert (=> b!1247668 (= lt!563299 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27531))))

(declare-fun b!1247669 () Bool)

(assert (=> b!1247669 (= e!707856 (and e!707855 mapRes!48802))))

(declare-fun condMapEmpty!48802 () Bool)

(declare-fun mapDefault!48802 () ValueCell!14919)

(assert (=> b!1247669 (= condMapEmpty!48802 (= (arr!38782 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14919)) mapDefault!48802)))))

(declare-fun mapNonEmpty!48802 () Bool)

(declare-fun tp!92903 () Bool)

(declare-fun e!707857 () Bool)

(assert (=> mapNonEmpty!48802 (= mapRes!48802 (and tp!92903 e!707857))))

(declare-fun mapRest!48802 () (Array (_ BitVec 32) ValueCell!14919))

(declare-fun mapValue!48802 () ValueCell!14919)

(declare-fun mapKey!48802 () (_ BitVec 32))

(assert (=> mapNonEmpty!48802 (= (arr!38782 _values!914) (store mapRest!48802 mapKey!48802 mapValue!48802))))

(declare-fun b!1247670 () Bool)

(assert (=> b!1247670 (= e!707857 tp_is_empty!31365)))

(assert (= (and start!104636 res!832480) b!1247667))

(assert (= (and b!1247667 res!832481) b!1247665))

(assert (= (and b!1247665 res!832482) b!1247668))

(assert (= (and b!1247669 condMapEmpty!48802) mapIsEmpty!48802))

(assert (= (and b!1247669 (not condMapEmpty!48802)) mapNonEmpty!48802))

(get-info :version)

(assert (= (and mapNonEmpty!48802 ((_ is ValueCellFull!14919) mapValue!48802)) b!1247670))

(assert (= (and b!1247669 ((_ is ValueCellFull!14919) mapDefault!48802)) b!1247666))

(assert (= start!104636 b!1247669))

(declare-fun m!1149099 () Bool)

(assert (=> b!1247665 m!1149099))

(declare-fun m!1149101 () Bool)

(assert (=> start!104636 m!1149101))

(declare-fun m!1149103 () Bool)

(assert (=> start!104636 m!1149103))

(declare-fun m!1149105 () Bool)

(assert (=> start!104636 m!1149105))

(declare-fun m!1149107 () Bool)

(assert (=> b!1247668 m!1149107))

(declare-fun m!1149109 () Bool)

(assert (=> mapNonEmpty!48802 m!1149109))

(check-sat (not start!104636) (not mapNonEmpty!48802) tp_is_empty!31365 (not b!1247668) (not b!1247665))
(check-sat)
