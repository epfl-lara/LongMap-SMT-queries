; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4460 () Bool)

(assert start!4460)

(declare-fun b_free!1231 () Bool)

(declare-fun b_next!1231 () Bool)

(assert (=> start!4460 (= b_free!1231 (not b_next!1231))))

(declare-fun tp!5131 () Bool)

(declare-fun b_and!2047 () Bool)

(assert (=> start!4460 (= tp!5131 b_and!2047)))

(declare-fun b!34628 () Bool)

(declare-fun res!21031 () Bool)

(declare-fun e!21925 () Bool)

(assert (=> b!34628 (=> (not res!21031) (not e!21925))))

(declare-datatypes ((V!1939 0))(
  ( (V!1940 (val!819 Int)) )
))
(declare-datatypes ((ValueCell!593 0))(
  ( (ValueCellFull!593 (v!1913 V!1939)) (EmptyCell!593) )
))
(declare-datatypes ((array!2359 0))(
  ( (array!2360 (arr!1127 (Array (_ BitVec 32) ValueCell!593)) (size!1228 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2359)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2361 0))(
  ( (array!2362 (arr!1128 (Array (_ BitVec 32) (_ BitVec 64))) (size!1229 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2361)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!34628 (= res!21031 (and (= (size!1228 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1229 _keys!1833) (size!1228 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34629 () Bool)

(declare-fun e!21927 () Bool)

(declare-fun tp_is_empty!1585 () Bool)

(assert (=> b!34629 (= e!21927 tp_is_empty!1585)))

(declare-fun mapNonEmpty!1924 () Bool)

(declare-fun mapRes!1924 () Bool)

(declare-fun tp!5130 () Bool)

(declare-fun e!21926 () Bool)

(assert (=> mapNonEmpty!1924 (= mapRes!1924 (and tp!5130 e!21926))))

(declare-fun mapValue!1924 () ValueCell!593)

(declare-fun mapRest!1924 () (Array (_ BitVec 32) ValueCell!593))

(declare-fun mapKey!1924 () (_ BitVec 32))

(assert (=> mapNonEmpty!1924 (= (arr!1127 _values!1501) (store mapRest!1924 mapKey!1924 mapValue!1924))))

(declare-fun b!34630 () Bool)

(declare-fun e!21924 () Bool)

(assert (=> b!34630 (= e!21924 (and e!21927 mapRes!1924))))

(declare-fun condMapEmpty!1924 () Bool)

(declare-fun mapDefault!1924 () ValueCell!593)

(assert (=> b!34630 (= condMapEmpty!1924 (= (arr!1127 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!593)) mapDefault!1924)))))

(declare-fun b!34631 () Bool)

(declare-fun res!21025 () Bool)

(assert (=> b!34631 (=> (not res!21025) (not e!21925))))

(declare-datatypes ((List!907 0))(
  ( (Nil!904) (Cons!903 (h!1470 (_ BitVec 64)) (t!3605 List!907)) )
))
(declare-fun arrayNoDuplicates!0 (array!2361 (_ BitVec 32) List!907) Bool)

(assert (=> b!34631 (= res!21025 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!904))))

(declare-fun b!34632 () Bool)

(declare-fun res!21028 () Bool)

(assert (=> b!34632 (=> (not res!21028) (not e!21925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2361 (_ BitVec 32)) Bool)

(assert (=> b!34632 (= res!21028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34633 () Bool)

(declare-fun res!21026 () Bool)

(assert (=> b!34633 (=> (not res!21026) (not e!21925))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1939)

(declare-fun minValue!1443 () V!1939)

(declare-datatypes ((tuple2!1324 0))(
  ( (tuple2!1325 (_1!673 (_ BitVec 64)) (_2!673 V!1939)) )
))
(declare-datatypes ((List!908 0))(
  ( (Nil!905) (Cons!904 (h!1471 tuple2!1324) (t!3606 List!908)) )
))
(declare-datatypes ((ListLongMap!889 0))(
  ( (ListLongMap!890 (toList!460 List!908)) )
))
(declare-fun contains!407 (ListLongMap!889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!279 (array!2361 array!2359 (_ BitVec 32) (_ BitVec 32) V!1939 V!1939 (_ BitVec 32) Int) ListLongMap!889)

(assert (=> b!34633 (= res!21026 (not (contains!407 (getCurrentListMap!279 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34627 () Bool)

(declare-fun res!21030 () Bool)

(assert (=> b!34627 (=> (not res!21030) (not e!21925))))

(declare-fun arrayContainsKey!0 (array!2361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34627 (= res!21030 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun res!21029 () Bool)

(assert (=> start!4460 (=> (not res!21029) (not e!21925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4460 (= res!21029 (validMask!0 mask!2294))))

(assert (=> start!4460 e!21925))

(assert (=> start!4460 true))

(assert (=> start!4460 tp!5131))

(declare-fun array_inv!797 (array!2359) Bool)

(assert (=> start!4460 (and (array_inv!797 _values!1501) e!21924)))

(declare-fun array_inv!798 (array!2361) Bool)

(assert (=> start!4460 (array_inv!798 _keys!1833)))

(assert (=> start!4460 tp_is_empty!1585))

(declare-fun b!34634 () Bool)

(assert (=> b!34634 (= e!21925 false)))

(declare-datatypes ((SeekEntryResult!155 0))(
  ( (MissingZero!155 (index!2742 (_ BitVec 32))) (Found!155 (index!2743 (_ BitVec 32))) (Intermediate!155 (undefined!967 Bool) (index!2744 (_ BitVec 32)) (x!6949 (_ BitVec 32))) (Undefined!155) (MissingVacant!155 (index!2745 (_ BitVec 32))) )
))
(declare-fun lt!12800 () SeekEntryResult!155)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2361 (_ BitVec 32)) SeekEntryResult!155)

(assert (=> b!34634 (= lt!12800 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34635 () Bool)

(assert (=> b!34635 (= e!21926 tp_is_empty!1585)))

(declare-fun b!34636 () Bool)

(declare-fun res!21027 () Bool)

(assert (=> b!34636 (=> (not res!21027) (not e!21925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34636 (= res!21027 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1924 () Bool)

(assert (=> mapIsEmpty!1924 mapRes!1924))

(assert (= (and start!4460 res!21029) b!34628))

(assert (= (and b!34628 res!21031) b!34632))

(assert (= (and b!34632 res!21028) b!34631))

(assert (= (and b!34631 res!21025) b!34636))

(assert (= (and b!34636 res!21027) b!34633))

(assert (= (and b!34633 res!21026) b!34627))

(assert (= (and b!34627 res!21030) b!34634))

(assert (= (and b!34630 condMapEmpty!1924) mapIsEmpty!1924))

(assert (= (and b!34630 (not condMapEmpty!1924)) mapNonEmpty!1924))

(get-info :version)

(assert (= (and mapNonEmpty!1924 ((_ is ValueCellFull!593) mapValue!1924)) b!34635))

(assert (= (and b!34630 ((_ is ValueCellFull!593) mapDefault!1924)) b!34629))

(assert (= start!4460 b!34630))

(declare-fun m!27875 () Bool)

(assert (=> b!34627 m!27875))

(declare-fun m!27877 () Bool)

(assert (=> mapNonEmpty!1924 m!27877))

(declare-fun m!27879 () Bool)

(assert (=> b!34631 m!27879))

(declare-fun m!27881 () Bool)

(assert (=> b!34633 m!27881))

(assert (=> b!34633 m!27881))

(declare-fun m!27883 () Bool)

(assert (=> b!34633 m!27883))

(declare-fun m!27885 () Bool)

(assert (=> b!34632 m!27885))

(declare-fun m!27887 () Bool)

(assert (=> b!34636 m!27887))

(declare-fun m!27889 () Bool)

(assert (=> start!4460 m!27889))

(declare-fun m!27891 () Bool)

(assert (=> start!4460 m!27891))

(declare-fun m!27893 () Bool)

(assert (=> start!4460 m!27893))

(declare-fun m!27895 () Bool)

(assert (=> b!34634 m!27895))

(check-sat (not mapNonEmpty!1924) b_and!2047 tp_is_empty!1585 (not b!34636) (not b!34631) (not b!34633) (not b!34632) (not b!34627) (not b_next!1231) (not b!34634) (not start!4460))
(check-sat b_and!2047 (not b_next!1231))
