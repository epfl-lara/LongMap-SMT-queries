; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104606 () Bool)

(assert start!104606)

(declare-fun b!1247395 () Bool)

(declare-fun e!707631 () Bool)

(assert (=> b!1247395 (= e!707631 false)))

(declare-fun lt!563254 () Bool)

(declare-datatypes ((array!80366 0))(
  ( (array!80367 (arr!38752 (Array (_ BitVec 32) (_ BitVec 64))) (size!39288 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80366)

(declare-datatypes ((List!27525 0))(
  ( (Nil!27522) (Cons!27521 (h!28730 (_ BitVec 64)) (t!40994 List!27525)) )
))
(declare-fun arrayNoDuplicates!0 (array!80366 (_ BitVec 32) List!27525) Bool)

(assert (=> b!1247395 (= lt!563254 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27522))))

(declare-fun b!1247396 () Bool)

(declare-fun e!707628 () Bool)

(declare-fun tp_is_empty!31335 () Bool)

(assert (=> b!1247396 (= e!707628 tp_is_empty!31335)))

(declare-fun res!832347 () Bool)

(assert (=> start!104606 (=> (not res!832347) (not e!707631))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104606 (= res!832347 (validMask!0 mask!1466))))

(assert (=> start!104606 e!707631))

(assert (=> start!104606 true))

(declare-fun array_inv!29591 (array!80366) Bool)

(assert (=> start!104606 (array_inv!29591 _keys!1118)))

(declare-datatypes ((V!47145 0))(
  ( (V!47146 (val!15730 Int)) )
))
(declare-datatypes ((ValueCell!14904 0))(
  ( (ValueCellFull!14904 (v!18426 V!47145)) (EmptyCell!14904) )
))
(declare-datatypes ((array!80368 0))(
  ( (array!80369 (arr!38753 (Array (_ BitVec 32) ValueCell!14904)) (size!39289 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80368)

(declare-fun e!707630 () Bool)

(declare-fun array_inv!29592 (array!80368) Bool)

(assert (=> start!104606 (and (array_inv!29592 _values!914) e!707630)))

(declare-fun mapIsEmpty!48757 () Bool)

(declare-fun mapRes!48757 () Bool)

(assert (=> mapIsEmpty!48757 mapRes!48757))

(declare-fun b!1247397 () Bool)

(declare-fun e!707632 () Bool)

(assert (=> b!1247397 (= e!707632 tp_is_empty!31335)))

(declare-fun mapNonEmpty!48757 () Bool)

(declare-fun tp!92858 () Bool)

(assert (=> mapNonEmpty!48757 (= mapRes!48757 (and tp!92858 e!707628))))

(declare-fun mapRest!48757 () (Array (_ BitVec 32) ValueCell!14904))

(declare-fun mapKey!48757 () (_ BitVec 32))

(declare-fun mapValue!48757 () ValueCell!14904)

(assert (=> mapNonEmpty!48757 (= (arr!38753 _values!914) (store mapRest!48757 mapKey!48757 mapValue!48757))))

(declare-fun b!1247398 () Bool)

(assert (=> b!1247398 (= e!707630 (and e!707632 mapRes!48757))))

(declare-fun condMapEmpty!48757 () Bool)

(declare-fun mapDefault!48757 () ValueCell!14904)

(assert (=> b!1247398 (= condMapEmpty!48757 (= (arr!38753 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14904)) mapDefault!48757)))))

(declare-fun b!1247399 () Bool)

(declare-fun res!832345 () Bool)

(assert (=> b!1247399 (=> (not res!832345) (not e!707631))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247399 (= res!832345 (and (= (size!39289 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39288 _keys!1118) (size!39289 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247400 () Bool)

(declare-fun res!832346 () Bool)

(assert (=> b!1247400 (=> (not res!832346) (not e!707631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80366 (_ BitVec 32)) Bool)

(assert (=> b!1247400 (= res!832346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104606 res!832347) b!1247399))

(assert (= (and b!1247399 res!832345) b!1247400))

(assert (= (and b!1247400 res!832346) b!1247395))

(assert (= (and b!1247398 condMapEmpty!48757) mapIsEmpty!48757))

(assert (= (and b!1247398 (not condMapEmpty!48757)) mapNonEmpty!48757))

(get-info :version)

(assert (= (and mapNonEmpty!48757 ((_ is ValueCellFull!14904) mapValue!48757)) b!1247396))

(assert (= (and b!1247398 ((_ is ValueCellFull!14904) mapDefault!48757)) b!1247397))

(assert (= start!104606 b!1247398))

(declare-fun m!1148919 () Bool)

(assert (=> b!1247395 m!1148919))

(declare-fun m!1148921 () Bool)

(assert (=> start!104606 m!1148921))

(declare-fun m!1148923 () Bool)

(assert (=> start!104606 m!1148923))

(declare-fun m!1148925 () Bool)

(assert (=> start!104606 m!1148925))

(declare-fun m!1148927 () Bool)

(assert (=> mapNonEmpty!48757 m!1148927))

(declare-fun m!1148929 () Bool)

(assert (=> b!1247400 m!1148929))

(check-sat (not b!1247400) tp_is_empty!31335 (not mapNonEmpty!48757) (not start!104606) (not b!1247395))
(check-sat)
