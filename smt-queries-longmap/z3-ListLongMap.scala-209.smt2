; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3932 () Bool)

(assert start!3932)

(declare-fun b_free!841 () Bool)

(declare-fun b_next!841 () Bool)

(assert (=> start!3932 (= b_free!841 (not b_next!841))))

(declare-fun tp!3943 () Bool)

(declare-fun b_and!1641 () Bool)

(assert (=> start!3932 (= tp!3943 b_and!1641)))

(declare-fun b!27924 () Bool)

(declare-fun res!16595 () Bool)

(declare-fun e!18106 () Bool)

(assert (=> b!27924 (=> (not res!16595) (not e!18106))))

(declare-datatypes ((array!1611 0))(
  ( (array!1612 (arr!759 (Array (_ BitVec 32) (_ BitVec 64))) (size!860 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1611)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1611 (_ BitVec 32)) Bool)

(assert (=> b!27924 (= res!16595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27925 () Bool)

(declare-fun e!18103 () Bool)

(declare-fun e!18104 () Bool)

(declare-fun mapRes!1321 () Bool)

(assert (=> b!27925 (= e!18103 (and e!18104 mapRes!1321))))

(declare-fun condMapEmpty!1321 () Bool)

(declare-datatypes ((V!1419 0))(
  ( (V!1420 (val!624 Int)) )
))
(declare-datatypes ((ValueCell!398 0))(
  ( (ValueCellFull!398 (v!1713 V!1419)) (EmptyCell!398) )
))
(declare-datatypes ((array!1613 0))(
  ( (array!1614 (arr!760 (Array (_ BitVec 32) ValueCell!398)) (size!861 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1613)

(declare-fun mapDefault!1321 () ValueCell!398)

(assert (=> b!27925 (= condMapEmpty!1321 (= (arr!760 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!398)) mapDefault!1321)))))

(declare-fun b!27926 () Bool)

(declare-fun res!16594 () Bool)

(assert (=> b!27926 (=> (not res!16594) (not e!18106))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27926 (= res!16594 (validKeyInArray!0 k0!1304))))

(declare-fun b!27927 () Bool)

(declare-fun e!18102 () Bool)

(declare-fun tp_is_empty!1195 () Bool)

(assert (=> b!27927 (= e!18102 tp_is_empty!1195)))

(declare-fun res!16593 () Bool)

(assert (=> start!3932 (=> (not res!16593) (not e!18106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3932 (= res!16593 (validMask!0 mask!2294))))

(assert (=> start!3932 e!18106))

(assert (=> start!3932 true))

(assert (=> start!3932 tp!3943))

(declare-fun array_inv!529 (array!1613) Bool)

(assert (=> start!3932 (and (array_inv!529 _values!1501) e!18103)))

(declare-fun array_inv!530 (array!1611) Bool)

(assert (=> start!3932 (array_inv!530 _keys!1833)))

(assert (=> start!3932 tp_is_empty!1195))

(declare-fun b!27928 () Bool)

(declare-fun res!16590 () Bool)

(assert (=> b!27928 (=> (not res!16590) (not e!18106))))

(declare-fun arrayContainsKey!0 (array!1611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27928 (= res!16590 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27929 () Bool)

(declare-fun res!16592 () Bool)

(assert (=> b!27929 (=> (not res!16592) (not e!18106))))

(declare-datatypes ((List!634 0))(
  ( (Nil!631) (Cons!630 (h!1197 (_ BitVec 64)) (t!3321 List!634)) )
))
(declare-fun arrayNoDuplicates!0 (array!1611 (_ BitVec 32) List!634) Bool)

(assert (=> b!27929 (= res!16592 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!631))))

(declare-fun mapNonEmpty!1321 () Bool)

(declare-fun tp!3942 () Bool)

(assert (=> mapNonEmpty!1321 (= mapRes!1321 (and tp!3942 e!18102))))

(declare-fun mapRest!1321 () (Array (_ BitVec 32) ValueCell!398))

(declare-fun mapKey!1321 () (_ BitVec 32))

(declare-fun mapValue!1321 () ValueCell!398)

(assert (=> mapNonEmpty!1321 (= (arr!760 _values!1501) (store mapRest!1321 mapKey!1321 mapValue!1321))))

(declare-fun b!27930 () Bool)

(assert (=> b!27930 (= e!18104 tp_is_empty!1195)))

(declare-fun b!27931 () Bool)

(assert (=> b!27931 (= e!18106 false)))

(declare-fun lt!10692 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1611 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27931 (= lt!10692 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27932 () Bool)

(declare-fun res!16589 () Bool)

(assert (=> b!27932 (=> (not res!16589) (not e!18106))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1419)

(declare-fun minValue!1443 () V!1419)

(declare-datatypes ((tuple2!1042 0))(
  ( (tuple2!1043 (_1!532 (_ BitVec 64)) (_2!532 V!1419)) )
))
(declare-datatypes ((List!635 0))(
  ( (Nil!632) (Cons!631 (h!1198 tuple2!1042) (t!3322 List!635)) )
))
(declare-datatypes ((ListLongMap!613 0))(
  ( (ListLongMap!614 (toList!322 List!635)) )
))
(declare-fun contains!264 (ListLongMap!613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!152 (array!1611 array!1613 (_ BitVec 32) (_ BitVec 32) V!1419 V!1419 (_ BitVec 32) Int) ListLongMap!613)

(assert (=> b!27932 (= res!16589 (not (contains!264 (getCurrentListMap!152 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1321 () Bool)

(assert (=> mapIsEmpty!1321 mapRes!1321))

(declare-fun b!27933 () Bool)

(declare-fun res!16591 () Bool)

(assert (=> b!27933 (=> (not res!16591) (not e!18106))))

(assert (=> b!27933 (= res!16591 (and (= (size!861 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!860 _keys!1833) (size!861 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3932 res!16593) b!27933))

(assert (= (and b!27933 res!16591) b!27924))

(assert (= (and b!27924 res!16595) b!27929))

(assert (= (and b!27929 res!16592) b!27926))

(assert (= (and b!27926 res!16594) b!27932))

(assert (= (and b!27932 res!16589) b!27928))

(assert (= (and b!27928 res!16590) b!27931))

(assert (= (and b!27925 condMapEmpty!1321) mapIsEmpty!1321))

(assert (= (and b!27925 (not condMapEmpty!1321)) mapNonEmpty!1321))

(get-info :version)

(assert (= (and mapNonEmpty!1321 ((_ is ValueCellFull!398) mapValue!1321)) b!27927))

(assert (= (and b!27925 ((_ is ValueCellFull!398) mapDefault!1321)) b!27930))

(assert (= start!3932 b!27925))

(declare-fun m!22151 () Bool)

(assert (=> b!27929 m!22151))

(declare-fun m!22153 () Bool)

(assert (=> b!27928 m!22153))

(declare-fun m!22155 () Bool)

(assert (=> mapNonEmpty!1321 m!22155))

(declare-fun m!22157 () Bool)

(assert (=> start!3932 m!22157))

(declare-fun m!22159 () Bool)

(assert (=> start!3932 m!22159))

(declare-fun m!22161 () Bool)

(assert (=> start!3932 m!22161))

(declare-fun m!22163 () Bool)

(assert (=> b!27932 m!22163))

(assert (=> b!27932 m!22163))

(declare-fun m!22165 () Bool)

(assert (=> b!27932 m!22165))

(declare-fun m!22167 () Bool)

(assert (=> b!27926 m!22167))

(declare-fun m!22169 () Bool)

(assert (=> b!27931 m!22169))

(declare-fun m!22171 () Bool)

(assert (=> b!27924 m!22171))

(check-sat (not start!3932) (not b!27931) (not b!27932) tp_is_empty!1195 (not b_next!841) (not b!27928) (not mapNonEmpty!1321) (not b!27929) (not b!27926) (not b!27924) b_and!1641)
(check-sat b_and!1641 (not b_next!841))
