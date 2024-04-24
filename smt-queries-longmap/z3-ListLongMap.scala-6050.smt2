; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78388 () Bool)

(assert start!78388)

(declare-fun b_free!16711 () Bool)

(declare-fun b_next!16711 () Bool)

(assert (=> start!78388 (= b_free!16711 (not b_next!16711))))

(declare-fun tp!58410 () Bool)

(declare-fun b_and!27297 () Bool)

(assert (=> start!78388 (= tp!58410 b_and!27297)))

(declare-fun b!913826 () Bool)

(declare-fun res!616185 () Bool)

(declare-fun e!512653 () Bool)

(assert (=> b!913826 (=> (not res!616185) (not e!512653))))

(declare-datatypes ((V!30471 0))(
  ( (V!30472 (val!9615 Int)) )
))
(declare-datatypes ((ValueCell!9083 0))(
  ( (ValueCellFull!9083 (v!12123 V!30471)) (EmptyCell!9083) )
))
(declare-datatypes ((array!54305 0))(
  ( (array!54306 (arr!26102 (Array (_ BitVec 32) ValueCell!9083)) (size!26562 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54305)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30471)

(declare-datatypes ((array!54307 0))(
  ( (array!54308 (arr!26103 (Array (_ BitVec 32) (_ BitVec 64))) (size!26563 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54307)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30471)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12484 0))(
  ( (tuple2!12485 (_1!6253 (_ BitVec 64)) (_2!6253 V!30471)) )
))
(declare-datatypes ((List!18302 0))(
  ( (Nil!18299) (Cons!18298 (h!19450 tuple2!12484) (t!25883 List!18302)) )
))
(declare-datatypes ((ListLongMap!11183 0))(
  ( (ListLongMap!11184 (toList!5607 List!18302)) )
))
(declare-fun contains!4662 (ListLongMap!11183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2868 (array!54307 array!54305 (_ BitVec 32) (_ BitVec 32) V!30471 V!30471 (_ BitVec 32) Int) ListLongMap!11183)

(assert (=> b!913826 (= res!616185 (contains!4662 (getCurrentListMap!2868 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913827 () Bool)

(declare-fun res!616182 () Bool)

(assert (=> b!913827 (=> (not res!616182) (not e!512653))))

(assert (=> b!913827 (= res!616182 (and (= (size!26562 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26563 _keys!1386) (size!26562 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30421 () Bool)

(declare-fun mapRes!30421 () Bool)

(assert (=> mapIsEmpty!30421 mapRes!30421))

(declare-fun b!913828 () Bool)

(declare-fun res!616184 () Bool)

(assert (=> b!913828 (=> (not res!616184) (not e!512653))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913828 (= res!616184 (inRange!0 i!717 mask!1756))))

(declare-fun b!913829 () Bool)

(declare-fun res!616186 () Bool)

(assert (=> b!913829 (=> (not res!616186) (not e!512653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54307 (_ BitVec 32)) Bool)

(assert (=> b!913829 (= res!616186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30421 () Bool)

(declare-fun tp!58411 () Bool)

(declare-fun e!512651 () Bool)

(assert (=> mapNonEmpty!30421 (= mapRes!30421 (and tp!58411 e!512651))))

(declare-fun mapRest!30421 () (Array (_ BitVec 32) ValueCell!9083))

(declare-fun mapValue!30421 () ValueCell!9083)

(declare-fun mapKey!30421 () (_ BitVec 32))

(assert (=> mapNonEmpty!30421 (= (arr!26102 _values!1152) (store mapRest!30421 mapKey!30421 mapValue!30421))))

(declare-fun b!913830 () Bool)

(declare-fun res!616187 () Bool)

(assert (=> b!913830 (=> (not res!616187) (not e!512653))))

(assert (=> b!913830 (= res!616187 (and (= (select (arr!26103 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913831 () Bool)

(declare-fun e!512654 () Bool)

(declare-fun e!512652 () Bool)

(assert (=> b!913831 (= e!512654 (and e!512652 mapRes!30421))))

(declare-fun condMapEmpty!30421 () Bool)

(declare-fun mapDefault!30421 () ValueCell!9083)

(assert (=> b!913831 (= condMapEmpty!30421 (= (arr!26102 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9083)) mapDefault!30421)))))

(declare-fun b!913832 () Bool)

(assert (=> b!913832 (= e!512653 (not true))))

(declare-fun arrayContainsKey!0 (array!54307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913832 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30882 0))(
  ( (Unit!30883) )
))
(declare-fun lt!411078 () Unit!30882)

(declare-fun lemmaKeyInListMapIsInArray!272 (array!54307 array!54305 (_ BitVec 32) (_ BitVec 32) V!30471 V!30471 (_ BitVec 64) Int) Unit!30882)

(assert (=> b!913832 (= lt!411078 (lemmaKeyInListMapIsInArray!272 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!616181 () Bool)

(assert (=> start!78388 (=> (not res!616181) (not e!512653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78388 (= res!616181 (validMask!0 mask!1756))))

(assert (=> start!78388 e!512653))

(declare-fun array_inv!20476 (array!54305) Bool)

(assert (=> start!78388 (and (array_inv!20476 _values!1152) e!512654)))

(assert (=> start!78388 tp!58410))

(assert (=> start!78388 true))

(declare-fun tp_is_empty!19129 () Bool)

(assert (=> start!78388 tp_is_empty!19129))

(declare-fun array_inv!20477 (array!54307) Bool)

(assert (=> start!78388 (array_inv!20477 _keys!1386)))

(declare-fun b!913833 () Bool)

(declare-fun res!616183 () Bool)

(assert (=> b!913833 (=> (not res!616183) (not e!512653))))

(declare-datatypes ((List!18303 0))(
  ( (Nil!18300) (Cons!18299 (h!19451 (_ BitVec 64)) (t!25884 List!18303)) )
))
(declare-fun arrayNoDuplicates!0 (array!54307 (_ BitVec 32) List!18303) Bool)

(assert (=> b!913833 (= res!616183 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18300))))

(declare-fun b!913834 () Bool)

(assert (=> b!913834 (= e!512651 tp_is_empty!19129)))

(declare-fun b!913835 () Bool)

(assert (=> b!913835 (= e!512652 tp_is_empty!19129)))

(assert (= (and start!78388 res!616181) b!913827))

(assert (= (and b!913827 res!616182) b!913829))

(assert (= (and b!913829 res!616186) b!913833))

(assert (= (and b!913833 res!616183) b!913826))

(assert (= (and b!913826 res!616185) b!913828))

(assert (= (and b!913828 res!616184) b!913830))

(assert (= (and b!913830 res!616187) b!913832))

(assert (= (and b!913831 condMapEmpty!30421) mapIsEmpty!30421))

(assert (= (and b!913831 (not condMapEmpty!30421)) mapNonEmpty!30421))

(get-info :version)

(assert (= (and mapNonEmpty!30421 ((_ is ValueCellFull!9083) mapValue!30421)) b!913834))

(assert (= (and b!913831 ((_ is ValueCellFull!9083) mapDefault!30421)) b!913835))

(assert (= start!78388 b!913831))

(declare-fun m!848625 () Bool)

(assert (=> b!913833 m!848625))

(declare-fun m!848627 () Bool)

(assert (=> b!913832 m!848627))

(declare-fun m!848629 () Bool)

(assert (=> b!913832 m!848629))

(declare-fun m!848631 () Bool)

(assert (=> b!913828 m!848631))

(declare-fun m!848633 () Bool)

(assert (=> b!913829 m!848633))

(declare-fun m!848635 () Bool)

(assert (=> mapNonEmpty!30421 m!848635))

(declare-fun m!848637 () Bool)

(assert (=> start!78388 m!848637))

(declare-fun m!848639 () Bool)

(assert (=> start!78388 m!848639))

(declare-fun m!848641 () Bool)

(assert (=> start!78388 m!848641))

(declare-fun m!848643 () Bool)

(assert (=> b!913830 m!848643))

(declare-fun m!848645 () Bool)

(assert (=> b!913826 m!848645))

(assert (=> b!913826 m!848645))

(declare-fun m!848647 () Bool)

(assert (=> b!913826 m!848647))

(check-sat (not mapNonEmpty!30421) (not b!913832) (not b!913826) (not b!913828) (not b_next!16711) b_and!27297 (not start!78388) (not b!913829) (not b!913833) tp_is_empty!19129)
(check-sat b_and!27297 (not b_next!16711))
