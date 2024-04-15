; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104630 () Bool)

(assert start!104630)

(declare-fun mapIsEmpty!48799 () Bool)

(declare-fun mapRes!48799 () Bool)

(assert (=> mapIsEmpty!48799 mapRes!48799))

(declare-fun b!1247565 () Bool)

(declare-fun e!707797 () Bool)

(declare-fun e!707796 () Bool)

(assert (=> b!1247565 (= e!707797 (and e!707796 mapRes!48799))))

(declare-fun condMapEmpty!48799 () Bool)

(declare-datatypes ((V!47183 0))(
  ( (V!47184 (val!15744 Int)) )
))
(declare-datatypes ((ValueCell!14918 0))(
  ( (ValueCellFull!14918 (v!18439 V!47183)) (EmptyCell!14918) )
))
(declare-datatypes ((array!80339 0))(
  ( (array!80340 (arr!38739 (Array (_ BitVec 32) ValueCell!14918)) (size!39277 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80339)

(declare-fun mapDefault!48799 () ValueCell!14918)

(assert (=> b!1247565 (= condMapEmpty!48799 (= (arr!38739 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14918)) mapDefault!48799)))))

(declare-fun b!1247566 () Bool)

(declare-fun res!832431 () Bool)

(declare-fun e!707795 () Bool)

(assert (=> b!1247566 (=> (not res!832431) (not e!707795))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80341 0))(
  ( (array!80342 (arr!38740 (Array (_ BitVec 32) (_ BitVec 64))) (size!39278 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80341)

(assert (=> b!1247566 (= res!832431 (and (= (size!39277 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39278 _keys!1118) (size!39277 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247567 () Bool)

(declare-fun e!707793 () Bool)

(declare-fun tp_is_empty!31363 () Bool)

(assert (=> b!1247567 (= e!707793 tp_is_empty!31363)))

(declare-fun b!1247568 () Bool)

(declare-fun res!832433 () Bool)

(assert (=> b!1247568 (=> (not res!832433) (not e!707795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80341 (_ BitVec 32)) Bool)

(assert (=> b!1247568 (= res!832433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247569 () Bool)

(assert (=> b!1247569 (= e!707796 tp_is_empty!31363)))

(declare-fun mapNonEmpty!48799 () Bool)

(declare-fun tp!92900 () Bool)

(assert (=> mapNonEmpty!48799 (= mapRes!48799 (and tp!92900 e!707793))))

(declare-fun mapKey!48799 () (_ BitVec 32))

(declare-fun mapRest!48799 () (Array (_ BitVec 32) ValueCell!14918))

(declare-fun mapValue!48799 () ValueCell!14918)

(assert (=> mapNonEmpty!48799 (= (arr!38739 _values!914) (store mapRest!48799 mapKey!48799 mapValue!48799))))

(declare-fun res!832432 () Bool)

(assert (=> start!104630 (=> (not res!832432) (not e!707795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104630 (= res!832432 (validMask!0 mask!1466))))

(assert (=> start!104630 e!707795))

(assert (=> start!104630 true))

(declare-fun array_inv!29703 (array!80341) Bool)

(assert (=> start!104630 (array_inv!29703 _keys!1118)))

(declare-fun array_inv!29704 (array!80339) Bool)

(assert (=> start!104630 (and (array_inv!29704 _values!914) e!707797)))

(declare-fun b!1247570 () Bool)

(assert (=> b!1247570 (= e!707795 false)))

(declare-fun lt!563117 () Bool)

(declare-datatypes ((List!27599 0))(
  ( (Nil!27596) (Cons!27595 (h!28804 (_ BitVec 64)) (t!41059 List!27599)) )
))
(declare-fun arrayNoDuplicates!0 (array!80341 (_ BitVec 32) List!27599) Bool)

(assert (=> b!1247570 (= lt!563117 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27596))))

(assert (= (and start!104630 res!832432) b!1247566))

(assert (= (and b!1247566 res!832431) b!1247568))

(assert (= (and b!1247568 res!832433) b!1247570))

(assert (= (and b!1247565 condMapEmpty!48799) mapIsEmpty!48799))

(assert (= (and b!1247565 (not condMapEmpty!48799)) mapNonEmpty!48799))

(get-info :version)

(assert (= (and mapNonEmpty!48799 ((_ is ValueCellFull!14918) mapValue!48799)) b!1247567))

(assert (= (and b!1247565 ((_ is ValueCellFull!14918) mapDefault!48799)) b!1247569))

(assert (= start!104630 b!1247565))

(declare-fun m!1148567 () Bool)

(assert (=> b!1247568 m!1148567))

(declare-fun m!1148569 () Bool)

(assert (=> mapNonEmpty!48799 m!1148569))

(declare-fun m!1148571 () Bool)

(assert (=> start!104630 m!1148571))

(declare-fun m!1148573 () Bool)

(assert (=> start!104630 m!1148573))

(declare-fun m!1148575 () Bool)

(assert (=> start!104630 m!1148575))

(declare-fun m!1148577 () Bool)

(assert (=> b!1247570 m!1148577))

(check-sat tp_is_empty!31363 (not b!1247570) (not start!104630) (not mapNonEmpty!48799) (not b!1247568))
(check-sat)
