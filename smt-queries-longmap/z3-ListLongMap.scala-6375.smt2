; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81968 () Bool)

(assert start!81968)

(declare-fun mapIsEmpty!33499 () Bool)

(declare-fun mapRes!33499 () Bool)

(assert (=> mapIsEmpty!33499 mapRes!33499))

(declare-fun res!640201 () Bool)

(declare-fun e!538650 () Bool)

(assert (=> start!81968 (=> (not res!640201) (not e!538650))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81968 (= res!640201 (validMask!0 mask!1823))))

(assert (=> start!81968 e!538650))

(assert (=> start!81968 true))

(declare-datatypes ((V!33017 0))(
  ( (V!33018 (val!10563 Int)) )
))
(declare-datatypes ((ValueCell!10031 0))(
  ( (ValueCellFull!10031 (v!13117 V!33017)) (EmptyCell!10031) )
))
(declare-datatypes ((array!58096 0))(
  ( (array!58097 (arr!27928 (Array (_ BitVec 32) ValueCell!10031)) (size!28409 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58096)

(declare-fun e!538647 () Bool)

(declare-fun array_inv!21733 (array!58096) Bool)

(assert (=> start!81968 (and (array_inv!21733 _values!1197) e!538647)))

(declare-datatypes ((array!58098 0))(
  ( (array!58099 (arr!27929 (Array (_ BitVec 32) (_ BitVec 64))) (size!28410 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58098)

(declare-fun array_inv!21734 (array!58098) Bool)

(assert (=> start!81968 (array_inv!21734 _keys!1441)))

(declare-fun b!956018 () Bool)

(declare-fun e!538648 () Bool)

(declare-fun tp_is_empty!21025 () Bool)

(assert (=> b!956018 (= e!538648 tp_is_empty!21025)))

(declare-fun b!956019 () Bool)

(declare-fun res!640199 () Bool)

(assert (=> b!956019 (=> (not res!640199) (not e!538650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58098 (_ BitVec 32)) Bool)

(assert (=> b!956019 (= res!640199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956020 () Bool)

(declare-fun e!538649 () Bool)

(assert (=> b!956020 (= e!538647 (and e!538649 mapRes!33499))))

(declare-fun condMapEmpty!33499 () Bool)

(declare-fun mapDefault!33499 () ValueCell!10031)

(assert (=> b!956020 (= condMapEmpty!33499 (= (arr!27928 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10031)) mapDefault!33499)))))

(declare-fun b!956021 () Bool)

(assert (=> b!956021 (= e!538650 false)))

(declare-fun lt!429879 () Bool)

(declare-datatypes ((List!19485 0))(
  ( (Nil!19482) (Cons!19481 (h!20643 (_ BitVec 64)) (t!27837 List!19485)) )
))
(declare-fun arrayNoDuplicates!0 (array!58098 (_ BitVec 32) List!19485) Bool)

(assert (=> b!956021 (= lt!429879 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19482))))

(declare-fun mapNonEmpty!33499 () Bool)

(declare-fun tp!64078 () Bool)

(assert (=> mapNonEmpty!33499 (= mapRes!33499 (and tp!64078 e!538648))))

(declare-fun mapRest!33499 () (Array (_ BitVec 32) ValueCell!10031))

(declare-fun mapKey!33499 () (_ BitVec 32))

(declare-fun mapValue!33499 () ValueCell!10031)

(assert (=> mapNonEmpty!33499 (= (arr!27928 _values!1197) (store mapRest!33499 mapKey!33499 mapValue!33499))))

(declare-fun b!956022 () Bool)

(declare-fun res!640200 () Bool)

(assert (=> b!956022 (=> (not res!640200) (not e!538650))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956022 (= res!640200 (and (= (size!28409 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28410 _keys!1441) (size!28409 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956023 () Bool)

(assert (=> b!956023 (= e!538649 tp_is_empty!21025)))

(assert (= (and start!81968 res!640201) b!956022))

(assert (= (and b!956022 res!640200) b!956019))

(assert (= (and b!956019 res!640199) b!956021))

(assert (= (and b!956020 condMapEmpty!33499) mapIsEmpty!33499))

(assert (= (and b!956020 (not condMapEmpty!33499)) mapNonEmpty!33499))

(get-info :version)

(assert (= (and mapNonEmpty!33499 ((_ is ValueCellFull!10031) mapValue!33499)) b!956018))

(assert (= (and b!956020 ((_ is ValueCellFull!10031) mapDefault!33499)) b!956023))

(assert (= start!81968 b!956020))

(declare-fun m!886839 () Bool)

(assert (=> start!81968 m!886839))

(declare-fun m!886841 () Bool)

(assert (=> start!81968 m!886841))

(declare-fun m!886843 () Bool)

(assert (=> start!81968 m!886843))

(declare-fun m!886845 () Bool)

(assert (=> b!956019 m!886845))

(declare-fun m!886847 () Bool)

(assert (=> b!956021 m!886847))

(declare-fun m!886849 () Bool)

(assert (=> mapNonEmpty!33499 m!886849))

(check-sat (not b!956021) (not b!956019) (not start!81968) tp_is_empty!21025 (not mapNonEmpty!33499))
(check-sat)
