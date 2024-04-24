; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77712 () Bool)

(assert start!77712)

(declare-fun b_free!16129 () Bool)

(declare-fun b_next!16129 () Bool)

(assert (=> start!77712 (= b_free!16129 (not b_next!16129))))

(declare-fun tp!56649 () Bool)

(declare-fun b_and!26505 () Bool)

(assert (=> start!77712 (= tp!56649 b_and!26505)))

(declare-fun b!904391 () Bool)

(declare-fun res!609914 () Bool)

(declare-fun e!506802 () Bool)

(assert (=> b!904391 (=> (not res!609914) (not e!506802))))

(declare-datatypes ((V!29695 0))(
  ( (V!29696 (val!9324 Int)) )
))
(declare-datatypes ((ValueCell!8792 0))(
  ( (ValueCellFull!8792 (v!11826 V!29695)) (EmptyCell!8792) )
))
(declare-datatypes ((array!53187 0))(
  ( (array!53188 (arr!25548 (Array (_ BitVec 32) ValueCell!8792)) (size!26008 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53187)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53189 0))(
  ( (array!53190 (arr!25549 (Array (_ BitVec 32) (_ BitVec 64))) (size!26009 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53189)

(assert (=> b!904391 (= res!609914 (and (= (size!26008 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26009 _keys!1386) (size!26008 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609916 () Bool)

(assert (=> start!77712 (=> (not res!609916) (not e!506802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77712 (= res!609916 (validMask!0 mask!1756))))

(assert (=> start!77712 e!506802))

(declare-fun e!506801 () Bool)

(declare-fun array_inv!20088 (array!53187) Bool)

(assert (=> start!77712 (and (array_inv!20088 _values!1152) e!506801)))

(assert (=> start!77712 tp!56649))

(assert (=> start!77712 true))

(declare-fun tp_is_empty!18547 () Bool)

(assert (=> start!77712 tp_is_empty!18547))

(declare-fun array_inv!20089 (array!53189) Bool)

(assert (=> start!77712 (array_inv!20089 _keys!1386)))

(declare-fun mapNonEmpty!29533 () Bool)

(declare-fun mapRes!29533 () Bool)

(declare-fun tp!56650 () Bool)

(declare-fun e!506800 () Bool)

(assert (=> mapNonEmpty!29533 (= mapRes!29533 (and tp!56650 e!506800))))

(declare-fun mapValue!29533 () ValueCell!8792)

(declare-fun mapRest!29533 () (Array (_ BitVec 32) ValueCell!8792))

(declare-fun mapKey!29533 () (_ BitVec 32))

(assert (=> mapNonEmpty!29533 (= (arr!25548 _values!1152) (store mapRest!29533 mapKey!29533 mapValue!29533))))

(declare-fun b!904392 () Bool)

(assert (=> b!904392 (= e!506802 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29695)

(declare-fun lt!408376 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29695)

(declare-datatypes ((tuple2!12038 0))(
  ( (tuple2!12039 (_1!6030 (_ BitVec 64)) (_2!6030 V!29695)) )
))
(declare-datatypes ((List!17890 0))(
  ( (Nil!17887) (Cons!17886 (h!19038 tuple2!12038) (t!25265 List!17890)) )
))
(declare-datatypes ((ListLongMap!10737 0))(
  ( (ListLongMap!10738 (toList!5384 List!17890)) )
))
(declare-fun contains!4442 (ListLongMap!10737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2653 (array!53189 array!53187 (_ BitVec 32) (_ BitVec 32) V!29695 V!29695 (_ BitVec 32) Int) ListLongMap!10737)

(assert (=> b!904392 (= lt!408376 (contains!4442 (getCurrentListMap!2653 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!29533 () Bool)

(assert (=> mapIsEmpty!29533 mapRes!29533))

(declare-fun b!904393 () Bool)

(assert (=> b!904393 (= e!506800 tp_is_empty!18547)))

(declare-fun b!904394 () Bool)

(declare-fun res!609913 () Bool)

(assert (=> b!904394 (=> (not res!609913) (not e!506802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53189 (_ BitVec 32)) Bool)

(assert (=> b!904394 (= res!609913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904395 () Bool)

(declare-fun e!506799 () Bool)

(assert (=> b!904395 (= e!506799 tp_is_empty!18547)))

(declare-fun b!904396 () Bool)

(declare-fun res!609915 () Bool)

(assert (=> b!904396 (=> (not res!609915) (not e!506802))))

(declare-datatypes ((List!17891 0))(
  ( (Nil!17888) (Cons!17887 (h!19039 (_ BitVec 64)) (t!25266 List!17891)) )
))
(declare-fun arrayNoDuplicates!0 (array!53189 (_ BitVec 32) List!17891) Bool)

(assert (=> b!904396 (= res!609915 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17888))))

(declare-fun b!904397 () Bool)

(assert (=> b!904397 (= e!506801 (and e!506799 mapRes!29533))))

(declare-fun condMapEmpty!29533 () Bool)

(declare-fun mapDefault!29533 () ValueCell!8792)

(assert (=> b!904397 (= condMapEmpty!29533 (= (arr!25548 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8792)) mapDefault!29533)))))

(assert (= (and start!77712 res!609916) b!904391))

(assert (= (and b!904391 res!609914) b!904394))

(assert (= (and b!904394 res!609913) b!904396))

(assert (= (and b!904396 res!609915) b!904392))

(assert (= (and b!904397 condMapEmpty!29533) mapIsEmpty!29533))

(assert (= (and b!904397 (not condMapEmpty!29533)) mapNonEmpty!29533))

(get-info :version)

(assert (= (and mapNonEmpty!29533 ((_ is ValueCellFull!8792) mapValue!29533)) b!904393))

(assert (= (and b!904397 ((_ is ValueCellFull!8792) mapDefault!29533)) b!904395))

(assert (= start!77712 b!904397))

(declare-fun m!840455 () Bool)

(assert (=> mapNonEmpty!29533 m!840455))

(declare-fun m!840457 () Bool)

(assert (=> start!77712 m!840457))

(declare-fun m!840459 () Bool)

(assert (=> start!77712 m!840459))

(declare-fun m!840461 () Bool)

(assert (=> start!77712 m!840461))

(declare-fun m!840463 () Bool)

(assert (=> b!904392 m!840463))

(assert (=> b!904392 m!840463))

(declare-fun m!840465 () Bool)

(assert (=> b!904392 m!840465))

(declare-fun m!840467 () Bool)

(assert (=> b!904394 m!840467))

(declare-fun m!840469 () Bool)

(assert (=> b!904396 m!840469))

(check-sat b_and!26505 (not start!77712) (not b!904392) (not mapNonEmpty!29533) (not b!904394) (not b!904396) tp_is_empty!18547 (not b_next!16129))
(check-sat b_and!26505 (not b_next!16129))
