; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77870 () Bool)

(assert start!77870)

(declare-fun b_free!16447 () Bool)

(declare-fun b_next!16447 () Bool)

(assert (=> start!77870 (= b_free!16447 (not b_next!16447))))

(declare-fun tp!57607 () Bool)

(declare-fun b_and!26989 () Bool)

(assert (=> start!77870 (= tp!57607 b_and!26989)))

(declare-fun b!909215 () Bool)

(declare-fun res!613711 () Bool)

(declare-fun e!509646 () Bool)

(assert (=> b!909215 (=> (not res!613711) (not e!509646))))

(declare-datatypes ((array!53737 0))(
  ( (array!53738 (arr!25827 (Array (_ BitVec 32) (_ BitVec 64))) (size!26288 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53737)

(declare-datatypes ((List!18169 0))(
  ( (Nil!18166) (Cons!18165 (h!19311 (_ BitVec 64)) (t!25741 List!18169)) )
))
(declare-fun arrayNoDuplicates!0 (array!53737 (_ BitVec 32) List!18169) Bool)

(assert (=> b!909215 (= res!613711 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18166))))

(declare-fun b!909216 () Bool)

(declare-fun e!509644 () Bool)

(declare-fun e!509647 () Bool)

(declare-fun mapRes!30013 () Bool)

(assert (=> b!909216 (= e!509644 (and e!509647 mapRes!30013))))

(declare-fun condMapEmpty!30013 () Bool)

(declare-datatypes ((V!30119 0))(
  ( (V!30120 (val!9483 Int)) )
))
(declare-datatypes ((ValueCell!8951 0))(
  ( (ValueCellFull!8951 (v!11989 V!30119)) (EmptyCell!8951) )
))
(declare-datatypes ((array!53739 0))(
  ( (array!53740 (arr!25828 (Array (_ BitVec 32) ValueCell!8951)) (size!26289 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53739)

(declare-fun mapDefault!30013 () ValueCell!8951)

(assert (=> b!909216 (= condMapEmpty!30013 (= (arr!25828 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8951)) mapDefault!30013)))))

(declare-fun b!909217 () Bool)

(declare-fun tp_is_empty!18865 () Bool)

(assert (=> b!909217 (= e!509647 tp_is_empty!18865)))

(declare-fun b!909218 () Bool)

(declare-fun e!509648 () Bool)

(assert (=> b!909218 (= e!509648 tp_is_empty!18865)))

(declare-fun b!909219 () Bool)

(declare-fun res!613710 () Bool)

(assert (=> b!909219 (=> (not res!613710) (not e!509646))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!909219 (= res!613710 (and (= (size!26289 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26288 _keys!1386) (size!26289 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909220 () Bool)

(assert (=> b!909220 (= e!509646 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409761 () Bool)

(declare-fun zeroValue!1094 () V!30119)

(declare-fun minValue!1094 () V!30119)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12386 0))(
  ( (tuple2!12387 (_1!6204 (_ BitVec 64)) (_2!6204 V!30119)) )
))
(declare-datatypes ((List!18170 0))(
  ( (Nil!18167) (Cons!18166 (h!19312 tuple2!12386) (t!25742 List!18170)) )
))
(declare-datatypes ((ListLongMap!11073 0))(
  ( (ListLongMap!11074 (toList!5552 List!18170)) )
))
(declare-fun contains!4551 (ListLongMap!11073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2754 (array!53737 array!53739 (_ BitVec 32) (_ BitVec 32) V!30119 V!30119 (_ BitVec 32) Int) ListLongMap!11073)

(assert (=> b!909220 (= lt!409761 (contains!4551 (getCurrentListMap!2754 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909221 () Bool)

(declare-fun res!613709 () Bool)

(assert (=> b!909221 (=> (not res!613709) (not e!509646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53737 (_ BitVec 32)) Bool)

(assert (=> b!909221 (= res!613709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!613708 () Bool)

(assert (=> start!77870 (=> (not res!613708) (not e!509646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77870 (= res!613708 (validMask!0 mask!1756))))

(assert (=> start!77870 e!509646))

(declare-fun array_inv!20254 (array!53739) Bool)

(assert (=> start!77870 (and (array_inv!20254 _values!1152) e!509644)))

(assert (=> start!77870 tp!57607))

(assert (=> start!77870 true))

(assert (=> start!77870 tp_is_empty!18865))

(declare-fun array_inv!20255 (array!53737) Bool)

(assert (=> start!77870 (array_inv!20255 _keys!1386)))

(declare-fun mapNonEmpty!30013 () Bool)

(declare-fun tp!57606 () Bool)

(assert (=> mapNonEmpty!30013 (= mapRes!30013 (and tp!57606 e!509648))))

(declare-fun mapRest!30013 () (Array (_ BitVec 32) ValueCell!8951))

(declare-fun mapValue!30013 () ValueCell!8951)

(declare-fun mapKey!30013 () (_ BitVec 32))

(assert (=> mapNonEmpty!30013 (= (arr!25828 _values!1152) (store mapRest!30013 mapKey!30013 mapValue!30013))))

(declare-fun mapIsEmpty!30013 () Bool)

(assert (=> mapIsEmpty!30013 mapRes!30013))

(assert (= (and start!77870 res!613708) b!909219))

(assert (= (and b!909219 res!613710) b!909221))

(assert (= (and b!909221 res!613709) b!909215))

(assert (= (and b!909215 res!613711) b!909220))

(assert (= (and b!909216 condMapEmpty!30013) mapIsEmpty!30013))

(assert (= (and b!909216 (not condMapEmpty!30013)) mapNonEmpty!30013))

(get-info :version)

(assert (= (and mapNonEmpty!30013 ((_ is ValueCellFull!8951) mapValue!30013)) b!909218))

(assert (= (and b!909216 ((_ is ValueCellFull!8951) mapDefault!30013)) b!909217))

(assert (= start!77870 b!909216))

(declare-fun m!843939 () Bool)

(assert (=> start!77870 m!843939))

(declare-fun m!843941 () Bool)

(assert (=> start!77870 m!843941))

(declare-fun m!843943 () Bool)

(assert (=> start!77870 m!843943))

(declare-fun m!843945 () Bool)

(assert (=> b!909221 m!843945))

(declare-fun m!843947 () Bool)

(assert (=> mapNonEmpty!30013 m!843947))

(declare-fun m!843949 () Bool)

(assert (=> b!909215 m!843949))

(declare-fun m!843951 () Bool)

(assert (=> b!909220 m!843951))

(assert (=> b!909220 m!843951))

(declare-fun m!843953 () Bool)

(assert (=> b!909220 m!843953))

(check-sat tp_is_empty!18865 (not b!909220) (not start!77870) (not b_next!16447) (not mapNonEmpty!30013) (not b!909215) (not b!909221) b_and!26989)
(check-sat b_and!26989 (not b_next!16447))
