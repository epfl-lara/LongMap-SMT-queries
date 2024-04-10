; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104642 () Bool)

(assert start!104642)

(declare-fun b!1247719 () Bool)

(declare-fun e!707899 () Bool)

(assert (=> b!1247719 (= e!707899 false)))

(declare-fun lt!563308 () Bool)

(declare-datatypes ((array!80436 0))(
  ( (array!80437 (arr!38787 (Array (_ BitVec 32) (_ BitVec 64))) (size!39323 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80436)

(declare-datatypes ((List!27536 0))(
  ( (Nil!27533) (Cons!27532 (h!28741 (_ BitVec 64)) (t!41005 List!27536)) )
))
(declare-fun arrayNoDuplicates!0 (array!80436 (_ BitVec 32) List!27536) Bool)

(assert (=> b!1247719 (= lt!563308 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27533))))

(declare-fun b!1247720 () Bool)

(declare-fun e!707901 () Bool)

(declare-fun e!707900 () Bool)

(declare-fun mapRes!48811 () Bool)

(assert (=> b!1247720 (= e!707901 (and e!707900 mapRes!48811))))

(declare-fun condMapEmpty!48811 () Bool)

(declare-datatypes ((V!47193 0))(
  ( (V!47194 (val!15748 Int)) )
))
(declare-datatypes ((ValueCell!14922 0))(
  ( (ValueCellFull!14922 (v!18444 V!47193)) (EmptyCell!14922) )
))
(declare-datatypes ((array!80438 0))(
  ( (array!80439 (arr!38788 (Array (_ BitVec 32) ValueCell!14922)) (size!39324 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80438)

(declare-fun mapDefault!48811 () ValueCell!14922)

(assert (=> b!1247720 (= condMapEmpty!48811 (= (arr!38788 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14922)) mapDefault!48811)))))

(declare-fun b!1247722 () Bool)

(declare-fun res!832507 () Bool)

(assert (=> b!1247722 (=> (not res!832507) (not e!707899))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1247722 (= res!832507 (and (= (size!39324 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39323 _keys!1118) (size!39324 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48811 () Bool)

(assert (=> mapIsEmpty!48811 mapRes!48811))

(declare-fun mapNonEmpty!48811 () Bool)

(declare-fun tp!92912 () Bool)

(declare-fun e!707902 () Bool)

(assert (=> mapNonEmpty!48811 (= mapRes!48811 (and tp!92912 e!707902))))

(declare-fun mapRest!48811 () (Array (_ BitVec 32) ValueCell!14922))

(declare-fun mapValue!48811 () ValueCell!14922)

(declare-fun mapKey!48811 () (_ BitVec 32))

(assert (=> mapNonEmpty!48811 (= (arr!38788 _values!914) (store mapRest!48811 mapKey!48811 mapValue!48811))))

(declare-fun b!1247723 () Bool)

(declare-fun tp_is_empty!31371 () Bool)

(assert (=> b!1247723 (= e!707902 tp_is_empty!31371)))

(declare-fun b!1247724 () Bool)

(declare-fun res!832509 () Bool)

(assert (=> b!1247724 (=> (not res!832509) (not e!707899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80436 (_ BitVec 32)) Bool)

(assert (=> b!1247724 (= res!832509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247721 () Bool)

(assert (=> b!1247721 (= e!707900 tp_is_empty!31371)))

(declare-fun res!832508 () Bool)

(assert (=> start!104642 (=> (not res!832508) (not e!707899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104642 (= res!832508 (validMask!0 mask!1466))))

(assert (=> start!104642 e!707899))

(assert (=> start!104642 true))

(declare-fun array_inv!29613 (array!80436) Bool)

(assert (=> start!104642 (array_inv!29613 _keys!1118)))

(declare-fun array_inv!29614 (array!80438) Bool)

(assert (=> start!104642 (and (array_inv!29614 _values!914) e!707901)))

(assert (= (and start!104642 res!832508) b!1247722))

(assert (= (and b!1247722 res!832507) b!1247724))

(assert (= (and b!1247724 res!832509) b!1247719))

(assert (= (and b!1247720 condMapEmpty!48811) mapIsEmpty!48811))

(assert (= (and b!1247720 (not condMapEmpty!48811)) mapNonEmpty!48811))

(get-info :version)

(assert (= (and mapNonEmpty!48811 ((_ is ValueCellFull!14922) mapValue!48811)) b!1247723))

(assert (= (and b!1247720 ((_ is ValueCellFull!14922) mapDefault!48811)) b!1247721))

(assert (= start!104642 b!1247720))

(declare-fun m!1149135 () Bool)

(assert (=> b!1247719 m!1149135))

(declare-fun m!1149137 () Bool)

(assert (=> mapNonEmpty!48811 m!1149137))

(declare-fun m!1149139 () Bool)

(assert (=> b!1247724 m!1149139))

(declare-fun m!1149141 () Bool)

(assert (=> start!104642 m!1149141))

(declare-fun m!1149143 () Bool)

(assert (=> start!104642 m!1149143))

(declare-fun m!1149145 () Bool)

(assert (=> start!104642 m!1149145))

(check-sat tp_is_empty!31371 (not b!1247719) (not start!104642) (not mapNonEmpty!48811) (not b!1247724))
(check-sat)
