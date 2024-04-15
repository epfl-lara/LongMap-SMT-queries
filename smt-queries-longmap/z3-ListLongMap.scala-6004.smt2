; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77858 () Bool)

(assert start!77858)

(declare-fun b_free!16435 () Bool)

(declare-fun b_next!16435 () Bool)

(assert (=> start!77858 (= b_free!16435 (not b_next!16435))))

(declare-fun tp!57571 () Bool)

(declare-fun b_and!26977 () Bool)

(assert (=> start!77858 (= tp!57571 b_and!26977)))

(declare-fun b!909089 () Bool)

(declare-fun res!613636 () Bool)

(declare-fun e!509555 () Bool)

(assert (=> b!909089 (=> (not res!613636) (not e!509555))))

(declare-datatypes ((array!53713 0))(
  ( (array!53714 (arr!25815 (Array (_ BitVec 32) (_ BitVec 64))) (size!26276 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53713)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53713 (_ BitVec 32)) Bool)

(assert (=> b!909089 (= res!613636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909090 () Bool)

(declare-fun e!509557 () Bool)

(declare-fun tp_is_empty!18853 () Bool)

(assert (=> b!909090 (= e!509557 tp_is_empty!18853)))

(declare-fun b!909091 () Bool)

(declare-fun res!613639 () Bool)

(assert (=> b!909091 (=> (not res!613639) (not e!509555))))

(declare-datatypes ((V!30103 0))(
  ( (V!30104 (val!9477 Int)) )
))
(declare-datatypes ((ValueCell!8945 0))(
  ( (ValueCellFull!8945 (v!11983 V!30103)) (EmptyCell!8945) )
))
(declare-datatypes ((array!53715 0))(
  ( (array!53716 (arr!25816 (Array (_ BitVec 32) ValueCell!8945)) (size!26277 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53715)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909091 (= res!613639 (and (= (size!26277 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26276 _keys!1386) (size!26277 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909092 () Bool)

(declare-fun e!509558 () Bool)

(declare-fun e!509554 () Bool)

(declare-fun mapRes!29995 () Bool)

(assert (=> b!909092 (= e!509558 (and e!509554 mapRes!29995))))

(declare-fun condMapEmpty!29995 () Bool)

(declare-fun mapDefault!29995 () ValueCell!8945)

(assert (=> b!909092 (= condMapEmpty!29995 (= (arr!25816 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8945)) mapDefault!29995)))))

(declare-fun b!909093 () Bool)

(assert (=> b!909093 (= e!509555 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409743 () Bool)

(declare-fun zeroValue!1094 () V!30103)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30103)

(declare-datatypes ((tuple2!12382 0))(
  ( (tuple2!12383 (_1!6202 (_ BitVec 64)) (_2!6202 V!30103)) )
))
(declare-datatypes ((List!18163 0))(
  ( (Nil!18160) (Cons!18159 (h!19305 tuple2!12382) (t!25735 List!18163)) )
))
(declare-datatypes ((ListLongMap!11069 0))(
  ( (ListLongMap!11070 (toList!5550 List!18163)) )
))
(declare-fun contains!4549 (ListLongMap!11069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2752 (array!53713 array!53715 (_ BitVec 32) (_ BitVec 32) V!30103 V!30103 (_ BitVec 32) Int) ListLongMap!11069)

(assert (=> b!909093 (= lt!409743 (contains!4549 (getCurrentListMap!2752 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!29995 () Bool)

(declare-fun tp!57570 () Bool)

(assert (=> mapNonEmpty!29995 (= mapRes!29995 (and tp!57570 e!509557))))

(declare-fun mapRest!29995 () (Array (_ BitVec 32) ValueCell!8945))

(declare-fun mapKey!29995 () (_ BitVec 32))

(declare-fun mapValue!29995 () ValueCell!8945)

(assert (=> mapNonEmpty!29995 (= (arr!25816 _values!1152) (store mapRest!29995 mapKey!29995 mapValue!29995))))

(declare-fun mapIsEmpty!29995 () Bool)

(assert (=> mapIsEmpty!29995 mapRes!29995))

(declare-fun b!909094 () Bool)

(declare-fun res!613637 () Bool)

(assert (=> b!909094 (=> (not res!613637) (not e!509555))))

(declare-datatypes ((List!18164 0))(
  ( (Nil!18161) (Cons!18160 (h!19306 (_ BitVec 64)) (t!25736 List!18164)) )
))
(declare-fun arrayNoDuplicates!0 (array!53713 (_ BitVec 32) List!18164) Bool)

(assert (=> b!909094 (= res!613637 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18161))))

(declare-fun res!613638 () Bool)

(assert (=> start!77858 (=> (not res!613638) (not e!509555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77858 (= res!613638 (validMask!0 mask!1756))))

(assert (=> start!77858 e!509555))

(declare-fun array_inv!20246 (array!53715) Bool)

(assert (=> start!77858 (and (array_inv!20246 _values!1152) e!509558)))

(assert (=> start!77858 tp!57571))

(assert (=> start!77858 true))

(assert (=> start!77858 tp_is_empty!18853))

(declare-fun array_inv!20247 (array!53713) Bool)

(assert (=> start!77858 (array_inv!20247 _keys!1386)))

(declare-fun b!909095 () Bool)

(assert (=> b!909095 (= e!509554 tp_is_empty!18853)))

(assert (= (and start!77858 res!613638) b!909091))

(assert (= (and b!909091 res!613639) b!909089))

(assert (= (and b!909089 res!613636) b!909094))

(assert (= (and b!909094 res!613637) b!909093))

(assert (= (and b!909092 condMapEmpty!29995) mapIsEmpty!29995))

(assert (= (and b!909092 (not condMapEmpty!29995)) mapNonEmpty!29995))

(get-info :version)

(assert (= (and mapNonEmpty!29995 ((_ is ValueCellFull!8945) mapValue!29995)) b!909090))

(assert (= (and b!909092 ((_ is ValueCellFull!8945) mapDefault!29995)) b!909095))

(assert (= start!77858 b!909092))

(declare-fun m!843843 () Bool)

(assert (=> mapNonEmpty!29995 m!843843))

(declare-fun m!843845 () Bool)

(assert (=> start!77858 m!843845))

(declare-fun m!843847 () Bool)

(assert (=> start!77858 m!843847))

(declare-fun m!843849 () Bool)

(assert (=> start!77858 m!843849))

(declare-fun m!843851 () Bool)

(assert (=> b!909094 m!843851))

(declare-fun m!843853 () Bool)

(assert (=> b!909093 m!843853))

(assert (=> b!909093 m!843853))

(declare-fun m!843855 () Bool)

(assert (=> b!909093 m!843855))

(declare-fun m!843857 () Bool)

(assert (=> b!909089 m!843857))

(check-sat (not start!77858) (not mapNonEmpty!29995) b_and!26977 (not b!909093) (not b!909094) (not b!909089) (not b_next!16435) tp_is_empty!18853)
(check-sat b_and!26977 (not b_next!16435))
