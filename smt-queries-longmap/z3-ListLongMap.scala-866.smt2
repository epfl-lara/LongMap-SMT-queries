; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20296 () Bool)

(assert start!20296)

(declare-fun b_free!4951 () Bool)

(declare-fun b_next!4951 () Bool)

(assert (=> start!20296 (= b_free!4951 (not b_next!4951))))

(declare-fun tp!17885 () Bool)

(declare-fun b_and!11711 () Bool)

(assert (=> start!20296 (= tp!17885 b_and!11711)))

(declare-fun res!95072 () Bool)

(declare-fun e!131135 () Bool)

(assert (=> start!20296 (=> (not res!95072) (not e!131135))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20296 (= res!95072 (validMask!0 mask!1149))))

(assert (=> start!20296 e!131135))

(declare-datatypes ((V!6057 0))(
  ( (V!6058 (val!2448 Int)) )
))
(declare-datatypes ((ValueCell!2060 0))(
  ( (ValueCellFull!2060 (v!4419 V!6057)) (EmptyCell!2060) )
))
(declare-datatypes ((array!8841 0))(
  ( (array!8842 (arr!4171 (Array (_ BitVec 32) ValueCell!2060)) (size!4496 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8841)

(declare-fun e!131138 () Bool)

(declare-fun array_inv!2719 (array!8841) Bool)

(assert (=> start!20296 (and (array_inv!2719 _values!649) e!131138)))

(assert (=> start!20296 true))

(declare-fun tp_is_empty!4807 () Bool)

(assert (=> start!20296 tp_is_empty!4807))

(declare-datatypes ((array!8843 0))(
  ( (array!8844 (arr!4172 (Array (_ BitVec 32) (_ BitVec 64))) (size!4497 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8843)

(declare-fun array_inv!2720 (array!8843) Bool)

(assert (=> start!20296 (array_inv!2720 _keys!825)))

(assert (=> start!20296 tp!17885))

(declare-fun b!199861 () Bool)

(declare-fun res!95074 () Bool)

(assert (=> b!199861 (=> (not res!95074) (not e!131135))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199861 (= res!95074 (= (select (arr!4172 _keys!825) i!601) k0!843))))

(declare-fun b!199862 () Bool)

(declare-fun e!131136 () Bool)

(assert (=> b!199862 (= e!131136 tp_is_empty!4807)))

(declare-fun b!199863 () Bool)

(declare-fun e!131137 () Bool)

(declare-fun mapRes!8279 () Bool)

(assert (=> b!199863 (= e!131138 (and e!131137 mapRes!8279))))

(declare-fun condMapEmpty!8279 () Bool)

(declare-fun mapDefault!8279 () ValueCell!2060)

(assert (=> b!199863 (= condMapEmpty!8279 (= (arr!4171 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2060)) mapDefault!8279)))))

(declare-fun b!199864 () Bool)

(declare-fun res!95076 () Bool)

(assert (=> b!199864 (=> (not res!95076) (not e!131135))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199864 (= res!95076 (and (= (size!4496 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4497 _keys!825) (size!4496 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199865 () Bool)

(assert (=> b!199865 (= e!131137 tp_is_empty!4807)))

(declare-fun b!199866 () Bool)

(declare-fun res!95075 () Bool)

(assert (=> b!199866 (=> (not res!95075) (not e!131135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8843 (_ BitVec 32)) Bool)

(assert (=> b!199866 (= res!95075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199867 () Bool)

(declare-fun res!95073 () Bool)

(assert (=> b!199867 (=> (not res!95073) (not e!131135))))

(assert (=> b!199867 (= res!95073 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4497 _keys!825))))))

(declare-fun b!199868 () Bool)

(assert (=> b!199868 (= e!131135 (not true))))

(declare-datatypes ((tuple2!3640 0))(
  ( (tuple2!3641 (_1!1831 (_ BitVec 64)) (_2!1831 V!6057)) )
))
(declare-datatypes ((List!2560 0))(
  ( (Nil!2557) (Cons!2556 (h!3198 tuple2!3640) (t!7483 List!2560)) )
))
(declare-datatypes ((ListLongMap!2555 0))(
  ( (ListLongMap!2556 (toList!1293 List!2560)) )
))
(declare-fun lt!98605 () ListLongMap!2555)

(declare-fun lt!98601 () array!8841)

(declare-fun zeroValue!615 () V!6057)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6057)

(declare-fun getCurrentListMap!890 (array!8843 array!8841 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) Int) ListLongMap!2555)

(assert (=> b!199868 (= lt!98605 (getCurrentListMap!890 _keys!825 lt!98601 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98602 () ListLongMap!2555)

(declare-fun lt!98606 () ListLongMap!2555)

(assert (=> b!199868 (and (= lt!98602 lt!98606) (= lt!98606 lt!98602))))

(declare-fun v!520 () V!6057)

(declare-fun lt!98603 () ListLongMap!2555)

(declare-fun +!347 (ListLongMap!2555 tuple2!3640) ListLongMap!2555)

(assert (=> b!199868 (= lt!98606 (+!347 lt!98603 (tuple2!3641 k0!843 v!520)))))

(declare-datatypes ((Unit!5980 0))(
  ( (Unit!5981) )
))
(declare-fun lt!98604 () Unit!5980)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!26 (array!8843 array!8841 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) (_ BitVec 64) V!6057 (_ BitVec 32) Int) Unit!5980)

(assert (=> b!199868 (= lt!98604 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!26 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!283 (array!8843 array!8841 (_ BitVec 32) (_ BitVec 32) V!6057 V!6057 (_ BitVec 32) Int) ListLongMap!2555)

(assert (=> b!199868 (= lt!98602 (getCurrentListMapNoExtraKeys!283 _keys!825 lt!98601 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199868 (= lt!98601 (array!8842 (store (arr!4171 _values!649) i!601 (ValueCellFull!2060 v!520)) (size!4496 _values!649)))))

(assert (=> b!199868 (= lt!98603 (getCurrentListMapNoExtraKeys!283 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8279 () Bool)

(declare-fun tp!17884 () Bool)

(assert (=> mapNonEmpty!8279 (= mapRes!8279 (and tp!17884 e!131136))))

(declare-fun mapKey!8279 () (_ BitVec 32))

(declare-fun mapValue!8279 () ValueCell!2060)

(declare-fun mapRest!8279 () (Array (_ BitVec 32) ValueCell!2060))

(assert (=> mapNonEmpty!8279 (= (arr!4171 _values!649) (store mapRest!8279 mapKey!8279 mapValue!8279))))

(declare-fun mapIsEmpty!8279 () Bool)

(assert (=> mapIsEmpty!8279 mapRes!8279))

(declare-fun b!199869 () Bool)

(declare-fun res!95071 () Bool)

(assert (=> b!199869 (=> (not res!95071) (not e!131135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199869 (= res!95071 (validKeyInArray!0 k0!843))))

(declare-fun b!199870 () Bool)

(declare-fun res!95077 () Bool)

(assert (=> b!199870 (=> (not res!95077) (not e!131135))))

(declare-datatypes ((List!2561 0))(
  ( (Nil!2558) (Cons!2557 (h!3199 (_ BitVec 64)) (t!7484 List!2561)) )
))
(declare-fun arrayNoDuplicates!0 (array!8843 (_ BitVec 32) List!2561) Bool)

(assert (=> b!199870 (= res!95077 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2558))))

(assert (= (and start!20296 res!95072) b!199864))

(assert (= (and b!199864 res!95076) b!199866))

(assert (= (and b!199866 res!95075) b!199870))

(assert (= (and b!199870 res!95077) b!199867))

(assert (= (and b!199867 res!95073) b!199869))

(assert (= (and b!199869 res!95071) b!199861))

(assert (= (and b!199861 res!95074) b!199868))

(assert (= (and b!199863 condMapEmpty!8279) mapIsEmpty!8279))

(assert (= (and b!199863 (not condMapEmpty!8279)) mapNonEmpty!8279))

(get-info :version)

(assert (= (and mapNonEmpty!8279 ((_ is ValueCellFull!2060) mapValue!8279)) b!199862))

(assert (= (and b!199863 ((_ is ValueCellFull!2060) mapDefault!8279)) b!199865))

(assert (= start!20296 b!199863))

(declare-fun m!226437 () Bool)

(assert (=> b!199868 m!226437))

(declare-fun m!226439 () Bool)

(assert (=> b!199868 m!226439))

(declare-fun m!226441 () Bool)

(assert (=> b!199868 m!226441))

(declare-fun m!226443 () Bool)

(assert (=> b!199868 m!226443))

(declare-fun m!226445 () Bool)

(assert (=> b!199868 m!226445))

(declare-fun m!226447 () Bool)

(assert (=> b!199868 m!226447))

(declare-fun m!226449 () Bool)

(assert (=> b!199870 m!226449))

(declare-fun m!226451 () Bool)

(assert (=> b!199861 m!226451))

(declare-fun m!226453 () Bool)

(assert (=> b!199869 m!226453))

(declare-fun m!226455 () Bool)

(assert (=> mapNonEmpty!8279 m!226455))

(declare-fun m!226457 () Bool)

(assert (=> b!199866 m!226457))

(declare-fun m!226459 () Bool)

(assert (=> start!20296 m!226459))

(declare-fun m!226461 () Bool)

(assert (=> start!20296 m!226461))

(declare-fun m!226463 () Bool)

(assert (=> start!20296 m!226463))

(check-sat (not b!199866) (not b_next!4951) (not b!199870) tp_is_empty!4807 b_and!11711 (not b!199868) (not mapNonEmpty!8279) (not b!199869) (not start!20296))
(check-sat b_and!11711 (not b_next!4951))
