; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78002 () Bool)

(assert start!78002)

(declare-fun b_free!16393 () Bool)

(declare-fun b_next!16393 () Bool)

(assert (=> start!78002 (= b_free!16393 (not b_next!16393))))

(declare-fun tp!57445 () Bool)

(declare-fun b_and!26953 () Bool)

(assert (=> start!78002 (= tp!57445 b_and!26953)))

(declare-fun b!909622 () Bool)

(declare-fun e!509896 () Bool)

(declare-fun e!509897 () Bool)

(declare-fun mapRes!29932 () Bool)

(assert (=> b!909622 (= e!509896 (and e!509897 mapRes!29932))))

(declare-fun condMapEmpty!29932 () Bool)

(declare-datatypes ((V!30047 0))(
  ( (V!30048 (val!9456 Int)) )
))
(declare-datatypes ((ValueCell!8924 0))(
  ( (ValueCellFull!8924 (v!11960 V!30047)) (EmptyCell!8924) )
))
(declare-datatypes ((array!53699 0))(
  ( (array!53700 (arr!25803 (Array (_ BitVec 32) ValueCell!8924)) (size!26263 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53699)

(declare-fun mapDefault!29932 () ValueCell!8924)

(assert (=> b!909622 (= condMapEmpty!29932 (= (arr!25803 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8924)) mapDefault!29932)))))

(declare-fun b!909623 () Bool)

(declare-fun e!509898 () Bool)

(assert (=> b!909623 (= e!509898 true)))

(declare-datatypes ((tuple2!12268 0))(
  ( (tuple2!12269 (_1!6145 (_ BitVec 64)) (_2!6145 V!30047)) )
))
(declare-datatypes ((List!18092 0))(
  ( (Nil!18089) (Cons!18088 (h!19240 tuple2!12268) (t!25649 List!18092)) )
))
(declare-datatypes ((ListLongMap!10967 0))(
  ( (ListLongMap!10968 (toList!5499 List!18092)) )
))
(declare-fun lt!410178 () ListLongMap!10967)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410179 () V!30047)

(declare-fun apply!515 (ListLongMap!10967 (_ BitVec 64)) V!30047)

(assert (=> b!909623 (= (apply!515 lt!410178 k0!1033) lt!410179)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30047)

(declare-datatypes ((array!53701 0))(
  ( (array!53702 (arr!25804 (Array (_ BitVec 32) (_ BitVec 64))) (size!26264 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53701)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30047)

(declare-datatypes ((Unit!30836 0))(
  ( (Unit!30837) )
))
(declare-fun lt!410177 () Unit!30836)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!59 (array!53701 array!53699 (_ BitVec 32) (_ BitVec 32) V!30047 V!30047 (_ BitVec 64) V!30047 (_ BitVec 32) Int) Unit!30836)

(assert (=> b!909623 (= lt!410177 (lemmaListMapApplyFromThenApplyFromZero!59 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!410179 i!717 defaultEntry!1160))))

(declare-fun res!613692 () Bool)

(declare-fun e!509899 () Bool)

(assert (=> start!78002 (=> (not res!613692) (not e!509899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78002 (= res!613692 (validMask!0 mask!1756))))

(assert (=> start!78002 e!509899))

(declare-fun array_inv!20258 (array!53699) Bool)

(assert (=> start!78002 (and (array_inv!20258 _values!1152) e!509896)))

(assert (=> start!78002 tp!57445))

(assert (=> start!78002 true))

(declare-fun tp_is_empty!18811 () Bool)

(assert (=> start!78002 tp_is_empty!18811))

(declare-fun array_inv!20259 (array!53701) Bool)

(assert (=> start!78002 (array_inv!20259 _keys!1386)))

(declare-fun b!909624 () Bool)

(declare-fun e!509900 () Bool)

(assert (=> b!909624 (= e!509899 e!509900)))

(declare-fun res!613697 () Bool)

(assert (=> b!909624 (=> (not res!613697) (not e!509900))))

(declare-fun contains!4550 (ListLongMap!10967 (_ BitVec 64)) Bool)

(assert (=> b!909624 (= res!613697 (contains!4550 lt!410178 k0!1033))))

(declare-fun getCurrentListMap!2760 (array!53701 array!53699 (_ BitVec 32) (_ BitVec 32) V!30047 V!30047 (_ BitVec 32) Int) ListLongMap!10967)

(assert (=> b!909624 (= lt!410178 (getCurrentListMap!2760 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29932 () Bool)

(assert (=> mapIsEmpty!29932 mapRes!29932))

(declare-fun b!909625 () Bool)

(declare-fun e!509895 () Bool)

(assert (=> b!909625 (= e!509895 tp_is_empty!18811)))

(declare-fun mapNonEmpty!29932 () Bool)

(declare-fun tp!57444 () Bool)

(assert (=> mapNonEmpty!29932 (= mapRes!29932 (and tp!57444 e!509895))))

(declare-fun mapKey!29932 () (_ BitVec 32))

(declare-fun mapValue!29932 () ValueCell!8924)

(declare-fun mapRest!29932 () (Array (_ BitVec 32) ValueCell!8924))

(assert (=> mapNonEmpty!29932 (= (arr!25803 _values!1152) (store mapRest!29932 mapKey!29932 mapValue!29932))))

(declare-fun b!909626 () Bool)

(declare-fun res!613696 () Bool)

(assert (=> b!909626 (=> (not res!613696) (not e!509900))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909626 (= res!613696 (inRange!0 i!717 mask!1756))))

(declare-fun b!909627 () Bool)

(declare-fun e!509894 () Bool)

(assert (=> b!909627 (= e!509900 (not e!509894))))

(declare-fun res!613693 () Bool)

(assert (=> b!909627 (=> res!613693 e!509894)))

(assert (=> b!909627 (= res!613693 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26264 _keys!1386))))))

(declare-fun get!13596 (ValueCell!8924 V!30047) V!30047)

(declare-fun dynLambda!1397 (Int (_ BitVec 64)) V!30047)

(assert (=> b!909627 (= lt!410179 (get!13596 (select (arr!25803 _values!1152) i!717) (dynLambda!1397 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909627 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!410180 () Unit!30836)

(declare-fun lemmaKeyInListMapIsInArray!256 (array!53701 array!53699 (_ BitVec 32) (_ BitVec 32) V!30047 V!30047 (_ BitVec 64) Int) Unit!30836)

(assert (=> b!909627 (= lt!410180 (lemmaKeyInListMapIsInArray!256 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!909628 () Bool)

(declare-fun res!613688 () Bool)

(assert (=> b!909628 (=> (not res!613688) (not e!509900))))

(assert (=> b!909628 (= res!613688 (and (= (select (arr!25804 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!909629 () Bool)

(assert (=> b!909629 (= e!509894 e!509898)))

(declare-fun res!613689 () Bool)

(assert (=> b!909629 (=> res!613689 e!509898)))

(declare-fun lt!410181 () ListLongMap!10967)

(assert (=> b!909629 (= res!613689 (not (contains!4550 lt!410181 k0!1033)))))

(assert (=> b!909629 (= lt!410181 (getCurrentListMap!2760 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!909630 () Bool)

(declare-fun res!613695 () Bool)

(assert (=> b!909630 (=> (not res!613695) (not e!509899))))

(assert (=> b!909630 (= res!613695 (and (= (size!26263 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26264 _keys!1386) (size!26263 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909631 () Bool)

(declare-fun res!613690 () Bool)

(assert (=> b!909631 (=> (not res!613690) (not e!509899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53701 (_ BitVec 32)) Bool)

(assert (=> b!909631 (= res!613690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909632 () Bool)

(assert (=> b!909632 (= e!509897 tp_is_empty!18811)))

(declare-fun b!909633 () Bool)

(declare-fun res!613691 () Bool)

(assert (=> b!909633 (=> (not res!613691) (not e!509899))))

(declare-datatypes ((List!18093 0))(
  ( (Nil!18090) (Cons!18089 (h!19241 (_ BitVec 64)) (t!25650 List!18093)) )
))
(declare-fun arrayNoDuplicates!0 (array!53701 (_ BitVec 32) List!18093) Bool)

(assert (=> b!909633 (= res!613691 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18090))))

(declare-fun b!909634 () Bool)

(declare-fun res!613694 () Bool)

(assert (=> b!909634 (=> res!613694 e!509898)))

(assert (=> b!909634 (= res!613694 (not (= (apply!515 lt!410181 k0!1033) lt!410179)))))

(assert (= (and start!78002 res!613692) b!909630))

(assert (= (and b!909630 res!613695) b!909631))

(assert (= (and b!909631 res!613690) b!909633))

(assert (= (and b!909633 res!613691) b!909624))

(assert (= (and b!909624 res!613697) b!909626))

(assert (= (and b!909626 res!613696) b!909628))

(assert (= (and b!909628 res!613688) b!909627))

(assert (= (and b!909627 (not res!613693)) b!909629))

(assert (= (and b!909629 (not res!613689)) b!909634))

(assert (= (and b!909634 (not res!613694)) b!909623))

(assert (= (and b!909622 condMapEmpty!29932) mapIsEmpty!29932))

(assert (= (and b!909622 (not condMapEmpty!29932)) mapNonEmpty!29932))

(get-info :version)

(assert (= (and mapNonEmpty!29932 ((_ is ValueCellFull!8924) mapValue!29932)) b!909625))

(assert (= (and b!909622 ((_ is ValueCellFull!8924) mapDefault!29932)) b!909632))

(assert (= start!78002 b!909622))

(declare-fun b_lambda!13291 () Bool)

(assert (=> (not b_lambda!13291) (not b!909627)))

(declare-fun t!25648 () Bool)

(declare-fun tb!5407 () Bool)

(assert (=> (and start!78002 (= defaultEntry!1160 defaultEntry!1160) t!25648) tb!5407))

(declare-fun result!10619 () Bool)

(assert (=> tb!5407 (= result!10619 tp_is_empty!18811)))

(assert (=> b!909627 t!25648))

(declare-fun b_and!26955 () Bool)

(assert (= b_and!26953 (and (=> t!25648 result!10619) b_and!26955)))

(declare-fun m!845343 () Bool)

(assert (=> b!909633 m!845343))

(declare-fun m!845345 () Bool)

(assert (=> b!909623 m!845345))

(declare-fun m!845347 () Bool)

(assert (=> b!909623 m!845347))

(declare-fun m!845349 () Bool)

(assert (=> start!78002 m!845349))

(declare-fun m!845351 () Bool)

(assert (=> start!78002 m!845351))

(declare-fun m!845353 () Bool)

(assert (=> start!78002 m!845353))

(declare-fun m!845355 () Bool)

(assert (=> mapNonEmpty!29932 m!845355))

(declare-fun m!845357 () Bool)

(assert (=> b!909634 m!845357))

(declare-fun m!845359 () Bool)

(assert (=> b!909627 m!845359))

(declare-fun m!845361 () Bool)

(assert (=> b!909627 m!845361))

(declare-fun m!845363 () Bool)

(assert (=> b!909627 m!845363))

(declare-fun m!845365 () Bool)

(assert (=> b!909627 m!845365))

(assert (=> b!909627 m!845359))

(assert (=> b!909627 m!845363))

(declare-fun m!845367 () Bool)

(assert (=> b!909627 m!845367))

(declare-fun m!845369 () Bool)

(assert (=> b!909628 m!845369))

(declare-fun m!845371 () Bool)

(assert (=> b!909624 m!845371))

(declare-fun m!845373 () Bool)

(assert (=> b!909624 m!845373))

(declare-fun m!845375 () Bool)

(assert (=> b!909631 m!845375))

(declare-fun m!845377 () Bool)

(assert (=> b!909629 m!845377))

(declare-fun m!845379 () Bool)

(assert (=> b!909629 m!845379))

(declare-fun m!845381 () Bool)

(assert (=> b!909626 m!845381))

(check-sat (not b!909634) b_and!26955 (not b_next!16393) tp_is_empty!18811 (not mapNonEmpty!29932) (not b!909624) (not b!909631) (not b!909633) (not b!909626) (not start!78002) (not b!909627) (not b_lambda!13291) (not b!909629) (not b!909623))
(check-sat b_and!26955 (not b_next!16393))
