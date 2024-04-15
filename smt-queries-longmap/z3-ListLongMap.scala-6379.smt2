; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81992 () Bool)

(assert start!81992)

(declare-fun b!956234 () Bool)

(declare-fun e!538827 () Bool)

(declare-fun e!538828 () Bool)

(declare-fun mapRes!33535 () Bool)

(assert (=> b!956234 (= e!538827 (and e!538828 mapRes!33535))))

(declare-fun condMapEmpty!33535 () Bool)

(declare-datatypes ((V!33049 0))(
  ( (V!33050 (val!10575 Int)) )
))
(declare-datatypes ((ValueCell!10043 0))(
  ( (ValueCellFull!10043 (v!13129 V!33049)) (EmptyCell!10043) )
))
(declare-datatypes ((array!58142 0))(
  ( (array!58143 (arr!27951 (Array (_ BitVec 32) ValueCell!10043)) (size!28432 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58142)

(declare-fun mapDefault!33535 () ValueCell!10043)

(assert (=> b!956234 (= condMapEmpty!33535 (= (arr!27951 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10043)) mapDefault!33535)))))

(declare-fun b!956235 () Bool)

(declare-fun res!640309 () Bool)

(declare-fun e!538829 () Bool)

(assert (=> b!956235 (=> (not res!640309) (not e!538829))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58144 0))(
  ( (array!58145 (arr!27952 (Array (_ BitVec 32) (_ BitVec 64))) (size!28433 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58144)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956235 (= res!640309 (and (= (size!28432 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28433 _keys!1441) (size!28432 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33535 () Bool)

(assert (=> mapIsEmpty!33535 mapRes!33535))

(declare-fun b!956236 () Bool)

(assert (=> b!956236 (= e!538829 false)))

(declare-fun lt!429915 () Bool)

(declare-datatypes ((List!19495 0))(
  ( (Nil!19492) (Cons!19491 (h!20653 (_ BitVec 64)) (t!27847 List!19495)) )
))
(declare-fun arrayNoDuplicates!0 (array!58144 (_ BitVec 32) List!19495) Bool)

(assert (=> b!956236 (= lt!429915 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19492))))

(declare-fun b!956237 () Bool)

(declare-fun e!538826 () Bool)

(declare-fun tp_is_empty!21049 () Bool)

(assert (=> b!956237 (= e!538826 tp_is_empty!21049)))

(declare-fun res!640307 () Bool)

(assert (=> start!81992 (=> (not res!640307) (not e!538829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81992 (= res!640307 (validMask!0 mask!1823))))

(assert (=> start!81992 e!538829))

(assert (=> start!81992 true))

(declare-fun array_inv!21749 (array!58142) Bool)

(assert (=> start!81992 (and (array_inv!21749 _values!1197) e!538827)))

(declare-fun array_inv!21750 (array!58144) Bool)

(assert (=> start!81992 (array_inv!21750 _keys!1441)))

(declare-fun b!956238 () Bool)

(assert (=> b!956238 (= e!538828 tp_is_empty!21049)))

(declare-fun mapNonEmpty!33535 () Bool)

(declare-fun tp!64114 () Bool)

(assert (=> mapNonEmpty!33535 (= mapRes!33535 (and tp!64114 e!538826))))

(declare-fun mapRest!33535 () (Array (_ BitVec 32) ValueCell!10043))

(declare-fun mapValue!33535 () ValueCell!10043)

(declare-fun mapKey!33535 () (_ BitVec 32))

(assert (=> mapNonEmpty!33535 (= (arr!27951 _values!1197) (store mapRest!33535 mapKey!33535 mapValue!33535))))

(declare-fun b!956239 () Bool)

(declare-fun res!640308 () Bool)

(assert (=> b!956239 (=> (not res!640308) (not e!538829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58144 (_ BitVec 32)) Bool)

(assert (=> b!956239 (= res!640308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!81992 res!640307) b!956235))

(assert (= (and b!956235 res!640309) b!956239))

(assert (= (and b!956239 res!640308) b!956236))

(assert (= (and b!956234 condMapEmpty!33535) mapIsEmpty!33535))

(assert (= (and b!956234 (not condMapEmpty!33535)) mapNonEmpty!33535))

(get-info :version)

(assert (= (and mapNonEmpty!33535 ((_ is ValueCellFull!10043) mapValue!33535)) b!956237))

(assert (= (and b!956234 ((_ is ValueCellFull!10043) mapDefault!33535)) b!956238))

(assert (= start!81992 b!956234))

(declare-fun m!886983 () Bool)

(assert (=> b!956236 m!886983))

(declare-fun m!886985 () Bool)

(assert (=> start!81992 m!886985))

(declare-fun m!886987 () Bool)

(assert (=> start!81992 m!886987))

(declare-fun m!886989 () Bool)

(assert (=> start!81992 m!886989))

(declare-fun m!886991 () Bool)

(assert (=> mapNonEmpty!33535 m!886991))

(declare-fun m!886993 () Bool)

(assert (=> b!956239 m!886993))

(check-sat (not b!956236) (not b!956239) (not mapNonEmpty!33535) (not start!81992) tp_is_empty!21049)
(check-sat)
