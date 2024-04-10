; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78066 () Bool)

(assert start!78066)

(declare-fun b_free!16593 () Bool)

(declare-fun b_next!16593 () Bool)

(assert (=> start!78066 (= b_free!16593 (not b_next!16593))))

(declare-fun tp!58050 () Bool)

(declare-fun b_and!27165 () Bool)

(assert (=> start!78066 (= tp!58050 b_and!27165)))

(declare-fun b!911241 () Bool)

(declare-fun res!614822 () Bool)

(declare-fun e!511032 () Bool)

(assert (=> b!911241 (=> (not res!614822) (not e!511032))))

(declare-datatypes ((V!30313 0))(
  ( (V!30314 (val!9556 Int)) )
))
(declare-datatypes ((ValueCell!9024 0))(
  ( (ValueCellFull!9024 (v!12065 V!30313)) (EmptyCell!9024) )
))
(declare-datatypes ((array!54024 0))(
  ( (array!54025 (arr!25968 (Array (_ BitVec 32) ValueCell!9024)) (size!26427 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54024)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54026 0))(
  ( (array!54027 (arr!25969 (Array (_ BitVec 32) (_ BitVec 64))) (size!26428 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54026)

(assert (=> b!911241 (= res!614822 (and (= (size!26427 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26428 _keys!1386) (size!26427 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911242 () Bool)

(declare-fun res!614821 () Bool)

(assert (=> b!911242 (=> (not res!614821) (not e!511032))))

(declare-datatypes ((List!18240 0))(
  ( (Nil!18237) (Cons!18236 (h!19382 (_ BitVec 64)) (t!25825 List!18240)) )
))
(declare-fun arrayNoDuplicates!0 (array!54026 (_ BitVec 32) List!18240) Bool)

(assert (=> b!911242 (= res!614821 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18237))))

(declare-fun res!614823 () Bool)

(assert (=> start!78066 (=> (not res!614823) (not e!511032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78066 (= res!614823 (validMask!0 mask!1756))))

(assert (=> start!78066 e!511032))

(declare-fun e!511031 () Bool)

(declare-fun array_inv!20300 (array!54024) Bool)

(assert (=> start!78066 (and (array_inv!20300 _values!1152) e!511031)))

(assert (=> start!78066 tp!58050))

(assert (=> start!78066 true))

(declare-fun tp_is_empty!19011 () Bool)

(assert (=> start!78066 tp_is_empty!19011))

(declare-fun array_inv!20301 (array!54026) Bool)

(assert (=> start!78066 (array_inv!20301 _keys!1386)))

(declare-fun b!911243 () Bool)

(declare-fun res!614820 () Bool)

(assert (=> b!911243 (=> (not res!614820) (not e!511032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54026 (_ BitVec 32)) Bool)

(assert (=> b!911243 (= res!614820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911244 () Bool)

(declare-fun e!511035 () Bool)

(assert (=> b!911244 (= e!511035 tp_is_empty!19011)))

(declare-fun b!911245 () Bool)

(assert (=> b!911245 (= e!511032 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410372 () Bool)

(declare-fun zeroValue!1094 () V!30313)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30313)

(declare-datatypes ((tuple2!12450 0))(
  ( (tuple2!12451 (_1!6236 (_ BitVec 64)) (_2!6236 V!30313)) )
))
(declare-datatypes ((List!18241 0))(
  ( (Nil!18238) (Cons!18237 (h!19383 tuple2!12450) (t!25826 List!18241)) )
))
(declare-datatypes ((ListLongMap!11147 0))(
  ( (ListLongMap!11148 (toList!5589 List!18241)) )
))
(declare-fun contains!4633 (ListLongMap!11147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2851 (array!54026 array!54024 (_ BitVec 32) (_ BitVec 32) V!30313 V!30313 (_ BitVec 32) Int) ListLongMap!11147)

(assert (=> b!911245 (= lt!410372 (contains!4633 (getCurrentListMap!2851 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911246 () Bool)

(declare-fun e!511034 () Bool)

(assert (=> b!911246 (= e!511034 tp_is_empty!19011)))

(declare-fun mapIsEmpty!30238 () Bool)

(declare-fun mapRes!30238 () Bool)

(assert (=> mapIsEmpty!30238 mapRes!30238))

(declare-fun mapNonEmpty!30238 () Bool)

(declare-fun tp!58049 () Bool)

(assert (=> mapNonEmpty!30238 (= mapRes!30238 (and tp!58049 e!511035))))

(declare-fun mapKey!30238 () (_ BitVec 32))

(declare-fun mapValue!30238 () ValueCell!9024)

(declare-fun mapRest!30238 () (Array (_ BitVec 32) ValueCell!9024))

(assert (=> mapNonEmpty!30238 (= (arr!25968 _values!1152) (store mapRest!30238 mapKey!30238 mapValue!30238))))

(declare-fun b!911247 () Bool)

(assert (=> b!911247 (= e!511031 (and e!511034 mapRes!30238))))

(declare-fun condMapEmpty!30238 () Bool)

(declare-fun mapDefault!30238 () ValueCell!9024)

(assert (=> b!911247 (= condMapEmpty!30238 (= (arr!25968 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9024)) mapDefault!30238)))))

(assert (= (and start!78066 res!614823) b!911241))

(assert (= (and b!911241 res!614822) b!911243))

(assert (= (and b!911243 res!614820) b!911242))

(assert (= (and b!911242 res!614821) b!911245))

(assert (= (and b!911247 condMapEmpty!30238) mapIsEmpty!30238))

(assert (= (and b!911247 (not condMapEmpty!30238)) mapNonEmpty!30238))

(get-info :version)

(assert (= (and mapNonEmpty!30238 ((_ is ValueCellFull!9024) mapValue!30238)) b!911244))

(assert (= (and b!911247 ((_ is ValueCellFull!9024) mapDefault!30238)) b!911246))

(assert (= start!78066 b!911247))

(declare-fun m!846049 () Bool)

(assert (=> start!78066 m!846049))

(declare-fun m!846051 () Bool)

(assert (=> start!78066 m!846051))

(declare-fun m!846053 () Bool)

(assert (=> start!78066 m!846053))

(declare-fun m!846055 () Bool)

(assert (=> b!911242 m!846055))

(declare-fun m!846057 () Bool)

(assert (=> mapNonEmpty!30238 m!846057))

(declare-fun m!846059 () Bool)

(assert (=> b!911243 m!846059))

(declare-fun m!846061 () Bool)

(assert (=> b!911245 m!846061))

(assert (=> b!911245 m!846061))

(declare-fun m!846063 () Bool)

(assert (=> b!911245 m!846063))

(check-sat (not start!78066) (not b!911245) tp_is_empty!19011 (not mapNonEmpty!30238) (not b!911242) (not b_next!16593) b_and!27165 (not b!911243))
(check-sat b_and!27165 (not b_next!16593))
