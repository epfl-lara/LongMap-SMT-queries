; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78178 () Bool)

(assert start!78178)

(declare-fun b_free!16537 () Bool)

(declare-fun b_next!16537 () Bool)

(assert (=> start!78178 (= b_free!16537 (not b_next!16537))))

(declare-fun tp!57882 () Bool)

(declare-fun b_and!27119 () Bool)

(assert (=> start!78178 (= tp!57882 b_and!27119)))

(declare-fun res!614830 () Bool)

(declare-fun e!511194 () Bool)

(assert (=> start!78178 (=> (not res!614830) (not e!511194))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78178 (= res!614830 (validMask!0 mask!1756))))

(assert (=> start!78178 e!511194))

(declare-datatypes ((V!30239 0))(
  ( (V!30240 (val!9528 Int)) )
))
(declare-datatypes ((ValueCell!8996 0))(
  ( (ValueCellFull!8996 (v!12034 V!30239)) (EmptyCell!8996) )
))
(declare-datatypes ((array!53981 0))(
  ( (array!53982 (arr!25942 (Array (_ BitVec 32) ValueCell!8996)) (size!26402 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53981)

(declare-fun e!511195 () Bool)

(declare-fun array_inv!20354 (array!53981) Bool)

(assert (=> start!78178 (and (array_inv!20354 _values!1152) e!511195)))

(assert (=> start!78178 tp!57882))

(assert (=> start!78178 true))

(declare-fun tp_is_empty!18955 () Bool)

(assert (=> start!78178 tp_is_empty!18955))

(declare-datatypes ((array!53983 0))(
  ( (array!53984 (arr!25943 (Array (_ BitVec 32) (_ BitVec 64))) (size!26403 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53983)

(declare-fun array_inv!20355 (array!53983) Bool)

(assert (=> start!78178 (array_inv!20355 _keys!1386)))

(declare-fun b!911556 () Bool)

(declare-fun e!511193 () Bool)

(assert (=> b!911556 (= e!511193 tp_is_empty!18955)))

(declare-fun mapNonEmpty!30154 () Bool)

(declare-fun mapRes!30154 () Bool)

(declare-fun tp!57883 () Bool)

(assert (=> mapNonEmpty!30154 (= mapRes!30154 (and tp!57883 e!511193))))

(declare-fun mapRest!30154 () (Array (_ BitVec 32) ValueCell!8996))

(declare-fun mapValue!30154 () ValueCell!8996)

(declare-fun mapKey!30154 () (_ BitVec 32))

(assert (=> mapNonEmpty!30154 (= (arr!25942 _values!1152) (store mapRest!30154 mapKey!30154 mapValue!30154))))

(declare-fun b!911557 () Bool)

(declare-fun e!511197 () Bool)

(assert (=> b!911557 (= e!511195 (and e!511197 mapRes!30154))))

(declare-fun condMapEmpty!30154 () Bool)

(declare-fun mapDefault!30154 () ValueCell!8996)

(assert (=> b!911557 (= condMapEmpty!30154 (= (arr!25942 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8996)) mapDefault!30154)))))

(declare-fun b!911558 () Bool)

(assert (=> b!911558 (= e!511194 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30239)

(declare-fun lt!410649 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30239)

(declare-datatypes ((tuple2!12374 0))(
  ( (tuple2!12375 (_1!6198 (_ BitVec 64)) (_2!6198 V!30239)) )
))
(declare-datatypes ((List!18193 0))(
  ( (Nil!18190) (Cons!18189 (h!19341 tuple2!12374) (t!25770 List!18193)) )
))
(declare-datatypes ((ListLongMap!11073 0))(
  ( (ListLongMap!11074 (toList!5552 List!18193)) )
))
(declare-fun contains!4605 (ListLongMap!11073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2813 (array!53983 array!53981 (_ BitVec 32) (_ BitVec 32) V!30239 V!30239 (_ BitVec 32) Int) ListLongMap!11073)

(assert (=> b!911558 (= lt!410649 (contains!4605 (getCurrentListMap!2813 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30154 () Bool)

(assert (=> mapIsEmpty!30154 mapRes!30154))

(declare-fun b!911559 () Bool)

(declare-fun res!614828 () Bool)

(assert (=> b!911559 (=> (not res!614828) (not e!511194))))

(declare-datatypes ((List!18194 0))(
  ( (Nil!18191) (Cons!18190 (h!19342 (_ BitVec 64)) (t!25771 List!18194)) )
))
(declare-fun arrayNoDuplicates!0 (array!53983 (_ BitVec 32) List!18194) Bool)

(assert (=> b!911559 (= res!614828 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18191))))

(declare-fun b!911560 () Bool)

(declare-fun res!614831 () Bool)

(assert (=> b!911560 (=> (not res!614831) (not e!511194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53983 (_ BitVec 32)) Bool)

(assert (=> b!911560 (= res!614831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911561 () Bool)

(declare-fun res!614829 () Bool)

(assert (=> b!911561 (=> (not res!614829) (not e!511194))))

(assert (=> b!911561 (= res!614829 (and (= (size!26402 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26403 _keys!1386) (size!26402 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911562 () Bool)

(assert (=> b!911562 (= e!511197 tp_is_empty!18955)))

(assert (= (and start!78178 res!614830) b!911561))

(assert (= (and b!911561 res!614829) b!911560))

(assert (= (and b!911560 res!614831) b!911559))

(assert (= (and b!911559 res!614828) b!911558))

(assert (= (and b!911557 condMapEmpty!30154) mapIsEmpty!30154))

(assert (= (and b!911557 (not condMapEmpty!30154)) mapNonEmpty!30154))

(get-info :version)

(assert (= (and mapNonEmpty!30154 ((_ is ValueCellFull!8996) mapValue!30154)) b!911556))

(assert (= (and b!911557 ((_ is ValueCellFull!8996) mapDefault!30154)) b!911562))

(assert (= start!78178 b!911557))

(declare-fun m!846895 () Bool)

(assert (=> mapNonEmpty!30154 m!846895))

(declare-fun m!846897 () Bool)

(assert (=> start!78178 m!846897))

(declare-fun m!846899 () Bool)

(assert (=> start!78178 m!846899))

(declare-fun m!846901 () Bool)

(assert (=> start!78178 m!846901))

(declare-fun m!846903 () Bool)

(assert (=> b!911560 m!846903))

(declare-fun m!846905 () Bool)

(assert (=> b!911558 m!846905))

(assert (=> b!911558 m!846905))

(declare-fun m!846907 () Bool)

(assert (=> b!911558 m!846907))

(declare-fun m!846909 () Bool)

(assert (=> b!911559 m!846909))

(check-sat tp_is_empty!18955 (not start!78178) (not b!911558) (not mapNonEmpty!30154) b_and!27119 (not b!911559) (not b!911560) (not b_next!16537))
(check-sat b_and!27119 (not b_next!16537))
