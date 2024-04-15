; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78092 () Bool)

(assert start!78092)

(declare-fun b_free!16621 () Bool)

(declare-fun b_next!16621 () Bool)

(assert (=> start!78092 (= b_free!16621 (not b_next!16621))))

(declare-fun tp!58138 () Bool)

(declare-fun b_and!27169 () Bool)

(assert (=> start!78092 (= tp!58138 b_and!27169)))

(declare-fun res!614943 () Bool)

(declare-fun e!511166 () Bool)

(assert (=> start!78092 (=> (not res!614943) (not e!511166))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78092 (= res!614943 (validMask!0 mask!1756))))

(assert (=> start!78092 e!511166))

(declare-datatypes ((V!30351 0))(
  ( (V!30352 (val!9570 Int)) )
))
(declare-datatypes ((ValueCell!9038 0))(
  ( (ValueCellFull!9038 (v!12079 V!30351)) (EmptyCell!9038) )
))
(declare-datatypes ((array!54081 0))(
  ( (array!54082 (arr!25996 (Array (_ BitVec 32) ValueCell!9038)) (size!26457 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54081)

(declare-fun e!511168 () Bool)

(declare-fun array_inv!20384 (array!54081) Bool)

(assert (=> start!78092 (and (array_inv!20384 _values!1152) e!511168)))

(assert (=> start!78092 tp!58138))

(assert (=> start!78092 true))

(declare-fun tp_is_empty!19039 () Bool)

(assert (=> start!78092 tp_is_empty!19039))

(declare-datatypes ((array!54083 0))(
  ( (array!54084 (arr!25997 (Array (_ BitVec 32) (_ BitVec 64))) (size!26458 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54083)

(declare-fun array_inv!20385 (array!54083) Bool)

(assert (=> start!78092 (array_inv!20385 _keys!1386)))

(declare-fun b!911423 () Bool)

(declare-fun e!511169 () Bool)

(declare-fun mapRes!30283 () Bool)

(assert (=> b!911423 (= e!511168 (and e!511169 mapRes!30283))))

(declare-fun condMapEmpty!30283 () Bool)

(declare-fun mapDefault!30283 () ValueCell!9038)

(assert (=> b!911423 (= condMapEmpty!30283 (= (arr!25996 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9038)) mapDefault!30283)))))

(declare-fun mapIsEmpty!30283 () Bool)

(assert (=> mapIsEmpty!30283 mapRes!30283))

(declare-fun b!911424 () Bool)

(declare-fun e!511167 () Bool)

(assert (=> b!911424 (= e!511167 tp_is_empty!19039)))

(declare-fun b!911425 () Bool)

(assert (=> b!911425 (= e!511169 tp_is_empty!19039)))

(declare-fun b!911426 () Bool)

(assert (=> b!911426 (= e!511166 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30351)

(declare-fun lt!410256 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30351)

(declare-datatypes ((tuple2!12510 0))(
  ( (tuple2!12511 (_1!6266 (_ BitVec 64)) (_2!6266 V!30351)) )
))
(declare-datatypes ((List!18292 0))(
  ( (Nil!18289) (Cons!18288 (h!19434 tuple2!12510) (t!25870 List!18292)) )
))
(declare-datatypes ((ListLongMap!11197 0))(
  ( (ListLongMap!11198 (toList!5614 List!18292)) )
))
(declare-fun contains!4616 (ListLongMap!11197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2816 (array!54083 array!54081 (_ BitVec 32) (_ BitVec 32) V!30351 V!30351 (_ BitVec 32) Int) ListLongMap!11197)

(assert (=> b!911426 (= lt!410256 (contains!4616 (getCurrentListMap!2816 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911427 () Bool)

(declare-fun res!614944 () Bool)

(assert (=> b!911427 (=> (not res!614944) (not e!511166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54083 (_ BitVec 32)) Bool)

(assert (=> b!911427 (= res!614944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911428 () Bool)

(declare-fun res!614942 () Bool)

(assert (=> b!911428 (=> (not res!614942) (not e!511166))))

(assert (=> b!911428 (= res!614942 (and (= (size!26457 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26458 _keys!1386) (size!26457 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30283 () Bool)

(declare-fun tp!58137 () Bool)

(assert (=> mapNonEmpty!30283 (= mapRes!30283 (and tp!58137 e!511167))))

(declare-fun mapRest!30283 () (Array (_ BitVec 32) ValueCell!9038))

(declare-fun mapValue!30283 () ValueCell!9038)

(declare-fun mapKey!30283 () (_ BitVec 32))

(assert (=> mapNonEmpty!30283 (= (arr!25996 _values!1152) (store mapRest!30283 mapKey!30283 mapValue!30283))))

(declare-fun b!911429 () Bool)

(declare-fun res!614941 () Bool)

(assert (=> b!911429 (=> (not res!614941) (not e!511166))))

(declare-datatypes ((List!18293 0))(
  ( (Nil!18290) (Cons!18289 (h!19435 (_ BitVec 64)) (t!25871 List!18293)) )
))
(declare-fun arrayNoDuplicates!0 (array!54083 (_ BitVec 32) List!18293) Bool)

(assert (=> b!911429 (= res!614941 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18290))))

(assert (= (and start!78092 res!614943) b!911428))

(assert (= (and b!911428 res!614942) b!911427))

(assert (= (and b!911427 res!614944) b!911429))

(assert (= (and b!911429 res!614941) b!911426))

(assert (= (and b!911423 condMapEmpty!30283) mapIsEmpty!30283))

(assert (= (and b!911423 (not condMapEmpty!30283)) mapNonEmpty!30283))

(get-info :version)

(assert (= (and mapNonEmpty!30283 ((_ is ValueCellFull!9038) mapValue!30283)) b!911424))

(assert (= (and b!911423 ((_ is ValueCellFull!9038) mapDefault!30283)) b!911425))

(assert (= start!78092 b!911423))

(declare-fun m!845601 () Bool)

(assert (=> b!911426 m!845601))

(assert (=> b!911426 m!845601))

(declare-fun m!845603 () Bool)

(assert (=> b!911426 m!845603))

(declare-fun m!845605 () Bool)

(assert (=> b!911427 m!845605))

(declare-fun m!845607 () Bool)

(assert (=> start!78092 m!845607))

(declare-fun m!845609 () Bool)

(assert (=> start!78092 m!845609))

(declare-fun m!845611 () Bool)

(assert (=> start!78092 m!845611))

(declare-fun m!845613 () Bool)

(assert (=> b!911429 m!845613))

(declare-fun m!845615 () Bool)

(assert (=> mapNonEmpty!30283 m!845615))

(check-sat (not mapNonEmpty!30283) (not b!911429) (not b!911426) b_and!27169 (not b_next!16621) tp_is_empty!19039 (not start!78092) (not b!911427))
(check-sat b_and!27169 (not b_next!16621))
