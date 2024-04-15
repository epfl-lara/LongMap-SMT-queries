; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77828 () Bool)

(assert start!77828)

(declare-fun b_free!16405 () Bool)

(declare-fun b_next!16405 () Bool)

(assert (=> start!77828 (= b_free!16405 (not b_next!16405))))

(declare-fun tp!57480 () Bool)

(declare-fun b_and!26941 () Bool)

(assert (=> start!77828 (= tp!57480 b_and!26941)))

(declare-fun b!908726 () Bool)

(declare-fun e!509315 () Bool)

(declare-fun e!509309 () Bool)

(declare-fun mapRes!29950 () Bool)

(assert (=> b!908726 (= e!509315 (and e!509309 mapRes!29950))))

(declare-fun condMapEmpty!29950 () Bool)

(declare-datatypes ((V!30063 0))(
  ( (V!30064 (val!9462 Int)) )
))
(declare-datatypes ((ValueCell!8930 0))(
  ( (ValueCellFull!8930 (v!11968 V!30063)) (EmptyCell!8930) )
))
(declare-datatypes ((array!53659 0))(
  ( (array!53660 (arr!25788 (Array (_ BitVec 32) ValueCell!8930)) (size!26249 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53659)

(declare-fun mapDefault!29950 () ValueCell!8930)

(assert (=> b!908726 (= condMapEmpty!29950 (= (arr!25788 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8930)) mapDefault!29950)))))

(declare-fun b!908727 () Bool)

(declare-fun e!509314 () Bool)

(declare-fun e!509312 () Bool)

(assert (=> b!908727 (= e!509314 e!509312)))

(declare-fun res!613422 () Bool)

(assert (=> b!908727 (=> res!613422 e!509312)))

(declare-datatypes ((tuple2!12364 0))(
  ( (tuple2!12365 (_1!6193 (_ BitVec 64)) (_2!6193 V!30063)) )
))
(declare-datatypes ((List!18144 0))(
  ( (Nil!18141) (Cons!18140 (h!19286 tuple2!12364) (t!25712 List!18144)) )
))
(declare-datatypes ((ListLongMap!11051 0))(
  ( (ListLongMap!11052 (toList!5541 List!18144)) )
))
(declare-fun lt!409672 () ListLongMap!11051)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4540 (ListLongMap!11051 (_ BitVec 64)) Bool)

(assert (=> b!908727 (= res!613422 (not (contains!4540 lt!409672 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53661 0))(
  ( (array!53662 (arr!25789 (Array (_ BitVec 32) (_ BitVec 64))) (size!26250 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53661)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30063)

(declare-fun zeroValue!1094 () V!30063)

(declare-fun getCurrentListMap!2743 (array!53661 array!53659 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 32) Int) ListLongMap!11051)

(assert (=> b!908727 (= lt!409672 (getCurrentListMap!2743 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908728 () Bool)

(declare-fun tp_is_empty!18823 () Bool)

(assert (=> b!908728 (= e!509309 tp_is_empty!18823)))

(declare-fun b!908729 () Bool)

(declare-fun res!613417 () Bool)

(declare-fun e!509308 () Bool)

(assert (=> b!908729 (=> (not res!613417) (not e!509308))))

(assert (=> b!908729 (= res!613417 (and (= (select (arr!25789 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908730 () Bool)

(declare-fun res!613414 () Bool)

(declare-fun e!509311 () Bool)

(assert (=> b!908730 (=> (not res!613414) (not e!509311))))

(assert (=> b!908730 (= res!613414 (and (= (size!26249 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26250 _keys!1386) (size!26249 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29950 () Bool)

(assert (=> mapIsEmpty!29950 mapRes!29950))

(declare-fun res!613421 () Bool)

(assert (=> start!77828 (=> (not res!613421) (not e!509311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77828 (= res!613421 (validMask!0 mask!1756))))

(assert (=> start!77828 e!509311))

(declare-fun array_inv!20226 (array!53659) Bool)

(assert (=> start!77828 (and (array_inv!20226 _values!1152) e!509315)))

(assert (=> start!77828 tp!57480))

(assert (=> start!77828 true))

(assert (=> start!77828 tp_is_empty!18823))

(declare-fun array_inv!20227 (array!53661) Bool)

(assert (=> start!77828 (array_inv!20227 _keys!1386)))

(declare-fun b!908731 () Bool)

(declare-fun res!613415 () Bool)

(assert (=> b!908731 (=> (not res!613415) (not e!509311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53661 (_ BitVec 32)) Bool)

(assert (=> b!908731 (= res!613415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908732 () Bool)

(assert (=> b!908732 (= e!509311 e!509308)))

(declare-fun res!613418 () Bool)

(assert (=> b!908732 (=> (not res!613418) (not e!509308))))

(declare-fun lt!409674 () ListLongMap!11051)

(assert (=> b!908732 (= res!613418 (contains!4540 lt!409674 k0!1033))))

(assert (=> b!908732 (= lt!409674 (getCurrentListMap!2743 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908733 () Bool)

(declare-fun res!613420 () Bool)

(assert (=> b!908733 (=> (not res!613420) (not e!509308))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908733 (= res!613420 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29950 () Bool)

(declare-fun tp!57481 () Bool)

(declare-fun e!509310 () Bool)

(assert (=> mapNonEmpty!29950 (= mapRes!29950 (and tp!57481 e!509310))))

(declare-fun mapKey!29950 () (_ BitVec 32))

(declare-fun mapRest!29950 () (Array (_ BitVec 32) ValueCell!8930))

(declare-fun mapValue!29950 () ValueCell!8930)

(assert (=> mapNonEmpty!29950 (= (arr!25788 _values!1152) (store mapRest!29950 mapKey!29950 mapValue!29950))))

(declare-fun b!908734 () Bool)

(assert (=> b!908734 (= e!509310 tp_is_empty!18823)))

(declare-fun b!908735 () Bool)

(assert (=> b!908735 (= e!509312 true)))

(declare-fun lt!409670 () V!30063)

(declare-fun apply!513 (ListLongMap!11051 (_ BitVec 64)) V!30063)

(assert (=> b!908735 (= (apply!513 lt!409674 k0!1033) lt!409670)))

(declare-datatypes ((Unit!30780 0))(
  ( (Unit!30781) )
))
(declare-fun lt!409671 () Unit!30780)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!67 (array!53661 array!53659 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 64) V!30063 (_ BitVec 32) Int) Unit!30780)

(assert (=> b!908735 (= lt!409671 (lemmaListMapApplyFromThenApplyFromZero!67 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409670 i!717 defaultEntry!1160))))

(declare-fun b!908736 () Bool)

(assert (=> b!908736 (= e!509308 (not e!509314))))

(declare-fun res!613423 () Bool)

(assert (=> b!908736 (=> res!613423 e!509314)))

(assert (=> b!908736 (= res!613423 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26250 _keys!1386))))))

(declare-fun get!13582 (ValueCell!8930 V!30063) V!30063)

(declare-fun dynLambda!1378 (Int (_ BitVec 64)) V!30063)

(assert (=> b!908736 (= lt!409670 (get!13582 (select (arr!25788 _values!1152) i!717) (dynLambda!1378 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908736 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409673 () Unit!30780)

(declare-fun lemmaKeyInListMapIsInArray!254 (array!53661 array!53659 (_ BitVec 32) (_ BitVec 32) V!30063 V!30063 (_ BitVec 64) Int) Unit!30780)

(assert (=> b!908736 (= lt!409673 (lemmaKeyInListMapIsInArray!254 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908737 () Bool)

(declare-fun res!613416 () Bool)

(assert (=> b!908737 (=> (not res!613416) (not e!509311))))

(declare-datatypes ((List!18145 0))(
  ( (Nil!18142) (Cons!18141 (h!19287 (_ BitVec 64)) (t!25713 List!18145)) )
))
(declare-fun arrayNoDuplicates!0 (array!53661 (_ BitVec 32) List!18145) Bool)

(assert (=> b!908737 (= res!613416 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18142))))

(declare-fun b!908738 () Bool)

(declare-fun res!613419 () Bool)

(assert (=> b!908738 (=> res!613419 e!509312)))

(assert (=> b!908738 (= res!613419 (not (= (apply!513 lt!409672 k0!1033) lt!409670)))))

(assert (= (and start!77828 res!613421) b!908730))

(assert (= (and b!908730 res!613414) b!908731))

(assert (= (and b!908731 res!613415) b!908737))

(assert (= (and b!908737 res!613416) b!908732))

(assert (= (and b!908732 res!613418) b!908733))

(assert (= (and b!908733 res!613420) b!908729))

(assert (= (and b!908729 res!613417) b!908736))

(assert (= (and b!908736 (not res!613423)) b!908727))

(assert (= (and b!908727 (not res!613422)) b!908738))

(assert (= (and b!908738 (not res!613419)) b!908735))

(assert (= (and b!908726 condMapEmpty!29950) mapIsEmpty!29950))

(assert (= (and b!908726 (not condMapEmpty!29950)) mapNonEmpty!29950))

(get-info :version)

(assert (= (and mapNonEmpty!29950 ((_ is ValueCellFull!8930) mapValue!29950)) b!908734))

(assert (= (and b!908726 ((_ is ValueCellFull!8930) mapDefault!29950)) b!908728))

(assert (= start!77828 b!908726))

(declare-fun b_lambda!13271 () Bool)

(assert (=> (not b_lambda!13271) (not b!908736)))

(declare-fun t!25711 () Bool)

(declare-fun tb!5419 () Bool)

(assert (=> (and start!77828 (= defaultEntry!1160 defaultEntry!1160) t!25711) tb!5419))

(declare-fun result!10643 () Bool)

(assert (=> tb!5419 (= result!10643 tp_is_empty!18823)))

(assert (=> b!908736 t!25711))

(declare-fun b_and!26943 () Bool)

(assert (= b_and!26941 (and (=> t!25711 result!10643) b_and!26943)))

(declare-fun m!843531 () Bool)

(assert (=> mapNonEmpty!29950 m!843531))

(declare-fun m!843533 () Bool)

(assert (=> start!77828 m!843533))

(declare-fun m!843535 () Bool)

(assert (=> start!77828 m!843535))

(declare-fun m!843537 () Bool)

(assert (=> start!77828 m!843537))

(declare-fun m!843539 () Bool)

(assert (=> b!908738 m!843539))

(declare-fun m!843541 () Bool)

(assert (=> b!908731 m!843541))

(declare-fun m!843543 () Bool)

(assert (=> b!908733 m!843543))

(declare-fun m!843545 () Bool)

(assert (=> b!908736 m!843545))

(declare-fun m!843547 () Bool)

(assert (=> b!908736 m!843547))

(declare-fun m!843549 () Bool)

(assert (=> b!908736 m!843549))

(declare-fun m!843551 () Bool)

(assert (=> b!908736 m!843551))

(assert (=> b!908736 m!843545))

(assert (=> b!908736 m!843549))

(declare-fun m!843553 () Bool)

(assert (=> b!908736 m!843553))

(declare-fun m!843555 () Bool)

(assert (=> b!908737 m!843555))

(declare-fun m!843557 () Bool)

(assert (=> b!908727 m!843557))

(declare-fun m!843559 () Bool)

(assert (=> b!908727 m!843559))

(declare-fun m!843561 () Bool)

(assert (=> b!908729 m!843561))

(declare-fun m!843563 () Bool)

(assert (=> b!908735 m!843563))

(declare-fun m!843565 () Bool)

(assert (=> b!908735 m!843565))

(declare-fun m!843567 () Bool)

(assert (=> b!908732 m!843567))

(declare-fun m!843569 () Bool)

(assert (=> b!908732 m!843569))

(check-sat (not b!908735) (not b!908727) b_and!26943 (not b!908736) (not b_next!16405) (not b!908738) (not b!908732) (not mapNonEmpty!29950) (not b!908731) tp_is_empty!18823 (not b!908737) (not b_lambda!13271) (not start!77828) (not b!908733))
(check-sat b_and!26943 (not b_next!16405))
