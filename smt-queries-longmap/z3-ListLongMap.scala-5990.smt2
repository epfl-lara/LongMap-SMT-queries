; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77774 () Bool)

(assert start!77774)

(declare-fun b_free!16351 () Bool)

(declare-fun b_next!16351 () Bool)

(assert (=> start!77774 (= b_free!16351 (not b_next!16351))))

(declare-fun tp!57319 () Bool)

(declare-fun b_and!26833 () Bool)

(assert (=> start!77774 (= tp!57319 b_and!26833)))

(declare-fun b!907619 () Bool)

(declare-fun res!612611 () Bool)

(declare-fun e!508665 () Bool)

(assert (=> b!907619 (=> (not res!612611) (not e!508665))))

(declare-datatypes ((array!53553 0))(
  ( (array!53554 (arr!25735 (Array (_ BitVec 32) (_ BitVec 64))) (size!26196 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53553)

(declare-datatypes ((List!18102 0))(
  ( (Nil!18099) (Cons!18098 (h!19244 (_ BitVec 64)) (t!25616 List!18102)) )
))
(declare-fun arrayNoDuplicates!0 (array!53553 (_ BitVec 32) List!18102) Bool)

(assert (=> b!907619 (= res!612611 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18099))))

(declare-fun b!907620 () Bool)

(declare-fun e!508661 () Bool)

(declare-fun e!508660 () Bool)

(assert (=> b!907620 (= e!508661 (not e!508660))))

(declare-fun res!612605 () Bool)

(assert (=> b!907620 (=> res!612605 e!508660)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!907620 (= res!612605 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26196 _keys!1386))))))

(declare-datatypes ((V!29991 0))(
  ( (V!29992 (val!9435 Int)) )
))
(declare-datatypes ((ValueCell!8903 0))(
  ( (ValueCellFull!8903 (v!11941 V!29991)) (EmptyCell!8903) )
))
(declare-datatypes ((array!53555 0))(
  ( (array!53556 (arr!25736 (Array (_ BitVec 32) ValueCell!8903)) (size!26197 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53555)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409266 () V!29991)

(declare-fun get!13546 (ValueCell!8903 V!29991) V!29991)

(declare-fun dynLambda!1360 (Int (_ BitVec 64)) V!29991)

(assert (=> b!907620 (= lt!409266 (get!13546 (select (arr!25736 _values!1152) i!717) (dynLambda!1360 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907620 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29991)

(declare-datatypes ((Unit!30736 0))(
  ( (Unit!30737) )
))
(declare-fun lt!409269 () Unit!30736)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29991)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lemmaKeyInListMapIsInArray!236 (array!53553 array!53555 (_ BitVec 32) (_ BitVec 32) V!29991 V!29991 (_ BitVec 64) Int) Unit!30736)

(assert (=> b!907620 (= lt!409269 (lemmaKeyInListMapIsInArray!236 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!612610 () Bool)

(assert (=> start!77774 (=> (not res!612610) (not e!508665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77774 (= res!612610 (validMask!0 mask!1756))))

(assert (=> start!77774 e!508665))

(declare-fun e!508664 () Bool)

(declare-fun array_inv!20194 (array!53555) Bool)

(assert (=> start!77774 (and (array_inv!20194 _values!1152) e!508664)))

(assert (=> start!77774 tp!57319))

(assert (=> start!77774 true))

(declare-fun tp_is_empty!18769 () Bool)

(assert (=> start!77774 tp_is_empty!18769))

(declare-fun array_inv!20195 (array!53553) Bool)

(assert (=> start!77774 (array_inv!20195 _keys!1386)))

(declare-fun mapIsEmpty!29869 () Bool)

(declare-fun mapRes!29869 () Bool)

(assert (=> mapIsEmpty!29869 mapRes!29869))

(declare-fun b!907621 () Bool)

(declare-fun res!612607 () Bool)

(assert (=> b!907621 (=> (not res!612607) (not e!508661))))

(assert (=> b!907621 (= res!612607 (and (= (select (arr!25735 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907622 () Bool)

(assert (=> b!907622 (= e!508665 e!508661)))

(declare-fun res!612606 () Bool)

(assert (=> b!907622 (=> (not res!612606) (not e!508661))))

(declare-datatypes ((tuple2!12316 0))(
  ( (tuple2!12317 (_1!6169 (_ BitVec 64)) (_2!6169 V!29991)) )
))
(declare-datatypes ((List!18103 0))(
  ( (Nil!18100) (Cons!18099 (h!19245 tuple2!12316) (t!25617 List!18103)) )
))
(declare-datatypes ((ListLongMap!11003 0))(
  ( (ListLongMap!11004 (toList!5517 List!18103)) )
))
(declare-fun lt!409267 () ListLongMap!11003)

(declare-fun contains!4519 (ListLongMap!11003 (_ BitVec 64)) Bool)

(assert (=> b!907622 (= res!612606 (contains!4519 lt!409267 k0!1033))))

(declare-fun getCurrentListMap!2722 (array!53553 array!53555 (_ BitVec 32) (_ BitVec 32) V!29991 V!29991 (_ BitVec 32) Int) ListLongMap!11003)

(assert (=> b!907622 (= lt!409267 (getCurrentListMap!2722 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907623 () Bool)

(declare-fun res!612613 () Bool)

(assert (=> b!907623 (=> (not res!612613) (not e!508665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53553 (_ BitVec 32)) Bool)

(assert (=> b!907623 (= res!612613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907624 () Bool)

(declare-fun e!508663 () Bool)

(assert (=> b!907624 (= e!508660 e!508663)))

(declare-fun res!612608 () Bool)

(assert (=> b!907624 (=> res!612608 e!508663)))

(declare-fun lt!409265 () ListLongMap!11003)

(assert (=> b!907624 (= res!612608 (not (contains!4519 lt!409265 k0!1033)))))

(assert (=> b!907624 (= lt!409265 (getCurrentListMap!2722 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907625 () Bool)

(declare-fun res!612612 () Bool)

(assert (=> b!907625 (=> res!612612 e!508663)))

(declare-fun apply!491 (ListLongMap!11003 (_ BitVec 64)) V!29991)

(assert (=> b!907625 (= res!612612 (not (= (apply!491 lt!409265 k0!1033) lt!409266)))))

(declare-fun b!907626 () Bool)

(declare-fun e!508667 () Bool)

(assert (=> b!907626 (= e!508667 tp_is_empty!18769)))

(declare-fun b!907627 () Bool)

(assert (=> b!907627 (= e!508663 true)))

(assert (=> b!907627 (= (apply!491 lt!409267 k0!1033) lt!409266)))

(declare-fun lt!409268 () Unit!30736)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!51 (array!53553 array!53555 (_ BitVec 32) (_ BitVec 32) V!29991 V!29991 (_ BitVec 64) V!29991 (_ BitVec 32) Int) Unit!30736)

(assert (=> b!907627 (= lt!409268 (lemmaListMapApplyFromThenApplyFromZero!51 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409266 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29869 () Bool)

(declare-fun tp!57318 () Bool)

(declare-fun e!508666 () Bool)

(assert (=> mapNonEmpty!29869 (= mapRes!29869 (and tp!57318 e!508666))))

(declare-fun mapKey!29869 () (_ BitVec 32))

(declare-fun mapRest!29869 () (Array (_ BitVec 32) ValueCell!8903))

(declare-fun mapValue!29869 () ValueCell!8903)

(assert (=> mapNonEmpty!29869 (= (arr!25736 _values!1152) (store mapRest!29869 mapKey!29869 mapValue!29869))))

(declare-fun b!907628 () Bool)

(assert (=> b!907628 (= e!508666 tp_is_empty!18769)))

(declare-fun b!907629 () Bool)

(declare-fun res!612609 () Bool)

(assert (=> b!907629 (=> (not res!612609) (not e!508661))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907629 (= res!612609 (inRange!0 i!717 mask!1756))))

(declare-fun b!907630 () Bool)

(assert (=> b!907630 (= e!508664 (and e!508667 mapRes!29869))))

(declare-fun condMapEmpty!29869 () Bool)

(declare-fun mapDefault!29869 () ValueCell!8903)

(assert (=> b!907630 (= condMapEmpty!29869 (= (arr!25736 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8903)) mapDefault!29869)))))

(declare-fun b!907631 () Bool)

(declare-fun res!612604 () Bool)

(assert (=> b!907631 (=> (not res!612604) (not e!508665))))

(assert (=> b!907631 (= res!612604 (and (= (size!26197 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26196 _keys!1386) (size!26197 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77774 res!612610) b!907631))

(assert (= (and b!907631 res!612604) b!907623))

(assert (= (and b!907623 res!612613) b!907619))

(assert (= (and b!907619 res!612611) b!907622))

(assert (= (and b!907622 res!612606) b!907629))

(assert (= (and b!907629 res!612609) b!907621))

(assert (= (and b!907621 res!612607) b!907620))

(assert (= (and b!907620 (not res!612605)) b!907624))

(assert (= (and b!907624 (not res!612608)) b!907625))

(assert (= (and b!907625 (not res!612612)) b!907627))

(assert (= (and b!907630 condMapEmpty!29869) mapIsEmpty!29869))

(assert (= (and b!907630 (not condMapEmpty!29869)) mapNonEmpty!29869))

(get-info :version)

(assert (= (and mapNonEmpty!29869 ((_ is ValueCellFull!8903) mapValue!29869)) b!907628))

(assert (= (and b!907630 ((_ is ValueCellFull!8903) mapDefault!29869)) b!907626))

(assert (= start!77774 b!907630))

(declare-fun b_lambda!13217 () Bool)

(assert (=> (not b_lambda!13217) (not b!907620)))

(declare-fun t!25615 () Bool)

(declare-fun tb!5365 () Bool)

(assert (=> (and start!77774 (= defaultEntry!1160 defaultEntry!1160) t!25615) tb!5365))

(declare-fun result!10535 () Bool)

(assert (=> tb!5365 (= result!10535 tp_is_empty!18769)))

(assert (=> b!907620 t!25615))

(declare-fun b_and!26835 () Bool)

(assert (= b_and!26833 (and (=> t!25615 result!10535) b_and!26835)))

(declare-fun m!842451 () Bool)

(assert (=> b!907629 m!842451))

(declare-fun m!842453 () Bool)

(assert (=> start!77774 m!842453))

(declare-fun m!842455 () Bool)

(assert (=> start!77774 m!842455))

(declare-fun m!842457 () Bool)

(assert (=> start!77774 m!842457))

(declare-fun m!842459 () Bool)

(assert (=> b!907620 m!842459))

(declare-fun m!842461 () Bool)

(assert (=> b!907620 m!842461))

(declare-fun m!842463 () Bool)

(assert (=> b!907620 m!842463))

(declare-fun m!842465 () Bool)

(assert (=> b!907620 m!842465))

(assert (=> b!907620 m!842459))

(assert (=> b!907620 m!842463))

(declare-fun m!842467 () Bool)

(assert (=> b!907620 m!842467))

(declare-fun m!842469 () Bool)

(assert (=> mapNonEmpty!29869 m!842469))

(declare-fun m!842471 () Bool)

(assert (=> b!907624 m!842471))

(declare-fun m!842473 () Bool)

(assert (=> b!907624 m!842473))

(declare-fun m!842475 () Bool)

(assert (=> b!907619 m!842475))

(declare-fun m!842477 () Bool)

(assert (=> b!907621 m!842477))

(declare-fun m!842479 () Bool)

(assert (=> b!907622 m!842479))

(declare-fun m!842481 () Bool)

(assert (=> b!907622 m!842481))

(declare-fun m!842483 () Bool)

(assert (=> b!907625 m!842483))

(declare-fun m!842485 () Bool)

(assert (=> b!907623 m!842485))

(declare-fun m!842487 () Bool)

(assert (=> b!907627 m!842487))

(declare-fun m!842489 () Bool)

(assert (=> b!907627 m!842489))

(check-sat (not b!907622) (not b_next!16351) (not b!907620) (not b!907629) (not start!77774) (not b!907624) (not b!907627) (not b_lambda!13217) (not b!907625) tp_is_empty!18769 (not b!907619) (not b!907623) b_and!26835 (not mapNonEmpty!29869))
(check-sat b_and!26835 (not b_next!16351))
