; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78732 () Bool)

(assert start!78732)

(declare-fun b_free!16963 () Bool)

(declare-fun b_next!16963 () Bool)

(assert (=> start!78732 (= b_free!16963 (not b_next!16963))))

(declare-fun tp!59331 () Bool)

(declare-fun b_and!27637 () Bool)

(assert (=> start!78732 (= tp!59331 b_and!27637)))

(declare-fun b!918582 () Bool)

(declare-fun res!619400 () Bool)

(declare-fun e!515626 () Bool)

(assert (=> b!918582 (=> (not res!619400) (not e!515626))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30927 0))(
  ( (V!30928 (val!9786 Int)) )
))
(declare-fun v!791 () V!30927)

(declare-datatypes ((tuple2!12768 0))(
  ( (tuple2!12769 (_1!6395 (_ BitVec 64)) (_2!6395 V!30927)) )
))
(declare-datatypes ((List!18555 0))(
  ( (Nil!18552) (Cons!18551 (h!19697 tuple2!12768) (t!26239 List!18555)) )
))
(declare-datatypes ((ListLongMap!11455 0))(
  ( (ListLongMap!11456 (toList!5743 List!18555)) )
))
(declare-fun lt!412172 () ListLongMap!11455)

(declare-fun apply!575 (ListLongMap!11455 (_ BitVec 64)) V!30927)

(assert (=> b!918582 (= res!619400 (= (apply!575 lt!412172 k0!1099) v!791))))

(declare-fun b!918583 () Bool)

(declare-fun res!619402 () Bool)

(assert (=> b!918583 (=> (not res!619402) (not e!515626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918583 (= res!619402 (validKeyInArray!0 k0!1099))))

(declare-fun b!918584 () Bool)

(declare-fun res!619403 () Bool)

(declare-fun e!515624 () Bool)

(assert (=> b!918584 (=> (not res!619403) (not e!515624))))

(declare-datatypes ((array!54909 0))(
  ( (array!54910 (arr!26400 (Array (_ BitVec 32) (_ BitVec 64))) (size!26861 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54909)

(declare-datatypes ((List!18556 0))(
  ( (Nil!18553) (Cons!18552 (h!19698 (_ BitVec 64)) (t!26240 List!18556)) )
))
(declare-fun arrayNoDuplicates!0 (array!54909 (_ BitVec 32) List!18556) Bool)

(assert (=> b!918584 (= res!619403 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18553))))

(declare-fun b!918585 () Bool)

(declare-fun res!619406 () Bool)

(assert (=> b!918585 (=> (not res!619406) (not e!515624))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54909 (_ BitVec 32)) Bool)

(assert (=> b!918585 (= res!619406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918586 () Bool)

(declare-fun e!515628 () Bool)

(declare-fun tp_is_empty!19471 () Bool)

(assert (=> b!918586 (= e!515628 tp_is_empty!19471)))

(declare-fun b!918587 () Bool)

(declare-fun e!515622 () Bool)

(assert (=> b!918587 (= e!515622 tp_is_empty!19471)))

(declare-fun res!619409 () Bool)

(assert (=> start!78732 (=> (not res!619409) (not e!515624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78732 (= res!619409 (validMask!0 mask!1881))))

(assert (=> start!78732 e!515624))

(assert (=> start!78732 true))

(assert (=> start!78732 tp_is_empty!19471))

(declare-datatypes ((ValueCell!9254 0))(
  ( (ValueCellFull!9254 (v!12303 V!30927)) (EmptyCell!9254) )
))
(declare-datatypes ((array!54911 0))(
  ( (array!54912 (arr!26401 (Array (_ BitVec 32) ValueCell!9254)) (size!26862 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54911)

(declare-fun e!515623 () Bool)

(declare-fun array_inv!20662 (array!54911) Bool)

(assert (=> start!78732 (and (array_inv!20662 _values!1231) e!515623)))

(assert (=> start!78732 tp!59331))

(declare-fun array_inv!20663 (array!54909) Bool)

(assert (=> start!78732 (array_inv!20663 _keys!1487)))

(declare-fun b!918588 () Bool)

(assert (=> b!918588 (= e!515624 e!515626)))

(declare-fun res!619401 () Bool)

(assert (=> b!918588 (=> (not res!619401) (not e!515626))))

(declare-fun contains!4744 (ListLongMap!11455 (_ BitVec 64)) Bool)

(assert (=> b!918588 (= res!619401 (contains!4744 lt!412172 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30927)

(declare-fun minValue!1173 () V!30927)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2936 (array!54909 array!54911 (_ BitVec 32) (_ BitVec 32) V!30927 V!30927 (_ BitVec 32) Int) ListLongMap!11455)

(assert (=> b!918588 (= lt!412172 (getCurrentListMap!2936 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30963 () Bool)

(declare-fun mapRes!30963 () Bool)

(declare-fun tp!59330 () Bool)

(assert (=> mapNonEmpty!30963 (= mapRes!30963 (and tp!59330 e!515622))))

(declare-fun mapRest!30963 () (Array (_ BitVec 32) ValueCell!9254))

(declare-fun mapKey!30963 () (_ BitVec 32))

(declare-fun mapValue!30963 () ValueCell!9254)

(assert (=> mapNonEmpty!30963 (= (arr!26401 _values!1231) (store mapRest!30963 mapKey!30963 mapValue!30963))))

(declare-fun b!918589 () Bool)

(declare-fun res!619405 () Bool)

(assert (=> b!918589 (=> (not res!619405) (not e!515624))))

(assert (=> b!918589 (= res!619405 (and (= (size!26862 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26861 _keys!1487) (size!26862 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918590 () Bool)

(declare-fun e!515625 () Bool)

(assert (=> b!918590 (= e!515626 e!515625)))

(declare-fun res!619407 () Bool)

(assert (=> b!918590 (=> (not res!619407) (not e!515625))))

(declare-fun lt!412168 () (_ BitVec 64))

(assert (=> b!918590 (= res!619407 (validKeyInArray!0 lt!412168))))

(assert (=> b!918590 (= lt!412168 (select (arr!26400 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!30963 () Bool)

(assert (=> mapIsEmpty!30963 mapRes!30963))

(declare-fun b!918591 () Bool)

(declare-fun res!619404 () Bool)

(assert (=> b!918591 (=> (not res!619404) (not e!515624))))

(assert (=> b!918591 (= res!619404 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26861 _keys!1487))))))

(declare-fun b!918592 () Bool)

(declare-fun res!619408 () Bool)

(assert (=> b!918592 (=> (not res!619408) (not e!515626))))

(assert (=> b!918592 (= res!619408 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918593 () Bool)

(assert (=> b!918593 (= e!515625 (not true))))

(declare-fun lt!412170 () tuple2!12768)

(declare-fun +!2662 (ListLongMap!11455 tuple2!12768) ListLongMap!11455)

(assert (=> b!918593 (contains!4744 (+!2662 lt!412172 lt!412170) k0!1099)))

(declare-fun lt!412167 () V!30927)

(declare-datatypes ((Unit!30936 0))(
  ( (Unit!30937) )
))
(declare-fun lt!412169 () Unit!30936)

(declare-fun addStillContains!359 (ListLongMap!11455 (_ BitVec 64) V!30927 (_ BitVec 64)) Unit!30936)

(assert (=> b!918593 (= lt!412169 (addStillContains!359 lt!412172 lt!412168 lt!412167 k0!1099))))

(assert (=> b!918593 (= (getCurrentListMap!2936 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2662 (getCurrentListMap!2936 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412170))))

(assert (=> b!918593 (= lt!412170 (tuple2!12769 lt!412168 lt!412167))))

(declare-fun get!13845 (ValueCell!9254 V!30927) V!30927)

(declare-fun dynLambda!1418 (Int (_ BitVec 64)) V!30927)

(assert (=> b!918593 (= lt!412167 (get!13845 (select (arr!26401 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1418 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412171 () Unit!30936)

(declare-fun lemmaListMapRecursiveValidKeyArray!26 (array!54909 array!54911 (_ BitVec 32) (_ BitVec 32) V!30927 V!30927 (_ BitVec 32) Int) Unit!30936)

(assert (=> b!918593 (= lt!412171 (lemmaListMapRecursiveValidKeyArray!26 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918594 () Bool)

(assert (=> b!918594 (= e!515623 (and e!515628 mapRes!30963))))

(declare-fun condMapEmpty!30963 () Bool)

(declare-fun mapDefault!30963 () ValueCell!9254)

(assert (=> b!918594 (= condMapEmpty!30963 (= (arr!26401 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9254)) mapDefault!30963)))))

(assert (= (and start!78732 res!619409) b!918589))

(assert (= (and b!918589 res!619405) b!918585))

(assert (= (and b!918585 res!619406) b!918584))

(assert (= (and b!918584 res!619403) b!918591))

(assert (= (and b!918591 res!619404) b!918588))

(assert (= (and b!918588 res!619401) b!918582))

(assert (= (and b!918582 res!619400) b!918592))

(assert (= (and b!918592 res!619408) b!918583))

(assert (= (and b!918583 res!619402) b!918590))

(assert (= (and b!918590 res!619407) b!918593))

(assert (= (and b!918594 condMapEmpty!30963) mapIsEmpty!30963))

(assert (= (and b!918594 (not condMapEmpty!30963)) mapNonEmpty!30963))

(get-info :version)

(assert (= (and mapNonEmpty!30963 ((_ is ValueCellFull!9254) mapValue!30963)) b!918587))

(assert (= (and b!918594 ((_ is ValueCellFull!9254) mapDefault!30963)) b!918586))

(assert (= start!78732 b!918594))

(declare-fun b_lambda!13447 () Bool)

(assert (=> (not b_lambda!13447) (not b!918593)))

(declare-fun t!26238 () Bool)

(declare-fun tb!5535 () Bool)

(assert (=> (and start!78732 (= defaultEntry!1235 defaultEntry!1235) t!26238) tb!5535))

(declare-fun result!10901 () Bool)

(assert (=> tb!5535 (= result!10901 tp_is_empty!19471)))

(assert (=> b!918593 t!26238))

(declare-fun b_and!27639 () Bool)

(assert (= b_and!27637 (and (=> t!26238 result!10901) b_and!27639)))

(declare-fun m!851761 () Bool)

(assert (=> start!78732 m!851761))

(declare-fun m!851763 () Bool)

(assert (=> start!78732 m!851763))

(declare-fun m!851765 () Bool)

(assert (=> start!78732 m!851765))

(declare-fun m!851767 () Bool)

(assert (=> b!918590 m!851767))

(declare-fun m!851769 () Bool)

(assert (=> b!918590 m!851769))

(declare-fun m!851771 () Bool)

(assert (=> b!918583 m!851771))

(declare-fun m!851773 () Bool)

(assert (=> b!918584 m!851773))

(declare-fun m!851775 () Bool)

(assert (=> mapNonEmpty!30963 m!851775))

(declare-fun m!851777 () Bool)

(assert (=> b!918593 m!851777))

(declare-fun m!851779 () Bool)

(assert (=> b!918593 m!851779))

(declare-fun m!851781 () Bool)

(assert (=> b!918593 m!851781))

(declare-fun m!851783 () Bool)

(assert (=> b!918593 m!851783))

(assert (=> b!918593 m!851781))

(declare-fun m!851785 () Bool)

(assert (=> b!918593 m!851785))

(assert (=> b!918593 m!851777))

(assert (=> b!918593 m!851779))

(declare-fun m!851787 () Bool)

(assert (=> b!918593 m!851787))

(declare-fun m!851789 () Bool)

(assert (=> b!918593 m!851789))

(declare-fun m!851791 () Bool)

(assert (=> b!918593 m!851791))

(declare-fun m!851793 () Bool)

(assert (=> b!918593 m!851793))

(assert (=> b!918593 m!851791))

(declare-fun m!851795 () Bool)

(assert (=> b!918593 m!851795))

(declare-fun m!851797 () Bool)

(assert (=> b!918585 m!851797))

(declare-fun m!851799 () Bool)

(assert (=> b!918588 m!851799))

(declare-fun m!851801 () Bool)

(assert (=> b!918588 m!851801))

(declare-fun m!851803 () Bool)

(assert (=> b!918582 m!851803))

(check-sat (not b_next!16963) (not b_lambda!13447) tp_is_empty!19471 (not b!918582) b_and!27639 (not b!918593) (not start!78732) (not mapNonEmpty!30963) (not b!918588) (not b!918585) (not b!918590) (not b!918584) (not b!918583))
(check-sat b_and!27639 (not b_next!16963))
