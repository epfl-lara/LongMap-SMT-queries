; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104840 () Bool)

(assert start!104840)

(declare-fun b!1248790 () Bool)

(declare-fun res!832912 () Bool)

(declare-fun e!708553 () Bool)

(assert (=> b!1248790 (=> (not res!832912) (not e!708553))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80415 0))(
  ( (array!80416 (arr!38772 (Array (_ BitVec 32) (_ BitVec 64))) (size!39309 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80415)

(declare-datatypes ((V!47159 0))(
  ( (V!47160 (val!15735 Int)) )
))
(declare-datatypes ((ValueCell!14909 0))(
  ( (ValueCellFull!14909 (v!18427 V!47159)) (EmptyCell!14909) )
))
(declare-datatypes ((array!80417 0))(
  ( (array!80418 (arr!38773 (Array (_ BitVec 32) ValueCell!14909)) (size!39310 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80417)

(assert (=> b!1248790 (= res!832912 (and (= (size!39310 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39309 _keys!1118) (size!39310 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248791 () Bool)

(declare-fun e!708552 () Bool)

(declare-fun e!708554 () Bool)

(declare-fun mapRes!48772 () Bool)

(assert (=> b!1248791 (= e!708552 (and e!708554 mapRes!48772))))

(declare-fun condMapEmpty!48772 () Bool)

(declare-fun mapDefault!48772 () ValueCell!14909)

(assert (=> b!1248791 (= condMapEmpty!48772 (= (arr!38773 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14909)) mapDefault!48772)))))

(declare-fun b!1248792 () Bool)

(declare-fun res!832910 () Bool)

(assert (=> b!1248792 (=> (not res!832910) (not e!708553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80415 (_ BitVec 32)) Bool)

(assert (=> b!1248792 (= res!832910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48772 () Bool)

(assert (=> mapIsEmpty!48772 mapRes!48772))

(declare-fun b!1248793 () Bool)

(assert (=> b!1248793 (= e!708553 false)))

(declare-fun lt!563753 () Bool)

(declare-datatypes ((List!27553 0))(
  ( (Nil!27550) (Cons!27549 (h!28767 (_ BitVec 64)) (t!41014 List!27553)) )
))
(declare-fun arrayNoDuplicates!0 (array!80415 (_ BitVec 32) List!27553) Bool)

(assert (=> b!1248793 (= lt!563753 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27550))))

(declare-fun res!832911 () Bool)

(assert (=> start!104840 (=> (not res!832911) (not e!708553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104840 (= res!832911 (validMask!0 mask!1466))))

(assert (=> start!104840 e!708553))

(assert (=> start!104840 true))

(declare-fun array_inv!29697 (array!80415) Bool)

(assert (=> start!104840 (array_inv!29697 _keys!1118)))

(declare-fun array_inv!29698 (array!80417) Bool)

(assert (=> start!104840 (and (array_inv!29698 _values!914) e!708552)))

(declare-fun b!1248794 () Bool)

(declare-fun tp_is_empty!31345 () Bool)

(assert (=> b!1248794 (= e!708554 tp_is_empty!31345)))

(declare-fun b!1248795 () Bool)

(declare-fun e!708551 () Bool)

(assert (=> b!1248795 (= e!708551 tp_is_empty!31345)))

(declare-fun mapNonEmpty!48772 () Bool)

(declare-fun tp!92873 () Bool)

(assert (=> mapNonEmpty!48772 (= mapRes!48772 (and tp!92873 e!708551))))

(declare-fun mapKey!48772 () (_ BitVec 32))

(declare-fun mapValue!48772 () ValueCell!14909)

(declare-fun mapRest!48772 () (Array (_ BitVec 32) ValueCell!14909))

(assert (=> mapNonEmpty!48772 (= (arr!38773 _values!914) (store mapRest!48772 mapKey!48772 mapValue!48772))))

(assert (= (and start!104840 res!832911) b!1248790))

(assert (= (and b!1248790 res!832912) b!1248792))

(assert (= (and b!1248792 res!832910) b!1248793))

(assert (= (and b!1248791 condMapEmpty!48772) mapIsEmpty!48772))

(assert (= (and b!1248791 (not condMapEmpty!48772)) mapNonEmpty!48772))

(get-info :version)

(assert (= (and mapNonEmpty!48772 ((_ is ValueCellFull!14909) mapValue!48772)) b!1248795))

(assert (= (and b!1248791 ((_ is ValueCellFull!14909) mapDefault!48772)) b!1248794))

(assert (= start!104840 b!1248791))

(declare-fun m!1150591 () Bool)

(assert (=> b!1248792 m!1150591))

(declare-fun m!1150593 () Bool)

(assert (=> b!1248793 m!1150593))

(declare-fun m!1150595 () Bool)

(assert (=> start!104840 m!1150595))

(declare-fun m!1150597 () Bool)

(assert (=> start!104840 m!1150597))

(declare-fun m!1150599 () Bool)

(assert (=> start!104840 m!1150599))

(declare-fun m!1150601 () Bool)

(assert (=> mapNonEmpty!48772 m!1150601))

(check-sat tp_is_empty!31345 (not start!104840) (not b!1248792) (not b!1248793) (not mapNonEmpty!48772))
(check-sat)
