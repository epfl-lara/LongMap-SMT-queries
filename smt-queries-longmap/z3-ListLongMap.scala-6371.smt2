; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81944 () Bool)

(assert start!81944)

(declare-fun mapNonEmpty!33463 () Bool)

(declare-fun mapRes!33463 () Bool)

(declare-fun tp!64042 () Bool)

(declare-fun e!538467 () Bool)

(assert (=> mapNonEmpty!33463 (= mapRes!33463 (and tp!64042 e!538467))))

(declare-datatypes ((V!32985 0))(
  ( (V!32986 (val!10551 Int)) )
))
(declare-datatypes ((ValueCell!10019 0))(
  ( (ValueCellFull!10019 (v!13105 V!32985)) (EmptyCell!10019) )
))
(declare-fun mapRest!33463 () (Array (_ BitVec 32) ValueCell!10019))

(declare-fun mapKey!33463 () (_ BitVec 32))

(declare-datatypes ((array!58056 0))(
  ( (array!58057 (arr!27908 (Array (_ BitVec 32) ValueCell!10019)) (size!28389 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58056)

(declare-fun mapValue!33463 () ValueCell!10019)

(assert (=> mapNonEmpty!33463 (= (arr!27908 _values!1197) (store mapRest!33463 mapKey!33463 mapValue!33463))))

(declare-fun b!955802 () Bool)

(declare-fun e!538469 () Bool)

(declare-fun e!538470 () Bool)

(assert (=> b!955802 (= e!538469 (and e!538470 mapRes!33463))))

(declare-fun condMapEmpty!33463 () Bool)

(declare-fun mapDefault!33463 () ValueCell!10019)

(assert (=> b!955802 (= condMapEmpty!33463 (= (arr!27908 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10019)) mapDefault!33463)))))

(declare-fun mapIsEmpty!33463 () Bool)

(assert (=> mapIsEmpty!33463 mapRes!33463))

(declare-fun res!640093 () Bool)

(declare-fun e!538468 () Bool)

(assert (=> start!81944 (=> (not res!640093) (not e!538468))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81944 (= res!640093 (validMask!0 mask!1823))))

(assert (=> start!81944 e!538468))

(assert (=> start!81944 true))

(declare-fun array_inv!21719 (array!58056) Bool)

(assert (=> start!81944 (and (array_inv!21719 _values!1197) e!538469)))

(declare-datatypes ((array!58058 0))(
  ( (array!58059 (arr!27909 (Array (_ BitVec 32) (_ BitVec 64))) (size!28390 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58058)

(declare-fun array_inv!21720 (array!58058) Bool)

(assert (=> start!81944 (array_inv!21720 _keys!1441)))

(declare-fun b!955803 () Bool)

(declare-fun res!640091 () Bool)

(assert (=> b!955803 (=> (not res!640091) (not e!538468))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955803 (= res!640091 (and (= (size!28389 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28390 _keys!1441) (size!28389 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955804 () Bool)

(declare-fun tp_is_empty!21001 () Bool)

(assert (=> b!955804 (= e!538467 tp_is_empty!21001)))

(declare-fun b!955805 () Bool)

(assert (=> b!955805 (= e!538468 false)))

(declare-fun lt!429843 () Bool)

(declare-datatypes ((List!19478 0))(
  ( (Nil!19475) (Cons!19474 (h!20636 (_ BitVec 64)) (t!27830 List!19478)) )
))
(declare-fun arrayNoDuplicates!0 (array!58058 (_ BitVec 32) List!19478) Bool)

(assert (=> b!955805 (= lt!429843 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19475))))

(declare-fun b!955806 () Bool)

(declare-fun res!640092 () Bool)

(assert (=> b!955806 (=> (not res!640092) (not e!538468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58058 (_ BitVec 32)) Bool)

(assert (=> b!955806 (= res!640092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955807 () Bool)

(assert (=> b!955807 (= e!538470 tp_is_empty!21001)))

(assert (= (and start!81944 res!640093) b!955803))

(assert (= (and b!955803 res!640091) b!955806))

(assert (= (and b!955806 res!640092) b!955805))

(assert (= (and b!955802 condMapEmpty!33463) mapIsEmpty!33463))

(assert (= (and b!955802 (not condMapEmpty!33463)) mapNonEmpty!33463))

(get-info :version)

(assert (= (and mapNonEmpty!33463 ((_ is ValueCellFull!10019) mapValue!33463)) b!955804))

(assert (= (and b!955802 ((_ is ValueCellFull!10019) mapDefault!33463)) b!955807))

(assert (= start!81944 b!955802))

(declare-fun m!886695 () Bool)

(assert (=> mapNonEmpty!33463 m!886695))

(declare-fun m!886697 () Bool)

(assert (=> start!81944 m!886697))

(declare-fun m!886699 () Bool)

(assert (=> start!81944 m!886699))

(declare-fun m!886701 () Bool)

(assert (=> start!81944 m!886701))

(declare-fun m!886703 () Bool)

(assert (=> b!955805 m!886703))

(declare-fun m!886705 () Bool)

(assert (=> b!955806 m!886705))

(check-sat (not mapNonEmpty!33463) (not b!955805) (not b!955806) (not start!81944) tp_is_empty!21001)
(check-sat)
