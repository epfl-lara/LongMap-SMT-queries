; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77954 () Bool)

(assert start!77954)

(declare-fun b_free!16497 () Bool)

(declare-fun b_next!16497 () Bool)

(assert (=> start!77954 (= b_free!16497 (not b_next!16497))))

(declare-fun tp!57759 () Bool)

(declare-fun b_and!27067 () Bool)

(assert (=> start!77954 (= tp!57759 b_and!27067)))

(declare-fun mapIsEmpty!30091 () Bool)

(declare-fun mapRes!30091 () Bool)

(assert (=> mapIsEmpty!30091 mapRes!30091))

(declare-fun mapNonEmpty!30091 () Bool)

(declare-fun tp!57758 () Bool)

(declare-fun e!510239 () Bool)

(assert (=> mapNonEmpty!30091 (= mapRes!30091 (and tp!57758 e!510239))))

(declare-datatypes ((V!30185 0))(
  ( (V!30186 (val!9508 Int)) )
))
(declare-datatypes ((ValueCell!8976 0))(
  ( (ValueCellFull!8976 (v!12016 V!30185)) (EmptyCell!8976) )
))
(declare-fun mapRest!30091 () (Array (_ BitVec 32) ValueCell!8976))

(declare-fun mapKey!30091 () (_ BitVec 32))

(declare-datatypes ((array!53850 0))(
  ( (array!53851 (arr!25882 (Array (_ BitVec 32) ValueCell!8976)) (size!26341 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53850)

(declare-fun mapValue!30091 () ValueCell!8976)

(assert (=> mapNonEmpty!30091 (= (arr!25882 _values!1152) (store mapRest!30091 mapKey!30091 mapValue!30091))))

(declare-fun b!910106 () Bool)

(declare-fun tp_is_empty!18915 () Bool)

(assert (=> b!910106 (= e!510239 tp_is_empty!18915)))

(declare-fun b!910107 () Bool)

(declare-fun e!510243 () Bool)

(declare-fun e!510242 () Bool)

(assert (=> b!910107 (= e!510243 (and e!510242 mapRes!30091))))

(declare-fun condMapEmpty!30091 () Bool)

(declare-fun mapDefault!30091 () ValueCell!8976)

(assert (=> b!910107 (= condMapEmpty!30091 (= (arr!25882 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8976)) mapDefault!30091)))))

(declare-fun b!910108 () Bool)

(declare-fun res!614181 () Bool)

(declare-fun e!510241 () Bool)

(assert (=> b!910108 (=> (not res!614181) (not e!510241))))

(declare-datatypes ((array!53852 0))(
  ( (array!53853 (arr!25883 (Array (_ BitVec 32) (_ BitVec 64))) (size!26342 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53852)

(declare-datatypes ((List!18182 0))(
  ( (Nil!18179) (Cons!18178 (h!19324 (_ BitVec 64)) (t!25765 List!18182)) )
))
(declare-fun arrayNoDuplicates!0 (array!53852 (_ BitVec 32) List!18182) Bool)

(assert (=> b!910108 (= res!614181 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18179))))

(declare-fun res!614183 () Bool)

(assert (=> start!77954 (=> (not res!614183) (not e!510241))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77954 (= res!614183 (validMask!0 mask!1756))))

(assert (=> start!77954 e!510241))

(declare-fun array_inv!20244 (array!53850) Bool)

(assert (=> start!77954 (and (array_inv!20244 _values!1152) e!510243)))

(assert (=> start!77954 tp!57759))

(assert (=> start!77954 true))

(assert (=> start!77954 tp_is_empty!18915))

(declare-fun array_inv!20245 (array!53852) Bool)

(assert (=> start!77954 (array_inv!20245 _keys!1386)))

(declare-fun b!910109 () Bool)

(assert (=> b!910109 (= e!510241 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410150 () Bool)

(declare-fun zeroValue!1094 () V!30185)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30185)

(declare-datatypes ((tuple2!12392 0))(
  ( (tuple2!12393 (_1!6207 (_ BitVec 64)) (_2!6207 V!30185)) )
))
(declare-datatypes ((List!18183 0))(
  ( (Nil!18180) (Cons!18179 (h!19325 tuple2!12392) (t!25766 List!18183)) )
))
(declare-datatypes ((ListLongMap!11089 0))(
  ( (ListLongMap!11090 (toList!5560 List!18183)) )
))
(declare-fun contains!4603 (ListLongMap!11089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2822 (array!53852 array!53850 (_ BitVec 32) (_ BitVec 32) V!30185 V!30185 (_ BitVec 32) Int) ListLongMap!11089)

(assert (=> b!910109 (= lt!410150 (contains!4603 (getCurrentListMap!2822 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910110 () Bool)

(declare-fun res!614184 () Bool)

(assert (=> b!910110 (=> (not res!614184) (not e!510241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53852 (_ BitVec 32)) Bool)

(assert (=> b!910110 (= res!614184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910111 () Bool)

(declare-fun res!614182 () Bool)

(assert (=> b!910111 (=> (not res!614182) (not e!510241))))

(assert (=> b!910111 (= res!614182 (and (= (size!26341 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26342 _keys!1386) (size!26341 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910112 () Bool)

(assert (=> b!910112 (= e!510242 tp_is_empty!18915)))

(assert (= (and start!77954 res!614183) b!910111))

(assert (= (and b!910111 res!614182) b!910110))

(assert (= (and b!910110 res!614184) b!910108))

(assert (= (and b!910108 res!614181) b!910109))

(assert (= (and b!910107 condMapEmpty!30091) mapIsEmpty!30091))

(assert (= (and b!910107 (not condMapEmpty!30091)) mapNonEmpty!30091))

(get-info :version)

(assert (= (and mapNonEmpty!30091 ((_ is ValueCellFull!8976) mapValue!30091)) b!910106))

(assert (= (and b!910107 ((_ is ValueCellFull!8976) mapDefault!30091)) b!910112))

(assert (= start!77954 b!910107))

(declare-fun m!845189 () Bool)

(assert (=> start!77954 m!845189))

(declare-fun m!845191 () Bool)

(assert (=> start!77954 m!845191))

(declare-fun m!845193 () Bool)

(assert (=> start!77954 m!845193))

(declare-fun m!845195 () Bool)

(assert (=> b!910108 m!845195))

(declare-fun m!845197 () Bool)

(assert (=> b!910110 m!845197))

(declare-fun m!845199 () Bool)

(assert (=> mapNonEmpty!30091 m!845199))

(declare-fun m!845201 () Bool)

(assert (=> b!910109 m!845201))

(assert (=> b!910109 m!845201))

(declare-fun m!845203 () Bool)

(assert (=> b!910109 m!845203))

(check-sat (not mapNonEmpty!30091) (not start!77954) (not b!910108) b_and!27067 (not b_next!16497) tp_is_empty!18915 (not b!910109) (not b!910110))
(check-sat b_and!27067 (not b_next!16497))
