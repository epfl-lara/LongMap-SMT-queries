; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104834 () Bool)

(assert start!104834)

(declare-fun b!1248736 () Bool)

(declare-fun e!708509 () Bool)

(declare-fun e!708508 () Bool)

(declare-fun mapRes!48763 () Bool)

(assert (=> b!1248736 (= e!708509 (and e!708508 mapRes!48763))))

(declare-fun condMapEmpty!48763 () Bool)

(declare-datatypes ((V!47151 0))(
  ( (V!47152 (val!15732 Int)) )
))
(declare-datatypes ((ValueCell!14906 0))(
  ( (ValueCellFull!14906 (v!18424 V!47151)) (EmptyCell!14906) )
))
(declare-datatypes ((array!80405 0))(
  ( (array!80406 (arr!38767 (Array (_ BitVec 32) ValueCell!14906)) (size!39304 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80405)

(declare-fun mapDefault!48763 () ValueCell!14906)

(assert (=> b!1248736 (= condMapEmpty!48763 (= (arr!38767 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14906)) mapDefault!48763)))))

(declare-fun b!1248737 () Bool)

(declare-fun res!832884 () Bool)

(declare-fun e!708505 () Bool)

(assert (=> b!1248737 (=> (not res!832884) (not e!708505))))

(declare-datatypes ((array!80407 0))(
  ( (array!80408 (arr!38768 (Array (_ BitVec 32) (_ BitVec 64))) (size!39305 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80407)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80407 (_ BitVec 32)) Bool)

(assert (=> b!1248737 (= res!832884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248738 () Bool)

(assert (=> b!1248738 (= e!708505 false)))

(declare-fun lt!563744 () Bool)

(declare-datatypes ((List!27551 0))(
  ( (Nil!27548) (Cons!27547 (h!28765 (_ BitVec 64)) (t!41012 List!27551)) )
))
(declare-fun arrayNoDuplicates!0 (array!80407 (_ BitVec 32) List!27551) Bool)

(assert (=> b!1248738 (= lt!563744 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27548))))

(declare-fun b!1248739 () Bool)

(declare-fun e!708506 () Bool)

(declare-fun tp_is_empty!31339 () Bool)

(assert (=> b!1248739 (= e!708506 tp_is_empty!31339)))

(declare-fun mapIsEmpty!48763 () Bool)

(assert (=> mapIsEmpty!48763 mapRes!48763))

(declare-fun b!1248740 () Bool)

(declare-fun res!832883 () Bool)

(assert (=> b!1248740 (=> (not res!832883) (not e!708505))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248740 (= res!832883 (and (= (size!39304 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39305 _keys!1118) (size!39304 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832885 () Bool)

(assert (=> start!104834 (=> (not res!832885) (not e!708505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104834 (= res!832885 (validMask!0 mask!1466))))

(assert (=> start!104834 e!708505))

(assert (=> start!104834 true))

(declare-fun array_inv!29693 (array!80407) Bool)

(assert (=> start!104834 (array_inv!29693 _keys!1118)))

(declare-fun array_inv!29694 (array!80405) Bool)

(assert (=> start!104834 (and (array_inv!29694 _values!914) e!708509)))

(declare-fun mapNonEmpty!48763 () Bool)

(declare-fun tp!92864 () Bool)

(assert (=> mapNonEmpty!48763 (= mapRes!48763 (and tp!92864 e!708506))))

(declare-fun mapValue!48763 () ValueCell!14906)

(declare-fun mapKey!48763 () (_ BitVec 32))

(declare-fun mapRest!48763 () (Array (_ BitVec 32) ValueCell!14906))

(assert (=> mapNonEmpty!48763 (= (arr!38767 _values!914) (store mapRest!48763 mapKey!48763 mapValue!48763))))

(declare-fun b!1248741 () Bool)

(assert (=> b!1248741 (= e!708508 tp_is_empty!31339)))

(assert (= (and start!104834 res!832885) b!1248740))

(assert (= (and b!1248740 res!832883) b!1248737))

(assert (= (and b!1248737 res!832884) b!1248738))

(assert (= (and b!1248736 condMapEmpty!48763) mapIsEmpty!48763))

(assert (= (and b!1248736 (not condMapEmpty!48763)) mapNonEmpty!48763))

(get-info :version)

(assert (= (and mapNonEmpty!48763 ((_ is ValueCellFull!14906) mapValue!48763)) b!1248739))

(assert (= (and b!1248736 ((_ is ValueCellFull!14906) mapDefault!48763)) b!1248741))

(assert (= start!104834 b!1248736))

(declare-fun m!1150555 () Bool)

(assert (=> b!1248737 m!1150555))

(declare-fun m!1150557 () Bool)

(assert (=> b!1248738 m!1150557))

(declare-fun m!1150559 () Bool)

(assert (=> start!104834 m!1150559))

(declare-fun m!1150561 () Bool)

(assert (=> start!104834 m!1150561))

(declare-fun m!1150563 () Bool)

(assert (=> start!104834 m!1150563))

(declare-fun m!1150565 () Bool)

(assert (=> mapNonEmpty!48763 m!1150565))

(check-sat (not b!1248738) (not b!1248737) (not mapNonEmpty!48763) tp_is_empty!31339 (not start!104834))
(check-sat)
