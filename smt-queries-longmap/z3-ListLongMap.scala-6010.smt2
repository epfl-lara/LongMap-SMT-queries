; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77910 () Bool)

(assert start!77910)

(declare-fun b_free!16471 () Bool)

(declare-fun b_next!16471 () Bool)

(assert (=> start!77910 (= b_free!16471 (not b_next!16471))))

(declare-fun tp!57681 () Bool)

(declare-fun b_and!27015 () Bool)

(assert (=> start!77910 (= tp!57681 b_and!27015)))

(declare-fun b!909594 () Bool)

(declare-fun res!613916 () Bool)

(declare-fun e!509897 () Bool)

(assert (=> b!909594 (=> (not res!613916) (not e!509897))))

(declare-datatypes ((V!30151 0))(
  ( (V!30152 (val!9495 Int)) )
))
(declare-datatypes ((ValueCell!8963 0))(
  ( (ValueCellFull!8963 (v!12002 V!30151)) (EmptyCell!8963) )
))
(declare-datatypes ((array!53785 0))(
  ( (array!53786 (arr!25850 (Array (_ BitVec 32) ValueCell!8963)) (size!26311 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53785)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53787 0))(
  ( (array!53788 (arr!25851 (Array (_ BitVec 32) (_ BitVec 64))) (size!26312 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53787)

(assert (=> b!909594 (= res!613916 (and (= (size!26311 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26312 _keys!1386) (size!26311 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!613917 () Bool)

(assert (=> start!77910 (=> (not res!613917) (not e!509897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77910 (= res!613917 (validMask!0 mask!1756))))

(assert (=> start!77910 e!509897))

(declare-fun e!509898 () Bool)

(declare-fun array_inv!20266 (array!53785) Bool)

(assert (=> start!77910 (and (array_inv!20266 _values!1152) e!509898)))

(assert (=> start!77910 tp!57681))

(assert (=> start!77910 true))

(declare-fun tp_is_empty!18889 () Bool)

(assert (=> start!77910 tp_is_empty!18889))

(declare-fun array_inv!20267 (array!53787) Bool)

(assert (=> start!77910 (array_inv!20267 _keys!1386)))

(declare-fun b!909595 () Bool)

(declare-fun e!509900 () Bool)

(declare-fun mapRes!30052 () Bool)

(assert (=> b!909595 (= e!509898 (and e!509900 mapRes!30052))))

(declare-fun condMapEmpty!30052 () Bool)

(declare-fun mapDefault!30052 () ValueCell!8963)

(assert (=> b!909595 (= condMapEmpty!30052 (= (arr!25850 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8963)) mapDefault!30052)))))

(declare-fun b!909596 () Bool)

(assert (=> b!909596 (= e!509897 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30151)

(declare-fun lt!409875 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30151)

(declare-datatypes ((tuple2!12398 0))(
  ( (tuple2!12399 (_1!6210 (_ BitVec 64)) (_2!6210 V!30151)) )
))
(declare-datatypes ((List!18183 0))(
  ( (Nil!18180) (Cons!18179 (h!19325 tuple2!12398) (t!25757 List!18183)) )
))
(declare-datatypes ((ListLongMap!11085 0))(
  ( (ListLongMap!11086 (toList!5558 List!18183)) )
))
(declare-fun contains!4558 (ListLongMap!11085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2760 (array!53787 array!53785 (_ BitVec 32) (_ BitVec 32) V!30151 V!30151 (_ BitVec 32) Int) ListLongMap!11085)

(assert (=> b!909596 (= lt!409875 (contains!4558 (getCurrentListMap!2760 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909597 () Bool)

(declare-fun e!509896 () Bool)

(assert (=> b!909597 (= e!509896 tp_is_empty!18889)))

(declare-fun b!909598 () Bool)

(declare-fun res!613918 () Bool)

(assert (=> b!909598 (=> (not res!613918) (not e!509897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53787 (_ BitVec 32)) Bool)

(assert (=> b!909598 (= res!613918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909599 () Bool)

(assert (=> b!909599 (= e!509900 tp_is_empty!18889)))

(declare-fun b!909600 () Bool)

(declare-fun res!613915 () Bool)

(assert (=> b!909600 (=> (not res!613915) (not e!509897))))

(declare-datatypes ((List!18184 0))(
  ( (Nil!18181) (Cons!18180 (h!19326 (_ BitVec 64)) (t!25758 List!18184)) )
))
(declare-fun arrayNoDuplicates!0 (array!53787 (_ BitVec 32) List!18184) Bool)

(assert (=> b!909600 (= res!613915 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18181))))

(declare-fun mapNonEmpty!30052 () Bool)

(declare-fun tp!57682 () Bool)

(assert (=> mapNonEmpty!30052 (= mapRes!30052 (and tp!57682 e!509896))))

(declare-fun mapValue!30052 () ValueCell!8963)

(declare-fun mapRest!30052 () (Array (_ BitVec 32) ValueCell!8963))

(declare-fun mapKey!30052 () (_ BitVec 32))

(assert (=> mapNonEmpty!30052 (= (arr!25850 _values!1152) (store mapRest!30052 mapKey!30052 mapValue!30052))))

(declare-fun mapIsEmpty!30052 () Bool)

(assert (=> mapIsEmpty!30052 mapRes!30052))

(assert (= (and start!77910 res!613917) b!909594))

(assert (= (and b!909594 res!613916) b!909598))

(assert (= (and b!909598 res!613918) b!909600))

(assert (= (and b!909600 res!613915) b!909596))

(assert (= (and b!909595 condMapEmpty!30052) mapIsEmpty!30052))

(assert (= (and b!909595 (not condMapEmpty!30052)) mapNonEmpty!30052))

(get-info :version)

(assert (= (and mapNonEmpty!30052 ((_ is ValueCellFull!8963) mapValue!30052)) b!909597))

(assert (= (and b!909595 ((_ is ValueCellFull!8963) mapDefault!30052)) b!909599))

(assert (= start!77910 b!909595))

(declare-fun m!844223 () Bool)

(assert (=> mapNonEmpty!30052 m!844223))

(declare-fun m!844225 () Bool)

(assert (=> b!909596 m!844225))

(assert (=> b!909596 m!844225))

(declare-fun m!844227 () Bool)

(assert (=> b!909596 m!844227))

(declare-fun m!844229 () Bool)

(assert (=> start!77910 m!844229))

(declare-fun m!844231 () Bool)

(assert (=> start!77910 m!844231))

(declare-fun m!844233 () Bool)

(assert (=> start!77910 m!844233))

(declare-fun m!844235 () Bool)

(assert (=> b!909598 m!844235))

(declare-fun m!844237 () Bool)

(assert (=> b!909600 m!844237))

(check-sat (not b!909598) tp_is_empty!18889 b_and!27015 (not mapNonEmpty!30052) (not b_next!16471) (not b!909596) (not start!77910) (not b!909600))
(check-sat b_and!27015 (not b_next!16471))
