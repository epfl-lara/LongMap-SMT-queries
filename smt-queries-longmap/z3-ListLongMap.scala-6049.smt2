; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78382 () Bool)

(assert start!78382)

(declare-fun b_free!16705 () Bool)

(declare-fun b_next!16705 () Bool)

(assert (=> start!78382 (= b_free!16705 (not b_next!16705))))

(declare-fun tp!58393 () Bool)

(declare-fun b_and!27291 () Bool)

(assert (=> start!78382 (= tp!58393 b_and!27291)))

(declare-fun b!913736 () Bool)

(declare-fun res!616123 () Bool)

(declare-fun e!512607 () Bool)

(assert (=> b!913736 (=> (not res!616123) (not e!512607))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913736 (= res!616123 (inRange!0 i!717 mask!1756))))

(declare-fun res!616121 () Bool)

(assert (=> start!78382 (=> (not res!616121) (not e!512607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78382 (= res!616121 (validMask!0 mask!1756))))

(assert (=> start!78382 e!512607))

(declare-datatypes ((V!30463 0))(
  ( (V!30464 (val!9612 Int)) )
))
(declare-datatypes ((ValueCell!9080 0))(
  ( (ValueCellFull!9080 (v!12120 V!30463)) (EmptyCell!9080) )
))
(declare-datatypes ((array!54293 0))(
  ( (array!54294 (arr!26096 (Array (_ BitVec 32) ValueCell!9080)) (size!26556 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54293)

(declare-fun e!512606 () Bool)

(declare-fun array_inv!20472 (array!54293) Bool)

(assert (=> start!78382 (and (array_inv!20472 _values!1152) e!512606)))

(assert (=> start!78382 tp!58393))

(assert (=> start!78382 true))

(declare-fun tp_is_empty!19123 () Bool)

(assert (=> start!78382 tp_is_empty!19123))

(declare-datatypes ((array!54295 0))(
  ( (array!54296 (arr!26097 (Array (_ BitVec 32) (_ BitVec 64))) (size!26557 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54295)

(declare-fun array_inv!20473 (array!54295) Bool)

(assert (=> start!78382 (array_inv!20473 _keys!1386)))

(declare-fun b!913737 () Bool)

(declare-fun e!512610 () Bool)

(declare-fun mapRes!30412 () Bool)

(assert (=> b!913737 (= e!512606 (and e!512610 mapRes!30412))))

(declare-fun condMapEmpty!30412 () Bool)

(declare-fun mapDefault!30412 () ValueCell!9080)

(assert (=> b!913737 (= condMapEmpty!30412 (= (arr!26096 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9080)) mapDefault!30412)))))

(declare-fun b!913738 () Bool)

(declare-fun res!616120 () Bool)

(assert (=> b!913738 (=> (not res!616120) (not e!512607))))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!913738 (= res!616120 (and (= (select (arr!26097 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913739 () Bool)

(declare-fun res!616119 () Bool)

(assert (=> b!913739 (=> (not res!616119) (not e!512607))))

(declare-datatypes ((List!18297 0))(
  ( (Nil!18294) (Cons!18293 (h!19445 (_ BitVec 64)) (t!25878 List!18297)) )
))
(declare-fun arrayNoDuplicates!0 (array!54295 (_ BitVec 32) List!18297) Bool)

(assert (=> b!913739 (= res!616119 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18294))))

(declare-fun b!913740 () Bool)

(declare-fun res!616118 () Bool)

(assert (=> b!913740 (=> (not res!616118) (not e!512607))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!913740 (= res!616118 (and (= (size!26556 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26557 _keys!1386) (size!26556 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913741 () Bool)

(assert (=> b!913741 (= e!512607 (not true))))

(declare-fun arrayContainsKey!0 (array!54295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913741 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30463)

(declare-fun minValue!1094 () V!30463)

(declare-datatypes ((Unit!30876 0))(
  ( (Unit!30877) )
))
(declare-fun lt!411069 () Unit!30876)

(declare-fun lemmaKeyInListMapIsInArray!269 (array!54295 array!54293 (_ BitVec 32) (_ BitVec 32) V!30463 V!30463 (_ BitVec 64) Int) Unit!30876)

(assert (=> b!913741 (= lt!411069 (lemmaKeyInListMapIsInArray!269 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapNonEmpty!30412 () Bool)

(declare-fun tp!58392 () Bool)

(declare-fun e!512608 () Bool)

(assert (=> mapNonEmpty!30412 (= mapRes!30412 (and tp!58392 e!512608))))

(declare-fun mapRest!30412 () (Array (_ BitVec 32) ValueCell!9080))

(declare-fun mapKey!30412 () (_ BitVec 32))

(declare-fun mapValue!30412 () ValueCell!9080)

(assert (=> mapNonEmpty!30412 (= (arr!26096 _values!1152) (store mapRest!30412 mapKey!30412 mapValue!30412))))

(declare-fun b!913742 () Bool)

(declare-fun res!616124 () Bool)

(assert (=> b!913742 (=> (not res!616124) (not e!512607))))

(declare-datatypes ((tuple2!12478 0))(
  ( (tuple2!12479 (_1!6250 (_ BitVec 64)) (_2!6250 V!30463)) )
))
(declare-datatypes ((List!18298 0))(
  ( (Nil!18295) (Cons!18294 (h!19446 tuple2!12478) (t!25879 List!18298)) )
))
(declare-datatypes ((ListLongMap!11177 0))(
  ( (ListLongMap!11178 (toList!5604 List!18298)) )
))
(declare-fun contains!4659 (ListLongMap!11177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2865 (array!54295 array!54293 (_ BitVec 32) (_ BitVec 32) V!30463 V!30463 (_ BitVec 32) Int) ListLongMap!11177)

(assert (=> b!913742 (= res!616124 (contains!4659 (getCurrentListMap!2865 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913743 () Bool)

(assert (=> b!913743 (= e!512610 tp_is_empty!19123)))

(declare-fun mapIsEmpty!30412 () Bool)

(assert (=> mapIsEmpty!30412 mapRes!30412))

(declare-fun b!913744 () Bool)

(declare-fun res!616122 () Bool)

(assert (=> b!913744 (=> (not res!616122) (not e!512607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54295 (_ BitVec 32)) Bool)

(assert (=> b!913744 (= res!616122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913745 () Bool)

(assert (=> b!913745 (= e!512608 tp_is_empty!19123)))

(assert (= (and start!78382 res!616121) b!913740))

(assert (= (and b!913740 res!616118) b!913744))

(assert (= (and b!913744 res!616122) b!913739))

(assert (= (and b!913739 res!616119) b!913742))

(assert (= (and b!913742 res!616124) b!913736))

(assert (= (and b!913736 res!616123) b!913738))

(assert (= (and b!913738 res!616120) b!913741))

(assert (= (and b!913737 condMapEmpty!30412) mapIsEmpty!30412))

(assert (= (and b!913737 (not condMapEmpty!30412)) mapNonEmpty!30412))

(get-info :version)

(assert (= (and mapNonEmpty!30412 ((_ is ValueCellFull!9080) mapValue!30412)) b!913745))

(assert (= (and b!913737 ((_ is ValueCellFull!9080) mapDefault!30412)) b!913743))

(assert (= start!78382 b!913737))

(declare-fun m!848553 () Bool)

(assert (=> b!913741 m!848553))

(declare-fun m!848555 () Bool)

(assert (=> b!913741 m!848555))

(declare-fun m!848557 () Bool)

(assert (=> b!913736 m!848557))

(declare-fun m!848559 () Bool)

(assert (=> b!913739 m!848559))

(declare-fun m!848561 () Bool)

(assert (=> mapNonEmpty!30412 m!848561))

(declare-fun m!848563 () Bool)

(assert (=> b!913744 m!848563))

(declare-fun m!848565 () Bool)

(assert (=> b!913742 m!848565))

(assert (=> b!913742 m!848565))

(declare-fun m!848567 () Bool)

(assert (=> b!913742 m!848567))

(declare-fun m!848569 () Bool)

(assert (=> start!78382 m!848569))

(declare-fun m!848571 () Bool)

(assert (=> start!78382 m!848571))

(declare-fun m!848573 () Bool)

(assert (=> start!78382 m!848573))

(declare-fun m!848575 () Bool)

(assert (=> b!913738 m!848575))

(check-sat (not mapNonEmpty!30412) (not b!913739) (not b!913744) (not start!78382) (not b!913742) tp_is_empty!19123 (not b_next!16705) b_and!27291 (not b!913741) (not b!913736))
(check-sat b_and!27291 (not b_next!16705))
