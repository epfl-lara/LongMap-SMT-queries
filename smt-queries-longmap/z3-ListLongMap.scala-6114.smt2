; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78774 () Bool)

(assert start!78774)

(declare-fun b_free!17005 () Bool)

(declare-fun b_next!17005 () Bool)

(assert (=> start!78774 (= b_free!17005 (not b_next!17005))))

(declare-fun tp!59457 () Bool)

(declare-fun b_and!27721 () Bool)

(assert (=> start!78774 (= tp!59457 b_and!27721)))

(declare-fun b!919443 () Bool)

(declare-fun e!516064 () Bool)

(assert (=> b!919443 (= e!516064 (not true))))

(declare-datatypes ((array!54987 0))(
  ( (array!54988 (arr!26439 (Array (_ BitVec 32) (_ BitVec 64))) (size!26900 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54987)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18585 0))(
  ( (Nil!18582) (Cons!18581 (h!19727 (_ BitVec 64)) (t!26311 List!18585)) )
))
(declare-fun arrayNoDuplicates!0 (array!54987 (_ BitVec 32) List!18585) Bool)

(assert (=> b!919443 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18582)))

(declare-datatypes ((Unit!30962 0))(
  ( (Unit!30963) )
))
(declare-fun lt!412594 () Unit!30962)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54987 (_ BitVec 32) (_ BitVec 32)) Unit!30962)

(assert (=> b!919443 (= lt!412594 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!30983 0))(
  ( (V!30984 (val!9807 Int)) )
))
(declare-datatypes ((tuple2!12800 0))(
  ( (tuple2!12801 (_1!6411 (_ BitVec 64)) (_2!6411 V!30983)) )
))
(declare-datatypes ((List!18586 0))(
  ( (Nil!18583) (Cons!18582 (h!19728 tuple2!12800) (t!26312 List!18586)) )
))
(declare-datatypes ((ListLongMap!11487 0))(
  ( (ListLongMap!11488 (toList!5759 List!18586)) )
))
(declare-fun lt!412597 () ListLongMap!11487)

(declare-fun lt!412592 () tuple2!12800)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4758 (ListLongMap!11487 (_ BitVec 64)) Bool)

(declare-fun +!2675 (ListLongMap!11487 tuple2!12800) ListLongMap!11487)

(assert (=> b!919443 (contains!4758 (+!2675 lt!412597 lt!412592) k0!1099)))

(declare-fun lt!412598 () (_ BitVec 64))

(declare-fun lt!412593 () Unit!30962)

(declare-fun lt!412595 () V!30983)

(declare-fun addStillContains!372 (ListLongMap!11487 (_ BitVec 64) V!30983 (_ BitVec 64)) Unit!30962)

(assert (=> b!919443 (= lt!412593 (addStillContains!372 lt!412597 lt!412598 lt!412595 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9275 0))(
  ( (ValueCellFull!9275 (v!12324 V!30983)) (EmptyCell!9275) )
))
(declare-datatypes ((array!54989 0))(
  ( (array!54990 (arr!26440 (Array (_ BitVec 32) ValueCell!9275)) (size!26901 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54989)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30983)

(declare-fun minValue!1173 () V!30983)

(declare-fun getCurrentListMap!2950 (array!54987 array!54989 (_ BitVec 32) (_ BitVec 32) V!30983 V!30983 (_ BitVec 32) Int) ListLongMap!11487)

(assert (=> b!919443 (= (getCurrentListMap!2950 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2675 (getCurrentListMap!2950 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412592))))

(assert (=> b!919443 (= lt!412592 (tuple2!12801 lt!412598 lt!412595))))

(declare-fun get!13872 (ValueCell!9275 V!30983) V!30983)

(declare-fun dynLambda!1431 (Int (_ BitVec 64)) V!30983)

(assert (=> b!919443 (= lt!412595 (get!13872 (select (arr!26440 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1431 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412596 () Unit!30962)

(declare-fun lemmaListMapRecursiveValidKeyArray!39 (array!54987 array!54989 (_ BitVec 32) (_ BitVec 32) V!30983 V!30983 (_ BitVec 32) Int) Unit!30962)

(assert (=> b!919443 (= lt!412596 (lemmaListMapRecursiveValidKeyArray!39 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919444 () Bool)

(declare-fun e!516068 () Bool)

(declare-fun tp_is_empty!19513 () Bool)

(assert (=> b!919444 (= e!516068 tp_is_empty!19513)))

(declare-fun b!919445 () Bool)

(declare-fun e!516063 () Bool)

(declare-fun e!516067 () Bool)

(assert (=> b!919445 (= e!516063 e!516067)))

(declare-fun res!620033 () Bool)

(assert (=> b!919445 (=> (not res!620033) (not e!516067))))

(assert (=> b!919445 (= res!620033 (contains!4758 lt!412597 k0!1099))))

(assert (=> b!919445 (= lt!412597 (getCurrentListMap!2950 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919446 () Bool)

(declare-fun res!620039 () Bool)

(assert (=> b!919446 (=> (not res!620039) (not e!516063))))

(assert (=> b!919446 (= res!620039 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26900 _keys!1487))))))

(declare-fun res!620031 () Bool)

(assert (=> start!78774 (=> (not res!620031) (not e!516063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78774 (= res!620031 (validMask!0 mask!1881))))

(assert (=> start!78774 e!516063))

(assert (=> start!78774 true))

(assert (=> start!78774 tp_is_empty!19513))

(declare-fun e!516069 () Bool)

(declare-fun array_inv!20690 (array!54989) Bool)

(assert (=> start!78774 (and (array_inv!20690 _values!1231) e!516069)))

(assert (=> start!78774 tp!59457))

(declare-fun array_inv!20691 (array!54987) Bool)

(assert (=> start!78774 (array_inv!20691 _keys!1487)))

(declare-fun b!919447 () Bool)

(declare-fun res!620037 () Bool)

(assert (=> b!919447 (=> (not res!620037) (not e!516063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54987 (_ BitVec 32)) Bool)

(assert (=> b!919447 (= res!620037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31026 () Bool)

(declare-fun mapRes!31026 () Bool)

(declare-fun tp!59456 () Bool)

(assert (=> mapNonEmpty!31026 (= mapRes!31026 (and tp!59456 e!516068))))

(declare-fun mapRest!31026 () (Array (_ BitVec 32) ValueCell!9275))

(declare-fun mapKey!31026 () (_ BitVec 32))

(declare-fun mapValue!31026 () ValueCell!9275)

(assert (=> mapNonEmpty!31026 (= (arr!26440 _values!1231) (store mapRest!31026 mapKey!31026 mapValue!31026))))

(declare-fun b!919448 () Bool)

(declare-fun e!516065 () Bool)

(assert (=> b!919448 (= e!516065 tp_is_empty!19513)))

(declare-fun b!919449 () Bool)

(assert (=> b!919449 (= e!516069 (and e!516065 mapRes!31026))))

(declare-fun condMapEmpty!31026 () Bool)

(declare-fun mapDefault!31026 () ValueCell!9275)

(assert (=> b!919449 (= condMapEmpty!31026 (= (arr!26440 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9275)) mapDefault!31026)))))

(declare-fun mapIsEmpty!31026 () Bool)

(assert (=> mapIsEmpty!31026 mapRes!31026))

(declare-fun b!919450 () Bool)

(declare-fun res!620030 () Bool)

(assert (=> b!919450 (=> (not res!620030) (not e!516067))))

(assert (=> b!919450 (= res!620030 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919451 () Bool)

(declare-fun res!620038 () Bool)

(assert (=> b!919451 (=> (not res!620038) (not e!516067))))

(declare-fun v!791 () V!30983)

(declare-fun apply!586 (ListLongMap!11487 (_ BitVec 64)) V!30983)

(assert (=> b!919451 (= res!620038 (= (apply!586 lt!412597 k0!1099) v!791))))

(declare-fun b!919452 () Bool)

(declare-fun res!620036 () Bool)

(assert (=> b!919452 (=> (not res!620036) (not e!516063))))

(assert (=> b!919452 (= res!620036 (and (= (size!26901 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26900 _keys!1487) (size!26901 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919453 () Bool)

(declare-fun res!620035 () Bool)

(assert (=> b!919453 (=> (not res!620035) (not e!516067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919453 (= res!620035 (validKeyInArray!0 k0!1099))))

(declare-fun b!919454 () Bool)

(declare-fun res!620032 () Bool)

(assert (=> b!919454 (=> (not res!620032) (not e!516063))))

(assert (=> b!919454 (= res!620032 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18582))))

(declare-fun b!919455 () Bool)

(assert (=> b!919455 (= e!516067 e!516064)))

(declare-fun res!620034 () Bool)

(assert (=> b!919455 (=> (not res!620034) (not e!516064))))

(assert (=> b!919455 (= res!620034 (validKeyInArray!0 lt!412598))))

(assert (=> b!919455 (= lt!412598 (select (arr!26439 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!78774 res!620031) b!919452))

(assert (= (and b!919452 res!620036) b!919447))

(assert (= (and b!919447 res!620037) b!919454))

(assert (= (and b!919454 res!620032) b!919446))

(assert (= (and b!919446 res!620039) b!919445))

(assert (= (and b!919445 res!620033) b!919451))

(assert (= (and b!919451 res!620038) b!919450))

(assert (= (and b!919450 res!620030) b!919453))

(assert (= (and b!919453 res!620035) b!919455))

(assert (= (and b!919455 res!620034) b!919443))

(assert (= (and b!919449 condMapEmpty!31026) mapIsEmpty!31026))

(assert (= (and b!919449 (not condMapEmpty!31026)) mapNonEmpty!31026))

(get-info :version)

(assert (= (and mapNonEmpty!31026 ((_ is ValueCellFull!9275) mapValue!31026)) b!919444))

(assert (= (and b!919449 ((_ is ValueCellFull!9275) mapDefault!31026)) b!919448))

(assert (= start!78774 b!919449))

(declare-fun b_lambda!13489 () Bool)

(assert (=> (not b_lambda!13489) (not b!919443)))

(declare-fun t!26310 () Bool)

(declare-fun tb!5577 () Bool)

(assert (=> (and start!78774 (= defaultEntry!1235 defaultEntry!1235) t!26310) tb!5577))

(declare-fun result!10985 () Bool)

(assert (=> tb!5577 (= result!10985 tp_is_empty!19513)))

(assert (=> b!919443 t!26310))

(declare-fun b_and!27723 () Bool)

(assert (= b_and!27721 (and (=> t!26310 result!10985) b_and!27723)))

(declare-fun m!852745 () Bool)

(assert (=> b!919454 m!852745))

(declare-fun m!852747 () Bool)

(assert (=> b!919453 m!852747))

(declare-fun m!852749 () Bool)

(assert (=> b!919451 m!852749))

(declare-fun m!852751 () Bool)

(assert (=> start!78774 m!852751))

(declare-fun m!852753 () Bool)

(assert (=> start!78774 m!852753))

(declare-fun m!852755 () Bool)

(assert (=> start!78774 m!852755))

(declare-fun m!852757 () Bool)

(assert (=> b!919443 m!852757))

(declare-fun m!852759 () Bool)

(assert (=> b!919443 m!852759))

(declare-fun m!852761 () Bool)

(assert (=> b!919443 m!852761))

(declare-fun m!852763 () Bool)

(assert (=> b!919443 m!852763))

(declare-fun m!852765 () Bool)

(assert (=> b!919443 m!852765))

(assert (=> b!919443 m!852761))

(assert (=> b!919443 m!852763))

(declare-fun m!852767 () Bool)

(assert (=> b!919443 m!852767))

(declare-fun m!852769 () Bool)

(assert (=> b!919443 m!852769))

(declare-fun m!852771 () Bool)

(assert (=> b!919443 m!852771))

(declare-fun m!852773 () Bool)

(assert (=> b!919443 m!852773))

(declare-fun m!852775 () Bool)

(assert (=> b!919443 m!852775))

(assert (=> b!919443 m!852771))

(declare-fun m!852777 () Bool)

(assert (=> b!919443 m!852777))

(declare-fun m!852779 () Bool)

(assert (=> b!919443 m!852779))

(assert (=> b!919443 m!852757))

(declare-fun m!852781 () Bool)

(assert (=> mapNonEmpty!31026 m!852781))

(declare-fun m!852783 () Bool)

(assert (=> b!919445 m!852783))

(declare-fun m!852785 () Bool)

(assert (=> b!919445 m!852785))

(declare-fun m!852787 () Bool)

(assert (=> b!919455 m!852787))

(declare-fun m!852789 () Bool)

(assert (=> b!919455 m!852789))

(declare-fun m!852791 () Bool)

(assert (=> b!919447 m!852791))

(check-sat (not b!919455) (not b!919445) (not b!919453) b_and!27723 (not start!78774) (not b!919454) (not b!919451) (not b_next!17005) (not b!919447) tp_is_empty!19513 (not b_lambda!13489) (not b!919443) (not mapNonEmpty!31026))
(check-sat b_and!27723 (not b_next!17005))
