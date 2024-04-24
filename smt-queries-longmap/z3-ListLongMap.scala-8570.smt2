; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104852 () Bool)

(assert start!104852)

(declare-fun mapIsEmpty!48790 () Bool)

(declare-fun mapRes!48790 () Bool)

(assert (=> mapIsEmpty!48790 mapRes!48790))

(declare-fun b!1248898 () Bool)

(declare-fun res!832966 () Bool)

(declare-fun e!708643 () Bool)

(assert (=> b!1248898 (=> (not res!832966) (not e!708643))))

(declare-datatypes ((array!80439 0))(
  ( (array!80440 (arr!38784 (Array (_ BitVec 32) (_ BitVec 64))) (size!39321 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80439)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80439 (_ BitVec 32)) Bool)

(assert (=> b!1248898 (= res!832966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248899 () Bool)

(assert (=> b!1248899 (= e!708643 false)))

(declare-fun lt!563771 () Bool)

(declare-datatypes ((List!27557 0))(
  ( (Nil!27554) (Cons!27553 (h!28771 (_ BitVec 64)) (t!41018 List!27557)) )
))
(declare-fun arrayNoDuplicates!0 (array!80439 (_ BitVec 32) List!27557) Bool)

(assert (=> b!1248899 (= lt!563771 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27554))))

(declare-fun b!1248900 () Bool)

(declare-fun e!708642 () Bool)

(declare-fun e!708644 () Bool)

(assert (=> b!1248900 (= e!708642 (and e!708644 mapRes!48790))))

(declare-fun condMapEmpty!48790 () Bool)

(declare-datatypes ((V!47175 0))(
  ( (V!47176 (val!15741 Int)) )
))
(declare-datatypes ((ValueCell!14915 0))(
  ( (ValueCellFull!14915 (v!18433 V!47175)) (EmptyCell!14915) )
))
(declare-datatypes ((array!80441 0))(
  ( (array!80442 (arr!38785 (Array (_ BitVec 32) ValueCell!14915)) (size!39322 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80441)

(declare-fun mapDefault!48790 () ValueCell!14915)

(assert (=> b!1248900 (= condMapEmpty!48790 (= (arr!38785 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14915)) mapDefault!48790)))))

(declare-fun b!1248901 () Bool)

(declare-fun tp_is_empty!31357 () Bool)

(assert (=> b!1248901 (= e!708644 tp_is_empty!31357)))

(declare-fun b!1248902 () Bool)

(declare-fun res!832964 () Bool)

(assert (=> b!1248902 (=> (not res!832964) (not e!708643))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248902 (= res!832964 (and (= (size!39322 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39321 _keys!1118) (size!39322 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248903 () Bool)

(declare-fun e!708640 () Bool)

(assert (=> b!1248903 (= e!708640 tp_is_empty!31357)))

(declare-fun res!832965 () Bool)

(assert (=> start!104852 (=> (not res!832965) (not e!708643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104852 (= res!832965 (validMask!0 mask!1466))))

(assert (=> start!104852 e!708643))

(assert (=> start!104852 true))

(declare-fun array_inv!29707 (array!80439) Bool)

(assert (=> start!104852 (array_inv!29707 _keys!1118)))

(declare-fun array_inv!29708 (array!80441) Bool)

(assert (=> start!104852 (and (array_inv!29708 _values!914) e!708642)))

(declare-fun mapNonEmpty!48790 () Bool)

(declare-fun tp!92891 () Bool)

(assert (=> mapNonEmpty!48790 (= mapRes!48790 (and tp!92891 e!708640))))

(declare-fun mapKey!48790 () (_ BitVec 32))

(declare-fun mapRest!48790 () (Array (_ BitVec 32) ValueCell!14915))

(declare-fun mapValue!48790 () ValueCell!14915)

(assert (=> mapNonEmpty!48790 (= (arr!38785 _values!914) (store mapRest!48790 mapKey!48790 mapValue!48790))))

(assert (= (and start!104852 res!832965) b!1248902))

(assert (= (and b!1248902 res!832964) b!1248898))

(assert (= (and b!1248898 res!832966) b!1248899))

(assert (= (and b!1248900 condMapEmpty!48790) mapIsEmpty!48790))

(assert (= (and b!1248900 (not condMapEmpty!48790)) mapNonEmpty!48790))

(get-info :version)

(assert (= (and mapNonEmpty!48790 ((_ is ValueCellFull!14915) mapValue!48790)) b!1248903))

(assert (= (and b!1248900 ((_ is ValueCellFull!14915) mapDefault!48790)) b!1248901))

(assert (= start!104852 b!1248900))

(declare-fun m!1150663 () Bool)

(assert (=> b!1248898 m!1150663))

(declare-fun m!1150665 () Bool)

(assert (=> b!1248899 m!1150665))

(declare-fun m!1150667 () Bool)

(assert (=> start!104852 m!1150667))

(declare-fun m!1150669 () Bool)

(assert (=> start!104852 m!1150669))

(declare-fun m!1150671 () Bool)

(assert (=> start!104852 m!1150671))

(declare-fun m!1150673 () Bool)

(assert (=> mapNonEmpty!48790 m!1150673))

(check-sat (not b!1248899) (not start!104852) (not mapNonEmpty!48790) (not b!1248898) tp_is_empty!31357)
(check-sat)
